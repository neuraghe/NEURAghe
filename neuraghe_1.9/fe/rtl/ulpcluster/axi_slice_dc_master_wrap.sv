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

module axi_slice_dc_master_wrap
  #(
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_ID_WIDTH   = 6,
    parameter BUFFER_WIDTH   = 8
    )
   (
    input logic	   clk_i,
    input logic	   rst_ni,
    
    AXI_BUS_ASYNC.Slave  axi_slave_async,
    
    AXI_BUS.Master axi_master
    );
   
   axi_slice_dc_master
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
      
      .axi_slave_aw_addr(axi_slave_async.aw_addr),
      .axi_slave_aw_prot(axi_slave_async.aw_prot),
      .axi_slave_aw_region(axi_slave_async.aw_region),
      .axi_slave_aw_len(axi_slave_async.aw_len),
      .axi_slave_aw_size(axi_slave_async.aw_size),
      .axi_slave_aw_burst(axi_slave_async.aw_burst),
      .axi_slave_aw_lock(axi_slave_async.aw_lock),
      .axi_slave_aw_cache(axi_slave_async.aw_cache),
      .axi_slave_aw_qos(axi_slave_async.aw_qos),
      .axi_slave_aw_id(axi_slave_async.aw_id),
      .axi_slave_aw_user(axi_slave_async.aw_user),
      .axi_slave_aw_writetoken(axi_slave_async.aw_writetoken), 
      .axi_slave_aw_readpointer(axi_slave_async.aw_readpointer),
      
      .axi_slave_ar_addr(axi_slave_async.ar_addr),
      .axi_slave_ar_prot(axi_slave_async.ar_prot),
      .axi_slave_ar_region(axi_slave_async.ar_region),
      .axi_slave_ar_len(axi_slave_async.ar_len),
      .axi_slave_ar_size(axi_slave_async.ar_size),
      .axi_slave_ar_burst(axi_slave_async.ar_burst),
      .axi_slave_ar_lock(axi_slave_async.ar_lock),
      .axi_slave_ar_cache(axi_slave_async.ar_cache),
      .axi_slave_ar_qos(axi_slave_async.ar_qos),
      .axi_slave_ar_id(axi_slave_async.ar_id),
      .axi_slave_ar_user(axi_slave_async.ar_user),
      .axi_slave_ar_writetoken(axi_slave_async.ar_writetoken), 
      .axi_slave_ar_readpointer(axi_slave_async.ar_readpointer),
      
      .axi_slave_w_data(axi_slave_async.w_data),
      .axi_slave_w_strb(axi_slave_async.w_strb),
      .axi_slave_w_user(axi_slave_async.w_user),
      .axi_slave_w_last(axi_slave_async.w_last),
      .axi_slave_w_writetoken(axi_slave_async.w_writetoken), 
      .axi_slave_w_readpointer(axi_slave_async.w_readpointer),
      
      .axi_slave_r_data(axi_slave_async.r_data),
      .axi_slave_r_resp(axi_slave_async.r_resp),
      .axi_slave_r_last(axi_slave_async.r_last),
      .axi_slave_r_id(axi_slave_async.r_id),
      .axi_slave_r_user(axi_slave_async.r_user),
      .axi_slave_r_writetoken(axi_slave_async.r_writetoken), 
      .axi_slave_r_readpointer(axi_slave_async.r_readpointer),
      
      .axi_slave_b_resp(axi_slave_async.b_resp),
      .axi_slave_b_id(axi_slave_async.b_id),
      .axi_slave_b_user(axi_slave_async.b_user),
      .axi_slave_b_writetoken(axi_slave_async.b_writetoken), 
      .axi_slave_b_readpointer(axi_slave_async.b_readpointer),
      
      .axi_master_aw_valid(axi_master.aw_valid),
      .axi_master_aw_ready(axi_master.aw_ready),
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
      
      .axi_master_ar_valid(axi_master.ar_valid),
      .axi_master_ar_ready(axi_master.ar_ready),
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
      
      .axi_master_w_valid(axi_master.w_valid),
      .axi_master_w_ready(axi_master.w_ready),
      .axi_master_w_data(axi_master.w_data),
      .axi_master_w_strb(axi_master.w_strb),
      .axi_master_w_user(axi_master.w_user),
      .axi_master_w_last(axi_master.w_last),
      
      .axi_master_r_valid(axi_master.r_valid),
      .axi_master_r_ready(axi_master.r_ready),
      .axi_master_r_data(axi_master.r_data),
      .axi_master_r_resp(axi_master.r_resp),
      .axi_master_r_last(axi_master.r_last),
      .axi_master_r_id(axi_master.r_id),
      .axi_master_r_user(axi_master.r_user),
      
      .axi_master_b_valid(axi_master.b_valid),
      .axi_master_b_ready(axi_master.b_ready),
      .axi_master_b_resp(axi_master.b_resp),
      .axi_master_b_id(axi_master.b_id),
      .axi_master_b_user(axi_master.b_user)
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
        .AWID (axi_master.aw_id[3:0]),
        .AWADDR (axi_master.aw_addr),
        .AWLEN (axi_master.aw_len),
        .AWSIZE (axi_master.aw_size),
        .AWBURST (axi_master.aw_burst),
        .AWLOCK (axi_master.aw_lock),
        .AWCACHE (axi_master.aw_cache),
        .AWPROT (axi_master.aw_prot),
        .AWQOS (axi_master.aw_qos),
        .AWREGION (axi_master.aw_region),
        .AWUSER (axi_master.aw_user),
        .AWVALID (axi_master.aw_valid),
        .AWREADY (axi_master.aw_ready),
        .WLAST (axi_master.w_last),
        .WDATA (axi_master.w_data),
        .WSTRB (axi_master.w_strb),
        .WUSER (axi_master.w_user),
        .WVALID (axi_master.w_valid),
        .WREADY (axi_master.w_ready),
        .BID (axi_master.b_id[3:0]),
        .BRESP (axi_master.b_resp),
        .BUSER (axi_master.b_user),
        .BVALID (axi_master.b_valid),
        .BREADY (axi_master.b_ready),
        .ARID (axi_master.ar_id[3:0]),
        .ARADDR (axi_master.ar_addr),
        .ARLEN (axi_master.ar_len),
        .ARSIZE (axi_master.ar_size),
        .ARBURST (axi_master.ar_burst),
        .ARLOCK (axi_master.ar_lock),
        .ARCACHE (axi_master.ar_cache),
        .ARPROT (axi_master.ar_prot),
        .ARQOS (axi_master.ar_qos),
        .ARREGION (axi_master.ar_region),
        .ARUSER (axi_master.ar_user),
        .ARVALID (axi_master.ar_valid),
        .ARREADY (axi_master.ar_ready),
        .RID (axi_master.r_id[3:0]),
        .RLAST (axi_master.r_last),
        .RDATA (axi_master.r_data),
        .RRESP (axi_master.r_resp),
        .RUSER (axi_master.r_user),
        .RVALID (axi_master.r_valid),
        .RREADY (axi_master.r_ready),
        .CACTIVE (1'b1),
        .CSYSREQ (1'b1),
        .CSYSACK (1'b1)
    ); 
   
`endif 

endmodule
