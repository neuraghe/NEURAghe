#ifndef __OCL_PULP__
#define __OCL_PULP__

#include <cle/cle_pulp_fabric.h>
#include <ocl/graph_fabric_types.h>

#define OCL_REQ_GET_ID(index)  (((reqId) << RT_REQ_ID_OFFSET) | (FABRIC_RT_OCL_ID << FABRIC_RT_PM_ID_OFFSET))

#define OCL_REQ_HTOFC_NDRANGE_INDEX 14

typedef struct ocl_pulp_ndRange_s ocl_pulp_ndRange_t;
typedef struct ocl_pulp_graph_s ocl_pulp_graph_t;

typedef struct ocl_workGroup_s {
  short stackSize;
  unsigned char groupId;
  unsigned char padding;
  unsigned int localDataSize;
  int nbWi;
  unsigned int entry;
  unsigned int kernelArgs;
  ocl_pulp_ndRange_t *cmd;
  cle_req_wg_t cle;
  struct ocl_workGroup_s *next;
} ocl_workGroup_t;

typedef struct {
  unsigned int global_work_offset[3];
  unsigned char global_work_size[3];
  unsigned char num_groups[3];
  unsigned char work_dim;
  unsigned char local_work_size0;
  unsigned char nbWg;
  unsigned char padding[3];
  void *devTask;
  ocl_workGroup_t wg;
} ocl_ndRange_req_t;

typedef struct {
  void *devTask;
  unsigned int graph;
} ocl_graph_req_t;

// This is the structure sent to the pulp device for an OCL ndRange execution
// Note that this structure is allocated inside the device main controller memory
struct ocl_pulp_ndRange_s {

  // This structure is mandatory when sending remote messages to the device
  // It is will be used to enqueue a task for handing this request
  rt_task_t task;

  // This is the generic part of the request that allows to manage its state
  // inside the device (perf metrics, dependencies, cluster assignment, etc)
  cle_req_dev_t cle;

  // This describes the OCL command
  ocl_ndRange_req_t ocl;

};

struct ocl_pulp_graph_s {
  rt_task_t task;
  cle_req_dev_t cle;
  ocl_graph_req_t ocl;
  cle_req_wg_t wg;
};

static inline unsigned int ocl_req_ndRange_id() {
  return cle_req_get_ocl_id(OCL_REQ_HTOFC_NDRANGE_INDEX);
}

#endif
