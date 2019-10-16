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

#ifndef __HD_USER_ALLOC_H__
#define __HD_USER_ALLOC_H__

#include <pthread.h>

//#define CHECK_CONSISTENCY 1
//#define DISPLAY_ALLOCATOR 1

#define HASH_TABLE_SIZE 2003
#define BINS_NB 128
#define CHUNK_ALLOC_NB 128

typedef struct _chunk_t {
  struct _chunk_t *nextInHash;
  struct _chunk_t *nextInBin;
  struct _chunk_t *prevInAddr;
  struct _chunk_t *nextInAddr;
  unsigned int paddr;
  unsigned int vaddr;
  int free;
  int size;
#if defined(CHECK_CONSISTENCY) || defined(DISPLAY_ALLOCATOR)
  int checked;
#endif
} chunk_t;

typedef struct hd_userAlloc_s {
  chunk_t *hashTable[HASH_TABLE_SIZE];
  chunk_t *bins[BINS_NB];
  pthread_mutex_t mutex;
  pthread_cond_t cond;
  unsigned int fabricOffsetBase;
} hd_userAlloc_t;

hd_userAlloc_t *hd_userAlloc_init(unsigned int fabricOffsetBase);

void hd_userAlloc_deinit(hd_userAlloc_t *allocator);

int hd_userAlloc_alloc(hd_userAlloc_t *allocator, int wait, int size, unsigned int *hostAddr, unsigned int *fabricAddr);

void hd_userAlloc_free(hd_userAlloc_t *allocator, unsigned int hostAddr, unsigned int fabricAddr);

int hd_userAlloc_append(hd_userAlloc_t *_this, unsigned int hostBase, unsigned int fabricBase, int size);

#endif
