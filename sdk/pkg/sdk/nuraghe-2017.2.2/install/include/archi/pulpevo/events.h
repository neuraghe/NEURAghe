/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __ARCHI_PULPEVO_EVENTS_H__
#define __ARCHI_PULPEVO_EVENTS_H__

#define PULP_EVT_UDMA0    10
#define PULP_EVT_UDMA1    11
#define PULP_EVT_UDMA2    12
#define PULP_EVT_UDMA3    13
#define PULP_EVT_UDMA4    14
#define PULP_EVT_UDMA5    15
#define PULP_EVT_UDMA6    16
#define PULP_EVT_UDMA7    17

#define UDMA_EVT_SPIM_TX                 0
#define UDMA_EVT_SPIM_RX                 1
#define UDMA_EVT_SPIM_EOT                2
#define UDMA_EVT_UART_TX                 3
#define UDMA_EVT_UART_RX                 4
#define UDMA_EVT_I2C_TX                  5
#define UDMA_EVT_I2C_RX                  6
#define UDMA_EVT_I2S_CH0                 7
#define UDMA_EVT_I2S_CH1                 8
#define UDMA_EVT_I2S_CH2                 9
#define UDMA_EVT_I2S_CH3                 10
#define UDMA_NB_EVENTS                   11


#endif
