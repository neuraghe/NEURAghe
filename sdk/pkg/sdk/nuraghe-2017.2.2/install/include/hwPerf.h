#ifndef __HW_PERF_H__
#define __HW_PERF_H__

#include "archi/pulp.h"

#include "hal/pulp.h"


typedef struct {
  int step;
  unsigned int counters[PCER_NB_EVENTS];
} hw_perf_t;

// Call it once to initialize perf structure
static inline void hw_perf_init(hw_perf_t *perf) {
  int i;
  perf->step = 0;
  for (i=0; i<PCER_NB_EVENTS; i++) {
    perf->counters[i] = 0;
  }
  cpu_perf_conf(0);
}

// Call it to switch to the next performance counter
// Return 0 in case we've been through all performance counters
// otherwise return 1
static inline int hw_perf_step(hw_perf_t *perf) {
  if (perf->step >= PCER_NB_EVENTS) return 0;
#ifdef ASIC
  // There is a single counter on ASIC
  cpu_perf_conf_events(1<<perf->step);
#else
  // On other targets, we can monitor everything at the same time
  cpu_perf_conf_events(PCER_ALL_EVENTS_MASK);
#endif
  cpu_perf_setall(0);
  return 1;
}

// Call it to commit HW counters values to SW structure
static inline void hw_perf_commit(hw_perf_t *perf) {
#ifdef ASIC
  perf->counters[perf->step] += cpu_perf_get(0);
  perf->step++;
#else
  int i;
  for (i=0; i<PCER_NB_EVENTS; i++) {
    perf->counters[i] += cpu_perf_get(i);
  }
  perf->step += PCER_NB_EVENTS;
#endif
}

static inline void hw_perf_start(hw_perf_t *perf) {
  cpu_perf_conf(PCMR_ACTIVE | PCMR_SATURATE);
}

static inline void hw_perf_stop(hw_perf_t *perf) {
  cpu_perf_conf(0);
}

static inline int hw_perf_nb_events(hw_perf_t *perf) {
  return perf->step;
}

static inline char *hw_perf_get_name(hw_perf_t *perf, int event) {
  return cpu_perf_name(event);
}

static inline int hw_perf_get_value(hw_perf_t *perf, int event) {
  return perf->counters[event];
}

#endif
