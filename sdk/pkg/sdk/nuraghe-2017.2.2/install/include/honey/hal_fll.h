/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HONEY_HAL_FLL_H__
#define __HONEY_HAL_FLL_H__

#include <clock.h>
#include <archi_fll.h>

// FREQUENCY IN MHz
void fll_set_soc_frequency(int frequency) {
  int multfact = frequency * 1000000 / 32768;

  *(volatile int*)SOC_FLL_CONFIG_REG_1 = ((frequency*0x170/10) << 16) | (multfact & 0xFFFF);
}

void fll_wait_lock(void) {
  while(*((volatile int*)SOC_FLL_LOCK_REG) == 0);
}

void out_clk_div(int divider) {
  *(volatile int*)CLK_REG_DIV2 = divider;
}

#endif
