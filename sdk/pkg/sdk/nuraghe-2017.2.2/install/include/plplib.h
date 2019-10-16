/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@iis.ee.ethz.ch)
 *          Eric Flamand (eric.flamand@iis.ee.ethz.ch)
 */

#ifndef __PLPLIB_H__
#define __PLPLIB_H__

#include "pulp.h"

#define PLPLIB_NORM_SHIFT(value) ((value) & 0xff)
#define PLPLIB_NORM_CLIP(value) (((value) & 0xff) << 8)

#include <plplib_matmul_ew.h>
#include <plplib_matmul.h>
#include <plplib_matadd.h>
#include <plplib_conv2d.h>
#include <plplib_conv2d_hw.h>
#include <plplib_threshold.h>
#include <plplib_fir_filter.h>

#endif