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

import argparse
from plp_platform import *

from pulp.pulp3.Plp3_Soc import *
from pulp.pulp3.Pulpino import *


class Runner(Platform):

    def __init__(self, config):

        parser = config.getParser()

        choices=['honey', 'fulmine', 'mia','pulpevo','pulp4', 'bigpulp', 'pulpino', 'GAP', 'vivosoc2', 'pulp3', 'exaconv', 'wolfe', 'nuraghe']

        parser.add_argument("--fabric-archi", dest="fabricArchi", choices=choices,
                            help='specify the architecture to be simulated. Default: %(default)s.', default='mia')
                        
        #parser.add_argument("--dump-props", dest="dumpProps", action="store_true",
         #                   help='dump all architecture properties', default=False)


        [args, otherArgs] = parser.parse_known_args()
   
        if args.fabricArchi in ['honey', 'fulmine', 'mia','pulpevo','pulp4', 'bigpulp', 'GAP', 'vivosoc2', 'pulp3', 'exaconv', 'wolfe', 'nuraghe']:
            self.top = pulp.pulp3.Plp3_Soc.Plp3_Top(config)
        else:
            self.top = pulp.pulp3.Pulpino.Pulpino_Top(config)

        super(Runner, self).__init__(config)
        
        self.addCommand('run', 'Run execution on Gvsoc virtual platform')

        self.addCommand('props', 'Dumps all properties of the simulated architecture')

        
    def props(self):
        self.top.dumpProperties()

    def prepare(self):
        return 0
        
    def run(self):
        return self.top.run()
