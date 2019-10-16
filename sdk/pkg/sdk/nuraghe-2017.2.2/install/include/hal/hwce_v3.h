/*
 * hwce_v3.h
 * Francesco Conti <f.conti@unibo.it>
 *
 * Copyright (C) 2014-2016 ETH Zurich, University of Bologna
 * All rights reserved.
 */

#ifndef	__HWCE_HAL_H__
#define __HWCE_HAL_H__

#include "archi/pulp.h"
#include "hal/pulp.h"

#if HWCE_VERSION != 3
#error This file must be included only with HWCE version 3
#endif

#define NB_HWCE 1

/*
 * Register layout in case of NB_Y_STREAMS = 4
 * =====================================================================
 *  # reg |  bits   |   bitmask    ||  content
 * -------+---------+--------------++-----------------------------------
 *     0  |  31: 0  |  0xffffffff  ||  y trans_size
 *     1  |  31:16  |  0xffff0000  ||  y line_stride
 *        |  15: 0  |  0x0000ffff  ||  y line_length
 *     2  |  31:16  |  0xffff0000  ||  y feat_stride
 *        |  15: 0  |  0x0000ffff  ||  y feat_length
 *     3  |  31: 0  |  0xffffffff  ||  y_out[0] base_addr (logic y_out[3])
 *     4  |  31: 0  |  0xffffffff  ||  y_out[1] base_addr (logic y_out[2])
 *     5  |  31: 0  |  0xffffffff  ||  y_out[2] base_addr (logic y_out[1])
 *     6  |  31: 0  |  0xffffffff  ||  y_out[3] base_addr (logic y_out[0])
 *     7  |  31: 0  |  0xffffffff  ||  y_in[0] base_addr (logic y_in[3])
 *     8  |  31: 0  |  0xffffffff  ||  y_in[1] base_addr (logic y_in[2])
 *     9  |  31: 0  |  0xffffffff  ||  y_in[2] base_addr (logic y_in[1])
 *    10  |  31: 0  |  0xffffffff  ||  y_in[3] base_addr (logic y_in[0])
 *    11  |  31: 0  |  0xffffffff  ||  x trans_size
 *    12  |  31:16  |  0xffff0000  ||  x line_stride
 *        |  15: 0  |  0x0000ffff  ||  x line_length
 *    13  |  31:16  |  0xffff0000  ||  x feat_stride
 *        |  15: 0  |  0x0000ffff  ||  x feat_length
 *    14  |  31: 0  |  0xffffffff  ||  x_in base_addr
 *    15  |  31: 0  |  0xffffffff  ||  weight base_addr
 *    16  |  31:16  |  0xffff0000  ||  roll_out_feat   
 *        |  15: 0  |  0x0000ffff  ||  nb_in_feat   
 *    17  |  31:16  |  0xffff0000  ||  weight stride
 *        |  15:11  |  0x0000f800  ||  UNUSED
 *        |  10: 9  |  0x00000600  ||  vector mode
 *        |      8  |  0x00000100  ||  unsigned multiplication
 *        |      7  |  0x00000080  ||  no y_in mode
 *        |      6  |  0x00000040  ||  linear convolution mode
 *        |   5: 0  |  0x0000003f  ||  fixed-point format (QF)
 *    18  |  31:16  |  0xffff0000  ||  constant to sum in no y_in mode
 *        |  15: 0  |  0x0000ffff  ||  linebuffer length
 * =====================================================================
 */

// This data structure represents context-dependent registers
typedef struct {
  unsigned int y_trans_size;
  unsigned int y_line_stride_length;
  unsigned int y_feat_stride_length;
  short    int *y_out3_ptr;
  short    int *y_out2_ptr;
  short    int *y_out1_ptr;
  short    int *y_out0_ptr;
  short    int *y_in3_ptr;
  short    int *y_in2_ptr;
  short    int *y_in1_ptr;
  short    int *y_in0_ptr;
  unsigned int x_trans_size;
  unsigned int x_line_stride_length;
  unsigned int x_feat_stride_length;
  short    int *x_in_ptr;
  unsigned int weight_ptr;
  unsigned int rof_nif;
  unsigned int wstride_vect_uint_noyin_lin_qf;
  unsigned int constsum_linebuflen;
} __attribute__((__packed__)) hwce_config_t;

// This data structure represent other registers + unused mmap space
typedef struct {
  unsigned int trigger;
  unsigned int acquire;
  unsigned int sync_mode;
  unsigned int status;
  unsigned int running_job;
  unsigned int soft_clear;
  unsigned int reserved_mandatory_0;
  unsigned int reserved_mandatory_1;
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

/* LOW-LEVEL HAL */
#define HWCE_ADDR_BASE  HWCE_BASE_ADDR
#define HWCE_ADDR_SPACE 0x00000100

static volatile hwce_mmap_t *hwce_memory_map = (hwce_mmap_t *) (HWCE_ADDR_BASE);


static inline void hwce_y_trans_size_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_Y_TRANS_SIZE, value);
}

static inline void hwce_y_line_stride_length_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_Y_LINE_STRIDE_LENGTH, value);
}

static inline void hwce_y_feat_stride_length_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_Y_FEAT_STRIDE_LENGTH, value);
}

static inline void hwce_y_out_3_base_addr_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_Y_OUT_3_BASE_ADDR, value);
}

static inline void hwce_y_out_2_base_addr_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_Y_OUT_2_BASE_ADDR, value);
}

static inline void hwce_y_out_1_base_addr_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_Y_OUT_1_BASE_ADDR, value);
}

static inline void hwce_y_out_0_base_addr_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_Y_OUT_0_BASE_ADDR, value);
}

static inline void hwce_y_in_3_base_addr_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_Y_IN_3_BASE_ADDR, value);
}

static inline void hwce_y_in_2_base_addr_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_Y_IN_2_BASE_ADDR, value);
}

static inline void hwce_y_in_1_base_addr_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_Y_IN_1_BASE_ADDR, value);
}

static inline void hwce_y_in_0_base_addr_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_Y_IN_0_BASE_ADDR, value);
}

static inline void hwce_x_trans_size_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_X_TRANS_SIZE, value);
}

static inline void hwce_x_line_stride_length_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_X_LINE_STRIDE_LENGTH, value);
}

static inline void hwce_x_feat_stride_length_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_X_FEAT_STRIDE_LENGTH, value);
}

static inline void hwce_x_in_base_addr_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_X_IN_BASE_ADDR, value);
}

static inline void hwce_w_base_addr_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_W_BASE_ADDR, value);
}

static inline void hwce_job_config0_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_JOB_CONFIG0, value);
}

static inline void hwce_job_config1_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_JOB_CONFIG1, value);
}

static inline void hwce_job_config2_set(unsigned int value) {
  pulp_write32(HWCE_ADDR_BASE + HWCE_JOB_CONFIG2, value);
}

static inline unsigned int hwce_job_config0_value(unsigned int nif, unsigned int wof) {
  return (wof << 16) | nif;
}
 
static inline unsigned int hwce_job_config1_value(unsigned int weight_stride, unsigned vector_mode, unsigned is_unsigned, unsigned no_y_in, unsigned linear_mode, unsigned qf) {
  return (weight_stride << 16) |
    (vector_mode   << 9)  |
    (is_unsigned   << 8)  |
    (no_y_in       << 7)  |
    (linear_mode   << 6)  |
    (qf);
}

static inline void hwce_wait_event() {
  eu_evt_maskWaitAndClr(1 << EVENT_HWCE);
}

static inline void hwce_trigger_job() {
  pulp_write32(HWCE_ADDR_BASE + HWCE_TRIGGER, 1);
}

static inline unsigned int hwce_acquire_job() {
  return pulp_read32(HWCE_ADDR_BASE + HWCE_ACQUIRE);
}

static inline void plp_hwce_enable() {
  *(volatile int*) (EOC_UNIT_BASE_ADDR + (3 << 3)) |=  0xc00;
}

static inline void plp_hwce_disable() {
  *(volatile int*) (EOC_UNIT_BASE_ADDR + (3 << 3)) &= ~0xc00;
}

#endif /* __HWCE_HAL_H__ */

