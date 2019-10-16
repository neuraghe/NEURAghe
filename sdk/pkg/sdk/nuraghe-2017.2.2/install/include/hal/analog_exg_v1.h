/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_ANALOG_EXG_V1_H__
#define __HAL_ANALOG_EXG_V1_H__

// IP2: SAR Cerebro



// Write to register related to EXG channels given channel number, register number and value 
static inline void plp_analog_channel_write(int ch, int reg, int value) {
	pulp_write32(ANALOG_BASE_ADDR + ((PLP_ANALOG_CHANNEL_OFFSET + ch) << PLP_ANALOG_IP_BIT) + (reg << 2), value);
}


/*
static inline void plp_analog_sar_sgs_set(unsigned int value) {
	plp_analog_ip_write(CEREBRO_SAR_IP, CEREBRO_SAR_SGS, value);
}

static inline void plp_adc_enable(int adcId) {
	plp_analog_ip_write(0x2+adcId, 0x1A, 0x1);
}

static inline void plp_adc_disable(int adcId) {
	plp_analog_ip_write(0x2+adcId, 0x1A, 0x0);	
}
*/

#endif
