// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_3,Vivado 2016.2" *)
module xilinx_tcdm_bank_4096x64_asym(clka, rsta, ena, wea, addra, dina, douta, clkb, enb, web, addrb, dinb, doutb);
  input clka;
  input rsta;
  input ena;
  input [7:0]wea;
  input [11:0]addra;
  input [63:0]dina;
  output [63:0]douta;
  input clkb;
  input enb;
  input [3:0]web;
  input [12:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
endmodule
