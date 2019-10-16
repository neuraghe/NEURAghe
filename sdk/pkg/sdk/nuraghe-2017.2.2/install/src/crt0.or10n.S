#include "archi/pulp.h"

/* ======================================================= [ macros ] === */
#define CLABEL(label) _CLABEL(__USER_LABEL_PREFIX__, label)
#define __CLABEL(prefix, label) prefix ## label
#define _CLABEL(prefix, label) __CLABEL(prefix, label)

#define REDZONE 128
#define EXCEPTION_STACK_SIZE (100 + REDZONE)

#define LOAD_SYMBOL_2_GPR(gpr,symbol)  \
	.global symbol ;               \
	l.movhi gpr, hi(symbol) ;      \
	l.ori   gpr, gpr, lo(symbol)

#define LOAD_CONST_2_GPR(gpr,symbol)  \
    l.movhi gpr, hi(symbol) ;      \
    l.ori   gpr, gpr, lo(symbol)

/* =================================================== [ exceptions ] === */
	.section .vectors, "ax"

/* ---[ 0x000: RESET exception ]----------------------------------------- */
	.org 0x00
	l.j   reset_handler
	l.nop
/* ---[ 0x008: BUS exception ]------------------------------------------- */
	.org 0x08
	l.j   default_exception_handler
	l.nop
/* ---[ 0x010: Data Page Fault exception ]------------------------------- */
	.org 0x10
	l.j   default_exception_handler
	l.nop
/* ---[ 0x018: Insn Page Fault exception ]------------------------------- */
	.org 0x18
	l.j   default_exception_handler
	l.nop
/* ---[ 0x020: Timer exception ]----------------------------------------- */
	.org 0x20
	l.j   default_exception_handler
	l.nop
/* ---[ 0x028: Aligment exception ]-------------------------------------- */
	.org 0x28
	l.j   default_exception_handler
	l.nop
/* ---[ 0x030: Illegal insn exception ]---------------------------------- */
	.org 0x30
	l.j   illegal_insn_handler
	l.nop
/* ---[ 0x038: External interrupt exception ]---------------------------- */
	.org 0x38
	l.j   interrupt_handler
	l.nop
/* ---[ 0x040: DTLB miss exception ]------------------------------------- */
	.org 0x40
	l.j   default_exception_handler
	l.nop
/* ---[ 0x048: ITLB miss exception ]------------------------------------- */
	.org 0x48
	l.j   default_exception_handler
	l.nop
/* ---[ 0x050: Range exception ]----------------------------------------- */
	.org 0x50
	l.j   default_exception_handler
	l.nop
/* ---[ 0x058: Syscall exception ]--------------------------------------- */
	.org 0x58
	l.j   default_exception_handler
	l.nop
/* ---[ 0x060: FPU exception ]------------------------------------------- */
	.org 0x60
	l.j   default_exception_handler
	l.nop
/* ---[ 0x068: Trap exception ]------------------------------------------ */
	.org 0x68
	l.j   default_exception_handler
	l.nop
/* ---[ 0x070: Emergency IRQ exception ]--------------------------------- */
	.org 0x70
	l.j   irq_emergency_handler
	l.nop
/* ---[ 0x078: Performance Counter Overflow exception ]--------------------------------- */
	.org 0x78
	l.j   irq_perf_overflow_handler
	l.nop

	// This variable is pointed to the structure containing all information exchanged with
	// the platform loader. It is using a fixed address so that the loader can also find it
	// and then knows the address of the debug structure
	.org 0x90
	.global debugStruct_ptr
debugStruct_ptr:
	.word debugStruct

/* ========================================================= [ entry ] === */
	.section .text

/* ====================================== [ default reset handler ] === */
reset_handler:
	l.movhi r0, 0
	l.movhi r1, 0
	l.movhi r2, 0
	l.movhi r3, 0
	l.movhi r4, 0
	l.movhi r5, 0
	l.movhi r6, 0
	l.movhi r7, 0
	l.movhi r8, 0
	l.movhi r9, 0
	l.movhi r10, 0
	l.movhi r11, 0
	l.movhi r12, 0
	l.movhi r13, 0
	l.movhi r14, 0
	l.movhi r15, 0
	l.movhi r16, 0
	l.movhi r17, 0
	l.movhi r18, 0
	l.movhi r19, 0
	l.movhi r20, 0
	l.movhi r21, 0
	l.movhi r22, 0
	l.movhi r23, 0
	l.movhi r24, 0
	l.movhi r25, 0
	l.movhi r26, 0
	l.movhi r27, 0
	l.movhi r28, 0
	l.movhi r29, 0
	l.movhi r30, 0
	l.movhi r31, 0

	// Initialize the debug structure to let the host loader knows that we have started
	LOAD_CONST_2_GPR(r5, debugStruct_ptr)
	LOAD_CONST_2_GPR(r4, debugStruct)
	l.sw 0(r5), r4

	/* Clear status register, set supervisor mode */
	l.ori   r1, r0, SPR_SR_SM
	l.mtspr r0, r1, SPR_SR

	/* Early Stack initilization */
    l.movhi r5,     hi(STACK_SIZE)
    l.ori   r5, r5, lo(STACK_SIZE)
	l.ori   r3, r0, 1

#if defined(__ZEDBOARD__) || PULP_CHIP_FAMILY == CHIP_NURAGHE
	l.addi  r4, r0, NB_PE
#else
	/* get number of cores and save this in r4 */
#ifdef APB_SOC_CTRL_ADDR
	l.movhi r4,     hi(APB_SOC_CTRL_ADDR)
	l.ori   r4, r4, lo(APB_SOC_CTRL_ADDR)
	l.lhz   r4, 0x12(r4)
#else
	l.ori   r4, r0, __NB_ACTIVE_PE
#endif
#endif

	l.mfspr r3, r0, SPR_CORE_ID
	l.addi  r3, r3, 0x1      // increase processor id by 1 (stack starts from high address)
	l.mul   r3, r5, r3

	LOAD_SYMBOL_2_GPR(r1, stacks)
	l.add   r1, r1, r3

	// this takes care of initializating barriers
	l.ori  r3, r0, 0
	/* r4 is already the number of cores, no need to modify it */
	/* r5 is (1 << NUM_CORES)-1, the mask that we need */
	l.ori  r5, r0, 1
	l.sll  r5, r5, r4
	l.addi r5, r5, -1
#if EU_VERSION == 1
	l.jal  CLABEL(setup_barrier)
	l.nop

	l.mfspr r3, r0, SPR_CORE_ID
	l.ori   r4, r0, 0x1
	l.jal   CLABEL(set_evnt_mask_low)
	l.nop
#else
	// Configure the barrier with total number of cores
	l.movhi r6, hi(EVENT_UNIT_DEMUX_BASE_ADDR)
	l.ori   r6, r6, lo(EVENT_UNIT_DEMUX_BASE_ADDR)
	l.sw    EU_BARRIER_DEMUX_OFFSET + EU_HW_BARR_TRIGGER_MASK(r6), r5
	l.sw    EU_BARRIER_DEMUX_OFFSET + EU_HW_BARR_TARGET_MASK(r6), r5

	// Activate barrier event. It is always active as one core can never be polluted on this event
	l.ori   r4, r0, 1
	l.slli  r4, r4, PULP_HW_BAR_EVENT
	l.sw    EU_CORE_MASK_OR(r6), r4
#endif

	//////////////////////////////////////////////////////////////////////////////
	// Enable instruction cache, initialize all memories
	// This has to be done only once, so we use core 0 for this and put the other
	// cores to sleep
	//////////////////////////////////////////////////////////////////////////////

	l.mfspr  r13, r0, SPR_CORE_ID
	l.sfgtui r13, 0
	l.bf synch_start
	l.nop

  // do the memory initialization, cache enabling and so on
  // all this is done by core 0 only
memory_init:
	/* Cache initialisation */
	LOAD_CONST_2_GPR(r6, ICACHE_CTRL_BASE_ADDR)
	LOAD_CONST_2_GPR(r5, 0xffffffff)
//	l.sw 0(r6), r5
	
    // TODO must reactivate this with new event unit once we synchronize cores at startup
	l.jal mem_init
	l.nop

#ifdef OMP
	l.jal gomp_hal_mem_init
	l.nop
#endif

	/* Clear BSS */
	LOAD_SYMBOL_2_GPR(r5, _bss_start)
	LOAD_SYMBOL_2_GPR(r6, _bss_end)

	l.sfleu r6, r5
	l.bf    zero_loop_end
	l.nop   0
zero_loop:
	l.sw    -4(r6), r0
	l.addi  r6, r6, -4
	l.sfgtu r6, r5
	l.bf    zero_loop
	l.nop   0
zero_loop_end:

#if (PULP_CHIP_FAMILY == CHIP_BIGPULP || PULP_CHIP == CHIP_MIA || PULP_CHIP == CHIP_PULP4 || PULP_CHIP_FAMILY == CHIP_FULMINE || PULP_CHIP == CHIP_GAP || PULP_CHIP == CHIP_VIVOSOC2) && PULP_CHIP_VERSION == 0
	// setup UART
    l.addi  r3, r0, 0
    l.addi  r4, r0, UART_CLK_DIVIDER
    l.jal  CLABEL(uart_set_cfg)
    l.nop
#endif
#if (PULP_CHIP_FAMILY == CHIP_NURAGHE)
	l.jal  CLABEL(uart_init_lock)
    l.nop
#endif

  	l.jal  int_init
	l.nop

	// synchronize all cores at this point, so that they are in a consistent
	// state when they enter main
synch_start:

#if EU_VERSION == 1
	l.ori r3, r0, 0
	l.jal  CLABEL(wait_barrier_event_buff)
	l.nop
#else
	l.movhi r6, hi(EVENT_UNIT_DEMUX_BASE_ADDR)
	l.ori   r6, r6, lo(EVENT_UNIT_DEMUX_BASE_ADDR)
	l.lw    r6, EU_BARRIER_DEMUX_OFFSET + EU_HW_BARR_TRIGGER_WAIT_CLEAR(r6)
#endif

main_entry:

#ifdef OMP
	l.jal   omp_init
	l.nop
#else	
	/* Jump to main program entry point (argc = argv = 0) */
	l.addi r3, r0, 0
	l.addi r4, r0, 0
	l.jal   main
	l.nop
#endif

	// move return value from main to argument for this function call
	l.addi r3, r11, 0
	l.jal  CLABEL(return_code_write)
	l.nop

#if EU_VERSION == 1
	// synchronize all cores again before exiting
	l.ori r3, r0, 0
	l.jal  CLABEL(wait_barrier_event_buff)
	l.nop
#else
	l.movhi r6, hi(EVENT_UNIT_DEMUX_BASE_ADDR)
	l.ori   r6, r6, lo(EVENT_UNIT_DEMUX_BASE_ADDR)
	l.lw    r6, EU_BARRIER_DEMUX_OFFSET + EU_HW_BARR_TRIGGER_WAIT_CLEAR(r6)
#endif

	/* If program exits, call exit routine */
	l.addi  r3, r11, 0
	l.jal   exit
	l.nop

/* ====================================== [ interrupt handler ] === */
interrupt_handler:
#if HWCE_VERSION == 3
	// The 2 importants IRQ are for the HWCE and the DMA, check them first to follow a fast path
	// for it otherwise continue with the long path

	// Save a few registers on the stack
	l.sw    -4-REDZONE(r1), r16
	l.sw    -8-REDZONE(r1), r18
	l.sw    -12-REDZONE(r1), r20
	l.sw    -16-REDZONE(r1), r22
	l.sw    -20-REDZONE(r1), r24




	// Read interrupt status, we assume we are core 0 to simplify, and check if we see HWCE or DMA event
	LOAD_CONST_2_GPR(r18, PULP_CLUSTER_BASE + PULP_CKGATE_OFFSET)
	l.lw        r16, PULP_IRQ_BUFFER_LOW_BASE(r18)
	l.lw        r20, PULP_IRQ_MASK_LOW_BASE(r18)
	l.and       r16, r16, r20


	// First check DMA interrupt
	l.bextractu r20, r16, 1, 8
	l.sfeq      r20, r0
	l.bf        hwceCheck
	l.nop

#if 0
	l.addi  r1, r1,-EXCEPTION_STACK_SIZE ;
	l.sw    0x00(r1), r3
	l.sw    0x04(r1), r4
	l.sw    0x08(r1), r5
	l.sw    0x0c(r1), r6
	l.sw    0x10(r1), r7
	l.sw    0x14(r1), r8
	l.sw    0x18(r1), r9
	l.sw    0x1c(r1), r11
	l.sw    0x20(r1), r12
	l.sw    0x24(r1), r13
	l.sw    0x28(r1), r15
	l.sw    0x2c(r1), r17
	l.sw    0x20(r1), r19
	l.sw    0x34(r1), r21
	l.sw    0x38(r1), r23
	l.sw    0x3c(r1), r25
	l.sw    0x30(r1), r27
	l.sw    0x44(r1), r29
	l.sw    0x48(r1), r31



	// If it is there, first clear it
	l.addi      r16, r0, 1
	l.slli      r16, r16, 8
	LOAD_CONST_2_GPR(r18, PULP_CLUSTER_BASE + PULP_DEMUX_OFFSET + PULP_DEMUX_IRQ_BUFFER_CLEAR_OFFSET)
	l.sw        0(r18), r16

	// Read DMA counters to see what has terminated
	LOAD_CONST_2_GPR(r18, MCHAN_BASE_ADDR + MCHAN_STATUS_REGISTER_OFFSET)
	l.lw        r22, 0(r18)

	// And loop on nodes until we find one that has not terminated
	LOAD_SYMBOL_2_GPR(r20, firstDmaNode)
	l.lw        r18, 0(r20)
	// r18: currentNode, r22: DMA counter status
loopOnNodes:
	l.sfeq      r18, r0
	l.bf        dmaEnd
	l.nop
	// Get this node counter id
	l.lbz       r16, 8(r18)
	// And check it inside the DMA counter register
	l.addi      r24, r0, 1
	l.sll       r24, r24, r16
	l.and       r16, r24, r22
	l.sfne      r16, r0
	l.bf        dmaEnd
	// Set finished to 1 in the node
	l.addi      r16, r0, 1
	l.sb        9(r18), r16
	// Update the DMA node linked list
	l.lw        r24, 4(r18)
	LOAD_SYMBOL_2_GPR(r20, firstDmaNode)
	l.sw        0(r20), r24
	// Update number of free counters
	LOAD_SYMBOL_2_GPR(r16, nbFreeCounters)
	l.lw        r20, 0(r16)
	l.addi      r20, r20, 1
	l.sw        0(r16), r20

	// Now call the callback
	l.lw        r16, 0(r18)
	l.jalr      r16
	l.add       r18, r24, r0


	l.j         loopOnNodes
	l.nop

dmaEnd:

	l.lwz   r3,  0x00(r1)
	l.lwz   r4,  0x04(r1)
	l.lwz   r5,  0x08(r1)
	l.lwz   r6,  0x0c(r1)
	l.lwz   r7,  0x10(r1)
	l.lwz   r8,  0x14(r1)
	l.lwz   r9,  0x18(r1)
	l.lwz   r11, 0x1c(r1)
	l.lwz   r12, 0x20(r1)
	l.lwz   r13, 0x24(r1)
	l.lwz   r15, 0x28(r1)
	l.lwz   r17, 0x2c(r1)
	l.lwz   r19, 0x30(r1)
	l.lwz   r21, 0x34(r1)
	l.lwz   r23, 0x38(r1)
	l.lwz   r25, 0x3c(r1)
	l.lwz   r27, 0x40(r1)
	l.lwz   r29, 0x44(r1)
	l.lwz   r31, 0x48(r1)
	l.addi  r1, r1, EXCEPTION_STACK_SIZE


	// Restore registers
	l.lw        r24, -20-REDZONE(r1)
	l.lw        r22, -16-REDZONE(r1)
	l.lw        r20, -12-REDZONE(r1)
	l.lw        r18, -8-REDZONE(r1)
	l.lw        r16, -4-REDZONE(r1)

	// And return
	l.rfe
	l.nop

#endif

hwceCheck:
	// And then HWCE interrupt
	l.bextractu r16, r16, 1, 17
	l.sfeq      r16, r0
	l.bf        commonIrq
	// If it is there, first clear it
	l.addi      r16, r0, 1
	l.slli      r16, r16, 17
	LOAD_CONST_2_GPR(r18, PULP_CLUSTER_BASE + PULP_DEMUX_OFFSET + PULP_DEMUX_IRQ_BUFFER_CLEAR_OFFSET)
	l.sw        0(r18), r16

	// We got HWCE event, now process the on-going convolution
	// The state of the convolution is stored in a global descriptor
	LOAD_SYMBOL_2_GPR(r24, hwceDesc)

	l.lw        r18, 12(r24)    // wRem
	l.lw        r20, 16(r24)    // wTrigRem

	// First update wRem and check if this was the last convolution (wRem <= 0)
	l.addi      r18, r18, -(HWCE_LBSIZE/2 - 2)
	l.sw        12(r24), r18
	l.sfles     r18, r0
	l.bf        hwceJobEnd

	// Check if there is still convolutions to enqueue
	l.sfles     r20, r0
	l.bf        hwceJobEnd


	LOAD_CONST_2_GPR(r16, HWCE_BASE_ADDR)

	// Acquire the job
	l.lw        r0, HWCE_ACQUIRE(r16)

	// Check the width of the job in case it is the last one and update wTrigRem
	l.addi      r22, r20, -(HWCE_LBSIZE/2 - 2)
	l.sw        16(r24), r22
	l.sfltsi    r20, HWCE_LBSIZE/2 - 2
	l.bf        hwcePartialJob
	l.nop
	l.addi      r20, r0, HWCE_LBSIZE*2-8

hwceTrigJob:
	// Update pointers and wTrigRem
	l.lw        r18, 0(r24)    // x_ptr
	l.sw        HWCE_X_IN_BASE_ADDR(r16), r18
	l.add       r22, r18, r20
	l.sw        0(r24), r22
	l.lw        r22, 8(r24)    // yout_ptr
	l.add       r18, r18, r20
	l.sw        4(r24), r18
	l.sw        HWCE_Y_IN_0_BASE_ADDR(r16), r22
	l.sw        HWCE_Y_OUT_0_BASE_ADDR(r16), r22
	l.lw        r18, 36(r24)    // yout1_ptr
	l.add       r22, r22, r20
	l.sw        8(r24), r22
	l.sw        HWCE_Y_IN_1_BASE_ADDR(r16), r18
	l.sw        HWCE_Y_OUT_1_BASE_ADDR(r16), r18
	l.lw        r22, 40(r24)    // yout2_ptr
	l.add       r18, r18, r20
	l.sw        36(r24), r18
	l.sw        HWCE_Y_IN_2_BASE_ADDR(r16), r22
	l.sw        HWCE_Y_OUT_2_BASE_ADDR(r16), r22
	l.lw        r18, 44(r24)    // yout3_ptr
	l.add       r22, r22, r20
	l.sw        40(r24), r22
	l.sw        HWCE_Y_IN_3_BASE_ADDR(r16), r18
	l.sw        HWCE_Y_OUT_3_BASE_ADDR(r16), r18
	l.add       r18, r18, r20
	l.sw        44(r24), r18
	
	// Trigger it
    l.addi      r24, r0, 1
	l.sw        HWCE_TRIGGER(r16), r24

hwceJobEnd:
	// Restore registers
	// And also copy wRem_shadow into wRem in case another set of convolutions was pending
	l.lw        r16, 48(r24)
	l.lw        r22, -16-REDZONE(r1)
	l.sw        12(r24), r16
	l.sw        48(r24), r0
	l.lw        r24, -20-REDZONE(r1)
	l.lw        r20, -12-REDZONE(r1)
	l.lw        r18, -8-REDZONE(r1)
	l.lw        r16, -4-REDZONE(r1)

	// And return
	l.rfe
	l.nop
	
hwcePartialJob:
	// r24: hwceDesc, r16: hwceBase, r20: outWidth
	l.lw        r18, 20(r24)                          // read yLines
	l.mul       r18, r18, r20                          // compute yLines * outWidth
	l.sw        HWCE_Y_TRANS_SIZE(r16), r18           // write it to HWCE y trans

	l.lw        r18, 32(r24)                          // read y stride len	
	l.or        r18, r18, r20                          // add outWidth to low part
	l.sw        HWCE_Y_LINE_STRIDE_LENGTH(r16), r18   // write to HWCE y line stride

	l.lw        r22, 24(r24)                          // read xLines
	l.addi      r20, r20, 2                           // convert outWidth to inWidth
	l.mul       r22, r20, r22                          // compute xLines * inWidth
	l.sw        HWCE_X_TRANS_SIZE(r16), r22           // write it to HWCE x trans

	l.lw        r22, 28(r24)                          // read y stride len
	l.or        r22, r22, r20                          // add ouWidth to low part
	l.sw        HWCE_X_LINE_STRIDE_LENGTH(r16), r22   // write to HWCE y line stride

	l.sw        HWCE_JOB_CONFIG2(r16), r20            // write inWidth to config2
  
	l.j 		hwceTrigJob
	l.nop


commonIrq:
	l.lw        r24, -20-REDZONE(r1)
	l.lw        r22, -16-REDZONE(r1)
	l.lw        r20, -12-REDZONE(r1)
	l.lw        r18, -8-REDZONE(r1)
	l.lw        r16, -4-REDZONE(r1)

#endif

	l.addi  r1,r1,-EXCEPTION_STACK_SIZE;
	l.sw    0x18(r1),r9;
	l.jal   store_regs;
	l.nop;
	l.movhi r9,hi(end_except);
	l.ori   r9,r9,lo(end_except);
	l.j    CLABEL(int_main);
	l.nop

/* ====================================== [ interrupt handler ] === */
irq_emergency_handler:
	l.addi  r1,r1,-EXCEPTION_STACK_SIZE;
	l.sw    0x18(r1),r9;
	l.jal   store_regs;
	l.nop;
	l.movhi r9,hi(end_except);
	l.ori   r9,r9,lo(end_except);
	l.j    CLABEL(irq_emergency_handler_c);
	l.nop

/* ====================================== [ default exception handler ] === */
default_exception_handler:
	l.addi  r1, r1, -EXCEPTION_STACK_SIZE;
	l.sw    0x18(r1),r9;
	l.jal   store_regs;
	l.nop

	l.jal   default_exception_handler_c
	l.nop

	l.jal   end_except ;
	l.nop

/* ====================================== [ illegal instruction handler] === */
illegal_insn_handler:
	l.addi  r1,r1,-EXCEPTION_STACK_SIZE ;
	l.sw    0x18(r1),r9 ;
	l.jal   store_regs ;
	l.nop ;
	l.movhi r9,hi(end_except) ;
	l.ori   r9,r9,lo(end_except) ;
	l.j    CLABEL(illegal_insn_handler_c) ;
	l.nop

/* ====================================== [ Performance Counter Overflow Exception handler] === */
irq_perf_overflow_handler:
	l.addi  r1,r1,-EXCEPTION_STACK_SIZE ;
	l.sw    0x18(r1),r9 ;
	l.jal   store_regs ;
	l.nop ;
	l.movhi r9,hi(end_except) ;
	l.ori   r9,r9,lo(end_except) ;
	l.j    CLABEL(irq_perf_overflow) ;
	l.nop


// we only have to save the following registers: r31, r29, r27, r25, r23, r21, r19, r17, r15, r13, r12, r11, r8, r7, r6, r5, r4, r3
// all other registers are saved by c function call conventions
// r9 must be saved before calling store_regs, as otherwise its content is already overwritten by l.jal
store_regs:
	l.sw    0x00(r1),  r3
	l.sw    0x04(r1),  r4
	l.sw    0x08(r1),  r5
	l.sw    0x0c(r1),  r6
	l.sw    0x10(r1),  r7
	l.sw    0x14(r1),  r8
	l.sw    0x1c(r1), r11
	l.sw    0x20(r1), r12
	l.sw    0x24(r1), r13
	l.sw    0x28(r1), r15
	l.sw    0x2c(r1), r17
	l.sw    0x30(r1), r19
	l.sw    0x34(r1), r21
	l.sw    0x38(r1), r23
	l.sw    0x3c(r1), r25
	l.sw    0x40(r1), r27
	l.sw    0x44(r1), r29
	l.sw    0x48(r1), r31
	// hwloop registers
	l.mfspr r3, r0, 0x6000
	l.mfspr r4, r0, 0x6010
	l.mfspr r5, r0, 0x6020
	l.mfspr r6, r0, 0x6001
	l.mfspr r7, r0, 0x6011
	l.mfspr r8, r0, 0x6021
	l.mfspr r11,r0, 0x11
	l.sw    0x4C(r1), r3
	l.sw    0x50(r1), r4
	l.sw    0x54(r1), r5
	l.sw    0x58(r1), r6
	l.sw    0x5C(r1), r7
	l.sw    0x64(r1), r11
	l.jr    r9
	l.sw    0x60(r1), r8

end_except:   // load back registers from stack
	// hwloop registers
	l.lwz   r3, 0x4C(r1)
	l.lwz   r4, 0x50(r1)
	l.lwz   r5, 0x54(r1)
	l.lwz   r6, 0x58(r1)
	l.lwz   r7, 0x5C(r1)
	l.lwz   r8, 0x60(r1)
	l.lwz   r11, 0x64(r1)
	l.mtspr r0, r3, 0x6000
	l.mtspr r0, r4, 0x6010
	l.mtspr r0, r5, 0x6020
	l.mtspr r0, r6, 0x6001
	l.mtspr r0, r7, 0x6011
	l.mtspr r0, r8, 0x6021
	l.mtspr r0, r11,0x11

	l.lwz   r3,  0x00(r1)
	l.lwz   r4,  0x04(r1)
	l.lwz   r5,  0x08(r1)
	l.lwz   r6,  0x0c(r1)
	l.lwz   r7,  0x10(r1)
	l.lwz   r8,  0x14(r1)
	l.lwz   r9,  0x18(r1)
	l.lwz   r11, 0x1c(r1)
	l.lwz   r12, 0x20(r1)
	l.lwz   r13, 0x24(r1)
	l.lwz   r15, 0x28(r1)
	l.lwz   r17, 0x2c(r1)
	l.lwz   r19, 0x30(r1)
	l.lwz   r21, 0x34(r1)
	l.lwz   r23, 0x38(r1)
	l.lwz   r25, 0x3c(r1)
	l.lwz   r27, 0x40(r1)
	l.lwz   r29, 0x44(r1)
	l.lwz   r31, 0x48(r1)
	l.rfe                                // recover SR register and prior PC (jumps back to program)
	l.addi  r1, r1, EXCEPTION_STACK_SIZE // free stack places

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
