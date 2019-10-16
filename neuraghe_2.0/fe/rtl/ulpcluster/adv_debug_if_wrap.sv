`include "ulpsoc_defines.sv"

module adv_dbg_if_wrap
  #(
    parameter NB_CORES       = 4,
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_ID_WIDTH   = 3
    )
   (
    input  logic                       tms_pad_i, 
    input  logic                       tck_pad_i, 
    input  logic                       trstn_pad_i, 
    input  logic                       tdi_pad_i, 
    output logic                       tdo_pad_o, 

    input  logic                       test_mode_i, 

    // CPU signals
    output logic [NB_CORES-1:0] [15:0] cpu_addr_o, 
    input  logic [NB_CORES-1:0] [31:0] cpu_data_i, 
    output logic [NB_CORES-1:0] [31:0] cpu_data_o,
    input  logic [NB_CORES-1:0]        cpu_bp_i,
    output logic [NB_CORES-1:0]        cpu_stall_o,
    output logic [NB_CORES-1:0]        cpu_stb_o,
    output logic [NB_CORES-1:0]        cpu_we_o,
    input  logic [NB_CORES-1:0]        cpu_ack_i,
    output logic [NB_CORES-1:0]        cpu_rst_o,

    input logic	                       axi_aclk,
    input logic	                       axi_aresetn,        
    
    AXI_BUS.Master                     axi_master
    );
   
      assign tdo_pad_o = 0;
      assign cpu_addr_o = 0;
      assign cpu_data_o = 0;
      assign cpu_stall_o = 0;
      assign cpu_stb_o = 0;
      assign cpu_we_o = 0;
      assign cpu_rst_o = 0;
      
      /*
      .axi_master_aw_valid(axi_master.aw_valid),
      .axi_master_aw_addr(axi_master.aw_addr),
      .axi_master_aw_prot(axi_master.aw_prot),
      .axi_master_aw_region(axi_master.aw_region),
      .axi_master_aw_len(axi_master.aw_len),
      .axi_master_aw_size(axi_master.aw_size),
      .axi_master_aw_burst(axi_master.aw_burst),
      .axi_master_aw_lock(axi_master.aw_lock),
      .axi_master_aw_cache(axi_master.aw_cache),
      .axi_master_aw_qos(axi_master.aw_qos),
      .axi_master_aw_id(axi_master.aw_id),
      .axi_master_aw_user(axi_master.aw_user),
      .axi_master_aw_ready(axi_master.aw_ready),
      
      .axi_master_ar_valid(axi_master.ar_valid),
      .axi_master_ar_addr(axi_master.ar_addr),
      .axi_master_ar_prot(axi_master.ar_prot),
      .axi_master_ar_region(axi_master.ar_region),
      .axi_master_ar_len(axi_master.ar_len),
      .axi_master_ar_size(axi_master.ar_size),
      .axi_master_ar_burst(axi_master.ar_burst),
      .axi_master_ar_lock(axi_master.ar_lock),
      .axi_master_ar_cache(axi_master.ar_cache),
      .axi_master_ar_qos(axi_master.ar_qos),
      .axi_master_ar_id(axi_master.ar_id),
      .axi_master_ar_user(axi_master.ar_user),
      .axi_master_ar_ready(axi_master.ar_ready),
      
      .axi_master_w_valid(axi_master.w_valid),
      .axi_master_w_data(axi_master.w_data),
      .axi_master_w_strb(axi_master.w_strb),
      .axi_master_w_user(axi_master.w_user),
      .axi_master_w_last(axi_master.w_last),
      .axi_master_w_ready(axi_master.w_ready),
      
      .axi_master_r_valid(axi_master.r_valid),
      .axi_master_r_data(axi_master.r_data),
      .axi_master_r_resp(axi_master.r_resp),
      .axi_master_r_last(axi_master.r_last),
      .axi_master_r_id(axi_master.r_id),
      .axi_master_r_user(axi_master.r_user),
      .axi_master_r_ready(axi_master.r_ready),
      
      .axi_master_b_valid(axi_master.b_valid),
      .axi_master_b_resp(axi_master.b_resp),
      .axi_master_b_id(axi_master.b_id),
      .axi_master_b_user(axi_master.b_user),
      .axi_master_b_ready(axi_master.b_ready)
      );*/
   
endmodule
