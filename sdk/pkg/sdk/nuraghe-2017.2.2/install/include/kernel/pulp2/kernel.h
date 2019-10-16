/*
 * Copyright (c) 2013 Germain Haugou
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#ifndef __PULP2_KERNEL_INCLUDE_H
#define __PULP2_KERNEL_INCLUDE_H

#include "kernel_data.h"
#include <builtins/OCL/external_builtin_types.h>

#ifdef long
#undef long
#define REDEFINE_LONG 1
#endif

#ifdef REDEFINE_LONG
#define long long long
#undef REDEFINE_LONG
#endif

#define OCL_EXT2LOC_CMD 0
#define OCL_LOC2EXT_CMD 0

static inline int get_id(workItem_t *__this) {
  return 0;
}

static inline size_t get_global_offset(workItem_t *_this, uint dimindx) {
  return 0;
}

static inline uint get_work_dim(workItem_t *_this) {
  return 0;
}

static inline size_t get_global_size(workItem_t *_this, uint dimindx) {
  return 0;
}

static inline size_t get_global_id(workItem_t *_this, uint dimindx) {
  return 0;
}

static inline size_t get_local_size(workItem_t *_this, uint dimindx) {
  return 0;
}

static inline size_t get_local_id(workItem_t *_this, uint dimindx) {
  return 0;
}

static inline size_t get_num_groups(workItem_t *_this, uint dimindx) {
  return 0;
}

static inline size_t get_group_id(workItem_t *_this, uint dimindx) {
  return 0;
}

static inline void prefetch_generic(void *ptr, int size_elements, size_t num_elements) {
}

static inline void ocl_wg_dma_memcpy(workItem_t *_this, int cmd, void *loc, void *ext, uint32_t size, uint16_t length, int16_t stride, rt_dma_req_t *req) {
}

static inline void ocl_wi_dma_memcpy(workItem_t *_this, int cmd, void *loc, void *ext, uint32_t size, uint16_t length, int16_t stride, rt_dma_req_t *req) {
}

event_t ocl_wg_async_memcpy(workItem_t *_this, int cmd, void *loc, void *ext, uint32_t size, uint16_t length, int16_t stride) {
  return 0;
}

event_t ocl_wi_async_memcpy(workItem_t *_this, int cmd, void *loc, void *ext, uint32_t size, uint16_t length, int16_t stride) {
  return 0;
}

void wait_group_events(workItem_t *_this, int num_events, event_t *event_list) {
}

void wait_events(workItem_t *_this, int num_events, event_t *event_list) {
}

static inline void dma_wait_events(workItem_t *_this, int num_events, rt_dma_req_t *reqs) {
}

static inline void dma_wait_group_events(workItem_t *_this, int num_events, rt_dma_req_t *reqs) {
}

#if 0
static inline float __ocl_atomic_xchg_float_global(workItem_t *_this, float *p, float val) {
  lockTsSpinMutex(_this->globalMutex);
  float old = *p;
  *p = val;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline unsigned int __ocl_atomic_add_uint_global(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->globalMutex);
  unsigned int old = *p;
  *p = old + val;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline unsigned int __ocl_atomic_sub_uint_global(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->globalMutex);
  unsigned int old = *p;
  *p = old - val;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline unsigned int __ocl_atomic_xchg_uint_global(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->globalMutex);
  unsigned int old = *p;
  *p = val;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline unsigned int __ocl_atomic_inc_uint_global(workItem_t *_this, unsigned int *p) {
  lockTsSpinMutex(_this->globalMutex);
  unsigned int old = *p;
  *p = old + 1;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline unsigned int __ocl_atomic_dec_uint_global(workItem_t *_this, unsigned int *p) {
  lockTsSpinMutex(_this->globalMutex);
  unsigned int old = *p;
  *p = old - 1;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline unsigned int __ocl_atomic_cmpxchg_uint_global(workItem_t *_this, unsigned int *p, unsigned int cmp, unsigned int val) {
  lockTsSpinMutex(_this->globalMutex);
  unsigned int old = *p;
  *p = (old == cmp) ? val : old;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline unsigned int __ocl_atomic_min_uint_global(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->globalMutex);
  unsigned int old = *p;
  *p = val < old ? val : old;
  unlockTsSpinMutex(_this->globalMutex);
  return old;

}

static inline unsigned int __ocl_atomic_max_uint_global(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->globalMutex);
  unsigned int old = *p;
  *p = val > old ? val : old;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline unsigned int __ocl_atomic_or_uint_global(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->globalMutex);
  unsigned int old = *p;
  *p = val | old;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline unsigned int __ocl_atomic_and_uint_global(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->globalMutex);
  unsigned int old = *p;
  *p = val & old;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline unsigned int __ocl_atomic_xor_uint_global(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->globalMutex);
  unsigned int old = *p;
  *p = val ^ old;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}


static inline int __ocl_atomic_add_int_global(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->globalMutex);
  int old = *p;
  *p = old + val;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline int __ocl_atomic_sub_int_global(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->globalMutex);
  int old = *p;
  *p = old - val;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline int __ocl_atomic_xchg_int_global(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->globalMutex);
  int old = *p;
  *p = val;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline int __ocl_atomic_inc_int_global(workItem_t *_this, int *p) {
  lockTsSpinMutex(_this->globalMutex);
  int old = *p;
  *p = old + 1;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline int __ocl_atomic_dec_int_global(workItem_t *_this, int *p) {
  lockTsSpinMutex(_this->globalMutex);
  int old = *p;
  *p = old - 1;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline int __ocl_atomic_cmpxchg_int_global(workItem_t *_this, int *p, int cmp, int val) {
  lockTsSpinMutex(_this->globalMutex);
  int old = *p;
  *p = (old == cmp) ? val : old;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline int __ocl_atomic_min_int_global(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->globalMutex);
  int old = *p;
  *p = val < old ? val : old;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline int __ocl_atomic_max_int_global(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->globalMutex);
  int old = *p;
  *p = val > old ? val : old;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline int __ocl_atomic_or_int_global(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->globalMutex);
  int old = *p;
  *p = val | old;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline int __ocl_atomic_and_int_global(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->globalMutex);
  int old = *p;
  *p = val & old;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}

static inline int __ocl_atomic_xor_int_global(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->globalMutex);
  int old = *p;
  *p = val ^ old;
  unlockTsSpinMutex(_this->globalMutex);
  return old;
}




static inline float __ocl_atomic_xchg_float_local(workItem_t *_this, float *p, float val) {
  lockTsSpinMutex(_this->localMutex);
  float old = *p;
  *p = val;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline unsigned int __ocl_atomic_add_uint_local(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->localMutex);
  unsigned int old = *p;
  *p = old + val;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline unsigned int __ocl_atomic_sub_uint_local(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->localMutex);
  unsigned int old = *p;
  *p = old - val;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline unsigned int __ocl_atomic_xchg_uint_local(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->localMutex);
  unsigned int old = *p;
  *p = val;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline unsigned int __ocl_atomic_inc_uint_local(workItem_t *_this, unsigned int *p) {
  lockTsSpinMutex(_this->localMutex);
  unsigned int old = *p;
  *p = old + 1;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline unsigned int __ocl_atomic_dec_uint_local(workItem_t *_this, unsigned int *p) {
  lockTsSpinMutex(_this->localMutex);
  unsigned int old = *p;
  *p = old - 1;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline unsigned int __ocl_atomic_cmpxchg_uint_local(workItem_t *_this, unsigned int *p, unsigned int cmp, unsigned int val) {
  lockTsSpinMutex(_this->localMutex);
  unsigned int old = *p;
  *p = (old == cmp) ? val : old;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline unsigned int __ocl_atomic_min_uint_local(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->localMutex);
  unsigned int old = *p;
  *p = val < old ? val : old;
  unlockTsSpinMutex(_this->localMutex);
  return old;

}

static inline unsigned int __ocl_atomic_max_uint_local(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->localMutex);
  unsigned int old = *p;
  *p = val > old ? val : old;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline unsigned int __ocl_atomic_or_uint_local(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->localMutex);
  unsigned int old = *p;
  *p = val | old;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline unsigned int __ocl_atomic_and_uint_local(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->localMutex);
  unsigned int old = *p;
  *p = val & old;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline unsigned int __ocl_atomic_xor_uint_local(workItem_t *_this, unsigned int *p, unsigned int val) {
  lockTsSpinMutex(_this->localMutex);
  unsigned int old = *p;
  *p = val ^ old;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}


static inline int __ocl_atomic_add_int_local(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->localMutex);
  int old = *p;
  *p = old + val;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline int __ocl_atomic_sub_int_local(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->localMutex);
  int old = *p;
  *p = old - val;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline int __ocl_atomic_xchg_int_local(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->localMutex);
  int old = *p;
  *p = val;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline int __ocl_atomic_inc_int_local(workItem_t *_this, int *p) {
  lockTsSpinMutex(_this->localMutex);
  int old = *p;
  *p = old + 1;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline int __ocl_atomic_dec_int_local(workItem_t *_this, int *p) {
  lockTsSpinMutex(_this->localMutex);
  int old = *p;
  *p = old - 1;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline int __ocl_atomic_cmpxchg_int_local(workItem_t *_this, int *p, int cmp, int val) {
  lockTsSpinMutex(_this->localMutex);
  int old = *p;
  *p = (old == cmp) ? val : old;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline int __ocl_atomic_min_int_local(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->localMutex);
  int old = *p;
  *p = val < old ? val : old;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline int __ocl_atomic_max_int_local(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->localMutex);
  int old = *p;
  *p = val > old ? val : old;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline int __ocl_atomic_or_int_local(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->localMutex);
  int old = *p;
  *p = val | old;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline int __ocl_atomic_and_int_local(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->localMutex);
  int old = *p;
  *p = val & old;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

static inline int __ocl_atomic_xor_int_local(workItem_t *_this, int *p, int val) {
  lockTsSpinMutex(_this->localMutex);
  int old = *p;
  *p = val ^ old;
  unlockTsSpinMutex(_this->localMutex);
  return old;
}

#endif

#endif
