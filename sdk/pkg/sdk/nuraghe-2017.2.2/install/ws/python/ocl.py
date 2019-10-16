#
# Copyright (c) 2013 Germain Haugou
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

class Ocl():

    def __init__(self, config):
        parser = config.getParser()
        parser.add_argument("--ocl-host-trace", dest="oclHostTrace", type=int,
                            help='specify the level of verbosity of the OpenCL host runtime. This must be a number (0 dumps no trace).', metavar="LEVEL")
        parser.add_argument("--ocl-fabric-version", dest="oclFabricVersion", default="bench",
                            help='specify the fabric runtime version.', metavar="VERSION")
        parser.add_argument("--or1k-toolchain", dest="or1kToolchain", default="llvm",
                            help='specify compiler type.', metavar="NAME")

        parser.add_argument("--ovx-use-omp", dest="ovxUseOmp", action="store_true", help='specify whether to use OMP or OCL kernels for OVX.')

    def parse(self, config):
        platform = config.getOption('platform')
        oclHostTrace = config.getOption('oclHostTrace')

        if platform == 'gvsoc':

            if oclHostTrace != None:
                os.environ['OCL_CONFIG_VERBOSE'] = str(oclHostTrace)
                os.environ['CLE_CONFIG_VERBOSE'] = str(oclHostTrace)

            if config.getOption('warnings'):
                os.environ['OCL_CONFIG_WARNINGS'] = '1'
                os.environ['CLE_CONFIG_WARNINGS'] = '1'

            if config.getOption('fabricArchi') != None and config.getOption('oclFabricVersion') != None and config.getOption('chipVersion') != None:
                os.environ['OCL_CONFIG_FABRIC_BINARY'] = '%s/install/%s/bin/oclDev-%s_%d-%s-%s.exe' % (os.environ['PULP_SDK_HOME'], 'or10n', config.getOption('fabricArchi'), config.getOption('chipVersion'), config.getOption('or1kToolchain'), config.getOption('oclFabricVersion'))
                if 'PULP_OVX_KERNELS_BASE_PATH' in os.environ:
                    base = os.environ['PULP_OVX_KERNELS_BASE_PATH']
                    if config.getOption('ovxUseOmp'):
                        base = os.path.join(base, 'omp')
                    else:
                        base = os.path.join(base, 'ocl')
                    base = os.path.join(base, 'or10n')
                    base = os.path.join(base, config.getOption('or1kToolchain'))
                    os.environ['PULP_OVX_KERNELS_PATH'] = base
    
                    if 'PULP_OVX_LIBS_BASE_PATH' in os.environ:
                        base = os.environ['PULP_OVX_LIBS_BASE_PATH']
                        base = os.path.join(base, 'or10n', 'lib', config.getOption('or1kToolchain'))
                    os.environ['PULP_OVX_LIBS_PATH'] = base
