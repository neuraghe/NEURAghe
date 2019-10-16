import gv
import collections


class Cell(object):

    def __init__(self, network, name, *args, **kwargs):
        pass

    def getPort(self, name):
        return Port(name, None)

class Port(object):
    def __init__(self, name, comp):
        pass

    def linkTo(self, port):
        pass

class Block(object):

    

    def __init__(self, network, name, *args, **kwargs):
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
        self.build(network)

    def build(self, network):
        pass

    def newPort(self, name):
        port = Port(name, self)
        self.__dict__[name] = port
        return port

    def getPort(self, name):
        return self.__dict__[name]

class Network(gv.Module):

    def build(self):
        self.blocks = []

    def newBlock(self, className, name, *args, **kwargs):
        if Block in className.mro():
            # The class is derived from Block class which means we are instantiating a Block (composite)
            result = className(self, name, *args, **kwargs)
        else:
            # Otherwise it is a final cell
            class NewClass(Cell, className): pass
            result = NewClass(self, name, *args, **kwargs)

        self.blocks.append(result)
        return result
        
