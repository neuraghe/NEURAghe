/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@iis.ee.ethz.ch)
 */

#ifndef __PLPLIB_FIR_FILTER_H__
#define __PLPLIB_FIR_FILTER_H__

#include <stdint.h>

#if defined (__USE_CMSIS__)
#include "arm_math.h"
#endif

#define PLP_FIR_CONF(version) (version)

#define PLP_FIR_VERSION_CMSIS_FAST  0
#define PLP_FIR_VERSION_STD         1

#define PLP_FIR_VERSION_OFFSET      0
#define PLP_FIR_VERSION_NBITS       2

#define PLP_FIR_Q31   0
#define PLP_FIR_F32   1
#define PLP_FIR_F64   2

typedef struct {
  int version;
  int blockSize;
  union {
#if defined (__USE_CMSIS__)
    arm_fir_instance_q31 arm;
#endif
    struct {
      int nbCoeffs;
      int32_t *coeffs;
      int32_t *prevAcc;
    } std;
  } u;
} plp_fir_t;

int plp_fir_init_q31(plp_fir_t *fir, int conf, int nbCoeff, int32_t *coeffs, int blockSize);

void plp_fir_q31(plp_fir_t *fir, int32_t *src, int32_t *dst);

#endif