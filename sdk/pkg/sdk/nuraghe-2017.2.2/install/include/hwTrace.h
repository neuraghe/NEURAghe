#ifndef __HWTRACE_H__
#define __HWTRACE_H__

#include "hal/pulp.h"
#include <hwPerf.h>

#ifdef TRACE_BASE_ADDR

#define TRACE_OMP_MASTER_ENTER 0
#define TRACE_OMP_MASTER_EXIT 1

#define TRACE_OMP_PARALLEL_ENTER 2
#define TRACE_OMP_PARALLEL_EXIT 3

#define TRACE_OMP_BARRIER_ENTER 4
#define TRACE_OMP_BARRIER_EXIT 5

#define TRACE_OMP_CRITICAL_ENTER 6
#define TRACE_OMP_CRITICAL_EXIT 7

#define TRACE_PERF_COUNTERS_ENTER 8
#define TRACE_PERF_COUNTERS_EXIT 9

#define TRACE_KERNEL_DECLARE   256
#define TRACE_KERNEL_START     257
#define TRACE_KERNEL_PAUSE     258
#define TRACE_KERNEL_RESUME    259
#define TRACE_KERNEL_STOP      260

#define TRACE_USER_ENTER(id)          ((1<<16) + ((id) << 1))
#define TRACE_USER_EXIT(id)           ((1<<16) + ((id) << 1) + 1)

static inline void pulp_trace(unsigned int msg) {
  unsigned int channelId = core_id();
  *(volatile int *)(TRACE_BASE_ADDR + (channelId << 3)) = msg;
}

static inline void pulp_trace_data(unsigned int msg) {
  unsigned int channelId = core_id();
  *(volatile int *)(TRACE_BASE_ADDR + (channelId << 3) + 4) = msg;
}

static inline void pulp_trace_dumpCounters() {
  // Inform the tools about which events are being traced
  pulp_trace_data(cpu_perf_conf_events_get());
  pulp_trace_data(get_time());
#ifdef ASIC
  pulp_trace_data(cpu_perf_get(0));
#else
  int i;
  for (i=0; i<PCER_NB_EVENTS; i++)
    {
      pulp_trace_data(cpu_perf_get(i));
    }
#endif
}

static inline void pulp_trace_perf(unsigned int msg) {
#if !defined(MIA)
#if !defined(__riscv__)
  int isExit = msg & 1;
  if (!isExit) pulp_trace(msg);
  pulp_trace(isExit ? TRACE_PERF_COUNTERS_EXIT : TRACE_PERF_COUNTERS_ENTER);
  pulp_trace_dumpCounters();
  if (isExit) pulp_trace(msg);
#endif
#endif
}

/*
 * HW traces for generating kernel statistics
 */

/* Declare a kernel. All traces using the specified ID will refer to this kernel
 *  id   : Identifier of the kernel, must be unique
 *  name : Name of the kernel, just used for improving statistic reporting
 */
static inline void pulp_trace_kernel_declare(unsigned int id, char *name)
{
  pulp_trace(TRACE_KERNEL_DECLARE);
  pulp_trace_data(id);
  while(*name != 0)  {
    pulp_trace_data(*name);
    name++;
  }
}

/* Notify kernel execution start
 * Starting from this point, the kernel is considered as executing instructions
 * that are accounted on this kernel.
 *  id           : ID of the kernel, must be the one given when the kernel has been declared 
 *  dumpCounters : also dump core HW counters in order to have more detailed statistics
 */
static inline void pulp_trace_kernel_start(unsigned int id, int dumpCounters)
{
  pulp_trace(TRACE_KERNEL_START);
  pulp_trace_data(id);
  if (dumpCounters) pulp_trace_dumpCounters();
}

/* Notify kernel execution pause
 * Starting from this call, instructions are not accounted on the kernel anymore.
 * However the kernel is still considered as executing instructions and can be resumed.
 * This is useful when the kernel is executing something that should not be accounted.
 *  id           : ID of the kernel, must be the one given when the kernel has been declared 
 *  dumpCounters : also dump core HW counters in order to have more detailed statistics
 */
static inline void pulp_trace_kernel_pause(unsigned int id, int dumpCounters)
{
  pulp_trace(TRACE_KERNEL_PAUSE);
  pulp_trace_data(id);
  if (dumpCounters) pulp_trace_dumpCounters();
}

/* Notify kernel execution release
 * Starting from this call, instructions are accounted again on the kernel.
 * This should be called only after a call to pulp_trace_kernel_pause.
 *  id           : ID of the kernel, must be the one given when the kernel has been declared 
 *  dumpCounters : also dump core HW counters in order to have more detailed statistics
 */
static inline void pulp_trace_kernel_resume(unsigned int id, int dumpCounters)
{
  pulp_trace(TRACE_KERNEL_RESUME);
  pulp_trace_data(id);  
  if (dumpCounters) pulp_trace_dumpCounters();
}

/* Notify kernel execution end.
 * Starting from this call, instructions are not accounted on the kernel anymore
 * and the kernel execution is considered over.
 *  id           : ID of the kernel, must be the one given when the kernel has been declared 
 *  dumpCounters : also dump core HW counters in order to have more detailed statistics
 */
static inline void pulp_trace_kernel_stop(unsigned int id, int dumpCounters)
{
  pulp_trace(TRACE_KERNEL_STOP);
  pulp_trace_data(id);
  if (dumpCounters) pulp_trace_dumpCounters();
}

#endif

#endif