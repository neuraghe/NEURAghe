# -*- coding: utf-8 -*-
import argparse
from plp_platform import *

import os
import os.path

class Runner(Platform):

    def __init__(self, config):

        super(Runner, self).__init__(config)
        
        parser = config.getParser()

        parser.add_argument("--binary", dest="binary",
                            help='specify the binary to be loaded')
                     
        [args, otherArgs] = parser.parse_known_args()
   
        self.addCommand('prepare', 'Prepare binary for zedboard platform')

    def prepare(self):

        binary = self.config.getOption('binary')

        return os.system("hsa_run %s %s" % (self.config.getOption('dir'), binary))

