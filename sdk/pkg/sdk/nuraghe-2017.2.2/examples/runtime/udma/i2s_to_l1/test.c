/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

/* This example shows the usage of task-based UDMA transfers from I2S to L1 using plp_udma_enqueueCopy_toL1.
 * The example is enqueueing transfers directly fron the peripheral (I2S) to L1, and the runtime is taking
 * care of first doing a UDMA transfer from peripheral to L2, and then a DMA transfer from L2 to L1.
 * Each time a transfer is finished, a task is executed, which then enqueues another 
 * transfer until a certain number of transfers have been done
 */


#include "pulp.h"

#define BUFSIZE          1024
#define NB_ITER          10

static PLP_L2_DATA char l2Buffers[2][BUFSIZE];
static PLP_L1_DATA char l1Buffers[2][BUFSIZE];
static PLP_L1_DATA int current = 0;
static PLP_L1_DATA int count = 0;
static PLP_L1_DATA plp_udma_copy_t udmaCopy[2];

static int processBuffer(char *buffer, int size) {
#if 0
  while(size) {
    putchar(*buffer);
    buffer++;
    size--;
  }
#else
  printf("Processing buffer 0x%x\n", (int)buffer);
#endif
}

// This task is executed each time a buffer of samples has been received from UDMA
static void udma_task(unsigned int arg) {
  processBuffer(l1Buffers[current], BUFSIZE);

  count++;
  if (count == NB_ITER) {
    plp_sched_stop(0);
  } else {
    plp_periph_copy_toL1(&udmaCopy[current], PLP_UDMA_I2S0_CHANNEL, (int) l2Buffers[current], BUFSIZE, UDMA_CHANNEL_CFG_SIZE_32, plp_task(udma_task, 0), (int) l1Buffers[current]);
  }

  current ^= 1;
}

static void test_task(int arg) {

  // Activate VPI to start receiving samples from I2S
  plp_i2s_vpi_start();

  // Enqueue 2 buffers to better pipeline transfers, the rest will be enqueued by the task
  plp_periph_copy_toL1(&udmaCopy[0], PLP_UDMA_I2S0_CHANNEL, (int) l2Buffers[0], BUFSIZE, UDMA_CHANNEL_CFG_SIZE_32, plp_task(udma_task, 0), (int) l1Buffers[0]);
  plp_periph_copy_toL1(&udmaCopy[1], PLP_UDMA_I2S0_CHANNEL, (int) l2Buffers[1], BUFSIZE, UDMA_CHANNEL_CFG_SIZE_32, plp_task(udma_task, 0), (int) l1Buffers[1]);
}

int main()
{
  // This example is fully task-based, enqueue the root one that will enqueue tasks for the example
  plp_sched_enqueue(plp_task(test_task, 0));

  // Starting from here, the scheduler will keep control until we stop after all examples have been executed
  plp_sched_start();

  return 0;
}
