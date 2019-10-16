/* Copyright 2014 DEI - Universita' di Bologna
   author       DEI - Universita' di Bologna
                Alessandro Capotondi - alessandro.capotondi@unibo.it
   info         Simple Malloc based on FREERTOS Heap_4.c mode */

#ifndef _RT_MALLOC_H_
#define _RT_MALLOC_H_

#include "rt_malloc_data.h"
#include "rt/rt_debug.h"

unsigned int plp_alloc(plp_alloc_t *heap, unsigned int size);
void plp_free(plp_alloc_t *heap, unsigned int ptr);

static inline plp_alloc_t *plp_getAlloc_l2() { return &heapl2ram; }
static inline plp_alloc_t *plp_getAlloc_l1() { return &heapsram; }
#ifdef SCM_SIZE
static inline plp_alloc_t *plp_getAlloc_l1_scm() { return &heapscm; }
#else
static inline plp_alloc_t *plp_getAlloc_l1_scm() { return &heapsram; }
#endif

static inline unsigned int plp_alloc_l2(unsigned int size) {
  plp_trace(RT_TRACE_ALLOC, "L2 allocation (size: 0x%x)\n", size);
  unsigned int result = plp_alloc(plp_getAlloc_l2(), size);
  if (result) { plp_trace(RT_TRACE_ALLOC, "Allocation success (base: 0x%x)\n", result); }
  return result;
}
static inline void plp_free_l2(unsigned int ptr) {
  plp_trace(RT_TRACE_ALLOC, "L2 free (base: 0x%x)\n", ptr);
  plp_free(plp_getAlloc_l2(), ptr);
}

static inline unsigned int plp_alloc_l1(unsigned int size) {
  plp_trace(RT_TRACE_ALLOC, "L1 allocation (size: 0x%x)\n", size);
  unsigned int result = plp_alloc(plp_getAlloc_l1(), size);
  if (result) { plp_trace(RT_TRACE_ALLOC, "Allocation success (base: 0x%x)\n", result); }
  return result;
}

static inline void plp_free_l1(unsigned int ptr) {
  plp_trace(RT_TRACE_ALLOC, "L1 free (base: 0x%x)\n", ptr);
  plp_free(plp_getAlloc_l1(), ptr);
}

static inline unsigned int plp_alloc_l1_scm(unsigned int size) {
  plp_trace(RT_TRACE_ALLOC, "L1 SCM allocation (size: 0x%x)\n", size);
  unsigned int result = plp_alloc(plp_getAlloc_l1_scm(), size);
  if (result) { plp_trace(RT_TRACE_ALLOC, "Allocation success (base: 0x%x)\n", result); }
  return result;
}

static inline void plp_free_l1_scm(unsigned int ptr) {
  plp_trace(RT_TRACE_ALLOC, "L1 SCM free (base: 0x%x)\n", ptr);
  plp_free(plp_getAlloc_l1_scm(), ptr);
}

void plp_alloc_checkInit();

void *l2malloc(unsigned int size);

void *l1malloc(unsigned int size);

void l2free(void *ptr);

void l1free(void *ptr);

#endif
