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
// Revision v0.3 - 16/02/2015  - Improveved flexibility - configurability     //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "macro.v"

module AddressDecoder_Req_IC
#(
      parameter ID_WIDTH	= 4,                            // ID WIDTH (number of bits) --> see ID comment
      parameter ID  		= 1,                            // ID routed with REQUEST used to backroute response
      parameter N_SLAVE 	= 4,                            // Number of CACHE BANKS
      parameter ROUT_WIDTH      = `log2(N_SLAVE-1)
) 
(
      // MASTER SIDE
      input  logic                              data_req_i,     // Request from Master COre
      input  logic [ROUT_WIDTH-1:0]             routing_addr_i, // routing information from Master Core
      output logic                              data_gnt_o,     // Grant delivered to Master Core	
      input  logic [N_SLAVE-1:0]                data_gnt_i,     // Grant Array: one for each memory (ARB TREE SIDE)

      output logic [N_SLAVE-1:0]                data_req_o,     // Request Array: one for each memory
      output logic [ID_WIDTH-1:0]               data_ID_o       // data_ID_o is sent whit the request (like a PID)
);
        localparam LOG_SLAVE  = `log2(N_SLAVE-1);

        assign data_ID_o      = ID; // ID is simply attached to the ID_OUT


        always_comb
        begin : Combinational_ADDR_DEC_REQ
            //DEFAULT VALUES
            data_req_o                 = '0;
            // Apply the rigth value
            data_req_o[routing_addr_i] = data_req_i;
            data_gnt_o                 = data_gnt_i[routing_addr_i];
        end
        
endmodule
