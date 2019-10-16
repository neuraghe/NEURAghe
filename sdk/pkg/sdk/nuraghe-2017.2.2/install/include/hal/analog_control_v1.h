/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_ANALOG_CONTROL_V1_H__
#define __HAL_ANALOG_CONTROL_V1_H__

/*
 * Analog control HAL file for VivoSoC IPs: CONTROL_BG_BIAS_IP, CONTORL_CLK_DIV_IP, CONTORL_CLK_GEN_IP, CONTORL_PMU_IP
 * Use this file for control IPs compliant to VivoSoC2
 */


/*
 * CONTROL_BG_BIAS_IP: Band-Gap and Biases
 */

// Write HW register functions
static inline void plp_analog_control_bg_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_EN, value);
}

static inline void plp_analog_control_bg_boost_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_BOOST_EN, value);
}

static inline void plp_analog_control_bg_current_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_CURRENT_EN, value);
}

static inline void plp_analog_control_ip6_0v6_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_IP6_0V6_EN, value);
}

static inline void plp_analog_control_ip6_1v2_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_IP6_1V2_EN, value);
}

static inline void plp_analog_control_bias_all_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_BIAS_ALL_EN, value);
}

static inline void plp_analog_control_ibias_exg_vref_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_IBIAS_VREF_EXG, value);
}

static inline void plp_analog_control_ibias_exg_vcm_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_IBIAS_VCM_EXG, value);
}

static inline void plp_analog_control_ibias_pmu_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_IBIAS_PMU, value);
}

static inline void plp_analog_control_pgnd_value_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_PGND_VALUE, value);
}

static inline void plp_analog_control_ibias_stim_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_IBIAS_STIM, value);
}

static inline void plp_analog_control_ibias_ppg_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_IBIAS_PPG, value);
}

static inline void plp_analog_control_ibias_ppg_1v2_buffer_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_IBIAS_PPG_1V2, value);
}

static inline void plp_analog_control_ibias_pgnd_buffer_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_IBIAS_PGND, value);
}

static inline void plp_analog_control_ibias_bioz_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_IBIAS_BIOZ, value);
}

static inline void plp_analog_control_ibias_bioz_vcm_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_IBIAS_VCM_BIOZ, value);
}

static inline void plp_analog_control_ibias_bioz_vref_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_IBIAS_VREF_BIOZ, value);
}

static inline void plp_analog_control_pgnd_buffer_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTROL_BG_BIAS_IP, CONTROL_BG_BIAS_BAR_PGND_EN, value);
}

// Write SW register functions
static inline void plp_analog_control_bg_bias_set(unsigned int value) {
	plp_analog_control_bg_enable_set((value >> CONTROL_BG_BIAS_EN_OFFSET) & ((1<<CONTROL_BG_BIAS_EN_NBITS)-1));
	plp_analog_control_bg_boost_enable_set((value >> CONTROL_BG_BIAS_BOOST_EN_OFFSET) & ((1<<CONTROL_BG_BIAS_BOOST_EN_NBITS)-1));
	plp_analog_control_bg_current_enable_set((value >> CONTROL_BG_BIAS_CURRENT_EN_OFFSET) & ((1 << CONTROL_BG_BIAS_CURRENT_EN_NBITS) -1));
	plp_analog_control_ip6_0v6_enable_set((value >> CONTROL_BG_BIAS_IP6_0V6_EN_OFFSET) & ((1 << CONTROL_BG_BIAS_IP6_0V6_EN_NBITS) -1));
	plp_analog_control_ip6_1v2_enable_set((value >> CONTROL_BG_BIAS_IP6_1V2_EN_OFFSET) & ((1 << CONTROL_BG_BIAS_IP6_1V2_EN_NBITS) -1));
	plp_analog_control_bias_all_enable_set((value >> CONTROL_BG_BIAS_BIAS_ALL_EN_OFFSET) & ((1 << CONTROL_BG_BIAS_BIAS_ALL_EN_NBITS) -1));
	plp_analog_control_ibias_exg_vref_set((value >> CONTROL_BG_BIAS_IBIAS_VREF_EXG_OFFSET) & ((1 << CONTROL_BG_BIAS_IBIAS_VREF_EXG_NBITS) -1));
	plp_analog_control_ibias_exg_vcm_set((value >> CONTROL_BG_BIAS_IBIAS_VCM_EXG_OFFSET) & ((1 << CONTROL_BG_BIAS_IBIAS_VCM_EXG_NBITS) -1));
	plp_analog_control_ibias_pmu_set((value >> CONTROL_BG_BIAS_IBIAS_PMU_OFFSET) & ((1 << CONTROL_BG_BIAS_IBIAS_PMU_NBITS) -1));
	plp_analog_control_ibias_stim_set((value >> CONTROL_BG_BIAS_IBIAS_STIM_OFFSET) & ((1 << CONTROL_BG_BIAS_IBIAS_STIM_NBITS) -1));
	plp_analog_control_ibias_ppg_set((value >> CONTROL_BG_BIAS_IBIAS_PPG_OFFSET) & ((1 << CONTROL_BG_BIAS_IBIAS_PPG_NBITS) -1));
	plp_analog_control_ibias_ppg_1v2_buffer_set((value >> CONTROL_BG_BIAS_IBIAS_PPG_1V2_OFFSET) & ((1 << CONTROL_BG_BIAS_IBIAS_PPG_1V2_NBITS) -1));
	plp_analog_control_ibias_pgnd_buffer_set((value >> CONTROL_BG_BIAS_IBIAS_PGND_OFFSET) & ((1 << CONTROL_BG_BIAS_IBIAS_PGND_NBITS) -1));
	plp_analog_control_ibias_bioz_set((value >> CONTROL_BG_BIAS_IBIAS_BIOZ_OFFSET) & ((1 << CONTROL_BG_BIAS_IBIAS_BIOZ_NBITS) -1));
	plp_analog_control_ibias_bioz_vcm_set((value >> CONTROL_BG_BIAS_IBIAS_VCM_BIOZ_OFFSET) & ((1 << CONTROL_BG_BIAS_IBIAS_VCM_BIOZ_NBITS) -1));
	plp_analog_control_ibias_bioz_vref_set((value >> CONTROL_BG_BIAS_IBIAS_VREF_BIOZ_OFFSET) & ((1 << CONTROL_BG_BIAS_IBIAS_VREF_BIOZ_NBITS) -1));
	plp_analog_control_pgnd_value_set((value >> CONTROL_BG_BIAS_PGND_VALUE_OFFSET) & ((1 << CONTROL_BG_BIAS_PGND_VALUE_NBITS) -1));
	plp_analog_control_pgnd_buffer_enable_set((value >> CONTROL_BG_BIAS_BAR_PGND_EN_OFFSET) & ((1 << CONTROL_BG_BIAS_BAR_PGND_EN_NBITS) -1));
}


/*
 * CONTORL_CLK_DIV_IP: Clock Divider
 */

// Write HW register functions
static inline void plp_analog_control_clk_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_EN_REGS, value);
}

static inline void plp_analog_control_master_clkdiv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_FCT_MASTER, (value >> CONTROL_CLK_DIV_FCT_MASTER_OFFSET) & ((1<<CONTROL_CLK_DIV_FCT_MASTER_NBITS)-1));
}

static inline void plp_analog_control_exg_sar_clkdiv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_FCT_EXG_SAR, value);
}

static inline void plp_analog_control_exg_sar_n_ch_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_EXG_NUM_CH, value);
}

static inline void plp_analog_control_exg_sar_ch_wdw_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_EXG_CH_WDW, value);
}

static inline void plp_analog_control_exg_sar_gap_width_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_EXG_GAP_WIDTH, value);
}

static inline void plp_analog_control_exg_sar_conv_mode_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_EXG_CONV_MODE, value);
}

static inline void plp_analog_control_exg_sar_trigger_width_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_EXG_TRIGGER_WIDTH, value);
}

static inline void plp_analog_control_exg_sar_trigger_delay_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_EXG_TRIGGER_DELAY, value);
}

static inline void plp_analog_control_exg_sar_track2sample_delay_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_EXG_TRACK_DELAY, value);
}

static inline void plp_analog_control_chopping_clkdiv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_FCT_AMP, value);
}

static inline void plp_analog_control_chopping_clk_inv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_AMP_INV, value);
}

static inline void plp_analog_control_chopping_delay_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_AMP_ENABLE_DELAY, value);
}

static inline void plp_analog_control_chopping_delay_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_AMP_CHOP_DELAY, value);
}

static inline void plp_analog_control_bg_clkdiv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_FCT_BG, value);
}

static inline void plp_analog_control_bg_clk_inv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_BG_INV, value);
}

static inline void plp_analog_control_bg_duty_cycle_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_BG_EN_DUTY_CYCLE, value);
}

static inline void plp_analog_control_bg_duty_cycle_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_BG_DUTY_CYCLE, value);
}

static inline void plp_analog_control_exg_eima_clkdiv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_FCT_EXG_EIM_A, value);
}

static inline void plp_analog_control_exg_eimd_clkdiv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_FCT_EXG_EIM_D, value);
}

static inline void plp_analog_control_ppg_clkdiv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_FCT_PPG, (value >> CONTROL_CLK_DIV_FCT_PPG_OFFSET) & ((1<<CONTROL_CLK_DIV_FCT_PPG_NBITS)-1));
}

static inline void plp_analog_control_stim_clkdiv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_FCT_STIM, (value >> CONTROL_CLK_DIV_FCT_STIM_OFFSET) & ((1<<CONTROL_CLK_DIV_FCT_STIM_NBITS)-1));
}

static inline void plp_analog_control_temp_clkdiv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_FCT_TEMP, (value >> CONTROL_CLK_DIV_FCT_TEMP_OFFSET) & ((1<<CONTROL_CLK_DIV_FCT_TEMP_NBITS)-1));
}

static inline void plp_analog_control_bioz_1_clkdiv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_FCT_BIOZ_1, value);
}

static inline void plp_analog_control_bioz_2_clkdiv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_FCT_BIOZ_2, value);
}

static inline void plp_analog_control_bioz_sar_clkdiv_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_FCT_BIOZ_SAR, value);
}

static inline void plp_analog_control_bioz_sar_n_ch_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_BIOZ_NUM_CH, value);
}

static inline void plp_analog_control_bioz_sar_ch_wdw_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_BIOZ_CH_WDW, value);
}

static inline void plp_analog_control_bioz_sar_gap_width_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_BIOZ_GAP_WIDTH, value);
}

static inline void plp_analog_control_bioz_sar_conv_mode_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_BIOZ_CONV_MODE, value);
}

static inline void plp_analog_control_bioz_sar_trigger_width_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_BIOZ_TRIGGER_WIDTH, value);
}

static inline void plp_analog_control_bioz_sar_trigger_delay_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_BIOZ_TRIGGER_DELAY, value);
}

static inline void plp_analog_control_bioz_sar_track2sample_delay_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_DIV_IP, CONTROL_CLK_DIV_BIOZ_TRACK_DELAY, value);
}

// Write SW register functions
static inline void plp_analog_control_clkdiv_master_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_MASTER_OFFSET, CONTROL_CLK_DIV_EN_MASTER_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_clkdiv_exg_sar_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_EXG_SAR_OFFSET, CONTROL_CLK_DIV_EN_EXG_SAR_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_exg_sarclk_phase_gen_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_EXG_PHASEGEN_OFFSET, CONTROL_CLK_DIV_EN_EXG_PHASEGEN_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_clkdiv_chopping_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_AMP_DUTY_OFFSET, CONTROL_CLK_DIV_EN_AMP_DUTY_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_clkdiv_bg_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_BG_DUTY_OFFSET, CONTROL_CLK_DIV_EN_BG_DUTY_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_clkdiv_exg_eima_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_EXG_EIMA_OFFSET, CONTROL_CLK_DIV_EN_EXG_EIMA_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_clkdiv_exg_eimd_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_EXG_EIMD_OFFSET, CONTROL_CLK_DIV_EN_EXG_EIMD_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_clkdiv_ppg_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_PPG_OFFSET, CONTROL_CLK_DIV_EN_PPG_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_clkdiv_stim_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_STIM_OFFSET, CONTROL_CLK_DIV_EN_STIM_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_clkdiv_temp_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_TEMP_OFFSET, CONTROL_CLK_DIV_EN_TEMP_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_clkdiv_bioz_0_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_BIOZ_0_OFFSET, CONTROL_CLK_DIV_EN_BIOZ_0_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_clkdiv_bioz_1_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_BIOZ_1_OFFSET, CONTROL_CLK_DIV_EN_BIOZ_1_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_clkdiv_bioz_sar_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_BIOZ_SAR_OFFSET, CONTROL_CLK_DIV_EN_BIOZ_SAR_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_bioz_sar_phase_gen_enable_set(unsigned int value, unsigned int *shadow_copy) {
	*shadow_copy = ANALOG_REG_FIELD_SET(*shadow_copy, value, CONTROL_CLK_DIV_EN_BIOZ_PHASEGEN_OFFSET, CONTROL_CLK_DIV_EN_BIOZ_PHASEGEN_NBITS);
	plp_analog_control_clk_enable_set(*shadow_copy);
}

static inline void plp_analog_control_exg_reg0_set(unsigned int value) {
	plp_analog_control_exg_sar_clkdiv_set((value >> CONTROL_CLK_DIV_FCT_EXG_SAR_OFFSET) & ((1<<CONTROL_CLK_DIV_FCT_EXG_SAR_NBITS)-1));
	plp_analog_control_exg_sar_n_ch_set((value >> CONTROL_CLK_DIV_EXG_NUM_CH_OFFSET) & ((1<<CONTROL_CLK_DIV_EXG_NUM_CH_NBITS)-1));
	plp_analog_control_exg_sar_ch_wdw_set((value >> CONTROL_CLK_DIV_CH_WDW_EXG_OFFSET) & ((1<<CONTROL_CLK_DIV_CH_WDW_EXG_NBITS)-1));
}

static inline void plp_analog_control_exg_reg1_set(unsigned int value) {
	plp_analog_control_exg_sar_gap_width_set((value >> CONTROL_CLK_DIV_EXG_TRIGGER_WIDTH_OFFSET) & ((1<<CONTROL_CLK_DIV_EXG_TRIGGER_WIDTH_NBITS)-1));
	plp_analog_control_exg_sar_conv_mode_set((value >> CONTROL_CLK_DIV_EXG_TRIGGER_DELAY_OFFSET) & ((1<<CONTROL_CLK_DIV_EXG_TRIGGER_DELAY_NBITS)-1));
	plp_analog_control_exg_sar_trigger_width_set((value >> CONTROL_CLK_DIV_EXG_GAP_WIDTH_OFFSET) & ((1<<CONTROL_CLK_DIV_EXG_GAP_WIDTH_NBITS)-1));
	plp_analog_control_exg_sar_trigger_delay_set((value >> CONTROL_CLK_DIV_EXG_TRACK_DELAY_OFFSET) & ((1<<CONTROL_CLK_DIV_EXG_TRACK_DELAY_NBITS)-1));
	plp_analog_control_exg_sar_track2sample_delay_set((value >> CONTROL_CLK_DIV_EXG_CONV_MODE_OFFSET) & ((1<<CONTROL_CLK_DIV_EXG_CONV_MODE_NBITS)-1));
}

static inline void plp_analog_control_chopping_reg0_set(unsigned int value) {
	plp_analog_control_chopping_clkdiv_set((value >> CONTROL_CLK_DIV_AMP_CHOP_DELAY_OFFSET) & ((1<<CONTROL_CLK_DIV_AMP_CHOP_DELAY_NBITS)-1));
	plp_analog_control_chopping_delay_set((value >> CONTROL_CLK_DIV_AMP_ENABLE_DELAY_OFFSET) & ((1<<CONTROL_CLK_DIV_AMP_ENABLE_DELAY_NBITS)-1));
}

static inline void plp_analog_control_chopping_reg1_set(unsigned int value) {
	plp_analog_control_chopping_clk_inv_set((value >> CONTROL_CLK_DIV_FCT_AMP_OFFSET) & ((1<<CONTROL_CLK_DIV_FCT_AMP_NBITS)-1));
	plp_analog_control_chopping_delay_enable_set((value >> CONTROL_CLK_DIV_AMP_INV_OFFSET) & ((1<<CONTROL_CLK_DIV_AMP_INV_NBITS)-1));
}

static inline void plp_analog_control_bg_reg0_set(unsigned int value) {
	plp_analog_control_bg_clkdiv_set((value >> CONTROL_CLK_DIV_BG_DUTY_CYCLE_OFFSET) & ((1<<CONTROL_CLK_DIV_BG_DUTY_CYCLE_NBITS)-1));
	plp_analog_control_bg_duty_cycle_set((value >> CONTROL_CLK_DIV_FCT_BG_OFFSET) & ((1<<CONTROL_CLK_DIV_FCT_BG_NBITS)-1));
}

static inline void plp_analog_control_bg_reg1_set(unsigned int value) {
	plp_analog_control_bg_clk_inv_set((value >> CONTROL_CLK_DIV_BG_INV_OFFSET) & ((1<<CONTROL_CLK_DIV_BG_INV_NBITS)-1));
	plp_analog_control_bg_duty_cycle_enable_set((value >> CONTROL_CLK_DIV_BG_EN_DUTY_CYCLE_OFFSET) & ((1<<CONTROL_CLK_DIV_BG_EN_DUTY_CYCLE_NBITS)-1));
}

static inline void plp_analog_control_clkdiv_exg_eim_set(unsigned int value) {
	plp_analog_control_exg_eima_clkdiv_set((value >> CONTROL_CLK_DIV_FCT_EXC_EIM_A_OFFSET) & ((1<<CONTROL_CLK_DIV_FCT_EXC_EIM_A_NBITS)-1));
	plp_analog_control_exg_eimd_clkdiv_set((value >> CONTROL_CLK_DIV_FCT_EXC_EIM_D_OFFSET) & ((1<<CONTROL_CLK_DIV_FCT_EXC_EIM_D_NBITS)-1));
}

static inline void plp_analog_control_clkdiv_bioz_set(unsigned int value) {
	plp_analog_control_bioz_1_clkdiv_set((value >> CONTROL_CLK_DIV_FCT_BIOZ_1_OFFSET) & ((1<<CONTROL_CLK_DIV_FCT_BIOZ_1_NBITS)-1));
	plp_analog_control_bioz_1_clkdiv_set((value >> CONTROL_CLK_DIV_FCT_BIOZ_2_OFFSET) & ((1<<CONTROL_CLK_DIV_FCT_BIOZ_2_NBITS)-1));
}

static inline void plp_analog_control_bioz_reg0_set(unsigned int value) {
	plp_analog_control_bioz_sar_clkdiv_set((value >> CONTROL_CLK_DIV_FCT_BIOZ_SAR_OFFSET) & ((1<<CONTROL_CLK_DIV_FCT_BIOZ_SAR_NBITS)-1));
	plp_analog_control_bioz_sar_n_ch_set((value >> CONTROL_CLK_DIV_BIOZ_NUM_CH_OFFSET) & ((1<<CONTROL_CLK_DIV_BIOZ_NUM_CH_NBITS)-1));
	plp_analog_control_bioz_sar_ch_wdw_set((value >> CONTROL_CLK_DIV_BIOZ_CH_WDW_OFFSET) & ((1<<CONTROL_CLK_DIV_BIOZ_CH_WDW_NBITS)-1));
}

static inline void plp_analog_control_bioz_reg1_set(unsigned int value) {
	plp_analog_control_bioz_sar_gap_width_set((value >> CONTROL_CLK_DIV_BIOZ_TRIGGER_WIDTH_OFFSET) & ((1<<CONTROL_CLK_DIV_BIOZ_TRIGGER_WIDTH_NBITS)-1));
	plp_analog_control_bioz_sar_conv_mode_set((value >> CONTROL_CLK_DIV_BIOZ_TRIGGER_DELAY_OFFSET) & ((1<<CONTROL_CLK_DIV_BIOZ_TRIGGER_DELAY_NBITS)-1));
	plp_analog_control_bioz_sar_trigger_width_set((value >> CONTROL_CLK_DIV_BIOZ_GAP_WIDTH_OFFSET) & ((1<<CONTROL_CLK_DIV_BIOZ_GAP_WIDTH_NBITS)-1));
	plp_analog_control_bioz_sar_trigger_delay_set((value >> CONTROL_CLK_DIV_BIOZ_TRACK_DELAY_OFFSET) & ((1<<CONTROL_CLK_DIV_BIOZ_TRACK_DELAY_NBITS)-1));
	plp_analog_control_bioz_sar_track2sample_delay_set((value >> CONTROL_CLK_DIV_BIOZ_CONV_MODE_OFFSET) & ((1<<CONTROL_CLK_DIV_BIOZ_CONV_MODE_NBITS)-1));
}

/*
 * CONTORL_CLK_GEN_IP: Clock Generator
 */

// Write HW register functions
static inline void plp_analog_control_clk_gen_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_CLK_GEN_IP, CONTROL_CLK_GEN_REG_0, value);
}

/*
 * CONTORL_PMU_IP: PMU
 */

// Write HW register functions
static inline void plp_analog_control_exg_d1v2_ldo_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_PMU_IP, CONTROL_PMU_D1V2_EXG, value);
}

static inline void plp_analog_control_exg_a1v2_ldo_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_PMU_IP, CONTROL_PMU_A1V2_EXG, value);
}

static inline void plp_analog_control_exg_a3v0_ldo_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_PMU_IP, CONTROL_PMU_A3V0_EXG, value);
}

static inline void plp_analog_control_bioz_a1v2_ldo_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_PMU_IP, CONTROL_PMU_A1V2_BIOZ, value);
}

static inline void plp_analog_control_ppg_a1v2_ldo_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_PMU_IP, CONTROL_PMU_A1V2_PPG, value);
}

static inline void plp_analog_control_ppg_a3v0_ldo_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_PMU_IP, CONTROL_PMU_A3V0_PPG, value);
}

static inline void plp_analog_control_stim_a1v2_ldo_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_PMU_IP, CONTROL_PMU_A1V2_STIM, value);
}

static inline void plp_analog_control_stim_a3v0_ldo_enable_set(unsigned int value) {
	plp_analog_ip_write(CONTORL_PMU_IP, CONTROL_PMU_A3V0_STIM, value);
}

// Write SW register functions
static inline void plp_analog_control_pmu_set(unsigned int value) {
//	plp_analog_control_exg_d1v2_ldo_enable_set((value >> CONTROL_PMU_D1V2_EXG_OFFSET) & ((1<<CONTROL_PMU_D1V2_EXG_NBITS)-1)); // always 1!!!
	plp_analog_control_exg_a1v2_ldo_enable_set((value >> CONTROL_PMU_A1V2_EXG_OFFSET) & ((1<<CONTROL_PMU_A1V2_EXG_NBITS)-1));
	plp_analog_control_exg_a3v0_ldo_enable_set((value >> CONTROL_PMU_A3V0_EXG_OFFSET) & ((1<<CONTROL_PMU_A3V0_EXG_NBITS)-1));
	plp_analog_control_bioz_a1v2_ldo_enable_set((value >> CONTROL_PMU_A1V2_BIOZ_OFFSET) & ((1<<CONTROL_PMU_A1V2_BIOZ_NBITS)-1));
	plp_analog_control_ppg_a1v2_ldo_enable_set((value >> CONTROL_PMU_A1V2_PPG_OFFSET) & ((1<<CONTROL_PMU_A1V2_PPG_NBITS)-1));
	plp_analog_control_ppg_a3v0_ldo_enable_set((value >> CONTROL_PMU_A3V0_PPG_OFFSET) & ((1<<CONTROL_PMU_A3V0_PPG_NBITS)-1));
	plp_analog_control_stim_a1v2_ldo_enable_set((value >> CONTROL_PMU_A1V2_STIM_OFFSET) & ((1<<CONTROL_PMU_A1V2_STIM_NBITS)-1));
	plp_analog_control_stim_a3v0_ldo_enable_set((value >> CONTROL_PMU_A3V0_STIM_OFFSET) & ((1<<CONTROL_PMU_A3V0_STIM_NBITS)-1));
}

#endif
