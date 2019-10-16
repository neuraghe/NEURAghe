// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:47:07 MST 2014
// Date        : Fri Jan 15 09:14:26 2016
// Host        : asus running 64-bit Linux Mint 17.1 Rebecca
// Command     : write_verilog -force -mode synth_stub
//               /home/gianfranco/pulp/pulp4/fpga/ips/xilinx_icache_bank_tag_16x8/xilinx_icache_bank_tag_16x8.srcs/sources_1/ip/xilinx_icache_bank_tag_16x8/xilinx_icache_bank_tag_16x8_stub.v
// Design      : xilinx_icache_bank_tag_16x8
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_2,Vivado 2014.4" *)
module xilinx_icache_bank_tag_16x8(clka, rsta, ena, wea, addra, dina, douta, clkb, enb, web, addrb, dinb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,rsta,ena,wea[0:0],addra[3:0],dina[7:0],douta[7:0],clkb,enb,web[0:0],addrb[3:0],dinb[7:0],doutb[7:0]" */;
  input clka;
  input rsta;
  input ena;
  input [0:0]wea;
  input [3:0]addra;
  input [7:0]dina;
  output [7:0]douta;
  input clkb;
  input enb;
  input [0:0]web;
  input [3:0]addrb;
  input [7:0]dinb;
  output [7:0]doutb;
endmodule
