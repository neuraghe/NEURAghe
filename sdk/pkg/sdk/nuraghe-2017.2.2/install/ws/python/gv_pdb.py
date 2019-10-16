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

class ModuleBkp(object):
    def __init__(self, comp):
        super(ModuleBkp, self).__init__()
        self.comp = comp

    def addBkp(self, base, size, access):
        for comp in self.comp.subComps:
            comp.bkp.addBkp(base, size, access)

    def debugState(self):
        for comp in self.comp.subComps:
            comp.bkp.debugState()

    def start(self):
        pass

    def memDump(self, base, size):
        for comp in self.comp.subComps:
            comp.bkp.memDump(base, size)

class ComponentBkp(object):
    def __init__(self, comp):
        super(ComponentBkp, self).__init__()
        self.comp = comp
        self.bkps = []
        comp.addStartNotif(self)

    def addComp(self, comp):
        for bkp in self.bkps:
            comp.addBkp(bkp[0], bkp[1], bkp[2])

    def debugState(self):
        self.comp.state(self.comp.getFullPath())

    def confBkp(self, bkp):
        if bkp[2] == 'r':
            accessVal = 1
        elif bkp[2] == 'w':
            accessVal = 2
        elif bkp[2] == 'rw':
            accessVal = 3
        else:
            accessVal = 0
        self.comp.setBkp(int(bkp[0], 0), int(bkp[1], 0), accessVal)

    def listBkp(self):
        if len(self.bkps) == 0:
            print('No active breakpoint')
        else:
            print('List of active breakpoints:')
            index = 0
            for bkp in self.bkps:
                print(('%d: 0x%x -> 0x%x (%s)' % (index, int(bkp[0],0), int(bkp[0],0) + int(bkp[1],0), bkp[2])))
                index = index + 1

    def memDump(self, base, size):
        self.comp.memDump(base, size)

    def addBkp(self, base, size, access):
        bkp = [base, size, access]
        self.bkps.append(bkp)
        self.confBkp(bkp)    

    def disBkp(self, bkpIndex):
        if bkpIndex >= len(self.bkps):
            print('Invalid breakpoint index')
            return False
        for comp in self.comp.comps:
            comp.bkpComp.disBkp(bkpIndex)
        self.bkps.pop(bkpIndex)
        self.disAllBkp()
        for bkp in self.bkps:
            self.confBkp(bkp)
        
    def start(self):
        pass
