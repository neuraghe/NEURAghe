//////////////////////////////////////////////////////////////////////
////                                                              ////
////  OR1200's IC RAMs                                            ////
////                                                              ////
////  This file is part of the OpenRISC 1200 project              ////
////  http://www.opencores.org/cores/or1k/                        ////
////                                                              ////
////  Description                                                 ////
////  Instantiation of Instruction cache data rams                ////
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
// CVS Revision History
//
// $Log: or1200_ic_ram.v,v $
// Revision 2.0  2010/06/30 11:00:00  ORSoC
// Minor update: 
// Coding style changed.
//

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "or1200_defines.v"

module or1200_ic_ram(
	// Clock and reset
	clk, rst, init_ni,

`ifdef OR1200_BIST
	// RAM BIST
	mbist_si_i, mbist_so_o, mbist_ctrl_i,
`endif

	// Internal i/f
	addr, en, we, datain, dataout_even, dataout_odd
);

parameter dw = `OR1200_OPERAND_WIDTH;
parameter aw = `OR1200_ICINDX;
parameter FLIPWELL = 0;
   
//
// I/O
//
input 				clk;
input				rst;
input 			        init_ni;
input	[aw-1:0]		addr;
input				en;
input	[3:0]			we;
input	[2*dw-1:0]		datain;
output	[dw-1:0]		dataout_even;
output	[dw-1:0]		dataout_odd;

`ifdef OR1200_BIST
//
// RAM BIST
//
input mbist_si_i;
input [`OR1200_MBIST_CTRL_WIDTH - 1:0] mbist_ctrl_i;
output mbist_so_o;
`endif

`ifdef OR1200_NO_IC

//
// Insn cache not implemented
//
assign dataout_even = {dw{1'b0}};
assign dataout_odd = {dw{1'b0}};
`ifdef OR1200_BIST
assign mbist_so_o = mbist_si_i;
`endif

`else

//
// Instantiation of IC RAM block
//
or1200_spram_128x32 
#(.FLIPWELL(FLIPWELL))
   ic_ram_even  
     (
      .clk(clk),
      .rst(rst),
      .init_ni(init_ni),
      .ce(en),
      .we(~we[0]),
      .addr(addr[aw-1:1]),
      .be(4'b1),
      .di(datain[31:0]),
      .oe(),
      .doq(dataout_even)
      );

or1200_spram_128x32 
#(.FLIPWELL(FLIPWELL))
ic_ram_odd
     (
      .clk(clk),
      .rst(rst),
      .init_ni(init_ni),
      .ce(en),
      .we(~we[0]),
      .addr(addr[aw-1:1]),
      .be(4'b1),
      .di(datain[63:32]),
      .oe(),
      .doq(dataout_odd)
      );

`endif

endmodule
