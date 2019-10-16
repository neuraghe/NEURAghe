/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef ARCHI_EU_V2_H
#define ARCHI_EU_V2_H

#define PULP_CKG_MAX_NB_BARRIERS          18

#define PULP_NB_GP_EVENTS                 8
#define PULP_FIRST_GP_EVENT               0
#define PULP_HW_BAR_EVENT                 0

#define PULP_DEMUX_CORE_CLKGATE_OFFSET     0x0
#define PULP_DEMUX_EV_BUFFER_CLEAR_OFFSET  0x4

#define PULP_CLKGATE_SRAM0_OFFSET         0x000
#define PULP_CLKGATE_SRAM1_OFFSET         0x004
#define PULP_CLKGATE_SRAM2_OFFSET         0x008
#define PULP_CLKGATE_SRAM3_OFFSET         0x00C
#define PULP_CLKGATE_SCM_OFFSET           0x024
#define PULP_CLKGATE_STATUS               0x070

#define PULP_CLKGATE_TRIGG_BARRIER        0x35c
#define PULP_CLKGATE_WAIT_BARRIER         0x36c
#define PULP_CLKGATE_SET_BARRIER          0x374
#define PULP_CLKGATE_SET_BARRIER_SIZE     (0x4*PULP_CKG_MAX_NB_BARRIERS)


#define PULP_EV_MASK_LOW                  0x000
#define PULP_EV_MASK_LOW_SIZE             0x040

#define PULP_EV_BUFFER_LOW                0x080
#define PULP_EV_BUFFER_LOW_SIZE           0x040

#define PULP_CORE_CLKGATE                 0x208

#define PULP_EVNT_GEN                     0x20C

#define PULP_EVNT_GEN_GP0                 0x260
#define PULP_EVNT_GEN_GP1                 0x264
#define PULP_EVNT_GEN_GP2                 0x268


#define PULP_DEMUX_IRQ_BUFFER_CLEAR_OFFSET 0x8
#define PULP_IRQ_MASK_LOW_BASE             0X100
#define PULP_IRQ_MASK_LOW_SIZE             0X040
#define PULP_IRQ_MASK_HIGH_BASE            0X140
#define PULP_IRQ_MASK_HIGH_SIZE            0X040
#define PULP_IRQ_BUFFER_LOW_BASE           0X180
#define PULP_IRQ_BUFFER_LOW_SIZE           0X040
#define PULP_IRQ_BUFFER_HIGH_BASE          0X1C0
#define PULP_IRQ_BUFFER_HIGH_SIZE          0X040

#define PULP_READ_IRQ_ID_BASE                    0X21C
#define PULP_READ_IRQ_ID_SIZE                    0X040


#define CKG_IRQ_MASK_LOW_BASE             0X100
#define CKG_IRQ_MASK_LOW_SIZE             0X040
#define CKG_IRQ_MASK_HIGH_BASE            0X140
#define CKG_IRQ_MASK_HIGH_SIZE            0X040
#define CKG_IRQ_BUFFER_LOW_BASE           0X180
#define CKG_IRQ_BUFFER_LOW_SIZE           0X040
#define CKG_IRQ_BUFFER_HIGH_BASE          0X1C0
#define CKG_IRQ_BUFFER_HIGH_SIZE          0X040

#define CKG_READ_IRQ_ID_BASE                    0X21C
#define CKG_READ_IRQ_ID_SIZE                    0X040


#endif