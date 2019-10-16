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

#ifndef __OPENCL_CLE_TYPES_H
#define __OPENCL_CLE_TYPES_H

#include <stdint.h>
#include <CL/cl.h>
#include <cle/types.h>
#include "graph_fabric_types.h"

#define CLE_PROGRAM_TYPE_OCL 0
#define CLE_PROGRAM_TYPE_OMP 1

  struct _cle_graph_node_t;
  
  typedef struct _cle_graph_t {
    struct _cle_graph_node_t **nodes;
    int nbNodes;
    int maxNbNodes;
    int nbData;
    int nbExecKernel;
    int nbGraph;
    int graphNo;
    uint32_t fabricBase;
    uint32_t *nodeAddrs;
    struct _cle_graph_t *next;
    struct _cle_graph_t *superGraph;
  } cle_graph_t;
  
  typedef struct {
    void *desc;
    int argsSize;
    int nbArgs;
    char *name;
    int type;
  } cle_kernel_t;

  struct _cle_graph_node_t;

  typedef struct _cle_graph_node_t {
    unsigned char type;
    unsigned char nbUpDep;
    unsigned char currentNbUpDep;
    unsigned char nbDep;
    int built;
    struct _cle_graph_node_t *next;
  } cle_graph_node_t;
  
  typedef struct {
    cle_graph_node_t common;
  } cle_graph_node_end_graph_t;
  
  typedef struct {
    cle_graph_node_t common;
    int index;
  } cle_graph_node_release_buffer_t;
  
  typedef struct {
    cle_graph_node_t common;
    cle_buffer_location_e location;
    int size;
    int index;
  } cle_graph_node_create_buffer_t;
  
  typedef struct cle_graph_node_exec_kernel_s {
    cle_graph_node_t common;
    void (*entry)(void *, void *);
    int stackSize;
    int stackBufferIndex;
    int stackBufferOffset;
    int stackBufferSize;
    cle_parameter_t *paramData;
    void *args;
    cle_kernel_t *kernel;
    unsigned char nbParamData;
    char nbCores;
    unsigned int rtNode;
    struct cle_graph_node_exec_kernel_s *nextInArray;
  } cle_graph_node_exec_kernel_t;
  
  typedef struct {
    cle_graph_node_t common;
    int extIndex;
    int extOffset;
    int locIndex;
    int locOffset;
    int size;
    int stride;
  } cle_graph_node_copy_buffer_t;
  
  typedef struct {
    cle_graph_node_t common;
    int remIndex;
    int remOffset;
    int locIndex;
    int locOffset;
    int size;
    int remNodeNo;
    cle_graph_t *remGraph;
    int dmaNodeIndex;
  } cle_graph_node_sg_copy_buffer_t;
  
  typedef struct {
    cle_graph_node_t common;
    struct _cle_graph_node_t **deps;
    int nbDep;
  } cle_graph_node_split_dep_t;
  
  typedef struct {
    cle_buffer_location_e location;
    int size;
    uint32_t hostAddr;
    uint32_t fabricAddr;
    void *handle;
    cle_buf_t cleBuffer;
    cle_device_t *cleDev;
  } cle_buffer_t;

  typedef struct {
    void *programDesc;
    void *binaryDesc;
    int type;
  } cle_program_t;

typedef struct cle_graph_instance_s {
  cl_command_queue commandQueue;

  cle_buf_t fabricGraphBuffer;

  uint32_t fabricGraph_host;
  uint32_t fabricGraph_fabric;

  cle_graph_t *hostGraph;

  int totalGraphSize;
  int nbGraph;
  int loaded;
  int done;
  int loadRetval;
  cle_graph_t *graph;
} cle_graph_instance_t;

#endif
