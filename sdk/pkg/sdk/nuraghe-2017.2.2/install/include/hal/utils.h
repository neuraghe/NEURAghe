/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_UTILS__
#define __HAL_UTILS__

#include <archi/pulp.h>
#include <hal/pulp_io.h>

/*
 * General purpose HAL functions
 */


#if !defined(PLP_NO_BUILTIN) && defined(__riscv__)

static inline int plp_nbCores()
{
  return __builtin_pulp_CoreCount();
}

#else

#if !defined(APB_SOC_CTRL_ADDR) || PULP_CHIP_FAMILY == CHIP_NURAGHE
extern unsigned char __NB_ACTIVE_PE;
#endif

static inline int plp_nbCores()
{
#if defined(APB_SOC_CTRL_ADDR) && PULP_CHIP_FAMILY != CHIP_NURAGHE
  return apb_soc_nbCores();
#else
  return (int)&__NB_ACTIVE_PE;
#endif
}

#endif

static inline int plp_nbClusters()
{
#ifdef APB_SOC_CTRL_ADDR
  return apb_soc_nbClusters();
#else
  return 1;
#endif
}

#endif
