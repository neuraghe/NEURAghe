/*
 * SoftmaxLayer.h
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
 * File:        SoftmaxLayer.h                                                      *
 * Description: Header defining interface and main function of Softmax layer        *
 *                                                                                  *
 ************************************************************************************/

#ifndef SOFTMAXLAYER_H_
#define SOFTMAXLAYER_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "types.h"

typedef struct {
    int n_in_feat;     ///< number of input feature maps.
    int n_out_feat;    ///< number of output feature maps.
    int in_height;     ///< height of the input feature maps.
    int in_width;      ///< width of the input feature maps.
    data_t *w;         ///< pointer to the weights.
    data_t *b;         ///< pointer to the biases.
} SoftmaxLayer;

void SoftmaxLayer_new(SoftmaxLayer *layer, int n_in_feat, int n_out_feat, int in_height, int in_width, data_t *w, data_t *b);

void SoftmaxLayer_exec(SoftmaxLayer *layer, data_t *x, data_t *y);

#endif /* SOFTMAXLAYER_H_ */
