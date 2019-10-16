/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __ARCHI_ANALOG_V1_H__
#define __ARCHI_ANALOG_V1_H__

#include "archi/pulp.h"

/*
 * Analog top ARCHI file for VivoSoC2
 */

// Include ARCHI driver files for IPs available to chip. Choose correct version 

// Control driver: IP0, IP3, IP4, IP6
#include "archi/analog_control_v1.h"

// EXG driver: IP1, IP2, IP5
#include "archi/analog_exg_v1.h"

// PPG driver: IP7
#include "archi/analog_ppg_v1.h"

// STIM driver: IP8
#include "archi/analog_stim_v1.h"

// TEMP driver: IP9
#include "archi/analog_temp_v1.h"

// BIOZ driver: IP10
#include "archi/analog_bioz_v1.h"

/*
 * Analog register offsets
 */

// Base register offset for analog IPs
#define PLP_ANALOG_IP_OFFSET              0x20

// Bit position of IP information in register address
#define PLP_ANALOG_IP_BIT                	 9

/*
 * IP defines
 */

// IP0: Band-Gap and Biases
#define CONTROL_BG_BIAS_IP 					 0

// IP1: EXG Analog Channels Cerebro
#define EXG_CHANNEL_IP                       1

// IP2: SAR Cerebro
#define EXG_SAR_IP                           2

// IP3: Clock Divider
#define CONTORL_CLK_DIV_IP                   3

// IP4: Clock Generator
#define CONTORL_CLK_GEN_IP                   4

// IP5: Electrode Impedance Measurement
#define EXG_EIM_IP                           5

// IP6: PMU
#define CONTORL_PMU_IP                       6

// IP7: TMA-O
#define PPG_IP                               7

// IP8: Miur Nerve Stimulator and Blocker
#define STIM_IP                           	 8

// IP9: Temperature
#define TEMP_IP                         	 9

// IP10: BioZ - AFE and SAR
#define BIOZ_IP                         	10

/*
 * Macros for analog registers
 */

// Generate register mask given offset and size of bitfield
#define ANALOG_MASK(offset,size) (((1<<(size))-1) << (offset))

// Generate register value given current (full) register value, register field value, offset and size of bitfield
#define ANALOG_REG_FIELD_SET(fullValue,value,offset,size) (((fullValue) & ~ANALOG_MASK(offset, size)) | ((value) << offset))

// Get register field value given current (full) register value, offset and size of bitfield
#define ANALOG_REG_FIELD_GET(fullValue,offset,size) (((fullValue) & ~ANALOG_MASK(offset, size)) >> offset)

#endif