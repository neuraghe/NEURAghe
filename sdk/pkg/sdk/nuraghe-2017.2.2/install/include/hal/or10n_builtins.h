/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_OR10N_BUILTINS_H__
#define __HAL_OR10N_BUILTINS_H__

typedef  char    v4qi __attribute__((vector_size (4)));
typedef unsigned char  v4qu __attribute__((vector_size (4)));

typedef signed short   v2hi __attribute__((vector_size (4)));
typedef unsigned short v2hu __attribute__((vector_size (4)));

#ifndef ABS
#define ABS(x) (x >= 0 ? x : -x)
#endif
#ifndef MAX
#define MAX(x,y) (x >= y ? x : y)
#endif
#ifndef MIN
#define MIN(x,y) (x < y ? x : y)
#endif

#define plp_abs2(x)   ((v2hi){ ABS((x)[0]), ABS((x)[1]) })
#define plp_max2(x,y) ((v2hi){ MAX((x)[0],(y)[0]), MAX((x)[1],(y)[1]) })
#define plp_min2(x,y) ((v2hi){ MIN((x)[0],(y)[0]), MIN((x)[1],(y)[1]) })

#define plp_abs4(x)   ((v4qi) { ABS((x)[0]), ABS((x)[1]), ABS((x)[2]), ABS((x)[3]) })
#define plp_max4(x,y) ((v4qi) { MAX((x)[0],(y)[0]), MAX((x)[1],(y)[1]), MAX((x)[2],(y)[2]), MAX((x)[3],(y)[3]) })
#define plp_min4(x,y) ((v4qi) { MIN((x)[0],(y)[0]), MIN((x)[1],(y)[1]), MIN((x)[2],(y)[2]), MIN((x)[3],(y)[3]) })

#define plp_sdotusp4(a, b, c) (c + (a)[0]*(b)[0] + (a)[1]*(b)[1] + (a)[2]*(b)[2] + (a)[3]*(b)[3])
#define plp_dotusp4(a, b)    (    (a)[0]*(b)[0] + (a)[1]*(b)[1] + (a)[2]*(b)[2] + (a)[3]*(b)[3])
#define plp_sdotusp2(a, b, c) (c + (a)[0]*(b)[0] + (a)[1]*(b)[1])
#define plp_dotusp2(a, b)    (    (a)[0]*(b)[0] + (a)[1]*(b)[1])

#define plp_sdotup4(a, b, c) plp_sdotusp4(a, b, c)
#define plp_dotup4(a, b)    plp_dotusp4(a, b)
#define plp_sdotup2(a, b, c) plp_sdotusp2(a, b, c)
#define plp_dotup2(a, b)    plp_dotusp2(a, b, c)

#define plp_sdotsp4(a, b, c) plp_sdotusp4(a, b, c)
#define plp_dotsp4(a, b)    plp_dotusp4(a, b)
#define plp_sdotsp2(a, b, c) plp_sdotusp2(a, b, c)
#define plp_dotsp2(a, b)    plp_dotusp2(a, b, c)

#endif
