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

import re


class Trace(object):
    def __init__(self, name, model, comp):
        self.name = name
        self.comp = comp
        self.model = model
        
    def configure(self):
        self.comp.confTrace(self.name, self.getPath(), self.comp.trace.isActive(self.getPath()))
        self.model.isActive = self.comp.trace.isActive(self.getPath())
        self.model.path = self.getPath()

    def getPath(self):
        return self.comp.getFullPath() + '/' + self.name

class ComponentTraceCommon(object):
    def __init__(self, comp):
        comp.addStartNotif(self)
        self.comp = comp
        self.active = []
        self.inactive = []

    def setActive(self, regexpList):
        for regexp in regexpList:
            self.active.append(re.compile(regexp))

    def getActive(self):
        active = self.active
        if self.comp.parent != None and self.comp.parent.isNewComp:
            active = active + self.comp.parent.trace.getActive()
        return active

    def setInactive(self, regexp):
        self.inactive.append(re.compile(regexp))

    def getInactive(self):
        inactive = self.inactive
        if self.comp.parent != None and self.comp.parent.isNewComp:
            inactive = inactive + self.comp.parent.trace.getInactive()
        return inactive

    def isActive(self, path):
        for inactive in self.getInactive():
            if inactive.search(path):
                return False
        for active in self.getActive():
            if active.search(path):
                return True
        return False

class ComponentTrace(ComponentTraceCommon):
    def __init__(self, comp):
        super(ComponentTrace, self).__init__(comp=comp)
        self.traces = []
        self.tracesNames = []

    def getTraceNames(self):
        names = []
        index = 0
        while True:
            name = self.comp.getTraceName(index)
            if name == None: break
            names.append(name)
            index = index + 1
        return names

    def start(self):
        # Introspect the C++ model to get the registered traces
        for traceName in self.getTraceNames():
            if not traceName in self.tracesNames:
                trace = Trace(traceName, self.comp.getTrace(traceName), self.comp)
                trace.configure()
                self.traces.append(trace)
                self.tracesNames.append(traceName)

class ModuleTrace(ComponentTraceCommon):
    def __init__(self, comp):
        super(ModuleTrace, self).__init__(comp=comp)

    def start(self):
        pass
