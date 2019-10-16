/*
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __ARCHI_TRANSCEIVER_H__
#define __ARCHI_TRANSCEIVER_H__

#define RF_CFG_CHANNEL_CUSTOM_OFFSET    0x00
#define RF_GPIO_CHANNEL_CUSTOM_OFFSET   0x04
#define RF_STATUS_CHANNEL_CUSTOM_OFFSET 0x08

#define RF_CFG_OFFSET          (UDMA_RF_OFFSET + UDMA_CHANNEL_CUSTOM_OFFSET + RF_CFG_CHANNEL_CUSTOM_OFFSET)
#define RF_GPIO_OFFSET         (UDMA_RF_OFFSET + UDMA_CHANNEL_CUSTOM_OFFSET + RF_GPIO_CHANNEL_CUSTOM_OFFSET)
#define RF_STATUS_OFFSET       (UDMA_RF_OFFSET + UDMA_CHANNEL_CUSTOM_OFFSET + RF_STATUS_CHANNEL_CUSTOM_OFFSET)

#define RF_CFG_TX_ENB_OFFSET    0 //enable TX LVDS pad, output enable, active low
#define RF_CFG_TX_OEB_OFFSET    1 //enable TX LVDS pad output, power down, active low
#define RF_CFG_TX_MODE_OFFSET   2 //configuration for the TX lvds pads, core voltage select: 0=>VDD=1V, 1=>VDD=1.2V
#define RF_CFG_TX_VSEL_OFFSET   3 //configuration for the TX lvds pads, high current(1)/low current out(0)
#define RF_CFG_RX_ENB_OFFSET    4 //enable RX LVDS pad
#define RF_CFG_SD_RX_EN_OFFSET  5 //enable RX the serdes IPs
#define RF_CFG_SD_TX_EN_OFFSET  6 //enable TX serializer IP
#define RF_CFG_DDR_RX_EN_OFFSET 7 //not used
#define RF_CFG_DDR_TX_EN_OFFSET 8 //not used
#define RF_CFG_CLKSEL_OFFSET    9 //selects the tx clock(0 uses the RX clock, 1 uses the SoC clock)
#define RF_CFG_MODE_OFFSET     10 //use to switch IQ configuration for at86rf215 with bit0 or more standard without this bit0
#define RF_CFG_MODE_VAL_OFFSET 11 //configure the I bit0 so the bit16 in [31:0]; 1 means at86rf215 to start an immediate TX in case its register RF_IQIFC0.EEC(bit0)=1
#define RF_CFG_MODE_RX_OFFSET   12 //0 enable, 1 disable synchro bits detection on the LVDS Rx. Enabled means 2 bits of synchronization on the MSB of 16bits IQ as for at86rf215. Disable means potential of 16 bits data versus 13bits for at86rf215
#define RF_CFG_MASK            0x1FFF

#define RF_MASK_GEN_B(offset)   ((~(1 << offset)) & RF_CFG_MASK)
#define RF_CFG_TX_ENB_MASK_B    RF_MASK_GEN_B(RF_CFG_TX_ENB_OFFSET)
#define RF_CFG_TX_OEB_MASK_B    RF_MASK_GEN_B(RF_CFG_TX_OEB_OFFSET)
#define RF_CFG_TX_MODE_MASK_B   RF_MASK_GEN_B(RF_CFG_TX_MODE_OFFSET)
#define RF_CFG_TX_VSEL_MASK_B   RF_MASK_GEN_B(RF_CFG_TX_VSEL_OFFSET)
#define RF_CFG_RX_ENB_MASK_B    RF_MASK_GEN_B(RF_CFG_RX_ENB_OFFSET)
#define RF_CFG_SD_RX_EN_MASK_B  RF_MASK_GEN_B(RF_CFG_SD_RX_EN_OFFSET)
#define RF_CFG_SD_TX_EN_MASK_B  RF_MASK_GEN_B(RF_CFG_SD_TX_EN_OFFSET)
#define RF_CFG_DDR_RX_EN_MASK_B RF_MASK_GEN_B(RF_CFG_DDR_RX_EN_OFFSET)
#define RF_CFG_DDR_TX_EN_MASK_B RF_MASK_GEN_B(RF_CFG_DDR_TX_EN_OFFSET)
#define RF_CFG_CLKSEL_MASK_B    RF_MASK_GEN_B(RF_CFG_CLKSEL_OFFSET)
#define RF_CFG_MODE_MASK_B      RF_MASK_GEN_B(RF_CFG_MODE_OFFSET)
#define RF_CFG_MODE_VAL_MASK_B  RF_MASK_GEN_B(RF_CFG_MODE_VAL_OFFSET)
#define RF_CFG_MODE_RX_MASK_B   RF_MASK_GEN_B(RF_CFG_MODE_RX_OFFSET)

#define RF_STATUS_RX_SYNC_FLAG_OFFSET  0 //read only synchronisation flag, indicating at 1 that the transceiver IP is synchronized in Rx with external RF transceiver chip (at86rf215 synchronization)
#define RF_STATUS_MASK 1

#endif
