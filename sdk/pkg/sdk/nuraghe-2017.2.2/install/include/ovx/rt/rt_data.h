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

#ifndef __RT_DATA_H__
#define __RT_DATA_H__

#include "archi/pulp.h"

#define HOST_REQ_AREA_SIZE (2*1024)

#define RT_OCL_MAX_DEPS 5

#define CLE_PULP_NB_COMMANDS 64

#ifndef LANGUAGE_ASSEMBLY

#include <hd/hd_req.h>

struct rt_warp_pool_s;
struct rt_warp_s;
struct rt_task_s;
struct rt_cluster_s;
struct rt_mutex_s;
typedef struct rt_clusterState_s rt_clusterState_t;

typedef struct rt_mutex_s {
  unsigned int lock;
} rt_mutex_t;

#endif

#include <archi/pulp/archi_pulp.h>
#include <rt/pulp/rt_data_pulp.h>

#define RT_MAX_CLUSTER_NB_PES PULP_MAX_CLUSTER_NB_PES
#define RT_MAX_NB_CLUSTERS PULP_MAX_NB_CLUSTERS

#if EU_VERSION == 3
// With new events we have 16 GP events, just take 8 to keep room for barriers and so on
#define RT_NB_GP_EVENTS   8
// The GP events start from 0 in order to easily access event triggering which starts from 0
#define RT_FIRST_GP_EVENT 0
#define RT_HW_BAR_EVENT  PULP_HW_BAR_EVENT
#else
#define RT_NB_GP_EVENTS   PULP_NB_GP_EVENTS
// TODO this should be 1
#define RT_FIRST_GP_EVENT 0
#define RT_HW_BAR_EVENT  PULP_HW_BAR_EVENT
#endif

#ifdef LANGUAGE_ASSEMBLY

#define RT_CLUSTER_TASK_SIZE            (4+4+4+4)

#define RT_CLUSTER_WARP_POOL_SIZE       (4*3+4+4+4+RT_CLUSTER_TASK_SIZE+4+4+RT_MAX_CLUSTER_NB_PES+4+4)

// Offsets for rt_cluster_t used in assembly code
#define RT_CLUSTER_MSG_EVENT            (0)
#define RT_CLUSTER_WARP_POOL_EVENT      (RT_CLUSTER_MSG_EVENT + 4)
#define RT_CLUSTER_SCHED_WAIT_MASK      (RT_CLUSTER_WARP_POOL_EVENT + 4)
#define RT_CLUSTER_WARP_EVENT           (RT_CLUSTER_SCHED_WAIT_MASK + 4)
#define RT_CLUSTER_EVENT_MASK           (RT_CLUSTER_WARP_EVENT + 4)
#define RT_CLUSTER_WARP_POOL_DATA       (RT_CLUSTER_EVENT_MASK + 4)
#define RT_CLUSTER_WARP_POOL            (RT_CLUSTER_WARP_POOL_DATA + RT_CLUSTER_WARP_POOL_SIZE*RT_MAX_CLUSTER_NB_PES)
#define RT_CLUSTER_WARP_POOL_FLUSH      (RT_CLUSTER_WARP_POOL + 4*RT_MAX_CLUSTER_NB_PES)
#define RT_CLUSTER_CC_SCHED_LOCK        (RT_CLUSTER_WARP_POOL_FLUSH + RT_MAX_CLUSTER_NB_PES)
#define RT_CLUSTER_CC_SCHED_TASK        (RT_CLUSTER_CC_SCHED_LOCK + 4)

// Offsets for rt_warp_pool_t used in assembly code
#define RT_WARP_POOL_WARPS              (0)
#define RT_WARP_POOL_NB_CORES           (RT_WARP_POOL_WARPS + 4*3)
#define RT_WARP_POOL_CORESET            (RT_WARP_POOL_NB_CORES + 4)
#define RT_WARP_POOL_HW_BARRIER         (RT_WARP_POOL_CORESET + 4)
#define RT_WARP_POOL_TASK               (RT_WARP_POOL_HW_BARRIER + 4)
#define RT_WARP_POOL_CURRENT_WARP       (RT_WARP_POOL_TASK + RT_CLUSTER_TASK_SIZE)
#define RT_WARP_POOL_FIRST_WARP         (RT_WARP_POOL_CURRENT_WARP + 4)
#define RT_WARP_POOL_PE_ID              (RT_WARP_POOL_FIRST_WARP + 4)
#define RT_WARP_POOL_POOL_ID            (RT_WARP_POOL_PE_ID + RT_MAX_CLUSTER_NB_PES)
#define RT_WARP_POOL_BARRIER            (RT_WARP_POOL_POOL_ID + 4)

// Offsets for rt_warp_t used in assembly code
#define RT_WARP_ENTRY                   (0)
#define RT_WARP_ARG0                    (RT_WARP_ENTRY + 4)
#define RT_WARP_ARG1                    (RT_WARP_ARG0 + 4)
#define RT_WARP_AC                      (RT_WARP_ARG1 + 4)
#define RT_WARP_AC_ADDR                 (RT_WARP_AC + 4)
#define RT_WARP_NB_CORES                (RT_WARP_AC_ADDR + 4)
#define RT_WARP_CORE_SET                (RT_WARP_NB_CORES + 4)
#define RT_WARP_STACKS                  (RT_WARP_CORE_SET + 4)
#define RT_WARP_STACK_SIZE              (RT_WARP_STACKS + 4)
#define RT_WARP_POOL                    (RT_WARP_STACK_SIZE + 4)

#else

#include <rt/internals/dlmalloc.h>

#ifdef __STHORM__
#include <archi/sthorm/archi_sthorm.h>
#include <hal/sthorm/hal_sthorm.h>
#endif

#define RT_NB_TASK_PRIO 1

typedef struct {
  void *data;
  void (*callback)(struct rt_task_s *task);
  void (*startCluster)(void *context, int cid);
  void (*stopCluster)(void *context, int cid);
  rt_clusterState_t *firstFreeCluster;
  int nbFreePe;
} rt_pm_desc_t;

// !!!!!!!!!!!! BE CAREFUL !!!!!!!!!!!!!!!!
// Updates the assembly offset at the beginning of this file when this structure is modified
typedef struct rt_task_s {
  void (*entry)(struct rt_task_s *task);
  unsigned int arg0;
  unsigned int arg1;
  struct rt_task_s *next;
} rt_task_t;

// !!!!!!!!!!!! BE CAREFUL !!!!!!!!!!!!!!!!
// Updates the assembly offset at the beginning of this file when this structure is modified
typedef struct rt_warp_pool_s {
  // DONT MOVE THIS FIELD. In assembly code, it is assumed to be the first in the structure
  struct rt_warp_s *warp[3];
  unsigned int nbCores;
  unsigned int coreSet;
  int barrier;
  rt_task_t task;
  int currentWarp;
  int firstWarp;
  unsigned char peId[RT_MAX_CLUSTER_NB_PES];
  int poolId;
#ifdef __OR1K__
  unsigned int barrierCounter;
#endif
} rt_warp_pool_t;

typedef struct {
  rt_task_t *first;
  rt_task_t *last;
} rt_taskQueue_t;

#define RT_SYS_CONF_PLATFORM_NONE -1
#define RT_SYS_CONF_PLATFORM_OTHER 0
#define RT_SYS_CONF_PLATFORM_RTL   1
#define RT_SYS_CONF_PLATFORM_FPGA  2

typedef struct {
  int  platform;
  unsigned int nbClusters;
  unsigned int nbCores;
  unsigned int l1Size;
  unsigned int scmSize;
  unsigned int l2Size;
  int hasHost;
} rt_sys_conf_t;

extern rt_sys_conf_t rtSysConf;

typedef struct {

  rt_sys_conf_t sys;

  unsigned int ccStackSize;
  unsigned int triggerAddr;

  unsigned int hostOutFifoArray;
  unsigned int hostOutFifoSize;
  unsigned int hostInFifoArray;
  unsigned int hostInFifoSize;

  /* Host req area
   * This memory area is reserved for requests coming from host-side
   * This information is filled during fabric side initialization, and then read
   * by the host side when it receives the fabric-side boot aknowledgement
   */
   //Base address of the area
  // This is the address as seen from the fabric side. On posix mode, this may not be
  // an architectural defined address
  unsigned int hostReqAreaBase;
  // Base address of the area as seen through the real architectural address
  // This is only useful on Posix mode in order to get an address handled by the routers
  unsigned int hostReqAreaArchiBase;
  // Size of the area
  unsigned int hostReqAreaSize;

  unsigned int msgEvent;
  unsigned int ccSchedEvent;

} rt_conf_t;

typedef struct {
  int warnings;
  int traceLevel;
} rt_ctrl_t;

typedef struct {
  unsigned int pos;
  unsigned int size;
  unsigned int *array;
  unsigned int *remoteArray;
} rt_msgFifo_t;

typedef struct {
  rt_pm_desc_t pmDescs[PULP_REQ_NB_PMID];
  int event;
  rt_msgFifo_t *inFifo;
  unsigned char *reqArea;
} rt_msgHandler_t;

typedef struct {
  unsigned int warpPoolBfAlloc;
  rt_warp_pool_t *warpPoolData;
} warpPoolSched_t;

typedef struct {
  rt_taskQueue_t taskQueue[RT_NB_TASK_PRIO];
  unsigned int nbTasks;
  rt_msgHandler_t *msgHandler;
  warpPoolSched_t *warpPoolSched;
  rt_task_t *dmaTasks;
#if EU_VERSION == 3
  int handleDmaTask;
#endif
} rt_sched_t;

struct cle_req_dev_s;

#if 0
// This structure is used to pass the profiling results
// It is used both for work-groups and the full request
typedef struct {
  unsigned int perfCounters[MAX_NB_PERF_COUNTERS]; // The profiling information retrieved from HW counters
  unsigned int totalTime;                          // Total time taken to execute the request or the work-group
  unsigned int nbWi;                               // Number of work-items
} cle_req_prof_t;
#endif

typedef enum {
  CLE_WG_SCHED_SINGLE,
  CLE_WG_SCHED_MULTI
} cle_req_wgSchedType_e;

typedef struct cle_req_dev_s {
  unsigned int enqueueTime;      // This gives the time when the request is received on fabric side. All other times are relative to this one and this one is considered as an approximation of the host side enqueue time, in order to convert all timestamps into host timestamps
  unsigned int ccConf;       // The profiling metrics to be activated for this command
  unsigned int hwCcConf;     // The profiling metrics converted into hardware config to be put in the HW counters
  // Callback called each time a work-group is ready for execution
  unsigned int enqueueWgFunction;
  // Callback called when the request is over
  unsigned int closeCmdFunction;
  // First argument to the callbacks
  unsigned int arg0;
  // Second argument to the callbacks
  unsigned int arg1; 
  // Local identifier of the command in the device
  unsigned char commandId;
  unsigned char firstDep;
  unsigned char nbUpDep;
  unsigned char deps[RT_OCL_MAX_DEPS];

  unsigned char nbWi;
  unsigned char nbWg;
  unsigned char totalNbWg;
  unsigned char pm;

  cle_req_wgSchedType_e wgSched;
  unsigned int hostReply;        // Pointer to the host reply structure

  struct cle_req_dev_s *next;

  /* Reply fields */
  unsigned retval;
  // cle_req_prof_t prof;
  unsigned int startTime;        // Time when the request is ready for execution
  unsigned int endTime;          // Time when the request has finished execution

} cle_req_dev_t;

typedef struct {
  //cle_req_prof_t prof;    // Profiling information for the work-group
  int cid;
} cle_req_wg_t;

typedef struct rt_spi_copy_s {
  unsigned int locAddr;
  unsigned int spiAddr;
  unsigned int size;
  unsigned int fullSize;
  int loc2spi;
  int done;
  struct rt_spi_copy_s *next;
} rt_spi_copy_t;



/* 
 * I2S
 */
typedef struct rt_i2s_copy_s {
  unsigned int l2Addr;
  unsigned int size;
  unsigned int channel;
  int done;
  struct rt_i2s_copy_s *next;
} rt_i2s_copy_t;

typedef struct rt_i2s_s {
  rt_i2s_copy_t *firstCopy;
  rt_i2s_copy_t *lastCopy;
} rt_i2s_t;



typedef struct {
  rt_ctrl_t c;
  rt_sched_t sched;
  rt_msgHandler_t msgHandler;
  warpPoolSched_t warpPoolSched;
  unsigned int schedEvent;
  unsigned int coreBfAlloc;
  unsigned int evtBfAlloc;
  unsigned int barBfAlloc;
  unsigned int cid;
  rt_dlmalloc_t l1Alloc;
  rt_dlmalloc_t scmAlloc;
  unsigned int l1AllocBase;
  unsigned int l1AllocTail;
  unsigned int l1AllocSize;
  int l1AllocStarted;
  rt_conf_t *conf;
  unsigned int nbCores;
  unsigned int coreMask;
  unsigned int ccStack;
  rt_spi_copy_t *ongoingCopy;
  rt_spi_copy_t *firstSpiCopy;
  rt_spi_copy_t *lastSpiCopy;
  rt_mutex_t spiLock;

#ifdef UDMA_VERSION
  rt_i2s_t i2s[4];
#endif

  int spiEvent;
  void (*irqHandler[32])();
  struct rt_cluster_s *cd;
  rt_cc_arch_t arch;
} rt_cc_t;

typedef struct {
  rt_ctrl_t c;
  rt_msgFifo_t hostInFifo;
  rt_msgFifo_t hostOutFifo;
  rt_msgHandler_t msgHandler;
  rt_cc_t *cc;
  rt_dlmalloc_t l2Alloc;
  rt_conf_t *conf;

  // This is the area reserved for request coming from host side
  // the host will allocates the requests within this area
  unsigned char hostReqArea[HOST_REQ_AREA_SIZE];
  
  // Contains the references to all the on-going requests in the device
  // It is used for cross request dependency management
  cle_req_dev_t *pendingReqs[CLE_PULP_NB_COMMANDS];

  // The pool of pending request that still have work-groups to be enqueued
  cle_req_dev_t *firstPendingReq;
  cle_req_dev_t *lastPendingReq;

  rt_clusterState_t *firstFreeCluster;
  rt_clusterState_t *lastFreeCluster;

  rt_clusterState_t *devCluster;

#if EU_VERSION == 3
  unsigned int socbarBfAlloc;
  unsigned int socLockBfAlloc;
#endif

} rt_fc_t;

struct rt_dma_mc_s;
typedef struct rt_dma_mc_s {
  int ongoing;
  unsigned int counter;
  unsigned int cluster;
  struct rt_dma_mc_s *next;
} rt_dma_mc_t;

// !!!!!!!!!!!! BE CAREFUL !!!!!!!!!!!!!!!!
// Updates the assembly offset at the beginning of this file when this structure is modified
typedef struct rt_cluster_s {
  unsigned int msgEvent;
  unsigned int warpPoolEvent;
  unsigned int schedSleepMask;
  unsigned int warpEvent;
  unsigned int eventMask;
  rt_warp_pool_t warpPoolData[RT_MAX_CLUSTER_NB_PES];
  rt_warp_pool_t *warpPool[RT_MAX_CLUSTER_NB_PES];
  unsigned char warpPoolFlush[RT_MAX_CLUSTER_NB_PES];
#ifdef __OR1K__
  rt_mutex_t ccSchedLock;
  unsigned int ccSchedTask;
#endif
  rt_mutex_t outputLock;

  rt_dma_mc_t *pendingDmaTransfers[MCHAN_NB_COUNTERS];
  unsigned int dmaStatus;
  int mcDmaEvent;
} rt_cluster_t;

// !!!!!!!!!!!! BE CAREFUL !!!!!!!!!!!!!!!!
// Updates the assembly offset at the beginning of this file when this structure is modified
typedef struct rt_warp_s {
  void (*entry)(unsigned int arg0,unsigned int arg1);
  unsigned int arg0;
  unsigned int arg1;
  unsigned int ac;
  unsigned int acAddr;
  unsigned int nbCores;
  unsigned int coreSet;
  unsigned int stacks;
  unsigned int stackSize;
  rt_warp_pool_t *pool;
} rt_warp_t;

struct rt_clusterState_s {
  int cid;
  int pm;
  int started;
  int nbFreePe;
  struct rt_clusterState_s *nextInPm;
  struct rt_clusterState_s *next;
  struct rt_clusterState_s *prev;
};

typedef struct {
#if EU_VERSION == 1
  int cycle;
  unsigned int mcMask;
  int localBar[RT_MAX_NB_CLUSTERS];
  unsigned int status[RT_MAX_NB_CLUSTERS];
#else
  unsigned int socBar;
  unsigned int mcMask;
#endif
} rt_mcbar_t;

typedef struct {
  int socBar;
  int locBar;
  int localMaster;
} rt_mcbar_loc_t;


typedef struct {
  unsigned int socAddr;
  } rt_mclock_t;

typedef struct {
  unsigned int socAddr;
  rt_mutex_t mutex;
  } rt_mclock_loc_t;

extern rt_conf_t rtConf;

static inline unsigned int rt_getUserData() {
  return PULP_L1_BASE + sizeof(rt_cluster_t) + sizeof(rt_cc_t) + sizeof(rt_fc_t);
}

static inline rt_cluster_t *rt_getClusterData(unsigned int cid) {
  return (rt_cluster_t *)(PULP_L1_BASE);
}

static inline rt_cc_t *rt_getCcData(unsigned int cid) {
  return (rt_cc_t *)(PULP_L1_BASE+sizeof(rt_cluster_t));
}

static inline rt_cc_t *rt_getData() {
  return (rt_cc_t *)(PULP_L1_BASE+sizeof(rt_cluster_t));
}

static inline rt_cc_t *rt_getLocalCcData(unsigned int cid) {
  return rt_getCcData(cid);
}

static inline rt_fc_t *rt_getFcData() {
  return (rt_fc_t *)(PULP_L1_BASE+sizeof(rt_cluster_t)+sizeof(rt_cc_t));
}

static inline rt_cluster_t *rt_getClusterDataFromCc(rt_cc_t *cc) {
  return (rt_cluster_t *)cc->cd;
}

#endif
#endif
