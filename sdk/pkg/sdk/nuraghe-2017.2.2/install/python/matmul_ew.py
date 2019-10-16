#!/usr/bin/env python3

from plpstim import *

class Matmul_ew(Kernel):

  groupName = 'matmul_ew'

  def check(self):
    if self.get('word') != 8 and self.get('word') != 16 and self.get('word') != 32: raise Exception(bcolors.FAIL + 'Only word 8, 16 and 32 are supported' + bcolors.ENDC)

  def setParams(self, word=None, outWord=None, xsign=None, ysign=None):
    if xsign != None: self.set('xsign', xsign)
    if ysign != None: self.set('ysign', ysign)
    if word != None: self.set('word', word)
    if outWord != None: self.set('outWord', outWord)

  params = {
    'dataMin'     : KernelParam('Minimum element value in input matrix', 0),
    'dataMax'     : KernelParam('Maximum element value in input matrix', 255),
    'word'        : KernelParam('Input and coefficient matrixes element size (8 means 8 bytes)', 8),
    'outWord'     : KernelParam('Output matrix element size (8 means 8 bytes)', 8),
    'width'       : KernelParam('X input matrix width', 64),
    'height'      : KernelParam('X input matrix height', 64),
    'xsign'       : KernelParam('X input is signed', 0),
    'ysign'       : KernelParam('Y input is signed', 0),
  }

  def getMemSize(self):
    return (self.get('width')*self.get('height') * 2)*self.get('word')/8 + self.get('width')*self.get('height')*self.get('outWord')/8

class plp_matmul_ew_u8(Matmul_ew):
  name = 'plp_matmul_ew_u8'
  def __init__(self, params, args):
    super(plp_matmul_ew_u8, self).__init__(params, args)
    self.setParams(word=8, outWord=8, xsign=0, ysign=0)

class plp_matmul_ew_i8(Matmul_ew):
  name = 'plp_matmul_ew_i8'
  def __init__(self, params, args):
    super(plp_matmul_ew_i8, self).__init__(params, args)
    self.setParams(word=8, outWord=8, xsign=1, ysign=1)

class plp_matmul_ew_u16(Matmul_ew):
  name = 'plp_matmul_ew_u16'
  def __init__(self, params, args):
    super(plp_matmul_ew_u16, self).__init__(params, args)
    self.setParams(word=16, outWord=16, xsign=0, ysign=0)

class plp_matmul_ew_i16(Matmul_ew):
  name = 'plp_matmul_ew_i16'
  def __init__(self, params, args):
    super(plp_matmul_ew_i16, self).__init__(params, args)
    self.setParams(word=16, outWord=16, xsign=1, ysign=1)

class plp_matmul_ew_u8x16(Matmul_ew):
  name = 'plp_matmul_ew_u8x16'
  def __init__(self, params, args):
    super(plp_matmul_ew_u8x16, self).__init__(params, args)
    self.setParams(word=8, outWord=16, xsign=0, ysign=0)

class plp_matmul_ew_i8x16(Matmul_ew):
  name = 'plp_matmul_ew_i8x16'
  def __init__(self, params, args):
    super(plp_matmul_ew_i8x16, self).__init__(params, args)
    self.setParams(word=8, outWord=16, xsign=1, ysign=1)

class plp_matmul_ew_u16x32(Matmul_ew):
  name = 'plp_matmul_ew_u16x32'
  def __init__(self, params, args):
    super(plp_matmul_ew_u16x32, self).__init__(params, args)
    self.setParams(word=16, outWord=32, xsign=0, ysign=0)

class plp_matmul_ew_i16x32(Matmul_ew):
  name = 'plp_matmul_ew_i16x32'
  def __init__(self, params, args):
    super(plp_matmul_ew_i16x32, self).__init__(params, args)
    self.setParams(word=16, outWord=32, xsign=1, ysign=1)

class plp_matmul_ew_u32(Matmul_ew):
  name = 'plp_matmul_ew_u32'
  def __init__(self, params, args):
    super(plp_matmul_ew_u32, self).__init__(params, args)
    self.setParams(word=32, outWord=32, xsign=0, ysign=0)

class plp_matmul_ew_i32(Matmul_ew):
  name = 'plp_matmul_ew_i32'
  def __init__(self, params, args):
    super(plp_matmul_ew_i32, self).__init__(params, args)
    self.setParams(word=32, outWord=32, xsign=1, ysign=1)
