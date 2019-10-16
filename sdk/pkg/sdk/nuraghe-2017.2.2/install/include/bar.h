#ifndef	__BAR_H__
#define __BAR_H__

#include "pulp.h"
#include "utils.h"

// the following macros are for convenience and compatibility with existing
// code only

#if EU_VERSION == 1
#include "events.h"
#define synch_barrier()                 wait_barrier_event_buff(0);
#define synch_threads(num_threads)      do { setup_barrier(1, num_threads, ((1 << num_threads) - 1)); wait_barrier_event_buff(0); } while (0)
#else
#define synch_barrier()                 eu_bar_trig_wait_clr(eu_bar_addr(0));
#define synch_threads(num_threads)      do { eu_bar_setup(eu_bar_addr(0), (1 << num_threads) - 1); synch_barrier(); } while(0)
#endif

#endif
