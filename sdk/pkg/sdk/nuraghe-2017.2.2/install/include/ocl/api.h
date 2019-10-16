#ifndef __CL_API_H__
#define __CL_API_H__

#include <ocl/types.h>
#include <cle/api.h>
#include <CL/cl.h>

#ifdef CL_ACTIVATE_DEBUG

#include <stdio.h>

extern char *clStrError(int error);
extern int clActiveWarnings;
extern int clTraceLevel;
void ocl_initVerbose();

#ifdef __ANDROID__
#  define CL_LOGMSG(x...) __android_log_print(ANDROID_LOG_DEBUG, "sthorm", x)
#else
#  define CL_LOGMSG(x...) printf(x); 
#endif

#define CL_MSG(fmt, x...)			\
  do { \
    CL_LOGMSG("[\033[35mOCL\033[0m] " fmt, ##x);					\
  } while(0)

#define CL_WARNING(x...)					\
  do {								\
    if (clActiveWarnings) CL_MSG("OCL WARNING: "x);		\
  } while(0)

static inline cl_int CL_ERROR(char *apiFunc, cl_int error) {
  CL_WARNING("%s has returned an error (%s)\n", apiFunc, clStrError(error));
  return error;
}

#define CL_ERROR_NORET(apiFunc, error) CL_ERROR(apiFunc, error);

#  define CL_TRACE(lvl, x...)			\
  do {						\
    if (lvl < clTraceLevel) CL_MSG(x);		\
  } while(0)

#else

#define CL_ERROR(apiFunc, error) (error)
#define CL_ERROR_NORET(apiFunc, error)
#define CL_TRACE(x...)
#define CL_WARNING(x...)
#define ocl_initVerbose()

#endif

// Object identifiers used for validity checking
#define CL_OBJ_PLATFORM_ID       0
#define CL_OBJ_DEVICE_ID         1
#define CL_OBJ_CONTEXT_ID        2
#define CL_OBJ_COMMAND_QUEUE_ID  3
#define CL_OBJ_MEMOBJ_ID         4
#define CL_OBJ_PROGRAM_ID        5
#define CL_OBJ_KERNEL_ID         6


// Makes a platform available through the OCL platform layer
int registerPlatform(struct _cl_platform_id *platform);

// Check if the platforms are initialized and do it if not done
int checkPlatformsInit();

int checkContextDevice(cl_context context, cl_device_id device);

cl_platform_id getDefaultPlatform();

// Allocate an object visible to the OCL API. In case of debug, this will allocate
// an object with a header to enforce checkings
#ifdef CL_ACTIVATE_DEBUG
void *allocClObject(int size, int id);
void freeClObject(void *ptr);
#else
#define allocClObject(size,id) malloc(size)
#define freeClObject(ptr) free(ptr)
#endif

// Check if an object is valid (allocated by the runtime, still valid and with proper ID)
#ifdef CL_ACTIVATE_DEBUG
int checkClObject(void *obj, int id);
#else
#define checkClObject(obj,id) (0)
#endif

static inline void initRefCount(refCount_t *refCount, void *obj) {
  refCount->user = 0;
  refCount->runtime = 0;
}

static inline void incRuntimeRefCount(refCount_t *refCount, void *obj, int incr) {
  refCount->runtime += incr;
}

static inline void incUserRefCount(refCount_t *refCount, void *obj, int incr) {
  refCount->user += incr;
}

static inline int decRuntimeRefCount(refCount_t *refCount, void *obj, int incr) {
  refCount->runtime += incr;
  return (refCount->user == 0) && (refCount->runtime == 0);
}

static inline int decUserRefCount(refCount_t *refCount, void *obj, int incr) {
  refCount->user += incr;
  return (refCount->user == 0) && (refCount->runtime == 0);
}

static inline void eventInit(cle_task_t *cleTask, cl_event event, cl_context context) {
  event->context = context;
  cleTask->userRef = (void *)event;
  event->cleTask = cleTask;
}

static inline cl_event eventGetUserRef(cl_event event) {
  return (cl_event)event->cleTask;
}

static inline cl_event eventGet(cl_event event) {
  cle_task_t *cleTask = (cle_task_t *)event;
  return (cl_event)cleTask->userRef;
}

#endif

