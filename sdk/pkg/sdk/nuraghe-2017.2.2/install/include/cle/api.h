#ifndef __CLE_API_H__
#define __CLE_API_H__
 
#include <cle/api.h>
#include <cle/types.h>
#include <cle/debug.h>
#include <sys/time.h>
#include <pthread.h>

#define CL_REQ_FIRST_FROM_FABRIC (P2012_REQ_TYPE_USER+100)

/*
 * FIFOs API
 */

void cle_sharedFifo_push(cle_sharedFifo_t *fifo, int prio, cle_sharedFifo_elem_t *elem);
cle_sharedFifo_elem_t *cle_sharedFifo_pop(cle_sharedFifo_t *fifo);
cle_sharedFifo_t *cle_sharedFifo_alloc(int nbPrio);
void cle_sharedFifo_free(cle_sharedFifo_t *fifo);
void cle_sharedFifo_setBlocking(cle_sharedFifo_t *fifo, int isBlocking);

int cle_bufferFifo_release(cle_sharedFifo_t *fifo, cle_bufferTask_t *memcpy);
cle_bufferTask_t *cle_bufferFifo_pop(cle_sharedFifo_t *fifo, unsigned int *offset, unsigned int *size);

/*
 * Engine lifecycle
 */

// This will init all the engines. In case of failure, all what has
// been successfully initialized reamins. cle_init can be called again
// to try finishing the initialization or cle_deinit can be called to clean-up
// Can be safely called several times without calling cle_deinit even
// after success
int cle_init();

// This will deinit the engines and free everything.
// Can be safely called several times without calling cle_init.
void cle_deinit();



/*
 * Task action enqueueing
 *
 * The following are safe to be used from outside the task engine. They allow another engine
 * to enqueue an action on the task.
 */

// Enqueue a task and specify its dependency list
// The task will become ready only when all its dependencies reach at least status CLE_TASK_STATUS_FINISHED
void cle_task_enqueueExec(cle_task_t *task, int nbDeps, cle_task_t **deps);

// Close a task
// This will unblock the tasks waiting on this task.
// This can also unblock a caller of cle_task_wait.
// This may also trigger the call to the release callback.
static inline void cle_task_enqueueClose(cle_task_t *task);

// Blocks the caller until the task reaches at least status CLE_TASK_STATUS_FINISHED
void cle_task_wait(cle_task_t *task);

static inline void cle_task_lock(cle_task_t *task, int incr);

static inline int cle_task_unlock(cle_task_t *task, int incr);

static inline void cle_task_unlock_release(cle_task_t *task, int incr);


/*
 * Generic task management API
 */

char *cle_task_getStateString(int status);

// Allocate a structure that can be enqueued as a task
// The task structure (cle_task_t) must be embedded at any position inside the returned area.
// Note that an extra area is allocated at the end the returned area on top of the 
// specified size, for task management
void *cle_task_alloc(int size, int taskOffset, int nbDep, int lock);

static inline void cle_task_setStateCallback(cle_task_t *task, cle_task_state_e state, void (*callback)(struct cle_task_s *, void *data), void *data);

static inline void cle_task_setState(cle_task_t *task, cle_task_state_e state);



/* 
 * Memcpy task management API
 */

// Allocate a structure that can be enqueued as a memcpy task
// The memcpy task structure (cle_memcpyTask_t) must be embedded at any position inside the returned area.
// Note that an extra area is allocated at the end the returned area on top of the 
// specified size, for task management
void *cle_buffer_taskAlloc(int size, int taskOffset, int nbDep);

// Initialize a memcpy task. See cle_task_init for more details
void cle_buffer_taskInit(cle_bufferTask_t *task, int type, void (*releaseCallback)(void *data), void *releaseData, int taskStructSize);

// Free a memcpy task structure
void cle_buffer_taskFree(void *ptr, cle_bufferTask_t *task);

// Specify the information about the memcpy
void cle_buffer_copy(cle_bufferTask_t *memcpy, unsigned int dst, unsigned int src, unsigned int offset, unsigned int size);

// Enqueue a memcpy task ready for execution
void cle_buffer_taskEnqueue(cle_bufferTask_t *memcpy, int nbDeps, cle_task_t **deps);

void cle_buffer_map(cle_bufferTask_t *task);

void cle_buffer_unmap(cle_bufferTask_t *task);

/*
 * Device task management API
 */

static inline void cle_devTask_init(cle_device_t *device, cle_devTask_t *devTask, int taskStructSize, int devReqSize, unsigned int devReqOffset, void (*fillReqCallback)(cle_device_t *device, cle_devTask_t*,void*,void*), void*fillReqData) {
  device->taskInit(device, devTask, taskStructSize, devReqSize, devReqOffset, fillReqCallback, fillReqData);
}

/*
 * Device API
 */

static inline int cle_dev_buffer_alloc(cle_device_t *dev, cle_buf_t *buffer, int size, int cached, int global) {
  return dev->bufferAlloc(dev, buffer, size, cached, global);
}

static inline void cle_dev_buffer_free(cle_device_t *dev, cle_buf_t *buffer) {
  dev->bufferFree(dev, buffer);
}

#if 0
static inline void *cle_dev_buffer_map(cle_device_t *dev, cle_buf_t *buffer) {
  return dev->bufferMap(dev, buffer);
}

static inline void cle_dev_buffer_unmap(cle_device_t *dev, cle_buf_t *buffer) {
  dev->bufferUnmap(dev, buffer);
}
#endif

/*
 * STHORM device management API
 */

int allocSthormDevice(cle_device_t **device, void **data);

void releaseSthormDevice(cle_device_t *device, void *data);




int allocPulpDevice(cle_device_t **device, void **data);

void releasePulpDevice(cle_device_t *device, void *data);



extern uint64_t openTime;

static inline uint64_t cle_getTime() {
  // struct timeval date;
#ifdef __POSIX__
  //gettimeofday(&date, NULL);
  return 0; //((uint64_t)(date.tv_sec))*1e9 + date.tv_usec*1e3 - openTime;
#else
  return 0;
#endif
}

#include <cle/internals.h>

static inline void cle_task_enqueueClose(cle_task_t *task) {
  // An external caller wants to close a task
  // Do the real job from the task engine to avoid race conditions in the task graph
  cle_task_enqueueCallback(task, cle_handleTaskClose, CLE_TASK_CLOSE_PRIO);
}

static inline void cle_task_enqueueFinish(cle_task_t *task, int retval, uint64_t startTime, uint64_t endTime) {
  // An external caller wants to finish a task
  // Do the real job from the task engine to avoid race conditions in the task graph
  // Just set the termination information as only one caller should call this function
  task->execStartTime = startTime;
  task->execEndTime = endTime;
  task->retval = retval;
  cle_task_enqueueCallback(task, cle_handleTaskFinish, CLE_TASK_CLOSE_PRIO);
}

static inline void cle_task_lock(cle_task_t *task, int incr) {
  pthread_mutex_lock(&task->mutex);
  task->lockCount += incr;
  pthread_mutex_unlock(&task->mutex);
}

static inline int cle_task_unlock(cle_task_t *task, int incr) {
  pthread_mutex_lock(&task->mutex);
  task->lockCount -= incr;
  int result = (task->lockCount == 0) && (task->lockCount == 0);
  pthread_mutex_unlock(&task->mutex);
  return result;
}

static inline void cle_task_unlock_release(cle_task_t *task, int incr) {
  if (cle_task_unlock(task, incr)) {
    cle_task_enqueueCallback(task, cle_handleTaskRelease, CLE_TASK_PARSE_PRIO);
  }
}

static inline void cle_task_setStateCallback(cle_task_t *task, cle_task_state_e state, void (*callback)(struct cle_task_s *, void *data), void *data) {
  cle_task_callback_t *cb = &task->stateCallback[state];
  cb->callback = callback;
  cb->data = data;
}

static inline void cle_task_setState(cle_task_t *task, cle_task_state_e state) {
  if (state > task->state) {
    CLE_TRACE(100, "Changing task state (task: %p, old state: %s, new status: %s)\n", task, cle_task_getStateString(task->state), cle_task_getStateString(state));
    cle_task_callback_t *cb = &task->stateCallback[state];
    task->state = state;
    if (cb->callback) {
      cb->callback(task, cb->data);
    }
  }
}

static inline void cle_task_setPrefetchConfig(cle_task_t *task, unsigned int prefetchColor, int prefetchThreshold) {
  task->prefetchColor = prefetchColor;
  task->prefetchThreshold = prefetchThreshold;
}

static inline cle_task_t *cle_task_getFromFifoElem(cle_sharedFifo_elem_t *elem) {
  return (cle_task_t *)elem;
}

static inline cle_devTask_t *cle_devTask_getFromTask(cle_task_t *task) {
  return (cle_devTask_t *)task;
}

#endif
