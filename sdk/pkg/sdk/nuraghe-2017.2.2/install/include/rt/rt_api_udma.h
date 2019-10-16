/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_UDMA_H__
#define __RT__RT_API_UDMA_H__

#include "rt/rt_debug.h"

#define PLP_COPY_SIZE_BIT   0
#define PLP_COPY_SIZE_NBITS 2
#define PLP_COPY_TYPE_BIT   2
#define PLP_COPY_TYPE_NBITS 2

#define PLP_COPY_SIZE_8   (0<<0)
#define PLP_COPY_SIZE_16  (1<<0)
#define PLP_COPY_SIZE_32  (2<<0)
#define PLP_COPY_SIZE_DEF (3<<0)
#define PLP_COPY_L1       (1<<2)
#define PLP_COPY_L2       (1<<3)
#define PLP_COPY_ONESHOT  (1<<4)
#define PLP_COPY_PERIODIC (1<<5)

#define PLP_COPY_SPI_CS_BIT 16
 
static inline void plp_udma_init();

// DEPRECATED use plp_periph_copy_l2
static inline void plp_periph_copy_toL2(plp_udma_copy_t *copy, unsigned int channel, unsigned int l2Addr, unsigned int size, unsigned int cfg, plp_task_t task);

// DEPRECATED use plp_periph_copy_l2
static inline void plp_periph_copy_fromL2(plp_udma_copy_t *copy, unsigned int channel, unsigned int l2Addr, unsigned int size, unsigned int cfg, plp_task_t task);

static inline void plp_periph_copy_l2(plp_udma_copy_t *copy, unsigned int channel, unsigned int l2Addr, unsigned int size, unsigned int cfg, plp_task_t task);

// DEPRECATED use plp_periph_copy_l1
static inline void plp_periph_copy_toL1(plp_udma_copy_t *copy, unsigned int channel, unsigned int l2Addr, unsigned int size, unsigned int cfg, plp_task_t task, unsigned int l1Addr);

// DEPRECATED use plp_periph_copy_l1
static inline void plp_periph_copy_fromL1(plp_udma_copy_t *copy, unsigned int channel, unsigned int l2Addr, unsigned int size, unsigned int cfg, plp_task_t task, unsigned int l1Addr);

void plp_periph_copy_l1(plp_udma_copy_t *copy, unsigned int channel, unsigned int l2Addr, unsigned int size, unsigned int cfg, plp_task_t task, unsigned int l1Addr);

/* Wait for a UDMA copy completion
 * Can be used for any channel
 * This puts the core in idle mode until the transfer is complete
 * This can be called from any core
 */
void plp_udma_copy_wait(plp_udma_copy_t *copy);


plp_copy_t *plp_periph_copy_init(unsigned int channel, unsigned int size, unsigned int cfg, plp_task_t task);

void plp_periph_copy_start(plp_copy_t *copy);

void plp_periph_copy_stop(plp_copy_t *copy);

unsigned int plp_periph_copy_get(plp_copy_t *copy);

void plp_periph_copy_push(plp_copy_t *copy);

void plp_periph_copy_flush(plp_copy_t *copy);

void plp_periph_copy_deinit(plp_copy_t *copy);


#endif