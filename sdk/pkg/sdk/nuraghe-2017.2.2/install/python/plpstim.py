#!/usr/bin/env python3

import argparse
import traceback
import os.path

nbStim = 0

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

class Kernel(object):

  def __init__(self, params, args):

    global nbStim
    self.id = nbStim
    nbStim += 1
    self.paramValues = {}
    self.isParamSet = {}

    # First check if all params are valid are store their values in self.paramValues
    for param, value in params.items():
      if not param in self.params.keys():
        str = bcolors.FAIL + 'Invalid stimuli, found unknown param: ' + param + '\n' + bcolors.ENDC
        str += 'Available params:\n'
        for key, value in self.params.items():
          str += '  %-20s: %s\n' % (key, value.help)
        raise Exception(str)

      valueType = type(self.params.get(param).defaultValue)
      try:
        newValue = valueType(eval(value))
      except:
        raise Exception('Found incorrect type for param (param: %s, value: %s, type: %s, expected: %s)' % (param, value, type(value), valueType))

      self.paramValues[param] = newValue
      self.isParamSet[param] = True

    # Now apply default values
    for param, value in self.params.items():
      if self.paramValues.get(param) == None:
        self.paramValues[param] = value.defaultValue

    # Display them if asked
    # This will display param name, help and current value
    if args.dump:
      maxLen = 0
      strList = []
      for key, value in self.params.items():
        str = '%s(%s)' % (key, self.paramValues.get(key))
        if len(str) > maxLen: maxLen = len(str)
        strList.append([str, value.help])

      print ('Stimuli parameters and values:')
      for line in strList:
        print ('  %-*s: %s' % (maxLen, line[0], line[1]))

    stimName = '%s_%d' % (self.name, self.id)
    self.stimName = stimName

  def set(self, name, value):
    self.paramValues[name] = value

  def isSet(self, name):
    return self.isParamSet.get(name)

  def get(self, name):
    return self.paramValues.get(name)

  def gen(self, fileName):
    paramList = []

    for key, value in self.paramValues.items():
      paramList.append('--%s=%s' % (key, value))

    cmd = 'plpstimkernel --file=%s --name=%s --kernel=%s %s' % (fileName, self.stimName, self.name, ' '.join(paramList))
    print (cmd)
    if os.system(cmd):
      raise Exception(bcolors.FAIL + 'Caught error when generating stimuli from command: ' + cmd + bcolors.ENDC)

		

class KernelParam(object):

  def __init__(self, help='', defaultValue=None):
    self.help = help
    self.defaultValue = defaultValue


class StimuliGroup(object):

  def __init__(self, id):
    self.kernels = []
    self.id = id

  def appendKernel(self, kernel):
    self.kernels.append(kernel)

  def getKernels(self):
    return self.kernels

class StimuliFile(object):

  def __init__(self, path, stimulis, kernels):
    self.path = path
    self.stimulis = stimulis
    self.kernels = kernels
    self.name = os.path.basename(path).replace('.', '_')
    self.genKernels = []
    self.groups = {}

  def parse(self, args):
    for stimuli in self.stimulis:
    
      print ('Handling stimuli: ' + stimuli)
    
      params = {}
      for param in stimuli.split(':'):
        try:
          key, value = param.split('=')
        except:
          raise Exception(bcolors.FAIL + 'Invalid stimuli, must be described using this format: --stimuli=param0=value0:param1=value1:...' + bcolors.ENDC)
        params[key] = value
    
      kernelName = params.get('kernel')
      if kernelName == None: raise Exception(bcolors.FAIL + 'Invalid stimuli, at least the kernel name must be specified (with --stimuli=kernel=<name>)' + bcolors.ENDC)
  
      kernel = None
      for checkKernel in self.kernels:
        if checkKernel.name == kernelName:
          kernel = checkKernel
          break
    
      if kernel == None: 
        str = bcolors.FAIL + 'Invalid stimuli, unknown kernel: ' + kernelName + '\n' + bcolors.ENDC
        str += 'Available kernels:\n'
        for kernel in self.kernels:
          str += '  ' + kernel.name + '\n'
        raise Exception(str)
    
      group = params.get('group')
      if group != None: del params['group']
      else: group = 'default'

      del params['kernel']

      kernel = kernel(params, args)
      kernel.stimuli = stimuli
  
      if group != None:
        if self.groups.get(group) == None: self.groups[group] = []
        self.groups.get(group).append(kernel)

      kernel.check()

      self.genKernels.append(kernel)
  
  def gen(self):

    with open(self.path, 'w') as file:
      file.write('#ifndef __%s__\n' % (self.name))
      file.write('#define __%s__\n' % (self.name))
      file.write('\n')
      file.write('#include "plpstim.h"\n')
      file.write('\n')

    groups = []
    group = None
    currentSize = 0
    memSizeLimit = 32*1024

    for kernel in self.genKernels:
      while kernel.getMemSize() + currentSize > memSizeLimit:
        if currentSize == 0: raise Exception('A single stimuli is above the memory limit: ' + kernel.stimuli)
        currentSize = 0
        group = None
      if group == None:
        group = StimuliGroup(len(groups))
        groups.append(group)
      group.appendKernel(kernel)
      currentSize += kernel.getMemSize()

    defList = []
    checkList = []
    for group in groups:
      defList.append('STIMULI_GROUP_%d' % (group.id))
      checkList.append('!defined(STIMULI_GROUP_%d)' % (group.id))

    with open(self.path, 'a') as file:
      file.write('#if %s\n' % (' && '.join(checkList)))
      file.write('#define %s\n' % defList[0])
      file.write('#endif\n\n')


    for group in groups:
      with open(self.path, 'a') as file:
        file.write('#ifdef STIMULI_GROUP_%d\n\n' % (group.id))
      for kernel in group.getKernels():
        kernel.gen(self.path)
      with open(self.path, 'a') as file:
        file.write('#endif\n')

    with open(self.path, 'a') as file:
      file.write('static kernel_stimuli_t *stimulis[] = {\n')
      for group in groups:
        file.write('#ifdef STIMULI_GROUP_%d\n' % (group.id))
        for kernel in group.getKernels():
          file.write('  &%s,\n' % (kernel.stimName))
        file.write('#endif\n')
      file.write('};\n\n')


    with open(self.path, 'a') as file:
      file.write('\n')
      file.write('#endif\n')

    with open('testset.ini', 'w') as file:
      file.write('[testset:%s]\n\n' % (kernel.groupName))
      for group in groups:
        file.write('[test:%s:%s]\n' % (kernel.groupName, group.id))
        file.write('command.all=make systemConfig=%%(config)s clean all run buildDirExt=_%d PULP_CFLAGS=-DSTIMULI_GROUP_%d\n\n' % (group.id, group.id))

        for kernel in group.getKernels():
          probeName = '%s_%s' % (kernel.name, kernel.id)
          file.write('probe[%s_c].metric=cycles\n' % (probeName))
          file.write('probe[%s_c].regexp=%s_%d cycles per pixel: .*, hot: (\d+.\d+)    cpu load\n' % (probeName, kernel.name, kernel.id))
          if kernel.get('width') != None: window = 'window=%dx%d' % (kernel.get('width'), kernel.get('height'))
          else: window = 'window=%d' % kernel.get('size')
          file.write('probe[%s_c].parameters=kernelGroup=%s:kernel=%s:%s\n\n' % (probeName, kernel.groupName, kernel.name, window))

          file.write('probe[%s_l].metric=load\n' % (probeName))
          file.write('probe[%s_l].regexp=%s_%d cycles per pixel: .* cpu load: .*, hot: (\d+.\d+)\n' % (probeName, kernel.name, kernel.id))
          if kernel.get('width') != None: window = 'window=%dx%d' % (kernel.get('width'), kernel.get('height'))
          else: window = 'window=%d' % kernel.get('size')
          file.write('probe[%s_l].parameters=kernelGroup=%s:kernel=%s:%s\n\n' % (probeName, kernel.groupName, kernel.name, window))
