#ifndef __OR10N_CPU_HAL_H__
#define __OR10N_CPU_HAL_H__

#include "hal/or10n_builtins.h"
#include <or10n3/spr-defs.h>

static inline void or1k_mtspr(unsigned long int  spr, unsigned long int  value) {       
  __asm__ __volatile__ ("l.mtspr\t\t%0,%1,0": : "r" (spr), "r" (value));
}

static inline unsigned long int or1k_mfspr(unsigned long spr) {       
  unsigned long value;
  __asm__ __volatile__ ("l.mfspr\t\t%0,%1,0" : "=r" (value) : "r" (spr));
  return value;
}

static inline unsigned int core_id() {
  unsigned int value;
  __asm__ ("l.mfspr\t\t%0,r0,%1" : "=r" (value) : "I" (SPR_CORE_ID));
  return value;
}

static inline unsigned int cluster_id() {
  unsigned int value;
  __asm__ ("l.mfspr\t\t%0,r0,%1" : "=r" (value) : "I" (SPR_CLUSTER_ID));
  return value;
}

static inline unsigned int plp_coreId() {
  unsigned int value;
  __asm__ ("l.mfspr\t\t%0,r0,%1" : "=r" (value) : "I" (SPR_CORE_ID));
  return value;
}

static inline unsigned int plp_clusterId() {
  unsigned int value;
  __asm__ ("l.mfspr\t\t%0,r0,%1" : "=r" (value) : "I" (SPR_CLUSTER_ID));
  return value;
}

static inline void set_SR(unsigned int value) { 
  __asm__ __volatile__ ("l.mtspr\t\tr0,%0,%1": : "r" (value), "I" (SPR_SR));
}

static inline unsigned int get_SR() {
  unsigned int value;
  __asm__ ("l.mfspr\t\t%0,r0,%1" : "=r" (value) : "I" (SPR_SR));
  return value;
}

static inline unsigned int plp_hasFc() {
#ifdef PLP_HAS_FC
  return 1;
#else
  return 0;
#endif
}

static inline unsigned int plp_isFc() {
  if (plp_hasFc()) return plp_clusterId() == 32;
  else return 0;
}

#define PCER_NB_EVENTS 0
#define PCER_ALL_EVENTS_MASK 0
#define PCMR_ACTIVE 0
#define PCMR_SATURATE 0
 
static inline void cpu_perf_conf_events(unsigned int eventMask)
{
}

static inline unsigned int cpu_perf_conf_events_get()
{
  return 0;
}

static inline void cpu_perf_conf(unsigned int confMask)
{
}

static inline void cpu_perf_start(unsigned int conf) {
}

static inline void cpu_perf_stop(unsigned int conf) {
}

static inline void cpu_perf_set(unsigned int counterId, unsigned int value) {
}

static inline void cpu_perf_setall(unsigned int value) {
}

static inline unsigned int cpu_perf_get(unsigned int counterId) {
  return 0;
}

static inline char *cpu_perf_name(int event) {
  return (void *)0;
}


#endif
