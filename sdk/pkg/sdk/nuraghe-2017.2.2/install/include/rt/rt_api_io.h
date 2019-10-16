/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_IO_H__
#define __RT__RT_API_IO_H__

// PLP_RT_IO is defined when libc-like functions must be provided by the runtime
// Otherwise the libc must be used
#ifdef PLP_RT_IO

// When PLP_RT_IO_ACTIVE is not active, libc like functions are defined to empty symbols
// so that there is no more IO in the binary
#ifdef PLP_RT_IO_ACTIVE

#ifdef putchar
#undef putchar
#endif

int putchar(int c);
int printf(const char *format, ...);
int puts(const char *s);
int sprintf(char *str, const char *format, ...);

#else

#define putchar(x...)
#define printf(x...)
#define puts(x...)
#define sprintf(x...)

#endif

#endif

void exit(int status);
void abort();

#endif