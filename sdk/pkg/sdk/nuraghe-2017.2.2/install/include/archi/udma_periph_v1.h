/*
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __ARCHI_UDMA_PERIPH_V1_H__
#define __ARCHI_UDMA_PERIPH_V1_H__


/*
 * I2S
 */

#ifdef PLP_UDMA_HAS_I2S

#define I2S_CHMODE_OFFSET                (0x00)
#define I2S_USEDDR_OFFSET                (0x04)
#define I2S_EXT_SETUP_OFFSET             (0x08)
#define I2S_CFG0_SETUP_OFFSET            (0x0C)
#define I2S_CFG1_SETUP_OFFSET            (0x10)

#endif


/*
 * UART
 */

#ifdef PLP_UDMA_HAS_UART

#define UART_SETUP_OFFSET                (0x00)
#define UART_STATUS_OFFSET               (0x0A)
 
#endif




/*
 * I2C
 */

#ifdef PLP_UDMA_HAS_I2C

#define I2C_CMD_START                    0x02
#define I2C_CMD_STOP                     0x04
#define I2C_CMD_RD_ACK                   0x08
#define I2C_CMD_RD_NACK                  0x10
#define I2C_CMD_WR                       0x20
#define I2C_CMD_WAIT                     0x40
#define I2C_CMD_RPT                      0x80

#define I2C_CMD_SETUP_ENABLE_BIT           8

// Channel clock modes
// Write strobe is the clock for switching left/right channels
#define I2S_CHMODE_INT_CLOCK0        0    // Internal clock 0
#define I2S_CHMODE_INT_CLOCK1        1    // Internal clock 1
#define I2S_CHMODE_EXT_CLOCK_INT_WS  2    // External clock internal write strobe
#define I2S_CHMODE_EXT_CLOCK_EXT_WS  3    // External clock external write strobe


#endif




/*
 * SPIM
 */

#ifdef PLP_UDMA_HAS_SPIM

#define SPIM_RX_SADDR_OFFSET             0x000
#define SPIM_RX_SIZE_OFFSET              0x004
#define SPIM_RX_CFG_OFFSET               0x008
#define SPIM_RX_INTCFG_OFFSET            0x00C

#define SPIM_TX_SADDR_OFFSET             0x010
#define SPIM_TX_SIZE_OFFSET              0x014
#define SPIM_TX_CFG_OFFSET               0x018
#define SPIM_TX_INTCFG_OFFSET            0x01C

#define SPIM_STATUS_OFFSET               0x000
#define SPIM_CLKDIV_OFFSET               0x004
#define SPIM_SPICMD_OFFSET               0x008
#define SPIM_SPIADR_OFFSET               0x00C
#define SPIM_SPILEN_OFFSET               0x010
#define SPIM_SPIDUM_OFFSET               0x014
#define SPIM_TXFIFO_OFFSET               0x018
#define SPIM_RXFIFO_OFFSET               0x01C


#define SPIM_STATUS_CSKEEP_BIT           16

#define SPIM_CMD_RD                      0
#define SPIM_CMD_WR                      1
#define SPIM_CMD_QRD                     2
#define SPIM_CMD_QWR                     3

#endif


#endif