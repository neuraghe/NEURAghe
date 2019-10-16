/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#include "pulp.h"
#include "plplib.h"

// The buffer is actually a 1D buffer but the kernel library only supports 2D buffers for now
#define BUF_WIDTH        32
#define BUF_HEIGHT       16
#define BUFSIZE          (BUF_WIDTH*BUF_HEIGHT)

#define NB_ITER          10

static PLP_L1_DATA int32_t output[BUFSIZE];

static PLP_L1_DATA int32_t *bufferReady = NULL;

static void copyHandler(unsigned int buffer)
{
  bufferReady = (int32_t *)buffer;
}

int main()
{

  // Input data coming from ADC. This will automatically transfer data from ADC to the L1 periodically, and call the specified handler
  plp_copy_t *rxCopy = plp_periph_copy_init(PLP_UDMA_ADC0_CHANNEL, BUFSIZE, PLP_COPY_PERIODIC | PLP_COPY_L1, plp_handler_noarg(copyHandler));
  if (rxCopy == NULL) return -1;

  // Output data to the UART. This is transfered from L1 to the UART each time a buffer is pushed
  plp_copy_t *txCopy = plp_periph_copy_init(PLP_UDMA_UART_TX_CHANNEL, BUFSIZE, PLP_COPY_ONESHOT | PLP_COPY_L1, 0);
  if (txCopy == NULL) return -1;

  // Starting from here, we can received data from the ADC
  plp_periph_copy_start(rxCopy);

  // Activate ADC to start receiving samples from it
  plp_analog_ip_write(0x2+0, 0x1A, 0x1);

  for (int i=0; i<NB_ITER; i++) {

    // Sleep until our interrupt handler is called and we get a new buffer to process
    while(*((volatile int *)&bufferReady) == 0) plp_sched_wait();

    printf("Received buffer\n");

    int32_t *buffer = bufferReady;
    bufferReady = NULL;

    // First get the L1 buffer where we can store the output data
    unsigned int output = plp_periph_copy_get(txCopy);

    // Just execute a dummy threshold on the input data
    plp_threshold_i32(buffer, (int32_t *)output, BUF_WIDTH, BUF_HEIGHT, 0);

    // Push the data so that they are sent to the UART
    plp_periph_copy_push(txCopy);

  }

  // We still have output transfered on-going, block until they are finished
  plp_periph_copy_flush(txCopy);

  plp_periph_copy_deinit(rxCopy);

  return 0;
}
