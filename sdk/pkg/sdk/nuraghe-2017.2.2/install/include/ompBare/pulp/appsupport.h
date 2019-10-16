/* Copyright 2014 DEI - Universita' di Bologna
   author       DEI - Universita' di Bologna
                Alessandro Capotondi - alessandro.capotondi@unibo.it
                Germain Haugou - haugoug@iis.ee.ethz.ch
		Andrea Marongiu - a.marongiu@unibo.it
   info         Appsupport for PULP */

#ifndef __APPSUPPORT_H__
#define __APPSUPPORT_H__

#include <stdint.h>
#include <hal/pulp.h>

static inline uint32_t
get_proc_id( )
{
#ifdef NATIVE
  return 0x0U;
#else
#if PULP_CHIP_FAMILY != CHIP_FULMINE
  return plp_coreId();
#else
  unsigned int value;
  __asm__ ("l.mfspr\t\t%0,r0,%1" : "=r" (value) : "I" (SPR_CORE_ID));
  return value;
#endif  
#endif
}

static inline uint32_t
get_cl_id( )
{
#ifdef NATIVE
  return 0x0U;
#else
#if PULP_CHIP_FAMILY != CHIP_FULMINE
  return plp_clusterId();
#else    
  unsigned int value;
  __asm__ ("l.mfspr\t\t%0,r0,%1" : "=r" (value) : "I" (SPR_CLUSTER_ID));
  return value;
#endif
#endif
}

static inline uint32_t
get_num_procs()
{
#if PULP_CHIP_FAMILY != CHIP_FULMINE
  return plp_nbCores();
#else  
  return *(volatile unsigned short*)(APB_SOC_CTRL_ADDR + 0x12);
#endif
}

static inline uint32_t
get_num_clusters()
{
#if PULP_CHIP_FAMILY != CHIP_FULMINE
  return plp_nbClusters();
#else  
  return *(volatile unsigned short*)(APB_SOC_CTRL_ADDR + 0x10);
#endif
}

/*************************************************************
 * Print functions *
 *************************************************************/

#define _printdecp(a, b) printf("%s %d - Processor %d\n", a, b, get_proc_id())
#define _printdect(a, b) printf("%s %d - Time %d\n", a, b, get_time())
#define _printdecn(a, b) printf("%s %d\n", a, b)

#define _printhexp(a, b) printf("%s %x - Processor %d\n", a, b, get_proc_id())
#define _printhext(a, b) printf("%s %x - Time %d\n", a, b, get_time())
#define _printhexn(a, b) printf("%s %x\n", a, b)

#define _printstrp(a) printf("%s - Processor %d\n", a, get_proc_id())
#define _printstrt(a) printf("%s - Time %d\n", a, get_time())
#define _printstrn(a) printf("%s\n", a)

void abort( );

#endif // __APPSUPPORT_H__
