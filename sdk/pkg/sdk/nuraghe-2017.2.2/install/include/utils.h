#ifndef _UTILS_H_
#define _UTILS_H_

#include "pulp.h"
#include "int.h"

#define PULP_L2_DATA __attribute__((section(".heapl2ram")))
#define PULP_L1_DATA __attribute__((section(".heapsram")))

#define PLP_L2_DATA PULP_L2_DATA
#define PLP_L1_DATA PULP_L1_DATA
#define PLP_L1_GLOBAL_DATA __attribute__((section(".l1cluster_g")))
#define PLP_FC_DATA __attribute__((section(".fcTcdm")))
#define PLP_FC_GLOBAL_DATA __attribute__((section(".fcTcdm_g")))

#define PLP_BOOT_CODE
#define PLP_BOOT_DATA

#if EU_VERSION >= 3

extern volatile unsigned int socEvents[];

void clear_soc_event(unsigned int event);

void wait_soc_event(unsigned int event);

#endif

#ifndef __riscv__
// write to special purpose register
static inline void
mtspr(unsigned long spr, unsigned long value)
{
  __asm volatile ("l.mtspr\t\t%0,%1,0": : "r" (spr), "r" (value));
}

// read from special purpose register
static inline unsigned long
mfspr(unsigned long spr)
{
  unsigned long value;
  __asm volatile ("l.mfspr\t\t%0,%1,0" : "=r" (value) : "r" (spr));
  return value;
}
#endif

/* For getting core ID. */
static inline int
get_core_id()
{
#ifdef __riscv__
  int hart_id;
#if RISCV_VERSION >= 4
  asm("csrr %0, 0xF14" : "=r" (hart_id) : );
#else
  asm("csrr %0, 0xF10" : "=r" (hart_id) : );
#endif
  // in PULP the hart id is {21'b0, cluster_id, core_id}
  return hart_id & 0x00f;
#else
  unsigned int value;
  __asm ("l.mfspr\t\t%0,r0,%1" : "=r" (value) : "I" (SPR_CORE_ID));
  return value;
#endif
}

/* For getting core ID. */
static inline int
get_cluster_id()
{
#ifdef __riscv__
  int hart_id;
#if RISCV_VERSION >= 4
  asm("csrr %0, 0xF14" : "=r" (hart_id) : );
#else
  asm("csrr %0, 0xF10" : "=r" (hart_id) : );
#endif
  // in PULP the hart id is {21'b0, cluster_id, core_id}
  return (hart_id >> 5) & 0x3F;
#else
  unsigned int value;
  __asm ("l.mfspr\t\t%0,r0,%1" : "=r" (value) : "I" (SPR_CLUSTER_ID));
  return value;
#endif
}

static inline int is_fc() { return get_cluster_id() == 32; }

extern unsigned char __NB_ACTIVE_PE;

// get number of cores
static inline int
get_core_num()
{
#if defined(__ZEDBOARD__) || PULP_CHIP == CHIP_EXACONV || PULP_CHIP_FAMILY == CHIP_NURAGHE
  return NB_PE;
#else
  // read NUM_CORES from apb_soc_ctrl peripheral
#ifdef APB_SOC_CTRL_ADDR
  return apb_soc_nbCores();
#else
  return &__NB_ACTIVE_PE;
#endif
#endif
}


#ifndef __OMP_NEW_RT__

// sets return code per core
void return_code_write(int i);

/* Loops/exits simulation */
void exit(int i);

/* end of computation */
void eoc(int i);

void fetch_enable(unsigned int value);

#endif

static inline unsigned int tas_addr(unsigned int addr) {
  return addr + TEST_AND_SET_OFFSET;
}

#if 0
typedef struct plp_dma_copy_s {
  void (*cb)(struct plp_dma_copy_s *);
  struct plp_dma_copy_s *next;
  unsigned char counter;
  unsigned char finished;
} plp_dma_copy_t;

int plp_dma_memcpy_cb(plp_dma_copy_t *copy, unsigned int ext, unsigned int loc, int loc2ext, unsigned int size, void (*cb)(plp_dma_copy_t *));

void plp_dma_copy_wait(plp_dma_copy_t *copy);

void plp_dma_memcpy_irqMode(int mode);
#endif

#include "hal/debug.h"
extern PLP_L2_DATA debugStruct_t debugStruct;

#endif
