# -*- coding: utf-8 -*-
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

import cache.cache
#import cpu.or1k.spike
#import cpu.or1k.or1ksim
import cpu.or1k.or1kfsim
import cpu.or1k.or10nv2fsim
import cpu.or1k.riscvfsim
import cpu.or1k.riscvfsim_v2
#import cpu.or1k.or1kgdbsim
import gv
import ico.gv_router
import ico.interleaver
import mem.memory
import cgra.Cgra
import pulp.pulp3.plp3_ckg_v1
import pulp.pulp3.plp3_ckg_v2
import pulp.pulp3.plp3_ckg_v3
import pulp.pulp3.plp3_dma_v1
import pulp.pulp3.plp3_dma_v2
import pulp.pulp3.plp3_dma_v3
import pulp.pulp3.plp3_dma_v5
import pulp.pulp3.plp3_dma_v6
import pulp.pulp3.plp3_eoc
import pulp.pulp3.plp3_evt
import pulp.pulp3.plp3_jtag
import pulp.pulp3.plp3_timer
import pulp.pulp3.plp3_timer_v2
import pulp.pulp3.plp3_ts
import hwpes.Adder
import hwpes.Conv
from math import *

isFirst = True

def next_power_of_2(n):
    n -= 1
    shift = 1
    while (n+1) & n:
        n |= n >> shift
        shift <<= 1
    return n + 1

def getL1Info(nbMasters, bankingFactor, size, scmSize):
    nbPortsRounded = next_power_of_2(nbMasters)
    if str(bankingFactor).find('1.') == 0:
        nbBanks = nbPortsRounded / int(str(bankingFactor)[2:])
    else:
        nbBanks = bankingFactor * nbPortsRounded
    bankSize = int(size / nbBanks)
    scmBankSize = scmSize / nbBanks
    return [nbBanks, bankSize, scmBankSize]

class Plp3_Cluster(gv.Module):

    cid = 0
    clusterBase = 0xffff8000
    clusterSize = 0x00008000
    nbPes = 4
    l1Size = 256*1024
    scmSize = 8*1024
    jtag=False
    version=2
    or1kiss = "gvsim"
    l1BankingFactor = 2
    newEvt=False
    bootAddr = 0
    romBootAddr = 0
    romBoot = False
    chipVersion = 0
    nbSharedFpu = 0
    power = False
    nbFcEvents = 0
    binaries = []
    clusterConfig = None

    def build(self):
        global isFirst

        if isFirst:
            isFirst = False
            self.addOption("--l1-size", dest="l1Size", type=int, default=256*1024, help='specify the size of the L1 memory. Default: %(default)s.').bindToProperty(compName='cluster', propertyName='l1Size')
            self.addOption("--scm-size", dest="scmSize", type=int, default=8*1024, help='specify the size of the scm memory. Default: %(default)s.').bindToProperty(compName='cluster', propertyName='scmSize')
            self.addOption("--hwpe", dest="hwpes", default=[], action="append", help='specify a HW PE to be included in the the cluster')
            self.addOption("--cgra", dest="cgra", default=[], action="append", help='specify a file describing a CGRA to be included in the the cluster')
            self.addOption("--new-evt", dest="newEvt", action="store_true", default=False, help='use new event unit. Default: %(default)s.').bindToProperty(compName='cluster', propertyName='newEvt')
            self.addOption("--fpu", dest="fpu", action="store_true", default=False, help='use FPU. Default: %(default)s.')
            self.addOption("--dma-bug", dest="dmaBug", action="store_true", default=False, help='model fulmine DMA bug. Default: %(default)s.')
            self.addOption("--div", dest="div", action="store_true", default=False, help='use HW divider. Default: %(default)s.')
            self.addOption("--shared-fpu", dest="sharedFpu", type=int, default=0, help='define number of shared FPUs. Default: %(default)s.').bindToProperty(compName='cluster', propertyName='nbSharedFpu')
            self.addOption("--core-ext", dest="coreExt", action="append", default=[], help='Specify additional core extensions. Default: %(default)s.')
            

        l1Size = self.l1Size + self.scmSize

        if self.getOption('pulpCoreArchi').find('riscv') != -1 or self.getOption('pulpCoreArchi') == 'or10nv2' or self.getOption('pulpCoreArchi').find('ri5cy') != -1:
            self.or1kiss = 'gvsim'

        l1Base = self.clusterBase
        periphBase = self.clusterBase + 0x00200000

        hasAlias = self.version >= 5

        if self.version == 3 or hasAlias:
            dmaLocOffset = l1Base
        else:
            dmaLocOffset = 0

        # Blocks class selection
        if self.version >= 8:
            timerVersion = 2
            ckgClass = pulp.pulp3.plp3_ckg_v3.Plp3_ckg
            euVersion = 3
        else:
            timerVersion = 1
            euVersion = 1
            if self.version == 3:   
                ckgClass = pulp.pulp3.plp3_ckg_v2.Plp3_ckg
            else:
                ckgClass = pulp.pulp3.plp3_ckg_v1.Plp3_ckg

        # Ports declaration
        self.newPort('in')
        self.newPort('out')

        self.newPort('spiIrq0')
        self.newPort('spiIrq1')

        # The SOC camera device is broadcasting end-of-transfer interrupts here
        self.newPort('cam')

        if euVersion == 3:
            self.newPort('udma')
        else:
            self.newPort('udma0')
            self.newPort('udma1')
            self.newPort('udma2')
            self.newPort('udma3')
            self.newPort('udma4')
            self.newPort('udma5')
            self.newPort('udma6')
            self.newPort('udma7')
            self.newPort('udma8')
            self.newPort('udma9')
            self.newPort('udma10')

        for i in range(0, self.nbFcEvents):
            self.newPort('fcEvent%d' % (i))

        if euVersion == 3:
            self.newPort('barrierEvt')
            self.newPort('lockEvt')
            self.newPort('triggerEvt')

        # Cluster interco
        xbar = self.newComp(className=ico.gv_router.Gv_router, compName='ico', widthBits=3)
        self.getPort('in').linkTo(xbar.getPort('in'))
        xbar.getPort('out').mapTo(self.getPort('out'))
        xbar.getPort('out').mapTo(base=self.clusterBase, size=self.clusterSize, port=None)

        # L1 interco
        l1Xbar = self.newComp(className=ico.gv_router.Gv_router, compName='ico', widthBits=3, bandwidth=8)
        
        # Req pipe stage
        if self.version < 8:
            if euVersion == 3:
                reqPipeBase = periphBase + 0x00001000
            else:
                reqPipeBase = periphBase + 0x00000C00
                reqPipe = self.newComp(className=mem.memory.Memory, compName='reqPipe', check=False)
                xbar.getPort('out').mapTo(base=reqPipeBase, size=0x00000400, removeOffset=reqPipeBase, port=reqPipe.getPort('in'))

        # EOC peripheral
        eoc = self.newComp(className=pulp.pulp3.plp3_eoc.Plp3_eoc, compName='eoc', bootAddr=self.bootAddr, romBootAddr=self.romBootAddr, romBoot=self.romBoot)
        xbar.getPort('out').mapTo(base=periphBase + 0x00000000, size=0x00000400, removeOffset=periphBase + 0x00000000, port=eoc.getPort('in'))

        # EVT unit peripheral
        self.newComp(className=pulp.pulp3.plp3_evt.Plp3_evt, compName='evt')

        # TIMER peripheral
        if timerVersion == 1:
            timer = self.newComp(className=pulp.pulp3.plp3_timer.Plp3_timer, compName='timer', nbTimer=4)
            for timerId in range(0,4):
                base = periphBase + 0x00000440 + timerId*0x40
                xbar.getPort('out').mapTo(base=base, size=0x00000040, removeOffset=base, port=timer.getPort('in%d' % (timerId)))
        else:
            timer = self.newComp(className=pulp.pulp3.plp3_timer_v2.Plp3_timer, compName='timer')
        xbar.getPort('out').mapTo(base=periphBase + 0x00000400, size=0x00000040, removeOffset=periphBase + 0x00000400, port=timer.getPort('in'))

        # DMA peripheral
        if self.version == 2:
            dmaVersion = 1
            dma = self.newComp(className=pulp.pulp3.plp3_dma_v1.Plp3_dma, compName='dma', nbInputs=self.nbPes+1, nbCounters=4, globalFifoSize=16, privateFifoSize=2, locOffset=dmaLocOffset)
        elif self.version == 4:
            dmaVersion = 3
            dma = self.newComp(className=pulp.pulp3.plp3_dma_v3.Plp3_dma, compName='dma', nbInputs=self.nbPes+1, nbCounters=4, globalFifoSize=16, privateFifoSize=2, locOffset=dmaLocOffset)
        elif self.version == 5:
            if self.chipVersion == 0 or self.chipVersion == 100:
                dmaVersion = 5
                dma = self.newComp(className=pulp.pulp3.plp3_dma_v5.Plp3_dma, compName='dma', nbInputs=self.nbPes+1, nbCounters=4, globalFifoSize=16, privateFifoSize=2, locOffset=dmaLocOffset, modelBug=self.getOption('dmaBug'))
            else:
                dmaVersion = 3
                dma = self.newComp(className=pulp.pulp3.plp3_dma_v3.Plp3_dma, compName='dma', nbInputs=self.nbPes+1, nbCounters=4, globalFifoSize=16, privateFifoSize=2, locOffset=dmaLocOffset)
        elif self.version == 6 or self.version == 7:
            dmaVersion = 5
            if self.version == 7:
                dma = self.newComp(className=pulp.pulp3.plp3_dma_v5.Plp3_dma, compName='dma', nbInputs=self.nbPes+1, nbCounters=4, globalFifoSize=16, privateFifoSize=2, locOffset=dmaLocOffset, modelBug=self.getOption('dmaBug'), upLocOffset=0x1b000000)
            else:
                dma = self.newComp(className=pulp.pulp3.plp3_dma_v5.Plp3_dma, compName='dma', nbInputs=self.nbPes+1, nbCounters=4, globalFifoSize=16, privateFifoSize=2, locOffset=dmaLocOffset, modelBug=self.getOption('dmaBug'))
        else:
            dmaVersion = 6
            dma = self.newComp(className=pulp.pulp3.plp3_dma_v6.Plp3_dma, compName='dma', nbInputs=self.nbPes, nbCounters=self.nbPes*2, globalFifoSize=16, privateFifoSize=2, locOffset=dmaLocOffset)
            
        # TODO somethng is wrong here
        if dmaVersion < 6:
            xbar.getPort('out').mapTo(base=periphBase + 0x00004800, size=0x00000400, removeOffset=periphBase + 0x00004800, port=dma.getPort('in16'))
        dma.getPort('locOut').linkTo(l1Xbar.getPort('in'))
        dma.getPort('extOut').linkTo(xbar.getPort('in'))

        # CKG peripheral
        if euVersion == 3:
            ckgSize = 0x00000800
        else:
            ckgSize = 0x00000400

        nbBarriers = self.nbPes+2
        if nbBarriers < 6: nbBarriers = 6
        if euVersion >= 3:
            ckg = self.newComp(className = ckgClass, compName='ckg', nbBarriers=nbBarriers, nbPes=self.nbPes)
        else:
            ckg = self.newComp(className = ckgClass, compName='ckg', nbBarriers=nbBarriers, nbPes=self.nbPes)
        xbar.getPort('out').mapTo(base=periphBase + 0x00000800, size=ckgSize, removeOffset=periphBase + 0x00000800, port=ckg.getPort('in'))

        # L1 Interconnect
        [nbL1Banks, l1BankSize, scmBankSize] = getL1Info(self.nbPes, self.l1BankingFactor, l1Size, self.scmSize)
        l1ico = self.newComp(className=ico.interleaver.Interleaver, compName='l1ico', stageBits=int(ceil(log(nbL1Banks,2))), removeOffset=l1Base, interleavingBits=2)
        xbar.getPort('out').mapTo(port=l1ico.getPort('in'), base=l1Base, size=l1Size)

        # HWCE
        hwceConf = self.clusterConfig.get('hwce')
        if hwceConf != None:
            conv = self.newComp(compName='hwce', **hwceConf.getModelProps())
            xbar.getPort('out').mapTo(base=self.clusterBase + hwceConf.map.base, size=hwceConf.map.size, removeOffset=self.clusterBase + hwceConf.map.base, port=conv.getPort('in'))
            hwceXbar = self.newComp(className=ico.gv_router.Gv_router, compName='hwceIco', widthBits=2)
            hwceXbar.getPort('out').mapTo(port=l1ico.getPort('in'), base=l1Base, size=l1Size-self.scmSize)
            hwceXbar.getPort('out').mapTo(port=l1ico.getPort('in'), base=l1Base+l1Size-self.scmSize, size=self.scmSize)
            hwceXbar.getPort('out').mapTo(port=l1ico.getPort('in'), base=0, size=l1Size-self.scmSize, removeOffset=0xf0000000 - 0x400000*self.cid)
            hwceXbar.getPort('out').mapTo(port=l1ico.getPort('in'), base=l1Size-self.scmSize, size=self.scmSize, removeOffset=0xf0000000 - 0x400000*self.cid)
            for i in range(0, 4):
                conv.getPort('out%d' % i).linkTo(hwceXbar.getPort('in'))

        # L1 memory
        for bankId in range(0, nbL1Banks):
            l1Bank = self.newComp(className=mem.memory.Memory, compName='l1_%d' % (bankId), size=l1BankSize, widthBits=2)
            l1ico.getPort('out%d'%(bankId)).linkTo(port=l1Bank.getPort('in'))

        # L1 TS
        l1ts = self.newComp(className=pulp.pulp3.plp3_ts.Plp3_ts, compName='ts')
        xbar.getPort('out').mapTo(port=l1ts.getPort('in'), base=l1Base+(1<<20), size=l1Size, removeOffset=(1<<20))
        l1Xbar.getPort('out').mapTo(port=l1ts.getPort('in'), base=l1Base+(1<<20), size=l1Size, removeOffset=(1<<20))
        l1ts.getPort('out').linkTo(port=l1ico.getPort('in'))

        # Pcache
        nbWays = self.clusterConfig.pcache.ways
        lineSize = self.clusterConfig.pcache.lineSize
        nbSets = int(self.clusterConfig.pcache.size / (lineSize * nbWays))
        pcache = self.newComp(className=cache.cache.Cache, compName='pcache', nbWaysBits=int(log(nbWays, 2)), lineSizeBits=int(log(lineSize, 2)), nbSetsBits=int(log(nbSets, 2)), widthBits=2, nbPorts=self.nbPes)
        pcache.getPort('refill').linkTo(xbar.getPort('in'))

        # Shared pcache controle
        icacheCtrlConf = self.clusterConfig.get('icache_ctrl')
        if icacheCtrlConf != None:
            icache = self.newComp(compName='icache_ctrl', **icacheCtrlConf.getModelProps())
            xbar.getPort('out').mapTo(base=periphBase + 0x00001400, size=0x00000400, removeOffset=periphBase + 0x00001400, port=icache.getPort('in'))
            icache.getPort('ctrl').linkTo(pcache.getPort('ctrl'))
        
        # Debug unit
        if self.jtag:
            jtag = self.newComp(className=pulp.pulp3.plp3_jtag.Plp3_jtag, compName='jtag', maxNbCores=self.nbPes)
            jtag.getPort('out').linkTo(xbar.getPort('in'))

        # Processing elements
        #if self.or1kiss == 'or1ksim': or1kissClass = cpu.or1k.or1ksim.Or1ksim
        #elif self.or1kiss == 'spike': or1kissClass = cpu.or1k.spike.Spike
        elif self.or1kiss == 'gvsim': 
            if self.getOption('pulpCoreArchi').find('ri5cyv2') != -1: or1kissClass = cpu.or1k.riscvfsim_v2.Riscvfsim
            elif self.getOption('pulpCoreArchi').find('riscv') != -1 or self.getOption('pulpCoreArchi').find('ri5cyv1') != -1 or self.getOption('pulpCoreArchi').find('ri5cy') != -1: or1kissClass = cpu.or1k.riscvfsim.Riscvfsim     
            elif self.getOption('pulpCoreArchi').find('or10nv2') != -1: or1kissClass = cpu.or1k.or10nv2fsim.Or10nv2fsim
            else: or1kissClass = cpu.or1k.or1kfsim.Or1kfsim
        #else: or1kissClass = cpu.or1k.or1kgdbsim.Or1kgdbsim

        for coreId in range(0, self.nbPes):
            isaSubsetsList = []
            if self.getOption('fpu'): 
                isaSubsetsList += ["--fpu"]
                if self.getOption('pulpCoreArchi').find('ri5cy') != -1 or self.getOption('pulpCoreArchi').find('riscv') != -1: isaSubsetsList += ["--fpud"]
            elif self.getOption('sharedFpu') != 0: isaSubsetsList += ["--fpu", "--shared-fpu"]

            if self.getOption('div'): isaSubsetsList += ["--fpuDiv", "--div"]
            isaSubsetsList += self.getOption('coreExt')
            if self.getOption('pulpCoreArchi').find('ri5cy') != -1 or self.getOption('pulpCoreArchi').find('riscv') != -1: isaSubsetsList.append('--priv_pulp')
            isaSubsets = None
            if len(isaSubsetsList) != 0: isaSubsets = ' '.join(isaSubsetsList)

            pe = self.newComp(className=or1kissClass, compName='pe%d' % (coreId), coreId=coreId, clusterId=self.cid, pcache=False, isaSubsets=isaSubsets, nbSharedFpu=self.nbSharedFpu, power=self.power)

            for binary in self.binaries:
                pe.regBinary(binary)

            if euVersion < 3:
                pe.getPort('readyToShutdown').linkTo(ckg.getPort('readyToShutdown%d' % coreId))

            # TODO try to get rid of nbCounters
            coreXbar = self.newComp(className=ico.gv_router.Gv_router, compName='icoCore%d' % (coreId), widthBits=2, nbCounters=3)
            if self.version == 3:
                coreXbar.getPort('out').mapTo(port=xbar.getPort('in'), base=0xffff8000, size=0x4000, removeOffset=0xffff8000-periphBase)
                coreXbar.getPort('out').mapTo(port=xbar.getPort('in'), base=0xffffc800, size=0x400, removeOffset=0xffff8000-periphBase)
                coreXbar.getPort('out').mapTo(port=l1ico.getPort('in'), base=0, size=l1Size-self.scmSize, removeOffset=0x100000000-l1Base, id=0)
                coreXbar.getPort('out').mapTo(port=l1ico.getPort('in'), base=l1Size-self.scmSize, size=self.scmSize, removeOffset=0x100000000-l1Base+self.scmSize, id=2)
                coreXbar.getPort('out').mapTo(port=l1ts.getPort('in'), base=1<<20, size=l1Size-self.scmSize, removeOffset=0x100000000-l1Base+(1<<20), id=0)
                coreXbar.getPort('out').mapTo(port=l1ts.getPort('in'), base=(1<<20)+l1Size-self.scmSize, size=self.scmSize, removeOffset=0x100000000-l1Base+(1<<20)+self.scmSize, id=2)
                coreXbar.getPort('out').mapTo(base=0xffffc000, size=0x00000400, removeOffset=0xffffc000, port=ckg.getPort('demuxIn%d' % (coreId)))
                coreXbar.getPort('out').mapTo(base=0xffffc400, size=0x00000400, removeOffset=0xffffc400, port=dma.getPort('in%d' % (coreId)))        
            else:
                coreXbar.getPort('out').mapTo(base=periphBase + 0x00004000, size=0x00000400, removeOffset=periphBase + 0x00004000, port=ckg.getPort('demuxIn%d' % (coreId)))
                # We create 2 mappings to the same location to have different statistics between sram and scm
                # id 0 is used for stalls which are common and id 2 and 3 are used for number of accesses
                # which are different
                coreXbar.getPort('out').mapTo(port=l1ico.getPort('in'), base=l1Base, size=l1Size-self.scmSize, id=0)
                coreXbar.getPort('out').mapTo(port=l1ico.getPort('in'), base=l1Base+l1Size-self.scmSize, size=self.scmSize, id=2)
                coreXbar.getPort('out').mapTo(port=l1ts.getPort('in'), base=l1Base+(1<<20), size=l1Size-self.scmSize, removeOffset=(1<<20), id=0)
                coreXbar.getPort('out').mapTo(port=l1ts.getPort('in'), base=l1Base+l1Size-self.scmSize+(1<<20), size=self.scmSize, removeOffset=(1<<20), id=2)
                coreXbar.getPort('out').mapTo(base=periphBase + 0x00004400, size=0x00000400, removeOffset=periphBase + 0x00004400, port=dma.getPort('in%d' % (coreId)))
                if hasAlias:
                    if self.version == 7:
                        # Remap evertyhing at 0
                        coreXbar.getPort('out').mapTo(base=0x1b204000, size=0x00000400, removeOffset=0x1b204000, port=ckg.getPort('demuxIn%d' % (coreId)))
                        # We create 2 mappings to the same location to have different statistics between sram and scm
                        # id 0 is used for stalls which are common and id 2 and 3 are used for number of accesses
                        # which are different
                        coreXbar.getPort('out').mapTo(port=l1ico.getPort('in'), base=0x1b000000, size=l1Size-self.scmSize, removeOffset=0x0b000000 - 0x400000*self.cid, id=0)
                        coreXbar.getPort('out').mapTo(port=l1ico.getPort('in'), base=0x1b000000+l1Size-self.scmSize, size=self.scmSize, removeOffset=0x0b000000 - 0x400000*self.cid, id=2)
                        coreXbar.getPort('out').mapTo(port=l1ts.getPort('in'), base=0x1b000000+(1<<20), size=l1Size-self.scmSize, removeOffset=(1<<20)+0x0b000000 - 0x400000*self.cid, id=0)
                        coreXbar.getPort('out').mapTo(port=l1ts.getPort('in'), base=0x1b000000+l1Size-self.scmSize+(1<<20), size=self.scmSize, removeOffset=(1<<20)+0x0b000000 - 0x400000*self.cid, id=2)
                        coreXbar.getPort('out').mapTo(base=0x1b204400, size=0x00000400, removeOffset=0x1b204400, port=dma.getPort('in%d' % (coreId)))
                    else:
                        # Remap evertyhing at 0
                        coreXbar.getPort('out').mapTo(base=0x00204000, size=0x00000400, removeOffset=0x00204000, port=ckg.getPort('demuxIn%d' % (coreId)))
                        # We create 2 mappings to the same location to have different statistics between sram and scm
                        # id 0 is used for stalls which are common and id 2 and 3 are used for number of accesses
                        # which are different
                        coreXbar.getPort('out').mapTo(port=l1ico.getPort('in'), base=0, size=l1Size-self.scmSize, removeOffset=0xf0000000 - 0x400000*self.cid, id=0)
                        coreXbar.getPort('out').mapTo(port=l1ico.getPort('in'), base=l1Size-self.scmSize, size=self.scmSize, removeOffset=0xf0000000 - 0x400000*self.cid, id=2)
                        coreXbar.getPort('out').mapTo(port=l1ts.getPort('in'), base=(1<<20), size=l1Size-self.scmSize, removeOffset=(1<<20)+0xf0000000 - 0x400000*self.cid, id=0)
                        coreXbar.getPort('out').mapTo(port=l1ts.getPort('in'), base=l1Size-self.scmSize+(1<<20), size=self.scmSize, removeOffset=(1<<20)+0xf0000000 - 0x400000*self.cid, id=2)
                        coreXbar.getPort('out').mapTo(base=0x00204400, size=0x00000400, removeOffset=0x00204400, port=dma.getPort('in%d' % (coreId)))
                
            
            coreXbar.getPort('out').mapTo(port=xbar.getPort('in'), id=1)
            if hasAlias:
                if self.version == 7: coreXbar.getPort('out').mapTo(port=xbar.getPort('in'), id=1, base=0x1b200000, size=0x00200000, removeOffset=0x0b000000 - 0x400000*self.cid)
                else: coreXbar.getPort('out').mapTo(port=xbar.getPort('in'), id=1, base=0x00200000, size=0x00200000, removeOffset=0xf0000000 - 0x400000*self.cid)
            pe.getPort('extCount0').linkTo(coreXbar.getPort('nbRead1')) # Number of external loads
            pe.getPort('extCount1').linkTo(coreXbar.getPort('nbWrite1')) # Number of external writes
            pe.getPort('extCount2').linkTo(coreXbar.getPort('readStallCycles1')) # Stall cycles due to external loads
            pe.getPort('extCount3').linkTo(coreXbar.getPort('writeStallCycles1')) # Stall cycles due to external writes
            pe.getPort('extCount4').linkTo(coreXbar.getPort('stallCycles0')) # Stall cycles due to L1 sram contentions
            pe.getPort('extCount4').linkTo(coreXbar.getPort('stallCycles2')) # Stall cycles due to L1 scm contentions
            pe.getPort('extCount5').linkTo(coreXbar.getPort('nbAccess0')) # Number of accesses to SRAM
            pe.getPort('extCount6').linkTo(coreXbar.getPort('nbAccess2')) # Number of accesses to SCM

            pe.getPort('dataOut').linkTo(coreXbar.getPort('in'))
            pe.getPort('fetchOut').linkTo(pcache.getPort('in%d' % coreId))

            eoc.getPort('fetch%d' % (coreId)).linkTo(pe.getPort('fetch'))
            eoc.getPort('bootAddr%d' % (coreId)).linkTo(pe.getPort('bootAddr'))
            #evt.linkClockTo(bit=coreId, port=pe.getPort('clock'))
            ckg.getPort('clock%d' % (coreId)).linkTo(pe.getPort('clock'))
            if euVersion == 3:
                ckg.getPort('sleep%d' % (coreId)).linkTo(pe.getPort('sleep'))

            if dmaVersion == 1:
                dma.getPort('irq%d'%(coreId)).linkTo(ckg.getPort('irq%d_8'%(coreId)))
            elif dmaVersion == 2:
                dma.getPort('irq%d'%(coreId)).linkTo(ckg.getPort('irq%d_16'%(coreId)))
                dma.getPort('irq16').linkTo(ckg.getPort('irq%d_17'%(coreId)))
            elif dmaVersion <= 5:
                dma.getPort('irq%d'%(coreId)).linkTo(ckg.getPort('irq%d_8'%(coreId)))
            else:
                dma.getPort('irq%d'%(coreId)).linkTo(ckg.getPort('irq%d_9'%(coreId)))
                dma.getPort('event%d'%(coreId)).linkTo(ckg.getPort('irq%d_8'%(coreId)))

            # TODO this seems to be 15 on pulp-dev
            if hwceConf.get('version') >= 4:
                conv.getPort('irq').linkTo(ckg.getPort('irq%d_15'%(coreId)))
            else:
                conv.getPort('irq').linkTo(ckg.getPort('irq%d_17'%(coreId)))

            if euVersion == 3:
                ckg.getPort('irqs_pe%d' % coreId).linkTo(pe.getPort('irqs'))
            else:
                for irq in range(0, 32):
                    ckg.getPort('irq%d_pe%d' % (irq, coreId)).linkTo(pe.getPort('irq%d' % (irq)))

            if self.jtag:
                jtag.getPort('cpuCtrl%d' % (coreId)).linkTo(pe.getPort('ctrl'))

            # SPI interrupts
            self.getPort('spiIrq0').linkTo(ckg.getPort('irq%d_10'%(coreId)))
            self.getPort('spiIrq1').linkTo(ckg.getPort('irq%d_11'%(coreId)))

            self.getPort('cam').linkTo(ckg.getPort('irq%d_31'%(coreId)))

            if euVersion == 3:
                self.getPort('barrierEvt').linkTo(ckg.getPort('irq%d_30' % (coreId)))
                self.getPort('lockEvt').linkTo(ckg.getPort('irq%d_29' % (coreId)))
                self.getPort('triggerEvt').linkTo(ckg.getPort('irq%d_28' % (coreId)))
            else:
                self.getPort('udma0').linkTo(ckg.getPort('irq%d_%d'%(coreId, self.clusterConfig.irqs['udma0'])))
                self.getPort('udma1').linkTo(ckg.getPort('irq%d_%d'%(coreId, self.clusterConfig.irqs['udma1'])))
                self.getPort('udma2').linkTo(ckg.getPort('irq%d_%d'%(coreId, self.clusterConfig.irqs['udma2'])))
                self.getPort('udma3').linkTo(ckg.getPort('irq%d_%d'%(coreId, self.clusterConfig.irqs['udma3'])))
                self.getPort('udma4').linkTo(ckg.getPort('irq%d_%d'%(coreId, self.clusterConfig.irqs['udma4'])))
                self.getPort('udma5').linkTo(ckg.getPort('irq%d_%d'%(coreId, self.clusterConfig.irqs['udma5'])))
                self.getPort('udma6').linkTo(ckg.getPort('irq%d_%d'%(coreId, self.clusterConfig.irqs['udma6'])))
                self.getPort('udma7').linkTo(ckg.getPort('irq%d_%d'%(coreId, self.clusterConfig.irqs['udma7'])))

            if timerVersion == 1:  
                timer.getPort('evt0').linkTo(ckg.getPort('irq%d_4'%(coreId)))
                timer.getPort('evt1').linkTo(ckg.getPort('irq%d_5'%(coreId)))
                timer.getPort('evt2').linkTo(ckg.getPort('irq%d_6'%(coreId)))
                timer.getPort('evt3').linkTo(ckg.getPort('irq%d_7'%(coreId)))
            else:
                timer.getPort('irq0').linkTo(ckg.getPort('irq%d_10'%(coreId)))
                timer.getPort('irq1').linkTo(ckg.getPort('irq%d_11'%(coreId)))

            # Debug unit
            dbgUnitBase = self.clusterBase + 0x00300000 + 0x00008000*coreId
            xbar.getPort('out').mapTo(base=dbgUnitBase, size=0x00008000, removeOffset=dbgUnitBase, port=pe.getPort('debug'))

            pe.getPort('debugStallOut').linkTo(eoc.getPort('debugStallIn%d' % coreId))
            eoc.getPort('debugStallOut%s' % coreId).linkTo(pe.getPort('debugStallIn'))
            eoc.getPort('debugContinue%s' % coreId).linkTo(pe.getPort('debugContinue'))

        if euVersion == 3:
            self.getPort('udma').linkTo(ckg.getPort('socEvent'))

        for i in range(0, self.nbFcEvents):
            self.getPort('fcEvent%d' % (i)).linkTo(ckg.getPort('socEvent%d'%(32+i)))


        # Interconnects
        l1Xbar.getPort('out').mapTo(port=xbar.getPort('in'))

        hwPeBase = periphBase + 0x0009000
        hwPeSize = 0x00000100
        for hwpe in self.getOption('hwpes'):
            if hwpe == 'adder':
                hwpeComp = self.newComp(className=hwpes.Adder.Adder, compName='adder')
                xbar.getPort('out').mapTo(base=hwPeBase, size=hwPeSize, removeOffset=hwPeBase, port=hwpeComp.getPort('in'))
                
            elif hwpe == 'conv':
                hwpeComp = self.newComp(className=hwpes.Conv.Conv, compName='conv')
                xbar.getPort('out').mapTo(base=hwPeBase, size=hwPeSize, removeOffset=hwPeBase, port=hwpeComp.getPort('in'))
                # TODO should be connected to L1 interco
                hwpeComp.getPort("memPort0").linkTo(xbar.getPort('in'))
                hwpeComp.getPort("memPort1").linkTo(xbar.getPort('in'))
                hwpeComp.getPort("memPort2").linkTo(xbar.getPort('in'))
                
            else:
                raise NameError('Unknown HW PE: ' + hwpe)
                

            hwPeBase += hwPeSize

        cgraBase = periphBase + 0x0010000
        cgraSize = 0x00200000
        cgraId = 0
        for cgraFile in self.getOption('cgra'):
            comp = self.newComp(className=cgra.Cgra.Cgra, compName='cgra_%d' % cgraId, confFile=cgraFile)
            xbar.getPort('out').mapTo(base=cgraBase, size=cgraSize, removeOffset=cgraBase, port=comp.getPort('in'))
            cgraId += 1
