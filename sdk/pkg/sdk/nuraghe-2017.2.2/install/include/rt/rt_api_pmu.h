/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_PMU_H__
#define __RT__RT_API_PMU_H__

#include "hal/pulp.h"

void plp_pmu_regTask(int event, plp_task_t task);

#endif