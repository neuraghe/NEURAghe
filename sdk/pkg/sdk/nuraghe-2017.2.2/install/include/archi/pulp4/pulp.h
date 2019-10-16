#ifndef PULP4_PULP_H
#define PULP4_PULP_H

#if PULP_CHIP != CHIP_PULP4
#error This file must be included only for pulp4 chip
#endif

#include "events.h"
#include "udma.h"

#define PULP_BASE_ADDR                0x00000000
#define PULP_BASE_REMOTE_ADDR         0x10000000
#define PULP_CLUSTER_BASE             0x00000000
#define PULP_CLUSTER_SIZE             0x00400000
#define PULP_CLUSTER_BASE_ADDR(cid)   (PULP_BASE_REMOTE_ADDR + (cid)*PULP_CLUSTER_SIZE)
#define PULP_HAS_ALIAS                1
#define PULP_HAS_L1_ALIAS             1
#define PULP_L1_REMOTE_BASE(cid)      PULP_CLUSTER_BASE_ADDR(cid)

/* TCDM */
#define TCDM_BASE_ADDR                ( PULP_BASE_ADDR )
#define TCDM_SRAM_BASE_ADDR           ( TCDM_BASE_ADDR + 0x0 )
#define TCDM_SCM_BASE_ADDR            ( TCDM_BASE_ADDR + 0x10000 )
#define TEST_AND_SET_OFFSET           0x00100000
#define TEST_AND_SET_BASE_ADDR        ( PULP_BASE_ADDR + TEST_AND_SET_OFFSET )
#define LIBGOMP_BASE_ADDR             ( TCDM_BASE_ADDR + 0x0 )
/* IMPORTANT!!! all the TCDM #define MUST be aligned with the related sections in the linker script */


/* CLUSTER PERIPHERALS OFFSETS */
#define CLUSTER_PERIPHERALS_OFFSET    ( 0x200000 )
#define EOC_UNIT_OFFSET               ( CLUSTER_PERIPHERALS_OFFSET + 0x0000 )
#define BBMUX_CLKGATE_OFFSET          ( CLUSTER_PERIPHERALS_OFFSET + 0x0800 )


/* CLUSTER PERIPHERALS */
#define CLUSTER_PERIPHERALS_BASE_ADDR ( PULP_BASE_ADDR + CLUSTER_PERIPHERALS_OFFSET )
#define EOC_UNIT_BASE_ADDR            ( PULP_BASE_ADDR + EOC_UNIT_OFFSET )
#define FETCH_EN_UNIT_BASE_ADDR       ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x0008 )
#define DVS_DVSE_UNIT_BASE_ADDR       ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x0018 )

#define TIMER_BASE_ADDR               ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x0400 )
#define BBMUX_CLKGATE_BASE_ADDR       ( PULP_BASE_ADDR + BBMUX_CLKGATE_OFFSET )
#define ICACHE_CTRL_BASE_ADDR         ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x1400 )
#define HWCE_BASE_ADDR                ( CLUSTER_PERIPHERALS_BASE_ADDR + 0x2000 )

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
#if PULP_CHIP_VERSION == 1
#define SPI_BASE_ADDR                 ( SOC_PERIPHERALS_BASE_ADDR + 0x2000 )
#define UART_BASE_ADDR                ( SOC_PERIPHERALS_BASE_ADDR + 0x3000 )
#define APB_SOC_CTRL_ADDR             ( SOC_PERIPHERALS_BASE_ADDR + 0x4000 )
#define I2C_BASE_ADDR                 ( SOC_PERIPHERALS_BASE_ADDR + 0x5000 )
#define I2S_AUDIO_BASE_ADDR           ( SOC_PERIPHERALS_BASE_ADDR + 0x6000 )
#define I2S_CAM_BASE_ADDR             ( SOC_PERIPHERALS_BASE_ADDR + 0x7000 )
#define CP_BASE_ADDR                  ( SOC_PERIPHERALS_BASE_ADDR + 0x8000 )
#define PMB_BASE_ADDR                 ( SOC_PERIPHERALS_BASE_ADDR + 0x9000 )
#else
#define UDMA_BASE_ADDR                ( SOC_PERIPHERALS_BASE_ADDR + 0x2000 )
#define APB_SOC_CTRL_ADDR             ( SOC_PERIPHERALS_BASE_ADDR + 0x3000 )
#define SOC_EVENT_UNIT_ADDR           ( SOC_PERIPHERALS_BASE_ADDR + 0x4000 )
#endif

/* STDOUT */
#define STDOUT_BASE_ADDR              ( SOC_PERIPHERALS_BASE_ADDR + 0x10000 )
#define FPUTCHAR_BASE_ADDR            ( STDOUT_BASE_ADDR + 0x2000 )
#define FILE_CMD_BASE_ADDR            ( STDOUT_BASE_ADDR + 0x3000 )
#define STREAM_BASE_ADDR              ( STDOUT_BASE_ADDR + 0x4000 )

/* HW traces */
#define TRACE_BASE_ADDR               ( SOC_PERIPHERALS_BASE_ADDR + 0x20000 )

/* L2 MEMORY */
#define L2_MEM_BASE_ADDR              ( 0x1C000000 )
/* ROM */
#define ROM_BASE_ADDR                 ( 0x1A000000 )



#define EU_NB_HW_MUTEX                (1)
#define EU_NB_SOC_BARRIER(nbClusters) ((nbClusters)/2)
#define MCHAN_NB_COUNTERS             4

#define PLP_EU_HAS_HW_MUTEX    1
#define PLP_EU_HAS_DISPATCH    1
#define PLP_EU_HAS_LOOP        1

#define PULP_DMA_EVT   8
#define PULP_DMA_IRQ   9


#define PLP_SOC_EU_HAS_LOCK 1
#define PLP_SOC_EU_HAS_BAR 1



#endif
