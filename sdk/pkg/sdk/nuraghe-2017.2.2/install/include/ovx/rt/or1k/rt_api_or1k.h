/*
 * Copyright (c) 2013 Germain Haugou
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#ifndef __RT_API_OR1K_H__
#define __RT_API_OR1K_H__

#include <hal/pulp.h>

#define FABRIC_ENTRY

static inline int rt_isFc(unsigned int cid, unsigned int coreId) {
  return coreId == 0;
}

static inline int rt_isCc(unsigned int cid, unsigned int coreId) {
  return coreId == 0;
}

static inline unsigned int rt_nbCore()
{
  return *(volatile unsigned short*)(APB_SOC_CTRL_ADDR + 0x12);
}

static inline unsigned int rt_nbCluster()
{
  return *(volatile unsigned short*)(APB_SOC_CTRL_ADDR + 0x10);
}

#define rt_coreId() plp_coreId()
#define rt_clusterId() plp_clusterId()

static inline void rt_ids(unsigned int *cluster, unsigned *core) {
  if (cluster) *cluster = rt_clusterId();
  if (core) *core = rt_coreId();
}

static inline unsigned long int or1k_ff1 (unsigned long value) {       
  unsigned long result;
  __asm__ ("l.ff1\t\t%0,%1": "=r" (result) : "r" (value));
  return result;
}

static inline void or1k_doze_mode() {
  or1k_mtspr(SPR_PMR, or1k_mfspr(SPR_PMR) | SPR_PMR_DME);
}

static inline void or1k_sleep_mode() {
  or1k_mtspr(SPR_PMR, or1k_mfspr(SPR_PMR) | SPR_PMR_SME);
}

static inline unsigned int rt_perf_cyclesGet() {
  return pulp_read32(PULP_CLUSTER_BASE + PULP_TIMER_OFFSET + PULP_TIMER_GET_OFFSET);
}

static inline void rt_perf_cyclesConf() {
}

static inline void rt_perf_cyclesStart() {
  pulp_write32(PULP_CLUSTER_BASE + PULP_TIMER_OFFSET + PULP_TIMER_RESET_OFFSET, 1);
  pulp_write32(PULP_CLUSTER_BASE + PULP_TIMER_OFFSET + PULP_TIMER_START_OFFSET, 1);
}

int rt_thread_setjmp(rt_thread_t *thread);

void rt_thread_longjmp(rt_thread_t *thread);

int rt_thread_create(rt_thread_t *thread, unsigned int stack, unsigned int stackSize, unsigned int (*entry)(rt_thread_t *thread), unsigned int arg0, unsigned int arg1);

static inline unsigned int rt_getGLobalAddr(unsigned int addr) {
  return addr + PULP_CLUSTER_BASE_ADDR(rt_clusterId());
}

int printf(const char *format, ...);
static inline void rt_sendHostNotif() {
  fc_eu_trig(0);
}
  
static inline void int_enable2()
{
  or1k_mtspr(SPR_SR, or1k_mfspr(SPR_SR) | (SPR_SR_IEE));
}

static inline void int_disable2()
{
  or1k_mtspr(SPR_SR, or1k_mfspr(SPR_SR) & (~SPR_SR_IEE));
}

#endif
