/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_APB_SOC_V1_H__
#define __HAL_APB_SOC_V1_H__

#include "archi/pulp.h"

static inline unsigned int apb_soc_nbCores() {
  return pulp_read16(APB_SOC_CTRL_ADDR + APB_SOC_INFO_CORES_OFFSET);
}

static inline unsigned int apb_soc_nbClusters() {
  return pulp_read16(APB_SOC_CTRL_ADDR + APB_SOC_INFO_CLUSTERS_OFFSET);
}

#endif
