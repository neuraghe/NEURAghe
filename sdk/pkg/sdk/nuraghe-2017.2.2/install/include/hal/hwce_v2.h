/*
 * hwce_v2.h
 * Francesco Conti <f.conti@unibo.it>
 *
 * Copyright (C) 2014-2016 ETH Zurich, University of Bologna
 * All rights reserved.
 */

#ifndef	__HWCE_HAL_H__
#define __HWCE_HAL_H__

#include "hal/pulp.h"

#if HWCE_VERSION != 2
#error This file must be included only with HWCE version 2
#endif

#define NB_HWCE 1

/*
 * Register layout (contexted registers)
 * =====================================================================
 *  # reg |  bits   |   bitmask    ||  content
 * -------+---------+--------------++-----------------------------------
 *     0  |  31: 0  |  0xffffffff  ||  y_out base_addr
 *     1  |  31: 0  |  0xffffffff  ||  y_out trans_size
 *     2  |  31:16  |  0xffff0000  ||  y_out line_stride
 *        |  15: 0  |  0x0000ffff  ||  y_out line_length
 *     3  |  31:16  |  0xffff0000  ||  y_out feat_stride
 *        |  15: 0  |  0x0000ffff  ||  y_out feat_length
 *     4  |  31: 0  |  0xffffffff  ||  y_in base_addr
 *     5  |  31: 0  |  0xffffffff  ||  y_in trans_size
 *     6  |  31:16  |  0xffff0000  ||  y_in line_stride
 *        |  15: 0  |  0x0000ffff  ||  y_in line_length
 *     7  |  31:16  |  0xffff0000  ||  y_in feat_stride
 *        |  15: 0  |  0x0000ffff  ||  y_in feat_length
 *     8  |  31: 0  |  0xffffffff  ||  x_in base_addr
 *     9  |  31: 0  |  0xffffffff  ||  x_in trans_size
 *    10  |  31:16  |  0xffff0000  ||  x_in line_stride
 *        |  15: 0  |  0x0000ffff  ||  x_in line_length
 *    11  |  31:16  |  0xffff0000  ||  x_in feat_stride
 *        |  15: 0  |  0x0000ffff  ||  x_in feat_length
 *    12  |  31: 0  |  0xffffffff  ||  weight base_addr
 *    13  |  31:16  |  0xffff0000  ||  filter_size
 *        |  15: 0  |  0x0000ffff  ||  mask
 *    14  |  31:16  |  0xffff0000  ||  nb_in_feat
 *        |  15: 9  |  0x0000fe00  ||  UNUSED
 *        |      8  |  0x00000100  ||  unsigned multiplication
 *        |      7  |  0x00000080  ||  no y_in mode
 *        |      6  |  0x00000040  ||  UNUSED
 *        |   5: 0  |  0x0000003f  ||  fixed-point format (QF)   
 *    15  |  31:17  |  0xfffe0000  ||  UNUSED
 *        |     16  |  0x00010000  ||  linear convolution mode
 *        |  15: 0  |  0x0000ffff  ||  linebuffer length
 * =====================================================================
 */

// This data structure represents context-dependent registers
typedef struct {
  short    int *y_out_ptr;
  unsigned int y_out_trans_size;
  unsigned int y_out_line_stride_length;
  unsigned int y_out_feat_stride_length;
  short    int *y_in_ptr;
  unsigned int y_in_trans_size;
  unsigned int y_in_line_stride_length;
  unsigned int y_in_feat_stride_length;
  short    int *x_in_ptr;
  unsigned int x_in_trans_size;
  unsigned int x_in_line_stride_length;
  unsigned int x_in_feat_stride_length;
  unsigned int weight_ptr;
  unsigned int fs_mask;
  unsigned int nif_uint_noyin_qf;
  unsigned int lin_linebuflen;
} __attribute__((__packed__)) hwce_config_t;

// This data structure represent other registers + unused mmap space
typedef struct {
  unsigned int trigger;
  unsigned int acquire;
  unsigned int sync_mode;
  unsigned int status;
  unsigned int running_job;
  unsigned int reserved_mandatory_0;
  unsigned int reserved_mandatory_1;
  unsigned int reserved_mandatory_2;
  unsigned int reserved_generic_0;
  unsigned int reserved_generic_1;
  unsigned int reserved_generic_2;
  unsigned int reserved_generic_3;
  unsigned int reserved_generic_4;
  unsigned int reserved_generic_5;
  unsigned int reserved_generic_6;
  unsigned int reserved_generic_7;
  hwce_config_t hwce_cfg;
} __attribute__((__packed__)) hwce_mmap_t;

// linebuffer width in 32-bit words
#if PULP_CHIP == CHIP_MIA
  #define HWCE_LBSIZE 16
#endif

/* LOW-LEVEL HAL */
#define HWCE_ADDR_BASE  HWCE_BASE_ADDR
#define HWCE_ADDR_SPACE 0x00000100

static volatile hwce_mmap_t *hwce_memory_map = (hwce_mmap_t *) (HWCE_ADDR_BASE);

static inline void plp_hwce_enable() {
}

static inline void plp_hwce_disable() {
}

#endif /* __HWCE_HAL_H__ */
