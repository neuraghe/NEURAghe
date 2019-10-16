//////////////////////////////////////////////////////////////////////
////                                                              ////
////  OR1200's Load/Store unit                                    ////
////                                                              ////
////  This file is part of the OpenRISC 1200 project              ////
////  http://opencores.org/project,or1k                           ////
////                                                              ////
////  Description                                                 ////
////  Interface between CPU and DC.                               ////
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
// $Log: or1200_lsu.v,v $
// Revision 2.0  2010/06/30 11:00:00  ORSoC
// Major update: 
// Structure reordered and bugs fixed. 
//

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "or1200_defines.v"

module or1200_lsu(
	// Clock and Reset
	clk, rst,

	// Internal i/f
	id_addrbase, ex_addrbase, id_addrofs, ex_addrofs, id_lsu_op, 
	lsu_datain, lsu_dataout, lsu_stall, lsu_datavalid,
	if_stall, du_stall, except_align, except_dtlbmiss, except_dmmufault, except_dbuserr,
	id_freeze, ex_freeze, flushpipe, rf_we_lsu,

	// External i/f to DC
	dcpu_adr_o, dcpu_cycstb_o, dcpu_we_o, dcpu_sel_o, dcpu_tag_o, dcpu_dat_o,
	dcpu_dat_i, dcpu_ack_i, dcpu_rty_i, dcpu_err_i, dcpu_tag_i
);

parameter dw = `OR1200_OPERAND_WIDTH;
parameter aw = `OR1200_REGFILE_ADDR_WIDTH;

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
input	[31:0]			id_addrbase;
input	[31:0]			ex_addrbase;
input	[31:0]			id_addrofs;
input	[31:0]			ex_addrofs;
input	[`OR1200_LSUOP_WIDTH-1:0] id_lsu_op;
input	[dw-1:0]		lsu_datain;
output	[dw-1:0]		lsu_dataout;
output				lsu_stall;
output				lsu_datavalid;
input                           if_stall;			
input                           du_stall;
output				except_align;
output				except_dtlbmiss;
output				except_dmmufault;
output				except_dbuserr;
input                           id_freeze;
input                           ex_freeze;
input                           flushpipe;
output 			        rf_we_lsu;

//
// External i/f to DC
//
output	[31:0]			dcpu_adr_o;
output				dcpu_cycstb_o;
output				dcpu_we_o;
output	[3:0]			dcpu_sel_o;
output	[3:0]			dcpu_tag_o;
output	[31:0]			dcpu_dat_o;
input	[31:0]			dcpu_dat_i;
input				dcpu_ack_i;
input				dcpu_rty_i;
input				dcpu_err_i;
input	[3:0]			dcpu_tag_i;

//
// Internal wires/regs
//
reg	[3:0]			dcpu_sel_o;
wire 				dcpu_we_o;
			

reg	[`OR1200_LSUOP_WIDTH-1:0] ex_lsu_op;
wire	[`OR1200_LSUEA_PRECALC:0] id_precalc_sum;
reg	[`OR1200_LSUEA_PRECALC:0] dcpu_adr_r;
reg				except_align;

reg 				dcpu_rty;

reg	[`OR1200_LSUOP_WIDTH-1:0] ex_lsu_op_d;
reg [1:0] 			  dcpu_adr_d;
reg 				  we_d;
				  
reg                               id_freeze_d;

wire				dcpu_cycstb_o;
wire				lsu_stall;
reg 				rf_we_lsu;
   
   
//
// ex_lsu_op
//
always @(posedge clk or `OR1200_RST_EVENT rst) begin
    if (rst == `OR1200_RST_VALUE)
        ex_lsu_op <=  `OR1200_LSUOP_NOP;
    else if (!ex_freeze & id_freeze | flushpipe)
        ex_lsu_op <=  `OR1200_LSUOP_NOP;
    else if (!ex_freeze)
        ex_lsu_op <=  id_lsu_op;
end

//
// Precalculate part of load/store EA in ID stage
//
assign id_precalc_sum = id_addrbase[`OR1200_LSUEA_PRECALC-1:0] +
                        id_addrofs[`OR1200_LSUEA_PRECALC-1:0];

always @(posedge clk or `OR1200_RST_EVENT rst) begin
    if (rst == `OR1200_RST_VALUE)
        dcpu_adr_r <=  {`OR1200_LSUEA_PRECALC+1{1'b0}};
    else if (!ex_freeze)
        dcpu_adr_r <=  id_precalc_sum;
end

//
// Generate except_align in ID stage
//
always @(posedge clk or `OR1200_RST_EVENT rst) begin
    if (rst == `OR1200_RST_VALUE)
        except_align <=  1'b0;
    else if (!ex_freeze & id_freeze | flushpipe)
        except_align <=  1'b0;
    else if (!ex_freeze)
        except_align <=  ((id_lsu_op == `OR1200_LSUOP_SH) |
                            (id_lsu_op == `OR1200_LSUOP_LHZ) |
                            (id_lsu_op == `OR1200_LSUOP_LHS)) & id_precalc_sum[0]
		        |  ((id_lsu_op == `OR1200_LSUOP_SW) |
		            (id_lsu_op == `OR1200_LSUOP_LWZ) |
		            (id_lsu_op == `OR1200_LSUOP_LWS)) & |id_precalc_sum[1:0];
end

//
// Internal I/F assignments
//
// stall if retry
assign lsu_stall = dcpu_rty_i;
// assign lsu datavalid only in case of load instruction
assign lsu_datavalid = (dcpu_ack_i & we_d) ? 1'b1 : 1'b0;

// not used
assign except_dtlbmiss = dcpu_err_i & (dcpu_tag_i == `OR1200_DTAG_TE);
assign except_dmmufault = dcpu_err_i & (dcpu_tag_i == `OR1200_DTAG_PE);
assign except_dbuserr = dcpu_err_i & (dcpu_tag_i == `OR1200_DTAG_BE);


// pipelined write back address and operation for load instructions(mem2reg aligner)
always @(posedge clk or `OR1200_RST_EVENT rst)
  if (rst == `OR1200_RST_VALUE) begin
     ex_lsu_op_d <= `OR1200_LSUOP_WIDTH'b0;
     dcpu_adr_d  <= 2'b0;
  end
  else begin
     ex_lsu_op_d <= ex_lsu_op;
     dcpu_adr_d  <= dcpu_adr_r[1:0];
  end

// pipelined write enable signal
always @(posedge clk or `OR1200_RST_EVENT rst) begin
   if (rst == `OR1200_RST_VALUE)
     we_d <= 1'b0;
   else
     we_d <= dcpu_we_o;
end
   
   
//
// External I/F assignments
//
// address of TCDM
assign dcpu_adr_o[31:`OR1200_LSUEA_PRECALC] = 
				   ex_addrbase[31:`OR1200_LSUEA_PRECALC] + 
				   (ex_addrofs[31:`OR1200_LSUEA_PRECALC] +
				    // carry from precalc, pad to 30-bits
				   {{(32-`OR1200_LSUEA_PRECALC)-1{1'b0}},
				    dcpu_adr_r[`OR1200_LSUEA_PRECALC]});
assign dcpu_adr_o[`OR1200_LSUEA_PRECALC-1:0] = dcpu_adr_r[`OR1200_LSUEA_PRECALC-1:0];
   
// pipelined freeze signal of id stage. If memory contention(lsu_stall) was the reason, dont freeze
always @(posedge clk or `OR1200_RST_EVENT rst)
  if (rst == `OR1200_RST_VALUE) begin
     id_freeze_d <= 1'b0;
  end
  else begin
     id_freeze_d <= id_freeze & ~lsu_stall;
  end

// request in case of a load/store operation
// dont send request if ex stage is stalled(id_freeze_d)
assign dcpu_cycstb_o = (id_freeze_d | du_stall | except_align ? 1'b0 : |ex_lsu_op);

// WE is only 0 in case of a store instruction
assign dcpu_we_o = id_freeze_d | ~ex_lsu_op[3];


// write enable signal for register file(active high)
// if request was sucessfull, write back to registerfile in the following cycle
always @(posedge clk or `OR1200_RST_EVENT rst)
  if (rst == `OR1200_RST_VALUE) begin
     rf_we_lsu <= 1'b0;
  end
  else begin
     rf_we_lsu <= dcpu_cycstb_o & ~lsu_stall & ~ex_lsu_op[3];
  end
  
// not used
assign dcpu_tag_o = dcpu_cycstb_o ? `OR1200_DTAG_ND : `OR1200_DTAG_IDLE;

always @(ex_lsu_op or dcpu_adr_o)
	casez({ex_lsu_op, dcpu_adr_o[1:0]})
		{`OR1200_LSUOP_SB, 2'b00} : dcpu_sel_o = 4'b1000;
		{`OR1200_LSUOP_SB, 2'b01} : dcpu_sel_o = 4'b0100;
		{`OR1200_LSUOP_SB, 2'b10} : dcpu_sel_o = 4'b0010;
		{`OR1200_LSUOP_SB, 2'b11} : dcpu_sel_o = 4'b0001;
		{`OR1200_LSUOP_SH, 2'b00} : dcpu_sel_o = 4'b1100;
		{`OR1200_LSUOP_SH, 2'b10} : dcpu_sel_o = 4'b0011;
		{`OR1200_LSUOP_SW, 2'b00} : dcpu_sel_o = 4'b1111;
		{`OR1200_LSUOP_LBZ, 2'b00}, {`OR1200_LSUOP_LBS, 2'b00} : dcpu_sel_o = 4'b1000;
		{`OR1200_LSUOP_LBZ, 2'b01}, {`OR1200_LSUOP_LBS, 2'b01} : dcpu_sel_o = 4'b0100;
		{`OR1200_LSUOP_LBZ, 2'b10}, {`OR1200_LSUOP_LBS, 2'b10} : dcpu_sel_o = 4'b0010;
		{`OR1200_LSUOP_LBZ, 2'b11}, {`OR1200_LSUOP_LBS, 2'b11} : dcpu_sel_o = 4'b0001;
		{`OR1200_LSUOP_LHZ, 2'b00}, {`OR1200_LSUOP_LHS, 2'b00} : dcpu_sel_o = 4'b1100;
		{`OR1200_LSUOP_LHZ, 2'b10}, {`OR1200_LSUOP_LHS, 2'b10} : dcpu_sel_o = 4'b0011;
		{`OR1200_LSUOP_LWZ, 2'b00}, {`OR1200_LSUOP_LWS, 2'b00} : dcpu_sel_o = 4'b1111;
		default : dcpu_sel_o = 4'b0000;
	endcase

//
// Instantiation of Memory-to-regfile aligner
//
or1200_mem2reg or1200_mem2reg(
	.addr(dcpu_adr_d),
	.lsu_op(ex_lsu_op_d),
	.memdata(dcpu_dat_i),
	.regdata(lsu_dataout)
);

//
// Instantiation of Regfile-to-memory aligner
//
or1200_reg2mem or1200_reg2mem(
        .addr(dcpu_adr_o[1:0]),
        .lsu_op(ex_lsu_op),
        .regdata(lsu_datain),
        .memdata(dcpu_dat_o)
);

endmodule
