#ifndef __CL_PLATFORM_H__
#define __CL_PLATFORM_H__

#ifdef __STHORM__

#include <stdint.h>

typedef struct {
  uint32_t fabricAddr;
  uint32_t hostAddr;
  int isCacheable;
} cl_mem_platform_t;

#endif

#ifdef __PULP__

#include <stdint.h>

typedef struct {
  uint32_t fabricAddr;
  uint32_t hostAddr;
  int isCacheable;
} cl_mem_platform_t;

#endif

#endif
