/*
 * hwce.h
 * Francesco Conti <f.conti@unibo.it>
 *
 * Copyright (C) 2014-2016 ETH Zurich, University of Bologna
 * All rights reserved.
 */

#ifndef	__HWCE_H__
#define __HWCE_H__

#include "hal/pulp.h"
#include "utils.h"

#if HWCE_VERSION == 2
  #include "hal/hwce_v2.h"
#elif HWCE_VERSION == 3
  #include "hal/hwce_v3.h"
#elif HWCE_VERSION == 4
  #include "hal/hwce_v4.h"
#else
  #include "hal/hwce_v2.h"
#endif

#if EU_VERSION == 1
  #include "events.h"
  #include "events_ids.h"
#endif

// if uncommented, wait() for HWCE will use the event (not working in GAP yet)
#if PULP_CHIP != CHIP_GAP
#define HWCE_EVENTS
#endif

// if uncommented, print debug information
// #define HWCE_DEBUG

#if PULP_CHIP == CHIP_FULMINE || PULP_CHIP == CHIP_GAP
  #define HWCE_LBSIZE 32
#else
  #define HWCE_LBSIZE 16
#endif

/* HWCE configuration data structure */

hwce_config_t * hwce_config_init();

void hwce_config_deinit(hwce_config_t *hwce_cfg);

#if HWCE_VERSION >= 3
void hwce_set_weight_stride(unsigned x);

static inline void hwce_enable() {
  *(volatile int*) (EOC_UNIT_BASE_ADDR + (3 << 3)) |=  0xc00;
}
static inline void hwce_disable() {
  *(volatile int*) (EOC_UNIT_BASE_ADDR + (3 << 3)) &= ~0xc00;
}
#else
static inline void hwce_enable() {
  return;
}
static inline void hwce_disable() {
  return;
}
#endif

static inline void hwce_deactivate_events() {
#if EU_VERSION == 1
  int coreID = get_core_id();  
  clear_evnt_buff_low(1 << EVENT_HWCE);
  set_evnt_mask_low( coreID, read_evnt_mask_low(coreID) & ~(1 << EVENT_HWCE) );
#else
  return;
#endif
}

static inline void hwce_trigger() {
  hwce_memory_map->trigger = 1;
}

static inline unsigned hwce_status() {
  return hwce_memory_map->status;
}

static inline unsigned int hwce_acquire() {
  return hwce_memory_map->acquire;
}

static inline unsigned int hwce_running_job() {
  return hwce_memory_map->running_job;
}

static void __attribute__((noinline)) hwce_config0(
  unsigned int weight_stride,
  unsigned no_y_in,
  unsigned is_unsigned,
  unsigned qf,
  unsigned conv_mode,
  unsigned vector_mode,
  unsigned linear_mode
) {
#if HWCE_VERSION >= 4
  hwce_memory_map->wstride_conv_vect_uint_noyin_lin_qf = 0;
  hwce_memory_map->wstride_conv_vect_uint_noyin_lin_qf = ((0xffff & weight_stride) << 16) |
                                                         ((0x3    & conv_mode)     << 11) |
                                                         ((0x3    & vector_mode)   << 9)  |
                                                         ((0x1    & is_unsigned)   << 8)  |
                                                         ((0x1    & no_y_in)       << 7)  |
                                                         ((0x1    & linear_mode)   << 6)  |
                                                         ( 0x3f   & qf);
#endif
}

static void __attribute__((noinline)) hwce_config1(
  unsigned int pix_shift_right,
  unsigned int pix_shift_left,
  unsigned int pix_mode
) {
#if HWCE_VERSION >= 4
  hwce_memory_map->pix_shiftr_mode_shiftl = 0;
#endif
}

static void __attribute__((noinline)) hwce_offload_job(hwce_config_t *hwce_cfg) {
  // hwce_memory_map->hwce_cfg = *hwce_cfg;
  // workaround because memcpy does crap!
#if HWCE_VERSION == 2
  for(int i=0; i<16; i++) {
    ((volatile unsigned *) (&(hwce_memory_map->hwce_cfg)))[i] = ((unsigned *) hwce_cfg)[i];
  }
#elif HWCE_VERSION >= 3
  for(unsigned int i=0; i<sizeof(hwce_config_t)>>2; i++) {
    ((volatile unsigned *) (&(hwce_memory_map->hwce_cfg)))[i] = ((unsigned *) hwce_cfg)[i];
  }
#endif
}

#if HWCE_VERSION == 2

void hwce_set_width_hwce(
  hwce_config_t *hwce_cfg,
  unsigned int n_in_feat,
  unsigned int height,
  unsigned int width_hwce,
  short int fw_hw
);

void hwce_setup(
  hwce_config_t *hwce_cfg,
  short int *weight_ptr,
  short int *x_in_ptr,
  short int *y_in_ptr,
  short int *y_out_ptr,
  unsigned int n_out_feat,
  unsigned int n_in_feat,
  unsigned int height,
  unsigned int width_total,
  unsigned int width_hwce,
  short int fw_hw,
  unsigned no_y_in,
  unsigned is_unsigned,
  unsigned qf,
  unsigned linear_mode,
  unsigned constant_to_sum
);

#elif HWCE_VERSION == 3

static inline void hwce_set_width_hwce(
  hwce_config_t *hwce_cfg,
  unsigned int n_in_feat,
  unsigned int height,
  unsigned int width_hwce,
  short int fw_hw
) {
  int fw_hwce = fw_hw-1;
  hwce_cfg->y_trans_size         = n_in_feat*(height-fw_hwce)*(width_hwce/2-fw_hwce/2);
  hwce_cfg->x_trans_size         = n_in_feat*height*width_hwce/2;
  hwce_cfg->x_line_stride_length = (width_hwce/2)     | (0xffff0000 & hwce_cfg->x_line_stride_length);
  hwce_cfg->y_line_stride_length = (width_hwce/2-4/2) | (0xffff0000 & hwce_cfg->y_line_stride_length);
  hwce_cfg->constsum_linebuflen  = (0xffff & (width_hwce/2)) | (0xffff0000 & hwce_cfg->constsum_linebuflen);
}

static inline void hwce_setup(
  hwce_config_t *hwce_cfg,
  short int *weight_ptr,
  short int *x_in_ptr,
  short int *y_in0_ptr,
  short int *y_in1_ptr,
  short int *y_in2_ptr,
  short int *y_in3_ptr,
  short int *y_out0_ptr,
  short int *y_out1_ptr,
  short int *y_out2_ptr,
  short int *y_out3_ptr,
  unsigned int n_out_feat,
  unsigned int n_in_feat,
  unsigned int height,
  unsigned int width_total,
  unsigned int width_hwce,
  unsigned int weight_stride,
  short int fw_hw,
  unsigned no_y_in,
  unsigned is_unsigned,
  unsigned qf,
  unsigned vector_mode,
  unsigned linear_mode,
  unsigned constant_to_sum
) {
  // width is scaled down by a factor of two because image is 16-bit based
  int fw_hwce = fw_hw-1;
  hwce_cfg->y_trans_size                 = n_in_feat*(height-fw_hwce)*(width_hwce/2-fw_hwce/2);
  hwce_cfg->y_line_stride_length         = ((4*(width_total/2-4/2)) << 16) |
                                           (width_hwce/2-4/2);
  hwce_cfg->y_feat_stride_length         = ((4*(height-4)*(width_total/2-4/2)) << 16) |
                                           (height-4);
  hwce_cfg->y_out0_ptr                   = y_out0_ptr;
  hwce_cfg->y_out1_ptr                   = y_out1_ptr;
  hwce_cfg->y_out2_ptr                   = y_out2_ptr;
  hwce_cfg->y_out3_ptr                   = y_out3_ptr;
  hwce_cfg->y_in0_ptr                    = y_in0_ptr;
  hwce_cfg->y_in1_ptr                    = y_in1_ptr;
  hwce_cfg->y_in2_ptr                    = y_in2_ptr;
  hwce_cfg->y_in3_ptr                    = y_in3_ptr;
  hwce_cfg->x_trans_size                 = n_in_feat*height*width_hwce/2;
  hwce_cfg->x_line_stride_length         = ((4*width_total/2) << 16) |
                                           (width_hwce/2);
  hwce_cfg->x_feat_stride_length         = ((4*height*width_total/2) << 16) |
                                           (height);
  hwce_cfg->x_in_ptr                     = x_in_ptr;
  hwce_cfg->weight_ptr                   = (unsigned int)weight_ptr;
  hwce_cfg->rof_nif                      = ((0xffff & n_in_feat/n_out_feat) << 16) |
                                           ( 0xffff & n_in_feat);
  hwce_cfg->wstride_vect_uint_noyin_lin_qf = 0;
  hwce_cfg->wstride_vect_uint_noyin_lin_qf = ((0xffff & weight_stride) << 16) |
                                             ((0x3    & vector_mode)   << 9)  |
                                             ((0x1    & is_unsigned)   << 8)  |
                                             ((0x1    & no_y_in)       << 7)  |
                                             ((0x1    & linear_mode)   << 6)  |
                                             ( 0x3f   & qf);
  hwce_cfg->constsum_linebuflen          = ((0xffff & constant_to_sum) << 16) |
                                            (0xffff & (width_hwce/2));
}

#elif HWCE_VERSION == 4

static void __attribute__((noinline)) hwce_set_width_hwce(
  hwce_config_t *hwce_cfg,
  unsigned int n_out_feat,
  unsigned int n_in_feat,
  unsigned int height,
  unsigned int width_hwce,
  short int fw_hw,
  short int constsum
) {
  int fw_hwce = fw_hw-1;
  hwce_cfg->y_trans_size        = n_in_feat*(height-fw_hwce)*(width_hwce/2-fw_hwce/2);
  hwce_cfg->x_trans_size        = n_in_feat*height*width_hwce/2;
  hwce_cfg->x_line_length       = (width_hwce/2);
  hwce_cfg->y_line_length       = (width_hwce/2-4/2);
  hwce_cfg->constsum_linebuflen = (constsum << 16) |
                                  ((width_hwce/2) & 0x7ff);
  hwce_cfg->lo_wif_wof_vdis     = ((n_in_feat/n_out_feat) << 8);
}

static void __attribute__((noinline)) hwce_setup(
  hwce_config_t *hwce_cfg,
  short int *weight_ptr,
  short int *x_in_ptr,
  short int *y_in0_ptr,
  short int *y_in1_ptr,
  short int *y_in2_ptr,
  short int *y_in3_ptr,
  short int *y_out0_ptr,
  short int *y_out1_ptr,
  short int *y_out2_ptr,
  short int *y_out3_ptr,
  unsigned int n_out_feat,
  unsigned int n_in_feat,
  unsigned int height,
  unsigned int width_total,
  unsigned int width_hwce,
  short int fw_hw,
  unsigned constant_to_sum,
  unsigned vect_dis_mask
) {
  // width is scaled down by a factor of two because image is 16-bit based
  int fw_hwce = fw_hw-1;
  hwce_cfg->y_trans_size                 = n_in_feat*(height-fw_hwce)*(width_hwce/2-fw_hwce/2);
  hwce_cfg->y_line_stride                = 4*(width_total/2-4/2);
  hwce_cfg->y_line_length                = width_hwce/2-4/2;
  hwce_cfg->y_feat_stride                = 4*(height-4)*(width_total/2-4/2);
  hwce_cfg->y_feat_length                = height-4;
  hwce_cfg->y_out0_ptr                   = y_out0_ptr;
  hwce_cfg->y_out1_ptr                   = y_out1_ptr;
  hwce_cfg->y_out2_ptr                   = y_out2_ptr;
  hwce_cfg->y_out3_ptr                   = y_out3_ptr;
  hwce_cfg->y_in0_ptr                    = y_in0_ptr;
  hwce_cfg->y_in1_ptr                    = y_in1_ptr;
  hwce_cfg->y_in2_ptr                    = y_in2_ptr;
  hwce_cfg->y_in3_ptr                    = y_in3_ptr;
  hwce_cfg->x_trans_size                 = n_in_feat*height*width_hwce/2;
  hwce_cfg->x_line_stride                = 4*width_total/2;
  hwce_cfg->x_line_length                = width_hwce/2;
  hwce_cfg->x_feat_stride                = 4*height*width_total/2;
  hwce_cfg->x_feat_length                = height;
  hwce_cfg->x_in_ptr                     = x_in_ptr;
  hwce_cfg->weight_ptr                   = weight_ptr;
  hwce_cfg->constsum_linebuflen = (constant_to_sum << 16) |
                                  ((width_hwce/2) & 0x7ff);
  hwce_cfg->lo_wif_wof_vdis     = ((n_in_feat/n_out_feat) << 8) | vect_dis_mask;
}

#endif

static inline int hwce_getnum() {
  return NB_HWCE;
}

/* Higher level HWCE APIs */

void hwce_wait(int offload_id); 
void hwce_wait_polling(unsigned offload_id); 

int  hwce_conv_5x5_16x16_async  (short int *W, short int *x, short int *y, int h, int w, int nif, int a, unsigned qf);
void hwce_conv_5x5_16x16        (short int *W, short int *x, short int *y, int h, int w, int nif, int a, unsigned qf);

#if HWCE_VERSION == 2
void hwce_conv_5x5_16x16_fast   (hwce_config_t *hwce_cfg, short int *W_ptr, short int *x_ptr, unsigned int fw_hw, unsigned int h, unsigned int w);
#endif

#if HWCE_VERSION >= 3
int  hwce_conv_5x5_2x8x16_async (short int *W, short int *x, short int *y0, short int *y1, int h, int w, int nif, int a, unsigned qf);
void hwce_conv_5x5_2x8x16       (short int *W, short int *x, short int *y0, short int *y1, int h, int w, int nif, int a, unsigned qf);

int  hwce_conv_5x5_4x4x16_async (short int *W, short int *x, short int *y0, short int *y1, short int *y2, short int *y3, int h, int w, int nif, int a, unsigned qf);
void hwce_conv_5x5_4x4x16       (short int *W, short int *x, short int *y0, short int *y1, short int *y2, short int *y3, int h, int w, int nif, int a, unsigned qf);
#endif

#if HWCE_VERSION >= 4
void hwce_conv_3x3_16x16        (short int *W, short int *x, short int *y, int h, int w, int nif, int a, unsigned qf);
#endif

typedef struct {
  unsigned int *x_ptr;      // Filter current pointer. Already incremented, can be stored directly to job
  unsigned int *yin_ptr;    // yin current pointer. Already incremented, can be stored directly to job
  unsigned int *yout0_ptr;   // yout current pointer. Already incremented, can be stored directly to job
  int wRem;                 // Output width that remains to be notified. 0 means convolution is over
  unsigned int wTrigRem;    // Output width that remains to be enqueued. 0 means there is nothing more to enqueue
  unsigned int yLines;      // Number of lines to be processed on yout
  unsigned int xLines;      // Number of lines to be processed on yin
  unsigned int xLineStride; // X line stride. Although it is constant, we need it to set the 32 bit register containing stride and length. Could not be read from HWCE due to a bug. Also not possible to do 16 bits accesses due to limitation
  unsigned int yLineStride; // Y line stride.
  unsigned int *yout1_ptr;
  unsigned int *yout2_ptr;
  unsigned int *yout3_ptr;
  int wRem_shadow;
} hwceDesc_t;

#if HWCE_VERSION == 3

extern PLP_L1_DATA hwceDesc_t hwceDesc;

void hwce_conv_5x5_16x16_async_irq(unsigned int *W_ptr, unsigned int *x_ptr, unsigned int *yout_ptr, int h, int w, unsigned int inStride, unsigned int outStride, unsigned int config1);

void hwce_conv_5x5_16x16_async_irq_feat(unsigned int *W_ptr, unsigned int *x_ptr, unsigned int *yout_ptr, int h, int w, int nif, int nof, unsigned int config1);
void hwce_conv_5x5_16x16_async_irq_feat_vec2(unsigned int *W_ptr, unsigned int *x_ptr, unsigned int *yout0, unsigned int *yout1, int h, int w, int nif, int nof, unsigned int config1);
void hwce_conv_5x5_16x16_async_irq_feat_vec4(unsigned int *W_ptr, unsigned int *x_ptr, unsigned int *yout0, unsigned int *yout1, unsigned int *yout2, unsigned int *yout3, int h, int w, int nif, int nof, unsigned int config1);

static inline void hwce_conv_wait() {
  while(*(volatile int *)&hwceDesc.wRem > 0) hwce_wait_event();
}

static inline int hwce_conv_isFull() {
  int_disable();
  int result = (hwceDesc.wRem > HWCE_LBSIZE/2 - 2) || (hwceDesc.wRem_shadow);
  int_enable();
  return result;
}

static inline void hwce_conv_wait_free() {
  while(hwce_conv_isFull()) hwce_wait_event();
}

#endif

#endif /* __HWCE_H__ */
