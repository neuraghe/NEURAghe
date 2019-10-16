# 
# Copyright (C) 2015 ETH Zurich and University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#
# Authors: Germain Haugou (germain.haugou@gmail.com)
#

import configs.pulp.gap.config
import configs.pulp.FulmineConfig
import configs.pulp.Vivosoc2Config
import configs.pulp.BigpulpConfig
import configs.pulp.MiaConfig
import configs.pulp.HoneyConfig
import configs.pulp.Pulp3Config
import configs.pulp.Pulp4Config
import configs.pulp.PulpevoConfig
import configs.pulp.ExaconvConfig
import configs.pulp.WolfeConfig
import configs.pulp.NuragheConfig

def getConfigFromString(configString, decorators={}):

	if configString == 'mia':
		config = configs.pulp.MiaConfig.MiaConfig(decorators=decorators)
	elif configString == 'pulp3':
		config = configs.pulp.Pulp3Config.Pulp3Config(decorators=decorators)
	elif configString == 'pulpevo':
		config = configs.pulp.PulpevoConfig.PulpevoConfig(decorators=decorators)
	elif configString == 'honey':
		config = configs.pulp.HoneyConfig.HoneyConfig(decorators=decorators)
	elif configString == 'pulp4':
		config = configs.pulp.Pulp4Config.Pulp4Config(decorators=decorators)
	elif configString == 'GAP':
		config = configs.pulp.gap.config.GapConfig(decorators=decorators)
	elif configString == 'fulmine':
		config = configs.pulp.FulmineConfig.FulmineConfig(decorators=decorators)
	elif configString == 'fulmine8':
		config = configs.pulp.FulmineConfig.FulmineConfig(decorators=decorators)
	elif configString == 'vivosoc2':
		config = configs.pulp.Vivosoc2Config.Vivosoc2Config(decorators=decorators)
	elif configString == 'bigpulp':
		config = configs.pulp.BigpulpConfig.BigpulpConfig(decorators=decorators)
	elif configString == 'bigpulp-z-7020':
		config = configs.pulp.BigpulpConfig.BigpulpConfig(decorators=decorators)
	elif configString == 'bigpulp-z-7045':
		config = configs.pulp.BigpulpConfig.BigpulpConfig(decorators=decorators)
	elif configString == 'exaconv':
		config = configs.pulp.ExaconvConfig.ExaconvConfig(decorators=decorators)
	elif configString == 'wolfe':
		config = configs.pulp.WolfeConfig.WolfeConfig(decorators=decorators)
	elif configString == 'nuraghe':
		config = configs.pulp.NuragheConfig.NuragheConfig(decorators=decorators)
	elif configString == 'pulpino':
		config = None
	else:    
		raise Exception('Unknown Pulp chip: %s' % (configString))

	return config
