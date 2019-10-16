/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef ____PULP_H____
#define ____PULP_H____

#include "archi/pulp.h"
#include "hal/pulp.h"

#ifdef PLP_RT
#include "rt/rt_api.h"
#include "rt/compat/compat.h"
#else
#include "rt/pulp.h"
#endif

#endif
