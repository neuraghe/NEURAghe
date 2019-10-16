/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_FLASH_H__
#define __RT__RT_API_FLASH_H__

int plp_flash_init();

void plp_flash_copy_init(plp_flash_copy_t *copy);

void plp_flash_read(plp_flash_copy_t *copy, unsigned int l2Addr, unsigned int flashAddr, unsigned int size);

void plp_flash_wait(plp_flash_copy_t *copy);

#endif