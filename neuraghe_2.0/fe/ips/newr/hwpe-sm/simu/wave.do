onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider wrapper
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/clk}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/rst_n}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/tcdm_req_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/tcdm_gnt_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/tcdm_add_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/tcdm_type_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/tcdm_be_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/tcdm_data_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/tcdm_r_data_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/tcdm_r_valid_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/cfg_req_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/cfg_gnt_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/cfg_add_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/cfg_type_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/cfg_be_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/cfg_data_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/cfg_ID_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/cfg_r_valid_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/cfg_r_data_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/cfg_r_ID_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/evt_interrupt_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_clk_div}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_start_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_done_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_en_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_cs_n_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_wait_n_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_type_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_addr_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_be_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_wdata_i}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_rdata_o}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/reg_file}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/is_working}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/enable}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/done_ctrl}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/reg_file2}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_wait_n_int}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_rdata_int}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_cs_n_int}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_type_int}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_wdata_int}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_be_int}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_add_int}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_en_int}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_start_int}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/catc_done_int}
add wave -noupdate -radix hexadecimal {/testbench/hwpe_sm_wrapper_gen[0]/u_hwpe_sm_wrapper/tcdm_stall_i}
add wave -noupdate -divider {catc module}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/start}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/done}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/rm_rsc_wait_n}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/rm_rsc_cs_n}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/rm_rsc_data_in}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/rm_rsc_we}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/rm_rsc_addr}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/rm_rsc_data_out}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/clk}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/en}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/rst_n}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/rm_rsc_ram_w_handshake_data_out_int_core}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/rm_rsc_ram_w_handshake_addr_int_core}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/rm_rsc_ram_w_handshake_we_int_core_sct}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/rm_rsc_ram_w_handshake_data_in_int}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/rm_rsc_ram_w_handshake_cs_n_int_core_sct}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/rm_rsc_ram_w_handshake_wait_n_int}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/mgc_start_sync_mgc_bsync_vld_vd}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/mgc_done_sync_mgc_bsync_rdy_rd_core_sct}
add wave -noupdate -radix hexadecimal {/testbench/catc_gen[0]/if_1_gen/u_catc/nl_rm_rsc_ram_w_handshake_cs_n_int}
add wave -noupdate -divider {dummy memory}
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/clk
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/rst_n
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/add
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/be
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/req
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/din
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/gnt
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/opc
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/src_i
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/dout
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/err
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/valid
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/src_o
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/dump
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/log_file
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/gnt_s
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/count_s
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/mem_s
add wave -noupdate -radix hexadecimal /testbench/u_dummy_memory/ex_rst_n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2402 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {10500 ps}
