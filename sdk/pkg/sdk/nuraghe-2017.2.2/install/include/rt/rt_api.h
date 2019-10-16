/*
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_H__
#define __RT__RT_API_H__

#include <hal/pulp.h>
#include <rt/rt_data.h>
#include <rt/rt_sys.h>
#include <rt/rt_api_sched.h>
#include <rt/rt_api_io.h>
#include <rt/rt_api_dma.h>
#include <rt/rt_api_udma.h>
#include <rt/rt_malloc.h>
#include <rt/rt_api_timer.h>
#include <rt/rt_lib.h>
#include <rt/rt_compat_oldovx.h>
#include <rt/rt_api_i2s_vpi.h>
#include <rt/rt_api_doublebuff.h>
#include <rt/rt_api_lvds.h>
#include <rt/rt_api_hwce.h>
#include <rt/rt_api_pmu.h>
#include <rt/rt_debug.h>
#include <rt/rt_api_flash.h>
#include <rt/rt_api_adc.h>
#include <rt/rt_api_i2c.h>
#include <rt/rt_api_analog_control.h>
#include <rt/rt_api_analog_ppg.h>
#include <rt/rt_api_cam.h>
#include <rt/rt_api_fs.h>
#include <rt/rt_name_alloc.h>
#include <rt/rt_api_gpio.h>

/*
 * Bitfield allocator
 */

 static inline void plp_bitfield_mask_init(unsigned int *bitfield, unsigned int mask);

 static inline void plp_bitfield_init(unsigned int *bitfield, int nbBits);

 static inline void plp_bitfield_clear(unsigned int *bitfield);

 static inline int plp_bitfield_get(unsigned int bitfield);

 static inline int plp_bitfield_alloc(unsigned int *bitfield);

 static inline int plp_bitfield_reserve(unsigned int *bitfield, int id);

 static inline void plp_bitfield_free(unsigned int *bitfield, int id);


/*
 * SW mutexes
 */

static inline unsigned int plp_tas_addr(unsigned int addr);

static inline void plp_swMutex_init(plp_swMutex_t *mutex);

static inline int plp_swMutex_trylock(plp_swMutex_t *mutex);

static inline void plp_swMutex_lock(plp_swMutex_t *mutex);

static inline void plp_swMutex_unlock(plp_swMutex_t *mutex);


/*
 * HW mutexes
 */

/** Hardware mutex allocation
 *
 * This allocates
 */
static inline int plp_hwMutex_alloc(plp_hwMutex_t *mutex);

static inline void plp_hwMutex_lock(plp_hwMutex_t *mutex);

static inline void plp_hwMutex_unlock(plp_hwMutex_t *mutex);


/*
 * Memories information
 */

static inline unsigned int plp_getL2HeapBase() { return (unsigned int)&_heapl2ram_start;}
static inline unsigned int plp_getL2HeapSize() { return (unsigned int)&_heapl2ram_size;}

static inline unsigned int plp_getL1HeapBase() { return (unsigned int)&_heapsram_start;}
static inline unsigned int plp_getL1HeapSize() { return (unsigned int)&_heapsram_size;}

#ifdef SCM_SIZE
static inline unsigned int plp_getL1ScmHeapBase() { return (unsigned int)&_heapscm_start;}
static inline unsigned int plp_getL1ScmHeapSize() { return (unsigned int)&_heapscm_size;}
#endif

/*
 * Interrupts
 */
static inline void plp_irq_enable();

static inline void plp_irq_disable();

void plp_irq_setHandler(unsigned int irq, void (*handler)());

/*
 * Cluster control
 */

void plp_cluster_fetch(unsigned int mask);
int plp_cluster_wait(unsigned int clusterId);
static inline unsigned int plp_cluster_getTinyData(unsigned int clusterId, unsigned int tinyData)
{
	// TODO due to a compiler bug, we have to declare the result as volatile to block the propagation of the tiny attribute
	volatile unsigned int ptr = tinyData;
  return PULP_CLUSTER_REMOTE_BASE(clusterId) + ptr;
}

static inline unsigned int plp_fc_getTinyData(unsigned int tinyData)
{
	// TODO due to a compiler bug, we have to declare the result as volatile to block the propagation of the tiny attribute
	volatile unsigned int ptr = tinyData;
#if defined(PLP_HAS_FC) && defined(FC_TCDM_CORE_START)
  return FC_TCDM_CORE_START + ptr;
#else
  return plp_cluster_getTinyData(0, ptr);
#endif
}

static inline unsigned int plp_cluster_getStatus(unsigned int clusterId)
{
  return ((*(volatile unsigned int *)plp_fc_getTinyData((int)&clusterStatus)) >> clusterId) & 1;
}

static inline int plp_cluster_getRetval(unsigned int clusterId)
{
  return *(volatile int *)plp_cluster_getTinyData(clusterId, (int)&clusterRetval);
}

static inline void plp_cluster_exit(unsigned int clusterId, int retval)
{
  clusterRetval = retval;
  *(volatile unsigned int *)plp_fc_getTinyData((int)&clusterStatus) |= (1 << clusterId);
#ifdef PLP_HAS_FC
  soc_eu_genEventMask(1);
#endif
}

/*
 * Misc
 */


void plp_setSlaveStacks(unsigned int coreMask, unsigned int stacksBase, unsigned int stackSize);
void plp_setSlaveEntry(unsigned int coreMask, void (*handler)(), unsigned int arg);

void plp_bootInit();
void plp_bootDeinit();


/*
 * Time
 */


static inline unsigned int plp_getCycles();


/*
 * Architecture and runtime information
 */

static inline unsigned int plp_l2Size() { return (unsigned int)&__L2; }
static inline unsigned int plp_fetchAll() { return ((unsigned int)&__FETCH_ALL) != ((unsigned int )&__ZERO); }
static inline unsigned int plp_activeFc() { return ((unsigned int)&__ACTIVE_FC) != ((unsigned int )&__ZERO); }
static inline unsigned int plp_nbActiveCores() { return (unsigned int)&__NB_ACTIVE_PE; }
static inline unsigned int plp_stackSize() { return (unsigned int)&__STACK_SIZE; }

/*
 * Events allocators
 */

static inline unsigned int *plp_swEvents_getAlloc();

#ifdef PLP_HAS_FC

static inline int  plp_socEvent_alloc();
static inline void plp_socEvent_free(int event);
static inline void plp_socEvent_configure(int cluster, int event, int active);
static inline void plp_socEvent_raise(int event);
static inline void plp_socEvent_wait(int event);
static inline void plp_socEvent_clear(int event);

/*
 * FC
 */

static inline void plp_notif_cluster(int cid);
static inline void plp_notif_clear();
static inline void plp_notif_wait();

static inline unsigned int *plp_socEvents_getAlloc();
static inline unsigned int *plp_fcSwEvents_getAlloc();

#endif

#if EU_VERSION == 1
void plp_dispatch_push2(unsigned int coreMask, unsigned int val0, unsigned int val1);

void plp_dispatch_push3(unsigned int coreMask, unsigned int val0, unsigned int val1, unsigned int val2);
#endif

#include "rt/impl/rt_api.h"

#endif
