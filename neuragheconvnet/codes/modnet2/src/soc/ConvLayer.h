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

extern "C" {
#include "soc_drivers.h"
}

#include "spatconv.h"

int ConvLayer_exec(SOCMAP soc, SPATCONV sc, DATA* in, DATA* out, int in_height, int in_width, int activation, int pooling, int qf, int precision8, int zero_padding);

int conv_hwce(volatile int * ddr_addr, volatile Conv_params * task_ptr, DATA *W, DATA *x,
         int in_depth, int out_depth, int in_height, int in_width, int fs_h, int fs_w, int maxog, int dil_h, int dil_w, int activation, int pooling, int qf, int precision8, int zero_padding, DATA *y);

void ConvLayer_wait(SOCMAP soc, int job_id);
// void ConvLayer_exec_async(SOCMAP soc, SPATCONV sc, DATA* in, DATA* out, int in_height, int in_width, int activation, int pooling, int pooling_method, int zero_padding);

// int addr_ps_to_pl(long int addr, volatile long int* ddr_addr);
int addr_pl_to_ps(int addr);

#endif /* CONVLAYER_H_ */
