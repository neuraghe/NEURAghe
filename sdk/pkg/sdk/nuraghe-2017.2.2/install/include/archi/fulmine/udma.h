/*
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __ARCHI_FULMINE_UDMA_H__
#define __ARCHI_FULMINE_UDMA_H__

#define PLP_UDMA_HAS_SPIM 1
#define PLP_UDMA_HAS_UART 1
#define PLP_UDMA_HAS_I2C  1

#define UDMA_SPIM_OFFSET(id)          (0x000 + 0x300*(id))
#define UDMA_UART_OFFSET(id)          (0x80)
#define UDMA_I2C_OFFSET(id)           (0x180 + 0x10*(id))
     
#define UDMA_SPIM_RX_ADDR(id)         (UDMA_BASE_ADDR + UDMA_SPIM_OFFSET(id) + UDMA_CHANNEL_RX_OFFSET)
#define UDMA_SPIM_TX_ADDR(id)         (UDMA_BASE_ADDR + UDMA_SPIM_OFFSET(id) + UDMA_CHANNEL_TX_OFFSET)
#define UDMA_UART_RX_ADDR(id)         (UDMA_BASE_ADDR + UDMA_UART_OFFSET(id) + UDMA_CHANNEL_RX_OFFSET)
#define UDMA_UART_TX_ADDR(id)         (UDMA_BASE_ADDR + UDMA_UART_OFFSET(id) + UDMA_CHANNEL_TX_OFFSET)
#define UDMA_I2C_CMD_ADDR(id)         (UDMA_BASE_ADDR + UDMA_I2C_OFFSET(0))
#define UDMA_I2C_DATA_ADDR(id)        (UDMA_BASE_ADDR + UDMA_I2C_OFFSET(1))

#define UDMA_EVT_SPIM_TX                 0
#define UDMA_EVT_SPIM_RX                 1
#define UDMA_EVT_SPIM_EOT                2
#define UDMA_EVT_UART_TX                 3
#define UDMA_EVT_UART_RX                 4
#define UDMA_EVT_I2C_TX                  5
#define UDMA_EVT_I2C_RX                  6
#define UDMA_EVT_I2S_CH0                 7
#define UDMA_NB_INTERNAL_EVENTS          14
#define UDMA_NB_EVENTS                   11

#endif