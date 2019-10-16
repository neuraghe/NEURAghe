/*********************************************************************************
 *                                                                               *
 *                   EOLAB @ DIEE - University of Cagliari                       *
 *                          Via Marengo, 2, 09123                                *
 *                       Cagliari - phone 070 675 5009                           *
 *                                                                               *
 * Author:       Alessandro Varsi - alessandro.varsi@diee.unica.it               *
 *                                                                               *
 * Project:     Convolutional neural network                                     *
 * File:        ConvLayer.h                                                      *
 * Description: Header defining interface and main function of Convolution layer *
 *                                                                               *
 *********************************************************************************/

#ifndef CONVLAYER_H_
#define CONVLAYER_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include <math.h>
#include "types.h"

typedef struct {
    int n_in_feat;     ///< number of input feature maps.
    int n_out_feat;    ///< number of output feature maps.
    int filter_height; ///< height of the weight kernel.
    int filter_width;  ///< width of the weight kernel.
    int in_height;     ///< height of the input feature maps.
    int in_width;      ///< width of the input feature maps.
    int out_height;    ///< height of the input feature maps.
    int out_width;     ///< width of the input feature maps.
    int activation;    ///< 1 if ReLu activation, 0 if no activation.
    int stride;
    data_t *wb;         ///< pointer to the weights and biases.
} ConvLayer;

void ConvLayer_new(ConvLayer *layer, data_t *w, int n_in_feat, int n_out_feat, int filter_height, int filter_width, int in_height, int in_width,
                    int out_height, int out_width, int activation, int stride);

void conv_loop(data_t *W, data_t *x, data_t *b, int in_depth, int out_depth, int in_height, int in_width, int out_height, int out_width, int filter_height, int filter_width, int stride, data_t *y);

void ConvLayer_exec(volatile int * ddr_addr, volatile int * soc_addr,ConvLayer *layer, data_t *x, data_t *y);


#endif /* CONVLAYER_H_ */
