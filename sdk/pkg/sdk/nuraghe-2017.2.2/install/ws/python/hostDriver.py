#
# Copyright (c) 2013 Germain Haugou
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
import os.path

class HostDriver():

    def __init__(self, config):
        parser = config.getParser()
        parser.add_argument("--hd-trace", dest="hdTrace", type=int,
                            help='specify the level of verbosity of the host driver. This must be a number (0 dumps no trace).', metavar="LEVEL")

    def parse(self, config):
        if config.getOption('platform') == 'gvsoc':

            hdTrace = config.getOption('hdTrace')

            if hdTrace != None:
                os.environ['HD_CONFIG_VERBOSE'] = str(hdTrace)

            if config.getOption('warnings'):
                os.environ['HD_CONFIG_WARNINGS'] = str(hdTrace)

            prop = config.getProperty(compName='fabric', propertyName='nbClusters')
            if prop != None: 
                os.environ['HD_CONFIG_CLUSTER_MASK'] = '0x%x' % ((1 << prop.value) - 1)
                os.environ['HD_CONFIG_L3_SIZE'] = '0x%x' % (config.getProperty(compName='soc', propertyName='l3Size').value)
                os.environ['HD_CONFIG_L1_SIZE'] = '0x%x' % (config.getProperty(compName='cluster', propertyName='l1Size').value)
                os.environ['HD_CONFIG_L2_SIZE'] = '0x%x' % (config.getProperty(compName='fabric', propertyName='l2Size').value)
                os.environ['HD_CONFIG_NB_CORES'] = '0x%x' % (config.getProperty(compName='fabric', propertyName='nbPes').value)
                os.environ['HD_CONFIG_NB_CLUSTERS'] = '0x%x' % (config.getProperty(compName='fabric', propertyName='nbClusters').value)
                os.environ['HD_CONFIG_FABRIC_ARCHI'] = '%s_%s' % (config.getOption('fabricArchi'), config.getOption('chipVersion'))
            
