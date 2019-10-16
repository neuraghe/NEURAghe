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

#ifndef __RT_DATA_PULP_H__
#define __RT_DATA_PULP_H__

#ifndef LANGUAGE_ASSEMBLY

#define JBLEN (13*4)

typedef struct {
  unsigned char buf[JBLEN];
} rt_jmpbuf_t;

typedef struct {
  // !!!!!!!!!!!! BE CAREFUL !!!!!!!!!!!!!!!!
  // jmpbuf must be the first field as the assembly code get it from thread pointer without any offset
  rt_jmpbuf_t jmpbuf;
  unsigned int arg0;
  unsigned int arg1;
} rt_thread_t;

typedef struct {
  rt_thread_t ccThread;
  rt_thread_t peThread;
} rt_cc_arch_t;

#define RT_FC_ALLOC(fc) (&(fc)->cc->l1Alloc)

#define RT_CC_ALLOC(cc) (&(cc)->l1Alloc)

#define RT_CC_STACK(cc, cid) (PULP_L1_BASE(cid) + cc->conf->l1Size - cc->conf->ccStackSize)

#endif

#endif
