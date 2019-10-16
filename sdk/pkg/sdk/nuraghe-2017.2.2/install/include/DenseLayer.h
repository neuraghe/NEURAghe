/* 
 * DenseLayer.h
 * Francesco Conti <f.conti@unibo.it>
 *
 * Copyright (C) 2015 ETH Zurich, University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 */

#ifndef DENSELAYER_H
#define DENSELAYER_H

#ifndef TYPES_H
#include "types.h"
#endif

/**
 *  Data structure definining a fully-connected layer for a ConvNet. Input is
 *  taken from the location pointed by *x and output is produced at *y; thus
 *  it is possible to retarget the input at runtime with no data movement by
 *  changing the *x pointer.
 *  The DenseLayer computes the output of a fully connected neural network
 *  layer with 3d inputs and outputs (an array of 2d feature maps).
 */
typedef struct {
    const char *name;
    int n_in_neurons;  ///< number of input neurons.
    int n_out_neurons; ///< number of output neurons.
    int activation;    ///< activation type.
    data_t *w;         ///< pointer to the weights.
    data_t *b;         ///< pointer to the biases.
    data_t *x;         ///< pointer to the input feature maps.
    data_t *y;         ///< pointer to the output feature maps.
    data_t *loc_w0;        ///< pointer to the weights.
    data_t *loc_w1;        ///< pointer to the weights.
    data_t *loc_b;         ///< pointer to the biases.
    data_t *loc_x0;
    data_t *loc_x1;
    data_t *loc_y0;
    data_t *loc_y1;
    data_t *loc_y2;
    int tiling_max_non;
    int tiling_max_nin;
    int ntile_non;
    int ntile_nin;
    void *tile_grid_non;
    void *tile_grid_nin;
    data_t *loc_x_fe;
    data_t *loc_x_ex;
    data_t *loc_w_fe;
    data_t *loc_w_ex;
    data_t *loc_y_fe;
    data_t *loc_y_ex;
    data_t *loc_y_wb;
    unsigned char ntile_full_non;
    unsigned char ntile_full_nin;
    unsigned char tlast_non;
    unsigned char tlast_nin;
    unsigned qf;
} DenseLayer;

DenseLayer *DenseLayer_new(
#ifdef CCN_NOALLOC
    DenseLayer *layer,
#endif /* CCN_NOALLOC */
    const char *name,
    data_t *w,
    data_t *b,
    data_t *x,
    data_t *y,
    data_t *loc_x0,
    data_t *loc_x1,
    data_t *loc_y0,
    data_t *loc_y1,
    data_t *loc_y2,
    data_t *loc_w0,
    data_t *loc_w1,
    data_t *loc_b,
    int n_out_neurons,
    int n_in_neurons,
    int activation,
    int tiling_max_non,
    int tiling_max_nin,
    unsigned qf
);
void DenseLayer_exec(DenseLayer *layer);

#endif /* DENSELAYER_H */
