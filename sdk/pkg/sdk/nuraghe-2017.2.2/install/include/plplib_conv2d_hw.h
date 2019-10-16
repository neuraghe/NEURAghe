/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@iis.ee.ethz.ch)
 *          Eric Flamand (eric.flamand@iis.ee.ethz.ch)
 */

#ifndef __PLPLIB_CONV2D_HW_H__
#define __PLPLIB_CONV2D_HW_H__

#if defined(PLP_RT) && defined(HWCE_VERSION) && HWCE_VERSION >=3

#include <stdint.h>
#include "archi/pulp.h"

#if defined(HWCE_VERSION) && HWCE_VERSION == 4
#define HWCE_INLINE static inline
#else
#define HWCE_INLINE
#endif

/** @name 2D convolutions using hardware accelerator
 */
/**@{*/

/** Signed 16 bits 5x5 2D convolution
  \param in           Input matrix
  \param coeffs       Coefficient matrix
  \param out          Output matrix
  \param width        Width of the input matrix
  \param height       Height of the input matrix
  \param NormShift    Each output pixel is shifted right by this number after it has been multiplied by Normfactor
  */
HWCE_INLINE void plp_conv5x5_i16_hw(int16_t *in, int16_t *coeffs, int16_t *out, unsigned int width, unsigned int height, int NormShift);

/** Unsigned 16 bits 5x5 2D convolution
  \param in           Input matrix
  \param coeffs       Coefficient matrix
  \param out          Output matrix
  \param width        Width of the input matrix
  \param height       Height of the input matrix
  \param NormShift    Each output pixel is shifted right by this number after it has been multiplied by Normfactor
  */
HWCE_INLINE void plp_conv5x5_u16_hw(uint16_t *in, uint16_t *coeffs, uint16_t *out, unsigned int width, unsigned int height, int NormShift);

/** Signed strided 16 bits 5x5 2D convolution
  \param in           Input matrix
  \param coeffs       Coefficient matrix
  \param out          Output matrix
  \param width        Width of the input matrix
  \param height       Height of the input matrix
  \param inputStride  Stride for the input matrix (in number of elements). Everytime a number of elements corresponding to the width has been processed, the input matrix pointer is incremented by this number of elements
  \param outputStride Stride for the output matrix (in number of elements). Everytime a number of elements corresponding to the output width has been processed, the output matrix pointer is incremented by this number of elements
  \param NormShift    Each output pixel is shifted right by this number after it has been multiplied by Normfactor
  */
HWCE_INLINE void plp_conv5x5_i16_hw_strided(int16_t *in, int16_t *coeffs, int16_t *out, unsigned int width, unsigned int height, unsigned int inputStride, unsigned int outputStride, int NormShift);

/** Unsigned strided 16 bits 5x5 2D convolution
  \param in           Input matrix
  \param coeffs       Coefficient matrix
  \param out          Output matrix
  \param width        Width of the input matrix
  \param height       Height of the input matrix
  \param inputStride  Stride for the input matrix (in number of elements). Everytime a number of elements corresponding to the width has been processed, the input matrix pointer is incremented by this number of elements
  \param outputStride Stride for the output matrix (in number of elements). Everytime a number of elements corresponding to the output width has been processed, the output matrix pointer is incremented by this number of elements
  \param NormShift    Each output pixel is shifted right by this number after it has been multiplied by Normfactor
  */
HWCE_INLINE void plp_conv5x5_u16_hw_strided(uint16_t *in, uint16_t *coeffs, uint16_t *out, unsigned int width, unsigned int height, unsigned int inputStride, unsigned int outputStride, int NormShift);

/** Signed 16 bits 5x5 2D convolution with features
  \param in           Input matrix
  \param coeffs       Coefficient matrix
  \param out          Output matrix
  \param width        Width of the input matrix
  \param height       Height of the input matrix
  \param nif          Number of input features
  \param nof          Number of output features
  \param NormShift    Each output pixel is shifted right by this number after it has been multiplied by Normfactor
  */
void plp_conv5x5_i16_hw_feat(int16_t *in, int16_t *coeffs, int16_t *out, unsigned int width, unsigned int height, int nif, int nof, int NormShift);

/** Vectorial signed 16 bits 5x5 2D convolution with features
  \param in           Input matrix
  \param coeffs       Coefficient matrix
  \param out0         Output0 matrix
  \param out1         Output1 matrix
  \param width        Width of the input matrix
  \param height       Height of the input matrix
  \param nif          Number of input features
  \param nof          Number of output features
  \param NormShift    Each output pixel is shifted right by this number after it has been multiplied by Normfactor
  */
void plp_conv5x5_i16_hw_feat_vect2(int16_t *in, int16_t *coeffs, int16_t *out0, int16_t *out1, unsigned int width, unsigned int height, int nif, int nof, int NormShift);

/** Vectorial signed 16 bits 5x5 2D convolution with features
  \param in           Input matrix
  \param coeffs       Coefficient matrix
  \param out0         Output0 matrix
  \param out1         Output1 matrix
  \param out2         Output2 matrix
  \param out3         Output3 matrix
  \param width        Width of the input matrix
  \param height       Height of the input matrix
  \param nif          Number of input features
  \param nof          Number of output features
  \param NormShift    Each output pixel is shifted right by this number after it has been multiplied by Normfactor
  */
void plp_conv5x5_i16_hw_feat_vect4(int16_t *in, int16_t *coeffs, int16_t *out0, int16_t *out1, int16_t *out2, int16_t *out3, unsigned int width, unsigned int height, int nif, int nof, int NormShift);




#if defined(HWCE_VERSION) && HWCE_VERSION == 4

static inline void plp_conv5x5_i16_hw_strided(int16_t * __restrict__ In, int16_t * __restrict__ coeffs, int16_t * __restrict__ Out, unsigned int W, unsigned int H, unsigned int inStride, unsigned int outStride, int NormShift)
{
  inStride *= 2;
  outStride *= 2;
  hwce_gen_config0_set(hwce_gen_config0_value(1));
  plp_hwce_5x5_16x16_conv((unsigned int *)coeffs, (unsigned int *)In, (unsigned int *)Out, H, W, inStride, outStride, hwce_job_config1_value(0, 0, 0, 1, 0, NormShift));
  plp_hwce_wait();
}

static inline void plp_conv5x5_u16_hw_strided(uint16_t * __restrict__ In, uint16_t * __restrict__ coeffs, uint16_t * __restrict__ Out, unsigned int W, unsigned int H, unsigned int inStride, unsigned int outStride, int NormShift)
{
  inStride *= 2;
  outStride *= 2;
  hwce_gen_config0_set(hwce_gen_config0_value(1));
  plp_hwce_5x5_16x16_conv((unsigned int *)coeffs, (unsigned int *)In, (unsigned int *)Out, H, W, inStride, outStride, hwce_job_config1_value(0, 0, 1, 1, 0, NormShift));
  plp_hwce_wait();
}

static inline void plp_conv5x5_i16_hw(int16_t *In, int16_t *coeffs, int16_t *Out, unsigned int W, unsigned int H, int NormShift)
{
  hwce_gen_config0_set(hwce_gen_config0_value(1));
  plp_hwce_5x5_16x16_conv((unsigned int *)coeffs, (unsigned int *)In, (unsigned int *)Out, H, W, W*2, (W-4)*2, hwce_job_config1_value(0, 0, 0, 1, 0, NormShift));
  plp_hwce_wait();
}

static inline void plp_conv5x5_u16_hw(uint16_t *In, uint16_t *coeffs, uint16_t *Out, unsigned int W, unsigned int H, int NormShift)
{
  hwce_gen_config0_set(hwce_gen_config0_value(1));
  plp_hwce_5x5_16x16_conv((unsigned int *)coeffs, (unsigned int *)In, (unsigned int *)Out, H, W, W*2, (W-4)*2, hwce_job_config1_value(0, 0, 1, 1, 0, NormShift));
  plp_hwce_wait();
}

#endif

#endif

#endif