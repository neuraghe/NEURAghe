/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef ARCHI_PERIPH_V1_H
#define ARCHI_PERIPH_V1_H

#define EOC_EOC_OFFSET          0x0
#define EOC_FETCH_OFFSET        0x8
#define EOC_CLUSTER_CFG_OFFSET  0x18
#define EOC_BOOTADDR_OFFSET     0x40
#define EOC_BOOTADDR_SIZE       0x40
#define EOC_BOOTADDR_COREID(offset) ((offset) >> 2)

#define STDOUT_PUTC_OFFSET      0x0
#define STDOUT_OPEN_OFFSET      0x1000
#define STDOUT_OPEN_END_OFFSET  0x2000
#define STDOUT_READ_OFFSET      0x3000

#endif