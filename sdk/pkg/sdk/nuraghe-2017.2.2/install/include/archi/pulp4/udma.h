/*
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __ARCHI_PULP4_UDMA_H__
#define __ARCHI_PULP4_UDMA_H__

#define PLP_UDMA_HAS_SPIM 1
#define PLP_UDMA_HAS_UART 1
#define PLP_UDMA_HAS_I2C  1
#define PLP_UDMA_HAS_I2S  1
#define PLP_UDMA_HAS_CAM 1

#define UDMA_SPIM_ID(id)            (1 + (id))
#define UDMA_UART_ID(id)            4
#define UDMA_I2C_ID(id)             (5 + (id))
#define UDMA_I2S_ID(id)             8
#define UDMA_CAM_ID(id)             9

#define UDMA_SPIM_OFFSET(id)          UDMA_PERIPH_OFFSET(UDMA_SPIM_ID(id))
#define UDMA_UART_OFFSET(id)          UDMA_PERIPH_OFFSET(UDMA_UART_ID(id))
#define UDMA_I2C_OFFSET(id)           UDMA_PERIPH_OFFSET(UDMA_I2C_ID(id))
#define UDMA_I2S_OFFSET(id)           UDMA_PERIPH_OFFSET(UDMA_I2S_ID(id))
#define UDMA_CAM_OFFSET(id)           UDMA_PERIPH_OFFSET(UDMA_CAM_ID(id))
     
#define UDMA_SPIM_RX_ADDR(id)         (UDMA_BASE_ADDR + UDMA_SPIM_OFFSET(id) + UDMA_CHANNEL_RX_OFFSET)
#define UDMA_SPIM_TX_ADDR(id)         (UDMA_BASE_ADDR + UDMA_SPIM_OFFSET(id) + UDMA_CHANNEL_TX_OFFSET)
#define UDMA_UART_RX_ADDR(id)         (UDMA_BASE_ADDR + UDMA_UART_OFFSET(id) + UDMA_CHANNEL_RX_OFFSET)
#define UDMA_UART_TX_ADDR(id)         (UDMA_BASE_ADDR + UDMA_UART_OFFSET(id) + UDMA_CHANNEL_TX_OFFSET)
#define UDMA_I2C_CMD_ADDR(id)         (UDMA_BASE_ADDR + UDMA_I2C_OFFSET(id) + UDMA_CHANNEL_TX_OFFSET)
#define UDMA_I2C_DATA_ADDR(id)        (UDMA_BASE_ADDR + UDMA_I2C_OFFSET(id) + UDMA_CHANNEL_RX_OFFSET)
#define UDMA_I2S_ADDR(id)             (UDMA_BASE_ADDR + UDMA_I2S_OFFSET(id))
#define UDMA_CAM_RX_ADDR(id)          (UDMA_BASE_ADDR + UDMA_CAM_OFFSET(id) + UDMA_CHANNEL_RX_OFFSET)
#define UDMA_CAM_CUSTOM_ADDR(id)      (UDMA_BASE_ADDR + UDMA_CAM_OFFSET(id) + UDMA_CHANNEL_CUSTOM_OFFSET)


#define UDMA_NB_EVENTS          19

#endif