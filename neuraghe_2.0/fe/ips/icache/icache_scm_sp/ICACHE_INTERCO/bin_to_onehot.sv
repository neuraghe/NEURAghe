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
// Module Name:    bin_to_onehot                                              //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Convert Binary Number to OneHot                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created (19/02/2013 )                                 //
// Revision v0.2 - 16/02/2015  - Improveved flexibility - configurability     //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////


module bin_to_onehot (bin,onehot);

parameter BIN_WIDTH = 2;
parameter ONEHOT_WIDTH = 2**BIN_WIDTH;

input  logic [BIN_WIDTH-1:0] 		bin;
output logic [ONEHOT_WIDTH-1:0] 	onehot;





always_comb
begin
  onehot = '0;
  onehot[bin] = 1'b1;
end

endmodule