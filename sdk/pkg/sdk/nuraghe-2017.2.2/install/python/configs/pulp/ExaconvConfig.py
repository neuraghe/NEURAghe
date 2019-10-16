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

class ExaconvConfig(pulpConfig.Config):

  versions = {
    'mchan'      : 6,
    'eventUnit'  : 3,
    'riscv'      : 4,
    'soc'        : 5,
    'icache_ctrl': 2,
  }

  properties = {
  }

  nbCluster = 4

  socEu_firstSwEvent   = 48
  socEu_nbSwEvents     = 8
  socEu_refClock_event = 56


  def __init__(self, decorators={}):
    super(ExaconvConfig, self).__init__(decorators=decorators)

    self.soc = pulpConfig.Soc_v5_2(self)

    self.clusters = []

    for cid in range(0, self.nbCluster):
      cluster = pulpConfig.Cluster_v5(self)
      self.clusters.append(cluster)
