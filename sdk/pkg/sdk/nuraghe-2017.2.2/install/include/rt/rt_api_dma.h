/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_DMA_H__
#define __RT__RT_API_DMA_H__

#include "hal/pulp.h"

/** @name DMA API
 * The following API can be used together with the DMA HAL functions in order to get more advanced features like task-based DMA transfer completion.
 */
/**@{*/

/** DMA 1D memory transfer with task-based completion. 
 * This function is very similar to the plp_dma_memcpy one from the HAL, except that once the transfer is finished, the runtime will enqueue a task
 * in the scheduler, which allows the application to use the DMA in a task-based manner.
 * An example using this feature can be found in the dma/task runtime example.
 * 
  \param   ext     Address in the external memory where to access the data. There is no restriction on memory alignment.
  \param   loc     Address in the cluster memory where to access the data. There is no restriction on memory alignment.
  \param   size    Number of bytes to be transfered. The only restriction is that this size must fit 16 bits, i.e. must be inferior to 65536.
  \param   ext2loc If 1, the transfer is loading data from external memory and storing to cluster memory. If 0, it is the contrary
  \param   copy    A pointer to the copy node. This structure is used by the runtime to maintain the state of the transfer and must be allocated by the caller. It can be reused a soon as the task is executed.
  \param   task    The task to be enqueued when the transfer is finished. See the scheduler documentation for more information.
  */

void plp_dma_memcpy_task(unsigned int ext, unsigned int loc, unsigned short size, int ext2loc, plp_dma_copy_t *copy, plp_task_t task);

//!@}

#endif