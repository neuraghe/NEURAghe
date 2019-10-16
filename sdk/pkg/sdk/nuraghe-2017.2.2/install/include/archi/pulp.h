/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */


#ifndef __ARCHI_PULP__
#define __ARCHI_PULP__

#define ARCHI_PULP3   2
#define ARCHI_MIA     3
#define ARCHI_PULP4   4
#define ARCHI_PULPEVO 5

#define CHIP_MIA      0
#define CHIP_HONEY    1
#define CHIP_FULMINE  2
#define CHIP_PULP4    3
#define CHIP_PULPEVO  4
#define CHIP_PULP4Z   5
#define CHIP_PULP3    6
#define CHIP_BIGPULP         7
#define CHIP_BIGPULP_Z_7020  8
#define CHIP_BIGPULP_Z_7045  9
#define CHIP_GAP      10
#define CHIP_VIVOSOC2 11
#define CHIP_FULMINE8 12
#define CHIP_EXACONV  13
#define CHIP_WOLFE  14
#define CHIP_NURAGHE  15

#define CORE_OR1K_V1  0
#define CORE_OR1K_V2  1
#define CORE_OR1K_V3  2
#define CORE_OR1K_V4  3
#define CORE_OR1K_V5  4

#define CORE_RISCV_V1 100
#define CORE_RISCV_V2 101
#define CORE_RISCV_V3 102
#define CORE_RISCV_V4 103

#ifdef PULP_CORE
#if   PULP_CORE == CORE_OR1K_V1
#define OR1K_VERSION    1
#elif PULP_CORE == CORE_OR1K_V2
#define OR1K_VERSION    2
#elif PULP_CORE == CORE_OR1K_V3
#define OR1K_VERSION    3
#elif PULP_CORE == CORE_OR1K_V4     // or10n   => v1 instructions
#define OR1K_VERSION    4
#elif PULP_CORE == CORE_OR1K_V5     // or10nv2 => All new v2 instructions
#define OR1K_VERSION    5
#elif PULP_CORE == CORE_RISCV_V1    // Generic riscv
#define RISCV_VERSION   1
#elif PULP_CORE == CORE_RISCV_V2    // ri5cy   => Sven version
#define RISCV_VERSION   2
#elif PULP_CORE == CORE_RISCV_V3    // ri5cyv1 => Sven version with new encoding
#define RISCV_VERSION   3
#elif PULP_CORE == CORE_RISCV_V4    // ri5cyv2 => All v2 new instructions
#define RISCV_VERSION   4
#endif
#endif


/*
 * Chips components versions
 */

#ifdef PULP_CHIP

#if   PULP_CHIP == CHIP_MIA
#define MCHAN_VERSION       2
#define EU_VERSION          1
#define PERIPH_VERSION      1
#define HWCE_VERSION        2
#define ICACHE_CTRL_VERSION 1
#define TIMER_VERSION       1

#elif PULP_CHIP == CHIP_PULP3
#define MCHAN_VERSION       3
#define EU_VERSION          1
#define PERIPH_VERSION      1
#define HWCE_VERSION        2
#define ICACHE_CTRL_VERSION 1
#define TIMER_VERSION       1
#define APB_SOC_VERSION     1

#elif PULP_CHIP == CHIP_NURAGHE
#define MCHAN_VERSION       5
#define EU_VERSION          1
#define PERIPH_VERSION      1
#define ICACHE_CTRL_VERSION 1
#define TIMER_VERSION       1
#define APB_SOC_VERSION     1

#elif PULP_CHIP == CHIP_HONEY
#define HWCE_VERSION        2
#define MCHAN_VERSION       4
#define EU_VERSION          1
#define PERIPH_VERSION      1
#define ICACHE_CTRL_VERSION 1
#define TIMER_VERSION       1
#define APB_SOC_VERSION     1

#elif PULP_CHIP == CHIP_PULP4Z
#define MCHAN_VERSION       4
#define EU_VERSION          1
#define PERIPH_VERSION      1
#define ICACHE_CTRL_VERSION 1
#define TIMER_VERSION       1
#define APB_SOC_VERSION     1

#elif PULP_CHIP_FAMILY == CHIP_FULMINE
#define UDMA_VERSION        1
#define MCHAN_VERSION       5
#define PERIPH_VERSION      1
#define HWCE_VERSION        3
#if PULP_CHIP == CHIP_FULMINE8
#define ICACHE_CTRL_VERSION 101
#else
#define ICACHE_CTRL_VERSION 1
#endif
#define TIMER_VERSION       1
#define EU_VERSION          1
#define APB_SOC_VERSION     1

#elif PULP_CHIP == CHIP_GAP
#define UDMA_VERSION        2
#define MCHAN_VERSION       6
#define PERIPH_VERSION      2
#define EU_VERSION          3
#define HWCE_VERSION        4
#define ICACHE_CTRL_VERSION 2
#define TIMER_VERSION       2
#define SOC_EU_VERSION      1
#define APB_SOC_VERSION     2
#define GPIO_VERSION        2

#elif PULP_CHIP == CHIP_WOLFE
#define UDMA_VERSION        2
#define MCHAN_VERSION       6
#define PERIPH_VERSION      2
#define EU_VERSION          3
#define HWCE_VERSION        4
#define ICACHE_CTRL_VERSION 2
#define TIMER_VERSION       2
#define SOC_EU_VERSION      1
#define APB_SOC_VERSION     2

#elif PULP_CHIP == CHIP_VIVOSOC2
#define UDMA_VERSION        1
#define MCHAN_VERSION       5
#define PERIPH_VERSION      1
#define EU_VERSION          1
#define ICACHE_CTRL_VERSION 1
#define TIMER_VERSION       1
#define APB_SOC_VERSION     1
#define ANALOG_VERSION      1

#elif PULP_CHIP == CHIP_PULP4
#define HWCE_VERSION        4
#define ICACHE_CTRL_VERSION 2
#define UDMA_VERSION        2
#define MCHAN_VERSION       6
#define EU_VERSION          3
#define PERIPH_VERSION      2
#define TIMER_VERSION       2
#define APB_SOC_VERSION     2

#elif PULP_CHIP == CHIP_PULPEVO
#define UDMA_VERSION    1
#define MCHAN_VERSION   5
#define PERIPH_VERSION  1
#if   PULP_CHIP_VERSION == 0
#define EU_VERSION      2
#else
#define EU_VERSION      3
#endif
#define TIMER_VERSION       1
#define APB_SOC_VERSION     2

#elif PULP_CHIP_FAMILY == CHIP_BIGPULP
#define HWCE_VERSION        3
#define MCHAN_VERSION       5
#define EU_VERSION          1
#define PERIPH_VERSION      1
#define ICACHE_CTRL_VERSION 1
#define TIMER_VERSION       1
#define APB_SOC_VERSION     1

#elif PULP_CHIP == CHIP_EXACONV
#define MCHAN_VERSION       6
#define PERIPH_VERSION      2
#define EU_VERSION          3
#define ICACHE_CTRL_VERSION 2
#define TIMER_VERSION       2

#endif

#endif

/*
 * Events mapping
 */

#if   PULP_CHIP == CHIP_PULP3 || PULP_CHIP_FAMILY == CHIP_BIGPULP || PULP_CHIP_FAMILY == CHIP_FULMINE || PULP_CHIP == CHIP_GAP|| PULP_CHIP == CHIP_VIVOSOC2 || PULP_CHIP == CHIP_PULP4 || PULP_CHIP == CHIP_HONEY || PULP_CHIP == CHIP_PULPEVO || PULP_CHIP == CHIP_MIA || PULP_CHIP == CHIP_PULP4Z || PULP_CHIP == CHIP_EXACONV || PULP_CHIP == CHIP_WOLFE || PULP_CHIP == CHIP_NURAGHE
#define PULP_UDMA0_EVT 10
#define PULP_UDMA1_EVT 11
#define PULP_UDMA2_EVT 12
#define PULP_UDMA3_EVT 13
#define PULP_UDMA4_EVT 14
#define PULP_UDMA5_EVT 15
#define PULP_UDMA6_EVT 16

#define PULP_MAX_CLUSTER_NB_PES    16
#define PULP_MAX_NB_CLUSTERS       33

#if PULP_CHIP == CHIP_PULPEVO
#else
 // TODO get rid of that after the convergence between both arch files is over
#define PULP_L1_BASE PULP_CLUSTER_BASE
#define PULP_TIMER_OFFSET 0x200400
#define PULP_TIMER_START_OFFSET           0x0
#define PULP_TIMER_STOP_OFFSET            0x4
#define PULP_TIMER_RESET_OFFSET           0x8
#define PULP_TIMER_GET_OFFSET             0xc   
#define PULP_TIMER_GETHI_OFFSET           0x10  
#define PULP_CKGATE_OFFSET 0x00200800 
#define PULP_CKGATE_OFFSET_LO 0x00000800 
#define PULP_L1_TAS_BIT 20
#define PULP_L1_TAS_OFFSET (1<<PULP_L1_TAS_BIT)
#define PULP_DMA_EVTMASK                  (1<<PULP_DMA_EVT)
#define PULP_DEMUX_OFFSET  0x204000
#define PULP_DEMUX_OFFSET_LO  0x004000
#define PULP_CKGATE_REMOTE_OFFSET 0x00200800
#define PULP_EOC_REMOTE_OFFSET 0x00200000
#define PULP_EOC_OFFSET 0x00200000
#define PULP_CLUSTER_REMOTE_BASE(cid) (0x10000000+cid*0x00400000)
#define PULP_STDOUT_OFFSET           0x1A110000
#define PULP_L2_BASE 0x1c000000
#define PULP_ICACHE_OFFSET 0x00201400

// UART config
#if PULP_CHIP == CHIP_MIA
#define UART_CLK_DIVIDER 124
#elif PULP_CHIP == CHIP_BIGPULP_Z_7020
#define UART_CLK_DIVIDER 13
#elif PULP_CHIP == CHIP_BIGPULP_Z_7045
#define UART_CLK_DIVIDER 26
#elif PULP_CHIP == CHIP_VIVOSOC2
#define UART_CLK_DIVIDER 4
#else
#define UART_CLK_DIVIDER 5
#endif



#endif

#endif


/*
 * Memory map
 */

#if   PULP_CHIP == CHIP_PULP4
 #include <archi/pulp4/pulp.h>
 #include <archi/pulp4/gpio.h>

#elif PULP_CHIP_FAMILY == CHIP_FULMINE
 #include <archi/fulmine/events.h>
 #include <archi/fulmine/pulp.h>
 #include <archi/fulmine/gpio.h>

#elif PULP_CHIP == CHIP_PULP3
 #include <archi/pulp3/pulp.h>
 #include <archi/pulp3/gpio.h>

#elif PULP_CHIP == CHIP_NURAGHE
 #include <archi/nuraghe/pulp.h>

#elif PULP_CHIP == CHIP_GAP
 #include <archi/GAP/pulp.h>

#elif PULP_CHIP == CHIP_WOLFE
 #include <archi/wolfe/pulp.h>

#elif PULP_CHIP == CHIP_EXACONV
 #include <archi/exaconv/pulp.h>

#elif PULP_CHIP == CHIP_VIVOSOC2
 #include <archi/vivosoc2/events.h>
 #include <archi/vivosoc2/pulp.h>
 #include <archi/vivosoc2/gpio.h>

#elif PULP_CHIP == CHIP_MIA
 #include <archi/mia/pulp.h>
 #include <archi/mia/gpio.h>

#elif PULP_CHIP == CHIP_PULP4Z
 #include <archi/pulp4z/pulp.h>
 #include <archi/pulp4z/gpio.h>

#elif PULP_CHIP == CHIP_PULPEVO
 #include <archi/pulpevo/events.h>
 #include <archi/pulpevo/pulp.h>
 #include <archi/pulpevo/gpio.h>

#elif PULP_CHIP == CHIP_HONEY
 #include <archi/honey/pulp.h>
 #include <archi/honey/gpio.h>

#elif PULP_CHIP_FAMILY == CHIP_BIGPULP
 #include <archi/bigpulp/pulp.h>

#endif



/*
 * Macros
 */

#define PULP_REMOTE_ADDR(x) ((x) - PULP_BASE_ADDR + PULP_BASE_REMOTE_ADDR)

/*
 * Components definitions
 */

#ifdef   OR1K_VERSION
#define  __A_OR1K_INC(x) #x
#define  _A_OR1K_INC(x) __A_OR1K_INC(archi/or1k_v##x.h)
#define  A_OR1K_INC(x) _A_OR1K_INC(x)
#include A_OR1K_INC(OR1K_VERSION)
#endif

#ifdef   RISCV_VERSION
#define  __A_RISCV_INC(x) #x
#define  _A_RISCV_INC(x) __A_RISCV_INC(archi/riscv_v##x.h)
#define  A_RISCV_INC(x) _A_RISCV_INC(x)
#include A_RISCV_INC(RISCV_VERSION)
#endif

#ifdef   PERIPH_VERSION
#define  __A_PERIPH_INC(x) #x
#define  _A_PERIPH_INC(x) __A_PERIPH_INC(archi/periph_v##x.h)
#define  A_PERIPH_INC(x) _A_PERIPH_INC(x)
#include A_PERIPH_INC(PERIPH_VERSION)
#endif

#ifdef   UDMA_VERSION
#define  __A_UDMA_INC(x) #x
#define  _A_UDMA_INC(x) __A_UDMA_INC(archi/udma_v##x.h)
#define  A_UDMA_INC(x) _A_UDMA_INC(x)
#include A_UDMA_INC(UDMA_VERSION)
#endif

#ifdef   MCHAN_VERSION
#define  __A_MCHAN_INC(x) #x
#define  _A_MCHAN_INC(x) __A_MCHAN_INC(archi/mchan_v##x.h)
#define  A_MCHAN_INC(x) _A_MCHAN_INC(x)
#include A_MCHAN_INC(MCHAN_VERSION)
#endif

#ifdef   EU_VERSION
#define  __A_EU_INC(x) #x
#define  _A_EU_INC(x) __A_EU_INC(archi/eu_v##x.h)
#define  A_EU_INC(x) _A_EU_INC(x)
#include A_EU_INC(EU_VERSION)
#endif

#ifdef   SOC_EU_VERSION
#define  __A_SOC_EU_INC(x) #x
#define  _A_SOC_EU_INC(x) __A_SOC_EU_INC(archi/soc_eu_v##x.h)
#define  A_SOC_EU_INC(x) _A_SOC_EU_INC(x)
#include A_SOC_EU_INC(SOC_EU_VERSION)
#endif

#ifdef   TIMER_VERSION
#define  __A_TIMER_INC(x) #x
#define  _A_TIMER_INC(x) __A_TIMER_INC(archi/timer_v##x.h)
#define  A_TIMER_INC(x) _A_TIMER_INC(x)
#include A_TIMER_INC(TIMER_VERSION)
#endif

#ifdef   HWCE_VERSION
#define  __A_HWCE_INC(x) #x
#define  _A_HWCE_INC(x) __A_HWCE_INC(archi/hwce_v##x.h)
#define  A_HWCE_INC(x) _A_HWCE_INC(x)
#include A_HWCE_INC(HWCE_VERSION)
#endif

#ifdef   APB_SOC_VERSION
#define  __A_APB_SOC_INC(x) #x
#define  _A_APB_SOC_INC(x) __A_APB_SOC_INC(archi/apb_soc_v##x.h)
#define  A_APB_SOC_INC(x) _A_APB_SOC_INC(x)
#include A_APB_SOC_INC(APB_SOC_VERSION)
#endif

#ifdef   ANALOG_VERSION
#define  __A_ANALOG_INC(x) #x
#define  _A_ANALOG_INC(x) __A_ANALOG_INC(archi/analog_v##x.h)
#define  A_ANALOG_INC(x) _A_ANALOG_INC(x)
#include A_ANALOG_INC(ANALOG_VERSION)
#endif

#ifdef   GPIO_VERSION
#define  __A_GPIO_INC(x) #x
#define  _A_GPIO_INC(x) __A_GPIO_INC(archi/gpio_v##x.h)
#define  A_GPIO_INC(x) _A_GPIO_INC(x)
#include A_GPIO_INC(GPIO_VERSION)
#endif

#ifdef   ICACHE_CTRL_VERSION
#define  __A_ICACHE_CTRL_INC(x) #x
#define  _A_ICACHE_CTRL_INC(x) __A_ICACHE_CTRL_INC(archi/icache_ctrl_v##x.h)
#define  A_ICACHE_CTRL_INC(x) _A_ICACHE_CTRL_INC(x)
#include A_ICACHE_CTRL_INC(ICACHE_CTRL_VERSION)
#endif

#endif
