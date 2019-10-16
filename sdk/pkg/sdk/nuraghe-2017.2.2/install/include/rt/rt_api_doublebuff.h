/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_DOUBLEBUFF_H__
#define __RT__RT_API_DOUBLEBUFF_H__

#define PLP_L2BUFF_I2S_0 0
#define PLP_L2BUFF_I2S_1 1
#define PLP_L2BUFF_I2S_2 2
#define PLP_L2BUFF_I2S_3 3
#define PLP_L2BUFF_FLASH 4

typedef struct {
	int type;
	int channel;
	unsigned int base;
	unsigned int size;
	int current;
	plp_udma_copy_t copy[2];
} plp_l2buff_t;

#endif