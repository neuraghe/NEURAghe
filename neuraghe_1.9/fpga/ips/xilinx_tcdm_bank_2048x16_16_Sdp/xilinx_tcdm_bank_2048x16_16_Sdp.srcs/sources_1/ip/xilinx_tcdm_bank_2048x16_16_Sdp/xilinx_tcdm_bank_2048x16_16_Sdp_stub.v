// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Sun Dec 30 19:18:27 2018
// Host        : eolab running 64-bit SUSE Linux Enterprise Server 12
// Command     : write_verilog -force -mode synth_stub
//               /home/gderiu/marco/neuraghe_zc706_8_16_runtime_dma2d_lenhack/fpga/ips/xilinx_tcdm_bank_2048x16_16_Sdp/xilinx_tcdm_bank_2048x16_16_Sdp.srcs/sources_1/ip/xilinx_tcdm_bank_2048x16_16_Sdp/xilinx_tcdm_bank_2048x16_16_Sdp_stub.v
// Design      : xilinx_tcdm_bank_2048x16_16_Sdp
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *)
module xilinx_tcdm_bank_2048x16_16_Sdp(clka, ena, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[1:0],addra[10:0],dina[15:0],clkb,enb,addrb[10:0],doutb[15:0]" */;
  input clka;
  input ena;
  input [1:0]wea;
  input [10:0]addra;
  input [15:0]dina;
  input clkb;
  input enb;
  input [10:0]addrb;
  output [15:0]doutb;
endmodule
