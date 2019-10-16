/*
 * SoftmaxLayer.cc
 *
 *  Created on: May 30, 2016
 *      Author: alessandro
 */
/******************************************************************************
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 * Author:       Alessandro Varsi - alessandro.varsi@diee.unica.it            *
 *                                                                            *
 * Project:     Convolutional neural network                                  *
 * File:        SoftmaxLayer.c                                                *
 * Description: Sources codes of all procedures declared in SoftmaxLayer.c    *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "types.h"
#include "SoftmaxLayer.h"
#include "FullLayer.h"
#include "../colors.h"
//#include "DebuggingFunctionSet.h"

///If FIXED_CONVNET is defined then the Convolutional neural network will work on fixed-point types. Otherwise it will work on floating-point types
#define FIXED_CONVNET
#define DEBUG

void SoftmaxLayer_new(SoftmaxLayer *layer, int n_in_feat, int n_out_feat, int in_height, int in_width, data_t *w, data_t *b){
    /**
    This is the interface of the Softmax Layer. We actually need it because this layer may include a Full Connected Layer, especially when the previous
    Full Connected Layer returns a number of outputs higher than the number of classes.
    **/

    layer->n_in_feat=n_in_feat;    ///Number of elements of input array
    layer->n_out_feat=n_out_feat;  ///Number of elements of output array. It's supposed to be equal to the number of classes
    layer->in_height=in_height;    ///Height of input features. It's always equal to 1. For further explanation see "Number of output features" in FullLayer.c
    layer->in_width=in_width;      ///Height of input features. It's always equal to 1 for the above-quoted reason
    layer->w=w;                    ///Matrix of weights
    layer->b=b;                    ///Array of biases
#ifdef DEBUG
    GREEN
    printf ("\t[OK] Softmax Layer created.\n");
    NC
#endif
    return;
}


void SoftmaxLayer_exec(SoftmaxLayer *layer, data_t *x, data_t *y){
    /**
    This procedure potentially executes a dot product and then it performes the softmax function which returns an array of real values in the range [0,1].
    Each element of this array represents the predicted probability for the j-th class. More precisely, the softmax function executes the following
    vector equation:
                                          exp(y_i)
                     out_j = ------------------------------------
                              sum(for i=0,..,nr_classes) exp(y_i)

    as many times as the number of classes.
    **/
#ifdef DEBUG
    YELLOW
    printf ("[ARM] Executing SoftMax Layer...\n");
    NC
#endif
    int i;
    float sum=0;
    fc_conv(layer->w, layer->b, x, y, layer->n_in_feat, layer->in_height, layer->in_width, layer->n_out_feat);

    ///Softmax function
    #ifdef FIXED_CONVNET
        for(i=0;i<layer->n_out_feat;i++){
        	sum+=exp_nur(conversion_data_t_to_float(*(y+i),16));
        //	printf ("sum: %f; exp: %x->%f; e^exp: %f\n", sum, *(y+i), conversion_data_t_to_float(*(y+i),16), exp_nur(conversion_data_t_to_float(*(y+i),16)));
        }
        for(i=0;i<layer->n_out_feat;i++){
        	*(y+i)=conversion_float_to_data_t(exp_nur(conversion_data_t_to_float(*(y+i),16))/sum);
        }
    #else
        for(i=0;i<layer->n_out_feat;i++) sum+=exp(*(y+i));

        for(i=0;i<layer->n_out_feat;i++) *(y+i)=exp(*(y+i))/sum;
    #endif // FIXED_CONVNET
#ifdef DEBUG
    GREEN
    printf ("\t [OK] Execution complete!\n");
    NC
#endif

    return;
}
