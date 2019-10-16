
////////////////////////////////////////////////////////////////////////////////
// Company:        Micrel Lab @ DEIS - University of Bologna                  //  
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Igor Loi - igor.loi@unibo.it                               //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    02/07/2011                                                 // 
// Design Name:    LOG_INTERCONNECT                                           // 
// Module Name:    RequestBlock2CH                                            //
// Project Name:   MegaLEON                                                   //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Request Block: it embed inside the routing trees and the   //
//                 Multiplexer to mix the request from two channels (one      //
//                 distributed in the several arbitration primitives that     //
//                 compose this routing block. The arbistrtion is round robin //
//                 and the round robin flag generator is embedded inside this //
//                 block. Flag updating happens only when requests are grant  //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - Changes in the ADDRESS_WIDTH   ( 26/07/2011 )              //
// Revision v0.3 - Added Dual FlowControl Support ( 14/08/2012 )              //
// Revision v0.4 - Added read Broadcast feature   ( 19/02/2013 )              //
//                 Added Read Only Variant                                    //
// Revision v0.5 - 16/02/2015  - Improveved flexibility - configurability     //
// Revision v0.6 - 18/03/2015  - Fixed a synthax error                        //
//                                                                            //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "macro.v"

// FOR TWO INPUTS
module RequestBlock2CH_IC
#(
    parameter ADDR_MEM_WIDTH = 32,
    parameter N_CH0          = 4, // Example Number of ORION cores
    parameter N_CH1          = 2, // Example Number of OTHER IPs that fetch instruction from L2
    parameter ID_WIDTH       = N_CH0+N_CH1
)
(
    // INPUT CHANNELS CH0
    input  logic [N_CH0-1:0]                                  data_req_CH0_i,
    input  logic [N_CH0-1:0][ADDR_MEM_WIDTH-1:0]              data_add_CH0_i, 
    input  logic [N_CH0-1:0][ID_WIDTH-1:0]                    data_ID_CH0_i,
    output logic [N_CH0-1:0]                                  data_gnt_CH0_o,
    output logic [N_CH0-1:0]                                  data_r_valid_CH0_o,

    // INPUT CHANNELS CH1
    input  logic [N_CH1-1:0]                                  data_req_CH1_i,
    input  logic [N_CH1-1:0][ADDR_MEM_WIDTH-1:0]              data_add_CH1_i,
    input  logic [N_CH1-1:0][ID_WIDTH-1:0]                    data_ID_CH1_i,
    output logic [N_CH1-1:0]                                  data_gnt_CH1_o,
    output logic [N_CH1-1:0]                                  data_r_valid_CH1_o,

  // -----------------             TO CACHE BANK             -------------------
  // ---------------- RequestBlock OUTPUT (Connected to MEMORY) ----------------
  output logic                                                data_req_o,
  output logic [ADDR_MEM_WIDTH-1:0]                           data_add_o,
  output logic [ID_WIDTH-1:0]                                 data_ID_o,
  input  logic                                                data_gnt_i,
  input  logic                                                data_r_valid_i,
  input  logic [ID_WIDTH-1:0]                                 data_r_ID_i,

  input  logic                                                clk,
  input  logic                                                rst_n

);

         // OUT CHANNEL CH0 
        logic                                                     data_req_CH0;
        logic [ADDR_MEM_WIDTH-1:0]                                data_add_CH0;
        logic [ID_WIDTH-1:0]                                      data_ID_CH0;
        logic                                                     data_gnt_CH0;

        // OUT CHANNEL CH1 
        logic                                                     data_req_CH1;
        logic [ADDR_MEM_WIDTH-1:0]                                data_add_CH1;
        logic [ID_WIDTH-1:0]                                      data_ID_CH1;
        logic                                                     data_gnt_CH1;


      generate

          if(N_CH0 > 1)
          begin : CH0_ARB_TREE
              ArbitrationTree_IC #( .ADDR_WIDTH(ADDR_MEM_WIDTH), .ID_WIDTH(ID_WIDTH), .N_MASTER(N_CH0)) CH0_ARB_TREE
              (
                  .clk(clk),
                  .rst_n(rst_n),
                  // INPUTS
                  .data_req_i(data_req_CH0_i),
                  .data_add_i(data_add_CH0_i),
                  .data_ID_i(data_ID_CH0_i),
                  .data_gnt_o(data_gnt_CH0_o),

                  // OUTPUTS
                  .data_req_o(data_req_CH0),
                  .data_add_o(data_add_CH0),
                  .data_ID_o(data_ID_CH0),
                  .data_gnt_i(data_gnt_CH0)

            );
          end

          if(N_CH1 > 1)
          begin : CH1_ARB_TREE
              ArbitrationTree_IC #(.ADDR_WIDTH(ADDR_MEM_WIDTH), .ID_WIDTH(ID_WIDTH), .N_MASTER(N_CH1)) CH1_ARB_TREE
              (
                  .clk(clk),
                  .rst_n(rst_n),
                  // INPUTS
                  .data_req_i(data_req_CH1_i),
                  .data_add_i(data_add_CH1_i),
                  .data_ID_i(data_ID_CH1_i),
                  .data_gnt_o(data_gnt_CH1_o),

                  // OUTPUTS
                  .data_req_o(data_req_CH1),
                  .data_add_o(data_add_CH1),
                  .data_ID_o(data_ID_CH1),
                  .data_gnt_i(data_gnt_CH1)
            );
          end

          if(N_CH1 == 1)
          begin : MONO_CH1
            if(N_CH0 == 1)
                begin : MONO_CH0
                MUX2_REQ_IC #(.ID_WIDTH(ID_WIDTH), .ADDR_WIDTH(ADDR_MEM_WIDTH) ) MUX2_CH0_CH1
                (
                    // CH0 input
                    .data_req_CH0_i  ( data_req_CH0_i ),
                    .data_add_CH0_i  ( data_add_CH0_i ),
                    .data_ID_CH0_i   ( data_ID_CH0_i  ),
                    .data_gnt_CH0_o  ( data_gnt_CH0_o ),

                    // CH1 input
                    .data_req_CH1_i  ( data_req_CH1_i ),
                    .data_add_CH1_i  ( data_add_CH1_i ),
                    .data_ID_CH1_i   ( data_ID_CH1_i  ),
                    .data_gnt_CH1_o  ( data_gnt_CH1_o ),

                    // MUX output
                    .data_req_o      ( data_req_o     ),
                    .data_add_o      ( data_add_o     ),
                    .data_ID_o       ( data_ID_o      ),
                    .data_gnt_i      ( data_gnt_i     ),

                    .clk             ( clk            ),
                    .rst_n           ( rst_n          )
                );
                end // END MONO_CH0
            else
                  begin : POLY_CH0
                  MUX2_REQ_IC #( .ID_WIDTH(ID_WIDTH), .ADDR_WIDTH(ADDR_MEM_WIDTH) ) MUX2_CH0_CH1
                  (
                      // CH0 input
                      .data_req_CH0_i  ( data_req_CH0   ),
                      .data_add_CH0_i  ( data_add_CH0   ),

                      .data_ID_CH0_i   ( data_ID_CH0    ),
                      .data_gnt_CH0_o  ( data_gnt_CH0   ),

                      // CH1 input
                      .data_req_CH1_i  ( data_req_CH1_i ),
                      .data_add_CH1_i  ( data_add_CH1_i ),
                      .data_ID_CH1_i   ( data_ID_CH1_i  ),
                      .data_gnt_CH1_o  ( data_gnt_CH1_o ),

                      // MUX output
                      .data_req_o      ( data_req_o     ),
                      .data_add_o      ( data_add_o     ),
                      .data_ID_o       ( data_ID_o      ),
                      .data_gnt_i      ( data_gnt_i     ),

                      .clk             ( clk            ),
                      .rst_n           ( rst_n          )
                  );
                  end // END POLY_CH0
          end
          else
          begin : POLY_CH1
            if(N_CH0 == 1)
            begin : MONO_CH0
                MUX2_REQ_IC #(.ID_WIDTH(ID_WIDTH), .ADDR_WIDTH(ADDR_MEM_WIDTH ) ) MUX2_CH0_CH1
                (
                    // CH0 input
                    .data_req_CH0_i ( data_req_CH0_i ),
                    .data_add_CH0_i ( data_add_CH0_i ),
                    .data_ID_CH0_i  ( data_ID_CH0_i  ),
                    .data_gnt_CH0_o ( data_gnt_CH0_o ),

                    // CH1 input
                    .data_req_CH1_i ( data_req_CH1   ),
                    .data_add_CH1_i ( data_add_CH1   ),
                    .data_ID_CH1_i  ( data_ID_CH1    ),
                    .data_gnt_CH1_o ( data_gnt_CH1   ),

                    // MUX output
                    .data_req_o     ( data_req_o     ),
                    .data_add_o     ( data_add_o     ),
                    .data_ID_o      ( data_ID_o      ),
                    .data_gnt_i     ( data_gnt_i     ),

                    .clk(clk),
                    .rst_n(rst_n)
                );
            end
            else
            begin : POLY_CH0
                MUX2_REQ_IC #( .ID_WIDTH(ID_WIDTH), .ADDR_WIDTH(ADDR_MEM_WIDTH) ) MUX2_CH0_CH1
                (
                    // CH0 input
                    .data_req_CH0_i  ( data_req_CH0 ),
                    .data_add_CH0_i  ( data_add_CH0 ),
                    .data_ID_CH0_i   ( data_ID_CH0  ),
                    .data_gnt_CH0_o  ( data_gnt_CH0 ),

                    // CH1 input
                    .data_req_CH1_i  ( data_req_CH1 ),
                    .data_add_CH1_i  ( data_add_CH1 ),
                    .data_ID_CH1_i   ( data_ID_CH1  ),
                    .data_gnt_CH1_o  ( data_gnt_CH1 ),
                    // MUX output
                    .data_req_o      ( data_req_o   ),
                    .data_add_o      ( data_add_o   ),
                    .data_ID_o       ( data_ID_o    ),
                    .data_gnt_i      ( data_gnt_i   ),

                    .clk             ( clk          ),
                    .rst_n           ( rst_n        )
                );
            end
    end
    endgenerate

    AddressDecoder_Resp_IC #( .ID_WIDTH(ID_WIDTH), .N_MASTER(N_CH0+N_CH1)) ADDR_DEC_RESP
    (
        // FROM Test And Set Interface
        .data_r_valid_i  ( data_r_valid_i),
        .data_ID_i       ( data_r_ID_i),
        // To Response Network
        .data_r_valid_o ({ data_r_valid_CH1_o,data_r_valid_CH0_o} )
    );


endmodule
