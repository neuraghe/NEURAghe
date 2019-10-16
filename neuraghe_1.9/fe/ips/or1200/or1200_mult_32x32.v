//////////////////////////////////////////////////////////////////////
////                                                              ////
////  32x32 multiplier                                            ////
////                                                              ////
////                                                              ////
////  Description                                                 ////
////  32x32 multiplier without pipeline stages.                   ////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// or1200_mult_32x32.v
// 
//

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "or1200_defines.v"

// 32x32 multiplier, no input/output registers

`ifdef OR1200_ONESTAGE_MULT_32X32

module or1200_mult_32x32 (X, Y, P);

   input   [31:0]  X;
   input [31:0]    Y;
   output [63:0]   P;
   integer 	   xi;
   integer 	   yi;
   
   //
   // Conversion unsigned to signed
   //
   always @(X)
     xi = X;
   
   //
   // Conversion unsigned to signed
   //
   always @(Y)
     yi = Y;

   //
   // Multiply stage
   //
   assign P = xi * yi;
   
endmodule

`endif
