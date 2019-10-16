onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider ULPSOC
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/ref_clk_i
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/rst_ni
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/test_clk_i
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/clk_o
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/test_mode_o
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/mode_select_i
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/fetch_en_i
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/eoc_o
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/tck_i
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/trst_ni
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/tms_i
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/td_i
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/td_o
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/gpio_in
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/gpio_out
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/gpio_dir
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/gpio_mux
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/uart_tx
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/uart_rx
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_clk
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_csn0
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_csn1
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_csn2
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_csn3
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_mode
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_sdo0
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_sdo1
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_sdo2
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_sdo3
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_sdi0
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_sdi1
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_sdi2
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_master_sdi3
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_slave_clk
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_slave_cs
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_slave_mode
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_slave_sdo0
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_slave_sdo1
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_slave_sdo2
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_slave_sdo3
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_slave_sdi0
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_slave_sdi1
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_slave_sdi2
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/spi_slave_sdi3
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/si
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/se
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/so
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_pwr_req
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_pwr_wr_rd
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_pwr_add
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_pwr_be
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_pwr_w_data
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_pwr_ack
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_pwr_error
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_soc_pwr_r_data
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_pwr_req
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_pwr_wr_rd
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_pwr_add
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_pwr_be
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_pwr_w_data
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_pwr_ack
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_pwr_error
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/cvp_cluster_pwr_r_data
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/wm_tcdm
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/rm_tcdm
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/wm_l2_mem
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/rm_l2_mem
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/s_clk_soc_fll
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/s_clk_cluster_fll
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/s_clk_soc_int
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/s_clk_cluster_int
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/s_clk_soc
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/s_clk_cluster
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/s_rstn_sync
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/s_initn_sync
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/s_test_mode
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/s_fll_bypass
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/s_bypass_mux
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/clk_div0
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/clk_div0_valid
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/clk_div1
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/clk_div1_valid
add wave -noupdate -group ULPSOC /tb/ulpsoc_wrap_i/ulpsoc_i/s_soc_events
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/aw_addr
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/aw_prot
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/aw_region
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/aw_len
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/aw_size
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/aw_burst
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/aw_lock
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/aw_cache
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/aw_qos
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/aw_id
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/aw_user
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/aw_ready
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/aw_valid
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/ar_addr
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/ar_prot
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/ar_region
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/ar_len
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/ar_size
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/ar_burst
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/ar_lock
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/ar_cache
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/ar_qos
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/ar_id
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/ar_user
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/ar_ready
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/ar_valid
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/w_valid
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/w_data
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/w_strb
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/w_user
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/w_last
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/w_ready
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/r_data
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/r_resp
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/r_last
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/r_id
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/r_user
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/r_ready
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/r_valid
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/b_resp
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/b_id
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/b_user
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/b_ready
add wave -noupdate -group STDOUT_MASTER /tb/ulpsoc_wrap_i/ulpsoc_i/stdout_master/b_valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5420420050 ps} 0} {{Cursor 2} {776154900 ps} 0}
configure wave -namecolwidth 564
configure wave -valuecolwidth 120
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
WaveRestoreZoom {29249548514 ps} {29249572798 ps}
