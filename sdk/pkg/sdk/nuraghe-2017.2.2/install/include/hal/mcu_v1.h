/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_MCU_H__
#define __HAL_MCU_H__

#include <archi/archi_mcu.h>
#include <archi/archi_spim2.h>

#define hal_write8(add, val_) (*(volatile unsigned char *)(add) = val_)
#define hal_write16(add, val_) (*(volatile unsigned short *)(add) = val_)
#define hal_write32(add, val_) (*(volatile unsigned int *)(add) = val_)
#define hal_write(add, val_) (*(volatile unsigned int *)(add) = val_)

#define hal_read8(add) (*(volatile unsigned char *)(add))
#define hal_read16(add) (*(volatile unsigned short *)(add))
#define hal_read32(add) (*(volatile unsigned int *)(add))
#define hal_read(add) (*(volatile unsigned int *)(add))


static inline unsigned int mcu_spim_base() {
  return MCU_SPIM_BASE;
}

static inline void spim2_setup_cmd_addr(unsigned int spiBase, int cmd, int cmdlen, int addr, int addrlen) {
  int cmd_reg;
  cmd_reg = cmd << (32-cmdlen);
  hal_write32(spiBase + SPIM2_REG_SPICMD, cmd_reg);
  hal_write32(spiBase + SPIM2_REG_SPIADR, addr);
  hal_write32(spiBase + SPIM2_REG_SPILEN, (cmdlen & 0x3F) | ((addrlen << 8) & 0x3F00));
}

static inline void spim2_set_datalen(unsigned int spiBase, int datalen) {
  hal_write32(spiBase + SPIM2_REG_SPILEN2, datalen);
}

static inline void spim2_start_transaction(unsigned int spiBase, int trans_type, int csnum) {
  hal_write32(spiBase + SPIM2_REG_STATUS, ((1 << (csnum + 8)) & 0xF00) | ((1 << trans_type) & 0xFF));
}

static inline unsigned int spim2_status(unsigned int spiBase) {
  return hal_read32(spiBase + SPIM2_REG_STATUS);
}

static inline void spim2_clkdiv(unsigned int spiBase, unsigned int clkdiv) {
  hal_write32(spiBase + SPIM2_REG_CLKDIV, clkdiv);
}

#endif
