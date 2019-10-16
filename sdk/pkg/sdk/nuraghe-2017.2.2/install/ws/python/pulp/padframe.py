# 
# Copyright (C) 2015 ETH Zurich and University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#
# Authors: Germain Haugou (germain.haugou@gmail.com)
#


import gv
import pulp.padframe_mux


class Padframe(gv.Module):

  padConfig = None
  topComp = None

  def build(self):

    if self.topComp == None: self.raiseError("Top component providing the pads must be specified")

    nbAlternates = 0
    for pad in self.padConfig.pads:
      if pad.muxId >= nbAlternates: nbAlternates = pad.muxId + 1

    # First declare one input and one output port for each pad
    for i in range(0, self.padConfig.nbPads):
        self.topComp.newPort('pad_in_%d' % i)
        self.topComp.newPort('pad_out_%d' % i)
        self.newPort('pad_fun_%d' % i)
        self.newPort('pad_cfg_%d' % i)
        self.newPort('pad_dir_%d' % i)
        for j in range(0, nbAlternates):
          self.newPort('pad_out_%d_mux_%d' % (i, j))
          self.newPort('pad_in_%d_mux_%d' % (i, j))

  	# This component will multiplex fabric signals together to the pads
    padframeMux = self.newComp(className=pulp.padframe_mux.Padframe_mux, compName='mux', nbPads=self.padConfig.nbPads, nbAlternates=nbAlternates)

    # Connect muxed signals to pad
    for i in range(0, self.padConfig.nbPads):
      self.topComp.getPort('pad_in_%d' % i).linkTo(padframeMux.getPort('pad_in_%d' % i))
      padframeMux.getPort('pad_out_%d' % i).linkTo(self.topComp.getPort('pad_out_%d' % i))
      self.getPort('pad_fun_%d' % i).linkTo(padframeMux.getPort('pad_fun_%d' % i))
      self.getPort('pad_cfg_%d' % i).linkTo(padframeMux.getPort('pad_cfg_%d' % i))
      self.getPort('pad_dir_%d' % i).linkTo(padframeMux.getPort('pad_dir_%d' % i))
      for j in range(0, nbAlternates):
        self.getPort('pad_out_%d_mux_%d' % (i, j)).linkTo(padframeMux.getPort('pad_out_%d_mux_%d' % (i, j)))
        padframeMux.getPort('pad_in_%d_mux_%d' % (i, j)).linkTo(self.getPort('pad_in_%d_mux_%d' % (i, j)))

  def getPad(self, name):
    for pad in self.padConfig.pads:
      if pad.name == name: return pad.id

  def getPadIn(self, name):
    for pad in self.padConfig.pads:
      if pad.name == name: return 'pad_in_%d_mux_%d' % (pad.id, pad.muxId)

    return None

  def getPadOut(self, name):
    for pad in self.padConfig.pads:
      if pad.name == name: return 'pad_out_%d_mux_%d' % (pad.id, pad.muxId)

    return None
