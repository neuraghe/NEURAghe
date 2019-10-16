// --=========================================================================--
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of STMicroelectronics
//
// -----------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_xor.v
// Netlist version : 1.0
// Date            : May 05 2009
// -----------------------------------------------------------------------------
// Purpose         : PROMIP Inverter
// --=========================================================================--

module C28SOI_PM_CONTROL_LR_ASYNC_xor (Z, A, S);
input A, S;
output Z;

assign Z = A && (~S) || (~A) && S ;

endmodule


