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
// Module Name:    AddressDecoder_Resp                                        //
// Project Name:   MegaLEON                                                   //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Address Decoder used to generate the individual requests   //
//                 for all the available masters . It routes the read data    //
//                 from the memory to the processor                           //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - Code Restyling (19/02/2015)                                //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "parameters.v"

module AddressDecoder_Resp_PE
#(
    parameter ID_WIDTH   = 20,                        // ID WIDTH (number of bits) --> see ID comment
    parameter N_MASTER   = 20                        // Number of Master
) 
(
    // FROM Test And Set Interface
    input  logic                         data_r_valid_i,
    input  logic [ID_WIDTH-1:0]          data_ID_i,

    // To Response Network
    output logic [N_MASTER-1:0]          data_r_valid_o
);

  assign data_r_valid_o = {ID_WIDTH{data_r_valid_i}} & data_ID_i; 

endmodule
