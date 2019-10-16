// (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: uniCA:user:nuraghe_soc:3.0
// IP Revision: 7

(* X_CORE_INFO = "ulpsoc,Vivado 2017.1" *)
(* CHECK_LICENSE_TYPE = "base_zynq_design_nuraghe_soc_0_0,ulpsoc,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module base_zynq_design_nuraghe_soc_0_0 (
  test_mode_i,
  mode_select_i,
  fetch_en_i,
  eoc_o,
  rstn_sync_i,
  clk_soc_i,
  clk_cluster_fast_i,
  clk_wmem_i,
  return_o,
  from_ps_bus_aw_addr,
  from_ps_bus_aw_prot,
  from_ps_bus_aw_region,
  from_ps_bus_aw_len,
  from_ps_bus_aw_size,
  from_ps_bus_aw_burst,
  from_ps_bus_aw_lock,
  from_ps_bus_aw_cache,
  from_ps_bus_aw_qos,
  from_ps_bus_aw_id,
  from_ps_bus_aw_user,
  from_ps_bus_ar_addr,
  from_ps_bus_ar_prot,
  from_ps_bus_ar_region,
  from_ps_bus_ar_len,
  from_ps_bus_ar_size,
  from_ps_bus_ar_burst,
  from_ps_bus_ar_lock,
  from_ps_bus_ar_cache,
  from_ps_bus_ar_qos,
  from_ps_bus_ar_id,
  from_ps_bus_ar_user,
  from_ps_bus_w_data,
  from_ps_bus_w_strb,
  from_ps_bus_w_user,
  from_ps_bus_w_last,
  from_ps_bus_r_data,
  from_ps_bus_r_resp,
  from_ps_bus_r_last,
  from_ps_bus_r_id,
  from_ps_bus_r_user,
  from_ps_bus_b_resp,
  from_ps_bus_b_id,
  from_ps_bus_b_user,
  from_ps_bus_aw_ready,
  from_ps_bus_aw_valid,
  from_ps_bus_ar_ready,
  from_ps_bus_ar_valid,
  from_ps_bus_w_ready,
  from_ps_bus_w_valid,
  from_ps_bus_r_ready,
  from_ps_bus_r_valid,
  from_ps_bus_b_ready,
  from_ps_bus_b_valid,
  stdout_master_aw_addr,
  stdout_master_aw_prot,
  stdout_master_aw_region,
  stdout_master_aw_len,
  stdout_master_aw_size,
  stdout_master_aw_burst,
  stdout_master_aw_lock,
  stdout_master_aw_cache,
  stdout_master_aw_qos,
  stdout_master_aw_id,
  stdout_master_aw_user,
  stdout_master_ar_addr,
  stdout_master_ar_prot,
  stdout_master_ar_region,
  stdout_master_ar_len,
  stdout_master_ar_size,
  stdout_master_ar_burst,
  stdout_master_ar_lock,
  stdout_master_ar_cache,
  stdout_master_ar_qos,
  stdout_master_ar_id,
  stdout_master_ar_user,
  stdout_master_w_data,
  stdout_master_w_strb,
  stdout_master_w_user,
  stdout_master_w_last,
  stdout_master_r_data,
  stdout_master_r_resp,
  stdout_master_r_last,
  stdout_master_r_id,
  stdout_master_r_user,
  stdout_master_b_resp,
  stdout_master_b_id,
  stdout_master_b_user,
  stdout_master_aw_ready,
  stdout_master_aw_valid,
  stdout_master_ar_ready,
  stdout_master_ar_valid,
  stdout_master_w_ready,
  stdout_master_w_valid,
  stdout_master_r_ready,
  stdout_master_r_valid,
  stdout_master_b_ready,
  stdout_master_b_valid,
  to_ps_bus_aw_addr,
  to_ps_bus_aw_prot,
  to_ps_bus_aw_region,
  to_ps_bus_aw_len,
  to_ps_bus_aw_size,
  to_ps_bus_aw_burst,
  to_ps_bus_aw_lock,
  to_ps_bus_aw_cache,
  to_ps_bus_aw_qos,
  to_ps_bus_aw_id,
  to_ps_bus_aw_user,
  to_ps_bus_ar_addr,
  to_ps_bus_ar_prot,
  to_ps_bus_ar_region,
  to_ps_bus_ar_len,
  to_ps_bus_ar_size,
  to_ps_bus_ar_burst,
  to_ps_bus_ar_lock,
  to_ps_bus_ar_cache,
  to_ps_bus_ar_qos,
  to_ps_bus_ar_id,
  to_ps_bus_ar_user,
  to_ps_bus_w_data,
  to_ps_bus_w_strb,
  to_ps_bus_w_user,
  to_ps_bus_w_last,
  to_ps_bus_r_data,
  to_ps_bus_r_resp,
  to_ps_bus_r_last,
  to_ps_bus_r_id,
  to_ps_bus_r_user,
  to_ps_bus_b_resp,
  to_ps_bus_b_id,
  to_ps_bus_b_user,
  to_ps_bus_aw_ready,
  to_ps_bus_aw_valid,
  to_ps_bus_ar_ready,
  to_ps_bus_ar_valid,
  to_ps_bus_w_ready,
  to_ps_bus_w_valid,
  to_ps_bus_r_ready,
  to_ps_bus_r_valid,
  to_ps_bus_b_ready,
  to_ps_bus_b_valid,
  dma2ddr_bus_aw_addr,
  dma2ddr_bus_aw_prot,
  dma2ddr_bus_aw_region,
  dma2ddr_bus_aw_len,
  dma2ddr_bus_aw_size,
  dma2ddr_bus_aw_burst,
  dma2ddr_bus_aw_lock,
  dma2ddr_bus_aw_cache,
  dma2ddr_bus_aw_qos,
  dma2ddr_bus_aw_id,
  dma2ddr_bus_aw_user,
  dma2ddr_bus_aw_ready,
  dma2ddr_bus_aw_valid,
  dma2ddr_bus_ar_addr,
  dma2ddr_bus_ar_prot,
  dma2ddr_bus_ar_region,
  dma2ddr_bus_ar_len,
  dma2ddr_bus_ar_size,
  dma2ddr_bus_ar_burst,
  dma2ddr_bus_ar_lock,
  dma2ddr_bus_ar_cache,
  dma2ddr_bus_ar_qos,
  dma2ddr_bus_ar_id,
  dma2ddr_bus_ar_user,
  dma2ddr_bus_ar_ready,
  dma2ddr_bus_ar_valid,
  dma2ddr_bus_w_data,
  dma2ddr_bus_w_strb,
  dma2ddr_bus_w_user,
  dma2ddr_bus_w_last,
  dma2ddr_bus_w_ready,
  dma2ddr_bus_w_valid,
  dma2ddr_bus_r_data,
  dma2ddr_bus_r_resp,
  dma2ddr_bus_r_last,
  dma2ddr_bus_r_id,
  dma2ddr_bus_r_user,
  dma2ddr_bus_r_ready,
  dma2ddr_bus_r_valid,
  dma2ddr_bus_b_resp,
  dma2ddr_bus_b_id,
  dma2ddr_bus_b_user,
  dma2ddr_bus_b_ready,
  dma2ddr_bus_b_valid,
  wei2ddr_bus_aw_addr,
  wei2ddr_bus_aw_prot,
  wei2ddr_bus_aw_region,
  wei2ddr_bus_aw_len,
  wei2ddr_bus_aw_size,
  wei2ddr_bus_aw_burst,
  wei2ddr_bus_aw_lock,
  wei2ddr_bus_aw_cache,
  wei2ddr_bus_aw_qos,
  wei2ddr_bus_aw_id,
  wei2ddr_bus_aw_user,
  wei2ddr_bus_aw_ready,
  wei2ddr_bus_aw_valid,
  wei2ddr_bus_ar_addr,
  wei2ddr_bus_ar_prot,
  wei2ddr_bus_ar_region,
  wei2ddr_bus_ar_len,
  wei2ddr_bus_ar_size,
  wei2ddr_bus_ar_burst,
  wei2ddr_bus_ar_lock,
  wei2ddr_bus_ar_cache,
  wei2ddr_bus_ar_qos,
  wei2ddr_bus_ar_id,
  wei2ddr_bus_ar_user,
  wei2ddr_bus_ar_ready,
  wei2ddr_bus_ar_valid,
  wei2ddr_bus_w_data,
  wei2ddr_bus_w_strb,
  wei2ddr_bus_w_user,
  wei2ddr_bus_w_last,
  wei2ddr_bus_w_ready,
  wei2ddr_bus_w_valid,
  wei2ddr_bus_r_data,
  wei2ddr_bus_r_resp,
  wei2ddr_bus_r_last,
  wei2ddr_bus_r_id,
  wei2ddr_bus_r_user,
  wei2ddr_bus_r_ready,
  wei2ddr_bus_r_valid,
  wei2ddr_bus_b_resp,
  wei2ddr_bus_b_id,
  wei2ddr_bus_b_user,
  wei2ddr_bus_b_ready,
  wei2ddr_bus_b_valid
);

input wire test_mode_i;
input wire mode_select_i;
input wire fetch_en_i;
output wire eoc_o;
input wire rstn_sync_i;
input wire clk_soc_i;
input wire clk_cluster_fast_i;
input wire clk_wmem_i;
output wire [1 : 0] return_o;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S AWADDR" *)
input wire [31 : 0] from_ps_bus_aw_addr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S AWPROT" *)
input wire [2 : 0] from_ps_bus_aw_prot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S AWREGION" *)
input wire [3 : 0] from_ps_bus_aw_region;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S AWLEN" *)
input wire [7 : 0] from_ps_bus_aw_len;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S AWSIZE" *)
input wire [2 : 0] from_ps_bus_aw_size;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S AWBURST" *)
input wire [1 : 0] from_ps_bus_aw_burst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S AWLOCK" *)
input wire from_ps_bus_aw_lock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S AWCACHE" *)
input wire [3 : 0] from_ps_bus_aw_cache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S AWQOS" *)
input wire [3 : 0] from_ps_bus_aw_qos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S AWID" *)
input wire [9 : 0] from_ps_bus_aw_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S AWUSER" *)
input wire [5 : 0] from_ps_bus_aw_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S ARADDR" *)
input wire [31 : 0] from_ps_bus_ar_addr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S ARPROT" *)
input wire [2 : 0] from_ps_bus_ar_prot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S ARREGION" *)
input wire [3 : 0] from_ps_bus_ar_region;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S ARLEN" *)
input wire [7 : 0] from_ps_bus_ar_len;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S ARSIZE" *)
input wire [2 : 0] from_ps_bus_ar_size;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S ARBURST" *)
input wire [1 : 0] from_ps_bus_ar_burst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S ARLOCK" *)
input wire from_ps_bus_ar_lock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S ARCACHE" *)
input wire [3 : 0] from_ps_bus_ar_cache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S ARQOS" *)
input wire [3 : 0] from_ps_bus_ar_qos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S ARID" *)
input wire [9 : 0] from_ps_bus_ar_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S ARUSER" *)
input wire [5 : 0] from_ps_bus_ar_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S WDATA" *)
input wire [63 : 0] from_ps_bus_w_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S WSTRB" *)
input wire [7 : 0] from_ps_bus_w_strb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S WUSER" *)
input wire [5 : 0] from_ps_bus_w_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S WLAST" *)
input wire from_ps_bus_w_last;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S RDATA" *)
output wire [63 : 0] from_ps_bus_r_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S RRESP" *)
output wire [1 : 0] from_ps_bus_r_resp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S RLAST" *)
output wire from_ps_bus_r_last;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S RID" *)
output wire [9 : 0] from_ps_bus_r_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S RUSER" *)
output wire [5 : 0] from_ps_bus_r_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S BRESP" *)
output wire [1 : 0] from_ps_bus_b_resp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S BID" *)
output wire [9 : 0] from_ps_bus_b_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S BUSER" *)
output wire [5 : 0] from_ps_bus_b_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S AWREADY" *)
output wire from_ps_bus_aw_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S AWVALID" *)
input wire from_ps_bus_aw_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S ARREADY" *)
output wire from_ps_bus_ar_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S ARVALID" *)
input wire from_ps_bus_ar_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S WREADY" *)
output wire from_ps_bus_w_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S WVALID" *)
input wire from_ps_bus_w_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S RREADY" *)
input wire from_ps_bus_r_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S RVALID" *)
output wire from_ps_bus_r_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S BREADY" *)
input wire from_ps_bus_b_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_IN_S BVALID" *)
output wire from_ps_bus_b_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M AWADDR" *)
output wire [31 : 0] stdout_master_aw_addr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M AWPROT" *)
output wire [2 : 0] stdout_master_aw_prot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M AWREGION" *)
output wire [3 : 0] stdout_master_aw_region;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M AWLEN" *)
output wire [7 : 0] stdout_master_aw_len;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M AWSIZE" *)
output wire [2 : 0] stdout_master_aw_size;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M AWBURST" *)
output wire [1 : 0] stdout_master_aw_burst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M AWLOCK" *)
output wire stdout_master_aw_lock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M AWCACHE" *)
output wire [3 : 0] stdout_master_aw_cache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M AWQOS" *)
output wire [3 : 0] stdout_master_aw_qos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M AWID" *)
output wire [3 : 0] stdout_master_aw_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M AWUSER" *)
output wire [5 : 0] stdout_master_aw_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M ARADDR" *)
output wire [31 : 0] stdout_master_ar_addr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M ARPROT" *)
output wire [2 : 0] stdout_master_ar_prot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M ARREGION" *)
output wire [3 : 0] stdout_master_ar_region;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M ARLEN" *)
output wire [7 : 0] stdout_master_ar_len;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M ARSIZE" *)
output wire [2 : 0] stdout_master_ar_size;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M ARBURST" *)
output wire [1 : 0] stdout_master_ar_burst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M ARLOCK" *)
output wire stdout_master_ar_lock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M ARCACHE" *)
output wire [3 : 0] stdout_master_ar_cache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M ARQOS" *)
output wire [3 : 0] stdout_master_ar_qos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M ARID" *)
output wire [3 : 0] stdout_master_ar_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M ARUSER" *)
output wire [5 : 0] stdout_master_ar_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M WDATA" *)
output wire [63 : 0] stdout_master_w_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M WSTRB" *)
output wire [7 : 0] stdout_master_w_strb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M WUSER" *)
output wire [5 : 0] stdout_master_w_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M WLAST" *)
output wire stdout_master_w_last;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M RDATA" *)
input wire [63 : 0] stdout_master_r_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M RRESP" *)
input wire [1 : 0] stdout_master_r_resp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M RLAST" *)
input wire stdout_master_r_last;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M RID" *)
input wire [3 : 0] stdout_master_r_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M RUSER" *)
input wire [5 : 0] stdout_master_r_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M BRESP" *)
input wire [1 : 0] stdout_master_b_resp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M BID" *)
input wire [3 : 0] stdout_master_b_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M BUSER" *)
input wire [5 : 0] stdout_master_b_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M AWREADY" *)
input wire stdout_master_aw_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M AWVALID" *)
output wire stdout_master_aw_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M ARREADY" *)
input wire stdout_master_ar_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M ARVALID" *)
output wire stdout_master_ar_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M WREADY" *)
input wire stdout_master_w_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M WVALID" *)
output wire stdout_master_w_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M RREADY" *)
output wire stdout_master_r_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M RVALID" *)
input wire stdout_master_r_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M BREADY" *)
output wire stdout_master_b_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 STDOUT_M BVALID" *)
input wire stdout_master_b_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M AWADDR" *)
output wire [31 : 0] to_ps_bus_aw_addr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M AWPROT" *)
output wire [2 : 0] to_ps_bus_aw_prot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M AWREGION" *)
output wire [3 : 0] to_ps_bus_aw_region;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M AWLEN" *)
output wire [7 : 0] to_ps_bus_aw_len;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M AWSIZE" *)
output wire [2 : 0] to_ps_bus_aw_size;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M AWBURST" *)
output wire [1 : 0] to_ps_bus_aw_burst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M AWLOCK" *)
output wire to_ps_bus_aw_lock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M AWCACHE" *)
output wire [3 : 0] to_ps_bus_aw_cache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M AWQOS" *)
output wire [3 : 0] to_ps_bus_aw_qos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M AWID" *)
output wire [3 : 0] to_ps_bus_aw_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M AWUSER" *)
output wire [5 : 0] to_ps_bus_aw_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M ARADDR" *)
output wire [31 : 0] to_ps_bus_ar_addr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M ARPROT" *)
output wire [2 : 0] to_ps_bus_ar_prot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M ARREGION" *)
output wire [3 : 0] to_ps_bus_ar_region;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M ARLEN" *)
output wire [7 : 0] to_ps_bus_ar_len;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M ARSIZE" *)
output wire [2 : 0] to_ps_bus_ar_size;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M ARBURST" *)
output wire [1 : 0] to_ps_bus_ar_burst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M ARLOCK" *)
output wire to_ps_bus_ar_lock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M ARCACHE" *)
output wire [3 : 0] to_ps_bus_ar_cache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M ARQOS" *)
output wire [3 : 0] to_ps_bus_ar_qos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M ARID" *)
output wire [3 : 0] to_ps_bus_ar_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M ARUSER" *)
output wire [5 : 0] to_ps_bus_ar_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M WDATA" *)
output wire [63 : 0] to_ps_bus_w_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M WSTRB" *)
output wire [7 : 0] to_ps_bus_w_strb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M WUSER" *)
output wire [5 : 0] to_ps_bus_w_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M WLAST" *)
output wire to_ps_bus_w_last;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M RDATA" *)
input wire [63 : 0] to_ps_bus_r_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M RRESP" *)
input wire [1 : 0] to_ps_bus_r_resp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M RLAST" *)
input wire to_ps_bus_r_last;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M RID" *)
input wire [3 : 0] to_ps_bus_r_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M RUSER" *)
input wire [5 : 0] to_ps_bus_r_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M BRESP" *)
input wire [1 : 0] to_ps_bus_b_resp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M BID" *)
input wire [3 : 0] to_ps_bus_b_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M BUSER" *)
input wire [5 : 0] to_ps_bus_b_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M AWREADY" *)
input wire to_ps_bus_aw_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M AWVALID" *)
output wire to_ps_bus_aw_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M ARREADY" *)
input wire to_ps_bus_ar_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M ARVALID" *)
output wire to_ps_bus_ar_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M WREADY" *)
input wire to_ps_bus_w_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M WVALID" *)
output wire to_ps_bus_w_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M RREADY" *)
output wire to_ps_bus_r_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M RVALID" *)
input wire to_ps_bus_r_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M BREADY" *)
output wire to_ps_bus_b_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DATA_OUT_M BVALID" *)
input wire to_ps_bus_b_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M AWADDR" *)
output wire [31 : 0] dma2ddr_bus_aw_addr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M AWPROT" *)
output wire [2 : 0] dma2ddr_bus_aw_prot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M AWREGION" *)
output wire [3 : 0] dma2ddr_bus_aw_region;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M AWLEN" *)
output wire [7 : 0] dma2ddr_bus_aw_len;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M AWSIZE" *)
output wire [2 : 0] dma2ddr_bus_aw_size;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M AWBURST" *)
output wire [1 : 0] dma2ddr_bus_aw_burst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M AWLOCK" *)
output wire dma2ddr_bus_aw_lock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M AWCACHE" *)
output wire [3 : 0] dma2ddr_bus_aw_cache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M AWQOS" *)
output wire [3 : 0] dma2ddr_bus_aw_qos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M AWID" *)
output wire [3 : 0] dma2ddr_bus_aw_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M AWUSER" *)
output wire [5 : 0] dma2ddr_bus_aw_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M AWREADY" *)
input wire dma2ddr_bus_aw_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M AWVALID" *)
output wire dma2ddr_bus_aw_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M ARADDR" *)
output wire [31 : 0] dma2ddr_bus_ar_addr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M ARPROT" *)
output wire [2 : 0] dma2ddr_bus_ar_prot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M ARREGION" *)
output wire [3 : 0] dma2ddr_bus_ar_region;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M ARLEN" *)
output wire [7 : 0] dma2ddr_bus_ar_len;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M ARSIZE" *)
output wire [2 : 0] dma2ddr_bus_ar_size;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M ARBURST" *)
output wire [1 : 0] dma2ddr_bus_ar_burst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M ARLOCK" *)
output wire dma2ddr_bus_ar_lock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M ARCACHE" *)
output wire [3 : 0] dma2ddr_bus_ar_cache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M ARQOS" *)
output wire [3 : 0] dma2ddr_bus_ar_qos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M ARID" *)
output wire [3 : 0] dma2ddr_bus_ar_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M ARUSER" *)
output wire [5 : 0] dma2ddr_bus_ar_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M ARREADY" *)
input wire dma2ddr_bus_ar_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M ARVALID" *)
output wire dma2ddr_bus_ar_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M WDATA" *)
output wire [63 : 0] dma2ddr_bus_w_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M WSTRB" *)
output wire [7 : 0] dma2ddr_bus_w_strb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M WUSER" *)
output wire [5 : 0] dma2ddr_bus_w_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M WLAST" *)
output wire dma2ddr_bus_w_last;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M WREADY" *)
input wire dma2ddr_bus_w_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M WVALID" *)
output wire dma2ddr_bus_w_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M RDATA" *)
input wire [63 : 0] dma2ddr_bus_r_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M RRESP" *)
input wire [1 : 0] dma2ddr_bus_r_resp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M RLAST" *)
input wire dma2ddr_bus_r_last;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M RID" *)
input wire [3 : 0] dma2ddr_bus_r_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M RUSER" *)
input wire [5 : 0] dma2ddr_bus_r_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M RREADY" *)
output wire dma2ddr_bus_r_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M RVALID" *)
input wire dma2ddr_bus_r_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M BRESP" *)
input wire [1 : 0] dma2ddr_bus_b_resp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M BID" *)
input wire [3 : 0] dma2ddr_bus_b_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M BUSER" *)
input wire [5 : 0] dma2ddr_bus_b_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M BREADY" *)
output wire dma2ddr_bus_b_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DMA_TO_DDR_M BVALID" *)
input wire dma2ddr_bus_b_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR AWADDR" *)
output wire [31 : 0] wei2ddr_bus_aw_addr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR AWPROT" *)
output wire [2 : 0] wei2ddr_bus_aw_prot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR AWREGION" *)
output wire [3 : 0] wei2ddr_bus_aw_region;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR AWLEN" *)
output wire [7 : 0] wei2ddr_bus_aw_len;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR AWSIZE" *)
output wire [2 : 0] wei2ddr_bus_aw_size;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR AWBURST" *)
output wire [1 : 0] wei2ddr_bus_aw_burst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR AWLOCK" *)
output wire wei2ddr_bus_aw_lock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR AWCACHE" *)
output wire [3 : 0] wei2ddr_bus_aw_cache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR AWQOS" *)
output wire [3 : 0] wei2ddr_bus_aw_qos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR AWID" *)
output wire [3 : 0] wei2ddr_bus_aw_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR AWUSER" *)
output wire [5 : 0] wei2ddr_bus_aw_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR AWREADY" *)
input wire wei2ddr_bus_aw_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR AWVALID" *)
output wire wei2ddr_bus_aw_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR ARADDR" *)
output wire [31 : 0] wei2ddr_bus_ar_addr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR ARPROT" *)
output wire [2 : 0] wei2ddr_bus_ar_prot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR ARREGION" *)
output wire [3 : 0] wei2ddr_bus_ar_region;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR ARLEN" *)
output wire [7 : 0] wei2ddr_bus_ar_len;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR ARSIZE" *)
output wire [2 : 0] wei2ddr_bus_ar_size;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR ARBURST" *)
output wire [1 : 0] wei2ddr_bus_ar_burst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR ARLOCK" *)
output wire wei2ddr_bus_ar_lock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR ARCACHE" *)
output wire [3 : 0] wei2ddr_bus_ar_cache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR ARQOS" *)
output wire [3 : 0] wei2ddr_bus_ar_qos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR ARID" *)
output wire [3 : 0] wei2ddr_bus_ar_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR ARUSER" *)
output wire [5 : 0] wei2ddr_bus_ar_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR ARREADY" *)
input wire wei2ddr_bus_ar_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR ARVALID" *)
output wire wei2ddr_bus_ar_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR WDATA" *)
output wire [63 : 0] wei2ddr_bus_w_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR WSTRB" *)
output wire [7 : 0] wei2ddr_bus_w_strb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR WUSER" *)
output wire [5 : 0] wei2ddr_bus_w_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR WLAST" *)
output wire wei2ddr_bus_w_last;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR WREADY" *)
input wire wei2ddr_bus_w_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR WVALID" *)
output wire wei2ddr_bus_w_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR RDATA" *)
input wire [63 : 0] wei2ddr_bus_r_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR RRESP" *)
input wire [1 : 0] wei2ddr_bus_r_resp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR RLAST" *)
input wire wei2ddr_bus_r_last;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR RID" *)
input wire [3 : 0] wei2ddr_bus_r_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR RUSER" *)
input wire [5 : 0] wei2ddr_bus_r_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR RREADY" *)
output wire wei2ddr_bus_r_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR RVALID" *)
input wire wei2ddr_bus_r_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR BRESP" *)
input wire [1 : 0] wei2ddr_bus_b_resp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR BID" *)
input wire [3 : 0] wei2ddr_bus_b_id;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR BUSER" *)
input wire [5 : 0] wei2ddr_bus_b_user;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR BREADY" *)
output wire wei2ddr_bus_b_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 WEI_TO_DDR BVALID" *)
input wire wei2ddr_bus_b_valid;

  ulpsoc inst (
    .test_mode_i(test_mode_i),
    .mode_select_i(mode_select_i),
    .fetch_en_i(fetch_en_i),
    .eoc_o(eoc_o),
    .rstn_sync_i(rstn_sync_i),
    .clk_soc_i(clk_soc_i),
    .clk_cluster_fast_i(clk_cluster_fast_i),
    .clk_wmem_i(clk_wmem_i),
    .return_o(return_o),
    .from_ps_bus_aw_addr(from_ps_bus_aw_addr),
    .from_ps_bus_aw_prot(from_ps_bus_aw_prot),
    .from_ps_bus_aw_region(from_ps_bus_aw_region),
    .from_ps_bus_aw_len(from_ps_bus_aw_len),
    .from_ps_bus_aw_size(from_ps_bus_aw_size),
    .from_ps_bus_aw_burst(from_ps_bus_aw_burst),
    .from_ps_bus_aw_lock(from_ps_bus_aw_lock),
    .from_ps_bus_aw_cache(from_ps_bus_aw_cache),
    .from_ps_bus_aw_qos(from_ps_bus_aw_qos),
    .from_ps_bus_aw_id(from_ps_bus_aw_id),
    .from_ps_bus_aw_user(from_ps_bus_aw_user),
    .from_ps_bus_ar_addr(from_ps_bus_ar_addr),
    .from_ps_bus_ar_prot(from_ps_bus_ar_prot),
    .from_ps_bus_ar_region(from_ps_bus_ar_region),
    .from_ps_bus_ar_len(from_ps_bus_ar_len),
    .from_ps_bus_ar_size(from_ps_bus_ar_size),
    .from_ps_bus_ar_burst(from_ps_bus_ar_burst),
    .from_ps_bus_ar_lock(from_ps_bus_ar_lock),
    .from_ps_bus_ar_cache(from_ps_bus_ar_cache),
    .from_ps_bus_ar_qos(from_ps_bus_ar_qos),
    .from_ps_bus_ar_id(from_ps_bus_ar_id),
    .from_ps_bus_ar_user(from_ps_bus_ar_user),
    .from_ps_bus_w_data(from_ps_bus_w_data),
    .from_ps_bus_w_strb(from_ps_bus_w_strb),
    .from_ps_bus_w_user(from_ps_bus_w_user),
    .from_ps_bus_w_last(from_ps_bus_w_last),
    .from_ps_bus_r_data(from_ps_bus_r_data),
    .from_ps_bus_r_resp(from_ps_bus_r_resp),
    .from_ps_bus_r_last(from_ps_bus_r_last),
    .from_ps_bus_r_id(from_ps_bus_r_id),
    .from_ps_bus_r_user(from_ps_bus_r_user),
    .from_ps_bus_b_resp(from_ps_bus_b_resp),
    .from_ps_bus_b_id(from_ps_bus_b_id),
    .from_ps_bus_b_user(from_ps_bus_b_user),
    .from_ps_bus_aw_ready(from_ps_bus_aw_ready),
    .from_ps_bus_aw_valid(from_ps_bus_aw_valid),
    .from_ps_bus_ar_ready(from_ps_bus_ar_ready),
    .from_ps_bus_ar_valid(from_ps_bus_ar_valid),
    .from_ps_bus_w_ready(from_ps_bus_w_ready),
    .from_ps_bus_w_valid(from_ps_bus_w_valid),
    .from_ps_bus_r_ready(from_ps_bus_r_ready),
    .from_ps_bus_r_valid(from_ps_bus_r_valid),
    .from_ps_bus_b_ready(from_ps_bus_b_ready),
    .from_ps_bus_b_valid(from_ps_bus_b_valid),
    .stdout_master_aw_addr(stdout_master_aw_addr),
    .stdout_master_aw_prot(stdout_master_aw_prot),
    .stdout_master_aw_region(stdout_master_aw_region),
    .stdout_master_aw_len(stdout_master_aw_len),
    .stdout_master_aw_size(stdout_master_aw_size),
    .stdout_master_aw_burst(stdout_master_aw_burst),
    .stdout_master_aw_lock(stdout_master_aw_lock),
    .stdout_master_aw_cache(stdout_master_aw_cache),
    .stdout_master_aw_qos(stdout_master_aw_qos),
    .stdout_master_aw_id(stdout_master_aw_id),
    .stdout_master_aw_user(stdout_master_aw_user),
    .stdout_master_ar_addr(stdout_master_ar_addr),
    .stdout_master_ar_prot(stdout_master_ar_prot),
    .stdout_master_ar_region(stdout_master_ar_region),
    .stdout_master_ar_len(stdout_master_ar_len),
    .stdout_master_ar_size(stdout_master_ar_size),
    .stdout_master_ar_burst(stdout_master_ar_burst),
    .stdout_master_ar_lock(stdout_master_ar_lock),
    .stdout_master_ar_cache(stdout_master_ar_cache),
    .stdout_master_ar_qos(stdout_master_ar_qos),
    .stdout_master_ar_id(stdout_master_ar_id),
    .stdout_master_ar_user(stdout_master_ar_user),
    .stdout_master_w_data(stdout_master_w_data),
    .stdout_master_w_strb(stdout_master_w_strb),
    .stdout_master_w_user(stdout_master_w_user),
    .stdout_master_w_last(stdout_master_w_last),
    .stdout_master_r_data(stdout_master_r_data),
    .stdout_master_r_resp(stdout_master_r_resp),
    .stdout_master_r_last(stdout_master_r_last),
    .stdout_master_r_id(stdout_master_r_id),
    .stdout_master_r_user(stdout_master_r_user),
    .stdout_master_b_resp(stdout_master_b_resp),
    .stdout_master_b_id(stdout_master_b_id),
    .stdout_master_b_user(stdout_master_b_user),
    .stdout_master_aw_ready(stdout_master_aw_ready),
    .stdout_master_aw_valid(stdout_master_aw_valid),
    .stdout_master_ar_ready(stdout_master_ar_ready),
    .stdout_master_ar_valid(stdout_master_ar_valid),
    .stdout_master_w_ready(stdout_master_w_ready),
    .stdout_master_w_valid(stdout_master_w_valid),
    .stdout_master_r_ready(stdout_master_r_ready),
    .stdout_master_r_valid(stdout_master_r_valid),
    .stdout_master_b_ready(stdout_master_b_ready),
    .stdout_master_b_valid(stdout_master_b_valid),
    .to_ps_bus_aw_addr(to_ps_bus_aw_addr),
    .to_ps_bus_aw_prot(to_ps_bus_aw_prot),
    .to_ps_bus_aw_region(to_ps_bus_aw_region),
    .to_ps_bus_aw_len(to_ps_bus_aw_len),
    .to_ps_bus_aw_size(to_ps_bus_aw_size),
    .to_ps_bus_aw_burst(to_ps_bus_aw_burst),
    .to_ps_bus_aw_lock(to_ps_bus_aw_lock),
    .to_ps_bus_aw_cache(to_ps_bus_aw_cache),
    .to_ps_bus_aw_qos(to_ps_bus_aw_qos),
    .to_ps_bus_aw_id(to_ps_bus_aw_id),
    .to_ps_bus_aw_user(to_ps_bus_aw_user),
    .to_ps_bus_ar_addr(to_ps_bus_ar_addr),
    .to_ps_bus_ar_prot(to_ps_bus_ar_prot),
    .to_ps_bus_ar_region(to_ps_bus_ar_region),
    .to_ps_bus_ar_len(to_ps_bus_ar_len),
    .to_ps_bus_ar_size(to_ps_bus_ar_size),
    .to_ps_bus_ar_burst(to_ps_bus_ar_burst),
    .to_ps_bus_ar_lock(to_ps_bus_ar_lock),
    .to_ps_bus_ar_cache(to_ps_bus_ar_cache),
    .to_ps_bus_ar_qos(to_ps_bus_ar_qos),
    .to_ps_bus_ar_id(to_ps_bus_ar_id),
    .to_ps_bus_ar_user(to_ps_bus_ar_user),
    .to_ps_bus_w_data(to_ps_bus_w_data),
    .to_ps_bus_w_strb(to_ps_bus_w_strb),
    .to_ps_bus_w_user(to_ps_bus_w_user),
    .to_ps_bus_w_last(to_ps_bus_w_last),
    .to_ps_bus_r_data(to_ps_bus_r_data),
    .to_ps_bus_r_resp(to_ps_bus_r_resp),
    .to_ps_bus_r_last(to_ps_bus_r_last),
    .to_ps_bus_r_id(to_ps_bus_r_id),
    .to_ps_bus_r_user(to_ps_bus_r_user),
    .to_ps_bus_b_resp(to_ps_bus_b_resp),
    .to_ps_bus_b_id(to_ps_bus_b_id),
    .to_ps_bus_b_user(to_ps_bus_b_user),
    .to_ps_bus_aw_ready(to_ps_bus_aw_ready),
    .to_ps_bus_aw_valid(to_ps_bus_aw_valid),
    .to_ps_bus_ar_ready(to_ps_bus_ar_ready),
    .to_ps_bus_ar_valid(to_ps_bus_ar_valid),
    .to_ps_bus_w_ready(to_ps_bus_w_ready),
    .to_ps_bus_w_valid(to_ps_bus_w_valid),
    .to_ps_bus_r_ready(to_ps_bus_r_ready),
    .to_ps_bus_r_valid(to_ps_bus_r_valid),
    .to_ps_bus_b_ready(to_ps_bus_b_ready),
    .to_ps_bus_b_valid(to_ps_bus_b_valid),
    .dma2ddr_bus_aw_addr(dma2ddr_bus_aw_addr),
    .dma2ddr_bus_aw_prot(dma2ddr_bus_aw_prot),
    .dma2ddr_bus_aw_region(dma2ddr_bus_aw_region),
    .dma2ddr_bus_aw_len(dma2ddr_bus_aw_len),
    .dma2ddr_bus_aw_size(dma2ddr_bus_aw_size),
    .dma2ddr_bus_aw_burst(dma2ddr_bus_aw_burst),
    .dma2ddr_bus_aw_lock(dma2ddr_bus_aw_lock),
    .dma2ddr_bus_aw_cache(dma2ddr_bus_aw_cache),
    .dma2ddr_bus_aw_qos(dma2ddr_bus_aw_qos),
    .dma2ddr_bus_aw_id(dma2ddr_bus_aw_id),
    .dma2ddr_bus_aw_user(dma2ddr_bus_aw_user),
    .dma2ddr_bus_aw_ready(dma2ddr_bus_aw_ready),
    .dma2ddr_bus_aw_valid(dma2ddr_bus_aw_valid),
    .dma2ddr_bus_ar_addr(dma2ddr_bus_ar_addr),
    .dma2ddr_bus_ar_prot(dma2ddr_bus_ar_prot),
    .dma2ddr_bus_ar_region(dma2ddr_bus_ar_region),
    .dma2ddr_bus_ar_len(dma2ddr_bus_ar_len),
    .dma2ddr_bus_ar_size(dma2ddr_bus_ar_size),
    .dma2ddr_bus_ar_burst(dma2ddr_bus_ar_burst),
    .dma2ddr_bus_ar_lock(dma2ddr_bus_ar_lock),
    .dma2ddr_bus_ar_cache(dma2ddr_bus_ar_cache),
    .dma2ddr_bus_ar_qos(dma2ddr_bus_ar_qos),
    .dma2ddr_bus_ar_id(dma2ddr_bus_ar_id),
    .dma2ddr_bus_ar_user(dma2ddr_bus_ar_user),
    .dma2ddr_bus_ar_ready(dma2ddr_bus_ar_ready),
    .dma2ddr_bus_ar_valid(dma2ddr_bus_ar_valid),
    .dma2ddr_bus_w_data(dma2ddr_bus_w_data),
    .dma2ddr_bus_w_strb(dma2ddr_bus_w_strb),
    .dma2ddr_bus_w_user(dma2ddr_bus_w_user),
    .dma2ddr_bus_w_last(dma2ddr_bus_w_last),
    .dma2ddr_bus_w_ready(dma2ddr_bus_w_ready),
    .dma2ddr_bus_w_valid(dma2ddr_bus_w_valid),
    .dma2ddr_bus_r_data(dma2ddr_bus_r_data),
    .dma2ddr_bus_r_resp(dma2ddr_bus_r_resp),
    .dma2ddr_bus_r_last(dma2ddr_bus_r_last),
    .dma2ddr_bus_r_id(dma2ddr_bus_r_id),
    .dma2ddr_bus_r_user(dma2ddr_bus_r_user),
    .dma2ddr_bus_r_ready(dma2ddr_bus_r_ready),
    .dma2ddr_bus_r_valid(dma2ddr_bus_r_valid),
    .dma2ddr_bus_b_resp(dma2ddr_bus_b_resp),
    .dma2ddr_bus_b_id(dma2ddr_bus_b_id),
    .dma2ddr_bus_b_user(dma2ddr_bus_b_user),
    .dma2ddr_bus_b_ready(dma2ddr_bus_b_ready),
    .dma2ddr_bus_b_valid(dma2ddr_bus_b_valid),
    .wei2ddr_bus_aw_addr(wei2ddr_bus_aw_addr),
    .wei2ddr_bus_aw_prot(wei2ddr_bus_aw_prot),
    .wei2ddr_bus_aw_region(wei2ddr_bus_aw_region),
    .wei2ddr_bus_aw_len(wei2ddr_bus_aw_len),
    .wei2ddr_bus_aw_size(wei2ddr_bus_aw_size),
    .wei2ddr_bus_aw_burst(wei2ddr_bus_aw_burst),
    .wei2ddr_bus_aw_lock(wei2ddr_bus_aw_lock),
    .wei2ddr_bus_aw_cache(wei2ddr_bus_aw_cache),
    .wei2ddr_bus_aw_qos(wei2ddr_bus_aw_qos),
    .wei2ddr_bus_aw_id(wei2ddr_bus_aw_id),
    .wei2ddr_bus_aw_user(wei2ddr_bus_aw_user),
    .wei2ddr_bus_aw_ready(wei2ddr_bus_aw_ready),
    .wei2ddr_bus_aw_valid(wei2ddr_bus_aw_valid),
    .wei2ddr_bus_ar_addr(wei2ddr_bus_ar_addr),
    .wei2ddr_bus_ar_prot(wei2ddr_bus_ar_prot),
    .wei2ddr_bus_ar_region(wei2ddr_bus_ar_region),
    .wei2ddr_bus_ar_len(wei2ddr_bus_ar_len),
    .wei2ddr_bus_ar_size(wei2ddr_bus_ar_size),
    .wei2ddr_bus_ar_burst(wei2ddr_bus_ar_burst),
    .wei2ddr_bus_ar_lock(wei2ddr_bus_ar_lock),
    .wei2ddr_bus_ar_cache(wei2ddr_bus_ar_cache),
    .wei2ddr_bus_ar_qos(wei2ddr_bus_ar_qos),
    .wei2ddr_bus_ar_id(wei2ddr_bus_ar_id),
    .wei2ddr_bus_ar_user(wei2ddr_bus_ar_user),
    .wei2ddr_bus_ar_ready(wei2ddr_bus_ar_ready),
    .wei2ddr_bus_ar_valid(wei2ddr_bus_ar_valid),
    .wei2ddr_bus_w_data(wei2ddr_bus_w_data),
    .wei2ddr_bus_w_strb(wei2ddr_bus_w_strb),
    .wei2ddr_bus_w_user(wei2ddr_bus_w_user),
    .wei2ddr_bus_w_last(wei2ddr_bus_w_last),
    .wei2ddr_bus_w_ready(wei2ddr_bus_w_ready),
    .wei2ddr_bus_w_valid(wei2ddr_bus_w_valid),
    .wei2ddr_bus_r_data(wei2ddr_bus_r_data),
    .wei2ddr_bus_r_resp(wei2ddr_bus_r_resp),
    .wei2ddr_bus_r_last(wei2ddr_bus_r_last),
    .wei2ddr_bus_r_id(wei2ddr_bus_r_id),
    .wei2ddr_bus_r_user(wei2ddr_bus_r_user),
    .wei2ddr_bus_r_ready(wei2ddr_bus_r_ready),
    .wei2ddr_bus_r_valid(wei2ddr_bus_r_valid),
    .wei2ddr_bus_b_resp(wei2ddr_bus_b_resp),
    .wei2ddr_bus_b_id(wei2ddr_bus_b_id),
    .wei2ddr_bus_b_user(wei2ddr_bus_b_user),
    .wei2ddr_bus_b_ready(wei2ddr_bus_b_ready),
    .wei2ddr_bus_b_valid(wei2ddr_bus_b_valid)
  );
endmodule
