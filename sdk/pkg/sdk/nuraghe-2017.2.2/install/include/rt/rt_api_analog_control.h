/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */
void analog_ctrl_clkdiv_init(unsigned char board_clk);

void analog_ctrl_master_clk_enable(void);
void analog_ctrl_master_clk_disable(void);
void analog_ctrl_bg_clk_enable(void);
void analog_ctrl_bg_clk_disable(void);
void analog_ctrl_exg_clk_enable(void);
void analog_ctrl_exg_clk_disable(void);
void analog_ctrl_exg_eim_clk_enable(void);
void analog_ctrl_exg_eim_clk_disable(void);
void analog_ctrl_ppg_clk_enable(void);
void analog_ctrl_ppg_clk_disable(void);
void analog_ctrl_stim_clk_enable(void);
void analog_ctrl_stim_clk_disable(void);
void analog_ctrl_temp_clk_enable(void);
void analog_ctrl_temp_clk_disable(void);
void analog_ctrl_bioz_clk_enable(void);
void analog_ctrl_bioz_clk_disable(void);

void analog_ctrl_pmu_bg_enable(void);
void analog_ctrl_pmu_bg_disable(void);
void analog_ctrl_pmu_bioz_enable(void);
void analog_ctrl_pmu_bioz_disable(void);
void analog_ctrl_pmu_ppg_enable(void);
void analog_ctrl_pmu_ppg_disable(void);
void analog_ctrl_pmu_stim_enable(void);
void analog_ctrl_pmu_stim_disable(void);

void analog_ctrl_ppg_init(unsigned char board_clk);
void analog_ctrl_ppg_enable(void);
void analog_ctrl_ppg_disable(void);


