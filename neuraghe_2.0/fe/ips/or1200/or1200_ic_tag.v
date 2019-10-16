//////////////////////////////////////////////////////////////////////
////                                                              ////
////  OR1200's IC TAGs                                            ////
////                                                              ////
////  This file is part of the OpenRISC 1200 project              ////
////  http://www.opencores.org/cores/or1k/                        ////
////                                                              ////
////  Description                                                 ////
////  Instatiation of instruction cache tag rams                  ////
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
// $Log: or1200_ic_tag.v,v $
// Revision 2.0  2010/06/30 11:00:00  ORSoC
// Minor update: 
// Coding style changed.
//

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "or1200_defines.v"

module or1200_ic_tag(
	// Clock and reset
	clk, rst, init_ni,

`ifdef OR1200_BIST
	// RAM BIST
	mbist_si_i, mbist_so_o, mbist_ctrl_i,
`endif

	// Internal i/f
	addr, en, we, datain, tag_v, tag
);

parameter dw = `OR1200_ICTAG_W;
parameter aw = `OR1200_ICTAG;
parameter FLIPWELL = 0;
   
//
// I/O
//

//
// Clock and reset
//
input				clk;
input				rst;
input 			        init_ni;

`ifdef OR1200_BIST
//
// RAM BIST
//
input mbist_si_i;
input [`OR1200_MBIST_CTRL_WIDTH - 1:0] mbist_ctrl_i;
output mbist_so_o;
`endif

//
// Internal i/f
//
input	[aw-1:0]		addr;
input				en;
input				we;
input	[dw-1:0]		datain;
output				tag_v;
output	[dw-2:0]		tag;

`ifdef OR1200_ICTAG_FFRAM
`else
wire 			        we_odd;
wire 			        we_even;
wire [dw:0] 		        tag_even;
wire [dw:0] 		        tag_odd;   
reg 				sel;

`endif
   
	

`ifdef OR1200_NO_IC

//
// Insn cache not implemented
//
assign tag = {dw-1{1'b0}};
assign tag_v = 1'b0;
`ifdef OR1200_BIST
assign mbist_so_o = mbist_si_i;
`endif

`else

`ifdef OR1200_IC_TAG_FFRAM

   
   or1200_ic_tag_ffram #(.aw(aw), .dw(dw) ) ic_tag_i
     (
      .clk(clk),
      .rst(rst),
      .ce(en),
      .we(we),
      .addr(addr[aw-1:0]),
      .di(datain),
      .doq({tag,tag_v})
      );
   
   
`else

assign we_odd = addr[0] ? we : 1'b0;
assign we_even = !addr[0] ? we : 1'b0;

assign tag = sel ? tag_even[dw:2] : tag_odd[dw:2];
assign tag_v = sel ? tag_even[1] : tag_odd[1];
   
always @(posedge clk or `OR1200_RST_EVENT rst) begin
   if (rst == `OR1200_RST_VALUE)
     sel <= 1'b0;
   else
     sel <= !addr[0];
end
   
//
// Instantiation of TAG RAM block
//

or1200_spram_32x24 
#(.FLIPWELL(FLIPWELL))
ic_tag_even
     (
`ifdef OR1200_BIST
      // RAM BIST
      .mbist_si_i(mbist_si_i),
      .mbist_so_o(mbist_so_o),
      .mbist_ctrl_i(mbist_ctrl_i),
`endif
      .clk(clk),
      .rst(rst),
      .init_ni(init_ni),
      .ce(en),
      .we(we_even),
      //.oe(1'b1),
      .addr(addr[aw-1:1]),
      .di({datain, 1'b0}),
      .doq(tag_even),
      .oe(1'b0)
      );

or1200_spram_32x24 
#(.FLIPWELL(FLIPWELL))
ic_tag_odd
     (
`ifdef OR1200_BIST
      // RAM BIST
      .mbist_si_i(mbist_si_i),
      .mbist_so_o(mbist_so_o),
      .mbist_ctrl_i(mbist_ctrl_i),
`endif
      .clk(clk),
      .rst(rst),
      .init_ni(init_ni),
      .ce(en),
      .we(we_odd),
      //.oe(1'b1),
      .addr(addr[aw-1:1]),
      .di({datain, 1'b0}),
      .doq(tag_odd),
      .oe(1'b0)
      );
`endif
`endif
endmodule
