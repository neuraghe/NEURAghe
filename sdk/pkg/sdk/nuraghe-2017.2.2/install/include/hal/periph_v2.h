/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_PERIPH_V1_H__
#define __HAL_PERIPH_V1_H__

static inline void eoc_fetch_enable_base(unsigned int base, unsigned int mask) {
  pulp_write32(base + PULP_EOC_OFFSET + EOC_FETCH_OFFSET, mask);
}

static inline void eoc_fetch_enable_remote(int cid, unsigned int mask) {
  pulp_write32(PULP_CLUSTER_REMOTE_BASE(cid) + PULP_EOC_REMOTE_OFFSET + EOC_FETCH_OFFSET, mask);
}

static inline void eoc_fetch_enable(unsigned int mask) {
  eoc_fetch_enable_base(PULP_CLUSTER_BASE, mask);
}

static inline void plp_ctrl_fetchen_base(unsigned int base, unsigned int mask) {
  pulp_write32(base + PULP_EOC_OFFSET + EOC_FETCH_OFFSET, mask);
}

static inline void plp_ctrl_fetchen(unsigned int mask) {
  plp_ctrl_fetchen_base(PULP_CLUSTER_BASE, mask);
}

static inline void plp_ctrl_bootaddr_set(unsigned int bootAddr) {
  pulp_write32(EOC_UNIT_BASE_ADDR + 0x40, bootAddr);
}

static inline unsigned int plp_ctrl_bootaddr_get() {
  return pulp_read32(EOC_UNIT_BASE_ADDR + 0x40);
}


static inline void eoc_fetch_enable_fc(unsigned int mask) {
  eoc_fetch_enable_base(0x50200000, mask);
}

#endif