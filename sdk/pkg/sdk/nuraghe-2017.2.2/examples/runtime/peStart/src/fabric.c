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

#include <rt/rt_api.h>

#define STACK_SIZE (1<<12)
#define NB_ENTRIES_LOG2 (2)
#define NB_ENTRIES (1<<NB_ENTRIES_LOG2)
#define NB_WARPS 500
#define PE_TIME 1000

typedef struct {
  rt_task_t task;
  uint32_t warpCount;
  uint32_t warpCountDone;
  rt_warp_t *warps;
  uint32_t currentWarp;
  uint32_t stacks;
  uint32_t nbCores;
  uint32_t cyclesStart;
  rt_warp_pool_t *pool;
  void (*entries[NB_ENTRIES])(uint32_t,uint32_t);
} data_t;

static data_t *data;

static void entry0(uint32_t arg0, uint32_t arg1) {
  int j;
  //for (j=0; j<PE_TIME; j++) sx_nop();
  printf("(%d, %d) entry0\n", rt_clusterId(), rt_coreId());
}

static void entry1(uint32_t arg0, uint32_t arg1) {
  int j;
  //for (j=0; j<PE_TIME; j++) sx_nop();
  printf("(%d, %d) entry1\n", rt_clusterId(), rt_coreId());
}

static void entry2(uint32_t arg0, uint32_t arg1) {
  int j;
  //for (j=0; j<PE_TIME; j++) sx_nop();
  printf("(%d, %d) entry2\n", rt_clusterId(), rt_coreId());
}

static void entry3(uint32_t arg0, uint32_t arg1) {
  int j;
  //for (j=0; j<PE_TIME; j++) sx_nop();
  printf("(%d, %d) entry3\n", rt_clusterId(), rt_coreId());
}

static void enqueueWarp(rt_cc_t *cc, data_t *data) {
  rt_warp_t *warp = &data->warps[data->currentWarp];
  //uint32_t warpCount = data->warpCount;

  data->currentWarp ^= 1;
  //rt_warp_setArg1(cc, warp, warpCount);
  //rt_warp_setEntry(cc, warp, data->entries[warpCount & (NB_ENTRIES - 1)]);
  rt_warp_setEntry(cc, warp, entry0);
  rt_warp_start(cc, warp);
  //data->warpCount = warpCount + 1;
}

static void endOfWarp(rt_task_t *task) {
  rt_cc_t *cc = rt_getLocalCcData(rt_clusterId());
  data_t *data = (data_t *)task->arg1;
  
  data->warpCountDone = data->warpCountDone + 1;
  if (data->warpCountDone < NB_WARPS) {
    enqueueWarp(cc, data);
  } else {
    uint32_t cyclesEnd = rt_perf_cyclesGet();
    printf("Got cycles %d %d\n", cyclesEnd, (cyclesEnd - data->cyclesStart) / NB_WARPS);
    exit(0);
  }
}

static void enqueueWarpsInit(rt_cc_t *cc, data_t *data) {
  int i;
  data->warpCount = 0;
  data->warpCountDone = 0;
  data->currentWarp = 0;
  data->pool = rt_warp_poolAlloc(cc, RT_WARP_ALLOC_ALL);
  rt_task_init(rt_warp_poolTask(cc, data->pool), endOfWarp, (uint32_t)cc, (uint32_t)data);
  rt_warp_poolStart(cc, data->pool);
  // TODO handle error
  data->stacks = rt_l1_alloc(cc, STACK_SIZE);
  data->warps = (rt_warp_t *)rt_l1_alloc(cc, sizeof(rt_warp_t)*2);

  // TODO handle error
  for (i=0; i<2; i++) {
    rt_warp_t *warp = &data->warps[i];
    rt_warp_init(cc, data->pool, warp);
    rt_warp_setStacks(cc, warp, data->stacks, STACK_SIZE);
    rt_warp_setArg0(cc, warp, (uint32_t)cc);
  }
  data->entries[0] = entry0;
  data->entries[1] = entry1;
  data->entries[2] = entry2;
  data->entries[3] = entry3;

  rt_perf_cyclesConf();
  rt_perf_cyclesStart();
  data->cyclesStart = rt_perf_cyclesGet();
  enqueueWarp(cc, data);
  enqueueWarp(cc, data);
}

static void taskEntry(rt_task_t *task) {
  rt_cc_t *cc = (rt_cc_t *)task->arg0;
  data_t *data = (data_t *)task->arg1;
  enqueueWarpsInit(cc, data);
}

void clusterControllerEntry(rt_task_t *task) {
  rt_cc_t *cc = rt_getLocalCcData(rt_clusterId());
  data = (data_t *)rt_cc_alloc(cc, sizeof(data_t));
  rt_task_init(&data->task, taskEntry, (uint32_t)cc, (uint32_t)data);
  rt_task_enqueue(&rt_getFcData()->sched, 0, &data->task);
}

int FABRIC_ENTRY main() {

  if (rt_init()) {
    return -1;
  }
    
  if (rt_start(clusterControllerEntry, 0, 0)) {
    return -1;
  }

  return 0;
}
