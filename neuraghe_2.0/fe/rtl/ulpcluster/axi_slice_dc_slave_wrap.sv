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

module axi_slice_dc_slave_wrap
  #(
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_ID_WIDTH   = 10,
    parameter BUFFER_WIDTH   = 8
    )
   (
    input logic	   clk_i,
    input logic	   rst_ni,
    
    AXI_BUS.Slave  axi_slave,
    
    AXI_BUS_ASYNC.Master axi_master_async
    );
   
   axi_slice_dc_slave
   #(
     .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
     .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
     .AXI_USER_WIDTH(AXI_USER_WIDTH),
     .AXI_ID_WIDTH(AXI_ID_WIDTH),
     .BUFFER_WIDTH(BUFFER_WIDTH)
   )
   axi_slice_i
   (
      .clk_i(clk_i),
      .rst_ni(rst_ni),
      
      .axi_slave_aw_valid(axi_slave.aw_valid),
      .axi_slave_aw_addr(axi_slave.aw_addr),
      .axi_slave_aw_prot(axi_slave.aw_prot),
      .axi_slave_aw_region(axi_slave.aw_region),
      .axi_slave_aw_len(axi_slave.aw_len),
      .axi_slave_aw_size(axi_slave.aw_size),
      .axi_slave_aw_burst(axi_slave.aw_burst),
      .axi_slave_aw_lock(axi_slave.aw_lock),
      .axi_slave_aw_cache(axi_slave.aw_cache),
      .axi_slave_aw_qos(axi_slave.aw_qos),
      .axi_slave_aw_id(axi_slave.aw_id),
      .axi_slave_aw_user(axi_slave.aw_user),
      .axi_slave_aw_ready(axi_slave.aw_ready),
      
      .axi_slave_ar_valid(axi_slave.ar_valid),
      .axi_slave_ar_addr(axi_slave.ar_addr),
      .axi_slave_ar_prot(axi_slave.ar_prot),
      .axi_slave_ar_region(axi_slave.ar_region),
      .axi_slave_ar_len(axi_slave.ar_len),
      .axi_slave_ar_size(axi_slave.ar_size),
      .axi_slave_ar_burst(axi_slave.ar_burst),
      .axi_slave_ar_lock(axi_slave.ar_lock),
      .axi_slave_ar_cache(axi_slave.ar_cache),
      .axi_slave_ar_qos(axi_slave.ar_qos),
      .axi_slave_ar_id(axi_slave.ar_id),
      .axi_slave_ar_user(axi_slave.ar_user),
      .axi_slave_ar_ready(axi_slave.ar_ready),
      
      .axi_slave_w_valid(axi_slave.w_valid),
      .axi_slave_w_data(axi_slave.w_data),
      .axi_slave_w_strb(axi_slave.w_strb),
      .axi_slave_w_user(axi_slave.w_user),
      .axi_slave_w_last(axi_slave.w_last),
      .axi_slave_w_ready(axi_slave.w_ready),
      
      .axi_slave_r_valid(axi_slave.r_valid),
      .axi_slave_r_data(axi_slave.r_data),
      .axi_slave_r_resp(axi_slave.r_resp),
      .axi_slave_r_last(axi_slave.r_last),
      .axi_slave_r_id(axi_slave.r_id),
      .axi_slave_r_user(axi_slave.r_user),
      .axi_slave_r_ready(axi_slave.r_ready),
      
      .axi_slave_b_valid(axi_slave.b_valid),
      .axi_slave_b_resp(axi_slave.b_resp),
      .axi_slave_b_id(axi_slave.b_id),
      .axi_slave_b_user(axi_slave.b_user),
      .axi_slave_b_ready(axi_slave.b_ready),
      
      .axi_master_aw_addr(axi_master_async.aw_addr),
      .axi_master_aw_prot(axi_master_async.aw_prot),
      .axi_master_aw_region(axi_master_async.aw_region),
      .axi_master_aw_len(axi_master_async.aw_len),
      .axi_master_aw_size(axi_master_async.aw_size),
      .axi_master_aw_burst(axi_master_async.aw_burst),
      .axi_master_aw_lock(axi_master_async.aw_lock),
      .axi_master_aw_cache(axi_master_async.aw_cache),
      .axi_master_aw_qos(axi_master_async.aw_qos),
      .axi_master_aw_id(axi_master_async.aw_id[AXI_ID_WIDTH-1:0]),
      .axi_master_aw_user(axi_master_async.aw_user),
      .axi_master_aw_writetoken(axi_master_async.aw_writetoken), 
      .axi_master_aw_readpointer(axi_master_async.aw_readpointer),
      
      .axi_master_ar_addr(axi_master_async.ar_addr),
      .axi_master_ar_prot(axi_master_async.ar_prot),
      .axi_master_ar_region(axi_master_async.ar_region),
      .axi_master_ar_len(axi_master_async.ar_len),
      .axi_master_ar_size(axi_master_async.ar_size),
      .axi_master_ar_burst(axi_master_async.ar_burst),
      .axi_master_ar_lock(axi_master_async.ar_lock),
      .axi_master_ar_cache(axi_master_async.ar_cache),
      .axi_master_ar_qos(axi_master_async.ar_qos),
      .axi_master_ar_id(axi_master_async.ar_id[AXI_ID_WIDTH-1:0]),
      .axi_master_ar_user(axi_master_async.ar_user),
      .axi_master_ar_writetoken(axi_master_async.ar_writetoken), 
      .axi_master_ar_readpointer(axi_master_async.ar_readpointer),
      
      .axi_master_w_data(axi_master_async.w_data),
      .axi_master_w_strb(axi_master_async.w_strb),
      .axi_master_w_user(axi_master_async.w_user),
      .axi_master_w_last(axi_master_async.w_last),
      .axi_master_w_writetoken(axi_master_async.w_writetoken), 
      .axi_master_w_readpointer(axi_master_async.w_readpointer),
      
      .axi_master_r_data(axi_master_async.r_data),
      .axi_master_r_resp(axi_master_async.r_resp),
      .axi_master_r_last(axi_master_async.r_last),
      .axi_master_r_id(axi_master_async.r_id[AXI_ID_WIDTH-1:0]),
      .axi_master_r_user(axi_master_async.r_user),
      .axi_master_r_writetoken(axi_master_async.r_writetoken), 
      .axi_master_r_readpointer(axi_master_async.r_readpointer),
      
      .axi_master_b_resp(axi_master_async.b_resp),
      .axi_master_b_id(axi_master_async.b_id[AXI_ID_WIDTH-1:0]),
      .axi_master_b_user(axi_master_async.b_user),
      .axi_master_b_writetoken(axi_master_async.b_writetoken), 
      .axi_master_b_readpointer(axi_master_async.b_readpointer)
    );

`ifndef SYNTHESIS

    Axi4PC #(
        .DATA_WIDTH(AXI_DATA_WIDTH),
        .WID_WIDTH(4),
        .RID_WIDTH(4),
        .AWUSER_WIDTH(AXI_USER_WIDTH),
        .WUSER_WIDTH(AXI_USER_WIDTH),
        .BUSER_WIDTH(AXI_USER_WIDTH),
        .ARUSER_WIDTH(AXI_USER_WIDTH),
        .RUSER_WIDTH(AXI_USER_WIDTH)
    ) u_axi4_sva (
        .ACLK (clk_i),
        .ARESETn (rst_ni),
        .AWID (axi_slave.aw_id[3:0]),
        .AWADDR (axi_slave.aw_addr),
        .AWLEN (axi_slave.aw_len),
        .AWSIZE (axi_slave.aw_size),
        .AWBURST (axi_slave.aw_burst),
        .AWLOCK (axi_slave.aw_lock),
        .AWCACHE (axi_slave.aw_cache),
        .AWPROT (axi_slave.aw_prot),
        .AWQOS (axi_slave.aw_qos),
        .AWREGION (axi_slave.aw_region),
        .AWUSER (axi_slave.aw_user),
        .AWVALID (axi_slave.aw_valid),
        .AWREADY (axi_slave.aw_ready),
        .WLAST (axi_slave.w_last),
        .WDATA (axi_slave.w_data),
        .WSTRB (axi_slave.w_strb),
        .WUSER (axi_slave.w_user),
        .WVALID (axi_slave.w_valid),
        .WREADY (axi_slave.w_ready),
        .BID (axi_slave.b_id[3:0]),
        .BRESP (axi_slave.b_resp),
        .BUSER (axi_slave.b_user),
        .BVALID (axi_slave.b_valid),
        .BREADY (axi_slave.b_ready),
        .ARID (axi_slave.ar_id[3:0]),
        .ARADDR (axi_slave.ar_addr),
        .ARLEN (axi_slave.ar_len),
        .ARSIZE (axi_slave.ar_size),
	.ARBURST (axi_slave.ar_burst),
        .ARLOCK (axi_slave.ar_lock),
        .ARCACHE (axi_slave.ar_cache),
        .ARPROT (axi_slave.ar_prot),
        .ARQOS (axi_slave.ar_qos),
        .ARREGION (axi_slave.ar_region),
        .ARUSER (axi_slave.ar_user),
        .ARVALID (axi_slave.ar_valid),
        .ARREADY (axi_slave.ar_ready),
        .RID (axi_slave.r_id[3:0]),
        .RLAST (axi_slave.r_last),
        .RDATA (axi_slave.r_data),
        .RRESP (axi_slave.r_resp),
        .RUSER (axi_slave.r_user),
        .RVALID (axi_slave.r_valid),
        .RREADY (axi_slave.r_ready),
        .CACTIVE (1'b1),
        .CSYSREQ (1'b1),
        .CSYSACK (1'b1)
    );
   
`endif 
   
endmodule
