/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#define ANALOG_PPG_RF_9_4KOHM			0
#define ANALOG_PPG_RF_18_8KOHM			1
#define ANALOG_PPG_RF_37_6KOHM			2
#define ANALOG_PPG_RF_47KOHM			3
#define ANALOG_PPG_RF_75KOHM			4
#define ANALOG_PPG_RF_150KOHM			5
#define ANALOG_PPG_RF_225KOHM			6
#define ANALOG_PPG_RF_300KOHM			7
#define ANALOG_PPG_RF_375KOHM			8
#define ANALOG_PPG_RF_450KOHM			9
#define ANALOG_PPG_RF_600KOHM			10
#define ANALOG_PPG_RF_750KOHM			11
#define ANALOG_PPG_RF_900KOHM			12
#define ANALOG_PPG_RF_1_2MOHM			13
#define ANALOG_PPG_RF_1_575MOHM			14
#define ANALOG_PPG_RF_2_025MOHM			15
#define ANALOG_PPG_RF_2_4MOHM			16
#define ANALOG_PPG_RF_2_85MOHM			17
#define ANALOG_PPG_RF_3_6MOHM			18
#define ANALOG_PPG_RF_4_65MOHM			19		

#define ANALOG_PPG_DIRECT_SAMPLING_NO_DCS 	0
#define ANALOG_PPG_DIRECT_SAMPLING_DCS 		1
#define ANALOG_PPG_CDS_ANALOG				2
#define ANALOG_PPG_CDS_DIGITAL				3
#define ANALOG_PPG_EDR 						4

typedef struct {
	unsigned char ch_in:4;
	unsigned char ch_out:4;
	unsigned char sampling_mode:3;
	unsigned char single_ch:1;
} analog_ppg_sequence_config_t;

typedef struct {
	unsigned char inverse_ch:4;
	unsigned char anode_sel_ch:4;
	unsigned char dac_code_ir;
	unsigned char dac_code_vs;
} analog_ppg_sequence_config_optional_t;

void analog_ppg_init(unsigned char board_clk, _Bool binary_board_clk);
void analog_ppg_enable(void);
void analog_ppg_disable(void);
void analog_ppg_get_samples_init(unsigned char sequence, unsigned int* vs, unsigned int* ir, unsigned int* dk, unsigned short buffer_length);
void analog_ppg_get_samples_deinit(unsigned char sequence);
void analog_ppg_get_samples_start(unsigned int n_samples, plp_task_t task);
void analog_ppg_sequence_rtia_init(unsigned short r_f, unsigned short f_s);
void analog_ppg_sequence_rtia_set(unsigned char sequence, analog_ppg_sequence_config_t seq_cnfg);
void analog_ppg_sequence_optional_set(unsigned char sequence, analog_ppg_sequence_config_optional_t seq_cnfg);
void analog_ppg_sequence_dac_code_mod(unsigned char sequence, unsigned short dac_code_vs, unsigned short dac_code_ir, unsigned char flag);
void analog_ppg_sequence_reset(unsigned char sequence);
unsigned int analog_ppg_fs_get(void);
void analog_ppg_fs_mod(unsigned int fs);
void analog_ppg_dac_current_cnfg_mod(unsigned char setting);