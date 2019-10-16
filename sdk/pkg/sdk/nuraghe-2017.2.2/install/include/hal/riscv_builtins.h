/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_RISCV_BUILTINS_H__
#define __HAL_RISCV_BUILTINS_H__

typedef signed char    v4qi __attribute__((vector_size (4)));
typedef unsigned char  v4qu __attribute__((vector_size (4)));

typedef signed short   v2hi __attribute__((vector_size (4)));
typedef unsigned short v2hu __attribute__((vector_size (4)));

#define plp_abs2(x...) __builtin_pulp_abs2(x)
#define plp_max2(x...) __builtin_pulp_max2(x)
#define plp_min2(x...) __builtin_pulp_min2(x)

#define plp_abs4(x...) __builtin_pulp_abs4(x)
#define plp_max4(x...) __builtin_pulp_max4(x)
#define plp_min4(x...) __builtin_pulp_min4(x)

#define plp_sdotusp4(a, b, c) __builtin_pulp_sdotusp4(a, b, c)
#define plp_dotusp4(a, b)     __builtin_pulp_dotusp4(a, b)
#define plp_sdotusp2(a, b, c) __builtin_pulp_sdotusp2(a, b, c)
#define plp_dotusp2(a, b)     __builtin_pulp_dotusp2(a, b)

#define plp_sdotup4(a, b, c) __builtin_pulp_sdotup4(a, b, c)
#define plp_dotup4(a, b)     __builtin_pulp_dotup4(a, b)
#define plp_sdotup2(a, b, c) __builtin_pulp_sdotup2(a, b, c)
#define plp_dotup2(a, b)     __builtin_pulp_dotup2(a, b)
 
#define plp_sdotsp4(a, b, c) __builtin_pulp_sdotsp4(a, b, c)
#define plp_dotsp4(a, b)     __builtin_pulp_dotsp4(a, b)
#define plp_sdotsp2(a, b, c) __builtin_pulp_sdotsp2(a, b, c)
#define plp_dotsp2(a, b)     __builtin_pulp_dotsp2(a, b)
 
#endif
