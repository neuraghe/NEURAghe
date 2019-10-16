/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_LIB_H__
#define __RT__RT_LIB_H__

#include <stddef.h>
#include <string.h>

static inline void *plp_memcpy(void *_dst, const void *_src, size_t n) { return memcpy(_dst, _src, n); }

static inline void *plp_memset(void *m, int c, size_t n) { return memset(m, c, n); }

#endif