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

#ifndef __OS_API_H__
#define __OS_API_H__

#include <stdio.h>

#ifdef __OR1K__

FILE *or1k_fopen(const char *path, const char *mode);
int or1k_fseek(FILE *stream, long offset, int whence);
long or1k_ftell(FILE *stream);
size_t or1k_fread(void *ptr, size_t size, size_t nmemb, FILE *stream);
size_t or1k_fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);
int or1k_fclose(FILE *fp);
char *or1k_fgets(char *s, int size, FILE *stream);

void *or1k_dlopen(char *filename, int flag);
int or1k_dlclose(void *handle);
void *or1k_dlsym(void *handle, char *symbol);

uint64_t or1k_getCycles();

#endif

#endif
