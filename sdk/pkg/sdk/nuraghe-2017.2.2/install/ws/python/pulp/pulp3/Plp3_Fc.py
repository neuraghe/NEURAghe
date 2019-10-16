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

#import cpu.or1k.or1ksim
#import cpu.or1k.or1kgdbsim
import gv
import ico.gv_router
import mem.memory
import pulp.pulp3.plp3_ckg_v2
import pulp.pulp3.plp3_eoc
import ico.spiMaster_v2


class Plp3_Fc(gv.Module):

    clusterId = 0
    or1kiss = "or1ksim"

    def build(self):

        # Ports declaration
        self.newPort('in')
        self.newPort('out')
        self.newPort('spim')

        # FC interco
        xbar = self.newComp(className=ico.gv_router.Gv_router, compName='ico', widthBits=3)
        self.getPort('in').linkTo(xbar.getPort('in'))
        xbar.getPort('out').mapTo(port=self.getPort('out'))
        xbar.getPort('out').mapTo(base=0x50000000, size=0x20000000, port=None)

        # Empty area to fake host mailbox
        mb = self.newComp(className=mem.memory.Memory, compName='mb', size=0x1000)
        
        xbar.getPort('out').mapTo(base=0x60000000, size=0x10000000, removeOffset=0x60000000, port=mb.getPort('in'))
        # EOC peripheral
        eoc = self.newComp(className=pulp.pulp3.plp3_eoc.Plp3_eoc, compName='eoc')
        xbar.getPort('out').mapTo(base=0x50200000, size=0x00000400, removeOffset=0x50200000, port=eoc.getPort('in'))
        # CKG peripheral
        ckg = self.newComp(className=pulp.pulp3.plp3_ckg_v2.Plp3_ckg, compName='ckg', nbBarriers=0, nbPes=1)
        xbar.getPort('out').mapTo(base=0x50000000 + 0x00200800, size=0x00000400, removeOffset=0x50000000 + 0x00200800, port=ckg.getPort('in'))

        # FC core
        if self.or1kiss == 'or1ksim': or1kissClass = cpu.or1k.or1ksim.Or1ksim
#else: or1kissClass = cpu.or1k.or1kgdbsim.Or1kgdbsim

        fc = self.newComp(className=or1kissClass, compName='core', coreId=0, clusterId=self.clusterId, bootAddr=0x80000000, dcache=False)

        for irq in range(0, 32):
            ckg.getPort('irq%d_pe0' % (irq)).linkTo(fc.getPort('irq%d' % (irq)))

        coreXbar = self.newComp(className=ico.gv_router.Gv_router, compName='icoCore0', widthBits=2)
        coreXbar.getPort('out').mapTo(base=0x50000000 + 0x00204000, size=0x0000000c, removeOffset=0x50000000 + 0x00204000, port=ckg.getPort('demuxIn0'))
        coreXbar.getPort('out').mapTo(port=xbar.getPort('in'))



        fc.getPort('dataOut').linkTo(coreXbar.getPort('in'))
        fc.getPort('fetchOut').linkTo(xbar.getPort('in'))

        # SPI
        spiMaster = self.newComp(className=ico.spiMaster_v2.SpiMaster_v2, compName='spiMaster')
        xbar.getPort('out').mapTo(port=spiMaster.getPort('in'), base=0x51000000, size=0x1000, removeOffset=0x51000000)

        spiMaster.getPort('out0').linkTo(self.getPort('spim'))
        spiMaster.getPort('xbar').linkTo(xbar.getPort('in'))
        spiMaster.getPort('irq').linkTo(ckg.getPort('irq0_10'))

        eoc.getPort('fetch0').linkTo(fc.getPort('fetch'))
        ckg.getPort('clock0').linkTo(fc.getPort('clock'))
