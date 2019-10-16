# 
# Copyright (C) 2015 ETH Zurich and University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#
# Authors: Germain Haugou (germain.haugou@gmail.com)
#

class Mmap(object):

  def __init__(self, base, size):
    self.base = base
    self.size = size

class Ip(object):

  def __init__(self, config):
    self.modelProps = {}
    self.props = {}
    self.topConfig = config
    self.ips = {}

  def add(self, name, comp, base=None, size=None):
    self.props[name] = comp
    if base != None: comp.map = Mmap(base, size)
    self.ips[name] = comp

  def set(self, **kwargs):
    forModel = kwargs.get('forModel')
    if forModel == None: forModel = True
    else: del kwargs['forModel']
    if forModel: self.modelProps.update(kwargs)
    self.props.update(kwargs)

  def get(self, name):
    return self.props.get(name)

  def getModelProps(self):
    return self.modelProps

  def getAll(self):
    return self.props

  def getClass(self, name, version):
    comp = self.topConfig.classesMap.get(name)
    if comp == None: return None
    return comp.get(version)

class SharedPcache(object):

	def __init__(self, size, lineSize, banks, ways, ports):
		self.size = size
		self.banks = banks
		self.ways = ways
		self.lineSize = lineSize
		self.ports = ports

class Hwce(Ip):

	def __init__(self, config, nbMasterPorts=4):
		super(Hwce, self).__init__(config)
		self.set(nbMasterPorts=nbMasterPorts)

class Hwce_v3(Hwce):

  def __init__(self, config):
    super(Hwce_v3, self).__init__(config)
    self.set(version      = 3, forModel=False)
    self.set(className    = self.getClass('hwce', 3))


class Hwce_v4(Hwce):

  def __init__(self, config):
    super(Hwce_v4, self).__init__(config)
    self.set(version      = 4, forModel=False)
    self.set(className    = self.getClass('hwce', 4))


class Adc_v1(Ip):

  def __init__(self, config):
    super(Adc_v1, self).__init__(config)
    self.set(version      = 1)
    self.set(className    = self.getClass('adc', 1))

class Uart_v1(Ip):

  def __init__(self, config):
    super(Uart_v1, self).__init__(config)
    self.set(version      = 1, forModel=False)
    self.set(className    = self.getClass('uart', 1))

class Icache_ctrl_v1(Ip):

  def __init__(self, config):
    super(Icache_ctrl_v1, self).__init__(config)
    self.set(version      = 1, forModel=False)
    self.set(className    = self.getClass('icache_ctrl', 1))

class Icache_ctrl_v2(Ip):

  def __init__(self, config):
    super(Icache_ctrl_v2, self).__init__(config)
    self.set(version      = 2, forModel=False)
    self.set(className    = self.getClass('icache_ctrl', 2))



class Apb_v1(Ip):

  def __init__(self, config):
    super(Apb_v1, self).__init__(config)
    self.set(version      = 1, forModel=False)
    self.set(className    = self.getClass('apb_soc', 1))


class Apb_v2(Ip):

  def __init__(self, config):
    super(Apb_v2, self).__init__(config)
    self.set(version      = 2, forModel=False)
    self.set(className    = self.getClass('apb_soc', 2))


class Pmu_v1(Ip):

  def __init__(self, config):
    super(Pmu_v1, self).__init__(config)
    self.set(version      = 1, forModel=False)
    self.set(className    = self.getClass('pmu', 1))

    self.set(nbDomains    = 2)

    self.set(pmu0Evt      = 26, forModel=False)
    self.set(pmu1Evt      = 27, forModel=False)
    self.set(pmu2Evt      = 28, forModel=False)
    self.set(pmu3Evt      = 29, forModel=False)
    self.set(pmu4Evt      = 30, forModel=False)
    self.set(pmu5Evt      = 31, forModel=False)



class Udma(Ip):

  def __init__(self, config, nbAdcChannels):
    super(Udma, self).__init__(config)
    self.set(nbAdcChannels=nbAdcChannels)
    self.set(rxChannelOffset=0x00, forModel=False)
    self.set(txChannelOffset=0x10, forModel=False)

class Udma_v1(Udma):

  def __init__(self, config, nbAdcChannels=0, nbInternalEvents=11, nbExternalEvents=8):
    super(Udma_v1, self).__init__(config, nbAdcChannels=nbAdcChannels)

    self.set(version      = 1)

    self.set(className    = self.getClass('udma', 1))

    self.set(nbInternalEvents=nbInternalEvents)
    self.set(nbExternalEvents=nbExternalEvents)

    self.set(nbI2cChannels= 1, forModel=False)
    self.set(nbSpimChannels= 1, forModel=False)

    self.set(spim0TxEvt     = 0, forModel=False)
    self.set(spim0RxEvt     = 1, forModel=False)
    self.set(spim0EotEvt    = 2, forModel=False)
    self.set(uartTxEvt      = 3, forModel=False)
    self.set(uartRxEvt      = 4, forModel=False)
    self.set(i2c0TxEvt       = 5, forModel=False)
    self.set(i2c0RxEvt       = 6, forModel=False)
    self.set(i2sFirstEvt    = 7, forModel=False)

    self.set(spim0_offset     = 0x000, forModel=False)
    self.set(uart_offset      = 0x080, forModel=False)
    self.set(spim1_offset     = 0x300, forModel=False)
    self.set(i2c0_offset       = 0x180, forModel=False)

class Udma_v1_1(Udma_v1):

  def __init__(self, config):
    super(Udma_v1_1, self).__init__(config, nbAdcChannels=4, nbInternalEvents=14, nbExternalEvents=11)

    self.set(hasSetup1      = 1)

    self.set(spim0TxEvt     = 0, forModel=False)
    self.set(spim0RxEvt     = 1, forModel=False)
    self.set(spim0EotEvt    = 2, forModel=False)
    self.set(spim1TxEvt     = 3, forModel=False)
    self.set(spim1RxEvt     = 4, forModel=False)
    self.set(spim1EotEvt    = 5, forModel=False)
    self.set(uartTxEvt      = 6, forModel=False)
    self.set(uartRxEvt      = 7, forModel=False)
    self.set(i2cTxEvt       = 8, forModel=False)
    self.set(i2cRxEvt       = 9, forModel=False)
    self.set(adcFirstEvt    = 10, forModel=False)

    self.set(adc0_id  = 6, forModel=False)
    self.set(adc1_id  = 7, forModel=False)
    self.set(adc2_id  = 8, forModel=False)
    self.set(adc3_id  = 9, forModel=False)

    self.set(nbI2cChannels= 1, forModel=False)
    self.set(nbSpimChannels= 2, forModel=False)

    self.set(spim0_offset     = 0x000, forModel=False)
    self.set(uart_offset      = 0x080, forModel=False)
    self.set(adc0_offset      = 0x100, forModel=False)
    self.set(adc1_offset      = 0x110, forModel=False)
    self.set(adc2_offset      = 0x120, forModel=False)
    self.set(adc3_offset      = 0x130, forModel=False)
    self.set(spim1_offset     = 0x300, forModel=False)
    self.set(i2c0_offset       = 0x180, forModel=False)

class Udma_v2(Udma):

  def __init__(self, config, nbAdcChannels=0, nbI2cPorts=4):
    super(Udma_v2, self).__init__(config, nbAdcChannels=nbAdcChannels)

    self.set(version      = 2)

    self.set(className    = self.getClass('udma', 2))

    self.set(hasTcdmChannel   = True, forModel=False)
    self.set(nbI2cPorts   = nbI2cPorts)
    self.set(nbI2sChannels= 2)
    self.set(nbI2cChannels= 2, forModel=False)
    self.set(nbSpimChannels= 3, forModel=False)
    self.set(nbCamChannels= 1, forModel=False)

    self.set(lvdsTxEvt    = 0, forModel=False)
    self.set(lvdsRxEvt    = 1, forModel=False)
    self.set(spim0TxEvt   = 2, forModel=False)
    self.set(spim0RxEvt   = 3, forModel=False)
    self.set(spim1TxEvt   = 4, forModel=False)
    self.set(spim1RxEvt   = 5, forModel=False)
    self.set(spim2TxEvt   = 6, forModel=False)
    self.set(spim2RxEvt   = 7, forModel=False)
    self.set(uartTxEvt    = 8, forModel=False)
    self.set(uartRxEvt    = 9, forModel=False)
    self.set(i2c0TxEvt     = 10, forModel=False)
    self.set(i2c0RxEvt     = 11, forModel=False)
    self.set(i2c1TxEvt    = 12, forModel=False)
    self.set(i2c1RxEvt    = 13, forModel=False)
    self.set(tcdmTxEvt    = 14, forModel=False)
    self.set(tcdmRxEvt    = 15, forModel=False)
    self.set(i2sCh0Evt    = 16, forModel=False)
    self.set(i2sCh1Evt    = 17, forModel=False)
    self.set(cam0Evt      = 18, forModel=False)

    self.set(lvdsHp0Evt   = 32, forModel=False)
    self.set(lvdsHp1Evt   = 33, forModel=False)
    self.set(spim0EotEvt  = 34, forModel=False)
    self.set(spim1EotEvt  = 35, forModel=False)
    self.set(spim2EotEvt  = 36, forModel=False)
    self.set(uartEotEvt   = 37, forModel=False)
    self.set(i2c0ExtraEvt = 38, forModel=False)
    self.set(i2c1ExtraEvt = 39, forModel=False)
    self.set(i2sExtraEvt  = 40, forModel=False)
    self.set(cam0EotEvt   = 41, forModel=False)
    
    self.set(rf_id   = 0, forModel=False)
    self.set(spim0_id  = 1, forModel=False)
    self.set(spim1_id  = 2, forModel=False)
    self.set(spim2_id  = 3, forModel=False)
    self.set(uart_id   = 4, forModel=False)
    self.set(i2c0_id   = 5, forModel=False)
    self.set(i2c1_id   = 6, forModel=False)
    self.set(tcdm_id   = 7, forModel=False)
    self.set(i2s_id    = 8, forModel=False)
    self.set(cam0_id   = 9, forModel=False)

    self.set(rf_offset     = 0x000, forModel=False)
    self.set(spim0_offset  = 0x040, forModel=False)
    self.set(spim1_offset  = 0x080, forModel=False)
    self.set(spim2_offset  = 0x0C0, forModel=False)
    self.set(uart_offset   = 0x100, forModel=False)
    self.set(i2c0_offset   = 0x140, forModel=False)
    self.set(i2c1_offset   = 0x180, forModel=False)
    self.set(tcdm_offset   = 0x1C0, forModel=False)
    self.set(i2s0_offset   = 0x200, forModel=False)
    self.set(i2s1_offset   = 0x210, forModel=False)
    self.set(cam0_offset   = 0x240, forModel=False)

    self.set(nbChannels = 10)

    self.set(channel_area_size = 0x40, forModel=False)
    self.set(periph_regs_channel_offset = 0x20, forModel=False)


class ClusterTemplate(Ip):

	def __init__(self, config, clusterConfig):
		super(ClusterTemplate, self).__init__(config)
		self.config = clusterConfig

	def getConfig(self):
		return self.config

	def updateConfig(self, config):
		self.config = config

	def sharedPcache(self, size, lineSize, banks, ways, ports):
		self.pcache = SharedPcache(size, lineSize, banks, ways, ports)



class Cluster_v5(ClusterTemplate):
  
  def __init__(self, config):

    cluster_config = {
      'nbPe'              : 4,
      'pcache.size'       : 4*1024,
      'pcache.lineSize'   : 16,
      'pcache.ways'       : 4,
      'pcache.bankFactor' : 1,
    }

    super(Cluster_v5, self).__init__(config, cluster_config)
    periphBase = 0x00200000

    self.updateConfig(cluster_config)

    self.add('hwce', Hwce_v4(config), periphBase + 0x00001000, 0x00000400)
    self.add('icache_ctrl', Icache_ctrl_v2(config))


  def updateConfig(self, config):
    ClusterTemplate.updateConfig(self, config)

    self.sharedPcache(size=config.get('pcache.size'), lineSize=config.get('pcache.lineSize'), ways=config.get('pcache.ways'), banks=config.get('pcache.bankFactor') * config.get('nbPe'), ports=config.get('nbPe'))

class Cluster_v4_common(ClusterTemplate):
  
  def __init__(self, config):

    cluster_config = {
      'nbPe'              : 4,
      'pcache.size'       : 4*1024,
      'pcache.lineSize'   : 16,
      'pcache.ways'       : 4,
      'pcache.bankFactor' : 1,
    }

    super(Cluster_v4_common, self).__init__(config, cluster_config)
    periphBase = 0x00200000

    self.updateConfig(cluster_config)

    self.add('hwce', Hwce_v4(config), periphBase + 0x00001000, 0x00000400)
    self.add('icache_ctrl', Icache_ctrl_v1(config))


  def updateConfig(self, config):
    ClusterTemplate.updateConfig(self, config)

    self.sharedPcache(size=config.get('pcache.size'), lineSize=config.get('pcache.lineSize'), ways=config.get('pcache.ways'), banks=config.get('pcache.bankFactor') * config.get('nbPe'), ports=config.get('nbPe'))

# Used for Fulmine
class Cluster_v4(Cluster_v4_common):

  irqs = {
    'udma0'   : 10,
    'udma1'   : 11,
    'udma2'   : 12,
    'udma3'   : 13,
    'udma4'   : 14,
    'udma5'   : 15,
    'udma6'   : 16,
    'udma7'   : 17,
  }

  def __init__(self, config):
    super(Cluster_v4, self).__init__(config)
    periphBase = 0x00200000
    self.add('hwce', Hwce_v3(config), periphBase + 0x00001800, 0x00000400)



# Used for vivosoc2
class Cluster_v4_1(Cluster_v5):

  irqs = {
    'udma0'   : 9,
    'udma1'   : 10,
    'udma2'   : 11,
    'udma3'   : 12,
    'udma4'   : 13,
    'udma5'   : 14,
    'udma6'   : 15,
    'udma7'   : 16,
  }

class Cluster_v3(Cluster_v4):

  def __init__(self, config):
    super(Cluster_v3, self).__init__(config)

    self.add('icache_ctrl', Icache_ctrl_v1(config))



#
# PADFRAME
#

class Pad(object):

    def __init__(self, id, name, muxId=0, group=None):
        self.id = id
        self.name = name
        self.muxId = muxId
        self.group = group

class Padframe_template(object):

    def __init__(self, nbPads, pads):
        super(Padframe_template, self).__init__()
        self.nbPads = nbPads
        self.pads = pads

# Padframe component that connects fabric internal components to the pads
# and does the multiplexing
class Padframe_v1(Ip):

    def __init__(self, config, padframe):
        super(Padframe_v1, self).__init__(config)
        self.nbPads = padframe.nbPads
        self.pads = padframe.pads



#
# GPIO
#

class Gpio_v2(Ip):

    def __init__(self, config):
        super(Gpio_v2, self).__init__(config)
        self.set(className    = self.getClass('gpio', 2))
        self.set(nbGpios      = 32)








class SocTemplate(Ip):

    def __init__(self, config):
        super(SocTemplate, self).__init__(config)

    def setPadframe(self, padframe):
        self.add('padframe', Padframe_v1(self.topConfig, padframe))




# Used for mia
class Soc_v3(SocTemplate):

  def __init__(self, config):

    periphBase = 0x1A100000
 
    super(Soc_v3, self).__init__(config)
    self.add('uart', Uart_v1(config), periphBase + 0x00003000, 0x00001000)


# Used for pulp3, honey
class Soc_v3_1(SocTemplate):

  def __init__(self, config):

    periphBase = 0x1A100000
 
    super(Soc_v3_1, self).__init__(config)

    periphBase = 0x1A100000
 
    self.add('apb_soc', Apb_v1(config))
    self.add('uart', Uart_v1(config), periphBase + 0x00003000, 0x00001000)



# Used for fulmine
class Soc_v4(SocTemplate):

  def __init__(self, config):

    super(Soc_v4, self).__init__(config)

    self.add('udma', Udma_v1(config))
    self.add('apb_soc', Apb_v1(config))
    self.add('uart', Uart_v1(config))



# Used for vivosoc2
class Soc_v4_1(SocTemplate):

  def __init__(self, config):

    super(Soc_v4_1, self).__init__(config)

    self.add('udma', Udma_v1_1(config))
    self.add('adc', Adc_v1(config))
    self.add('apb_soc', Apb_v1(config))
    self.add('uart', Uart_v1(config))


# Used for bigpulp
class Soc_v4_2(SocTemplate):

  def __init__(self, config):

    super(Soc_v4_2, self).__init__(config)

    periphBase = 0x1A100000
 
    self.add('apb_soc', Apb_v1(config))
    self.add('uart', Uart_v1(config), periphBase + 0x00002000, 0x00001000)

  def __init__(self, config):

    super(Soc_v4_2, self).__init__(config)

    periphBase = 0x1A100000
 
    self.add('apb_soc', Apb_v1(config))
    self.add('uart', Uart_v1(config), periphBase + 0x00002000, 0x00001000)

# SOC v5
# Used for pulp4
class Soc_v5(SocTemplate):

  def __init__(self, config):
    super(Soc_v5, self).__init__(config)

    self.periphBase = 0x1A100000

    self.add('udma', Udma_v2(config))
    self.add('apb_soc', Apb_v2(config))
    self.add('uart', Uart_v1(config))
    self.add('gpio', Gpio_v2(self.topConfig), self.periphBase + 0x00001000, 0x00001000)

# SOC v5.2
# Used for exaconv
class Soc_v5_2(SocTemplate):

  def __init__(self, config):
    super(Soc_v5_2, self).__init__(config)

# SOC v5.1
# Used for GAP
class Soc_v5_1(Soc_v5):

  def __init__(self, config):
    super(Soc_v5_1, self).__init__(config)

    self.add('pmu', Pmu_v1(config), self.periphBase + 0x00006000, 0x00000800)
    self.add('uart', Uart_v1(config))


class Config(object):

  properties = {
  }

  def __init__(self, decorators={}):
    self.decorators = decorators
    self.classesMap = {}
    for key,value in self.decorators.items():
      if key == 'classes': self.classesMap = value

  def hasIp(self, name):
    return self.versions.get(name) != None

  def getClass(self, name):
    return self.classes.get(name)

  def getName(self, name):
    return name

  def getMmap(self, name):
    return self.mmaps.get(name)

  def get(self, name):
    result = self.versions.get(name)
    if result != None: return result
    else: return self.properties.get(name)
