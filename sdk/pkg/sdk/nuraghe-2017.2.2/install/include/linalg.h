/* 
 * linalg.h
 * Francesco Conti <f.conti@unibo.it>
 *
 * Copyright (C) 2015 ETH Zurich, University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 */

#include "types.h"
#include "arith.h"
#include <stdint.h>

#ifndef LINALG_H
#define LINALG_H

// for whatever reason, it's faster with twice bigger vectors (alignment?)
typedef int16_t vect16_t __attribute__((vector_size(8)));
typedef int32_t vect32_t __attribute__((vector_size(16)));

void linalg_mvprod(data_t *__restrict__ A, data_t *__restrict__ b, data_t *__restrict__ x, data_t *__restrict__ y, int M, int N, unsigned qf);
void linalg_2dconv     (data_t *__restrict__ W, data_t *__restrict__ x, data_t *__restrict__ y, int h, int w, int fs, int a, int nif, int parallel_type, unsigned qf);
void linalg_2dconv_hwce(data_t *__restrict__ W, data_t *__restrict__ x, data_t *__restrict__ y, int h, int w, int fs, int a, int nif, int parallel_type, unsigned qf);

#endif /* LINALG_H */
