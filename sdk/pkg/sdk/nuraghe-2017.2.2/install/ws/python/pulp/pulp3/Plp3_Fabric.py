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

import pulp.pulp3.Plp3_Cluster
import gv
import ico.gv_router
import ico.spiMaster
import ico.spiSlave
import mem.memory
import mem.spiFlash
import misc.trace
import pulp.padframe
import pulp.pulp3.plp3_cvp
import pulp.pulp3.plp_eu_soc_v3
import pulp.pulp3.plp3_stdout_v1
import pulp.pulp3.plp3_stdout_v2
import pulp.pulp3.plp3_stdout_v3
import ico.uart
import pulp.pulp3.Plp_Fc
import pulp.pulp3.plp3_fc_evtGen
import analog.adc
import analog.adc_spi
import sec.mpu
import periph.cam_ov7670
try:
    import gap.lvds
except:
    pass

class Plp3_Fabric(gv.Module):

    nbClusters = 1
    nbPes = 4
    l1Size = 256*1024
    l2Size = 256*1024
    jtag=False
    version="MiaWallace"
    hasSpi=True
    clusterFrequency = 100000000
    l2BandWidth = 4
    l2Latency = 5
    flashStimulus = None
    chipVersion = 0
    power = False
    flashData = None
    binaries = []
    pulpConfig = None

    def build(self):

        self.addOption("--rom-size", dest="romSize", type=int, default=1024, help='specify the size of the boot ROM. Default: %(default)s.').bindToProperty(compName='fabric', propertyName='romSize')
        self.addOption("--l2-size", dest="l2Size", type=int, default=64*1024, help='specify the size of the L2 memory. Default: %(default)s.').bindToProperty(compName='fabric', propertyName='l2Size')
        self.addOption("--l2-bandwidth", dest="l2BandWidth", help='specify cluster bandwidth to L2. Default: %(default)s bytes/s.', metavar="BANDWIDTH", default="4").bindToProperty(compName='fabric', propertyName='l2BandWidth')
        self.addOption("--l2-latency", dest="l2Latency", help='specify cluster latency to L2. Default: %(default)s cycles.', metavar="LATENCY", default="5").bindToProperty(compName='fabric', propertyName='l2Latency')
        self.addOption("--nb-pe", dest="nbCores", type=int, default=4, help='specify the number of cores per cluster. Default: %(default)s.').bindToProperty(compName='fabric', propertyName='nbPes')
        self.addOption("--nb-clusters", dest="nbClusters", type=int, default=1, help='specify the number of clusters. Default: %(default)s.').bindToProperty(compName='fabric', propertyName='nbClusters')
        self.addOption("--stdout-to-file", dest="stdoutToFile", action="store_true", help='Also dump the stdout to files in case stdout device is used')
        self.addOption("--stdout-prefix", dest="stdoutPrefix", action="store_true", default=False, help='Add prefix to stdout')
        self.addOption("--uart-loopback", dest="uartLoopback", action="store_true", default=False, help='Activate UART loopback')
        self.addOption("--adc", dest="adc", default=[], action="append", help='Specifies ADC input file with format channel:fileName')
        self.addOption("--periph-dump", dest="periphDump", default=[], action="append", help='Specifies UDMA periph to dump to file')
        self.addOption("--uart-file", dest="uartFile", default=None, help='Dump uart output to file')
        
        self.addOption("--camera", dest="cameraList", default=[], action="append", help='specify an image stream for the camera', metavar="PATH")

        if self.version == 'GAP':
            self.addOption("--lvds-in", dest="lvdsIn", default=None, help='Specifies LVDS input file')
            self.addOption("--lvds-out", dest="lvdsOut", default='osig_file', help='Specifies LVDS output file')

        # The SOC camera device is broadcasting end-of-transfer interrupts here
        self.newPort('cam')

        self.newPort('refClock')
        clusters = []

        maxNbClusters = 32

        # Set default properties
        l2Base = 0x1c000000
        clusterAreaBase = 0x10000000
        clusterAreaSize = 0x00400000
        romBoot = self.getOption('useChip')
        romBootAddr = 0x1A000000
        bootAddr = 0x1c000000

        # Checkings
        if self.nbClusters > maxNbClusters:
            raise Exception('Invalid number of clusters specified (%d), cannot be above %d' % (self.nbClusters, maxNbClusters))

        hasBootRom = False
        hasFc = False
        hasLvds = False
        config = self.pulpConfig
        if self.version == 'mia':
            clusterVersion = 2
        elif self.version == 'pulp3' or self.version == 'nuraghe':
            clusterVersion = 2
        elif self.version == 'pulpevo':
            clusterVersion = 3
        elif self.version == 'honey':
            clusterVersion = 4
        elif self.version == 'pulp4' or self.version == 'exaconv':
            clusterVersion = 8
            hasBootRom = True
        elif self.version == 'GAP':
            clusterVersion = 8
            hasBootRom = True
            hasFc = True
            hasLvds = True
            nbFcEventsIn = 8
        elif self.version == 'wolfe':
            clusterVersion = 8
            hasBootRom = True
            hasFc = True
            nbFcEventsIn = 8
        elif self.version == 'fulmine':
            clusterVersion = 6
            hasBootRom = True
        elif self.version == 'vivosoc2':
            clusterVersion = 6
            hasBootRom = True
        elif self.version == 'bigpulp':
            clusterVersion = 7
            hasBootRom = False
        else:    
            raise Exception('Unknown Pulp chip: %s' % (self.version))

        # Blocks class selection
        if clusterVersion >= 8:
            stdoutClass = pulp.pulp3.plp3_stdout_v3.Plp3_stdout
        elif clusterVersion >= 3:
            stdoutClass = pulp.pulp3.plp3_stdout_v2.Plp3_stdout
        else:
            stdoutClass = pulp.pulp3.plp3_stdout_v1.Plp3_stdout

        hasEu = self.chipVersion == 100

        # Memory map selection
        
        
        # Ports
        self.newPort('out')
        self.newPort('outLl')
        self.newPort('in')
        self.newPort('spis')

        # Clock domain for fabric interconnects
        clockDomain = self.newComp(className=gv.ClockEngine, compName='icoClock', frequency=100000000)
        
        # Padframe
        socConf = config.soc
        padframeConf = socConf.get('padframe')
        nbPads = 0
        if padframeConf != None: 
            nbPads = padframeConf.nbPads
            padframe = self.newComp(className=pulp.padframe.Padframe, compName='padframe', clock=clockDomain, padConfig=padframeConf, topComp=self)

        # Fabric network-on-chip
        noc = self.newComp(className=ico.gv_router.Gv_router, compName='noc', widthBits=3, clock=clockDomain, bandwidth=float(self.l2BandWidth))

        # L2 memory
        # L2 has its own clock domain
        l2ClockDomain = self.newComp(className=gv.ClockEngine, compName='l2Clock', frequency=100000000)
        l2 = self.newComp(className=mem.memory.Memory, compName='l2', size=self.l2Size, clock=l2ClockDomain)
        
        if hasFc:
            fcClockDomain = self.newComp(className=gv.ClockEngine, compName='fcClock', frequency=100000000)

        if hasFc:
            mpu = self.newComp(className=sec.mpu.Mpu, compName='l2_mpu', removeOffset=l2Base, clock=fcClockDomain, nbEntries=8, offset0=l2Base)
            noc.getPort('out').mapTo(base=l2Base, size=self.l2Size, latency=int(self.l2Latency), port=mpu.getPort('dataIn'))
            mpu.getPort('dataOut').linkTo(port=l2.getPort('in'))
        else:
            noc.getPort('out').mapTo(base=l2Base, size=self.l2Size, removeOffset=l2Base, latency=int(self.l2Latency), port=l2.getPort('in'))

        # CVP peripheral
        cvp = self.newComp(className=pulp.pulp3.plp3_cvp.Plp3_cvp, compName='cvp', clock=l2ClockDomain)
        noc.getPort('out').mapTo(base=0x1A100000, size=0x00001000, removeOffset=0x1A100000, port=cvp.getPort('in'))

        # STDOUT peripheral
        stdout = self.newComp(className=stdoutClass, compName='stdout', clock=l2ClockDomain, stdoutToFile=self.getOption('stdoutToFile'), stdoutPrefix=self.getOption('stdoutPrefix'))
        if self.version == 'nuraghe':
            noc.getPort('out').mapTo(base=0x1A111030, size=0x00010000, removeOffset=0x1A111030, port=stdout.getPort('in'))
        else:
            noc.getPort('out').mapTo(base=0x1A110000, size=0x00010000, removeOffset=0x1A110000, port=stdout.getPort('in'))

        # Clusters
        for cid in range(0, self.nbClusters):
            clusterBase = clusterAreaBase + cid * clusterAreaSize
            clusterClockDomain = self.newComp(className=gv.ClockEngine, compName='clusterClock', frequency=self.clusterFrequency)   
            cluster = self.newComp(clock=clusterClockDomain, className=pulp.pulp3.Plp3_Cluster.Plp3_Cluster, compName="cluster%d" % (cid), cid=cid, clusterBase=clusterBase, clusterSize=clusterAreaSize, nbPes=self.nbPes, l1Size=self.l1Size, jtag=self.jtag, version=clusterVersion, bootAddr=bootAddr, romBootAddr=romBootAddr, romBoot=romBoot, chipVersion=self.chipVersion, power=self.power, binaries=self.binaries, clusterConfig=self.pulpConfig.clusters[0])
            noc.getPort('out').mapTo(base=clusterBase, size=clusterAreaSize, port=cluster.getPort('in'))
            cluster.getPort('out').linkTo(port=noc.getPort('in'))
            clusters.append(cluster)

        if hasFc:
            fc = self.newComp(className=pulp.pulp3.Plp_Fc.Plp_Fc, compName='fc', clock=fcClockDomain)
            fc.getPort('secure').linkTo(mpu.getPort('secure'))
            noc.getPort('out').mapTo(base=0x1B000000, size=0x00400000, port=fc.getPort('in'))
            fc.getPort('out').linkTo(noc.getPort('in'))
            fcEvtGen = self.newComp(className=pulp.pulp3.plp3_fc_evtGen.Plp3_fc_evtGen, compName='fcEvtGen', clock=l2ClockDomain, nbFcEvents=nbFcEventsIn, firstFcEvent=config.socEu_firstSwEvent, nbClusters=self.nbClusters, refClockEvent=config.socEu_refClock_event)
            noc.getPort('out').mapTo(base=0x1a105000, size=0x1000, removeOffset=0x1a105000, port=fcEvtGen.getPort('in'))
            fcEvtGen.getPort('fcEvent').linkTo(fc.getPort('fcEventIn'))
            for cid in range(0, self.nbClusters):
                fcEvtGen.getPort('clusterEvent%d' % cid).linkTo(clusters[cid].getPort('udma'))
            self.getPort('refClock').linkTo(fcEvtGen.getPort('refClock'))


        # Fabric in/out
        self.getPort('in').linkTo(noc.getPort('in'))
        noc.getPort('out').mapTo(base=0x50000000, size=0x00400000, port=self.getPort('out'))
        noc.getPort('out').mapTo(port=self.getPort('out'), base=0x80000000, size=0x80000000-1)

        # APB SOC
        apbConf = config.soc.get('apb_soc')
        if apbConf != None:
            apbSoc = self.newComp(compName='apb_soc', clock=l2ClockDomain, nbCores=self.nbPes, nbClusters=self.nbClusters, nbPads=nbPads, **apbConf.getModelProps())
            noc.getPort('out').mapTo(port=apbSoc.getPort('in'), base=config.soc_apb_base, size=0x1000, removeOffset=config.soc_apb_base)

            if padframeConf != None:
                for i in range(0, nbPads):
                    apbSoc.getPort('pad_fun_%d' % i).linkTo(padframe.getPort('pad_fun_%d' % i))
                    apbSoc.getPort('pad_cfg_%d' % i).linkTo(padframe.getPort('pad_cfg_%d' % i))


        # GPIOs
        gpioConf = config.soc.get('gpio')
        if gpioConf != None:
            gpio = self.newComp(compName='gpio', clock=l2ClockDomain, event=config.socEu_gpio_event, **gpioConf.getModelProps())
            noc.getPort('out').mapTo(base=gpioConf.map.base, size=gpioConf.map.size, removeOffset=gpioConf.map.base, port=gpio.getPort('in'))
            if hasFc:
                gpio.getPort('irq').linkTo(fcEvtGen.getPort('evtIn'))
            if padframeConf != None:
                for i in range(0, gpioConf.get('nbGpios')):
                    gpioPad = padframe.getPad('gpio%d'%i)
                    gpio.getPort('pad_dir_%d' % i).linkTo(padframe.getPort('pad_dir_%d'%gpioPad))
                    gpio.getPort('pad_out_%d' % i).linkTo(padframe.getPort(padframe.getPadOut('gpio%d'%i)))
                    padframe.getPort(padframe.getPadIn('gpio%d'%i)).linkTo(gpio.getPort('pad_in_%d' % i))
        else:
            gpio = self.newComp(className=mem.memory.Memory, compName='gpio', size=0x1000, clock=l2ClockDomain, check=False)
            noc.getPort('out').mapTo(base=0x1A101000, size=0x00001000, removeOffset=0x1A101000, port=gpio.getPort('in'))

        # Trace unit (dummy device)
        trace = self.newComp(className=misc.trace.Trace, compName='trace', clock=l2ClockDomain)
        noc.getPort('out').mapTo(base=0x1A120000, size=0x00001000, removeOffset=0x1A120000, port=trace.getPort('in'))

        # Micro DMA
        udmaConf = config.soc.get('udma')
        if udmaConf != None:
            udma = self.newComp(clock=clockDomain, compName='udma', targetBase=l2Base, targetSize=self.l2Size, **udmaConf.getModelProps())

            udma.createUartPeriph("uartRx", udmaConf.get('uartRxEvt'), "uartTx", udmaConf.get('uartTxEvt'), udmaConf.get('uart_offset'))

            if udmaConf.get('hasTcdmChannel'):
                udma.createTcdmPeriph("tcdmRx", udmaConf.get('tcdmRxEvt'), "tcdmTx", udmaConf.get('tcdmTxEvt'), udmaConf.get('tcdm_offset'))

            if udmaConf.get('nbI2cChannels') != None:
                for i in range(0, udmaConf.get('nbI2cChannels')):
                    udma.createI2cPeriph("i2c%dRx" % i, udmaConf.get('i2c%dRxEvt' % i), "i2c%dTx" % i, udmaConf.get('i2c%dTxEvt' % i), udmaConf.get('i2c%d_offset' % i))

            if udmaConf.get('nbSpimChannels') != None:
                for i in range(0, udmaConf.get('nbSpimChannels')):
                    udma.createSpimPeriph("spim%dRx" % i, udmaConf.get('spim%dRxEvt' % i), "spim%dTx" % i, udmaConf.get('spim%dTxEvt' % i), udmaConf.get('spim%dEotEvt' % i), udmaConf.get('spim%d_offset' % i), 4)

            if udmaConf.get('nbCamChannels') != None:
                for i in range(0, udmaConf.get('nbCamChannels')):
                    udma.createCamPeriph("cam%dRx" % i, udmaConf.get('cam%dEvt' % i), udmaConf.get('cam%dEotEvt' % i), udmaConf.get('cam%d_offset' % i), i)

            if udmaConf.get('version') >= 2:
                udma.createI2sPeriph("i2s", udmaConf.get('i2sCh0Evt'), udmaConf.get('nbI2sChannels'), udmaConf.get('i2s0_offset'))
                    
                if hasLvds:
                    udma.createGenericPeriph("lvds", "lvdsRx", udmaConf.get('lvdsRxEvt'), "lvdsTx", udmaConf.get('lvdsTxEvt'), udmaConf.get('rf_offset'), "lvdsRegs")

            else:
                if config.hasIp('adc'):
                    opt = {}
                    for adcOpt in self.getOption('adc'):
                        ch, name = adcOpt.split(':')
                        opt['input' + ch] = name
    
                    adc = self.newComp(className=analog.adc.Adc, compName='adc', clock=clockDomain, nbChannels=udmaConf.get('nbAdcChannels'), **opt)
                    noc.getPort('out').mapTo(base=config.getMmap('adc').base, size=config.getMmap('adc').size, removeOffset=config.getMmap('adc').base, port=adc.getPort('in'))
                    udma.createAdcPeriph("adc", config.soc.get('udma').get('adcFirstEvt'), udmaConf.get('nbAdcChannels'), config.soc.get('udma').get('adc0_offset'))


            if not config.hasIp('adc') and len(self.getOption('adc')) != 0:
                adc = self.newComp(className=analog.adc_spi.Adc_spi, compName='adc', clock=clockDomain, nbChannels=1)
                for adcOpt in self.getOption('adc'):
                    ch, name = adcOpt.split(':')
                    adc.setChannelInputFile(int(ch), name)


            udma.resyncBuild()

            for periphDump in self.getOption('periphDump'):
                name, path = periphDump.split(':')
                udma.periphDump(name, path)

            if udmaConf.get('nbCamChannels') != None:
                for i in range(0, udmaConf.get('nbCamChannels')):
                    udma.getPort('camOut%d' % i).linkTo(udma.getPort('cam%dRx' % i))

            camStreamList = self.getOption('cameraList')
            camClockDomain = self.newComp(className=gv.ClockEngine, compName='camClock', frequency=1000000)
            for i in range(0, len(camStreamList)):
                camStream = camStreamList[i]
                cam = self.newComp(className=periph.cam_ov7670.Cam, compName='cam', clock=camClockDomain, input=camStream)
                cam.getPort('cpiOut').linkTo(udma.getPort('camOut%d' % i))
                udma.getPort('i2cOut%d' % i).linkTo(cam.getPort('i2cIn'))

            if config.hasIp('adc'):
                for i in range(0, udmaConf.get('nbAdcChannels')):
                    adc.getPort('out%d' % i).linkTo(udma.getPort('adc%d' % i))
            elif len(self.getOption('adc')) != 0:
                udma.getPort('spiOut1').linkTo(adc.getPort('in0'))

            noc.getPort('out').mapTo(port=udma.getPort('in'), base=0x1A102000, size=0x1000, removeOffset=0x1A102000)
            udma.getPort('out').linkTo(noc.getPort('in'))
            i2sClockDomain = self.newComp(className=gv.ClockEngine, compName='i2sClock', frequency=1000000)

            if udmaConf.get('version') >= 2:
                self.addI2sFile(udma, i2sClockDomain, 0, self.getOption('i2s0'))

        pmuConf = config.soc.get('pmu')
        if pmuConf != None:
            pmu = self.newComp(compName='pmu', clock=fcClockDomain, evtNumber=pmuConf.get('pmu0Evt'), **pmuConf.getModelProps())
            noc.getPort('out').mapTo(base= pmuConf.map.base, size=pmuConf.map.size, removeOffset=pmuConf.map.base, port=pmu.getPort('in'))

        if hasFc:
            fcEvtGen.getPort('periphEvent').linkTo(udma.getPort('evtIn'))
            
        if hasEu:
            eu = self.newComp(clock=clockDomain, className=pulp.pulp3.plp_eu_soc_v3.Plp_eu_soc, compName='eu', nbBarriers=self.nbClusters, nbLocks=self.nbClusters, nbTriggers=self.nbClusters, nbClusters=self.nbClusters)
            noc.getPort('out').mapTo(port=eu.getPort('in'), base=0x1A104000, removeOffset=0x1A104000, size=0x1000)
            for cid in range(0, self.nbClusters):
                eu.getPort('barrier%d' % (cid)).linkTo(clusters[cid].getPort('barrierEvt'))
                eu.getPort('lock%d' % (cid)).linkTo(clusters[cid].getPort('lockEvt'))
                eu.getPort('trigger%d' % (cid)).linkTo(clusters[cid].getPort('triggerEvt'))


        # UART
        uartConf = config.soc.get('uart')
        if uartConf != None:
            uartClockDomain = self.newComp(className=gv.ClockEngine, compName='uartClock', frequency=115200)
            uart = self.newComp(clock=uartClockDomain, className=ico.uart.Uart, compName='uart', loopBack=self.getOption('uartLoopback'), dumpFile=self.getOption('uartFile'))
            if udmaConf != None:
                udma.getPort('uartTx').linkTo(uart.getPort('in'))
                uart.getPort('out').linkTo(udma.getPort('uartRx'))
            else:
                noc.getPort('out').mapTo(base=uartConf.map.base, size=uartConf.map.size, removeOffset=uartConf.map.base, port=uart.getPort('regIn'))

        if udmaConf != None:
            spiFlash = self.newComp(className=mem.spiFlash.SpiFlash, compName='spiFlash', clock=l2ClockDomain, stimulus=self.flashStimulus, data=self.flashData)
            udma.getPort('spiOut0').linkTo(spiFlash.getPort('in'))

        # Boot ROM
        if hasBootRom:
            bootRom = self.newComp(className=mem.memory.Memory, compName='bootRom', size=self.romSize, clock=l2ClockDomain)
            noc.getPort('out').mapTo(base=0x1A000000, size=self.romSize, removeOffset=0x1A000000, port=bootRom.getPort('in'))

        # LVDS
        if hasLvds:
            lvdsClockDomain = self.newComp(className=gv.ClockEngine, compName='lvdsClock', frequency=1000000)
            lvds = self.newComp(className=gap.lvds.Lvds, compName='lvds', clock=lvdsClockDomain, input=self.getOption('lvdsIn'), output=self.getOption('lvdsOut'))
            lvds.getPort('lvdsOut').linkTo(udma.getPort('lvdsRx'))
            udma.getPort('lvdsTx').linkTo(lvds.getPort('lvdsIn'))
            udma.getPort('lvdsRegs').linkTo(lvds.getPort('regs'))
            udma.getPort('spiOut1').linkTo(lvds.getPort('spi'))


        # SPI
        if self.hasSpi:
            spiMaster = self.newComp(className=ico.spiMaster.SpiMaster, compName='spiMaster', clock=l2ClockDomain)
            spiSlave = self.newComp(className=ico.spiSlave.SpiSlave, compName='spiSlave', clock=l2ClockDomain)

            noc.getPort('out').mapTo(port=spiMaster.getPort('in'), base=0x1A102000, size=0x1000, removeOffset=0x1A102000)

            spiFlash = self.newComp(className=mem.spiFlash.SpiFlash, compName='spiFlash', clock=l2ClockDomain)

            self.getPort('spis').linkTo(spiSlave.getPort('in'))
            spiMaster.getPort('out0').linkTo(spiFlash.getPort('in'))
            spiSlave.getPort('xbar').linkTo(noc.getPort('in'))
            for cluster in clusters:
                spiMaster.getPort('irq0').linkTo(cluster.getPort('spiIrq0'))
                spiMaster.getPort('irq1').linkTo(cluster.getPort('spiIrq1'))
                self.getPort('cam').linkTo(cluster.getPort('cam'))
                if udmaConf != None:
                    if udmaConf.get('version') >= 2:
                        if not hasFc:
                            udma.getPort('irq').linkTo(cluster.getPort('udma'))
                    else:
                        udma.getPort('irq0').linkTo(cluster.getPort('udma0'))
                        udma.getPort('irq1').linkTo(cluster.getPort('udma1'))
                        udma.getPort('irq2').linkTo(cluster.getPort('udma2'))
                        udma.getPort('irq3').linkTo(cluster.getPort('udma3'))
                        udma.getPort('irq4').linkTo(cluster.getPort('udma4'))
                        udma.getPort('irq5').linkTo(cluster.getPort('udma5'))
                        udma.getPort('irq6').linkTo(cluster.getPort('udma6'))
                        udma.getPort('irq7').linkTo(cluster.getPort('udma7'))

        if hasFc:
            udma.getPort('irq').linkTo(fcEvtGen.getPort('evtIn'))
            pmu.getPort('irq').linkTo(fcEvtGen.getPort('evtIn'))

    def addI2sFile(self, udma, clockDomain, id, path):
        i2s = self.newComp(clock=clockDomain, className=ico.i2sFile.I2SFile, compName='i2sFile', streamPath=path)
        i2s.getPort('out').linkTo(udma.getPort('i2s%d' % id))
        udma.getPort('i2cOut%d' % id).linkTo(i2s.getPort('i2cIn'))
