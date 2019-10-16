/* Copyright 2014 DEI - Universita' di Bologna
   author       DEI - Universita' di Bologna
                Alessandro Capotondi - alessandro.capotondi@unibo.it
   info         PULP OpemMP HAL */

#ifndef __OMP_HAL_H__
#define __OMP_HAL_H__

#include <stdint.h>

#include <hal/pulp.h>
#include <pulp.h>
#include <hwTrace.h>
#include <string_lib.h>
#include <utils.h>

/* HEADERS */
#include "config.h"

#ifndef ALWAYS_INLINE
#define ALWAYS_INLINE static inline __attribute__ ((always_inline))
#endif

#ifndef NULL
#define NULL ((void *) 0x0) /* Standard C */
#endif


#include "appsupport.h"
#include "omp-bar.h"
#include "memutils.h"
#include "omp-lock.h"
#include "mutex.h"

#define gomp_assert(x) \
{\
    if( ! (x)) {\
        printf("[%d][%d][GOMP] Assert failed at file %s line %d\n", get_cl_id(), get_proc_id(), __FILE__, __LINE__); \
        abort();\
    }\
}

ALWAYS_INLINE void
perfInitAndStart()
{
#ifdef PROFILE0
    cpu_perf_conf_events(PCER_ALL_EVENTS_MASK);
    cpu_perf_setall(0);
    cpu_perf_conf(PCMR_ACTIVE | PCMR_SATURATE);
#endif
}

ALWAYS_INLINE void
gomp_hal_init()
{
    gomp_assert(get_num_procs() <= DEFAULT_MAXPROC);
    gomp_assert(get_num_clusters() <= DEFAULT_MAXCL);
    gomp_assert(EU_VERSION == 1);

    /* Set Event Line to 1 */
#if EU_VERSION == 1
    set_evnt_mask_low( get_proc_id(), 1 ); //configure the event mask
#else
    eu_evt_maskSet( 1<<0 );
#endif

    /* Start Performance Counters */
    perfInitAndStart();
}    



#endif /* __HAL_H__ */
