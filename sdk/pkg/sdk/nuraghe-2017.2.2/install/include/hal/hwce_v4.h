/*
 * hwce_v4.h
 * Francesco Conti <f.conti@unibo.it>
 *
 * Copyright (C) 2014-2016 ETH Zurich, University of Bologna
 * All rights reserved.
 */

#ifndef	__HWCE_HAL_H__
#define __HWCE_HAL_H__

#include "hal/pulp.h"

#if HWCE_VERSION != 4
#error This file must be included only with HWCE version 4
#endif

#define NB_HWCE 1

/*
 * Control and generic configuration register layout
 * =====================================================================
 *  # reg |  bits   |   bitmask    ||  content
 * -------+---------+--------------++-----------------------------------
 *     0  |  31: 0  |  0xffffffff  ||  TRIGGER
 *     1  |  31: 0  |  0xffffffff  ||  ACQUIRE
 *     2  |  31: 0  |  0xffffffff  ||  EVT_ENABLE
 *     3  |  31: 0  |  0xffffffff  ||  STATUS
 *     4  |  31: 0  |  0xffffffff  ||  RUNNING_JOB
 *     5  |  31: 0  |  0xffffffff  ||  SOFT_CLEAR
 *   6-7  |         |              ||  Reserved
 *     8  |  31:16  |  0xffff0000  ||  WSTRIDE
 *        |  15:13  |  0x0000e000  ||  Reserved
 *        |  12:11  |  0x00001800  ||  CONV
 *        |  10: 9  |  0x00000600  ||  VECT
 *        |      8  |  0x00000100  ||  UNS
 *        |      7  |  0x00000080  ||  NY
 *        |      6  |  0x00000040  ||  LC
 *        |   5: 0  |  0x0000003f  ||  QF
 *     9  |  31: 0  |  0xffffffff  ||  GEN_CONFIG1 (reserved)
 * =====================================================================
 *
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
 *    16  |  31:16  |  0xffff0000  ||  constant to sum in no y_in mode   
 *        |  15:10  |  0x0000fa00  ||  Reserved
 *        |   9: 0  |  0x0000ffff  ||  linebuffer virtual length
 *    17  |  31:25  |  0xfe000000  ||  Reserved
 *        |     24  |  0x01000000  ||  loop order
 *        |  23:22  |  0x00c00000  ||  Reserved
 *        |  21:16  |  0x003f0000  ||  input feat map rolling parameter
 *        |  15:14  |  0x0000c000  ||  Reserved
 *        |  13: 8  |  0x00003f00  ||  input feat map rolling parameter
 *        |   7: 4  |  0x000000f0  ||  Reserved
 *        |   3: 0  |  0x0000000f  ||  vector disable mask
 * =====================================================================
 *
 */


// This data structure represents context-dependent registers
typedef struct {
  unsigned       int y_trans_size;
  unsigned short int y_line_length;
  unsigned short int y_line_stride;
  unsigned short int y_feat_length;
  unsigned short int y_feat_stride;
           short int *y_out3_ptr;
           short int *y_out2_ptr;
           short int *y_out1_ptr;
           short int *y_out0_ptr;
           short int *y_in3_ptr;
           short int *y_in2_ptr;
           short int *y_in1_ptr;
           short int *y_in0_ptr;
  unsigned       int x_trans_size;
  unsigned short int x_line_length;
  unsigned short int x_line_stride;
  unsigned short int x_feat_length;
  unsigned short int x_feat_stride;
           short int *x_in_ptr;
  unsigned       int weight_ptr;
  unsigned       int constsum_linebuflen;
  unsigned       int lo_wif_wof_vdis;
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
  unsigned int wstride_conv_vect_uint_noyin_lin_qf;
  unsigned int pix_shiftr_mode_shiftl;
  unsigned int reserved_generic_2;
  unsigned int reserved_generic_3;
  unsigned int reserved_generic_4;
  unsigned int reserved_generic_5;
  unsigned int reserved_generic_6;
  unsigned int reserved_generic_7;
  hwce_config_t hwce_cfg;
} __attribute__((__packed__)) hwce_mmap_t;

// linebuffer width in 16-bit half-words
#define HWCE_LBSIZE 32

/* LOW-LEVEL HAL */
#define HWCE_ADDR_BASE  HWCE_BASE_ADDR
#define HWCE_ADDR_SPACE 0x00000100

static volatile hwce_mmap_t *hwce_memory_map = (hwce_mmap_t *) (HWCE_ADDR_BASE);

// For all the following functions we use __builtin_pulp_OffsetedWrite and __builtin_pulp_OffsetedRead
// instead of classic load/store because otherwise the compiler is not able to correctly factorize
// the HWCE base in case several accesses are done, ending up with twice more code

#ifdef __riscv__
#define HWCE_WRITE(value, offset) __builtin_pulp_OffsetedWrite(value, (int *)HWCE_ADDR_BASE, offset)
#define HWCE_READ(offset) __builtin_pulp_OffsetedRead((int *)HWCE_ADDR_BASE, offset)
#else
#define HWCE_WRITE(value, offset) pulp_write32(HWCE_ADDR_BASE + (offset), value)
#define HWCE_READ(offset) pulp_read32(HWCE_ADDR_BASE + (offset))
#endif

static inline void hwce_y_trans_size_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_Y_TRANS_SIZE);
}

static inline void hwce_y_line_stride_length_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_Y_LINE_STRIDE_LENGTH);
}

static inline void hwce_y_feat_stride_length_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_Y_FEAT_STRIDE_LENGTH);
}

static inline void hwce_y_out_3_base_addr_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_Y_OUT_3_BASE_ADDR);
}

static inline void hwce_y_out_2_base_addr_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_Y_OUT_2_BASE_ADDR);
}

static inline void hwce_y_out_1_base_addr_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_Y_OUT_1_BASE_ADDR);
}

static inline void hwce_y_out_0_base_addr_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_Y_OUT_0_BASE_ADDR);
}

static inline void hwce_y_in_3_base_addr_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_Y_IN_3_BASE_ADDR);
}

static inline void hwce_y_in_2_base_addr_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_Y_IN_2_BASE_ADDR);
}

static inline void hwce_y_in_1_base_addr_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_Y_IN_1_BASE_ADDR);
}

static inline void hwce_y_in_0_base_addr_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_Y_IN_0_BASE_ADDR);
}

static inline void hwce_x_trans_size_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_X_TRANS_SIZE);
}

static inline void hwce_x_line_stride_length_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_X_LINE_STRIDE_LENGTH);
}

static inline void hwce_x_feat_stride_length_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_X_FEAT_STRIDE_LENGTH);
}

static inline void hwce_x_in_base_addr_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_X_IN_BASE_ADDR);
}

static inline void hwce_w_base_addr_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_W_BASE_ADDR);
}

static inline void hwce_gen_config0_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_GEN_CONFIG0);
}
 
static inline void hwce_job_config0_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_JOB_CONFIG0);
}

static inline void hwce_job_config1_set(unsigned int value) {
  HWCE_WRITE(value, HWCE_JOB_CONFIG1);
}

static inline unsigned int hwce_gen_config0_value(int nf) {
  return nf << 6;
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
  HWCE_WRITE(0, HWCE_TRIGGER);
}

static inline unsigned int hwce_acquire_job() {
  return HWCE_READ(HWCE_ACQUIRE);
}

static inline void plp_hwce_enable() {
  *(volatile int*) (EOC_UNIT_BASE_ADDR + (3 << 3)) |=  0xc00;
}

static inline void plp_hwce_disable() {
  *(volatile int*) (EOC_UNIT_BASE_ADDR + (3 << 3)) &= ~0xc00;
}

#endif /* __HWCE_HAL_H__ */

