
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
// Module Name:    ArbitrationTree                                            //
// Project Name:   MegaLEON                                                   //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Arbitration tree: This block performs the arbitration      //
//                 between the N_MASTER requests. The arbitration is          //
//                 distributed in the several arbitration primitives that     //
//                 compose this routing block. The arbistrtion is round robin //
//                 and the round robin flag generator is embedded inside this //
//                 block. Flag updating happens only when requests are grant  //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - (19/02/2015) Code Restyling                                //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`define log2_non_zero(VALUE) ((VALUE) < ( 1 ) ? 1 : (VALUE) < ( 2 ) ? 1 : (VALUE) < ( 4 ) ? 2 : (VALUE)< (8) ? 3:(VALUE) < ( 16 )  ? 4 : (VALUE) < ( 32 )  ? 5 : (VALUE) < ( 64 )  ? 6 : (VALUE) < ( 128 ) ? 7 : (VALUE) < ( 256 ) ? 8 : (VALUE) < ( 512 ) ? 9 : 10)

module ResponseBlock_SCM
#(
    parameter N_SLAVE       = 8,
    parameter ROUT_WIDTH    = `log2_non_zero(N_SLAVE-1)
)
(
    // -----------------------------------------------------------//
    //                      Request HANDLING
    // -----------------------------------------------------------//
    input logic                                  data_req_i,
    input logic [ROUT_WIDTH-1:0]                 routing_addr_i,
    output logic                                 data_gnt_o,

    input  logic [N_SLAVE-1:0]                   data_gnt_i,
    output logic [N_SLAVE-1:0]                   data_req_o
);



    AddressDecoder_Req_SCM 
    #(  
        .N_SLAVE    ( N_SLAVE  )
    )
    i_AddressDecoder_Req
    (
        // MASTER SIDE
        .data_req_i      ( data_req_i     ),            // Request from MASTER
        .routing_addr_i  ( routing_addr_i ),            // Address from MASTER
        .data_gnt_o      ( data_gnt_o     ),            // Grant delivered to MASTER


        .data_gnt_i      ( data_gnt_i     ),            // Grant Array: one for each memory (On ARB TREE SIDE)
        .data_req_o      ( data_req_o     )             // Request Array: one for each memory
    );


endmodule
