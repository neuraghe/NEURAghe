/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_CLOCK_H__
#define __RT__RT_API_TIMER_H__

#if TIMER_VERSION >= 2

/* Allocate a timer
 * For now a single HW counter can be allocated.
 * This function will be extended in the future to support SW timers based on the HW one.
 */
int plp_timer_alloc(plp_timer_t *timer);

/* Free a timer
 * This also stops it
 */
void plp_timer_free(plp_timer_t *timer);

/* Timer configuration
 * Configure the specified timer for a periodic mode..
 * The timer will periodically count from 0 to the specified period.
 * In order to support large range, a frequency divider can be sepcified. It is ignored if <=1, otherwise the real period is
 * periodCycles*divider. The divider can go up to 256 (last supported value).
 * If a handler is specified, it will be called as an interrupt handler when the counter goes back to zero. This handler 
 * must have the interrupt attribute as it is called directly by the HW. * 
 */
static inline void plp_timer_periodic(plp_timer_t *timer, unsigned int periodCycles, unsigned int divider, void (*handler)());

static inline void plp_timer_oneshot(plp_timer_t *timer, unsigned int cycles, unsigned int divider, void (*handler)());

static inline void plp_timer_start(plp_timer_t *timer);

static inline void plp_timer_stop(plp_timer_t *timer);

static inline void plp_timer_pause(plp_timer_t *timer);

static inline void plp_timer_resume(plp_timer_t *timer);

static inline void plp_timer_clear(plp_timer_t *timer);

static inline unsigned int plp_timer_get(plp_timer_t *timer);

#endif

#endif
