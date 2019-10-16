/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_PULP__
#define __HAL_PULP__

#include <archi/pulp.h>
#include <hal/pulp_io.h>

/*
 * Components definition
 */

#ifdef   RISCV_VERSION
#define  __RISCV_INC(x) #x
#define  _RISCV_INC(x) __RISCV_INC(hal/riscv_v##x.h)
#define  RISCV_INC(x) _RISCV_INC(x)
#include RISCV_INC(RISCV_VERSION)
#endif

#ifdef   OR1K_VERSION
#define  __OR1K_INC(x) #x
#define  _OR1K_INC(x) __OR1K_INC(hal/or1k_v##x.h)
#define  OR1K_INC(x) _OR1K_INC(x)
#include OR1K_INC(OR1K_VERSION)
#endif

#ifdef   UDMA_VERSION
#define  __UDMA_INC(x) #x
#define  _UDMA_INC(x) __UDMA_INC(hal/udma_v##x.h)
#define  UDMA_INC(x) _UDMA_INC(x)
#include UDMA_INC(UDMA_VERSION)
#endif

#ifdef   EU_VERSION
#define  __EU_INC(x) #x
#define  _EU_INC(x) __EU_INC(hal/eu_v##x.h)
#define  EU_INC(x) _EU_INC(x)
#include EU_INC(EU_VERSION)
#endif

#ifdef   SOC_EU_VERSION
#define  __SOC_EU_INC(x) #x
#define  _SOC_EU_INC(x) __SOC_EU_INC(hal/soc_eu_v##x.h)
#define  SOC_EU_INC(x) _SOC_EU_INC(x)
#include SOC_EU_INC(SOC_EU_VERSION)
#endif

#ifdef   MCHAN_VERSION
#define  __MCHAN_INC(x) #x
#define  _MCHAN_INC(x) __MCHAN_INC(hal/mchan_v##x.h)
#define  MCHAN_INC(x) _MCHAN_INC(x)
//#include MCHAN_INC(MCHAN_VERSION)
#endif

#ifdef   PERIPH_VERSION
#define  __PERIPH_INC(x) #x
#define  _PERIPH_INC(x) __PERIPH_INC(hal/periph_v##x.h)
#define  PERIPH_INC(x) _PERIPH_INC(x)
#include PERIPH_INC(PERIPH_VERSION)
#endif

#ifdef   HWCE_VERSION
#define  __HWCE_INC(x) #x
#define  _HWCE_INC(x) __HWCE_INC(hal/hwce_v##x.h)
#define  HWCE_INC(x) _HWCE_INC(x)
#include HWCE_INC(HWCE_VERSION)
#endif

#ifdef   APB_SOC_VERSION
#define  __APB_SOC_INC(x) #x
#define  _APB_SOC_INC(x) __APB_SOC_INC(hal/apb_soc_v##x.h)
#define  APB_SOC_INC(x) _APB_SOC_INC(x)
#include APB_SOC_INC(APB_SOC_VERSION)
#endif

#ifdef   ICACHE_CTRL_VERSION
#define  __ICACHE_CTRL_INC(x) #x
#define  _ICACHE_CTRL_INC(x) __ICACHE_CTRL_INC(hal/icache_ctrl_v##x.h)
#define  ICACHE_CTRL_INC(x) _ICACHE_CTRL_INC(x)
#include ICACHE_CTRL_INC(ICACHE_CTRL_VERSION)
#endif

#ifdef   TIMER_VERSION
#define  __TIMER_INC(x) #x
#define  _TIMER_INC(x) __TIMER_INC(hal/timer_v##x.h)
#define  TIMER_INC(x) _TIMER_INC(x)
#include TIMER_INC(TIMER_VERSION)
#endif

#ifdef   ANALOG_VERSION
#define  __ANALOG_INC(x) #x
#define  _ANALOG_INC(x) __ANALOG_INC(hal/analog_v##x.h)
#define  ANALOG_INC(x) _ANALOG_INC(x)
#include ANALOG_INC(ANALOG_VERSION)
#endif

#ifdef   GPIO_VERSION
#define  __GPIO_INC(x) #x
#define  _GPIO_INC(x) __GPIO_INC(hal/gpio_v##x.h)
#define  GPIO_INC(x) _GPIO_INC(x)
#include GPIO_INC(GPIO_VERSION)
#endif


/*
 * Other generic includes
 */

#include "hwTrace.h"
#include "hal/gpio.h"
#include "icache_ctrl.h"
#include "utils.h"
#if PULP_CHIP == CHIP_GAP
#include "transceiver.h"
#endif

#endif
