// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *)
module xilinx_tcdm_bank_2048x64(clka, rsta, ena, wea, addra, dina, douta, clkb, enb, web, 
  addrb, dinb, doutb);
  input clka;
  input rsta;
  input ena;
  input [7:0]wea;
  input [10:0]addra;
  input [63:0]dina;
  output [63:0]douta;
  input clkb;
  input enb;
  input [7:0]web;
  input [10:0]addrb;
  input [63:0]dinb;
  output [63:0]doutb;
endmodule
