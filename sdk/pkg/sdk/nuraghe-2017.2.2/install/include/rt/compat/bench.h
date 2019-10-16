/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef	__RT_COMPAT_BENCH_H__
#define __RT_COMPAT_BENCH_H__

#include "bar.h"
#include "compat.h"
#include <stdint.h>

typedef struct _testresult_t {
  int time;
  int errors;
} testresult_t;

typedef struct _testcase_t {
  char *name;
  void (*test)(testresult_t* result, void (*start)(), void (*stop)());
} testcase_t;

/**
 * @brief Disables the printf ouput of the function print_summary() and
 * run_suite(). These functions are required to run the bench suite and write
 * the result status. Disabling the output of these functions makes it easier
 * for the testing a chip on the tester setup.
 */
static inline void bench_disable_printf(void);

/**
 * @brief Prints the information and the result (success/fail, time elapsed)
 * of a benchmark.
 * @param[in] test the test.
 * @param[in] result the result of the test.
 */
static inline void print_result(testcase_t *test, testresult_t *result);

static inline void print_summary(unsigned int errors);

/**
 * @brief Runs a single benchmark.
 * @param[in] test the benchmark to run.
 * @param[out] result the result of the benchmark.
 */
static inline void run_benchmark(testcase_t *test, testresult_t *result);


/**
 * @brief Runs a series of benchmarks and prints the results.
 * @param[in] tests an array with the benchmarks to run.
 */
static inline int run_suite(testcase_t *tests);

/**
 * @brief Checks if actual == expected and if not, prints fail_msg and
 * increases the error counter in the testresult struct.
 * This function should be used when a fine grained error reporting is needed
 */
static inline void check_uint32(testresult_t* result, const char* fail_msg, uint32_t actual, uint32_t expected);

/**
 * @brief Starts all performance counters
 */
static inline void perf_start(void) {
#ifdef __riscv__
  cpu_perf_conf_events(CSR_PCER_ALL_EVENTS_MASK);
  cpu_perf_conf(CSR_PCMR_ACTIVE | CSR_PCMR_SATURATE);
#else
  cpu_perf_conf_events(SPR_PCER_ALL_EVENTS_MASK);
  cpu_perf_conf(SPR_PCMR_ACTIVE | SPR_PCMR_SATURATE);
#endif
  start_all_icache_stat_regs();
}

/**
 * @brief Stops all performance counters
 */
static inline void perf_stop(void) {
  cpu_perf_conf(0);
  stop_all_icache_stat_regs();
}

/**
 * @brief Resets all performance counters to 0 without stopping them
 */
static inline void perf_reset(void) {
  cpu_perf_setall(0);
  reset_all_icache_stat_regs();
}

/**
 * @brief Enable a specific performance counter
 */
static inline void perf_enable_id( int eventid){
#ifdef __riscv__
  cpu_perf_conf_events(CSR_PCER_EVENT_MASK(eventid));
  cpu_perf_conf(CSR_PCMR_ACTIVE | CSR_PCMR_SATURATE);
#else
  cpu_perf_conf_events(SPR_PCER_EVENT_MASK(eventid));
  cpu_perf_conf(SPR_PCMR_ACTIVE | SPR_PCMR_SATURATE);
#endif
};


/**
 * @brief Prints all performance counters
 */
static inline void perf_print_all(void);

static inline void plp_power_init() {
#if PULP_CHIP == CHIP_PULP4
  set_pin_function(PIN_CAM_I2S_SDI1+2, FUNC_GPIO);
  set_gpio_pin_direction(PIN_CAM_I2S_SDI1+1, DIR_OUT);
  set_gpio_pin_value(PIN_CAM_I2S_SDI1+1, 0);
#endif
}

static inline void plp_power_start() {
#if PULP_CHIP == CHIP_PULP4
	set_gpio_pin_value(PIN_CAM_I2S_SDI1+1, 1);
#endif
}

static inline void plp_power_stop() {
#if PULP_CHIP == CHIP_PULP4
	set_gpio_pin_value(PIN_CAM_I2S_SDI1+1, 0);
#endif
}
#include "bench.h"
#include "uart.h"
#include "icache_ctrl.h"
#include "hal/pulp.h"
#include "archi/pulp.h"

static inline void bench_disable_printf(void) {
}

static inline void bench_timer_start(void) {
  // setup GPIO for toggling vcd dump
#ifdef UDMA_VERSION
#ifdef PIN_CAM_I2S_SDI1
  if (get_core_id()==0)
    set_gpio_pin_value(PIN_CAM_I2S_SDI1+1, 1);
#endif
#endif
  if (get_core_id()==0)
    start_timer();
#ifdef PROFILE
  perf_start();
#endif
}

static inline void bench_timer_stop(void) {
  if (get_core_id()==0)
    stop_timer();

#ifdef PROFILE
  perf_stop();
#endif

  // setup GPIO for toggling vcd dump
#ifdef UDMA_VERSION
#ifdef PIN_CAM_I2S_SDI1
  if (get_core_id()==0)
    set_gpio_pin_value(PIN_CAM_I2S_SDI1+1, 0);
#endif
#endif
}

static inline void bench_timer_reset(void) {
  if (get_core_id()==0) {
    stop_timer();
    reset_timer();
  }
#ifdef PROFILE
  perf_reset();
#endif
}

static inline void print_result(testcase_t *test, testresult_t *result)
{
  printf("== test: %s -> ", test->name);

  if (result->errors == 0)
    printf("success, ");
  else
    printf("fail, ");

  printf("nr. of errors: %d", result->errors);

  if(result->time == 0)
    printf("\n");
  else
    printf(", execution time: %d\n", result->time);

#ifdef PROFILE
  perf_print_all();
#endif
}

static inline void print_summary(unsigned int errors)
{
  #ifdef RTL_SDK
  volatile int* ptr = (int*)(0x10001000+get_core_id()*4*2);
  ptr[1] = errors;
  #endif

  #ifdef RTL_SDK
  if (errors == 0) {
    ptr[0] = 0xABBAABBA;
  else {
    ptr[0] = 0xDEADBEEF;
  }
  #endif

  printf("==== SUMMARY: ");

  if (errors == 0) {
  	printf("SUCCESS\n");
  } else {
  	printf("FAIL\n");
  }
}

static inline void run_benchmark(testcase_t *test, testresult_t *result)
{
  result->errors = 0;

  bench_timer_reset();

  test->test(result, bench_timer_start, bench_timer_stop);

  result->time = get_time();
}

static inline int run_suite(testcase_t *tests)
{
  // figure out how many tests should be run
  size_t num = 0;
  while(tests[num].name != 0) num++;

  // setup GPIO pin for vcd dumps
#ifdef UDMA_VERSION
#ifdef PIN_CAM_I2S_SDI1
  set_pin_function(PIN_CAM_I2S_SDI1+1, FUNC_GPIO);
  set_gpio_pin_direction(PIN_CAM_I2S_SDI1+1, DIR_OUT);
  set_gpio_pin_value(PIN_CAM_I2S_SDI1+1, 0);
#endif
#endif

  unsigned int errors = 0;
  size_t i;

  // perform the tests
  for (i = 0; i < num; i++) {
    testresult_t result;
    run_benchmark(&tests[i], &result);
    print_result(&tests[i], &result);

    errors += result.errors;
  }

  print_summary(errors);

  return errors;
}

static inline void check_uint32(testresult_t* result, const char* fail_msg, uint32_t actual, uint32_t expected)
{
  if(actual != expected) {
    result->errors += 1;
    printf("%s: Actual %X, expected %X\n", fail_msg, actual, expected);
  }
}

static inline void perf_print_all(void) {
#ifdef __riscv__
  printf("Perf CYCLES: %d\n",      cpu_perf_get(0));
  printf("Perf INSTR: %d\n",       cpu_perf_get(1));
  printf("Perf CINSTR: %d\n",      cpu_perf_get(10));
  printf("Perf LD_STALL: %d\n",    cpu_perf_get(2));
  printf("Perf JR_STALL: %d\n",    cpu_perf_get(3));
  printf("Perf IMISS: %d\n",       cpu_perf_get(4));
  printf("Perf LD: %d\n",          cpu_perf_get(5));
  printf("Perf ST: %d\n",          cpu_perf_get(6));
  printf("Perf JUMP: %d\n",        cpu_perf_get(7));
  printf("Perf BRANCH: %d\n",      cpu_perf_get(8));
  printf("Perf BTAKEN: %d\n",      cpu_perf_get(9));
  printf("Perf LD EXT: %d\n",      cpu_perf_get(11));
  printf("Perf ST EXT: %d\n",      cpu_perf_get(12));
  printf("Perf LD EXT CYC: %d\n",  cpu_perf_get(13));
  printf("Perf ST EXT CYC: %d\n",  cpu_perf_get(14));
  printf("Perf TCDM CONT: %d\n",   cpu_perf_get(15));
#else
  printf("Perf CYCLES: %d\n",      cpu_perf_get(SPR_PCER_CYCLES));
  printf("Perf INSTR: %d\n",       cpu_perf_get(SPR_PCER_INSTR));
  printf("Perf LD_STALL: %d\n",    cpu_perf_get(SPR_PCER_LD_STALL));
  printf("Perf JMP_STALL: %d\n",   cpu_perf_get(SPR_PCER_JMP_STALL));
  printf("Perf IMISS: %d\n",       cpu_perf_get(SPR_PCER_IMISS));
  printf("Perf WBRANCH: %d\n",     cpu_perf_get(SPR_PCER_WBRANCH));
  printf("Perf WBRANCH_CYC: %d\n", cpu_perf_get(SPR_PCER_WBRANCH_CYC));
  printf("Perf LD: %d\n",          cpu_perf_get(SPR_PCER_LD));
  printf("Perf ST: %d\n",          cpu_perf_get(SPR_PCER_ST));
  printf("Perf JUMP: %d\n",        cpu_perf_get(SPR_PCER_JUMP));
  printf("Perf BRANCH: %d\n",      cpu_perf_get(SPR_PCER_BRANCH));
  printf("Perf DELAY NOP: %d\n",   cpu_perf_get(SPR_PCER_DELAY_NOP));
  printf("Perf LD EXT: %d\n",      cpu_perf_get(SPR_PCER_LD_EXT));
  printf("Perf ST EXT: %d\n",      cpu_perf_get(SPR_PCER_ST_EXT));
  printf("Perf LD EXT CYC: %d\n",  cpu_perf_get(SPR_PCER_LD_EXT_CYC));
  printf("Perf ST EXT CYC: %d\n",  cpu_perf_get(SPR_PCER_ST_EXT_CYC));
  printf("Perf TCDM CONT: %d\n",   cpu_perf_get(SPR_PCER_TCDM_CONT));
#endif

  // new ICACHE handles this differently
  // // icache
  // int i;
  // for(i = 0; i < 4; i++) {
  //   printf("I$ bank %d: Read hits %d\n", i, read_hit_icache_reg(i));
  //   printf("I$ bank %d: Trans %d\n",     i, read_trans_icache_reg(i));
  // }
}

#endif