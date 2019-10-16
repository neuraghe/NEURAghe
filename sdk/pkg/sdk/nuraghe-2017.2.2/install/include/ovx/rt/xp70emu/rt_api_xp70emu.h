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

#ifndef __RT_API_XP70EMU_H__
#define __RT_API_XP70EMU_H__

#include <stdint.h>
#include <gp/gp_xp70emu.h>

#define FABRIC_ENTRY __attribute__((aligned(256)))

static inline void rt_ids(unsigned int *cluster, unsigned *core) {
  unsigned int regVal = p2012_gethwpid();
  if (cluster) *cluster = (regVal >> 13) & 0x1f;
  if (core) *core = (regVal >> 8) & 0x1f;
}

static inline unsigned int rt_coreId() {
  return (p2012_gethwpid() >> 8) & 0x1f;
}

static inline unsigned int rt_clusterId() {
  return (p2012_gethwpid() >> 13) & 0x1f;
}

static inline void rt_hwbarrier() {
}

static inline void rt_swbarrier() {
}

static inline void rt_wait_event(uint32_t event) {
  wait_event(event);
}

static inline int rt_evt_check(uint32_t event) {
  return x3_moveic2ri_f(event) & (1<<15);
}

#if 0
static inline void rt_evt_raise(uint32_t event, uint32_t coreSet) {
  sthorm_hws_raise_evt(hwsBase, cd->warpPoolEvent, coreSet);
}
#endif

static inline void rt_evt_clear(uint32_t event) {
  x3_mover2ici(event, 1<<14);
}

static inline void rt_evt_activate(uint32_t event) {
  x3_setie(1 << event);
}

#endif
