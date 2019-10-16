// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:48:31 MST 2014
// Date        : Thu Jul 27 12:18:06 2017
// Host        : eolab running 64-bit SUSE Linux Enterprise Server 12
// Command     : write_verilog -force -mode synth_stub
//               /home/gderiu/xilinx_tcdm_bank_16x32/xilinx_tcdm_bank_16x32.srcs/sources_1/ip/xilinx_tcdm_bank_16x32/xilinx_tcdm_bank_16x32_stub.v
// Design      : xilinx_tcdm_bank_16x32
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_2,Vivado 2014.4" *)
module xilinx_tcdm_bank_16x32(clka, rsta, ena, wea, addra, dina, douta, clkb, enb, web, addrb, dinb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,rsta,ena,wea[3:0],addra[12:0],dina[31:0],douta[31:0],clkb,enb,web[3:0],addrb[12:0],dinb[31:0],doutb[31:0]" */;
  input clka;
  input rsta;
  input ena;
  input [3:0]wea;
  input [12:0]addra;
  input [31:0]dina;
  output [31:0]douta;
  input clkb;
  input enb;
  input [3:0]web;
  input [12:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
endmodule
