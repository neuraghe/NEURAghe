# -*- coding: utf-8 -*-
import argparse
from plp_platform import *

import os
import os.path
import time
import binary_tools as binaryTools

def execCmd(cmd):
    print ('Executing command: ' + cmd)
    return os.system(cmd)

class Runner(Platform):

    def __init__(self, config):

        super(Runner, self).__init__(config)
        
        parser = config.getParser()

        parser.add_argument("--binary", dest="binary",
                            help='specify the binary to be loaded')
                        
        parser.add_argument("--pulp-core-archi", dest="pulpCoreArchi",
                            help='specify the core architecture to be simulated', default="or1k")
        parser.add_argument("--pulp-archi", dest="pulpArchi",
                            help='specify the PULP architecture to be simulated', default="mia")
        parser.add_argument("--load", dest="load",
                            help='specify the way the binary is loaded', default=None)
        
        [args, otherArgs] = parser.parse_known_args()
   
        self.addCommand('run', 'Run execution')
        self.addCommand('prepare', 'Prepare binary')
        self.addCommand('copy', 'Copy binary')

    def reset(self):
        return 0
        return execCmd("vivo-boot --reset")


    def copy(self):
        binary = self.config.getOption('binary').split(':')[0]
        binaries = binaryTools.getSectionBinaries(binary, os.path.dirname(binary), self.config.getOption('pulpCoreArchi'))
        if len(binaries) == 2:
            return execCmd("vivo-boot --binary=%s:0x1c000000 --binary=%s:0x10000000" % (binaries[0], binaries[1]))
        else: return -1

    def prepare(self):
        if self.config.getOption('pulpArchi') == 'mia': return 0

        binary = self.config.getOption('binary').split(':')[0]
        if binary != None:
            return binaryTools.genSectionBinaries(binary, os.path.dirname(binary), self.config.getOption('pulpCoreArchi'))
        else: return -1

    def run(self):

        binary, mask = self.config.getOption('binary').split(':')

        if self.config.getOption('load') == 'flasher':
            flashOpt = '-f %s' % (os.path.join(os.environ.get('PULP_SDK_HOME'), 'install/%s/bin/flash_programmer' % (self.config.getOption('pulpCoreArchi'))))
        else:
            flashOpt = ''

        if True: #self.config.getOption('pulpArchi') == 'mia':
          if self.config.getOption('pulpArchi') == 'mia':
            return execCmd("debug_bridge -c ft2232 -b mia -l %s -s %s %s" % (binary, mask, flashOpt))
          else:
            return execCmd("debug_bridge -c vivo -b vivosoc2 -l %s -s %s %s" % (binary, mask, flashOpt))

        else:
          if self.reset() != 0: return -1
          if binary != None:
            if self.copy() != 0:
              return -1

            return execCmd("vivo-boot --start --poll")
