/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __PLPJTAG_H__
#define __PLPJTAG_H__

#ifdef __cplusplus
extern "C" {
#endif

int plpjtag_init();

int plpjtag_access(unsigned int base, void *data, int size, int isWrite);

#ifdef __cplusplus
}
#endif

#endif