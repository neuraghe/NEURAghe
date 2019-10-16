#!/usr/bin/env python3

from plpstim import *

class Threshold(Kernel):

  groupName = 'threshold'

  def check(self):
    if self.get('word') != 8 and self.get('word') != 16 and self.get('word') != 32: raise Exception(bcolors.FAIL + 'Only word 8, 16 and 32 are supported' + bcolors.ENDC)

  def setParams(self, word=None, xsign=None, ysign=None):
    if xsign != None: self.set('xsign', xsign)
    if ysign != None: self.set('ysign', ysign)
    if word != None: self.set('word', word)

  params = {
    'dataMin'     : KernelParam('Minimum element value in input matrix', 0),
    'dataMax'     : KernelParam('Maximum element value in input matrix', 255),
    'word'        : KernelParam('Input and coefficient matrixes element size (8 means 8 bytes)', 8),
    'width'       : KernelParam('Input matrix width', 64),
    'height'      : KernelParam('Input matrix height', 64),
    'xsign'       : KernelParam('X input is signed', 0),
    'threshold'   : KernelParam('threshold', 0),
  }

  def getMemSize(self):
    return self.get('width')*self.get('height')*3*self.get('word')/8

class plp_threshold_u8(Threshold):
  name = 'plp_threshold_u8'
  def __init__(self, params, args):
    super(plp_threshold_u8, self).__init__(params, args)
    self.setParams(word=8, xsign=0)

class plp_threshold_i8(Threshold):
  name = 'plp_threshold_i8'
  def __init__(self, params, args):
    super(plp_threshold_i8, self).__init__(params, args)
    self.setParams(word=8, xsign=1)

class plp_threshold_u16(Threshold):
  name = 'plp_threshold_u16'
  def __init__(self, params, args):
    super(plp_threshold_u16, self).__init__(params, args)
    self.setParams(word=16, xsign=0)

class plp_threshold_i16(Threshold):
  name = 'plp_threshold_i16'
  def __init__(self, params, args):
    super(plp_threshold_i16, self).__init__(params, args)
    self.setParams(word=16, xsign=1)

class plp_threshold_u32(Threshold):
  name = 'plp_threshold_u32'
  def __init__(self, params, args):
    super(plp_threshold_u32, self).__init__(params, args)
    self.setParams(word=32, xsign=0)

class plp_threshold_i32(Threshold):
  name = 'plp_threshold_i32'
  def __init__(self, params, args):
    super(plp_threshold_i32, self).__init__(params, args)
    self.setParams(word=32, xsign=1)
