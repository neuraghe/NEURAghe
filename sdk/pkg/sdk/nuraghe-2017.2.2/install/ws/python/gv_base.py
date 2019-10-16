#
# Copyright (c) 2015 Germain Haugou
#
# This file is part of the gvsoc software
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

from ctypes import *
import re

from gv_pdb import *
from gv_trace import *
from gv_vcd import *
import collections


class ComponentError(Exception):

    def __init__(self, message):
        self.message = message
        self.compStack = []

    def __str__(self):
        message = "Caught an error during architecture instantiation. Error stack:\n"
        while len(self.compStack):
            comp = self.compStack.pop()
            message = message + comp.getErrorStr() + '\n'
        return message + self.message

class ComponentCommon(object):
    def __init__(self, parent, compName, config, engine):
        super(ComponentCommon, self).__init__()

        self.engine = engine
        self.isNewComp = True
        self.parent = parent
        self.compName = compName
        self.ports = {}
        self.config = config
        self.buildNotifs = []
        self.startNotifs = []

    def getErrorStr(self):
        return "[%s]: %s" % (self.getFullPath(), self.getClass())

    def raiseError(self, msg):
        raise ComponentError("%s : %s" % (self.getErrorStr(), msg))
        

    def addPort(self, port):
        if port.name in self.ports:
            self.raiseError("A port with the same name already exists (name: %s)" % (port.name))
        self.ports[port.name] = port

    def getPort(self, name):
        if name not in self.ports:
            self.raiseError("Trying to get non-existing port (name: %s)" % (name))
        return self.ports[name]
        
    def getFullPath(self):
        path = ''
        if self.parent != None:
            path = self.parent.getFullPath()
        if self.compName == None: return path
        else: return path + '/' + self.compName

    def applyProperty(self, prop):
        # In case we match the component path, its class and its component name, we set the property as being
        # an argument to overload the arguments with the same name
        # Note that components with no name always match the name
        value = prop.value
        if prop.check(self.getFullPath(), str(self.getClass()), self.compName):
            try:
                if type(getattr(self, prop.propertyName)) == int:
                    value = int(value)
                elif type(getattr(self, prop.propertyName)) == float:
                    value = float(value)
            except:
                pass
            setattr(self, prop.propertyName, value)

    def applyProperties(self):
        self.path = self.getFullPath()
        if self.config != None:
            for prop in self.config.getProperties():
                self.applyProperty(prop)
        
    def buildWrapper(self):
        # Set the properties right here to overload the parameters
        # This is important to do it before the component build as the parameters are
        # allowed to be used during the build
        self.applyProperties()

        self.setEngine(self.getEngine().instance)

        retval = self.build()

        # Also call the notifiers registered on the build step
        # Do it after the component build as all the model objects
        # affected by the notifiers are declared during the component build
        for notif in self.buildNotifs:
            notif.build()

        return retval

    def closeWrapper(self):
        self.close()

    def startWrapper(self):
        # The ports are built just before starting the components
        # to make sure all connections are done
        for key, port in self.ports.items():
            port.build()

        for notif in self.startNotifs:
            notif.start()

        self.connectNetworkOutputs()
            
        if self.start() != 0: raise NameError("Error while starting component")

        return 0
        
    def addBuildNotif(self, notif):
        self.buildNotifs.append(notif)

    def addStartNotif(self, notif):
        self.startNotifs.append(notif)

    def getEngine(self):
        if self.engine != None:
            return self.engine
        else:
            return self.parent.getEngine()

# Class for final components with C++ model
class Component(ComponentCommon):
    def __init__(self, parent, compName, config, engine, *args, **kwargs):
        # Swig constructor is called here, so we can assume everything is initialized after this call
        super(Component, self).__init__(parent=parent, compName=compName, config=config, engine=engine)

        self.trace = ComponentTrace(self)
        self.bkp = ComponentBkp(self)
        self.vcd = ComponentVcd(self)

        # Set the component parameters
        for argName, argValue in kwargs.items():
            if argName not in self.__swig_setmethods__:
                self.raiseError("Trying to set invalid argument (arg: %s)" % (argName))
            self.__setattr__(argName, argValue)

        # Build the component. The model should declare the ports here
        self.buildWrapper()

        # Now register the ports that have been declared
        self.registeredMasterNames = self.getMasterNames()
        for name in self.registeredMasterNames:
            Master(name, self)
        self.registeredSlaveNames = self.getSlaveNames()
        for name in self.registeredSlaveNames:
            Slave(name, self)

        self.cells = []

    def resyncBuild(self):
        for name in self.getMasterNames():
            if not name in self.registeredMasterNames:
                self.registeredMasterNames.append(name)
                Master(name, self)
        for name in self.getSlaveNames():
            if not name in self.registeredSlaveNames:
                self.registeredSlaveNames.append(name)
                Slave(name, self)

    def getPortNames(self, master):
        names = []
        index = 0
        while True:
            if master:
                name = self.getMasterName(index)
            else:
                name = self.getSlaveName(index)
            if name == None: break
            names.append(name)
            index = index + 1
        return names

    def getMasterNames(self):
            return self.getPortNames(True)

    def getSlaveNames(self):
            return self.getPortNames(False)

    def linkTo(self, name, port):
        # We need to inform the model that a master port has been connected
        for targetPort in port.getTargetPorts():
            self.linkMasterTo(name, targetPort.getClass(self))

    def getClass(self):
        return self.this

    def mapTo(self, name, port, width, base, size, removeOffset, latency, id):
        if port != None:
            for targetPort in port.getTargetPorts():
                targetClass = targetPort.getClass(self)

                try:
                    portName = port.getName()
                except:
                    portName = port.name

                debugName = '%s/%s' % (port.comp.compName, portName)

                self.mapMasterPort(name, debugName, width, base, size, removeOffset & 0xffffffff, latency, targetClass, id)

        else:
            targetClass = None
            debugName = 'ERROR'
            self.mapMasterPort(name, debugName, width, base, size, removeOffset, latency, targetClass, id)

    def dumpProperties(self, indent=''):
        #print '%-30s%s%s' % (self.getFullPath(), indent,self.compName)
        for name in self.__swig_setmethods__.keys():
            print("%-30s  %s%s: %s" % (self.getFullPath(), indent, name, self.__getattr__(name)))
         
    def getCells(self):
        return [self]

    def addBlock(self, block):

        blockCells = block.getCells()

        for cell in blockCells:
            cell.setNetwork(self.this)
            self.addCell(cell.this)

        self.cells += blockCells


# Class for composite python components containg sub-components
class Module(ComponentCommon):
    def __init__(self, parent, compName, config, engine, *args, **kwargs):
        super(Module, self).__init__(parent=parent, compName=compName, config=config, engine=engine)

        self.trace = ModuleTrace(self)
        self.bkp = ModuleBkp(self)
        self.vcd = ModuleVcd(self)

        self.parent = parent
        self.compName = compName
        self.subComps = []

        # Get class properties from all parents
        cls = self.__class__
        directory = [n for n in dir(cls) if not n.startswith("_")]
        attributes = [n for n in directory if not isinstance(getattr(cls, n), collections.Callable)]

        # All extra arguments are the module parameters
        # First check that they are each defined as being module parameters
        # Module parameters are defined as class static variables
        # At the same time, put each of them in the instance to make sure
        # we never overwrite class static variables
        for argName, argValue in kwargs.items():
            if not argName in attributes:
                self.raiseError("Trying to set invalid argument (arg: %s)" % (argName))
            self.__dict__[argName] = argValue
        # Now overwrite with the instance parameters
        self.__dict__.update(kwargs)
             
        # Now ask for the module buiding
        # This step should declare ports, sub-components and so on
        try:
            self.buildWrapper()
        except ComponentError as e:
            e.compStack.append(self)
            raise
        except BaseException as e:
            exception = ComponentError(str(e))
            exception.compStack.append(self)
            # TODO raise this exception from base one when we switch to Python 3 in order to 
            # keep tracestack
            raise #exception

    def getProperty(self, name):
        if name in self.__dict__:
            return self.__dict__[name]
        else:
            return getattr(self.__class__, name)

    def getProperties(self):
        # Get class properties from all parents
        cls = self.__class__
        directory = [n for n in dir(cls) if not n.startswith("_")]
        attributes = [n for n in directory if not isinstance(getattr(cls, n), collections.Callable)]
        return attributes

    def dumpProperties(self, indent=''):

        nextIndent = indent + '  '

        if self.compName != None:
            nextIndent = nextIndent + '  '
            #print '%-30s%s%s' % (self.getFullPath(), indent,self.compName)

            for name in self.getProperties():
                print("%-30s  %s%s: %s" % (self.getFullPath(), indent, name, self.getProperty(name)))

        for comp in self.subComps:
            comp.dumpProperties(nextIndent)

    def newComp(self, className, compName, network=None, config=None, clock=None, *args, **kwargs):

        if Module in className.mro():
            # The class is derived from Comp class which means we are instantiating a module (composite)
            result = className(self, compName, self.config, clock, *args, **kwargs)
        else:
            # Otherwise it is a final component
            class NewClass(Component, className): pass
            result = NewClass(self, compName, self.config, clock, *args, **kwargs)

        if network != None:
            network.addBlock(result)

        self.subComps.append(result)
        return result

    def setEngine(self, engine):
        pass

    def applyProperty(self, prop):
        # This overloads the parent method to propagate the property to the childs
        ComponentCommon.applyProperty(self, prop)
        for comp in self.subComps:
            comp.applyProperty(prop)

    def start(self):
        for comp in self.subComps:
            comp.startWrapper()  

        return 0

    def close(self):
        for comp in self.subComps:
            comp.closeWrapper()        

    def reset(self):
        for comp in self.subComps:
            comp.reset()

    def newPort(self, name):
        return Port(name, self)

    def linkTo(self, name, port):
        # In case of python component, we have nothing to do, the connection is fully
        # managed by the Port class
        pass

    def build(self):
        pass

    def getClass(self):
        return self.__class__

    def addOption(self, *args, **kwargs):
        [kargs, otherArgs] = self.config.getParser().parse_known_args()
        return self.config.addOption(*args, comp=self, **kwargs)

    def getOption(self, name):
        return self.config.getOption(name)

    def getCells(self):
        cells = []
        for comp in self.subComps:
            cells += comp.getCells()
        return cells

    def connectNetworkOutputs(self):
        pass

class Port(object):
    def __init__(self, name, comp):
        super(Port, self).__init__()
        self.targetPortList = []
        self.comp = comp
        self.name = name
        self.comp.addPort(self)

    def linkTo(self, port):
        self.targetPortList.append(port)

    def getTargetPorts(self):
        portList = []    
        for port in self.targetPortList:
            portList = portList + port.getTargetPorts()
        return portList

    def build(self):
        pass

class Slave(Port):
    def __init__(self, name, comp):
        super(Slave, self).__init__(name, comp)

    def getTargetPorts(self):
        return [self]

    def getClass(self, initiator):
        port = self.comp.getSlavePort(self.name)
        if self.comp.getEngine() != initiator.getEngine():
            port = self.comp.getSlavePortResync(initiator.getEngine().instance, port)

        return port

class Master(Port):
    def __init__(self, name, comp):
        super(Master, self).__init__(name, comp)
        self.mappings = []

    def build(self):
        for mapping in self.mappings:
            self.comp.mapTo(self.name, mapping[0], mapping[5], mapping[1], mapping[2], mapping[3], mapping[4], mapping[6])
        for port in self.targetPortList:
            self.comp.linkTo(self.name, port)
            
    def mapTo(self, port, base=0, size=0, removeOffset=0, latency=0, width=0, id=-1):
        self.mappings.append([port, base, size, removeOffset, latency, width, id])
        #self.comp.mapTo(self.name, port, width, base, size, removeOffset, latency)
        

class ClockEngine(Module):

    frequency=100000000

    def __init__(self, parent, compName, config, engine, *args, **kwargs):
        super(ClockEngine, self).__init__(parent, compName, config, engine, *args, **kwargs)
        parent.getEngine().addEngine(self)
        self.module = cdll.LoadLibrary("engine.so")
        self.module.gv_clockEngine_new.restype = c_void_p
        self.module.gv_clockEngine_new.argtypes = [c_void_p]
        #self.module.gv_clockEngine_wait.restype = int
        self.instance = self.module.gv_clockEngine_new(parent.getEngine().instance)
        self.engine = self

        self.module.gv_clockEngine_setFrequency.argtypes = [c_void_p, c_int]
        try:
            self.frequency = int(self.frequency)
        except:
            pass
        self.module.gv_clockEngine_setFrequency(self.instance, self.frequency)

    def build(self):
        pass
