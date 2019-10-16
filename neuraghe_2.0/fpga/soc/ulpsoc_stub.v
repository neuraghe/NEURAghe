// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
// Date        : Mon Sep 16 18:26:22 2019
// Host        : mcarr running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -mode synth_stub -force ulpsoc_stub.v
// Design      : ulpsoc
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module ulpsoc(rstn_sync_i, clk_soc_i, clk_cluster_fast_i, 
  clk_wmem_i, test_mode_i, mode_select_i, fetch_en_i, eoc_o, return_o, from_ps_bus_aw_addr, 
  from_ps_bus_aw_prot, from_ps_bus_aw_region, from_ps_bus_aw_len, from_ps_bus_aw_size, 
  from_ps_bus_aw_burst, from_ps_bus_aw_lock, from_ps_bus_aw_cache, from_ps_bus_aw_qos, 
  from_ps_bus_aw_id, from_ps_bus_aw_user, from_ps_bus_aw_ready, from_ps_bus_aw_valid, 
  from_ps_bus_ar_addr, from_ps_bus_ar_prot, from_ps_bus_ar_region, from_ps_bus_ar_len, 
  from_ps_bus_ar_size, from_ps_bus_ar_burst, from_ps_bus_ar_lock, from_ps_bus_ar_cache, 
  from_ps_bus_ar_qos, from_ps_bus_ar_id, from_ps_bus_ar_user, from_ps_bus_ar_ready, 
  from_ps_bus_ar_valid, from_ps_bus_w_data, from_ps_bus_w_strb, from_ps_bus_w_user, 
  from_ps_bus_w_last, from_ps_bus_w_ready, from_ps_bus_w_valid, from_ps_bus_r_data, 
  from_ps_bus_r_resp, from_ps_bus_r_last, from_ps_bus_r_id, from_ps_bus_r_user, 
  from_ps_bus_r_ready, from_ps_bus_r_valid, from_ps_bus_b_resp, from_ps_bus_b_id, 
  from_ps_bus_b_user, from_ps_bus_b_ready, from_ps_bus_b_valid, stdout_master_aw_addr, 
  stdout_master_aw_prot, stdout_master_aw_region, stdout_master_aw_len, 
  stdout_master_aw_size, stdout_master_aw_burst, stdout_master_aw_lock, 
  stdout_master_aw_cache, stdout_master_aw_qos, stdout_master_aw_id, 
  stdout_master_aw_user, stdout_master_aw_ready, stdout_master_aw_valid, 
  stdout_master_ar_addr, stdout_master_ar_prot, stdout_master_ar_region, 
  stdout_master_ar_len, stdout_master_ar_size, stdout_master_ar_burst, 
  stdout_master_ar_lock, stdout_master_ar_cache, stdout_master_ar_qos, 
  stdout_master_ar_id, stdout_master_ar_user, stdout_master_ar_ready, 
  stdout_master_ar_valid, stdout_master_w_data, stdout_master_w_strb, 
  stdout_master_w_user, stdout_master_w_last, stdout_master_w_ready, 
  stdout_master_w_valid, stdout_master_r_data, stdout_master_r_resp, 
  stdout_master_r_last, stdout_master_r_id, stdout_master_r_user, stdout_master_r_ready, 
  stdout_master_r_valid, stdout_master_b_resp, stdout_master_b_id, stdout_master_b_user, 
  stdout_master_b_ready, stdout_master_b_valid, to_ps_bus_aw_addr, to_ps_bus_aw_prot, 
  to_ps_bus_aw_region, to_ps_bus_aw_len, to_ps_bus_aw_size, to_ps_bus_aw_burst, 
  to_ps_bus_aw_lock, to_ps_bus_aw_cache, to_ps_bus_aw_qos, to_ps_bus_aw_id, 
  to_ps_bus_aw_user, to_ps_bus_aw_ready, to_ps_bus_aw_valid, to_ps_bus_ar_addr, 
  to_ps_bus_ar_prot, to_ps_bus_ar_region, to_ps_bus_ar_len, to_ps_bus_ar_size, 
  to_ps_bus_ar_burst, to_ps_bus_ar_lock, to_ps_bus_ar_cache, to_ps_bus_ar_qos, 
  to_ps_bus_ar_id, to_ps_bus_ar_user, to_ps_bus_ar_ready, to_ps_bus_ar_valid, 
  to_ps_bus_w_data, to_ps_bus_w_strb, to_ps_bus_w_user, to_ps_bus_w_last, 
  to_ps_bus_w_ready, to_ps_bus_w_valid, to_ps_bus_r_data, to_ps_bus_r_resp, 
  to_ps_bus_r_last, to_ps_bus_r_id, to_ps_bus_r_user, to_ps_bus_r_ready, to_ps_bus_r_valid, 
  to_ps_bus_b_resp, to_ps_bus_b_id, to_ps_bus_b_user, to_ps_bus_b_ready, to_ps_bus_b_valid, 
  dma2ddr_bus_aw_addr, dma2ddr_bus_aw_prot, dma2ddr_bus_aw_region, dma2ddr_bus_aw_len, 
  dma2ddr_bus_aw_size, dma2ddr_bus_aw_burst, dma2ddr_bus_aw_lock, dma2ddr_bus_aw_cache, 
  dma2ddr_bus_aw_qos, dma2ddr_bus_aw_id, dma2ddr_bus_aw_user, dma2ddr_bus_aw_ready, 
  dma2ddr_bus_aw_valid, dma2ddr_bus_ar_addr, dma2ddr_bus_ar_prot, dma2ddr_bus_ar_region, 
  dma2ddr_bus_ar_len, dma2ddr_bus_ar_size, dma2ddr_bus_ar_burst, dma2ddr_bus_ar_lock, 
  dma2ddr_bus_ar_cache, dma2ddr_bus_ar_qos, dma2ddr_bus_ar_id, dma2ddr_bus_ar_user, 
  dma2ddr_bus_ar_ready, dma2ddr_bus_ar_valid, dma2ddr_bus_w_data, dma2ddr_bus_w_strb, 
  dma2ddr_bus_w_user, dma2ddr_bus_w_last, dma2ddr_bus_w_ready, dma2ddr_bus_w_valid, 
  dma2ddr_bus_r_data, dma2ddr_bus_r_resp, dma2ddr_bus_r_last, dma2ddr_bus_r_id, 
  dma2ddr_bus_r_user, dma2ddr_bus_r_ready, dma2ddr_bus_r_valid, dma2ddr_bus_b_resp, 
  dma2ddr_bus_b_id, dma2ddr_bus_b_user, dma2ddr_bus_b_ready, dma2ddr_bus_b_valid, 
  wei2ddr0_bus_aw_addr, wei2ddr0_bus_aw_prot, wei2ddr0_bus_aw_region, 
  wei2ddr0_bus_aw_len, wei2ddr0_bus_aw_size, wei2ddr0_bus_aw_burst, wei2ddr0_bus_aw_lock, 
  wei2ddr0_bus_aw_cache, wei2ddr0_bus_aw_qos, wei2ddr0_bus_aw_id, wei2ddr0_bus_aw_user, 
  wei2ddr0_bus_aw_ready, wei2ddr0_bus_aw_valid, wei2ddr0_bus_ar_addr, 
  wei2ddr0_bus_ar_prot, wei2ddr0_bus_ar_region, wei2ddr0_bus_ar_len, 
  wei2ddr0_bus_ar_size, wei2ddr0_bus_ar_burst, wei2ddr0_bus_ar_lock, 
  wei2ddr0_bus_ar_cache, wei2ddr0_bus_ar_qos, wei2ddr0_bus_ar_id, wei2ddr0_bus_ar_user, 
  wei2ddr0_bus_ar_ready, wei2ddr0_bus_ar_valid, wei2ddr0_bus_w_data, wei2ddr0_bus_w_strb, 
  wei2ddr0_bus_w_user, wei2ddr0_bus_w_last, wei2ddr0_bus_w_ready, wei2ddr0_bus_w_valid, 
  wei2ddr0_bus_r_data, wei2ddr0_bus_r_resp, wei2ddr0_bus_r_last, wei2ddr0_bus_r_id, 
  wei2ddr0_bus_r_user, wei2ddr0_bus_r_ready, wei2ddr0_bus_r_valid, wei2ddr0_bus_b_resp, 
  wei2ddr0_bus_b_id, wei2ddr0_bus_b_user, wei2ddr0_bus_b_ready, wei2ddr0_bus_b_valid, 
  wei2ddr1_bus_aw_addr, wei2ddr1_bus_aw_prot, wei2ddr1_bus_aw_region, 
  wei2ddr1_bus_aw_len, wei2ddr1_bus_aw_size, wei2ddr1_bus_aw_burst, wei2ddr1_bus_aw_lock, 
  wei2ddr1_bus_aw_cache, wei2ddr1_bus_aw_qos, wei2ddr1_bus_aw_id, wei2ddr1_bus_aw_user, 
  wei2ddr1_bus_aw_ready, wei2ddr1_bus_aw_valid, wei2ddr1_bus_ar_addr, 
  wei2ddr1_bus_ar_prot, wei2ddr1_bus_ar_region, wei2ddr1_bus_ar_len, 
  wei2ddr1_bus_ar_size, wei2ddr1_bus_ar_burst, wei2ddr1_bus_ar_lock, 
  wei2ddr1_bus_ar_cache, wei2ddr1_bus_ar_qos, wei2ddr1_bus_ar_id, wei2ddr1_bus_ar_user, 
  wei2ddr1_bus_ar_ready, wei2ddr1_bus_ar_valid, wei2ddr1_bus_w_data, wei2ddr1_bus_w_strb, 
  wei2ddr1_bus_w_user, wei2ddr1_bus_w_last, wei2ddr1_bus_w_ready, wei2ddr1_bus_w_valid, 
  wei2ddr1_bus_r_data, wei2ddr1_bus_r_resp, wei2ddr1_bus_r_last, wei2ddr1_bus_r_id, 
  wei2ddr1_bus_r_user, wei2ddr1_bus_r_ready, wei2ddr1_bus_r_valid, wei2ddr1_bus_b_resp, 
  wei2ddr1_bus_b_id, wei2ddr1_bus_b_user, wei2ddr1_bus_b_ready, wei2ddr1_bus_b_valid)
/* synthesis syn_black_box black_box_pad_pin="rstn_sync_i,clk_soc_i,clk_cluster_fast_i,clk_wmem_i,test_mode_i,mode_select_i,fetch_en_i,eoc_o,return_o[1:0],from_ps_bus_aw_addr[31:0],from_ps_bus_aw_prot[2:0],from_ps_bus_aw_region[3:0],from_ps_bus_aw_len[7:0],from_ps_bus_aw_size[2:0],from_ps_bus_aw_burst[1:0],from_ps_bus_aw_lock,from_ps_bus_aw_cache[3:0],from_ps_bus_aw_qos[3:0],from_ps_bus_aw_id[9:0],from_ps_bus_aw_user[5:0],from_ps_bus_aw_ready,from_ps_bus_aw_valid,from_ps_bus_ar_addr[31:0],from_ps_bus_ar_prot[2:0],from_ps_bus_ar_region[3:0],from_ps_bus_ar_len[7:0],from_ps_bus_ar_size[2:0],from_ps_bus_ar_burst[1:0],from_ps_bus_ar_lock,from_ps_bus_ar_cache[3:0],from_ps_bus_ar_qos[3:0],from_ps_bus_ar_id[9:0],from_ps_bus_ar_user[5:0],from_ps_bus_ar_ready,from_ps_bus_ar_valid,from_ps_bus_w_data[63:0],from_ps_bus_w_strb[7:0],from_ps_bus_w_user[5:0],from_ps_bus_w_last,from_ps_bus_w_ready,from_ps_bus_w_valid,from_ps_bus_r_data[63:0],from_ps_bus_r_resp[1:0],from_ps_bus_r_last,from_ps_bus_r_id[9:0],from_ps_bus_r_user[5:0],from_ps_bus_r_ready,from_ps_bus_r_valid,from_ps_bus_b_resp[1:0],from_ps_bus_b_id[9:0],from_ps_bus_b_user[5:0],from_ps_bus_b_ready,from_ps_bus_b_valid,stdout_master_aw_addr[31:0],stdout_master_aw_prot[2:0],stdout_master_aw_region[3:0],stdout_master_aw_len[7:0],stdout_master_aw_size[2:0],stdout_master_aw_burst[1:0],stdout_master_aw_lock,stdout_master_aw_cache[3:0],stdout_master_aw_qos[3:0],stdout_master_aw_id[3:0],stdout_master_aw_user[5:0],stdout_master_aw_ready,stdout_master_aw_valid,stdout_master_ar_addr[31:0],stdout_master_ar_prot[2:0],stdout_master_ar_region[3:0],stdout_master_ar_len[7:0],stdout_master_ar_size[2:0],stdout_master_ar_burst[1:0],stdout_master_ar_lock,stdout_master_ar_cache[3:0],stdout_master_ar_qos[3:0],stdout_master_ar_id[3:0],stdout_master_ar_user[5:0],stdout_master_ar_ready,stdout_master_ar_valid,stdout_master_w_data[63:0],stdout_master_w_strb[7:0],stdout_master_w_user[5:0],stdout_master_w_last,stdout_master_w_ready,stdout_master_w_valid,stdout_master_r_data[63:0],stdout_master_r_resp[1:0],stdout_master_r_last,stdout_master_r_id[3:0],stdout_master_r_user[5:0],stdout_master_r_ready,stdout_master_r_valid,stdout_master_b_resp[1:0],stdout_master_b_id[3:0],stdout_master_b_user[5:0],stdout_master_b_ready,stdout_master_b_valid,to_ps_bus_aw_addr[31:0],to_ps_bus_aw_prot[2:0],to_ps_bus_aw_region[3:0],to_ps_bus_aw_len[7:0],to_ps_bus_aw_size[2:0],to_ps_bus_aw_burst[1:0],to_ps_bus_aw_lock,to_ps_bus_aw_cache[3:0],to_ps_bus_aw_qos[3:0],to_ps_bus_aw_id[3:0],to_ps_bus_aw_user[5:0],to_ps_bus_aw_ready,to_ps_bus_aw_valid,to_ps_bus_ar_addr[31:0],to_ps_bus_ar_prot[2:0],to_ps_bus_ar_region[3:0],to_ps_bus_ar_len[7:0],to_ps_bus_ar_size[2:0],to_ps_bus_ar_burst[1:0],to_ps_bus_ar_lock,to_ps_bus_ar_cache[3:0],to_ps_bus_ar_qos[3:0],to_ps_bus_ar_id[3:0],to_ps_bus_ar_user[5:0],to_ps_bus_ar_ready,to_ps_bus_ar_valid,to_ps_bus_w_data[63:0],to_ps_bus_w_strb[7:0],to_ps_bus_w_user[5:0],to_ps_bus_w_last,to_ps_bus_w_ready,to_ps_bus_w_valid,to_ps_bus_r_data[63:0],to_ps_bus_r_resp[1:0],to_ps_bus_r_last,to_ps_bus_r_id[3:0],to_ps_bus_r_user[5:0],to_ps_bus_r_ready,to_ps_bus_r_valid,to_ps_bus_b_resp[1:0],to_ps_bus_b_id[3:0],to_ps_bus_b_user[5:0],to_ps_bus_b_ready,to_ps_bus_b_valid,dma2ddr_bus_aw_addr[31:0],dma2ddr_bus_aw_prot[2:0],dma2ddr_bus_aw_region[3:0],dma2ddr_bus_aw_len[7:0],dma2ddr_bus_aw_size[2:0],dma2ddr_bus_aw_burst[1:0],dma2ddr_bus_aw_lock,dma2ddr_bus_aw_cache[3:0],dma2ddr_bus_aw_qos[3:0],dma2ddr_bus_aw_id[3:0],dma2ddr_bus_aw_user[5:0],dma2ddr_bus_aw_ready,dma2ddr_bus_aw_valid,dma2ddr_bus_ar_addr[31:0],dma2ddr_bus_ar_prot[2:0],dma2ddr_bus_ar_region[3:0],dma2ddr_bus_ar_len[7:0],dma2ddr_bus_ar_size[2:0],dma2ddr_bus_ar_burst[1:0],dma2ddr_bus_ar_lock,dma2ddr_bus_ar_cache[3:0],dma2ddr_bus_ar_qos[3:0],dma2ddr_bus_ar_id[3:0],dma2ddr_bus_ar_user[5:0],dma2ddr_bus_ar_ready,dma2ddr_bus_ar_valid,dma2ddr_bus_w_data[63:0],dma2ddr_bus_w_strb[7:0],dma2ddr_bus_w_user[5:0],dma2ddr_bus_w_last,dma2ddr_bus_w_ready,dma2ddr_bus_w_valid,dma2ddr_bus_r_data[63:0],dma2ddr_bus_r_resp[1:0],dma2ddr_bus_r_last,dma2ddr_bus_r_id[3:0],dma2ddr_bus_r_user[5:0],dma2ddr_bus_r_ready,dma2ddr_bus_r_valid,dma2ddr_bus_b_resp[1:0],dma2ddr_bus_b_id[3:0],dma2ddr_bus_b_user[5:0],dma2ddr_bus_b_ready,dma2ddr_bus_b_valid,wei2ddr0_bus_aw_addr[31:0],wei2ddr0_bus_aw_prot[2:0],wei2ddr0_bus_aw_region[3:0],wei2ddr0_bus_aw_len[7:0],wei2ddr0_bus_aw_size[2:0],wei2ddr0_bus_aw_burst[1:0],wei2ddr0_bus_aw_lock,wei2ddr0_bus_aw_cache[3:0],wei2ddr0_bus_aw_qos[3:0],wei2ddr0_bus_aw_id[3:0],wei2ddr0_bus_aw_user[5:0],wei2ddr0_bus_aw_ready,wei2ddr0_bus_aw_valid,wei2ddr0_bus_ar_addr[31:0],wei2ddr0_bus_ar_prot[2:0],wei2ddr0_bus_ar_region[3:0],wei2ddr0_bus_ar_len[7:0],wei2ddr0_bus_ar_size[2:0],wei2ddr0_bus_ar_burst[1:0],wei2ddr0_bus_ar_lock,wei2ddr0_bus_ar_cache[3:0],wei2ddr0_bus_ar_qos[3:0],wei2ddr0_bus_ar_id[3:0],wei2ddr0_bus_ar_user[5:0],wei2ddr0_bus_ar_ready,wei2ddr0_bus_ar_valid,wei2ddr0_bus_w_data[63:0],wei2ddr0_bus_w_strb[7:0],wei2ddr0_bus_w_user[5:0],wei2ddr0_bus_w_last,wei2ddr0_bus_w_ready,wei2ddr0_bus_w_valid,wei2ddr0_bus_r_data[63:0],wei2ddr0_bus_r_resp[1:0],wei2ddr0_bus_r_last,wei2ddr0_bus_r_id[3:0],wei2ddr0_bus_r_user[5:0],wei2ddr0_bus_r_ready,wei2ddr0_bus_r_valid,wei2ddr0_bus_b_resp[1:0],wei2ddr0_bus_b_id[3:0],wei2ddr0_bus_b_user[5:0],wei2ddr0_bus_b_ready,wei2ddr0_bus_b_valid,wei2ddr1_bus_aw_addr[31:0],wei2ddr1_bus_aw_prot[2:0],wei2ddr1_bus_aw_region[3:0],wei2ddr1_bus_aw_len[7:0],wei2ddr1_bus_aw_size[2:0],wei2ddr1_bus_aw_burst[1:0],wei2ddr1_bus_aw_lock,wei2ddr1_bus_aw_cache[3:0],wei2ddr1_bus_aw_qos[3:0],wei2ddr1_bus_aw_id[3:0],wei2ddr1_bus_aw_user[5:0],wei2ddr1_bus_aw_ready,wei2ddr1_bus_aw_valid,wei2ddr1_bus_ar_addr[31:0],wei2ddr1_bus_ar_prot[2:0],wei2ddr1_bus_ar_region[3:0],wei2ddr1_bus_ar_len[7:0],wei2ddr1_bus_ar_size[2:0],wei2ddr1_bus_ar_burst[1:0],wei2ddr1_bus_ar_lock,wei2ddr1_bus_ar_cache[3:0],wei2ddr1_bus_ar_qos[3:0],wei2ddr1_bus_ar_id[3:0],wei2ddr1_bus_ar_user[5:0],wei2ddr1_bus_ar_ready,wei2ddr1_bus_ar_valid,wei2ddr1_bus_w_data[63:0],wei2ddr1_bus_w_strb[7:0],wei2ddr1_bus_w_user[5:0],wei2ddr1_bus_w_last,wei2ddr1_bus_w_ready,wei2ddr1_bus_w_valid,wei2ddr1_bus_r_data[63:0],wei2ddr1_bus_r_resp[1:0],wei2ddr1_bus_r_last,wei2ddr1_bus_r_id[3:0],wei2ddr1_bus_r_user[5:0],wei2ddr1_bus_r_ready,wei2ddr1_bus_r_valid,wei2ddr1_bus_b_resp[1:0],wei2ddr1_bus_b_id[3:0],wei2ddr1_bus_b_user[5:0],wei2ddr1_bus_b_ready,wei2ddr1_bus_b_valid" */;
  input rstn_sync_i;
  input clk_soc_i;
  input clk_cluster_fast_i;
  input clk_wmem_i;
  input test_mode_i;
  input mode_select_i;
  input fetch_en_i;
  output eoc_o;
  output [1:0]return_o;
  input [31:0]from_ps_bus_aw_addr;
  input [2:0]from_ps_bus_aw_prot;
  input [3:0]from_ps_bus_aw_region;
  input [7:0]from_ps_bus_aw_len;
  input [2:0]from_ps_bus_aw_size;
  input [1:0]from_ps_bus_aw_burst;
  input from_ps_bus_aw_lock;
  input [3:0]from_ps_bus_aw_cache;
  input [3:0]from_ps_bus_aw_qos;
  input [9:0]from_ps_bus_aw_id;
  input [5:0]from_ps_bus_aw_user;
  output from_ps_bus_aw_ready;
  input from_ps_bus_aw_valid;
  input [31:0]from_ps_bus_ar_addr;
  input [2:0]from_ps_bus_ar_prot;
  input [3:0]from_ps_bus_ar_region;
  input [7:0]from_ps_bus_ar_len;
  input [2:0]from_ps_bus_ar_size;
  input [1:0]from_ps_bus_ar_burst;
  input from_ps_bus_ar_lock;
  input [3:0]from_ps_bus_ar_cache;
  input [3:0]from_ps_bus_ar_qos;
  input [9:0]from_ps_bus_ar_id;
  input [5:0]from_ps_bus_ar_user;
  output from_ps_bus_ar_ready;
  input from_ps_bus_ar_valid;
  input [63:0]from_ps_bus_w_data;
  input [7:0]from_ps_bus_w_strb;
  input [5:0]from_ps_bus_w_user;
  input from_ps_bus_w_last;
  output from_ps_bus_w_ready;
  input from_ps_bus_w_valid;
  output [63:0]from_ps_bus_r_data;
  output [1:0]from_ps_bus_r_resp;
  output from_ps_bus_r_last;
  output [9:0]from_ps_bus_r_id;
  output [5:0]from_ps_bus_r_user;
  input from_ps_bus_r_ready;
  output from_ps_bus_r_valid;
  output [1:0]from_ps_bus_b_resp;
  output [9:0]from_ps_bus_b_id;
  output [5:0]from_ps_bus_b_user;
  input from_ps_bus_b_ready;
  output from_ps_bus_b_valid;
  output [31:0]stdout_master_aw_addr;
  output [2:0]stdout_master_aw_prot;
  output [3:0]stdout_master_aw_region;
  output [7:0]stdout_master_aw_len;
  output [2:0]stdout_master_aw_size;
  output [1:0]stdout_master_aw_burst;
  output stdout_master_aw_lock;
  output [3:0]stdout_master_aw_cache;
  output [3:0]stdout_master_aw_qos;
  output [3:0]stdout_master_aw_id;
  output [5:0]stdout_master_aw_user;
  input stdout_master_aw_ready;
  output stdout_master_aw_valid;
  output [31:0]stdout_master_ar_addr;
  output [2:0]stdout_master_ar_prot;
  output [3:0]stdout_master_ar_region;
  output [7:0]stdout_master_ar_len;
  output [2:0]stdout_master_ar_size;
  output [1:0]stdout_master_ar_burst;
  output stdout_master_ar_lock;
  output [3:0]stdout_master_ar_cache;
  output [3:0]stdout_master_ar_qos;
  output [3:0]stdout_master_ar_id;
  output [5:0]stdout_master_ar_user;
  input stdout_master_ar_ready;
  output stdout_master_ar_valid;
  output [63:0]stdout_master_w_data;
  output [7:0]stdout_master_w_strb;
  output [5:0]stdout_master_w_user;
  output stdout_master_w_last;
  input stdout_master_w_ready;
  output stdout_master_w_valid;
  input [63:0]stdout_master_r_data;
  input [1:0]stdout_master_r_resp;
  input stdout_master_r_last;
  input [3:0]stdout_master_r_id;
  input [5:0]stdout_master_r_user;
  output stdout_master_r_ready;
  input stdout_master_r_valid;
  input [1:0]stdout_master_b_resp;
  input [3:0]stdout_master_b_id;
  input [5:0]stdout_master_b_user;
  output stdout_master_b_ready;
  input stdout_master_b_valid;
  output [31:0]to_ps_bus_aw_addr;
  output [2:0]to_ps_bus_aw_prot;
  output [3:0]to_ps_bus_aw_region;
  output [7:0]to_ps_bus_aw_len;
  output [2:0]to_ps_bus_aw_size;
  output [1:0]to_ps_bus_aw_burst;
  output to_ps_bus_aw_lock;
  output [3:0]to_ps_bus_aw_cache;
  output [3:0]to_ps_bus_aw_qos;
  output [3:0]to_ps_bus_aw_id;
  output [5:0]to_ps_bus_aw_user;
  input to_ps_bus_aw_ready;
  output to_ps_bus_aw_valid;
  output [31:0]to_ps_bus_ar_addr;
  output [2:0]to_ps_bus_ar_prot;
  output [3:0]to_ps_bus_ar_region;
  output [7:0]to_ps_bus_ar_len;
  output [2:0]to_ps_bus_ar_size;
  output [1:0]to_ps_bus_ar_burst;
  output to_ps_bus_ar_lock;
  output [3:0]to_ps_bus_ar_cache;
  output [3:0]to_ps_bus_ar_qos;
  output [3:0]to_ps_bus_ar_id;
  output [5:0]to_ps_bus_ar_user;
  input to_ps_bus_ar_ready;
  output to_ps_bus_ar_valid;
  output [63:0]to_ps_bus_w_data;
  output [7:0]to_ps_bus_w_strb;
  output [5:0]to_ps_bus_w_user;
  output to_ps_bus_w_last;
  input to_ps_bus_w_ready;
  output to_ps_bus_w_valid;
  input [63:0]to_ps_bus_r_data;
  input [1:0]to_ps_bus_r_resp;
  input to_ps_bus_r_last;
  input [3:0]to_ps_bus_r_id;
  input [5:0]to_ps_bus_r_user;
  output to_ps_bus_r_ready;
  input to_ps_bus_r_valid;
  input [1:0]to_ps_bus_b_resp;
  input [3:0]to_ps_bus_b_id;
  input [5:0]to_ps_bus_b_user;
  output to_ps_bus_b_ready;
  input to_ps_bus_b_valid;
  output [31:0]dma2ddr_bus_aw_addr;
  output [2:0]dma2ddr_bus_aw_prot;
  output [3:0]dma2ddr_bus_aw_region;
  output [7:0]dma2ddr_bus_aw_len;
  output [2:0]dma2ddr_bus_aw_size;
  output [1:0]dma2ddr_bus_aw_burst;
  output dma2ddr_bus_aw_lock;
  output [3:0]dma2ddr_bus_aw_cache;
  output [3:0]dma2ddr_bus_aw_qos;
  output [3:0]dma2ddr_bus_aw_id;
  output [5:0]dma2ddr_bus_aw_user;
  input dma2ddr_bus_aw_ready;
  output dma2ddr_bus_aw_valid;
  output [31:0]dma2ddr_bus_ar_addr;
  output [2:0]dma2ddr_bus_ar_prot;
  output [3:0]dma2ddr_bus_ar_region;
  output [7:0]dma2ddr_bus_ar_len;
  output [2:0]dma2ddr_bus_ar_size;
  output [1:0]dma2ddr_bus_ar_burst;
  output dma2ddr_bus_ar_lock;
  output [3:0]dma2ddr_bus_ar_cache;
  output [3:0]dma2ddr_bus_ar_qos;
  output [3:0]dma2ddr_bus_ar_id;
  output [5:0]dma2ddr_bus_ar_user;
  input dma2ddr_bus_ar_ready;
  output dma2ddr_bus_ar_valid;
  output [63:0]dma2ddr_bus_w_data;
  output [7:0]dma2ddr_bus_w_strb;
  output [5:0]dma2ddr_bus_w_user;
  output dma2ddr_bus_w_last;
  input dma2ddr_bus_w_ready;
  output dma2ddr_bus_w_valid;
  input [63:0]dma2ddr_bus_r_data;
  input [1:0]dma2ddr_bus_r_resp;
  input dma2ddr_bus_r_last;
  input [3:0]dma2ddr_bus_r_id;
  input [5:0]dma2ddr_bus_r_user;
  output dma2ddr_bus_r_ready;
  input dma2ddr_bus_r_valid;
  input [1:0]dma2ddr_bus_b_resp;
  input [3:0]dma2ddr_bus_b_id;
  input [5:0]dma2ddr_bus_b_user;
  output dma2ddr_bus_b_ready;
  input dma2ddr_bus_b_valid;
  output [31:0]wei2ddr0_bus_aw_addr;
  output [2:0]wei2ddr0_bus_aw_prot;
  output [3:0]wei2ddr0_bus_aw_region;
  output [7:0]wei2ddr0_bus_aw_len;
  output [2:0]wei2ddr0_bus_aw_size;
  output [1:0]wei2ddr0_bus_aw_burst;
  output wei2ddr0_bus_aw_lock;
  output [3:0]wei2ddr0_bus_aw_cache;
  output [3:0]wei2ddr0_bus_aw_qos;
  output [3:0]wei2ddr0_bus_aw_id;
  output [5:0]wei2ddr0_bus_aw_user;
  input wei2ddr0_bus_aw_ready;
  output wei2ddr0_bus_aw_valid;
  output [31:0]wei2ddr0_bus_ar_addr;
  output [2:0]wei2ddr0_bus_ar_prot;
  output [3:0]wei2ddr0_bus_ar_region;
  output [7:0]wei2ddr0_bus_ar_len;
  output [2:0]wei2ddr0_bus_ar_size;
  output [1:0]wei2ddr0_bus_ar_burst;
  output wei2ddr0_bus_ar_lock;
  output [3:0]wei2ddr0_bus_ar_cache;
  output [3:0]wei2ddr0_bus_ar_qos;
  output [3:0]wei2ddr0_bus_ar_id;
  output [5:0]wei2ddr0_bus_ar_user;
  input wei2ddr0_bus_ar_ready;
  output wei2ddr0_bus_ar_valid;
  output [63:0]wei2ddr0_bus_w_data;
  output [7:0]wei2ddr0_bus_w_strb;
  output [5:0]wei2ddr0_bus_w_user;
  output wei2ddr0_bus_w_last;
  input wei2ddr0_bus_w_ready;
  output wei2ddr0_bus_w_valid;
  input [63:0]wei2ddr0_bus_r_data;
  input [1:0]wei2ddr0_bus_r_resp;
  input wei2ddr0_bus_r_last;
  input [3:0]wei2ddr0_bus_r_id;
  input [5:0]wei2ddr0_bus_r_user;
  output wei2ddr0_bus_r_ready;
  input wei2ddr0_bus_r_valid;
  input [1:0]wei2ddr0_bus_b_resp;
  input [3:0]wei2ddr0_bus_b_id;
  input [5:0]wei2ddr0_bus_b_user;
  output wei2ddr0_bus_b_ready;
  input wei2ddr0_bus_b_valid;
  output [31:0]wei2ddr1_bus_aw_addr;
  output [2:0]wei2ddr1_bus_aw_prot;
  output [3:0]wei2ddr1_bus_aw_region;
  output [7:0]wei2ddr1_bus_aw_len;
  output [2:0]wei2ddr1_bus_aw_size;
  output [1:0]wei2ddr1_bus_aw_burst;
  output wei2ddr1_bus_aw_lock;
  output [3:0]wei2ddr1_bus_aw_cache;
  output [3:0]wei2ddr1_bus_aw_qos;
  output [3:0]wei2ddr1_bus_aw_id;
  output [5:0]wei2ddr1_bus_aw_user;
  input wei2ddr1_bus_aw_ready;
  output wei2ddr1_bus_aw_valid;
  output [31:0]wei2ddr1_bus_ar_addr;
  output [2:0]wei2ddr1_bus_ar_prot;
  output [3:0]wei2ddr1_bus_ar_region;
  output [7:0]wei2ddr1_bus_ar_len;
  output [2:0]wei2ddr1_bus_ar_size;
  output [1:0]wei2ddr1_bus_ar_burst;
  output wei2ddr1_bus_ar_lock;
  output [3:0]wei2ddr1_bus_ar_cache;
  output [3:0]wei2ddr1_bus_ar_qos;
  output [3:0]wei2ddr1_bus_ar_id;
  output [5:0]wei2ddr1_bus_ar_user;
  input wei2ddr1_bus_ar_ready;
  output wei2ddr1_bus_ar_valid;
  output [63:0]wei2ddr1_bus_w_data;
  output [7:0]wei2ddr1_bus_w_strb;
  output [5:0]wei2ddr1_bus_w_user;
  output wei2ddr1_bus_w_last;
  input wei2ddr1_bus_w_ready;
  output wei2ddr1_bus_w_valid;
  input [63:0]wei2ddr1_bus_r_data;
  input [1:0]wei2ddr1_bus_r_resp;
  input wei2ddr1_bus_r_last;
  input [3:0]wei2ddr1_bus_r_id;
  input [5:0]wei2ddr1_bus_r_user;
  output wei2ddr1_bus_r_ready;
  input wei2ddr1_bus_r_valid;
  input [1:0]wei2ddr1_bus_b_resp;
  input [3:0]wei2ddr1_bus_b_id;
  input [5:0]wei2ddr1_bus_b_user;
  output wei2ddr1_bus_b_ready;
  input wei2ddr1_bus_b_valid;
endmodule
