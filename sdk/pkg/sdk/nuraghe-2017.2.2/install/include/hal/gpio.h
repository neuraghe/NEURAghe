/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_GPIO_H__
#define __HAL_GPIO_H__

#ifdef SOC_CTRL_PADFUN0
static inline void set_pin_function(int pinnumber, int function) {
  // TODO should be ported to new APB SOC in pulp4
#if !defined(APB_SOC_VERSION) || APB_SOC_VERSION == 1
  volatile int old_function;
  int addr;

  old_function = *(volatile int*) (SOC_CTRL_PADFUN0);
  old_function = old_function & (~(1 << pinnumber));
  old_function = old_function | (function << pinnumber);
  *(volatile int*) (SOC_CTRL_PADFUN0) = old_function;
#endif
}

static inline int  get_pin_function(int pinnumber) {
  volatile int old_function;
  old_function = *(volatile int*) (SOC_CTRL_PADFUN0);
  old_function = (old_function >> pinnumber & 0x01);
  return old_function;
}

static inline void set_gpio_pin_direction(int pinnumber, int direction) {
  // TODO should be ported to new APB SOC in pulp4
#if !defined(APB_SOC_VERSION) || APB_SOC_VERSION == 1
  volatile int old_dir;
  old_dir = *(volatile int*) (GPIO_REG_PADDIR);
  if (direction == 0)
    old_dir &= ~(1 << pinnumber);
  else
    old_dir |= 1 << pinnumber;
  *(volatile int*) (GPIO_REG_PADDIR) = old_dir;
#endif
}

static inline int  get_gpio_pin_direction(int pinnumber) {
  volatile int old_dir;
  old_dir = *(volatile int*) (GPIO_REG_PADDIR);
  old_dir = (old_dir >> pinnumber & 0x01);
  return old_dir;
}

static inline void set_gpio_pin_value(int pinnumber, int value) {
  // TODO should be ported to new APB SOC in pulp4
#if !defined(APB_SOC_VERSION) || APB_SOC_VERSION == 1
  volatile int old_dir;
  old_dir = *(volatile int*) (GPIO_REG_PADOUT);
  if (value == 0)
    old_dir &= ~(1 << pinnumber);
  else
    old_dir |= 1 << pinnumber;
  *(volatile int*) (GPIO_REG_PADOUT) = old_dir;
#endif
}

static inline int  get_gpio_pin_value(int pinnumber) {
  volatile int old_dir;
  old_dir = *(volatile int*) (GPIO_REG_PADIN);
  old_dir = (old_dir >> (pinnumber) & 0x01);
  return old_dir;
}

static inline void set_gpio_en_int(int pinnumber, int function) {
  // TODO should be ported to new APB SOC in pulp4
#if APB_SOC_VERSION == 1
  volatile int old_function;
  int addr;

  old_function = *(volatile int*) (GPIO_REG_INTEN);
  old_function = old_function & (~(1 << pinnumber));
  old_function = old_function | (function << pinnumber);
  *(volatile int*) (GPIO_REG_INTEN) = old_function;
#endif
}
#endif

#endif
