#!/usr/bin/env python3

from plpstim import *

class Matmul(Kernel):

  groupName = 'matmul'

  def check(self):
    if self.get('word') != 8 and self.get('word') != 16 and self.get('word') != 32: raise Exception(bcolors.FAIL + 'Only word 8, 16 and 32 are supported' + bcolors.ENDC)

  def setParams(self, word=None, xsign=None, ysign=None, outWord=None):
    if xsign != None: self.set('xsign', xsign)
    if ysign != None: self.set('ysign', ysign)
    if word != None: self.set('word', word)
    if outWord != None: self.set('outWord', outWord)

    if self.get('xSign') != 0 or self.get('ySign') != 0:
      if not self.isSet('dataMin'): self.set('dataMin', -(1<<(self.get('word') - 1)))
      if not self.isSet('dataMax'): self.set('dataMax', (1<<(self.get('word') - 1)) - 1)
    else:
      if not self.isSet('dataMin'): self.set('dataMin', 0)
      if not self.isSet('dataMax'): self.set('dataMax', (1<<(self.get('word'))) - 1)

  params = {
    'dataMin'     : KernelParam('Minimum element value in input matrix', 0),
    'dataMax'     : KernelParam('Maximum element value in input matrix', 255),
    'word'        : KernelParam('Input and coefficient matrixes element size (8 means 8 bytes)', 8),
    'outWord'     : KernelParam('Output matrix element size (8 means 8 bytes)', 8),
    'width'       : KernelParam('X input matrix width', 64),
    'height'      : KernelParam('X input matrix height', 64),
    'ywidth'       : KernelParam('Y input matrix width', 64),
    'xsign'       : KernelParam('X input is signed', 0),
    'ysign'       : KernelParam('Y input is signed', 0),
    'shift'       : KernelParam('Shift result', 0),
    'clip'       : KernelParam('Clipping', 0),
  }

  def getMemSize(self):
    return (self.get('width')*self.get('height') + self.get('ywidth')*self.get('height'))*self.get('word')/8 + self.get('ywidth')*self.get('height')*self.get('outWord')/8

class plp_matmul_u8(Matmul):
  name = 'plp_matmul_u8'
  def __init__(self, params, args):
    super(plp_matmul_u8, self).__init__(params, args)
    self.setParams(word=8, outWord=8, xsign=0, ysign=0)

class plp_matmul_i8(Matmul):
  name = 'plp_matmul_i8'
  def __init__(self, params, args):
    super(plp_matmul_i8, self).__init__(params, args)
    self.setParams(word=8, outWord=8, xsign=1, ysign=1)

class plp_matmul_u16(Matmul):
  name = 'plp_matmul_u16'
  def __init__(self, params, args):
    super(plp_matmul_u16, self).__init__(params, args)
    self.setParams(word=16, outWord=16, xsign=0, ysign=0)

class plp_matmul_i16(Matmul):
  name = 'plp_matmul_i16'
  def __init__(self, params, args):
    super(plp_matmul_i16, self).__init__(params, args)
    self.setParams(word=16, outWord=16, xsign=1, ysign=1)

class plp_matmul_u8x16(Matmul):
  name = 'plp_matmul_u8x16'
  def __init__(self, params, args):
    super(plp_matmul_u8x16, self).__init__(params, args)
    self.setParams(word=8, outWord=16, xsign=0, ysign=0)

class plp_matmul_i8x16(Matmul):
  name = 'plp_matmul_i8x16'
  def __init__(self, params, args):
    super(plp_matmul_i8x16, self).__init__(params, args)
    self.setParams(word=8, outWord=16, xsign=1, ysign=1)

class plp_matmul_u16x32(Matmul):
  name = 'plp_matmul_u16x32'
  def __init__(self, params, args):
    super(plp_matmul_u16x32, self).__init__(params, args)
    self.setParams(word=16, outWord=32, xsign=0, ysign=0)

class plp_matmul_i16x32(Matmul):
  name = 'plp_matmul_i16x32'
  def __init__(self, params, args):
    super(plp_matmul_i16x32, self).__init__(params, args)
    self.setParams(word=16, outWord=32, xsign=1, ysign=1)

class plp_matmul_u32(Matmul):
  name = 'plp_matmul_u32'
  def __init__(self, params, args):
    super(plp_matmul_u32, self).__init__(params, args)
    self.setParams(word=32, outWord=32, xsign=0, ysign=0)

class plp_matmul_i32(Matmul):
  name = 'plp_matmul_i32'
  def __init__(self, params, args):
    super(plp_matmul_i32, self).__init__(params, args)
    self.setParams(word=32, outWord=32, xsign=1, ysign=1)

class plp_matmul_u32x64(Matmul):
  name = 'plp_matmul_u32x64'
  def __init__(self, params, args):
    super(plp_matmul_u32x64, self).__init__(params, args)
    self.setParams(word=32, outWord=64, xsign=0, ysign=0)

class plp_matmul_i32x64(Matmul):
  name = 'plp_matmul_i32x64'
  def __init__(self, params, args):
    super(plp_matmul_i32x64, self).__init__(params, args)
    self.setParams(word=32, outWord=64, xsign=1, ysign=1)

class plp_matmul_u8_norm(Matmul):
  name = 'plp_matmul_u8_norm'
  def __init__(self, params, args):
    super(plp_matmul_u8_norm, self).__init__(params, args)
    self.setParams(word=8, outWord=8, xsign=0, ysign=0)

class plp_matmul_i8_norm(Matmul):
  name = 'plp_matmul_i8_norm'
  def __init__(self, params, args):
    super(plp_matmul_i8_norm, self).__init__(params, args)
    self.setParams(word=8, outWord=8, xsign=1, ysign=1)

class plp_matmul_u16_norm(Matmul):
  name = 'plp_matmul_u16_norm'
  def __init__(self, params, args):
    super(plp_matmul_u16_norm, self).__init__(params, args)
    self.setParams(word=16, outWord=16, xsign=0, ysign=0)

class plp_matmul_i16_norm(Matmul):
  name = 'plp_matmul_i16_norm'
  def __init__(self, params, args):
    super(plp_matmul_i16_norm, self).__init__(params, args)
    self.setParams(word=16, outWord=16, xsign=1, ysign=1)

class plp_matmul_u32_norm(Matmul):
  name = 'plp_matmul_u32_norm'
  def __init__(self, params, args):
    super(plp_matmul_u32_norm, self).__init__(params, args)
    self.setParams(word=32, outWord=32, xsign=0, ysign=0)

class plp_matmul_i32_norm(Matmul):
  name = 'plp_matmul_i32_norm'
  def __init__(self, params, args):
    super(plp_matmul_i32_norm, self).__init__(params, args)
    self.setParams(word=32, outWord=32, xsign=1, ysign=1)
