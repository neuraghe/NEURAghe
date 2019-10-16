#ifndef _CMA_H_
#define _CMA_H_

#define __PULP__
#define __PULP3__

#include <limits.h>

#ifdef CMA_GRAPH_STRUCTURE
#include "CL/cl.h"
#include "archi/pulp/archi_pulp.h"
#include "ocl/graph.h"
#endif

/* Constants */

#define VX_MAX_NODES 1000
#define VX_MAX_INPUT_IMAGES 16
#define VX_MAX_OUTPUT_IMAGES 16
#define VX_MAX_CLE_PARAMETERS 100
#define VX_MAX_BUFFERS 64
#define VX_MAX_BUFFERUSAGE_DATA 256
#define VX_MAX_BUFFERUSAGE_REFS 256

#define L1_BUFFERS_TOTAL_BYTES 80000
#define CORE_STACK_SIZE 8000
#define NB_CORES 4
#define MAX_CLUSTERS 4


#define CLE_GRAPH_STATIC_PARAMETERS 5


/* Support macros */

#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))
#define VX_GRAPH_VIRTUAL_BUFFER 0
#define VX_GRAPH_INPUT_BUFFER  1
#define VX_GRAPH_OUTPUT_BUFFER  2
#define VX_GRAPH_PERSISTENT_OUTPUT_BUFFER  2

/* Data structures */
typedef struct _vx_image vx_image_t;
typedef struct _vx_node vx_node_t;
typedef struct _vx_reference vx_reference_t;
typedef struct _vx_graph vx_graph_t;
typedef struct _vx_context vx_context_t;

// Allocations
#define CLE_TRANSIENT_ALLOCATION  0
#define CLE_PERSISTENT_ALLOCATION 1
// State type
#define CLE_STATE_NONE     0
#define CLE_STATE_SCALAR   1
#define CLE_STATE_TILE     2
#define CLE_STATE_BORDERS  3

// Kernel type
#define CLE_KERNEL_GLOBAL 0
#define CLE_KERNEL_NORMAL 1
#define CLE_KERNEL_STAT   2



typedef struct _vx_cle_tile_info {
    vx_uint32 width;
    vx_uint32 height;
    vx_uint32 x[2]; // left - right
    vx_uint32 y[2]; // top - bottom
    union {
        vx_uint32 byteUnits;      // Used in buffer usage data structures
        vx_uint32 allocationType; // Used in parameters descriptor data structures (CLE_TRANSIENT_ALLOCATION / CLE_PERSISTENT_ALLOCATION)
        vx_uint32 stateType;     // Used in kernel descriptor data structures (CLE_STATE_TILE / CLE_STATE_BORDERS)
    };
} vx_cle_tile_info;

typedef struct _cle_buffer_usage_t {
    vx_uint32 type;            // VX_GRAPH_VIRTUAL_BUFFER | VX_GRAPH_INPUT_BUFFER | VX_GRAPH_OUTPUT_BUFFER
    vx_uint32 bidirectional;
    vx_int32  allocatedBuffer; // Index of the buffer (in "buffers" array)
    vx_uint32 activeReferences;   // Number of nodes referencing the buffer during simulated execution
    vx_node_t *references[VX_MAX_BUFFERUSAGE_REFS];         // Nodes referencing the buffer
    vx_uint32 numReferences;      // Number of nodes referencing the buffer
    vx_image_t *img;
    vx_cle_tile_info tile;
    vx_cle_tile_info overlap;
    vx_uint32 allocationType; // Allocation type (CLE_TRANSIENT_ALLOCATION / CLE_PERSISTENT_ALLOCATION)
    vx_cle_tile_info *nodeOverlap;
} cle_buffer_usage_t;

typedef struct _vx_cle_buffers_allocation {
    vx_uint32 n;        // Number ot buffers
    vx_uint32 wBlocks;
    vx_uint32 hBlocks;
    vx_uint32 totalSize;
    vx_uint32 tileSize[VX_MAX_BUFFERS * 2];
    vx_uint32 offsets[VX_MAX_BUFFERS];
} vx_cle_buffers_allocation;

typedef struct _vx_cle_stack_allocation {
    vx_uint32 size;
} vx_cle_stack_allocation;

typedef struct _vx_cle_kernels {
#ifdef CMA_GRAPH_STRUCTURE
  cle_program_t programs[VX_MAX_NODES];
  cle_kernel_t kernels[VX_MAX_NODES];
#endif
  char *kernelNames[VX_MAX_NODES];
  vx_uint32 num;
} vx_cle_kernels;

typedef struct _vx_cle_app {
#ifdef CMA_GRAPH_STRUCTURE
  cle_graph_instance_t *instance[MAX_CLUSTERS];
#endif
  vx_cle_buffers_allocation Buffers;
  vx_cle_stack_allocation   Stack;
  
#ifdef CMA_GRAPH_STRUCTURE
  cle_kernel_t kernels[VX_MAX_NODES];
#endif
  
#ifdef CMA_GRAPH_STRUCTURE
  cl_mem *CLInputs;
  vx_uint32 numCLInputs;
  cl_mem *CLOutputs;
  vx_uint32 numCLOutputs;
#endif
  
#ifdef CMA_GRAPH_STRUCTURE
  cl_mem  CLParameters;
#endif
  vx_size parametersMemSize;
  vx_reference_t *parameterRefs[VX_MAX_CLE_PARAMETERS];
  vx_size parameterOffsets[VX_MAX_CLE_PARAMETERS];
  vx_bool parameterOutputFlags[VX_MAX_CLE_PARAMETERS];
  vx_uint32 numParameters;

  vx_node_t *stateBuffersNodes[VX_MAX_NODES];
  vx_size stateBuffersOffsets[VX_MAX_NODES];
  vx_uint32 numStateBuffers;
  vx_size stateBuffersMemSize;
  
  vx_image_t *inputImages[VX_MAX_INPUT_IMAGES];
  vx_uint32 numInputImages;
  vx_image_t *outputImages[VX_MAX_OUTPUT_IMAGES];
  vx_uint32 numOutputImages;
  
  vx_bool executedByHost;
  vx_node_t *hostNode;

} vx_cle_app;

    
/* */

void bufferSizing(vx_cle_app *App,
                  vx_uint32 buffersType[], vx_uint32 buffersMinTileSize[],
                  vx_uint32 buffersMaxTileSize[],
                  vx_uint32 buffersMaxTileBorder[],
                  vx_uint32 buffersMaxByteUnits[],
                  vx_uint32 numBuffers,
                  cle_buffer_usage_t bufferUsageData[], vx_uint32 bufferUsageCount);

void stackSizing(vx_cle_app *App);

#ifdef CMA_GRAPH_STRUCTURE
void createCLEGraph(vx_context context, vx_cle_app *App,
                    vx_node_t *nodesSchedule[], vx_uint32 numNodes,
                    vx_uint32 numInputs, vx_uint32 numInputPlanes,
                    vx_uint32 numOutputs, vx_uint32 numOutputPlanes,
                    cle_buffer_usage_t bufferUsageData[],  vx_uint32 bufferUsageCount,
                    vx_uint32 buffersType[],
                    vx_uint32 nClusters);
#else
void createCMABinary(vx_context context, int regionId, vx_graph_t *graph,
                    vx_node_t *nodesSchedule[], vx_uint32 numNodes,
                    vx_uint32 numInputs, vx_uint32 numInputPlanes,
                    vx_uint32 numOutputs, vx_uint32 numOutputPlanes,
                    cle_buffer_usage_t bufferUsageData[],  vx_uint32 bufferUsageCount,
                    vx_uint32 buffersType[],
                    vx_uint32 nClusters);
#endif    


/* Helper functions */

vx_int32 MCD (vx_int32 a, vx_int32 b);
vx_int32 mcm (vx_int32 a, vx_int32 b);

vx_status vx_cle_init_buffer_usage_tile(vx_graph g,
	                                    cle_buffer_usage_t *bufferUsage,
	                                    vx_reference_t *param,
                                        vx_uint32 *buffersMaxTileSize,
                                        vx_uint32 *buffersMaxByteUnits);

vx_status vx_cle_update_buffer_usage_tile(vx_graph g, vx_node_t *node,
                                          vx_uint32 paramIndex);

vx_status vx_cle_min_buffer_size(cle_buffer_usage_t bufferUsageData[],  vx_uint32 bufferUsageCount,
                                     vx_uint32 *buffersMinTileSize,
                                     vx_uint32 *buffersMaxTileBorder);


vx_uint32 computeBufferUsageType(vx_image_t *img, vx_image_t *virtualImages[], vx_uint32 numVirtualImages);

// Node selection policy
vx_uint32 selectNodeToExecute(vx_graph_t *graph,
                              vx_uint32 *next_nodes, vx_uint32 numNext,
                              vx_uint32 *left_nodes, vx_uint32 *numLeft,
                              vx_bool *persistentFlag, vx_bool *globalFlag);

#ifdef CMA_GRAPH_STRUCTURE
void createCLEGraphNode(vx_cle_app *App,
                        cle_graph_t *graph, vx_node_t *vxNode,
                        cle_kernel_t  *kernel, cle_graph_node_t **cleNode,
                        int nbDep, int iteration,
                        vx_uint32 upBorder, vx_uint32 downBorder, vx_uint32 leftBorder, vx_uint32 rightBorder,
                        vx_uint32 buffersType[], vx_uint32 inputParams, vx_uint32 outputParams);
#endif

vx_size vxTypeSize(vx_enum type);

unsigned char * getParameterSrc(vx_reference_t *param);
vx_size getParameterSize(vx_reference_t *param);

vx_bool isParameterType(vx_enum type);

void allocateGraphParameter(vx_cle_app *App, vx_reference_t *param, vx_enum type, vx_enum direction);

void copyGraphParameters(vx_context_t *context, vx_cle_app *App);
void copyBackGraphParameters(vx_context_t *context, vx_cle_app *App);

void allocateNodeState(vx_cle_app *App, vx_node_t *node);

void resetImageReservedFields(vx_graph_t *graph);

uint32_t stampstart();

uint32_t stampstop(uint32_t start);

#endif
