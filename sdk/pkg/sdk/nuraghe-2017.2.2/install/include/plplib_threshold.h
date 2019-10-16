/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@iis.ee.ethz.ch)
 */

#ifndef __PLPLIB_THRESHOLD_H__
#define __PLPLIB_THRESHOLD_H__

#include <stdint.h>

/** @name Matrix threshold
  The common parameters are displayed hereafter.
  \param A   The input matrix
  \param out The output matrix
  \param W   Width of the matrices
  \param H   Height of the matrices
  \param T   The threshold
 */
/**@{*/

/** Unsigned 8 bits matrix threshold. 
  */
void plp_threshold_u8(uint8_t *A, uint8_t *out, int W, int H, uint8_t T);

/** Signed 8 bits matrix threshold. 
  */
void plp_threshold_i8(int8_t *A, int8_t *out, int W, int H, int8_t T);


/** Unsigned 16 bits matrix threshold. 
  */
void plp_threshold_u16(uint16_t *A, uint16_t *out, int W, int H, uint16_t T);

/** Signed 16 bits matrix threshold. 
  */
void plp_threshold_i16(int16_t *A, int16_t *out, int W, int H, int16_t T);


/** Unsigned 32 bits matrix threshold. 
  */
void plp_threshold_u32(uint32_t *A, uint32_t *out, int W, int H, uint32_t T);

/** Signed 32 bits matrix threshold. 
  */
void plp_threshold_i32(int32_t *A, int32_t *out, int W, int H, int32_t T);

//!@}

#endif