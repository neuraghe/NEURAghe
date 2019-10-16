////////////////////////////////////////////////////////////////////////////////
// Company:        ETH ZURICH                                                 //
//                                                                            //
// Engineer:       Michael Gautschi - gautschi@iis.ee.ethz.ch                 //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    28/11/2014                                                 // 
// Design Name:    OriscSharedFPU                                             // 
// Module Name:    l2_ram_4096x64                                             //
// Project Name:   OriscSharedFPU                                             //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Wrapper for the L2 memory                                  //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module l2_ram_4096x64
  (
   input logic 	       CLK,
   input logic 	       RSTN,
   input logic 	       INITN,
   
   input logic 	       CEN,
   input logic 	       WEN,
   input logic [11:0]  A,
   input logic [63:0]  D,
   input logic [7:0]   BE,
   output logic [63:0] Q,
   
   input logic	       TM
   
   );

   logic [7:0] 	       web;

   // WEN active low, BE active high
   // write when web=0. this is the case when WEN=0 and BE=1
   assign web[0] = WEN  || ~BE[0];
   assign web[1] = WEN  || ~BE[1];
   assign web[2] = WEN  || ~BE[2];
   assign web[3] = WEN  || ~BE[3];
   assign web[4] = WEN  || ~BE[4];
   assign web[5] = WEN  || ~BE[5];
   assign web[6] = WEN  || ~BE[6];
   assign web[7] = WEN  || ~BE[7];

   
   //********************************************************
   //****************** L2 MEMORY BANKS *********************
   //********************************************************
   SHKA65_8192X8X4CM16 cut_lo
     (
      .DO(Q[31:0]),
      .CK(CLK),
      .A({1'b0,A}),
      .DI(D[31:0]),
      .WEB(web[3:0]),
      .DVSE(1'b0),
      .DVS(3'b0),
      .CSB(CEN)
      );

   SHKA65_8192X8X4CM16 cut_hi
     (
      .DO(Q[63:32]),
      .CK(CLK),
      .A({1'b0,A}),
      .DI(D[63:32]),
      .WEB(web[7:4]),
      .DVSE(1'b0),
      .DVS(3'b0),
      .CSB(CEN)
      );

endmodule
