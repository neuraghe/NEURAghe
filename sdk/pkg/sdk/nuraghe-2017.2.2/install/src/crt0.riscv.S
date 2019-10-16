#include "archi/pulp.h"

#define EXCEPTION_STACK_SIZE 72


/* ========================================================= [ entry ] === */
  .section .text

reset_handler:
  /* set all registers to zero (use mv for reduced code size) */
  mv  x1, x0
  mv  x2, x0
  mv  x3, x0
  mv  x4, x0
  mv  x5, x0
  mv  x6, x0
  mv  x7, x0
  mv  x8, x0
  mv  x9, x0
  mv x10, x0
  mv x11, x0
  mv x12, x0
  mv x13, x0
  mv x14, x0
  mv x15, x0
  mv x16, x0
  mv x17, x0
  mv x18, x0
  mv x19, x0
  mv x20, x0
  mv x21, x0
  mv x22, x0
  mv x23, x0
  mv x24, x0
  mv x25, x0
  mv x26, x0
  mv x27, x0
  mv x28, x0
  mv x29, x0
  mv x30, x0
  mv x31, x0

  /* Stack initilization */
  la  x10, STACK_SIZE
  li  x12, 0x1

#if defined( __ZEDBOARD__) || !defined(APB_SOC_CTRL_ADDR)
  ori  x11, x0, NB_PE
#else
  /* get number of cores and save this in x12 */
  la  x11, APB_SOC_CTRL_ADDR
  lh  x11, APB_SOC_INFO_CORES_OFFSET(x11)
#endif

  /* stack initilization */
  csrr x12, CSR_MHARTID
  andi x12, x12, 0x1F
  addi x12, x12, 0x1  // x10 = core_id + 1

#if RISCV_VERSION >= 3 || RISCV_VERSION == 2
  p.mul  x10, x10, x12
#else
  mul  x10, x10, x12
#endif

  la   x2, stacks
  add  x2, x2, x10    // set stack pointer, 1KB per core


_start:
  .global _start

  // this takes care of initializating barriers
  li x10, 0
  /* x11 is already defined */
	/* x12 is (1 << NUM_CORES)-1, the mask that we need */
  ori  x12, x0, 1
  sll  x12, x12, x11
  addi x12, x12, -1
#if EU_VERSION == 1
  jal  x1, setup_barrier

  csrr x10, CSR_MHARTID
  andi x10, x10, 0x1F // x10 = core id
  li x11, 0x1
  jal x1, set_evnt_mask_low

#else
  // Configure the barrier with total number of cores
  li      x26, EVENT_UNIT_DEMUX_BASE_ADDR
  sw      x12, EU_BARRIER_DEMUX_OFFSET+EU_HW_BARR_TRIGGER_MASK(x26)
  sw      x12, EU_BARRIER_DEMUX_OFFSET+EU_HW_BARR_TARGET_MASK(x26)

  // Activate barrier event. It is always active as one core can never be polluted on this event
  ori     x27, x0, 1
  slli    x27, x27, PULP_HW_BAR_EVENT
  sw      x27, EU_CORE_MASK_OR(x26)
#endif

  ////////////////////////////////////////////////////////////////////////////
  // Enable instruction cache, initialize all memory
  // This has to be done only once, so we use core 0 for this
  ////////////////////////////////////////////////////////////////////////////
  csrr x10, CSR_MHARTID
  andi x10, x10, 0x1F // x10 = core id
  bnez x10, synch_start

  // do the memory initialization, cache enabling and so on
memory_init:
  /* Cache initialisation */
  la  t1, ICACHE_CTRL_BASE_ADDR
  la  t2, 0xffffffff
  sw  t2, 0(t1)

  jal x1, mem_init
#ifdef OMP
  jal x1, gomp_hal_mem_init
#endif

  /* clear BSS */
  la x26, _bss_start
  la x27, _bss_end

  bge x26, x27, zero_loop_end

zero_loop:
  sw x0, 0(x26)
  addi x26, x26, 4
  blt x26, x27, zero_loop
zero_loop_end:

  jal x1, int_init

#if (PULP_CHIP_FAMILY == CHIP_BIGPULP || PULP_CHIP == CHIP_MIA || PULP_CHIP == CHIP_PULP4 || PULP_CHIP_FAMILY == CHIP_FULMINE || PULP_CHIP == CHIP_GAP || PULP_CHIP == CHIP_VIVOSOC2) && PULP_CHIP_VERSION == 0
  // setup UART
  li x10, 0
  li x11, 5
  jal uart_set_cfg
#endif

  /* synchronize all cores before entering main */
synch_start:
#if EU_VERSION == 1
  li x10, 0
  jal x1, wait_barrier_event_buff
#else
  li      x26, EVENT_UNIT_DEMUX_BASE_ADDR
#if RISCV_VERSION < 4
  lw      x27, EU_BARRIER_DEMUX_OFFSET+EU_HW_BARR_TRIGGER_WAIT_CLEAR(x26)
#else
  p.elw      x27, EU_BARRIER_DEMUX_OFFSET+EU_HW_BARR_TRIGGER_WAIT_CLEAR(x26)
#endif
#endif


main_entry:
#ifdef OMP
  jal x1, omp_init
#else
  /* jump to main program entry point (argc = argv = 0) */
  addi x10, x0, 0
  addi x11, x0, 0
  jal x1, main
#endif

#if APB_SOC_VERSION >= 2
  csrr x12, CSR_MHARTID
  andi x12, x12, 0x1F
  bne  x12, x0, endLoop
  jal x1, exit
endLoop:
  j endLoop
#else
  jal  return_code_write

  /* if program exits call exit routine from library */
  /* make sure that all cores are synchronized first */
  li  x10, 0
#if EU_VERSION == 1
  jal x1, wait_barrier_event_buff
#else
  li      x26, EVENT_UNIT_DEMUX_BASE_ADDR
#if RISCV_VERSION < 4
  lw      x27, EU_BARRIER_DEMUX_OFFSET+EU_HW_BARR_TRIGGER_WAIT_CLEAR(x26)
#else
  p.elw      x27, EU_BARRIER_DEMUX_OFFSET+EU_HW_BARR_TRIGGER_WAIT_CLEAR(x26)
#endif
#endif

  jal x1, exit
#endif


/* ========================================== [ interrupt handler ] === */
interrupt_handler:
  addi x2, x2, -EXCEPTION_STACK_SIZE
  sw x1, 0x44(x2)
  jal x1, store_regs
  la x1, end_except
  jal x0, int_main

/* ======================================= [ nm_interrupt handler ] === */
nm_interrupt_handler:
  addi x2, x2, -EXCEPTION_STACK_SIZE
  sw x1, 0x44(x2)
  jal x1, store_regs
  la x1, end_except
  jal x0, irq_emergency_handler_c

/* ================================= [ illegal instruction handler] === */
illegal_insn_handler:
  addi x2, x2, -EXCEPTION_STACK_SIZE
  sw x1, 0x44(x2)
  jal x1, store_regs
  la x1, end_except
  jal x0, illegal_insn_handler_c


// saves all caller-saved registers (except return address)
store_regs:
  sw  x3, 0x00(x2)  // gp
  sw  x4, 0x04(x2)  // tp
  sw  x5, 0x08(x2)  // t0
  sw  x6, 0x0c(x2)  // t1
  sw  x7, 0x10(x2)  // t2
  sw x10, 0x14(x2)  // a0
  sw x11, 0x18(x2)  // a1
  sw x12, 0x1c(x2)  // a2
  sw x13, 0x20(x2)  // a3
  sw x14, 0x24(x2)  // a4
  sw x15, 0x28(x2)  // a5
  sw x16, 0x2c(x2)  // a6
  sw x17, 0x30(x2)  // a7
  sw x28, 0x34(x2)  // t3
  sw x29, 0x38(x2)  // t4
  sw x30, 0x3c(x2)  // t5
  sw x31, 0x40(x2)  // t6
  jalr x0, x1

// load back registers from stack
end_except:
  lw  x3, 0x00(x2)
  lw  x4, 0x04(x2)
  lw  x5, 0x08(x2)
  lw  x6, 0x0c(x2)
  lw  x7, 0x10(x2)
  lw x10, 0x14(x2)
  lw x11, 0x18(x2)
  lw x12, 0x1c(x2)
  lw x13, 0x20(x2)
  lw x14, 0x24(x2)
  lw x15, 0x28(x2)
  lw x16, 0x2c(x2)
  lw x17, 0x30(x2)
  lw x28, 0x34(x2)
  lw x29, 0x38(x2)
  lw x30, 0x3c(x2)
  lw x31, 0x40(x2)
  lw  x1, 0x44(x2)
  addi x2, x2, EXCEPTION_STACK_SIZE
#if RISCV_VERSION >= 4
.word 0x30200073
#else
  eret
#endif

    .global l2Size
l2Size: .word L2_SIZE

    .global l1Size
l1Size: .word L1_SIZE

#ifdef SCM_SIZE
    .global scmSize
scmSize: .word SCM_SIZE
#endif

    .section .heapsram
stacks: .space NB_PE*STACK_SIZE

/* =================================================== [ exceptions ] === */
/* This section has to be down here, since we have to disable rvc for it  */

  .section .vectors, "ax"
  .option norvc;

  // external interrupts are handled by the same callback
  // until compiler supports IRQ routines
  .org 0x00
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler
  jal x0, interrupt_handler

  //// reset vector
  .org 0x80
  jal x0, reset_handler

  //// illegal instruction exception
  .org 0x84
  jal x0, illegal_insn_handler

  //// ecall handler
  .org 0x88
  jal x0, illegal_insn_handler

