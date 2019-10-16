/*
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_TRANSCEIVER_H__
#define __HAL_TRANSCEIVER_H__

#include <archi/pulp.h>
#include "archi/transceiver.h"

#define RF_RX_SADDR            (UDMA_BASE_ADDR + RF_RX_SADDR_OFFSET)
#define RF_RX_SIZE             (UDMA_BASE_ADDR + RF_RX_SIZE_OFFSET)
#define RF_RX_CFG              (UDMA_BASE_ADDR + RF_RX_CFG_OFFSET)
#define RF_RX_INTCFG           (UDMA_BASE_ADDR + UDMA_CHANNEL_RX_OFFSET)

#define RF_TX_SADDR            (UDMA_BASE_ADDR + RF_TX_SADDR_OFFSET)
#define RF_TX_SIZE             (UDMA_BASE_ADDR + RF_TX_SIZE_OFFSET)
#define RF_TX_CFG              (UDMA_BASE_ADDR + RF_TX_CFG_OFFSET)
#define RF_TX_INTCFG           (UDMA_BASE_ADDR + RF_TX_INTCFG_OFFSET)

#define RF_CFG                 (UDMA_BASE_ADDR + RF_CFG_OFFSET)
#define RF_GPIO                (UDMA_BASE_ADDR + RF_GPIO_OFFSET)
#define RF_STATUS              (UDMA_BASE_ADDR + RF_STATUS_OFFSET)

/*
 * set Transceiver IP configuration with value
 */
inline void plp_rf_udma_cfg_set(unsigned short value)
{
  pulp_write32(RF_CFG, value & RF_CFG_MASK);
}

/*
 * Get Transceiver IP configuration
 */
inline unsigned short plp_rf_udma_cfg_get()
{
  return (unsigned short) pulp_read32(RF_CFG) & RF_CFG_MASK;
}

/*
 * Get Tranceiver IP status register (rx_sync_flag)
 */
inline unsigned char plp_rf_udma_status_get()
{
  return (unsigned char) pulp_read32(RF_STATUS) & RF_STATUS_MASK;
}

#endif
