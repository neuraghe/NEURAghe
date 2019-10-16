import argparse
from plp_platform import *
import pexpect
import sys

import os
import os.path
import time

class Runner(Platform):

    def __init__(self, config):

        super(Runner, self).__init__(config)
        
        parser = config.getParser()

        parser.add_argument("--binary", dest="binary",
                            help='specify the binary to be loaded')
                        
        [args, otherArgs] = parser.parse_known_args()
   
        self.addCommand('run', 'Run execution on STM32 board')

    def run(self):

        binary = self.config.getOption('binary')
        if binary != None:
            
            # 
            # OPENOCD SETUP
            #
            openocd = pexpect.spawn('openocd -f %s/install/bin/openocd.cfg' % (os.environ.get('PULP_SDK_HOME')), logfile=sys.stdout)
            try:
                i = openocd.expect(['Info : STLINK v2 JTAG', pexpect.EOF], timeout=5)
                if i == 5:
                    openocd.close()
                    print('PEXPECT: openocd reached EOF with exit status ' + str(child.exitstatus))
                    exit(1)
            except pexpect.TIMEOUT as e:
                print('PEXPECT: openocd reached timeout during setup')
                os.killpg(openocd.pid, 9)
                exit(1)

            #
            # GDB setup
            #
            gdb = pexpect.spawn('arm-none-eabi-gdb', logfile=sys.stdout)
            gdb.expect(['\(gdb\)', pexpect.EOF], timeout=20)
            gdb.sendline('target ext :3333\r')
            gdb.expect(['target', pexpect.EOF], timeout=20)
            gdb.expect(['\(gdb\)', pexpect.EOF], timeout=20)
            gdb.sendline('load %s\r\n' % (binary))
            gdb.expect(['load', pexpect.EOF], timeout=20)
            gdb.expect(['\(gdb\)', pexpect.EOF], timeout=20)
            gdb.sendline('c\r')
            gdb.expect(['Continuing', pexpect.EOF], timeout=20)
            
            while True:
                kermit = pexpect.spawn('kermit', logfile=sys.stdout)
                kermit.expect(['C-Kermit>'])
                kermit.sendline('set line /dev/ttyACM1')
                i = kermit.expect(['C-Kermit>', 'Device or resource busy', 'denied'])
                if i >= 1: 
                    time.sleep(2)
                    continue
                break

            kermit.sendline('SET CARRIER-WATCH OFF')
            kermit.expect(['C-Kermit>'])
            kermit.sendline('connect')
            kermit.expect(['STM32 application ended', pexpect.EOF], timeout=10000000)
            

            
            
