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

#ifndef __HD_API_H__
#define __HD_API_H__

#include <stdint.h>
#include "hd_data.h"
#include "hd_req.h"
#include "hd_userAlloc.h"

#ifdef __cplusplus
extern "C" {
#endif

#define HD_CLUSTER_MASK_ALL        -1
#define HD_CLUSTER_MASK_CONTROLLER (1<<4)

#define HD_CORE_MASK_ALL           -1
#define HD_CORE_MASK_CONTROLLER    (1<<16)

#define HD_ERR_OK            0
#define HD_ERR_RESOURCE      1

  extern hd_archConfig_t archConfig;

  static inline hd_archConfig_t *hd_archConfig() {return &archConfig;}

  extern int hd_init();
  
  extern void hd_deinit();

  extern void hd_powerOff();

  extern int hd_powerOn();

  extern int hd_loadBinaryFromFs(char *binary, hd_binaryDesc_t *desc);

  extern int hd_configFabric(hd_binaryDesc_t *binaryDesc);
  
  extern int hd_getBinarySymbol(hd_binaryDesc_t *binaryDesc, char *symbol, unsigned int *addr);
  
  extern int hd_fetch(hd_binaryDesc_t *desc, unsigned int clusterMask, unsigned int coreMask);
  
  extern char *hd_getConfig(const char *name);

  extern int hd_fabric2hostPhys(unsigned int addr, unsigned int *result);

  extern int hd_fabric2hostVirt(unsigned int addr, unsigned int *result);

  static inline int hd_fabricPid() {return 0;}

#define P2012_FABRIC_MSG_IS_FABRIC(msg) ((((unsigned int)(msg)) & (1<<P2012_FABRIC_MSG_ISFABRIC_OFFSET)))

#define P2012_FABRIC_MSG_IS_PTR(msg) ((((unsigned int)(msg)) & (1<<P2012_FABRIC_MSG_TYPE_OFFSET)) == 0)

#define P2012_FABRIC_MSG_GET_PID(msg) (((unsigned int)(msg)) & (P2012_FABRIC_MSG_PROCESS_SIZE - 1))

#define P2012_FABRIC_MSG_GET_PM(msg) ((((unsigned int)(msg)) >> P2012_FABRIC_MSG_TYPE_PM_OFFSET) & (FABRIC_RT_NB_PM-1))

#define P2012_FABRIC_MSG_GET_PTR(msg) (((unsigned int)(msg)) & ~((1<<P2012_FABRIC_MSG_DATA_OFFSET)-1))

#define P2012_FABRIC_MSG_GET_FABRIC_PTR(msg) ((P2012_FABRIC_MSG_GET_PTR(msg) >> P2012_FABRIC_MSG_DATA_OFFSET) + fabricBase)

#define P2012_FABRIC_MSG_GET_DATA(msg) (((unsigned int)(msg)) >> P2012_FABRIC_MSG_DATA_OFFSET)

#define P2012_FABRIC_MSG_ALIGN_SIZE(size) ((size + (1<<P2012_FABRIC_MSG_DATA_OFFSET) - 1) & ~((1<<P2012_FABRIC_MSG_DATA_OFFSET) - 1))

  extern void hd_msgFifo_regCallback(int pmId, void (*callback)(unsigned int msg));
  extern unsigned int hd_msgFifo_pop();
  extern void hd_msgFifo_push(unsigned int msg);

  extern void archi_waitFabricNotif();

  static inline void hd_waitFabricNotif() {
    archi_waitFabricNotif();
  }

  #define HD_BINARY_STATIC   0
  #define HD_BINARY_DYNAMIC  1

  int hd_binary_loadFromBuffer(const char *path, const unsigned char *buff, int size, int type, hd_binaryDesc_t **desc);

  int hd_binary_getSymbol(hd_binaryDesc_t *desc, const char *name, unsigned int *hostAddr, unsigned int *fabricAddr);

  char *hd_strerror();

  unsigned int hd_req_alloc(int block, int size, unsigned int *fabricAddr);

  void hd_req_free(unsigned int hostAddr, unsigned int fabricAddr);

  extern unsigned int hostReqAreaBase;

  static inline unsigned int hd_req_hostBase() {
    return hostReqAreaBase;
  }

static inline unsigned int hd_req_fabricAlloc(hd_req_fabricAlloc_t *req, unsigned int fabricOffset, int loc, int size) {
  req->info = PULP_RT_ALLOC_INFO(loc, size);
  req->common.done = 0;
  req->replyMsg = PULP_HREQ_PMID(PULP_REQ_RT_PMID) | PULP_HREQ_PROCESSID(hd_fabricPid()) | PULP_HREQ_MSGDATA(fabricOffset + (int)&(((hd_req_fabricAlloc_t *)0)->common)) | PULP_HREQ_TYPE(1);
  return PULP_FREQ_TASK_MSG(PULP_RT_FREQ_ALLOC,fabricOffset,PULP_REQ_RT_PMID,PULP_RT_REQ_PRIO);
}

static inline unsigned int hd_req_fabricAlloc_result(hd_req_fabricAlloc_t *req) {
  return pulp_read32((unsigned int)&req->result);
}
  
  extern int hd_socmem_alloc(hd_buffer_t *buffer, int size);

  extern void hd_socmem_free(hd_buffer_t *buffer);

#ifdef __cplusplus
}
#endif


#endif
