/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_SOC_EU_V1_H__
#define __HAL_SOC_EU_V1_H__

#include "archi/pulp.h"

static inline void soc_eu_eventMask_set(unsigned int reg, unsigned int value) {
  pulp_write32(SOC_EVENT_UNIT_ADDR + reg, value);
}

static inline unsigned int soc_eu_eventMask_get(unsigned int reg) {
  return pulp_read32(SOC_EVENT_UNIT_ADDR + reg);
}

static inline void soc_eu_eventMask_setEvent(int evt, unsigned int lsbReg, unsigned int msbReg) {
  unsigned int reg;
  if (evt >= 32) {
    reg = msbReg;
    evt -= 32;
  } else {
    reg = lsbReg;
  }
  soc_eu_eventMask_set(reg, soc_eu_eventMask_get(reg) & ~(1 << evt));
}

static inline void soc_eu_eventMask_clearEvent(int evt, unsigned int lsbReg, unsigned int msbReg) {
  unsigned int reg;
  if (evt >= 32) {
    reg = msbReg;
    evt -= 32;
  } else {
    reg = lsbReg;
  }
  soc_eu_eventMask_set(reg, soc_eu_eventMask_get(reg) | (1 << evt));
}

static inline void soc_eu_fcEventMask_setEvent(int evt) {
  soc_eu_eventMask_setEvent(evt, SOC_FC_MASK_LSB, SOC_FC_MASK_MSB);
}

static inline void soc_eu_prEventMask_setEvent(int evt) {
  soc_eu_eventMask_setEvent(evt, SOC_PR_MASK_LSB, SOC_PR_MASK_MSB);
}

static inline void soc_eu_clEventMask_setEvent(int clusterId, int evt) {
  soc_eu_eventMask_setEvent(evt, SOC_CL_MASK_LSB, SOC_CL_MASK_MSB);
}

static inline void soc_eu_fcEventMask_clearEvent(int evt) {
  soc_eu_eventMask_clearEvent(evt, SOC_FC_MASK_LSB, SOC_FC_MASK_MSB);
}

static inline void soc_eu_prEventMask_clearEvent(int evt) {
  soc_eu_eventMask_clearEvent(evt, SOC_PR_MASK_LSB, SOC_PR_MASK_MSB);
}

static inline void soc_eu_clEventMask_clearEvent(int clusterId, int evt) {
  soc_eu_eventMask_clearEvent(evt, SOC_CL_MASK_LSB, SOC_CL_MASK_MSB);
}



static inline void soc_eu_genEventMask(unsigned int mask) {
  pulp_write32(SOC_EVENT_UNIT_ADDR + SOC_EU_EVENT, mask);
}

#endif
