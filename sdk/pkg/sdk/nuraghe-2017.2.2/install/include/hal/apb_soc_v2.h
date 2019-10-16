/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_APB_SOC_V2_H__
#define __HAL_APB_SOC_V2_H__

#include "archi/pulp.h"

static inline void apb_soc_status_set(unsigned int value) {
  pulp_write32(APB_SOC_CTRL_ADDR + APB_SOC_CORESTATUS_OFFSET, value | (1<<APB_SOC_STATUS_EOC_BIT));
}

static inline unsigned int apb_soc_nbCores() {
  return pulp_read16(APB_SOC_CTRL_ADDR + APB_SOC_INFO_CORES_OFFSET);
}

static inline unsigned int apb_soc_nbClusters() {
  return pulp_read16(APB_SOC_CTRL_ADDR + APB_SOC_INFO_CLUSTERS_OFFSET);
}

static inline unsigned int apb_soc_padfun_get(unsigned int id) {
  return pulp_read32(APB_SOC_CTRL_ADDR + APB_SOC_PADFUN_OFFSET(id));
}

static inline void apb_soc_padfun_set(unsigned int id, unsigned int value) {
  pulp_write32(APB_SOC_CTRL_ADDR + APB_SOC_PADFUN_OFFSET(id), value);
}

static inline unsigned int apb_soc_padcfg_get(unsigned int id) {
  return pulp_read32(APB_SOC_CTRL_ADDR + APB_SOC_PADCFG_OFFSET(id));
}

static inline void apb_soc_padcfg_set(unsigned int id, unsigned int value) {
  pulp_write32(APB_SOC_CTRL_ADDR + APB_SOC_PADCFG_OFFSET(id), value);
}


static inline void apb_soc_pad_set_function(unsigned int pad, unsigned int func) {
	unsigned int padfunId = APB_SOC_PADFUN_NO(pad);
	unsigned int padBit = APB_SOC_PADFUN_BIT(pad);
	unsigned int oldval = apb_soc_padfun_get(padfunId) & ~(((1<<APB_SOC_PADFUN_SIZE)-1) << padBit);
	unsigned int newVal = oldval | (func << padBit);
	apb_soc_padfun_set(padfunId, newVal);
}

static inline void apb_soc_pad_set_config(unsigned int pad, unsigned int cfg) {
	unsigned int padcfgId = APB_SOC_PADCFG_NO(pad);
	unsigned int padBit = APB_SOC_PADCFG_BIT(pad);
	unsigned int oldval = apb_soc_padcfg_get(padcfgId) & ~(((1<<APB_SOC_PADCFG_SIZE)-1) << padBit);
	unsigned int newVal = oldval | (cfg << padBit);
	apb_soc_padcfg_set(padcfgId, newVal);
}

#endif
