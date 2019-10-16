/*
 * FullLayer.cc
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
 * File:        PoolLayer.c                                                   *
 * Description: Sources codes of all procedures declared in FullLayer.c       *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "types.h"
#include "FullLayer.h"
#include "../colors.h"

///If FIXED_CONVNET is defined then the Convolutional neural network will work on fixed-point types. Otherwise it will work on floating-point types
#define FIXED_CONVNET
#define DEBUG

void FullLayer_new(FullLayer *layer, int n_in_feat, int n_out_feat, int in_height, int in_width, int activation, data_t *w, data_t *b){
    /**
    This is the interface of the Full Connected Layer.
    **/
    layer->n_in_feat=n_in_feat;    ///Number of input features
    layer->n_out_feat=n_out_feat;  ///Number of output features. Each feature is actually a scalar
    layer->in_height=in_height;    ///Height of the input features
    layer->in_width=in_width;      ///Width of the input features
    layer->activation=activation;  ///Flag to decide whether to execute the ReLU activation function
    layer->w=w;                    ///Matrix of weights
    layer->b=b;                    ///Array of biases
#ifdef DEBUG
    GREEN
    printf ("\t[OK] Full Layer created.\n");
    NC
#endif
    return;
}

void fc_conv(data_t *w, data_t *b, data_t *x, data_t *y, int nif, int in_height, int in_width, int nof){
    /**
    This procedure executes the following equation:
    y = x * W + b
    x * W is an array-by-matrix product between x and W.
    x is an array containing all input features attached together.
    W is the matrix of weights.
    b is the array of biases.
    **/
    int i,j, dim;
    dim=nif*in_height*in_width;
    for(i=0;i<nof;i++){
        *(y+i)=*(b+i);
        #ifndef FIXED_CONVNET
            for(j=0;j<dim;j++)
            	*(y+i)+=(*(x+j)) * (*(w+i*dim+j));
        #else
            for(j=0;j<dim;j++){
            	*(y+i)+=FIXED_MUL((*(x+j)), (*(w+i*dim+j)));
            	//printf ("[%d %d] %d * %d = %x; %x\n",i, j, (*(x+j)) , (*(w+i*dim+j)),FIXED_MUL((*(x+j)), (*(w+i*dim+j))), *(y+i));
            }
        #endif // FIXED_CONVNET
    }
   // int k;
   // for(k=0;k<16*128*4*4;k++){
    			//printf ("[%d] %x\n",k, w[k]);
    //		}
    return;
}

void FullLayer_exec(FullLayer *layer, data_t *x, data_t *y){
    /**
    You may think of a Full Connected Layer as a Convolutional Layer where all weights and inputs are connected together.
    Therefore, in this situation, the convolution turns into a dot product. fc_conv executes the dot product and then
    ReLU activation function is executed if activation is asserted.
    **/
#ifdef DEBUG
    YELLOW
    printf ("[ARM] Executing Full Layer...\n");
    NC
#endif
    int i;
    fc_conv(layer->w, layer->b, x, y, layer->n_in_feat, layer->in_height, layer->in_width, layer->n_out_feat);
    ///ReLU
    for(i=0;i<layer->n_out_feat;i++){
        if(layer->activation) *(y+i)=cnn_max(*(y+i));
    }
#ifdef DEBUG
    GREEN
    printf ("\t [OK] Execution complete!\n");
    NC
#endif
    return;
}

