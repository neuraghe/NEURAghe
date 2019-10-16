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

#ifndef __RT_API_H__
#define __RT_API_H__

#include <rt/rt_config.h>

#include <rt/rt_data.h>
#include <rt/internals/internals.h>

#include <hal/pulp.h>

#ifdef __XP70__
#include <models/sx.h>
#include <rt/xp70/rt_api_xp70.h>
#else
#ifdef __XP70EMU__
#include <rt/xp70emu/rt_api_xp70emu.h>
#else
#ifdef __OR1K__
#include <rt/or1k/rt_api_or1k.h>
#endif
#endif
#endif

#include "utils.h"

/*
 * Lifecycle
 */

int rt_init();

int rt_activate();

int rt_start(void (*clusterControllerEntry)(rt_task_t*), unsigned int arg0, unsigned int arg1);


/*
 * Tasks
 */

static inline void rt_task_init(rt_task_t *task, void (*entry)(rt_task_t *task), unsigned int arg0, unsigned int arg1);

void rt_task_enqueue(rt_sched_t *sched, unsigned int prio, rt_task_t *task);

static inline void rt_task_remoteEnqueue(rt_cluster_t *rd, unsigned int prio, rt_task_t *task) {
}

/*
 * Message FIFOs
 */

static inline void rt_msgFifo_init(rt_msgFifo_t *fifo, unsigned int size) {
  unsigned int i;
  for (i=0; i<size; i++) {
    fifo->array[i] = 0;
  }
  fifo->size = size;
  fifo->pos = 0;
}

static inline unsigned int rt_msgFifo_pop(rt_msgFifo_t *fifo) {
  unsigned int pos = fifo->pos;
  unsigned int size = fifo->size;
  unsigned int msg = fifo->array[pos];
  if (msg != 0) {
    fifo->array[pos] = 0;
    if (pos + 1 != size) fifo->pos = pos + 1;
    else fifo->pos = 0;
  }
  return msg;
}

static inline void rt_msgFifo_push(rt_msgFifo_t *fifo, unsigned int msg) {
  unsigned int pos = fifo->pos;
  unsigned int size = fifo->size;
  fifo->array[pos] = msg;
  if (pos + 1 != size) fifo->pos = pos + 1;
  else fifo->pos = 0;
  rt_sendHostNotif();
}

/*
 * Threads
 */

void rt_threadSwitch(rt_thread_t *current, rt_thread_t *new);

/*
 * Core
 */

#ifdef __STHORM__
static inline void rt_ids(unsigned int *cluster, unsigned *core);

static inline unsigned int rt_coreId();

static inline unsigned int rt_clusterId();

#endif

static inline int rt_isFc(unsigned int cid, unsigned int coreId);

static inline int rt_isCc(unsigned int cid, unsigned int coreId);

static inline unsigned int rt_getGLobalAddr(unsigned int addr);

/*
 * Allocators
 */

extern unsigned int rt_l1_alloc(rt_cc_t *cc, unsigned int size);
extern unsigned int rt_l1_alloc_toHead(rt_cc_t *cc, unsigned int size);
extern int rt_l1_free(rt_cc_t *cc, unsigned int ptr);
extern int rt_l1_start(rt_cc_t *cc, unsigned int *_base, unsigned int *_size);

extern unsigned int rt_scm_alloc(rt_cc_t *cc, unsigned int size);
extern int rt_scm_free(rt_cc_t *cc, unsigned int ptr);

#ifdef __PULP__
static inline unsigned int rt_cc_alloc(rt_cc_t *cc, unsigned int size) {return rt_l1_alloc(rt_getCcData(0), size);}
static inline void rt_cc_free(rt_cc_t *cc, unsigned int ptr) {rt_l1_free(rt_getCcData(0), ptr);}
static inline unsigned int rt_fc_alloc(rt_fc_t *cc, unsigned int size) {return rt_l1_alloc(rt_getCcData(0), size);}
static inline void rt_fc_free(rt_fc_t *cc, unsigned int ptr) {rt_l1_free(rt_getCcData(0), ptr);}
#else
extern unsigned int rt_cc_alloc(rt_cc_t *cc, unsigned int size);
extern void rt_cc_free(rt_cc_t *cc, unsigned int ptr);
extern unsigned int rt_fc_alloc(rt_fc_t *cc, unsigned int size);
extern void rt_fc_free(rt_fc_t *cc, unsigned int ptr);
#endif

extern unsigned int rt_l2_alloc(rt_fc_t *cc, unsigned int size);
extern void rt_l2_free(rt_fc_t *cc, unsigned int ptr);

int rt_ac_alloc(rt_cc_t *cc);

/*
 * Cores allocation
 */

unsigned int rt_core_allocSet(rt_cc_t *cc, int nbCores);

/*
 * Events allocation
 */

int rt_evt_alloc(rt_cc_t *cc);

/*
 * Barrier allocation
 */


#if EU_VERSION == 3

int rt_socbar_alloc();
void rt_socbar_free(int bar);

#endif

int rt_bar_alloc(rt_cc_t *cc);

void rt_bar_free(rt_cc_t *cc, int id);
static inline __attribute__((always_inline)) void rt_bar_sync(int bar) {
#if EU_VERSION == 3
  eu_bar_trig_wait_clr(bar);
#else
  pulp_barrier_notify(bar);
  pulp_evt_wait();
  // This is very important to clear the event after and not before
  // as we keep the mask bit for the barrier always active
  // to avoid manipulating the mask at each barrier
  pulp_gpevt_clear(0);
#endif
}

static inline void rt_bar_setup(int bar, unsigned int coreMask) {
#if EU_VERSION == 3
  eu_bar_setup(bar, coreMask);
#else
  int nbCores = 0;
  int i;
  for (i=0; i<32; i++) if (coreMask & (1<<i)) nbCores++;
  pulp_barrier_setup(bar, nbCores, coreMask);
#endif
}

/*
 * Multi-cluster
 */

rt_mcbar_t *rt_mcbar_alloc(unsigned int mcMask);
int rt_mcbar_localconf(rt_mcbar_t *bar, rt_mcbar_loc_t *locBar, unsigned int coreMask);
void rt_mcbar_free(rt_mcbar_t *bar);
void rt_mcbar_sync(rt_mcbar_loc_t *bar);

int rt_mclock_init(rt_mclock_t *lock);
int rt_mclock_localinit(rt_mclock_t *lock, rt_mclock_loc_t *locLock);
void rt_mclock_lock(rt_mclock_loc_t *lock);
void rt_mclock_unlock(rt_mclock_loc_t *lock);

/*
 * PE start/stop
 */

#define RT_WARP_ALLOC_ALL -1
#define RT_MAX_WARP_POOL  RT_MAX_CLUSTER_NB_PES

void rt_warp_poolFree(rt_cc_t *cc, rt_warp_pool_t *pool);
rt_warp_pool_t *rt_warp_poolAlloc(rt_cc_t *cc, int nbCores);
static inline rt_task_t *rt_warp_poolTask(rt_cc_t *cc, rt_warp_pool_t *pool) {
  return &pool->task;
}

static inline rt_warp_pool_t *rt_warp_poolGetFirst();

void rt_warp_poolFree(rt_cc_t *cc, rt_warp_pool_t *warpPool);

static inline int rt_warp_init(rt_cc_t *cc, rt_warp_pool_t *pool, rt_warp_t *warp);

static inline void rt_warp_setStacks(rt_cc_t *cc, rt_warp_t *warp, unsigned int stacks, unsigned int stackSize);
static inline void rt_warp_setArg0(rt_cc_t *cc, rt_warp_t *warp, unsigned int arg);
static inline void rt_warp_setArg1(rt_cc_t *cc, rt_warp_t *warp, unsigned int arg);
static inline void rt_warp_setEntry(rt_cc_t *cc, rt_warp_t *warp, void (*entry)(unsigned int arg0, unsigned int arg1));

static inline void rt_warp_poolStart(rt_cc_t *cc, rt_warp_pool_t *pool);
static inline void rt_warp_start(rt_cc_t *cc, rt_warp_t *warp);
static inline void rt_warp_wait(rt_cc_t *cc, rt_warp_t *warp);

static inline rt_warp_t *rt_warp_clear(rt_warp_pool_t *pool);

/*
 * Libc-like features
 */

#ifndef NULL
#define NULL ((void *)0)
#endif


/*
 * Locks
 */

static inline unsigned int rt_tas_addr(unsigned int addr) {
  return addr + PULP_L1_TAS_OFFSET;
}

static inline void rt_mutex_init(rt_mutex_t *mutex) {
  *(volatile unsigned int *)&mutex->lock = 0;
}

static inline int rt_mutex_trylock(rt_mutex_t *mutex) {
  __asm__ __volatile__ ("" : : : "memory");
  int result = *(volatile unsigned int *)rt_tas_addr((unsigned int)&mutex->lock);
  __asm__ __volatile__ ("" : : : "memory");
  return result;
}

static inline void rt_mutex_unlock(rt_mutex_t *mutex) {
  __asm__ __volatile__ ("" : : : "memory");
  *(volatile unsigned int *)&mutex->lock = 0;
  __asm__ __volatile__ ("" : : : "memory");
#if EU_VERSION == 3
    eu_evt_trig(eu_evt_trig_addr(0), 0xffffffff);
#endif
}

#if EU_VERSION == 3
static inline void rt_mutex_lock(rt_mutex_t *mutex) {
  while (rt_mutex_trylock(mutex)) {
    rt_cc_t *cc = rt_getCcData(rt_clusterId());
    eu_evt_maskWaitAndClr(1);
  }
}
#endif


/*
 * Programming models
 */

static inline rt_pm_desc_t *rt_pm_getDesc(rt_msgHandler_t *handler, unsigned int pmId) {
  return &handler->pmDescs[pmId];
}

static inline void rt_pm_setInfo(rt_fc_t *fc, rt_pm_desc_t *desc, void *_this, void (*callback)(rt_task_t *task), void (*startCluster)(void *context, int cid)) {
  desc->data = _this;
  desc->callback = callback;
  desc->startCluster = startCluster;
}


/*
 * Debug features
 */

int putchar(int c);
int printf(const char *format, ...);
void exit(int status);
void abort();

/*
 * Utils
 */

static inline void rt_bf_init(unsigned int *bitfield, int nbBits);
static inline void rt_bf_mask_init(unsigned int *bitfield, unsigned int mask);

void *rt_memset(void *m, int c, int n);
void *rt_memcpy(void *dst0, const void *src0, int n);
int rt_strcmp(const char *s1, const char *s2);
int rt_strncmp(const char *s1, const char *s2, int n);

static inline rt_conf_t *rt_conf_get() {
  return &rtConf;
}

/*
 * Inlined functions implementation
 */

static inline void rt_bf_mask_init(unsigned int *bitfield, unsigned int mask) {
  *bitfield = mask;
}

static inline void rt_bf_init(unsigned int *bitfield, int nbBits) {
  if (nbBits == 32) *bitfield = 0xffffffff;
  else *bitfield = (1 << nbBits) - 1;
}

static inline void rt_bf_clear(unsigned int *bitfield) {
  *bitfield = 0;
}

static inline int rt_bf_get(unsigned int bitfield) {
  int result;
  __asm__ __volatile__ ("l.ff1\t\t%0,%1": "=r" (result) : "r" (bitfield));
#ifdef __riscv__
  return result;
#else
  return result-1;
#endif
}

static inline int rt_bf_alloc(unsigned int *bitfield) {
  int bit = rt_bf_get(*bitfield);
#ifdef __riscv__
  if (bit == 32) return -1;
#else
  if (bit == -1) return -1;
#endif
  *bitfield ^= 1<<bit;
  return bit;
}

static inline int rt_bf_reserve(unsigned int *bitfield, int id) {
  if (!(*bitfield & (1<<id))) {
    return -1;
  }
  *bitfield &= ~(1<<id);
  return 0;
}

static inline void rt_bf_free(unsigned int *bitfield, int bit) {
  *bitfield ^= 1<<bit;
}

static inline void rt_task_init(rt_task_t *task, void (*entry)(rt_task_t *task), unsigned int arg0, unsigned int arg1) {
  task->entry = entry;
  task->arg0 = arg0;
  task->arg1 = arg1;
}

static inline int rt_warp_init(rt_cc_t *cc, rt_warp_pool_t *pool, rt_warp_t *warp) {
  warp->nbCores = pool->nbCores;
  warp->coreSet = pool->coreSet;
  warp->pool = pool;
  warp->arg0 = 0;
  warp->arg1 = 0;
#ifdef __STHORM__
  warp->ac = rt_ac_alloc(cc);
  warp->acAddr = sthorm_hws_ac_getAddr(rt_clusterId(), warp->ac);
  if (warp->ac == -1) return -1;
#endif
  return 0;
}

static inline void rt_warp_setStacks(rt_cc_t *cc, rt_warp_t *warp, unsigned int stacks, unsigned int stackSize) {warp->stacks = stacks; warp->stackSize = stackSize; }
static inline void rt_warp_setArg0(rt_cc_t *cc, rt_warp_t *warp, unsigned int arg){warp->arg0 = arg;}
static inline void rt_warp_setArg1(rt_cc_t *cc, rt_warp_t *warp, unsigned int arg){warp->arg1 = arg;}
static inline void rt_warp_setEntry(rt_cc_t *cc, rt_warp_t *warp, void (*entry)(unsigned int arg0, unsigned int arg1)){warp->entry = entry;}

static inline void rt_warp_poolStart(rt_cc_t *cc, rt_warp_pool_t *pool) {
#ifdef __STHORM__
  rt_cluster_t *cd = cc->cd;
  unsigned int coreSet = pool->coreSet;
  unsigned int hwsBase = STHORM_HWS_BASE(rt_clusterId());
  int i;
  for (i=0; i<cc->nbCores; i++) {
    if (coreSet & ( 1 << i )) {
      cd->warpPoolFlush[i] = 1;
      cd->warpPool[i] = pool;
    }
  }
  rt_hwbarrier(); // PEs could be waken before the pool is actually written
  sthorm_hws_raise_evt(hwsBase, cd->warpPoolEvent, coreSet);
#else
  rt_cluster_t *cd = cc->cd;
  unsigned int coreSet = pool->coreSet;
  unsigned int i;

  for (i=0; i<cc->nbCores; i++) {
    if (coreSet & ( 1 << i )) {
      cd->warpPoolFlush[i] = 1;
      cd->warpPool[i] = pool;
    }
  }
  
#if EU_VERSION == 3
  eu_evt_trig(eu_evt_trig_addr(cc->cd->warpPoolEvent), coreSet);
#else
  pulp_gpevt_triggerCoreSet(cc->cd->warpPoolEvent, coreSet);
#endif

#endif
}

static inline void rt_warp_wait(rt_cc_t *cc, rt_warp_t *warp) {
#ifdef __PULP__
  rt_warp_pool_t *pool = warp->pool;
#if EU_VERSION == 3
  while(warp->ac) {
    // Unlock the CC sheduler so that we come back here once the warp is over
    cc->cd->ccSchedTask = 0;
    rt_threadSwitch(&cc->arch.ccThread, &cc->arch.peThread);
  }
#else
  while(warp->ac != pool->nbCores) {
    rt_threadSwitch(&cc->arch.ccThread, &cc->arch.peThread);
  }
#endif
#endif
}

static inline void rt_warp_start(rt_cc_t *cc, rt_warp_t *warp) {
#ifdef __STHORM__
  rt_warp_pool_t *pool = warp->pool;
  unsigned int hwsBase = STHORM_HWS_BASE(rt_clusterId());
  unsigned int coreSet = warp->coreSet;
  rt_cluster_t *cd = cc->cd;
  sthorm_hws_ac_setVal(warp->acAddr, warp->nbCores);
  sthorm_hws_ac_setNotif(hwsBase, warp->ac, STHORM_PN_COND_EQ, cc->cd->warpEvent, coreSet, 1);
  // TODO seems useless, check on board
  sthorm_hws_ac_updateNotif(hwsBase, warp->ac, STHORM_PN_COND_EQ, 0);

  rt_swbarrier(); // PEs could see the warp before the AC is actually written
  pool->warp[pool->currentWarp] = warp;
  rt_hwbarrier(); // PEs could be waken before the WARP is actually written

  sthorm_hws_raise_evt(hwsBase, cd->warpPoolEvent, coreSet);
  pool->currentWarp++;
  if (pool->currentWarp == 3) pool->currentWarp = 0;
#else
  rt_warp_pool_t *pool = warp->pool;
  unsigned int coreSet = warp->coreSet;
  rt_cluster_t *cd = cc->cd;
#if EU_VERSION == 3
  warp->ac = 1;
#else
  warp->ac = 0;
#endif
  pool->warp[pool->currentWarp] = warp;
#if EU_VERSION == 3
  eu_evt_trig(eu_evt_trig_addr(cd->warpPoolEvent), coreSet);
#else
  pulp_gpevt_triggerCoreSet(cd->warpPoolEvent, coreSet);
#endif
  pool->currentWarp++;
  if (pool->currentWarp == 3) pool->currentWarp = 0;
#endif
}

static inline rt_warp_t *rt_warp_clear(rt_warp_pool_t *pool) {
#ifdef __STHORM__
  rt_warp_t *warp = pool->warp[pool->firstWarp];
  if (warp != NULL && sthorm_hws_ac_getVal(warp->acAddr) == 0) {
    pool->warp[pool->firstWarp] = NULL;
    pool->firstWarp++;
    if (pool->firstWarp == 3) pool->firstWarp = 0;
    return warp;
  }
#else
  rt_warp_t *warp = pool->warp[pool->firstWarp];
  
#if EU_VERSION == 3
  if (warp != NULL && warp->ac == 0) {
#else
  if (warp != NULL && warp->ac == pool->nbCores) {
#endif
    pool->warp[pool->firstWarp] = NULL;
    pool->firstWarp++;
    if (pool->firstWarp == 3) pool->firstWarp = 0;
    return warp;
  }
#endif
  return NULL;
}

int rt_warp_allocAndstart(rt_warp_t *warp, unsigned int nbCores, unsigned int stacks, unsigned int coreStackSize, void (*entry)(unsigned int arg0, unsigned int arg1), unsigned int arg0, unsigned int arg1, void (*endOfWarp)(rt_task_t *task));

static inline void rt_dma_regTask(rt_fc_t *fc, rt_cc_t *cc, rt_task_t *task) {
  task->next = cc->sched.dmaTasks;
  cc->sched.dmaTasks = task;
  cc->cd->eventMask |= PULP_DMA_EVTMASK;
#if EU_VERSION == 3
  // Activate DMA interrupt to execute interrupt handler and register cc task when a transfer is finished
  unsigned int i;
  for (i=0; i<cc->nbCores; i++)
  {
    unsigned int base = eu_core_base(i);
    eu_irq_maskSet_base(base, PULP_DMA_EVTMASK);
  }
#endif
}

/*
 * SPI
 */

void rt_spi_copy(rt_cc_t *cc, rt_spi_copy_t *copy, unsigned int locAddr, unsigned int spiAddr, int loc2spi, unsigned int size);

void rt_spi_copy_wait(rt_cc_t *cc, rt_spi_copy_t *copy);

/*
 * I2S
 */


void rt_i2s_copy(rt_i2s_copy_t *copy, unsigned int channel, unsigned int l2Addr, int loc2l2, unsigned int size);

void rt_i2s_copy_wait(rt_i2s_copy_t *copy);

/*
 * Camera
 */

static inline void rt_cam_copy(rt_cc_t *cc, int camId, unsigned int destAddr, unsigned int size)
{
  pulp_write32(PULP_CAM_OFFSET(camId) + CAM_REG_DEST, destAddr);
  pulp_write32(PULP_CAM_OFFSET(camId) + CAM_REG_SIZE, size);
}

static inline void rt_cam_copy_wait(rt_cc_t *cc, int camId)
{
  while (pulp_read32(PULP_CAM_OFFSET(camId) + CAM_REG_BUSY)) {
    eu_evt_maskWaitAndClr(1<<PULP_CAM_EVENT);
  }
}

static inline void rt_cam_conf(rt_cc_t *cc, int camId, unsigned int *width, unsigned int *height, unsigned int *channels)
{
  *width = pulp_read32(PULP_CAM_OFFSET(camId) + CAM_REG_WIDTH);
  *height = pulp_read32(PULP_CAM_OFFSET(camId) + CAM_REG_HEIGHT);
  *channels = pulp_read32(PULP_CAM_OFFSET(camId) + CAM_REG_CHANNELS);
}

/*
 * IRQ
 */

void rt_initIrqHandler(rt_cc_t *cc, int irqId, void (*handler)());

/*
 * DMA
 */

static inline void rt_dma_mcInit(rt_dma_mc_t *data) {data->ongoing = 1;}

void rt_dma_mcMemcpy(rt_dma_mc_t *data, unsigned int targetClusterId, unsigned int ext, unsigned int loc, int loc2ext, unsigned int size);

void rt_dma_mcWait(rt_dma_mc_t *data);





static inline rt_warp_pool_t *rt_warp_poolGetFirst() { 
  int cid = rt_clusterId();
  rt_cc_t *cc = rt_getCcData(cid);
  rt_cluster_t *cd = rt_getClusterDataFromCc(cc);
  unsigned poolId = rt_bf_get((~cc->warpPoolSched.warpPoolBfAlloc) & ((1 << RT_MAX_WARP_POOL) - 1));
  return &cd->warpPoolData[poolId];
}


#endif
