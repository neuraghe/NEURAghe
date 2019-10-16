/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef _RISCV_CSR_H
#define _RISCV_CSR_H

#define CSR_MSTATUS  0x300
#define CSR_MEPC     0x341
#define CSR_MCAUSE   0x342
#define CSR_MESTATUS 0x7C0
#define CSR_MCPUID   0xF00
#define CSR_MIMPID   0xF01
#define CSR_MHARTID  0xF14

#define CSR_PCCR(N)	(0x780 + (N))
#define CSR_PCER	0x7A0
#define CSR_PCMR	0x7A1

#define CSR_MESTATUS_INTEN_BIT 0
#define CSR_MESTATUS_PRV_BIT   1

#define CSR_MESTATUS_PRV_MACH  3

/*
 * Bit definitions for Performance counters mode registers
 *
 */
#define CSR_PCER_CYCLES		0  /* Count the number of cycles the core was running */
#define CSR_PCER_INSTR		1  /* Count the number of instructions executed */
#define CSR_PCER_LD_STALL		2  /* Number of load use hazards */
#define CSR_PCER_JMP_STALL		3  /* Number of jump register hazards */
#define CSR_PCER_IMISS		4  /* Cycles waiting for instruction fetches. i.e. the number of instructions wasted due to non-ideal caches */
#define CSR_PCER_LD		5  /* Number of memory loads executed. Misaligned accesses are counted twice */
#define CSR_PCER_ST		6  /* Number of memory stores executed. Misaligned accesses are counted twice */
#define CSR_PCER_JUMP		7  /* Number of jump instructions seen, i.e. j, jr, jal, jalr */
#define CSR_PCER_BRANCH		8  /* Number of branch instructions seen, i.e. bf, bnf */
#define CSR_PCER_TAKEN_BRANCH	9  /* Number of taken branch instructions seen, i.e. bf, bnf */
#define CSR_PCER_RVC		10  /* Number of compressed instructions */
#define CSR_PCER_LD_EXT		11  /* Number of memory loads to EXT executed. Misaligned accesses are counted twice. Every non-TCDM access is considered external */
#define CSR_PCER_ST_EXT		12  /* Number of memory stores to EXT executed. Misaligned accesses are counted twice. Every non-TCDM access is considered external */
#define CSR_PCER_LD_EXT_CYC	13  /* Cycles used for memory loads to EXT. Every non-TCDM access is considered external */
#define CSR_PCER_ST_EXT_CYC	14  /* Cycles used for memory stores to EXT. Every non-TCDM access is considered external */
#define CSR_PCER_TCDM_CONT	15  /* Cycles wasted due to TCDM/log-interconnect contention */

// Additional non-specified events
#define CSR_PCER_CUSTOM0        16
#define CSR_PCER_CUSTOM1        17

// Experimental events
#define CSR_PCER_FIRST_EXP_EVENT 18
#define CSR_PCER_NB_EXP_EVENTS   1
#define CSR_PCER_FPU_STALL       18 

// Experimental events
#define CSR_PCER_FIRST_EXP_EVENT 18
#define CSR_PCER_NB_EXP_EVENTS   1
#define CSR_PCER_FPU_STALL       18 

#define CSR_PCER_NB_EVENTS      16
#define CSR_PCER_NB_INTERNAL_EVENTS    11
#define CSR_NB_PCCR             31

// Gives from the event ID, the HW mask that can be stored (with an OR with other events mask) to the PCER
#define CSR_PCER_EVENT_MASK(eventId)	(1<<(eventId))
#define CSR_PCER_ALL_EVENTS_MASK  0xffffffff

#define CSR_PCMR_ACTIVE           0x1 /* Activate counting */
#define CSR_PCMR_SATURATE         0x2 /* Activate saturation */

#define CSR_PCER_NAME(id) (id == 0 ? "Cycles" : id == 1 ? "Instructions" : id == 2 ? "LD_Stall" : id == 3 ? "Jmp_Stall" : id == 4 ? "IMISS" : id == 5 ? "LD" : id == 6 ? "ST" : id == 7 ? "JUMP" : id == 8 ? "BRANCH" : id == 9 ? "TAKEN_BRANCH" : id == 10 ? "RVC" : id == 11 ? "LD_EXT" : id == 12 ? "ST_EXT" : id == 13 ? "LD_EXT_CYC" : id == 14 ? "ST_EXT_CYC" : id == 15 ? "TCDM_CONT" : "NA")

#endif
