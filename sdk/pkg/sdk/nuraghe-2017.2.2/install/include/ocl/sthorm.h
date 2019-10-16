#ifndef __OCL_STHORM__
#define __OCL_STHORM__

#include <rt/cle_req.h>
#include <cle/cle_sthorm_fabric.h>

#define OCL_REQ_GET_ID(index)  (((reqId) << RT_REQ_ID_OFFSET) | (FABRIC_RT_OCL_ID << FABRIC_RT_PM_ID_OFFSET))

#define OCL_REQ_HTOFC_NDRANGE_INDEX 14

typedef struct {
  uint8_t nbWg;
  uint8_t nbWi;
  int16_t stackSize;
  uint32_t localDataSize;
  uint32_t global_work_offset[3];
  uint8_t global_work_size[3];
  uint8_t num_groups[3];
  uint8_t group_id[3];
  uint8_t work_dim;
  uint8_t local_work_size0;
  uint8_t nbHwCounters;
  uint32_t entry;
  void *devTask;
} ocl_ndRange_req_t;

typedef struct {
  rt_req_t rt;
  cle_req_dev_t cle;
  ocl_ndRange_req_t ocl;
} ocl_sthorm_ndRange_t;

static inline unsigned int ocl_req_ndRange_id() {
  return cle_req_get_ocl_id(OCL_REQ_HTOFC_NDRANGE_INDEX);
}

#endif
