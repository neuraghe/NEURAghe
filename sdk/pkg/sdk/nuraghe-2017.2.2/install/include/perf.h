#ifndef __PERF_H__
#define __PERF_H__

#include "pulp.h"

#ifdef __riscv__


static inline void perf_start() {
}

static inline void perf_stop() {
}

static inline void perf_reset() {
}

static inline void perf_enable_all() {
}

static inline unsigned perf_get_cycles() {
  return 0;
}

static inline unsigned perf_get_instr() {
  return 0;
}

static inline unsigned perf_get_ld_stall() {
  return 0;
}

static inline unsigned perf_get_jmp_stall() {
  return 0;
}

static inline unsigned perf_get_imiss() {
  return 0;
}

static inline unsigned perf_get_wbranch() {
  return 0;
}

static inline unsigned perf_get_wbranch_cyc() {
  return 0;
}

static inline unsigned perf_get_ld() {
  return 0;
}

static inline unsigned perf_get_st() {
  return 0;
}

static inline unsigned perf_get_jump() {
  return 0;
}

static inline unsigned perf_get_branch() {
  return 0;
}

static inline unsigned perf_get_delay_nop() {
  return 0;
}

static inline unsigned perf_get_ld_ext() {
  return 0;
}

static inline unsigned perf_get_st_ext() {
  return 0;
}

static inline unsigned perf_get_ld_ext_cyc() {
  return 0;
}

static inline unsigned perf_get_st_ext_cyc() {
  return 0;
}

static inline unsigned perf_get_tcdm_cont() {
  return 0;
}


#else

#include "archi/pulp.h"
#include "pulp.h"

#define N_PERF_REGS               17

#define SPR_PCCR_CYCLES           SPR_PCCR(SPR_PCER_CYCLES)
#define SPR_PCCR_INSTR            SPR_PCCR(SPR_PCER_INSTR)
#define SPR_PCCR_LD_STALL         SPR_PCCR(SPR_PCER_LD_STALL)
#define SPR_PCCR_JMP_STALL        SPR_PCCR(SPR_PCER_JMP_STALL)
#define SPR_PCCR_IMISS            SPR_PCCR(SPR_PCER_IMISS)
#define SPR_PCCR_WBRANCH          SPR_PCCR(SPR_PCER_WBRANCH)
#define SPR_PCCR_WBRANCH_CYC      SPR_PCCR(SPR_PCER_WBRANCH_CYC)
#define SPR_PCCR_LD               SPR_PCCR(SPR_PCER_LD)
#define SPR_PCCR_ST               SPR_PCCR(SPR_PCER_ST)
#define SPR_PCCR_JUMP             SPR_PCCR(SPR_PCER_JUMP)
#define SPR_PCCR_BRANCH           SPR_PCCR(SPR_PCER_BRANCH)
#define SPR_PCCR_DELAY_NOP        SPR_PCCR(SPR_PCER_DELAY_NOP)
#define SPR_PCCR_LD_EXT           SPR_PCCR(SPR_PCER_LD_EXT)
#define SPR_PCCR_ST_EXT           SPR_PCCR(SPR_PCER_ST_EXT)
#define SPR_PCCR_LD_EXT_CYC       SPR_PCCR(SPR_PCER_LD_EXT_CYC)
#define SPR_PCCR_ST_EXT_CYC       SPR_PCCR(SPR_PCER_ST_EXT_CYC)
#define SPR_PCCR_TCDM_CONT        SPR_PCCR(SPR_PCER_TCDM_CONT)

static inline void perf_start() {
  or1k_mtspr(SPR_PCMR, 0x3);
}

static inline void perf_stop() {
  or1k_mtspr(SPR_PCMR, 0x0);
}

static inline void perf_reset() {
  or1k_mtspr(SPR_PCCR(31), 0x0);
}

static inline void perf_enable_all() {
  or1k_mtspr(SPR_PCER, 0x1ffff);
}

static inline void perf_enable_cycles() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_CYCLES);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_instr() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_INSTR);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_ld_stall() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_LD_STALL);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_jmp_stall() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_JMP_STALL);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_imiss() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_IMISS);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_wbranch() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_WBRANCH);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_wbranch_cyc() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_WBRANCH_CYC);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_ld() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_LD);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_st() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_ST);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_jump() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_JUMP);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_branch() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_BRANCH);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_delay_nop() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_DELAY_NOP);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_ld_ext() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_LD_EXT);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_st_ext() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_ST_EXT);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_ld_ext_cyc() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_LD_EXT_CYC);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_st_ext_cyc() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_ST_EXT_CYC);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_enable_tcdm_cont() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer |= (1 << SPR_PCER_TCDM_CONT);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_all() {
  or1k_mtspr(SPR_PCER, 0x0);
}

static inline void perf_disable_cycles() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_CYCLES);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_instr() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_INSTR);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_ld_stall() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_LD_STALL);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_jmp_stall() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_JMP_STALL);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_imiss() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_IMISS);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_wbranch() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_WBRANCH);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_wbranch_cyc() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_WBRANCH_CYC);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_ld() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_LD);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_st() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_ST);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_jump() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_JUMP);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_branch() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_BRANCH);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_delay_nop() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_DELAY_NOP);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_ld_ext() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_LD_EXT);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_st_ext() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_ST_EXT);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_ld_ext_cyc() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_LD_EXT_CYC);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_st_ext_cyc() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_ST_EXT_CYC);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline void perf_disable_tcdm_cont() {
  unsigned spr_pcer = or1k_mfspr(SPR_PCER);
  spr_pcer &= ~(1 << SPR_PCER_TCDM_CONT);
  or1k_mtspr(SPR_PCER, spr_pcer);
}

static inline unsigned perf_get_cycles() {
  return or1k_mfspr(SPR_PCCR_CYCLES);
}

static inline unsigned perf_get_instr() {
  return or1k_mfspr(SPR_PCCR_INSTR);
}

static inline unsigned perf_get_ld_stall() {
  return or1k_mfspr(SPR_PCCR_LD_STALL);
}

static inline unsigned perf_get_jmp_stall() {
  return or1k_mfspr(SPR_PCCR_JMP_STALL);
}

static inline unsigned perf_get_imiss() {
  return or1k_mfspr(SPR_PCCR_IMISS);
}

static inline unsigned perf_get_wbranch() {
  return or1k_mfspr(SPR_PCCR_WBRANCH);
}

static inline unsigned perf_get_wbranch_cyc() {
  return or1k_mfspr(SPR_PCCR_WBRANCH_CYC);
}

static inline unsigned perf_get_ld() {
  return or1k_mfspr(SPR_PCCR_LD);
}

static inline unsigned perf_get_st() {
  return or1k_mfspr(SPR_PCCR_ST);
}

static inline unsigned perf_get_jump() {
  return or1k_mfspr(SPR_PCCR_JUMP);
}

static inline unsigned perf_get_branch() {
  return or1k_mfspr(SPR_PCCR_BRANCH);
}

static inline unsigned perf_get_delay_nop() {
  return or1k_mfspr(SPR_PCCR_DELAY_NOP);
}

static inline unsigned perf_get_ld_ext() {
  return or1k_mfspr(SPR_PCCR_LD_EXT);
}

static inline unsigned perf_get_st_ext() {
  return or1k_mfspr(SPR_PCCR_ST_EXT);
}

static inline unsigned perf_get_ld_ext_cyc() {
  return or1k_mfspr(SPR_PCCR_LD_EXT_CYC);
}

static inline unsigned perf_get_st_ext_cyc() {
  return or1k_mfspr(SPR_PCCR_ST_EXT_CYC);
}

static inline unsigned perf_get_tcdm_cont() {
  return or1k_mfspr(SPR_PCCR_TCDM_CONT);
}

#endif

#endif
