/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __ARCHI_ICACHE_CTRL_V2_H__
#define __ARCHI_ICACHE_CTRL_V2_H__

#define ICACHE_CTRL_ENABLE_OFFSET     0
#define ICACHE_CTRL_FLUSH_OFFSET      4
#define ICACHE_CTRL_FLUSH_LINE_OFFSET 8

#define ICACHE_LINE_SIZE_LOG2  4
#define ICACHE_LINE_SIZE       (1<<ICACHE_LINE_SIZE_LOG2)

#endif