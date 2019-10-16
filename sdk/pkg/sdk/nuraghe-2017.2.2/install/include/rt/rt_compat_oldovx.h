/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_COMPAT_OLDOVX_H__
#define __RT__RT_COMPAT_OLDOVX_H__

typedef int rt_cc_t;
typedef int rt_fc_t;


static inline unsigned int rt_clusterId() { return plp_clusterId(); }

static inline rt_cc_t *rt_getCcData(int cid) { return (void *)0; }
static inline rt_fc_t *rt_getFcData() { return (void *)0; }

static inline unsigned int rt_l1_alloc(rt_cc_t *cc, int size) { return plp_alloc_l1(size); }
static inline void rt_l1_free(rt_cc_t *cc, unsigned int ptr) { plp_free_l1(ptr); }
static inline unsigned int rt_l2_alloc(rt_fc_t *fc, int size) { return plp_alloc_l2(size); }
static inline void rt_l2_free(rt_fc_t *fc, unsigned int ptr) { plp_free_l2(ptr); }

static inline unsigned int rt_perf_cyclesGet() {
  return pulp_read32(PULP_CLUSTER_BASE + PULP_TIMER_OFFSET + PULP_TIMER_GET_OFFSET);
}

static inline void rt_perf_cyclesConf() {
}

static inline void rt_perf_cyclesStart() {
  pulp_write32(PULP_CLUSTER_BASE + PULP_TIMER_OFFSET + PULP_TIMER_RESET_OFFSET, 1);
  pulp_write32(PULP_CLUSTER_BASE + PULP_TIMER_OFFSET + PULP_TIMER_START_OFFSET, 1);
}

#endif