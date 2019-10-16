
#ifndef __OMPRT_H__
#define __OMPRT_H__

#include <rt/rt_api.h>
#include "omp.h"
#include <stdarg.h>
#include "pulp.h"

#define OMP_NB_WORKSHARE_BITS 3
#define OMP_NB_WORKSHARE (1<<OMP_NB_WORKSHARE_BITS)

struct omp_ws_s;

typedef struct {
  int start;
  int end;
  int chunk;
  int id;
} ompLoop_t;

typedef struct omp_ws_s {
  int cycle;
  rt_mutex_t singleLock;
  ompLoop_t loop;
  struct omp_ws_s *next;
} omp_ws_t;

typedef struct ompTask_s {
  void (*func)(void *);
  void *data;
  struct ompTask_s *next;
} ompTask_t;

typedef struct {
  void (*entry)(void *);
  void *args;
  int id;
  int barrier;
  int nbThreads;
  rt_mutex_t criticalMutex;
  int sectionId;
  int threadsInSection;
  ompTask_t *firstReadyTask;
  ompTask_t *lastReadyTask;
  int hasTasks;
  omp_ws_t workShare[OMP_NB_WORKSHARE];
  omp_ws_t *currentWs[RT_MAX_CLUSTER_NB_PES];
  int epoch[RT_MAX_CLUSTER_NB_PES];
} omp_team_t;

typedef struct {
  ompTask_t *taskPool;
  int wakeupEvent;
  int wakeupEventTrigger;
  omp_team_t plainTeam;
#ifdef __LLVM__
  int numThreads;
#endif
} omp_t;

void partialParallelRegion(void (*fn) (void*), void *data, int num_threads);

static inline void perfInitAndStart()
{
#ifdef __PROFILE0__
#ifdef OR10N4
  cpu_perf_conf_events(SPR_PCER_ALL_EVENTS_MASK);
  cpu_perf_setall(0);
  cpu_perf_conf(SPR_PCMR_ACTIVE | SPR_PCMR_SATURATE);
#endif
#endif
}

static inline void perfParallelEnter()
{
#ifdef __PROFILE0__
#ifdef __PROFILE1__
  pulp_trace_perf(TRACE_OMP_PARALLEL_ENTER);
#else
  pulp_trace(TRACE_OMP_PARALLEL_ENTER);
#endif
#endif
}
 
static inline void perfParallelExit()
{
#ifdef __PROFILE0__
#ifdef __PROFILE1__
      pulp_trace_perf(TRACE_OMP_PARALLEL_EXIT);
#else
      pulp_trace(TRACE_OMP_PARALLEL_EXIT);
#endif
#endif
}

int omp_init(omp_t *_this);
int omp_start(omp_t *_this, int (*entry)(void *), void *args);

static inline int getThreadNum(omp_t *omp)
{
  return rt_coreId();
}

#ifdef __GCC__
static inline ompTask_t *allocTask(rt_cc_t *rtCc, omp_t *_this, int arg_size) 
{
#if 0
  ompTask_t *task = _this->taskPool;
  if (task == NULL) return NULL;
  _this->taskPool = task->next;
  return task;
#else
  return (ompTask_t *)rt_l1_alloc(rtCc, sizeof(ompTask_t)+arg_size);
#endif
}
#endif

static inline void freeTask(rt_cc_t *rtCc, omp_t *_this, ompTask_t *task) 
{
#if 1
  task->next = _this->taskPool;
  _this->taskPool = task;
#else
  rt_l1_free(rtCc, (unsigned int)task);
#endif
}

// This returns OMP data in 3 instructions (address construction + load)
static inline omp_t *omp_getData() {
  return (omp_t *)rt_getUserData();
  //return (omp_t *)(rt_pm_getDesc(&rtCc->msgHandler, PULP_REQ_OMP_PMID)->data);
}

static inline void omp_setData(rt_cc_t *rtCc, omp_t *_this) {
  rt_pm_getDesc(&rt_getCcData(rt_clusterId())->msgHandler, PULP_REQ_OMP_PMID)->data = (void *)_this;
}

static inline omp_team_t *getTeam(omp_t *_this) {
  return &_this->plainTeam;
}

static inline omp_team_t *getCurrentTeam() {
  return getTeam(omp_getData());
}

static inline void criticalStart(omp_team_t *team)
{
#if EU_VERSION == 3
  eu_mutex_lock(eu_mutex_addr(0));
#else
  while(rt_mutex_trylock(&team->criticalMutex));
#endif
}

static inline void userCriticalStart(omp_team_t *team)
{
#ifdef __PROFILE0__
  pulp_trace(TRACE_OMP_CRITICAL_ENTER);
#endif
  criticalStart(team);
}

static inline void criticalEnd(omp_team_t *team)
{
#if EU_VERSION == 3
  eu_mutex_unlock(eu_mutex_addr(0));
#else
  rt_mutex_unlock(&team->criticalMutex);
#endif
}

static inline void userCriticalEnd(omp_team_t *team)
{
  criticalEnd(team);
#ifdef __PROFILE0__
  pulp_trace(TRACE_OMP_CRITICAL_EXIT);
#endif
}

static inline __attribute__((always_inline)) void doBarrier(omp_team_t *team) {
#if EU_VERSION == 3
  eu_bar_trig_wait_clr(eu_bar_addr(0));
#else
  pulp_barrier_notify(team->barrier);
  pulp_evt_wait();
  pulp_gpevt_clear(0);
  //while (team->hasTasks) {
  //  handleReadyTasks(team);
  //}
#endif
}

static inline void userBarrier(omp_team_t *team) {
#ifdef __PROFILE0__
  pulp_trace(TRACE_OMP_BARRIER_ENTER);
#endif
  doBarrier(team);
#ifdef __PROFILE0__
  pulp_trace(TRACE_OMP_BARRIER_EXIT);
#endif
}

static inline void __attribute__((always_inline)) parallelRegionExec(void *data, void (*fn) (void*), omp_t *_this, omp_team_t *team, unsigned int coreSet)
{
  // Now that the team is ready, wake up slaves
#if EU_VERSION == 3
  #if 1
  eu_dispatch_push((unsigned int)fn);
  eu_dispatch_push((unsigned int)data);
  #else
  eu_evt_trig(_this->wakeupEventTrigger, coreSet-1);
  #endif
#else
  // The entry point is used by the slave to detect a valid plain team
  team->entry = fn;
  team->args = data;  
  pulp_gpevt_triggerCoreSet(_this->wakeupEvent, coreSet-1);
#endif

  // Team execution
  perfParallelEnter();  
#ifdef __GCC__
  fn(data);
#else
  kmpc_micro entry = (kmpc_micro)fn;
  int id;
  entry(&id, &id, data);
#endif
  perfParallelExit();
  
  // Execute the final barrier to wait until the slaves have finished the team execution
  doBarrier(team);
}

static inline void __attribute__((always_inline)) parallelRegion(void *data, void (*fn) (void*), int num_threads)
{
  int coreMask = rt_getData()->coreMask;
  omp_t *_this = omp_getData();
  
  if (((1 << num_threads) & coreMask) <= 1) {
    // We differentiate plain team and partial teams to put more optimizations on plain teams
    // as they are the most used
    omp_team_t *team = &_this->plainTeam;
    parallelRegionExec(data, fn, _this, team, coreMask);
  } else {
    partialParallelRegion(fn, data, num_threads);
  }
}

// TODO try to improve that with a bitfield, one bit per core indicating if the work is available for the core,
// reinitialized to 1 when the work share is finished
static inline omp_ws_t *getWorkShare(rt_cc_t *rtCc, omp_team_t *team, omp_t *_this, int coreId, unsigned int *myEpoch, unsigned int *wsId, int *cycle)
{
  *myEpoch = team->epoch[coreId];
  *wsId = *myEpoch & (OMP_NB_WORKSHARE - 1);
  *cycle = (*myEpoch >> OMP_NB_WORKSHARE_BITS) & 1;
  omp_ws_t *ws = &team->workShare[*wsId];
  // The cycle is used to detect when we have reached a work share
  // that we have already executed but is still not executed by other
  // threads
  // In this case, just wait until it is free

  while(*(volatile int *)&ws->cycle != *cycle);

  return ws;  
}

#if EU_VERSION == 3

static inline __attribute__((always_inline)) unsigned int sectionGet()
{
  int size = eu_loop_getChunk(eu_loop_addr(0));
  int start = eu_loop_getStart(eu_loop_addr(0));
  if (size == 0) return 0;
  else return start;
}

static inline __attribute__((always_inline)) unsigned int sectionInit(unsigned int count)
{
  unsigned int state = eu_loop_getState(eu_loop_addr(0));
  if (state == EU_LOOP_DONE) goto end;
  else if (state == EU_LOOP_SKIP) return 0;
  eu_loop_setStart(eu_loop_addr(0), 1);
  eu_loop_setEnd(eu_loop_addr(0), count+1);
  eu_loop_setIncr(eu_loop_addr(0), 1);
  eu_loop_setChunk(eu_loop_addr(0), 1);
end:
  return sectionGet();
}

static inline __attribute__((always_inline)) int dynLoopIter(omp_team_t *team, int *istart, int *iend, int *isLast)
{
  int size = eu_loop_getChunk(eu_loop_addr(0));
  int start = eu_loop_getStart(eu_loop_addr(0));
  if (size == 0) goto end;
  *istart = start;
  *iend = start + size;
  if (isLast) *isLast = 0;
  return 1;
end:
  return 0;
}

static inline int dynLoopInit(omp_team_t *team, int start, int end, int incr, int chunk_size, int *istart, int *iend)
{

  unsigned int state = eu_loop_getState(eu_loop_addr(0));
  // Case where the loop is already initialized and still have available indexes
  if (state == EU_LOOP_DONE) goto end;
  // Case where the loop is already over
  else if (state == EU_LOOP_SKIP) return 0;
  // Case where we are the first to enter the loop
  eu_loop_setStart(eu_loop_addr(0), start);
  eu_loop_setEnd(eu_loop_addr(0), end);
  eu_loop_setIncr(eu_loop_addr(0), incr);
  eu_loop_setChunk(eu_loop_addr(0), chunk_size);

end:
  return dynLoopIter(team, istart, iend, NULL);
}

static inline void dynLoopInitNoIter(omp_team_t *team, int start, int end, int incr, int chunk_size)
{

  unsigned int state = eu_loop_getState(eu_loop_addr(0));
  // Case where the loop is already initialized and still have available indexes
  if (state == EU_LOOP_DONE) return;
  // Case where the loop is already over
  else if (state == EU_LOOP_SKIP) return;
  // Case where we are the first to enter the loop
  eu_loop_setStart(eu_loop_addr(0), start);
  eu_loop_setEnd(eu_loop_addr(0), end);
  eu_loop_setIncr(eu_loop_addr(0), incr);
  eu_loop_setChunk(eu_loop_addr(0), chunk_size);
}

static inline void dynLoopInitSingle(omp_team_t *team, int start, int end, int incr, int chunk_size, int nbThread)
{
  eu_loop_getState(eu_loop_addr(0));
  eu_loop_setStart(eu_loop_addr(0), start);
  eu_loop_setEnd(eu_loop_addr(0), end);
  eu_loop_setIncr(eu_loop_addr(0), incr);
  eu_loop_setChunk(eu_loop_addr(0), chunk_size);
}

static inline int singleStart()
{
  return eu_loop_getSingle(eu_loop_addr(0));
}

#else

static inline void dynLoopClose(omp_team_t *team)
{
  int coreId = rt_coreId();
  unsigned int myEpoch = team->epoch[coreId];
  unsigned int wsId = myEpoch & (OMP_NB_WORKSHARE - 1);
  int cycle = (myEpoch >> OMP_NB_WORKSHARE_BITS) & 1;
  omp_ws_t *ws =  team->currentWs[coreId];
  int result;

  while((result = rt_mutex_trylock(&ws->singleLock)) == -1);

  if (result == 2*team->nbThreads - 1)
    {
      ws->singleLock.lock = 0;
      ws->cycle = cycle ^ 1;
    }
  else
    {
      ws->singleLock.lock = result + 1;
    }
  team->epoch[coreId] = myEpoch + 1;
}

static inline int dynLoopIter(omp_team_t *team, int *istart, int *iend, int *isLast)
{
  int result;
  int id;
  int idNext;
  int coreId = rt_coreId();
  omp_ws_t *ws =  team->currentWs[coreId];  
  
  int chunk = ws->loop.chunk;
  int loopEnd = ws->loop.end;
  int loopStart = ws->loop.start;

  unsigned int lockAddr = rt_tas_addr((unsigned int)&ws->loop.id);
  while ((id = *(volatile int *)lockAddr) == -1);
  *(volatile int *)&(ws->loop.id) = id + 1;

  // Now compute bounds from id
  int start = id * chunk + loopStart;
  // Be careful the increment can in fact be negative
  // Check if it remains a chunk and also if we have a partial chunk at the last iteration
  int diff = loopEnd - start;
  
  if (chunk > 0) {
    if (diff <= 0) goto end;
    *isLast = diff <= chunk;
#ifndef MIN
#define MIN(X, Y) (((X) < (Y)) ? (X) : (Y))
#endif
    chunk = MIN(diff, chunk);
  } else {
    if (diff >= 0) goto end;
    *isLast = diff >= chunk;
#ifndef MAX
#define MAX(X, Y) (((X) > (Y)) ? (X) : (Y))
#endif
    chunk = MAX(diff, chunk);
    
  }

  *istart = start;
  *iend = start + chunk;

  return 1;

 end:
  dynLoopClose(team);
  return 0;
}

static inline int dynLoopInit(omp_team_t *team, int start, int end, int incr, int chunk_size, int *istart, int *iend)
{
  rt_cc_t *rtCc = rt_getCcData(rt_clusterId());
  omp_t *_this = omp_getData();
  int coreId = rt_coreId();
  unsigned int myEpoch, wsId;
  int cycle;
  omp_ws_t *ws = getWorkShare(rtCc, team, _this, coreId, &myEpoch, &wsId, &cycle);

  team->currentWs[coreId] = ws;

  int result;
  while((result = rt_mutex_trylock(&ws->singleLock)) == -1);
  if (result == 0)
    {
        // TODO can't we just set id and keep the rest local for each core as everyone execute this function ?
      ws->loop.id = 0;
      ws->loop.start = start;
      ws->loop.end = end;
      ws->loop.chunk = chunk_size*incr;
    }
  ws->singleLock.lock = result + 1;

  int isLast;
  return dynLoopIter(team, istart, iend, &isLast);
}

static inline void dynLoopInitNoIter(omp_team_t *team, int start, int end, int incr, int chunk_size)
{
  rt_cc_t *rtCc = rt_getCcData(rt_clusterId());
  omp_t *_this = omp_getData();
  int coreId = rt_coreId();
  unsigned int myEpoch, wsId;
  int cycle;
  omp_ws_t *ws = getWorkShare(rtCc, team, _this, coreId, &myEpoch, &wsId, &cycle);

  team->currentWs[coreId] = ws;

  int result;
  while((result = rt_mutex_trylock(&ws->singleLock)) == -1);
  if (result == 0)
    {
        // TODO can't we just set id and keep the rest local for each core as everyone execute this function ?
      ws->loop.id = 0;
      ws->loop.start = start;
      ws->loop.end = end;
      ws->loop.chunk = chunk_size*incr;
    }
  ws->singleLock.lock = result + 1;
}

static inline void dynLoopInitSingle(omp_team_t *team, int start, int end, int incr, int chunk_size, int nbThread)
{
  rt_cc_t *rtCc = rt_getCcData(rt_clusterId());
  omp_t *_this = omp_getData();
  int coreId = rt_coreId();
  unsigned int myEpoch, wsId;
  int cycle;
  omp_ws_t *ws = getWorkShare(rtCc, team, _this, coreId, &myEpoch, &wsId, &cycle);

  int i;
  for (i=0; i<nbThread; i++)
    {
      team->currentWs[i] = ws;
    }

  int result;
  ws->loop.id = 0;
  ws->loop.start = start;
  ws->loop.end = end;
  ws->loop.chunk = chunk_size*incr;
  ws->singleLock.lock = nbThread;
}

static inline int singleStart()
{
  rt_cc_t *rtCc = rt_getCcData(rt_clusterId());
  omp_team_t *team = getCurrentTeam();
  omp_t *_this = omp_getData();
  int coreId = rt_coreId();
  unsigned int myEpoch, wsId;
  int cycle;
  omp_ws_t *ws = getWorkShare(rtCc, team, _this, coreId, &myEpoch, &wsId, &cycle);

  int result;
  while((result = rt_mutex_trylock(&ws->singleLock)) == -1);
  if (result == team->nbThreads - 1)
    {
      ws->singleLock.lock = 0;
      ws->cycle = cycle ^ 1;
    }
  else ws->singleLock.lock = result + 1;

  // Update our epoch
  team->epoch[coreId] = myEpoch + 1;

  return result == 0; 
}

#endif

#endif
