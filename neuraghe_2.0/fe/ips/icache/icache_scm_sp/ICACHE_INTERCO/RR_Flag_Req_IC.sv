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
// Create Date:    29/06/2011                                                 // 
// Design Name:    LOG_INTERCONNECT                                           // 
// Module Name:    RR_Flag_Req                                                //
// Project Name:   MegaLEON                                                   //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Round Robing FLAG generator for the arbitration trees.     //
//                 The values ( RR_FLAG_REQ ) is update only when request and //
//                 grant are high. This allow to avoid high sw activity when  //
//                 there is no valid traffic. Allows for clock gating         //
//                 insertion                                                  //
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

module RR_Flag_Req_IC
#(
      parameter WIDTH = 3
)
(
      input  logic                        clk,
      input  logic                        rst_n,
      output logic [WIDTH-1:0]            RR_FLAG_o,
      input  logic                        data_req_i,
      input  logic                        data_gnt_i
);

  
      always_ff @(posedge clk, negedge rst_n)
      begin : RR_Flag_Req_SEQ
              if(rst_n == 1'b0)
                  RR_FLAG_o <= '0;
              else
                if( data_req_i  & data_gnt_i )
                    RR_FLAG_o <= RR_FLAG_o + 1'b1;
      end

endmodule
