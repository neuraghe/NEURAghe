/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_ANALOG_V1_H__
#define __HAL_ANALOG_V1_H__

#include "hal/pulp.h"

/*
 * Analog top HAL file for VivoSoC_2
 */

static inline void plp_analog_ip_write(int ip, int reg, int value);

// Include HAL driver files for IPs available to chip. Choose correct version 

// Control driver: IP0, IP3, IP4, IP6
#include "hal/analog_control_v1.h"

// EXG driver: IP1, IP2, IP5
#include "hal/analog_exg_v1.h"

// PPG driver: IP7
#include "hal/analog_ppg_v1.h"

// STIM driver: IP8
#include "hal/analog_stim_v1.h"

// TEMP driver: IP9
#include "hal/analog_temp_v1.h"

// BIOZ driver: IP10
#include "hal/analog_bioz_v1.h"

/*
 * General register write functions
 */

// Write to general register given ip, register number and value
static inline void plp_analog_ip_write(int ip, int reg, int value) {
	pulp_write32(ANALOG_BASE_ADDR + ((PLP_ANALOG_IP_OFFSET + ip) << PLP_ANALOG_IP_BIT) + (reg << 2), value);
}

#endif