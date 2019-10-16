/**
 * Mindlib
 *
 * This file is derived from the Kortex library (think.objectweb.org).
 *
 * Copyright (C) 2004 France Telecom R&D
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
 *
 * Contact: think@objectweb.org
 *
 * Authors: J.-P. Fassino (France Telecom R&D).
 *
 */

#ifndef __DLMALLOC_H__
#define __DLMALLOC_H__

#define BINS                    128

struct chunk_struct {
  unsigned int prev_size;       /* Size of previous chunk (if free). */
  unsigned int size;            /* Size in bytes, including overhead. */
  struct chunk_struct *fd;      /* double links -- used only if free. */
  struct chunk_struct *bk;   
};

typedef struct _dlmalloc_t {
  // Private data
  struct chunk_struct  bins[BINS];
  struct chunk_struct   *bottom;
  struct chunk_struct   *top;        // Virtual, never access it
} rt_dlmalloc_t ;

void dlFree(rt_dlmalloc_t *_this, void* ptr);
void* dlGetBiggestChunk(rt_dlmalloc_t *_this, int *size);
void* dlMAlloc(rt_dlmalloc_t *_this, int size);
void dlInit(rt_dlmalloc_t *_this, char *start, int size);

#endif
