#ifndef __CLE_STHORM_H__
#define __CLE_STHORM_H__

#include <cle/cle_sthorm_fabric.h>
#include <ld/ld_api.h>
#include <cle/types.h>

typedef struct {
  cle_buf_t cle;
  ld_buffer_t ld;
} cle_sthorm_buffer_t;

extern unsigned int fabricReqAllocBase;

void cle_sthorm_enqueueTaskEnd(struct cle_device_s *device, cle_devTask_t *devTask);
void cle_sthorm_registerIncomingMsgCallback(int pm, void (*callback)(unsigned int msg));

int cle_sthorm_bufferAlloc(struct cle_device_s *device, cle_sthorm_buffer_t *buffer, int size, int cached, int global);
void cle_sthorm_bufferFree(struct cle_device_s *device, cle_sthorm_buffer_t *buffer);
void *cle_sthorm_bufferMap(struct cle_device_s *device, cle_sthorm_buffer_t *buffer);
void cle_sthorm_bufferUnmap(struct cle_device_s *device, cle_sthorm_buffer_t *buffer);

static inline unsigned int cle_sthorm_getReqFromOffset(cle_device_t *device, unsigned int addr) {
  return addr + fabricReqAllocBase;
}

static inline unsigned int cle_sthorm_getReqOffset(cle_device_t *device, unsigned int addr) {
  return addr - fabricReqAllocBase;
}

#endif
