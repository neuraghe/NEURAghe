# 
# Copyright (C) 2015 ETH Zurich and University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#
# Authors: Germain Haugou (germain.haugou@gmail.com)
#

import configs.pulp.PulpConfigCommon as pulpConfig
import configs.pulp.gap.padframe as padframe

class Udma(object):

  rfId =    0
  spim0Id = 1
  spim1Id = 2
  spim2Id = 3
  uartId =  4
  i2c0Id =  5
  i2c1Id =  6
  tcdmId =  7
  i2sId =   8
  camId =   9

  rxChannelOffset = 0x00
  txChannelOffset = 0x10

  def channelBase(self, id):
    return id * 0x40

class GapConfig(pulpConfig.Config):

  versions = {
    'apb_soc'    : 2,
    'mchan'      : 6,
    'udma'       : 2,
    'eventUnit'  : 3,
    'riscv'      : 4,
    'soc'        : 5,
    'hwce'       : 4,
    'icache_ctrl': 2,
  }

  properties = {
    'hasFc'        : 1,
    'hasUart'      : 1,
    'hasI2s'       : 1
  }

  nbCluster = 1

  socEu_lvdsTx_event   = 0
  socEu_lvdsRx_event   = 1
  socEu_spim0Tx_event  = 2
  socEu_spim0Rx_event  = 3
  socEu_spim1Tx_event  = 4
  socEu_spim1Rx_event  = 5
  socEu_spim2Tx_event  = 6
  socEu_spim2Rx_event  = 7
  socEu_uartTx_event   = 8
  socEu_uartRx_event   = 9
  socEu_i2c0Tx_event   = 10
  socEu_i2c0Rx_event   = 11
  socEu_i2c1Tx_event   = 12
  socEu_i2c1Rx_event   = 13
  socEu_tcdmTx_event   = 14
  socEu_tcdmRx_event   = 15
  socEu_i2sCh0_event   = 16
  socEu_i2sCh1_event   = 17
  socEu_cam_event      = 18

  socEu_lvdsHp0_event   = 32
  socEu_lvdsHp1_event   = 33
  socEu_spim0Eot_event = 34
  socEu_spim1Eot_event = 35
  socEu_spim2Eot_event = 36
  socEu_uartExtra_event = 37
  socEu_i2c0Extra_event = 38
  socEu_i2c1Extra_event = 39
  socEu_i2sExtra_event  = 40
  socEu_camExtra_event  = 41
  socEu_gpio_event      = 42

  socEu_firstSwEvent   = 48
  socEu_nbSwEvents     = 8
  socEu_refClock_event = 56

  soc_peripherals_base = 0x1A100000

  soc_apb_base = soc_peripherals_base + 0x3000

  def __init__(self, decorators={}):

    super(GapConfig, self).__init__(decorators=decorators)

    self.soc = pulpConfig.Soc_v5_1(self)

    self.soc.setPadframe(padframe.Padframe())

    self.udma = Udma()

    self.clusters = []

    for cid in range(0, self.nbCluster):
      cluster = pulpConfig.Cluster_v5(self)
      self.clusters.append(cluster)
