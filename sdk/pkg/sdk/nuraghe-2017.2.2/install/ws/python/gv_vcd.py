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

class VcdFile():
    def __init__(self, engine, path):
        self.traces = []
        engine.module.gv_vcdFile_new.restype = c_void_p
        engine.module.gv_vcdFile_new.argtypes = [c_void_p, c_char_p]
        self.filePtr = engine.module.gv_vcdFile_new(engine.instance, path.encode('utf-8'))

    def addTraces(self, traces):
        self.traces.append(re.compile(traces))

    def hasTrace(self, tracePath):
        for trace in self.traces:
            if trace.search(tracePath) != None:
                return True
            
        return False


class ComponentVcdCommon(object):
    def __init__(self, comp):
        self.vcdFiles = {}
        self.comp = comp

    # Add a VCD file to this component with associated pathes
    # This file can then be used by any sub-component using these pathes
    def addVcdFile(self, path, traces):
        if path in self.vcdFiles:
            vcdFile = self.vcdFiles[path]
        else:
            vcdFile = VcdFile(self.comp.getEngine(), path)
            self.vcdFiles[path] = vcdFile
        vcdFile.addTraces(traces)

    # This is called by final components to get the list of files that applies to their traces path
    def getVcdFiles(self, tracePath):

        files = []
        # First get files from this component and filter them out depending on caller pathes
        for path, vcdFile in self.vcdFiles.items():
            if vcdFile.hasTrace(tracePath):
                files.append(vcdFile)

        # Also append the files from the parent
        if self.comp.parent != None:
            files = files + self.comp.parent.vcd.getVcdFiles(tracePath)

        return files

# This class is used to add a VCD aspect to everything component
class ComponentVcd(ComponentVcdCommon):
    def __init__(self, comp):
        super(ComponentVcd, self).__init__(comp=comp)
        comp.addStartNotif(self)
        self.traces = []
        self.tracesNames = []

    def addComp(self, comp):
        pass

    def getVcdTraceNames(self):
        names = []
        index = 0
        while True:
            name = self.comp.getVcdTraceName(index)
            if name == None: break
            names.append(name)
            index = index + 1
        return names

    def start(self):
        # Introspect the C++ model to get the registered VCD traces
        for traceName in self.getVcdTraceNames():
            if not traceName in self.tracesNames:
                trace = VcdTrace(traceName, self.comp.getVcdTrace(traceName), self.comp)
                trace.configure()
                self.traces.append(trace)
                self.tracesNames.append(traceName)


    def add(self, trace):
        self.traces.append(trace)

class ModuleVcd(ComponentVcdCommon):
    def __init__(self, comp):
        super(ModuleVcd, self).__init__(comp=comp)

class VcdTrace():
    def __init__(self, name, model, comp):
        self.comp = comp
        self.name = name
        self.model = model

    def configure(self):
        files = self.comp.vcd.getVcdFiles(self.getPath())
        filePtr = 0
        if len(files) != 0: filePtr = files[0].filePtr
        self.comp.confVcdTrace(self.model, self.getPath(), len(files)!=0, filePtr)

    def getPath(self):
        return self.comp.getFullPath() + '/' + self.name

    def isActive(self, path):
        for inactive in self.getInactive():
            if inactive.search(path):
                return False
        for active in self.getActive():
            if active.search(path):
                return True
        return False
