/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_FS_H__
#define __RT__RT_API_FS_H__

#include "rt/rt_name_alloc.h"

typedef struct {
	AllocNameT *name;
	unsigned int addr;
	unsigned int size;
	unsigned short state;
	unsigned short ref;
	unsigned int buff;
} plp_file_t;

static inline char *plp_fs_name(plp_file_t *file) {
	return GetName(file->name);
}

plp_file_t *plp_fs_get(int fs, char *file);

int plp_fs_load(plp_file_t *file, plp_task_t task);

void plp_fs_unload(plp_file_t *file);

int plp_dyn_load(plp_file_t *file, plp_task_t task);

unsigned int plp_dyn_symbol(plp_file_t *file, char *symbol);

#endif