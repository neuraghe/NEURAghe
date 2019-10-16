/*
 * PoolLayer.h
 *
 *  Created on: May 30, 2016
 *      Author: alessandro
 */
/************************************************************************************
 *                                                                                  *
 *                   EOLAB @ DIEE - University of Cagliari                          *
 *                          Via Marengo, 2, 09123                                   *
 *                       Cagliari - phone 070 675 5009                              *
 *                                                                                  *
 * Author:       Alessandro Varsi - alessandro.varsi@diee.unica.it                  *
 *                                                                                  *
 * Project:     Convolutional neural network                                        *
 * File:        PoolLayer.h                                                         *
 * Description: Header defining interface and main function of max pooling layer    *
 *                                                                                  *
 ************************************************************************************/

#ifndef POOLLAYER_H_
#define POOLLAYER_H_

#ifndef TYPES_H
#include "types.h"
#endif

typedef struct {
    int n_feat;      ///< number of input feature maps.
    int pool_height; ///< pooling factor in Y direction.
    int pool_width;  ///< pooling factor in X direction.
    int height;      ///< height of the input feature maps.
    int width;       ///< width of the input feature maps.
    int out_height;  ///< height of the output feature maps.
    int out_width;   ///< width of the output feature maps.
    int stride;
} PoolLayer;

void PoolLayer_new(PoolLayer *layer, int n_feat, int pool_height, int pool_width, int height, int width, int out_height, int out_width, int stride);
void PoolLayer_exec(PoolLayer *layer, data_t *x, data_t *y);

void max_pooling_loop(data_t *x, int depth, int in_height, int in_width, int out_height, int out_width, int pool_height, int pool_width, int stride, data_t *y);

#endif /* POOLLAYER_H_ */
