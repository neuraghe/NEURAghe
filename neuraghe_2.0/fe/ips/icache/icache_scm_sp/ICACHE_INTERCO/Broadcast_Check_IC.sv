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
// Create Date:    19/02/2013                                                 // 
// Design Name:    LOG_INTERCONNECT                                           // 
// Module Name:    Broadcast_Check                                            //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    This Block Compare the main address with all the address   //
//                 that are feed to the log interconnect. In case of Load,    //
//                 and one or more address matches, the response (in case     //
//                 one of them is the winner) is dispatched to all the        //
//                 master that have matched that address.                     //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created (19/02/2013 )                                 //
// Revision v0.2 - Address Checkin is limited to effective add bits           //
//                 (21/02/2013 )                                              //
// Revision v0.3 - 16/02/2015  - Improveved flexibility - configurability     //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "macro.v"
`include "icache_config.v"

module Broadcast_Check_IC
#(
   parameter   ADDR_WIDTH            = 32,
   parameter   DATA_WIDTH            = 32,
   parameter   N_MASTER              = 16,
   parameter   MULTICAST_GRANULARITY = 1,
   parameter   PORT_ID               = 0
)
(
   input  logic [N_MASTER-1:0][ADDR_WIDTH-1:0]         data_add_i,
   input  logic [N_MASTER-1:0]                         data_req_i,
   output logic [N_MASTER-1:0]                         match_o
`ifdef SUPPORT_BOTH_PRI_SH
   ,
   input  logic                                        disable_bcast_i
`endif
);
   localparam LOG2_MCAST_GRANULARITY = `log2(MULTICAST_GRANULARITY-1);
   genvar i;

   generate
       for(i=0; i<N_MASTER; i++)
       begin
            if(i != PORT_ID)
            begin
            `ifdef SUPPORT_BOTH_PRI_SH
                assign match_o[i] = (disable_bcast_i == 1'b1) ? 1'b0 : ( (data_add_i[PORT_ID][ADDR_WIDTH-1:`ADDR_OFFSET(DATA_WIDTH)+LOG2_MCAST_GRANULARITY] == data_add_i[i][ADDR_WIDTH-1:`ADDR_OFFSET(DATA_WIDTH)+LOG2_MCAST_GRANULARITY]) &&  (data_req_i[i] & data_req_i[PORT_ID]) ); 
            `else
                assign match_o[i] = ( (data_add_i[PORT_ID][ADDR_WIDTH-1:`ADDR_OFFSET(DATA_WIDTH)+LOG2_MCAST_GRANULARITY] == data_add_i[i][ADDR_WIDTH-1:`ADDR_OFFSET(DATA_WIDTH)+LOG2_MCAST_GRANULARITY]) &&  (data_req_i[i] & data_req_i[PORT_ID]) ); 
            `endif
            end
            else
            begin
                assign match_o[i] = data_req_i[i];
            end
       end
   endgenerate


endmodule