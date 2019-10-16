/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

/* This example shows the usage of task-based UDMA transfers from L1 using plp_udma_enqueueCopy_fromL1.
 * The example is enqueueing transfers directly fron L1 to the peripheral (UART), and the runtime is taking
 * care of first doing a DMA transfer from L1 to L2, and then a UDMA transfer from L2 to the peripheral.
 * Each time a transfer is finished, a task is executed, which then enqueues another 
 * transfer until a certain number of transfers have been done
 */

#include "pulp.h"
#include "string.h"

#define BUFSIZE          1024
#define NB_ITER          10

static PLP_L2_DATA char l2Buffers[2][BUFSIZE];
static PLP_L1_DATA char l1Buffers[2][BUFSIZE];
static PLP_L1_DATA int current = 0;
static PLP_L1_DATA int enqueued = 0;
static PLP_L1_DATA int finished = 0;
static PLP_L1_DATA plp_udma_copy_t udmaCopy[2];

static void udma_task(unsigned int arg);

static int processBuffer() {
  if (enqueued < NB_ITER) {
    sprintf(l1Buffers[current], "This is iteration %d\n", enqueued);
    plp_periph_copy_fromL1(&udmaCopy[current], PLP_UDMA_UART_TX_CHANNEL, (int) l2Buffers[current], strlen(l1Buffers[current])+1, UDMA_CHANNEL_CFG_SIZE_32, plp_task(udma_task, enqueued), (int) l1Buffers[current]);
    current ^= 1;
    enqueued++;
  }
}

// This task is executed each time a buffer of samples has been transfered from L1 to the peripheral
static void udma_task(unsigned int arg) {
  processBuffer();
  finished++;
  if (finished == NB_ITER) plp_sched_stop(0);
}

static void test_task(unsigned int arg) {

  // Enqueue 2 buffers to better pipeline transfers, the rest will be enqueued by the task
  processBuffer();
  processBuffer();
}

int main()
{

  // This example is fully task-based, enqueue the root one that will enqueue tasks for the example
  plp_sched_enqueue(plp_task(test_task, 0));

  // Starting from here, the scheduler will keep control until we stop after all examples have been executed
  plp_sched_start();

  return 0;
}
