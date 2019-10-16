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

#ifndef __HD_SPI_H__
#define __HD_SPI_H__

#include <pthread.h>

typedef struct {
  pthread_mutex_t mutex;
  pthread_cond_t cond;
  int done;
  unsigned int addr;
  unsigned char *buffer;
  unsigned int size;
  int isWrite;
  struct hd_spi_req_s *next;
} hd_spi_req_t;

extern int hd_spi_req_init(hd_spi_req_t *req);
extern int hd_spi_write(hd_spi_req_t *req, unsigned int addr, unsigned char *buffer, unsigned int size);
extern int hd_spi_read(hd_spi_req_t *req, unsigned int addr, unsigned char *buffer, unsigned int size);
extern void hd_spi_wait(hd_spi_req_t *req);

#endif
