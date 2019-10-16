/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

 /* This example shows the usage of task-based DMA transfers using plp_dma_memcpy_task.
  * Each time a DMA transfer is finished, a task is executed, which then enqueues another 
  * DMA transfer until a certain number of transfers have been done
  */

#include "pulp.h"

#define BUFSIZE          1024
#define NB_ITER          15

static PLP_L2_DATA char l2Buffers[2][BUFSIZE];
static PLP_L1_DATA char l1Buffers[2][BUFSIZE];
static PLP_L1_DATA int current = 0;
static PLP_L1_DATA int enqueued = 0;
static PLP_L1_DATA int processed = 0;
static PLP_L1_DATA plp_dma_copy_t copies[2];

static int processBuffer(char *buffer, int size) {
  printf("Processing buffer 0x%x\n", (int)buffer);
}

// This task is executed each time a DMA transfer is finished
// It is executed outside any interrupt handler, so it is safe to call any runtime API
static void dma_task(unsigned int arg) {
  processBuffer(l1Buffers[current], BUFSIZE);
  processed++;  
  if (processed == NB_ITER) plp_sched_stop(0);

  if (enqueued < NB_ITER) {
    enqueued++;
    plp_dma_memcpy_task((int)l2Buffers[current], (int)l1Buffers[current], BUFSIZE, PLP_DMA_EXT2LOC, &copies[current], plp_task(dma_task, enqueued));
  }

  current ^= 1;
}

static void test_task(int arg) {
  printf("Exec test task\n");
  enqueued += 2;
  // We initially enqueue 2 DMA transfers to always have 2 on-going transfers and thus better pipeline the transfers
  // as the DMA can process the next transfer while the task is enqueueing a new one
  plp_dma_memcpy_task((int)l2Buffers[0], (int)l1Buffers[0], BUFSIZE, PLP_DMA_EXT2LOC, &copies[0], plp_task(dma_task, 1));
  plp_dma_memcpy_task((int)l2Buffers[1], (int)l1Buffers[1], BUFSIZE, PLP_DMA_EXT2LOC, &copies[1], plp_task(dma_task, 2));
}

int main()
{
  if (plp_isFc()) {
    plp_cluster_fetch(1);
    return plp_cluster_wait(0);
  }
  // This example is fully task-based, enqueue the root one that will enqueue tasks for the example
  printf("Enqueue test task\n");
  plp_sched_enqueue(plp_task(test_task, 0));

  // Starting from here, the scheduler will keep control until we stop after all examples have been executed
  plp_sched_start();

  return 0;
}
