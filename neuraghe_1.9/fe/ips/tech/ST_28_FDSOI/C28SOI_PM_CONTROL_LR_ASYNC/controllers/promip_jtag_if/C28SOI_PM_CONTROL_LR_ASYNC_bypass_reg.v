// -------=============================================================-------
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
// ---------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_bypass_reg.v
// Netlist version : 1.0
// Modified by     : N.MOUBDI
// Date            : July 9th 2007
// ---------------------------------------------------------------------------
// Purpose         : single-bit bypass register
// -------=============================================================-------

module C28SOI_PM_CONTROL_LR_ASYNC_bypass_reg (
   reg_tck, 
   reg_rst_n, 
   reg_tdi, 
   reg_shift_enable,
   reg_capture_en,
   reg_out);

   input reg_tck;
   input reg_rst_n;
   input reg_tdi;
   input reg_shift_enable;
   input reg_capture_en;   
   output reg_out;
    
//----------------------------
// Reg declaration
//----------------------------   
   reg reg_tdo;                   

//----------------------------
// Netlist Declaration
//----------------------------
assign reg_out = reg_tdo;
 
always @(negedge reg_rst_n or posedge reg_tck)
    begin
      if (reg_rst_n == 0) 
          reg_tdo <= 1'b0;
      else if(reg_capture_en == 1'b1)
          reg_tdo <= 1'b0; 	  
      else if(reg_shift_enable == 1'b1)
          reg_tdo <= reg_tdi; 
    end 

endmodule 
