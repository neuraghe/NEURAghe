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

module axi_mem_if_DP_wrap
#(
    parameter AXI_ADDRESS_WIDTH = 32,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ID_WIDTH      = 16,
    parameter AXI_USER_WIDTH    = 10,
    parameter MEM_ADDR_WIDTH    = 13,
    parameter BUFF_DEPTH_SLAVE  = 2
)
(
    input logic              clk_i,
    input logic              rst_ni,
    input logic              test_en_i,

    AXI_BUS.Slave            axi_slave_LP,
    AXI_BUS.Slave            axi_slave_HP,

    UNICAD_MEM_BUS_64.Master mem_master
);




   axi_mem_if_DP
   #(
       .AXI4_ADDRESS_WIDTH ( AXI_ADDRESS_WIDTH   ),
       .AXI4_RDATA_WIDTH   ( AXI_DATA_WIDTH      ),
       .AXI4_WDATA_WIDTH   ( AXI_DATA_WIDTH      ),
       .AXI4_ID_WIDTH      ( AXI_ID_WIDTH        ),
       .AXI4_USER_WIDTH    ( AXI_USER_WIDTH      ),
       .MEM_ADDR_WIDTH     ( MEM_ADDR_WIDTH      ),
       .BUFF_DEPTH_SLAVE   ( BUFF_DEPTH_SLAVE    )
   )
   axi_mem_if_i
   (
       .ACLK           ( clk_i                              ),
       .ARESETn        ( rst_ni                             ),
       .test_en_i      ( test_en_i                          ),

       .LP_AWVALID_i   ( axi_slave_LP.aw_valid              ),
       .LP_AWADDR_i    ( axi_slave_LP.aw_addr               ),
       .LP_AWPROT_i    ( axi_slave_LP.aw_prot               ),
       .LP_AWREGION_i  ( axi_slave_LP.aw_region             ),
       .LP_AWLEN_i     ( axi_slave_LP.aw_len                ),
       .LP_AWSIZE_i    ( axi_slave_LP.aw_size               ),
       .LP_AWBURST_i   ( axi_slave_LP.aw_burst              ),
       .LP_AWLOCK_i    ( axi_slave_LP.aw_lock               ),
       .LP_AWCACHE_i   ( axi_slave_LP.aw_cache              ),
       .LP_AWQOS_i     ( axi_slave_LP.aw_qos                ),
       .LP_AWID_i      ( axi_slave_LP.aw_id                 ),
       .LP_AWUSER_i    ( axi_slave_LP.aw_user               ),
       .LP_AWREADY_o   ( axi_slave_LP.aw_ready              ),

       .LP_ARVALID_i   ( axi_slave_LP.ar_valid              ),
       .LP_ARADDR_i    ( axi_slave_LP.ar_addr               ),
       .LP_ARPROT_i    ( axi_slave_LP.ar_prot               ),
       .LP_ARREGION_i  ( axi_slave_LP.ar_region             ),
       .LP_ARLEN_i     ( axi_slave_LP.ar_len                ),
       .LP_ARSIZE_i    ( axi_slave_LP.ar_size               ),
       .LP_ARBURST_i   ( axi_slave_LP.ar_burst              ),
       .LP_ARLOCK_i    ( axi_slave_LP.ar_lock               ),
       .LP_ARCACHE_i   ( axi_slave_LP.ar_cache              ),
       .LP_ARQOS_i     ( axi_slave_LP.ar_qos                ),
       .LP_ARID_i      ( axi_slave_LP.ar_id                 ),
       .LP_ARUSER_i    ( axi_slave_LP.ar_user               ),
       .LP_ARREADY_o   ( axi_slave_LP.ar_ready              ),

       .LP_RVALID_o    ( axi_slave_LP.r_valid               ),
       .LP_RDATA_o     ( axi_slave_LP.r_data                ),
       .LP_RRESP_o     ( axi_slave_LP.r_resp                ),
       .LP_RLAST_o     ( axi_slave_LP.r_last                ),
       .LP_RID_o       ( axi_slave_LP.r_id                  ),
       .LP_RUSER_o     ( axi_slave_LP.r_user                ),
       .LP_RREADY_i    ( axi_slave_LP.r_ready               ),

       .LP_WVALID_i    ( axi_slave_LP.w_valid               ),
       .LP_WDATA_i     ( axi_slave_LP.w_data                ),
       .LP_WSTRB_i     ( axi_slave_LP.w_strb                ),
       .LP_WLAST_i     ( axi_slave_LP.w_last                ),
       .LP_WUSER_i     ( axi_slave_LP.w_user                ),
       .LP_WREADY_o    ( axi_slave_LP.w_ready               ),

       .LP_BVALID_o    ( axi_slave_LP.b_valid               ),
       .LP_BRESP_o     ( axi_slave_LP.b_resp                ),
       .LP_BID_o       ( axi_slave_LP.b_id                  ),
       .LP_BUSER_o     ( axi_slave_LP.b_user                ),
       .LP_BREADY_i    ( axi_slave_LP.b_ready               ),


       .HP_AWVALID_i   ( axi_slave_HP.aw_valid              ),
       .HP_AWADDR_i    ( axi_slave_HP.aw_addr               ),
       .HP_AWPROT_i    ( axi_slave_HP.aw_prot               ),
       .HP_AWREGION_i  ( axi_slave_HP.aw_region             ),
       .HP_AWLEN_i     ( axi_slave_HP.aw_len                ),
       .HP_AWSIZE_i    ( axi_slave_HP.aw_size               ),
       .HP_AWBURST_i   ( axi_slave_HP.aw_burst              ),
       .HP_AWLOCK_i    ( axi_slave_HP.aw_lock               ),
       .HP_AWCACHE_i   ( axi_slave_HP.aw_cache              ),
       .HP_AWQOS_i     ( axi_slave_HP.aw_qos                ),
       .HP_AWID_i      ( axi_slave_HP.aw_id                 ),
       .HP_AWUSER_i    ( axi_slave_HP.aw_user               ),
       .HP_AWREADY_o   ( axi_slave_HP.aw_ready              ),

       .HP_ARVALID_i   ( axi_slave_HP.ar_valid              ),
       .HP_ARADDR_i    ( axi_slave_HP.ar_addr               ),
       .HP_ARPROT_i    ( axi_slave_HP.ar_prot               ),
       .HP_ARREGION_i  ( axi_slave_HP.ar_region             ),
       .HP_ARLEN_i     ( axi_slave_HP.ar_len                ),
       .HP_ARSIZE_i    ( axi_slave_HP.ar_size               ),
       .HP_ARBURST_i   ( axi_slave_HP.ar_burst              ),
       .HP_ARLOCK_i    ( axi_slave_HP.ar_lock               ),
       .HP_ARCACHE_i   ( axi_slave_HP.ar_cache              ),
       .HP_ARQOS_i     ( axi_slave_HP.ar_qos                ),
       .HP_ARID_i      ( axi_slave_HP.ar_id                 ),
       .HP_ARUSER_i    ( axi_slave_HP.ar_user               ),
       .HP_ARREADY_o   ( axi_slave_HP.ar_ready              ),

       .HP_RVALID_o    ( axi_slave_HP.r_valid               ),
       .HP_RDATA_o     ( axi_slave_HP.r_data                ),
       .HP_RRESP_o     ( axi_slave_HP.r_resp                ),
       .HP_RLAST_o     ( axi_slave_HP.r_last                ),
       .HP_RID_o       ( axi_slave_HP.r_id                  ),
       .HP_RUSER_o     ( axi_slave_HP.r_user                ),
       .HP_RREADY_i    ( axi_slave_HP.r_ready               ),

       .HP_WVALID_i    ( axi_slave_HP.w_valid               ),
       .HP_WDATA_i     ( axi_slave_HP.w_data                ),
       .HP_WSTRB_i     ( axi_slave_HP.w_strb                ),
       .HP_WLAST_i     ( axi_slave_HP.w_last                ),
       .HP_WUSER_i     ( axi_slave_HP.w_user                ),
       .HP_WREADY_o    ( axi_slave_HP.w_ready               ),

       .HP_BVALID_o    ( axi_slave_HP.b_valid               ),
       .HP_BRESP_o     ( axi_slave_HP.b_resp                ),
       .HP_BID_o       ( axi_slave_HP.b_id                  ),
       .HP_BUSER_o     ( axi_slave_HP.b_user                ),
       .HP_BREADY_i    ( axi_slave_HP.b_ready               ),



       .CEN            ( mem_master.csn                     ),
       .WEN            ( mem_master.wen                     ),
       .A              ( mem_master.add[MEM_ADDR_WIDTH-1:0] ),
       .D              ( mem_master.wdata                   ),
       .BE             ( mem_master.ben                     ),
       .Q              ( mem_master.rdata                   )
   );

endmodule
