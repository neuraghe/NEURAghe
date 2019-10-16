#ifndef VIVOSOC2_PULP_H
#define VIVOSOC2_PULP_H

#if PULP_CHIP != CHIP_VIVOSOC2
#error This file must be included only for vivosoc2 chip
#endif

#include "udma.h"

// Although the alias is active, there is still a bug that prevents from using peripherals
// through the alias. L1 global variables will still be accessed through the alias as their
// address is managed by the link script
#define PULP_BASE_ADDR                0x10000000
#define PULP_BASE_REMOTE_ADDR         0x10000000
#define PULP_CLUSTER_BASE             0x10000000
#define PULP_CLUSTER_SIZE             0x00400000
#define PULP_CLUSTER_BASE_ADDR(cid)   (PULP_BASE_REMOTE_ADDR + (cid)*PULP_CLUSTER_SIZE)
#define PULP_HAS_ALIAS                0
#define PULP_HAS_L1_ALIAS             1


/* TCDM */
#define TCDM_BASE_ADDR                ( PULP_BASE_ADDR )
#define TCDM_SRAM_BASE_ADDR           ( TCDM_BASE_ADDR + 0x0 )
#define TCDM_SCM_BASE_ADDR            ( TCDM_BASE_ADDR + 0x10000 )
#define TEST_AND_SET_OFFSET           0x00100000
#define TEST_AND_SET_BASE_ADDR        ( PULP_BASE_ADDR + TEST_AND_SET_OFFSET )
#define LIBGOMP_BASE_ADDR             ( TCDM_BASE_ADDR + 0x0 )
/* IMPORTANT!!! all the TCDM #define MUST be aligned with the related sections in the linker script */

/* CLUSTER PERIPHERALS */
#define CLUSTER_PERIPHERALS_BASE_ADDR ( PULP_BASE_ADDR + 0x200000 )
#define EOC_UNIT_BASE_ADDR            ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x0000 )
#define FETCH_EN_UNIT_BASE_ADDR       ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x0008 )
#define DVS_DVSE_UNIT_BASE_ADDR       ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x0018 )

#define TIMER_BASE_OFFSET             ( 0x0400 )
#define TIMER_BASE_ADDR               ( CLUSTER_PERIPHERALS_BASE_ADDR + TIMER_BASE_OFFSET )
#define BBMUX_CLKGATE_BASE_ADDR       ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x0800 )
#define REC_PIPE_STARGE_BASE_ADDR     ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x0C00 )
#define MMU_BASE_ADDR                 ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x1000 )
#define ICACHE_CTRL_BASE_ADDR         ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x1400 )
#define HWCE_BASE_ADDR                ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x1800 )

#define CLKGATE_REG_BASE              ( BBMUX_CLKGATE_BASE_ADDR + 0x100)

/* DEMUX MAPPED PERIPHERALS  */
#define DEMUX_PERIPHERALS_BASE_ADDR   ( PULP_BASE_ADDR + 0x204000 )
#define EVENT_UNIT_DEMUX_BASE_ADDR    ( DEMUX_PERIPHERALS_BASE_ADDR + 0x00000 )
#define MCHAN_BASE_OFFSET             ( 0x00400 )
#define MCHAN_BASE_ADDR               ( DEMUX_PERIPHERALS_BASE_ADDR + MCHAN_BASE_OFFSET )
//#define PERF_BASE_ADDR                ( DEMUX_PERIPHERALS_BASE_ADDR + 0x00800 )

// use these defines if you want to place the DMEUX_PERIPH just before the test and set region
//#define DEMUX_PERIPHERALS_BASE_ADDR   ( TEST_AND_SET_BASE_ADDR )
//#define EVENT_UNIT_DEMUX_BASE_ADDR    ( DEMUX_PERIPHERALS_BASE_ADDR - 0x00400 )
//#define MCHAN_BASE_ADDR               ( DEMUX_PERIPHERALS_BASE_ADDR - 0x00800 )
//#define PERF_BASE_ADDR                ( DEMUX_PERIPHERALS_BASE_ADDR - 0x00C00 )



/* SOC PERIPHERALS */
#define SOC_PERIPHERALS_BASE_ADDR     ( 0x1A100000 )

#define CVP_BASE_ADDR                 ( SOC_PERIPHERALS_BASE_ADDR + 0x0000 )
#define GPIO_BASE_ADDR                ( SOC_PERIPHERALS_BASE_ADDR + 0x1000 )
#define UDMA_BASE_ADDR                ( SOC_PERIPHERALS_BASE_ADDR + 0x2000 )
#define APB_SOC_CTRL_ADDR             ( SOC_PERIPHERALS_BASE_ADDR + 0x3000 )
#define ANALOG_BASE_ADDR              ( SOC_PERIPHERALS_BASE_ADDR + 0x8000 )

/* STDOUT */
#define STDOUT_BASE_ADDR              ( SOC_PERIPHERALS_BASE_ADDR + 0x10000 )
#define FPUTCHAR_BASE_ADDR            ( STDOUT_BASE_ADDR + 0x1000 )
#define FILE_CMD_BASE_ADDR            ( STDOUT_BASE_ADDR + 0x2000 )
#define STREAM_BASE_ADDR              ( STDOUT_BASE_ADDR + 0x3000 )

/* HW traces */
#define TRACE_BASE_ADDR               ( SOC_PERIPHERALS_BASE_ADDR + 0x20000 )

/* L2 MEMORY */
#define L2_MEM_BASE_ADDR              ( 0x1C000000 )
/* ROM */
#define ROM_BASE_ADDR                 ( 0x1A000000 )

#define PLP_UDMA_NO_I2S               1



#define PULP_DMA_EVT   8
#define PULP_DMA_IRQ   8

#endif
