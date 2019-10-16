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

def addVcdOptions(engine):

    engine.addOption("--vcd", dest="vcd", action='store_true', help='Dump all VCD traces in file all.vcd')
    engine.addOption("--vcd-file", dest="vcdFiles", action='append', help='specify a VCD file and the traces that should be dumped to it. The option must be of the form --vcd-file=<file path>:<trace path>', metavar="PATH")


def addTraceOptions(engine):
    engine.addOption("--gv-trace", action='append', dest="gvPathRegexp", help='specify a regexp in the architecture for which the traces must be enabled', metavar="REGEXP")
    engine.addOption("--gv-trace-format", dest="gvTraceFormat", help='specify trace format. Default: %(default)s."', default='longPath')
    engine.addOption("--gv-trace-file", dest="traceFile", help='specify trace file. Default: %(default)s."', default='trace.txt')
        
def addPdbOptions(engine):
    engine.addOption("--no-werror", dest="werror", action="store_false", default=True,
                     help='Deactivate errors on platform warnings').bindToProperty(propertyName='werror')
    
    engine.addOption("--pdb-end-break", dest="pdbEndBreak", action="store_true", default=False,
                     help='Enter the platform debugger at end of simulation').bindToProperty(propertyName='pdbEndBreak')
    
    engine.addOption("--pdb-break", dest="pdbBreak", action="store_true", default=False,
                        help='Enter the platform debugger at beginning of simulation').bindToProperty(propertyName='pdbBreak')
    
    engine.addOption("--pdb-no-break", dest="pdbNoBreak", action="store_true", default=False,
                        help='Never enter platform debugger').bindToProperty(propertyName='pdbNoBreak')
    
def parseVcdOptions(engine):    
    # Smallest VCD option, activate all VCD traces in a default file
    # To implement it, we just generate another option
    vcd = engine.getOption("vcd")
    vcdFiles = engine.getOption("vcdFiles")
    if vcd == True and vcdFiles == None:
      vcdStr = 'all.vcd:/'
      if vcdFiles != None:
        vcdFiles.append(vcdStr)
      else:
        vcdFiles = [vcdStr]
    # List of VCD files and their associated traces
    if vcd and vcdFiles != None:
        for vcdFile in vcdFiles:
            vcdFileArray = vcdFile.split(':')
            if len(vcdFileArray) == 1:
                # Case where just the file is given, activate all traces for it
                tracePath = '/'
            elif len(vcdFileArray) == 2:
                tracePath = vcdFileArray[1]
            else:
                raise Exception('--vcd-file option must be of the form --vcd-file=<file path>:<trace path>')
            engine.vcd.addVcdFile(vcdFileArray[0], tracePath)
