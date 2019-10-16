// --=========================================================================--
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of STMicroelectronics
//
// -----------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_reset.v
// Netlist version : 3.1
// Date            : May 05 2009
// -----------------------------------------------------------------------------
// Purpose         : PROMIP Multiplexer(2 bus => 1 bus)
// --=========================================================================--

module C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_reset (D0, D1, sel, z);
input D0, D1;
input sel;
output z;
reg z;
   always @(D0, D1, sel) begin
      if (sel == 1'b1) 
         z = D1;
      else
         z = D0;
   end
endmodule

