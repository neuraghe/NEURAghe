/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_HWCE_H__
#define __RT__RT_API_HWCE_H__

#if defined(HWCE_VERSION) && HWCE_VERSION >= 3

static inline void plp_hwce_wait_event() {
	eu_evt_maskWaitAndClr(1 << PLP_RT_NOTIF_HWCE);
}

static inline void plp_hwce_wait() {
  while(*(volatile int *)&hwce_wRem > 0) plp_hwce_wait_event();
}

static inline int plp_hwce_isFull();

static inline void hwce_conv_wait_free() {
  while(plp_hwce_isFull()) plp_hwce_wait_event();
}

void plp_hwce_5x5_16x16_conv(short int *W, short int *x, short int *y, int h, int w, int inStride, int outStride, int config1);
void plp_hwce_5x5_16x16_feat(short int *W, short int *x, short int *y, int h, int w, int nif, int wof, int config1);
void plp_hwce_5x5_2x8x16_feat(short int *W, short int *x, short int *y0, short int *y1, int h, int w, int nif, int wof, int config1);
void plp_hwce_5x5_4x4x16_feat(short int *W, short int *x, short int *y0, short int *y1, short int *y2, short int *y3, int h, int w, int nif, int wof, int config1);

static inline void plp_hwce_5x5_16x16(short int *W, short int *x, short int *y, int h, int w, int nif, int nof, unsigned qf, int wStride)
{
  plp_hwce_5x5_16x16_feat(W, x, y, h, w, nif, nof, hwce_job_config1_value(wStride, 0, 0, 0, 0, qf));
}

static inline void plp_hwce_5x5_2x8x16(short int *W, short int *x, short int *y0, short int *y1, int h, int w, int nif, int nof, unsigned qf, int wStride)
{
  plp_hwce_5x5_2x8x16_feat(W, x, y0, y1, h, w, nif, nof, hwce_job_config1_value(wStride, 0, 1, 0, 0, qf));
}

static inline void plp_hwce_5x5_4x4x16(short int *W, short int *x, short int *y0, short int *y1, short int *y2, short int *y3, int h, int w, int nif, int nof, unsigned qf, int wStride)
{
  plp_hwce_5x5_4x4x16_feat(W, x, y0, y1, y2, y3, h, w, nif, nof, hwce_job_config1_value(wStride, 0, 2, 0, 0, qf));
}

#endif

#endif
