/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef	__RT_COMPAT_COMPAT_H__
#define __RT_COMPAT_COMPAT_H__

#include "pipe_stage.h"
#include "rt/rt_api.h"

#define PULP_L2_DATA PLP_L2_DATA
#define PULP_L1_DATA PLP_L1_DATA

#define get_core_id plp_coreId
#define get_core_num plp_nbActiveCores

#endif