// -------=============================================================-------
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
// ---------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_idcode_reg.v
// Netlist version : 1.0
// Modified by     : N.MOUBDI
// Date            : July 9th 2007
// ---------------------------------------------------------------------------
// Purpose         : IDcode register
// -------=============================================================-------

module C28SOI_PM_CONTROL_LR_ASYNC_idcode_reg (
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
                    
  /*----------------------
    Parameters declaration
    ----------------------*/
    // IDCODE Register Length
    parameter IDCODE_LENGTH = 32;

    // Define IDCODE Value
    parameter IDCODE_VALUE = 32'hBA20A005;
    // 1011              zeo version          -> B
    // 0101001000001010  part number (IQ)     -> A20A Same as LiteB product
    // 00000000010       manufacturer id (ST) -> 005 (inc. required bit)
    // 1                 required by standard

//----------------------------
// Reg declaration
//----------------------------
    reg [IDCODE_LENGTH-1:0] idcode_q;
    wire reg_out;
//----------------------------
// Netlist Declaration
//----------------------------    
assign reg_out = idcode_q[0];

always @ (posedge reg_tck or negedge reg_rst_n)
    begin
      if (reg_rst_n == 0)
          idcode_q <= IDCODE_VALUE;
      else if(reg_capture_en == 1)
          idcode_q <= IDCODE_VALUE; 	  
      else if (reg_shift_enable == 1)
          idcode_q <= {reg_tdi,idcode_q[IDCODE_LENGTH-1:1]};
    end
    
endmodule    

