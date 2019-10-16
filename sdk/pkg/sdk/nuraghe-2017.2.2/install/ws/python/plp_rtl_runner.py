import argparse
from plp_platform import *

import os
import os.path
import shutil
from functools import partial
import struct

def execCmd(cmd):
    print ('Executing command: ' + cmd)
    return os.system(cmd)

class Runner(Platform):

    def __init__(self, config):

        super(Runner, self).__init__(config)
        
        self.rtlLibs = None

        parser = config.getParser()

        parser.add_argument("--gui", dest="gui", default=False, action="store_true",
                            help='Open the GUI instead of launching the simulation')
                        
        parser.add_argument("--vsimCov", dest="vsimCov", default=False, action="store_true",
                            help='Activate Code Coverage feature in Questasim')
                        
        parser.add_argument("--recordWlf", dest="recordWlf", default=False, action="store_true",
                            help='record waveform WLF file during console mode simulation')
                        
        parser.add_argument("--vsim-testname", dest="vsimTestName",
                            help='Specify testname to use for running RTL simulation', default=None)
        
        parser.add_argument("--vsim-do", dest="vsimDo",
                            help='Specify do scripts to use for running RTL simulation (specially to set waveforms to be recorded into wlf file)', default=None)
        
        parser.add_argument("--power", dest="power", default=False, action="store_true",
                            help='Do power estimation')
                        
        parser.add_argument("--vopt", dest="vopt", default=False, action="store_true",
                            help='Use RTL platform compiled with vopt')
                        
        parser.add_argument("--binary", dest="binary",
                            help='specify the binary to be loaded')
                        
        parser.add_argument("--boot-binary", dest="bootBinary", default=None, help='specify a boot binary to be loaded', metavar="PATH")

        parser.add_argument("--uart-loopback", dest="loopBack", default=None, help='activate loopback')
        parser.add_argument("--flash", dest="flash", default=None, help='specify flash raw data file')
        parser.add_argument("--i2s-0", dest="i2s0", default=None, help='specify I2S stream file')

        parser.add_argument("--adc", dest="adc", default=[], action="append", help='specify ADC stream file')

        parser.add_argument("--load", dest="load",
                            help='specify the way the binary is loaded', default=None)
        
        parser.add_argument("--vsim-script", dest="vsimScript",
                            help='specify the script to use for running RTL simulation', default=None)
        
        parser.add_argument("--pulp-archi", dest="pulpArchi",
                            help='specify the PULP architecture to be simulated', default="mia")
        parser.add_argument("--kcg", dest="kcg", default=None, help='Activate PC analysis through kcachegrind for the specified path')

        [args, otherArgs] = parser.parse_known_args()
   
        self.addCommand('run', 'Run execution on RTL simulator')
        self.addCommand('prepare', 'Prepare binary for RTL simulator (SLM files, etc)')

        self.pulpArchi = config.getOption('pulpArchi')
        self.pulpCore = 'or10n'
        if self.pulpArchi.find('-riscv') != -1:
            self.pulpCore = 'riscv'
        elif self.pulpArchi.find('-or10nv2') != -1:
            self.pulpCore = 'or10nv2'
        self.pulpChip = self.pulpArchi.split('-')[0]

    def prepareSim(self):
        if self.rtlLibs == None:

            # Firts see if a single RTL build is specified
            rtlLibs = os.environ.get('VSIM_PATH')
            if rtlLibs != None and os.path.exists(rtlLibs):
                print ('VSIM_PATH is correctly defined, using following RTL platform: ' + rtlLibs)
                if not os.path.exists(rtlLibs):
                    raise Exception("ERROR: VSIM_PATH=%s path does not exist" % rtlLibs)

            if rtlLibs == None:
                rtlLibs = os.environ.get('PULP_RTL_INSTALL')
                if rtlLibs != None and os.path.exists(rtlLibs):
                    print ('PULP_RTL_INSTALL is correctly defined, using following RTL platform: ' + rtlLibs)
                    if not os.path.exists(rtlLibs):
                        raise Exception("ERROR: PULP_RTL_INSTALL=%s path does not exist" % rtlLibs)
        
            # Otherwise see if we can get it from the RTL root directory
            chipPath = 'PULP_RTL_%s' % self.pulpChip.upper()
            if rtlLibs == None:
                rtlHome = os.environ.get(chipPath)
                if rtlHome != None and os.path.exists(rtlHome):
                    os.environ['PULP_RTL_HOME'] = rtlHome
                    rtlLibs = os.path.join(rtlHome, self.pulpArchi)
                    print ('%s is correctly defined, using following RTL platform: %s' % (chipPath, rtlLibs))
                    if self.config.getOption('power'):
                        rtlLibs = rtlLibs + '_power'

            if rtlLibs == None:
                print ("WARNING: no RTL install specified, neither %s nor PULP_RTL_INSTALL nor VSIM_PATH is correctly defined:" % (chipPath))
                print ("  VSIM_PATH        : " + str(os.environ.get('VSIM_PATH')))
                print ("  PULP_RTL_INSTALL : " + str(os.environ.get('PULP_RTL_INSTALL')))
                print ("  %-16s : " % (chipPath) + str(os.environ.get(chipPath)))

            self.rtlLibs = rtlLibs

    def prepare(self):

        if not os.path.exists('stdout'): os.makedirs('stdout')

        os.environ['PULP_CORE'] = self.pulpCore

        binary = self.config.getOption('binary')
        if binary != None:
            print ('Generating stimuli for binary: ' + binary)

            try:
                os.makedirs('vectors')
            except:
                pass
            try:
                os.makedirs('slm_files')
            except:
                pass

            if self.pulpArchi.find('pulpino') != -1:
                slmScript = 's19toslm-pulpino.py'
            elif self.pulpArchi.find('mia') != -1 or self.pulpArchi.find('vivosoc2') != -1:
                slmScript = 's19toslm.py'
            elif self.pulpArchi.find('pulp3') != -1:
                slmScript = 's19toslm-pulp3.py'
            elif self.pulpArchi.find('nuraghe') != -1:
                slmScript = 's19toslm-nuraghe.py'
            else:
                slmScript = 's19toslm-new.py'

            if execCmd("objcopy --srec-len 1 --output-target=srec %s %s.s19" % (binary, os.path.basename(binary))) != 0: return -1
            if execCmd("parse_s19.pl %s.s19 > ./vectors/stim.txt" % (os.path.basename(binary))) != 0: return -1
            if execCmd("cd slm_files && %s ../%s.s19" % (slmScript, os.path.basename(binary))) != 0: return -1

            if self.config.getOption('load') == 'rom':
                bootBinary = self.config.getOption('bootBinary')
                if execCmd("objcopy --srec-len 1 --output-target=srec %s %s.s19" % (bootBinary, os.path.basename(bootBinary))) != 0: return -1
                if execCmd("cd slm_files && s19toboot.py ../%s.s19" % (os.path.basename(bootBinary))) != 0: return -1
                if execCmd("cp slm_files/boot_code.cde boot") != 0: return -1

        if self.config.getOption('flash') != None:
            self.genFlashStimuli(self.config.getOption('flash'))

        if self.config.getOption('adc') != None:
            self.genAdcStimuli(self.config.getOption('adc'))

        return 0

    def process(self):
        self.prepareSim()
        if self.config.getOption('power'):
            os.system('plp_power_estimate.py --vcd=%s/pulpchip.vcd --platform=%s' % (os.getcwd(), self.rtlLibs))

    def genAdcStimuli(self, fullOpt):
        opt = {}
        for adcOpt in fullOpt:
            ch, name = adcOpt.split(':')
            if ch == '0':
                localName = 'stimuli/stimuli_sin_hex.asc'
            elif ch == '1':
                localName = 'stimuli/stimuli_cos_hex.asc'
            elif ch == '2':
                localName = 'stimuli/stimuli_exp_hex.asc'
            elif ch == '3':
                localName = 'stimuli/stimuli_log_hex.asc'
            if os.path.exists(localName):
                os.unlink(localName)
            try:
                os.makedirs('stimuli')
            except:
                pass
            os.symlink(name, localName)

    def genFlashStimuli(self, flashImage):
        print ('Generating flash stimuli from file: ' + flashImage)
        try:
            os.makedirs('slm_files')
        except:
            pass
        with open('slm_files/flash_stim.slm', "w") as output:
            with open(flashImage, "rb") as image:
                addr = 0
                for byte in iter(partial(image.read, 1), b''):
                    output.write('@%8.8x %2.2x\n' % (addr, struct.unpack("B", byte)[0]))
                    addr += 1



    def run(self):
        self.prepareSim()

        if self.rtlLibs == None:
            raise Exception("ERROR: no RTL install specified, can't launch simulation")

        if self.rtlLibs != None:
            if os.path.islink('boot'): os.remove('boot')
            os.symlink(os.path.join(self.rtlLibs, 'boot'), 'boot')##
            if os.path.islink('modelsim.ini'): os.remove('modelsim.ini')
            os.symlink(os.path.join(self.rtlLibs, 'modelsim.ini'), 'modelsim.ini')
            if os.path.islink('work'): os.remove('work')
            os.symlink(os.path.join(self.rtlLibs, 'work'), 'work')
            if os.path.islink('tcl_files'): os.remove('tcl_files')
            os.symlink(os.path.join(self.rtlLibs, 'tcl_files'), 'tcl_files')
            if os.path.islink('waves'): os.remove('waves')
            os.symlink(os.path.join(self.rtlLibs, 'waves'), 'waves')
        
        if self.config.getOption('power'):
            runScript = "run_power_soc.tcl"
        else:
            runScript = self.config.getOption('vsimScript')
            if runScript == None:
                    if self.config.getOption('load') == None and (self.config.getOption('vopt') or (os.environ.get('PULP_VALID_MODE') != None and self.pulpArchi != 'vivosoc2')):
                        runScript = 'run_vopt.tcl'
                    else:
                        loadMode = self.config.getOption('load')
                        if self.config.getOption('load') == None: loadMode = 'preload'

                        if loadMode == 'preload' and self.pulpArchi == 'nuraghe': runScript = 'run_fpga.tcl'
                        elif loadMode == 'preload': runScript = 'run.tcl'
                        elif loadMode == 'jtag': runScript = 'run_jtag.tcl'
                        elif loadMode == 'rom': runScript = 'run_boot.tcl'
                        elif loadMode == 'spi': runScript = 'run_spi.tcl'
                        else: raise Exception("Unknown load mode: " + loadMode)

        if self.config.getOption('gui'):
            exportVarCmd = "export VOPT_ACC_ENA=YES;"
            cmd = "%s vsim -64 -do 'source %s/tcl_files/%s;'" % (exportVarCmd, self.rtlLibs, runScript)
        else:
            self.pulpArchi = self.config.getOption('pulpArchi')
            if self.pulpArchi.find('honey') != -1 or self.pulpArchi.find('fulmine') != -1 or self.pulpArchi == 'mia' or self.pulpArchi == 'vivosoc2' or self.pulpArchi == 'pulp3':
                cmd = "vsim -64 -c -do 'source %s/tcl_files/%s; run -a; exit'" % (self.rtlLibs, runScript)
            else:
              exportVarCmd = ""
              if self.config.getOption('vsimCov'):
                  exportVarCmd = "export VSIM_COV=YES;"

              uidTestName = self.config.getOption('vsimTestName')
              if uidTestName != None:
                  exportVarCmd = "%s export TESTNAME=%s;" % (exportVarCmd, uidTestName)

              if self.config.getOption('recordWlf'):
                  exportVarCmd = "%s export RECORD_WLF=YES;" % (exportVarCmd)

              doFiles = self.config.getOption('vsimDo')
              if doFiles != None:
                  exportVarCmd = "%s export DO_FILES=\'%s\';" % (exportVarCmd, doFiles)

              cmd = "%s vsim -64 -c -do 'source %s/tcl_files/%s; run_and_exit;'" % (exportVarCmd, self.rtlLibs, runScript)

        print ('Launching VSIM with command:')
        print (cmd)
        if os.system(cmd) != 0: 
            print ('VSIM reported an error, leaving')
            return -1
        os.system("tail -n +1 -- ./stdout/*")

        kcg = self.config.getOption('kcg')
        if kcg != None:
            if pulpCore == 'riscv':
                cmd = "pulp-pc-analyze --input=./%s --binary=%s --riscv --rtl" % (kcg, os.path.basename(binary))
            else:
                cmd = "pulp-pc-analyze --bin-input=./%s --binary=%s" % (kcg, os.path.basename(binary))
            print(cmd)
            if os.system(cmd) != 0: return -1
            print()
            print("KCacheGrind report generated, it can be launched with:")
            print("kcachegrind %s/kcg.txt" % (os.getcwd()))


        return 0
