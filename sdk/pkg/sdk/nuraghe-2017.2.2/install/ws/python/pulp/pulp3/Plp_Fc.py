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

import gv
import ico.gv_router
import mem.memory
import pulp.pulp3.plp3_ckg_v3
import pulp.pulp3.plp3_timer_v2
import cpu.or1k.riscvfsim_v2
import cache.cache


class Plp_Fc(gv.Module):

    tcdmSize = 1024
    romBoot = False

    binaries = []

    def build(self):

        fcAreaStart = 0x1B000000
        fcAreaSize  = 0x00400000

        euStart      = 0x1B200800
        euSize       = 0x00000800
        euStartDemux = 0x1B204000
        euSizeDemux  = 0x00000400

        timerStart      = 0x1B200400
        timerSize       = 0x00000400

        tcdmSocStart   = 0x1B308000
        tcdmStart   = 0x1B000000
        tcdmAliasStart = 0x00000000

        pcacheCtrlStart = 0x1B201400
        pcacheCtrlSize = 0x400

        bootAddr    = 0x1C000000
        romBootAddr = 0x1A000000

        eocStart = 0x1B200000
        eocSize  = 0x00000400

        timerIrq0 = 8
        timerIrq1 = 9

        self.addOption("--fc-tcdm-size", dest="tcdmSize", type=int, default=32*1024, help='specify the size of the FC TCDM memory. Default: %(default)s.').bindToProperty(compName='fc', propertyName='tcdmSize')
            
        # Ports declaration
        self.newPort('in')
        self.newPort('out')
        self.newPort('udma')
        self.newPort('fcEventIn')
        self.newPort('secure')

        # FC interco
        xbar = self.newComp(className=ico.gv_router.Gv_router, compName='ico', widthBits=2)
        self.getPort('in').linkTo(xbar.getPort('in'))
        xbar.getPort('out').mapTo(port=self.getPort('out'))
        xbar.getPort('out').mapTo(base=fcAreaStart, size=fcAreaSize, port=None)

        # Event unit
        ckg = self.newComp(className=pulp.pulp3.plp3_ckg_v3.Plp3_ckg, compName='ckg', nbBarriers=0, nbPes=1, secure=1)
        xbar.getPort('out').mapTo(base=euStart, size=euSize, removeOffset=euStart, port=ckg.getPort('in'))
        xbar.getPort('out').mapTo(base=euStart-fcAreaStart, size=euSize, removeOffset=euStart-fcAreaStart, port=ckg.getPort('in'))
        xbar.getPort('out').mapTo(base=euStartDemux-fcAreaStart, size=euSizeDemux, removeOffset=euStartDemux-fcAreaStart, port=ckg.getPort('demuxIn0'))
        xbar.getPort('out').mapTo(base=euStartDemux, size=euSizeDemux, removeOffset=euStartDemux, port=ckg.getPort('demuxIn0'))
        self.getPort('fcEventIn').linkTo(ckg.getPort('socEvent'))

        # Timer
        timer = self.newComp(className=pulp.pulp3.plp3_timer_v2.Plp3_timer, compName='timer')
        xbar.getPort('out').mapTo(base=timerStart, size=timerSize, removeOffset=timerStart, port=timer.getPort('in'))
        xbar.getPort('out').mapTo(base=timerStart-fcAreaStart, size=timerSize, removeOffset=timerStart-fcAreaStart, port=timer.getPort('in'))
        timer.getPort('irq0').linkTo(ckg.getPort('irq0_%d' % timerIrq0))
        timer.getPort('irq1').linkTo(ckg.getPort('irq0_%d' % timerIrq1))

        # FC core
        fc = self.newComp(className=cpu.or1k.riscvfsim_v2.Riscvfsim, compName='core', coreId=0, clusterId=32, bootAddr=bootAddr, dcache=False)
        for binary in self.binaries:
            fc.regBinary(binary)

        fc.getPort('secure').linkTo(self.getPort('secure'))

        ckg.getPort('irqs_pe0').linkTo(fc.getPort('irqs'))

        fc.getPort('dataOut').linkTo(xbar.getPort('in'))

        # EOC peripheral
        eoc = self.newComp(className=pulp.pulp3.plp3_eoc.Plp3_eoc, compName='eoc', bootAddr=bootAddr, romBootAddr=romBootAddr, romBoot=self.romBoot, isFc=True)
        xbar.getPort('out').mapTo(base=eocStart, size=eocSize, removeOffset=eocStart, port=eoc.getPort('in'))
        xbar.getPort('out').mapTo(base=eocStart-fcAreaStart, size=eocSize, removeOffset=eocStart-fcAreaStart, port=eoc.getPort('in'))
        eoc.getPort('fetch0').linkTo(fc.getPort('fetch'))
        eoc.getPort('bootAddr0').linkTo(fc.getPort('bootAddr'))
        ckg.getPort('clock0').linkTo(fc.getPort('clock'))
        ckg.getPort('sleep0').linkTo(fc.getPort('sleep'))
        fc.getPort('secure').linkTo(eoc.getPort('secure'))

        # Pcache
        pcache = self.newComp(className=cache.cache.Cache, compName='pcache', nbWaysBits=2, lineSizeBits=4, nbSetsBits=6, widthBits=2)
        pcache.getPort('refill').linkTo(xbar.getPort('in'))
        fc.getPort('fetchOut').linkTo(pcache.getPort('in0'))

        # Pcache controle
        pcacheCtrl = self.newComp(className=pulp.pulp3.plp3_icache_v2.Plp3_icache, compName='pcacheCtrl')
        xbar.getPort('out').mapTo(base=pcacheCtrlStart, size=pcacheCtrlSize, removeOffset=pcacheCtrlStart, port=pcacheCtrl.getPort('in'))
        xbar.getPort('out').mapTo(base=pcacheCtrlStart-fcAreaStart, size=pcacheCtrlSize, removeOffset=pcacheCtrlStart-fcAreaStart, port=pcacheCtrl.getPort('in'))
        pcacheCtrl.getPort('ctrl').linkTo(pcache.getPort('ctrl'))

        # TCDM
        tcdm = self.newComp(className=mem.memory.Memory, compName='tcdm', size=self.tcdmSize, widthBits=2)
        xbar.getPort('out').mapTo(base=tcdmAliasStart, size=self.tcdmSize, removeOffset=tcdmAliasStart, port=tcdm.getPort('in'))
        xbar.getPort('out').mapTo(base=tcdmStart, size=self.tcdmSize, removeOffset=tcdmStart, port=tcdm.getPort('in'))
        xbar.getPort('out').mapTo(base=tcdmSocStart, size=self.tcdmSize, removeOffset=tcdmSocStart, port=tcdm.getPort('in'))

        self.getPort('udma').linkTo(ckg.getPort('socEvent'))