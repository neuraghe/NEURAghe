/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@iis.ee.ethz.ch)
 */

#ifndef __PLPSTIM_H__
#define __PLPSTIM_H__

#include "stdint.h"
 
#define PLPSTIM_BUFFER_TYPE_MATRIX       0
#define PLPSTIM_BUFFER_TYPE_VECTOR       1
#define PLPSTIM_BUFFER_TYPE_FLOAT_VECTOR 2

struct kernel_stimuli_s;

typedef struct {
  int type;
  int size;
  uint8_t *l1Values;
  uint8_t *l2Values;
  uint8_t *l2ValuesExpected;
  int isOutput;
  int isInput;
} buffer_t;

typedef struct {
  buffer_t common;
  int width;
  int height;
  int elemSize;
  int len;
  int stride;
} matrix_t;

typedef struct {
  buffer_t common;
  int size;
  int elemSize;
  float error;
} vector_t;

typedef struct kernel_stimuli_s {
  char *debugName;
  int nbBuffers;
  buffer_t **buffers;
  void (*dumpParams)(struct kernel_stimuli_s *stim);
  void (*exec)(struct kernel_stimuli_s *stim);
  float (*getTime)(struct kernel_stimuli_s *stim, float time);
  void *params;
} kernel_stimuli_t;

typedef struct {
	int width;
  int height;
  int norm;
  int shift;
  int inStride;
  int outStride;
  int nif;
  int nof;
} convolution2d_params_t;

typedef convolution2d_params_t plp_conv5x5_u8_norm_params_t;
typedef convolution2d_params_t plp_conv5x5_i8_norm_params_t;
typedef convolution2d_params_t plp_conv5x5_u16_norm_params_t;
typedef convolution2d_params_t plp_conv5x5_i16_norm_params_t;
typedef convolution2d_params_t plp_conv5x5_u16_hw_params_t;
typedef convolution2d_params_t plp_conv5x5_i16_hw_params_t;
typedef convolution2d_params_t plp_conv5x5_u16_hw_strided_params_t;
typedef convolution2d_params_t plp_conv5x5_i16_hw_strided_params_t;
typedef convolution2d_params_t plp_conv5x5_i16_hw_feat_params_t;
typedef convolution2d_params_t plp_conv5x5_i16_hw_feat_vect2_params_t;
typedef convolution2d_params_t plp_conv5x5_i16_hw_feat_vect4_params_t;

typedef struct {
  int width;
  int height;
  int ywidth;
  int clip;
  int shift;
} matmul_params_t;

typedef matmul_params_t plp_matmul_u8_params_t;
typedef matmul_params_t plp_matmul_i8_params_t;
typedef matmul_params_t plp_matmul_u16_params_t;
typedef matmul_params_t plp_matmul_i16_params_t;
typedef matmul_params_t plp_matmul_u8x16_params_t;
typedef matmul_params_t plp_matmul_i8x16_params_t;
typedef matmul_params_t plp_matmul_u16x32_params_t;
typedef matmul_params_t plp_matmul_i16x32_params_t;
typedef matmul_params_t plp_matmul_u32_params_t;
typedef matmul_params_t plp_matmul_i32_params_t;
typedef matmul_params_t plp_matmul_u32x64_params_t;
typedef matmul_params_t plp_matmul_i32x64_params_t;
typedef matmul_params_t plp_matmul_u8_norm_params_t;
typedef matmul_params_t plp_matmul_i8_norm_params_t;
typedef matmul_params_t plp_matmul_u16_norm_params_t;
typedef matmul_params_t plp_matmul_i16_norm_params_t;
typedef matmul_params_t plp_matmul_u32_norm_params_t;
typedef matmul_params_t plp_matmul_i32_norm_params_t;

typedef struct {
  int width;
  int height;
} matmul_ew_params_t;

typedef matmul_ew_params_t plp_matmul_ew_u8_params_t;
typedef matmul_ew_params_t plp_matmul_ew_i8_params_t;
typedef matmul_ew_params_t plp_matmul_ew_u16_params_t;
typedef matmul_ew_params_t plp_matmul_ew_i16_params_t;
typedef matmul_ew_params_t plp_matmul_ew_u8x16_params_t;
typedef matmul_ew_params_t plp_matmul_ew_i8x16_params_t;
typedef matmul_ew_params_t plp_matmul_ew_u16x32_params_t;
typedef matmul_ew_params_t plp_matmul_ew_i16x32_params_t;
typedef matmul_ew_params_t plp_matmul_ew_u32_params_t;
typedef matmul_ew_params_t plp_matmul_ew_i32_params_t;

typedef struct {
  int width;
  int height;
} matadd_params_t;

typedef matadd_params_t plp_matadd_u8_params_t;
typedef matadd_params_t plp_matadd_i8_params_t;
typedef matadd_params_t plp_matadd_u16_params_t;
typedef matadd_params_t plp_matadd_i16_params_t;
typedef matadd_params_t plp_matadd_u32_params_t;
typedef matadd_params_t plp_matadd_i32_params_t;

typedef struct {
  int width;
  int height;
  int threshold;
} threshold_params_t;

typedef threshold_params_t plp_threshold_u8_params_t;
typedef threshold_params_t plp_threshold_i8_params_t;
typedef threshold_params_t plp_threshold_u16_params_t;
typedef threshold_params_t plp_threshold_i16_params_t;
typedef threshold_params_t plp_threshold_u32_params_t;
typedef threshold_params_t plp_threshold_i32_params_t;

typedef struct {
  int nbCoeffs;
  int blockSize;
  int size;
  int version;
} fir_filter_params_t;

typedef fir_filter_params_t plp_fir_filter_q31_params_t;
typedef fir_filter_params_t plp_fir_filter_f32_params_t;
typedef fir_filter_params_t plp_fir_filter_f64_params_t;

#endif
