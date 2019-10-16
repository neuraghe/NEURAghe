// ============================================================================= //
//                           COPYRIGHT NOTICE                                    //
// Copyright 2014 Multitherman Laboratory - University of Bologna                //
// ALL RIGHTS RESERVED                                                           //
// This confidential and proprietary software may be used only as authorised by  //
// a licensing agreement from Multitherman Laboratory - University of Bologna.   //
// The entire notice above must be reproduced on all authorized copies and       //
// copies may only be made to the extent permitted by a licensing agreement from //
// Multitherman Laboratory - University of Bologna.                              //
// ============================================================================= //

// ============================================================================= //
// Company:        Multitherman Laboratory @ DEIS - University of Bologna        //
//                    Viale Risorgimento 2 40136                                 //
//                    Bologna - fax 0512093785 -                                 //
//                                                                               //
// Engineer:       Davide Rossi - davide.rossi@unibo.it                          //
//                                                                               //
//                                                                               //
// Additional contributions by:                                                  //
//                                                                               //
//                                                                               //
//                                                                               //
// Create Date:    01/02/2014                                                    //
// Design Name:    AXI 4 Verification IP                                         //
// Module Name:    TGEN_wrap                                                     //
// Project Name:   PULP                                                          //
// Language:       SystemVerilog                                                 //
//                                                                               //
// Description:    AXI 4 Traffic generator wrapper with interfaces               //
//                 Only for verification!!                                       //
//                                                                               //
// Revision:                                                                     //
// Revision v0.1 - 01/02/2014 : File Created                                     //
//                                                                               //
//                                                                               //
//                                                                               //
//                                                                               //
//                                                                               //
//                                                                               //
// ============================================================================= //

`timescale 1ns/1ps
`define SOD 0.1


module TGEN_wrap 
#( 
    parameter AXI4_ADDRESS_WIDTH = 32,
    parameter AXI4_RDATA_WIDTH   = 32,
    parameter AXI4_WDATA_WIDTH   = 32,
    parameter AXI4_ID_WIDTH      = 16,
    parameter AXI4_USER_WIDTH    = 10,
    parameter AXI_NUMBYTES       = AXI4_WDATA_WIDTH/8,
    parameter SRC_ID             = 0
)	
(
    input logic 					clk,
    input logic 					rst_n,
    
    AXI_BUS.Master  					axi_port_master,
    
    input  logic					fetch_en_i,
    output logic					eoc_o,
    output logic [31:0]					PASS_o,
    output logic [31:0]					FAIL_o
);

	TGEN 
	#( 
	      .AXI4_ADDRESS_WIDTH (  AXI4_ADDRESS_WIDTH  ),
	      .AXI4_RDATA_WIDTH   (  AXI4_RDATA_WIDTH    ),
	      .AXI4_WDATA_WIDTH   (  AXI4_WDATA_WIDTH    ),
	      .AXI4_ID_WIDTH      (  AXI4_ID_WIDTH       ),
	      .AXI4_USER_WIDTH    (  AXI4_USER_WIDTH     ),
	      .SRC_ID             (  SRC_ID              )
	)
	i_TGEN
	(
	      .ACLK     ( clk),
	      .ARESETn  ( rst_n),
	      
	      .AWVALID  ( axi_port_master.aw_valid ), 
	      .AWADDR   ( axi_port_master.aw_addr  ), 
	      .AWPROT   ( axi_port_master.aw_prot  ), 
	      .AWREGION ( axi_port_master.aw_region), 
	      .AWLEN    ( axi_port_master.aw_len   ), 
	      .AWSIZE   ( axi_port_master.aw_size  ), 
	      .AWBURST  ( axi_port_master.aw_burst ), 
	      .AWLOCK   ( axi_port_master.aw_lock  ), 
	      .AWCACHE  ( axi_port_master.aw_cache ), 
	      .AWQOS    ( axi_port_master.aw_qos   ), 
	      .AWID     ( axi_port_master.aw_id    ), 
	      .AWUSER   ( axi_port_master.aw_user  ), 
	      .AWREADY  ( axi_port_master.aw_ready ),
	      
	      .ARVALID  ( axi_port_master.ar_valid ), 
	      .ARADDR   ( axi_port_master.ar_addr  ), 
	      .ARPROT   ( axi_port_master.ar_prot  ), 
	      .ARREGION ( axi_port_master.ar_region), 
	      .ARLEN    ( axi_port_master.ar_len   ), 
	      .ARSIZE   ( axi_port_master.ar_size  ), 
	      .ARBURST  ( axi_port_master.ar_burst ), 
	      .ARLOCK   ( axi_port_master.ar_lock  ), 
	      .ARCACHE  ( axi_port_master.ar_cache ), 
	      .ARQOS    ( axi_port_master.ar_qos   ), 
	      .ARID     ( axi_port_master.ar_id    ), 
	      .ARUSER   ( axi_port_master.ar_user  ), 
	      .ARREADY  ( axi_port_master.ar_ready ),
	                  
	      .RVALID   ( axi_port_master.r_valid  ),
	      .RDATA    ( axi_port_master.r_data   ),
	      .RRESP    ( axi_port_master.r_resp   ), 
	      .RLAST    ( axi_port_master.r_last   ),
	      .RID      ( axi_port_master.r_id     ), 
	      .RUSER    ( axi_port_master.r_user   ), 
	      .RREADY   ( axi_port_master.r_ready  ),
	                  
	      .WVALID   ( axi_port_master.w_valid  ), 
	      .WDATA    ( axi_port_master.w_data   ), 
	      .WSTRB    ( axi_port_master.w_strb   ), 
	      .WLAST    ( axi_port_master.w_last   ), 
	      .WUSER    ( axi_port_master.w_user   ), 
	      .WREADY   ( axi_port_master.w_ready  ),
	                  
	      .BVALID   ( axi_port_master.b_valid  ), 
	      .BRESP    ( axi_port_master.b_resp   ), 
	      .BID      ( axi_port_master.b_id     ), 
	      .BUSER    ( axi_port_master.b_user   ),
	      .BREADY   ( axi_port_master.b_ready  ),
	      .eoc      ( eoc_o                    ),
	      .fetch_en ( fetch_en_i               ),
	      .PASS     ( PASS_o                   ),
	      .FAIL     ( FAIL_o                   )
	);

	
endmodule