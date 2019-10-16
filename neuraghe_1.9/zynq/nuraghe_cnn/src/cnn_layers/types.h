/******************************************************************************
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 * Author:       Alessandro Varsi - alessandro.varsi@diee.unica.it            *
 *                                                                            *
 * Project:     Convolutional neural network                                  *
 * File:        types.h                                                       *
 * Description: Header defining general purpose data-types and procedures     *
 *                                                                            *
 ******************************************************************************/

#ifndef TYPES_H_
#define TYPES_H_

//#include "bar.h"
#include <stdio.h>
#include <stdlib.h>
//#include <string.h>

typedef signed short int int16_t;

///If FIXED_CONVNET is defined then the Convolutional neural network will work on fixed-point types. Otherwise it will work on floating-point types
#define FIXED_CONVNET

#ifdef FIXED_CONVNET
   // the underlying data type for fixed-point CConvNet
   typedef int16_t data_t;
   // number of bits in the fractional part of the fixed-point data_t
   #define QF 8
   #define FIXED_MUL(a,b) (((int)((int)a*(int)b)) >> QF)
   #define FIXED_DIV(a,b) ((a << QF)/b);
   // max of data_t
   #define DATA_T_MAX 0x7fff
   // useful operations
   #define FIXED2FLOAT(a) (((float) a) / pow(2,QF))
   #define FLOAT2FIXED(a) ((data_t) floor(a * pow(2,QF)))

#else
   // the underlying data type for floating-point CConvNet
   typedef float data_t;
   // max of data_t (or rather, a big number)
   #define DATA_T_MAX 1000.0
   #define FAST_TANH
   // undefine float/fixed conversions
   #define FIXED2FLOAT(a) a
   #define FLOAT2FIXED(a) a
#endif

void read_file(data_t *vett,char *file);
data_t dec_to_data_t(float in);
data_t conversion_float_to_data_t(float val);
float conversion_data_t_to_float(data_t val, int n);
int out_feat_size(int feat_side, int window_side, int stride);
data_t cnn_max(data_t x);
float pow_nur (int b, int e);
float ceil_nur(float val);
float exp_nur (float exp);
float round_nur (float val, int n);
float abs_nur (float val);

#endif /* TYPES_H_ */
