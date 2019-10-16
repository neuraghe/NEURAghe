onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider CVP
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/rst_async_n
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/clk_cvp
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/clk_ref
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/clk_fll_0
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/power_on
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwr_req
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwr_w_data
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwr_addr
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwr_be
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwr_wr_rd
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwr_ack
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwr_r_data
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwr_error
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/core_rst_n
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/core_power_on
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/test_mode
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/test_se
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/test_si
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/test_so
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/rst_cvp_n
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/rst_ref_n
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/modules_data
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/modules_valid
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/modules_error
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/mod_clk_gen_0_data
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/mod_clk_gen_0_valid
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/mod_clk_gen_0_error
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/mod_clk_gen_0_req
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/mod_error_data
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/mod_error_valid
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/mod_error_error
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwr_req_sync_r
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwr_r_data_r
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwr_r_data_s
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwr_error_r
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwr_error_s
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/ready_to_answer_r
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/ready_to_answer_s
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwrif_current_state
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/pwrif_next_state
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/cmd_freq_0
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/cmd_safe_0
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/it_clk_gen_0_valid_clk
add wave -noupdate -group CVP_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_i/it_clk_gen_0_valid_xpct_clk
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/rst_async_n
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/clk_cvp
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/clk_ref
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/clk_fll_0
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/power_on
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwr_req
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwr_w_data
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwr_addr
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwr_be
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwr_wr_rd
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwr_ack
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwr_r_data
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwr_error
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/core_rst_n
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/core_power_on
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/test_mode
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/test_se
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/test_si
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/test_so
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/rst_cvp_n
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/rst_ref_n
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/modules_data
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/modules_valid
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/modules_error
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/mod_clk_gen_0_data
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/mod_clk_gen_0_valid
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/mod_clk_gen_0_error
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/mod_clk_gen_0_req
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/mod_error_data
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/mod_error_valid
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/mod_error_error
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwr_req_sync_r
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwr_r_data_r
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwr_r_data_s
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwr_error_r
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwr_error_s
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/ready_to_answer_r
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/ready_to_answer_s
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwrif_current_state
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/pwrif_next_state
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/cmd_freq_0
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/cmd_safe_0
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/it_clk_gen_0_valid_clk
add wave -noupdate -group CVP_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_i/it_clk_gen_0_valid_xpct_clk
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/clk
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/rstn
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/test_mode
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/clk_pi
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/rstn_pi
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/clk_div_pi
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/clk_div_valid_pi
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/clk_out
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/state
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/state_next
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/s_clk_out
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/s_clock_enable
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/s_clk_div_valid
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/reg_clk_div
add wave -noupdate -group CLKDIV_SOC /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_soc/s_clk_div_valid_sync
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/clk
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/rstn
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/test_mode
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/clk_pi
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/rstn_pi
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/clk_div_pi
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/clk_div_valid_pi
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/clk_out
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/state
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/state_next
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/s_clk_out
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/s_clock_enable
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/s_clk_div_valid
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/reg_clk_div
add wave -noupdate -group CLKDIV_CLUSTER /tb/ulpsoc_wrap_i/ulpsoc_i/i_clkdiv_cluster/s_clk_div_valid_sync
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {345299474 ps} 0} {{Cursor 2} {345366290 ps} 0}
configure wave -namecolwidth 606
configure wave -valuecolwidth 292
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {340209554 ps} {350389394 ps}
