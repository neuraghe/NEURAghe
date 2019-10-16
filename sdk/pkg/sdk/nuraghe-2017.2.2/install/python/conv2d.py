#!/usr/bin/env python3

from plpstim import *

class Convolution2D(Kernel):

  groupName = 'convolution2d'

  def check(self):
    if self.get('coeffsSize') != '5x5': raise Exception(bcolors.FAIL + 'Only coeffSize 5x5 is supported' + bcolors.ENDC)
    if self.get('word') != 8 and self.get('word') != 16: raise Exception(bcolors.FAIL + 'Only word 8 and 16 are supported' + bcolors.ENDC)

  def setParams(self, word=None, isign=None, ksign=None, norm=None, hasYin=None):
    if norm != None: self.set('norm', norm)
    if isign != None: self.set('isign', isign)
    if ksign != None: self.set('ksign', ksign)
    if word != None: self.set('word', word)
    if word != None: self.set('dataMax', (1<<word)-1)
    if self.get('coeffMin') < 0: self.set('coeffMin', 0)
    if hasYin != None: self.set('hasYin', hasYin)
    if self.get('imgWidth') == 0: self.set('imgWidth', self.get('width'))

  params = {
    'coeffsSize'     : KernelParam('Coefficient matrix size (5 means 5x5)', '5x5'),
    'coeffMin'       : KernelParam('Minimum element value in coefficient matrix', -10),
    'coeffMax'       : KernelParam('Maximum element value in coefficient matrix', 10),
    'dataMin'        : KernelParam('Minimum element value in input matrix', 0),
    'dataMax'        : KernelParam('Maximum element value in input matrix', 255),
    'word'           : KernelParam('Input and coefficient matrixes element size (8 means 8 bytes)', 8),
    'imgWidth'       : KernelParam('Img width', 0),
    'width'          : KernelParam('Input matrix width', 64),
    'height'         : KernelParam('Input matrix height', 64),
    'norm'           : KernelParam('Normalization factor', 500),
    'shift'          : KernelParam('Normalization shift', 15),
    'isign'          : KernelParam('Input is signed', 0),
    'ksign'          : KernelParam('Coefficients are signed', 0),
    'hasYin'         : KernelParam('Has yin', 0),
    'youtIsIn'       : KernelParam('Use yout as yin', 0),
    'inStride'       : KernelParam('Input matrix stride', 0),
    'inLen'          : KernelParam('Input matrix length', 0),
    'outStride'      : KernelParam('Output matrix stride', 0),
    'outLen'         : KernelParam('Output matrix length', 0),
    'inBlockStride'  : KernelParam('Input block stride', 0),
    'outBlockStride' : KernelParam('Output block stride', 0),
    'inBlockLen'     : KernelParam('Input block len', 0),
    'outBlockLen'    : KernelParam('Output block len', 0),
    'flip'           : KernelParam('Flip kernel', 0),
    'nif'            : KernelParam('Number of input features', 1),
    'wof'            : KernelParam('Wrap output features', 1),
    'coeffsStride'   : KernelParam('Coefficient matrix stride', 0),
    'nbVect'         : KernelParam('Number of vectors', 1),
    'sat'            : KernelParam('Activate saturation', 0),
  }

  def getMemSize(self):
    size = self.get('width')*self.get('height')*self.get('word')/8*self.get('nif')
    size += self.get('width')*self.get('height')*self.get('word')/8*self.get('wof')
    if self.get('hasYin') != 0 or self.get('youtIsIn') != 0: size += self.get('width')*self.get('height')*self.get('word')/8*self.get('wof')
    coeffWidth, coeffHeight = self.get('coeffsSize').split('x')
    return size + int(coeffWidth)*int(coeffHeight)*self.get('word')/8

class plp_conv5x5_i8_norm(Convolution2D):
  name = 'plp_conv5x5_i8_norm'
  def __init__(self, params, args):
    super(plp_conv5x5_i8_norm, self).__init__(params, args)
    self.setParams(word=8, isign=1, ksign=1)

class plp_conv5x5_u8_norm(Convolution2D):
  name = 'plp_conv5x5_u8_norm'
  def __init__(self, params, args):
    super(plp_conv5x5_u8_norm, self).__init__(params, args)
    self.setParams(word=8, isign=0, ksign=0)

class plp_conv5x5_i16_norm(Convolution2D):
  name = 'plp_conv5x5_i16_norm'
  def __init__(self, params, args):
    super(plp_conv5x5_i16_norm, self).__init__(params, args)
    self.setParams(word=16, isign=1, ksign=1)

class plp_conv5x5_u16_norm(Convolution2D):
  name = 'plp_conv5x5_u16_norm'
  def __init__(self, params, args):
    super(plp_conv5x5_u16_norm, self).__init__(params, args)
    self.setParams(word=16, isign=0, ksign=0)

class plp_conv5x5_u16_hw(Convolution2D):
  name = 'plp_conv5x5_u16_hw'
  def __init__(self, params, args):
    super(plp_conv5x5_u16_hw, self).__init__(params, args)
    self.setParams(word=16, isign=0, ksign=0, norm=1)
    self.set('sat', 1)

class plp_conv5x5_i16_hw(Convolution2D):
  name = 'plp_conv5x5_i16_hw'
  def __init__(self, params, args):
    super(plp_conv5x5_i16_hw, self).__init__(params, args)
    self.setParams(word=16, isign=1, ksign=1, norm=1)
    self.set('sat', 1)

class plp_conv5x5_u16_hw_strided(Convolution2D):
  name = 'plp_conv5x5_u16_hw_strided'
  def __init__(self, params, args):
    super(plp_conv5x5_u16_hw_strided, self).__init__(params, args)
    self.setParams(word=16, isign=0, ksign=0, norm=1)
    self.set('sat', 1)

class plp_conv5x5_i16_hw_strided(Convolution2D):
  name = 'plp_conv5x5_i16_hw_strided'
  def __init__(self, params, args):
    super(plp_conv5x5_i16_hw_strided, self).__init__(params, args)
    self.setParams(word=16, isign=1, ksign=1, norm=1)
    self.set('sat', 1)

class plp_conv5x5_i16_hw_feat(Convolution2D):
  name = 'plp_conv5x5_i16_hw_feat'
  def __init__(self, params, args):
    super(plp_conv5x5_i16_hw_feat, self).__init__(params, args)
    self.setParams(word=16, isign=1, ksign=1, norm=1)
    coeffWidth, coeffHeight = self.get('coeffsSize').split('x')
    self.set('inBlockStride', self.get('width')*self.get('height'))
    self.set('outBlockStride', (self.get('width')-int(coeffHeight) + 1)*(self.get('height')-int(coeffWidth) + 1))
    self.set('inBlockLen', self.get('height'))
    self.set('outBlockLen', self.get('height')-int(coeffHeight) + 1)
    self.set('youtIsIn', 1)
    self.set('flip', 1)
    self.set('coeffsStride', int((int(coeffHeight)*int(coeffWidth)+1)/2*2))
    self.set('sat', 1)

class plp_conv5x5_i16_hw_feat_vect2(plp_conv5x5_i16_hw_feat):
  name = 'plp_conv5x5_i16_hw_feat_vect2'
  def __init__(self, params, args):
    super(plp_conv5x5_i16_hw_feat_vect2, self).__init__(params, args)
    self.set('nbVect', 2)
    self.set('sat', 1)

class plp_conv5x5_i16_hw_feat_vect4(plp_conv5x5_i16_hw_feat):
  name = 'plp_conv5x5_i16_hw_feat_vect4'
  def __init__(self, params, args):
    super(plp_conv5x5_i16_hw_feat_vect4, self).__init__(params, args)
    self.set('nbVect', 4)
    self.set('sat', 1)
