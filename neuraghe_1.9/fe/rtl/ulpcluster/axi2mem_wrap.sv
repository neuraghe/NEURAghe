////////////////////////////////////////////////////////////////////////////////
// Company:        Multitherman Laboratory @ DEIS - University of Bologna     //
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Davide Rossi - davide.rossi@unibo.it                       //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    13/02/2013                                                 // 
// Design Name:    ULPSoC                                                     // 
// Module Name:    ulpcluster_top                                             //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    ULPSoC cluster                                             //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "ulpsoc_defines.sv"

module axi2mem_wrap
#(
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_ID_WIDTH   = 6
)
(
    input logic                 clk_i,
    input logic                 rst_ni,

    AXI_BUS.Slave               axi_slave,

    XBAR_TCDM_BUS.Master        tcdm_master[3:0],

    output logic                busy_o
);

   logic [3:0][31:0]            s_tcdm_bus_wdata;
   logic [3:0][31:0]            s_tcdm_bus_add;
   logic [3:0]                  s_tcdm_bus_req;
   logic [3:0]                  s_tcdm_bus_wen;
   logic [3:0][3:0]             s_tcdm_bus_be;
   logic [3:0]                  s_tcdm_bus_gnt;
   logic [3:0][31:0]            s_tcdm_bus_r_rdata;
   logic [3:0]                  s_tcdm_bus_r_valid;

   genvar                       i;

   generate
      for (i=0; i<4; i++)
      begin : TCDM_BIND
           assign tcdm_master[i].add    = s_tcdm_bus_add[i];
           assign tcdm_master[i].req    = s_tcdm_bus_req[i];
           assign tcdm_master[i].wdata  = s_tcdm_bus_wdata[i];
           assign tcdm_master[i].wen    = s_tcdm_bus_wen[i];
           assign tcdm_master[i].be     = s_tcdm_bus_be[i];

           assign s_tcdm_bus_gnt[i]     = tcdm_master[i].gnt;
           assign s_tcdm_bus_r_valid[i] = tcdm_master[i].r_valid;
           assign s_tcdm_bus_r_rdata[i] = tcdm_master[i].r_rdata;
      end
   endgenerate

    //********************************************************
    //************** AXI2MEM WRAPER **************************
    //********************************************************
    axi2mem
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH)
    )
    axi2mem_i
    (
        .clk_i(clk_i),
        .rst_ni(rst_ni),

        .axi_slave_aw_valid_i(axi_slave.aw_valid),
        .axi_slave_aw_addr_i(axi_slave.aw_addr),
        .axi_slave_aw_prot_i(axi_slave.aw_prot),
        .axi_slave_aw_region_i(axi_slave.aw_region),
        .axi_slave_aw_len_i(axi_slave.aw_len),
        .axi_slave_aw_size_i(axi_slave.aw_size),
        .axi_slave_aw_burst_i(axi_slave.aw_burst),
        .axi_slave_aw_lock_i(axi_slave.aw_lock),
        .axi_slave_aw_cache_i(axi_slave.aw_cache),
        .axi_slave_aw_qos_i(axi_slave.aw_qos),
        .axi_slave_aw_id_i(axi_slave.aw_id),
        .axi_slave_aw_user_i(axi_slave.aw_user),
        .axi_slave_aw_ready_o(axi_slave.aw_ready),

        .axi_slave_ar_valid_i(axi_slave.ar_valid),
        .axi_slave_ar_addr_i(axi_slave.ar_addr),
        .axi_slave_ar_prot_i(axi_slave.ar_prot),
        .axi_slave_ar_region_i(axi_slave.ar_region),
        .axi_slave_ar_len_i(axi_slave.ar_len),
        .axi_slave_ar_size_i(axi_slave.ar_size),
        .axi_slave_ar_burst_i(axi_slave.ar_burst),
        .axi_slave_ar_lock_i(axi_slave.ar_lock),
        .axi_slave_ar_cache_i(axi_slave.ar_cache),
        .axi_slave_ar_qos_i(axi_slave.ar_qos),
        .axi_slave_ar_id_i(axi_slave.ar_id),
        .axi_slave_ar_user_i(axi_slave.ar_user),
        .axi_slave_ar_ready_o(axi_slave.ar_ready),

        .axi_slave_w_valid_i(axi_slave.w_valid),
        .axi_slave_w_data_i(axi_slave.w_data),
        .axi_slave_w_strb_i(axi_slave.w_strb),
        .axi_slave_w_user_i(axi_slave.w_user),
        .axi_slave_w_last_i(axi_slave.w_last),
        .axi_slave_w_ready_o(axi_slave.w_ready),

        .axi_slave_r_valid_o(axi_slave.r_valid),
        .axi_slave_r_data_o(axi_slave.r_data),
        .axi_slave_r_resp_o(axi_slave.r_resp),
        .axi_slave_r_last_o(axi_slave.r_last),
        .axi_slave_r_id_o(axi_slave.r_id),
        .axi_slave_r_user_o(axi_slave.r_user),
        .axi_slave_r_ready_i(axi_slave.r_ready),

        .axi_slave_b_valid_o(axi_slave.b_valid),
        .axi_slave_b_resp_o(axi_slave.b_resp),
        .axi_slave_b_id_o(axi_slave.b_id),
        .axi_slave_b_user_o(axi_slave.b_user),
        .axi_slave_b_ready_i(axi_slave.b_ready),

        .tcdm_master_req_o(s_tcdm_bus_req),
        .tcdm_master_add_o(s_tcdm_bus_add),
        .tcdm_master_type_o(s_tcdm_bus_wen),
        .tcdm_master_data_o(s_tcdm_bus_wdata),
        .tcdm_master_be_o(s_tcdm_bus_be),
        .tcdm_master_gnt_i(s_tcdm_bus_gnt),

        .tcdm_master_r_valid_i(s_tcdm_bus_r_valid),
        .tcdm_master_r_data_i(s_tcdm_bus_r_rdata),

        .busy_o(busy_o)
    );

endmodule
