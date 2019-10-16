/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_DATA_H__
#define __RT__RT_DATA_H__

#include "archi/pulp.h"

#if PULP_CHIP == CHIP_VIVOSOC2
#include "rt/rt_api_vivosoc2.h"

#elif PULP_CHIP == CHIP_PULP4
#include "rt/rt_api_pulp4.h"

#elif PULP_CHIP == CHIP_GAP
#include "rt/rt_api_gap.h"

#elif PULP_CHIP == CHIP_FULMINE
#include "rt/rt_api_fulmine.h"

#elif PULP_CHIP == CHIP_MIA
#include "rt/rt_api_mia.h"

#elif PULP_CHIP == CHIP_WOLFE
#include "rt/rt_api_wolfe.h"

#else
#error Unsupported chip
#endif

#ifdef PLP_BOOT_DATA
 #undef PLP_BOOT_DATA
#endif

#ifdef PLP_BOOT_CODE
 #undef PLP_BOOT_CODE
#endif

// Data declared with this attribute will be dropped after startup
#define PLP_BOOT_DATA    __attribute__((section(".boot.data")))
// Code declared with this attribute will be dropped after startup
#define PLP_BOOT_CODE    __attribute__((section(".boot")))

// Data will be replicated fro each thread
#define PLP_TLS_DATA __attribute__ ((section(".tls")))

// Data will be put at the beginning of the cluster L1 memory
#ifdef PULP_HAS_L1_ALIAS
#define PLP_TINY_DATA __attribute__ ((tiny)) __attribute__ ((section(".l1clusterTiny")))
#else
#define PLP_TINY_DATA __attribute__ ((section(".l1clusterTiny")))
#endif
#define PLP_L1_TINY_DATA PLP_TINY_DATA
// Data will be put inside cluster L1 memory
#define PLP_L1_DATA      __attribute__((section(".heapsram")))
// Data will be put inside cluster L1 memory through global address
#define PLP_L1_GLOBAL_DATA      __attribute__((section(".l1cluster_g")))
// Data will be put inside cluster L1 SCM memory
#define PLP_L1_SCM_DATA  __attribute__((section(".heapscm")))
// Data will be put inside cluster L1 SCM memory through global address
#define PLP_L1_SCM_GLOBAL_DATA  __attribute__((section(".heapscm_g")))
// Data will be put inside fabric L2 memory
#define PLP_L2_DATA      __attribute__((section(".ram")))
// Data will be put in both cluster L1 memory and FC TCDM
#define PLP_TCDM_DATA    __attribute__((section(".tcdm")))

// Data will be put by the linker at the beginning of the FC TCDM or in cluster L1 if there is no FC
#define PLP_FC_TINY_DATA  __attribute__((section(".fcTcdmTiny")))

// Data will be put by the linker in FC TCDM or in cluster L1 if there is no FC
#define PLP_FC_DATA      __attribute__((section(".fcTcdm")))

// Data will be put by the linker in both FC TCDM and in cluster L1 at the same aliased address
// This can be used to instantiate the same variable on both side which can then be used transparently 
// by the code on both side
#ifdef PULP_HAS_L1_ALIAS
#define PLP_L1_FC_DATA    __attribute__ ((tiny)) __attribute__((section(".l1FcTiny")))
#else
#define PLP_L1_FC_DATA    __attribute__((section(".l1FcTiny")))
#endif

// Data will be put by the linker in FC TCDM or in cluster L1 if there is no FC through global address
#define PLP_FC_GLOBAL_DATA      __attribute__((section(".fcTcdm_g")))

// Events statically reserved by the runtime
#if EU_VERSION >= 3
#define PLP_RT_SYNC_EVENT   0      // Used for SW synchronizarion
#define PLP_RT_NOTIF_EVENT  1      // Used for inter-cluster and FC notification (from interrupt handler to wake-up cores)
#define PLP_RT_NOTIF_HWCE   2      // Used for waking-up core waiting for HWCE job completion
#define PLP_RT_SCHED        3      // Used for scheduler
#define PLP_RT_REMOTE       4      // Used for remote communication
#else
#define PLP_RT_SYNC_EVENT   1
#define PLP_RT_NOTIF_EVENT  1
#define PLP_RT_NOTIF_HWCE   1
#define PLP_RT_SCHED        1
#define PLP_RT_REMOTE       2
#define PLP_RT_DISPATCH     1

#define RT_DISPATCH_SIZE 8

#endif

// SoC events statically reserved by the runtime
#define PLP_RT_FC_NOTIF_SOC_EVENT 0     // Used to notify FC
#define PLP_RT_C0_NOTIF_SOC_EVENT 1     // Used to notify cluster 0. One event per cluster will be reserved starting from this one

#define PLP_MAX_TASKS_LOG2      4
#define PLP_MAX_TASKS           (1<<PLP_MAX_TASKS_LOG2)
#define PLP_MAX_PRIO_TASKS_LOG2 2
#define PLP_MAX_PRIO_TASKS      (1<<PLP_MAX_PRIO_TASKS_LOG2)
#define PLP_TASK_ARG_BIT  20
#define PLP_TASK_ARG_BITS (32-PLP_TASK_ARG_BIT)
#define PLP_TASK_TYPE_BIT     18
#define PLP_TASK_HANDLER_BIT  19


#ifndef LANGUAGE_ASSEMBLY

typedef struct {
	unsigned int addr;
} plp_hwMutex_t;

typedef void (*plp_task_handler_t)(unsigned int arg);
typedef unsigned int plp_task_t;

typedef struct plp_task_delayed_s {
  plp_task_t task;
  unsigned int ticksSpec;
  unsigned int ticks;
  unsigned int conf;
  struct plp_task_delayed_s *next;

} plp_task_delayed_t;

#endif

#define PLP_CONF_T_PLATFORM     0
#define PLP_CONF_T_NB_CLUSTERS  4
#define PLP_CONF_T_NB_CORES     8
#define PLP_CONF_T_STACK_SIZE   12
#define PLP_CONF_T_L1_SIZE      16
#define PLP_CONF_T_SCM_SIZE     20
#define PLP_CONF_T_L2_SIZE      24
#define PLP_CONF_T_HAS_HOST     28
#define PLP_CONF_T_FETCHALL     32

#ifndef LANGUAGE_ASSEMBLY

// Cluster and FC visible data
extern PLP_L1_FC_DATA unsigned int socEventsStatus;

// FC visible data
extern volatile PLP_FC_TINY_DATA unsigned int clusterStatus;
extern PLP_FC_TINY_DATA unsigned int socEventAlloc;
extern PLP_FC_TINY_DATA unsigned int fcSwEventsAlloc;

// Cluster visible data
extern volatile PLP_L1_TINY_DATA int clusterRetval;
extern PLP_L1_TINY_DATA unsigned int swEventsAlloc;
extern PLP_L1_TINY_DATA unsigned int hwMutexAlloc;
extern PLP_L1_TINY_DATA char clusterIsFetched;

#if EU_VERSION == 1
typedef struct {
  unsigned int data;
  unsigned int readyMask;
  unsigned int teamMask;
} dispatch_elem_t;

extern PLP_L1_TINY_DATA dispatch_elem_t dispatchFifo[RT_DISPATCH_SIZE];
extern PLP_L1_TINY_DATA int dispatchHead;
#endif

/* Linker script data */
extern unsigned int _heapscm_start;
extern unsigned int _heapscm_size;
extern unsigned int _heapsram_start;
extern unsigned int _heapsram_size;
extern unsigned int _heapl2ram_start;
extern unsigned int _heapl2ram_size;
extern unsigned char __ZERO;
extern unsigned char __L2;
extern unsigned char __FETCH_ALL;
extern unsigned char __ACTIVE_FC;
extern unsigned char __NB_ACTIVE_PE;
extern unsigned char __STACK_SIZE;

typedef struct {
  unsigned int lock;
} plp_swMutex_t;

struct plp_i2s_copy_s;

#endif

#if UDMA_VERSION == 1
#define PLP_UDMA_CHANNEL_T_SIZEOF     (7*4)
#define PLP_UDMA_CHANNEL_T_NBONGOING  16
#else
#define PLP_UDMA_CHANNEL_T_SIZEOF     (5*4)
#endif
#define PLP_UDMA_CHANNEL_T_FIRST       0
#define PLP_UDMA_CHANNEL_T_LAST        4
#define PLP_UDMA_CHANNEL_T_FIRST_TO_ENQUEUE  8
#define PLP_UDMA_CHANNEL_T_BASE        12

#ifndef LANGUAGE_ASSEMBLY

typedef struct {
  struct plp_udma_copy_s *first;
  struct plp_udma_copy_s *last;
  struct plp_udma_copy_s *firstToEnqueue;
  unsigned int base;
#if UDMA_VERSION == 1
  int nbOngoing;
  int isSpi;
#endif
  int isTx;
} plp_udma_channel_t;

#endif

#define PLP_UDMA_COPY_T_L2ADDR          0
#define PLP_UDMA_COPY_T_SIZE            4 
#define PLP_UDMA_COPY_T_CFG             8
#define PLP_UDMA_COPY_T_NEXT            12
#define PLP_UDMA_COPY_T_PENDING         16
#define PLP_UDMA_COPY_T_HANDLER         20
#define PLP_UDMA_COPY_T_CHANNEL         24
#define PLP_UDMA_COPY_T_TASK            28
#define PLP_UDMA_COPY_T_L1ADDR          32
#define PLP_UDMA_COPY_T_DMACMD          36
#define PLP_UDMA_COPY_T_DMACOPY         40
#define PLP_UDMA_COPY_T_CHANNELID       44

#define PLP_DMA_COPY_T_TASK             0
#define PLP_DMA_COPY_T_COUNTER          4
#define PLP_DMA_COPY_T_NEXT             8

#ifndef LANGUAGE_ASSEMBLY

typedef struct plp_dma_copy_s {
  plp_task_t task;
  int counter;
  struct plp_dma_copy_s *next;
} plp_dma_copy_t;

typedef struct plp_udma_copy_s {
  unsigned int l2Addr;
  unsigned int size;
  unsigned int cfg;
  struct plp_udma_copy_s *next;
  int pending;
  void (*handler)();
  plp_udma_channel_t *channel;
  plp_task_t task;
  unsigned int l1Addr;
  unsigned int dmaCmd;
  plp_dma_copy_t dmaCopy;
  int channelId;
} plp_udma_copy_t;


typedef struct {
  plp_udma_copy_t udmaCopy[2];
  unsigned int l2Buffer;
  unsigned int l1Buffer;
  int l2Index;
  unsigned int cfg;
  int channel;
  int size;
  int sizeAligned;
  int done;
  plp_dma_copy_t dmaCopy;
  plp_task_t task;
  int isTx;
  unsigned int conf;
} plp_copy_t;

typedef struct {
  unsigned int conf;
} plp_timer_t;

typedef struct {
  plp_udma_copy_t udmaRxNode;
  plp_udma_copy_t udmaTxNode;
} plp_flash_copy_t;

extern PLP_L1_TINY_DATA unsigned int hwce_x_ptr;      // Filter current pointer. Already incremented, can be stored directly to job
extern PLP_L1_TINY_DATA unsigned int hwce_yin_ptr;    // yin current pointer. Already incremented, can be stored directly to job
extern PLP_L1_TINY_DATA unsigned int hwce_yout0_ptr;   // yout current pointer. Already incremented, can be stored directly to job
extern PLP_L1_TINY_DATA int hwce_wRem;                 // Output width that remains to be notified. 0 means convolution is over
extern PLP_L1_TINY_DATA unsigned int hwce_wTrigRem;    // Output width that remains to be enqueued. 0 means there is nothing more to enqueue
extern PLP_L1_TINY_DATA unsigned int hwce_yLines;      // Number of lines to be processed on yout
extern PLP_L1_TINY_DATA unsigned int hwce_xLines;      // Number of lines to be processed on yin
extern PLP_L1_TINY_DATA unsigned int hwce_xLineStride; // X line stride. Although it is constant, we need it to set the 32 bit register containing stride and length. Could not be read from HWCE due to a bug. Also not possible to do 16 bits accesses due to limitation
extern PLP_L1_TINY_DATA unsigned int hwce_yLineStride; // Y line stride.
extern PLP_L1_TINY_DATA unsigned int hwce_yout1_ptr;
extern PLP_L1_TINY_DATA unsigned int hwce_yout2_ptr;
extern PLP_L1_TINY_DATA unsigned int hwce_yout3_ptr;
extern PLP_L1_TINY_DATA int hwce_wRem_shadow;

typedef struct {
  char format;
  int dropFrames;
} plp_cam_conf_t;

#endif

#endif
