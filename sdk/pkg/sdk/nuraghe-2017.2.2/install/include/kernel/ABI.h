/*
 * Copyright (c) 2013 Germain Haugou
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#ifndef __KERNEL_ABI_H
#define __KERNEL_ABI_H

#ifdef long
#undef long
#endif

typedef enum {
  ARG_TYPE_SCALAR,
  ARG_TYPE_GLOBAL,
  ARG_TYPE_LOCAL
} argType_e;

typedef union {
  unsigned int cast_32;
  unsigned long long cast_64;
} ptr_cast_t;

typedef struct {
  unsigned long size;
  unsigned long offset;
  unsigned int type;
} __attribute__((__packed__)) arg_info_t;

typedef struct {
  unsigned int size;
  unsigned int nbKernels;
  unsigned int offsets;
} __attribute__((__packed__)) program_desc_t;

typedef struct {
  ptr_cast_t entry;
  unsigned long stackSize;
  unsigned long localDataSize;
  unsigned long reqd_work_group_size[3];
  unsigned long work_group_size_hint[3];
  unsigned int barrier;
  unsigned int nbParam;
  unsigned int nameOffset;
  unsigned int argsInfoOffset;
} __attribute__((__packed__)) kernel_info_t;

static inline kernel_info_t *getKernel(program_desc_t *programDesc, int index) {
  unsigned int *offsets = (unsigned int *)(long)&(programDesc->offsets);
  return (kernel_info_t *)((long)programDesc + offsets[index]);
}

static inline char *getKernelName(kernel_info_t *kernel) {
  return (char *)((long)kernel + kernel->nameOffset);
}

static inline arg_info_t *getArgInfo(kernel_info_t *kernel, int index) {
  arg_info_t *argsInfo = (arg_info_t *)((long)kernel + kernel->argsInfoOffset);
  return &argsInfo[index];
}

#endif
