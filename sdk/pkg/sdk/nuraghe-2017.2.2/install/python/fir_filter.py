#!/usr/bin/env python3

from plpstim import *

class FIR_filter(Kernel):

  groupName = 'fir_filter'

  def check(self):
    if self.get('word') != 32 and self.get('float') != 32 and self.get('float') != 64: raise Exception(bcolors.FAIL + 'Only word 32 or float32 or float64 are supported' + bcolors.ENDC)

  def setParams(self, word=None, float=None):
    if word != None: self.set('word', word)
    if float != None: self.set('float', float)

  params = {
    'dataMin'     : KernelParam('Minimum element value in input vector', 0),
    'dataMax'     : KernelParam('Maximum element value in input vector', 255),
    'word'      : KernelParam('Input and coefficient vectors element size (8 means 8 bits)', 8),
    'float'      : KernelParam('Input and coefficient vectors element size using float (8 means 8 bits)', 0),
    'floatError' : KernelParam('Gives floating-point allowed error (in percentage)', 0.0),
    'size'      : KernelParam('Size of the buffer', 0),
    'version'   : KernelParam('Version of the implementation', 0),
    'blockSize' : KernelParam('Block size', 0),
    'nbCoeffs'  : KernelParam('Number of coefficients', 0),
  }

  def getMemSize(self):
    return (self.get('size')*2 + self.get('nbCoeffs'))*self.get('word')/8

class plp_fir_filter_q31(FIR_filter):
  name = 'plp_fir_filter_q31'
  def __init__(self, params, args):
    super(plp_fir_filter_q31, self).__init__(params, args)
    self.setParams(word=32)

class plp_fir_filter_f32(FIR_filter):
  name = 'plp_fir_filter_f32'
  def __init__(self, params, args):
    super(plp_fir_filter_f32, self).__init__(params, args)
    self.setParams(float=32)

class plp_fir_filter_f64(FIR_filter):
  name = 'plp_fir_filter_f64'
  def __init__(self, params, args):
    super(plp_fir_filter_f64, self).__init__(params, args)
    self.setParams(float=64)
