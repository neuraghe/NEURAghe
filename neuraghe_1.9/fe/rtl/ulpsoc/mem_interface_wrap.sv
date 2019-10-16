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
// Module Name:    mem_interface_wrap                                         //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    system verilog wrapper for memory_interface_top module     //
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

module axi_l2_mem_wrap
  #(
    parameter AXI4_ADDRESS_WIDTH = 32,
    parameter AXI4_RDATA_WIDTH   = 64,
    parameter AXI4_WDATA_WIDTH   = 64,
    parameter AXI4_ID_WIDTH      = 16,
    parameter AXI4_USER_WIDTH    = 10,
    parameter MEM_ADDR_WIDTH     = 12,
    parameter BUFF_DEPTH_SLAVE   = 2
    )
   (
    
    input logic              clk_i,
    input logic              rst_ni,
    
    AXI_BUS.Slave            axi_slave,
    
    UNICAD_MEM_BUS_64.Master mem_master
    
    );
   
   axi_l2_mem 
     #(  
	 .AXI4_ADDRESS_WIDTH(AXI4_ADDRESS_WIDTH),
	 .AXI4_RDATA_WIDTH(AXI4_RDATA_WIDTH),
	 .AXI4_WDATA_WIDTH(AXI4_WDATA_WIDTH),
	 .AXI4_ID_WIDTH(AXI4_ID_WIDTH),
	 .AXI4_USER_WIDTH(AXI4_USER_WIDTH),
	 .MEM_ADDR_WIDTH(MEM_ADDR_WIDTH),
	 .BUFF_DEPTH_SLAVE(BUFF_DEPTH_SLAVE)
	 )
   axi_l2_mem_i
     ( 
       .ACLK(clk_i),
       .ARESETn(rst_ni),
       
       .AWVALID_i(axi_slave.aw_valid),
       .AWADDR_i(axi_slave.aw_addr),
       .AWPROT_i(axi_slave.aw_prot),
       .AWREGION_i(axi_slave.aw_region),
       .AWLEN_i(axi_slave.aw_len),
       .AWSIZE_i(axi_slave.aw_size),
       .AWBURST_i(axi_slave.aw_burst),
       .AWLOCK_i(axi_slave.aw_lock),
       .AWCACHE_i(axi_slave.aw_cache),
       .AWQOS_i(axi_slave.aw_qos),
       .AWID_i(axi_slave.aw_id),
       .AWUSER_i(axi_slave.aw_user),
       .AWREADY_o(axi_slave.aw_ready),
       
       .ARVALID_i(axi_slave.ar_valid),
       .ARADDR_i(axi_slave.ar_addr),
       .ARPROT_i(axi_slave.ar_prot),
       .ARREGION_i(axi_slave.ar_region),
       .ARLEN_i(axi_slave.ar_len),
       .ARSIZE_i(axi_slave.ar_size),
       .ARBURST_i(axi_slave.ar_burst),
       .ARLOCK_i(axi_slave.ar_lock),
       .ARCACHE_i(axi_slave.ar_cache),
       .ARQOS_i(axi_slave.ar_qos),
       .ARID_i(axi_slave.ar_id),
       .ARUSER_i(axi_slave.ar_user),
       .ARREADY_o(axi_slave.ar_ready),
       
       .RVALID_o(axi_slave.r_valid),
       .RDATA_o(axi_slave.r_data),
       .RRESP_o(axi_slave.r_resp),
       .RLAST_o(axi_slave.r_last),
       .RID_o(axi_slave.r_id),
       .RUSSER_o(axi_slave.r_user),
       .RREADY_i(axi_slave.r_ready),
       
       .WVALID_i(axi_slave.wvalid),
       .WDATA_i(axi_slave.wdata),
       .WSTRB_i(axi_slave.wstrb),
       .WLAST_i(axi_slave.wlast),
       .WUSER_i(axi_slave.wuser),
       .WREADY_o(axi_slave.wready),
       
       .BVALID_o(axi_slave.bvalid),
       .BRESP_o(axi_slave.bresp),
       .BID_o(axi_slave.bid),
       .BUSER_o(axi_slave.buser),
       .BREADY_i(axi_slave.bready),
       
       .CEN(mem_master.CEN),
       .WEN(mem_master.WEN),
       .A(mem_master.A),
       .D(mem_master.D),
       .BE(mem_master.BE),
       .Q(mem_master.Q)
       );
   
endmodule
