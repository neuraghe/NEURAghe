/*
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_UDMA_PERIPH_V2_H__
#define __HAL_UDMA_PERIPH_V2_H__

#include <hal/pulp.h>
#include <stdint.h>

/*
 * TCDM
 */
#ifdef PLP_UDMA_HAS_TCDM

static inline void plp_tcdm_setDst(unsigned int addr)
{
  pulp_write32(UDMA_BASE_ADDR + UDMA_TCDM_OFFSET + UDMA_CHANNEL_CUSTOM_OFFSET + TCDM_T_DST_SADDR, addr);
}

static inline void plp_tcdm_setSrc(unsigned int addr)
{
  pulp_write32(UDMA_BASE_ADDR + UDMA_TCDM_OFFSET + UDMA_CHANNEL_CUSTOM_OFFSET + TCDM_T_SRC_SADDR, addr);
}

static inline void plp_udma_enqueue_toTcdm(unsigned int l2Addr, unsigned int fcTcdmAddr, unsigned int size, unsigned int cfg)
{
  plp_tcdm_setDst(fcTcdmAddr);
  plp_udma_enqueue(UDMA_TCDM_TX_ADDR, l2Addr, size, cfg);
}

static inline void plp_udma_enqueue_fromTcdm(unsigned int l2Addr, unsigned int fcTcdmAddr, unsigned int size, unsigned int cfg)
{
  plp_tcdm_setSrc(fcTcdmAddr);
  plp_udma_enqueue(UDMA_TCDM_RX_ADDR, l2Addr, size, cfg);
}


#endif

/*
 * CAM
 */
#ifdef PLP_UDMA_HAS_CAM

static inline void plp_cam_glob_set(int enabled, int frameDropEn, int nbFrameDrop, int frameSliceEn, int format, int shift)
{
  unsigned int value = (enabled << CAM_CFG_GLOB_EN_BIT) | (frameDropEn << CAM_CFG_GLOB_FRAMEDROP_EN_BIT) | (nbFrameDrop << CAM_CFG_GLOB_FRAMEDROP_VAL_BIT) | (format << CAM_CFG_GLOB_FORMAT_BIT) | (shift << CAM_CFG_GLOB_SHIFT_BIT);
  pulp_write32(UDMA_BASE_ADDR + UDMA_CAM_OFFSET(0) + UDMA_CHANNEL_CUSTOM_OFFSET + CAM_GLOB_OFFSET, value);
}

#endif

/*
 * I2S
 */

#ifdef PLP_UDMA_HAS_I2S

static inline void plp_i2s_channelModes(unsigned int channel0, unsigned int channel1, unsigned int channel2, unsigned int channel3)
{
  unsigned int value = (channel0 << 0) |  (channel1 << 2) |  (channel2 << 4) |  (channel3 << 6);
  pulp_write32(UDMA_BASE_ADDR + UDMA_I2S_OFFSET(0) + UDMA_CHANNEL_CUSTOM_OFFSET + I2S_CHMODE_OFFSET, value);
}

static inline void plp_i2s_useDdr(int use)
{
  unsigned int base = UDMA_BASE_ADDR + UDMA_I2S_OFFSET(0) + UDMA_CHANNEL_CUSTOM_OFFSET + I2S_CHMODE_OFFSET;
  pulp_write32(base, (pulp_read32(base) & (~I2S_CHMODE_CH0_USEDDR_MASK)) | (use << I2S_CHMODE_CH0_USEDDR_OFFSET));
}

#endif



/*
 * UART
 */

#ifdef PLP_UDMA_HAS_UART

/**
 * Setup UART. The UART defaults to 8 bit character mode with 1 stop bit.
 *
 * parity       Enable/disable parity mode
 * clk_counter  Clock counter value that is used to derive the UART clock.
 *              There is a prescaler in place that already divides the SoC
 *              clock by 16.  Since this is a counter, a value of 0 means that
 *              the SoC clock divided by 16 is used. A value of 31 would mean
 *              that we use the SoC clock divided by 16*32 = 512.
 */

static inline void plp_uart_setup(int parity, uint16_t clk_counter)
{

  // [31:16]: clock divider (from SoC clock)
  // [9]: RX enable
  // [8]: TX enable
  // [3]: stop bits  0 = 1 stop bit
  //                 1 = 2 stop bits
  // [2:1]: bits     00 = 5 bits
  //                 01 = 6 bits
  //                 10 = 7 bits
  //                 11 = 8 bits
  // [0]: parity

  unsigned int val = 0x0306 | parity; // both tx and rx enabled; 8N1 configuration; 1 stop bits

  val |= ((clk_counter*16) << 16);

  pulp_write32(UDMA_BASE_ADDR + UDMA_UART_OFFSET(0) + UDMA_CHANNEL_CUSTOM_OFFSET + UART_SETUP_OFFSET, val);
}

#endif

#endif
