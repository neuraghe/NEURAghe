/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __ARCHI_PULP4_EVENTS_H__
#define __ARCHI_PULP4_EVENTS_H__

#define PLP_HWCE_EVENT             15

#define PLP_SOC_EVENT_LVDS_TX      0
#define PLP_SOC_EVENT_LVDS_RX      1
#define PLP_SOC_EVENT_SPIM0_RX     2
#define PLP_SOC_EVENT_SPIM0_TX     3
#define PLP_SOC_EVENT_SPIM1_RX     4
#define PLP_SOC_EVENT_SPIM1_TX     5
#define PLP_SOC_EVENT_SPIM2_RX     6
#define PLP_SOC_EVENT_SPIM2_TX     7
#define PLP_SOC_EVENT_UART_TX      8
#define PLP_SOC_EVENT_UART_RX      9
#define PLP_SOC_EVENT_I2C0_TX      10
#define PLP_SOC_EVENT_I2C0_RX      11
#define PLP_SOC_EVENT_I2C1_TX      12
#define PLP_SOC_EVENT_I2C1_RX      13
#define PLP_SOC_EVENT_TCDM_TX      14
#define PLP_SOC_EVENT_TCDM_RX      15
#define PLP_SOC_EVENT_I2S_CH0      16
#define PLP_SOC_EVENT_I2S_CH1      17
#define PLP_SOC_EVENT_CAM_RX       18

#define PLP_SOC_EVENT_NB_I2S_CHANNELS  4
#define PLP_SOC_EVENT_NB_UDMA_CHANNELS 19

#define PLP_SOC_EVENT_GPIO         32
#define PLP_SOC_EVENT_TIMER_LO     33
#define PLP_SOC_EVENT_TIMER_HI     34
#define PLP_SOC_EVENT_LVDS_HP0     35
#define PLP_SOC_EVENT_LVDS_HP1     36
#define PLP_SOC_EVENT_SPIM0_EOT    37
#define PLP_SOC_EVENT_SPIM1_EOT    38
#define PLP_SOC_EVENT_SPIM2_EOT    39
#define PLP_SOC_EVENT_UART_EXTRA   40
#define PLP_SOC_EVENT_I2C0_EXTRA   41
#define PLP_SOC_EVENT_I2C1_EXTRA   42
#define PLP_SOC_EVENT_I2S_EXTRA    43
#define PLP_SOC_EVENT_CAM_EXTRA    44
#define PLP_SOC_EVENT_REF_CLK_RISE 45

#define PLP_SOC_EVENT_SW_EVENT0    48
#define PLP_SOC_EVENT_SW_EVENT1    49
#define PLP_SOC_EVENT_SW_EVENT2    50
#define PLP_SOC_EVENT_SW_EVENT3    51
#define PLP_SOC_EVENT_SW_EVENT4    52
#define PLP_SOC_EVENT_SW_EVENT5    53
#define PLP_SOC_EVENT_SW_EVENT6    54
#define PLP_SOC_EVENT_SW_EVENT7    55

#define PLP_EVT_DMA0        8
#define PLP_EVT_DMA1        9
#define PLP_EVT_TIMER0      10
#define PLP_EVT_TIMER1      11
#define PLP_EVT_ACC0        12
#define PLP_EVT_ACC1        13
#define PLP_EVT_ACC2        14
#define PLP_EVT_ACC3        15
#define PLP_EVT_BAR         16
#define PLP_EVT_MUTEX       17
#define PLP_EVT_DISPATCH    18
#define PLP_EVT_SOC_EVT     30
#define PLP_EVT_SOC_FIFO    31

#endif