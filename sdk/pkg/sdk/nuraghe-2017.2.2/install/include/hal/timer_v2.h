/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_TIMER_V2_H__
#define __HAL_TIMER_V2_H__

#include "hal/pulp.h"

#if TIMER_VERSION != 2
#error This file must be included only with timer version 2
#endif

static inline unsigned int plp_timer_conf_get(char enable, char reset, char irq_enable, char event_mask, char cmp_clr, char one_shot, char prescaler_enable, char prescaler, char mode_64)
{
  return
      (enable << PLP_TIMER_ENABLE_BIT)
    | (reset << PLP_TIMER_RESET_BIT)
    | (irq_enable << PLP_TIMER_IRQ_ENABLE_BIT)
    | (event_mask << PLP_TIMER_IEM_BIT)
    | (cmp_clr << PLP_TIMER_CMP_CLR_BIT)
    | (one_shot << PLP_TIMER_ONE_SHOT_BIT)
    | (prescaler_enable << PLP_TIMER_PRESCALER_ENABLE_BIT)
    | (prescaler << PLP_TIMER_PRESCALER_VALUE_BIT)
    | (mode_64 << PLP_TIMER_64_BIT);
}

static inline void __plp_timer_conf(unsigned int addr, char enable, char reset, char irq_enable, char event_mask, char cmp_clr, char one_shot, char prescaler_enable, char prescaler, char mode_64)
{
  pulp_write32(addr, plp_timer_conf_get(enable, reset, irq_enable, event_mask, cmp_clr, one_shot, prescaler_enable, prescaler, mode_64));
}

static inline void plp_timer_raw_conf_low(unsigned int conf)
{
  pulp_write32(TIMER_BASE_ADDR + PLP_TIMER_CFG_REG_LO, conf);
}

static inline unsigned int plp_timer_raw_conf_low_get()
{
  return pulp_read32(TIMER_BASE_ADDR + PLP_TIMER_CFG_REG_LO);
}

static inline void plp_timer_raw_conf_high(unsigned int conf)
{
  pulp_write32(TIMER_BASE_ADDR + PLP_TIMER_CFG_REG_HI, conf);
}

static inline unsigned int plp_timer_raw_conf_high_get()
{
  return pulp_read32(TIMER_BASE_ADDR + PLP_TIMER_CFG_REG_HI);
}

static inline void plp_timer_conf_low(char enable, char reset, char irq_enable, char event_mask, char cmp_clr, char one_shot, char prescaler_enable, char prescaler, char mode_64)
{
  __plp_timer_conf(TIMER_BASE_ADDR + PLP_TIMER_CFG_REG_LO, enable, reset, irq_enable, event_mask, cmp_clr, one_shot, prescaler_enable, prescaler, mode_64);
}

static inline void plp_timer_conf_high(char enable, char reset, char irq_enable, char event_mask, char cmp_clr, char one_shot, char prescaler_enable, char prescaler)
{
  __plp_timer_conf(TIMER_BASE_ADDR + PLP_TIMER_CFG_REG_HI, enable, reset, irq_enable, event_mask, cmp_clr, one_shot, prescaler_enable, prescaler, 0);
}

static inline void plp_timer_cmp_low(int cmp)
{
  pulp_write32(TIMER_BASE_ADDR + PLP_TIMER_CMP_LO, cmp);
}

static inline void plp_timer_cmp_high(int cmp)
{
  pulp_write32(TIMER_BASE_ADDR + PLP_TIMER_CMP_HI, cmp);
}

static inline void plp_timer_set_count_low(unsigned int value) {
  pulp_write32(TIMER_BASE_ADDR + PLP_TIMER_VALUE_LO, value);
}

static inline void plp_timer_set_count_high(unsigned int value) {
  pulp_write32(TIMER_BASE_ADDR + PLP_TIMER_VALUE_HI, value);
}

static inline int plp_timer_get_count_low() {
  return pulp_read32(TIMER_BASE_ADDR + PLP_TIMER_VALUE_LO);
}

static inline int plp_timer_get_count_high() {
  return pulp_read32(TIMER_BASE_ADDR + PLP_TIMER_VALUE_HI);
}

static inline void start_timer() {plp_timer_conf_high(1, 0, 0, 0, 0, 0, 0, 0);}

static inline void stop_timer() {plp_timer_conf_high(0, 0, 0, 0, 0, 0, 0, 0);}

static inline void reset_timer() {plp_timer_raw_conf_high(plp_timer_raw_conf_high_get() | (1<<PLP_TIMER_RESET_BIT));}

static inline int get_time() {return plp_timer_get_count_high();}

static inline void plp_timer_fire(int timer, int cmpVal)
{
  if (timer) {
    plp_timer_conf_high(1, 1, 1, 0, 1, 0, 0, 0);
    plp_timer_cmp_high(cmpVal);
  } else {
    plp_timer_conf_low(1, 1, 1, 0, 1, 0, 0, 0, 0);
    plp_timer_cmp_low(cmpVal);
  }
}

static inline void plp_timer_update(int timer, int cmpVal)
{
  if (timer) {
    plp_timer_cmp_high(cmpVal);
  } else {
    plp_timer_cmp_low(cmpVal);
  }
}

static inline void plp_timer_cancel(int timer)
{
  if (timer) plp_timer_conf_high(0, 0, 0, 0, 0, 0, 0, 0);
  else plp_timer_conf_low(0, 0, 0, 0, 0, 0, 0, 0, 0);
}

static inline unsigned int plp_timer_cycles(int timer) {
  if (timer) return plp_timer_get_count_high();
  else return plp_timer_get_count_low();

}

#endif
