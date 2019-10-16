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

#ifndef __OPENCL_CLE_FABRIC_TYPES_H
#define __OPENCL_CLE_FABRIC_TYPES_H

//#include "graph_types.h"

typedef enum {
  CLE_GRAPH_NODE_TYPE_END_GRAPH,
  CLE_GRAPH_NODE_TYPE_COPY_BUFFER_EXT2LOC,
  CLE_GRAPH_NODE_TYPE_COPY_BUFFER_LOC2EXT,
  CLE_GRAPH_NODE_TYPE_CREATE_BUFFER,
  CLE_GRAPH_NODE_TYPE_RELEASE_BUFFER,
  CLE_GRAPH_NODE_TYPE_SPLIT_DEP,
  CLE_GRAPH_NODE_TYPE_EXEC_KERNEL,
  CLE_GRAPH_NODE_TYPE_EXEC_WARP,
  CLE_GRAPH_NODE_TYPE_SG_COPY_BUFFER_REMOTE,
  CLE_GRAPH_NODE_TYPE_SG_COPY_BUFFER_LOCAL,
  CLE_GRAPH_NODE_TYPE_DUMMY
} cle_graph_node_type_e;

typedef enum {
  CLE_BUFFER_LOCATION_L3,
  CLE_BUFFER_LOCATION_L1
} cle_buffer_location_e;

typedef struct {
  unsigned int base;
} cle_graph_data_t;
  
typedef struct {
  unsigned int index;
  int offset;
} cle_parameter_t;

#define CLE_LINE_SIZE 1024
#define CLE_NB_LINES_LOG2 3
#define CLE_NB_LINES (1<<CLE_NB_LINES_LOG2)
#define LG2_LINE_SIZE 10
#define OFFSET_MASK 0x3FF
#define LG2_TOT_LINES 10
#define INDEX_MASK (CLE_NB_LINES-1)

typedef struct _rt_graph_node_t {
  char type;
  unsigned char nbUpDep;
  unsigned char currentNbUpDep;
  unsigned char nbDep;
  struct _rt_graph_node_t *next;
} rt_graph_node_t;

typedef struct {
    rt_graph_node_t common;
} rt_graph_node_end_graph_t;

typedef struct {
  rt_graph_node_t common;
  int index;
} rt_graph_node_release_buffer_t;

typedef struct {
  rt_graph_node_t common;
  cle_buffer_location_e location;
  int size;
  int index;
} rt_graph_node_create_buffer_t;

typedef struct {
  rt_graph_node_t common;
  void (*entry)(void *, void *);
  int stackSize;
  int stackBufferOffset;
  int stackBufferSize;
  short paramDataOffset;
  char nbParamData;
  char nbCores;
  short stackBufferIndex;
  int argsOffset;
} rt_graph_node_exec_kernel_t;

typedef struct {
  int nbWarp;
  unsigned int ccNode;
} rt_graph_node_exec_kernel_array_t;

typedef struct {
  void (*entry)(void *, void *);
  unsigned short argsOffset;
  unsigned short type;
} rt_graph_node_exec_kernel_array_elem_t;

typedef struct {
  rt_graph_node_t common;
  int extIndex;
  int extOffset;
  int locIndex;
  int locOffset;
  int size;
  int stride;
} rt_graph_node_copy_buffer_t;

typedef struct {
  rt_graph_node_t common;
  int remIndex;
  int remOffset;
  int locIndex;
  int locOffset;
  int size;
  unsigned int remNodeOffset;
  int remGraphNo;
  //p2012_req_t header;
  unsigned int remBufferBase;
} rt_graph_node_sg_copy_buffer_t;

typedef struct {
  rt_graph_node_t common;
  struct _rt_graph_node_t **deps;
  int nbDep;
} rt_graph_node_split_dep_t;

typedef struct {
  unsigned int startTime;
  unsigned int endTime;
} rt_exec_kernel_stat_t;

typedef struct {
  rt_graph_node_t *firstReady;
  rt_graph_node_t *lastReady;
} rt_node_queue_t;

// SHOULD BE padded to 64 bits !!!!!!!
typedef struct _rt_graph_t {
  //rt_devCmdNoSync_t rt;
  //rt_devCmdWgInfo_t rtWgInfo;
  void *_this;
  //cle_graph_instance_t *hostGraph;
  int loaded;
  int graphSize;
  unsigned long long totalTime; 
  int nbExecKernel;
  unsigned int ccData;
  void *ccTraceBuffer;
  unsigned int traceCore;
  int nbData;
  int clusterId;
  int ccConf;
  int hwCcConf;
  int clusterMapping[PULP_MAX_NB_CLUSTERS];
  struct _rt_graph_t *superGraph;
  int nbReady;
  unsigned int readyNodesOffset;
  int ongoingCopies;
  unsigned int copiesBitfield;
  int padding;
  rt_node_queue_t ccNodes;
  rt_node_queue_t warps;
  rt_node_queue_t copies;
} rt_graph_t;

typedef struct {
  rt_graph_node_t *first;
  rt_graph_node_t *last;
} dmaQueue_t;

#endif
