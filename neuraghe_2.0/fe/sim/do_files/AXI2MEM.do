onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider AXI2MEM
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/clk_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rst_ni
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_aw_valid_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_aw_addr_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_aw_prot_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_aw_region_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_aw_len_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_aw_size_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_aw_burst_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_aw_lock_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_aw_cache_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_aw_qos_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_aw_id_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_aw_user_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_aw_ready_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_ar_valid_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_ar_addr_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_ar_prot_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_ar_region_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_ar_len_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_ar_size_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_ar_burst_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_ar_lock_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_ar_cache_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_ar_qos_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_ar_id_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_ar_user_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_ar_ready_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_w_valid_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_w_data_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_w_strb_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_w_user_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_w_last_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_w_ready_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_r_valid_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_r_data_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_r_resp_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_r_last_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_r_id_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_r_user_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_r_ready_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_b_valid_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_b_resp_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_b_id_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_b_user_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/axi_slave_b_ready_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_master_req_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_master_add_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_master_type_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_master_be_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_master_data_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_master_gnt_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_master_r_valid_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_master_r_data_i
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/busy_o
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_aw_valid
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_aw_addr
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_aw_prot
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_aw_region
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_aw_len
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_aw_size
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_aw_burst
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_aw_lock
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_aw_cache
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_aw_qos
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_aw_id
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_aw_user
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_aw_ready
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_ar_valid
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_ar_addr
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_ar_prot
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_ar_region
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_ar_len
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_ar_size
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_ar_burst
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_ar_lock
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_ar_cache
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_ar_qos
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_ar_id
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_ar_user
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_ar_ready
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_w_valid
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_w_data
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_w_strb
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_w_user
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_w_last
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_w_ready
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_r_valid
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_r_data
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_r_resp
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_r_last
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_r_id
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_r_user
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_r_ready
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_b_valid
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_b_resp
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_b_id
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_b_user
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_b_ready
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_trans_wr_req
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_trans_rd_req
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_trans_wr_id
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_trans_rd_id
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_trans_wr_add
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_trans_rd_add
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_trans_wr_last
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_trans_rd_last
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_trans_wr_gnt
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_trans_rd_gnt
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_rd_data_push_req
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_rd_data_push_gnt
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_wr_data_pop_req
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_wr_data_pop_gnt
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_rd_data_push_dat
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_wr_data_pop_dat
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_rd_data_push_strb
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_wr_data_pop_strb
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_rd_data_push_id
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_rd_data_pop_id
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_wr_data_push_gnt
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_rd_data_pop_req
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_wr_data_push_req
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_rd_data_pop_gnt
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_rd_data_push_last
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_rd_data_pop_last
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_wr_data_push_dat
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_rd_data_pop_dat
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_wr_data_push_strb
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_rd_data_pop_strb
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_wr_trans_r_req
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_wr_trans_r_gnt
add wave -noupdate -group {AXI2MEM TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/s_wr_trans_r_id
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/clk_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/rst_ni
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_aw_valid_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_aw_addr_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_aw_prot_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_aw_region_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_aw_len_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_aw_size_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_aw_burst_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_aw_lock_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_aw_cache_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_aw_qos_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_aw_id_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_aw_user_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_aw_ready_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_w_valid_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_w_data_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_w_strb_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_w_user_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_w_last_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_w_ready_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_b_valid_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_b_resp_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_b_id_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_b_user_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/axi_slave_b_ready_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/trans_id_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/trans_add_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/trans_last_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/trans_req_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/trans_gnt_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/trans_r_gnt_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/trans_r_id_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/trans_r_req_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/data_dat_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/data_strb_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/data_req_o
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/data_gnt_i
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/CS
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/NS
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/s_axi_slave_aw_len
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/s_axi_slave_aw_addr
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/s_start_count
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/s_trans_count
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/s_trans_addr
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/s_trans_complete
add wave -noupdate -group {AXI2MEM WR CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/wr_channel_i/s_axi_slave_b_id
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/clk_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/rst_ni
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_ar_valid_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_ar_addr_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_ar_prot_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_ar_region_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_ar_len_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_ar_size_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_ar_burst_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_ar_lock_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_ar_cache_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_ar_qos_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_ar_id_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_ar_user_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_ar_ready_o
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_r_valid_o
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_r_data_o
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_r_resp_o
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_r_last_o
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_r_id_o
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_r_user_o
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/axi_slave_r_ready_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/trans_id_o
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/trans_add_o
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/trans_req_o
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/trans_last_o
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/trans_gnt_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/data_dat_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/data_id_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/data_last_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/data_req_o
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/data_gnt_i
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/CS
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/NS
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/s_axi_slave_ar_len
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/s_axi_slave_ar_addr
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/s_axi_slave_ar_id
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/s_start_count
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/s_trans_count
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/s_trans_addr
add wave -noupdate -group {AXI2MEM RD CHANNEL} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/rd_channel_i/s_trans_complete
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/clk_i
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/rst_ni
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/rd_data_push_dat_i
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/rd_data_push_req_i
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/rd_data_push_gnt_o
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/rd_data_push_id_i
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/rd_data_push_last_i
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/rd_data_pop_dat_o
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/rd_data_pop_req_i
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/rd_data_pop_gnt_o
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/rd_data_pop_id_o
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/rd_data_pop_last_o
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/wr_data_push_dat_i
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/wr_data_push_strb_i
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/wr_data_push_req_i
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/wr_data_push_gnt_o
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/wr_data_pop_dat_o
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/wr_data_pop_strb_o
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/wr_data_pop_req_i
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/wr_data_pop_gnt_o
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/s_rd_data_pop_dat
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/s_rd_data_pop_req
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/s_rd_data_pop_gnt
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/s_wr_data_push_dat
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/s_wr_data_push_strb
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/s_wr_data_push_req
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/s_wr_data_push_gnt
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/s_rd_last_pop_req
add wave -noupdate -group {AXI2MEM TRANS UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/trans_unit_i/s_rd_last_pop_gnt
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/clk_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/rst_ni
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_req_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_add_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_we_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_wdata_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_be_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_gnt_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_r_rdata_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_r_valid_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/trans_rd_id_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/trans_rd_add_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/trans_rd_last_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/trans_rd_req_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/trans_rd_gnt_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/trans_wr_id_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/trans_wr_add_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/trans_wr_last_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/trans_wr_req_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/trans_wr_gnt_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/synch_wr_gnt_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/synch_wr_req_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/synch_wr_id_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/data_rd_dat_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/data_rd_req_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/data_rd_gnt_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/data_rd_id_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/data_rd_last_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/data_wr_dat_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/data_wr_strb_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/data_wr_req_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/data_wr_gnt_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_trans_rd_add
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_trans_wr_add
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_trans_rd_id
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_trans_wr_id
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_trans_rd_req
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_trans_wr_req
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_trans_rd_gnt
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_trans_wr_gnt
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_trans_rd_last
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_trans_wr_last
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_synch_wr_req
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_synch_wr_id
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_data_rd_last
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM UNIT TOP} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/s_data_rd_id
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM SYNCH UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/axi2mem_tcdm_synch_wr_i/clk_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM SYNCH UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/axi2mem_tcdm_synch_wr_i/rst_ni
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM SYNCH UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/axi2mem_tcdm_synch_wr_i/synch_req_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM SYNCH UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/axi2mem_tcdm_synch_wr_i/synch_id_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM SYNCH UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/axi2mem_tcdm_synch_wr_i/synch_gnt_i
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM SYNCH UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/axi2mem_tcdm_synch_wr_i/synch_req_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM SYNCH UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/axi2mem_tcdm_synch_wr_i/synch_id_o
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM SYNCH UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/axi2mem_tcdm_synch_wr_i/s_synch_req
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM SYNCH UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/axi2mem_tcdm_synch_wr_i/s_synch_gnt
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM SYNCH UNIT} /tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/axi2mem_tcdm_synch_wr_i/s_synch_id
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/clk_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/rst_ni}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/trans_id_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/trans_add_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/trans_last_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/trans_req_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/trans_gnt_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/synch_req_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/synch_id_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/data_dat_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/data_strb_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/data_req_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/data_gnt_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/tcdm_req_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/tcdm_add_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/tcdm_we_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/tcdm_wdata_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/tcdm_be_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/tcdm_gnt_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/tcdm_r_rdata_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[1]/tcdm_wr_if_i/tcdm_r_valid_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/clk_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/rst_ni}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/trans_id_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/trans_add_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/trans_last_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/trans_req_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/trans_gnt_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/synch_req_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/synch_id_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/data_dat_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/data_strb_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/data_req_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/data_gnt_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/tcdm_req_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/tcdm_add_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/tcdm_we_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/tcdm_wdata_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/tcdm_be_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/tcdm_gnt_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/tcdm_r_rdata_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF WR 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_wr[0]/tcdm_wr_if_i/tcdm_r_valid_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/clk_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/rst_ni}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/trans_last_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/trans_id_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/trans_add_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/trans_req_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/trans_gnt_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/data_dat_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/data_id_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/data_last_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/data_req_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/data_gnt_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/tcdm_req_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/tcdm_add_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/tcdm_we_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/tcdm_wdata_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/tcdm_be_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/tcdm_gnt_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/tcdm_r_rdata_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/tcdm_r_valid_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/s_tcdm_r_rdata}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/s_trans_id}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/s_trans_last}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/s_push_req}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/s_pop_req}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/s_trans_stalled}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/s_sample_data}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/s_forward_data}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/CS}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 1} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[1]/tcdm_rd_if_i/NS}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/clk_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/rst_ni}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/trans_last_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/trans_id_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/trans_add_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/trans_req_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/trans_gnt_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/data_dat_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/data_id_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/data_last_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/data_req_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/data_gnt_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/tcdm_req_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/tcdm_add_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/tcdm_we_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/tcdm_wdata_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/tcdm_be_o}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/tcdm_gnt_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/tcdm_r_rdata_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/tcdm_r_valid_i}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/s_tcdm_r_rdata}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/s_trans_id}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/s_trans_last}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/s_push_req}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/s_pop_req}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/s_trans_stalled}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/s_sample_data}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/s_forward_data}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/CS}
add wave -noupdate -group {AXI2MEM TCDM UNIT} -group {AXI2MEM TCDM IF RD 0} {/tb/ulpsoc_wrap_i/ulpsoc_i/cluster_i/cluster_int_region_i/axi2mem_wrap_i/axi2mem_i/tcdm_unit_i/tcdm_if_rd[0]/tcdm_rd_if_i/NS}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {154525116 ps} 0} {{Cursor 2} {78547730 ps} 0}
configure wave -namecolwidth 758
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
WaveRestoreZoom {5035592341 ps} {5039952852 ps}
