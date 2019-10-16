onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/clk}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/rst_n}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/tcdm_req_o}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/tcdm_gnt_i}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/tcdm_add_o}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/tcdm_type_o}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/tcdm_be_o}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/tcdm_data_o}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/tcdm_r_data_i}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/tcdm_r_valid_i}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/TVALID_i}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/TREADY_o}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/TDATA_i}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/TSTRB_i}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/TKEEP_i}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/TLAST_i}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/TID_i}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/TDEST_i}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/TUSER_i}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/stream_config_i}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/req_start_sink_i}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/ready_start_sink_o}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/done_sink_o}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/cs}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/ns}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/tcdm_req_int}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/tcdm_add_int}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/tcdm_type_int}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/tcdm_be_int}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/tcdm_data_int}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/gen_addr}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/in_progress}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/FIFO_GNT_push}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/address_gen_en}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/done_sink_int}
add wave -noupdate -group sink -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/address_gen_inc}
add wave -noupdate -group sink -height 21 -radix unsigned {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/u_addressgen/overall_counter}
add wave -noupdate -group sink -height 21 -radix unsigned {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/u_addressgen/word_counter}
add wave -noupdate -group sink -height 21 -radix unsigned {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/u_addressgen/line_counter}
add wave -noupdate -group sink -height 21 -radix unsigned {/testbench/hwce_top_gen[0]/DUT/u_wrapper/sink_gen[0]/u_sink/u_addressgen/feat_counter}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/clk}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/rst_n}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/tcdm_req_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/tcdm_gnt_i}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/tcdm_add_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/tcdm_type_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/tcdm_be_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/tcdm_data_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/tcdm_r_data_i}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/tcdm_r_valid_i}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TVALID_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TREADY_i}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TDATA_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TSTRB_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TKEEP_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TLAST_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TID_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TDEST_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TUSER_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/stream_config_i}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/cfg_TID_i}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/cfg_TDEST_i}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/cfg_TUSER_i}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/req_start_source_i}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/ready_start_source_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/done_source_o}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/cs}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/ns}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/FIFO_GNT_out}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/done_source_int}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/address_gen_en}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TSTRB_int}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TKEEP_int}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TLAST_int}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TID_int}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TDEST_int}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TUSER_int}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TSTRB_queue}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TKEEP_queue}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TLAST_queue}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TID_queue}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TDEST_queue}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TUSER_queue}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TID_s}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TDEST_s}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/TUSER_s}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/gen_addr}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/in_progress}
add wave -noupdate -group {source 0} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/address_gen_inc}
add wave -noupdate -group {source 0} -height 21 -radix unsigned {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_addressgen/overall_counter}
add wave -noupdate -group {source 0} -height 21 -radix unsigned {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_addressgen/word_counter}
add wave -noupdate -group {source 0} -height 21 -radix unsigned {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_addressgen/line_counter}
add wave -noupdate -group {source 0} -height 21 -radix unsigned {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_addressgen/feat_counter}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/clk}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/rst_n}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/tcdm_req_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/tcdm_gnt_i}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/tcdm_add_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/tcdm_type_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/tcdm_be_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/tcdm_data_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/tcdm_r_data_i}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/tcdm_r_valid_i}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TVALID_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TREADY_i}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TDATA_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TSTRB_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TKEEP_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TLAST_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TID_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TDEST_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TUSER_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/stream_config_i}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/cfg_TID_i}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/cfg_TDEST_i}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/cfg_TUSER_i}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/req_start_source_i}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/ready_start_source_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/done_source_o}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/cs}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/ns}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/FIFO_GNT_out}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/done_source_int}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/address_gen_en}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TSTRB_int}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TKEEP_int}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TLAST_int}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TID_int}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TDEST_int}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TUSER_int}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TSTRB_queue}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TKEEP_queue}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TLAST_queue}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TID_queue}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TDEST_queue}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TUSER_queue}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TID_s}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TDEST_s}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/TUSER_s}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/gen_addr}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/in_progress}
add wave -noupdate -group {source 1} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/address_gen_inc}
add wave -noupdate -group {source 1} -height 21 -radix unsigned {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_addressgen/overall_counter}
add wave -noupdate -group {source 1} -height 21 -radix unsigned {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_addressgen/word_counter}
add wave -noupdate -group {source 1} -height 21 -radix unsigned {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_addressgen/line_counter}
add wave -noupdate -group {source 1} -height 21 -radix unsigned {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_addressgen/feat_counter}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/clk}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/rst_n}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_req_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_gnt_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_add_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_type_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_be_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_data_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal -childformat {{{/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_r_data_i[2]} -radix hexadecimal} {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_r_data_i[1]} -radix hexadecimal} {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_r_data_i[0]} -radix hexadecimal}} -subitemconfig {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_r_data_i[2]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_r_data_i[1]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_r_data_i[0]} {-height 21 -radix hexadecimal}} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_r_data_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/tcdm_r_valid_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/cfg_req_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/cfg_gnt_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/cfg_add_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/cfg_type_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/cfg_be_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/cfg_data_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/cfg_ID_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/cfg_r_valid_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/cfg_r_data_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/cfg_r_ID_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/evt_interrupt_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_sink_TVALID_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_sink_TREADY_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_sink_TDATA_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_sink_TSTRB_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_sink_TKEEP_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_sink_TLAST_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_sink_TID_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_sink_TDEST_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_sink_TUSER_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_source_TVALID_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_source_TREADY_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_source_TDATA_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_source_TSTRB_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_source_TKEEP_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_source_TLAST_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_source_TID_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_source_TDEST_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_source_TUSER_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_clear_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_done_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_en_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_cs_n_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal -childformat {{{/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_wait_n_o[1]} -radix hexadecimal} {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_wait_n_o[0]} -radix hexadecimal}} -expand -subitemconfig {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_wait_n_o[1]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_wait_n_o[0]} {-height 21 -radix hexadecimal}} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_wait_n_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal -childformat {{{/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_type_i[1]} -radix hexadecimal} {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_type_i[0]} -radix hexadecimal}} -subitemconfig {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_type_i[1]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_type_i[0]} {-height 21 -radix hexadecimal}} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_type_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal -childformat {{{/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_addr_i[1]} -radix hexadecimal} {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_addr_i[0]} -radix hexadecimal}} -expand -subitemconfig {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_addr_i[1]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_addr_i[0]} {-height 21 -radix hexadecimal}} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_addr_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_be_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_wdata_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal -childformat {{{/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_rdata_o[1]} -radix hexadecimal} {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_rdata_o[0]} -radix hexadecimal}} -expand -subitemconfig {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_rdata_o[1]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_rdata_o[0]} {-height 21 -radix hexadecimal}} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/catc_rdata_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/all_req_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/all_gnt_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/all_add_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/all_type_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/all_be_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/all_data_o}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/all_r_data_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/all_r_valid_i}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/reg_file}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/reg_file_catc}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/is_working}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/enable}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/done_ctrl}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/req_start}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/cfg_TID}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/cfg_TDEST}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/cfg_TUSER}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/done_weightload}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/done_stream_r}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/hwce_state}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/started}
add wave -noupdate -group wrapper -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/ex_all_req}
add wave -noupdate -group wrapper -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/axi_done_preload_i}
add wave -noupdate -group wrapper -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/ready_start}
add wave -noupdate -group wrapper -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/done_stream}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/clk}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/rst_n}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/data_req_i}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/data_add_i}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/data_type_i}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/data_wdata_i}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/data_ID_i}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/data_r_rdata_o}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/done}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/start_cs}
add wave -noupdate -group slave -height 21 -radix hexadecimal -childformat {{{/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params} -radix hexadecimal -childformat {{{[47]} -radix hexadecimal} {{[46]} -radix hexadecimal} {{[45]} -radix hexadecimal} {{[44]} -radix hexadecimal} {{[43]} -radix hexadecimal} {{[42]} -radix hexadecimal} {{[41]} -radix hexadecimal} {{[40]} -radix hexadecimal} {{[39]} -radix hexadecimal} {{[38]} -radix hexadecimal} {{[37]} -radix hexadecimal} {{[36]} -radix hexadecimal} {{[35]} -radix hexadecimal} {{[34]} -radix hexadecimal} {{[33]} -radix hexadecimal} {{[32]} -radix hexadecimal} {{[31]} -radix hexadecimal} {{[30]} -radix hexadecimal} {{[29]} -radix hexadecimal} {{[28]} -radix hexadecimal} {{[27]} -radix hexadecimal} {{[26]} -radix hexadecimal} {{[25]} -radix hexadecimal} {{[24]} -radix hexadecimal} {{[23]} -radix hexadecimal} {{[22]} -radix hexadecimal} {{[21]} -radix hexadecimal} {{[20]} -radix hexadecimal} {{[19]} -radix hexadecimal} {{[18]} -radix hexadecimal} {{[17]} -radix hexadecimal} {{[16]} -radix hexadecimal} {{[15]} -radix hexadecimal} {{[14]} -radix hexadecimal} {{[13]} -radix hexadecimal} {{[12]} -radix hexadecimal} {{[11]} -radix hexadecimal} {{[10]} -radix hexadecimal} {{[9]} -radix hexadecimal} {{[8]} -radix hexadecimal} {{[7]} -radix hexadecimal} {{[6]} -radix hexadecimal} {{[5]} -radix hexadecimal} {{[4]} -radix hexadecimal} {{[3]} -radix hexadecimal} {{[2]} -radix hexadecimal} {{[1]} -radix hexadecimal} {{[0]} -radix hexadecimal}}} {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.generic_params} -radix hexadecimal -childformat {{{[7]} -radix hexadecimal} {{[6]} -radix hexadecimal} {{[5]} -radix hexadecimal} {{[4]} -radix hexadecimal} {{[3]} -radix hexadecimal} {{[2]} -radix hexadecimal} {{[1]} -radix hexadecimal} {{[0]} -radix hexadecimal}}}} -subitemconfig {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params} {-height 21 -radix hexadecimal -childformat {{{[47]} -radix hexadecimal} {{[46]} -radix hexadecimal} {{[45]} -radix hexadecimal} {{[44]} -radix hexadecimal} {{[43]} -radix hexadecimal} {{[42]} -radix hexadecimal} {{[41]} -radix hexadecimal} {{[40]} -radix hexadecimal} {{[39]} -radix hexadecimal} {{[38]} -radix hexadecimal} {{[37]} -radix hexadecimal} {{[36]} -radix hexadecimal} {{[35]} -radix hexadecimal} {{[34]} -radix hexadecimal} {{[33]} -radix hexadecimal} {{[32]} -radix hexadecimal} {{[31]} -radix hexadecimal} {{[30]} -radix hexadecimal} {{[29]} -radix hexadecimal} {{[28]} -radix hexadecimal} {{[27]} -radix hexadecimal} {{[26]} -radix hexadecimal} {{[25]} -radix hexadecimal} {{[24]} -radix hexadecimal} {{[23]} -radix hexadecimal} {{[22]} -radix hexadecimal} {{[21]} -radix hexadecimal} {{[20]} -radix hexadecimal} {{[19]} -radix hexadecimal} {{[18]} -radix hexadecimal} {{[17]} -radix hexadecimal} {{[16]} -radix hexadecimal} {{[15]} -radix hexadecimal} {{[14]} -radix hexadecimal} {{[13]} -radix hexadecimal} {{[12]} -radix hexadecimal} {{[11]} -radix hexadecimal} {{[10]} -radix hexadecimal} {{[9]} -radix hexadecimal} {{[8]} -radix hexadecimal} {{[7]} -radix hexadecimal} {{[6]} -radix hexadecimal} {{[5]} -radix hexadecimal} {{[4]} -radix hexadecimal} {{[3]} -radix hexadecimal} {{[2]} -radix hexadecimal} {{[1]} -radix hexadecimal} {{[0]} -radix hexadecimal}}} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[47]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[46]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[45]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[44]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[43]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[42]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[41]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[40]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[39]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[38]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[37]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[36]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[35]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[34]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[33]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[32]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[31]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[30]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[29]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[28]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[27]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[26]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[25]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[24]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[23]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[22]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[21]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[20]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[19]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[18]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[17]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[16]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[15]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[14]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[13]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[12]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[11]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[10]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[9]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[8]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[7]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[6]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[5]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[4]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[3]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[2]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[1]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.hwpe_params[0]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.generic_params} {-height 21 -radix hexadecimal -childformat {{{[7]} -radix hexadecimal} {{[6]} -radix hexadecimal} {{[5]} -radix hexadecimal} {{[4]} -radix hexadecimal} {{[3]} -radix hexadecimal} {{[2]} -radix hexadecimal} {{[1]} -radix hexadecimal} {{[0]} -radix hexadecimal}}} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.generic_params[7]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.generic_params[6]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.generic_params[5]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.generic_params[4]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.generic_params[3]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.generic_params[2]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.generic_params[1]} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file.generic_params[0]} {-height 21 -radix hexadecimal}} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/reg_file}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/evt_interrupt_o}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/is_working}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/enable}
add wave -noupdate -group slave -height 21 -radix hexadecimal -childformat {{{/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/regfile_in.addr} -radix hexadecimal} {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/regfile_in.rden} -radix hexadecimal} {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/regfile_in.wren} -radix hexadecimal} {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/regfile_in.wdata} -radix hexadecimal} {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/regfile_in.src} -radix hexadecimal}} -subitemconfig {{/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/regfile_in.addr} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/regfile_in.rden} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/regfile_in.wren} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/regfile_in.wdata} {-height 21 -radix hexadecimal} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/regfile_in.src} {-height 21 -radix hexadecimal}} {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/regfile_in}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/regfile_out}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/running_state}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/context_state}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/flags}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/pointer_context}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/running_context}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/counter_pending}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/ex_rst_n}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/exx_rst_n}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/exxx_rst_n}
add wave -noupdate -group slave -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/start_context}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/clk}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/rst_n}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/regfile_in}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/flags}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/pointer_context}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/running_context}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/regfile_out}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/reg_file}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/regfile_mem}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/regfile_mem_mandatory}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/regfile_mem_generic}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/regfile_mem_dout}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/wren_cxt}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/wren_reg}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/ptr_cxt_decoded}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/data_add_decoded}
add wave -noupdate -group regfile -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_slave/u_regfile/data_src_encoded}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/clk}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/rst_n}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/tcdm_req_o}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/tcdm_gnt_i}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/tcdm_add_o}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/tcdm_type_o}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/tcdm_be_o}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/tcdm_data_o}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/tcdm_r_data_i}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/tcdm_r_valid_i}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/catc_en_o}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/catc_done_i}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/catc_cs_n_i}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/catc_wait_n_o}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/catc_type_i}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/catc_addr_i}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/catc_be_i}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/catc_wdata_i}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/catc_rdata_o}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/reg_file}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/is_working}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/done_ctrl}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/trans_add}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/catc_req_int}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/catc_req_reg}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/catc_req_mux}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/tcdm_req_int}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/tcdm_ok}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/tcdm_ok_state}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/tcdm_nognt}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/tcdm_gnt_interleaved}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/en_count}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/almost_done}
add wave -noupdate -group controller -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/u_controller/ready_to_done}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/clk}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/rst_n}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/data_in}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/valid_in}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/grant_out}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/data_out}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/valid_out}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/grant_in}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/cs}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/ns}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/Pop_Pointer_CS}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/Pop_Pointer_NS}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/Push_Pointer_CS}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/Push_Pointer_NS}
add wave -noupdate -group {source 0 fifo} -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[0]/u_source/u_source_fifo/i}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/clk}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/rst_n}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/data_in}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/valid_in}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/grant_out}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/data_out}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/valid_out}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/grant_in}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/cs}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/ns}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/Pop_Pointer_CS}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/Pop_Pointer_NS}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/Push_Pointer_CS}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/Push_Pointer_NS}
add wave -noupdate -group {source 1 fifo} -height 21 {/testbench/hwce_top_gen[0]/DUT/u_wrapper/source_gen[1]/u_source/u_source_fifo/i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/clk}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/rst_n}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/weight}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/clear}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/done_preload}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/engine_params}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_out_TVALID_o}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_out_TREADY_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_out_TDATA_o}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_out_TSTRB_o}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_out_TKEEP_o}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_out_TLAST_o}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_out_TID_o}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_out_TDEST_o}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_out_TUSER_o}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/x_in_TVALID_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/x_in_TREADY_o}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/x_in_TDATA_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/x_in_TSTRB_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/x_in_TKEEP_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/x_in_TLAST_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/x_in_TID_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/x_in_TDEST_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/x_in_TUSER_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_in_TVALID_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_in_TREADY_o}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_in_TDATA_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_in_TSTRB_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_in_TKEEP_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_in_TLAST_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_in_TID_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_in_TDEST_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_in_TUSER_i}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/enable}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/fsm_state}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/exception}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/weight_int}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/x_in}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_in}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_out}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/x_in_int}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_out_int}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/y_in_int}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/x_filter}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/x_filter_pipe}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/lb_valid_in}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/lb_ready_in}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/lb_valid_out}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/lb_ready_out}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/add_valid_x_in}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/add_ready_x_in}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/add_valid_y_in}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/add_ready_y_in}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/add_valid_out}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/add_ready_out}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/ex_fsm_state}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/add_valid_out_int}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/perf_preload}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/perf_run}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/perf_feat}
add wave -noupdate -group engine -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/perf_tot}
add wave -noupdate -group engine -height 21 {/testbench/hwce_top_gen[0]/DUT/u_engine/x_in_flags}
add wave -noupdate -group engine -height 21 {/testbench/hwce_top_gen[0]/DUT/u_engine/y_in_flags}
add wave -noupdate -group engine -height 21 {/testbench/hwce_top_gen[0]/DUT/u_engine/y_out_flags}
add wave -noupdate -group engine -height 21 {/testbench/hwce_top_gen[0]/DUT/u_engine/lb_flags_in}
add wave -noupdate -group engine -height 21 {/testbench/hwce_top_gen[0]/DUT/u_engine/lb_flags_out}
add wave -noupdate -group engine -height 21 {/testbench/hwce_top_gen[0]/DUT/u_engine/add_flags_x_in}
add wave -noupdate -group engine -height 21 {/testbench/hwce_top_gen[0]/DUT/u_engine/add_flags_y_in}
add wave -noupdate -group engine -height 21 {/testbench/hwce_top_gen[0]/DUT/u_engine/add_flags_out}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/clk}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/rst_n}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/clear}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/linebuf_length}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/nfeat}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/linear_conv}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/stream_config}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/stream_flags}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/x_in_TVALID_i}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/x_in_TREADY_o}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/y_in_TVALID_i}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/y_in_TREADY_o}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/y_out_TVALID_o}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/y_out_TREADY_i}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/fsm_state_o}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/exception}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/x_in_config}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/y_in_config}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/y_out_config}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/x_in_flags}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/y_in_flags}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/y_out_flags}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/line_buffer_counter}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/line_buffer_almost_ready}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/y_out_counter}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/startline_almost_ready}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/y_in_counter}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/endline_almost_ready}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/linebuf_length_int}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/insert_pixel}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/drop_pixel}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/fsm_state}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/start_preload}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/y_in_counter_en}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/y_out_counter_en}
add wave -noupdate -group engine_fsm -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_fsm/is_single_feat}
add wave -noupdate /testbench/clk_assert
add wave -noupdate /testbench/out_count
add wave -noupdate /testbench/check_gen/y_out_data_inv
add wave -noupdate /testbench/check_gen/y_out_data
add wave -noupdate /testbench/check_gen/y_out_real
add wave -noupdate /testbench/check_gen/y_out_valid
add wave -noupdate /testbench/check_gen/count
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/clk}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/rst_n}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/enable}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/valid_in}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/flags_in}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/ready_in}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/flags_out}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/clear}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/qf}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/valid_out}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/ready_out}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/x_filter}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/weight}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/approx}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/mul_out}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/multiply_raw}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/multiply}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/clear_pipe}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/valid_pipe}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/flags_pipe}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/multiply_pipe}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/mux_state}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/mux_counter}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/mux_revcnt}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/mux_counter_clr}
add wave -noupdate -group muls -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_muls/mux_counter_en}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/clk}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/rst_n}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/enable}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/valid_in}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/flags_in}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/ready_in}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/valid_out}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/flags_out}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/ready_out}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fsm_state}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/bypass}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linear_conv}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/x_in}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/x_filter}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/ex_valid_ready}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_end}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/x_filter_int}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/x_filter_flat}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/x_filter_flat_linear}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/x_filter_flattest}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/x_filter_sample}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/x_filter_prefifo}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_rptr}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_wptr}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_endptr}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_wptr_dec}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_latch_re_a}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_latch_raddr_a}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_latch_rdata_a}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_latch_re_b}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_latch_raddr_b}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_latch_rdata_b}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_latch_we}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_latch_waddr}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_latch_wdata}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_latch_be}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_end_latch_re_a}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_end_latch_raddr_a}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_end_latch_rdata_a}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_end_latch_re_b}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_end_latch_raddr_b}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_end_latch_rdata_b}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_end_latch_we}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_end_latch_waddr}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_end_latch_wdata}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_end_latch_be}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_latch_rdata_b_ungroup}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fifo_latch_rdata_b_transpose}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_end_rptr}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_end_wptr}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_end_wptr_dec}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_in}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_end_in}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_rewiring}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_end_rewiring}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_rewiring_choice}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/linebuffer_rewiring_reorg}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/x_filter_rev}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/valid_out_prefifo}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/valid_at_ready}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/flags_out_prefifo}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/flags_at_ready}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/output_fifo_valid_in}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/to_remove}
add wave -noupdate -expand -group linebuffer -height 21 -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/fsm_state_valid}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/clk}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/rst_n}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/data_in}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/valid_in}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/grant_out}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/data_out}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/valid_out}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/grant_in}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/cs}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/ns}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/Pop_Pointer_CS}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/Pop_Pointer_NS}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/Push_Pointer_CS}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/Push_Pointer_NS}
add wave -noupdate -expand -group {linebuf output fifo} -radix hexadecimal {/testbench/hwce_top_gen[0]/DUT/u_engine/u_linebuffer/u_output_fifo/i}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {9355 ps} 1} {{Cursor 3} {6839064 ps} 0}
configure wave -namecolwidth 414
configure wave -valuecolwidth 180
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 8
configure wave -childrowmargin 6
configure wave -gridoffset 0
configure wave -gridperiod 10
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {5005445 ps} {5135150 ps}
