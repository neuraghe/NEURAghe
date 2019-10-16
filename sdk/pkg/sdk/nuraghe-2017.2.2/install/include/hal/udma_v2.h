/*
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_UDMA_V1_H__
#define __HAL_UDMA_V1_H__

#include "hal/pulp.h"

/** @name UDMA HAL
 * The following API can be used to manage the generic part of the UDMA, i.e. for global configuration and channel enqueueing. Other HALs are available for peripheral specific parts.
 * The UDMA is in charge of moving data between peripherals and L2 memory. In order to better pipeline transfers and not loose any data between 2 transfers, 2 transfers at the same time
 * can be enqueued in the UDMA. Once the first one is finished, the UDMA starts the second, while the application should enqueue another one to always have 2 pending.
 * By default, all peripherals are clock-gated and must be explicitly activated before being used.
 * The UDMA can use input events to automatically trigger other actions like enqueuing a new transfer.
 */
/**@{*/

/** Tell if a new transfer canbe enqueued to a UDMA channel.
 * 
  \param   channelOffset   Offset of the channel
  \return         1 if another transfer can be enqueued, 0 otherwise
  */
static inline int plp_udma_canEnqueue(unsigned int channelOffset);

/** Enqueue a new transfer to a UDMA channel.
 * 
  \param   channelOffset Offset of the channel
  \param   l2Addr        Address in L2 memory where the data must be accessed (either stored or loaded)
  \param   size          Size in bytes of the transfer
  \param   cfg           Configuration of the transfer. Can be UDMA_CHANNEL_CFG_SIZE_8, UDMA_CHANNEL_CFG_SIZE_16 or UDMA_CHANNEL_CFG_SIZE_32
  */
static inline void plp_udma_enqueue(unsigned channelOffset, unsigned int l2Addr, unsigned int size, unsigned int cfg);

/** Tell if a channel is busy, i.e. if it already contains at least one on-going transfer
 * 
  \param   channelOffset Offset of the channel
  \return  1 if the channel is busy, 0 otherwise
  */
static inline int plp_udma_busy(unsigned channelOffset);

/** Configures peripheral clock-gating.
 * 
  \param   value    New configuration. There is 1 bit per peripheral, 0 means the peripheral is clock-gated. The bit number corresponds to the channel ID of the peripheral.
  */
static inline void plp_udma_cg_set(unsigned int value);

/** Returns peripheral clock-gating.
 * 
  \return The current clock-gating configuration.
  */
static inline unsigned int plp_udma_cg_get();

/** Configures input events
 * 4 input events can be configured. Each input event is made of 8 bits specifying which global event this local event refers to. This can then be used in some UDMA commands to refer to the global event.
 * 
  \param value  The new configuration. Each event is encoded on 8 bits so that it can contain a global event ID between 0 and 255.
  */
static inline void plp_udma_evtin_set(unsigned int value);

/** Returns input events configuration.
 * 
  \return The current input events configuration.
  */
static inline unsigned int plp_udma_evtin_get();

#include "hal/udma_periph_v2.h"

//!@}

/// @cond IMPLEM

static inline int plp_udma_canEnqueue(unsigned int channelBase)
{
  return !(pulp_read32(channelBase + UDMA_CHANNEL_CFG_OFFSET) & UDMA_CHANNEL_CFG_SHADOW);
}

static inline void plp_udma_enqueue(unsigned channelBase, unsigned int l2Addr, unsigned int size, unsigned int cfg)
{
  pulp_write32(channelBase + UDMA_CHANNEL_SADDR_OFFSET, l2Addr);
  pulp_write32(channelBase + UDMA_CHANNEL_SIZE_OFFSET, size);
  pulp_write32(channelBase + UDMA_CHANNEL_CFG_OFFSET, cfg | UDMA_CHANNEL_CFG_EN);
}

static inline int plp_udma_busy(unsigned channelOffset)
{
  return (pulp_read32(channelOffset + UDMA_CHANNEL_CFG_OFFSET) & UDMA_CHANNEL_CFG_EN);
}

static inline void plp_udma_cg_set(unsigned int value) {
  pulp_write32(UDMA_BASE_ADDR + UDMA_CONF_OFFSET + UDMA_CONF_CG_OFFSET, value);
}

 static inline unsigned int plp_udma_cg_get() {
  return pulp_read32(UDMA_BASE_ADDR + UDMA_CONF_OFFSET + UDMA_CONF_CG_OFFSET);
}

static inline void plp_udma_evtin_set(unsigned int value) {
  pulp_write32(UDMA_BASE_ADDR + UDMA_CONF_OFFSET + UDMA_CONF_EVTIN_OFFSET, value);
}

static inline unsigned int plp_udma_evtin_get() {
  return pulp_read32(UDMA_BASE_ADDR + UDMA_CONF_OFFSET + UDMA_CONF_EVTIN_OFFSET);
}

/// @endcond

#endif
