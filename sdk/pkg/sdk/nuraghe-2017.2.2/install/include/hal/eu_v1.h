/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_EU_V1_H__
#define __HAL_EU_V1_H__

#include "events_ids.h"
#include "hal/pulp.h"

static inline void pulp_evt_wait() {
  pulp_write32(PULP_CLUSTER_BASE + PULP_DEMUX_OFFSET + PULP_DEMUX_CORE_CLKGATE_OFFSET, 1);
#ifdef __riscv__
  asm volatile ("nop;nop;wfi");
#else
  __asm volatile("l.psync");
#endif
}

static inline void pulp_evt_activate(unsigned int event) {
  unsigned int addr = PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_EV_MASK_LOW + plp_coreId() * 4;
  unsigned int mask = pulp_read32(addr);
  pulp_write32(addr, mask | (1 << event));
}

static inline void pulp_evtmask_wait_base(unsigned int base, unsigned int eventMask) {
  unsigned int oldMask = pulp_read32(base + PULP_CKGATE_OFFSET + PULP_EV_MASK_LOW + plp_coreId() * 4);
  pulp_write32(base + PULP_CKGATE_OFFSET + PULP_EV_MASK_LOW + plp_coreId() * 4, eventMask);
  pulp_write32(base + PULP_CKGATE_OFFSET + PULP_CORE_CLKGATE, plp_coreId());
#ifdef __riscv__
  asm volatile ("nop;nop;wfi");
#else
  __asm volatile("l.psync");
#endif
  pulp_write32(base + PULP_CKGATE_OFFSET + PULP_EV_MASK_LOW + plp_coreId() * 4, oldMask);
}

static inline void pulp_evtMask_set_base(int base, unsigned int eventMask) {
  pulp_write32(base + PULP_EV_MASK_LOW, eventMask);
}

static inline void pulp_evtMask_set(unsigned int eventMask) {
  pulp_write32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_EV_MASK_LOW + plp_coreId() * 4, eventMask);
}

static inline unsigned pulp_evtMask_get() {
  return pulp_read32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_EV_MASK_LOW + plp_coreId() * 4);
}

static inline void pulp_evtmask_wait(unsigned int eventMask) {
  unsigned int oldMask = pulp_evtMask_get();
  pulp_evtMask_set(eventMask);
  pulp_evt_wait();
  pulp_evtMask_set(oldMask);
}

static inline void pulp_fc_gpevt_wait(unsigned int event) {
  pulp_evtmask_wait_base(0x50200000, 1 << event);
}

static inline void pulp_gpevt_wait(unsigned int event) {
  pulp_evtmask_wait(1 << event);
}

static inline void pulp_gpevt_trigger_remote(unsigned int event) {
  pulp_write32(PULP_CLUSTER_REMOTE_BASE(0) + PULP_CKGATE_REMOTE_OFFSET + PULP_EVNT_GEN, 1 << event);
}

static inline void pulp_gpevt_trigger_cluster(unsigned int cid, unsigned int event) {
  pulp_write32(PULP_CLUSTER_REMOTE_BASE(cid) + PULP_CKGATE_REMOTE_OFFSET + PULP_EVNT_GEN, 1 << event);
}

static inline void pulp_fc_gpevt_trigger(unsigned int event) {
  pulp_write32(0x50000000 + PULP_CKGATE_OFFSET + PULP_EVNT_GEN, 1 << event);
}

static inline void pulp_gpevt_triggerCoreSet(unsigned int event, unsigned int coreSet) {
  pulp_write32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_EVNT_GEN_GP0 + ((event - 1) << 2), coreSet);
}

static inline void pulp_gpevt_clear_base(unsigned int base, unsigned int event) {
  // On pulp 3 we can clear all events specified in the mask in one shot
  pulp_write32(base + PULP_CKGATE_OFFSET + PULP_EV_BUFFER_LOW + plp_coreId()*4, 1 << event);
}

static inline void pulp_gpevt_clear(unsigned int event) {
  pulp_write32(PULP_CLUSTER_BASE + PULP_DEMUX_OFFSET + PULP_DEMUX_EV_BUFFER_CLEAR_OFFSET, 1 << event);
}

static inline void pulp_gpevtmask_clear(unsigned int event) {
  pulp_write32(PULP_CLUSTER_BASE + PULP_DEMUX_OFFSET + PULP_DEMUX_EV_BUFFER_CLEAR_OFFSET, event);
}

static inline void eu_evt_maskWaitAndClr(int mask)
{
  pulp_evtmask_wait(mask);
  pulp_gpevtmask_clear(mask);
}

static inline void pulp_fc_gpevt_clear(unsigned int event) {
  pulp_gpevt_clear_base(0x50200000, event);
}

static inline unsigned int pulp_gpevt_status_base(unsigned int base) {
  return pulp_read32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_EV_BUFFER_LOW + plp_coreId()*4);
}

static inline unsigned int pulp_gpevt_status() {
  return pulp_gpevt_status_base(PULP_CLUSTER_BASE);
}

static inline unsigned int pulp_fc_gpevt_status() {
  return pulp_gpevt_status_base(0x50200000);
}


/** @name SW event trigger.
 *  Functions for triggering SW events which can be used to wake-up cluster cores from SW.
 */
/**@{*/

static inline unsigned int eu_evt_trig_cluster_addr(int cluster, int event)
{
  return PULP_CLUSTER_BASE_ADDR(cluster) + PULP_CKGATE_OFFSET + PULP_EVNT_GEN_GP0 + ((event - 1) << 2);
}

static inline unsigned int eu_evt_trig_remote_addr(int event)
{
  return eu_evt_trig_cluster_addr(0, event);
}

static inline unsigned int eu_evt_trig_addr(int event)
{
  return PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_EVNT_GEN_GP0 + ((event - 1) << 2);
}

static inline void eu_evt_trig(unsigned int evtAddr, unsigned int coreSet)
{
  pulp_write32(evtAddr, coreSet);
}

//!@}

/*
 * Interrupt 
 */
static inline unsigned int pulp_irq_id_read(int coreid){
  return pulp_read32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_READ_IRQ_ID_BASE  + 4*coreid);
}


static inline unsigned int pulp_irq_buff_low_read(int coreid){
  return pulp_read32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_IRQ_BUFFER_LOW_BASE  + 4*coreid);
}

static inline unsigned int pulpe_irq_buff_high_read(int coreid){
  return pulp_read32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_IRQ_BUFFER_HIGH_BASE  + 4*coreid);
}

static inline void pulp_irq_buff_low_clear( unsigned int mask )  {
  pulp_write32(PULP_CLUSTER_BASE + PULP_DEMUX_OFFSET + PULP_DEMUX_IRQ_BUFFER_CLEAR_OFFSET, mask); 
}

static inline unsigned int pulp_irq_mask_low_read( int coreid  )  {  
  return pulp_read32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_IRQ_MASK_LOW_BASE + 4*coreid) ; 
}

static inline unsigned int pulp_irq_mask_high_read( int coreid )  {
  return pulp_read32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_IRQ_MASK_HIGH_BASE+ 4*coreid );
}

static inline void pulp_irq_mask_low_set( int coreid , unsigned int mask )  {
  pulp_write32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_IRQ_MASK_LOW_BASE + 4*coreid, mask); 
}

static inline void pulp_irq_mask_high_set( int coreid , unsigned int mask )  {
  pulp_write32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_IRQ_MASK_HIGH_BASE + 4*coreid, mask);  
}

static inline void eu_irq_maskSet(unsigned int irqMask)
{
  int coreId = plp_coreId();
  pulp_irq_mask_low_set(coreId, pulp_irq_mask_low_read(coreId) | irqMask);
}




/*
 * BARRIERS
 */

static inline void pulp_barrier_notify(unsigned int barrier_id)  {
  pulp_write32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_CLKGATE_WAIT_BARRIER, barrier_id);
}

static inline unsigned int pulp_barrier_read(unsigned int barrier_id){
  return pulp_read32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_CLKGATE_SET_BARRIER+4*barrier_id);
}


static inline void pulp_barrier_setup(unsigned int barrier_id, unsigned int num_threads, unsigned int mask_to_trigg)  {
  pulp_write32(PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_CLKGATE_SET_BARRIER+4*barrier_id, (num_threads<<16)+mask_to_trigg);
}






static inline void eu_evt_maskSet_base(unsigned int base, unsigned int evtMask) {
  pulp_evtMask_set_base(base, evtMask);
}

static inline void eu_evt_maskSet(unsigned int evtMask)
{
  pulp_evtMask_set(pulp_evtMask_get() | evtMask);
}

static inline void eu_evt_maskClr(unsigned int evtMask)
{
  pulp_evtMask_set(pulp_evtMask_get() & ~evtMask);
}


static inline unsigned int eu_evt_wait()
{
  pulp_evt_wait();
  return pulp_gpevt_status() & pulp_evtMask_get();
}


static inline unsigned int eu_evt_getClusterBase(unsigned int coreId)
{
  return PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + coreId * 4;
}


// TODO this is not aligned with PULP
static inline void fc_eu_trig(unsigned int event) {
  pulp_write32(0x50200000 + PULP_CKGATE_OFFSET + PULP_EVNT_GEN, 1 << event);
}



#endif
