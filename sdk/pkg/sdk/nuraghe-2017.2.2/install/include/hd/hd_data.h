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

#ifndef __HD_DATA_H__
#define __HD_DATA_H__

#include <rt/rt_data.h>
#include <stdint.h>

#define P2012_REQ_TYPE_USER 100
#define P2012_REQ_TYPE_RPC_LAST 50

typedef struct {
  unsigned int done;
} hd_req_common_t;

typedef struct {
  rt_task_t task;
  hd_req_common_t common;
  unsigned int info;
  unsigned int result;
  unsigned int replyMsg;
} hd_req_fabricAlloc_t;

typedef struct {
  rt_task_t task;
} hd_req_alloc_t;

typedef struct {
  unsigned int pos;
  unsigned int size;
  unsigned int *array;
} hd_msgFifo_t;

typedef struct {
  unsigned int size;
  unsigned int handle;
  unsigned int physBase;
  unsigned int virtBase;
  unsigned int hostPhysBase;
  unsigned int flags;
} hd_buffer_t;
  
typedef struct hd_binaryDesc_s {
  unsigned int entry;
  char *binary;
  unsigned int rtConf;
  void *handle;
  struct hd_binaryDesc_s *next;
} hd_binaryDesc_t;

typedef struct {
  unsigned int clusterMask;
  unsigned int l3Size;
  unsigned int nbCores;
  unsigned int l1Size;
  unsigned int l2Size;
  unsigned int nbClusters;
} hd_archConfig_t;

typedef struct {
  int type;
  // TODO this should be removed but has impact on a lot of code
  // as it is embedded into structures that are aligned on 64bits by the
  // xp70 compiler
  unsigned int padding;
} p2012_req_t;


#endif
