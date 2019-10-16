/* 
 * tiling.h
 * Francesco Conti <f.conti@unibo.it>
 *
 * Copyright (C) 2016 ETH Zurich, University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 */

#ifndef TYPES_H
#include "types.h"
#endif

#ifndef TILING_H
#define TILING_H
 
#define NB_PIPE_STAGE 3

/**
 *  @brief Gets a tile over a one-dimensional tiling grid.
 *
 *  Computes a pointer to the base of a particular tile in a one-dimensional
 *  tiling grid indexed by a (ii) index; in pseudo-Python
 *      ccn_get_tile_1d(x,ii) = x[ii*si:(ii+1)*si-1]
 *  where (si) os defining the pitch of the tiling grid in the (i) dimension.
 *
 *  @param *x
 *      a pointer to the base of the 2d tiling grid.
 *  @param tile_ii
 *      the tiling index.
 *  @param tile_size_i
 *      the pitch of the tiling grid in the outer dimension, i.e. the distance
 *      between two "ticks" in the i dimension.
 */
static inline data_t *ccn_get_tile_1d(
    data_t *x,
    int tile_ii,
    int tile_size_i
) {
    data_t *y = x + tile_ii*tile_size_i;
    return y;
}

/**
 *  @brief Gets a tile over a two-dimensional tiling grid.
 *
 *  Computes a pointer to the base of a particular tile in a two-dimensional
 *  tiling grid indexed by a (ii,jj) couple of indeces; in pseudo-Python
 *      ccn_get_tile_2d(x,ii,jj) = x[ii*si:(ii+1)*si-1,jj*sj:(jj+1)*sj-1]
 *  where (si,sj) is the couple defining the pitch of the tiling grid in the
 *  (i,j) dimensions.
 *
 *  @param *x
 *      a pointer to the base of the 2d tiling grid.
 *  @param tile_ii
 *      the tiling index in the outer dimension.
 *  @param tile_jj
 *      the tiling index in the inner dimension.
 *  @param tile_size_i
 *      the pitch of the tiling grid in the outer dimension, i.e. the distance
 *      between two "ticks" in the i dimension.
 *  @param tile_size_j
 *      the pitch of the tiling grid in the inner dimension, i.e. the distance
 *      between two "ticks" in the j dimension.
 *  @param tile_stride_j
 *      the total size of the tiling grid in the inner dimension, i.e. the 
 *      number of ticks in the j dimension.
 */
static inline data_t *ccn_get_tile_2d(
    data_t *x,
    int tile_ii,
    int tile_jj,
    int tile_size_i,
    int tile_size_j,
    int tile_stride_j
) {
    data_t *y = x + tile_ii*tile_size_i * tile_stride_j
                  + tile_jj*tile_size_j;
    return y;
}

/**
 *  @brief Gets a tile over a three-dimensional tiling grid.
 *
 *  Computes a pointer to the base of a particular tile in a three-dimensional
 *  tiling grid indexed by a (ii,jj,kk) triple of indeces; in pseudo-Python
 *      ccn_get_tile_3d(x,ii,jj,kk) =
 *        x[ii*si:(ii+1)*si-1, jj*sj:(jj+1)*sj-1, kk*sk:(kk+1)*sk-1]
 *  where (si,sj,sk) is the triple defining the pitch of the tiling grid in the
 *  (i,j,k) dimensions.
 *
 *  @param *x
 *      a pointer to the base of the 2d tiling grid.
 *  @param tile_ii
 *      the tiling index in the outer dimension.
 *  @param tile_jj
 *      the tiling index in the middle dimension.
 *  @param tile_kk
 *      the tiling index in the inner dimension.
 *  @param tile_size_i
 *      the pitch of the tiling grid in the outer dimension, i.e. the distance
 *      between two "ticks" in the i dimension.
 *  @param tile_size_j
 *      the pitch of the tiling grid in the middle dimension, i.e. the distance
 *      between two "ticks" in the j dimension.
 *  @param tile_size_k
 *      the pitch of the tiling grid in the inner dimension, i.e. the distance
 *      between two "ticks" in the k dimension.
 *  @param tile_stride_j
 *      the total size of the tiling grid in the middle dimension, i.e. the 
 *      total number of ticks in the j dimension.
 *  @param tile_stride_k
 *      the total size of the tiling grid in the inner dimension, i.e. the 
 *      total number of ticks in the k dimension. 
 */
static inline data_t *ccn_get_tile_3d(
    data_t *x,
    int tile_ii,
    int tile_jj,
    int tile_kk,
    int tile_size_i,
    int tile_size_j,
    int tile_size_k,
    int tile_stride_j,
    int tile_stride_k,
    int tile_offset_i,
    int tile_offset_j,
    int tile_offset_k
) {
    data_t *y = x + tile_ii*(tile_size_i - tile_offset_i) * tile_stride_j * tile_stride_k
                  + tile_jj*(tile_size_j - tile_offset_j) * tile_stride_k
                  + tile_kk*(tile_size_k - tile_offset_k);
    return y;
}

#endif /* TILING_H */
