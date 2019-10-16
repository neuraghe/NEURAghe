#ifndef _ARCHI_BIGPULP_PULP_H
#define _ARCHI_BIGPULP_PULP_H

#if PULP_CHIP_FAMILY != CHIP_BIGPULP
#error This file must be included only for bigpulp chip
#endif

#define PULP_BASE_ADDR                0x1B000000
#define PULP_BASE_REMOTE_ADDR         0x10000000
#define PULP_CLUSTER_BASE             0x1B000000
#define PULP_CLUSTER_SIZE             0x00400000
#define PULP_HAS_ALIAS                1

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

#define TIMER_BASE_ADDR               ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x0400 )
#define BBMUX_CLKGATE_BASE_ADDR       ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x0800 )
#define REC_PIPE_STARGE_BASE_ADDR     ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x0C00 )
#define MMU_BASE_ADDR                 ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x1000 )
#define ICACHE_CTRL_BASE_ADDR         ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x1400 )
#define HWCE_BASE_ADDR                ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x1800 )

#define CLKGATE_REG_BASE              ( BBMUX_CLKGATE_BASE_ADDR + 0x100)

/* DEMUX MAPPED PERIPHERALS  */
#define DEMUX_PERIPHERALS_BASE_ADDR   ( PULP_BASE_ADDR + 0x204000 )
#define EVENT_UNIT_DEMUX_BASE_ADDR    ( DEMUX_PERIPHERALS_BASE_ADDR + 0x00000 )
#define MCHAN_BASE_ADDR               ( DEMUX_PERIPHERALS_BASE_ADDR + 0x00400 )
//#define PERF_BASE_ADDR                ( DEMUX_PERIPHERALS_BASE_ADDR + 0x00800 )

// use these defines if you want to place the DMEUX_PERIPH just before the test and set region
//#define DEMUX_PERIPHERALS_BASE_ADDR   ( TEST_AND_SET_BASE_ADDR )
//#define EVENT_UNIT_DEMUX_BASE_ADDR    ( DEMUX_PERIPHERALS_BASE_ADDR - 0x00400 )
//#define MCHAN_BASE_ADDR               ( DEMUX_PERIPHERALS_BASE_ADDR - 0x00800 )
//#define PERF_BASE_ADDR                ( DEMUX_PERIPHERALS_BASE_ADDR - 0x00C00 )

/* SOC PERIPHERALS */
#define SOC_PERIPHERALS_BASE_ADDR     ( 0x1A100000 )

#define UART_BASE_ADDR                ( SOC_PERIPHERALS_BASE_ADDR + 0x2000 )
#define APB_SOC_CTRL_ADDR             ( SOC_PERIPHERALS_BASE_ADDR + 0x3000 )

/* STDOUT */
#define STDOUT_BASE_ADDR              ( SOC_PERIPHERALS_BASE_ADDR + 0x10000 )
#define FPUTCHAR_BASE_ADDR            ( STDOUT_BASE_ADDR + 0x1000 )
#define FILE_CMD_BASE_ADDR            ( STDOUT_BASE_ADDR + 0x2000 )
#define STREAM_BASE_ADDR              ( STDOUT_BASE_ADDR + 0x3000 )

/* HW traces */
#define TRACE_BASE_ADDR               ( SOC_PERIPHERALS_BASE_ADDR + 0x20000 )

/* MAILBOX */
#define MAILBOX_BASE_ADDR             ( SOC_PERIPHERALS_BASE_ADDR + 0x21000 ) // Interface 1 
#define MAILBOX_REG_WRDATA            ( MAILBOX_BASE_ADDR + 0x0 )
#define MAILBOX_REG_RDDATA            ( MAILBOX_BASE_ADDR + 0x8 )
#define MAILBOX_REG_STATUS            ( MAILBOX_BASE_ADDR + 0x10)
#define MAILBOX_REG_ERROR             ( MAILBOX_BASE_ADDR + 0x14)
#define MAILBOX_REG_IS                ( MAILBOX_BASE_ADDR + 0x20)
#define MAILBOX_REG_IE                ( MAILBOX_BASE_ADDR + 0x24)

/* TRYX CTRL */
#define TRYX_CTRL_BASE_ADDR           ( 0x10200BFC )

/* L2 MEMORY */
#define L2_MEM_BASE_ADDR              ( 0x1C000000 )

#define PULP_DMA_EVT   8
#endif