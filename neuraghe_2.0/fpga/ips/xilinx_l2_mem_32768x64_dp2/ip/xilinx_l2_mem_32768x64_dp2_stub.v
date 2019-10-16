// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:48:31 MST 2014
// Date        : Mon Jul 31 10:23:19 2017
// Host        : eolab running 64-bit SUSE Linux Enterprise Server 12
// Command     : write_verilog -force -mode synth_stub
//               /home/gderiu/neuraghe_wei2ddr/fpga/ips/xilinx_l2_mem_32768x64_dp2/xilinx_l2_mem_32768x64_dp2.srcs/sources_1/ip/xilinx_l2_mem_32768x64_dp2/xilinx_l2_mem_32768x64_dp2_stub.v
// Design      : xilinx_l2_mem_32768x64_dp2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_2,Vivado 2014.4" *)
module xilinx_l2_mem_32768x64_dp2(clka, rsta, ena, wea, addra, dina, douta, clkb, rstb, enb, web, addrb, dinb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,rsta,ena,wea[7:0],addra[14:0],dina[63:0],douta[63:0],clkb,rstb,enb,web[3:0],addrb[15:0],dinb[31:0],doutb[31:0]" */;
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
  input [3:0]web;
  input [15:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
endmodule
