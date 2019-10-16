//////////////////////////////////////////////////////////////////////
////                                                              ////
////  OR1200's Write-back Mux                                     ////
////                                                              ////
////  This file is part of the OpenRISC 1200 project              ////
////  http://www.opencores.org/project,or1k                       ////
////                                                              ////
////  Description                                                 ////
////  CPU's write-back stage of the pipeline                      ////
////                                                              ////
////  To Do:                                                      ////
////   - make it smaller and faster                               ////
////                                                              ////
////  Author(s):                                                  ////
////      - Damjan Lampret, lampret@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
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
//
// $Log: or1200_wbmux.v,v $
// Revision 2.0  2010/06/30 11:00:00  ORSoC
// No update 

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "or1200_defines.v"

module or1200_wbmux(
	// Clock and reset
	clk, rst,

	// Internal i/f
	wb_freeze, rfwb_opa, rfwb_opb, rfwb_opc,
	muxin_a, muxin_b, muxin_c, muxin_d, muxin_e, muxin_f,
	muxout1, muxout2, muxout3, rf_we_mult
);

parameter width = `OR1200_OPERAND_WIDTH;

//
// I/O
//

//
// Clock and reset
//
input				clk;
input				rst;

//
// Internal i/f
//
input				wb_freeze;
input	[`OR1200_RFWBOP_WIDTH-1:0]	rfwb_opa;
input	[`OR1200_RFWBOP_WIDTH-1:0]	rfwb_opb;
input	[`OR1200_RFWBOP_WIDTH-1:0]	rfwb_opc;   
input	[width-1:0]		muxin_a;
input	[width-1:0]		muxin_b;
input	[width-1:0]		muxin_c;
input	[width-1:0]		muxin_d;
input	[width-1:0]		muxin_e;
input	[width-1:0]		muxin_f;   
output	[width-1:0]		muxout1;
output	[width-1:0]		muxout2;
output	[width-1:0]		muxout3;   
output 			        rf_we_mult;
   
   
//
// Internal wires and regs
//
reg	[width-1:0]		muxout1;
reg	[width-1:0]		muxout2;
reg     [width-1:0] 		muxout3;
reg 				rf_we_mult;

//
// Write-back multiplexer write port 2 / load instructions
//
always @(muxin_b or rfwb_opb) begin
   casez(rfwb_opb[`OR1200_RFWBOP_WIDTH-1:1])
     `OR1200_RFWBOP_LSU: begin
	muxout2 <= muxin_b;
`ifdef OR1200_VERBOSE
	// synopsys translate_off
	$display("  WBMUX2: muxin_b %h", muxin_b);
	// synopsys translate_on
`endif
     end
      default : begin
         muxout2 <= 0;
      end
    endcase // casez (rfwb_opb[`OR1200_RFWBOP_WIDTH-1:1])
 end // always @ (muxin_b or rfwb_opb)

//
// Write-back multiplexer write port 3 / multiplier result
//
always @(muxin_f or rfwb_opc) begin
   casez(rfwb_opc[`OR1200_RFWBOP_WIDTH-1:1])
     `OR1200_RFWBOP_MULT: begin
	muxout3 <= muxin_f;
	rf_we_mult <= 1'b1;
`ifdef OR1200_VERBOSE
	// synopsys translate_off
	$display("  WBMUX3: muxin_f %h", muxin_f);
	// synopsys translate_on
`endif
     end
      default : begin
	 muxout3 <= 0;
	 rf_we_mult <= 1'b0;
      end
    endcase // casez (rfwb_opc[`OR1200_RFWBOP_WIDTH-1:1])
 end // always @ (muxin_f or rfwb_opc)



 //
 // Write-back multiplexer write port 1 / normal alu instructions
 //
always @(muxin_a or muxin_c or muxin_d or muxin_e or rfwb_opa) begin
`ifdef OR1200_ADDITIONAL_SYNOPSYS_DIRECTIVES
   casez(rfwb_opa[`OR1200_RFWBOP_WIDTH-1:1]) // synopsys parallel_case infer_mux
`else
     casez(rfwb_opa[`OR1200_RFWBOP_WIDTH-1:1]) // synopsys parallel_case
`endif
       `OR1200_RFWBOP_ALU:
	 muxout1 = muxin_a;
       
       `OR1200_RFWBOP_SPRS: begin
	  muxout1 = muxin_c;
`ifdef OR1200_VERBOSE
	  // synopsys translate_off
	  $display("  WBMUX: muxin_c %h", muxin_c);
	  // synopsys translate_on
`endif
       end
       `OR1200_RFWBOP_LR: begin
	  muxout1 = muxin_d + 32'h8;
`ifdef OR1200_VERBOSE
	  // synopsys translate_off
	  $display("  WBMUX: muxin_d %h", muxin_d + 4'h8);
	  // synopsys translate_on
`endif
       end
`ifdef OR1200_FPU_IMPLEMENTED
       `OR1200_RFWBOP_FPU : begin
	  muxout1 = muxin_e;
 `ifdef OR1200_VERBOSE
	  // synopsys translate_off
	  $display("  WBMUX: muxin_e %h", muxin_e);
	  // synopsys translate_on
 `endif
       end
`endif
       default : begin
	  muxout1 = 0;
       end
       
     endcase
   end // always @ (muxin_a or muxin_c or muxin_d or muxin_e or rfwb_opa)
   
endmodule
