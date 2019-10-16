#ifndef __CLE_PULP_H__
#define __CLE_PULP_H__

#include <cle/cle_pulp_fabric.h>
#include <hd/hd_api.h>
#include <cle/types.h>

void cle_pulp_enqueueTaskEnd(struct cle_device_s *device, cle_devTask_t *devTask);
void cle_pulp_registerIncomingMsgCallback(int pm, void (*callback)(unsigned int msg));

int cle_pulp_bufferAlloc(struct cle_device_s *device, cle_buf_t *buffer, int size, int cached, int global);
void cle_pulp_bufferFree(struct cle_device_s *device, cle_buf_t *buffer);
void *cle_pulp_bufferMap(struct cle_device_s *device, cle_buf_t *buffer);
void cle_pulp_bufferUnmap(struct cle_device_s *device, cle_buf_t *buffer);

#endif
