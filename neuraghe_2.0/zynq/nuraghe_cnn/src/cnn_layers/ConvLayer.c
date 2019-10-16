/*
 * ConvLayer.cc
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
 * Author:       Gianfranco Deriu - gian.deriu@gmail.com                      *
 * Author:       Alessandro Varsi - alessandro.varsi@diee.unica.it            *
 *                                                                            *
 * Project:     Convolutional neural network                                  *
 * File:        ConvLayer.c                                                   *
 * Description: Sources codes of all procedures declared in ConvLayer.c       *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include <math.h>
#include "types.h"
#include "ConvLayer.h"
#include "../soc_drivers.h"
#include "../colors.h"

///If FIXED_CONVNET is defined then the Convolutional neural network will work on fixed-point types. Otherwise it will work on floating-point types
#define FIXED_CONVNET
#define DEBUG

void ConvLayer_new(ConvLayer *layer, data_t *wb, int n_in_feat, int n_out_feat,
		int filter_height, int filter_width, int in_height, int in_width,
                    int out_height, int out_width, int activation, int stride) {
    /**
    This is the interface of the Convolutional Layer.
    **/
    layer->n_in_feat     = n_in_feat;     ///Number of input features
    layer->n_out_feat    = n_out_feat;    ///Number of output features
    layer->filter_height = filter_height; ///Height of filter
    layer->filter_width  = filter_width;  ///Width of filter
    layer->in_height     = in_height;     ///Height of the input features
    layer->in_width      = in_width;      ///Width of the input features
    layer->out_height    = out_height;    ///Height of the output features
    layer->out_width     = out_width;     ///Width of the output features
    layer->activation    = activation;    ///Flag to decide whether to execute the activation function
    layer->wb             = wb;             ///Weights and biases of all filters
    layer->stride        = stride;        ///Stride ---> we assume to have the same stride on both x- and y-axis

#ifdef DEBUG
    GREEN
    printf ("\t[OK] Convlayer created.\n");
    NC
#endif
    return;
}


int addr_ps_to_pl(int addr, volatile int * ddr_addr){
	//printf("\t 0x%x - 0x%x = 0x%x\n", addr,(int)ddr_addr, addr-(int)ddr_addr);
	return (int)(((addr-(int)ddr_addr)&0x0FFFFFFF)|0x80000000);
}

int addr_pl_to_ps(int addr){
	return 0;
}

void conv_hwce(volatile int * ddr_addr, volatile int * soc_addr, data_t *W, data_t *x,
		int in_depth, int out_depth, int in_height, int in_width, int out_height, int out_width, int fs, data_t *y){

	//use_default_conv_test();
	conv_setup (soc_addr,
			in_depth, // in_f
			out_depth, // out_f
			in_height, // ih
			in_width, // iw
			fs, // fs
			4, // max_og
			1, // max_stores
			1, //enable rectifier activation
			addr_ps_to_pl( (int) W, ddr_addr), // w_addr
			addr_ps_to_pl((int) x, ddr_addr), // x_addr
			addr_ps_to_pl((int) y, ddr_addr)); // y_addr

    CYAN
    printf ("\t[ARM] Triggering conv...\n");
    NC
    trigger_conv(ddr_addr, soc_addr);
    CYAN
    printf ("\t[ARM] Waiting for conv...\n");
    NC
    wait_for_conv(ddr_addr);

}

void conv_loop(data_t *W, data_t *x, data_t *b, int in_depth, int out_depth, int in_height, int in_width,
		int out_height, int out_width, int filter_height, int filter_width, int stride, data_t *y){
    /**
    This function performs the following Conv2D:
    OFi = Sum(for j=0,...,nif) Wij * x[IFj] + bi. * represents the convolution between the set of weights Wij and the j-th feature. bi is added to all elements of the output of the 2D-conv.
    **/
    int m=filter_height*filter_width;   ///Size of each filter
    int n=in_depth*m;                   ///Iteration space of the three most nested loops
    int M=in_height*in_width;           ///Size of each input feature
    int N=out_height*out_width;         ///Size of each output feature
    int fo, out_row, out_col, fi, i, j;

    for(fo=0; fo<out_depth; fo++){
        for(out_row=0; out_row<out_height; out_row++){
            for(out_col=0; out_col<out_width; out_col++){
                int out_index=fo*N+out_row*out_width+out_col;
                *(y+out_index)=*(b+fo);                        ///Initialization each element of the output feature to the related bias
                for(fi=0; fi<in_depth; fi++){
                    for(i=0; i<filter_height; i++){
                        for(j=0; j<filter_width; j++){
                            #ifdef FIXED_CONVNET
                                 *(y+out_index)+=FIXED_MUL((*(W+fo*n+fi*m+m-(i*filter_width+j)-1)),(*(x+fi*M+stride*out_row*in_width+i*in_width+stride*out_col+j)));
                            #else
                                *(y+out_index)+=(*(W+fo*n+fi*m+m-(i*filter_width+j)-1)) * (*(x+fi*M+stride*out_row*in_width+i*in_width+stride*out_col+j));
                            #endif // FIXED_CONVNET
                        }
                    }
                }
            }
        }
    }

    return;
}

void ConvLayer_exec(volatile int * ddr_addr, volatile int * soc_addr, ConvLayer *layer, data_t *x, data_t *y){
    /**
    This procedure executes a convolution and then the ReLU activation function if activation is asserted
    **/
   // int i;
#ifdef DEBUG
    YELLOW
    printf ("[ARM] Executing Convlayer...\n");
    NC
#endif

/*
    conv_loop(
    		layer->w,
			x,
			layer->b,
			layer->n_in_feat,
			layer->n_out_feat,
			layer->in_height,
			layer->in_width,
			layer->out_height,
			layer->out_width,
			layer->filter_height,
			layer->filter_width,
			layer->stride,
			y);

*/


     conv_hwce(ddr_addr,
    		 soc_addr,
    		layer->wb,
			x,
			layer->n_in_feat,
			layer->n_out_feat,
			layer->in_height,
			layer->in_width,
			layer->out_height,
			layer->out_width,
			layer->filter_height,
			y);

    ///ReLU
    /*if(layer->activation){
        for(i=0;i<layer->n_out_feat*layer->out_height*layer->out_width;i++){
            //printf("aa %x \n", *(y+i));
            *(y+i)=cnn_max(*(y+i));
        }
    }*/
#ifdef DEBUG
    GREEN
    printf ("\t [OK] Execution complete!\n");
    NC
#endif
    return;
}
