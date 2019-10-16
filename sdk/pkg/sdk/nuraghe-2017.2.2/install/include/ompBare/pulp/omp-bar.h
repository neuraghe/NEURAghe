/* Copyright 2014 DEI - Universita' di Bologna
 *   author       DEI - Universita' di Bologna
 *                Davide Rossi         - davide.rossi@unibo.it
 *                Alessandro Capotondi - alessandro.capotondi@unibo.it
 *   info         Master Slave Software Barriers implementation. */


#ifndef __OMP_BAR_H__
#define __OMP_BAR_H__

#include "omp-hal.h"

#if EU_VERSION == 1
#include "events.h"
#include "timer.h"
#include "events_ids.h"
#endif

// #define OMP_BAR_DEBUG

/* Software Barriers Data Type */
typedef volatile int32_t MSGBarrier;
#define Log2SizeofMSGBarrier (2U)

/* Software Barriers Base Address */
#define SWBAR_BASE_ADDR                     ( LIBGOMP_BASE )

/* Local Aliased Address */
#define SWBAR_LBASE_ADDR                    ( LIBGOMP_LBASE )

#define SWBAR_RFLAGS_SIZE                   (( DEFAULT_MAX_PE  << Log2SizeofMSGBarrier ))
#define SWBAR_NFLAGS_SIZE                   (( DEFAULT_MAXPROC << Log2SizeofMSGBarrier ))
#define SWBAR_SIZE                          ( SWBAR_RFLAGS_SIZE + SWBAR_NFLAGS_SIZE )
#define SWBAR_ID                            ( 0xFFFFFFFFU )

/* HW Wakeup Cores */
static inline void
gomp_hal_hwTrigg_core( uint32_t cmask )
{
#if EU_VERSION == 1
    *(volatile uint32_t*) ( TRIGG_BARRIER ) = cmask;
#ifdef OMP_BAR_DEBUG
        printf("[%d][%d][gomp_hal_hwTrigg_core] Trigger %x at 0x%x\n", get_proc_id(), get_cl_id(), cmask, get_hal_addr( get_cl_id(), OFFSET_EVENT0 ));
#endif
#else
	if (cmask) eu_evt_trig(eu_evt_trig_addr(0), cmask);
#endif
}

#include "bar-sw.h"
#include "bar-hw.h"

/* HW Wakeup Cores */
static inline void
gomp_hal_hwTrigg_Team( uint32_t cid )
{

}

#endif /*__BAR_H__*/
