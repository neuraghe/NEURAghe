// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:47:07 MST 2014
// Date        : Wed Jan  4 12:06:30 2017
// Host        : asus running 64-bit Linux Mint 17.1 Rebecca
// Command     : write_verilog -force -mode synth_stub
//               /home/gianfranco/xilinx_l2_mem_32768x64_dp/xilinx_l2_mem_32768x64_dp.srcs/sources_1/ip/xilinx_l2_mem_32768x64_dp/xilinx_l2_mem_32768x64_dp_stub.v
// Design      : xilinx_l2_mem_32768x64_dp
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_2,Vivado 2014.4" *)
module xilinx_l2_mem_32768x64_dp(clka, rsta, ena, wea, addra, dina, douta, clkb, rstb, enb, web, addrb, dinb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,rsta,ena,wea[7:0],addra[14:0],dina[63:0],douta[63:0],clkb,rstb,enb,web[7:0],addrb[14:0],dinb[63:0],doutb[63:0]" */;
  input clka;
  input rsta;
  input ena;
  input [7:0]wea;
  input [14:0]addra;
  input [63:0]dina;
  output [63:0]douta;
  input clkb;
  input rstb;
  input enb;
  input [7:0]web;
  input [14:0]addrb;
  input [63:0]dinb;
  output [63:0]doutb;
endmodule
