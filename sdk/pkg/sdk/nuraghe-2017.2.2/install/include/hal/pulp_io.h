/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_PULP_IO__
#define __HAL_PULP_IO__

#define pulp_write8(add, val_) (*(volatile unsigned char *)(add) = val_)
#define pulp_write16(add, val_) (*(volatile unsigned short *)(add) = val_)
#define pulp_write32(add, val_) (*(volatile unsigned int *)(add) = val_)
#define pulp_write(add, val_) (*(volatile unsigned int *)(add) = val_)

#define pulp_read8(add) (*(volatile unsigned char *)(add))
#define pulp_read16(add) (*(volatile unsigned short *)(add))
#define pulp_read32(add) (*(volatile unsigned int *)(add))
#define pulp_read(add) (*(volatile unsigned int *)(add))

#endif