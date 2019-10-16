/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_EU_V2_H__
#define __HAL_EU_V2_H__
 
#include <archi/eu_v2.h>    
#include <hal/pulp_io.h>
#include <archi/pulp.h>     

/*
 * Event unit
 */

static inline void pulp_evt_wait() {
  pulp_write32(PULP_CLUSTER_BASE + PULP_DEMUX_OFFSET + PULP_DEMUX_CORE_CLKGATE_OFFSET, 1);
  __asm volatile("l.psync");
}

#ifndef __HOST__
static inline void pulp_evt_activate(unsigned int event) {
  unsigned int addr = PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET + PULP_EV_MASK_LOW + plp_coreId() * 4;
  unsigned int mask = pulp_read32(addr);
  pulp_write32(addr, mask | (1 << event));
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
#endif

static inline void pulp_evtmask_wait_base(unsigned int base, unsigned int eventMask) {
  unsigned int oldMask = pulp_read32(base + PULP_CKGATE_OFFSET + PULP_EV_MASK_LOW + plp_coreId() * 4);
  pulp_write32(base + PULP_CKGATE_OFFSET + PULP_EV_MASK_LOW + plp_coreId() * 4, eventMask);
  pulp_write32(base + PULP_CKGATE_OFFSET + PULP_CORE_CLKGATE, plp_coreId());
  __asm volatile("l.psync");
  pulp_write32(base + PULP_CKGATE_OFFSET + PULP_EV_MASK_LOW + plp_coreId() * 4, oldMask);
}

static inline void pulp_fc_gpevt_wait(unsigned int event) {
  pulp_evtmask_wait_base(0x50200000, 1 << event);
}

#ifndef __HOST__
static inline void pulp_gpevt_wait(unsigned int event) {
  pulp_evtmask_wait(1 << event);
}
#endif

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

#ifndef __HOST__
static inline void eu_evt_maskWaitAndClr(int event)
{
  pulp_evtmask_wait(event);
  pulp_gpevtmask_clear(event);
}
#endif

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



#include "mcu_v1.h"

static inline unsigned int ckg_irq_id_read(unsigned base, int coreid){
  return pulp_read32(base + CKG_CKGATE_OFFSET + CKG_READ_IRQ_ID_BASE  + 4*coreid);
}

static inline unsigned int ckg_irq_buff_low_read(unsigned base, int coreid){
  return pulp_read32(base + CKG_CKGATE_OFFSET + CKG_IRQ_BUFFER_LOW_BASE  + 4*coreid);
}

static inline unsigned int ckg_irq_buff_high_read(unsigned base, int coreid){
  return pulp_read32(base + CKG_CKGATE_OFFSET + CKG_IRQ_BUFFER_HIGH_BASE  + 4*coreid);
}

static inline void ckg_irq_buff_low_clear(unsigned base, unsigned int mask )  {
  pulp_write32(base + CKG_DEMUX_OFFSET + CKG_DEMUX_IRQ_BUFFER_CLEAR_OFFSET, mask); 
}

static inline unsigned int ckg_irq_mask_low_read(unsigned base, int coreid  )  {  
  return pulp_read32(base + CKG_CKGATE_OFFSET + CKG_IRQ_MASK_LOW_BASE + 4*coreid) ; 
}

static inline unsigned int ckg_irq_mask_high_read(unsigned base, int coreid )  {
  return pulp_read32(base + CKG_CKGATE_OFFSET + CKG_IRQ_MASK_HIGH_BASE+ 4*coreid );
}

static inline void ckg_irq_mask_low_set(unsigned base, int coreid , unsigned int mask )  {
  pulp_write32(base + CKG_CKGATE_OFFSET + CKG_IRQ_MASK_LOW_BASE + 4*coreid, mask); 
}

static inline void ckg_irq_mask_high_set(unsigned base, int coreid , unsigned int mask )  {
  pulp_write32(base + CKG_CKGATE_OFFSET + CKG_IRQ_MASK_HIGH_BASE + 4*coreid, mask);  
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





// TODO this is not aligned with PULP
static inline void fc_eu_trig(unsigned int event) {
  pulp_write32(0x50200000 + PULP_CKGATE_OFFSET + PULP_EVNT_GEN, 1 << event);
}


#endif
