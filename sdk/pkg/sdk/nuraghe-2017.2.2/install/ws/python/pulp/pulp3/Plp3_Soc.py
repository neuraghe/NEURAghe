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
import mem.memory
import misc.loader.gv_loader
import misc.other.clock
import misc.cam.cam
import pulp.pulp3.Plp3_Fabric
import pulp.pulp3.Plp3_Fc
import pulp.pulp3.plp3_debug
from pulp.pulp3.MemoryMap import *
import time
import ico.i2sFile
import configs.pulp.PulpConfig as pulpConfig
import pulp.pulp3.Gtkwave as gtkwave

# TODO this should come from a class inherited from pulpConfig
import pulp.udma_v1
import pulp.udma_v2
import hwce.hwce_v3
import hwce.hwce_v4
import pulp.apb_soc_v1
import pulp.apb_soc_v2
import power.pmu
import analog.adc
import pulp.pulp3.plp3_icache_v1
import pulp.pulp3.plp3_icache_v2
import pulp.gpio_v2


class Plp3_Soc(gv.Module):

    l1Size = 256*1024
    l2Size = 1024*1024
    jtag = False
    l3BandWidth = 8
    l3Size = 256*1024*1024
    l3Base = 0x80000000
    l3Latency = 100
    power = False

    def __init__(self, *args, **kwargs):
        super(Plp3_Soc, self).__init__(*args, **kwargs)

    def build(self):
        
        parser = self.config.getParser()
        self.addOption("--gtkw", dest="gtkw", action='store_true', default=False, help='generate script for gtkwave')
        self.addOption("--load-binary", dest="binaries", action='append', help='specify a binary to be loaded', metavar="PATH")
        self.addOption("--boot-binary", dest="bootBinary", default=None, help='specify a boot binary to be loaded', metavar="PATH")
                
        self.addOption("--l3-bandwidth", dest="l3BandWidth", help='specify cluster bandwidth to L3. Default: %(default)s bytes/s.', metavar="BANDWIDTH", default="8")

        self.addOption("--l3-latency", dest="l3Latency", help='specify cluster latency to L3. Default: %(default)s cycles.', metavar="LATENCY", default="100")

        self.addOption("--flash-stimuli", dest="flashStimuli", default=None, help='specify flash stimuli file', metavar="PATH")

        self.addOption("--i2s-0", dest="i2s0", default=None, help='specify an I2S stream for channel 0', metavar="PATH")
        self.addOption("--i2s-1", dest="i2s1", default=None, help='specify an I2S stream for channel 1', metavar="PATH")
        self.addOption("--i2s-2", dest="i2s2", default=None, help='specify an I2S stream for channel 2', metavar="PATH")
        self.addOption("--i2s-3", dest="i2s3", default=None, help='specify an I2S stream for channel 3', metavar="PATH")

        self.addOption("--soc", dest="soc", default='sa', choices=['sa', 'full'], help='specify the soc to be simulated. Default: %(default)s."', metavar="PATH")
        self.addOption("--pulp-chip-version", dest="chipVersion", default=0, type=int, help='specify the version of the chip. Default: %(default)s."', metavar="PATH")
        self.addOption("--use-chip", dest="useChip", action="store_true", help='Simulate the real chip (e.g. boot from boot ROM)')
        self.addOption("--pulpCoreArchi", dest="pulpCoreArchi", default=None, help='specify the core architecture in the cluster')
        self.addOption("--config", dest="config", default=None, help='specify the system configuration')
        self.addOption("--flash", dest="flash", default=None, help='specify flash raw data file')
            
        self.addOption("--debug", dest="debug", action="store_true", default=False, help='activate debug unit. Default: %(default)s.')
        self.addOption("--gdb-port", dest="rspPort", default=1234, type=int, help='Specify socket port where gdb can connect. Default: %(default)s.')
        self.addOption("--debug-bridge", dest="externalBridge", action="store_true", default=False, help='use external bridge for debug. Default: %(default)s.')
        
        self.addOption("--l3-size", dest="l3Size", type=int, default=1*1024*1024, help='specify the size of the L3 memory. Default: %(default)s.').bindToProperty(compName='soc', propertyName='l3Size')
        self.kcgOption = self.addOption("--kcg", dest="kcg", default=None, help='Activate PC analysis through kcachegrind for the specified path')
        self.tvOption = self.addOption("--tv", dest="tv", action="store_true", default=False, help='Activate traceview')
        self.addOption("--power", dest="power", action="store_true", default=False, help='Activate power traces').bindToProperty(compName='soc', propertyName='power')
        self.addOption("--tv-event", dest="tvEvents", action="append", help='Specify a traceview user event')
        self.addOption("--pad-loopback", default=[], dest="padLoopbacks", action="append", help='Specify a loopback between pads. Must be equal to <pad0>:<pad1>')
        self.config.args = self.config.getParser().parse_known_args()[0]

        classes = {
          'udma' : { 
            1 : pulp.udma_v1.Udma,
            2 : pulp.udma_v2.Udma,
          },
          'hwce' : {
            3 : hwce.hwce_v3.Hwce,
            4 : hwce.hwce_v4.Hwce,
          },
          'apb_soc' : {
            1 : pulp.apb_soc_v1.Apb_soc,
            2 : pulp.apb_soc_v2.Apb_soc,
          },
          'adc' : {
            1 : analog.adc.Adc,
          },
          'pmu' : {
            1 : power.pmu.Pmu,
          },
          'icache_ctrl' : {
            1 : pulp.pulp3.plp3_icache_v1.Plp3_icache,
            2 : pulp.pulp3.plp3_icache_v2.Plp3_icache,
          },
          'gpio' : {
            2 : pulp.gpio_v2.Gpio,
          },
        }

        self.fabricConfig = pulpConfig.getConfigFromString(self.getOption('fabricArchi'), decorators={'classes' : classes})

        hasL3=self.config.args.soc == 'full'
        self.hasFc=self.config.args.soc == 'full'
        self.binaries = self.config.args.binaries

        if self.getOption('useChip'):
            flashStimulus = 'flash_stim.slm'
        else:
            flashStimulus = None

        if self.getOption('flashStimuli') != None:
            flashStimulus = self.getOption('flashStimuli')

        self.loadBinaries = []
        if self.getOption('useChip'):
            if self.getOption('bootBinary') != None:
                self.loadBinaries = [self.getOption('bootBinary')]
        else:
            self.binariesMaskList = []
            if self.binaries != None:
                for binary in self.binaries:
                    name = binary.split(':')[0]
                    maskList = binary.split(':')[1]
                    self.loadBinaries.append(name)
                    self.binariesMaskList.append(maskList)


        if self.getOption('gtkw'):
            vcdFilesOpt = self.getOption('vcdFiles')
            if vcdFilesOpt == None: vcdFilesOpt = ['all.vcd:/']
            vcdFiles = []
            for vcdFile in vcdFilesOpt:
                vcdFiles.append('%s/%s' % (os.getcwd(), vcdFile.split(':')[0]))
            gtkwave.genScript(self.fabricConfig, 'wave.gtkw', os.environ.get('PULP_SDK_HOME') + '/install/ws/ref/wave.gtkw.template', vcdFiles)

            for binary in self.loadBinaries:
                os.system('pulp-pc-info --file %s --all-file %s' % (binary, binary + '.debugInfo'))

            print ('Generated gtkwave script that can be opened with following command:')
            print ('  gtkwave %s/%s' % (os.getcwd(), 'wave.gtkw'))
            print ('')

        # Clock domain for SoC interconnects
        clockDomain = self.newComp(className=gv.ClockEngine, compName='icoClock', frequency=100000000)
        
        fabric = self.newComp(className=pulp.pulp3.Plp3_Fabric.Plp3_Fabric, compName='fabric', l1Size=self.l1Size, l2Size=self.l2Size, jtag=self.jtag, version=self.getOption('fabricArchi'), flashData=self.getOption('flash'), flashStimulus=flashStimulus, chipVersion=self.getOption('chipVersion'), power=self.power, binaries=self.loadBinaries, pulpConfig=self.fabricConfig)
        self.fabric = fabric

        for loopback in self.getOption('padLoopbacks'):
            pad0, pad1 = loopback.split(':')
            fabric.getPort('pad_out_%d' % int(pad0)).linkTo(fabric.getPort('pad_in_%d' % int(pad1)))
            fabric.getPort('pad_out_%d' % int(pad1)).linkTo(fabric.getPort('pad_in_%d' % int(pad0)))

        noc = self.newComp(clock=clockDomain, className=ico.gv_router.Gv_router, compName='noc', widthBits=3)
        clusterNoc = self.newComp(clock=clockDomain, className=ico.gv_router.Gv_router, compName='clusterNoc', widthBits=3, bandwidth=float(self.l3BandWidth))

        fabric.getPort('outLl').linkTo(noc.getPort('in'))
        fabric.getPort('out').linkTo(clusterNoc.getPort('in'))
        noc.getPort('out').mapTo(port=fabric.getPort('in'), base=0x00000000, size=0x80000000)
        clusterNoc.getPort('out').mapTo(port=noc.getPort('in'))

        clockDomain = self.newComp(className=gv.ClockEngine, compName='extClock', frequency=32000)
        refClock = self.newComp(clock=clockDomain, className=misc.other.clock.Clock, compName='refClock', frequency=1)
        refClock.getPort('clock').linkTo(fabric.getPort('refClock'))

        # Fabric controller
        if self.hasFc:
            fcClockDomain = self.newComp(className=gv.ClockEngine, compName='fcClock', frequency=100000000)
            fc = self.newComp(className=pulp.pulp3.Plp3_Fc.Plp3_Fc, compName='fc', clusterId=16, clock=fcClockDomain, binaries=self.loadBinaries)
            noc.getPort('out').mapTo(base=0x50000000, size=0x00400000, port=fc.getPort('in'))
            fc.getPort('out').linkTo(noc.getPort('in'))
            fc.getPort('spim').linkTo(fabric.getPort('spis'))

        if hasL3:
            l3ClockDomain = self.newComp(className=gv.ClockEngine, compName='l3Clock', frequency=100000000)
            l3 = self.newComp(clock=l3ClockDomain, className=mem.memory.Memory, compName='l3', size=self.l3Size)
            noc.getPort('out').mapTo(port=l3.getPort('in'), base=self.l3Base, size=self.l3Size, removeOffset=self.l3Base)
            clusterNoc.getPort('out').mapTo(port=l3.getPort('in'), base=self.l3Base, size=self.l3Size, removeOffset=self.l3Base, latency=int(self.l3Latency))

        if self.binaries != None:
            # Binary loader
            self.loader = self.newComp(clock=clockDomain, className=misc.loader.gv_loader.Loader, compName='loader')
            self.loader.getPort('out').linkTo(noc.getPort('in'))

        if self.getOption('debug'):
            debug = self.newComp(className=pulp.pulp3.plp3_debug.Plp3_debug, compName='debug', clock=clockDomain, useInternalBridge=not self.getOption('externalBridge'), rspPort=self.getOption('rspPort'))
            debug.getPort('out').linkTo(noc.getPort('in'))

    def fetchCluster(self, cluster, mask):
        if self.getOption('useChip'):
            self.loader.ioAccess(getCluster(cluster).periph.eoc.fetch, 1)
        else:
            self.loader.ioAccess(getCluster(cluster).periph.eoc.fetch, mask & 0x7FFFFFFF)
        

    def load(self):
        
        for binary in self.loadBinaries:
            if self.loader.loadBinary(binary): self.raiseError('Unable to load binary')


        if self.getOption('useChip'):
            self.fetchCluster(0, 0)
        else:
                for maskList in self.binariesMaskList:

                    if self.getOption('fabricArchi') == 'GAP' or self.getOption('fabricArchi') == 'wolfe':
                        self.loader.ioAccess(0x1B200008, 0x1)
                    else:
                        for mask in maskList.split(','):
                            if mask.find('@') != -1:
                                mask, cluster = mask.split('@')
                                cluster = int(cluster)
                            else:
                                cluster = -1
    
                            mask = int(mask,0)
    
                            if self.hasFc and (mask >> 31) != 0:
                                # If FC should start fetching, generate an access to FC EOC
                                self.loader.ioAccess(0x50200008, 0x1)
    
                            if cluster == -1:
                                for cluster in range(0, self.fabric.nbClusters):
                                    self.fetchCluster(cluster, mask)
                            else:
                                self.fetchCluster(cluster, mask)
             
    def start(self):
        if self.getOption('useChip'):
            binary = self.binaries[0].split(':')[0]
            s19Binary = '%s.s19' % (os.path.basename(binary))
            if os.system("or1kle-elf-objcopy --srec-len 1 --output-target=srec %s %s" % (binary, s19Binary)) != 0: return -1
            if os.system("s19toslm-new.py %s" % (s19Binary)) != 0: return -1


        if self.getOption('kcg') != None:
            if os.system("rm -f pcTraceFifo") != 0: return -1
            if os.system("mkfifo pcTraceFifo") != 0: return -1
            opt = ''
            isRiscv = self.getOption('pulpCoreArchi').find('riscv') != -1 or self.getOption('pulpCoreArchi').find('ri5cy') != -1
            if isRiscv: opt = '--riscv'

            if os.system("pulp-pc-analyze --bin-input=./pcTraceFifo --binary=%s %s &" % (self.binaries[0].split(':')[0], opt)) != 0: return -1
            #self.kcgOption.bindToProperty(className='Or1k', propertyName='dumpPc', path=self.getOption('kcg'))
            if self.getOption('kcg') != None:
                prop = self.config.setProperty(propertyName='dumpInstrTrace', path=self.getOption('kcg'), value=1)
                self.applyProperty(prop)

        if self.getOption('tv'):
            if os.system("rm -f traceFifo") != 0: return -1
            if os.system("mkfifo traceFifo") != 0: return -1

            cmd = "pulp-trace-analyzer --config=%s --file=./traceFifo --tv=./tvDump" % (self.getOption('config'))

            if self.getOption('tvEvents') != None:
                for event in self.getOption('tvEvents'):
                    cmd += " --user-event=%s" % (event)

            if os.system(cmd + ' &') != 0: return -1
            self.tvOption.bindToProperty(className='Trace', propertyName='dumpTrace')

        super(Plp3_Soc, self).start()

    def close(self):
        # TODO find a way to avoid having to call parent close
        super(Plp3_Soc, self).close()
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

class Plp3_Top(gv.Engine):

    def build(self, *args, **kwargs):

        self.addOption("--iss-trace", dest="issTrace", action="store_true", help='generate assembly traces of the ISS execution. One file is generated for each processor. Each file is named trace[clusterId]_[coreId]. Each file contains the assembly code executed on the processor and the content of each accessed resource.').bindToProperty(className='Or1k', propertyName='issTrace')

        self.config.setProperty(className='Or1k', propertyName='or1ksimLibPath', value=os.path.join(os.environ['WORKSTATION_PKG'], 'or10n_64', 'lib', 'libsim.so'))
        
        soc = self.newComp(pulp.pulp3.Plp3_Soc.Plp3_Soc, 'soc', *args, **kwargs)

        self.soc = soc


    def start(self):
        # TODO should remove this
        self.soc.start()
        self.soc.reset()
        self.soc.load()

            
