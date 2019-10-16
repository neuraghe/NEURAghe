/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_DEBUG_H__
#define __RT__RT_DEBUG_H__

#define RT_TRACE_INIT      0
#define RT_TRACE_CONF      2
#define RT_TRACE_ALLOC     5
#define RT_TRACE_UDMA_COPY 10
#define RT_TRACE_DMA_COPY  10
#define RT_TRACE_SCHED     5
#define RT_TRACE_DEPLOY    1


extern PLP_L2_DATA unsigned int rtDebugConfig;

#define PLP_RT_DEBUG_TRACE_BIT       0
#define PLP_RT_DEBUG_TRACE_NB_BITS   8
#define PLP_RT_DEBUG_NO_WARNING_BIT  8

#define PLP_RT_DEBUG_TRACE(x) ((x >> PLP_RT_DEBUG_TRACE_BIT) & ((1<<PLP_RT_DEBUG_TRACE_NB_BITS) - 1))
#define PLP_RT_DEBUG_NO_WARNING(x) ((x >> PLP_RT_DEBUG_NO_WARNING_BIT) & 1)

#if defined(PLP_RT_DEBUG)

#define plp_msg(fmt, x...)			\
  do { \
    printf("[\033[35mRT(%d,%d)\033[0m] " fmt, plp_clusterId(), plp_coreId(), ##x);					\
  } while(0)

#define plp_warning(x...)					\
  do {								\
    if (!PLP_RT_DEBUG_NO_WARNING(rtDebugConfig)) plp_msg("\033[31mWARNING\033[0m: "x);	\
  } while(0)

#define plp_trace(lvl, x...)		\
  do {						\
    if (PLP_RT_DEBUG_TRACE(rtDebugConfig) > (lvl)) plp_msg(x);		\
  } while(0)

#define plp_fatal(msg...)    \
  do { \
    plp_msg("\033[31mFATAL\033[0m: "msg);      \
    abort();          \
  } while(0)

#define plp_assert(cond, msg...)		\
  if (!(cond)) {				\
    plp_msg("\033[31mASSERT\033[0m: "msg);			\
    abort();					\
  }

#else

#define plp_msg(x...)
#define plp_trace(x...)
#define plp_warning(x...)
#define plp_assert(x...)

#endif

#include "hal/debug.h"
extern PLP_L2_DATA debugStruct_t debugStruct;

static inline void plp_debug_step(unsigned int value) {
  *(volatile uint32_t *)&debugStruct.debugStep = value;
  *(volatile uint32_t *)&debugStruct.debugStepPending = 1;
  while (*(volatile uint32_t *)&debugStruct.debugStepPending);
}

#endif