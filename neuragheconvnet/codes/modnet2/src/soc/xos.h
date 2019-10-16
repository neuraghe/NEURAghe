#ifndef XOS_H
#define XOS_H


#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#ifdef __cplusplus
extern "C" {
#endif

#ifndef BAREMETAL
 #define USE_COLORS
 #define MEM_MAPPING
#else
 #ifdef LOAD_INSTR_FROM_FILE
  #undef LOAD_INSTR_FROM_FILE
 #endif
#endif

#if !(_RELEASE_)
	#define _rprintf_(...) printf(__VA_ARGS__)
	#ifdef _DEBUG_
		#define _dprintf_(...) printf(__VA_ARGS__)
	#else
		#define _dprintf_(...) do{}while(0)
	#endif
#else
	#define _rprintf_(...) do{}while(0)
	#define _dprintf_(...) do{}while(0)
#endif

#ifdef _TIME_
	#define _tcreate_(a) double a = get_wall_time()
	#define _tprintf_(...) printf(__VA_ARGS__)
#else
	#define _tcreate_(a) do{}while(0)
	#define _tprintf_(...) do{}while(0)
#endif

#ifdef __CI__
	#define _cprintf_(...) printf(__VA_ARGS__)
#else
	#define _cprintf_(...) do{}while(0)
#endif


#define __FILENAME__ (strrchr(__FILE__, '/') ? strrchr(__FILE__, '/') + 1 : __FILE__)

#define QUOTE(name) #name
#define STR_VALUE(macro) QUOTE(macro)

#define UNUSED(x) (void)(x)
#define OK 0
#define ERR -1

typedef int RET;
typedef unsigned int ITER;

#ifdef __cplusplus
}
#endif

#endif
