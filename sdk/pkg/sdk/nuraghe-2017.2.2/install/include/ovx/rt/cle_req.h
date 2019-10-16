#ifndef __CLE_DEV_H__
#define __CLE_DEV_H__

#include <rt/rt_req.h>
#include <rt/rt_data.h>

#define CLE_REQ_HTOFC_NB_ID 0

#define CLE_REQ_OCL_ID (RT_REQ_PM_ID + 1)
#define CLE_REQ_OMP_ID (CLE_REQ_OCL_ID + 1)

#ifdef __OR1K__
// or1k has always wiTime, idleTime, barrierTime, waitTime and one HW metric
#define NB_PERF_COUNTERS 5
#else
// XP70 and Posix can have at most 2 HW metrics and barrier and wait time
#define NB_PERF_COUNTERS 4
#endif

#define PERF_COUNTER_BARRIER_ID 2
#define PERF_COUNTER_WAIT_ID    3

#define PERF_COUNTER_OR1K_TOTAL_TIME_ID    0
#define PERF_COUNTER_OR1K_IDLE_ID          1
#define PERF_COUNTER_OR1K_HW_COUNTER_ID    4

// MUST be a multiple of 2
#define MAX_NB_PERF_COUNTERS 6

void cle_req_enqueue(rt_fc_t *fc, cle_req_dev_t *req, int pm, cle_req_wgSchedType_e wgSchedType, int (*enqueueWgFunction)(unsigned int arg0, unsigned int arg1, int nbClusters, char *clusters), void (*closeFunction)(unsigned int arg0, unsigned int arg1), unsigned int arg0, unsigned int arg1);

void cle_req_wgEnd(rt_fc_t *fc, cle_req_dev_t *req, cle_req_wg_t *wg, int tryToSchedule);

static inline unsigned int cle_req_get_id(unsigned int index, unsigned int pmId) {
  return (index << RT_REQ_ID_OFFSET) | (pmId << RT_PM_ID_OFFSET);
}

static inline unsigned int cle_req_get_ocl_id(unsigned int index) {
  return cle_req_get_id(index, CLE_REQ_OCL_ID);
}

static inline unsigned int cle_req_get_omp_id(unsigned int index) {
  return cle_req_get_id(index, CLE_REQ_OMP_ID);
}

static inline void cle_req_wg_init(cle_req_wg_t *wg, unsigned int clusterId) {
  wg->cid = clusterId;
}

#endif
