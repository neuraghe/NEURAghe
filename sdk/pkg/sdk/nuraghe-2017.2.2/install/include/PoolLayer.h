/* 
 * PoolLayer.h
 * Francesco Conti <f.conti@unibo.it>
 *
 * Copyright (C) 2015 ETH Zurich, University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 */

#ifndef POOLLAYER_H
#define POOLLAYER_H

#ifndef TYPES_H
#include "types.h"
#endif

/**
 *  Data structure definining a max-pooling layer for a ConvNet. Input is
 *  taken from the location pointed by *x and output is produced at *y; thus
 *  it is possible to retarget the input at runtime with no data movement by
 *  changing the *x pointer.
 *  The PoolLayer reduces the size of the feature maps by max-pooling.
 */
typedef struct {
    int n_feat;      ///< number of input feature maps.
    int pool_stride; ///< pooling factor.
    int height;      ///< height of the input feature maps.
    int width;       ///< width of the input feature maps.
    int out_height;  ///< height of the output feature maps.
    int out_width;   ///< width of the output feature maps.
    data_t *x;       ///< pointer to the input feature maps.
    data_t *y;       ///< pointer to the output feature maps.
    data_t *loc_x0;
    data_t *loc_x1;
    data_t *loc_y0;
    data_t *loc_y1;
    int tiling_max_nfeat;
    int tiling_max_height;
    int tiling_max_width;
    int parallel_type;
} PoolLayer;

PoolLayer *PoolLayer_new(
#ifdef CCN_NOALLOC
  PoolLayer *layer,
#endif
  data_t *x,
  data_t *y,
  data_t *loc_x0,
  data_t *loc_x1,
  data_t *loc_y0,
  data_t *loc_y1,
  int n_feat,
  int pool_stride,
  int height,
  int width,
  int tiling_max_nfeat,
  int tiling_max_height,
  int tiling_max_width,
  int parallel_type
);
void PoolLayer_exec(PoolLayer *layer);
void PoolLayer_delete(PoolLayer *layer);

#endif /* POOLLAYER_H */
