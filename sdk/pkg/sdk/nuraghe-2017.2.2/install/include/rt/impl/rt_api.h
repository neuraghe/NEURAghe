/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__IMPL__RT_API_H__
#define __RT__IMPL__RT_API_H__

void __plp_udma_enqueueFromDma(unsigned int arg);

int plpRtInit_fc();

 static inline void plp_bitfield_mask_init(unsigned int *bitfield, unsigned int mask) {
  *bitfield = mask;
 }

 static inline void plp_bitfield_init(unsigned int *bitfield, int nbBits) {
  if (nbBits == 32) *bitfield = 0xffffffff;
  else *bitfield = (1 << nbBits) - 1;
 }

 static inline void plp_bitfield_clear(unsigned int *bitfield) {
  *bitfield = 0;
 }

 static inline int plp_bitfield_get(unsigned int bitfield) {
#ifdef __riscv__
  int result = __builtin_pulp_ff1(bitfield);
  if (result == 32) return -1;
  else return result;
#else
  int result;
  __asm__ __volatile__ ("l.ff1\t\t%0,%1": "=r" (result) : "r" (bitfield));
  return result - 1;
#endif
 }

 static inline int plp_bitfield_alloc(unsigned int *bitfield) {
  int bit = plp_bitfield_get(*bitfield);
  if (bit == -1) return -1;
  *bitfield ^= 1<<bit;
  return bit;
 }

 static inline int plp_bitfield_reserve(unsigned int *bitfield, int id) {
  if (!(*bitfield & (1<<id))) {
    return -1;
  }
  *bitfield &= ~(1<<id);
  return 0;
 }

 static inline void plp_bitfield_free(unsigned int *bitfield, int id) {
  *bitfield |= 1 << id;
 }


 static inline unsigned int plp_tas_addr(unsigned int addr) {
  return addr + PULP_L1_TAS_OFFSET;
}

static inline void plp_swMutex_init(plp_swMutex_t *mutex)
{
  *(volatile unsigned int *)&mutex->lock = 0;
}

static inline int plp_swMutex_trylock(plp_swMutex_t *mutex) {
  __asm__ __volatile__ ("" : : : "memory");
  int result = *(volatile unsigned int *)plp_tas_addr((unsigned int)&mutex->lock);
  __asm__ __volatile__ ("" : : : "memory");
  return result;
}

static inline void plp_swMutex_lock(plp_swMutex_t *mutex)
{
  while (plp_swMutex_trylock(mutex)) {
    eu_evt_maskWaitAndClr(PLP_RT_SYNC_EVENT);
  }
}

static inline void plp_swMutex_unlock(plp_swMutex_t *mutex)
{
  __asm__ __volatile__ ("" : : : "memory");
  *(volatile unsigned int *)&mutex->lock = 0;
  __asm__ __volatile__ ("" : : : "memory");
  eu_evt_trig(eu_evt_trig_addr(PLP_RT_SYNC_EVENT), 0xffffffff);
}

#ifdef PLP_EU_HAS_HW_MUTEX
static inline int plp_hwMutex_alloc(plp_hwMutex_t *mutex)
{
  int id = plp_bitfield_alloc(&hwMutexAlloc);
  if (id == -1) return -1;
  else mutex->addr = eu_mutex_addr(id);
  eu_mutex_init(mutex->addr);
  return 0;
}

static inline void plp_hwMutex_lock(plp_hwMutex_t *mutex)
{
  eu_mutex_lock(mutex->addr);
}

static inline void plp_hwMutex_unlock(plp_hwMutex_t *mutex)
{
  eu_mutex_unlock(mutex->addr);
}
#endif

/* Enable interrupts */
static inline void plp_irq_enable()
{
#ifdef __riscv__
#if RISCV_VERSION >= 4
  __builtin_pulp_spr_write(0x300, 0x1<<3);
#else
  __builtin_pulp_spr_write(0x300, 0x1<<0);
#endif
  // asm("csrw 0x300, %0" : : "r" (0x1) );
#else
  or1k_mtspr(SPR_SR, or1k_mfspr(SPR_SR) | (SPR_SR_IEE));
#endif
}

static inline int plp_irq_clear()
{
#ifdef __riscv__
#if RISCV_VERSION >= 4
  return __builtin_pulp_read_then_spr_bit_clr(0x300, 0x1<<3);
#else
  return __builtin_pulp_read_then_spr_bit_clr(0x300, 0x1<<0);
#endif
#else
  unsigned int state = or1k_mfspr(SPR_SR);
  or1k_mtspr(SPR_SR, state & (~SPR_SR_IEE));
  return state;
#endif
}

static inline void plp_irq_disable()
{
#ifdef __riscv__
  __builtin_pulp_spr_write(0x300, 0x0);
  // asm("csrw 0x300, %0" : : "r" (0x0) );
#else
  or1k_mtspr(SPR_SR, or1k_mfspr(SPR_SR) & (~SPR_SR_IEE));
#endif
}

static inline unsigned int plp_irq_state()
{
#ifdef __riscv__
  unsigned int result;
  asm volatile ("csrr %0, 0x300" : "=r" (result) );
  return result;
  //return __builtin_pulp_spr_read(0x300);
#else
  return or1k_mfspr(SPR_SR) & (~SPR_SR_IEE);
#endif
}

static inline void plp_irq_restore(unsigned int state)
{
#ifdef __riscv__
   asm volatile("csrw 0x300, %0" : : "r" (state)  : "memory");
  //__builtin_pulp_spr_write(0x300, state);
#else
  or1k_mtspr(SPR_SR, (or1k_mfspr(SPR_SR) & (~SPR_SR_IEE)) | state);
#endif
}

#if TIMER_VERSION >= 2

void __plp_timer_configure(plp_timer_t *timer, unsigned int cycles, unsigned int divider, void (*handler)(), int oneShot, int cmpClr);

static inline void plp_timer_periodic(plp_timer_t *timer, unsigned int cycles, unsigned int divider, void (*handler)())
{
  __plp_timer_configure(timer, cycles, divider, handler, 0, 1);
}

static inline void plp_timer_continuous(plp_timer_t *timer, unsigned int cycles, unsigned int divider, void (*handler)())
{
  __plp_timer_configure(timer, cycles, divider, handler, 0, 0);
}

static inline void plp_timer_oneshot(plp_timer_t *timer, unsigned int cycles, unsigned int divider, void (*handler)())
{
  __plp_timer_configure(timer, cycles, divider, handler, 1, 1);
}

static inline unsigned int plp_getCycles()
{
  return plp_timer_get_count_high();
}

static inline unsigned int plp_timer_get(plp_timer_t *timer) {
  return plp_timer_get_count_low();
}

static inline void plp_timer_start(plp_timer_t *timer) {
  plp_timer_raw_conf_low(timer->conf | (1<<PLP_TIMER_ENABLE_BIT));
}

static inline void plp_timer_stop(plp_timer_t *timer) {
  plp_timer_raw_conf_low(0);
}

static inline void plp_timer_pause(plp_timer_t *timer) {
  plp_timer_raw_conf_low(timer->conf);

}

static inline void plp_timer_resume(plp_timer_t *timer) {
  plp_timer_raw_conf_low(timer->conf | (1<<PLP_TIMER_ENABLE_BIT));

}

static inline void plp_timer_clear(plp_timer_t *timer) {
  plp_timer_set_count_low(0);
}

#endif

static inline unsigned int *plp_swEvents_getAlloc() { return &swEventsAlloc; }

#if PLP_HAS_FC

static inline int plp_socEvent_alloc() {
  int event = plp_bitfield_alloc(&socEventAlloc);
  if (event == -1) return -1;
  else return event + PLP_SOC_EVENT_SW_EVENT0;
}

static inline void plp_socEvent_free(int event) {
  plp_bitfield_free(&socEventAlloc, event);
}

static inline void plp_socEvent_configure(int cluster, int event, int active) {
#if PLP_SOC_EVENT_SW_EVENT0 < 32
  unsigned int addr = cluster == PLP_FC_CID ? SOC_FC_MASK_LSB : SOC_CL_MASK_LSB;
  int fullEvent = event - PLP_SOC_EVENT_SW_EVENT0;
#else
  unsigned int addr = cluster == PLP_FC_CID ? SOC_FC_MASK_MSB : SOC_CL_MASK_MSB;
  int fullEvent = event - 32 + PLP_SOC_EVENT_SW_EVENT0;
#endif
  unsigned int val = soc_eu_eventMask_get(addr) & ~(1<<fullEvent);
  if (!active) val = val | (1<<fullEvent);
  soc_eu_eventMask_set(addr, val);
}

static inline void plp_socEvent_raiseMask(unsigned int mask) {
  soc_eu_genEventMask(mask);
}

static inline unsigned int *plp_socEvents_getAlloc() { return &socEventAlloc; }

static inline unsigned int *plp_fcSwEvents_getAlloc() { return &fcSwEventsAlloc; }

static inline void plp_notif_cluster(int cid) {
  int event = cid == PLP_FC_CID ? PLP_RT_FC_NOTIF_SOC_EVENT : PLP_RT_C0_NOTIF_SOC_EVENT + cid;
  plp_socEvent_raiseMask(1 << event);
}

static inline void plp_notif_clear() {
  plp_socEvent_clear(plp_isFc() ? PLP_RT_FC_NOTIF_SOC_EVENT : PLP_RT_C0_NOTIF_SOC_EVENT + plp_clusterId());
}

static inline void plp_notif_wait() {
  plp_socEvent_wait(plp_isFc() ? PLP_RT_FC_NOTIF_SOC_EVENT : PLP_RT_C0_NOTIF_SOC_EVENT + plp_clusterId());
}

static inline void plp_socEvent_clear(int event) {
  plp_irq_disable();
  socEventsStatus &= ~(1<<event);
  plp_irq_enable();
}

static inline void plp_socEvent_wait(int event) {
  unsigned int mask = 1<<event;
  while (!((*(volatile int *)&socEventsStatus) & mask)) {
    eu_evt_maskWaitAndClr(1<<PLP_RT_NOTIF_EVENT);
  }
}

#endif

#ifdef HWCE_VERSION

static inline int plp_hwce_isFull() {
  int wRem, wRem_shadow;
  int irq = plp_irq_clear();
  wRem = hwce_wRem;
  wRem_shadow = hwce_wRem_shadow;
  plp_irq_restore(irq);
  return (wRem > HWCE_LBSIZE/2 - 2) || (wRem_shadow);
}

#endif

/*
 * UDMA
 */

PLP_FC_DATA extern char udmaIsInit;

void _plp_udma_init();

static inline void plp_udma_init()
{
  if (udmaIsInit) return;
  udmaIsInit = 1;
  _plp_udma_init();
}

void plp_udma_enqueueCopy(plp_udma_copy_t *copy, unsigned int l2Addr, unsigned int size, unsigned int cfg, unsigned int channelId);

static inline void plp_periph_copy_l2(plp_udma_copy_t *copy, unsigned int channel, unsigned int l2Addr, unsigned int size, unsigned int cfg, plp_task_t task) {
  copy->task = task;
  copy->dmaCmd = 0;
  copy->handler = (void *)0;
  plp_udma_enqueueCopy(copy, l2Addr, size, cfg, channel);
}

static inline void plp_periph_copy_toL2(plp_udma_copy_t *copy, unsigned int channel, unsigned int l2Addr, unsigned int size, unsigned int cfg, plp_task_t task) {
  plp_periph_copy_l2(copy, channel, l2Addr, size, cfg, task);
}

static inline void plp_periph_copy_fromL2(plp_udma_copy_t *copy, unsigned int channel, unsigned int l2Addr, unsigned int size, unsigned int cfg, plp_task_t task) {
  plp_periph_copy_l2(copy, channel, l2Addr, size, cfg, task);
}

static inline void plp_periph_copy_toL1(plp_udma_copy_t *copy, unsigned int channel, unsigned int l2Addr, unsigned int size, unsigned int cfg, plp_task_t task, unsigned int l1Addr) {
  plp_periph_copy_l1(copy, channel, l2Addr, size, cfg, task, l1Addr);
}

static inline void plp_periph_copy_fromL1(plp_udma_copy_t *copy, unsigned int channel, unsigned int l2Addr, unsigned int size, unsigned int cfg, plp_task_t task, unsigned int l1Addr) {
  plp_periph_copy_l1(copy, channel, l2Addr, size, cfg, task, l1Addr);
}

static inline unsigned int plp_task_localOffset(unsigned int arg) {
#if defined(PLP_HAS_FC) && defined(FC_TCDM_CORE_START)
  if (plp_isFc()) {
    if (arg >= FC_TCDM_CORE_START) return (arg - FC_TCDM_CORE_START);
    else return arg;
  } else 
#endif
  if (arg >= PULP_BASE_REMOTE_ADDR) return (arg - PULP_BASE_REMOTE_ADDR);
  else return arg;
}

static inline plp_task_handler_t plp_handler_extract(plp_task_t task) {
  return (plp_task_handler_t)(((task & 0x3FFFF) << 1) + L2_MEM_BASE_ADDR);
}

static inline plp_task_t plp_handler(plp_task_handler_t handler, unsigned int arg)
{
  return (((unsigned int)handler - L2_MEM_BASE_ADDR) >> 1) | (arg << PLP_TASK_ARG_BIT) | (1<<PLP_TASK_HANDLER_BIT);
}

static inline plp_task_t plp_handler_noarg(plp_task_handler_t handler)
{
  return plp_handler(handler, 0);
}

static inline plp_task_t plp_task(plp_task_handler_t handler, unsigned int arg)
{
  return (((unsigned int)handler - L2_MEM_BASE_ADDR) >> 1) | (arg << PLP_TASK_ARG_BIT);
}

static inline plp_task_t plp_task_noarg(plp_task_handler_t handler)
{
  return plp_task(handler, 0);
}

static inline plp_task_t plp_prioTask(plp_task_handler_t handler, unsigned int arg)
{
  return (((unsigned int)handler - L2_MEM_BASE_ADDR) >> 1) | (arg << PLP_TASK_ARG_BIT) | (1<<PLP_TASK_TYPE_BIT);
}

static inline plp_task_t plp_prioTask_noarg(plp_task_handler_t handler)
{
  return plp_prioTask(handler, 0);
}

static inline void plp_sched_wait()
{
  eu_evt_maskWaitAndClr(1<<PLP_RT_SCHED);
}

static inline void plp_task_delayed_ms(plp_task_delayed_t *taskDesc, plp_task_t task, unsigned int conf, unsigned int time)
{
  taskDesc->ticks = time;
  taskDesc->ticksSpec = time;
  taskDesc->task = task;
  taskDesc->conf = conf;
}

#endif
