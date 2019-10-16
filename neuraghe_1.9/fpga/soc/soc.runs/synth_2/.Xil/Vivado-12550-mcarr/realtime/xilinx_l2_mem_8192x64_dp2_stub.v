// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *)
module xilinx_l2_mem_8192x64_dp2(clka, rsta, ena, wea, addra, dina, douta, clkb, rstb, enb, 
  web, addrb, dinb, doutb);
  input clka;
  input rsta;
  input ena;
  input [7:0]wea;
  input [12:0]addra;
  input [63:0]dina;
  output [63:0]douta;
  input clkb;
  input rstb;
  input enb;
  input [3:0]web;
  input [13:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
endmodule
