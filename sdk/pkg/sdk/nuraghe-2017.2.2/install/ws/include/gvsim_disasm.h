/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __GVSIM_DISASM_H__
#define __GVSIM_DISASM_H__

typedef struct {
	char trace[256];
	unsigned int args[32];
	void *pc;
	unsigned int savedArgs[10][2];
} gvsim_disasm_pc_t;

#ifdef __cplusplus
extern "C" {
#endif

void *gvsim_disasm_init();

int gvsim_disasm_get(void *handler, unsigned int opcode, gvsim_disasm_pc_t *pc, unsigned int (*getReg)(void *handler, unsigned int reg));

int gvsim_disasm_decode(void *handler, gvsim_disasm_pc_t *pc, unsigned int opcode);
void gvsim_disasm_read(void *handler, gvsim_disasm_pc_t *pc, unsigned int *args);
void gvsim_disasm_write(void *handler, gvsim_disasm_pc_t *pc, unsigned int *args);

#ifdef __cplusplus
}
#endif

#endif