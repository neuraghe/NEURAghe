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
// Create Date:    06/07/2011                                                 // 
// Design Name:    LOG_INTERCONNECT                                           // 
// Module Name:    AddressDecoder_Req                                         //
// Project Name:   MegaLEON                                                   //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Address Decoder used to generate the individual requests   //
//                 for all the available memory cuts. It backroutes the       //
//                 stalls from the Arbitration tree to the processor          //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - 06/07/2011 : File Created                                  //
//          v0.2 - 14/08/2012 : Changed the Routing mechanism, added dual     //
//                              Flow COntrol support (Grant or stall)         //
// Revision v0.1 -19/02/2015  : Code Restyling                                //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`define log2_non_zero(VALUE) ((VALUE) < ( 1 ) ? 1 : (VALUE) < ( 2 ) ? 1 : (VALUE) < ( 4 ) ? 2 : (VALUE)< (8) ? 3:(VALUE) < ( 16 )  ? 4 : (VALUE) < ( 32 )  ? 5 : (VALUE) < ( 64 )  ? 6 : (VALUE) < ( 128 ) ? 7 : (VALUE) < ( 256 ) ? 8 : (VALUE) < ( 512 ) ? 9 : 10)

module AddressDecoder_Req_SCM
#(
    parameter N_SLAVE       = 32,              // Number of Memory cuts
    parameter ROUT_WIDTH    = `log2_non_zero(N_SLAVE-1) //
) 
(
    // MASTER SIDE
    input  logic                                 data_req_i,      // Request from Master COre
    input  logic [ROUT_WIDTH-1:0]                routing_addr_i,  // routing information from Master Core
    output logic                                 data_gnt_o,      // Grant delivered to Master Core      
    
    input  logic [N_SLAVE-1:0]                   data_gnt_i,      // Grant Array: one for each memory (ARB TREE SIDE)
    output logic [N_SLAVE-1:0]                   data_req_o      // Request Array: one for each memory
);

    generate

        if(N_SLAVE == 1)
        begin :  SINGLE_SLAVE
            assign data_req_o[0] = data_req_i;
            assign data_gnt_o = data_gnt_i[0];
        end
        else 
        begin : MULTI_SLAVE

            always @(*)
            begin : Combinational_ADDR_DEC_REQ
                //DEFAULT VALUES
                data_req_o = '0;
                // Apply the rigth value
                data_req_o[routing_addr_i] = data_req_i;
                data_gnt_o = data_gnt_i[routing_addr_i];
            end

        end

    endgenerate
endmodule