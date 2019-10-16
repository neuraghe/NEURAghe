/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __VIVOBOOT_H__
#define __VIVOBOOT_H__

#ifdef __cplusplus
extern "C" {
#endif

int vivo_init();
int vivo_reset();
int vivo_start(unsigned int coreMask);
int vivo_load(char *binary, unsigned int addr);
unsigned int vivo_poll();
int vivo_access(unsigned int base, void *data, int size, int isWrite);

#ifdef __cplusplus
}
#endif

#endif