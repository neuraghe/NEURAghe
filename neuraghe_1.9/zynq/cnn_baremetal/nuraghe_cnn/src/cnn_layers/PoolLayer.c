/*
 * PoolLayer.cc
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
 * Description: Sources codes of all procedures declared in PoolLayer.c       *
 *                                                                            *
 ******************************************************************************/

#include "PoolLayer.h"
#include "types.h"
#include "../colors.h"

///If FIXED_CONVNET is defined then the Convolutional neural network will work on fixed-point types. Otherwise it will work on floating-point types
#define FIXED_CONVNET
#define DEBUG

void PoolLayer_new(PoolLayer *layer, int n_feat, int pool_height, int pool_width, int height, int width, int out_height, int out_width, int stride){
    /**
    This is the interface of the Max Pooling Layer.
    **/
    layer->n_feat      = n_feat;      ///Number of input features. The number of output features is the same
    layer->pool_height = pool_height; ///Height of the pooling window
    layer->pool_width  = pool_width;  ///Width of the pooling window
    layer->height      = height;      ///Height of the input features
    layer->width       = width;       ///Width of the input features
    layer->out_height  = out_height;  ///Height of the output features
    layer->out_width   = out_width;   ///Width of the output features
    layer->stride = stride;           ///Stride of the pooling window. We assume that this value is the same for both x- and y-axis
#ifdef DEBUG
    GREEN
    printf ("\t[OK] PoolLayer created.\n");
    NC
#endif
    return;
}

void max_pooling_loop(data_t *x, int depth, int in_height, int in_width, int out_height, int out_width, int pool_height, int pool_width, int stride, data_t *y){
    /**
    This procedure executes the max pooling function which is basically a sub-sampling function.
    The pooling window slides all over the input features and each output element is the maximum value of the sub-feature sampled by the window.
    Ex: one 4x4 feature, 2x2 pooling window and stride=2 (no overlapping)
        3 5 1 6
        1 9 4 2  ----Max pooling returns --->  9 6
        0 2 5 5                                4 5
        1 4 4 1
    **/
    int fo,out_row,out_col,i;
    int M=in_height*in_width;   ///Input feature size
    int N=out_height*out_width; ///Output feature size
    int g, slot;

    data_t m1,m2, max;

    for(fo=0;fo<depth/4;fo++){
    	for (g=0; g<4; g++){
			slot=fo*4*M + g*2;
			if (x[slot]>x[slot+1])
				m1= x[slot];
			else
				m1= x[slot];

			if (x[slot + in_width*4]>x[slot + in_width*4 +1])
				m2= x[slot + in_width*4];
			else
				m2= x[slot + in_width*4 +1];
			if (m1>m2)
				max=m1;
			else
				max=m2;
			y[fo*4*N + g]=max;

    	}
    }
    return;
}

int max4 (int val0, int val1, int val2, int val3) {
  int m0, m1;

  if (val0>val1)
    m0=val0;
  else
    m0=val1;

  if (val2>val3)
    m1=val2;
  else
    m1=val3;

  if (m0>m1)
    return m0;
  else
    return m1;
}

void max_pooling_interlaced4 (data_t *x, int depth, int in_height, int in_width, int out_height, int out_width, int pool_height, int pool_width, int stride, data_t *y){

	int f, g, h, w;


	int px0, px1, px2, px3;

	for (f=0;f<depth/4;f++){
	        for (g=0;g<4;g++){
	            for (h=0;h<out_height;h++){
	                for (w=0; w<out_width; w++){
	                    px0= f*4 * in_height * in_width + g*2 + h*stride* in_width * 4 + w * stride*4;
	                    px1 = px0 + 1;
	                    px2 = px0 + in_width *4;
	                    px3 = px2 + 1;

	                    int max = max4(x[px0], x[px1], x[px2], x[px3]);

	                    int y_pos= f*4*out_height*out_width + g*2 + (h*out_width + w)%2 + (h*out_width + w)/2*8;

	                    y[y_pos]=max;

	                   // if (px0==0)printf("%d %d %d %d -> %d @ %d\n", x[px0],x [px1], x[px2], x[px3], max, y_pos);


	                }
	            }
	        }
	    }
}

void PoolLayer_exec(PoolLayer *layer, data_t *x, data_t *y) {
    /**
    This procedure only calls the max pooling function. I wrote it only to keep the same layout for all layers.
    **/

#ifdef DEBUG
	YELLOW
    printf ("[ARM] Executing PoolLayer...\n");
	NC
#endif
    /*
    max_pooling_loop(
    		x,
			layer->n_feat,
    		layer->height,
			layer->width,
			layer->out_height,
			layer->out_width,
			layer->pool_height,
			layer->pool_width,
			layer->stride,
			y);
    */
    max_pooling_interlaced4(
        		x,
    			layer->n_feat,
        		layer->height,
    			layer->width,
    			layer->out_height,
    			layer->out_width,
    			layer->pool_height,
    			layer->pool_width,
    			layer->stride,
    			y);

#ifdef DEBUG
	GREEN
    printf ("\t [OK] Execution complete!\n");
	NC
#endif
    return;
}

