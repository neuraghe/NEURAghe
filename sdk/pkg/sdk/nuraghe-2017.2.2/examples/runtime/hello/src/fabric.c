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

static void taskEntry(uint32_t arg0,uint32_t arg1) {
  printf("Entered task\n");
}

int FABRIC_ENTRY main() {

  if (rt_init()) return -1;

  printf("(%d, %d) Hello\n", rt_clusterId(), rt_coreId());


  if (rt_coreId() == STHORM_CONTROLER_COREID) {
    rt_task_t task;
    rt_cc_t *cc = rt_getCcData(rt_clusterId());
    rt_task_init(cc, &task, taskEntry, (uint32_t)cc, 0);
    rt_task_enqueue(cc, 0, &task);
  }

  if (rt_start()) return -1;

  while(1) p2012_delay();

  exit(0);

  return 0;
}
