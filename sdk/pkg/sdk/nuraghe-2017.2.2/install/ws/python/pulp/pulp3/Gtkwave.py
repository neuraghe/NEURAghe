# 
# Copyright (C) 2015 ETH Zurich and University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#
# Authors: Germain Haugou (germain.haugou@gmail.com)
#

import os

def genScript(config, outFileName, template, vcdFilesNames):
  vcdFiles = []
  for vcdFile in vcdFilesNames:
      vcdFiles.append('[dumpfile] "%s"' % (vcdFile))
  vcdFilesString = '\n'.join(vcdFiles)

  pcache = ''

  # Pache accesses
  pcache += '@c00201\n'
  pcache += '-access\n'
  pcache += '@22\n'
  for port in range(0, config.clusters[0].pcache.ports):
    pcache += 'soc.fabric.cluster0.pcache.port%d[31:0]\n' % (port)
  pcache += '@1401201\n'
  pcache += '-access\n'

  # Pcache tags
  pcache += '@c00200\n'
  pcache += '-tags\n'
  nbLines = int(config.clusters[0].pcache.size / (config.clusters[0].pcache.ways * config.clusters[0].pcache.lineSize))
  for set in range(0, (config.clusters[0].pcache.ways)):
      pcache += '@800200\n'
      pcache += '-set%d\n' % (set)
      for line in range(0, nbLines):
          pcache += '@22\n'
          pcache += 'soc.fabric.cluster0.pcache.set%d.line%d[31:0]\n' % (set, line)
      pcache += '@1000200\n'
      pcache += '-set%d\n' % (set)
  pcache += '@1401200\n'
  pcache += '-tags\n'

  pcache += '@23\n'
  pcache += 'soc.fabric.cluster0.pcache.refill[31:0]'

  with open(template, 'r') as inFile:
  	with open(outFileName, 'w') as outFile:                    
  		outFile.write(inFile.read() % {'vcdFiles' : vcdFilesString, 'savefile' : '%s/%s' % (os.getcwd(), outFileName), 'pcache': pcache})
