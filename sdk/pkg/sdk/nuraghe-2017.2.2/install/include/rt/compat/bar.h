/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef	__RT_COMPAT_BAR_H__
#define __RT_COMPAT_BAR_H__

#include "compat.h"

static inline void synch_barrier() {
	eu_bar_setup(eu_bar_addr(0), (1 << plp_nbActiveCores()) - 1);
	eu_bar_trig_wait_clr(eu_bar_addr(0));
}

#endif
