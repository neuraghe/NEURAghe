/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@iis.ee.ethz.ch)
 */

#ifndef __PLPLIB_MATMUL_H__
#define __PLPLIB_MATMUL_H__

#include <stdint.h>

/** @name Matrix multiplication
  The common parameters are displayed hereafter. A few ones may not be provided by some kernels.
  \param A    The first matrix
  \param B    The second matrix
  \param out  The output matrix
  \param W_A  Width of the first matrix, and also the height of the second matrix
  \param H_A  Height of the first matrix, and also the height of the output matrix
  \param W_B  Width of the second matrix, and also the width of the output matrix
  \param norm Normalization. Must be an OR of PLPLIB_NORM_* defines like for example PLPLIB_NORM_SAT | PLPLIB_NORM_SHIFT(16)
 */
/**@{*/

/** Unsigned 8 bits matrix multiplication. 
  */
void plp_matmul_u8(uint8_t *A, uint8_t *B, uint8_t *out, int W_A, int H_A, int W_B);

/** Signed 8 bits matrix multiplication. 
  */
void plp_matmul_i8(int8_t *A, int8_t *B, int8_t *out, int W_A, int H_A, int W_B);

/** Unsigned 16 bits matrix multiplication. 
  */
void plp_matmul_u16(uint16_t *A, uint16_t *B, uint16_t *out, int W_A, int H_A, int W_B);

/** Signed 16 bits matrix multiplication. 
  */
void plp_matmul_i16(int16_t *A, int16_t *B, int16_t *out, int W_A, int H_A, int W_B);

/** Unsigned 32 bits matrix multiplication. 
  */
void plp_matmul_u32(uint32_t *A, uint32_t *B, uint32_t *out, int W_A, int H_A, int W_B);

/** Signed 32 bits matrix multiplication. 
  */
void plp_matmul_i32(int32_t *A, int32_t *B, int32_t *out, int W_A, int H_A, int W_B);

/** Unsigned 8 bits matrix multiplication with normalization. 
  */
void plp_matmul_u8_norm(uint8_t *A, uint8_t *B, uint8_t *out, int W_A, int H_A, int W_B, int norm);

/** Signed 8 bits matrix multiplication. 
  */
void plp_matmul_i8_norm(int8_t *A, int8_t *B, int8_t *out, int W_A, int H_A, int W_B, int norm);

/** Unsigned 16 bits matrix multiplication. 
  */
void plp_matmul_u16_norm(uint16_t *A, uint16_t *B, uint16_t *out, int W_A, int H_A, int W_B, int norm);

/** Signed 16 bits matrix multiplication. 
  */
void plp_matmul_i16_norm(int16_t *A, int16_t *B, int16_t *out, int W_A, int H_A, int W_B, int norm);

/** Unsigned 32 bits matrix multiplication. 
  */
void plp_matmul_u32_norm(uint32_t *A, uint32_t *B, uint32_t *out, int W_A, int H_A, int W_B, int norm);

/** Signed 32 bits matrix multiplication. 
  */
void plp_matmul_i32_norm(int32_t *A, int32_t *B, int32_t *out, int W_A, int H_A, int W_B, int norm);


//!@}

#endif