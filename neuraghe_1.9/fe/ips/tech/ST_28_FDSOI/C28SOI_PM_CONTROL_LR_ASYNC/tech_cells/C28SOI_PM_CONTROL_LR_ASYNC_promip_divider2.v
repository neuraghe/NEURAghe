// --====================================================================--
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
// ------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_promip_divider2.v
// Date            : Jun 30th 2009  
// ------------------------------------------------------------------------
// Purpose         : divide by 2 the frequency of the input signal
// --====================================================================--

module C28SOI_PM_CONTROL_LR_ASYNC_promip_divider2 (
   clk,
   rst_n,
   tm,
   counten,
   divider2_in,
   divider2_out);
   
   input  clk;
   input  rst_n;            
   input  tm;    
   input  counten;
   input  divider2_in;
   output divider2_out;    

//----------------------------
// Reg & wire declaration
//----------------------------
    reg divider_q;
    wire clk_int;

//----------------------------
// Netlist Declaration
//----------------------------
C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock I0_divider (.D0(divider2_in), .D1(clk), .sel(tm), .z(clk_int));
assign divider2_out = divider_q;

always @(negedge rst_n or posedge clk_int)
    begin
        if (!rst_n)
            divider_q <= 1'b0;
        else 
           if (counten)
              divider_q <=  !divider_q;
           else
              divider_q <=  divider_q;
    end
      
endmodule
