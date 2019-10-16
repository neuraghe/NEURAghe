// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Mon Dec  3 16:49:41 2018
// Host        : eolab running 64-bit SUSE Linux Enterprise Server 12
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ xilinx_tcdm_bank_128x64_16x256_asym_stub.v
// Design      : xilinx_tcdm_bank_128x64_16x256_asym
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clka, ena, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[7:0],addra[9:0],dina[63:0],clkb,enb,addrb[7:0],doutb[255:0]" */;
  input clka;
  input ena;
  input [7:0]wea;
  input [9:0]addra;
  input [63:0]dina;
  input clkb;
  input enb;
  input [7:0]addrb;
  output [255:0]doutb;
endmodule
