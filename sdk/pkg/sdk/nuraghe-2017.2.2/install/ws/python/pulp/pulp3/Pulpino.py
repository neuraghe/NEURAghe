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

import os

import gv
import ico.gv_router
import ico.uart_pulpino
import mem.memory
import misc.loader.gv_loader
import misc.cam.cam
import pulp.pulp3.Plp3_Fabric
import pulp.pulp3.Plp3_Fc
from pulp.pulp3.MemoryMap import *
import time
import ico.i2sFile
import cpu.or1k.riscvfsim_v2_1_9
import sec.mmu


class Pulpino_Soc(gv.Module):

    tcdmSize = 64*1024*1024
    tcpmSize = 64*1024*1024

    def __init__(self, *args, **kwargs):
        super(Pulpino_Soc, self).__init__(*args, **kwargs)

    def build(self):

        parser = self.config.getParser()
        self.addOption("--pulp-chip-version", dest="chipVersion", default=0, type=int, help='specify the version of the chip. Default: %(default)s."', metavar="PATH")
        self.addOption("--pulpCoreArchi", dest="pulpCoreArchi", default=None, help='specify the core architecture in the cluster')
        self.addOption("--mmu", dest="mmu", action="store_true", help='Activate MMU')

        self.addOption("--load-binary", dest="binaries", action='append', help='specify a binary to be loaded', metavar="PATH")
        self.config.args = self.config.getParser().parse_known_args()[0]

        self.binaries = self.config.args.binaries

        clockDomain = self.newComp(className=gv.ClockEngine, compName='clock', frequency=100000000)

        tcdm = self.newComp(className=mem.memory.Memory, compName='tcdm', clock=clockDomain, widthBits=2, size=self.tcdmSize)
        tcpm = self.newComp(className=mem.memory.Memory, compName='tcpm', clock=clockDomain, widthBits=2, size=self.tcpmSize)
        uart = self.newComp(className=ico.uart_pulpino.Uart_pulpino, compName='uart', clock=clockDomain)
        xbar = self.newComp(className=ico.gv_router.Gv_router, compName='ico', widthBits=2, clock=clockDomain)
        core = self.newComp(className=cpu.or1k.riscvfsim_v2_1_9.Riscvfsim, compName='core', coreId=0, clusterId=0, bootAddr=0x00000000, dcache=False, clock=clockDomain, autoboot=True, isaSubsets='--priv_1_9')
        self.loader = self.newComp(clock=clockDomain, className=misc.loader.gv_loader.Loader, compName='loader')
        if self.getOption('mmu'): mmu = self.newComp(className=sec.mmu.Mmu, compName='mmu', clock=clockDomain, dummyParam=2048)

        self.loader.getPort('out').linkTo(xbar.getPort('in'))
        xbar.getPort('out').mapTo(base=0x08000000, size=self.tcdmSize, removeOffset=0x08000000, port=tcdm.getPort('in'))
        xbar.getPort('out').mapTo(base=0x00000000, size=self.tcpmSize, removeOffset=0x00000000, port=tcpm.getPort('in'))
        xbar.getPort('out').mapTo(base=0x1a100000, size=0x10000, removeOffset=0x1a100000, port=uart.getPort('in'))

        if self.getOption('mmu'):
            core.getPort('fenceOut').linkTo(mmu.getPort('fence'))
            core.getPort('fetchOut').linkTo(mmu.getPort('fetchIn'))
            core.getPort('dataOut').linkTo(mmu.getPort('dataIn'))
            core.getPort('kernel').linkTo(mmu.getPort('kernel'))
            core.getPort('secure').linkTo(mmu.getPort('secure'))
            core.getPort('pgtab').linkTo(mmu.getPort('pgtab'))
            core.getPort('pv').linkTo(mmu.getPort('vm'))
            mmu.getPort('fetchOut').linkTo(xbar.getPort('in'))
            mmu.getPort('dataOut').linkTo(xbar.getPort('in'))
        else:
            core.getPort('fetchOut').linkTo(xbar.getPort('in'))
            core.getPort('dataOut').linkTo(xbar.getPort('in'))



    def load(self):

            if self.binaries != None:
                for binary in self.binaries:
                    name = binary.split(':')[0]
                    maskList = binary.split(':')[1]

                    if self.loader.loadBinary(name): self.raiseError('Unable to load binary')

    def start(self):
        super(Pulpino_Soc, self).start()

    def close(self):
        # TODO find a way to avoid having to call parent close
        super(Pulpino_Soc, self).close()
        if self.getOption('kcg') != None:
            print()
            print("KCacheGrind report generated, it can be launched with:")
            print("kcachegrind %s/kcg.txt" % (os.getcwd()))
        if self.getOption('tv'):
            print()
            print("Traceview report generated, it can be launched with:")
            print("traceview %s/tvDump" % (os.getcwd()))
            print()
            print("Callgraphs reports generated, they can be viewed in %s/cg_cluster*_core*.txt" % (os.getcwd()))

class Pulpino_Top(gv.Engine):

    def build(self, *args, **kwargs):

        self.addOption("--iss-trace", dest="issTrace", action="store_true", help='generate assembly traces of the ISS execution. One file is generated for each processor. Each file is named trace[clusterId]_[coreId]. Each file contains the assembly code executed on the processor and the content of each accessed resource.').bindToProperty(className='Or1k', propertyName='issTrace')

        soc = self.newComp(pulp.pulp3.Pulpino.Pulpino_Soc, 'soc', *args, **kwargs)

        self.soc = soc


    def start(self):

        # TODO should remove this
        self.soc.start()
        self.soc.reset()
        self.soc.load()
