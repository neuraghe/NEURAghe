//////////////////////////////////////////////////////////////////////
////                                                              ////
////  OR1200's Embedded Memory                                    ////
////                                                              ////
////  This file is part of the OpenRISC 1200 project              ////
////  http://www.opencores.org/cores/or1k/                        ////
////                                                              ////
////  Description                                                 ////
////  Embedded Memory               .                             ////
////                                                              ////
////  To Do:                                                      ////
////   - QMEM and IC/DC muxes can be removed except for cycstb    ////
////     (now are is there for easier debugging)                  ////
////   - currently arbitration is slow and stores take 2 clocks   ////
////     (final debugged version will be faster)                  ////
////                                                              ////
////  Author(s):                                                  ////
////      - Damjan Lampret, lampret@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2003 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: or1200_qmem_top.v,v $
// Revision 2.0  2010/06/30 11:00:00  ORSoC
// Minor update: 
// Coding style changed.
//
// Revision 1.3  2004/06/08 18:17:36  lampret
// Non-functional changes. Coding style fixes.
//
// Revision 1.2  2004/04/05 08:40:26  lampret
// Merged branch_qmem into main tree.
//
// Revision 1.1.2.4  2004/01/11 22:45:46  andreje
// Separate instruction and data QMEM decoders, QMEM acknowledge and byte-select added
//
// Revision 1.1.2.3  2003/12/17 13:36:58  simons
// Qmem mbist signals fixed.
//
// Revision 1.1.2.2  2003/12/09 11:46:48  simons
// Mbist nameing changed, Artisan ram instance signal names fixed, some synthesis waning fixed.
//
// Revision 1.1.2.1  2003/07/08 15:45:26  lampret
// Added embedded memory QMEM.
//
//

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "or1200_defines.v"

//
// Embedded memory
//
module or1200_qmem_top(
	clk,
        rst,
	
	qmemdmmu_adr_i,
	qmemdmmu_cycstb_i,
	qmemdmmu_ci_i,
	qmemdcpu_we_i,
	qmemdcpu_sel_i,
	qmemdcpu_tag_i,
	qmemdcpu_dat_i,
	qmemdcpu_dat_o,
	qmemdcpu_ack_o,
	qmemdcpu_rty_o,
	qmemdmmu_err_o,
	qmemdmmu_tag_o,
        
	logint_req_o,
        logint_add_o,
        logint_type_o,
        logint_wdata_o,
        logint_be_o,
        logint_gnt_i,
        logint_r_valid_i,
	logint_r_opc_i,
        logint_r_rdata_i
);

parameter dw = `OR1200_OPERAND_WIDTH;

//
// I/O
//

//
// Clock and reset
//
input				clk;
input				rst;

//
// QMEM and CPU/DMMU
//
input	[31:0]			qmemdmmu_adr_i;
input				qmemdmmu_cycstb_i;
input				qmemdmmu_ci_i;
input				qmemdcpu_we_i;
input	[3:0]			qmemdcpu_sel_i;
input	[3:0]			qmemdcpu_tag_i;
input	[31:0]			qmemdcpu_dat_i;
output	[31:0]			qmemdcpu_dat_o;
output				qmemdcpu_ack_o;
output				qmemdcpu_rty_o;
output				qmemdmmu_err_o;
output	[3:0]			qmemdmmu_tag_o;

//
// LOGINT
//
output 			        logint_req_o;
output  [31:0]                  logint_add_o;
output                          logint_type_o;
output  [31:0]                  logint_wdata_o;
output  [3:0]                   logint_be_o;
input 			        logint_gnt_i;
input                           logint_r_valid_i;
input 			        logint_r_opc_i;
input   [31:0]                  logint_r_rdata_i;

//
// Internal regs and wires
//
reg				logint_dack;
reg 				rty;
reg [31:0] 			data_tmp;
   
`ifdef OR1200_QMEM_ACK
   wire 			logint_ack = logint_gnt_i;
`else
wire                            logint_ack = 1'b1;
`endif

//
// QMEM and CPU/DMMU
//
assign qmemdcpu_dat_o  = logint_r_rdata_i;
assign qmemdcpu_ack_o  = logint_r_valid_i;
assign qmemdcpu_rty_o  = rty;
assign qmemdmmu_err_o  = logint_r_opc_i;
assign qmemdmmu_tag_o  = 4'h0;
assign logint_be_o     = qmemdcpu_sel_i;
assign logint_req_o    = qmemdmmu_cycstb_i;
assign logint_type_o   = qmemdcpu_we_i;
assign logint_wdata_o  = qmemdcpu_dat_i;
assign logint_add_o    = qmemdmmu_adr_i;


//
// Retry if no acknoledge has been seen to the request
//
always @(qmemdmmu_cycstb_i, logint_ack) begin
   if (qmemdmmu_cycstb_i & ~logint_ack)
     rty <= 1'b1;
   else
     rty <= 1'b0;
end   

endmodule
