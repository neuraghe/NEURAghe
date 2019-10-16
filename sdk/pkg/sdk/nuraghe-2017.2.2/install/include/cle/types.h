#ifndef __CLE_TYPES_H__
#define __CLE_TYPES_H__

#include <stdint.h>
#include <pthread.h>

#include <rt/cle_req.h>

#ifdef __PULP__
#include <hd/hd_api.h>
#endif

#define CLE_SHARED_FIFO_MAX_PRIO 4

#define CLE_ERROR_OUT_OF_RESOURCE -1
#define CLE_ERROR_DEVICE -2

// The possible states of a task
// Note that the status of a task will keep increasing
// so it is possible to make comparisons on the status
typedef enum {
  CLE_TASK_STATUS_ALLOC,
  CLE_TASK_STATUS_INIT,
  CLE_TASK_STATUS_WAITDEP,
  CLE_TASK_STATUS_PREFETCHED,
  CLE_TASK_STATUS_READY,
  CLE_TASK_STATUS_WAITEXEC,
  CLE_TASK_STATUS_EXEC,
  CLE_TASK_STATUS_FINISHED,
  CLE_TASK_STATUS_CLOSED,
  CLE_TASK_STATUS_RELEASED,
  CLE_TASK_NB_STATES
} cle_task_state_e;

typedef struct {
  int localMemSize;
  unsigned int hostReqAreaFabricBase;
  unsigned int hostReqAreaFabricArchiBase;
  int hostReqAreaSize;
  unsigned int nbCluster;
  unsigned int nbPe;
} cle_dev_sthorm_info_t;

typedef struct {
  int localMemSize;
  unsigned int hostReqAreaFabricBase;
  unsigned int hostReqAreaFabricArchiBase;
  int hostReqAreaSize;
  unsigned int nbCluster;
  unsigned int nbPe;
} cle_dev_pulp_info_t;

struct cle_sharedFifo_elem_p;
struct cle_task_s;
struct cle_taskChainer_s;
struct cle_device_s;

// The structure used for tracking objects lifecycle (retain/release)
typedef struct {
  int user;
  int runtime;
  void (*releaseCallback)(void *data);
  void *data;
} cle_refCount_t;

// An element of the task generic FIFO
typedef struct cle_sharedFifo_elem_p {
  struct cle_sharedFifo_elem_p *next;
  int enqueued;
} cle_sharedFifo_elem_t;

// A task generic FIFO
typedef struct cle_sharedFifo_s {
  cle_sharedFifo_elem_t *first[CLE_SHARED_FIFO_MAX_PRIO];
  cle_sharedFifo_elem_t *last[CLE_SHARED_FIFO_MAX_PRIO];
  int nbElem;
  pthread_cond_t cond;
  pthread_mutex_t mutex;
  int isBlocking;
  int nbPrio;
} cle_sharedFifo_t;

typedef struct {
  void (*callback)(struct cle_task_s *, void *data);
  void *data;
} cle_task_callback_t;

// Structure describing an on-going generic task
typedef struct cle_task_s {
  // THIS FIELD MUST BE AT THE BEGINNING TO ALLOW EASY CASTING
  cle_sharedFifo_elem_t fifoElem;    // The header allowing this task to be enqueued in the task engine
  cle_task_state_e state;            // The state of the task. This indicates where it stands in the task pipeline             
  cle_task_callback_t stateCallback[CLE_TASK_NB_STATES]; // The callbacks associated to each state (stage in the pipeline). These callbacks are called when the state is reached
  void (*enqueueCallback)(struct cle_task_s *task); // The callback called when the task is dequeued from the task engine FIFO
  unsigned int prefetchColor;   // A task is prefetched only if its dependencies have this prefetch color
                                // This allow restriting prefetched tasks to the one with simple dependency graph
  int prefetchThreshold;
  int lockCount;                            
  int rtLockCount;
  int nbDeps;
  int nbPrefetchDeps;
  int nbReadyDeps;
  int retval;
  void *userRef;
  pthread_mutex_t mutex;
  pthread_cond_t cond;
  int prefetched;
  uint64_t execStartTime;
  uint64_t execEndTime;
  struct cle_taskChainer_s *firstWaitingTask;
  struct cle_taskChainer_s *deps;
  struct cle_task_s **upDeps;
  int nbUpDeps;
} cle_task_t;

// Structure used for chaining tasks together in task graph management
typedef struct cle_taskChainer_s {
  struct cle_taskChainer_s *next;
  cle_task_t *task;
} cle_taskChainer_t;

#define CLE_BUFFER_COPY 0
#define CLE_BUFFER_MAP  1
#define CLE_BUFFER_UNMAP 2

// Structure describing an on-going buffer task
typedef struct {
  cle_task_t cleTask;
  void (*releaseCallback)(void *data);
  void *releaseData;
  int type;
  union {
    struct {
      unsigned int offset;
      unsigned int dst;
      unsigned int src;
      unsigned int size;
      int ongoingCopies;
    } copy;
    struct {
      unsigned int addr;
    } mapping;
  } u;
} cle_bufferTask_t;

typedef struct {
  unsigned int hostAddr;
  unsigned int fabricAddr;
  
  union {
#ifdef __PULP__

    struct {
      hd_buffer_t ld;
    } pulp;
    
#endif
  } u;

} cle_buf_t;

#define CLE_DEV_TASK_NOT_PREFETCHED 0
#define CLE_DEV_TASK_PREFETCHED 1
#define CLE_DEV_TASK_PREFETCH_DONE 2

// Structure describing an on-going device task
// TODO should be moved to sthorm specific part
struct cle_devTask_s;
typedef struct cle_devTask_s {
  cle_task_t task;
  struct cle_device_s *device;
  void (*fillReqCallback)(struct cle_device_s *device, struct cle_devTask_s *devTask, void *data, void *req);
  void *fillReqData;
  void *devReq;
  cle_req_dev_t *cleDevReq;
  unsigned int devFabricReq;
  int devReqSize;
  int devReqOffset;
  struct cle_devTask_s *next;
  struct cle_devTask_s *prev;
  union {
    struct {
      uint64_t hostSentToDevTime; // Host time when command is sent to device
      char reqId;
      unsigned char dummy[3];
    } sthorm;
    struct {
      uint64_t hostSentToDevTime; // Host time when command is sent to device
      char reqId;
      unsigned char dummy[3];
      unsigned int msg;
    } pulp;
  } d;

} cle_devTask_t;

// structure describing a device
typedef struct cle_device_s {
  void (*taskInit)(struct cle_device_s *device, cle_devTask_t *devTask, int taskStructSize, int devReqSize, unsigned int devReqOffset, void (*fillReqCallback)(struct cle_device_s *device, cle_devTask_t*,void*,void*), void*fillReqData);
  void (*devInfo)(struct cle_device_s *device, void **info);
  int (*loadBinary)(struct cle_device_s *device, char *path, char **log, unsigned char *binary, int size, void **desc);
  void (*unloadBinary)(struct cle_device_s *device, void *desc);
  int (*getBinarySymbol)(struct cle_device_s *device, void *desc, char *symbol, unsigned int *hostAddr, unsigned int *devAddr);
  int (*bufferAlloc)(struct cle_device_s *dev, cle_buf_t *buffer, int size, int cached, int global);
  void (*bufferFree)(struct cle_device_s *dev, cle_buf_t *buffer);
} cle_device_t;

#endif
 
