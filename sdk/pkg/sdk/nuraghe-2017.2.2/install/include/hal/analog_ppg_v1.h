/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_ANALOG_PPG_V1_H__
#define __HAL_ANALOG_PPG_V1_H__


/*
 * Analog PPG HAL file for VivoSoC IP: PPG_IP
 * Use this file for PPG IP compliant to VivoSoC2
 */


/*
 * PPG_IP: TMA-O
 */

// Write to register related to oximetry program sequences 
static inline void plp_analog_ppg_psr_write(int seq, int reg, int value) {
	pulp_write32(ANALOG_BASE_ADDR + ((PLP_ANALOG_IP_OFFSET + PPG_IP) << PLP_ANALOG_IP_BIT) + ANALOG_PPG_PSR(seq,reg), value);
}

// Write HW register functions
static inline void plp_analog_ppg_sar_cap_0_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_0, (value >> PPG_ADC_CWR_0_OFFSET) & ((1<<PPG_ADC_CWR_0_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_1_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_1, (value >> PPG_ADC_CWR_1_OFFSET) & ((1<<PPG_ADC_CWR_1_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_2_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_2, (value >> PPG_ADC_CWR_2_OFFSET) & ((1<<PPG_ADC_CWR_2_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_3_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_3, (value >> PPG_ADC_CWR_3_OFFSET) & ((1<<PPG_ADC_CWR_3_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_4_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_4, (value >> PPG_ADC_CWR_4_OFFSET) & ((1<<PPG_ADC_CWR_4_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_5_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_5, (value >> PPG_ADC_CWR_5_OFFSET) & ((1<<PPG_ADC_CWR_5_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_6_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_6, (value >> PPG_ADC_CWR_6_OFFSET) & ((1<<PPG_ADC_CWR_6_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_7_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_7, (value >> PPG_ADC_CWR_7_OFFSET) & ((1<<PPG_ADC_CWR_7_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_8_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_8, (value >> PPG_ADC_CWR_8_OFFSET) & ((1<<PPG_ADC_CWR_8_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_9_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_9, (value >> PPG_ADC_CWR_9_OFFSET) & ((1<<PPG_ADC_CWR_9_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_10_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_10, (value >> PPG_ADC_CWR_10_OFFSET) & ((1<<PPG_ADC_CWR_10_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_11_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_11, (value >> PPG_ADC_CWR_11_OFFSET) & ((1<<PPG_ADC_CWR_11_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_12_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_12, (value >> PPG_ADC_CWR_12_OFFSET) & ((1<<PPG_ADC_CWR_12_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_13_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_13, (value >> PPG_ADC_CWR_13_OFFSET) & ((1<<PPG_ADC_CWR_13_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_14_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_14, (value >> PPG_ADC_CWR_14_OFFSET) & ((1<<PPG_ADC_CWR_14_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_15_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_15, (value >> PPG_ADC_CWR_15_OFFSET) & ((1<<PPG_ADC_CWR_15_NBITS)-1));
}

static inline void plp_analog_ppg_sar_cap_16_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_CWR_16, (value >> PPG_ADC_CWR_16_OFFSET) & ((1<<PPG_ADC_CWR_16_NBITS)-1));
}

static inline void plp_analog_ppg_sar_peturbation_cap_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_PCWR, (value >> PPG_SAR_PCWR_OFFSET) & ((1<<PPG_SAR_PCWR_NBITS)-1));
}

static inline void plp_analog_ppg_sar_offset_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_OSR, (value >> PPG_ADC_OSR_OFFSET) & ((1<<PPG_ADC_OSR_NBITS)-1));
}

static inline void plp_analog_ppg_MFCR_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_MFCR, value);
}

static inline void plp_analog_ppg_ASR_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_ASR, value);
}

static inline void plp_analog_ppg_SGS_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_SGS, value);
}

static inline void plp_analog_ppg_LCR_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_ADC_LCR, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_0_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_0, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_1_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_1, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_2_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_2, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_3_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_3, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_4_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_4, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_5_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_5, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_6_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_6, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_7_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_7, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_8_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_8, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_9_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_9, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_10_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_10, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_11_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_11, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_12_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_12, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_13_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_13, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_14_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_14, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_15_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_15, value);
}

static inline void plp_analog_ppg_sar_clocking_cycle_16_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_CC_16, value);
}

static inline void plp_analog_ppg_sar_reset_cycle_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_SAR_RC, value);
}

static inline void plp_analog_ppg_DTR_0_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_DTR_0, value);
}

static inline void plp_analog_ppg_DTR_1_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_DTR_1, value);
}

static inline void plp_analog_ppg_DTR_2_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_DTR_2, value);
}

static inline void plp_analog_ppg_DDR_0_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_DDR_0, value);
}

static inline void plp_analog_ppg_DDR_1_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_DDR_1, value);
}

static inline void plp_analog_ppg_GCR_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_GCR, value);
}

static inline void plp_analog_ppg_TCTIA_0_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_TCTIA_0, value);
}

static inline void plp_analog_ppg_TCTIA_1_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_TCTIA_1, value);
}

static inline void plp_analog_ppg_TCCAL_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_TCCAL, value);
}

static inline void plp_analog_ppg_PSR_0_0_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_0_0, value);
}

static inline void plp_analog_ppg_PSR_0_1_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_0_1, value);
}

static inline void plp_analog_ppg_PSR_0_2_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_0_2, value);
}

static inline void plp_analog_ppg_PSR_0_3_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_0_3, value);
}

static inline void plp_analog_ppg_PSR_0_4_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_0_4, value);
}

static inline void plp_analog_ppg_PSR_1_0_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_1_0, value);
}

static inline void plp_analog_ppg_PSR_1_1_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_1_1, value);
}

static inline void plp_analog_ppg_PSR_1_2_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_1_2, value);
}

static inline void plp_analog_ppg_PSR_1_3_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_1_3, value);
}

static inline void plp_analog_ppg_PSR_1_4_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_1_4, value);
}

static inline void plp_analog_ppg_PSR_2_0_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_2_0, value);
}

static inline void plp_analog_ppg_PSR_2_1_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_2_1, value);
}

static inline void plp_analog_ppg_PSR_2_2_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_2_2, value);
}

static inline void plp_analog_ppg_PSR_2_3_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_2_3, value);
}

static inline void plp_analog_ppg_PSR_2_4_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_2_4, value);
}

static inline void plp_analog_ppg_PSR_3_0_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_3_0, value);
}

static inline void plp_analog_ppg_PSR_3_1_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_3_1, value);
}

static inline void plp_analog_ppg_PSR_3_2_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_3_2, value);
}

static inline void plp_analog_ppg_PSR_3_3_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_3_3, value);
}

static inline void plp_analog_ppg_PSR_3_4_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_3_4, value);
}

static inline void plp_analog_ppg_PSR_4_0_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_4_0, value);
}

static inline void plp_analog_ppg_PSR_4_1_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_4_1, value);
}

static inline void plp_analog_ppg_PSR_4_2_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_4_2, value);
}

static inline void plp_analog_ppg_PSR_4_3_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_4_3, value);
}

static inline void plp_analog_ppg_PSR_4_4_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_PSR_4_4, value);
}

static inline void plp_analog_ppg_TCR_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_TCR, value);
}

static inline void plp_analog_ppg_DCR_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_OXI_DCR, value);
}

static inline void plp_analog_ppg_BCR_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_tma_BCR, value);
}

static inline void plp_analog_ppg_ICR_set(unsigned int value) {
	plp_analog_ip_write(PPG_IP, PPG_VIV_ICR, value);
}

// Write register field functions
static inline void plp_analog_ppg_fsm_breset_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_ADC_MFCR_RESET_OFFSET, PPG_ADC_MFCR_RESET_NBITS);
	plp_analog_ppg_MFCR_set(*shadow_copy);
}

static inline void plp_analog_ppg_fsm_update_calib_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_ADC_MFCR_UPDATE_CALIB_OFFSET, PPG_ADC_MFCR_UPDATE_CALIB_NBITS);
	plp_analog_ppg_MFCR_set(*shadow_copy);
}

static inline void plp_analog_ppg_fsm_mu_w_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_ADC_MFCR_MUW_OFFSET, PPG_ADC_MFCR_MUW_NBITS);
	plp_analog_ppg_MFCR_set(*shadow_copy);
}

static inline void plp_analog_ppg_fsm_mu_d_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_ADC_MFCR_MUD_OFFSET, PPG_ADC_MFCR_MUD_NBITS);
	plp_analog_ppg_MFCR_set(*shadow_copy);
}

static inline void plp_analog_ppg_fsm_dithering_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_ADC_MFCR_IN_DS_OFFSET, PPG_ADC_MFCR_IN_DS_NBITS);
	plp_analog_ppg_MFCR_set(*shadow_copy);
}

static inline void plp_analog_ppg_fsm_sampling_mode_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_ADC_MFCR_SAMPLING_MODE_OFFSET, PPG_ADC_MFCR_SAMPLING_MODE_NBITS);
	plp_analog_ppg_MFCR_set(*shadow_copy);
}

static inline void plp_analog_ppg_fsm_signal_generator_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_ADC_MFCR_SIG_GEN_OFFSET, PPG_ADC_MFCR_SIG_GEN_NBITS);
	plp_analog_ppg_MFCR_set(*shadow_copy);
}

static inline void plp_analog_ppg_cnfg_operating_mode_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_GCR_MODE_OFFSET, PPG_OXI_GCR_MODE_NBITS);
	plp_analog_ppg_GCR_set(*shadow_copy);
} 

static inline void plp_analog_ppg_cnfg_sync_mode_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_GCR_SYNC_MODE_OFFSET, PPG_OXI_GCR_SYNC_MODE_NBITS);
	plp_analog_ppg_GCR_set(*shadow_copy);
} 

static inline void plp_analog_ppg_duty_cycling_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_GCR_DUTY_CYCLING_ON_OFFSET, PPG_OXI_GCR_DUTY_CYCLING_ON_NBITS);
	plp_analog_ppg_GCR_set(*shadow_copy);
} 

static inline void plp_analog_ppg_dac_referenc_select_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_GCR_DAC_REF_SEL_OFFSET, PPG_OXI_GCR_DAC_REF_SEL_NBITS);
	plp_analog_ppg_GCR_set(*shadow_copy);
} 

static inline void plp_analog_ppg_cnfg_pre_scale_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_GCR_PRE_SCALE_CNFG_OFFSET, PPG_OXI_GCR_PRE_SCALE_CNFG_NBITS);
	plp_analog_ppg_GCR_set(*shadow_copy);
} 

static inline void plp_analog_ppg_cnfg_cathode_only_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_GCR_CAHTODE_ONLY_OFFSET, PPG_OXI_GCR_CAHTODE_ONLY_NBITS);
	plp_analog_ppg_GCR_set(*shadow_copy);
} 

static inline void plp_analog_ppg_t_idle_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_TCTIA_0_T_IDLE_OFFSET, PPG_OXI_TCTIA_0_T_IDLE_NBITS);
	plp_analog_ppg_TCTIA_0_set(*shadow_copy);
} 

static inline void plp_analog_ppg_t_ota_en_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_TCTIA_0_T_OTA_EN_OFFSET, PPG_OXI_TCTIA_0_T_OTA_EN_NBITS);
	plp_analog_ppg_TCTIA_0_set(*shadow_copy);
} 

static inline void plp_analog_ppg_t_oss_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_TCTIA_0_T_OSS_OFFSET, PPG_OXI_TCTIA_0_T_OSS_NBITS);
	plp_analog_ppg_TCTIA_0_set(*shadow_copy);
} 

static inline void plp_analog_ppg_t_rst_Cf_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_TCTIA_0_T_RST_CF_OFFSET, PPG_OXI_TCTIA_0_T_RST_CF_NBITS);
	plp_analog_ppg_TCTIA_0_set(*shadow_copy);
} 

static inline void plp_analog_ppg_t_precharge_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_TCTIA_0_T_PRECHARGE_OFFSET, PPG_OXI_TCTIA_0_T_PRECHARGE_NBITS);
	plp_analog_ppg_TCTIA_0_set(*shadow_copy);
} 

static inline void plp_analog_ppg_t_int_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_TCTIA_1_T_INT_OFFSET, PPG_OXI_TCTIA_1_T_INT_NBITS);
	plp_analog_ppg_TCTIA_1_set(*shadow_copy);
} 

static inline void plp_analog_ppg_t_adc_track_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_TCTIA_1_T_ADC_TRACK_OFFSET, PPG_OXI_TCTIA_1_T_ADC_TRACK_NBITS);
	plp_analog_ppg_TCTIA_1_set(*shadow_copy);
} 

static inline void plp_analog_ppg_t_adc_sample_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_TCTIA_1_T_ADC_SAMPLE_OFFSET, PPG_OXI_TCTIA_1_T_ADC_SAMPLE_NBITS);
	plp_analog_ppg_TCTIA_1_set(*shadow_copy);
} 

static inline void plp_analog_ppg_t_inter_ch_rst_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_TCTIA_1_T_INTER_CH_RST_OFFSET, PPG_OXI_TCTIA_1_T_INTER_CH_RST_NBITS);
	plp_analog_ppg_TCTIA_1_set(*shadow_copy);
} 

static inline void plp_analog_ppg_t_scycle_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_TCTIA_1_T_SCYCLE_OFFSET, PPG_OXI_TCTIA_1_T_SCYCLE_NBITS);
	plp_analog_ppg_TCTIA_1_set(*shadow_copy);
} 

static inline void plp_analog_ppg_cnfg_ref_adc_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_TCR_CNFG_REF_ADC_OFFSET, PPG_OXI_TCR_CNFG_REF_ADC_NBITS);
	plp_analog_ppg_TCR_set(*shadow_copy);
} 

static inline void plp_analog_ppg_cnfg_ref_tia_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_TCR_CNFG_REF_TIA_OFFSET, PPG_OXI_TCR_CNFG_REF_TIA_NBITS);
	plp_analog_ppg_TCR_set(*shadow_copy);
} 

static inline void plp_analog_ppg_cnfg_dac_current_cnfg_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_DCR_DAC_CNFG_RES_OFFSET, PPG_OXI_DCR_DAC_CNFG_RES_NBITS);
	plp_analog_ppg_TCR_set(*shadow_copy);
} 

static inline void plp_analog_ppg_out_bus_mux_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_VIV_ICR_OUT_BUS_MUX_OFFSET, PPG_VIV_ICR_OUT_BUS_MUX_NBITS);
	plp_analog_ppg_ICR_set(*shadow_copy);
} 

// Program sequence register set (to register) and get (from shadow copy) functions

static inline void plp_analog_ppg_prog_seq_ch_out_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_PSR_i_0_CH_OUT_OFFSET, PPG_OXI_PSR_i_0_CH_OUT_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_0, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_ch_out_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_OXI_PSR_i_0_CH_OUT_OFFSET, PPG_OXI_PSR_i_0_CH_OUT_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_ch_in_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_PSR_i_0_CH_IN_OFFSET, PPG_OXI_PSR_i_0_CH_IN_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_0, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_ch_int_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_OXI_PSR_i_0_CH_IN_OFFSET, PPG_OXI_PSR_i_0_CH_IN_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_inv_input_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_PSR_i_0_INV_INPUT_MODE_OFFSET, PPG_OXI_PSR_i_0_INV_INPUT_MODE_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_0, *shadow_copy);
} 

static inline void plp_analog_ppg_prog_seq_no_precharge_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_PSR_i_0_NO_PRECHG_MODE_OFFSET, PPG_OXI_PSR_i_0_NO_PRECHG_MODE_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_0, *shadow_copy);
} 

static inline void plp_analog_ppg_prog_seq_ctia_all_cf_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_PSR_i_0_CTIA_ALL_CF_OFFSET, PPG_OXI_PSR_i_0_CTIA_ALL_CF_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_0, *shadow_copy);
} 

static inline void plp_analog_ppg_prog_seq_direct_sample_mode_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_PSR_i_0_DIRCET_SAMPLE_MODE_OFFSET, PPG_OXI_PSR_i_0_DIRCET_SAMPLE_MODE_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_0, *shadow_copy);
} 

static inline void plp_analog_ppg_prog_seq_no_dcs_mode_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_PSR_i_0_NO_DCS_MODE_OFFSET, PPG_OXI_PSR_i_0_NO_DCS_MODE_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_0, *shadow_copy);
} 

static inline void plp_analog_ppg_prog_seq_single_ch_mode_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_PSR_i_0_SINGLE_CH_MODE_OFFSET, PPG_OXI_PSR_i_0_SINGLE_CH_MODE_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_0, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_single_ch_mode_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_OXI_PSR_i_0_SINGLE_CH_MODE_OFFSET, PPG_OXI_PSR_i_0_SINGLE_CH_MODE_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_cds_mode_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_PSR_i_0_CDS_MODE_OFFSET, PPG_OXI_PSR_i_0_CDS_MODE_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_0, *shadow_copy);
} 

static inline void plp_analog_ppg_prog_seq_os_short_pulse_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_PSR_i_0_OS_SHORT_PULSE_OFFSET, PPG_OXI_PSR_i_0_OS_SHORT_PULSE_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_0, *shadow_copy);
} 

static inline void plp_analog_ppg_prog_seq_os_cnfg_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_PSR_i_0_OS_CNFG_OFFSET, PPG_OXI_PSR_i_0_OS_CNFG_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_0, *shadow_copy);
} 

static inline void plp_analog_ppg_prog_seq_lim_os_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_PSR_i_0_LIM_OS_OFFSET, PPG_OXI_PSR_i_0_LIM_OS_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_0, *shadow_copy);
} 

static inline void plp_analog_ppg_prog_seq_dcs_cnfg_dk_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_OXI_PSR_i_0_DCS_CNFG_DK_OFFSET, PPG_OXI_PSR_i_0_DCS_CNFG_DK_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_0, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_dcs_cnfg_dk_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_OXI_PSR_i_0_DCS_CNFG_DK_OFFSET, PPG_OXI_PSR_i_0_DCS_CNFG_DK_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_rf_cnfg_vs_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_1_RF_CNFG_RED_OFFSET, PPG_PSR_i_1_RF_CNFG_RED_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_1, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_rf_cnfg_vs_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_PSR_i_1_RF_CNFG_RED_OFFSET, PPG_PSR_i_1_RF_CNFG_RED_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_cf_cnfg_vs_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_1_CF_CNFG_RED_OFFSET, PPG_PSR_i_1_CF_CNFG_RED_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_1, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_cf_cnfg_vs_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_PSR_i_1_CF_CNFG_RED_OFFSET, PPG_PSR_i_1_CF_CNFG_RED_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_rf_cnfg_ir_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_1_RF_CNFG_IR_OFFSET, PPG_PSR_i_1_RF_CNFG_IR_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_1, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_rf_cnfg_ir_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_PSR_i_1_RF_CNFG_IR_OFFSET, PPG_PSR_i_1_RF_CNFG_IR_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_cf_cnfg_ir_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_1_CF_CNFG_IR_OFFSET, PPG_PSR_i_1_CF_CNFG_IR_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_1, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_cf_cnfg_ir_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_PSR_i_1_CF_CNFG_IR_OFFSET, PPG_PSR_i_1_CF_CNFG_IR_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_dac_code_vs_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_2_DAC_CODE_RED_OFFSET, PPG_PSR_i_2_DAC_CODE_RED_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_2, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_dac_code_vs_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_PSR_i_2_DAC_CODE_RED_OFFSET, PPG_PSR_i_2_DAC_CODE_RED_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_dcs_cnfg_vs_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_2_DCS_CNFG_RED_OFFSET, PPG_PSR_i_2_DCS_CNFG_RED_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_2, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_dcs_cnfg_vs_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_PSR_i_2_DCS_CNFG_RED_OFFSET, PPG_PSR_i_2_DCS_CNFG_RED_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_dac_code_ir_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_2_DAC_CODE_IR_OFFSET, PPG_PSR_i_2_DAC_CODE_IR_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_2, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_dac_code_ir_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_PSR_i_2_DAC_CODE_IR_OFFSET, PPG_PSR_i_2_DAC_CODE_IR_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_dcs_cnfg_ir_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_2_DCS_CNFG_IR_OFFSET, PPG_PSR_i_2_DCS_CNFG_IR_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_2, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_dcs_cnfg_ir_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_PSR_i_2_DCS_CNFG_IR_OFFSET, PPG_PSR_i_2_DCS_CNFG_IR_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_t_track_vs_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_3_T_TRACK_RED_OFFSET, PPG_PSR_i_3_T_TRACK_RED_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_3, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_t_track_vs_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_PSR_i_3_T_TRACK_RED_OFFSET, PPG_PSR_i_3_T_TRACK_RED_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_t_track_ir_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_3_T_TRACK_IR_OFFSET, PPG_PSR_i_3_T_TRACK_IR_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_3, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_t_track_ir_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_PSR_i_3_T_TRACK_IR_OFFSET, PPG_PSR_i_3_T_TRACK_IR_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_t_track_dk_vs_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_4_T_TRACK_DK_RED_OFFSET, PPG_PSR_i_4_T_TRACK_DK_RED_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_4, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_t_track_dk_vs_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_PSR_i_4_T_TRACK_DK_RED_OFFSET, PPG_PSR_i_4_T_TRACK_DK_RED_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_en_anode_mux_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_4_EN_ANODE_MUX_OFFSET, PPG_PSR_i_4_EN_ANODE_MUX_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_4, *shadow_copy);
} 

static inline void plp_analog_ppg_prog_seq_anode_sel_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_4_EN_ANODE_MUX_OFFSET, PPG_PSR_i_4_EN_ANODE_MUX_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_4, *shadow_copy);
} 

static inline void plp_analog_ppg_prog_seq_t_track_dk_ir_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_4_ANODE_SEL_OFFSET, PPG_PSR_i_4_ANODE_SEL_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_4, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_t_track_dk_ir_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_PSR_i_4_T_TRACK_DK_IR_OFFSET, PPG_PSR_i_4_T_TRACK_DK_IR_NBITS);
} 

static inline void plp_analog_ppg_prog_seq_cf_cnfg_dk_set(unsigned char sequence, unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, PPG_PSR_i_4_CF_CNFG_DK_OFFSET, PPG_PSR_i_4_CF_CNFG_DK_NBITS);
	plp_analog_ppg_psr_write(sequence, PPG_OXI_PSR_i_4, *shadow_copy);
} 

static inline unsigned int plp_analog_ppg_prog_seq_cf_cnfg_dk_get(unsigned int *shadow_copy) {
	return ANALOG_REG_FIELD_GET(*shadow_copy, PPG_PSR_i_4_CF_CNFG_DK_OFFSET, PPG_PSR_i_4_CF_CNFG_DK_NBITS);
} 

#endif
