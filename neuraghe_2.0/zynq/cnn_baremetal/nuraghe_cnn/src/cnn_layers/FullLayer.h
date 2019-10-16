/*
 * FullLayer.h
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
 * File:        FullLayer.h                                                         *
 * Description: Header defining interface and main function of Full connected layer *
 *                                                                                  *
 ************************************************************************************/

#ifndef FULLLAYER_H_
#define FULLLAYER_H_

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
    int activation;    ///< 1 if ReLu activation, 0 if no activation.
    data_t *w;         ///< pointer to the weights.
    data_t *b;         ///< pointer to the biases.
} FullLayer;

void FullLayer_new(FullLayer *layer, int n_in_feat, int n_out_feat, int in_height, int in_width, int activation, data_t *w, data_t *b);

void FullLayer_exec(FullLayer *layer, data_t *x, data_t *y);

void fc_conv(data_t *w, data_t *b, data_t *x, data_t *y, int nif, int in_height, int in_width, int nof);


#endif /* FULLLAYER_H_ */
