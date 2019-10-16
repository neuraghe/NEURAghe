/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_SPI_V1_H__
#define __HAL_SPI_V1_H__

#ifndef __HOST__
#if defined(__MIA__) || defined(__PULP3__) || defined(__PULP4__)

static inline unsigned int pulp_spi_base(unsigned int clusterId) {
  return 0x10000000 + PULP_SPI_OFFSET;
}

#endif

#if defined(__PULPEVO__)

static inline unsigned int pulp_spi_base(unsigned int clusterId) {
  return 0x10000000 + PULP_SPI_OFFSET;
}

#endif
#endif

#if defined(__MIA__) || defined(__PULP3__) || defined(__PULPEVO__) || defined(__PULP4__)

static inline void pulp_spi_setup_cmd_addr(unsigned int spiBase, int cmd, int cmdlen, int addr, int addrlen) {
  int cmd_reg;
  cmd_reg = cmd << (32-cmdlen);
  pulp_write32(spiBase + PULP_SPI_REG_SPICMD, cmd_reg);
  pulp_write32(spiBase + PULP_SPI_REG_SPIADR, addr);
  pulp_write32(spiBase + PULP_SPI_REG_SPILEN, (cmdlen & 0x3F) | ((addrlen << 8) & 0x3F00));
}

static inline void pulp_spi_set_datalen(unsigned int spiBase, int datalen) {
  volatile int old_len;
  old_len = pulp_read32(spiBase + PULP_SPI_REG_SPILEN);
  old_len = ((datalen << 16) & 0xFFFF0000) | (old_len & 0xFFFF);
  pulp_write32(spiBase + PULP_SPI_REG_SPILEN, old_len);
}

static inline void pulp_spi_start_transaction(unsigned int spiBase, int trans_type, int csnum) {
  pulp_write32(spiBase + PULP_SPI_REG_STATUS, ((1 << (csnum + 8)) & 0xF00) | ((1 << trans_type) & 0xFF));
}

static inline unsigned int pulp_spi_status(unsigned int spiBase) {
  return pulp_read32(spiBase + PULP_SPI_REG_STATUS);
}

static inline void pulp_spi_intcfg(unsigned int spiBase, unsigned int txThres, unsigned int rxThres, unsigned int txCounter, unsigned int rxCounter, int countEn, int intEn) {
  pulp_write32(spiBase + PULP_SPI_REG_INTCFG, (txThres << 0) | (rxThres << 8) | (txCounter << 16) | (rxCounter << 24) | (countEn << 30) | (intEn << 31));
}

static inline void pulp_spi_clkdiv(unsigned int spiBase, unsigned int clkdiv) {
  pulp_write32(spiBase + PULP_SPI_REG_CLKDIV, clkdiv);
}

#endif

#endif
