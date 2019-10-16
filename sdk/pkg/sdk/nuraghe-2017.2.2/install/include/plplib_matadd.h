/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@iis.ee.ethz.ch)
 */

#ifndef __PLPLIB_MATADD_H__
#define __PLPLIB_MATADD_H__

#include <stdint.h>

/** @name Matrix addition
  The common parameters are displayed hereafter.
  \param A   The first matrix
  \param B   The second matrix
  \param out The output matrix
  \param W   Width of the matrices
  \param H   Height of the matrices
 */
/**@{*/

/** Unsigned 8 bits matrix addition. 
  */
void plp_matadd_u8(uint8_t *A, uint8_t *B, uint8_t *out, int W, int H);

/** Signed 8 bits matrix addition. 
  */
void plp_matadd_i8(int8_t *A, int8_t *B, int8_t *out, int W, int H);


/** Unsigned 16 bits matrix addition. 
  */
void plp_matadd_u16(uint16_t *A, uint16_t *B, uint16_t *out, int W, int H);

/** Signed 16 bits matrix addition. 
  */
void plp_matadd_i16(int16_t *A, int16_t *B, int16_t *out, int W, int H);


/** Unsigned 32 bits matrix addition. 
  */
void plp_matadd_u32(uint32_t *A, uint32_t *B, uint32_t *out, int W, int H);

/** Signed 32 bits matrix addition. 
  */
void plp_matadd_i32(int32_t *A, int32_t *B, int32_t *out, int W, int H);

//!@}

#endif