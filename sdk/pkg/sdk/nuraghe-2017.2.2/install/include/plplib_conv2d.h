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

#ifndef __PLPLIB_CONV2D_H__
#define __PLPLIB_CONV2D_H__

#include <stdint.h>
 
/** @name 2D convolutions
  The common parameters are displayed hereafter. Other specific parameters are documented with the functions. Only the input width and height have to be specified. The output width and height are equal to the input ones minus the width and height of the coefficient matrix minus 1.
  \param in           Input matrix
  \param coeffs       Coefficient matrix
  \param out          Output matrix
  \param width        Width of the input matrix
  \param height       Height of the input matrix
  \param inputStride  Stride for the input matrix (in number of elements). Everytime a number of elements corresponding to the width has been processed, the input matrix pointer is incremented by this number of elements
  \param outputStride Stride for the output matrix (in number of elements). Everytime a number of elements corresponding to the output width has been processed, the output matrix pointer is incremented by this number of elements
 */
/**@{*/

/** Signed 8 bits 5x5 2D convolution
  \param NormFactor    Each output pixel is multiplied by this factor before being shifted
  \param NormShift     Each output pixel is shifted right by this number after it has been multiplied by Normfactor
  */
void plp_conv5x5_i8_norm(int8_t *in, int8_t *coeffs, int8_t *out, unsigned int width, unsigned int height, unsigned int inputStride, unsigned int outputStride, int NormFactor, int NormShift);

/** Unsigned 8 bits 5x5 2D convolution
  \param NormFactor    Each output pixel is multiplied by this factor before being shifted
  \param NormShift     Each output pixel is shifted right by this number after it has been multiplied by Normfactor
  */
void plp_conv5x5_u8_norm(uint8_t *in, uint8_t *coeffs, uint8_t *out, unsigned int width, unsigned int height, unsigned int inputStride, unsigned int outputStride, int NormFactor, int NormShift);

/** Signed 16 bits 5x5 2D convolution
  \param NormFactor    Each output pixel is multiplied by this factor before being shifted
  \param NormShift     Each output pixel is shifted right by this number after it has been multiplied by Normfactor
  */
void plp_conv5x5_i16_norm(int16_t *in, int16_t *coeffs, int16_t *out, unsigned int width, unsigned int height, unsigned int inputStride, unsigned int outputStride, int NormFactor, int NormShift);

/** Unsigned 16 bits 5x5 2D convolution
  \param NormFactor    Each output pixel is multiplied by this factor before being shifted
  \param NormShift     Each output pixel is shifted right by this number after it has been multiplied by Normfactor
  */
void plp_conv5x5_u16_norm(uint16_t *in, uint16_t *coeffs, uint16_t *out, unsigned int width, unsigned int height, unsigned int inputStride, unsigned int outputStride, int NormFactor, int NormShift);

//!@}

#endif