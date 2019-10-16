#ifndef __CL_TYPES_H__
#define __CL_TYPES_H__

#include <pthread.h>
#include <ocl/platform.h>
#include <cle/api.h>
#include <CL/cl.h>

//#include <kernel/common.h>

// TODO remove this include
#ifdef __STHORM__
#include <cle/cle_sthorm.h>
#endif
#ifdef __PULP__
#include <cle/cle_pulp.h>
#endif

#include <kernel/ABI.h>

#define CL_PLATFORM_FIRST_INFO CL_PLATFORM_PROFILE
#define CL_PLATFORM_LAST_INFO CL_PLATFORM_EXTENSIONS
#define CL_PLATFORM_NB_INFOS (CL_PLATFORM_LAST_INFO - CL_PLATFORM_FIRST_INFO + 1)
#define CL_GET_PLATFORM_INFO_ID(id) ((id) - CL_PLATFORM_FIRST_INFO)

#define CL_DEVICE_FIRST_INFO CL_DEVICE_TYPE
#define CL_DEVICE_LAST_INFO CL_DEVICE_PREFERRED_LOCAL_ATOMIC_ALIGNMENT
#define CL_GET_DEVICE_INFO_ID(id) ((id) - CL_DEVICE_FIRST_INFO)

struct ocl_task_ndRange_s;
struct ocl_task_graph_s;

typedef struct {
  int user;
  int runtime;
} refCount_t;

typedef struct {
  cl_device_type type;
  cl_uint vendorId;
  cl_uint maxComputeUnits;
  cl_uint maxWorkItemDimensions;
  size_t maxWorkGroupSize;
  size_t maxWorkItemSizes[3];
  cl_uint preferredVectorWidthChar;
  cl_uint preferredVectorWidthShort;
  cl_uint preferredVectorWidthInt;
  cl_uint preferredVectorWidthLong;
  cl_uint preferredVectorWidthFloat;
  cl_uint preferredVectorWidthDouble;
  cl_uint maxClockFrequency;
  cl_uint addressBits;
  cl_uint maxReadImageArgs;
  cl_uint maxWriteImageArgs;
  cl_ulong maxMemAllocSize;
  size_t image2DMaxWidth;
  size_t image2DMaxHeight;
  size_t image3DMaxWidth;
  size_t image3DMaxHeight;
  size_t image3DMaxDepth;
  size_t maxParameterSize;
  cl_uint maxSamplers;
  cl_uint memBaseAddrAlign;
  cl_bool imageSupport;
  cl_uint maxReadWriteImageArgs;
  size_t imageMaxBufferSize;
  size_t imageMaxArraySize;
  cl_uint imagePitchAlignment;
  cl_uint imageBaseAddressAlignment;
  cl_uint maxPipeArgs;
  cl_uint pipeMaxActiveReservations;
  cl_uint pipeMaxPacketSize;
  cl_device_fp_config singleFpConfig;
  cl_device_fp_config doubleFpConfig;
  cl_device_mem_cache_type globalMemCacheType;
  cl_uint globalMemCachelineSize;
  cl_ulong globalMemCacheSize;
  cl_ulong globalMemSize;
  cl_ulong maxConstantBufferSize;
  cl_uint maxConstantArgs;
  size_t maxGlobalVariableSize;
  size_t globalVariablePreferredTotalSize;
  cl_device_local_mem_type localMemType;
  cl_ulong localMemSize;
  cl_bool errorCorrectionSupport;
  size_t profilingTimerResolution;
  cl_bool endianLittle;
  cl_bool available;
  cl_bool compilerAvailable;
  cl_bool linkerAvailable;
  cl_device_exec_capabilities executionCapabilities;
  cl_command_queue_properties queueOnHostProperties;
  cl_command_queue_properties queueOnDeviceProperties;
  cl_uint queueOnDevicePreferredSize;
  cl_uint queueOnDeviceMaxSize;
  cl_uint maxOnDeviceQueues;
  cl_uint maxOnDeviceEvents;
  char *builtInKernels;
  cl_platform_id platform;
  char *name;
  char *vendor;
  char *driverVersion;
  char *profile;
  char *version;
  char *openclCVersion;
  char *extensions;
  size_t printfBufferSize;
  cl_bool preferredInteropUserSync;
  cl_device_id parentDevice;
  cl_uint partitionMaxSubDevices;
  cl_device_partition_property *partitionProperties;
  cl_device_affinity_domain partitionAffinityDomain;
  cl_device_partition_property *partitionType;
  cl_uint referenceCount;
  cl_device_svm_capabilities svmCapabilities;
  cl_uint preferredPlatformAtomicAlignment;
  cl_uint globalAtomicAligment;
  cl_uint preferredLocalAtomicAlignment;
  cl_uint preferredVectorWidthHalf;
  cl_uint nativeVectorWidthChar;
  cl_uint nativeVectorWidthShort;
  cl_uint nativeVectorWidthInt;
  cl_uint nativeVectorWidthLong;
  cl_uint nativeVectorWidthFloat;
  cl_uint nativeVectorWidthDouble;
  cl_uint nativeVectorWidthHalf;
} clDeviceInfos_t;

typedef struct {
  struct ocl_task_ndRange_s *(*enqueueNdRangeReqAlloc)(cle_device_t *device, cl_kernel kernel, int num_events_in_wait_list, int *devReqSize, unsigned int *devReqOffset, void **kernelArgs);
  void (*enqueueNdRangeReqFill)(cle_device_t *device, cle_devTask_t *devTask,void *cmd, void *req);
  void (*loadGraph)(uint32_t graph);
  struct ocl_task_graph_s *(*enqueueGraphReqAlloc)(cle_device_t *device, int num_events_in_wait_list, int *devReqSize, unsigned int *devReqOffset);
  void (*enqueueGraphReqFill)(cle_device_t *device, cle_devTask_t *devTask,void *cmd, void *req);
} ocl_devItf_t;

struct _cl_device_id {
  clDeviceInfos_t infos;
  cle_device_t *cleDevice;
  void *cleDeviceData;
  ocl_devItf_t *itf;
};

typedef struct {
  int (*createBuffer)(cl_mem memobj, cl_mem parent, cl_context context, cl_mem_flags flags, size_t size, void *host_ptr, cl_mem *clmem);
  void (*parseBuffer)(cl_mem buffer, cle_bufferTask_t *task, int isRead, size_t offset, size_t size, void *ptr);
} platformItf_t;

struct _cl_platform_id;

struct _cl_platform_id {
  char *infos[CL_PLATFORM_NB_INFOS];
  int nbDevices;
  platformItf_t *itf;
  struct _cl_device_id **devices;
  struct _cl_platform_id *next;
};

struct _cl_context {
  int nbDevices;
  cl_device_id *devices;
  cl_platform_id platform;
  int nbProperties;
  cl_context_properties *properties;
  void (*pfn_notify)(const char *, const void *, size_t, void *);
  void *user_data;
  refCount_t refCount;
  pthread_mutex_t mutex;
};

struct _cl_command_queue {
  cl_device_id device;
  cl_context context;
  int nbProperties;
  cl_queue_properties *properties;
  int queueSize;
  refCount_t refCount;
  pthread_mutex_t mutex;
  cl_command_queue_properties queueProperties;
};

struct _cl_mem {
  cl_mem_platform_t platform;
  platformItf_t *platformItf;
  int size;
  cl_mem_flags flags;
  cl_mem parent;
  unsigned int userHostAddr;
  cl_context context;
  cle_buf_t cleBuffer;
  struct _cl_buffer_region subBufferRegion;
};

struct _cl_event {
  cl_context context;
  cle_task_t *cleTask;
};

typedef struct {
  struct _cl_event event;
  cle_bufferTask_t task;
} cla_task_readWrite_t;

typedef struct {
  struct _cl_event event;
  cle_bufferTask_t task;
  cl_mem buffer;
} cla_task_mapping_t;

typedef struct ocl_task_graph_s {
  struct _cl_event event;
  cle_devTask_t devTask;
  cl_device_id device;
  uint32_t graph;
} ocl_task_graph_t;

typedef struct ocl_task_ndRange_s {
  struct _cl_event event;
  cle_devTask_t devTask;
  size_t global_work_size[3];
  size_t global_work_offset[3];
  size_t local_work_size[3];
  cl_uint work_dim;
  cl_kernel kernel;
  size_t localDataSize;

  // TODO maybe this should be in a more specific section ?
  uint32_t replyHostAddr;    // Host pointer to the ocl_reply_ndRange_t reply structure
  uint32_t replyFabricAddr;  // Fabric pointer to the ocl_reply_ndRange_t reply structure

  cl_device_id device;

} ocl_task_ndRange_t;

typedef struct {
  cl_device_id device;
  unsigned char *binary;
  size_t length;
  void *desc;
  cl_build_status status;
  program_desc_t *programDesc;
} programBinary_t;

struct _cl_program {
  int fromSources;
  unsigned int nbDevices;
  programBinary_t *binaries;
  void *kernels;
};

struct _cl_kernel {
  kernel_info_t *desc;
  unsigned char *args;
  int argsSize;
};

#endif

