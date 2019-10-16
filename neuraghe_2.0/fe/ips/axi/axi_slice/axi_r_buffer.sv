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
// Design Name:    AXI 4 INTERCONNECT                                            //
// Module Name:    axi_r_buffer                                                  //
// Project Name:   PULP                                                          //
// Language:       SystemVerilog                                                 //
//                                                                               //
// Description:   master slice ( FIFO wrapper  ) for read channel                //
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

module axi_r_buffer
#(
   parameter ID_WIDTH      = 4,
   parameter DATA_WIDTH    = 64,
   parameter USER_WIDTH    = 6,
   parameter BUFFER_DEPTH  = 8,
   parameter STRB_WIDTH    = DATA_WIDTH/8   // DO NOT OVERRIDE
)
(
   input logic                   clk_i,
   input logic                   rst_ni,
   input logic                   test_en_i,

   input logic                   slave_valid_i,
   input logic  [DATA_WIDTH-1:0] slave_data_i,
   input logic  [1:0]            slave_resp_i,
   input logic  [USER_WIDTH-1:0] slave_user_i,
   input logic  [ID_WIDTH-1:0]   slave_id_i,
   input logic                   slave_last_i,
   output logic                  slave_ready_o,

   output logic                  master_valid_o,
   output logic [DATA_WIDTH-1:0] master_data_o,
   output logic [1:0]            master_resp_o,
   output logic [USER_WIDTH-1:0] master_user_o,
   output logic [ID_WIDTH-1:0]   master_id_o,
   output logic                  master_last_o,
   input  logic                  master_ready_i
);
   
   logic [2+DATA_WIDTH+USER_WIDTH+ID_WIDTH:0] s_data_in;
   logic [2+DATA_WIDTH+USER_WIDTH+ID_WIDTH:0] s_data_out;


   assign s_data_in =  {slave_id_i,  slave_user_i,  slave_data_i,  slave_resp_i,  slave_last_i};
   assign              {master_id_o, master_user_o, master_data_o, master_resp_o, master_last_o} = s_data_out;


   generic_fifo 
   #( 
      .DATA_WIDTH ( 3+DATA_WIDTH+USER_WIDTH+ID_WIDTH ),
      .DATA_DEPTH ( BUFFER_DEPTH                     )
   )
   buffer_i
   (
      .clk           ( clk_i           ),
      .rst_n         ( rst_ni          ),
      .data_i        ( s_data_in       ),
      .valid_i       ( slave_valid_i   ),
      .grant_o       ( slave_ready_o   ),
      .data_o        ( s_data_out      ),
      .valid_o       ( master_valid_o  ),
      .grant_i       ( master_ready_i  ),
      .test_mode_i   ( test_en_i       )
   );


endmodule
