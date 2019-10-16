
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
// Module Name:    ResponseBlock                                              //
// Project Name:   MegaLEON                                                   //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    This Block performs a wrapper for the ResponseTree and the //
//                 address request decoder                                    //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - Added Dual FlowControl Support ( 14/08/2012 )              //
// Revision v0.3 - 16/02/2015  - Improveved flexibility - configurability     //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "macro.v"

module ResponseBlock_IC
#(
      parameter DATA_WIDTH              = 32,
      parameter ID                      = 1,
      parameter ID_WIDTH                = 20,
      parameter N_SLAVE                 = 32,
      parameter MULTICAST_FEATURE       = "DISABLED",
      parameter MULTICAST_GRANULARITY   = 1,
      parameter ROUT_WIDTH              = `log2(N_SLAVE-1)
)
(
    // ----------------------------------------------------------------------------------//
    //                      Response HANDLING
    // ----------------------------------------------------------------------------------//
    // Signals from Memory cuts
    
    input logic [N_SLAVE-1:0]                                               data_r_valid_i,
    input logic [N_SLAVE-1:0][MULTICAST_GRANULARITY-1:0][DATA_WIDTH-1:0]    data_r_rdata_i,

    input logic [N_SLAVE-1:0][ID_WIDTH-1:0]                                 data_r_ID_i,
    input logic [`log2_size(MULTICAST_GRANULARITY-1)-1:0]                   relative_bcast_chunk_i,


    // Output of the ResponseTree Block
    output logic                                                            data_r_valid_o,
    output logic [DATA_WIDTH-1:0]                                           data_r_rdata_o,
    output logic [ID_WIDTH-1:0]                                             data_r_ID_o,

    // ---------------------------------------------------------------------------- //
    //                      Request HANDLING
    // ---------------------------------------------------------------------------- //
    input logic                                                             data_req_i,
    input logic [ROUT_WIDTH-1:0]                                            routing_addr_i,

    output logic                                                            data_gnt_o,
    input  logic [N_SLAVE-1:0]                                              data_gnt_i,

    output logic [N_SLAVE-1:0]                                              data_req_o,
    output logic [ID_WIDTH-1:0]                                             data_ID_o
);

      genvar i;
      logic [N_SLAVE-1:0][DATA_WIDTH-1:0]                data_r_rdata_int;

      generate
        if(MULTICAST_FEATURE == "ENABLED")
        begin
              for(i=0; i<N_SLAVE; i++)
              begin : R_DATA_BCAST_MUX
                  if(MULTICAST_GRANULARITY == 1)
                  begin 
                    assign data_r_rdata_int[i] = data_r_rdata_i[i];
                  end
                  else
                  begin
                    assign data_r_rdata_int[i] = data_r_rdata_i[i][relative_bcast_chunk_i];
                  end
              end

              // Response Tree
              ResponseTree_IC #( .DATA_WIDTH(DATA_WIDTH), .N_SLAVE(N_SLAVE), .ID_WIDTH(ID_WIDTH) )  MEM_RESP_TREE
              (
                    // Response Input Channel
                    .data_r_valid_i(data_r_valid_i),
                    .data_r_rdata_i(data_r_rdata_int),
                    .data_r_ID_i(data_r_ID_i),
                    // Response Output Channel
                    .data_r_valid_o(data_r_valid_o),
                    .data_r_rdata_o(data_r_rdata_o),
                    .data_r_ID_o(data_r_ID_o)
              );

        end
        else
        begin
            // Response Tree
            ResponseTree_IC #( .DATA_WIDTH(DATA_WIDTH), .N_SLAVE(N_SLAVE), .ID_WIDTH(ID_WIDTH) )  MEM_RESP_TREE
            (
                  // Response Input Channel
                  .data_r_valid_i(data_r_valid_i),
                  .data_r_rdata_i(data_r_rdata_i),
                  .data_r_ID_i(data_r_ID_i),
                  // Response Output Channel
                  .data_r_valid_o(data_r_valid_o),
                  .data_r_rdata_o(data_r_rdata_o),
                  .data_r_ID_o(data_r_ID_o)
            );
        end
      endgenerate




      AddressDecoder_Req_IC #( .ID_WIDTH(ID_WIDTH), .ID(ID), .N_SLAVE(N_SLAVE) )  ADDR_DEC_REQ
      (
        // MASTER SIDE
        .data_req_i(data_req_i),                // Request from MASTER
        .routing_addr_i(routing_addr_i),        // Address from MASTER
        .data_gnt_o(data_gnt_o),                // Grant delivered to MASTER
        .data_gnt_i(data_gnt_i),                // Grant Array: one for each memory (On ARB TREE SIDE)

        // ARB TREE SIDE
        .data_req_o(data_req_o),                // Request Array: one for each memory
        .data_ID_o(data_ID_o)                        // ID is sent whit the request (like a PID)
      );


endmodule
