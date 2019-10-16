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

import cmd
from ctypes import *
import signal
import os

from gv import *
from gv_engine_opt import *
import collections
import configparser


class ShellEnabled(cmd.Cmd):
    
    last_output = ''

    def __init__(self, engine):
        cmd.Cmd.__init__(self)
        self.engine = engine

    def do_quit(self, line):
        "Quit simulation"
        self.engine.stop = True
        return True
    
    def do_tracePathActivate(self, path):
        "Activate platform traces from path"
        if path:
            self.engine.appendRawTracePathList([path])
            self.engine.confAllTraces()
    
    def do_state(self, line):
        "Show component states"
        self.engine.bkp.debugState()
    
    def do_bkp_list(self, options):
        "List memory breakpoints"
        optionsArray = options.split()
        if len(optionsArray) != 0:
                print('This command takes no option')
                return False
        self.engine.bkp.listBkp()
    
    def do_mem_dump(self, options):
        "Dump memory. Usage: mem_dump <base> | mem_dump <base> <size>"
        optionsArray = options.split()
        if len(optionsArray) == 1:
                size = 4
        elif len(optionsArray) != 2:
                print('Invalid number of parameters')
                return False
        else:
                size = int(optionsArray[1], 0)
        base = int(optionsArray[0], 0)
        self.engine.bkp.memDump(base, size)
                
    
    def do_bkp(self, options):
        "Set memory breakpoint. Usage: bkp <base> <size> <access> | bkp <base> <size> | bkp <base>"
        optionsArray = options.split()
        if len(optionsArray) != 0:
            access = "rw"
            size = "4"
            if len(optionsArray) > 1:
                size = optionsArray[1]
            if len(optionsArray) > 2:
                access = optionsArray[2]
                
            self.engine.bkp.addBkp(optionsArray[0], size, access)
    
    def do_bkp_dis(self, options):
        "Disable memory breakpoint. Usage: bkp_dis | bkp_dis <bkpIndex>"
        optionsArray = options.split()
        if len(optionsArray) == 0:
                self.engine.bkp.disBkp(-1)
        elif len(optionsArray) == 1:
                self.engine.bkp.disBkp(int(optionsArray[0],0))
        else:
                print('Invalid number of parameters')
    
    def do_run(self, line):
        "Run simulation"
        return True
    
def signal_handler(signal, frame):
        sys.exit(0)

def parseValue(str):
    strList = str.split()
    if len(strList) <= 1: return float(str)
    else:
        unit = strList[1]
        val = strList[0]
        if unit == 'mW' or unit == 'mJ' or unit == 'mV': return float(val)/1000
        elif unit == 'uW' or unit == 'uJ' or unit == 'uV': return float(val)/1000000
        elif unit == 'nW' or unit == 'nJ' or unit == 'nV': return float(val)/1000000000
        elif unit == 'pW' or unit == 'pJ' or unit == 'pV': return float(val)/1000000000000
        else: return float(val)

class Engine(Module):

    pdbBreak = False
    pdbEndBreak = False
    pdbNoBreak = False
    werror = True

    def __init__(self, config, *args, **kwargs):

        signal.signal(signal.SIGINT, signal_handler)

        self.module = cdll.LoadLibrary("engine.so")
        self.module.gv_topEngine_new.argstype = []
        self.module.gv_topEngine_new.restype = c_void_p
        self.module.gv_topEngine_wait.restype = int
        self.config = config
        self.instance = self.module.gv_topEngine_new()
        self.engines = []
        super(Engine, self).__init__(None, None, config, None, *args, **kwargs)

        addVcdOptions(self)
        addTraceOptions(self)
        addPdbOptions(self)

        traceRegexpList = ['warning']

        self.module.gv_topEngine_setTraceFile(self.instance, create_string_buffer(self.getOption('traceFile').encode('utf-8')))

        regExpOpt = self.getOption('gvPathRegexp')
        if regExpOpt != None:
            traceRegexpList = traceRegexpList + regExpOpt

        self.trace.setActive(traceRegexpList)

        if self.getOption('power'):
            powerTables = os.environ.get("PULP_POWER_TABLES")
            if powerTables == None: raise Exception("Power tables path must be specified through PULP_POWER_TABLES when power estimation is activated")
            values = {}
            for powerFile in os.listdir(powerTables):
                config = configparser.SafeConfigParser(dict_type=collections.OrderedDict)
                config.optionxform = str
                openedPaths = config.read(os.path.join(powerTables, powerFile))
                if len(openedPaths) == 0:
                    print ("Didn't manage to open power file: %s" % (powerFile))
                    raise BaseException

                voltage = 0.8
                temperature = 25

                for section in config.sections():
                    if section == 'config':
                        for key, value in config.items(section):
                            if key == 'voltage':
                                voltage = parseValue(value)
                            elif key == 'temperature':
                                temperature = parseValue(value)
                            else:
                                raise Exception('Unknown item: ' + key)
                    else:
                        for key, value in config.items(section):
                            name = '.'.join([section, key])
                            if values.get(name) == None:
                                values[name] = {}
                            if values.get(name).get(temperature) == None:
                                values.get(name)[temperature] = {}
                            values.get(name).get(temperature)[voltage] = parseValue(value)
    
            # TODO add interpolated information to fill-in missing values and get regular matrixes

            #self.module.gv_engine_setupPowerValue.argtypes = [c_void_p, POINTER(c_char), c_int, c_int]
            #self.module.gv_engine_setupPowerValue.argtypes = [c_char_p, c_int, c_int]

            for name in values.keys():
                temps = list(values.get(name).keys())
                voltages = list(values.get(name).get(temps[0]).keys())
                nbTemp = len(temps)
                nbVoltage = len(voltages)
                self.module.gv_engine_setupPowerValue(self.instance, create_string_buffer(name.encode('utf-8')), nbTemp, nbVoltage)
                tempIndex = 0
                for temp in sorted(temps):
                    voltageIndex = 0
                    for voltage in sorted(voltages):
                        self.module.gv_engine_regPowerValue(self.instance, create_string_buffer(name.encode('utf-8')), int(tempIndex), c_double(temp), int(voltageIndex), c_double(voltage), c_float(values.get(name).get(temp).get(voltage)))
                        voltageIndex += 1
                    tempIndex += 1
                
        
    def addEngine(self, engine):
        self.engines.append(engine)

    #def run(self, step):
     #   print('run')
        
     #   for engine in self.engines:
     #       engine.run(step)

      #  for engine in self.engines:
      #      endValue = engine.wait()

        #if endValue == 0: print    ("Engine has reached specified time")
        #elif endValue == 1: print("Engine has no more event to execute")
        #elif endValue == 2: print("Engine has reached an exit request")
        #elif endValue == 3: print("Engine has reached a breakpoint")
        #elif endValue == 4: print("Engine has received a user interrupt")

       # return endValue

    def getEngine(self):
        return self

    def runArchi(self, step):
        self.module.gv_engine_run(self.instance, step)
        retval = self.module.gv_topEngine_wait(self.instance)
        return [retval & 0xff, retval >> 8]

    def quitSim(self, retval):
        self.module.gv_engine_end(self.instance)
        self.close()
        return retval

    def run(self): 
        
        parseVcdOptions(self)

        self.start()

        retval = 0
        shell = ShellEnabled(self)

        self.stop = False
        
        if self.pdbBreak:
             if self.pdbNoBreak: return self.quitSim(-1)
             else: shell.cmdloop()
        while not self.stop:
            [endVal, retval] = self.runArchi(-1)
            # The simulation ends in case of exit
            if endVal == 1 or endVal == 2:
                if endVal == 1: retval = -1
                if self.pdbEndBreak:
                    if self.pdbNoBreak: return self.quitSim(-1)
                    else: shell.cmdloop()
                break
                
            # In case of user interrupt, warning or breakpoint we just enter the debugger
            if (endVal == 4 or endVal == 3 or endVal == 5):
                if self.pdbNoBreak: 
                    if not self.werror and endVal == 5: continue
                    else: return self.quitSim(-1)
                else:  shell.cmdloop()
                
        return self.quitSim(retval)

    def stop(self):
        self.module.gv_engine_stop(self.instance)

#class Pulp3Wrapper(Wrapper):
#
#        def __init__(self):
#                super(Pulp3Wrapper, self).__init__(parent=None, name="pulp3", child=Pulp3())
#                self.instance = 0x12345678
