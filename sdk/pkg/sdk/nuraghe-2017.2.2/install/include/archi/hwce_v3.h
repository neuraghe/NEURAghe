/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __ARCHI_HWCE_V3_H__
#define __ARCHI_HWCE_V3_H__

#define HWCE_TRIGGER         0x00
#define HWCE_ACQUIRE         0x04
#define HWCE_EVT_ENABLE      0x08
#define HWCE_STATUS          0x0C
#define HWCE_RUNNING_JOB     0x10
#define HWCE_SOFT_CLEAR      0x14
#define HWCE_GEN_CONFIG0     0x18
#define HWCE_GEN_CONFIG1     0x1C

#define HWCE_Y_TRANS_SIZE          0x40
#define HWCE_Y_LINE_STRIDE_LENGTH  0x44
#define HWCE_Y_FEAT_STRIDE_LENGTH  0x48
#define HWCE_Y_OUT_3_BASE_ADDR     0x4C
#define HWCE_Y_OUT_2_BASE_ADDR     0x50
#define HWCE_Y_OUT_1_BASE_ADDR     0x54
#define HWCE_Y_OUT_0_BASE_ADDR     0x58
#define HWCE_Y_IN_3_BASE_ADDR      0x5C
#define HWCE_Y_IN_2_BASE_ADDR      0x60
#define HWCE_Y_IN_1_BASE_ADDR      0x64
#define HWCE_Y_IN_0_BASE_ADDR      0x68
#define HWCE_X_TRANS_SIZE          0x6C
#define HWCE_X_LINE_STRIDE_LENGTH  0x70
#define HWCE_X_FEAT_STRIDE_LENGTH  0x74
#define HWCE_X_IN_BASE_ADDR        0x78
#define HWCE_W_BASE_ADDR           0x7C
#define HWCE_JOB_CONFIG0           0x80
#define HWCE_JOB_CONFIG1           0x84
#define HWCE_JOB_CONFIG2           0x88

#define HWCE_NB_IO_REGS    17

#define HWCE_ACQUIRE_CONTEXT_COPY -3
#define HWCE_ACQUIRE_LOCKED       -2
#define HWCE_ACQUIRE_QUEUE_FULL   -1

#define HWCE_JOB_CONFIG0_WOF(x)     ((x) >> 16)
#define HWCE_JOB_CONFIG0_NIF(x)     ((x) & 0xffff)

#define HWCE_JOB_CONFIG1_WSTRIDE(x) ((x) >> 16)
#define HWCE_JOB_CONFIG1_VECT(x)    (((x) >> 9) & 0x3)
#define HWCE_JOB_CONFIG1_UNS(x)     (((x) >> 8) & 1)
#define HWCE_JOB_CONFIG1_NY(x)      (((x) >> 7) & 1)
#define HWCE_JOB_CONFIG1_LC(x)      (((x) >> 6) & 1)
#define HWCE_JOB_CONFIG1_QF(x)      ((x) & 0x3f)

#define HWCE_JOB_CONFIG2_NOYCONST(x) ((x) >> 16)
#define HWCE_JOB_CONFIG2_LBUFLEN(x)  ((x) & 0xffff)

#define HWCE_JOB_STRIDE(x) ((x) >> 16)
#define HWCE_JOB_LENGTH(x) ((x) & 0xffff)

// linebuffer width in 16-bit half-words
#define HWCE_LBSIZE 32

#endif