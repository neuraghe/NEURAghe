#ifndef __OR10N_CPU_HAL_H__
#define __OR10N_CPU_HAL_H__

#include "or1k/spr-defs.h"

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

/*
 * PERFORMANCE COUNTERS
 * 
 * API for accessing performance counters registers.
 * Have a look at file spr-defs.h to speficy registers through defines
 * SPR_PCER_* and SPR_PCMR_*
 */

#define PCER_NB_EVENTS SPR_PCER_NB_EVENTS
#define PCER_ALL_EVENTS_MASK SPR_PCER_ALL_EVENTS_MASK
#define PCMR_ACTIVE SPR_PCMR_ACTIVE
#define PCMR_SATURATE SPR_PCMR_SATURATE
 
/* Configure the active events. eventMask is an OR of events got through SPR_PCER_EVENT_MASK */
static inline void cpu_perf_conf_events(unsigned int eventMask)
{
  or1k_mtspr(SPR_PCER, eventMask);
}

/* Return events configuration */
static inline unsigned int cpu_perf_conf_events_get()
{
  return or1k_mfspr(SPR_PCER);
}

/* Configure the mode. confMask is an OR of all SPR_PCMR_* macros */
static inline void cpu_perf_conf(unsigned int confMask)
{
  or1k_mtspr(SPR_PCMR, confMask);
}

/* Starts counting in all counters. As this is using the mode register,
 * the rest of the config can be given through conf parameter */
static inline void cpu_perf_start(unsigned int conf) {
  or1k_mtspr(SPR_PCMR, SPR_PCMR_ACTIVE | conf);
}

/* Stops counting in all counters. As this is using the mode register,
 * the rest of the config can be given through conf parameter */
static inline void cpu_perf_stop(unsigned int conf) {
  or1k_mtspr(SPR_PCMR, conf);
}

/* Set the specified counter to the specified value */
static inline void cpu_perf_set(unsigned int counterId, unsigned int value) {
  or1k_mtspr(SPR_PCCR(counterId), value);
}

/* Set all counters to the specified value */
static inline void cpu_perf_setall(unsigned int value) {
  or1k_mtspr(SPR_PCCR(31), value);
}

/* Return the value of the specified counter */
static inline unsigned int cpu_perf_get(unsigned int counterId) {
  return or1k_mfspr(SPR_PCCR(counterId));
}

static inline char *cpu_perf_name(int event) {
  return (void *)0;
}

#endif
