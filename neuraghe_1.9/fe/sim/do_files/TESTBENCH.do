onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TESTBENCH
add wave -noupdate -group TESTBENCH /tb/s_clk
add wave -noupdate -group TESTBENCH /tb/s_clk_ref
add wave -noupdate -group TESTBENCH /tb/s_rst_n
add wave -noupdate -group TESTBENCH /tb/s_fetch_en
add wave -noupdate -group TESTBENCH /tb/s_eoc
add wave -noupdate -group TESTBENCH /tb/s_master_aw_id
add wave -noupdate -group TESTBENCH /tb/s_master_aw_addr
add wave -noupdate -group TESTBENCH /tb/s_master_aw_len
add wave -noupdate -group TESTBENCH /tb/s_master_aw_size
add wave -noupdate -group TESTBENCH /tb/s_master_aw_burst
add wave -noupdate -group TESTBENCH /tb/s_master_aw_lock
add wave -noupdate -group TESTBENCH /tb/s_master_aw_cache
add wave -noupdate -group TESTBENCH /tb/s_master_aw_prot
add wave -noupdate -group TESTBENCH /tb/s_master_aw_region
add wave -noupdate -group TESTBENCH /tb/s_master_aw_user
add wave -noupdate -group TESTBENCH /tb/s_master_aw_qos
add wave -noupdate -group TESTBENCH /tb/s_master_aw_valid
add wave -noupdate -group TESTBENCH /tb/s_master_aw_ready
add wave -noupdate -group TESTBENCH /tb/s_master_ar_id
add wave -noupdate -group TESTBENCH /tb/s_master_ar_addr
add wave -noupdate -group TESTBENCH /tb/s_master_ar_len
add wave -noupdate -group TESTBENCH /tb/s_master_ar_size
add wave -noupdate -group TESTBENCH /tb/s_master_ar_burst
add wave -noupdate -group TESTBENCH /tb/s_master_ar_lock
add wave -noupdate -group TESTBENCH /tb/s_master_ar_cache
add wave -noupdate -group TESTBENCH /tb/s_master_ar_prot
add wave -noupdate -group TESTBENCH /tb/s_master_ar_region
add wave -noupdate -group TESTBENCH /tb/s_master_ar_user
add wave -noupdate -group TESTBENCH /tb/s_master_ar_qos
add wave -noupdate -group TESTBENCH /tb/s_master_ar_valid
add wave -noupdate -group TESTBENCH /tb/s_master_ar_ready
add wave -noupdate -group TESTBENCH /tb/s_master_w_data
add wave -noupdate -group TESTBENCH /tb/s_master_w_strb
add wave -noupdate -group TESTBENCH /tb/s_master_w_last
add wave -noupdate -group TESTBENCH /tb/s_master_w_user
add wave -noupdate -group TESTBENCH /tb/s_master_w_valid
add wave -noupdate -group TESTBENCH /tb/s_master_w_ready
add wave -noupdate -group TESTBENCH /tb/s_master_b_id
add wave -noupdate -group TESTBENCH /tb/s_master_b_resp
add wave -noupdate -group TESTBENCH /tb/s_master_b_valid
add wave -noupdate -group TESTBENCH /tb/s_master_b_user
add wave -noupdate -group TESTBENCH /tb/s_master_b_ready
add wave -noupdate -group TESTBENCH /tb/s_master_r_id
add wave -noupdate -group TESTBENCH /tb/s_master_r_data
add wave -noupdate -group TESTBENCH /tb/s_master_r_resp
add wave -noupdate -group TESTBENCH /tb/s_master_r_last
add wave -noupdate -group TESTBENCH /tb/s_master_r_user
add wave -noupdate -group TESTBENCH /tb/s_master_r_valid
add wave -noupdate -group TESTBENCH /tb/s_master_r_ready
add wave -noupdate -group TESTBENCH /tb/s_dbg_wen
add wave -noupdate -group TESTBENCH /tb/s_dbg_csn
add wave -noupdate -group TESTBENCH /tb/s_dbg_req
add wave -noupdate -group TESTBENCH /tb/s_dbg_add
add wave -noupdate -group TESTBENCH /tb/s_dbg_wdata
add wave -noupdate -group TESTBENCH /tb/s_dbg_req_sync
add wave -noupdate -group TESTBENCH /tb/s_dbg_add_sync
add wave -noupdate -group TESTBENCH /tb/s_dbg_data_sync
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5420320515 ps} 0} {{Cursor 2} {0 ps} 0}
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
WaveRestoreZoom {0 ps} {12731809792 ps}
