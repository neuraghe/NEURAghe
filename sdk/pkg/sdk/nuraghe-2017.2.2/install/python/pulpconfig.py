#!/usr/bin/env python3

import collections
import re
import sys
from collections import OrderedDict
import configs.pulp.PulpConfig

defaultPulpChip = 'pulp4'

configItems = {
  'pulpCoreArchi'   : ['or1k', 'or10n', 'or10nv2', 'riscv', 'riscv-rvc', 'ri5cy', 'ri5cy-rvc', 'ri5cyv1', 'ri5cyv1-rvc', 'ri5cyv2', 'ri5cyv2-rvc'],
  'pulpCore'        : ['or1k', 'or10n3', 'or10n4', 'or10n5', 'riscv', 'ri5cy', 'ri5cyv1', 'ri5cyv2'],
  'pulpChip'        : ['pulp3', 'pulpino', 'fulmine', 'fulmine8', 'pulp4', 'mia', 'pulpevo', 'honey', 'bigpulp', 'bigpulp-z-7020', 'bigpulp-z-7045', 'GAP', 'vivosoc2', 'exaconv', 'wolfe', 'nuraghe'],
  'pulpChipVersion' : ['0', '1', '100'],
  'pulpArchiVersion': ['2	', '3', '4', '5'],
  'pulpCompiler'    : ['gcc', 'llvm'],
  'pulpRtVersion'   : ['release', 'bench', 'debug', 'profile0', 'profile1'],
  'platform'        : ['gvsoc', 'rtl', 'fpga', 'hsa', 'board'],
  'pulpOmpVersion'  : ['libgomp', 'ovx', 'new'],
  'io'              : ['uart', 'stdout'],
  'nbPe'            : ['1', '2', '4', '8', '16'],
  'flag'						: None
}

configKeys = ['platform', 'pulpChip', 'pulpChipVersion', 'pulpArchiVersion', 'pulpCoreArchi', 'pulpCore', 'pulpCompiler', 'pulpRtVersion', 'pulpOmpVersion', 'io', 'nbPe']

configDefaults = {
  'platform'        : 'gvsoc',
  'pulpChip'        : 'pulp4',
  'pulpCompiler'    : 'gcc',
  'pulpRtVersion'   : 'bench',
  'pulpOmpVersion'  : 'libgomp',
  'io'              : 'stdout',
  'pulpChipVersion' : '0',
  'pulpArchiVersion': '5',
  'nbPe'            : '4',
  'flag'						: None,
}

class Pulpino_chip(object):
	defaults = {
	  'pulpChip'      : 'pulpino',
	  'pulpChipFamily': 'pulpino',
	  'pulpCoreArchi' : 'ri5cyv1-rvc',
	  'pulpCore'      : 'ri5cyv1'
	}

class Fulmine_chip(object):
	defaults = {
	  'pulpChip'      : 'fulmine',
    'pulpChipFamily': 'fulmine',
    'pulpArchiVersion': '4',
	  'pulpCoreArchi' : 'or10nv2',
	  'pulpCore'      : 'or10n5',
    'l2Size'        : '196608',
    'l1Size'        : '65536',
    'romSize'       : '8192',
    'scmSize'       : '8192',
    'nbPe'          : '4',
    'nbCluster'     : '1',
    'stackSize'     : '1024',
	}

class Fulmine8_chip(object):
	defaults = {
		'pulpChip'      : 'fulmine8',
		'pulpChipFamily': 'fulmine',
    'pulpArchiVersion': '4',
		'pulpCoreArchi' : 'or10nv2',
		'pulpCore'      : 'or10n5',
	    'l2Size'        : '327680',
	    'l1Size'        : '131072',
	    'romSize'       : '8192',
	    'scmSize'       : '8192',
	    'nbPe'          : '8',
	    'nbCluster'     : '1',
	    'stackSize'     : '1024',
	}

class GAP_chip(object):
	defaults = {
	  'pulpChip'      : 'GAP',
    'pulpChipFamily': 'GAP',
    'pulpArchiVersion': '5',
	  'pulpCoreArchi' : 'ri5cyv2-rvc',
	  'pulpCore'      : 'ri5cyv2',
    'l2Size'        : '524288',
    'l1Size'        : '65536',
    'romSize'       : '8192',
    'nbPe'          : '8',
    'nbCluster'     : '1',
    'stackSize'     : '1024',
	  'fcTcdmSize'    : str(16*1024),
	  'fcStackSize'   : str(2*1024)
	}

class Wolfe_chip(object):
	defaults = {
	  'pulpChip'      : 'wolfe',
    'pulpChipFamily': 'wolfe',
    'pulpArchiVersion': '5',
	  'pulpCoreArchi' : 'ri5cyv2-rvc',
	  'pulpCore'      : 'ri5cyv2',
    'l2Size'        : '524288',
    'l1Size'        : '65536',
    'romSize'       : '8192',
    'nbPe'          : '4',
    'nbCluster'     : '1',
    'stackSize'     : '1024',
	  'fcStackSize'   : str(2*1024)
	}

class Nuraghe_chip(object):
	defaults = {
	  'pulpChip'      : 'nuraghe',
          'pulpChipFamily': 'nuraghe',
          'pulpArchiVersion': '3',
	  'pulpCoreArchi' : 'or10n',
	  'pulpCore'      : 'or10n4',
          'l2Size'        : '262144',
          'l1Size'        : '32768',
          'scmSize'       : '1015808',
          'nbPe'          : '2',
          'nbCluster'     : '1',
          'stackSize'     : '1024',
	}

class Exaconv_chip(object):
	defaults = {
	  'pulpChip'      : 'exaconv',
    'pulpChipFamily': 'exaconv',
    'pulpArchiVersion': '5',
	  'pulpCoreArchi' : 'ri5cyv2-rvc',
	  'pulpCore'      : 'ri5cyv2',
    'l2Size'        : '65536',
    'l1Size'        : '131072',
    'nbPe'          : '2',
    'nbCluster'     : '4',
    'stackSize'     : '1024',
	}

class Vivosoc2_chip(object):
	defaults = {
	  'pulpChip'      : 'vivosoc2',
    'pulpChipFamily': 'vivosoc2',
    'pulpArchiVersion': '4',
	  'pulpCoreArchi' : 'or10nv2',
	  'pulpCore'      : 'or10n5',
    'l2Size'        : '131072',
    'l1Size'        : '32768',
    'romSize'       : '8192',
    'nbPe'          : '4',
    'nbCluster'     : '1',
    'stackSize'     : '1024',
	}

class Pulp4_chip(object):
	defaults = {
	  'pulpChip'      : 'pulp4',
    'pulpChipFamily': 'pulp4',
    'pulpArchiVersion': '5',
	  'pulpCoreArchi' : 'ri5cyv2-rvc',
	  'pulpCore'      : 'ri5cyv2',
    'l2Size'        : '131072',
    'l1Size'        : '65536',
    'romSize'       : '8192',
    'scmSize'       : '8192',
    'nbPe'          : '4',
    'nbCluster'     : '1',
    'stackSize'     : '1024',
	}

class Pulp3_chip(object):
	defaults = {
	  'pulpChip'      : 'pulp3',
    'pulpChipFamily': 'pulp3',
    'pulpArchiVersion': '3',
	  'pulpCoreArchi' : 'or10n',
	  'pulpCore'      : 'or10n4',
    'l2Size'        : '131072',
    'l1Size'        : '65536',
    'romSize'       : '8192',
    'scmSize'       : '8192',
    'nbPe'          : '4',
    'nbCluster'     : '1',
    'stackSize'     : '1024',
	}

class Pulp4z_chip(object):
	defaults = {
	  'pulpChip'      : 'pulp4z',
    'pulpChipFamily': 'pulp4z',
    'pulpArchiVersion': '5',
	  'pulpCoreArchi' : 'or10n',
	  'pulpCore'      : 'or10n4',
    'l2Size'        : '65536',
    'l1Size'        : '36864',
    'romSize'       : '8192',
    'scmSize'       : '8192',
    'nbPe'          : '2',
    'nbCluster'     : '1',
    'stackSize'     : '1024',
	}

class Pulpevo_chip(object):
	defaults = {
	  'pulpChip'      : 'pulpevo',
    'pulpChipFamily': 'pulpevo',
    'pulpArchiVersion': '4',
	  'pulpCoreArchi' : 'or10n',
	  'pulpCore'      : 'or10n4',
    'l2Size'        : '4194304',
    'l1Size'        : '524288',
    'romSize'       : '8192',
    'nbPe'          : '4',
    'nbCluster'     : '1',
    'stackSize'     : '1024',
	}

class Honey_chip(object):
	defaults = {
	  'pulpChip'      : 'honey',
    'pulpChipFamily': 'honey',
    'pulpArchiVersion': '3',
	  'pulpCoreArchi' : 'ri5cy-rvc',
	  'pulpCore'      : 'ri5cy',
    'l2Size'        : '131072',
    'l1Size'        : '65536',
    'romSize'       : '8192',
    'scmSize'       : '8192',
    'nbPe'          : '4',
    'nbCluster'     : '1',
    'stackSize'     : '1024',
	}

class Mia_chip(object):
	defaults = {
	  'pulpChip'      : 'mia',
    'pulpChipFamily': 'mia',
    'pulpArchiVersion': '3',
	  'pulpCoreArchi' : 'or10n',
	  'pulpCore'      : 'or10n3',
    'l2Size'        : '262144',
    'l1Size'        : '65536',
    'romSize'       : '8192',
    'scmSize'       : '8192',
    'nbPe'          : '4',
    'nbCluster'     : '1',
    'stackSize'     : '1024',
	}

class Bigpulp_z_7020_chip(object):
	defaults = {
	  'pulpChip'      : 'bigpulp-z-7020',
    'pulpChipFamily': 'bigpulp',
    'pulpArchiVersion': '4',
	  'pulpCoreArchi' : 'or10nv2',
	  'pulpCore'      : 'or10n5',
    'l2Size'        : str(64*1024),
    'l1Size'        : str(32*1024),
    'nbPe'          : '2',
    'nbCluster'     : '1',
    'stackSize'     : '1024',
	}

class Bigpulp_z_7045_chip(object):
  defaults = {
    'pulpChip'      : 'bigpulp-z-7045',
    'pulpChipFamily': 'bigpulp',
    'pulpArchiVersion': '4',
    'pulpCoreArchi' : 'or10nv2',
    'pulpCore'      : 'or10n5',
    'l2Size'        : str(256*1024),
    'l1Size'        : str(256*1024),
    'nbPe'          : '8',
    'nbCluster'     : '1',
    'stackSize'     : '1024',
  }

class Bigpulp_chip(object):
  defaults = {
    'pulpChip'      : 'bigpulp',
    'pulpChipFamily': 'bigpulp',
    'pulpArchiVersion': '4',
    'pulpCoreArchi' : 'or10nv2',
    'pulpCore'      : 'or10n5',
    'l2Size'        : str(256*1024),
    'l1Size'        : str(256*1024),
    'nbPe'          : '8',
    'nbCluster'     : '4',
    'stackSize'     : '1024',
  }

configItemPulpChips = [
  Pulpino_chip, Fulmine_chip, Fulmine8_chip, GAP_chip, Vivosoc2_chip, Pulp4_chip, Pulp3_chip,
  Pulp4z_chip, Pulpevo_chip, Honey_chip, Mia_chip, Bigpulp_chip, Bigpulp_z_7020_chip, Bigpulp_z_7045_chip, Exaconv_chip, Wolfe_chip, Nuraghe_chip]

class ConfigItem(object):

	unknown = False

	def __init__(self, name):
		self.name = name
		self.value = None
		self.unknown = False

	def setValue(self, value):
		self.value = value

	def getValue(self):
		return self.value

	def setDefaultValues(self, config):
		# By default we don't set any default value, config item will overload this behavior
		return False

	def setDefaultValue(self, config):
		if self.getValue() == None and configDefaults.get(self.name) != None: config.set(self.name, configDefaults.get(self.name))

	def isValidConfig(self, config):
		return True

	def getGroups(self, config):
		return []

class UnknownConfigItem(ConfigItem):
	unknown = True

class ConfigItemPlatform(ConfigItem):
	unknown = False
	def setValue(self, value):
		super(ConfigItemPlatform, self).setValue(value)
		self.platform = None
		for platform in pulpPlatforms:
			if platform.name == value:
				self.platform = platform()

	def getGroups(self, config):
		if config.get('platform') == 'gvsoc':
			return ['platform']
		else:
			return []

	def setDefaultValues(self, config):
		if config.get('platform') == 'board' or (config.get('platform') == 'fpga' and config.get('pulpChipFamily') == 'fulmine'):
			if not config.isSet('io'): 
				config.set('io', 'uart')
				return False
		if config.get('platform') == 'hsa' and config.get('pulpChip') != None and config.get('pulpChip').find('bigpulp') != -1:
			if not config.isSet('io'): 
				config.set('io', 'uart')
				return False
		return False

class ConfigItemPulpChip(ConfigItem):
	def setValue(self, value):
		super(ConfigItemPulpChip, self).setValue(value)
		self.chip = None
		for chip in configItemPulpChips:
			if chip.defaults.get('pulpChip') == value: self.chip = chip
		if self.chip == None: raise Exception('Unknown chip: ' + value)

	def __init__(self, name):
		super(ConfigItemPulpChip, self).__init__(name)
		self.lastDefaultPulpCoreArchi = None

	def setDefaultValues(self, config):
		if config.get('pulpChip') == None:
			config.set('pulpChip', defaultPulpChip)

		for key, value in self.chip.defaults.items():
			if not config.isSet(key):
				config.set(key, value)

class ConfigItemPulpCoreArchi(ConfigItem):
	def isRiscv(self):
		return self.value.find('riscv') != -1 or self.value.find('ri5cy') != -1

	def getCountersNames(self):
		if not self.isRiscv():
			return ["Cycles", "Instructions", "LD_Stall", "Jmp_Stall", "IMISS", "WBRANCH", "WBRANCH_CYC", "LD", "ST", "JUMP", "BRANCH", "DELAY_NOP", "LD_EXT", "ST_EXT", "LD_EXT_CYC", "ST_EXT_CYC", "TCDM_CONT"]
		else:
			return ["Cycles", "Instructions", "LD_Stall", "Jmp_Stall", "IMISS", "LD", "ST", "JUMP", "BRANCH", "TAKEN_BRANCH", "RVC", "LD_EXT", "ST_EXT", "LD_EXT_CYC", "ST_EXT_CYC", "TCDM_CONT"]

	def setDefaultValues(self, config):
		if not config.isSet('pulpCoreArchi'):
   			if config.isSet('pulpCore'):
   				archi = None
   				core = config.get('pulpCore')
   				if core.find('or10n') != -1:
   					coreVersion = int(config.get('pulpCore')[5:])
   					if coreVersion >= 5: archi = 'or10nv2'
   					else: archi = 'or10n'
   				elif core.find('or1k') != -1:    archi = 'or1k'
   				elif core.find('riscv') != -1:   archi = 'riscv'
   				elif core.find('ri5cyv2') != -1: archi = 'ri5cyv2'
   				elif core.find('ri5cyv1') != -1: archi = 'ri5cyv1'
   				elif core.find('ri5cy') != -1:   archi = 'ri5cy'

   				if archi != None: 
   					config.set('pulpCoreArchi', archi)


class ConfigItemPulpCore(ConfigItem):

	def setDefaultValues(self, config):
		if not config.isSet('pulpCore'):
   			if config.isSet('pulpCoreArchi'): 
   				pulpCores = {'or10n' : 'or10n4', 'or10nv2' : 'or10n5', 'riscv-rvc' : 'riscv', 'riscv' : 'riscv', 'ri5cy-rvc' : 'ri5cy', 'ri5cy' : 'ri5cy', 'ri5cyv1-rvc' : 'ri5cyv1', 'ri5cyv1' : 'ri5cyv1', 'ri5cyv2-rvc' : 'ri5cyv2', 'ri5cyv2' : 'ri5cyv2', 'or1k' : 'or1k'}
   				config.set('pulpCore', pulpCores[config.get('pulpCoreArchi')])
   				config.markSet('pulpCore')


class ConfigItemPulpChipVersion(ConfigItem):
	pass

class ConfigItemPulpArchiVersion(ConfigItem):
	pass

class ConfigItemPulpCompiler(ConfigItem):
	def isValidConfig(self, config):
		if config.get('pulpCompiler') == 'llvm':
			return config.get('pulpCoreArchi') == 'or1k' or config.get('pulpCoreArchi') == 'or10n'
		return True

class ConfigItemPulpRtVersion(ConfigItem):
	def isValidConfig(self, config):
		return config.get('pulpRtVersion') == 'bench' or config.get('pulpRtVersion') == 'debug' or config.get('pulpRtVersion') == 'profile0' or config.get('pulpRtVersion') == 'release'

class ConfigItemPulpOmpVersion(ConfigItem):

	def isValidConfig(self, config):
		if config.get('pulpOmpVersion') == 'new':
			if config.get('pulpChip') != 'pulp4' and config.get('pulpChip') != 'wolfe' and config.get('pulpChip') != 'GAP' and config.get('pulpChip') != 'fulmine' and config.get('pulpChip') != 'vivosoc2' and config.get('pulpChip') != 'mia': return False
		elif config.get('pulpOmpVersion') == 'ovx':
			if config.get('pulpChip') not in ['pulpevo', 'pulp4']: return False
			if config.get('pulpCoreArchi').find('riscv') != -1 or config.get('pulpCoreArchi').find('ri5cy') != -1: return False
		else:
			if config.get('pulpChip') == 'pulpevo': return False
		return True

class ConfigItemIo(ConfigItem):
	pass

def getPossibleConfigurations(**kwargs):
	if len(kwargs.keys()) == 0: return [Configuration().getAll()]

	key = list(kwargs.keys())[0]
	value = kwargs.get(key)
	possibleValues = []
	regExp = re.compile("^" + value + "$")
	for possibleValue in configItems.get(key):
		if regExp.search(possibleValue): possibleValues.append({key:possibleValue})

	if len(kwargs.keys()) == 1:
		return possibleValues
	else:
		newConfigs = []
		newKwargs = kwargs.copy()
		del newKwargs[key]
		configs = getPossibleConfigurations(**newKwargs)
		for possibleValue in possibleValues:
			for config in configs:
				newDict = config.copy()
				newDict.update(possibleValue)
				newConfigs += [newDict]

		return newConfigs



class ConfigurationSet(object):

	def __init__(self, **kwargs):

		self.configs = []
		configs = getPossibleConfigurations(**kwargs)

		for config in configs:
			config = Configuration(**config)
			if config.isValidConfig(): self.configs.append(config)


	def get(self):
		return self.configs

class Configuration(object):

	configItems = OrderedDict([
		('platform', ConfigItemPlatform),
		('pulpChip', ConfigItemPulpChip),
    ('pulpChipFamily', ConfigItem),
		('pulpCoreArchi', ConfigItemPulpCoreArchi),
		('pulpCore', ConfigItemPulpCore),
		('pulpChipVersion', ConfigItemPulpChipVersion),
		('pulpArchiVersion', ConfigItemPulpArchiVersion),
		('pulpCompiler', ConfigItemPulpCompiler),
		('pulpRtVersion', ConfigItemPulpRtVersion),
		('pulpOmpVersion', ConfigItemPulpOmpVersion),
		('io', ConfigItemIo),
		('fcTcdmSize', ConfigItem),
		('fcStackSize', ConfigItem),
    ('l2Size', ConfigItem),
    ('l1Size', ConfigItem),
    ('romSize', ConfigItem),
    ('scmSize', ConfigItem),
    ('nbPe', ConfigItem),
    ('flag', UnknownConfigItem),
    ('nbCluster', ConfigItem),
    ('stackSize', ConfigItem),
		])

	def getGroups(self):
		groups = []
		for key,value in self.configItems.items():
			itemGroups = value.getGroups(self)
			for group in itemGroups:
				if not group in groups: groups.append(group)
		return groups

	def getCoreCountersNames(self):
		return self.configItems.get('pulpCoreArchi').getCountersNames()

	def setConfigItem(self, name, value, useRegExp=False):
		self.touched[name] = True

		if self.configItems.get(name) == None:
			configItem = Configuration.configItems.get(name)
			if configItem == None: configItem = ConfigItem
			self.configItems[name] = configItem(name)

		if not useRegExp: self.configItems[name].setValue(value)
		self.configValues[name] = value
		if name in self.specConfigKeys: self.specConfigValues[name] = value

	def getConfigItems(self):
                return self.configValues

	def getSpecConfigItems(self):
		dic  = self.specConfigValues.copy()
		dic.update(self.unkwownItems)
		return dic

	def getConfigItem(self, name):
		return self.configItems.get(key).getValue()

	def isValidConfig(self):
		for key,value in self.configItems.items():
			if not value.isValidConfig(self): return False
		return True


	def __init__(self, specKeys=None, getDefaults=True, useRegExp=False, name=None, **kwargs):
		# TODO Trying to see if we can get rid of this argument, remove it after a while if things are still stable

		getDefaults = True
		self.useRegExp = useRegExp
		self.configItems = {}
		self.configValues = {}
		self.specConfigValues = {}
		self.touched = {}
		self.props = {}
		self.unkwownItems = {}

		if name != None:
			kwargs = createItemsFromString(name)
			self.props = createPropsFromString(name)

		if useRegExp: getDefaults = False

		if specKeys == None:
			self.specConfigKeys = list(kwargs.keys())
		else:
			self.specConfigKeys = list(specKeys)

		# Fill items with empty values from the keys configDefaults
		if getDefaults:
			for key in configDefaults.keys():
				configItem = Configuration.configItems.get(key)
				if configItem == None: raise Exception('Got unknown key: ' + key)
				self.configItems[key] = configItem(key)
		else:
			for key in kwargs.keys():
				configItem = Configuration.configItems.get(key)
				if configItem == None: raise Exception('Got unknown key: ' + key)
				self.configItems[key] = configItem(key)

		# First set all specified items
		for key,value in kwargs.items():
			if not key in Configuration.configItems.keys():
				raise Exception('Unknown config item: ' + key)
			if Configuration.configItems.get(key).unknown:
				self.unkwownItems[key] = value
			else:
				self.setConfigItem(key, value, useRegExp=useRegExp)

		# Then ask the specified items to fill-in the missing item
		# Recall every config item until we reach a stable state
		# This is first done with items able to check other items values
		if getDefaults and not useRegExp:
			while True:
				values = list(self.configItems.values())
				items = {}
				items.update(self.configItems)
				self.touched = {}
				for key,value in items.items():
					value.setDefaultValues(self)
				if set(values) == set(self.configItems.values()): break

		# Now remove the one which has not been accessed while it was steble to remove
		# the data which was set during an unstable state

		items = {}
		items.update(self.configItems)
		for item, value in items.items():
			if not item in self.touched and not item in configDefaults.keys():
				del self.configItems[item]
				del self.configValues[item]

		# And then each item just take its default value
		if getDefaults:
                        for key,value in self.configItems.items():
                                value.setDefaultValue(self)

        # Do another round in case it has some effects
		if getDefaults and not useRegExp:
			while True:
				values = list(self.configItems.values())
				for key,value in self.configItems.items():
					value.setDefaultValues(self)
				if set(values) == set(self.configItems.values()): break

		if self.get('pulpChip') != None: self.properties = configs.pulp.PulpConfig.getConfigFromString(self.get('pulpChip'))

	# TODO should disappear once all the scripts have converged on this module for configuration management
	def getDeprecatedString(self):
		return convertConfigItemsToOldString(self.getSpecConfigItems())

	def getString(self):
		return convertConfigItemsToString(self.getSpecConfigItems(), self.unkwownItems)

	def __str__(self):
		return self.getString()

	def isSet(self, name):
		self.touched[name] = True
		return self.specConfigValues.get(name) != None

	def markSet(self, name):
		self.specConfigValues[name] = self.get(name)
		self.specConfigKeys.append(name)

	def getAll(self):
		return self.getConfigItems()

	def get(self, name):

		if name in self.unkwownItems.keys():
			return self.unkwownItems.get(name)

		if name.find('prop(') != -1:
			name = name.replace('prop(', '').replace(')', '')
			return self.properties.get(name)

		if name.find('prop:') != -1:
			name = name.replace('prop:', '')
			return self.properties.get(name)

		if name.find('version(') != -1:
			name = name.replace('version(', '').replace(')', '')
			return self.properties.get(name)

		if name.find('version:') != -1:
			name = name.replace('version:', '')
			return self.properties.get(name)

		self.touched[name] = True
		return self.getConfigItems().get(name)

	def set(self, name, value):	
		self.setConfigItem(name, value)

	def matchConfig(self, config):
		for key,value in config.getSpecConfigItems().items():
			if key in self.getConfigItems() and not re.compile("^" + value + "$").search(self.getConfigItems().get(key)):
				return False
		if self.properties != None:
			for propKey, propValue in config.props.items():
				if self.properties.get(propKey) != propValue: return False
		return True

	def matchConfigs(self, configs):
		for config in configs:
			if self.matchConfig(config): return True
		return False

	def timeoutToTime(self, timeout):
		nbCpu = 1
		if timeout.find('@') != -1:
			timeout, nbCpu = timeout.split('@')
		platform = self.configItems.get('platform').platform
		if platform != None: return platform.scaleTimeout(int(timeout), nbCpu)
		else: return int(timeout)


class Platform(object):
	pass

class PlatformRtl(Platform):

	name = "rtl"

	def scaleTimeout(self, cycles, nbCpu):
		# Assumes 500 ips with no effect from number of code 1 min boot time
		return int(cycles / 500) + 60

class PlatformHsa(Platform):

	name = "hsa"

	def scaleTimeout(self, cycles, nbCpu):
		# Assumes 50 Mips with no effect from number of code 20 seconds boot time and minimum 1 min
		return min(int(cycles / 50000000) + 20, 60)

class PlatformGvsoc(Platform):

	name = "gvsoc"

	def scaleTimeout(self, cycles, nbCpu):
		# Assumes 5Mips divide by number of cores with no boot time and at least 30 seconds
		return int(max(cycles * nbCpu / 5000000, 30))

class PlatformFpga(Platform):

	name = "fpga"

	def scaleTimeout(self, cycles, nbCpu):
		# Assumes 50 Mips with no effect from number of code 20 seconds boot time and minimum 1 min
		return min(int(cycles / 50000000) + 20, 60)

class PlatformBoard(Platform):

	name = "board"

	def scaleTimeout(self, cycles, nbCpu):
		# Assumes 50 Mips with no effect from number of code 20 seconds boot time and minimum 1 min
		return min(int(cycles / 50000000) + 20, 60)

pulpPlatforms = [PlatformRtl, PlatformFpga, PlatformGvsoc, PlatformHsa, PlatformBoard]

def getConfig(*args, **kwargs):
	return Configuration(getDefaults=True, **kwargs)

def createConfig(*args, **kwargs):
	return Configuration(getDefaults=False, *args, **kwargs)

def getItemsFromString(confString):
	items = []
	if confString == '': return items
	for prop2 in confString.split('_'):
		for prop in prop2.split(':'):
			items.append(prop)
	return items


def createPropsFromString(confString):
	items = {}
	for item in getItemsFromString(confString):
		if item.find('version(') != -1 or item.find('prop(') != -1:
			first = item.find('(') + 1
			prop = item[first:len(item)-1]
			key,value = prop.split('=', 1)
			items[key] = int(value)
		if item.find('version:') != -1 or item.find('prop:') != -1:
			first = item.find(':') + 1
			prop = item[first:len(item)]
			key,value = prop.split('=', 1)
			items[key] = int(value)
	return items


def createItemsFromString(confString):
	items = {}
	for prop in getItemsFromString(confString):
		if prop.find('version(') != -1 or prop.find('prop(') != -1: continue
		if prop.find('version:') != -1 or prop.find('prop:') != -1: continue
		key,value = prop.split('=', 1)
		items[key] = value
	return items

def createConfigFromString(confString, getDefaults=False):
	items = {}
	keysList = []
	for prop in confString.split(':'):
		key,value = prop.split('=', 1)
		items[key] = value
		keysList.append(key)
	return Configuration(getDefaults=getDefaults, **items)

def createConfigsFromString(confString):
	configs = []
	for config in confString.split():
		configs.append(createConfigFromString(config))
	return configs

# TODO this function is too obscure, it should be removed
def createConfigsFromRegexp(confString, getDefaults=False, onlyValids=True):

    unkwownItems = {}

    activeConfigs = []
    if confString == None or confString == '': return getConfigurationSet({})

    for configLine in confString.split():
        configList = []
        specKeys = createItemsFromString(configLine).keys()
        keysList = []
        for item2 in configLine.split('_'):
          for item in item2.split(':'):
            key, val = item.split('=', 1)
            if val == None: continue
            keysList.append(key)
            if not key in configItems.keys(): raise Exception("Invalid config item name: " + key)
            regExp = re.compile("^" + val + "$")
            # Go through the items to duplicate the configs for the active items
            newConfigList = []
            if configItems.get(key) != None:
              for itemVal in configItems.get(key):
                  if regExp.search(itemVal):
                      if len(configList) == 0:
                      	config = Configuration(specKeys=specKeys, getDefaults=getDefaults, **{key : itemVal})
                      	newConfigList.append(config)
                      else:
                          for conf in configList:
                          	newConf = conf.getAll().copy()
                          	newConf[key] = itemVal
                          	config = Configuration(specKeys=specKeys, getDefaults=getDefaults, **newConf)
                          	newConfigList.append(config)
  
              if len(newConfigList) != 0: configList = newConfigList
            else:
            	if not key in unkwownItems.keys(): unkwownItems[key] = [val]
            	else: unkwownItems.get(key).append(val)
        activeConfigs += configList

    validConfigs = []
    for config in activeConfigs:
    	if not onlyValids or config.isValidConfig(): validConfigs.append(config)

    for config in validConfigs:
    	config.unkwownItems = unkwownItems

    return validConfigs

def getDefaultChip():
	return configDefaults.get('pulpChip')

def getDefaultConfigItems(values):
	return Configuration(**values).getAll()

def getConfigurationSet(values):
	return ConfigurationSet(**values).get()

def getConfigString(key, value):
	return '%s=%s' % (key, value)

def convertConfigItemsToString(configItems, unkwownItems={}):
	configList = []
	for key in getConfigItems():
		if configItems.get(key) != None:
			configList.append(getConfigString(key, configItems.get(key)))

	for key, value in unkwownItems.items():
		for val in value:
			configList.append(getConfigString(key, val))

	return ':'.join(configList)

def convertConfigItemsToOldString(configItems):
	# TODO should disappear once all the scripts have converged on this module for configuration management
	configList = []
	for key in getConfigItems():
		if configItems.get(key) != None:
			configList.append(getConfigString(key, configItems.get(key)))
	return '_'.join(configList)

def getDefaultConfigItemsString(values):
	return convertConfigItemsToString(getDefaultConfigItems(values))



def getConfigItems(): 
	return configKeys
	#return configItems.keys()

def getConfigItemValues(name): 
	return configItems.get(name)

def getDefaultConfigItem(key):
	if key != 'pulpChip': return None
	else: return defaultPulpChip
