// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
// Date        : Wed Apr  4 17:31:27 2018
// Host        : eolab running 64-bit SUSE Linux Enterprise Server 12
// Command     : write_verilog -force -mode funcsim
//               /home/gderiu/marco/neuraghe_zc706_8bit_70140/pulp_on_zynq/pulp_on_zynq.srcs/sources_1/ip/axi_bram_ctrl_0/axi_bram_ctrl_0_sim_netlist.v
// Design      : axi_bram_ctrl_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "axi_bram_ctrl_0,axi_bram_ctrl,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axi_bram_ctrl,Vivado 2017.1" *) 
(* NotValidForBitStream *)
module axi_bram_ctrl_0
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    bram_rst_a,
    bram_clk_a,
    bram_en_a,
    bram_we_a,
    bram_addr_a,
    bram_wrdata_a,
    bram_rddata_a,
    bram_rst_b,
    bram_clk_b,
    bram_en_b,
    bram_we_b,
    bram_addr_b,
    bram_wrdata_b,
    bram_rddata_b);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLKIF CLK" *) input s_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RSTIF RST" *) input s_axi_aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) input [15:0]s_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *) input [7:0]s_axi_awlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *) input [2:0]s_axi_awsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *) input [1:0]s_axi_awburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *) input s_axi_awlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *) input [3:0]s_axi_awcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]s_axi_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [63:0]s_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [7:0]s_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *) input s_axi_wlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [15:0]s_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *) input [7:0]s_axi_arlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *) input [2:0]s_axi_arsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *) input [1:0]s_axi_arburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *) input s_axi_arlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *) input [3:0]s_axi_arcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]s_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [63:0]s_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *) output s_axi_rlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) output bram_rst_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) output bram_clk_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) output bram_en_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) output [7:0]bram_we_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) output [15:0]bram_addr_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) output [63:0]bram_wrdata_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) input [63:0]bram_rddata_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) output bram_rst_b;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) output bram_clk_b;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) output bram_en_b;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) output [7:0]bram_we_b;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) output [15:0]bram_addr_b;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) output [63:0]bram_wrdata_b;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) input [63:0]bram_rddata_b;

  wire [15:0]bram_addr_a;
  wire [15:0]bram_addr_b;
  wire bram_clk_a;
  wire bram_clk_b;
  wire bram_en_a;
  wire bram_en_b;
  wire [63:0]bram_rddata_a;
  wire [63:0]bram_rddata_b;
  wire bram_rst_a;
  wire bram_rst_b;
  wire [7:0]bram_we_a;
  wire [7:0]bram_we_b;
  wire [63:0]bram_wrdata_a;
  wire [63:0]bram_wrdata_b;
  wire s_axi_aclk;
  wire [15:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire s_axi_aresetn;
  wire [7:0]s_axi_arlen;
  wire s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [15:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [7:0]s_axi_awlen;
  wire s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [63:0]s_axi_rdata;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire NLW_U0_ecc_interrupt_UNCONNECTED;
  wire NLW_U0_ecc_ue_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_arready_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_awready_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_wready_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_ctrl_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_ctrl_rdata_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_ctrl_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;

  (* C_BRAM_ADDR_WIDTH = "13" *) 
  (* C_BRAM_INST_MODE = "EXTERNAL" *) 
  (* C_ECC = "0" *) 
  (* C_ECC_ONOFF_RESET_VALUE = "0" *) 
  (* C_ECC_TYPE = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_FAULT_INJECT = "0" *) 
  (* C_MEMORY_DEPTH = "8192" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SINGLE_PORT_BRAM = "0" *) 
  (* C_S_AXI_ADDR_WIDTH = "16" *) 
  (* C_S_AXI_CTRL_ADDR_WIDTH = "32" *) 
  (* C_S_AXI_CTRL_DATA_WIDTH = "32" *) 
  (* C_S_AXI_DATA_WIDTH = "64" *) 
  (* C_S_AXI_ID_WIDTH = "1" *) 
  (* C_S_AXI_PROTOCOL = "AXI4" *) 
  (* C_S_AXI_SUPPORTS_NARROW_BURST = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  axi_bram_ctrl_0_axi_bram_ctrl U0
       (.bram_addr_a(bram_addr_a),
        .bram_addr_b(bram_addr_b),
        .bram_clk_a(bram_clk_a),
        .bram_clk_b(bram_clk_b),
        .bram_en_a(bram_en_a),
        .bram_en_b(bram_en_b),
        .bram_rddata_a(bram_rddata_a),
        .bram_rddata_b(bram_rddata_b),
        .bram_rst_a(bram_rst_a),
        .bram_rst_b(bram_rst_b),
        .bram_we_a(bram_we_a),
        .bram_we_b(bram_we_b),
        .bram_wrdata_a(bram_wrdata_a),
        .bram_wrdata_b(bram_wrdata_b),
        .ecc_interrupt(NLW_U0_ecc_interrupt_UNCONNECTED),
        .ecc_ue(NLW_U0_ecc_ue_UNCONNECTED),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arid(1'b0),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awid(1'b0),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_ctrl_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_arready(NLW_U0_s_axi_ctrl_arready_UNCONNECTED),
        .s_axi_ctrl_arvalid(1'b0),
        .s_axi_ctrl_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_awready(NLW_U0_s_axi_ctrl_awready_UNCONNECTED),
        .s_axi_ctrl_awvalid(1'b0),
        .s_axi_ctrl_bready(1'b0),
        .s_axi_ctrl_bresp(NLW_U0_s_axi_ctrl_bresp_UNCONNECTED[1:0]),
        .s_axi_ctrl_bvalid(NLW_U0_s_axi_ctrl_bvalid_UNCONNECTED),
        .s_axi_ctrl_rdata(NLW_U0_s_axi_ctrl_rdata_UNCONNECTED[31:0]),
        .s_axi_ctrl_rready(1'b0),
        .s_axi_ctrl_rresp(NLW_U0_s_axi_ctrl_rresp_UNCONNECTED[1:0]),
        .s_axi_ctrl_rvalid(NLW_U0_s_axi_ctrl_rvalid_UNCONNECTED),
        .s_axi_ctrl_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_wready(NLW_U0_s_axi_ctrl_wready_UNCONNECTED),
        .s_axi_ctrl_wvalid(1'b0),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "SRL_FIFO" *) 
module axi_bram_ctrl_0_SRL_FIFO
   (bid_gets_fifo_load_d1_reg,
    bid_gets_fifo_load_d1_reg_0,
    \GEN_AW_DUAL.wr_addr_sm_cs_reg ,
    bid_gets_fifo_load,
    bid_gets_fifo_load_d1_reg_1,
    bvalid_cnt_inc,
    axi_wdata_full_cmb115_out,
    bvalid_cnt_inc11_out,
    \axi_bid_int_reg[0] ,
    s_axi_aresetn,
    s_axi_aclk,
    wr_addr_sm_cs,
    last_data_ack_mod,
    \GEN_AWREADY.axi_aresetn_d2_reg ,
    \bvalid_cnt_reg[2] ,
    bid_gets_fifo_load_d1,
    s_axi_bready,
    axi_bvalid_int_reg,
    bvalid_cnt,
    axi_wr_burst,
    axi_awaddr_full,
    aw_active,
    s_axi_awvalid,
    s_axi_awready,
    curr_awlen_reg_1_or_2,
    axi_awlen_pipe_1_or_2,
    \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg ,
    s_axi_wvalid,
    s_axi_wlast,
    axi_awid_pipe,
    s_axi_awid,
    s_axi_bid,
    out);
  output bid_gets_fifo_load_d1_reg;
  output bid_gets_fifo_load_d1_reg_0;
  output \GEN_AW_DUAL.wr_addr_sm_cs_reg ;
  output bid_gets_fifo_load;
  output bid_gets_fifo_load_d1_reg_1;
  output bvalid_cnt_inc;
  output axi_wdata_full_cmb115_out;
  output bvalid_cnt_inc11_out;
  output \axi_bid_int_reg[0] ;
  input s_axi_aresetn;
  input s_axi_aclk;
  input wr_addr_sm_cs;
  input last_data_ack_mod;
  input \GEN_AWREADY.axi_aresetn_d2_reg ;
  input \bvalid_cnt_reg[2] ;
  input bid_gets_fifo_load_d1;
  input s_axi_bready;
  input axi_bvalid_int_reg;
  input [2:0]bvalid_cnt;
  input axi_wr_burst;
  input axi_awaddr_full;
  input aw_active;
  input s_axi_awvalid;
  input s_axi_awready;
  input curr_awlen_reg_1_or_2;
  input axi_awlen_pipe_1_or_2;
  input \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg ;
  input s_axi_wvalid;
  input s_axi_wlast;
  input axi_awid_pipe;
  input [0:0]s_axi_awid;
  input [0:0]s_axi_bid;
  input [2:0]out;

  wire \Addr_Counters[0].FDRE_I_n_0 ;
  wire \Addr_Counters[1].FDRE_I_n_0 ;
  wire \Addr_Counters[2].FDRE_I_n_0 ;
  wire \Addr_Counters[3].FDRE_I_n_0 ;
  wire \Addr_Counters[3].XORCY_I_i_1_n_0 ;
  wire CI;
  wire D;
  wire Data_Exists_DFF_i_2_n_0;
  wire Data_Exists_DFF_i_3_n_0;
  wire \GEN_AWREADY.axi_aresetn_d2_reg ;
  wire \GEN_AWREADY.axi_awready_int_i_5_n_0 ;
  wire \GEN_AW_DUAL.wr_addr_sm_cs_reg ;
  wire \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg ;
  wire S;
  wire S0_out;
  wire S1_out;
  wire addr_cy_1;
  wire addr_cy_2;
  wire addr_cy_3;
  wire aw_active;
  wire axi_awaddr_full;
  wire axi_awid_pipe;
  wire axi_awlen_pipe_1_or_2;
  wire \axi_bid_int[0]_i_2_n_0 ;
  wire \axi_bid_int_reg[0] ;
  wire axi_bvalid_int_reg;
  wire axi_wdata_full_cmb115_out;
  wire axi_wr_burst;
  wire bid_fifo_ld;
  wire bid_fifo_not_empty;
  wire bid_fifo_rd;
  wire bid_gets_fifo_load;
  wire bid_gets_fifo_load_d1;
  wire bid_gets_fifo_load_d1_i_3_n_0;
  wire bid_gets_fifo_load_d1_reg;
  wire bid_gets_fifo_load_d1_reg_0;
  wire bid_gets_fifo_load_d1_reg_1;
  wire [2:0]bvalid_cnt;
  wire bvalid_cnt_inc;
  wire bvalid_cnt_inc11_out;
  wire \bvalid_cnt_reg[2] ;
  wire clr_bram_we_cmb6_out;
  wire curr_awlen_reg_1_or_2;
  wire last_data_ack_mod;
  wire [2:0]out;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [0:0]s_axi_awid;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_wlast;
  wire s_axi_wvalid;
  wire sum_A_0;
  wire sum_A_1;
  wire sum_A_2;
  wire sum_A_3;
  wire wr_addr_sm_cs;
  wire [3:3]\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_DI_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \Addr_Counters[0].FDRE_I 
       (.C(s_axi_aclk),
        .CE(bid_fifo_not_empty),
        .D(sum_A_3),
        .Q(\Addr_Counters[0].FDRE_I_n_0 ),
        .R(s_axi_aresetn));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
  CARRY4 \Addr_Counters[0].MUXCY_L_I_CARRY4 
       (.CI(1'b0),
        .CO({\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CO_UNCONNECTED [3],addr_cy_1,addr_cy_2,addr_cy_3}),
        .CYINIT(CI),
        .DI({\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_DI_UNCONNECTED [3],\Addr_Counters[2].FDRE_I_n_0 ,\Addr_Counters[1].FDRE_I_n_0 ,\Addr_Counters[0].FDRE_I_n_0 }),
        .O({sum_A_0,sum_A_1,sum_A_2,sum_A_3}),
        .S({\Addr_Counters[3].XORCY_I_i_1_n_0 ,S0_out,S1_out,S}));
  LUT6 #(
    .INIT(64'h0000FFFFFFFD0000)) 
    \Addr_Counters[0].MUXCY_L_I_i_1 
       (.I0(bid_gets_fifo_load_d1_reg),
        .I1(\Addr_Counters[1].FDRE_I_n_0 ),
        .I2(\Addr_Counters[3].FDRE_I_n_0 ),
        .I3(\Addr_Counters[2].FDRE_I_n_0 ),
        .I4(\axi_bid_int[0]_i_2_n_0 ),
        .I5(\Addr_Counters[0].FDRE_I_n_0 ),
        .O(S));
  LUT6 #(
    .INIT(64'h4555555555555555)) 
    \Addr_Counters[0].MUXCY_L_I_i_2 
       (.I0(bid_gets_fifo_load_d1_reg),
        .I1(\axi_bid_int[0]_i_2_n_0 ),
        .I2(\Addr_Counters[0].FDRE_I_n_0 ),
        .I3(\Addr_Counters[1].FDRE_I_n_0 ),
        .I4(\Addr_Counters[3].FDRE_I_n_0 ),
        .I5(\Addr_Counters[2].FDRE_I_n_0 ),
        .O(CI));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \Addr_Counters[1].FDRE_I 
       (.C(s_axi_aclk),
        .CE(bid_fifo_not_empty),
        .D(sum_A_2),
        .Q(\Addr_Counters[1].FDRE_I_n_0 ),
        .R(s_axi_aresetn));
  LUT6 #(
    .INIT(64'h0000FFFFFFFD0000)) 
    \Addr_Counters[1].MUXCY_L_I_i_1 
       (.I0(bid_gets_fifo_load_d1_reg),
        .I1(\Addr_Counters[0].FDRE_I_n_0 ),
        .I2(\Addr_Counters[3].FDRE_I_n_0 ),
        .I3(\Addr_Counters[2].FDRE_I_n_0 ),
        .I4(\axi_bid_int[0]_i_2_n_0 ),
        .I5(\Addr_Counters[1].FDRE_I_n_0 ),
        .O(S1_out));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \Addr_Counters[2].FDRE_I 
       (.C(s_axi_aclk),
        .CE(bid_fifo_not_empty),
        .D(sum_A_1),
        .Q(\Addr_Counters[2].FDRE_I_n_0 ),
        .R(s_axi_aresetn));
  LUT6 #(
    .INIT(64'h0000FFFFFFFD0000)) 
    \Addr_Counters[2].MUXCY_L_I_i_1 
       (.I0(bid_gets_fifo_load_d1_reg),
        .I1(\Addr_Counters[0].FDRE_I_n_0 ),
        .I2(\Addr_Counters[1].FDRE_I_n_0 ),
        .I3(\Addr_Counters[3].FDRE_I_n_0 ),
        .I4(\axi_bid_int[0]_i_2_n_0 ),
        .I5(\Addr_Counters[2].FDRE_I_n_0 ),
        .O(S0_out));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \Addr_Counters[3].FDRE_I 
       (.C(s_axi_aclk),
        .CE(bid_fifo_not_empty),
        .D(sum_A_0),
        .Q(\Addr_Counters[3].FDRE_I_n_0 ),
        .R(s_axi_aresetn));
  LUT6 #(
    .INIT(64'h0000FFFFFFFD0000)) 
    \Addr_Counters[3].XORCY_I_i_1 
       (.I0(bid_gets_fifo_load_d1_reg),
        .I1(\Addr_Counters[0].FDRE_I_n_0 ),
        .I2(\Addr_Counters[1].FDRE_I_n_0 ),
        .I3(\Addr_Counters[2].FDRE_I_n_0 ),
        .I4(\axi_bid_int[0]_i_2_n_0 ),
        .I5(\Addr_Counters[3].FDRE_I_n_0 ),
        .O(\Addr_Counters[3].XORCY_I_i_1_n_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    Data_Exists_DFF
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D),
        .Q(bid_fifo_not_empty),
        .R(s_axi_aresetn));
  LUT4 #(
    .INIT(16'hFD05)) 
    Data_Exists_DFF_i_1
       (.I0(bid_gets_fifo_load_d1_reg),
        .I1(Data_Exists_DFF_i_2_n_0),
        .I2(Data_Exists_DFF_i_3_n_0),
        .I3(bid_fifo_not_empty),
        .O(D));
  LUT6 #(
    .INIT(64'h000000000000FFFD)) 
    Data_Exists_DFF_i_2
       (.I0(bvalid_cnt_inc),
        .I1(bvalid_cnt[2]),
        .I2(bvalid_cnt[1]),
        .I3(bvalid_cnt[0]),
        .I4(bid_gets_fifo_load_d1_reg_1),
        .I5(bid_gets_fifo_load_d1),
        .O(Data_Exists_DFF_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Data_Exists_DFF_i_3
       (.I0(\Addr_Counters[0].FDRE_I_n_0 ),
        .I1(\Addr_Counters[1].FDRE_I_n_0 ),
        .I2(\Addr_Counters[3].FDRE_I_n_0 ),
        .I3(\Addr_Counters[2].FDRE_I_n_0 ),
        .O(Data_Exists_DFF_i_3_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* srl_bus_name = "U0/\gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_WR_CHNL/BID_FIFO/FIFO_RAM " *) 
  (* srl_name = "U0/\gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_WR_CHNL/BID_FIFO/FIFO_RAM[0].SRL16E_I " *) 
  SRL16E #(
    .INIT(16'h0000),
    .IS_CLK_INVERTED(1'b0)) 
    \FIFO_RAM[0].SRL16E_I 
       (.A0(\Addr_Counters[0].FDRE_I_n_0 ),
        .A1(\Addr_Counters[1].FDRE_I_n_0 ),
        .A2(\Addr_Counters[2].FDRE_I_n_0 ),
        .A3(\Addr_Counters[3].FDRE_I_n_0 ),
        .CE(CI),
        .CLK(s_axi_aclk),
        .D(bid_fifo_ld),
        .Q(bid_fifo_rd));
  LUT3 #(
    .INIT(8'hB8)) 
    \FIFO_RAM[0].SRL16E_I_i_1 
       (.I0(axi_awid_pipe),
        .I1(axi_awaddr_full),
        .I2(s_axi_awid),
        .O(bid_fifo_ld));
  LUT6 #(
    .INIT(64'hDDDD0DDDFFFFFFFF)) 
    \GEN_AWREADY.axi_awready_int_i_3 
       (.I0(\GEN_AWREADY.axi_awready_int_i_5_n_0 ),
        .I1(wr_addr_sm_cs),
        .I2(bid_gets_fifo_load_d1_reg_0),
        .I3(last_data_ack_mod),
        .I4(\GEN_AW_DUAL.wr_addr_sm_cs_reg ),
        .I5(\GEN_AWREADY.axi_aresetn_d2_reg ),
        .O(bid_gets_fifo_load_d1_reg));
  LUT6 #(
    .INIT(64'h007F007F007F0000)) 
    \GEN_AWREADY.axi_awready_int_i_5 
       (.I0(bvalid_cnt[2]),
        .I1(bvalid_cnt[1]),
        .I2(bvalid_cnt[0]),
        .I3(aw_active),
        .I4(axi_awaddr_full),
        .I5(s_axi_awvalid),
        .O(\GEN_AWREADY.axi_awready_int_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \GEN_AWREADY.axi_awready_int_i_6 
       (.I0(curr_awlen_reg_1_or_2),
        .I1(axi_awaddr_full),
        .I2(axi_awlen_pipe_1_or_2),
        .I3(\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg ),
        .O(bid_gets_fifo_load_d1_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_AW_DUAL.wr_addr_sm_cs_i_3 
       (.I0(bvalid_cnt[2]),
        .I1(bvalid_cnt[1]),
        .I2(bvalid_cnt[0]),
        .O(\GEN_AW_DUAL.wr_addr_sm_cs_reg ));
  LUT5 #(
    .INIT(32'hACAFACA0)) 
    \axi_bid_int[0]_i_1 
       (.I0(bid_fifo_ld),
        .I1(bid_fifo_rd),
        .I2(bid_gets_fifo_load),
        .I3(\axi_bid_int[0]_i_2_n_0 ),
        .I4(s_axi_bid),
        .O(\axi_bid_int_reg[0] ));
  LUT6 #(
    .INIT(64'hA888AAAAA8888888)) 
    \axi_bid_int[0]_i_2 
       (.I0(bid_fifo_not_empty),
        .I1(bid_gets_fifo_load_d1),
        .I2(s_axi_bready),
        .I3(axi_bvalid_int_reg),
        .I4(bid_gets_fifo_load_d1_i_3_n_0),
        .I5(bvalid_cnt_inc),
        .O(\axi_bid_int[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000330022223000)) 
    axi_bvalid_int_i_2
       (.I0(clr_bram_we_cmb6_out),
        .I1(out[1]),
        .I2(axi_wdata_full_cmb115_out),
        .I3(bvalid_cnt_inc11_out),
        .I4(out[2]),
        .I5(out[0]),
        .O(bvalid_cnt_inc));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT5 #(
    .INIT(32'hFE000000)) 
    axi_bvalid_int_i_3
       (.I0(bvalid_cnt[0]),
        .I1(bvalid_cnt[1]),
        .I2(bvalid_cnt[2]),
        .I3(axi_bvalid_int_reg),
        .I4(s_axi_bready),
        .O(bid_gets_fifo_load_d1_reg_1));
  LUT4 #(
    .INIT(16'h5504)) 
    axi_bvalid_int_i_4
       (.I0(axi_wr_burst),
        .I1(axi_awaddr_full),
        .I2(bid_gets_fifo_load_d1_reg),
        .I3(axi_wdata_full_cmb115_out),
        .O(clr_bram_we_cmb6_out));
  LUT2 #(
    .INIT(4'h8)) 
    axi_bvalid_int_i_5
       (.I0(s_axi_wvalid),
        .I1(s_axi_wlast),
        .O(bvalid_cnt_inc11_out));
  LUT6 #(
    .INIT(64'h7F7F7F007F007F00)) 
    axi_wready_int_mod_i_2
       (.I0(bvalid_cnt[0]),
        .I1(bvalid_cnt[1]),
        .I2(bvalid_cnt[2]),
        .I3(aw_active),
        .I4(s_axi_awvalid),
        .I5(s_axi_awready),
        .O(axi_wdata_full_cmb115_out));
  LUT6 #(
    .INIT(64'h0004000055550000)) 
    bid_gets_fifo_load_d1_i_1
       (.I0(bid_gets_fifo_load_d1_reg),
        .I1(bid_gets_fifo_load_d1_reg_1),
        .I2(\bvalid_cnt_reg[2] ),
        .I3(bid_fifo_not_empty),
        .I4(bvalid_cnt_inc),
        .I5(bid_gets_fifo_load_d1_i_3_n_0),
        .O(bid_gets_fifo_load));
  LUT3 #(
    .INIT(8'hFE)) 
    bid_gets_fifo_load_d1_i_3
       (.I0(bvalid_cnt[2]),
        .I1(bvalid_cnt[1]),
        .I2(bvalid_cnt[0]),
        .O(bid_gets_fifo_load_d1_i_3_n_0));
endmodule

(* C_BRAM_ADDR_WIDTH = "13" *) (* C_BRAM_INST_MODE = "EXTERNAL" *) (* C_ECC = "0" *) 
(* C_ECC_ONOFF_RESET_VALUE = "0" *) (* C_ECC_TYPE = "0" *) (* C_FAMILY = "zynq" *) 
(* C_FAULT_INJECT = "0" *) (* C_MEMORY_DEPTH = "8192" *) (* C_SELECT_XPM = "0" *) 
(* C_SINGLE_PORT_BRAM = "0" *) (* C_S_AXI_ADDR_WIDTH = "16" *) (* C_S_AXI_CTRL_ADDR_WIDTH = "32" *) 
(* C_S_AXI_CTRL_DATA_WIDTH = "32" *) (* C_S_AXI_DATA_WIDTH = "64" *) (* C_S_AXI_ID_WIDTH = "1" *) 
(* C_S_AXI_PROTOCOL = "AXI4" *) (* C_S_AXI_SUPPORTS_NARROW_BURST = "1" *) (* ORIG_REF_NAME = "axi_bram_ctrl" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module axi_bram_ctrl_0_axi_bram_ctrl
   (s_axi_aclk,
    s_axi_aresetn,
    ecc_interrupt,
    ecc_ue,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_ctrl_awvalid,
    s_axi_ctrl_awready,
    s_axi_ctrl_awaddr,
    s_axi_ctrl_wdata,
    s_axi_ctrl_wvalid,
    s_axi_ctrl_wready,
    s_axi_ctrl_bresp,
    s_axi_ctrl_bvalid,
    s_axi_ctrl_bready,
    s_axi_ctrl_araddr,
    s_axi_ctrl_arvalid,
    s_axi_ctrl_arready,
    s_axi_ctrl_rdata,
    s_axi_ctrl_rresp,
    s_axi_ctrl_rvalid,
    s_axi_ctrl_rready,
    bram_rst_a,
    bram_clk_a,
    bram_en_a,
    bram_we_a,
    bram_addr_a,
    bram_wrdata_a,
    bram_rddata_a,
    bram_rst_b,
    bram_clk_b,
    bram_en_b,
    bram_we_b,
    bram_addr_b,
    bram_wrdata_b,
    bram_rddata_b);
  input s_axi_aclk;
  input s_axi_aresetn;
  output ecc_interrupt;
  output ecc_ue;
  input [0:0]s_axi_awid;
  input [15:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input s_axi_awvalid;
  output s_axi_awready;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [0:0]s_axi_arid;
  input [15:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_ctrl_awvalid;
  output s_axi_ctrl_awready;
  input [31:0]s_axi_ctrl_awaddr;
  input [31:0]s_axi_ctrl_wdata;
  input s_axi_ctrl_wvalid;
  output s_axi_ctrl_wready;
  output [1:0]s_axi_ctrl_bresp;
  output s_axi_ctrl_bvalid;
  input s_axi_ctrl_bready;
  input [31:0]s_axi_ctrl_araddr;
  input s_axi_ctrl_arvalid;
  output s_axi_ctrl_arready;
  output [31:0]s_axi_ctrl_rdata;
  output [1:0]s_axi_ctrl_rresp;
  output s_axi_ctrl_rvalid;
  input s_axi_ctrl_rready;
  output bram_rst_a;
  output bram_clk_a;
  output bram_en_a;
  output [7:0]bram_we_a;
  output [15:0]bram_addr_a;
  output [63:0]bram_wrdata_a;
  input [63:0]bram_rddata_a;
  output bram_rst_b;
  output bram_clk_b;
  output bram_en_b;
  output [7:0]bram_we_b;
  output [15:0]bram_addr_b;
  output [63:0]bram_wrdata_b;
  input [63:0]bram_rddata_b;

  wire \<const0> ;
  wire [15:3]\^bram_addr_a ;
  wire [15:3]\^bram_addr_b ;
  wire bram_en_a;
  wire bram_en_b;
  wire [63:0]bram_rddata_b;
  wire bram_rst_b;
  wire [7:0]bram_we_a;
  wire [63:0]bram_wrdata_a;
  wire s_axi_aclk;
  wire [15:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [15:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [63:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;

  assign bram_addr_a[15:3] = \^bram_addr_a [15:3];
  assign bram_addr_a[2] = \<const0> ;
  assign bram_addr_a[1] = \<const0> ;
  assign bram_addr_a[0] = \<const0> ;
  assign bram_addr_b[15:3] = \^bram_addr_b [15:3];
  assign bram_addr_b[2] = \<const0> ;
  assign bram_addr_b[1] = \<const0> ;
  assign bram_addr_b[0] = \<const0> ;
  assign bram_clk_a = s_axi_aclk;
  assign bram_clk_b = s_axi_aclk;
  assign bram_rst_a = bram_rst_b;
  assign bram_we_b[7] = \<const0> ;
  assign bram_we_b[6] = \<const0> ;
  assign bram_we_b[5] = \<const0> ;
  assign bram_we_b[4] = \<const0> ;
  assign bram_we_b[3] = \<const0> ;
  assign bram_we_b[2] = \<const0> ;
  assign bram_we_b[1] = \<const0> ;
  assign bram_we_b[0] = \<const0> ;
  assign bram_wrdata_b[63] = \<const0> ;
  assign bram_wrdata_b[62] = \<const0> ;
  assign bram_wrdata_b[61] = \<const0> ;
  assign bram_wrdata_b[60] = \<const0> ;
  assign bram_wrdata_b[59] = \<const0> ;
  assign bram_wrdata_b[58] = \<const0> ;
  assign bram_wrdata_b[57] = \<const0> ;
  assign bram_wrdata_b[56] = \<const0> ;
  assign bram_wrdata_b[55] = \<const0> ;
  assign bram_wrdata_b[54] = \<const0> ;
  assign bram_wrdata_b[53] = \<const0> ;
  assign bram_wrdata_b[52] = \<const0> ;
  assign bram_wrdata_b[51] = \<const0> ;
  assign bram_wrdata_b[50] = \<const0> ;
  assign bram_wrdata_b[49] = \<const0> ;
  assign bram_wrdata_b[48] = \<const0> ;
  assign bram_wrdata_b[47] = \<const0> ;
  assign bram_wrdata_b[46] = \<const0> ;
  assign bram_wrdata_b[45] = \<const0> ;
  assign bram_wrdata_b[44] = \<const0> ;
  assign bram_wrdata_b[43] = \<const0> ;
  assign bram_wrdata_b[42] = \<const0> ;
  assign bram_wrdata_b[41] = \<const0> ;
  assign bram_wrdata_b[40] = \<const0> ;
  assign bram_wrdata_b[39] = \<const0> ;
  assign bram_wrdata_b[38] = \<const0> ;
  assign bram_wrdata_b[37] = \<const0> ;
  assign bram_wrdata_b[36] = \<const0> ;
  assign bram_wrdata_b[35] = \<const0> ;
  assign bram_wrdata_b[34] = \<const0> ;
  assign bram_wrdata_b[33] = \<const0> ;
  assign bram_wrdata_b[32] = \<const0> ;
  assign bram_wrdata_b[31] = \<const0> ;
  assign bram_wrdata_b[30] = \<const0> ;
  assign bram_wrdata_b[29] = \<const0> ;
  assign bram_wrdata_b[28] = \<const0> ;
  assign bram_wrdata_b[27] = \<const0> ;
  assign bram_wrdata_b[26] = \<const0> ;
  assign bram_wrdata_b[25] = \<const0> ;
  assign bram_wrdata_b[24] = \<const0> ;
  assign bram_wrdata_b[23] = \<const0> ;
  assign bram_wrdata_b[22] = \<const0> ;
  assign bram_wrdata_b[21] = \<const0> ;
  assign bram_wrdata_b[20] = \<const0> ;
  assign bram_wrdata_b[19] = \<const0> ;
  assign bram_wrdata_b[18] = \<const0> ;
  assign bram_wrdata_b[17] = \<const0> ;
  assign bram_wrdata_b[16] = \<const0> ;
  assign bram_wrdata_b[15] = \<const0> ;
  assign bram_wrdata_b[14] = \<const0> ;
  assign bram_wrdata_b[13] = \<const0> ;
  assign bram_wrdata_b[12] = \<const0> ;
  assign bram_wrdata_b[11] = \<const0> ;
  assign bram_wrdata_b[10] = \<const0> ;
  assign bram_wrdata_b[9] = \<const0> ;
  assign bram_wrdata_b[8] = \<const0> ;
  assign bram_wrdata_b[7] = \<const0> ;
  assign bram_wrdata_b[6] = \<const0> ;
  assign bram_wrdata_b[5] = \<const0> ;
  assign bram_wrdata_b[4] = \<const0> ;
  assign bram_wrdata_b[3] = \<const0> ;
  assign bram_wrdata_b[2] = \<const0> ;
  assign bram_wrdata_b[1] = \<const0> ;
  assign bram_wrdata_b[0] = \<const0> ;
  assign ecc_interrupt = \<const0> ;
  assign ecc_ue = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_ctrl_arready = \<const0> ;
  assign s_axi_ctrl_awready = \<const0> ;
  assign s_axi_ctrl_bresp[1] = \<const0> ;
  assign s_axi_ctrl_bresp[0] = \<const0> ;
  assign s_axi_ctrl_bvalid = \<const0> ;
  assign s_axi_ctrl_rdata[31] = \<const0> ;
  assign s_axi_ctrl_rdata[30] = \<const0> ;
  assign s_axi_ctrl_rdata[29] = \<const0> ;
  assign s_axi_ctrl_rdata[28] = \<const0> ;
  assign s_axi_ctrl_rdata[27] = \<const0> ;
  assign s_axi_ctrl_rdata[26] = \<const0> ;
  assign s_axi_ctrl_rdata[25] = \<const0> ;
  assign s_axi_ctrl_rdata[24] = \<const0> ;
  assign s_axi_ctrl_rdata[23] = \<const0> ;
  assign s_axi_ctrl_rdata[22] = \<const0> ;
  assign s_axi_ctrl_rdata[21] = \<const0> ;
  assign s_axi_ctrl_rdata[20] = \<const0> ;
  assign s_axi_ctrl_rdata[19] = \<const0> ;
  assign s_axi_ctrl_rdata[18] = \<const0> ;
  assign s_axi_ctrl_rdata[17] = \<const0> ;
  assign s_axi_ctrl_rdata[16] = \<const0> ;
  assign s_axi_ctrl_rdata[15] = \<const0> ;
  assign s_axi_ctrl_rdata[14] = \<const0> ;
  assign s_axi_ctrl_rdata[13] = \<const0> ;
  assign s_axi_ctrl_rdata[12] = \<const0> ;
  assign s_axi_ctrl_rdata[11] = \<const0> ;
  assign s_axi_ctrl_rdata[10] = \<const0> ;
  assign s_axi_ctrl_rdata[9] = \<const0> ;
  assign s_axi_ctrl_rdata[8] = \<const0> ;
  assign s_axi_ctrl_rdata[7] = \<const0> ;
  assign s_axi_ctrl_rdata[6] = \<const0> ;
  assign s_axi_ctrl_rdata[5] = \<const0> ;
  assign s_axi_ctrl_rdata[4] = \<const0> ;
  assign s_axi_ctrl_rdata[3] = \<const0> ;
  assign s_axi_ctrl_rdata[2] = \<const0> ;
  assign s_axi_ctrl_rdata[1] = \<const0> ;
  assign s_axi_ctrl_rdata[0] = \<const0> ;
  assign s_axi_ctrl_rresp[1] = \<const0> ;
  assign s_axi_ctrl_rresp[0] = \<const0> ;
  assign s_axi_ctrl_rvalid = \<const0> ;
  assign s_axi_ctrl_wready = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  axi_bram_ctrl_0_axi_bram_ctrl_top \gext_inst.abcv4_0_ext_inst 
       (.bram_addr_a(\^bram_addr_a ),
        .bram_addr_b(\^bram_addr_b ),
        .bram_en_a(bram_en_a),
        .bram_en_b(bram_en_b),
        .bram_rddata_b(bram_rddata_b),
        .bram_rst_b(bram_rst_b),
        .bram_we_a(bram_we_a),
        .bram_wrdata_a(bram_wrdata_a),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(s_axi_rid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "axi_bram_ctrl_top" *) 
module axi_bram_ctrl_0_axi_bram_ctrl_top
   (s_axi_rlast,
    s_axi_awready,
    bram_rst_b,
    s_axi_bvalid,
    bram_en_a,
    bram_we_a,
    bram_addr_a,
    bram_wrdata_a,
    s_axi_rvalid,
    s_axi_rdata,
    bram_addr_b,
    s_axi_wready,
    s_axi_arready,
    s_axi_bid,
    s_axi_rid,
    bram_en_b,
    s_axi_wvalid,
    s_axi_aresetn,
    s_axi_wlast,
    s_axi_arsize,
    s_axi_araddr,
    s_axi_rready,
    s_axi_awburst,
    s_axi_awsize,
    s_axi_aclk,
    s_axi_awlen,
    s_axi_bready,
    s_axi_awid,
    s_axi_wstrb,
    s_axi_awaddr,
    s_axi_wdata,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arid,
    bram_rddata_b,
    s_axi_awvalid,
    s_axi_arvalid);
  output s_axi_rlast;
  output s_axi_awready;
  output bram_rst_b;
  output s_axi_bvalid;
  output bram_en_a;
  output [7:0]bram_we_a;
  output [12:0]bram_addr_a;
  output [63:0]bram_wrdata_a;
  output s_axi_rvalid;
  output [63:0]s_axi_rdata;
  output [12:0]bram_addr_b;
  output s_axi_wready;
  output s_axi_arready;
  output [0:0]s_axi_bid;
  output [0:0]s_axi_rid;
  output bram_en_b;
  input s_axi_wvalid;
  input s_axi_aresetn;
  input s_axi_wlast;
  input [2:0]s_axi_arsize;
  input [15:0]s_axi_araddr;
  input s_axi_rready;
  input [1:0]s_axi_awburst;
  input [2:0]s_axi_awsize;
  input s_axi_aclk;
  input [7:0]s_axi_awlen;
  input s_axi_bready;
  input [0:0]s_axi_awid;
  input [7:0]s_axi_wstrb;
  input [15:0]s_axi_awaddr;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arid;
  input [63:0]bram_rddata_b;
  input s_axi_awvalid;
  input s_axi_arvalid;

  wire [12:0]bram_addr_a;
  wire [12:0]bram_addr_b;
  wire bram_en_a;
  wire bram_en_b;
  wire [63:0]bram_rddata_b;
  wire bram_rst_b;
  wire [7:0]bram_we_a;
  wire [63:0]bram_wrdata_a;
  wire s_axi_aclk;
  wire [15:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [15:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [63:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;

  axi_bram_ctrl_0_full_axi \GEN_AXI4.I_FULL_AXI 
       (.bram_addr_a(bram_addr_a),
        .bram_addr_b(bram_addr_b),
        .bram_en_a(bram_en_a),
        .bram_en_b(bram_en_b),
        .bram_rddata_b(bram_rddata_b),
        .bram_rst_b(bram_rst_b),
        .bram_we_a(bram_we_a),
        .bram_wrdata_a(bram_wrdata_a),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(s_axi_rid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "full_axi" *) 
module axi_bram_ctrl_0_full_axi
   (s_axi_rlast,
    s_axi_awready,
    bram_rst_b,
    s_axi_bvalid,
    bram_en_a,
    bram_we_a,
    bram_addr_a,
    bram_wrdata_a,
    s_axi_rvalid,
    s_axi_rdata,
    bram_addr_b,
    s_axi_wready,
    s_axi_arready,
    s_axi_bid,
    s_axi_rid,
    bram_en_b,
    s_axi_wvalid,
    s_axi_aresetn,
    s_axi_wlast,
    s_axi_arsize,
    s_axi_araddr,
    s_axi_rready,
    s_axi_awburst,
    s_axi_awsize,
    s_axi_aclk,
    s_axi_awlen,
    s_axi_bready,
    s_axi_awid,
    s_axi_wstrb,
    s_axi_awaddr,
    s_axi_wdata,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_arid,
    bram_rddata_b,
    s_axi_awvalid,
    s_axi_arvalid);
  output s_axi_rlast;
  output s_axi_awready;
  output bram_rst_b;
  output s_axi_bvalid;
  output bram_en_a;
  output [7:0]bram_we_a;
  output [12:0]bram_addr_a;
  output [63:0]bram_wrdata_a;
  output s_axi_rvalid;
  output [63:0]s_axi_rdata;
  output [12:0]bram_addr_b;
  output s_axi_wready;
  output s_axi_arready;
  output [0:0]s_axi_bid;
  output [0:0]s_axi_rid;
  output bram_en_b;
  input s_axi_wvalid;
  input s_axi_aresetn;
  input s_axi_wlast;
  input [2:0]s_axi_arsize;
  input [15:0]s_axi_araddr;
  input s_axi_rready;
  input [1:0]s_axi_awburst;
  input [2:0]s_axi_awsize;
  input s_axi_aclk;
  input [7:0]s_axi_awlen;
  input s_axi_bready;
  input [0:0]s_axi_awid;
  input [7:0]s_axi_wstrb;
  input [15:0]s_axi_awaddr;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arid;
  input [63:0]bram_rddata_b;
  input s_axi_awvalid;
  input s_axi_arvalid;

  wire axi_aresetn_d2;
  wire axi_aresetn_re_reg;
  wire [12:0]bram_addr_a;
  wire [12:0]bram_addr_b;
  wire bram_en_a;
  wire bram_en_b;
  wire [63:0]bram_rddata_b;
  wire bram_rst_b;
  wire [7:0]bram_we_a;
  wire [63:0]bram_wrdata_a;
  wire p_0_in;
  wire s_axi_aclk;
  wire [15:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [15:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [63:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;

  axi_bram_ctrl_0_rd_chnl I_RD_CHNL
       (.axi_aresetn_d2(axi_aresetn_d2),
        .axi_aresetn_re_reg(axi_aresetn_re_reg),
        .bram_addr_b(bram_addr_b),
        .bram_en_b(bram_en_b),
        .bram_rddata_b(bram_rddata_b),
        .bram_rst_b(bram_rst_b),
        .p_0_in(p_0_in),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(s_axi_rid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid));
  axi_bram_ctrl_0_wr_chnl I_WR_CHNL
       (.Q(bram_addr_a),
        .axi_aresetn_d2(axi_aresetn_d2),
        .axi_aresetn_re_reg(axi_aresetn_re_reg),
        .bram_en_a(bram_en_a),
        .bram_we_a(bram_we_a),
        .bram_wrdata_a(bram_wrdata_a),
        .p_0_in(p_0_in),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_aresetn_0(bram_rst_b),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "rd_chnl" *) 
module axi_bram_ctrl_0_rd_chnl
   (bram_rst_b,
    s_axi_rdata,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rid,
    bram_en_b,
    bram_addr_b,
    s_axi_arready,
    s_axi_aclk,
    s_axi_arid,
    s_axi_araddr,
    p_0_in,
    s_axi_aresetn,
    s_axi_arsize,
    s_axi_rready,
    axi_aresetn_d2,
    s_axi_arvalid,
    s_axi_arlen,
    axi_aresetn_re_reg,
    s_axi_arburst,
    bram_rddata_b);
  output bram_rst_b;
  output [63:0]s_axi_rdata;
  output s_axi_rlast;
  output s_axi_rvalid;
  output [0:0]s_axi_rid;
  output bram_en_b;
  output [12:0]bram_addr_b;
  output s_axi_arready;
  input s_axi_aclk;
  input [0:0]s_axi_arid;
  input [15:0]s_axi_araddr;
  input p_0_in;
  input s_axi_aresetn;
  input [2:0]s_axi_arsize;
  input s_axi_rready;
  input axi_aresetn_d2;
  input s_axi_arvalid;
  input [7:0]s_axi_arlen;
  input axi_aresetn_re_reg;
  input [1:0]s_axi_arburst;
  input [63:0]bram_rddata_b;

  wire \/FSM_sequential_rlast_sm_cs[0]_i_2_n_0 ;
  wire \/FSM_sequential_rlast_sm_cs[1]_i_2_n_0 ;
  wire \/i__n_0 ;
  wire \FSM_sequential_rlast_sm_cs[0]_i_1_n_0 ;
  wire \FSM_sequential_rlast_sm_cs[1]_i_1_n_0 ;
  wire \FSM_sequential_rlast_sm_cs[2]_i_1_n_0 ;
  wire \FSM_sequential_rlast_sm_cs[2]_i_2_n_0 ;
  wire \GEN_ARREADY.axi_arready_int_i_1_n_0 ;
  wire \GEN_ARREADY.axi_early_arready_int_i_2_n_0 ;
  wire \GEN_ARREADY.axi_early_arready_int_i_3_n_0 ;
  wire \GEN_ARREADY.axi_early_arready_int_i_4_n_0 ;
  wire \GEN_AR_DUAL.ar_active_i_1_n_0 ;
  wire \GEN_AR_DUAL.ar_active_i_2_n_0 ;
  wire \GEN_AR_DUAL.ar_active_i_3_n_0 ;
  wire \GEN_AR_DUAL.ar_active_i_4_n_0 ;
  wire \GEN_AR_DUAL.rd_addr_sm_cs_i_1_n_0 ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg_n_0_[0] ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[15].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg_n_0_[1] ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg_n_0_[2] ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.axi_araddr_full_i_1_n_0 ;
  wire \GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_i_1_n_0 ;
  wire \GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg_n_0 ;
  wire \GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_3_n_0 ;
  wire \GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_4_n_0 ;
  wire \GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_5_n_0 ;
  wire \GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_6_n_0 ;
  wire \GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_1_n_0 ;
  wire \GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_2_n_0 ;
  wire \GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_2_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_3_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_6_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_7_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_3_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_2_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_4_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_2_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_4_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_3_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_2_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_3_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_3_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[1]_i_3__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[1]_i_4__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[1]_i_5_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_10__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_12__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_13__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_14__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_15__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_16__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_17__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_18__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_19__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_20__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_21__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_22_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_3__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_4__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_5__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_6__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_7__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_8__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_9__0_n_0 ;
  wire \GEN_NARROW_EN.curr_narrow_burst_i_1__0_n_0 ;
  wire \GEN_NARROW_EN.curr_narrow_burst_i_2__0_n_0 ;
  wire \GEN_NARROW_EN.curr_narrow_burst_i_3__0_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[32].axi_rdata_int[32]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[33].axi_rdata_int[33]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[34].axi_rdata_int[34]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[35].axi_rdata_int[35]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[36].axi_rdata_int[36]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[37].axi_rdata_int[37]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[38].axi_rdata_int[38]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[39].axi_rdata_int[39]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[40].axi_rdata_int[40]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[41].axi_rdata_int[41]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[42].axi_rdata_int[42]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[43].axi_rdata_int[43]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[44].axi_rdata_int[44]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[45].axi_rdata_int[45]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[46].axi_rdata_int[46]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[47].axi_rdata_int[47]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[48].axi_rdata_int[48]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[49].axi_rdata_int[49]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[50].axi_rdata_int[50]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[51].axi_rdata_int[51]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[52].axi_rdata_int[52]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[53].axi_rdata_int[53]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[54].axi_rdata_int[54]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[55].axi_rdata_int[55]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[56].axi_rdata_int[56]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[57].axi_rdata_int[57]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[58].axi_rdata_int[58]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[59].axi_rdata_int[59]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[60].axi_rdata_int[60]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[61].axi_rdata_int[61]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[62].axi_rdata_int[62]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_3_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_5_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1_n_0 ;
  wire \GEN_RID.axi_rid_int[0]_i_1_n_0 ;
  wire \GEN_RID.axi_rid_int[0]_i_2_n_0 ;
  wire \GEN_RID.axi_rid_temp2[0]_i_1_n_0 ;
  wire \GEN_RID.axi_rid_temp2_full_i_1_n_0 ;
  wire \GEN_RID.axi_rid_temp2_reg_n_0_[0] ;
  wire \GEN_RID.axi_rid_temp[0]_i_1_n_0 ;
  wire \GEN_RID.axi_rid_temp[0]_i_3_n_0 ;
  wire \GEN_RID.axi_rid_temp_full_i_1_n_0 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_0 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_1 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_2 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_3 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_4 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_5 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_6 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_7 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_8 ;
  wire I_WRAP_BRST_n_1;
  wire I_WRAP_BRST_n_10;
  wire I_WRAP_BRST_n_11;
  wire I_WRAP_BRST_n_12;
  wire I_WRAP_BRST_n_13;
  wire I_WRAP_BRST_n_14;
  wire I_WRAP_BRST_n_15;
  wire I_WRAP_BRST_n_16;
  wire I_WRAP_BRST_n_17;
  wire I_WRAP_BRST_n_18;
  wire I_WRAP_BRST_n_19;
  wire I_WRAP_BRST_n_2;
  wire I_WRAP_BRST_n_20;
  wire I_WRAP_BRST_n_21;
  wire I_WRAP_BRST_n_22;
  wire I_WRAP_BRST_n_23;
  wire I_WRAP_BRST_n_24;
  wire I_WRAP_BRST_n_25;
  wire I_WRAP_BRST_n_26;
  wire I_WRAP_BRST_n_27;
  wire I_WRAP_BRST_n_5;
  wire act_rd_burst;
  wire act_rd_burst_i_1_n_0;
  wire act_rd_burst_i_2_n_0;
  wire act_rd_burst_i_4_n_0;
  wire act_rd_burst_i_5_n_0;
  wire act_rd_burst_i_6_n_0;
  wire act_rd_burst_two;
  wire act_rd_burst_two_i_1_n_0;
  wire act_rd_burst_two_i_2_n_0;
  wire ar_active;
  wire araddr_pipe_ld44_out;
  wire axi_araddr_full;
  wire [1:0]axi_arburst_pipe;
  wire axi_aresetn_d2;
  wire axi_aresetn_re_reg;
  wire axi_arid_pipe;
  wire [7:0]axi_arlen_pipe;
  wire axi_arlen_pipe_1_or_2;
  wire axi_arready_int;
  wire [2:0]axi_arsize_pipe;
  wire axi_arsize_pipe_max;
  wire axi_arsize_pipe_max_i_1_n_0;
  wire axi_b2b_brst;
  wire axi_b2b_brst_i_1_n_0;
  wire axi_b2b_brst_i_2_n_0;
  wire axi_early_arready_int;
  wire axi_rd_burst;
  wire axi_rd_burst_i_1_n_0;
  wire axi_rd_burst_two;
  wire axi_rd_burst_two_i_1_n_0;
  wire axi_rd_burst_two_i_3_n_0;
  wire axi_rd_burst_two_i_4_n_0;
  wire axi_rd_burst_two_i_5_n_0;
  wire axi_rd_burst_two_i_6_n_0;
  wire axi_rd_burst_two_reg_n_0;
  wire axi_rid_temp;
  wire axi_rid_temp2;
  wire axi_rid_temp2_full;
  wire axi_rid_temp_full;
  wire axi_rid_temp_full_d1;
  wire axi_rlast_int_i_1_n_0;
  wire axi_rlast_set;
  wire axi_rvalid_clr_ok;
  wire axi_rvalid_clr_ok_i_1_n_0;
  wire axi_rvalid_clr_ok_i_2_n_0;
  wire axi_rvalid_clr_ok_i_3_n_0;
  wire axi_rvalid_int_i_1_n_0;
  wire axi_rvalid_set;
  wire axi_rvalid_set_cmb;
  wire [12:0]bram_addr_b;
  wire [15:12]bram_addr_ld;
  wire bram_addr_ld_en;
  wire bram_addr_ld_en_mod;
  wire bram_en_b;
  wire bram_en_int_i_10_n_0;
  wire bram_en_int_i_11_n_0;
  wire bram_en_int_i_12_n_0;
  wire bram_en_int_i_1_n_0;
  wire bram_en_int_i_2_n_0;
  wire bram_en_int_i_3_n_0;
  wire bram_en_int_i_4_n_0;
  wire bram_en_int_i_5_n_0;
  wire bram_en_int_i_6_n_0;
  wire bram_en_int_i_7_n_0;
  wire bram_en_int_i_9_n_0;
  wire [63:0]bram_rddata_b;
  wire bram_rst_b;
  wire [7:0]brst_cnt;
  wire \brst_cnt[0]_i_1_n_0 ;
  wire \brst_cnt[1]_i_1_n_0 ;
  wire \brst_cnt[2]_i_1_n_0 ;
  wire \brst_cnt[3]_i_1_n_0 ;
  wire \brst_cnt[4]_i_1_n_0 ;
  wire \brst_cnt[4]_i_2_n_0 ;
  wire \brst_cnt[5]_i_1_n_0 ;
  wire \brst_cnt[6]_i_1_n_0 ;
  wire \brst_cnt[6]_i_2_n_0 ;
  wire \brst_cnt[7]_i_1_n_0 ;
  wire \brst_cnt[7]_i_2_n_0 ;
  wire \brst_cnt[7]_i_3_n_0 ;
  wire \brst_cnt[7]_i_4_n_0 ;
  wire brst_cnt_max_d1;
  wire brst_one;
  wire brst_one0;
  wire brst_one_i_1_n_0;
  wire brst_one_i_3_n_0;
  wire brst_zero;
  wire brst_zero_i_1_n_0;
  wire curr_fixed_burst;
  wire curr_fixed_burst_reg;
  wire curr_narrow_burst;
  wire curr_wrap_burst;
  wire curr_wrap_burst_reg;
  wire disable_b2b_brst;
  wire disable_b2b_brst_cmb;
  wire disable_b2b_brst_i_2_n_0;
  wire disable_b2b_brst_i_3_n_0;
  wire end_brst_rd;
  wire end_brst_rd_clr;
  wire end_brst_rd_clr_i_1_n_0;
  wire end_brst_rd_i_1_n_0;
  wire last_bram_addr;
  wire last_bram_addr0;
  wire last_bram_addr_i_2_n_0;
  wire last_bram_addr_i_3_n_0;
  wire last_bram_addr_i_4_n_0;
  wire last_bram_addr_i_5_n_0;
  wire last_bram_addr_i_6_n_0;
  wire last_bram_addr_i_7_n_0;
  wire [2:0]narrow_addr_int;
  wire narrow_bram_addr_inc;
  wire narrow_bram_addr_inc_d1;
  wire [2:0]narrow_burst_cnt_ld_mod;
  wire [2:0]narrow_burst_cnt_ld_reg;
  wire no_ar_ack;
  wire no_ar_ack_i_1_n_0;
  wire p_0_in;
  wire p_11_out;
  wire p_15_out;
  wire p_4_out;
  wire p_55_out;
  wire pend_rd_op_i_1_n_0;
  wire pend_rd_op_i_2_n_0;
  wire pend_rd_op_i_3_n_0;
  wire pend_rd_op_i_4_n_0;
  wire pend_rd_op_i_5_n_0;
  wire pend_rd_op_i_6_n_0;
  wire pend_rd_op_i_7_n_0;
  wire pend_rd_op_reg_n_0;
  wire rd_addr_sm_cs;
  wire rd_adv_buf75_out;
  wire [3:0]rd_data_sm_cs;
  wire \rd_data_sm_cs[0]_i_1_n_0 ;
  wire \rd_data_sm_cs[0]_i_2_n_0 ;
  wire \rd_data_sm_cs[0]_i_3_n_0 ;
  wire \rd_data_sm_cs[0]_i_4_n_0 ;
  wire \rd_data_sm_cs[0]_i_5_n_0 ;
  wire \rd_data_sm_cs[1]_i_1_n_0 ;
  wire \rd_data_sm_cs[1]_i_2_n_0 ;
  wire \rd_data_sm_cs[1]_i_3_n_0 ;
  wire \rd_data_sm_cs[1]_i_4_n_0 ;
  wire \rd_data_sm_cs[2]_i_1_n_0 ;
  wire \rd_data_sm_cs[2]_i_2_n_0 ;
  wire \rd_data_sm_cs[2]_i_3_n_0 ;
  wire \rd_data_sm_cs[2]_i_4_n_0 ;
  wire \rd_data_sm_cs[3]_i_2_n_0 ;
  wire \rd_data_sm_cs[3]_i_3_n_0 ;
  wire \rd_data_sm_cs[3]_i_4_n_0 ;
  wire \rd_data_sm_cs[3]_i_5_n_0 ;
  wire \rd_data_sm_cs[3]_i_6_n_0 ;
  wire \rd_data_sm_cs[3]_i_7_n_0 ;
  wire \rd_data_sm_cs[3]_i_8_n_0 ;
  wire rd_data_sm_ns;
  wire [63:0]rd_skid_buf;
  wire rd_skid_buf_ld;
  wire rd_skid_buf_ld_cmb;
  wire rd_skid_buf_ld_reg;
  wire rddata_mux_sel;
  wire rddata_mux_sel_cmb;
  wire rddata_mux_sel_i_1_n_0;
  wire rddata_mux_sel_i_3_n_0;
  (* RTL_KEEP = "yes" *) wire [2:0]rlast_sm_cs;
  wire s_axi_aclk;
  wire [15:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [63:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;

  LUT6 #(
    .INIT(64'h0011001300130013)) 
    \/FSM_sequential_rlast_sm_cs[0]_i_2 
       (.I0(axi_rd_burst),
        .I1(rlast_sm_cs[1]),
        .I2(act_rd_burst_two),
        .I3(axi_rd_burst_two_reg_n_0),
        .I4(s_axi_rvalid),
        .I5(s_axi_rready),
        .O(\/FSM_sequential_rlast_sm_cs[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h003F007F003F0055)) 
    \/FSM_sequential_rlast_sm_cs[1]_i_2 
       (.I0(axi_rd_burst),
        .I1(s_axi_rready),
        .I2(s_axi_rvalid),
        .I3(rlast_sm_cs[1]),
        .I4(axi_rd_burst_two_reg_n_0),
        .I5(act_rd_burst_two),
        .O(\/FSM_sequential_rlast_sm_cs[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF000F111F000E000)) 
    \/i_ 
       (.I0(rlast_sm_cs[2]),
        .I1(rlast_sm_cs[1]),
        .I2(s_axi_rvalid),
        .I3(s_axi_rready),
        .I4(rlast_sm_cs[0]),
        .I5(last_bram_addr),
        .O(\/i__n_0 ));
  LUT6 #(
    .INIT(64'h00008080000F8080)) 
    \/i___0 
       (.I0(s_axi_rready),
        .I1(s_axi_rvalid),
        .I2(rlast_sm_cs[0]),
        .I3(rlast_sm_cs[1]),
        .I4(rlast_sm_cs[2]),
        .I5(s_axi_rlast),
        .O(axi_rlast_set));
  LUT5 #(
    .INIT(32'h01FF0100)) 
    \FSM_sequential_rlast_sm_cs[0]_i_1 
       (.I0(rlast_sm_cs[2]),
        .I1(rlast_sm_cs[0]),
        .I2(\/FSM_sequential_rlast_sm_cs[0]_i_2_n_0 ),
        .I3(\/i__n_0 ),
        .I4(rlast_sm_cs[0]),
        .O(\FSM_sequential_rlast_sm_cs[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h01FF0100)) 
    \FSM_sequential_rlast_sm_cs[1]_i_1 
       (.I0(rlast_sm_cs[2]),
        .I1(rlast_sm_cs[0]),
        .I2(\/FSM_sequential_rlast_sm_cs[1]_i_2_n_0 ),
        .I3(\/i__n_0 ),
        .I4(rlast_sm_cs[1]),
        .O(\FSM_sequential_rlast_sm_cs[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00C1FFFF00C10000)) 
    \FSM_sequential_rlast_sm_cs[2]_i_1 
       (.I0(\FSM_sequential_rlast_sm_cs[2]_i_2_n_0 ),
        .I1(rlast_sm_cs[1]),
        .I2(rlast_sm_cs[0]),
        .I3(rlast_sm_cs[2]),
        .I4(\/i__n_0 ),
        .I5(rlast_sm_cs[2]),
        .O(\FSM_sequential_rlast_sm_cs[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_rlast_sm_cs[2]_i_2 
       (.I0(axi_rd_burst_two_reg_n_0),
        .I1(axi_rd_burst),
        .O(\FSM_sequential_rlast_sm_cs[2]_i_2_n_0 ));
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rlast_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_rlast_sm_cs[0]_i_1_n_0 ),
        .Q(rlast_sm_cs[0]),
        .R(bram_rst_b));
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rlast_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_rlast_sm_cs[1]_i_1_n_0 ),
        .Q(rlast_sm_cs[1]),
        .R(bram_rst_b));
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rlast_sm_cs_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_rlast_sm_cs[2]_i_1_n_0 ),
        .Q(rlast_sm_cs[2]),
        .R(bram_rst_b));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hAAAAAEEE)) 
    \GEN_ARREADY.axi_arready_int_i_1 
       (.I0(p_11_out),
        .I1(axi_arready_int),
        .I2(s_axi_arvalid),
        .I3(axi_araddr_full),
        .I4(araddr_pipe_ld44_out),
        .O(\GEN_ARREADY.axi_arready_int_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hBAAA)) 
    \GEN_ARREADY.axi_arready_int_i_2 
       (.I0(axi_aresetn_re_reg),
        .I1(axi_early_arready_int),
        .I2(axi_araddr_full),
        .I3(bram_addr_ld_en),
        .O(p_11_out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_ARREADY.axi_arready_int_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_ARREADY.axi_arready_int_i_1_n_0 ),
        .Q(axi_arready_int),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    \GEN_ARREADY.axi_early_arready_int_i_1 
       (.I0(\GEN_ARREADY.axi_early_arready_int_i_2_n_0 ),
        .I1(\GEN_ARREADY.axi_early_arready_int_i_3_n_0 ),
        .I2(rd_data_sm_cs[3]),
        .I3(brst_one),
        .I4(axi_arready_int),
        .I5(\GEN_ARREADY.axi_early_arready_int_i_4_n_0 ),
        .O(p_55_out));
  LUT6 #(
    .INIT(64'h00CC304400000044)) 
    \GEN_ARREADY.axi_early_arready_int_i_2 
       (.I0(axi_rd_burst_two_reg_n_0),
        .I1(rd_data_sm_cs[1]),
        .I2(bram_en_int_i_9_n_0),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[0]),
        .I5(rd_adv_buf75_out),
        .O(\GEN_ARREADY.axi_early_arready_int_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \GEN_ARREADY.axi_early_arready_int_i_3 
       (.I0(axi_araddr_full),
        .I1(s_axi_arvalid),
        .O(\GEN_ARREADY.axi_early_arready_int_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAABAAABAFFFFAABA)) 
    \GEN_ARREADY.axi_early_arready_int_i_4 
       (.I0(I_WRAP_BRST_n_21),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[1]),
        .I3(\rd_data_sm_cs[3]_i_6_n_0 ),
        .I4(brst_zero),
        .I5(rd_adv_buf75_out),
        .O(\GEN_ARREADY.axi_early_arready_int_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_ARREADY.axi_early_arready_int_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_55_out),
        .Q(axi_early_arready_int),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'hFFFF4555FFFF0000)) 
    \GEN_AR_DUAL.ar_active_i_1 
       (.I0(\GEN_AR_DUAL.ar_active_i_2_n_0 ),
        .I1(\rd_data_sm_cs[3]_i_6_n_0 ),
        .I2(rd_adv_buf75_out),
        .I3(\GEN_AR_DUAL.ar_active_i_3_n_0 ),
        .I4(bram_addr_ld_en),
        .I5(ar_active),
        .O(\GEN_AR_DUAL.ar_active_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4044404040445140)) 
    \GEN_AR_DUAL.ar_active_i_2 
       (.I0(\rd_data_sm_cs[1]_i_2_n_0 ),
        .I1(rd_data_sm_cs[1]),
        .I2(\GEN_AR_DUAL.ar_active_i_4_n_0 ),
        .I3(rd_data_sm_cs[0]),
        .I4(axi_rd_burst_two_reg_n_0),
        .I5(axi_rd_burst),
        .O(\GEN_AR_DUAL.ar_active_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h1110)) 
    \GEN_AR_DUAL.ar_active_i_3 
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_data_sm_cs[1]),
        .I2(end_brst_rd),
        .I3(brst_zero),
        .O(\GEN_AR_DUAL.ar_active_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8A88000000000000)) 
    \GEN_AR_DUAL.ar_active_i_4 
       (.I0(I_WRAP_BRST_n_21),
        .I1(brst_zero),
        .I2(axi_b2b_brst),
        .I3(end_brst_rd),
        .I4(rd_adv_buf75_out),
        .I5(rd_data_sm_cs[0]),
        .O(\GEN_AR_DUAL.ar_active_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_DUAL.ar_active_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AR_DUAL.ar_active_i_1_n_0 ),
        .Q(ar_active),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'h444F000044440000)) 
    \GEN_AR_DUAL.rd_addr_sm_cs_i_1 
       (.I0(\GEN_ARREADY.axi_early_arready_int_i_4_n_0 ),
        .I1(last_bram_addr),
        .I2(rd_addr_sm_cs),
        .I3(axi_araddr_full),
        .I4(s_axi_arvalid),
        .I5(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_4_n_0 ),
        .O(\GEN_AR_DUAL.rd_addr_sm_cs_i_1_n_0 ));
  FDRE \GEN_AR_DUAL.rd_addr_sm_cs_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AR_DUAL.rd_addr_sm_cs_i_1_n_0 ),
        .Q(rd_addr_sm_cs),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[0]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg[10] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[10]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg[11] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[11]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg[12] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[12]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg[13] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[13]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg[14] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[14]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[15].axi_araddr_pipe_reg[15] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[15]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[15].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[1]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[2]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg[3] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[3]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg[4] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[4]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg[5] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[5]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg[6] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[6]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg[7] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[7]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg[8] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[8]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg[9] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_araddr[9]),
        .Q(\GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hCC0C0C0C88888888)) 
    \GEN_AR_PIPE_DUAL.axi_araddr_full_i_1 
       (.I0(araddr_pipe_ld44_out),
        .I1(s_axi_aresetn),
        .I2(bram_addr_ld_en),
        .I3(s_axi_arvalid),
        .I4(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_3_n_0 ),
        .I5(axi_araddr_full),
        .O(\GEN_AR_PIPE_DUAL.axi_araddr_full_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_araddr_full_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AR_PIPE_DUAL.axi_araddr_full_i_1_n_0 ),
        .Q(axi_araddr_full),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h03AA)) 
    \GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_i_1 
       (.I0(\GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg_n_0 ),
        .I1(s_axi_arburst[0]),
        .I2(s_axi_arburst[1]),
        .I3(araddr_pipe_ld44_out),
        .O(\GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_i_1_n_0 ),
        .Q(\GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arburst_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arburst[0]),
        .Q(axi_arburst_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arburst_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arburst[1]),
        .Q(axi_arburst_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arid_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arid),
        .Q(axi_arid_pipe),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h880088008A008800)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_1 
       (.I0(axi_aresetn_d2),
        .I1(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_3_n_0 ),
        .I2(rd_addr_sm_cs),
        .I3(s_axi_arvalid),
        .I4(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_4_n_0 ),
        .I5(axi_araddr_full),
        .O(araddr_pipe_ld44_out));
  LUT4 #(
    .INIT(16'h0001)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_2 
       (.I0(s_axi_arlen[2]),
        .I1(s_axi_arlen[7]),
        .I2(s_axi_arlen[5]),
        .I3(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_5_n_0 ),
        .O(p_15_out));
  LUT6 #(
    .INIT(64'h000000008A008A8A)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_3 
       (.I0(last_bram_addr),
        .I1(rd_adv_buf75_out),
        .I2(brst_zero),
        .I3(\rd_data_sm_cs[3]_i_6_n_0 ),
        .I4(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_6_n_0 ),
        .I5(I_WRAP_BRST_n_21),
        .O(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_4 
       (.I0(no_ar_ack),
        .I1(pend_rd_op_reg_n_0),
        .I2(ar_active),
        .O(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_5 
       (.I0(s_axi_arlen[6]),
        .I1(s_axi_arlen[1]),
        .I2(s_axi_arlen[4]),
        .I3(s_axi_arlen[3]),
        .O(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_6 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .O(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_1_or_2_reg 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(p_15_out),
        .Q(axi_arlen_pipe_1_or_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arlen[0]),
        .Q(axi_arlen_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arlen[1]),
        .Q(axi_arlen_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[2] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arlen[2]),
        .Q(axi_arlen_pipe[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arlen[3]),
        .Q(axi_arlen_pipe[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[4] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arlen[4]),
        .Q(axi_arlen_pipe[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[5] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arlen[5]),
        .Q(axi_arlen_pipe[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[6] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arlen[6]),
        .Q(axi_arlen_pipe[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[7] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arlen[7]),
        .Q(axi_arlen_pipe[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arsize[0]),
        .Q(axi_arsize_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arsize[1]),
        .Q(axi_arsize_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] 
       (.C(s_axi_aclk),
        .CE(araddr_pipe_ld44_out),
        .D(s_axi_arsize[2]),
        .Q(axi_arsize_pipe[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_1 
       (.I0(\GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_2_n_0 ),
        .I1(end_brst_rd_clr),
        .I2(s_axi_aresetn),
        .I3(bram_addr_ld_en),
        .O(\GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00202020)) 
    \GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_2 
       (.I0(brst_zero),
        .I1(pend_rd_op_reg_n_0),
        .I2(ar_active),
        .I3(curr_narrow_burst),
        .I4(I_WRAP_BRST_n_2),
        .I5(\GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0 ),
        .O(\GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_BRST_MAX_W_NARROW.brst_cnt_max_i_1_n_0 ),
        .Q(\GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0 ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h8000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_2 
       (.I0(bram_addr_b[6]),
        .I1(bram_addr_b[4]),
        .I2(I_WRAP_BRST_n_19),
        .I3(bram_addr_b[5]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_3 
       (.I0(\GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[10]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_6 
       (.I0(bram_addr_b[8]),
        .I1(bram_addr_b[6]),
        .I2(bram_addr_b[4]),
        .I3(I_WRAP_BRST_n_19),
        .I4(bram_addr_b[5]),
        .I5(bram_addr_b[7]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_7 
       (.I0(\GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[11]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_3 
       (.I0(\GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[4]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_2 
       (.I0(bram_addr_b[1]),
        .I1(bram_addr_b[0]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_4 
       (.I0(\GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[5]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_2 
       (.I0(bram_addr_b[3]),
        .I1(bram_addr_b[1]),
        .I2(bram_addr_b[0]),
        .I3(bram_addr_b[2]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_4 
       (.I0(\GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[6]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_3 
       (.I0(\GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[7]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_2 
       (.I0(bram_addr_b[4]),
        .I1(bram_addr_b[2]),
        .I2(bram_addr_b[0]),
        .I3(bram_addr_b[1]),
        .I4(bram_addr_b[3]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_3 
       (.I0(\GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[8]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2 
       (.I0(bram_addr_b[5]),
        .I1(bram_addr_b[3]),
        .I2(bram_addr_b[1]),
        .I3(bram_addr_b[0]),
        .I4(bram_addr_b[2]),
        .I5(bram_addr_b[4]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_3 
       (.I0(\GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[9]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_5),
        .D(I_WRAP_BRST_n_11),
        .Q(bram_addr_b[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_5),
        .D(I_WRAP_BRST_n_10),
        .Q(bram_addr_b[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en_mod),
        .D(bram_addr_ld[12]),
        .Q(bram_addr_b[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en_mod),
        .D(bram_addr_ld[13]),
        .Q(bram_addr_b[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en_mod),
        .D(bram_addr_ld[14]),
        .Q(bram_addr_b[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en_mod),
        .D(bram_addr_ld[15]),
        .Q(bram_addr_b[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_5),
        .D(I_WRAP_BRST_n_18),
        .Q(bram_addr_b[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_5),
        .D(I_WRAP_BRST_n_17),
        .Q(bram_addr_b[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_5),
        .D(I_WRAP_BRST_n_16),
        .Q(bram_addr_b[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_5),
        .D(I_WRAP_BRST_n_15),
        .Q(bram_addr_b[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_5),
        .D(I_WRAP_BRST_n_14),
        .Q(bram_addr_b[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_5),
        .D(I_WRAP_BRST_n_13),
        .Q(bram_addr_b[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_5),
        .D(I_WRAP_BRST_n_12),
        .Q(bram_addr_b[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h2F2F2F00)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_3__0 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I1(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I2(bram_addr_ld_en),
        .I3(I_WRAP_BRST_n_2),
        .I4(narrow_bram_addr_inc_d1),
        .O(\GEN_NARROW_CNT.narrow_addr_int[1]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFCFCFEF6F5F5F7)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_4__0 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I1(I_WRAP_BRST_n_26),
        .I2(I_WRAP_BRST_n_27),
        .I3(\GEN_UA_NARROW.I_UA_NARROW_n_0 ),
        .I4(\GEN_UA_NARROW.I_UA_NARROW_n_1 ),
        .I5(\GEN_UA_NARROW.I_UA_NARROW_n_2 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[1]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'hFF08FF19FF3BFF3B)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_5 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I1(I_WRAP_BRST_n_26),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_2 ),
        .I3(I_WRAP_BRST_n_27),
        .I4(\GEN_UA_NARROW.I_UA_NARROW_n_1 ),
        .I5(\GEN_UA_NARROW.I_UA_NARROW_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFEAFFFFFFEA)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_10__0 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_16__0_n_0 ),
        .I1(I_WRAP_BRST_n_26),
        .I2(\GEN_NARROW_CNT.narrow_addr_int[2]_i_17__0_n_0 ),
        .I3(\GEN_NARROW_CNT.narrow_addr_int[2]_i_18__0_n_0 ),
        .I4(\GEN_NARROW_CNT.narrow_addr_int[2]_i_19__0_n_0 ),
        .I5(\GEN_NARROW_CNT.narrow_addr_int[2]_i_20__0_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_10__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_11 
       (.I0(axi_arburst_pipe[1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arburst[1]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFBBBBBBBF)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_12__0 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_21__0_n_0 ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_1 ),
        .I3(\GEN_UA_NARROW.I_UA_NARROW_n_2 ),
        .I4(\GEN_NARROW_CNT.narrow_addr_int[2]_i_22_n_0 ),
        .I5(curr_fixed_burst),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_12__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_13__0 
       (.I0(axi_arlen_pipe[4]),
        .I1(s_axi_arlen[4]),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I3(axi_arlen_pipe[5]),
        .I4(axi_araddr_full),
        .I5(s_axi_arlen[5]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_13__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_14__0 
       (.I0(axi_arlen_pipe[6]),
        .I1(s_axi_arlen[6]),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I3(axi_arlen_pipe[7]),
        .I4(axi_araddr_full),
        .I5(s_axi_arlen[7]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_14__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000003F5F5F003F)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_15__0 
       (.I0(I_WRAP_BRST_n_22),
        .I1(I_WRAP_BRST_n_23),
        .I2(I_WRAP_BRST_n_27),
        .I3(\brst_cnt[6]_i_2_n_0 ),
        .I4(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I5(\brst_cnt[7]_i_3_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_15__0_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_16__0 
       (.I0(I_WRAP_BRST_n_25),
        .I1(axi_rd_burst_two_i_5_n_0),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I3(I_WRAP_BRST_n_24),
        .I4(axi_rd_burst_two_i_6_n_0),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_16__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_17__0 
       (.I0(axi_arlen_pipe[1]),
        .I1(s_axi_arlen[1]),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I3(axi_arlen_pipe[0]),
        .I4(axi_araddr_full),
        .I5(s_axi_arlen[0]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_17__0_n_0 ));
  LUT5 #(
    .INIT(32'hC0AAC0A0)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_18__0 
       (.I0(I_WRAP_BRST_n_22),
        .I1(I_WRAP_BRST_n_23),
        .I2(I_WRAP_BRST_n_27),
        .I3(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I4(I_WRAP_BRST_n_26),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_18__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_19__0 
       (.I0(axi_arlen_pipe[2]),
        .I1(s_axi_arlen[2]),
        .I2(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I3(axi_arlen_pipe[3]),
        .I4(axi_araddr_full),
        .I5(s_axi_arlen[3]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_19__0_n_0 ));
  LUT6 #(
    .INIT(64'h0044034700000000)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_20__0 
       (.I0(axi_arsize_pipe[1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[1]),
        .I3(axi_arsize_pipe[2]),
        .I4(s_axi_arsize[2]),
        .I5(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_20__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000000047034400)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_21__0 
       (.I0(axi_arsize_pipe[2]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[2]),
        .I3(axi_arsize_pipe[1]),
        .I4(s_axi_arsize[1]),
        .I5(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_21__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_22 
       (.I0(\GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg_n_0_[0] ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[0]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA888AAA8A)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_3__0 
       (.I0(bram_addr_ld_en),
        .I1(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I2(s_axi_arsize[1]),
        .I3(axi_araddr_full),
        .I4(axi_arsize_pipe[1]),
        .I5(I_WRAP_BRST_n_27),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_3__0_n_0 ));
  LUT3 #(
    .INIT(8'h4F)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_4__0 
       (.I0(I_WRAP_BRST_n_1),
        .I1(curr_narrow_burst),
        .I2(\GEN_NARROW_CNT.narrow_addr_int[1]_i_3__0_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_4__0_n_0 ));
  LUT4 #(
    .INIT(16'h00FB)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_5__0 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_2 ),
        .I1(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I2(I_WRAP_BRST_n_26),
        .I3(I_WRAP_BRST_n_27),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'h000000005545FFFF)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_6__0 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_7__0_n_0 ),
        .I1(\GEN_NARROW_CNT.narrow_addr_int[2]_i_8__0_n_0 ),
        .I2(\GEN_NARROW_CNT.narrow_addr_int[2]_i_9__0_n_0 ),
        .I3(\GEN_NARROW_CNT.narrow_addr_int[2]_i_10__0_n_0 ),
        .I4(\GEN_NARROW_CNT.narrow_addr_int[2]_i_11_n_0 ),
        .I5(\GEN_NARROW_CNT.narrow_addr_int[2]_i_12__0_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_6__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_7__0 
       (.I0(axi_arburst_pipe[0]),
        .I1(axi_araddr_full),
        .I2(s_axi_arburst[0]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_7__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000E4FF88FFD8FF)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_8__0 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I1(\GEN_NARROW_CNT.narrow_addr_int[2]_i_13__0_n_0 ),
        .I2(\GEN_NARROW_CNT.narrow_addr_int[2]_i_14__0_n_0 ),
        .I3(\GEN_NARROW_CNT.narrow_addr_int[2]_i_15__0_n_0 ),
        .I4(I_WRAP_BRST_n_27),
        .I5(I_WRAP_BRST_n_26),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_8__0_n_0 ));
  LUT6 #(
    .INIT(64'h5500F03355FFFF33)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_9__0 
       (.I0(axi_rd_burst_two_i_6_n_0),
        .I1(axi_rd_burst_two_i_5_n_0),
        .I2(I_WRAP_BRST_n_27),
        .I3(I_WRAP_BRST_n_26),
        .I4(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I5(\GEN_NARROW_CNT.narrow_addr_int[2]_i_14__0_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_9__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT.narrow_addr_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_UA_NARROW.I_UA_NARROW_n_8 ),
        .Q(narrow_addr_int[0]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT.narrow_addr_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .Q(narrow_addr_int[1]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT.narrow_addr_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_UA_NARROW.I_UA_NARROW_n_6 ),
        .Q(narrow_addr_int[2]),
        .R(bram_rst_b));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \GEN_NARROW_CNT.narrow_bram_addr_inc_d1_i_1__0 
       (.I0(I_WRAP_BRST_n_2),
        .O(narrow_bram_addr_inc));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_bram_addr_inc),
        .Q(narrow_bram_addr_inc_d1),
        .R(bram_rst_b));
  LUT5 #(
    .INIT(32'h0DFF0D00)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[0]_i_1__0 
       (.I0(I_WRAP_BRST_n_26),
        .I1(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I2(I_WRAP_BRST_n_27),
        .I3(bram_addr_ld_en),
        .I4(narrow_burst_cnt_ld_reg[0]),
        .O(narrow_burst_cnt_ld_mod[0]));
  LUT6 #(
    .INIT(64'h001DFFFF001D0000)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[1]_i_1__0 
       (.I0(s_axi_arsize[2]),
        .I1(axi_araddr_full),
        .I2(axi_arsize_pipe[2]),
        .I3(I_WRAP_BRST_n_26),
        .I4(bram_addr_ld_en),
        .I5(narrow_burst_cnt_ld_reg[1]),
        .O(narrow_burst_cnt_ld_mod[1]));
  LUT6 #(
    .INIT(64'h02A2FFFF02A20000)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_1__0 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .I1(s_axi_arsize[0]),
        .I2(axi_araddr_full),
        .I3(axi_arsize_pipe[0]),
        .I4(bram_addr_ld_en),
        .I5(narrow_burst_cnt_ld_reg[2]),
        .O(narrow_burst_cnt_ld_mod[2]));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_burst_cnt_ld_mod[0]),
        .Q(narrow_burst_cnt_ld_reg[0]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_burst_cnt_ld_mod[1]),
        .Q(narrow_burst_cnt_ld_reg[1]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_burst_cnt_ld_mod[2]),
        .Q(narrow_burst_cnt_ld_reg[2]),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'h00000000BABA8ABA)) 
    \GEN_NARROW_EN.curr_narrow_burst_i_1__0 
       (.I0(curr_narrow_burst),
        .I1(curr_fixed_burst),
        .I2(\GEN_NARROW_EN.curr_narrow_burst_i_2__0_n_0 ),
        .I3(\GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .I4(\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .I5(\GEN_NARROW_EN.curr_narrow_burst_i_3__0_n_0 ),
        .O(\GEN_NARROW_EN.curr_narrow_burst_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \GEN_NARROW_EN.curr_narrow_burst_i_2__0 
       (.I0(bram_addr_ld_en),
        .I1(last_bram_addr_i_6_n_0),
        .O(\GEN_NARROW_EN.curr_narrow_burst_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h10FF)) 
    \GEN_NARROW_EN.curr_narrow_burst_i_3__0 
       (.I0(pend_rd_op_reg_n_0),
        .I1(bram_addr_ld_en),
        .I2(axi_rlast_set),
        .I3(s_axi_aresetn),
        .O(\GEN_NARROW_EN.curr_narrow_burst_i_3__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_EN.curr_narrow_burst_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NARROW_EN.curr_narrow_burst_i_1__0_n_0 ),
        .Q(curr_narrow_burst),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1 
       (.I0(rd_skid_buf[0]),
        .I1(bram_rddata_b[0]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1_n_0 ),
        .Q(s_axi_rdata[0]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1 
       (.I0(rd_skid_buf[10]),
        .I1(bram_rddata_b[10]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1_n_0 ),
        .Q(s_axi_rdata[10]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1 
       (.I0(rd_skid_buf[11]),
        .I1(bram_rddata_b[11]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1_n_0 ),
        .Q(s_axi_rdata[11]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1 
       (.I0(rd_skid_buf[12]),
        .I1(bram_rddata_b[12]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1_n_0 ),
        .Q(s_axi_rdata[12]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1 
       (.I0(rd_skid_buf[13]),
        .I1(bram_rddata_b[13]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1_n_0 ),
        .Q(s_axi_rdata[13]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1 
       (.I0(rd_skid_buf[14]),
        .I1(bram_rddata_b[14]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1_n_0 ),
        .Q(s_axi_rdata[14]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1 
       (.I0(rd_skid_buf[15]),
        .I1(bram_rddata_b[15]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1_n_0 ),
        .Q(s_axi_rdata[15]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1 
       (.I0(rd_skid_buf[16]),
        .I1(bram_rddata_b[16]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int_reg[16] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1_n_0 ),
        .Q(s_axi_rdata[16]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1 
       (.I0(rd_skid_buf[17]),
        .I1(bram_rddata_b[17]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int_reg[17] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1_n_0 ),
        .Q(s_axi_rdata[17]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1 
       (.I0(rd_skid_buf[18]),
        .I1(bram_rddata_b[18]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int_reg[18] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1_n_0 ),
        .Q(s_axi_rdata[18]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1 
       (.I0(rd_skid_buf[19]),
        .I1(bram_rddata_b[19]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int_reg[19] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1_n_0 ),
        .Q(s_axi_rdata[19]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1 
       (.I0(rd_skid_buf[1]),
        .I1(bram_rddata_b[1]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1_n_0 ),
        .Q(s_axi_rdata[1]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1 
       (.I0(rd_skid_buf[20]),
        .I1(bram_rddata_b[20]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int_reg[20] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1_n_0 ),
        .Q(s_axi_rdata[20]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1 
       (.I0(rd_skid_buf[21]),
        .I1(bram_rddata_b[21]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int_reg[21] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1_n_0 ),
        .Q(s_axi_rdata[21]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1 
       (.I0(rd_skid_buf[22]),
        .I1(bram_rddata_b[22]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int_reg[22] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1_n_0 ),
        .Q(s_axi_rdata[22]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1 
       (.I0(rd_skid_buf[23]),
        .I1(bram_rddata_b[23]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int_reg[23] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1_n_0 ),
        .Q(s_axi_rdata[23]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1 
       (.I0(rd_skid_buf[24]),
        .I1(bram_rddata_b[24]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int_reg[24] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1_n_0 ),
        .Q(s_axi_rdata[24]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1 
       (.I0(rd_skid_buf[25]),
        .I1(bram_rddata_b[25]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int_reg[25] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1_n_0 ),
        .Q(s_axi_rdata[25]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1 
       (.I0(rd_skid_buf[26]),
        .I1(bram_rddata_b[26]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int_reg[26] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1_n_0 ),
        .Q(s_axi_rdata[26]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1 
       (.I0(rd_skid_buf[27]),
        .I1(bram_rddata_b[27]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int_reg[27] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1_n_0 ),
        .Q(s_axi_rdata[27]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1 
       (.I0(rd_skid_buf[28]),
        .I1(bram_rddata_b[28]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int_reg[28] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1_n_0 ),
        .Q(s_axi_rdata[28]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1 
       (.I0(rd_skid_buf[29]),
        .I1(bram_rddata_b[29]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int_reg[29] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1_n_0 ),
        .Q(s_axi_rdata[29]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1 
       (.I0(rd_skid_buf[2]),
        .I1(bram_rddata_b[2]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1_n_0 ),
        .Q(s_axi_rdata[2]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1 
       (.I0(rd_skid_buf[30]),
        .I1(bram_rddata_b[30]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int_reg[30] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1_n_0 ),
        .Q(s_axi_rdata[30]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1 
       (.I0(rd_skid_buf[31]),
        .I1(bram_rddata_b[31]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int_reg[31] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ),
        .Q(s_axi_rdata[31]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[32].axi_rdata_int[32]_i_1 
       (.I0(rd_skid_buf[32]),
        .I1(bram_rddata_b[32]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[32].axi_rdata_int[32]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[32].axi_rdata_int_reg[32] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[32].axi_rdata_int[32]_i_1_n_0 ),
        .Q(s_axi_rdata[32]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[33].axi_rdata_int[33]_i_1 
       (.I0(rd_skid_buf[33]),
        .I1(bram_rddata_b[33]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[33].axi_rdata_int[33]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[33].axi_rdata_int_reg[33] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[33].axi_rdata_int[33]_i_1_n_0 ),
        .Q(s_axi_rdata[33]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[34].axi_rdata_int[34]_i_1 
       (.I0(rd_skid_buf[34]),
        .I1(bram_rddata_b[34]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[34].axi_rdata_int[34]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[34].axi_rdata_int_reg[34] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[34].axi_rdata_int[34]_i_1_n_0 ),
        .Q(s_axi_rdata[34]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[35].axi_rdata_int[35]_i_1 
       (.I0(rd_skid_buf[35]),
        .I1(bram_rddata_b[35]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[35].axi_rdata_int[35]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[35].axi_rdata_int_reg[35] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[35].axi_rdata_int[35]_i_1_n_0 ),
        .Q(s_axi_rdata[35]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[36].axi_rdata_int[36]_i_1 
       (.I0(rd_skid_buf[36]),
        .I1(bram_rddata_b[36]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[36].axi_rdata_int[36]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[36].axi_rdata_int_reg[36] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[36].axi_rdata_int[36]_i_1_n_0 ),
        .Q(s_axi_rdata[36]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[37].axi_rdata_int[37]_i_1 
       (.I0(rd_skid_buf[37]),
        .I1(bram_rddata_b[37]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[37].axi_rdata_int[37]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[37].axi_rdata_int_reg[37] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[37].axi_rdata_int[37]_i_1_n_0 ),
        .Q(s_axi_rdata[37]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[38].axi_rdata_int[38]_i_1 
       (.I0(rd_skid_buf[38]),
        .I1(bram_rddata_b[38]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[38].axi_rdata_int[38]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[38].axi_rdata_int_reg[38] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[38].axi_rdata_int[38]_i_1_n_0 ),
        .Q(s_axi_rdata[38]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[39].axi_rdata_int[39]_i_1 
       (.I0(rd_skid_buf[39]),
        .I1(bram_rddata_b[39]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[39].axi_rdata_int[39]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[39].axi_rdata_int_reg[39] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[39].axi_rdata_int[39]_i_1_n_0 ),
        .Q(s_axi_rdata[39]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1 
       (.I0(rd_skid_buf[3]),
        .I1(bram_rddata_b[3]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1_n_0 ),
        .Q(s_axi_rdata[3]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[40].axi_rdata_int[40]_i_1 
       (.I0(rd_skid_buf[40]),
        .I1(bram_rddata_b[40]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[40].axi_rdata_int[40]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[40].axi_rdata_int_reg[40] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[40].axi_rdata_int[40]_i_1_n_0 ),
        .Q(s_axi_rdata[40]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[41].axi_rdata_int[41]_i_1 
       (.I0(rd_skid_buf[41]),
        .I1(bram_rddata_b[41]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[41].axi_rdata_int[41]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[41].axi_rdata_int_reg[41] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[41].axi_rdata_int[41]_i_1_n_0 ),
        .Q(s_axi_rdata[41]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[42].axi_rdata_int[42]_i_1 
       (.I0(rd_skid_buf[42]),
        .I1(bram_rddata_b[42]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[42].axi_rdata_int[42]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[42].axi_rdata_int_reg[42] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[42].axi_rdata_int[42]_i_1_n_0 ),
        .Q(s_axi_rdata[42]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[43].axi_rdata_int[43]_i_1 
       (.I0(rd_skid_buf[43]),
        .I1(bram_rddata_b[43]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[43].axi_rdata_int[43]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[43].axi_rdata_int_reg[43] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[43].axi_rdata_int[43]_i_1_n_0 ),
        .Q(s_axi_rdata[43]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[44].axi_rdata_int[44]_i_1 
       (.I0(rd_skid_buf[44]),
        .I1(bram_rddata_b[44]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[44].axi_rdata_int[44]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[44].axi_rdata_int_reg[44] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[44].axi_rdata_int[44]_i_1_n_0 ),
        .Q(s_axi_rdata[44]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[45].axi_rdata_int[45]_i_1 
       (.I0(rd_skid_buf[45]),
        .I1(bram_rddata_b[45]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[45].axi_rdata_int[45]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[45].axi_rdata_int_reg[45] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[45].axi_rdata_int[45]_i_1_n_0 ),
        .Q(s_axi_rdata[45]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[46].axi_rdata_int[46]_i_1 
       (.I0(rd_skid_buf[46]),
        .I1(bram_rddata_b[46]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[46].axi_rdata_int[46]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[46].axi_rdata_int_reg[46] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[46].axi_rdata_int[46]_i_1_n_0 ),
        .Q(s_axi_rdata[46]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[47].axi_rdata_int[47]_i_1 
       (.I0(rd_skid_buf[47]),
        .I1(bram_rddata_b[47]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[47].axi_rdata_int[47]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[47].axi_rdata_int_reg[47] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[47].axi_rdata_int[47]_i_1_n_0 ),
        .Q(s_axi_rdata[47]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[48].axi_rdata_int[48]_i_1 
       (.I0(rd_skid_buf[48]),
        .I1(bram_rddata_b[48]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[48].axi_rdata_int[48]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[48].axi_rdata_int_reg[48] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[48].axi_rdata_int[48]_i_1_n_0 ),
        .Q(s_axi_rdata[48]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[49].axi_rdata_int[49]_i_1 
       (.I0(rd_skid_buf[49]),
        .I1(bram_rddata_b[49]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[49].axi_rdata_int[49]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[49].axi_rdata_int_reg[49] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[49].axi_rdata_int[49]_i_1_n_0 ),
        .Q(s_axi_rdata[49]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1 
       (.I0(rd_skid_buf[4]),
        .I1(bram_rddata_b[4]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1_n_0 ),
        .Q(s_axi_rdata[4]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[50].axi_rdata_int[50]_i_1 
       (.I0(rd_skid_buf[50]),
        .I1(bram_rddata_b[50]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[50].axi_rdata_int[50]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[50].axi_rdata_int_reg[50] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[50].axi_rdata_int[50]_i_1_n_0 ),
        .Q(s_axi_rdata[50]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[51].axi_rdata_int[51]_i_1 
       (.I0(rd_skid_buf[51]),
        .I1(bram_rddata_b[51]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[51].axi_rdata_int[51]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[51].axi_rdata_int_reg[51] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[51].axi_rdata_int[51]_i_1_n_0 ),
        .Q(s_axi_rdata[51]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[52].axi_rdata_int[52]_i_1 
       (.I0(rd_skid_buf[52]),
        .I1(bram_rddata_b[52]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[52].axi_rdata_int[52]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[52].axi_rdata_int_reg[52] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[52].axi_rdata_int[52]_i_1_n_0 ),
        .Q(s_axi_rdata[52]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[53].axi_rdata_int[53]_i_1 
       (.I0(rd_skid_buf[53]),
        .I1(bram_rddata_b[53]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[53].axi_rdata_int[53]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[53].axi_rdata_int_reg[53] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[53].axi_rdata_int[53]_i_1_n_0 ),
        .Q(s_axi_rdata[53]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[54].axi_rdata_int[54]_i_1 
       (.I0(rd_skid_buf[54]),
        .I1(bram_rddata_b[54]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[54].axi_rdata_int[54]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[54].axi_rdata_int_reg[54] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[54].axi_rdata_int[54]_i_1_n_0 ),
        .Q(s_axi_rdata[54]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[55].axi_rdata_int[55]_i_1 
       (.I0(rd_skid_buf[55]),
        .I1(bram_rddata_b[55]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[55].axi_rdata_int[55]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[55].axi_rdata_int_reg[55] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[55].axi_rdata_int[55]_i_1_n_0 ),
        .Q(s_axi_rdata[55]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[56].axi_rdata_int[56]_i_1 
       (.I0(rd_skid_buf[56]),
        .I1(bram_rddata_b[56]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[56].axi_rdata_int[56]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[56].axi_rdata_int_reg[56] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[56].axi_rdata_int[56]_i_1_n_0 ),
        .Q(s_axi_rdata[56]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[57].axi_rdata_int[57]_i_1 
       (.I0(rd_skid_buf[57]),
        .I1(bram_rddata_b[57]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[57].axi_rdata_int[57]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[57].axi_rdata_int_reg[57] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[57].axi_rdata_int[57]_i_1_n_0 ),
        .Q(s_axi_rdata[57]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[58].axi_rdata_int[58]_i_1 
       (.I0(rd_skid_buf[58]),
        .I1(bram_rddata_b[58]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[58].axi_rdata_int[58]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[58].axi_rdata_int_reg[58] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[58].axi_rdata_int[58]_i_1_n_0 ),
        .Q(s_axi_rdata[58]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[59].axi_rdata_int[59]_i_1 
       (.I0(rd_skid_buf[59]),
        .I1(bram_rddata_b[59]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[59].axi_rdata_int[59]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[59].axi_rdata_int_reg[59] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[59].axi_rdata_int[59]_i_1_n_0 ),
        .Q(s_axi_rdata[59]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1 
       (.I0(rd_skid_buf[5]),
        .I1(bram_rddata_b[5]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1_n_0 ),
        .Q(s_axi_rdata[5]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[60].axi_rdata_int[60]_i_1 
       (.I0(rd_skid_buf[60]),
        .I1(bram_rddata_b[60]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[60].axi_rdata_int[60]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[60].axi_rdata_int_reg[60] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[60].axi_rdata_int[60]_i_1_n_0 ),
        .Q(s_axi_rdata[60]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[61].axi_rdata_int[61]_i_1 
       (.I0(rd_skid_buf[61]),
        .I1(bram_rddata_b[61]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[61].axi_rdata_int[61]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[61].axi_rdata_int_reg[61] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[61].axi_rdata_int[61]_i_1_n_0 ),
        .Q(s_axi_rdata[61]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[62].axi_rdata_int[62]_i_1 
       (.I0(rd_skid_buf[62]),
        .I1(bram_rddata_b[62]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[62].axi_rdata_int[62]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[62].axi_rdata_int_reg[62] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[62].axi_rdata_int[62]_i_1_n_0 ),
        .Q(s_axi_rdata[62]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h08FF)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1 
       (.I0(s_axi_rready),
        .I1(s_axi_rlast),
        .I2(axi_b2b_brst),
        .I3(s_axi_aresetn),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1410540414005404)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2 
       (.I0(rd_data_sm_cs[3]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_adv_buf75_out),
        .I4(rd_data_sm_cs[0]),
        .I5(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_5_n_0 ),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_3 
       (.I0(rd_skid_buf[63]),
        .I1(bram_rddata_b[63]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_4 
       (.I0(s_axi_rvalid),
        .I1(s_axi_rready),
        .O(rd_adv_buf75_out));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_5 
       (.I0(act_rd_burst),
        .I1(act_rd_burst_two),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int_reg[63] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_3_n_0 ),
        .Q(s_axi_rdata[63]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1 
       (.I0(rd_skid_buf[6]),
        .I1(bram_rddata_b[6]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1_n_0 ),
        .Q(s_axi_rdata[6]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1 
       (.I0(rd_skid_buf[7]),
        .I1(bram_rddata_b[7]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1_n_0 ),
        .Q(s_axi_rdata[7]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1 
       (.I0(rd_skid_buf[8]),
        .I1(bram_rddata_b[8]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1_n_0 ),
        .Q(s_axi_rdata[8]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1 
       (.I0(rd_skid_buf[9]),
        .I1(bram_rddata_b[9]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1_n_0 ),
        .Q(s_axi_rdata[9]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAEAA)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf[63]_i_1 
       (.I0(rd_skid_buf_ld_reg),
        .I1(rd_adv_buf75_out),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[3]),
        .O(rd_skid_buf_ld));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[0] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[0]),
        .Q(rd_skid_buf[0]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[10] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[10]),
        .Q(rd_skid_buf[10]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[11] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[11]),
        .Q(rd_skid_buf[11]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[12] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[12]),
        .Q(rd_skid_buf[12]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[13] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[13]),
        .Q(rd_skid_buf[13]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[14] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[14]),
        .Q(rd_skid_buf[14]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[15] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[15]),
        .Q(rd_skid_buf[15]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[16] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[16]),
        .Q(rd_skid_buf[16]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[17] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[17]),
        .Q(rd_skid_buf[17]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[18] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[18]),
        .Q(rd_skid_buf[18]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[19] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[19]),
        .Q(rd_skid_buf[19]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[1] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[1]),
        .Q(rd_skid_buf[1]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[20] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[20]),
        .Q(rd_skid_buf[20]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[21] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[21]),
        .Q(rd_skid_buf[21]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[22] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[22]),
        .Q(rd_skid_buf[22]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[23] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[23]),
        .Q(rd_skid_buf[23]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[24] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[24]),
        .Q(rd_skid_buf[24]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[25] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[25]),
        .Q(rd_skid_buf[25]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[26] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[26]),
        .Q(rd_skid_buf[26]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[27] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[27]),
        .Q(rd_skid_buf[27]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[28] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[28]),
        .Q(rd_skid_buf[28]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[29] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[29]),
        .Q(rd_skid_buf[29]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[2] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[2]),
        .Q(rd_skid_buf[2]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[30] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[30]),
        .Q(rd_skid_buf[30]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[31] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[31]),
        .Q(rd_skid_buf[31]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[32] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[32]),
        .Q(rd_skid_buf[32]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[33] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[33]),
        .Q(rd_skid_buf[33]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[34] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[34]),
        .Q(rd_skid_buf[34]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[35] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[35]),
        .Q(rd_skid_buf[35]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[36] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[36]),
        .Q(rd_skid_buf[36]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[37] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[37]),
        .Q(rd_skid_buf[37]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[38] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[38]),
        .Q(rd_skid_buf[38]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[39] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[39]),
        .Q(rd_skid_buf[39]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[3] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[3]),
        .Q(rd_skid_buf[3]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[40] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[40]),
        .Q(rd_skid_buf[40]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[41] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[41]),
        .Q(rd_skid_buf[41]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[42] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[42]),
        .Q(rd_skid_buf[42]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[43] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[43]),
        .Q(rd_skid_buf[43]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[44] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[44]),
        .Q(rd_skid_buf[44]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[45] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[45]),
        .Q(rd_skid_buf[45]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[46] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[46]),
        .Q(rd_skid_buf[46]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[47] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[47]),
        .Q(rd_skid_buf[47]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[48] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[48]),
        .Q(rd_skid_buf[48]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[49] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[49]),
        .Q(rd_skid_buf[49]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[4] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[4]),
        .Q(rd_skid_buf[4]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[50] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[50]),
        .Q(rd_skid_buf[50]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[51] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[51]),
        .Q(rd_skid_buf[51]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[52] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[52]),
        .Q(rd_skid_buf[52]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[53] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[53]),
        .Q(rd_skid_buf[53]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[54] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[54]),
        .Q(rd_skid_buf[54]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[55] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[55]),
        .Q(rd_skid_buf[55]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[56] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[56]),
        .Q(rd_skid_buf[56]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[57] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[57]),
        .Q(rd_skid_buf[57]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[58] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[58]),
        .Q(rd_skid_buf[58]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[59] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[59]),
        .Q(rd_skid_buf[59]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[5] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[5]),
        .Q(rd_skid_buf[5]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[60] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[60]),
        .Q(rd_skid_buf[60]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[61] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[61]),
        .Q(rd_skid_buf[61]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[62] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[62]),
        .Q(rd_skid_buf[62]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[63] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[63]),
        .Q(rd_skid_buf[63]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[6] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[6]),
        .Q(rd_skid_buf[6]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[7] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[7]),
        .Q(rd_skid_buf[7]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[8] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[8]),
        .Q(rd_skid_buf[8]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[9] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_b[9]),
        .Q(rd_skid_buf[9]),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'hE200E200F0000000)) 
    \GEN_RID.axi_rid_int[0]_i_1 
       (.I0(s_axi_rid),
        .I1(axi_rvalid_set),
        .I2(axi_rid_temp),
        .I3(s_axi_aresetn),
        .I4(axi_b2b_brst),
        .I5(\GEN_RID.axi_rid_int[0]_i_2_n_0 ),
        .O(\GEN_RID.axi_rid_int[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \GEN_RID.axi_rid_int[0]_i_2 
       (.I0(s_axi_rready),
        .I1(s_axi_rlast),
        .O(\GEN_RID.axi_rid_int[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RID.axi_rid_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_RID.axi_rid_int[0]_i_1_n_0 ),
        .Q(s_axi_rid),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \GEN_RID.axi_rid_temp2[0]_i_1 
       (.I0(axi_arid_pipe),
        .I1(axi_araddr_full),
        .I2(s_axi_arid),
        .I3(axi_rid_temp_full),
        .I4(bram_addr_ld_en),
        .I5(\GEN_RID.axi_rid_temp2_reg_n_0_[0] ),
        .O(\GEN_RID.axi_rid_temp2[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h08080000C8C800C0)) 
    \GEN_RID.axi_rid_temp2_full_i_1 
       (.I0(bram_addr_ld_en),
        .I1(s_axi_aresetn),
        .I2(axi_rid_temp2_full),
        .I3(axi_rid_temp_full_d1),
        .I4(axi_rid_temp_full),
        .I5(p_4_out),
        .O(\GEN_RID.axi_rid_temp2_full_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RID.axi_rid_temp2_full_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_RID.axi_rid_temp2_full_i_1_n_0 ),
        .Q(axi_rid_temp2_full),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RID.axi_rid_temp2_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_RID.axi_rid_temp2[0]_i_1_n_0 ),
        .Q(\GEN_RID.axi_rid_temp2_reg_n_0_[0] ),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'hCFAACFCFC0AAC0C0)) 
    \GEN_RID.axi_rid_temp[0]_i_1 
       (.I0(axi_rid_temp2),
        .I1(\GEN_RID.axi_rid_temp2_reg_n_0_[0] ),
        .I2(\GEN_RID.axi_rid_temp[0]_i_3_n_0 ),
        .I3(axi_rid_temp_full),
        .I4(bram_addr_ld_en),
        .I5(axi_rid_temp),
        .O(\GEN_RID.axi_rid_temp[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_RID.axi_rid_temp[0]_i_2 
       (.I0(axi_arid_pipe),
        .I1(axi_araddr_full),
        .I2(s_axi_arid),
        .O(axi_rid_temp2));
  LUT6 #(
    .INIT(64'hAA08AAAAAA08AA08)) 
    \GEN_RID.axi_rid_temp[0]_i_3 
       (.I0(axi_rid_temp2_full),
        .I1(axi_rid_temp_full_d1),
        .I2(axi_rid_temp_full),
        .I3(axi_rvalid_set),
        .I4(\GEN_RID.axi_rid_int[0]_i_2_n_0 ),
        .I5(axi_b2b_brst),
        .O(\GEN_RID.axi_rid_temp[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RID.axi_rid_temp_full_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rid_temp_full),
        .Q(axi_rid_temp_full_d1),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'hF0F0F0E000F0A0A0)) 
    \GEN_RID.axi_rid_temp_full_i_1 
       (.I0(bram_addr_ld_en),
        .I1(axi_rid_temp_full_d1),
        .I2(s_axi_aresetn),
        .I3(p_4_out),
        .I4(axi_rid_temp_full),
        .I5(axi_rid_temp2_full),
        .O(\GEN_RID.axi_rid_temp_full_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hEAAA)) 
    \GEN_RID.axi_rid_temp_full_i_2 
       (.I0(axi_rvalid_set),
        .I1(s_axi_rready),
        .I2(s_axi_rlast),
        .I3(axi_b2b_brst),
        .O(p_4_out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RID.axi_rid_temp_full_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_RID.axi_rid_temp_full_i_1_n_0 ),
        .Q(axi_rid_temp_full),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RID.axi_rid_temp_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_RID.axi_rid_temp[0]_i_1_n_0 ),
        .Q(axi_rid_temp),
        .R(bram_rst_b));
  axi_bram_ctrl_0_ua_narrow_0 \GEN_UA_NARROW.I_UA_NARROW 
       (.D(narrow_burst_cnt_ld_mod),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] (\GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg_n_0_[0] ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] (\GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg_n_0_[1] ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2] (\GEN_NARROW_CNT.narrow_addr_int[2]_i_5__0_n_0 ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2]_0 (\GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg_n_0_[2] ),
        .\GEN_AR_PIPE_DUAL.axi_araddr_full_reg (\GEN_NARROW_CNT.narrow_addr_int[2]_i_3__0_n_0 ),
        .\GEN_AR_PIPE_DUAL.axi_arburst_pipe_reg[0] (\GEN_NARROW_CNT.narrow_addr_int[2]_i_6__0_n_0 ),
        .\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] (\GEN_NARROW_CNT.narrow_addr_int[1]_i_4__0_n_0 ),
        .\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0]_0 (\GEN_NARROW_CNT.narrow_addr_int[1]_i_5_n_0 ),
        .\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] (I_WRAP_BRST_n_26),
        .\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] (I_WRAP_BRST_n_27),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[0] (\GEN_UA_NARROW.I_UA_NARROW_n_8 ),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[1] (\GEN_UA_NARROW.I_UA_NARROW_n_0 ),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[1]_0 (\GEN_UA_NARROW.I_UA_NARROW_n_1 ),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[1]_1 (\GEN_UA_NARROW.I_UA_NARROW_n_7 ),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[2] (\GEN_UA_NARROW.I_UA_NARROW_n_2 ),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 (\GEN_UA_NARROW.I_UA_NARROW_n_6 ),
        .\GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg (\GEN_NARROW_CNT.narrow_addr_int[1]_i_3__0_n_0 ),
        .\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] (\GEN_UA_NARROW.I_UA_NARROW_n_5 ),
        .\GEN_NARROW_EN.curr_narrow_burst_reg (\GEN_UA_NARROW.I_UA_NARROW_n_4 ),
        .\GEN_NARROW_EN.curr_narrow_burst_reg_0 (\GEN_NARROW_CNT.narrow_addr_int[2]_i_4__0_n_0 ),
        .Q(axi_arsize_pipe),
        .axi_araddr_full(axi_araddr_full),
        .curr_narrow_burst(curr_narrow_burst),
        .narrow_addr_int(narrow_addr_int),
        .\rd_data_sm_cs_reg[1] (I_WRAP_BRST_n_1),
        .s_axi_araddr(s_axi_araddr[2:0]),
        .s_axi_arsize(s_axi_arsize),
        .\wrap_burst_total_reg[1] (\GEN_UA_NARROW.I_UA_NARROW_n_3 ));
  axi_bram_ctrl_0_wrap_brst_1 I_WRAP_BRST
       (.D({bram_addr_ld,I_WRAP_BRST_n_10,I_WRAP_BRST_n_11,I_WRAP_BRST_n_12,I_WRAP_BRST_n_13,I_WRAP_BRST_n_14,I_WRAP_BRST_n_15,I_WRAP_BRST_n_16,I_WRAP_BRST_n_17,I_WRAP_BRST_n_18}),
        .E({bram_addr_ld_en_mod,I_WRAP_BRST_n_5}),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg (\GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg[10] (\GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_3_n_0 ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg (\GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg[11] (\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_7_n_0 ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg (\GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg (\GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg (\GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[15].axi_araddr_pipe_reg (\GEN_AR_PIPE_DUAL.GEN_ARADDR[15].axi_araddr_pipe_reg ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg (\GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg (\GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg[4] (\GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_3_n_0 ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg (\GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg[5] (\GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_4_n_0 ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg (\GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg[6] (\GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_4_n_0 ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg (\GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg[7] (\GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_3_n_0 ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg (\GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg[8] (\GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_3_n_0 ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg (\GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ),
        .\GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg[9] (\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_3_n_0 ),
        .\GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg (\GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg_n_0 ),
        .\GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] (axi_arlen_pipe[3:0]),
        .\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] (\GEN_UA_NARROW.I_UA_NARROW_n_3 ),
        .\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] (axi_arsize_pipe[2:1]),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] (I_WRAP_BRST_n_1),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0 (I_WRAP_BRST_n_2),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_1 (I_WRAP_BRST_n_20),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_2 (\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_6_n_0 ),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] (\GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_2_n_0 ),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] (\GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_2_n_0 ),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] (I_WRAP_BRST_n_19),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]_0 (\GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_2_n_0 ),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] (\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2_n_0 ),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] (\GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_2_n_0 ),
        .Q(rd_data_sm_cs),
        .SR(bram_rst_b),
        .ar_active(ar_active),
        .axi_araddr_full(axi_araddr_full),
        .axi_aresetn_d2(axi_aresetn_d2),
        .axi_arlen_pipe_1_or_2(axi_arlen_pipe_1_or_2),
        .axi_arsize_pipe_max(axi_arsize_pipe_max),
        .axi_b2b_brst(axi_b2b_brst),
        .axi_rd_burst(axi_rd_burst),
        .axi_rd_burst_two_reg(I_WRAP_BRST_n_23),
        .axi_rd_burst_two_reg_0(axi_rd_burst_two_reg_n_0),
        .axi_rvalid_int_reg(s_axi_rvalid),
        .bram_addr_b(bram_addr_b[7:0]),
        .bram_addr_ld_en(bram_addr_ld_en),
        .brst_zero(brst_zero),
        .curr_fixed_burst_reg(curr_fixed_burst_reg),
        .curr_narrow_burst(curr_narrow_burst),
        .curr_wrap_burst_reg(curr_wrap_burst_reg),
        .disable_b2b_brst(disable_b2b_brst),
        .end_brst_rd(end_brst_rd),
        .last_bram_addr(last_bram_addr),
        .narrow_addr_int(narrow_addr_int),
        .narrow_bram_addr_inc_d1(narrow_bram_addr_inc_d1),
        .no_ar_ack(no_ar_ack),
        .pend_rd_op_reg(pend_rd_op_reg_n_0),
        .rd_addr_sm_cs(rd_addr_sm_cs),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[15:3]),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arlen(s_axi_arlen[3:0]),
        .s_axi_arsize(s_axi_arsize[2:1]),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_rready(s_axi_rready),
        .\save_init_bram_addr_ld_reg[15]_0 (I_WRAP_BRST_n_21),
        .\wrap_burst_total_reg[0]_0 (I_WRAP_BRST_n_22),
        .\wrap_burst_total_reg[1]_0 (I_WRAP_BRST_n_24),
        .\wrap_burst_total_reg[1]_1 (I_WRAP_BRST_n_25),
        .\wrap_burst_total_reg[1]_2 (I_WRAP_BRST_n_26),
        .\wrap_burst_total_reg[1]_3 (I_WRAP_BRST_n_27));
  LUT6 #(
    .INIT(64'h0000000022E2EEE2)) 
    act_rd_burst_i_1
       (.I0(act_rd_burst),
        .I1(act_rd_burst_i_2_n_0),
        .I2(axi_rd_burst),
        .I3(bram_addr_ld_en),
        .I4(axi_rd_burst_two),
        .I5(act_rd_burst_i_4_n_0),
        .O(act_rd_burst_i_1_n_0));
  LUT6 #(
    .INIT(64'h5454555454545454)) 
    act_rd_burst_i_2
       (.I0(\rd_data_sm_cs[1]_i_2_n_0 ),
        .I1(axi_b2b_brst_i_2_n_0),
        .I2(act_rd_burst_i_5_n_0),
        .I3(act_rd_burst_i_6_n_0),
        .I4(last_bram_addr_i_6_n_0),
        .I5(bram_addr_ld_en),
        .O(act_rd_burst_i_2_n_0));
  LUT4 #(
    .INIT(16'hA808)) 
    act_rd_burst_i_3
       (.I0(axi_rd_burst_two_i_3_n_0),
        .I1(s_axi_arlen[0]),
        .I2(axi_araddr_full),
        .I3(axi_arlen_pipe[0]),
        .O(axi_rd_burst_two));
  LUT6 #(
    .INIT(64'h02000004FFFFFFFF)) 
    act_rd_burst_i_4
       (.I0(rd_data_sm_cs[2]),
        .I1(rd_data_sm_cs[3]),
        .I2(\rd_data_sm_cs[3]_i_7_n_0 ),
        .I3(rd_data_sm_cs[1]),
        .I4(rd_data_sm_cs[0]),
        .I5(s_axi_aresetn),
        .O(act_rd_burst_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0E00)) 
    act_rd_burst_i_5
       (.I0(axi_rd_burst),
        .I1(axi_rd_burst_two_reg_n_0),
        .I2(rd_data_sm_cs[1]),
        .I3(rd_data_sm_cs[0]),
        .O(act_rd_burst_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h1)) 
    act_rd_burst_i_6
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .O(act_rd_burst_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    act_rd_burst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(act_rd_burst_i_1_n_0),
        .Q(act_rd_burst),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h00E2)) 
    act_rd_burst_two_i_1
       (.I0(act_rd_burst_two),
        .I1(act_rd_burst_i_2_n_0),
        .I2(act_rd_burst_two_i_2_n_0),
        .I3(act_rd_burst_i_4_n_0),
        .O(act_rd_burst_two_i_1_n_0));
  LUT6 #(
    .INIT(64'hA808FFFFA8080000)) 
    act_rd_burst_two_i_2
       (.I0(axi_rd_burst_two_i_3_n_0),
        .I1(s_axi_arlen[0]),
        .I2(axi_araddr_full),
        .I3(axi_arlen_pipe[0]),
        .I4(bram_addr_ld_en),
        .I5(axi_rd_burst_two_reg_n_0),
        .O(act_rd_burst_two_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    act_rd_burst_two_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(act_rd_burst_two_i_1_n_0),
        .Q(act_rd_burst_two),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h08FF0800)) 
    axi_arsize_pipe_max_i_1
       (.I0(s_axi_arsize[0]),
        .I1(s_axi_arsize[1]),
        .I2(s_axi_arsize[2]),
        .I3(araddr_pipe_ld44_out),
        .I4(axi_arsize_pipe_max),
        .O(axi_arsize_pipe_max_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_arsize_pipe_max_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_arsize_pipe_max_i_1_n_0),
        .Q(axi_arsize_pipe_max),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'hCC0CCC55CC0CCCCC)) 
    axi_b2b_brst_i_1
       (.I0(I_WRAP_BRST_n_21),
        .I1(axi_b2b_brst),
        .I2(\rd_data_sm_cs[2]_i_3_n_0 ),
        .I3(rd_data_sm_cs[3]),
        .I4(rd_data_sm_cs[2]),
        .I5(axi_b2b_brst_i_2_n_0),
        .O(axi_b2b_brst_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000088880080)) 
    axi_b2b_brst_i_2
       (.I0(\rd_data_sm_cs[0]_i_3_n_0 ),
        .I1(rd_adv_buf75_out),
        .I2(end_brst_rd),
        .I3(axi_b2b_brst),
        .I4(brst_zero),
        .I5(I_WRAP_BRST_n_21),
        .O(axi_b2b_brst_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_b2b_brst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_b2b_brst_i_1_n_0),
        .Q(axi_b2b_brst),
        .R(bram_rst_b));
  LUT5 #(
    .INIT(32'h303000A0)) 
    axi_rd_burst_i_1
       (.I0(axi_rd_burst),
        .I1(axi_rd_burst_two_i_3_n_0),
        .I2(s_axi_aresetn),
        .I3(brst_zero),
        .I4(bram_addr_ld_en),
        .O(axi_rd_burst_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rd_burst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rd_burst_i_1_n_0),
        .Q(axi_rd_burst),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hC000C0000000AA00)) 
    axi_rd_burst_two_i_1
       (.I0(axi_rd_burst_two_reg_n_0),
        .I1(I_WRAP_BRST_n_23),
        .I2(axi_rd_burst_two_i_3_n_0),
        .I3(s_axi_aresetn),
        .I4(brst_zero),
        .I5(bram_addr_ld_en),
        .O(axi_rd_burst_two_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000002)) 
    axi_rd_burst_two_i_3
       (.I0(axi_rd_burst_two_i_4_n_0),
        .I1(\brst_cnt[7]_i_3_n_0 ),
        .I2(\brst_cnt[6]_i_2_n_0 ),
        .I3(axi_rd_burst_two_i_5_n_0),
        .I4(axi_rd_burst_two_i_6_n_0),
        .O(axi_rd_burst_two_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000511110005)) 
    axi_rd_burst_two_i_4
       (.I0(I_WRAP_BRST_n_24),
        .I1(axi_arlen_pipe[3]),
        .I2(s_axi_arlen[3]),
        .I3(s_axi_arlen[1]),
        .I4(axi_araddr_full),
        .I5(axi_arlen_pipe[1]),
        .O(axi_rd_burst_two_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    axi_rd_burst_two_i_5
       (.I0(axi_arlen_pipe[5]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[5]),
        .O(axi_rd_burst_two_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    axi_rd_burst_two_i_6
       (.I0(axi_arlen_pipe[4]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[4]),
        .O(axi_rd_burst_two_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rd_burst_two_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rd_burst_two_i_1_n_0),
        .Q(axi_rd_burst_two_reg_n_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h88A8)) 
    axi_rlast_int_i_1
       (.I0(s_axi_aresetn),
        .I1(axi_rlast_set),
        .I2(s_axi_rlast),
        .I3(s_axi_rready),
        .O(axi_rlast_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rlast_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rlast_int_i_1_n_0),
        .Q(s_axi_rlast),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFF00FE000000FE00)) 
    axi_rvalid_clr_ok_i_1
       (.I0(axi_rvalid_clr_ok),
        .I1(axi_rvalid_clr_ok_i_2_n_0),
        .I2(axi_rvalid_clr_ok_i_3_n_0),
        .I3(s_axi_aresetn),
        .I4(bram_addr_ld_en),
        .I5(\GEN_ARREADY.axi_early_arready_int_i_4_n_0 ),
        .O(axi_rvalid_clr_ok_i_1_n_0));
  LUT4 #(
    .INIT(16'h00E0)) 
    axi_rvalid_clr_ok_i_2
       (.I0(disable_b2b_brst_cmb),
        .I1(disable_b2b_brst),
        .I2(last_bram_addr),
        .I3(axi_rvalid_clr_ok),
        .O(axi_rvalid_clr_ok_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    axi_rvalid_clr_ok_i_3
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_data_sm_cs[3]),
        .O(axi_rvalid_clr_ok_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rvalid_clr_ok_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_clr_ok_i_1_n_0),
        .Q(axi_rvalid_clr_ok),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00E0E0E0E0E0E0E0)) 
    axi_rvalid_int_i_1
       (.I0(s_axi_rvalid),
        .I1(axi_rvalid_set),
        .I2(s_axi_aresetn),
        .I3(axi_rvalid_clr_ok),
        .I4(s_axi_rlast),
        .I5(s_axi_rready),
        .O(axi_rvalid_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rvalid_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_int_i_1_n_0),
        .Q(s_axi_rvalid),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    axi_rvalid_set_i_1
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_data_sm_cs[3]),
        .O(axi_rvalid_set_cmb));
  FDRE #(
    .INIT(1'b0)) 
    axi_rvalid_set_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_set_cmb),
        .Q(axi_rvalid_set),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'hFFEEFFFA0022000A)) 
    bram_en_int_i_1
       (.I0(bram_en_int_i_2_n_0),
        .I1(bram_en_int_i_3_n_0),
        .I2(bram_en_int_i_4_n_0),
        .I3(rd_data_sm_cs[3]),
        .I4(rd_data_sm_cs[2]),
        .I5(bram_en_b),
        .O(bram_en_int_i_1_n_0));
  LUT6 #(
    .INIT(64'h0808080000000000)) 
    bram_en_int_i_10
       (.I0(bram_addr_ld_en),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[1]),
        .I3(act_rd_burst_two),
        .I4(act_rd_burst),
        .I5(rd_adv_buf75_out),
        .O(bram_en_int_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h0111)) 
    bram_en_int_i_11
       (.I0(end_brst_rd),
        .I1(brst_zero),
        .I2(s_axi_rready),
        .I3(s_axi_rvalid),
        .O(bram_en_int_i_11_n_0));
  LUT6 #(
    .INIT(64'hBABBFFFFFFFFFFFF)) 
    bram_en_int_i_12
       (.I0(I_WRAP_BRST_n_21),
        .I1(brst_zero),
        .I2(axi_b2b_brst),
        .I3(end_brst_rd),
        .I4(s_axi_rvalid),
        .I5(s_axi_rready),
        .O(bram_en_int_i_12_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAAFBAA)) 
    bram_en_int_i_2
       (.I0(bram_en_int_i_5_n_0),
        .I1(rd_data_sm_cs[2]),
        .I2(bram_en_int_i_6_n_0),
        .I3(rd_data_sm_cs[1]),
        .I4(bram_en_int_i_7_n_0),
        .I5(I_WRAP_BRST_n_20),
        .O(bram_en_int_i_2_n_0));
  LUT6 #(
    .INIT(64'h000000007C7F7C7C)) 
    bram_en_int_i_3
       (.I0(bram_en_int_i_6_n_0),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[1]),
        .I3(rd_adv_buf75_out),
        .I4(bram_en_int_i_9_n_0),
        .I5(bram_en_int_i_10_n_0),
        .O(bram_en_int_i_3_n_0));
  LUT6 #(
    .INIT(64'hA0001111AAAA1111)) 
    bram_en_int_i_4
       (.I0(rd_data_sm_cs[0]),
        .I1(bram_addr_ld_en),
        .I2(bram_en_int_i_11_n_0),
        .I3(brst_one),
        .I4(rd_data_sm_cs[1]),
        .I5(bram_en_int_i_12_n_0),
        .O(bram_en_int_i_4_n_0));
  LUT6 #(
    .INIT(64'h5500545400005500)) 
    bram_en_int_i_5
       (.I0(rd_data_sm_cs[1]),
        .I1(axi_rd_burst),
        .I2(axi_rd_burst_two_reg_n_0),
        .I3(bram_addr_ld_en),
        .I4(rd_data_sm_cs[2]),
        .I5(rd_data_sm_cs[0]),
        .O(bram_en_int_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hEAAA)) 
    bram_en_int_i_6
       (.I0(bram_addr_ld_en),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .I3(pend_rd_op_reg_n_0),
        .O(bram_en_int_i_6_n_0));
  LUT6 #(
    .INIT(64'h3330131003001310)) 
    bram_en_int_i_7
       (.I0(bram_en_int_i_9_n_0),
        .I1(rd_data_sm_cs[2]),
        .I2(rd_data_sm_cs[0]),
        .I3(axi_rd_burst_two_reg_n_0),
        .I4(rd_adv_buf75_out),
        .I5(\rd_data_sm_cs[3]_i_8_n_0 ),
        .O(bram_en_int_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h1)) 
    bram_en_int_i_9
       (.I0(brst_zero),
        .I1(end_brst_rd),
        .O(bram_en_int_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    bram_en_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bram_en_int_i_1_n_0),
        .Q(bram_en_b),
        .R(bram_rst_b));
  LUT5 #(
    .INIT(32'hB800B8FF)) 
    \brst_cnt[0]_i_1 
       (.I0(axi_arlen_pipe[0]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[0]),
        .I3(bram_addr_ld_en),
        .I4(brst_cnt[0]),
        .O(\brst_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8FFB800B800B8FF)) 
    \brst_cnt[1]_i_1 
       (.I0(axi_arlen_pipe[1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[1]),
        .I3(bram_addr_ld_en),
        .I4(brst_cnt[0]),
        .I5(brst_cnt[1]),
        .O(\brst_cnt[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8B8B88B)) 
    \brst_cnt[2]_i_1 
       (.I0(I_WRAP_BRST_n_24),
        .I1(bram_addr_ld_en),
        .I2(brst_cnt[2]),
        .I3(brst_cnt[1]),
        .I4(brst_cnt[0]),
        .O(\brst_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8B8B8B88B)) 
    \brst_cnt[3]_i_1 
       (.I0(I_WRAP_BRST_n_25),
        .I1(bram_addr_ld_en),
        .I2(brst_cnt[3]),
        .I3(brst_cnt[2]),
        .I4(brst_cnt[0]),
        .I5(brst_cnt[1]),
        .O(\brst_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB800B8FFB8FFB800)) 
    \brst_cnt[4]_i_1 
       (.I0(axi_arlen_pipe[4]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[4]),
        .I3(bram_addr_ld_en),
        .I4(brst_cnt[4]),
        .I5(\brst_cnt[4]_i_2_n_0 ),
        .O(\brst_cnt[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \brst_cnt[4]_i_2 
       (.I0(brst_cnt[2]),
        .I1(brst_cnt[0]),
        .I2(brst_cnt[1]),
        .I3(brst_cnt[3]),
        .O(\brst_cnt[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB800B8FFB8FFB800)) 
    \brst_cnt[5]_i_1 
       (.I0(axi_arlen_pipe[5]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[5]),
        .I3(bram_addr_ld_en),
        .I4(brst_cnt[5]),
        .I5(\brst_cnt[7]_i_4_n_0 ),
        .O(\brst_cnt[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hB88BB8B8)) 
    \brst_cnt[6]_i_1 
       (.I0(\brst_cnt[6]_i_2_n_0 ),
        .I1(bram_addr_ld_en),
        .I2(brst_cnt[6]),
        .I3(brst_cnt[5]),
        .I4(\brst_cnt[7]_i_4_n_0 ),
        .O(\brst_cnt[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \brst_cnt[6]_i_2 
       (.I0(axi_arlen_pipe[6]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[6]),
        .O(\brst_cnt[6]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \brst_cnt[7]_i_1 
       (.I0(bram_addr_ld_en),
        .I1(I_WRAP_BRST_n_1),
        .O(\brst_cnt[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B88BB8B8B8B8)) 
    \brst_cnt[7]_i_2 
       (.I0(\brst_cnt[7]_i_3_n_0 ),
        .I1(bram_addr_ld_en),
        .I2(brst_cnt[7]),
        .I3(brst_cnt[6]),
        .I4(brst_cnt[5]),
        .I5(\brst_cnt[7]_i_4_n_0 ),
        .O(\brst_cnt[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \brst_cnt[7]_i_3 
       (.I0(axi_arlen_pipe[7]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[7]),
        .O(\brst_cnt[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \brst_cnt[7]_i_4 
       (.I0(brst_cnt[3]),
        .I1(brst_cnt[1]),
        .I2(brst_cnt[0]),
        .I3(brst_cnt[2]),
        .I4(brst_cnt[4]),
        .O(\brst_cnt[7]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    brst_cnt_max_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0 ),
        .Q(brst_cnt_max_d1),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[0]_i_1_n_0 ),
        .Q(brst_cnt[0]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[1]_i_1_n_0 ),
        .Q(brst_cnt[1]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[2]_i_1_n_0 ),
        .Q(brst_cnt[2]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[3] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[3]_i_1_n_0 ),
        .Q(brst_cnt[3]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[4] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[4]_i_1_n_0 ),
        .Q(brst_cnt[4]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[5] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[5]_i_1_n_0 ),
        .Q(brst_cnt[5]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[6] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[6]_i_1_n_0 ),
        .Q(brst_cnt[6]),
        .R(bram_rst_b));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[7] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[7]_i_2_n_0 ),
        .Q(brst_cnt[7]),
        .R(bram_rst_b));
  LUT5 #(
    .INIT(32'h00000E00)) 
    brst_one_i_1
       (.I0(brst_one),
        .I1(brst_one0),
        .I2(last_bram_addr_i_2_n_0),
        .I3(s_axi_aresetn),
        .I4(brst_one_i_3_n_0),
        .O(brst_one_i_1_n_0));
  LUT6 #(
    .INIT(64'h80FF808080808080)) 
    brst_one_i_2
       (.I0(bram_addr_ld_en),
        .I1(I_WRAP_BRST_n_23),
        .I2(axi_rd_burst_two_i_3_n_0),
        .I3(brst_cnt[0]),
        .I4(brst_cnt[1]),
        .I5(last_bram_addr_i_5_n_0),
        .O(brst_one0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h202AAAAA)) 
    brst_one_i_3
       (.I0(bram_addr_ld_en),
        .I1(axi_arlen_pipe[0]),
        .I2(axi_araddr_full),
        .I3(s_axi_arlen[0]),
        .I4(axi_rd_burst_two_i_3_n_0),
        .O(brst_one_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    brst_one_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(brst_one_i_1_n_0),
        .Q(brst_one),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h00E0)) 
    brst_zero_i_1
       (.I0(brst_zero),
        .I1(last_bram_addr_i_2_n_0),
        .I2(s_axi_aresetn),
        .I3(\GEN_NARROW_EN.curr_narrow_burst_i_2__0_n_0 ),
        .O(brst_zero_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    brst_zero_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(brst_zero_i_1_n_0),
        .Q(brst_zero),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00053305)) 
    curr_fixed_burst_reg_i_1
       (.I0(s_axi_arburst[0]),
        .I1(axi_arburst_pipe[0]),
        .I2(s_axi_arburst[1]),
        .I3(axi_araddr_full),
        .I4(axi_arburst_pipe[1]),
        .O(curr_fixed_burst));
  FDRE #(
    .INIT(1'b0)) 
    curr_fixed_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(curr_fixed_burst),
        .Q(curr_fixed_burst_reg),
        .R(bram_rst_b));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h000ACC0A)) 
    curr_wrap_burst_reg_i_1
       (.I0(s_axi_arburst[1]),
        .I1(axi_arburst_pipe[1]),
        .I2(s_axi_arburst[0]),
        .I3(axi_araddr_full),
        .I4(axi_arburst_pipe[0]),
        .O(curr_wrap_burst));
  FDRE #(
    .INIT(1'b0)) 
    curr_wrap_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(curr_wrap_burst),
        .Q(curr_wrap_burst_reg),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000D00)) 
    disable_b2b_brst_i_1
       (.I0(axi_rd_burst),
        .I1(axi_rd_burst_two_reg_n_0),
        .I2(rd_data_sm_cs[1]),
        .I3(rd_data_sm_cs[0]),
        .I4(\rd_data_sm_cs[1]_i_2_n_0 ),
        .I5(disable_b2b_brst_i_2_n_0),
        .O(disable_b2b_brst_cmb));
  LUT6 #(
    .INIT(64'hF6EF0000F6EFF6EF)) 
    disable_b2b_brst_i_2
       (.I0(rd_data_sm_cs[2]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_data_sm_cs[3]),
        .I3(rd_data_sm_cs[0]),
        .I4(disable_b2b_brst),
        .I5(disable_b2b_brst_i_3_n_0),
        .O(disable_b2b_brst_i_2_n_0));
  LUT6 #(
    .INIT(64'hFDFDFDFDFDFDFDFF)) 
    disable_b2b_brst_i_3
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_adv_buf75_out),
        .I2(\rd_data_sm_cs[1]_i_2_n_0 ),
        .I3(brst_zero),
        .I4(end_brst_rd),
        .I5(brst_one),
        .O(disable_b2b_brst_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    disable_b2b_brst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(disable_b2b_brst_cmb),
        .Q(disable_b2b_brst),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'hFFEEFFEF11000000)) 
    end_brst_rd_clr_i_1
       (.I0(rd_data_sm_cs[3]),
        .I1(rd_data_sm_cs[1]),
        .I2(bram_addr_ld_en),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[0]),
        .I5(end_brst_rd_clr),
        .O(end_brst_rd_clr_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    end_brst_rd_clr_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(end_brst_rd_clr_i_1_n_0),
        .Q(end_brst_rd_clr),
        .R(bram_rst_b));
  LUT5 #(
    .INIT(32'h0020F020)) 
    end_brst_rd_i_1
       (.I0(\GEN_BRST_MAX_W_NARROW.brst_cnt_max_reg_n_0 ),
        .I1(brst_cnt_max_d1),
        .I2(s_axi_aresetn),
        .I3(end_brst_rd),
        .I4(end_brst_rd_clr),
        .O(end_brst_rd_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    end_brst_rd_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(end_brst_rd_i_1_n_0),
        .Q(end_brst_rd),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hBBAAAAAAAAAAAABF)) 
    last_bram_addr_i_1
       (.I0(last_bram_addr_i_2_n_0),
        .I1(last_bram_addr_i_3_n_0),
        .I2(last_bram_addr_i_4_n_0),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[0]),
        .O(last_bram_addr0));
  LUT3 #(
    .INIT(8'h08)) 
    last_bram_addr_i_2
       (.I0(last_bram_addr_i_5_n_0),
        .I1(brst_cnt[0]),
        .I2(brst_cnt[1]),
        .O(last_bram_addr_i_2_n_0));
  LUT6 #(
    .INIT(64'hDDDDFFDFFFFFFFDF)) 
    last_bram_addr_i_3
       (.I0(rd_adv_buf75_out),
        .I1(\rd_data_sm_cs[3]_i_6_n_0 ),
        .I2(pend_rd_op_reg_n_0),
        .I3(\FSM_sequential_rlast_sm_cs[2]_i_2_n_0 ),
        .I4(bram_addr_ld_en),
        .I5(last_bram_addr_i_6_n_0),
        .O(last_bram_addr_i_3_n_0));
  LUT6 #(
    .INIT(64'hEF00EFFFEFFFEFFF)) 
    last_bram_addr_i_4
       (.I0(axi_rd_burst),
        .I1(axi_rd_burst_two_reg_n_0),
        .I2(rd_adv_buf75_out),
        .I3(rd_data_sm_cs[3]),
        .I4(bram_addr_ld_en),
        .I5(last_bram_addr_i_6_n_0),
        .O(last_bram_addr_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    last_bram_addr_i_5
       (.I0(I_WRAP_BRST_n_1),
        .I1(last_bram_addr_i_7_n_0),
        .I2(brst_cnt[3]),
        .I3(brst_cnt[2]),
        .I4(brst_cnt[4]),
        .I5(brst_cnt[7]),
        .O(last_bram_addr_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h02A2)) 
    last_bram_addr_i_6
       (.I0(axi_rd_burst_two_i_3_n_0),
        .I1(s_axi_arlen[0]),
        .I2(axi_araddr_full),
        .I3(axi_arlen_pipe[0]),
        .O(last_bram_addr_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'hE)) 
    last_bram_addr_i_7
       (.I0(brst_cnt[6]),
        .I1(brst_cnt[5]),
        .O(last_bram_addr_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    last_bram_addr_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(last_bram_addr0),
        .Q(last_bram_addr),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'hAAAAAAAA8C88AAAA)) 
    no_ar_ack_i_1
       (.I0(no_ar_ack),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_adv_buf75_out),
        .I3(bram_addr_ld_en),
        .I4(rd_data_sm_cs[0]),
        .I5(\rd_data_sm_cs[3]_i_6_n_0 ),
        .O(no_ar_ack_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    no_ar_ack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(no_ar_ack_i_1_n_0),
        .Q(no_ar_ack),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'hFFEEFFFA0022000A)) 
    pend_rd_op_i_1
       (.I0(pend_rd_op_i_2_n_0),
        .I1(pend_rd_op_i_3_n_0),
        .I2(pend_rd_op_i_4_n_0),
        .I3(rd_data_sm_cs[3]),
        .I4(rd_data_sm_cs[2]),
        .I5(pend_rd_op_reg_n_0),
        .O(pend_rd_op_i_1_n_0));
  LUT6 #(
    .INIT(64'h3F3CF5000000F500)) 
    pend_rd_op_i_2
       (.I0(\FSM_sequential_rlast_sm_cs[2]_i_2_n_0 ),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[1]),
        .I3(bram_addr_ld_en),
        .I4(rd_data_sm_cs[2]),
        .I5(pend_rd_op_i_5_n_0),
        .O(pend_rd_op_i_2_n_0));
  LUT6 #(
    .INIT(64'h000F0F11FF0F0F11)) 
    pend_rd_op_i_3
       (.I0(bram_addr_ld_en),
        .I1(pend_rd_op_i_6_n_0),
        .I2(pend_rd_op_i_5_n_0),
        .I3(rd_data_sm_cs[0]),
        .I4(rd_data_sm_cs[1]),
        .I5(pend_rd_op_i_7_n_0),
        .O(pend_rd_op_i_3_n_0));
  LUT6 #(
    .INIT(64'h03030B0B33F3FFFF)) 
    pend_rd_op_i_4
       (.I0(\FSM_sequential_rlast_sm_cs[2]_i_2_n_0 ),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[1]),
        .I3(s_axi_rlast),
        .I4(pend_rd_op_reg_n_0),
        .I5(bram_addr_ld_en),
        .O(pend_rd_op_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    pend_rd_op_i_5
       (.I0(bram_addr_ld_en),
        .I1(end_brst_rd),
        .I2(ar_active),
        .O(pend_rd_op_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pend_rd_op_i_6
       (.I0(pend_rd_op_reg_n_0),
        .I1(s_axi_rlast),
        .O(pend_rd_op_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h80)) 
    pend_rd_op_i_7
       (.I0(pend_rd_op_reg_n_0),
        .I1(s_axi_rready),
        .I2(s_axi_rvalid),
        .O(pend_rd_op_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pend_rd_op_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pend_rd_op_i_1_n_0),
        .Q(pend_rd_op_reg_n_0),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'hFFFFFFFF002F0000)) 
    \rd_data_sm_cs[0]_i_1 
       (.I0(rd_adv_buf75_out),
        .I1(\rd_data_sm_cs[0]_i_2_n_0 ),
        .I2(\rd_data_sm_cs[0]_i_3_n_0 ),
        .I3(\rd_data_sm_cs[3]_i_6_n_0 ),
        .I4(\rd_data_sm_cs[0]_i_4_n_0 ),
        .I5(\rd_data_sm_cs[0]_i_5_n_0 ),
        .O(\rd_data_sm_cs[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \rd_data_sm_cs[0]_i_2 
       (.I0(pend_rd_op_reg_n_0),
        .I1(bram_addr_ld_en),
        .O(\rd_data_sm_cs[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_data_sm_cs[0]_i_3 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .O(\rd_data_sm_cs[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF444FFFFF)) 
    \rd_data_sm_cs[0]_i_4 
       (.I0(bram_addr_ld_en),
        .I1(rd_adv_buf75_out),
        .I2(act_rd_burst),
        .I3(act_rd_burst_two),
        .I4(rd_data_sm_cs[0]),
        .I5(rd_data_sm_cs[1]),
        .O(\rd_data_sm_cs[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h001100D5001100F7)) 
    \rd_data_sm_cs[0]_i_5 
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_adv_buf75_out),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[3]),
        .I5(\FSM_sequential_rlast_sm_cs[2]_i_2_n_0 ),
        .O(\rd_data_sm_cs[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF05040500)) 
    \rd_data_sm_cs[1]_i_1 
       (.I0(\rd_data_sm_cs[2]_i_4_n_0 ),
        .I1(\FSM_sequential_rlast_sm_cs[2]_i_2_n_0 ),
        .I2(\rd_data_sm_cs[1]_i_2_n_0 ),
        .I3(rd_data_sm_cs[1]),
        .I4(rd_data_sm_cs[0]),
        .I5(\rd_data_sm_cs[1]_i_3_n_0 ),
        .O(\rd_data_sm_cs[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \rd_data_sm_cs[1]_i_2 
       (.I0(rd_data_sm_cs[3]),
        .I1(rd_data_sm_cs[2]),
        .O(\rd_data_sm_cs[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000550155555555)) 
    \rd_data_sm_cs[1]_i_3 
       (.I0(\rd_data_sm_cs[3]_i_6_n_0 ),
        .I1(brst_zero),
        .I2(end_brst_rd),
        .I3(rd_data_sm_cs[1]),
        .I4(rd_data_sm_cs[0]),
        .I5(\rd_data_sm_cs[1]_i_4_n_0 ),
        .O(\rd_data_sm_cs[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFE000FFFFFFFF)) 
    \rd_data_sm_cs[1]_i_4 
       (.I0(act_rd_burst_two),
        .I1(act_rd_burst),
        .I2(rd_adv_buf75_out),
        .I3(bram_addr_ld_en),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[0]),
        .O(\rd_data_sm_cs[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000055550000FF0C)) 
    \rd_data_sm_cs[2]_i_1 
       (.I0(\rd_data_sm_cs[2]_i_2_n_0 ),
        .I1(\rd_data_sm_cs[2]_i_3_n_0 ),
        .I2(\FSM_sequential_rlast_sm_cs[2]_i_2_n_0 ),
        .I3(\rd_data_sm_cs[2]_i_4_n_0 ),
        .I4(rd_data_sm_cs[3]),
        .I5(rd_data_sm_cs[2]),
        .O(\rd_data_sm_cs[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF020F020F020F02F)) 
    \rd_data_sm_cs[2]_i_2 
       (.I0(bram_addr_ld_en),
        .I1(\rd_data_sm_cs[3]_i_7_n_0 ),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[1]),
        .I4(end_brst_rd),
        .I5(brst_zero),
        .O(\rd_data_sm_cs[2]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \rd_data_sm_cs[2]_i_3 
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_data_sm_cs[1]),
        .O(\rd_data_sm_cs[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hC0CCCCCC88888888)) 
    \rd_data_sm_cs[2]_i_4 
       (.I0(axi_rd_burst_two_reg_n_0),
        .I1(rd_data_sm_cs[1]),
        .I2(I_WRAP_BRST_n_21),
        .I3(s_axi_rready),
        .I4(s_axi_rvalid),
        .I5(rd_data_sm_cs[0]),
        .O(\rd_data_sm_cs[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFCCCBBBB3000B888)) 
    \rd_data_sm_cs[3]_i_1 
       (.I0(\rd_data_sm_cs[3]_i_3_n_0 ),
        .I1(\rd_data_sm_cs[3]_i_4_n_0 ),
        .I2(s_axi_rready),
        .I3(s_axi_rvalid),
        .I4(\rd_data_sm_cs[3]_i_5_n_0 ),
        .I5(bram_addr_ld_en),
        .O(rd_data_sm_ns));
  LUT6 #(
    .INIT(64'h0000004050005040)) 
    \rd_data_sm_cs[3]_i_2 
       (.I0(\rd_data_sm_cs[3]_i_6_n_0 ),
        .I1(bram_addr_ld_en),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[1]),
        .I4(\rd_data_sm_cs[3]_i_7_n_0 ),
        .I5(rd_adv_buf75_out),
        .O(\rd_data_sm_cs[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFBBFFFFFB)) 
    \rd_data_sm_cs[3]_i_3 
       (.I0(rd_data_sm_cs[3]),
        .I1(rd_adv_buf75_out),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_data_sm_cs[0]),
        .I4(rd_data_sm_cs[1]),
        .I5(\rd_data_sm_cs[3]_i_8_n_0 ),
        .O(\rd_data_sm_cs[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hBFAD)) 
    \rd_data_sm_cs[3]_i_4 
       (.I0(rd_data_sm_cs[3]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_data_sm_cs[0]),
        .O(\rd_data_sm_cs[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0035)) 
    \rd_data_sm_cs[3]_i_5 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[3]),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_data_sm_cs[0]),
        .O(\rd_data_sm_cs[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \rd_data_sm_cs[3]_i_6 
       (.I0(rd_data_sm_cs[3]),
        .I1(rd_data_sm_cs[2]),
        .O(\rd_data_sm_cs[3]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h1FFF)) 
    \rd_data_sm_cs[3]_i_7 
       (.I0(act_rd_burst_two),
        .I1(act_rd_burst),
        .I2(s_axi_rready),
        .I3(s_axi_rvalid),
        .O(\rd_data_sm_cs[3]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \rd_data_sm_cs[3]_i_8 
       (.I0(brst_zero),
        .I1(axi_b2b_brst),
        .I2(end_brst_rd),
        .O(\rd_data_sm_cs[3]_i_8_n_0 ));
  FDRE \rd_data_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(rd_data_sm_ns),
        .D(\rd_data_sm_cs[0]_i_1_n_0 ),
        .Q(rd_data_sm_cs[0]),
        .R(bram_rst_b));
  FDRE \rd_data_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(rd_data_sm_ns),
        .D(\rd_data_sm_cs[1]_i_1_n_0 ),
        .Q(rd_data_sm_cs[1]),
        .R(bram_rst_b));
  FDRE \rd_data_sm_cs_reg[2] 
       (.C(s_axi_aclk),
        .CE(rd_data_sm_ns),
        .D(\rd_data_sm_cs[2]_i_1_n_0 ),
        .Q(rd_data_sm_cs[2]),
        .R(bram_rst_b));
  FDRE \rd_data_sm_cs_reg[3] 
       (.C(s_axi_aclk),
        .CE(rd_data_sm_ns),
        .D(\rd_data_sm_cs[3]_i_2_n_0 ),
        .Q(rd_data_sm_cs[3]),
        .R(bram_rst_b));
  LUT6 #(
    .INIT(64'h1000111111110000)) 
    rd_skid_buf_ld_reg_i_1
       (.I0(rd_data_sm_cs[3]),
        .I1(rd_data_sm_cs[2]),
        .I2(s_axi_rvalid),
        .I3(s_axi_rready),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[0]),
        .O(rd_skid_buf_ld_cmb));
  FDRE #(
    .INIT(1'b0)) 
    rd_skid_buf_ld_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rd_skid_buf_ld_cmb),
        .Q(rd_skid_buf_ld_reg),
        .R(bram_rst_b));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hFE02)) 
    rddata_mux_sel_i_1
       (.I0(rddata_mux_sel_cmb),
        .I1(rd_data_sm_cs[3]),
        .I2(rddata_mux_sel_i_3_n_0),
        .I3(rddata_mux_sel),
        .O(rddata_mux_sel_i_1_n_0));
  LUT6 #(
    .INIT(64'hD208D208D208F208)) 
    rddata_mux_sel_i_2
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_adv_buf75_out),
        .I3(rd_data_sm_cs[2]),
        .I4(act_rd_burst),
        .I5(act_rd_burst_two),
        .O(rddata_mux_sel_cmb));
  LUT6 #(
    .INIT(64'hF700070FF70F070F)) 
    rddata_mux_sel_i_3
       (.I0(s_axi_rvalid),
        .I1(s_axi_rready),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[1]),
        .I5(axi_rd_burst_two_reg_n_0),
        .O(rddata_mux_sel_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rddata_mux_sel_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rddata_mux_sel_i_1_n_0),
        .Q(rddata_mux_sel),
        .R(bram_rst_b));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hEAAA)) 
    s_axi_arready_INST_0
       (.I0(axi_arready_int),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .I3(axi_early_arready_int),
        .O(s_axi_arready));
endmodule

(* ORIG_REF_NAME = "ua_narrow" *) 
module axi_bram_ctrl_0_ua_narrow
   (CO,
    \GEN_NARROW_CNT.narrow_addr_int_reg[1] ,
    DI,
    S,
    D,
    \GEN_AW_PIPE_DUAL.axi_awburst_pipe_reg[0] ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2] ,
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] ,
    narrow_addr_int,
    curr_narrow_burst,
    bram_addr_inc,
    \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg );
  output [0:0]CO;
  output \GEN_NARROW_CNT.narrow_addr_int_reg[1] ;
  input [1:0]DI;
  input [1:0]S;
  input [0:0]D;
  input \GEN_AW_PIPE_DUAL.axi_awburst_pipe_reg[0] ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2] ;
  input \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] ;
  input [1:0]narrow_addr_int;
  input curr_narrow_burst;
  input bram_addr_inc;
  input \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg ;

  wire [0:0]CO;
  wire [0:0]D;
  wire [1:0]DI;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2] ;
  wire \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg ;
  wire \GEN_AW_PIPE_DUAL.axi_awburst_pipe_reg[0] ;
  wire \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] ;
  wire \GEN_NARROW_CNT.narrow_addr_int[1]_i_2_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[1] ;
  wire [1:0]S;
  wire bram_addr_inc;
  wire curr_narrow_burst;
  wire [1:0]narrow_addr_int;
  wire ua_narrow_load1_carry_n_3;
  wire [3:2]NLW_ua_narrow_load1_carry_CO_UNCONNECTED;
  wire [3:0]NLW_ua_narrow_load1_carry_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hAFFFCCCC5000CCCC)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_1 
       (.I0(narrow_addr_int[0]),
        .I1(\GEN_NARROW_CNT.narrow_addr_int[1]_i_2_n_0 ),
        .I2(curr_narrow_burst),
        .I3(bram_addr_inc),
        .I4(\GEN_AW_PIPE_DUAL.axi_awaddr_full_reg ),
        .I5(narrow_addr_int[1]),
        .O(\GEN_NARROW_CNT.narrow_addr_int_reg[1] ));
  LUT5 #(
    .INIT(32'h88B8B888)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_2 
       (.I0(D),
        .I1(\GEN_AW_PIPE_DUAL.axi_awburst_pipe_reg[0] ),
        .I2(CO),
        .I3(\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2] ),
        .I4(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[1]_i_2_n_0 ));
  CARRY4 ua_narrow_load1_carry
       (.CI(1'b0),
        .CO({NLW_ua_narrow_load1_carry_CO_UNCONNECTED[3:2],CO,ua_narrow_load1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,DI}),
        .O(NLW_ua_narrow_load1_carry_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,S}));
endmodule

(* ORIG_REF_NAME = "ua_narrow" *) 
module axi_bram_ctrl_0_ua_narrow_0
   (\GEN_NARROW_CNT.narrow_addr_int_reg[1] ,
    \GEN_NARROW_CNT.narrow_addr_int_reg[1]_0 ,
    \GEN_NARROW_CNT.narrow_addr_int_reg[2] ,
    \wrap_burst_total_reg[1] ,
    \GEN_NARROW_EN.curr_narrow_burst_reg ,
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] ,
    \GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 ,
    \GEN_NARROW_CNT.narrow_addr_int_reg[1]_1 ,
    \GEN_NARROW_CNT.narrow_addr_int_reg[0] ,
    s_axi_araddr,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] ,
    s_axi_arsize,
    axi_araddr_full,
    Q,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2] ,
    D,
    \GEN_AR_PIPE_DUAL.axi_arburst_pipe_reg[0] ,
    \GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg ,
    \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ,
    \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0]_0 ,
    narrow_addr_int,
    \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] ,
    \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2]_0 ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] ,
    \GEN_AR_PIPE_DUAL.axi_araddr_full_reg ,
    \GEN_NARROW_EN.curr_narrow_burst_reg_0 ,
    \rd_data_sm_cs_reg[1] ,
    curr_narrow_burst);
  output \GEN_NARROW_CNT.narrow_addr_int_reg[1] ;
  output \GEN_NARROW_CNT.narrow_addr_int_reg[1]_0 ;
  output \GEN_NARROW_CNT.narrow_addr_int_reg[2] ;
  output \wrap_burst_total_reg[1] ;
  output \GEN_NARROW_EN.curr_narrow_burst_reg ;
  output \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] ;
  output \GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 ;
  output \GEN_NARROW_CNT.narrow_addr_int_reg[1]_1 ;
  output \GEN_NARROW_CNT.narrow_addr_int_reg[0] ;
  input [2:0]s_axi_araddr;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] ;
  input [2:0]s_axi_arsize;
  input axi_araddr_full;
  input [2:0]Q;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2] ;
  input [2:0]D;
  input \GEN_AR_PIPE_DUAL.axi_arburst_pipe_reg[0] ;
  input \GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg ;
  input \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ;
  input \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0]_0 ;
  input [2:0]narrow_addr_int;
  input \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] ;
  input \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2]_0 ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] ;
  input \GEN_AR_PIPE_DUAL.axi_araddr_full_reg ;
  input \GEN_NARROW_EN.curr_narrow_burst_reg_0 ;
  input \rd_data_sm_cs_reg[1] ;
  input curr_narrow_burst;

  wire [2:0]D;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2] ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2]_0 ;
  wire \GEN_AR_PIPE_DUAL.axi_araddr_full_reg ;
  wire \GEN_AR_PIPE_DUAL.axi_arburst_pipe_reg[0] ;
  wire \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ;
  wire \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0]_0 ;
  wire \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] ;
  wire \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] ;
  wire \GEN_NARROW_CNT.narrow_addr_int[0]_i_2__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[1]_i_2__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_2__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[0] ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[1] ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[1]_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[1]_1 ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[2] ;
  wire \GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 ;
  wire \GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg ;
  wire \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] ;
  wire \GEN_NARROW_EN.curr_narrow_burst_reg ;
  wire \GEN_NARROW_EN.curr_narrow_burst_reg_0 ;
  wire [2:0]Q;
  wire axi_araddr_full;
  wire curr_narrow_burst;
  wire [2:0]narrow_addr_int;
  wire \rd_data_sm_cs_reg[1] ;
  wire [2:0]s_axi_araddr;
  wire [2:0]s_axi_arsize;
  wire ua_narrow_load1_carry_i_10__0_n_0;
  wire ua_narrow_load1_carry_i_1__0_n_0;
  wire ua_narrow_load1_carry_i_2__0_n_0;
  wire ua_narrow_load1_carry_i_3__0_n_0;
  wire ua_narrow_load1_carry_i_4_n_0;
  wire ua_narrow_load1_carry_i_5__0_n_0;
  wire ua_narrow_load1_carry_n_2;
  wire ua_narrow_load1_carry_n_3;
  wire \wrap_burst_total_reg[1] ;
  wire [3:2]NLW_ua_narrow_load1_carry_CO_UNCONNECTED;
  wire [3:0]NLW_ua_narrow_load1_carry_O_UNCONNECTED;

  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NARROW_CNT.narrow_addr_int[0]_i_1__0 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[0]_i_2__0_n_0 ),
        .I1(\GEN_NARROW_EN.curr_narrow_burst_reg_0 ),
        .I2(narrow_addr_int[0]),
        .O(\GEN_NARROW_CNT.narrow_addr_int_reg[0] ));
  LUT6 #(
    .INIT(64'h0000E444FFFFE444)) 
    \GEN_NARROW_CNT.narrow_addr_int[0]_i_2__0 
       (.I0(\GEN_AR_PIPE_DUAL.axi_arburst_pipe_reg[0] ),
        .I1(D[0]),
        .I2(\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0]_0 ),
        .I3(ua_narrow_load1_carry_n_2),
        .I4(\GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg ),
        .I5(narrow_addr_int[0]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[0]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hF8FFAAAA0200AAAA)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_1__0 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[1]_i_2__0_n_0 ),
        .I1(narrow_addr_int[0]),
        .I2(\rd_data_sm_cs_reg[1] ),
        .I3(curr_narrow_burst),
        .I4(\GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg ),
        .I5(narrow_addr_int[1]),
        .O(\GEN_NARROW_CNT.narrow_addr_int_reg[1]_1 ));
  LUT6 #(
    .INIT(64'hFCCFCCCCEEEEEEEE)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_2__0 
       (.I0(D[1]),
        .I1(\GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg ),
        .I2(\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ),
        .I3(\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0]_0 ),
        .I4(ua_narrow_load1_carry_n_2),
        .I5(\GEN_AR_PIPE_DUAL.axi_arburst_pipe_reg[0] ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[1]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAA8FFFFAA020000)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_1__0 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_2__0_n_0 ),
        .I1(narrow_addr_int[0]),
        .I2(narrow_addr_int[1]),
        .I3(\GEN_AR_PIPE_DUAL.axi_araddr_full_reg ),
        .I4(\GEN_NARROW_EN.curr_narrow_burst_reg_0 ),
        .I5(narrow_addr_int[2]),
        .O(\GEN_NARROW_CNT.narrow_addr_int_reg[2]_0 ));
  LUT5 #(
    .INIT(32'hFFFF44F0)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_2__0 
       (.I0(\GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2] ),
        .I1(ua_narrow_load1_carry_n_2),
        .I2(D[2]),
        .I3(\GEN_AR_PIPE_DUAL.axi_arburst_pipe_reg[0] ),
        .I4(\GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00053305)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_2__0 
       (.I0(s_axi_arsize[2]),
        .I1(Q[2]),
        .I2(s_axi_arsize[1]),
        .I3(axi_araddr_full),
        .I4(Q[1]),
        .O(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] ));
  CARRY4 ua_narrow_load1_carry
       (.CI(1'b0),
        .CO({NLW_ua_narrow_load1_carry_CO_UNCONNECTED[3:2],ua_narrow_load1_carry_n_2,ua_narrow_load1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,ua_narrow_load1_carry_i_1__0_n_0,ua_narrow_load1_carry_i_2__0_n_0}),
        .O(NLW_ua_narrow_load1_carry_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,ua_narrow_load1_carry_i_3__0_n_0,ua_narrow_load1_carry_i_4_n_0}));
  LUT6 #(
    .INIT(64'hA808AAAA00000000)) 
    ua_narrow_load1_carry_i_10__0
       (.I0(\GEN_NARROW_CNT.narrow_addr_int_reg[1]_0 ),
        .I1(s_axi_araddr[0]),
        .I2(axi_araddr_full),
        .I3(\GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] ),
        .I4(\wrap_burst_total_reg[1] ),
        .I5(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] ),
        .O(ua_narrow_load1_carry_i_10__0_n_0));
  LUT6 #(
    .INIT(64'h0000000000440347)) 
    ua_narrow_load1_carry_i_1__0
       (.I0(Q[1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[1]),
        .I3(Q[2]),
        .I4(s_axi_arsize[2]),
        .I5(ua_narrow_load1_carry_i_5__0_n_0),
        .O(ua_narrow_load1_carry_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h0000003050500030)) 
    ua_narrow_load1_carry_i_2__0
       (.I0(Q[0]),
        .I1(s_axi_arsize[0]),
        .I2(\GEN_NARROW_EN.curr_narrow_burst_reg ),
        .I3(s_axi_araddr[2]),
        .I4(axi_araddr_full),
        .I5(\GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2]_0 ),
        .O(ua_narrow_load1_carry_i_2__0_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFBBFCB8)) 
    ua_narrow_load1_carry_i_3__0
       (.I0(Q[1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[1]),
        .I3(Q[2]),
        .I4(s_axi_arsize[2]),
        .I5(ua_narrow_load1_carry_i_5__0_n_0),
        .O(ua_narrow_load1_carry_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h0F0008080F0F0800)) 
    ua_narrow_load1_carry_i_4
       (.I0(\GEN_NARROW_CNT.narrow_addr_int_reg[1] ),
        .I1(\GEN_NARROW_CNT.narrow_addr_int_reg[1]_0 ),
        .I2(\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] ),
        .I3(\GEN_NARROW_CNT.narrow_addr_int_reg[2] ),
        .I4(\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[1] ),
        .I5(\wrap_burst_total_reg[1] ),
        .O(ua_narrow_load1_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'hE2E2E200E200E200)) 
    ua_narrow_load1_carry_i_5__0
       (.I0(s_axi_araddr[2]),
        .I1(axi_araddr_full),
        .I2(\GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2]_0 ),
        .I3(ua_narrow_load1_carry_i_10__0_n_0),
        .I4(\GEN_NARROW_EN.curr_narrow_burst_reg ),
        .I5(\wrap_burst_total_reg[1] ),
        .O(ua_narrow_load1_carry_i_5__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h000ACC0A)) 
    ua_narrow_load1_carry_i_6
       (.I0(s_axi_arsize[1]),
        .I1(Q[1]),
        .I2(s_axi_arsize[2]),
        .I3(axi_araddr_full),
        .I4(Q[2]),
        .O(\GEN_NARROW_EN.curr_narrow_burst_reg ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    ua_narrow_load1_carry_i_7__0
       (.I0(s_axi_araddr[0]),
        .I1(\GEN_AR_PIPE_DUAL.GEN_ARADDR[0].axi_araddr_pipe_reg[0] ),
        .I2(s_axi_arsize[0]),
        .I3(axi_araddr_full),
        .I4(Q[0]),
        .O(\GEN_NARROW_CNT.narrow_addr_int_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ua_narrow_load1_carry_i_8__0
       (.I0(\GEN_AR_PIPE_DUAL.GEN_ARADDR[1].axi_araddr_pipe_reg[1] ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[1]),
        .O(\GEN_NARROW_CNT.narrow_addr_int_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ua_narrow_load1_carry_i_9__0
       (.I0(\GEN_AR_PIPE_DUAL.GEN_ARADDR[2].axi_araddr_pipe_reg[2]_0 ),
        .I1(axi_araddr_full),
        .I2(s_axi_araddr[2]),
        .O(\GEN_NARROW_CNT.narrow_addr_int_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \wrap_burst_total[2]_i_2__0 
       (.I0(Q[0]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[0]),
        .O(\wrap_burst_total_reg[1] ));
endmodule

(* ORIG_REF_NAME = "wr_chnl" *) 
module axi_bram_ctrl_0_wr_chnl
   (axi_aresetn_re_reg,
    bram_en_a,
    bram_wrdata_a,
    axi_aresetn_d2,
    s_axi_bvalid,
    s_axi_wready,
    p_0_in,
    s_axi_awready,
    s_axi_bid,
    Q,
    bram_we_a,
    s_axi_aresetn_0,
    s_axi_aclk,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_wdata,
    s_axi_aresetn,
    s_axi_wvalid,
    s_axi_wlast,
    s_axi_awburst,
    s_axi_awsize,
    s_axi_bready,
    s_axi_awvalid,
    s_axi_awlen,
    s_axi_wstrb);
  output axi_aresetn_re_reg;
  output bram_en_a;
  output [63:0]bram_wrdata_a;
  output axi_aresetn_d2;
  output s_axi_bvalid;
  output s_axi_wready;
  output p_0_in;
  output s_axi_awready;
  output [0:0]s_axi_bid;
  output [12:0]Q;
  output [7:0]bram_we_a;
  input s_axi_aresetn_0;
  input s_axi_aclk;
  input [0:0]s_axi_awid;
  input [15:0]s_axi_awaddr;
  input [63:0]s_axi_wdata;
  input s_axi_aresetn;
  input s_axi_wvalid;
  input s_axi_wlast;
  input [1:0]s_axi_awburst;
  input [2:0]s_axi_awsize;
  input s_axi_bready;
  input s_axi_awvalid;
  input [7:0]s_axi_awlen;
  input [7:0]s_axi_wstrb;

  wire BID_FIFO_n_0;
  wire BID_FIFO_n_1;
  wire BID_FIFO_n_2;
  wire BID_FIFO_n_4;
  wire BID_FIFO_n_8;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_1_n_0 ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_2_n_0 ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_1_n_0 ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2_n_0 ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_1_n_0 ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2_n_0 ;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_3_n_0 ;
  wire \GEN_AWREADY.axi_awready_int_i_1_n_0 ;
  wire \GEN_AWREADY.axi_awready_int_i_2_n_0 ;
  wire \GEN_AWREADY.axi_awready_int_i_4_n_0 ;
  wire \GEN_AW_DUAL.aw_active_i_2_n_0 ;
  wire \GEN_AW_DUAL.wr_addr_sm_cs_i_1_n_0 ;
  wire \GEN_AW_DUAL.wr_addr_sm_cs_i_2_n_0 ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg_n_0_[0] ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[15].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg_n_0_[1] ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg_n_0_[2] ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.axi_awaddr_full_i_1_n_0 ;
  wire \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_i_1_n_0 ;
  wire \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0 ;
  wire \GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_3_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[0]_i_1_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[0]_i_2_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[1]_i_4_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_11__0_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_1_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_2_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0 ;
  wire \GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0 ;
  wire \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_2_n_0 ;
  wire \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[0] ;
  wire \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[1] ;
  wire \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[2] ;
  wire \GEN_NARROW_EN.curr_narrow_burst_i_1_n_0 ;
  wire \GEN_NARROW_EN.curr_narrow_burst_i_2_n_0 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_0 ;
  wire \GEN_UA_NARROW.I_UA_NARROW_n_1 ;
  wire \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_2_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_1_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_2_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_3_n_0 ;
  wire \GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ;
  wire \GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ;
  wire I_WRAP_BRST_n_0;
  wire I_WRAP_BRST_n_1;
  wire I_WRAP_BRST_n_19;
  wire I_WRAP_BRST_n_2;
  wire I_WRAP_BRST_n_20;
  wire I_WRAP_BRST_n_21;
  wire I_WRAP_BRST_n_22;
  wire I_WRAP_BRST_n_23;
  wire I_WRAP_BRST_n_24;
  wire I_WRAP_BRST_n_25;
  wire I_WRAP_BRST_n_26;
  wire [12:0]Q;
  wire aw_active;
  wire awaddr_pipe_ld22_out;
  wire axi_aresetn_d1;
  wire axi_aresetn_d2;
  wire axi_aresetn_re;
  wire axi_aresetn_re_reg;
  wire axi_awaddr_full;
  wire [1:0]axi_awburst_pipe;
  wire axi_awid_pipe;
  wire [7:0]axi_awlen_pipe;
  wire axi_awlen_pipe_1_or_2;
  wire [2:0]axi_awsize_pipe;
  wire axi_bvalid_int_i_1_n_0;
  wire axi_wdata_full_cmb;
  wire axi_wdata_full_cmb115_out;
  wire axi_wdata_full_reg;
  wire axi_wr_burst;
  wire axi_wr_burst_cmb;
  wire axi_wr_burst_cmb0;
  wire axi_wr_burst_i_1_n_0;
  wire axi_wr_burst_i_3_n_0;
  wire axi_wready_int_mod_i_1_n_0;
  wire axi_wready_int_mod_i_3_n_0;
  wire bid_gets_fifo_load;
  wire bid_gets_fifo_load_d1;
  wire bid_gets_fifo_load_d1_i_2_n_0;
  wire bram_addr_inc;
  wire [15:12]bram_addr_ld;
  wire bram_addr_ld_en;
  wire bram_addr_ld_en_mod;
  wire bram_addr_rst_cmb;
  wire bram_en_a;
  wire bram_en_cmb;
  wire [7:0]bram_we_a;
  wire [63:0]bram_wrdata_a;
  wire [2:0]bvalid_cnt;
  wire \bvalid_cnt[0]_i_1_n_0 ;
  wire \bvalid_cnt[1]_i_1_n_0 ;
  wire \bvalid_cnt[2]_i_1_n_0 ;
  wire bvalid_cnt_inc;
  wire bvalid_cnt_inc11_out;
  wire clr_bram_we;
  wire clr_bram_we_cmb;
  wire curr_awlen_reg_1_or_2;
  wire curr_awlen_reg_1_or_20;
  wire curr_awlen_reg_1_or_2_i_2_n_0;
  wire curr_awlen_reg_1_or_2_i_3_n_0;
  wire curr_awlen_reg_1_or_2_i_4_n_0;
  wire curr_awlen_reg_1_or_2_i_6_n_0;
  wire curr_awlen_reg_1_or_2_i_7_n_0;
  wire curr_fixed_burst;
  wire curr_fixed_burst_reg;
  wire curr_narrow_burst;
  wire curr_narrow_burst_en;
  wire curr_wrap_burst_reg;
  wire curr_wrap_burst_reg_i_2_n_0;
  wire curr_wrap_burst_reg_i_3_n_0;
  wire curr_wrap_burst_reg_i_4_n_0;
  wire delay_aw_active_clr;
  wire last_data_ack_mod;
  wire [2:0]narrow_addr_int;
  wire narrow_bram_addr_inc;
  wire narrow_bram_addr_inc_d1;
  wire [2:0]narrow_burst_cnt_ld_reg;
  wire p_0_in;
  wire [8:0]p_1_in;
  wire p_25_in;
  wire p_9_out;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire s_axi_aresetn_0;
  wire [15:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire ua_narrow_load1_carry_i_10_n_0;
  wire ua_narrow_load1_carry_i_1_n_0;
  wire ua_narrow_load1_carry_i_2_n_0;
  wire ua_narrow_load1_carry_i_3_n_0;
  wire ua_narrow_load1_carry_i_4__0_n_0;
  wire ua_narrow_load1_carry_i_5_n_0;
  wire ua_narrow_load1_carry_i_6__0_n_0;
  wire ua_narrow_load1_carry_i_7_n_0;
  wire ua_narrow_load1_carry_i_8_n_0;
  wire ua_narrow_load1_carry_i_9_n_0;
  wire wr_addr_sm_cs;
  (* RTL_KEEP = "yes" *) wire [2:0]wr_data_sm_cs;

  axi_bram_ctrl_0_SRL_FIFO BID_FIFO
       (.\GEN_AWREADY.axi_aresetn_d2_reg (axi_aresetn_d2),
        .\GEN_AW_DUAL.wr_addr_sm_cs_reg (BID_FIFO_n_2),
        .\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg (\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0 ),
        .aw_active(aw_active),
        .axi_awaddr_full(axi_awaddr_full),
        .axi_awid_pipe(axi_awid_pipe),
        .axi_awlen_pipe_1_or_2(axi_awlen_pipe_1_or_2),
        .\axi_bid_int_reg[0] (BID_FIFO_n_8),
        .axi_bvalid_int_reg(s_axi_bvalid),
        .axi_wdata_full_cmb115_out(axi_wdata_full_cmb115_out),
        .axi_wr_burst(axi_wr_burst),
        .bid_gets_fifo_load(bid_gets_fifo_load),
        .bid_gets_fifo_load_d1(bid_gets_fifo_load_d1),
        .bid_gets_fifo_load_d1_reg(BID_FIFO_n_0),
        .bid_gets_fifo_load_d1_reg_0(BID_FIFO_n_1),
        .bid_gets_fifo_load_d1_reg_1(BID_FIFO_n_4),
        .bvalid_cnt(bvalid_cnt),
        .bvalid_cnt_inc(bvalid_cnt_inc),
        .bvalid_cnt_inc11_out(bvalid_cnt_inc11_out),
        .\bvalid_cnt_reg[2] (bid_gets_fifo_load_d1_i_2_n_0),
        .curr_awlen_reg_1_or_2(curr_awlen_reg_1_or_2),
        .last_data_ack_mod(last_data_ack_mod),
        .out(wr_data_sm_cs),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn_0),
        .s_axi_awid(s_axi_awid),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wvalid(s_axi_wvalid),
        .wr_addr_sm_cs(wr_addr_sm_cs));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_1 
       (.I0(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_2_n_0 ),
        .I1(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_3_n_0 ),
        .I2(wr_data_sm_cs[0]),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h05051F1A)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_2 
       (.I0(wr_data_sm_cs[1]),
        .I1(axi_wr_burst_cmb0),
        .I2(wr_data_sm_cs[0]),
        .I3(axi_wdata_full_cmb115_out),
        .I4(wr_data_sm_cs[2]),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT4 #(
    .INIT(16'hAA2A)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_3 
       (.I0(BID_FIFO_n_1),
        .I1(bvalid_cnt[1]),
        .I2(bvalid_cnt[2]),
        .I3(bvalid_cnt[0]),
        .O(axi_wr_burst_cmb0));
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_1 
       (.I0(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2_n_0 ),
        .I1(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_3_n_0 ),
        .I2(wr_data_sm_cs[1]),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000554000555540)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2 
       (.I0(wr_data_sm_cs[1]),
        .I1(s_axi_wlast),
        .I2(axi_wdata_full_cmb115_out),
        .I3(wr_data_sm_cs[0]),
        .I4(wr_data_sm_cs[2]),
        .I5(axi_wr_burst),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_1 
       (.I0(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2_n_0 ),
        .I1(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_3_n_0 ),
        .I2(wr_data_sm_cs[2]),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h44010001)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2 
       (.I0(wr_data_sm_cs[2]),
        .I1(wr_data_sm_cs[1]),
        .I2(axi_wdata_full_cmb115_out),
        .I3(wr_data_sm_cs[0]),
        .I4(s_axi_wvalid),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7774777774744444)) 
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_3 
       (.I0(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_2_n_0 ),
        .I1(wr_data_sm_cs[2]),
        .I2(wr_data_sm_cs[1]),
        .I3(s_axi_wlast),
        .I4(wr_data_sm_cs[0]),
        .I5(s_axi_wvalid),
        .O(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_3_n_0 ));
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[0]_i_1_n_0 ),
        .Q(wr_data_sm_cs[0]),
        .R(s_axi_aresetn_0));
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[1]_i_1_n_0 ),
        .Q(wr_data_sm_cs[1]),
        .R(s_axi_aresetn_0));
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs[2]_i_1_n_0 ),
        .Q(wr_data_sm_cs[2]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AWREADY.axi_aresetn_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_aresetn),
        .Q(axi_aresetn_d1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AWREADY.axi_aresetn_d2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_aresetn_d1),
        .Q(axi_aresetn_d2),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \GEN_AWREADY.axi_aresetn_re_reg_i_1 
       (.I0(s_axi_aresetn),
        .I1(axi_aresetn_d1),
        .O(axi_aresetn_re));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AWREADY.axi_aresetn_re_reg_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_aresetn_re),
        .Q(axi_aresetn_re_reg),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFF7F7FFFF00F0)) 
    \GEN_AWREADY.axi_awready_int_i_1 
       (.I0(axi_aresetn_d2),
        .I1(\GEN_AWREADY.axi_awready_int_i_2_n_0 ),
        .I2(axi_awaddr_full),
        .I3(BID_FIFO_n_0),
        .I4(axi_aresetn_re_reg),
        .I5(s_axi_awready),
        .O(\GEN_AWREADY.axi_awready_int_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5444444400000000)) 
    \GEN_AWREADY.axi_awready_int_i_2 
       (.I0(\GEN_AWREADY.axi_awready_int_i_4_n_0 ),
        .I1(aw_active),
        .I2(bvalid_cnt[0]),
        .I3(bvalid_cnt[1]),
        .I4(bvalid_cnt[2]),
        .I5(s_axi_awvalid),
        .O(\GEN_AWREADY.axi_awready_int_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFAAAAAAAAAAAA)) 
    \GEN_AWREADY.axi_awready_int_i_4 
       (.I0(wr_addr_sm_cs),
        .I1(bvalid_cnt[0]),
        .I2(bvalid_cnt[1]),
        .I3(bvalid_cnt[2]),
        .I4(last_data_ack_mod),
        .I5(BID_FIFO_n_1),
        .O(\GEN_AWREADY.axi_awready_int_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AWREADY.axi_awready_int_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AWREADY.axi_awready_int_i_1_n_0 ),
        .Q(s_axi_awready),
        .R(s_axi_aresetn_0));
  LUT1 #(
    .INIT(2'h1)) 
    \GEN_AW_DUAL.aw_active_i_1 
       (.I0(axi_aresetn_d2),
        .O(p_0_in));
  LUT6 #(
    .INIT(64'hF7FFFFFF0000FFFF)) 
    \GEN_AW_DUAL.aw_active_i_2 
       (.I0(wr_data_sm_cs[1]),
        .I1(wr_data_sm_cs[0]),
        .I2(wr_data_sm_cs[2]),
        .I3(delay_aw_active_clr),
        .I4(BID_FIFO_n_0),
        .I5(aw_active),
        .O(\GEN_AW_DUAL.aw_active_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_DUAL.aw_active_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AW_DUAL.aw_active_i_2_n_0 ),
        .Q(aw_active),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'h0010001000100000)) 
    \GEN_AW_DUAL.wr_addr_sm_cs_i_1 
       (.I0(\GEN_AW_DUAL.wr_addr_sm_cs_i_2_n_0 ),
        .I1(wr_addr_sm_cs),
        .I2(s_axi_awvalid),
        .I3(axi_awaddr_full),
        .I4(BID_FIFO_n_2),
        .I5(aw_active),
        .O(\GEN_AW_DUAL.wr_addr_sm_cs_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    \GEN_AW_DUAL.wr_addr_sm_cs_i_2 
       (.I0(\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0 ),
        .I1(axi_awlen_pipe_1_or_2),
        .I2(axi_awaddr_full),
        .I3(curr_awlen_reg_1_or_2),
        .I4(last_data_ack_mod),
        .I5(BID_FIFO_n_2),
        .O(\GEN_AW_DUAL.wr_addr_sm_cs_i_2_n_0 ));
  FDRE \GEN_AW_DUAL.wr_addr_sm_cs_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AW_DUAL.wr_addr_sm_cs_i_1_n_0 ),
        .Q(wr_addr_sm_cs),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[0]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg[10] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[10]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg[11] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[11]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg[12] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[12]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg[13] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[13]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg[14] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[14]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[15].axi_awaddr_pipe_reg[15] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[15]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[15].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[1]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[2]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg[3] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[3]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg[4] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[4]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg[5] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[5]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg[6] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[6]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg[7] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[7]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg[8] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[8]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg[9] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awaddr[9]),
        .Q(\GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hF8000800)) 
    \GEN_AW_PIPE_DUAL.axi_awaddr_full_i_1 
       (.I0(axi_aresetn_d2),
        .I1(\GEN_AWREADY.axi_awready_int_i_2_n_0 ),
        .I2(axi_awaddr_full),
        .I3(s_axi_aresetn),
        .I4(BID_FIFO_n_0),
        .O(\GEN_AW_PIPE_DUAL.axi_awaddr_full_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AW_PIPE_DUAL.axi_awaddr_full_i_1_n_0 ),
        .Q(axi_awaddr_full),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF700F700F700FF08)) 
    \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_i_1 
       (.I0(axi_aresetn_d2),
        .I1(\GEN_AWREADY.axi_awready_int_i_2_n_0 ),
        .I2(axi_awaddr_full),
        .I3(\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0 ),
        .I4(s_axi_awburst[0]),
        .I5(s_axi_awburst[1]),
        .O(\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_i_1_n_0 ),
        .Q(\GEN_AW_PIPE_DUAL.axi_awburst_pipe_fixed_reg_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awburst_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awburst[0]),
        .Q(axi_awburst_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awburst_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awburst[1]),
        .Q(axi_awburst_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awid_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awid),
        .Q(axi_awid_pipe),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h08)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_1 
       (.I0(axi_aresetn_d2),
        .I1(\GEN_AWREADY.axi_awready_int_i_2_n_0 ),
        .I2(axi_awaddr_full),
        .O(awaddr_pipe_ld22_out));
  LUT4 #(
    .INIT(16'h0001)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_2 
       (.I0(s_axi_awlen[7]),
        .I1(s_axi_awlen[1]),
        .I2(s_axi_awlen[4]),
        .I3(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_3_n_0 ),
        .O(p_9_out));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_3 
       (.I0(s_axi_awlen[3]),
        .I1(s_axi_awlen[2]),
        .I2(s_axi_awlen[5]),
        .I3(s_axi_awlen[6]),
        .O(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_1_or_2_reg 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(p_9_out),
        .Q(axi_awlen_pipe_1_or_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awlen[0]),
        .Q(axi_awlen_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awlen[1]),
        .Q(axi_awlen_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[2] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awlen[2]),
        .Q(axi_awlen_pipe[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awlen[3]),
        .Q(axi_awlen_pipe[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[4] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awlen[4]),
        .Q(axi_awlen_pipe[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[5] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awlen[5]),
        .Q(axi_awlen_pipe[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[6] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awlen[6]),
        .Q(axi_awlen_pipe[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[7] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awlen[7]),
        .Q(axi_awlen_pipe[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awsize[0]),
        .Q(axi_awsize_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[1] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awsize[1]),
        .Q(axi_awsize_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] 
       (.C(s_axi_aclk),
        .CE(awaddr_pipe_ld22_out),
        .D(s_axi_awsize[2]),
        .Q(axi_awsize_pipe[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5__0 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_1),
        .D(p_1_in[7]),
        .Q(Q[7]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_1),
        .D(p_1_in[8]),
        .Q(Q[8]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en_mod),
        .D(bram_addr_ld[12]),
        .Q(Q[9]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en_mod),
        .D(bram_addr_ld[13]),
        .Q(Q[10]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en_mod),
        .D(bram_addr_ld[14]),
        .Q(Q[11]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en_mod),
        .D(bram_addr_ld[15]),
        .Q(Q[12]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_1),
        .D(p_1_in[0]),
        .Q(Q[0]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_1),
        .D(p_1_in[1]),
        .Q(Q[1]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_1),
        .D(p_1_in[2]),
        .Q(Q[2]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_1),
        .D(p_1_in[3]),
        .Q(Q[3]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_1),
        .D(p_1_in[4]),
        .Q(Q[4]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_1),
        .D(p_1_in[5]),
        .Q(Q[5]),
        .R(I_WRAP_BRST_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(I_WRAP_BRST_n_1),
        .D(p_1_in[6]),
        .Q(Q[6]),
        .R(I_WRAP_BRST_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NARROW_CNT.narrow_addr_int[0]_i_1 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[0]_i_2_n_0 ),
        .I1(\GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0 ),
        .I2(narrow_addr_int[0]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000D888FFFFD888)) 
    \GEN_NARROW_CNT.narrow_addr_int[0]_i_2 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0 ),
        .I1(narrow_burst_cnt_ld_reg[0]),
        .I2(\GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0 ),
        .I3(\GEN_UA_NARROW.I_UA_NARROW_n_0 ),
        .I4(\GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ),
        .I5(narrow_addr_int[0]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCCDDCCCFCCDDFFCF)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_3 
       (.I0(ua_narrow_load1_carry_i_8_n_0),
        .I1(I_WRAP_BRST_n_24),
        .I2(ua_narrow_load1_carry_i_7_n_0),
        .I3(I_WRAP_BRST_n_20),
        .I4(I_WRAP_BRST_n_21),
        .I5(ua_narrow_load1_carry_i_6__0_n_0),
        .O(\GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0001030206070504)) 
    \GEN_NARROW_CNT.narrow_addr_int[1]_i_4 
       (.I0(I_WRAP_BRST_n_20),
        .I1(I_WRAP_BRST_n_21),
        .I2(I_WRAP_BRST_n_24),
        .I3(ua_narrow_load1_carry_i_7_n_0),
        .I4(ua_narrow_load1_carry_i_6__0_n_0),
        .I5(ua_narrow_load1_carry_i_8_n_0),
        .O(\GEN_NARROW_CNT.narrow_addr_int[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8AAFFFF02AA0000)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_1 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_2_n_0 ),
        .I1(narrow_addr_int[0]),
        .I2(narrow_addr_int[1]),
        .I3(\GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ),
        .I4(\GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0 ),
        .I5(narrow_addr_int[2]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_10 
       (.I0(axi_awburst_pipe[1]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awburst[1]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000305050003)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_11__0 
       (.I0(\GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg_n_0_[1] ),
        .I1(s_axi_awaddr[1]),
        .I2(ua_narrow_load1_carry_i_8_n_0),
        .I3(s_axi_awaddr[0]),
        .I4(axi_awaddr_full),
        .I5(\GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg_n_0_[0] ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_11__0_n_0 ));
  LUT6 #(
    .INIT(64'h5555555511155515)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_12 
       (.I0(BID_FIFO_n_0),
        .I1(I_WRAP_BRST_n_20),
        .I2(s_axi_awsize[1]),
        .I3(axi_awaddr_full),
        .I4(axi_awsize_pipe[1]),
        .I5(I_WRAP_BRST_n_24),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT5 #(
    .INIT(32'hFFF00350)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_13 
       (.I0(curr_awlen_reg_1_or_2_i_2_n_0),
        .I1(curr_awlen_reg_1_or_2_i_3_n_0),
        .I2(I_WRAP_BRST_n_20),
        .I3(I_WRAP_BRST_n_21),
        .I4(I_WRAP_BRST_n_24),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_14 
       (.I0(s_axi_awsize[0]),
        .I1(axi_awsize_pipe[0]),
        .I2(s_axi_awsize[1]),
        .I3(axi_awaddr_full),
        .I4(axi_awsize_pipe[1]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_15 
       (.I0(axi_awlen_pipe[1]),
        .I1(s_axi_awlen[1]),
        .I2(I_WRAP_BRST_n_20),
        .I3(axi_awlen_pipe[0]),
        .I4(axi_awaddr_full),
        .I5(s_axi_awlen[0]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'h3535555F)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_16 
       (.I0(I_WRAP_BRST_n_24),
        .I1(I_WRAP_BRST_n_19),
        .I2(I_WRAP_BRST_n_20),
        .I3(I_WRAP_BRST_n_23),
        .I4(I_WRAP_BRST_n_21),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_17 
       (.I0(axi_awlen_pipe[5]),
        .I1(s_axi_awlen[5]),
        .I2(I_WRAP_BRST_n_20),
        .I3(axi_awlen_pipe[4]),
        .I4(axi_awaddr_full),
        .I5(s_axi_awlen[4]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT5 #(
    .INIT(32'hF0035003)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_18 
       (.I0(curr_awlen_reg_1_or_2_i_2_n_0),
        .I1(curr_awlen_reg_1_or_2_i_3_n_0),
        .I2(I_WRAP_BRST_n_20),
        .I3(I_WRAP_BRST_n_21),
        .I4(I_WRAP_BRST_n_24),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h0000470047FF4747)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_19 
       (.I0(axi_awlen_pipe[0]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awlen[0]),
        .I3(I_WRAP_BRST_n_20),
        .I4(I_WRAP_BRST_n_21),
        .I5(I_WRAP_BRST_n_22),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFF088)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_2 
       (.I0(\GEN_UA_NARROW.I_UA_NARROW_n_0 ),
        .I1(\GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0 ),
        .I2(narrow_burst_cnt_ld_reg[2]),
        .I3(\GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0 ),
        .I4(\GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFCEFFFFEACEEA)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_20 
       (.I0(I_WRAP_BRST_n_19),
        .I1(I_WRAP_BRST_n_23),
        .I2(I_WRAP_BRST_n_21),
        .I3(I_WRAP_BRST_n_20),
        .I4(curr_awlen_reg_1_or_2_i_7_n_0),
        .I5(curr_awlen_reg_1_or_2_i_6_n_0),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF004700470047)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_21 
       (.I0(axi_awlen_pipe[7]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awlen[7]),
        .I3(I_WRAP_BRST_n_20),
        .I4(I_WRAP_BRST_n_21),
        .I5(I_WRAP_BRST_n_24),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h5555555500000151)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_3 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0 ),
        .I1(s_axi_awsize[2]),
        .I2(axi_awaddr_full),
        .I3(axi_awsize_pipe[2]),
        .I4(I_WRAP_BRST_n_25),
        .I5(BID_FIFO_n_0),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h02000000FFFFFFFF)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_4 
       (.I0(curr_narrow_burst),
        .I1(wr_data_sm_cs[1]),
        .I2(wr_data_sm_cs[2]),
        .I3(wr_data_sm_cs[0]),
        .I4(s_axi_wvalid),
        .I5(\GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hAAAB)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_5 
       (.I0(I_WRAP_BRST_n_24),
        .I1(I_WRAP_BRST_n_21),
        .I2(I_WRAP_BRST_n_20),
        .I3(ua_narrow_load1_carry_i_8_n_0),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF10FFFFFFFFF)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_6 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0 ),
        .I1(\GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0 ),
        .I2(curr_wrap_burst_reg_i_4_n_0),
        .I3(\GEN_NARROW_CNT.narrow_addr_int[2]_i_10_n_0 ),
        .I4(\GEN_NARROW_CNT.narrow_addr_int[2]_i_11__0_n_0 ),
        .I5(\GEN_NARROW_CNT.narrow_addr_int[2]_i_12_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_7 
       (.I0(narrow_bram_addr_inc_d1),
        .I1(bram_addr_inc),
        .I2(curr_narrow_burst),
        .I3(narrow_addr_int[2]),
        .I4(narrow_addr_int[0]),
        .I5(narrow_addr_int[1]),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h55F744F7FFFF77F7)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_8 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_13_n_0 ),
        .I1(\GEN_NARROW_CNT.narrow_addr_int[2]_i_14_n_0 ),
        .I2(\GEN_NARROW_CNT.narrow_addr_int[2]_i_15_n_0 ),
        .I3(\GEN_NARROW_CNT.narrow_addr_int[2]_i_16_n_0 ),
        .I4(\GEN_NARROW_CNT.narrow_addr_int[2]_i_17_n_0 ),
        .I5(\GEN_NARROW_CNT.narrow_addr_int[2]_i_18_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hF1F1F1F1FFFFF1FF)) 
    \GEN_NARROW_CNT.narrow_addr_int[2]_i_9 
       (.I0(\GEN_NARROW_CNT.narrow_addr_int[2]_i_19_n_0 ),
        .I1(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_2_n_0 ),
        .I2(\GEN_NARROW_CNT.narrow_addr_int[2]_i_20_n_0 ),
        .I3(I_WRAP_BRST_n_20),
        .I4(curr_awlen_reg_1_or_2_i_3_n_0),
        .I5(\GEN_NARROW_CNT.narrow_addr_int[2]_i_21_n_0 ),
        .O(\GEN_NARROW_CNT.narrow_addr_int[2]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT.narrow_addr_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NARROW_CNT.narrow_addr_int[0]_i_1_n_0 ),
        .Q(narrow_addr_int[0]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT.narrow_addr_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_UA_NARROW.I_UA_NARROW_n_1 ),
        .Q(narrow_addr_int[1]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT.narrow_addr_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NARROW_CNT.narrow_addr_int[2]_i_1_n_0 ),
        .Q(narrow_addr_int[2]),
        .R(s_axi_aresetn_0));
  LUT5 #(
    .INIT(32'h00000008)) 
    \GEN_NARROW_CNT.narrow_bram_addr_inc_d1_i_1 
       (.I0(bram_addr_inc),
        .I1(curr_narrow_burst),
        .I2(narrow_addr_int[2]),
        .I3(narrow_addr_int[0]),
        .I4(narrow_addr_int[1]),
        .O(narrow_bram_addr_inc));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT.narrow_bram_addr_inc_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_bram_addr_inc),
        .Q(narrow_bram_addr_inc_d1),
        .R(s_axi_aresetn_0));
  LUT6 #(
    .INIT(64'h888888B8B8B888B8)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[0]_i_1 
       (.I0(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[0] ),
        .I1(BID_FIFO_n_0),
        .I2(I_WRAP_BRST_n_25),
        .I3(s_axi_awsize[2]),
        .I4(axi_awaddr_full),
        .I5(axi_awsize_pipe[2]),
        .O(narrow_burst_cnt_ld_reg[0]));
  LUT6 #(
    .INIT(64'h8888888B8B8B888B)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[1]_i_1 
       (.I0(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[1] ),
        .I1(BID_FIFO_n_0),
        .I2(I_WRAP_BRST_n_24),
        .I3(s_axi_awsize[1]),
        .I4(axi_awaddr_full),
        .I5(axi_awsize_pipe[1]),
        .O(narrow_burst_cnt_ld_reg[1]));
  LUT6 #(
    .INIT(64'h888888B8B8B888B8)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_1 
       (.I0(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[2] ),
        .I1(BID_FIFO_n_0),
        .I2(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_2_n_0 ),
        .I3(s_axi_awsize[0]),
        .I4(axi_awaddr_full),
        .I5(axi_awsize_pipe[0]),
        .O(narrow_burst_cnt_ld_reg[2]));
  LUT5 #(
    .INIT(32'h00053305)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_2 
       (.I0(s_axi_awsize[2]),
        .I1(axi_awsize_pipe[2]),
        .I2(s_axi_awsize[1]),
        .I3(axi_awaddr_full),
        .I4(axi_awsize_pipe[1]),
        .O(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_burst_cnt_ld_reg[0]),
        .Q(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[0] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_burst_cnt_ld_reg[1]),
        .Q(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[1] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(narrow_burst_cnt_ld_reg[2]),
        .Q(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg_reg_n_0_[2] ),
        .R(s_axi_aresetn_0));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_NARROW_EN.axi_wlast_d1_i_1 
       (.I0(s_axi_wready),
        .I1(s_axi_wlast),
        .I2(s_axi_wvalid),
        .O(p_25_in));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_EN.axi_wlast_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_25_in),
        .Q(last_data_ack_mod),
        .R(s_axi_aresetn_0));
  LUT6 #(
    .INIT(64'h30303030A000A0A0)) 
    \GEN_NARROW_EN.curr_narrow_burst_i_1 
       (.I0(curr_narrow_burst),
        .I1(\GEN_NARROW_EN.curr_narrow_burst_i_2_n_0 ),
        .I2(s_axi_aresetn),
        .I3(last_data_ack_mod),
        .I4(p_25_in),
        .I5(curr_narrow_burst_en),
        .O(\GEN_NARROW_EN.curr_narrow_burst_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3055300000000000)) 
    \GEN_NARROW_EN.curr_narrow_burst_i_2 
       (.I0(s_axi_awsize[2]),
        .I1(axi_awsize_pipe[2]),
        .I2(axi_awsize_pipe[1]),
        .I3(axi_awaddr_full),
        .I4(s_axi_awsize[1]),
        .I5(I_WRAP_BRST_n_20),
        .O(\GEN_NARROW_EN.curr_narrow_burst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000055511151)) 
    \GEN_NARROW_EN.curr_narrow_burst_i_3 
       (.I0(BID_FIFO_n_0),
        .I1(curr_awlen_reg_1_or_20),
        .I2(s_axi_awlen[0]),
        .I3(axi_awaddr_full),
        .I4(axi_awlen_pipe[0]),
        .I5(curr_fixed_burst),
        .O(curr_narrow_burst_en));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_NARROW_EN.curr_narrow_burst_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_NARROW_EN.curr_narrow_burst_i_1_n_0 ),
        .Q(curr_narrow_burst),
        .R(1'b0));
  axi_bram_ctrl_0_ua_narrow \GEN_UA_NARROW.I_UA_NARROW 
       (.CO(\GEN_UA_NARROW.I_UA_NARROW_n_0 ),
        .D(narrow_burst_cnt_ld_reg[1]),
        .DI({ua_narrow_load1_carry_i_1_n_0,ua_narrow_load1_carry_i_2_n_0}),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg[2] (\GEN_NARROW_CNT.narrow_addr_int[1]_i_3_n_0 ),
        .\GEN_AW_PIPE_DUAL.axi_awaddr_full_reg (\GEN_NARROW_CNT.narrow_addr_int[2]_i_3_n_0 ),
        .\GEN_AW_PIPE_DUAL.axi_awburst_pipe_reg[0] (\GEN_NARROW_CNT.narrow_addr_int[2]_i_6_n_0 ),
        .\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[0] (\GEN_NARROW_CNT.narrow_addr_int[1]_i_4_n_0 ),
        .\GEN_NARROW_CNT.narrow_addr_int_reg[1] (\GEN_UA_NARROW.I_UA_NARROW_n_1 ),
        .S({ua_narrow_load1_carry_i_3_n_0,ua_narrow_load1_carry_i_4__0_n_0}),
        .bram_addr_inc(bram_addr_inc),
        .curr_narrow_burst(curr_narrow_burst),
        .narrow_addr_int(narrow_addr_int[1:0]));
  LUT5 #(
    .INIT(32'h45FF4500)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.axi_wdata_full_reg_i_1 
       (.I0(axi_wdata_full_cmb115_out),
        .I1(BID_FIFO_n_0),
        .I2(axi_awaddr_full),
        .I3(wr_data_sm_cs[2]),
        .I4(axi_wready_int_mod_i_3_n_0),
        .O(axi_wdata_full_cmb));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.axi_wdata_full_reg_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_wdata_full_cmb),
        .Q(axi_wdata_full_reg),
        .R(s_axi_aresetn_0));
  LUT6 #(
    .INIT(64'h4777477444444444)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_1 
       (.I0(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_2_n_0 ),
        .I1(wr_data_sm_cs[2]),
        .I2(wr_data_sm_cs[1]),
        .I3(wr_data_sm_cs[0]),
        .I4(axi_wdata_full_cmb115_out),
        .I5(s_axi_wvalid),
        .O(bram_en_cmb));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'h45)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_2 
       (.I0(axi_wdata_full_cmb115_out),
        .I1(BID_FIFO_n_0),
        .I2(axi_awaddr_full),
        .O(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bram_en_cmb),
        .Q(bram_en_a),
        .R(s_axi_aresetn_0));
  LUT6 #(
    .INIT(64'h0010001000101110)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_1 
       (.I0(wr_data_sm_cs[0]),
        .I1(wr_data_sm_cs[1]),
        .I2(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2_n_0 ),
        .I3(wr_data_sm_cs[2]),
        .I4(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_2_n_0 ),
        .I5(axi_wr_burst),
        .O(clr_bram_we_cmb));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2 
       (.I0(axi_wdata_full_cmb115_out),
        .I1(s_axi_wlast),
        .I2(s_axi_wvalid),
        .O(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.clr_bram_we_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(clr_bram_we_cmb),
        .Q(clr_bram_we),
        .R(s_axi_aresetn_0));
  LUT6 #(
    .INIT(64'hFEAAFEFF02AA0200)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_1 
       (.I0(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_2_n_0 ),
        .I1(axi_wr_burst),
        .I2(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_2_n_0 ),
        .I3(wr_data_sm_cs[2]),
        .I4(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_3_n_0 ),
        .I5(delay_aw_active_clr),
        .O(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000222E)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_2 
       (.I0(s_axi_wlast),
        .I1(wr_data_sm_cs[2]),
        .I2(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.bram_en_int_i_2_n_0 ),
        .I3(wr_data_sm_cs[0]),
        .I4(wr_data_sm_cs[1]),
        .O(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8B338B0088008800)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_3 
       (.I0(delay_aw_active_clr),
        .I1(wr_data_sm_cs[1]),
        .I2(axi_wr_burst_cmb0),
        .I3(wr_data_sm_cs[0]),
        .I4(axi_wdata_full_cmb115_out),
        .I5(bvalid_cnt_inc11_out),
        .O(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.delay_aw_active_clr_i_1_n_0 ),
        .Q(delay_aw_active_clr),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[0].bram_wrdata_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[0]),
        .Q(bram_wrdata_a[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[10].bram_wrdata_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[10]),
        .Q(bram_wrdata_a[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[11].bram_wrdata_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[11]),
        .Q(bram_wrdata_a[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[12].bram_wrdata_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[12]),
        .Q(bram_wrdata_a[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[13].bram_wrdata_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[13]),
        .Q(bram_wrdata_a[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[14].bram_wrdata_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[14]),
        .Q(bram_wrdata_a[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[15].bram_wrdata_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[15]),
        .Q(bram_wrdata_a[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[16].bram_wrdata_int_reg[16] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[16]),
        .Q(bram_wrdata_a[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[17].bram_wrdata_int_reg[17] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[17]),
        .Q(bram_wrdata_a[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[18].bram_wrdata_int_reg[18] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[18]),
        .Q(bram_wrdata_a[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[19].bram_wrdata_int_reg[19] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[19]),
        .Q(bram_wrdata_a[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[1].bram_wrdata_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[1]),
        .Q(bram_wrdata_a[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[20].bram_wrdata_int_reg[20] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[20]),
        .Q(bram_wrdata_a[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[21].bram_wrdata_int_reg[21] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[21]),
        .Q(bram_wrdata_a[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[22].bram_wrdata_int_reg[22] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[22]),
        .Q(bram_wrdata_a[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[23].bram_wrdata_int_reg[23] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[23]),
        .Q(bram_wrdata_a[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[24].bram_wrdata_int_reg[24] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[24]),
        .Q(bram_wrdata_a[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[25].bram_wrdata_int_reg[25] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[25]),
        .Q(bram_wrdata_a[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[26].bram_wrdata_int_reg[26] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[26]),
        .Q(bram_wrdata_a[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[27].bram_wrdata_int_reg[27] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[27]),
        .Q(bram_wrdata_a[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[28].bram_wrdata_int_reg[28] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[28]),
        .Q(bram_wrdata_a[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[29].bram_wrdata_int_reg[29] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[29]),
        .Q(bram_wrdata_a[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[2].bram_wrdata_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[2]),
        .Q(bram_wrdata_a[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[30].bram_wrdata_int_reg[30] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[30]),
        .Q(bram_wrdata_a[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[31].bram_wrdata_int_reg[31] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[31]),
        .Q(bram_wrdata_a[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[32].bram_wrdata_int_reg[32] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[32]),
        .Q(bram_wrdata_a[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[33].bram_wrdata_int_reg[33] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[33]),
        .Q(bram_wrdata_a[33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[34].bram_wrdata_int_reg[34] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[34]),
        .Q(bram_wrdata_a[34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[35].bram_wrdata_int_reg[35] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[35]),
        .Q(bram_wrdata_a[35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[36].bram_wrdata_int_reg[36] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[36]),
        .Q(bram_wrdata_a[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[37].bram_wrdata_int_reg[37] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[37]),
        .Q(bram_wrdata_a[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[38].bram_wrdata_int_reg[38] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[38]),
        .Q(bram_wrdata_a[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[39].bram_wrdata_int_reg[39] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[39]),
        .Q(bram_wrdata_a[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[3].bram_wrdata_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[3]),
        .Q(bram_wrdata_a[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[40].bram_wrdata_int_reg[40] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[40]),
        .Q(bram_wrdata_a[40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[41].bram_wrdata_int_reg[41] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[41]),
        .Q(bram_wrdata_a[41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[42].bram_wrdata_int_reg[42] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[42]),
        .Q(bram_wrdata_a[42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[43].bram_wrdata_int_reg[43] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[43]),
        .Q(bram_wrdata_a[43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[44].bram_wrdata_int_reg[44] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[44]),
        .Q(bram_wrdata_a[44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[45].bram_wrdata_int_reg[45] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[45]),
        .Q(bram_wrdata_a[45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[46].bram_wrdata_int_reg[46] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[46]),
        .Q(bram_wrdata_a[46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[47].bram_wrdata_int_reg[47] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[47]),
        .Q(bram_wrdata_a[47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[48].bram_wrdata_int_reg[48] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[48]),
        .Q(bram_wrdata_a[48]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[49].bram_wrdata_int_reg[49] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[49]),
        .Q(bram_wrdata_a[49]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[4].bram_wrdata_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[4]),
        .Q(bram_wrdata_a[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[50].bram_wrdata_int_reg[50] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[50]),
        .Q(bram_wrdata_a[50]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[51].bram_wrdata_int_reg[51] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[51]),
        .Q(bram_wrdata_a[51]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[52].bram_wrdata_int_reg[52] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[52]),
        .Q(bram_wrdata_a[52]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[53].bram_wrdata_int_reg[53] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[53]),
        .Q(bram_wrdata_a[53]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[54].bram_wrdata_int_reg[54] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[54]),
        .Q(bram_wrdata_a[54]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[55].bram_wrdata_int_reg[55] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[55]),
        .Q(bram_wrdata_a[55]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[56].bram_wrdata_int_reg[56] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[56]),
        .Q(bram_wrdata_a[56]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[57].bram_wrdata_int_reg[57] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[57]),
        .Q(bram_wrdata_a[57]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[58].bram_wrdata_int_reg[58] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[58]),
        .Q(bram_wrdata_a[58]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[59].bram_wrdata_int_reg[59] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[59]),
        .Q(bram_wrdata_a[59]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[5].bram_wrdata_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[5]),
        .Q(bram_wrdata_a[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[60].bram_wrdata_int_reg[60] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[60]),
        .Q(bram_wrdata_a[60]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[61].bram_wrdata_int_reg[61] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[61]),
        .Q(bram_wrdata_a[61]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[62].bram_wrdata_int_reg[62] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[62]),
        .Q(bram_wrdata_a[62]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[63].bram_wrdata_int_reg[63] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[63]),
        .Q(bram_wrdata_a[63]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[6].bram_wrdata_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[6]),
        .Q(bram_wrdata_a[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[7].bram_wrdata_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[7]),
        .Q(bram_wrdata_a[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[8].bram_wrdata_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[8]),
        .Q(bram_wrdata_a[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[9].bram_wrdata_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wdata[9]),
        .Q(bram_wrdata_a[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hD0FF)) 
    \GEN_WR_NO_ECC.bram_we_int[7]_i_1 
       (.I0(s_axi_wvalid),
        .I1(wr_data_sm_cs[2]),
        .I2(clr_bram_we),
        .I3(s_axi_aresetn),
        .O(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \GEN_WR_NO_ECC.bram_we_int[7]_i_2 
       (.I0(s_axi_wvalid),
        .I1(wr_data_sm_cs[2]),
        .O(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wstrb[0]),
        .Q(bram_we_a[0]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wstrb[1]),
        .Q(bram_we_a[1]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wstrb[2]),
        .Q(bram_we_a[2]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wstrb[3]),
        .Q(bram_we_a[3]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wstrb[4]),
        .Q(bram_we_a[4]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wstrb[5]),
        .Q(bram_we_a[5]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wstrb[6]),
        .Q(bram_we_a[6]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(\GEN_WR_NO_ECC.bram_we_int[7]_i_2_n_0 ),
        .D(s_axi_wstrb[7]),
        .Q(bram_we_a[7]),
        .R(\GEN_WR_NO_ECC.bram_we_int[7]_i_1_n_0 ));
  axi_bram_ctrl_0_wrap_brst I_WRAP_BRST
       (.D({bram_addr_ld,p_1_in}),
        .E(bram_addr_ld_en),
        .\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[1] (curr_wrap_burst_reg_i_3_n_0),
        .\GEN_AW_DUAL.wr_addr_sm_cs_reg (BID_FIFO_n_0),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[15].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[15].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg (\GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ),
        .\GEN_AW_PIPE_DUAL.axi_awaddr_full_reg (curr_wrap_burst_reg_i_2_n_0),
        .\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] (axi_awlen_pipe[3:0]),
        .\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] (axi_awsize_pipe),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] (I_WRAP_BRST_n_1),
        .\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] (\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5__0_n_0 ),
        .Q(Q[8:0]),
        .SR(I_WRAP_BRST_n_0),
        .axi_awaddr_full(axi_awaddr_full),
        .bram_addr_inc(bram_addr_inc),
        .bram_addr_ld_en_mod(bram_addr_ld_en_mod),
        .bram_addr_rst_cmb(bram_addr_rst_cmb),
        .curr_awlen_reg_1_or_2_reg(I_WRAP_BRST_n_22),
        .curr_fixed_burst(curr_fixed_burst),
        .curr_fixed_burst_reg(curr_fixed_burst_reg),
        .curr_fixed_burst_reg_reg(I_WRAP_BRST_n_2),
        .curr_narrow_burst(curr_narrow_burst),
        .curr_wrap_burst_reg(curr_wrap_burst_reg),
        .curr_wrap_burst_reg_reg(I_WRAP_BRST_n_26),
        .narrow_addr_int(narrow_addr_int),
        .narrow_bram_addr_inc_d1(narrow_bram_addr_inc_d1),
        .out(wr_data_sm_cs),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_aresetn_0(s_axi_aresetn_0),
        .s_axi_awaddr(s_axi_awaddr[15:3]),
        .s_axi_awlen(s_axi_awlen[3:0]),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_wvalid(s_axi_wvalid),
        .\wrap_burst_total_reg[0]_0 (I_WRAP_BRST_n_19),
        .\wrap_burst_total_reg[0]_1 (I_WRAP_BRST_n_23),
        .\wrap_burst_total_reg[1]_0 (I_WRAP_BRST_n_20),
        .\wrap_burst_total_reg[1]_1 (I_WRAP_BRST_n_21),
        .\wrap_burst_total_reg[1]_2 (I_WRAP_BRST_n_24),
        .\wrap_burst_total_reg[2]_0 (I_WRAP_BRST_n_25));
  FDRE #(
    .INIT(1'b0)) 
    \axi_bid_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(BID_FIFO_n_8),
        .Q(s_axi_bid),
        .R(s_axi_aresetn_0));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAA8A88)) 
    axi_bvalid_int_i_1
       (.I0(s_axi_aresetn),
        .I1(bvalid_cnt_inc),
        .I2(BID_FIFO_n_4),
        .I3(bvalid_cnt[0]),
        .I4(bvalid_cnt[1]),
        .I5(bvalid_cnt[2]),
        .O(axi_bvalid_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_bvalid_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_int_i_1_n_0),
        .Q(s_axi_bvalid),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB8)) 
    axi_wr_burst_i_1
       (.I0(axi_wr_burst_cmb),
        .I1(axi_wr_burst_i_3_n_0),
        .I2(axi_wr_burst),
        .O(axi_wr_burst_i_1_n_0));
  LUT5 #(
    .INIT(32'h3088FCBB)) 
    axi_wr_burst_i_2
       (.I0(s_axi_wvalid),
        .I1(wr_data_sm_cs[1]),
        .I2(axi_wr_burst_cmb0),
        .I3(wr_data_sm_cs[0]),
        .I4(s_axi_wlast),
        .O(axi_wr_burst_cmb));
  LUT6 #(
    .INIT(64'h00000000AAAAA222)) 
    axi_wr_burst_i_3
       (.I0(s_axi_wvalid),
        .I1(wr_data_sm_cs[0]),
        .I2(s_axi_wlast),
        .I3(axi_wr_burst_cmb0),
        .I4(wr_data_sm_cs[1]),
        .I5(wr_data_sm_cs[2]),
        .O(axi_wr_burst_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_wr_burst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_wr_burst_i_1_n_0),
        .Q(axi_wr_burst),
        .R(s_axi_aresetn_0));
  LUT6 #(
    .INIT(64'hBA00BAFF00000000)) 
    axi_wready_int_mod_i_1
       (.I0(axi_wdata_full_cmb115_out),
        .I1(BID_FIFO_n_0),
        .I2(axi_awaddr_full),
        .I3(wr_data_sm_cs[2]),
        .I4(axi_wready_int_mod_i_3_n_0),
        .I5(s_axi_aresetn),
        .O(axi_wready_int_mod_i_1_n_0));
  LUT5 #(
    .INIT(32'hF8F9F0F0)) 
    axi_wready_int_mod_i_3
       (.I0(wr_data_sm_cs[1]),
        .I1(wr_data_sm_cs[0]),
        .I2(axi_wdata_full_reg),
        .I3(axi_wdata_full_cmb115_out),
        .I4(s_axi_wvalid),
        .O(axi_wready_int_mod_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_wready_int_mod_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_wready_int_mod_i_1_n_0),
        .Q(s_axi_wready),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    bid_gets_fifo_load_d1_i_2
       (.I0(bvalid_cnt[2]),
        .I1(bvalid_cnt[1]),
        .I2(bvalid_cnt[0]),
        .O(bid_gets_fifo_load_d1_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    bid_gets_fifo_load_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bid_gets_fifo_load),
        .Q(bid_gets_fifo_load_d1),
        .R(s_axi_aresetn_0));
  LUT6 #(
    .INIT(64'hF0000FFF1FFFE000)) 
    \bvalid_cnt[0]_i_1 
       (.I0(bvalid_cnt[1]),
        .I1(bvalid_cnt[2]),
        .I2(s_axi_bvalid),
        .I3(s_axi_bready),
        .I4(bvalid_cnt_inc),
        .I5(bvalid_cnt[0]),
        .O(\bvalid_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hD5D52A2ABFBF4000)) 
    \bvalid_cnt[1]_i_1 
       (.I0(bvalid_cnt_inc),
        .I1(s_axi_bready),
        .I2(s_axi_bvalid),
        .I3(bvalid_cnt[2]),
        .I4(bvalid_cnt[1]),
        .I5(bvalid_cnt[0]),
        .O(\bvalid_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hD52AFF00FF00BF00)) 
    \bvalid_cnt[2]_i_1 
       (.I0(bvalid_cnt_inc),
        .I1(s_axi_bready),
        .I2(s_axi_bvalid),
        .I3(bvalid_cnt[2]),
        .I4(bvalid_cnt[1]),
        .I5(bvalid_cnt[0]),
        .O(\bvalid_cnt[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bvalid_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bvalid_cnt[0]_i_1_n_0 ),
        .Q(bvalid_cnt[0]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \bvalid_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bvalid_cnt[1]_i_1_n_0 ),
        .Q(bvalid_cnt[1]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \bvalid_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bvalid_cnt[2]_i_1_n_0 ),
        .Q(bvalid_cnt[2]),
        .R(s_axi_aresetn_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    curr_awlen_reg_1_or_2_i_1
       (.I0(curr_awlen_reg_1_or_2_i_2_n_0),
        .I1(curr_awlen_reg_1_or_2_i_3_n_0),
        .I2(curr_awlen_reg_1_or_2_i_4_n_0),
        .I3(I_WRAP_BRST_n_22),
        .I4(curr_awlen_reg_1_or_2_i_6_n_0),
        .I5(curr_awlen_reg_1_or_2_i_7_n_0),
        .O(curr_awlen_reg_1_or_20));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    curr_awlen_reg_1_or_2_i_2
       (.I0(axi_awlen_pipe[7]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awlen[7]),
        .O(curr_awlen_reg_1_or_2_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    curr_awlen_reg_1_or_2_i_3
       (.I0(axi_awlen_pipe[6]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awlen[6]),
        .O(curr_awlen_reg_1_or_2_i_3_n_0));
  LUT5 #(
    .INIT(32'h00053305)) 
    curr_awlen_reg_1_or_2_i_4
       (.I0(s_axi_awlen[2]),
        .I1(axi_awlen_pipe[2]),
        .I2(s_axi_awlen[3]),
        .I3(axi_awaddr_full),
        .I4(axi_awlen_pipe[3]),
        .O(curr_awlen_reg_1_or_2_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    curr_awlen_reg_1_or_2_i_6
       (.I0(axi_awlen_pipe[5]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awlen[5]),
        .O(curr_awlen_reg_1_or_2_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    curr_awlen_reg_1_or_2_i_7
       (.I0(axi_awlen_pipe[4]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awlen[4]),
        .O(curr_awlen_reg_1_or_2_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    curr_awlen_reg_1_or_2_reg
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(curr_awlen_reg_1_or_20),
        .Q(curr_awlen_reg_1_or_2),
        .R(s_axi_aresetn_0));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT5 #(
    .INIT(32'h00053305)) 
    curr_fixed_burst_reg_i_2
       (.I0(s_axi_awburst[1]),
        .I1(axi_awburst_pipe[1]),
        .I2(s_axi_awburst[0]),
        .I3(axi_awaddr_full),
        .I4(axi_awburst_pipe[0]),
        .O(curr_fixed_burst));
  LUT4 #(
    .INIT(16'h1000)) 
    curr_fixed_burst_reg_i_3
       (.I0(s_axi_wvalid),
        .I1(wr_data_sm_cs[2]),
        .I2(wr_data_sm_cs[0]),
        .I3(wr_data_sm_cs[1]),
        .O(bram_addr_rst_cmb));
  FDRE #(
    .INIT(1'b0)) 
    curr_fixed_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(I_WRAP_BRST_n_2),
        .Q(curr_fixed_burst_reg),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAAFEAE00005404)) 
    curr_wrap_burst_reg_i_2
       (.I0(BID_FIFO_n_0),
        .I1(s_axi_awburst[1]),
        .I2(axi_awaddr_full),
        .I3(axi_awburst_pipe[1]),
        .I4(curr_wrap_burst_reg_i_4_n_0),
        .I5(curr_wrap_burst_reg),
        .O(curr_wrap_burst_reg_i_2_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    curr_wrap_burst_reg_i_3
       (.I0(wr_data_sm_cs[1]),
        .I1(wr_data_sm_cs[0]),
        .O(curr_wrap_burst_reg_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    curr_wrap_burst_reg_i_4
       (.I0(axi_awburst_pipe[0]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awburst[0]),
        .O(curr_wrap_burst_reg_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    curr_wrap_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(I_WRAP_BRST_n_26),
        .Q(curr_wrap_burst_reg),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000440347)) 
    ua_narrow_load1_carry_i_1
       (.I0(axi_awsize_pipe[1]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awsize[1]),
        .I3(axi_awsize_pipe[2]),
        .I4(s_axi_awsize[2]),
        .I5(ua_narrow_load1_carry_i_5_n_0),
        .O(ua_narrow_load1_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFCFAACFFF)) 
    ua_narrow_load1_carry_i_10
       (.I0(s_axi_awsize[2]),
        .I1(axi_awsize_pipe[2]),
        .I2(axi_awsize_pipe[1]),
        .I3(axi_awaddr_full),
        .I4(s_axi_awsize[1]),
        .I5(I_WRAP_BRST_n_20),
        .O(ua_narrow_load1_carry_i_10_n_0));
  LUT6 #(
    .INIT(64'h00000000001D0000)) 
    ua_narrow_load1_carry_i_2
       (.I0(s_axi_awaddr[2]),
        .I1(axi_awaddr_full),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg_n_0_[2] ),
        .I3(I_WRAP_BRST_n_20),
        .I4(I_WRAP_BRST_n_21),
        .I5(I_WRAP_BRST_n_24),
        .O(ua_narrow_load1_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFBBFCB8)) 
    ua_narrow_load1_carry_i_3
       (.I0(axi_awsize_pipe[1]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awsize[1]),
        .I3(axi_awsize_pipe[2]),
        .I4(s_axi_awsize[2]),
        .I5(ua_narrow_load1_carry_i_5_n_0),
        .O(ua_narrow_load1_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000EEEC0000C2C0)) 
    ua_narrow_load1_carry_i_4__0
       (.I0(ua_narrow_load1_carry_i_6__0_n_0),
        .I1(I_WRAP_BRST_n_21),
        .I2(I_WRAP_BRST_n_20),
        .I3(ua_narrow_load1_carry_i_7_n_0),
        .I4(I_WRAP_BRST_n_24),
        .I5(ua_narrow_load1_carry_i_8_n_0),
        .O(ua_narrow_load1_carry_i_4__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT5 #(
    .INIT(32'hE200E2E2)) 
    ua_narrow_load1_carry_i_5
       (.I0(s_axi_awaddr[2]),
        .I1(axi_awaddr_full),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg_n_0_[2] ),
        .I3(ua_narrow_load1_carry_i_9_n_0),
        .I4(ua_narrow_load1_carry_i_10_n_0),
        .O(ua_narrow_load1_carry_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ua_narrow_load1_carry_i_6__0
       (.I0(\GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg_n_0_[1] ),
        .I1(axi_awaddr_full),
        .I2(s_axi_awaddr[1]),
        .O(ua_narrow_load1_carry_i_6__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ua_narrow_load1_carry_i_7
       (.I0(\GEN_AW_PIPE_DUAL.GEN_AWADDR[0].axi_awaddr_pipe_reg_n_0_[0] ),
        .I1(axi_awaddr_full),
        .I2(s_axi_awaddr[0]),
        .O(ua_narrow_load1_carry_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ua_narrow_load1_carry_i_8
       (.I0(\GEN_AW_PIPE_DUAL.GEN_AWADDR[2].axi_awaddr_pipe_reg_n_0_[2] ),
        .I1(axi_awaddr_full),
        .I2(s_axi_awaddr[2]),
        .O(ua_narrow_load1_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hE2E2E20000000000)) 
    ua_narrow_load1_carry_i_9
       (.I0(s_axi_awaddr[1]),
        .I1(axi_awaddr_full),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[1].axi_awaddr_pipe_reg_n_0_[1] ),
        .I3(I_WRAP_BRST_n_20),
        .I4(ua_narrow_load1_carry_i_7_n_0),
        .I5(\GEN_NARROW_CNT_LD.narrow_burst_cnt_ld_reg[2]_i_2_n_0 ),
        .O(ua_narrow_load1_carry_i_9_n_0));
endmodule

(* ORIG_REF_NAME = "wrap_brst" *) 
module axi_bram_ctrl_0_wrap_brst
   (SR,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ,
    curr_fixed_burst_reg_reg,
    bram_addr_ld_en_mod,
    bram_addr_inc,
    D,
    E,
    \wrap_burst_total_reg[0]_0 ,
    \wrap_burst_total_reg[1]_0 ,
    \wrap_burst_total_reg[1]_1 ,
    curr_awlen_reg_1_or_2_reg,
    \wrap_burst_total_reg[0]_1 ,
    \wrap_burst_total_reg[1]_2 ,
    \wrap_burst_total_reg[2]_0 ,
    curr_wrap_burst_reg_reg,
    s_axi_wvalid,
    out,
    s_axi_aresetn,
    \GEN_AW_DUAL.wr_addr_sm_cs_reg ,
    curr_fixed_burst_reg,
    curr_fixed_burst,
    bram_addr_rst_cmb,
    curr_narrow_burst,
    Q,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ,
    axi_awaddr_full,
    s_axi_awaddr,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[15].axi_awaddr_pipe_reg ,
    \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ,
    curr_wrap_burst_reg,
    narrow_addr_int,
    narrow_bram_addr_inc_d1,
    s_axi_awsize,
    \GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] ,
    s_axi_awlen,
    \GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] ,
    \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg ,
    \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[1] ,
    s_axi_aresetn_0,
    s_axi_aclk);
  output [0:0]SR;
  output \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ;
  output curr_fixed_burst_reg_reg;
  output bram_addr_ld_en_mod;
  output bram_addr_inc;
  output [12:0]D;
  output [0:0]E;
  output \wrap_burst_total_reg[0]_0 ;
  output \wrap_burst_total_reg[1]_0 ;
  output \wrap_burst_total_reg[1]_1 ;
  output curr_awlen_reg_1_or_2_reg;
  output \wrap_burst_total_reg[0]_1 ;
  output \wrap_burst_total_reg[1]_2 ;
  output \wrap_burst_total_reg[2]_0 ;
  output curr_wrap_burst_reg_reg;
  input s_axi_wvalid;
  input [2:0]out;
  input s_axi_aresetn;
  input \GEN_AW_DUAL.wr_addr_sm_cs_reg ;
  input curr_fixed_burst_reg;
  input curr_fixed_burst;
  input bram_addr_rst_cmb;
  input curr_narrow_burst;
  input [8:0]Q;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ;
  input axi_awaddr_full;
  input [12:0]s_axi_awaddr;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ;
  input \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[15].axi_awaddr_pipe_reg ;
  input \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ;
  input curr_wrap_burst_reg;
  input [2:0]narrow_addr_int;
  input narrow_bram_addr_inc_d1;
  input [2:0]s_axi_awsize;
  input [2:0]\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] ;
  input [3:0]s_axi_awlen;
  input [3:0]\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] ;
  input \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg ;
  input \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[1] ;
  input s_axi_aresetn_0;
  input s_axi_aclk;

  wire [12:0]D;
  wire [0:0]E;
  wire \FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[1] ;
  wire \GEN_AW_DUAL.wr_addr_sm_cs_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[15].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ;
  wire \GEN_AW_PIPE_DUAL.axi_awaddr_full_reg ;
  wire [3:0]\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] ;
  wire [2:0]\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_4_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_6_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2__0_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] ;
  wire [8:0]Q;
  wire [0:0]SR;
  wire axi_awaddr_full;
  wire bram_addr_inc;
  wire [11:4]bram_addr_ld;
  wire bram_addr_ld_en_mod;
  wire bram_addr_rst_cmb;
  wire curr_awlen_reg_1_or_2_reg;
  wire curr_fixed_burst;
  wire curr_fixed_burst_reg;
  wire curr_fixed_burst_reg_reg;
  wire curr_narrow_burst;
  wire curr_wrap_burst_reg;
  wire curr_wrap_burst_reg_reg;
  wire [2:0]narrow_addr_int;
  wire narrow_bram_addr_inc_d1;
  wire [2:0]out;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire s_axi_aresetn_0;
  wire [12:0]s_axi_awaddr;
  wire [3:0]s_axi_awlen;
  wire [2:0]s_axi_awsize;
  wire s_axi_wvalid;
  wire [15:4]save_init_bram_addr_ld;
  wire \save_init_bram_addr_ld[4]_i_2_n_0 ;
  wire \save_init_bram_addr_ld[5]_i_2_n_0 ;
  wire \save_init_bram_addr_ld[6]_i_2_n_0 ;
  wire [2:0]wrap_burst_total;
  wire \wrap_burst_total[0]_i_2_n_0 ;
  wire \wrap_burst_total[1]_i_2_n_0 ;
  wire \wrap_burst_total[1]_i_3__0_n_0 ;
  wire \wrap_burst_total[1]_i_5__0_n_0 ;
  wire \wrap_burst_total[2]_i_3__0_n_0 ;
  wire \wrap_burst_total[2]_i_4__0_n_0 ;
  wire [2:0]wrap_burst_total_cmb;
  wire \wrap_burst_total_reg[0]_0 ;
  wire \wrap_burst_total_reg[0]_1 ;
  wire \wrap_burst_total_reg[1]_0 ;
  wire \wrap_burst_total_reg[1]_1 ;
  wire \wrap_burst_total_reg[1]_2 ;
  wire \wrap_burst_total_reg[2]_0 ;

  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_1 
       (.I0(bram_addr_ld[10]),
        .I1(bram_addr_ld_en_mod),
        .I2(Q[7]),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] ),
        .I4(Q[6]),
        .O(D[7]));
  LUT5 #(
    .INIT(32'hABABABAA)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_1 
       (.I0(bram_addr_ld_en_mod),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3_n_0 ),
        .I2(curr_fixed_burst_reg),
        .I3(curr_narrow_burst),
        .I4(bram_addr_inc),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ));
  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_2 
       (.I0(bram_addr_ld[11]),
        .I1(bram_addr_ld_en_mod),
        .I2(Q[8]),
        .I3(Q[6]),
        .I4(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] ),
        .I5(Q[7]),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hFF00FF00FE00FF00)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3 
       (.I0(narrow_addr_int[1]),
        .I1(narrow_addr_int[0]),
        .I2(narrow_addr_int[2]),
        .I3(curr_narrow_burst),
        .I4(bram_addr_inc),
        .I5(narrow_bram_addr_inc_d1),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(s_axi_wvalid),
        .O(bram_addr_inc));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[12]_i_1 
       (.I0(save_init_bram_addr_ld[12]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[12].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[9]),
        .O(D[9]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_1 
       (.I0(save_init_bram_addr_ld[13]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[13].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[10]),
        .O(D[10]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_1 
       (.I0(save_init_bram_addr_ld[14]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[14].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[11]),
        .O(D[11]));
  LUT6 #(
    .INIT(64'h01000000FFFFFFFF)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_1__0 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ),
        .I1(s_axi_wvalid),
        .I2(out[2]),
        .I3(out[0]),
        .I4(out[1]),
        .I5(s_axi_aresetn),
        .O(SR));
  LUT6 #(
    .INIT(64'h01000000FFFFFFFF)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_2 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_4_n_0 ),
        .I1(out[1]),
        .I2(out[2]),
        .I3(out[0]),
        .I4(s_axi_wvalid),
        .I5(\GEN_AW_DUAL.wr_addr_sm_cs_reg ),
        .O(bram_addr_ld_en_mod));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3 
       (.I0(save_init_bram_addr_ld[15]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[15].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[12]),
        .O(D[12]));
  LUT5 #(
    .INIT(32'hFFFF15FF)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_4 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_6_n_0 ),
        .I1(\save_init_bram_addr_ld[6]_i_2_n_0 ),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2__0_n_0 ),
        .I3(curr_wrap_burst_reg),
        .I4(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3_n_0 ),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5 
       (.I0(\GEN_AW_DUAL.wr_addr_sm_cs_reg ),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_4_n_0 ),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h000000008F00C000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_6 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(wrap_burst_total[1]),
        .I3(Q[0]),
        .I4(wrap_burst_total[0]),
        .I5(wrap_burst_total[2]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h454045404540FFFF)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_1 
       (.I0(\GEN_AW_DUAL.wr_addr_sm_cs_reg ),
        .I1(\GEN_AW_PIPE_DUAL.GEN_AWADDR[3].axi_awaddr_pipe_reg ),
        .I2(axi_awaddr_full),
        .I3(s_axi_awaddr[0]),
        .I4(bram_addr_ld_en_mod),
        .I5(Q[0]),
        .O(D[0]));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_1 
       (.I0(bram_addr_ld[4]),
        .I1(bram_addr_ld_en_mod),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_1 
       (.I0(bram_addr_ld[5]),
        .I1(bram_addr_ld_en_mod),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_1 
       (.I0(bram_addr_ld[6]),
        .I1(bram_addr_ld_en_mod),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(D[3]));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_1 
       (.I0(bram_addr_ld[7]),
        .I1(bram_addr_ld_en_mod),
        .I2(Q[4]),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2__0_n_0 ),
        .O(D[4]));
  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_1 
       (.I0(bram_addr_ld[8]),
        .I1(bram_addr_ld_en_mod),
        .I2(Q[5]),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2__0_n_0 ),
        .I4(Q[4]),
        .O(D[5]));
  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_1 
       (.I0(bram_addr_ld[9]),
        .I1(bram_addr_ld_en_mod),
        .I2(Q[6]),
        .I3(Q[4]),
        .I4(\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2__0_n_0 ),
        .I5(Q[5]),
        .O(D[6]));
  LUT4 #(
    .INIT(16'h8000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2__0 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    curr_awlen_reg_1_or_2_i_5
       (.I0(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] [1]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awlen[1]),
        .O(curr_awlen_reg_1_or_2_reg));
  LUT6 #(
    .INIT(64'hD800D8000000D800)) 
    curr_fixed_burst_reg_i_1__0
       (.I0(\GEN_AW_DUAL.wr_addr_sm_cs_reg ),
        .I1(curr_fixed_burst_reg),
        .I2(curr_fixed_burst),
        .I3(s_axi_aresetn),
        .I4(bram_addr_rst_cmb),
        .I5(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ),
        .O(curr_fixed_burst_reg_reg));
  LUT6 #(
    .INIT(64'h8888888888888880)) 
    curr_wrap_burst_reg_i_1__0
       (.I0(\GEN_AW_PIPE_DUAL.axi_awaddr_full_reg ),
        .I1(s_axi_aresetn),
        .I2(\FSM_sequential_GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs_reg[1] ),
        .I3(out[2]),
        .I4(s_axi_wvalid),
        .I5(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ),
        .O(curr_wrap_burst_reg_reg));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[10]_i_1 
       (.I0(save_init_bram_addr_ld[10]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[10].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[7]),
        .O(bram_addr_ld[10]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[11]_i_1 
       (.I0(save_init_bram_addr_ld[11]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[11].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[8]),
        .O(bram_addr_ld[11]));
  LUT1 #(
    .INIT(2'h1)) 
    \save_init_bram_addr_ld[15]_i_1 
       (.I0(\GEN_AW_DUAL.wr_addr_sm_cs_reg ),
        .O(E));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[4]_i_1 
       (.I0(\save_init_bram_addr_ld[4]_i_2_n_0 ),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[4].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[1]),
        .O(bram_addr_ld[4]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'hA282)) 
    \save_init_bram_addr_ld[4]_i_2 
       (.I0(save_init_bram_addr_ld[4]),
        .I1(wrap_burst_total[1]),
        .I2(wrap_burst_total[2]),
        .I3(wrap_burst_total[0]),
        .O(\save_init_bram_addr_ld[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[5]_i_1 
       (.I0(\save_init_bram_addr_ld[5]_i_2_n_0 ),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[5].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[2]),
        .O(bram_addr_ld[5]));
  LUT4 #(
    .INIT(16'hA28A)) 
    \save_init_bram_addr_ld[5]_i_2 
       (.I0(save_init_bram_addr_ld[5]),
        .I1(wrap_burst_total[0]),
        .I2(wrap_burst_total[2]),
        .I3(wrap_burst_total[1]),
        .O(\save_init_bram_addr_ld[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2F202F2F2F202020)) 
    \save_init_bram_addr_ld[6]_i_1 
       (.I0(save_init_bram_addr_ld[6]),
        .I1(\save_init_bram_addr_ld[6]_i_2_n_0 ),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ),
        .I3(\GEN_AW_PIPE_DUAL.GEN_AWADDR[6].axi_awaddr_pipe_reg ),
        .I4(axi_awaddr_full),
        .I5(s_axi_awaddr[3]),
        .O(bram_addr_ld[6]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \save_init_bram_addr_ld[6]_i_2 
       (.I0(wrap_burst_total[0]),
        .I1(wrap_burst_total[2]),
        .I2(wrap_burst_total[1]),
        .O(\save_init_bram_addr_ld[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[7]_i_1 
       (.I0(save_init_bram_addr_ld[7]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[7].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[4]),
        .O(bram_addr_ld[7]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[8]_i_1 
       (.I0(save_init_bram_addr_ld[8]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[8].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[5]),
        .O(bram_addr_ld[8]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[9]_i_1 
       (.I0(save_init_bram_addr_ld[9]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5_n_0 ),
        .I2(\GEN_AW_PIPE_DUAL.GEN_AWADDR[9].axi_awaddr_pipe_reg ),
        .I3(axi_awaddr_full),
        .I4(s_axi_awaddr[6]),
        .O(bram_addr_ld[9]));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[10] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(bram_addr_ld[10]),
        .Q(save_init_bram_addr_ld[10]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[11] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(bram_addr_ld[11]),
        .Q(save_init_bram_addr_ld[11]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[12] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[9]),
        .Q(save_init_bram_addr_ld[12]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[13] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[10]),
        .Q(save_init_bram_addr_ld[13]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[14] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[11]),
        .Q(save_init_bram_addr_ld[14]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[15] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[12]),
        .Q(save_init_bram_addr_ld[15]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(bram_addr_ld[4]),
        .Q(save_init_bram_addr_ld[4]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(bram_addr_ld[5]),
        .Q(save_init_bram_addr_ld[5]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(bram_addr_ld[6]),
        .Q(save_init_bram_addr_ld[6]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[7] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(bram_addr_ld[7]),
        .Q(save_init_bram_addr_ld[7]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[8] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(bram_addr_ld[8]),
        .Q(save_init_bram_addr_ld[8]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[9] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(bram_addr_ld[9]),
        .Q(save_init_bram_addr_ld[9]),
        .R(s_axi_aresetn_0));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'h02A2)) 
    \wrap_burst_total[0]_i_1 
       (.I0(\wrap_burst_total[0]_i_2_n_0 ),
        .I1(s_axi_awsize[2]),
        .I2(axi_awaddr_full),
        .I3(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] [2]),
        .O(wrap_burst_total_cmb[0]));
  LUT6 #(
    .INIT(64'h2828000002002000)) 
    \wrap_burst_total[0]_i_2 
       (.I0(\wrap_burst_total[1]_i_5__0_n_0 ),
        .I1(\wrap_burst_total_reg[0]_0 ),
        .I2(\wrap_burst_total_reg[1]_0 ),
        .I3(\wrap_burst_total_reg[1]_1 ),
        .I4(curr_awlen_reg_1_or_2_reg),
        .I5(\wrap_burst_total_reg[0]_1 ),
        .O(\wrap_burst_total[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAEAAAAAA)) 
    \wrap_burst_total[1]_i_1 
       (.I0(\wrap_burst_total[1]_i_2_n_0 ),
        .I1(\wrap_burst_total[1]_i_3__0_n_0 ),
        .I2(\wrap_burst_total_reg[1]_0 ),
        .I3(\wrap_burst_total[1]_i_5__0_n_0 ),
        .I4(\wrap_burst_total_reg[1]_1 ),
        .I5(\wrap_burst_total_reg[1]_2 ),
        .O(wrap_burst_total_cmb[1]));
  LUT6 #(
    .INIT(64'h0000000000004808)) 
    \wrap_burst_total[1]_i_2 
       (.I0(\wrap_burst_total_reg[1]_1 ),
        .I1(\wrap_burst_total_reg[1]_0 ),
        .I2(\wrap_burst_total_reg[0]_0 ),
        .I3(\wrap_burst_total_reg[0]_1 ),
        .I4(\wrap_burst_total[2]_i_4__0_n_0 ),
        .I5(\wrap_burst_total_reg[1]_2 ),
        .O(\wrap_burst_total[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT5 #(
    .INIT(32'hCCA000A0)) 
    \wrap_burst_total[1]_i_3__0 
       (.I0(s_axi_awlen[1]),
        .I1(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] [1]),
        .I2(s_axi_awlen[2]),
        .I3(axi_awaddr_full),
        .I4(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] [2]),
        .O(\wrap_burst_total[1]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_4 
       (.I0(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] [0]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awsize[0]),
        .O(\wrap_burst_total_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_5__0 
       (.I0(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] [0]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awlen[0]),
        .O(\wrap_burst_total[1]_i_5__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_6 
       (.I0(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] [1]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awsize[1]),
        .O(\wrap_burst_total_reg[1]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_7 
       (.I0(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] [2]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awsize[2]),
        .O(\wrap_burst_total_reg[1]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_8 
       (.I0(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] [3]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awlen[3]),
        .O(\wrap_burst_total_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_9 
       (.I0(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] [2]),
        .I1(axi_awaddr_full),
        .I2(s_axi_awlen[2]),
        .O(\wrap_burst_total_reg[0]_1 ));
  LUT6 #(
    .INIT(64'h0000000010150000)) 
    \wrap_burst_total[2]_i_1 
       (.I0(\wrap_burst_total_reg[2]_0 ),
        .I1(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] [2]),
        .I2(axi_awaddr_full),
        .I3(s_axi_awsize[2]),
        .I4(\wrap_burst_total[2]_i_3__0_n_0 ),
        .I5(\wrap_burst_total[2]_i_4__0_n_0 ),
        .O(wrap_burst_total_cmb[2]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT5 #(
    .INIT(32'h335FFF5F)) 
    \wrap_burst_total[2]_i_2 
       (.I0(s_axi_awsize[0]),
        .I1(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] [0]),
        .I2(s_axi_awsize[1]),
        .I3(axi_awaddr_full),
        .I4(\GEN_AW_PIPE_DUAL.axi_awsize_pipe_reg[2] [1]),
        .O(\wrap_burst_total_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT5 #(
    .INIT(32'hCCA000A0)) 
    \wrap_burst_total[2]_i_3__0 
       (.I0(s_axi_awlen[2]),
        .I1(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] [2]),
        .I2(s_axi_awlen[3]),
        .I3(axi_awaddr_full),
        .I4(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] [3]),
        .O(\wrap_burst_total[2]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT5 #(
    .INIT(32'h335FFF5F)) 
    \wrap_burst_total[2]_i_4__0 
       (.I0(s_axi_awlen[0]),
        .I1(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] [0]),
        .I2(s_axi_awlen[1]),
        .I3(axi_awaddr_full),
        .I4(\GEN_AW_PIPE_DUAL.axi_awlen_pipe_reg[3] [1]),
        .O(\wrap_burst_total[2]_i_4__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wrap_burst_total_cmb[0]),
        .Q(wrap_burst_total[0]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wrap_burst_total_cmb[1]),
        .Q(wrap_burst_total[1]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(wrap_burst_total_cmb[2]),
        .Q(wrap_burst_total[2]),
        .R(s_axi_aresetn_0));
endmodule

(* ORIG_REF_NAME = "wrap_brst" *) 
module axi_bram_ctrl_0_wrap_brst_1
   (bram_addr_ld_en,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0 ,
    SR,
    E,
    D,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] ,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_1 ,
    \save_init_bram_addr_ld_reg[15]_0 ,
    \wrap_burst_total_reg[0]_0 ,
    axi_rd_burst_two_reg,
    \wrap_burst_total_reg[1]_0 ,
    \wrap_burst_total_reg[1]_1 ,
    \wrap_burst_total_reg[1]_2 ,
    \wrap_burst_total_reg[1]_3 ,
    narrow_bram_addr_inc_d1,
    curr_narrow_burst,
    s_axi_aresetn,
    curr_fixed_burst_reg,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_2 ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg[11] ,
    bram_addr_b,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg[10] ,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg[9] ,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]_0 ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg[8] ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg[7] ,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg[6] ,
    \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg[5] ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg[4] ,
    s_axi_araddr,
    axi_araddr_full,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg ,
    \GEN_AR_PIPE_DUAL.GEN_ARADDR[15].axi_araddr_pipe_reg ,
    curr_wrap_burst_reg,
    narrow_addr_int,
    Q,
    axi_rd_burst_two_reg_0,
    axi_rd_burst,
    axi_rvalid_int_reg,
    s_axi_rready,
    end_brst_rd,
    axi_b2b_brst,
    brst_zero,
    axi_aresetn_d2,
    last_bram_addr,
    axi_arsize_pipe_max,
    disable_b2b_brst,
    axi_arlen_pipe_1_or_2,
    \GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg ,
    rd_addr_sm_cs,
    no_ar_ack,
    pend_rd_op_reg,
    ar_active,
    s_axi_arvalid,
    s_axi_arsize,
    \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] ,
    \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ,
    s_axi_arlen,
    \GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] ,
    s_axi_aclk);
  output bram_addr_ld_en;
  output \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ;
  output \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0 ;
  output [0:0]SR;
  output [1:0]E;
  output [12:0]D;
  output \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] ;
  output \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_1 ;
  output \save_init_bram_addr_ld_reg[15]_0 ;
  output \wrap_burst_total_reg[0]_0 ;
  output axi_rd_burst_two_reg;
  output \wrap_burst_total_reg[1]_0 ;
  output \wrap_burst_total_reg[1]_1 ;
  output \wrap_burst_total_reg[1]_2 ;
  output \wrap_burst_total_reg[1]_3 ;
  input narrow_bram_addr_inc_d1;
  input curr_narrow_burst;
  input s_axi_aresetn;
  input curr_fixed_burst_reg;
  input \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_2 ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg[11] ;
  input [7:0]bram_addr_b;
  input \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg[10] ;
  input \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg[9] ;
  input \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]_0 ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg[8] ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg[7] ;
  input \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg[6] ;
  input \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg[5] ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg[4] ;
  input [12:0]s_axi_araddr;
  input axi_araddr_full;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg ;
  input \GEN_AR_PIPE_DUAL.GEN_ARADDR[15].axi_araddr_pipe_reg ;
  input curr_wrap_burst_reg;
  input [2:0]narrow_addr_int;
  input [3:0]Q;
  input axi_rd_burst_two_reg_0;
  input axi_rd_burst;
  input axi_rvalid_int_reg;
  input s_axi_rready;
  input end_brst_rd;
  input axi_b2b_brst;
  input brst_zero;
  input axi_aresetn_d2;
  input last_bram_addr;
  input axi_arsize_pipe_max;
  input disable_b2b_brst;
  input axi_arlen_pipe_1_or_2;
  input \GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg ;
  input rd_addr_sm_cs;
  input no_ar_ack;
  input pend_rd_op_reg;
  input ar_active;
  input s_axi_arvalid;
  input [1:0]s_axi_arsize;
  input [1:0]\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] ;
  input \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ;
  input [3:0]s_axi_arlen;
  input [3:0]\GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] ;
  input s_axi_aclk;

  wire [12:0]D;
  wire [1:0]E;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg[10] ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg[11] ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[15].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg[4] ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg[5] ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg[6] ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg[7] ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg[8] ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ;
  wire \GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg[9] ;
  wire \GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg ;
  wire [3:0]\GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] ;
  wire \GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ;
  wire [1:0]\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_10_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_11_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3__0_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_8_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_9_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_4__0_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5__0_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_2_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3_n_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_1 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_2 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]_0 ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] ;
  wire \GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] ;
  wire [3:0]Q;
  wire [0:0]SR;
  wire ar_active;
  wire axi_araddr_full;
  wire axi_aresetn_d2;
  wire axi_arlen_pipe_1_or_2;
  wire axi_arsize_pipe_max;
  wire axi_b2b_brst;
  wire axi_rd_burst;
  wire axi_rd_burst_two_reg;
  wire axi_rd_burst_two_reg_0;
  wire axi_rvalid_int_reg;
  wire [7:0]bram_addr_b;
  wire [11:4]bram_addr_ld;
  wire bram_addr_ld_en;
  wire brst_zero;
  wire curr_fixed_burst_reg;
  wire curr_narrow_burst;
  wire curr_wrap_burst_reg;
  wire disable_b2b_brst;
  wire end_brst_rd;
  wire last_bram_addr;
  wire [2:0]narrow_addr_int;
  wire narrow_bram_addr_inc_d1;
  wire no_ar_ack;
  wire pend_rd_op_reg;
  wire rd_addr_sm_cs;
  wire s_axi_aclk;
  wire [12:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire [3:0]s_axi_arlen;
  wire [1:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire s_axi_rready;
  wire [15:4]save_init_bram_addr_ld;
  wire \save_init_bram_addr_ld[15]_i_2_n_0 ;
  wire \save_init_bram_addr_ld[15]_i_3_n_0 ;
  wire \save_init_bram_addr_ld[15]_i_5_n_0 ;
  wire \save_init_bram_addr_ld_reg[15]_0 ;
  wire [2:0]wrap_burst_total;
  wire \wrap_burst_total[0]_i_2__0_n_0 ;
  wire \wrap_burst_total[1]_i_3_n_0 ;
  wire \wrap_burst_total[2]_i_4_n_0 ;
  wire [2:0]wrap_burst_total_cmb;
  wire \wrap_burst_total_reg[0]_0 ;
  wire \wrap_burst_total_reg[1]_0 ;
  wire \wrap_burst_total_reg[1]_1 ;
  wire \wrap_burst_total_reg[1]_2 ;
  wire \wrap_burst_total_reg[1]_3 ;

  LUT6 #(
    .INIT(64'hFFF600F6FF060006)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[10]_i_1__0 
       (.I0(bram_addr_b[7]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[9] ),
        .I2(bram_addr_ld_en),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I4(save_init_bram_addr_ld[10]),
        .I5(\GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg[10] ),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_10 
       (.I0(axi_rd_burst_two_reg_0),
        .I1(Q[0]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080800080)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_11 
       (.I0(Q[0]),
        .I1(axi_rvalid_int_reg),
        .I2(s_axi_rready),
        .I3(end_brst_rd),
        .I4(axi_b2b_brst),
        .I5(brst_zero),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h55555755555557FF)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_1__0 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3__0_n_0 ),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0 ),
        .I2(narrow_bram_addr_inc_d1),
        .I3(curr_narrow_burst),
        .I4(curr_fixed_burst_reg),
        .I5(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ),
        .O(E[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFE0EF202)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_2__0 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_2 ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I3(save_init_bram_addr_ld[11]),
        .I4(\GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg[11] ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'h5555555454545454)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3__0 
       (.I0(bram_addr_ld_en),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_8_n_0 ),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0 ),
        .I4(narrow_bram_addr_inc_d1),
        .I5(curr_narrow_burst),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_3__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_4__0 
       (.I0(narrow_addr_int[1]),
        .I1(narrow_addr_int[0]),
        .I2(narrow_addr_int[2]),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ),
        .I4(curr_narrow_burst),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0 ));
  LUT6 #(
    .INIT(64'h5755570057555755)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_5 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_9_n_0 ),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_10_n_0 ),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_11_n_0 ),
        .I3(Q[1]),
        .I4(Q[3]),
        .I5(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_1 ),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ));
  LUT6 #(
    .INIT(64'h55555555FFDFFFFF)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_8 
       (.I0(curr_wrap_burst_reg),
        .I1(wrap_burst_total[1]),
        .I2(wrap_burst_total[2]),
        .I3(wrap_burst_total[0]),
        .I4(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] ),
        .I5(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5__0_n_0 ),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h000F000E000F0000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_9 
       (.I0(axi_rd_burst_two_reg_0),
        .I1(axi_rd_burst),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[11]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[12]_i_1__0 
       (.I0(save_init_bram_addr_ld[12]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I2(\GEN_AR_PIPE_DUAL.GEN_ARADDR[12].axi_araddr_pipe_reg ),
        .I3(axi_araddr_full),
        .I4(s_axi_araddr[9]),
        .O(D[9]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[13]_i_1__0 
       (.I0(save_init_bram_addr_ld[13]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I2(\GEN_AR_PIPE_DUAL.GEN_ARADDR[13].axi_araddr_pipe_reg ),
        .I3(axi_araddr_full),
        .I4(s_axi_araddr[10]),
        .O(D[10]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[14]_i_1__0 
       (.I0(save_init_bram_addr_ld[14]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I2(\GEN_AR_PIPE_DUAL.GEN_ARADDR[14].axi_araddr_pipe_reg ),
        .I3(axi_araddr_full),
        .I4(s_axi_araddr[11]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_1 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I1(bram_addr_ld_en),
        .O(E[1]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_2__0 
       (.I0(save_init_bram_addr_ld[15]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I2(\GEN_AR_PIPE_DUAL.GEN_ARADDR[15].axi_araddr_pipe_reg ),
        .I3(axi_araddr_full),
        .I4(s_axi_araddr[12]),
        .O(D[12]));
  LUT6 #(
    .INIT(64'h0000000088888000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_4__0_n_0 ),
        .I1(curr_wrap_burst_reg),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3_n_0 ),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] ),
        .I4(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5__0_n_0 ),
        .I5(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11] ),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ));
  LUT3 #(
    .INIT(8'h1F)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_4__0 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_0 ),
        .I1(narrow_bram_addr_inc_d1),
        .I2(curr_narrow_burst),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'h08000C000F000000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5__0 
       (.I0(bram_addr_b[2]),
        .I1(bram_addr_b[1]),
        .I2(wrap_burst_total[2]),
        .I3(bram_addr_b[0]),
        .I4(wrap_burst_total[0]),
        .I5(wrap_burst_total[1]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'h00000000DDD111D1)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[3]_i_1__0 
       (.I0(bram_addr_b[0]),
        .I1(bram_addr_ld_en),
        .I2(s_axi_araddr[0]),
        .I3(axi_araddr_full),
        .I4(\GEN_AR_PIPE_DUAL.GEN_ARADDR[3].axi_araddr_pipe_reg ),
        .I5(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFF600F6FF060006)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_1__0 
       (.I0(bram_addr_b[1]),
        .I1(bram_addr_b[0]),
        .I2(bram_addr_ld_en),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I4(\GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_2_n_0 ),
        .I5(\GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg[4] ),
        .O(D[1]));
  LUT4 #(
    .INIT(16'hA282)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_2 
       (.I0(save_init_bram_addr_ld[4]),
        .I1(wrap_burst_total[1]),
        .I2(wrap_burst_total[2]),
        .I3(wrap_burst_total[0]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFF600F6FF060006)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_1__0 
       (.I0(bram_addr_b[2]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[4] ),
        .I2(bram_addr_ld_en),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I4(\GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3_n_0 ),
        .I5(\GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg[5] ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hA28A)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3 
       (.I0(save_init_bram_addr_ld[5]),
        .I1(wrap_burst_total[0]),
        .I2(wrap_burst_total[2]),
        .I3(wrap_burst_total[1]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0E0EFE0E0202F202)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_1__0 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[6] ),
        .I1(bram_addr_ld_en),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I3(save_init_bram_addr_ld[6]),
        .I4(\GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3_n_0 ),
        .I5(\GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg[6] ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3 
       (.I0(wrap_burst_total[0]),
        .I1(wrap_burst_total[2]),
        .I2(wrap_burst_total[1]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF600F6FF060006)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_1__0 
       (.I0(bram_addr_b[4]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] ),
        .I2(bram_addr_ld_en),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I4(save_init_bram_addr_ld[7]),
        .I5(\GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg[7] ),
        .O(D[4]));
  LUT4 #(
    .INIT(16'h8000)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[7]_i_2 
       (.I0(bram_addr_b[3]),
        .I1(bram_addr_b[1]),
        .I2(bram_addr_b[0]),
        .I3(bram_addr_b[2]),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7] ));
  LUT6 #(
    .INIT(64'hFFF600F6FF060006)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[8]_i_1__0 
       (.I0(bram_addr_b[5]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[7]_0 ),
        .I2(bram_addr_ld_en),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I4(save_init_bram_addr_ld[8]),
        .I5(\GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg[8] ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hFFF600F6FF060006)) 
    \GEN_DUAL_ADDR_CNT.bram_addr_int[9]_i_1__0 
       (.I0(bram_addr_b[6]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[8] ),
        .I2(bram_addr_ld_en),
        .I3(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I4(save_init_bram_addr_ld[9]),
        .I5(\GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg[9] ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    axi_rd_burst_two_i_2
       (.I0(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] [0]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[0]),
        .O(axi_rd_burst_two_reg));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    bram_en_int_i_8
       (.I0(end_brst_rd),
        .I1(brst_zero),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(axi_rvalid_int_reg),
        .I5(s_axi_rready),
        .O(\GEN_DUAL_ADDR_CNT.bram_addr_int_reg[11]_1 ));
  LUT1 #(
    .INIT(2'h1)) 
    bram_rst_b_INST_0
       (.I0(s_axi_aresetn),
        .O(SR));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[10]_i_1__0 
       (.I0(save_init_bram_addr_ld[10]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I2(\GEN_AR_PIPE_DUAL.GEN_ARADDR[10].axi_araddr_pipe_reg ),
        .I3(axi_araddr_full),
        .I4(s_axi_araddr[7]),
        .O(bram_addr_ld[10]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[11]_i_1__0 
       (.I0(save_init_bram_addr_ld[11]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I2(\GEN_AR_PIPE_DUAL.GEN_ARADDR[11].axi_araddr_pipe_reg ),
        .I3(axi_araddr_full),
        .I4(s_axi_araddr[8]),
        .O(bram_addr_ld[11]));
  LUT6 #(
    .INIT(64'h00000008AAAAAAAA)) 
    \save_init_bram_addr_ld[15]_i_1__0 
       (.I0(axi_aresetn_d2),
        .I1(last_bram_addr),
        .I2(\save_init_bram_addr_ld[15]_i_2_n_0 ),
        .I3(\save_init_bram_addr_ld[15]_i_3_n_0 ),
        .I4(\save_init_bram_addr_ld_reg[15]_0 ),
        .I5(\save_init_bram_addr_ld[15]_i_5_n_0 ),
        .O(bram_addr_ld_en));
  LUT3 #(
    .INIT(8'h2A)) 
    \save_init_bram_addr_ld[15]_i_2 
       (.I0(brst_zero),
        .I1(s_axi_rready),
        .I2(axi_rvalid_int_reg),
        .O(\save_init_bram_addr_ld[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \save_init_bram_addr_ld[15]_i_3 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\save_init_bram_addr_ld[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFDFFFF)) 
    \save_init_bram_addr_ld[15]_i_4 
       (.I0(axi_arsize_pipe_max),
        .I1(disable_b2b_brst),
        .I2(axi_arlen_pipe_1_or_2),
        .I3(\GEN_AR_PIPE_DUAL.axi_arburst_pipe_fixed_reg ),
        .I4(axi_araddr_full),
        .O(\save_init_bram_addr_ld_reg[15]_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFEFFFEFFFF)) 
    \save_init_bram_addr_ld[15]_i_5 
       (.I0(rd_addr_sm_cs),
        .I1(no_ar_ack),
        .I2(pend_rd_op_reg),
        .I3(ar_active),
        .I4(axi_araddr_full),
        .I5(s_axi_arvalid),
        .O(\save_init_bram_addr_ld[15]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[4]_i_1__0 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int[4]_i_2_n_0 ),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I2(\GEN_AR_PIPE_DUAL.GEN_ARADDR[4].axi_araddr_pipe_reg ),
        .I3(axi_araddr_full),
        .I4(s_axi_araddr[1]),
        .O(bram_addr_ld[4]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[5]_i_1__0 
       (.I0(\GEN_DUAL_ADDR_CNT.bram_addr_int[5]_i_3_n_0 ),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I2(\GEN_AR_PIPE_DUAL.GEN_ARADDR[5].axi_araddr_pipe_reg ),
        .I3(axi_araddr_full),
        .I4(s_axi_araddr[2]),
        .O(bram_addr_ld[5]));
  LUT6 #(
    .INIT(64'h2F202F2F2F202020)) 
    \save_init_bram_addr_ld[6]_i_1__0 
       (.I0(save_init_bram_addr_ld[6]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[6]_i_3_n_0 ),
        .I2(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I3(\GEN_AR_PIPE_DUAL.GEN_ARADDR[6].axi_araddr_pipe_reg ),
        .I4(axi_araddr_full),
        .I5(s_axi_araddr[3]),
        .O(bram_addr_ld[6]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[7]_i_1__0 
       (.I0(save_init_bram_addr_ld[7]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I2(\GEN_AR_PIPE_DUAL.GEN_ARADDR[7].axi_araddr_pipe_reg ),
        .I3(axi_araddr_full),
        .I4(s_axi_araddr[4]),
        .O(bram_addr_ld[7]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[8]_i_1__0 
       (.I0(save_init_bram_addr_ld[8]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I2(\GEN_AR_PIPE_DUAL.GEN_ARADDR[8].axi_araddr_pipe_reg ),
        .I3(axi_araddr_full),
        .I4(s_axi_araddr[5]),
        .O(bram_addr_ld[8]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \save_init_bram_addr_ld[9]_i_1__0 
       (.I0(save_init_bram_addr_ld[9]),
        .I1(\GEN_DUAL_ADDR_CNT.bram_addr_int[15]_i_3__0_n_0 ),
        .I2(\GEN_AR_PIPE_DUAL.GEN_ARADDR[9].axi_araddr_pipe_reg ),
        .I3(axi_araddr_full),
        .I4(s_axi_araddr[6]),
        .O(bram_addr_ld[9]));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[10] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[10]),
        .Q(save_init_bram_addr_ld[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[11] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[11]),
        .Q(save_init_bram_addr_ld[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[12] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(D[9]),
        .Q(save_init_bram_addr_ld[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[13] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(D[10]),
        .Q(save_init_bram_addr_ld[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[14] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(D[11]),
        .Q(save_init_bram_addr_ld[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[15] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(D[12]),
        .Q(save_init_bram_addr_ld[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[4] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[4]),
        .Q(save_init_bram_addr_ld[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[5] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[5]),
        .Q(save_init_bram_addr_ld[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[6] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[6]),
        .Q(save_init_bram_addr_ld[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[7] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[7]),
        .Q(save_init_bram_addr_ld[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[8] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[8]),
        .Q(save_init_bram_addr_ld[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[9] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(bram_addr_ld[9]),
        .Q(save_init_bram_addr_ld[9]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h02A2)) 
    \wrap_burst_total[0]_i_1__0 
       (.I0(\wrap_burst_total[0]_i_2__0_n_0 ),
        .I1(s_axi_arsize[1]),
        .I2(axi_araddr_full),
        .I3(\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] [1]),
        .O(wrap_burst_total_cmb[0]));
  LUT6 #(
    .INIT(64'h8008008480000080)) 
    \wrap_burst_total[0]_i_2__0 
       (.I0(\wrap_burst_total_reg[0]_0 ),
        .I1(axi_rd_burst_two_reg),
        .I2(\wrap_burst_total_reg[1]_0 ),
        .I3(\wrap_burst_total_reg[1]_1 ),
        .I4(\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ),
        .I5(\wrap_burst_total_reg[1]_2 ),
        .O(\wrap_burst_total[0]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[0]_i_3 
       (.I0(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] [1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[1]),
        .O(\wrap_burst_total_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h4000400010004040)) 
    \wrap_burst_total[1]_i_1__0 
       (.I0(\wrap_burst_total_reg[1]_3 ),
        .I1(\wrap_burst_total_reg[1]_2 ),
        .I2(\wrap_burst_total[1]_i_3_n_0 ),
        .I3(\wrap_burst_total_reg[1]_0 ),
        .I4(\wrap_burst_total_reg[1]_1 ),
        .I5(\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ),
        .O(wrap_burst_total_cmb[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_2__0 
       (.I0(\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] [0]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[0]),
        .O(\wrap_burst_total_reg[1]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hCCA000A0)) 
    \wrap_burst_total[1]_i_3 
       (.I0(s_axi_arlen[1]),
        .I1(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] [1]),
        .I2(s_axi_arlen[0]),
        .I3(axi_araddr_full),
        .I4(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] [0]),
        .O(\wrap_burst_total[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_4__0 
       (.I0(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] [2]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[2]),
        .O(\wrap_burst_total_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[1]_i_5 
       (.I0(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] [3]),
        .I1(axi_araddr_full),
        .I2(s_axi_arlen[3]),
        .O(\wrap_burst_total_reg[1]_1 ));
  LUT6 #(
    .INIT(64'h0000000000005404)) 
    \wrap_burst_total[2]_i_1__0 
       (.I0(\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[0] ),
        .I1(s_axi_arsize[0]),
        .I2(axi_araddr_full),
        .I3(\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] [0]),
        .I4(\wrap_burst_total_reg[1]_3 ),
        .I5(\wrap_burst_total[2]_i_4_n_0 ),
        .O(wrap_burst_total_cmb[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \wrap_burst_total[2]_i_3 
       (.I0(\GEN_AR_PIPE_DUAL.axi_arsize_pipe_reg[2] [1]),
        .I1(axi_araddr_full),
        .I2(s_axi_arsize[1]),
        .O(\wrap_burst_total_reg[1]_3 ));
  LUT6 #(
    .INIT(64'h3FFF5F5F3FFFFFFF)) 
    \wrap_burst_total[2]_i_4 
       (.I0(s_axi_arlen[3]),
        .I1(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] [3]),
        .I2(\wrap_burst_total[1]_i_3_n_0 ),
        .I3(\GEN_AR_PIPE_DUAL.axi_arlen_pipe_reg[3] [2]),
        .I4(axi_araddr_full),
        .I5(s_axi_arlen[2]),
        .O(\wrap_burst_total[2]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[0] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(wrap_burst_total_cmb[0]),
        .Q(wrap_burst_total[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[1] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(wrap_burst_total_cmb[1]),
        .Q(wrap_burst_total[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[2] 
       (.C(s_axi_aclk),
        .CE(bram_addr_ld_en),
        .D(wrap_burst_total_cmb[2]),
        .Q(wrap_burst_total[2]),
        .R(SR));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
