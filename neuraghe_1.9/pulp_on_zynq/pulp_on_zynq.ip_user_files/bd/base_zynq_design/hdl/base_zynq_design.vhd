--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
--Date        : Thu Jul  5 12:05:56 2018
--Host        : eolab running 64-bit SUSE Linux Enterprise Server 12
--Command     : generate_target base_zynq_design.bd
--Design      : base_zynq_design
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_1R5MXF4 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC;
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC;
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_1R5MXF4;

architecture STRUCTURE of m00_couplers_imp_1R5MXF4 is
  component base_zynq_design_auto_ds_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component base_zynq_design_auto_ds_0;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_ds_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_ds_to_m00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_ds_to_m00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_m00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_ds_to_m00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_ds_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_ds_to_m00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_m00_couplers_ARREADY : STD_LOGIC;
  signal auto_ds_to_m00_couplers_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_m00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_ds_to_m00_couplers_ARVALID : STD_LOGIC;
  signal auto_ds_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_ds_to_m00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_ds_to_m00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_m00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_ds_to_m00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_ds_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_ds_to_m00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_m00_couplers_AWREADY : STD_LOGIC;
  signal auto_ds_to_m00_couplers_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_m00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_ds_to_m00_couplers_AWVALID : STD_LOGIC;
  signal auto_ds_to_m00_couplers_BREADY : STD_LOGIC;
  signal auto_ds_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_ds_to_m00_couplers_BVALID : STD_LOGIC;
  signal auto_ds_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_ds_to_m00_couplers_RLAST : STD_LOGIC;
  signal auto_ds_to_m00_couplers_RREADY : STD_LOGIC;
  signal auto_ds_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_ds_to_m00_couplers_RVALID : STD_LOGIC;
  signal auto_ds_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_ds_to_m00_couplers_WLAST : STD_LOGIC;
  signal auto_ds_to_m00_couplers_WREADY : STD_LOGIC;
  signal auto_ds_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ds_to_m00_couplers_WVALID : STD_LOGIC;
  signal m00_couplers_to_auto_ds_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_ds_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_ds_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_ds_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_auto_ds_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_ds_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_ds_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_ds_ARREADY : STD_LOGIC;
  signal m00_couplers_to_auto_ds_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_ds_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_ds_ARVALID : STD_LOGIC;
  signal m00_couplers_to_auto_ds_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_ds_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_ds_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_ds_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_auto_ds_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_ds_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_ds_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_ds_AWREADY : STD_LOGIC;
  signal m00_couplers_to_auto_ds_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_ds_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_ds_AWVALID : STD_LOGIC;
  signal m00_couplers_to_auto_ds_BREADY : STD_LOGIC;
  signal m00_couplers_to_auto_ds_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_ds_BVALID : STD_LOGIC;
  signal m00_couplers_to_auto_ds_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m00_couplers_to_auto_ds_RLAST : STD_LOGIC;
  signal m00_couplers_to_auto_ds_RREADY : STD_LOGIC;
  signal m00_couplers_to_auto_ds_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_ds_RVALID : STD_LOGIC;
  signal m00_couplers_to_auto_ds_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m00_couplers_to_auto_ds_WLAST : STD_LOGIC;
  signal m00_couplers_to_auto_ds_WREADY : STD_LOGIC;
  signal m00_couplers_to_auto_ds_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_auto_ds_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= auto_ds_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= auto_ds_to_m00_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= auto_ds_to_m00_couplers_ARCACHE(3 downto 0);
  M_AXI_arlen(7 downto 0) <= auto_ds_to_m00_couplers_ARLEN(7 downto 0);
  M_AXI_arlock <= auto_ds_to_m00_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= auto_ds_to_m00_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= auto_ds_to_m00_couplers_ARQOS(3 downto 0);
  M_AXI_arregion(3 downto 0) <= auto_ds_to_m00_couplers_ARREGION(3 downto 0);
  M_AXI_arsize(2 downto 0) <= auto_ds_to_m00_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= auto_ds_to_m00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_ds_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= auto_ds_to_m00_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= auto_ds_to_m00_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(7 downto 0) <= auto_ds_to_m00_couplers_AWLEN(7 downto 0);
  M_AXI_awlock <= auto_ds_to_m00_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= auto_ds_to_m00_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= auto_ds_to_m00_couplers_AWQOS(3 downto 0);
  M_AXI_awregion(3 downto 0) <= auto_ds_to_m00_couplers_AWREGION(3 downto 0);
  M_AXI_awsize(2 downto 0) <= auto_ds_to_m00_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= auto_ds_to_m00_couplers_AWVALID;
  M_AXI_bready <= auto_ds_to_m00_couplers_BREADY;
  M_AXI_rready <= auto_ds_to_m00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_ds_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wlast <= auto_ds_to_m00_couplers_WLAST;
  M_AXI_wstrb(3 downto 0) <= auto_ds_to_m00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_ds_to_m00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m00_couplers_to_auto_ds_ARREADY;
  S_AXI_awready <= m00_couplers_to_auto_ds_AWREADY;
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_auto_ds_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_auto_ds_BVALID;
  S_AXI_rdata(63 downto 0) <= m00_couplers_to_auto_ds_RDATA(63 downto 0);
  S_AXI_rlast <= m00_couplers_to_auto_ds_RLAST;
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_auto_ds_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_auto_ds_RVALID;
  S_AXI_wready <= m00_couplers_to_auto_ds_WREADY;
  auto_ds_to_m00_couplers_ARREADY <= M_AXI_arready;
  auto_ds_to_m00_couplers_AWREADY <= M_AXI_awready;
  auto_ds_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_ds_to_m00_couplers_BVALID <= M_AXI_bvalid;
  auto_ds_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_ds_to_m00_couplers_RLAST <= M_AXI_rlast;
  auto_ds_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_ds_to_m00_couplers_RVALID <= M_AXI_rvalid;
  auto_ds_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_auto_ds_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_auto_ds_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m00_couplers_to_auto_ds_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m00_couplers_to_auto_ds_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m00_couplers_to_auto_ds_ARLOCK(0) <= S_AXI_arlock(0);
  m00_couplers_to_auto_ds_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m00_couplers_to_auto_ds_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m00_couplers_to_auto_ds_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m00_couplers_to_auto_ds_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m00_couplers_to_auto_ds_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_auto_ds_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_auto_ds_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m00_couplers_to_auto_ds_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m00_couplers_to_auto_ds_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m00_couplers_to_auto_ds_AWLOCK(0) <= S_AXI_awlock(0);
  m00_couplers_to_auto_ds_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m00_couplers_to_auto_ds_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m00_couplers_to_auto_ds_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m00_couplers_to_auto_ds_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m00_couplers_to_auto_ds_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_auto_ds_BREADY <= S_AXI_bready;
  m00_couplers_to_auto_ds_RREADY <= S_AXI_rready;
  m00_couplers_to_auto_ds_WDATA(63 downto 0) <= S_AXI_wdata(63 downto 0);
  m00_couplers_to_auto_ds_WLAST <= S_AXI_wlast;
  m00_couplers_to_auto_ds_WSTRB(7 downto 0) <= S_AXI_wstrb(7 downto 0);
  m00_couplers_to_auto_ds_WVALID <= S_AXI_wvalid;
auto_ds: component base_zynq_design_auto_ds_0
     port map (
      m_axi_araddr(31 downto 0) => auto_ds_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => auto_ds_to_m00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_ds_to_m00_couplers_ARCACHE(3 downto 0),
      m_axi_arlen(7 downto 0) => auto_ds_to_m00_couplers_ARLEN(7 downto 0),
      m_axi_arlock(0) => auto_ds_to_m00_couplers_ARLOCK(0),
      m_axi_arprot(2 downto 0) => auto_ds_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_ds_to_m00_couplers_ARQOS(3 downto 0),
      m_axi_arready => auto_ds_to_m00_couplers_ARREADY,
      m_axi_arregion(3 downto 0) => auto_ds_to_m00_couplers_ARREGION(3 downto 0),
      m_axi_arsize(2 downto 0) => auto_ds_to_m00_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid => auto_ds_to_m00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_ds_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => auto_ds_to_m00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_ds_to_m00_couplers_AWCACHE(3 downto 0),
      m_axi_awlen(7 downto 0) => auto_ds_to_m00_couplers_AWLEN(7 downto 0),
      m_axi_awlock(0) => auto_ds_to_m00_couplers_AWLOCK(0),
      m_axi_awprot(2 downto 0) => auto_ds_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_ds_to_m00_couplers_AWQOS(3 downto 0),
      m_axi_awready => auto_ds_to_m00_couplers_AWREADY,
      m_axi_awregion(3 downto 0) => auto_ds_to_m00_couplers_AWREGION(3 downto 0),
      m_axi_awsize(2 downto 0) => auto_ds_to_m00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_ds_to_m00_couplers_AWVALID,
      m_axi_bready => auto_ds_to_m00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_ds_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_ds_to_m00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_ds_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rlast => auto_ds_to_m00_couplers_RLAST,
      m_axi_rready => auto_ds_to_m00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_ds_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_ds_to_m00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_ds_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wlast => auto_ds_to_m00_couplers_WLAST,
      m_axi_wready => auto_ds_to_m00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_ds_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_ds_to_m00_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => m00_couplers_to_auto_ds_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => m00_couplers_to_auto_ds_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m00_couplers_to_auto_ds_ARCACHE(3 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arlen(7 downto 0) => m00_couplers_to_auto_ds_ARLEN(7 downto 0),
      s_axi_arlock(0) => m00_couplers_to_auto_ds_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m00_couplers_to_auto_ds_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m00_couplers_to_auto_ds_ARQOS(3 downto 0),
      s_axi_arready => m00_couplers_to_auto_ds_ARREADY,
      s_axi_arregion(3 downto 0) => m00_couplers_to_auto_ds_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m00_couplers_to_auto_ds_ARSIZE(2 downto 0),
      s_axi_arvalid => m00_couplers_to_auto_ds_ARVALID,
      s_axi_awaddr(31 downto 0) => m00_couplers_to_auto_ds_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => m00_couplers_to_auto_ds_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m00_couplers_to_auto_ds_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => m00_couplers_to_auto_ds_AWLEN(7 downto 0),
      s_axi_awlock(0) => m00_couplers_to_auto_ds_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m00_couplers_to_auto_ds_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m00_couplers_to_auto_ds_AWQOS(3 downto 0),
      s_axi_awready => m00_couplers_to_auto_ds_AWREADY,
      s_axi_awregion(3 downto 0) => m00_couplers_to_auto_ds_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m00_couplers_to_auto_ds_AWSIZE(2 downto 0),
      s_axi_awvalid => m00_couplers_to_auto_ds_AWVALID,
      s_axi_bready => m00_couplers_to_auto_ds_BREADY,
      s_axi_bresp(1 downto 0) => m00_couplers_to_auto_ds_BRESP(1 downto 0),
      s_axi_bvalid => m00_couplers_to_auto_ds_BVALID,
      s_axi_rdata(63 downto 0) => m00_couplers_to_auto_ds_RDATA(63 downto 0),
      s_axi_rlast => m00_couplers_to_auto_ds_RLAST,
      s_axi_rready => m00_couplers_to_auto_ds_RREADY,
      s_axi_rresp(1 downto 0) => m00_couplers_to_auto_ds_RRESP(1 downto 0),
      s_axi_rvalid => m00_couplers_to_auto_ds_RVALID,
      s_axi_wdata(63 downto 0) => m00_couplers_to_auto_ds_WDATA(63 downto 0),
      s_axi_wlast => m00_couplers_to_auto_ds_WLAST,
      s_axi_wready => m00_couplers_to_auto_ds_WREADY,
      s_axi_wstrb(7 downto 0) => m00_couplers_to_auto_ds_WSTRB(7 downto 0),
      s_axi_wvalid => m00_couplers_to_auto_ds_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_19312F is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC;
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC;
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC;
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC;
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m01_couplers_imp_19312F;

architecture STRUCTURE of m01_couplers_imp_19312F is
  signal m01_couplers_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_m01_couplers_ARLOCK : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_ARREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_ARVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_m01_couplers_AWLOCK : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_AWREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_AWVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_BVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m01_couplers_to_m01_couplers_RLAST : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_RVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m01_couplers_to_m01_couplers_WLAST : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_m01_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m01_couplers_to_m01_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= m01_couplers_to_m01_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= m01_couplers_to_m01_couplers_ARCACHE(3 downto 0);
  M_AXI_arlen(7 downto 0) <= m01_couplers_to_m01_couplers_ARLEN(7 downto 0);
  M_AXI_arlock <= m01_couplers_to_m01_couplers_ARLOCK;
  M_AXI_arprot(2 downto 0) <= m01_couplers_to_m01_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= m01_couplers_to_m01_couplers_ARQOS(3 downto 0);
  M_AXI_arregion(3 downto 0) <= m01_couplers_to_m01_couplers_ARREGION(3 downto 0);
  M_AXI_arsize(2 downto 0) <= m01_couplers_to_m01_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= m01_couplers_to_m01_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m01_couplers_to_m01_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= m01_couplers_to_m01_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= m01_couplers_to_m01_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(7 downto 0) <= m01_couplers_to_m01_couplers_AWLEN(7 downto 0);
  M_AXI_awlock <= m01_couplers_to_m01_couplers_AWLOCK;
  M_AXI_awprot(2 downto 0) <= m01_couplers_to_m01_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= m01_couplers_to_m01_couplers_AWQOS(3 downto 0);
  M_AXI_awregion(3 downto 0) <= m01_couplers_to_m01_couplers_AWREGION(3 downto 0);
  M_AXI_awsize(2 downto 0) <= m01_couplers_to_m01_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= m01_couplers_to_m01_couplers_AWVALID;
  M_AXI_bready <= m01_couplers_to_m01_couplers_BREADY;
  M_AXI_rready <= m01_couplers_to_m01_couplers_RREADY;
  M_AXI_wdata(63 downto 0) <= m01_couplers_to_m01_couplers_WDATA(63 downto 0);
  M_AXI_wlast <= m01_couplers_to_m01_couplers_WLAST;
  M_AXI_wstrb(7 downto 0) <= m01_couplers_to_m01_couplers_WSTRB(7 downto 0);
  M_AXI_wvalid <= m01_couplers_to_m01_couplers_WVALID;
  S_AXI_arready <= m01_couplers_to_m01_couplers_ARREADY;
  S_AXI_awready <= m01_couplers_to_m01_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_m01_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m01_couplers_to_m01_couplers_BVALID;
  S_AXI_rdata(63 downto 0) <= m01_couplers_to_m01_couplers_RDATA(63 downto 0);
  S_AXI_rlast <= m01_couplers_to_m01_couplers_RLAST;
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_m01_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m01_couplers_to_m01_couplers_RVALID;
  S_AXI_wready <= m01_couplers_to_m01_couplers_WREADY;
  m01_couplers_to_m01_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m01_couplers_to_m01_couplers_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m01_couplers_to_m01_couplers_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m01_couplers_to_m01_couplers_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m01_couplers_to_m01_couplers_ARLOCK <= S_AXI_arlock;
  m01_couplers_to_m01_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m01_couplers_to_m01_couplers_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m01_couplers_to_m01_couplers_ARREADY <= M_AXI_arready;
  m01_couplers_to_m01_couplers_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m01_couplers_to_m01_couplers_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m01_couplers_to_m01_couplers_ARVALID <= S_AXI_arvalid;
  m01_couplers_to_m01_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m01_couplers_to_m01_couplers_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m01_couplers_to_m01_couplers_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m01_couplers_to_m01_couplers_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m01_couplers_to_m01_couplers_AWLOCK <= S_AXI_awlock;
  m01_couplers_to_m01_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m01_couplers_to_m01_couplers_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m01_couplers_to_m01_couplers_AWREADY <= M_AXI_awready;
  m01_couplers_to_m01_couplers_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m01_couplers_to_m01_couplers_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m01_couplers_to_m01_couplers_AWVALID <= S_AXI_awvalid;
  m01_couplers_to_m01_couplers_BREADY <= S_AXI_bready;
  m01_couplers_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m01_couplers_to_m01_couplers_BVALID <= M_AXI_bvalid;
  m01_couplers_to_m01_couplers_RDATA(63 downto 0) <= M_AXI_rdata(63 downto 0);
  m01_couplers_to_m01_couplers_RLAST <= M_AXI_rlast;
  m01_couplers_to_m01_couplers_RREADY <= S_AXI_rready;
  m01_couplers_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m01_couplers_to_m01_couplers_RVALID <= M_AXI_rvalid;
  m01_couplers_to_m01_couplers_WDATA(63 downto 0) <= S_AXI_wdata(63 downto 0);
  m01_couplers_to_m01_couplers_WLAST <= S_AXI_wlast;
  m01_couplers_to_m01_couplers_WREADY <= M_AXI_wready;
  m01_couplers_to_m01_couplers_WSTRB(7 downto 0) <= S_AXI_wstrb(7 downto 0);
  m01_couplers_to_m01_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_1UTISAU is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_1UTISAU;

architecture STRUCTURE of s00_couplers_imp_1UTISAU is
  component base_zynq_design_auto_pc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component base_zynq_design_auto_pc_0;
  component base_zynq_design_auto_us_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component base_zynq_design_auto_us_0;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_auto_us_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_auto_us_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_auto_us_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_auto_us_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal auto_pc_to_auto_us_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_pc_to_auto_us_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_auto_us_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_auto_us_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_auto_us_ARREADY : STD_LOGIC;
  signal auto_pc_to_auto_us_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_auto_us_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_auto_us_ARVALID : STD_LOGIC;
  signal auto_pc_to_auto_us_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_auto_us_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_auto_us_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_auto_us_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal auto_pc_to_auto_us_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_pc_to_auto_us_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_auto_us_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_auto_us_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_auto_us_AWREADY : STD_LOGIC;
  signal auto_pc_to_auto_us_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_auto_us_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_auto_us_AWVALID : STD_LOGIC;
  signal auto_pc_to_auto_us_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal auto_pc_to_auto_us_BREADY : STD_LOGIC;
  signal auto_pc_to_auto_us_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_auto_us_BVALID : STD_LOGIC;
  signal auto_pc_to_auto_us_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_auto_us_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal auto_pc_to_auto_us_RLAST : STD_LOGIC;
  signal auto_pc_to_auto_us_RREADY : STD_LOGIC;
  signal auto_pc_to_auto_us_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_auto_us_RVALID : STD_LOGIC;
  signal auto_pc_to_auto_us_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_auto_us_WLAST : STD_LOGIC;
  signal auto_pc_to_auto_us_WREADY : STD_LOGIC;
  signal auto_pc_to_auto_us_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_auto_us_WVALID : STD_LOGIC;
  signal auto_us_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_us_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_us_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s00_couplers_ARREADY : STD_LOGIC;
  signal auto_us_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s00_couplers_ARVALID : STD_LOGIC;
  signal auto_us_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_us_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_us_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s00_couplers_AWREADY : STD_LOGIC;
  signal auto_us_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s00_couplers_AWVALID : STD_LOGIC;
  signal auto_us_to_s00_couplers_BREADY : STD_LOGIC;
  signal auto_us_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s00_couplers_BVALID : STD_LOGIC;
  signal auto_us_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal auto_us_to_s00_couplers_RLAST : STD_LOGIC;
  signal auto_us_to_s00_couplers_RREADY : STD_LOGIC;
  signal auto_us_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s00_couplers_RVALID : STD_LOGIC;
  signal auto_us_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal auto_us_to_s00_couplers_WLAST : STD_LOGIC;
  signal auto_us_to_s00_couplers_WREADY : STD_LOGIC;
  signal auto_us_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_us_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_WVALID : STD_LOGIC;
  signal NLW_auto_us_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_auto_us_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_us_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= auto_us_to_s00_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= auto_us_to_s00_couplers_ARCACHE(3 downto 0);
  M_AXI_arlen(7 downto 0) <= auto_us_to_s00_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= auto_us_to_s00_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= auto_us_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= auto_us_to_s00_couplers_ARQOS(3 downto 0);
  M_AXI_arsize(2 downto 0) <= auto_us_to_s00_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= auto_us_to_s00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_us_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= auto_us_to_s00_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= auto_us_to_s00_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(7 downto 0) <= auto_us_to_s00_couplers_AWLEN(7 downto 0);
  M_AXI_awlock(0) <= auto_us_to_s00_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= auto_us_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= auto_us_to_s00_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= auto_us_to_s00_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= auto_us_to_s00_couplers_AWVALID;
  M_AXI_bready <= auto_us_to_s00_couplers_BREADY;
  M_AXI_rready <= auto_us_to_s00_couplers_RREADY;
  M_AXI_wdata(63 downto 0) <= auto_us_to_s00_couplers_WDATA(63 downto 0);
  M_AXI_wlast <= auto_us_to_s00_couplers_WLAST;
  M_AXI_wstrb(7 downto 0) <= auto_us_to_s00_couplers_WSTRB(7 downto 0);
  M_AXI_wvalid <= auto_us_to_s00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= s00_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= s00_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(11 downto 0) <= s00_couplers_to_auto_pc_BID(11 downto 0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= s00_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rid(11 downto 0) <= s00_couplers_to_auto_pc_RID(11 downto 0);
  S_AXI_rlast <= s00_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= s00_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= s00_couplers_to_auto_pc_WREADY;
  auto_us_to_s00_couplers_ARREADY <= M_AXI_arready;
  auto_us_to_s00_couplers_AWREADY <= M_AXI_awready;
  auto_us_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_us_to_s00_couplers_BVALID <= M_AXI_bvalid;
  auto_us_to_s00_couplers_RDATA(63 downto 0) <= M_AXI_rdata(63 downto 0);
  auto_us_to_s00_couplers_RLAST <= M_AXI_rlast;
  auto_us_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_us_to_s00_couplers_RVALID <= M_AXI_rvalid;
  auto_us_to_s00_couplers_WREADY <= M_AXI_wready;
  s00_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s00_couplers_to_auto_pc_ARID(11 downto 0) <= S_AXI_arid(11 downto 0);
  s00_couplers_to_auto_pc_ARLEN(3 downto 0) <= S_AXI_arlen(3 downto 0);
  s00_couplers_to_auto_pc_ARLOCK(1 downto 0) <= S_AXI_arlock(1 downto 0);
  s00_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  s00_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  s00_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_auto_pc_AWID(11 downto 0) <= S_AXI_awid(11 downto 0);
  s00_couplers_to_auto_pc_AWLEN(3 downto 0) <= S_AXI_awlen(3 downto 0);
  s00_couplers_to_auto_pc_AWLOCK(1 downto 0) <= S_AXI_awlock(1 downto 0);
  s00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  s00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  s00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  s00_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  s00_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_auto_pc_WID(11 downto 0) <= S_AXI_wid(11 downto 0);
  s00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  s00_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component base_zynq_design_auto_pc_0
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_auto_us_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => auto_pc_to_auto_us_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_pc_to_auto_us_ARCACHE(3 downto 0),
      m_axi_arid(11 downto 0) => auto_pc_to_auto_us_ARID(11 downto 0),
      m_axi_arlen(7 downto 0) => auto_pc_to_auto_us_ARLEN(7 downto 0),
      m_axi_arlock(0) => auto_pc_to_auto_us_ARLOCK(0),
      m_axi_arprot(2 downto 0) => auto_pc_to_auto_us_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_pc_to_auto_us_ARQOS(3 downto 0),
      m_axi_arready => auto_pc_to_auto_us_ARREADY,
      m_axi_arregion(3 downto 0) => auto_pc_to_auto_us_ARREGION(3 downto 0),
      m_axi_arsize(2 downto 0) => auto_pc_to_auto_us_ARSIZE(2 downto 0),
      m_axi_arvalid => auto_pc_to_auto_us_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_auto_us_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => auto_pc_to_auto_us_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_pc_to_auto_us_AWCACHE(3 downto 0),
      m_axi_awid(11 downto 0) => auto_pc_to_auto_us_AWID(11 downto 0),
      m_axi_awlen(7 downto 0) => auto_pc_to_auto_us_AWLEN(7 downto 0),
      m_axi_awlock(0) => auto_pc_to_auto_us_AWLOCK(0),
      m_axi_awprot(2 downto 0) => auto_pc_to_auto_us_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_pc_to_auto_us_AWQOS(3 downto 0),
      m_axi_awready => auto_pc_to_auto_us_AWREADY,
      m_axi_awregion(3 downto 0) => auto_pc_to_auto_us_AWREGION(3 downto 0),
      m_axi_awsize(2 downto 0) => auto_pc_to_auto_us_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_pc_to_auto_us_AWVALID,
      m_axi_bid(11 downto 0) => auto_pc_to_auto_us_BID(11 downto 0),
      m_axi_bready => auto_pc_to_auto_us_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_auto_us_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_auto_us_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_auto_us_RDATA(31 downto 0),
      m_axi_rid(11 downto 0) => auto_pc_to_auto_us_RID(11 downto 0),
      m_axi_rlast => auto_pc_to_auto_us_RLAST,
      m_axi_rready => auto_pc_to_auto_us_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_auto_us_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_auto_us_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_auto_us_WDATA(31 downto 0),
      m_axi_wlast => auto_pc_to_auto_us_WLAST,
      m_axi_wready => auto_pc_to_auto_us_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_auto_us_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_auto_us_WVALID,
      s_axi_araddr(31 downto 0) => s00_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(11 downto 0) => s00_couplers_to_auto_pc_ARID(11 downto 0),
      s_axi_arlen(3 downto 0) => s00_couplers_to_auto_pc_ARLEN(3 downto 0),
      s_axi_arlock(1 downto 0) => s00_couplers_to_auto_pc_ARLOCK(1 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => s00_couplers_to_auto_pc_ARREADY,
      s_axi_arsize(2 downto 0) => s00_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => s00_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(11 downto 0) => s00_couplers_to_auto_pc_AWID(11 downto 0),
      s_axi_awlen(3 downto 0) => s00_couplers_to_auto_pc_AWLEN(3 downto 0),
      s_axi_awlock(1 downto 0) => s00_couplers_to_auto_pc_AWLOCK(1 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => s00_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => s00_couplers_to_auto_pc_AWREADY,
      s_axi_awsize(2 downto 0) => s00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => s00_couplers_to_auto_pc_AWVALID,
      s_axi_bid(11 downto 0) => s00_couplers_to_auto_pc_BID(11 downto 0),
      s_axi_bready => s00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => s00_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => s00_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rid(11 downto 0) => s00_couplers_to_auto_pc_RID(11 downto 0),
      s_axi_rlast => s00_couplers_to_auto_pc_RLAST,
      s_axi_rready => s00_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => s00_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => s00_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wid(11 downto 0) => s00_couplers_to_auto_pc_WID(11 downto 0),
      s_axi_wlast => s00_couplers_to_auto_pc_WLAST,
      s_axi_wready => s00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => s00_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => s00_couplers_to_auto_pc_WVALID
    );
auto_us: component base_zynq_design_auto_us_0
     port map (
      m_axi_araddr(31 downto 0) => auto_us_to_s00_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => auto_us_to_s00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_us_to_s00_couplers_ARCACHE(3 downto 0),
      m_axi_arlen(7 downto 0) => auto_us_to_s00_couplers_ARLEN(7 downto 0),
      m_axi_arlock(0) => auto_us_to_s00_couplers_ARLOCK(0),
      m_axi_arprot(2 downto 0) => auto_us_to_s00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_us_to_s00_couplers_ARQOS(3 downto 0),
      m_axi_arready => auto_us_to_s00_couplers_ARREADY,
      m_axi_arregion(3 downto 0) => NLW_auto_us_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => auto_us_to_s00_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid => auto_us_to_s00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_us_to_s00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => auto_us_to_s00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_us_to_s00_couplers_AWCACHE(3 downto 0),
      m_axi_awlen(7 downto 0) => auto_us_to_s00_couplers_AWLEN(7 downto 0),
      m_axi_awlock(0) => auto_us_to_s00_couplers_AWLOCK(0),
      m_axi_awprot(2 downto 0) => auto_us_to_s00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_us_to_s00_couplers_AWQOS(3 downto 0),
      m_axi_awready => auto_us_to_s00_couplers_AWREADY,
      m_axi_awregion(3 downto 0) => NLW_auto_us_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => auto_us_to_s00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_us_to_s00_couplers_AWVALID,
      m_axi_bready => auto_us_to_s00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_us_to_s00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_us_to_s00_couplers_BVALID,
      m_axi_rdata(63 downto 0) => auto_us_to_s00_couplers_RDATA(63 downto 0),
      m_axi_rlast => auto_us_to_s00_couplers_RLAST,
      m_axi_rready => auto_us_to_s00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_us_to_s00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_us_to_s00_couplers_RVALID,
      m_axi_wdata(63 downto 0) => auto_us_to_s00_couplers_WDATA(63 downto 0),
      m_axi_wlast => auto_us_to_s00_couplers_WLAST,
      m_axi_wready => auto_us_to_s00_couplers_WREADY,
      m_axi_wstrb(7 downto 0) => auto_us_to_s00_couplers_WSTRB(7 downto 0),
      m_axi_wvalid => auto_us_to_s00_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(31 downto 0) => auto_pc_to_auto_us_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => auto_pc_to_auto_us_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => auto_pc_to_auto_us_ARCACHE(3 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arid(11 downto 0) => auto_pc_to_auto_us_ARID(11 downto 0),
      s_axi_arlen(7 downto 0) => auto_pc_to_auto_us_ARLEN(7 downto 0),
      s_axi_arlock(0) => auto_pc_to_auto_us_ARLOCK(0),
      s_axi_arprot(2 downto 0) => auto_pc_to_auto_us_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => auto_pc_to_auto_us_ARQOS(3 downto 0),
      s_axi_arready => auto_pc_to_auto_us_ARREADY,
      s_axi_arregion(3 downto 0) => auto_pc_to_auto_us_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => auto_pc_to_auto_us_ARSIZE(2 downto 0),
      s_axi_arvalid => auto_pc_to_auto_us_ARVALID,
      s_axi_awaddr(31 downto 0) => auto_pc_to_auto_us_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => auto_pc_to_auto_us_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => auto_pc_to_auto_us_AWCACHE(3 downto 0),
      s_axi_awid(11 downto 0) => auto_pc_to_auto_us_AWID(11 downto 0),
      s_axi_awlen(7 downto 0) => auto_pc_to_auto_us_AWLEN(7 downto 0),
      s_axi_awlock(0) => auto_pc_to_auto_us_AWLOCK(0),
      s_axi_awprot(2 downto 0) => auto_pc_to_auto_us_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => auto_pc_to_auto_us_AWQOS(3 downto 0),
      s_axi_awready => auto_pc_to_auto_us_AWREADY,
      s_axi_awregion(3 downto 0) => auto_pc_to_auto_us_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => auto_pc_to_auto_us_AWSIZE(2 downto 0),
      s_axi_awvalid => auto_pc_to_auto_us_AWVALID,
      s_axi_bid(11 downto 0) => auto_pc_to_auto_us_BID(11 downto 0),
      s_axi_bready => auto_pc_to_auto_us_BREADY,
      s_axi_bresp(1 downto 0) => auto_pc_to_auto_us_BRESP(1 downto 0),
      s_axi_bvalid => auto_pc_to_auto_us_BVALID,
      s_axi_rdata(31 downto 0) => auto_pc_to_auto_us_RDATA(31 downto 0),
      s_axi_rid(11 downto 0) => auto_pc_to_auto_us_RID(11 downto 0),
      s_axi_rlast => auto_pc_to_auto_us_RLAST,
      s_axi_rready => auto_pc_to_auto_us_RREADY,
      s_axi_rresp(1 downto 0) => auto_pc_to_auto_us_RRESP(1 downto 0),
      s_axi_rvalid => auto_pc_to_auto_us_RVALID,
      s_axi_wdata(31 downto 0) => auto_pc_to_auto_us_WDATA(31 downto 0),
      s_axi_wlast => auto_pc_to_auto_us_WLAST,
      s_axi_wready => auto_pc_to_auto_us_WREADY,
      s_axi_wstrb(3 downto 0) => auto_pc_to_auto_us_WSTRB(3 downto 0),
      s_axi_wvalid => auto_pc_to_auto_us_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_design_processing_system7_0_axi_periph_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_arlock : out STD_LOGIC;
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_awlock : out STD_LOGIC;
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rlast : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wlast : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M01_AXI_arlock : out STD_LOGIC;
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M01_AXI_awlock : out STD_LOGIC;
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M01_AXI_rlast : in STD_LOGIC;
    M01_AXI_rready : out STD_LOGIC;
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M01_AXI_wlast : out STD_LOGIC;
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC
  );
end base_zynq_design_processing_system7_0_axi_periph_0;

architecture STRUCTURE of base_zynq_design_processing_system7_0_axi_periph_0 is
  component base_zynq_design_xbar_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_wlast : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rlast : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component base_zynq_design_xbar_0;
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC;
  signal M01_ACLK_1 : STD_LOGIC;
  signal M01_ARESETN_1 : STD_LOGIC;
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_ARLOCK : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_ARREADY : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_ARVALID : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_AWLOCK : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_AWREADY : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_AWVALID : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_BREADY : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_BVALID : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_RLAST : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_RREADY : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_RVALID : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_WLAST : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_WREADY : STD_LOGIC;
  signal m00_couplers_to_processing_system7_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_processing_system7_0_axi_periph_WVALID : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_ARLOCK : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_ARREADY : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_ARVALID : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_AWLOCK : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_AWREADY : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_AWVALID : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_BREADY : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_BVALID : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_RLAST : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_RREADY : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_RVALID : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_WLAST : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_WREADY : STD_LOGIC;
  signal m01_couplers_to_processing_system7_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_processing_system7_0_axi_periph_WVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_ACLK_net : STD_LOGIC;
  signal processing_system7_0_axi_periph_ARESETN_net : STD_LOGIC;
  signal processing_system7_0_axi_periph_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_ARREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_ARVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_AWREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_AWVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_to_s00_couplers_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_BREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_BVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_RLAST : STD_LOGIC;
  signal processing_system7_0_axi_periph_to_s00_couplers_RREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_RVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_WLAST : STD_LOGIC;
  signal processing_system7_0_axi_periph_to_s00_couplers_WREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s00_couplers_to_xbar_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s00_couplers_to_xbar_WLAST : STD_LOGIC;
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xbar_to_m00_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xbar_to_m00_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_ARBURST : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal xbar_to_m01_couplers_ARCACHE : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_ARLEN : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal xbar_to_m01_couplers_ARLOCK : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARQOS : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_ARREGION : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_ARSIZE : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_AWBURST : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal xbar_to_m01_couplers_AWCACHE : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_AWLEN : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal xbar_to_m01_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWQOS : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_AWREGION : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_AWSIZE : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xbar_to_m01_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 64 );
  signal xbar_to_m01_couplers_WLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
begin
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1 <= M00_ARESETN;
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_ARADDR(31 downto 0);
  M00_AXI_arburst(1 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_ARBURST(1 downto 0);
  M00_AXI_arcache(3 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_ARCACHE(3 downto 0);
  M00_AXI_arlen(7 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_ARLEN(7 downto 0);
  M00_AXI_arlock <= m00_couplers_to_processing_system7_0_axi_periph_ARLOCK;
  M00_AXI_arprot(2 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_ARPROT(2 downto 0);
  M00_AXI_arqos(3 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_ARQOS(3 downto 0);
  M00_AXI_arregion(3 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_ARREGION(3 downto 0);
  M00_AXI_arsize(2 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_ARSIZE(2 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_processing_system7_0_axi_periph_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_AWADDR(31 downto 0);
  M00_AXI_awburst(1 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_AWBURST(1 downto 0);
  M00_AXI_awcache(3 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_AWCACHE(3 downto 0);
  M00_AXI_awlen(7 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_AWLEN(7 downto 0);
  M00_AXI_awlock <= m00_couplers_to_processing_system7_0_axi_periph_AWLOCK;
  M00_AXI_awprot(2 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_AWPROT(2 downto 0);
  M00_AXI_awqos(3 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_AWQOS(3 downto 0);
  M00_AXI_awregion(3 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_AWREGION(3 downto 0);
  M00_AXI_awsize(2 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_AWSIZE(2 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_processing_system7_0_axi_periph_AWVALID;
  M00_AXI_bready <= m00_couplers_to_processing_system7_0_axi_periph_BREADY;
  M00_AXI_rready <= m00_couplers_to_processing_system7_0_axi_periph_RREADY;
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_WDATA(31 downto 0);
  M00_AXI_wlast <= m00_couplers_to_processing_system7_0_axi_periph_WLAST;
  M00_AXI_wstrb(3 downto 0) <= m00_couplers_to_processing_system7_0_axi_periph_WSTRB(3 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_processing_system7_0_axi_periph_WVALID;
  M01_ACLK_1 <= M01_ACLK;
  M01_ARESETN_1 <= M01_ARESETN;
  M01_AXI_araddr(31 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_ARADDR(31 downto 0);
  M01_AXI_arburst(1 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_ARBURST(1 downto 0);
  M01_AXI_arcache(3 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_ARCACHE(3 downto 0);
  M01_AXI_arlen(7 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_ARLEN(7 downto 0);
  M01_AXI_arlock <= m01_couplers_to_processing_system7_0_axi_periph_ARLOCK;
  M01_AXI_arprot(2 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_ARPROT(2 downto 0);
  M01_AXI_arqos(3 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_ARQOS(3 downto 0);
  M01_AXI_arregion(3 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_ARREGION(3 downto 0);
  M01_AXI_arsize(2 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_ARSIZE(2 downto 0);
  M01_AXI_arvalid <= m01_couplers_to_processing_system7_0_axi_periph_ARVALID;
  M01_AXI_awaddr(31 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_AWADDR(31 downto 0);
  M01_AXI_awburst(1 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_AWBURST(1 downto 0);
  M01_AXI_awcache(3 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_AWCACHE(3 downto 0);
  M01_AXI_awlen(7 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_AWLEN(7 downto 0);
  M01_AXI_awlock <= m01_couplers_to_processing_system7_0_axi_periph_AWLOCK;
  M01_AXI_awprot(2 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_AWPROT(2 downto 0);
  M01_AXI_awqos(3 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_AWQOS(3 downto 0);
  M01_AXI_awregion(3 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_AWREGION(3 downto 0);
  M01_AXI_awsize(2 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_AWSIZE(2 downto 0);
  M01_AXI_awvalid <= m01_couplers_to_processing_system7_0_axi_periph_AWVALID;
  M01_AXI_bready <= m01_couplers_to_processing_system7_0_axi_periph_BREADY;
  M01_AXI_rready <= m01_couplers_to_processing_system7_0_axi_periph_RREADY;
  M01_AXI_wdata(63 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_WDATA(63 downto 0);
  M01_AXI_wlast <= m01_couplers_to_processing_system7_0_axi_periph_WLAST;
  M01_AXI_wstrb(7 downto 0) <= m01_couplers_to_processing_system7_0_axi_periph_WSTRB(7 downto 0);
  M01_AXI_wvalid <= m01_couplers_to_processing_system7_0_axi_periph_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1 <= S00_ARESETN;
  S00_AXI_arready <= processing_system7_0_axi_periph_to_s00_couplers_ARREADY;
  S00_AXI_awready <= processing_system7_0_axi_periph_to_s00_couplers_AWREADY;
  S00_AXI_bid(11 downto 0) <= processing_system7_0_axi_periph_to_s00_couplers_BID(11 downto 0);
  S00_AXI_bresp(1 downto 0) <= processing_system7_0_axi_periph_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= processing_system7_0_axi_periph_to_s00_couplers_BVALID;
  S00_AXI_rdata(31 downto 0) <= processing_system7_0_axi_periph_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rid(11 downto 0) <= processing_system7_0_axi_periph_to_s00_couplers_RID(11 downto 0);
  S00_AXI_rlast <= processing_system7_0_axi_periph_to_s00_couplers_RLAST;
  S00_AXI_rresp(1 downto 0) <= processing_system7_0_axi_periph_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid <= processing_system7_0_axi_periph_to_s00_couplers_RVALID;
  S00_AXI_wready <= processing_system7_0_axi_periph_to_s00_couplers_WREADY;
  m00_couplers_to_processing_system7_0_axi_periph_ARREADY <= M00_AXI_arready;
  m00_couplers_to_processing_system7_0_axi_periph_AWREADY <= M00_AXI_awready;
  m00_couplers_to_processing_system7_0_axi_periph_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_processing_system7_0_axi_periph_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_processing_system7_0_axi_periph_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_processing_system7_0_axi_periph_RLAST <= M00_AXI_rlast;
  m00_couplers_to_processing_system7_0_axi_periph_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_processing_system7_0_axi_periph_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_processing_system7_0_axi_periph_WREADY <= M00_AXI_wready;
  m01_couplers_to_processing_system7_0_axi_periph_ARREADY <= M01_AXI_arready;
  m01_couplers_to_processing_system7_0_axi_periph_AWREADY <= M01_AXI_awready;
  m01_couplers_to_processing_system7_0_axi_periph_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_processing_system7_0_axi_periph_BVALID <= M01_AXI_bvalid;
  m01_couplers_to_processing_system7_0_axi_periph_RDATA(63 downto 0) <= M01_AXI_rdata(63 downto 0);
  m01_couplers_to_processing_system7_0_axi_periph_RLAST <= M01_AXI_rlast;
  m01_couplers_to_processing_system7_0_axi_periph_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_processing_system7_0_axi_periph_RVALID <= M01_AXI_rvalid;
  m01_couplers_to_processing_system7_0_axi_periph_WREADY <= M01_AXI_wready;
  processing_system7_0_axi_periph_ACLK_net <= ACLK;
  processing_system7_0_axi_periph_ARESETN_net <= ARESETN;
  processing_system7_0_axi_periph_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_ARID(11 downto 0) <= S00_AXI_arid(11 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_ARLEN(3 downto 0) <= S00_AXI_arlen(3 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_ARLOCK(1 downto 0) <= S00_AXI_arlock(1 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_ARQOS(3 downto 0) <= S00_AXI_arqos(3 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_ARVALID <= S00_AXI_arvalid;
  processing_system7_0_axi_periph_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_AWID(11 downto 0) <= S00_AXI_awid(11 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_AWLEN(3 downto 0) <= S00_AXI_awlen(3 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_AWLOCK(1 downto 0) <= S00_AXI_awlock(1 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_AWQOS(3 downto 0) <= S00_AXI_awqos(3 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_AWVALID <= S00_AXI_awvalid;
  processing_system7_0_axi_periph_to_s00_couplers_BREADY <= S00_AXI_bready;
  processing_system7_0_axi_periph_to_s00_couplers_RREADY <= S00_AXI_rready;
  processing_system7_0_axi_periph_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_WID(11 downto 0) <= S00_AXI_wid(11 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_WLAST <= S00_AXI_wlast;
  processing_system7_0_axi_periph_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  processing_system7_0_axi_periph_to_s00_couplers_WVALID <= S00_AXI_wvalid;
m00_couplers: entity work.m00_couplers_imp_1R5MXF4
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN => M00_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_ARCACHE(3 downto 0),
      M_AXI_arlen(7 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_ARLEN(7 downto 0),
      M_AXI_arlock => m00_couplers_to_processing_system7_0_axi_periph_ARLOCK,
      M_AXI_arprot(2 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_ARQOS(3 downto 0),
      M_AXI_arready => m00_couplers_to_processing_system7_0_axi_periph_ARREADY,
      M_AXI_arregion(3 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_ARREGION(3 downto 0),
      M_AXI_arsize(2 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_ARSIZE(2 downto 0),
      M_AXI_arvalid => m00_couplers_to_processing_system7_0_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_AWCACHE(3 downto 0),
      M_AXI_awlen(7 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_AWLEN(7 downto 0),
      M_AXI_awlock => m00_couplers_to_processing_system7_0_axi_periph_AWLOCK,
      M_AXI_awprot(2 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_AWQOS(3 downto 0),
      M_AXI_awready => m00_couplers_to_processing_system7_0_axi_periph_AWREADY,
      M_AXI_awregion(3 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_AWREGION(3 downto 0),
      M_AXI_awsize(2 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_AWSIZE(2 downto 0),
      M_AXI_awvalid => m00_couplers_to_processing_system7_0_axi_periph_AWVALID,
      M_AXI_bready => m00_couplers_to_processing_system7_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_processing_system7_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rlast => m00_couplers_to_processing_system7_0_axi_periph_RLAST,
      M_AXI_rready => m00_couplers_to_processing_system7_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_processing_system7_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wlast => m00_couplers_to_processing_system7_0_axi_periph_WLAST,
      M_AXI_wready => m00_couplers_to_processing_system7_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m00_couplers_to_processing_system7_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m00_couplers_to_processing_system7_0_axi_periph_WVALID,
      S_ACLK => processing_system7_0_axi_periph_ACLK_net,
      S_ARESETN => processing_system7_0_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      S_AXI_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m00_couplers_ARREGION(3 downto 0),
      S_AXI_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      S_AXI_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      S_AXI_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      S_AXI_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m00_couplers_AWREGION(3 downto 0),
      S_AXI_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(63 downto 0) => xbar_to_m00_couplers_RDATA(63 downto 0),
      S_AXI_rlast => xbar_to_m00_couplers_RLAST,
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(63 downto 0) => xbar_to_m00_couplers_WDATA(63 downto 0),
      S_AXI_wlast => xbar_to_m00_couplers_WLAST(0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wstrb(7 downto 0) => xbar_to_m00_couplers_WSTRB(7 downto 0),
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_19312F
     port map (
      M_ACLK => M01_ACLK_1,
      M_ARESETN => M01_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_ARCACHE(3 downto 0),
      M_AXI_arlen(7 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_ARLEN(7 downto 0),
      M_AXI_arlock => m01_couplers_to_processing_system7_0_axi_periph_ARLOCK,
      M_AXI_arprot(2 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_ARQOS(3 downto 0),
      M_AXI_arready => m01_couplers_to_processing_system7_0_axi_periph_ARREADY,
      M_AXI_arregion(3 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_ARREGION(3 downto 0),
      M_AXI_arsize(2 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_ARSIZE(2 downto 0),
      M_AXI_arvalid => m01_couplers_to_processing_system7_0_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_AWCACHE(3 downto 0),
      M_AXI_awlen(7 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_AWLEN(7 downto 0),
      M_AXI_awlock => m01_couplers_to_processing_system7_0_axi_periph_AWLOCK,
      M_AXI_awprot(2 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_AWQOS(3 downto 0),
      M_AXI_awready => m01_couplers_to_processing_system7_0_axi_periph_AWREADY,
      M_AXI_awregion(3 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_AWREGION(3 downto 0),
      M_AXI_awsize(2 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_AWSIZE(2 downto 0),
      M_AXI_awvalid => m01_couplers_to_processing_system7_0_axi_periph_AWVALID,
      M_AXI_bready => m01_couplers_to_processing_system7_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m01_couplers_to_processing_system7_0_axi_periph_BVALID,
      M_AXI_rdata(63 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_RDATA(63 downto 0),
      M_AXI_rlast => m01_couplers_to_processing_system7_0_axi_periph_RLAST,
      M_AXI_rready => m01_couplers_to_processing_system7_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m01_couplers_to_processing_system7_0_axi_periph_RVALID,
      M_AXI_wdata(63 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_WDATA(63 downto 0),
      M_AXI_wlast => m01_couplers_to_processing_system7_0_axi_periph_WLAST,
      M_AXI_wready => m01_couplers_to_processing_system7_0_axi_periph_WREADY,
      M_AXI_wstrb(7 downto 0) => m01_couplers_to_processing_system7_0_axi_periph_WSTRB(7 downto 0),
      M_AXI_wvalid => m01_couplers_to_processing_system7_0_axi_periph_WVALID,
      S_ACLK => processing_system7_0_axi_periph_ACLK_net,
      S_ARESETN => processing_system7_0_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      S_AXI_arburst(1 downto 0) => xbar_to_m01_couplers_ARBURST(3 downto 2),
      S_AXI_arcache(3 downto 0) => xbar_to_m01_couplers_ARCACHE(7 downto 4),
      S_AXI_arlen(7 downto 0) => xbar_to_m01_couplers_ARLEN(15 downto 8),
      S_AXI_arlock => xbar_to_m01_couplers_ARLOCK(1),
      S_AXI_arprot(2 downto 0) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      S_AXI_arqos(3 downto 0) => xbar_to_m01_couplers_ARQOS(7 downto 4),
      S_AXI_arready => xbar_to_m01_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m01_couplers_ARREGION(7 downto 4),
      S_AXI_arsize(2 downto 0) => xbar_to_m01_couplers_ARSIZE(5 downto 3),
      S_AXI_arvalid => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(31 downto 0) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      S_AXI_awburst(1 downto 0) => xbar_to_m01_couplers_AWBURST(3 downto 2),
      S_AXI_awcache(3 downto 0) => xbar_to_m01_couplers_AWCACHE(7 downto 4),
      S_AXI_awlen(7 downto 0) => xbar_to_m01_couplers_AWLEN(15 downto 8),
      S_AXI_awlock => xbar_to_m01_couplers_AWLOCK(1),
      S_AXI_awprot(2 downto 0) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      S_AXI_awqos(3 downto 0) => xbar_to_m01_couplers_AWQOS(7 downto 4),
      S_AXI_awready => xbar_to_m01_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m01_couplers_AWREGION(7 downto 4),
      S_AXI_awsize(2 downto 0) => xbar_to_m01_couplers_AWSIZE(5 downto 3),
      S_AXI_awvalid => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bready => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m01_couplers_BVALID,
      S_AXI_rdata(63 downto 0) => xbar_to_m01_couplers_RDATA(63 downto 0),
      S_AXI_rlast => xbar_to_m01_couplers_RLAST,
      S_AXI_rready => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m01_couplers_RVALID,
      S_AXI_wdata(63 downto 0) => xbar_to_m01_couplers_WDATA(127 downto 64),
      S_AXI_wlast => xbar_to_m01_couplers_WLAST(1),
      S_AXI_wready => xbar_to_m01_couplers_WREADY,
      S_AXI_wstrb(7 downto 0) => xbar_to_m01_couplers_WSTRB(15 downto 8),
      S_AXI_wvalid => xbar_to_m01_couplers_WVALID(1)
    );
s00_couplers: entity work.s00_couplers_imp_1UTISAU
     port map (
      M_ACLK => processing_system7_0_axi_periph_ACLK_net,
      M_ARESETN => processing_system7_0_axi_periph_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => s00_couplers_to_xbar_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => s00_couplers_to_xbar_ARCACHE(3 downto 0),
      M_AXI_arlen(7 downto 0) => s00_couplers_to_xbar_ARLEN(7 downto 0),
      M_AXI_arlock(0) => s00_couplers_to_xbar_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => s00_couplers_to_xbar_ARQOS(3 downto 0),
      M_AXI_arready => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arsize(2 downto 0) => s00_couplers_to_xbar_ARSIZE(2 downto 0),
      M_AXI_arvalid => s00_couplers_to_xbar_ARVALID,
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => s00_couplers_to_xbar_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s00_couplers_to_xbar_AWCACHE(3 downto 0),
      M_AXI_awlen(7 downto 0) => s00_couplers_to_xbar_AWLEN(7 downto 0),
      M_AXI_awlock(0) => s00_couplers_to_xbar_AWLOCK(0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => s00_couplers_to_xbar_AWQOS(3 downto 0),
      M_AXI_awready => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awsize(2 downto 0) => s00_couplers_to_xbar_AWSIZE(2 downto 0),
      M_AXI_awvalid => s00_couplers_to_xbar_AWVALID,
      M_AXI_bready => s00_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(63 downto 0) => s00_couplers_to_xbar_RDATA(63 downto 0),
      M_AXI_rlast => s00_couplers_to_xbar_RLAST(0),
      M_AXI_rready => s00_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(63 downto 0) => s00_couplers_to_xbar_WDATA(63 downto 0),
      M_AXI_wlast => s00_couplers_to_xbar_WLAST,
      M_AXI_wready => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(7 downto 0) => s00_couplers_to_xbar_WSTRB(7 downto 0),
      M_AXI_wvalid => s00_couplers_to_xbar_WVALID,
      S_ACLK => S00_ACLK_1,
      S_ARESETN => S00_ARESETN_1,
      S_AXI_araddr(31 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(11 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_ARID(11 downto 0),
      S_AXI_arlen(3 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_ARLEN(3 downto 0),
      S_AXI_arlock(1 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_ARLOCK(1 downto 0),
      S_AXI_arprot(2 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => processing_system7_0_axi_periph_to_s00_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => processing_system7_0_axi_periph_to_s00_couplers_ARVALID,
      S_AXI_awaddr(31 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(11 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_AWID(11 downto 0),
      S_AXI_awlen(3 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_AWLEN(3 downto 0),
      S_AXI_awlock(1 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_AWLOCK(1 downto 0),
      S_AXI_awprot(2 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => processing_system7_0_axi_periph_to_s00_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => processing_system7_0_axi_periph_to_s00_couplers_AWVALID,
      S_AXI_bid(11 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_BID(11 downto 0),
      S_AXI_bready => processing_system7_0_axi_periph_to_s00_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => processing_system7_0_axi_periph_to_s00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rid(11 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_RID(11 downto 0),
      S_AXI_rlast => processing_system7_0_axi_periph_to_s00_couplers_RLAST,
      S_AXI_rready => processing_system7_0_axi_periph_to_s00_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => processing_system7_0_axi_periph_to_s00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wid(11 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_WID(11 downto 0),
      S_AXI_wlast => processing_system7_0_axi_periph_to_s00_couplers_WLAST,
      S_AXI_wready => processing_system7_0_axi_periph_to_s00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => processing_system7_0_axi_periph_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => processing_system7_0_axi_periph_to_s00_couplers_WVALID
    );
xbar: component base_zynq_design_xbar_0
     port map (
      aclk => processing_system7_0_axi_periph_ACLK_net,
      aresetn => processing_system7_0_axi_periph_ARESETN_net,
      m_axi_araddr(63 downto 32) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arburst(3 downto 2) => xbar_to_m01_couplers_ARBURST(3 downto 2),
      m_axi_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(7 downto 4) => xbar_to_m01_couplers_ARCACHE(7 downto 4),
      m_axi_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      m_axi_arlen(15 downto 8) => xbar_to_m01_couplers_ARLEN(15 downto 8),
      m_axi_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      m_axi_arlock(1) => xbar_to_m01_couplers_ARLOCK(1),
      m_axi_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      m_axi_arprot(5 downto 3) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      m_axi_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(7 downto 4) => xbar_to_m01_couplers_ARQOS(7 downto 4),
      m_axi_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY,
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arregion(7 downto 4) => xbar_to_m01_couplers_ARREGION(7 downto 4),
      m_axi_arregion(3 downto 0) => xbar_to_m00_couplers_ARREGION(3 downto 0),
      m_axi_arsize(5 downto 3) => xbar_to_m01_couplers_ARSIZE(5 downto 3),
      m_axi_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(63 downto 32) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(3 downto 2) => xbar_to_m01_couplers_AWBURST(3 downto 2),
      m_axi_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(7 downto 4) => xbar_to_m01_couplers_AWCACHE(7 downto 4),
      m_axi_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      m_axi_awlen(15 downto 8) => xbar_to_m01_couplers_AWLEN(15 downto 8),
      m_axi_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      m_axi_awlock(1) => xbar_to_m01_couplers_AWLOCK(1),
      m_axi_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      m_axi_awprot(5 downto 3) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      m_axi_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(7 downto 4) => xbar_to_m01_couplers_AWQOS(7 downto 4),
      m_axi_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY,
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awregion(7 downto 4) => xbar_to_m01_couplers_AWREGION(7 downto 4),
      m_axi_awregion(3 downto 0) => xbar_to_m00_couplers_AWREGION(3 downto 0),
      m_axi_awsize(5 downto 3) => xbar_to_m01_couplers_AWSIZE(5 downto 3),
      m_axi_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID,
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(127 downto 64) => xbar_to_m01_couplers_RDATA(63 downto 0),
      m_axi_rdata(63 downto 0) => xbar_to_m00_couplers_RDATA(63 downto 0),
      m_axi_rlast(1) => xbar_to_m01_couplers_RLAST,
      m_axi_rlast(0) => xbar_to_m00_couplers_RLAST,
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID,
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(127 downto 64) => xbar_to_m01_couplers_WDATA(127 downto 64),
      m_axi_wdata(63 downto 0) => xbar_to_m00_couplers_WDATA(63 downto 0),
      m_axi_wlast(1) => xbar_to_m01_couplers_WLAST(1),
      m_axi_wlast(0) => xbar_to_m00_couplers_WLAST(0),
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY,
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(15 downto 8) => xbar_to_m01_couplers_WSTRB(15 downto 8),
      m_axi_wstrb(7 downto 0) => xbar_to_m00_couplers_WSTRB(7 downto 0),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_xbar_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_xbar_ARCACHE(3 downto 0),
      s_axi_arlen(7 downto 0) => s00_couplers_to_xbar_ARLEN(7 downto 0),
      s_axi_arlock(0) => s00_couplers_to_xbar_ARLOCK(0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_xbar_ARQOS(3 downto 0),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arsize(2 downto 0) => s00_couplers_to_xbar_ARSIZE(2 downto 0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_xbar_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_xbar_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => s00_couplers_to_xbar_AWLEN(7 downto 0),
      s_axi_awlock(0) => s00_couplers_to_xbar_AWLOCK(0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => s00_couplers_to_xbar_AWQOS(3 downto 0),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awsize(2 downto 0) => s00_couplers_to_xbar_AWSIZE(2 downto 0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID,
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(63 downto 0) => s00_couplers_to_xbar_RDATA(63 downto 0),
      s_axi_rlast(0) => s00_couplers_to_xbar_RLAST(0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(63 downto 0) => s00_couplers_to_xbar_WDATA(63 downto 0),
      s_axi_wlast(0) => s00_couplers_to_xbar_WLAST,
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(7 downto 0) => s00_couplers_to_xbar_WSTRB(7 downto 0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_design is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    fech_enable_o : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of base_zynq_design : entity is "base_zynq_design,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=base_zynq_design,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=18,numReposBlks=14,numNonXlnxBlks=2,numHierBlks=4,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=8,da_ps7_cnt=3,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of base_zynq_design : entity is "base_zynq_design.hwdef";
end base_zynq_design;

architecture STRUCTURE of base_zynq_design is
  component base_zynq_design_axi_dwidth_converter_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component base_zynq_design_axi_dwidth_converter_0_0;
  component base_zynq_design_axi_protocol_converter_1_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component base_zynq_design_axi_protocol_converter_1_0;
  component base_zynq_design_clk_wiz_1_0 is
  port (
    resetn : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_out3 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component base_zynq_design_clk_wiz_1_0;
  component base_zynq_design_processing_system7_0_0 is
  port (
    TTC0_WAVE0_OUT : out STD_LOGIC;
    TTC0_WAVE1_OUT : out STD_LOGIC;
    TTC0_WAVE2_OUT : out STD_LOGIC;
    USB0_PORT_INDCTL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    USB0_VBUS_PWRSELECT : out STD_LOGIC;
    USB0_VBUS_PWRFAULT : in STD_LOGIC;
    M_AXI_GP0_ARVALID : out STD_LOGIC;
    M_AXI_GP0_AWVALID : out STD_LOGIC;
    M_AXI_GP0_BREADY : out STD_LOGIC;
    M_AXI_GP0_RREADY : out STD_LOGIC;
    M_AXI_GP0_WLAST : out STD_LOGIC;
    M_AXI_GP0_WVALID : out STD_LOGIC;
    M_AXI_GP0_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ACLK : in STD_LOGIC;
    M_AXI_GP0_ARREADY : in STD_LOGIC;
    M_AXI_GP0_AWREADY : in STD_LOGIC;
    M_AXI_GP0_BVALID : in STD_LOGIC;
    M_AXI_GP0_RLAST : in STD_LOGIC;
    M_AXI_GP0_RVALID : in STD_LOGIC;
    M_AXI_GP0_WREADY : in STD_LOGIC;
    M_AXI_GP0_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP0_ARREADY : out STD_LOGIC;
    S_AXI_GP0_AWREADY : out STD_LOGIC;
    S_AXI_GP0_BVALID : out STD_LOGIC;
    S_AXI_GP0_RLAST : out STD_LOGIC;
    S_AXI_GP0_RVALID : out STD_LOGIC;
    S_AXI_GP0_WREADY : out STD_LOGIC;
    S_AXI_GP0_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP0_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP0_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP0_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_GP0_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_GP0_ACLK : in STD_LOGIC;
    S_AXI_GP0_ARVALID : in STD_LOGIC;
    S_AXI_GP0_AWVALID : in STD_LOGIC;
    S_AXI_GP0_BREADY : in STD_LOGIC;
    S_AXI_GP0_RREADY : in STD_LOGIC;
    S_AXI_GP0_WLAST : in STD_LOGIC;
    S_AXI_GP0_WVALID : in STD_LOGIC;
    S_AXI_GP0_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP0_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP0_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_GP0_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP0_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_GP0_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_GP0_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_GP0_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_GP0_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP0_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP0_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_GP0_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_GP0_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_GP0_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_GP0_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_ARREADY : out STD_LOGIC;
    S_AXI_HP0_AWREADY : out STD_LOGIC;
    S_AXI_HP0_BVALID : out STD_LOGIC;
    S_AXI_HP0_RLAST : out STD_LOGIC;
    S_AXI_HP0_RVALID : out STD_LOGIC;
    S_AXI_HP0_WREADY : out STD_LOGIC;
    S_AXI_HP0_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP0_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_ACLK : in STD_LOGIC;
    S_AXI_HP0_ARVALID : in STD_LOGIC;
    S_AXI_HP0_AWVALID : in STD_LOGIC;
    S_AXI_HP0_BREADY : in STD_LOGIC;
    S_AXI_HP0_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_RREADY : in STD_LOGIC;
    S_AXI_HP0_WLAST : in STD_LOGIC;
    S_AXI_HP0_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_WVALID : in STD_LOGIC;
    S_AXI_HP0_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP0_WSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP1_ARREADY : out STD_LOGIC;
    S_AXI_HP1_AWREADY : out STD_LOGIC;
    S_AXI_HP1_BVALID : out STD_LOGIC;
    S_AXI_HP1_RLAST : out STD_LOGIC;
    S_AXI_HP1_RVALID : out STD_LOGIC;
    S_AXI_HP1_WREADY : out STD_LOGIC;
    S_AXI_HP1_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_RDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP1_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP1_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP1_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_ACLK : in STD_LOGIC;
    S_AXI_HP1_ARVALID : in STD_LOGIC;
    S_AXI_HP1_AWVALID : in STD_LOGIC;
    S_AXI_HP1_BREADY : in STD_LOGIC;
    S_AXI_HP1_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP1_RREADY : in STD_LOGIC;
    S_AXI_HP1_WLAST : in STD_LOGIC;
    S_AXI_HP1_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP1_WVALID : in STD_LOGIC;
    S_AXI_HP1_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP1_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP1_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_WDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP1_WSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP2_ARREADY : out STD_LOGIC;
    S_AXI_HP2_AWREADY : out STD_LOGIC;
    S_AXI_HP2_BVALID : out STD_LOGIC;
    S_AXI_HP2_RLAST : out STD_LOGIC;
    S_AXI_HP2_RVALID : out STD_LOGIC;
    S_AXI_HP2_WREADY : out STD_LOGIC;
    S_AXI_HP2_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP2_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP2_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP2_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP2_RDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP2_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP2_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP2_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP2_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP2_ACLK : in STD_LOGIC;
    S_AXI_HP2_ARVALID : in STD_LOGIC;
    S_AXI_HP2_AWVALID : in STD_LOGIC;
    S_AXI_HP2_BREADY : in STD_LOGIC;
    S_AXI_HP2_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP2_RREADY : in STD_LOGIC;
    S_AXI_HP2_WLAST : in STD_LOGIC;
    S_AXI_HP2_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP2_WVALID : in STD_LOGIC;
    S_AXI_HP2_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP2_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP2_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP2_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP2_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP2_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP2_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP2_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP2_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP2_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP2_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP2_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP2_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP2_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP2_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP2_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP2_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP2_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP2_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP2_WDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP2_WSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );
  end component base_zynq_design_processing_system7_0_0;
  component base_zynq_design_rst_processing_system7_0_50M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component base_zynq_design_rst_processing_system7_0_50M_0;
  component base_zynq_design_axi_protocol_converter_0_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component base_zynq_design_axi_protocol_converter_0_1;
  component base_zynq_design_axi_protocol_converter_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component base_zynq_design_axi_protocol_converter_0_0;
  component base_zynq_design_axi_protocol_converter_3_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component base_zynq_design_axi_protocol_converter_3_0;
  component base_zynq_design_soc_AXI_ctrl_v1_0_0_0 is
  port (
    test_mode_o : out STD_LOGIC;
    mode_select_o : out STD_LOGIC;
    fech_enable_o : out STD_LOGIC;
    eoc_i : in STD_LOGIC;
    return_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_awlock : in STD_LOGIC;
    s00_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wlast : in STD_LOGIC;
    s00_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arlock : in STD_LOGIC;
    s00_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rlast : out STD_LOGIC;
    s00_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  end component base_zynq_design_soc_AXI_ctrl_v1_0_0_0;
  component base_zynq_design_nuraghe_soc_0_0 is
  port (
    test_mode_i : in STD_LOGIC;
    mode_select_i : in STD_LOGIC;
    fetch_en_i : in STD_LOGIC;
    eoc_o : out STD_LOGIC;
    rstn_sync_i : in STD_LOGIC;
    clk_soc_i : in STD_LOGIC;
    clk_cluster_fast_i : in STD_LOGIC;
    clk_wmem_i : in STD_LOGIC;
    return_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    from_ps_bus_aw_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    from_ps_bus_aw_prot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    from_ps_bus_aw_region : in STD_LOGIC_VECTOR ( 3 downto 0 );
    from_ps_bus_aw_len : in STD_LOGIC_VECTOR ( 7 downto 0 );
    from_ps_bus_aw_size : in STD_LOGIC_VECTOR ( 2 downto 0 );
    from_ps_bus_aw_burst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    from_ps_bus_aw_lock : in STD_LOGIC;
    from_ps_bus_aw_cache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    from_ps_bus_aw_qos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    from_ps_bus_aw_id : in STD_LOGIC_VECTOR ( 9 downto 0 );
    from_ps_bus_aw_user : in STD_LOGIC_VECTOR ( 5 downto 0 );
    from_ps_bus_ar_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    from_ps_bus_ar_prot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    from_ps_bus_ar_region : in STD_LOGIC_VECTOR ( 3 downto 0 );
    from_ps_bus_ar_len : in STD_LOGIC_VECTOR ( 7 downto 0 );
    from_ps_bus_ar_size : in STD_LOGIC_VECTOR ( 2 downto 0 );
    from_ps_bus_ar_burst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    from_ps_bus_ar_lock : in STD_LOGIC;
    from_ps_bus_ar_cache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    from_ps_bus_ar_qos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    from_ps_bus_ar_id : in STD_LOGIC_VECTOR ( 9 downto 0 );
    from_ps_bus_ar_user : in STD_LOGIC_VECTOR ( 5 downto 0 );
    from_ps_bus_w_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    from_ps_bus_w_strb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    from_ps_bus_w_user : in STD_LOGIC_VECTOR ( 5 downto 0 );
    from_ps_bus_w_last : in STD_LOGIC;
    from_ps_bus_r_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    from_ps_bus_r_resp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    from_ps_bus_r_last : out STD_LOGIC;
    from_ps_bus_r_id : out STD_LOGIC_VECTOR ( 9 downto 0 );
    from_ps_bus_r_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    from_ps_bus_b_resp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    from_ps_bus_b_id : out STD_LOGIC_VECTOR ( 9 downto 0 );
    from_ps_bus_b_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    from_ps_bus_aw_ready : out STD_LOGIC;
    from_ps_bus_aw_valid : in STD_LOGIC;
    from_ps_bus_ar_ready : out STD_LOGIC;
    from_ps_bus_ar_valid : in STD_LOGIC;
    from_ps_bus_w_ready : out STD_LOGIC;
    from_ps_bus_w_valid : in STD_LOGIC;
    from_ps_bus_r_ready : in STD_LOGIC;
    from_ps_bus_r_valid : out STD_LOGIC;
    from_ps_bus_b_ready : in STD_LOGIC;
    from_ps_bus_b_valid : out STD_LOGIC;
    stdout_master_aw_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    stdout_master_aw_prot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    stdout_master_aw_region : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stdout_master_aw_len : out STD_LOGIC_VECTOR ( 7 downto 0 );
    stdout_master_aw_size : out STD_LOGIC_VECTOR ( 2 downto 0 );
    stdout_master_aw_burst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stdout_master_aw_lock : out STD_LOGIC;
    stdout_master_aw_cache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stdout_master_aw_qos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stdout_master_aw_id : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stdout_master_aw_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    stdout_master_ar_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    stdout_master_ar_prot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    stdout_master_ar_region : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stdout_master_ar_len : out STD_LOGIC_VECTOR ( 7 downto 0 );
    stdout_master_ar_size : out STD_LOGIC_VECTOR ( 2 downto 0 );
    stdout_master_ar_burst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stdout_master_ar_lock : out STD_LOGIC;
    stdout_master_ar_cache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stdout_master_ar_qos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stdout_master_ar_id : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stdout_master_ar_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    stdout_master_w_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    stdout_master_w_strb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    stdout_master_w_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    stdout_master_w_last : out STD_LOGIC;
    stdout_master_r_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    stdout_master_r_resp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    stdout_master_r_last : in STD_LOGIC;
    stdout_master_r_id : in STD_LOGIC_VECTOR ( 3 downto 0 );
    stdout_master_r_user : in STD_LOGIC_VECTOR ( 5 downto 0 );
    stdout_master_b_resp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    stdout_master_b_id : in STD_LOGIC_VECTOR ( 3 downto 0 );
    stdout_master_b_user : in STD_LOGIC_VECTOR ( 5 downto 0 );
    stdout_master_aw_ready : in STD_LOGIC;
    stdout_master_aw_valid : out STD_LOGIC;
    stdout_master_ar_ready : in STD_LOGIC;
    stdout_master_ar_valid : out STD_LOGIC;
    stdout_master_w_ready : in STD_LOGIC;
    stdout_master_w_valid : out STD_LOGIC;
    stdout_master_r_ready : out STD_LOGIC;
    stdout_master_r_valid : in STD_LOGIC;
    stdout_master_b_ready : out STD_LOGIC;
    stdout_master_b_valid : in STD_LOGIC;
    to_ps_bus_aw_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    to_ps_bus_aw_prot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    to_ps_bus_aw_region : out STD_LOGIC_VECTOR ( 3 downto 0 );
    to_ps_bus_aw_len : out STD_LOGIC_VECTOR ( 7 downto 0 );
    to_ps_bus_aw_size : out STD_LOGIC_VECTOR ( 2 downto 0 );
    to_ps_bus_aw_burst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    to_ps_bus_aw_lock : out STD_LOGIC;
    to_ps_bus_aw_cache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    to_ps_bus_aw_qos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    to_ps_bus_aw_id : out STD_LOGIC_VECTOR ( 3 downto 0 );
    to_ps_bus_aw_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    to_ps_bus_ar_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    to_ps_bus_ar_prot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    to_ps_bus_ar_region : out STD_LOGIC_VECTOR ( 3 downto 0 );
    to_ps_bus_ar_len : out STD_LOGIC_VECTOR ( 7 downto 0 );
    to_ps_bus_ar_size : out STD_LOGIC_VECTOR ( 2 downto 0 );
    to_ps_bus_ar_burst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    to_ps_bus_ar_lock : out STD_LOGIC;
    to_ps_bus_ar_cache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    to_ps_bus_ar_qos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    to_ps_bus_ar_id : out STD_LOGIC_VECTOR ( 3 downto 0 );
    to_ps_bus_ar_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    to_ps_bus_w_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    to_ps_bus_w_strb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    to_ps_bus_w_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    to_ps_bus_w_last : out STD_LOGIC;
    to_ps_bus_r_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    to_ps_bus_r_resp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    to_ps_bus_r_last : in STD_LOGIC;
    to_ps_bus_r_id : in STD_LOGIC_VECTOR ( 3 downto 0 );
    to_ps_bus_r_user : in STD_LOGIC_VECTOR ( 5 downto 0 );
    to_ps_bus_b_resp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    to_ps_bus_b_id : in STD_LOGIC_VECTOR ( 3 downto 0 );
    to_ps_bus_b_user : in STD_LOGIC_VECTOR ( 5 downto 0 );
    to_ps_bus_aw_ready : in STD_LOGIC;
    to_ps_bus_aw_valid : out STD_LOGIC;
    to_ps_bus_ar_ready : in STD_LOGIC;
    to_ps_bus_ar_valid : out STD_LOGIC;
    to_ps_bus_w_ready : in STD_LOGIC;
    to_ps_bus_w_valid : out STD_LOGIC;
    to_ps_bus_r_ready : out STD_LOGIC;
    to_ps_bus_r_valid : in STD_LOGIC;
    to_ps_bus_b_ready : out STD_LOGIC;
    to_ps_bus_b_valid : in STD_LOGIC;
    dma2ddr_bus_aw_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dma2ddr_bus_aw_prot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    dma2ddr_bus_aw_region : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dma2ddr_bus_aw_len : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dma2ddr_bus_aw_size : out STD_LOGIC_VECTOR ( 2 downto 0 );
    dma2ddr_bus_aw_burst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    dma2ddr_bus_aw_lock : out STD_LOGIC;
    dma2ddr_bus_aw_cache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dma2ddr_bus_aw_qos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dma2ddr_bus_aw_id : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dma2ddr_bus_aw_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    dma2ddr_bus_aw_ready : in STD_LOGIC;
    dma2ddr_bus_aw_valid : out STD_LOGIC;
    dma2ddr_bus_ar_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dma2ddr_bus_ar_prot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    dma2ddr_bus_ar_region : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dma2ddr_bus_ar_len : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dma2ddr_bus_ar_size : out STD_LOGIC_VECTOR ( 2 downto 0 );
    dma2ddr_bus_ar_burst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    dma2ddr_bus_ar_lock : out STD_LOGIC;
    dma2ddr_bus_ar_cache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dma2ddr_bus_ar_qos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dma2ddr_bus_ar_id : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dma2ddr_bus_ar_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    dma2ddr_bus_ar_ready : in STD_LOGIC;
    dma2ddr_bus_ar_valid : out STD_LOGIC;
    dma2ddr_bus_w_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dma2ddr_bus_w_strb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dma2ddr_bus_w_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    dma2ddr_bus_w_last : out STD_LOGIC;
    dma2ddr_bus_w_ready : in STD_LOGIC;
    dma2ddr_bus_w_valid : out STD_LOGIC;
    dma2ddr_bus_r_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    dma2ddr_bus_r_resp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    dma2ddr_bus_r_last : in STD_LOGIC;
    dma2ddr_bus_r_id : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dma2ddr_bus_r_user : in STD_LOGIC_VECTOR ( 5 downto 0 );
    dma2ddr_bus_r_ready : out STD_LOGIC;
    dma2ddr_bus_r_valid : in STD_LOGIC;
    dma2ddr_bus_b_resp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    dma2ddr_bus_b_id : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dma2ddr_bus_b_user : in STD_LOGIC_VECTOR ( 5 downto 0 );
    dma2ddr_bus_b_ready : out STD_LOGIC;
    dma2ddr_bus_b_valid : in STD_LOGIC;
    wei2ddr_bus_aw_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wei2ddr_bus_aw_prot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    wei2ddr_bus_aw_region : out STD_LOGIC_VECTOR ( 3 downto 0 );
    wei2ddr_bus_aw_len : out STD_LOGIC_VECTOR ( 7 downto 0 );
    wei2ddr_bus_aw_size : out STD_LOGIC_VECTOR ( 2 downto 0 );
    wei2ddr_bus_aw_burst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    wei2ddr_bus_aw_lock : out STD_LOGIC;
    wei2ddr_bus_aw_cache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    wei2ddr_bus_aw_qos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    wei2ddr_bus_aw_id : out STD_LOGIC_VECTOR ( 3 downto 0 );
    wei2ddr_bus_aw_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    wei2ddr_bus_aw_ready : in STD_LOGIC;
    wei2ddr_bus_aw_valid : out STD_LOGIC;
    wei2ddr_bus_ar_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wei2ddr_bus_ar_prot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    wei2ddr_bus_ar_region : out STD_LOGIC_VECTOR ( 3 downto 0 );
    wei2ddr_bus_ar_len : out STD_LOGIC_VECTOR ( 7 downto 0 );
    wei2ddr_bus_ar_size : out STD_LOGIC_VECTOR ( 2 downto 0 );
    wei2ddr_bus_ar_burst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    wei2ddr_bus_ar_lock : out STD_LOGIC;
    wei2ddr_bus_ar_cache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    wei2ddr_bus_ar_qos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    wei2ddr_bus_ar_id : out STD_LOGIC_VECTOR ( 3 downto 0 );
    wei2ddr_bus_ar_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    wei2ddr_bus_ar_ready : in STD_LOGIC;
    wei2ddr_bus_ar_valid : out STD_LOGIC;
    wei2ddr_bus_w_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    wei2ddr_bus_w_strb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    wei2ddr_bus_w_user : out STD_LOGIC_VECTOR ( 5 downto 0 );
    wei2ddr_bus_w_last : out STD_LOGIC;
    wei2ddr_bus_w_ready : in STD_LOGIC;
    wei2ddr_bus_w_valid : out STD_LOGIC;
    wei2ddr_bus_r_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    wei2ddr_bus_r_resp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    wei2ddr_bus_r_last : in STD_LOGIC;
    wei2ddr_bus_r_id : in STD_LOGIC_VECTOR ( 3 downto 0 );
    wei2ddr_bus_r_user : in STD_LOGIC_VECTOR ( 5 downto 0 );
    wei2ddr_bus_r_ready : out STD_LOGIC;
    wei2ddr_bus_r_valid : in STD_LOGIC;
    wei2ddr_bus_b_resp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    wei2ddr_bus_b_id : in STD_LOGIC_VECTOR ( 3 downto 0 );
    wei2ddr_bus_b_user : in STD_LOGIC_VECTOR ( 5 downto 0 );
    wei2ddr_bus_b_ready : out STD_LOGIC;
    wei2ddr_bus_b_valid : in STD_LOGIC
  );
  end component base_zynq_design_nuraghe_soc_0_0;
  signal axi_dwidth_converter_0_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_ARREADY : STD_LOGIC;
  signal axi_dwidth_converter_0_M_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_ARVALID : STD_LOGIC;
  signal axi_dwidth_converter_0_M_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_AWREADY : STD_LOGIC;
  signal axi_dwidth_converter_0_M_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_AWVALID : STD_LOGIC;
  signal axi_dwidth_converter_0_M_AXI_BREADY : STD_LOGIC;
  signal axi_dwidth_converter_0_M_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_BVALID : STD_LOGIC;
  signal axi_dwidth_converter_0_M_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_RLAST : STD_LOGIC;
  signal axi_dwidth_converter_0_M_AXI_RREADY : STD_LOGIC;
  signal axi_dwidth_converter_0_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_RVALID : STD_LOGIC;
  signal axi_dwidth_converter_0_M_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_WLAST : STD_LOGIC;
  signal axi_dwidth_converter_0_M_AXI_WREADY : STD_LOGIC;
  signal axi_dwidth_converter_0_M_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dwidth_converter_0_M_AXI_WVALID : STD_LOGIC;
  signal axi_protocol_converter_0_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_protocol_converter_0_M_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_0_M_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_0_M_AXI_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_0_M_AXI_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_0_M_AXI_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_0_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_0_M_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_0_M_AXI_ARREADY : STD_LOGIC;
  signal axi_protocol_converter_0_M_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_0_M_AXI_ARVALID : STD_LOGIC;
  signal axi_protocol_converter_0_M_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_protocol_converter_0_M_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_0_M_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_0_M_AXI_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_0_M_AXI_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_0_M_AXI_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_0_M_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_0_M_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_0_M_AXI_AWREADY : STD_LOGIC;
  signal axi_protocol_converter_0_M_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_0_M_AXI_AWVALID : STD_LOGIC;
  signal axi_protocol_converter_0_M_AXI_BID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_protocol_converter_0_M_AXI_BREADY : STD_LOGIC;
  signal axi_protocol_converter_0_M_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_0_M_AXI_BVALID : STD_LOGIC;
  signal axi_protocol_converter_0_M_AXI_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_protocol_converter_0_M_AXI_RID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_protocol_converter_0_M_AXI_RLAST : STD_LOGIC;
  signal axi_protocol_converter_0_M_AXI_RREADY : STD_LOGIC;
  signal axi_protocol_converter_0_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_0_M_AXI_RVALID : STD_LOGIC;
  signal axi_protocol_converter_0_M_AXI_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_protocol_converter_0_M_AXI_WID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_0_M_AXI_WLAST : STD_LOGIC;
  signal axi_protocol_converter_0_M_AXI_WREADY : STD_LOGIC;
  signal axi_protocol_converter_0_M_AXI_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_protocol_converter_0_M_AXI_WVALID : STD_LOGIC;
  signal axi_protocol_converter_1_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_protocol_converter_1_M_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_1_M_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_1_M_AXI_ARID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_protocol_converter_1_M_AXI_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_1_M_AXI_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_1_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_1_M_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_1_M_AXI_ARREADY : STD_LOGIC;
  signal axi_protocol_converter_1_M_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_1_M_AXI_ARVALID : STD_LOGIC;
  signal axi_protocol_converter_1_M_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_protocol_converter_1_M_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_1_M_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_1_M_AXI_AWID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_protocol_converter_1_M_AXI_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_1_M_AXI_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_1_M_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_1_M_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_1_M_AXI_AWREADY : STD_LOGIC;
  signal axi_protocol_converter_1_M_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_1_M_AXI_AWVALID : STD_LOGIC;
  signal axi_protocol_converter_1_M_AXI_BID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_protocol_converter_1_M_AXI_BREADY : STD_LOGIC;
  signal axi_protocol_converter_1_M_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_1_M_AXI_BVALID : STD_LOGIC;
  signal axi_protocol_converter_1_M_AXI_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_protocol_converter_1_M_AXI_RID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_protocol_converter_1_M_AXI_RLAST : STD_LOGIC;
  signal axi_protocol_converter_1_M_AXI_RREADY : STD_LOGIC;
  signal axi_protocol_converter_1_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_1_M_AXI_RVALID : STD_LOGIC;
  signal axi_protocol_converter_1_M_AXI_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_protocol_converter_1_M_AXI_WLAST : STD_LOGIC;
  signal axi_protocol_converter_1_M_AXI_WREADY : STD_LOGIC;
  signal axi_protocol_converter_1_M_AXI_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_protocol_converter_1_M_AXI_WVALID : STD_LOGIC;
  signal axi_protocol_converter_2_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_protocol_converter_2_M_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_2_M_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_2_M_AXI_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_2_M_AXI_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_2_M_AXI_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_2_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_2_M_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_2_M_AXI_ARREADY : STD_LOGIC;
  signal axi_protocol_converter_2_M_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_2_M_AXI_ARVALID : STD_LOGIC;
  signal axi_protocol_converter_2_M_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_protocol_converter_2_M_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_2_M_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_2_M_AXI_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_2_M_AXI_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_2_M_AXI_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_2_M_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_2_M_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_2_M_AXI_AWREADY : STD_LOGIC;
  signal axi_protocol_converter_2_M_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_2_M_AXI_AWVALID : STD_LOGIC;
  signal axi_protocol_converter_2_M_AXI_BID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_protocol_converter_2_M_AXI_BREADY : STD_LOGIC;
  signal axi_protocol_converter_2_M_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_2_M_AXI_BVALID : STD_LOGIC;
  signal axi_protocol_converter_2_M_AXI_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_protocol_converter_2_M_AXI_RID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_protocol_converter_2_M_AXI_RLAST : STD_LOGIC;
  signal axi_protocol_converter_2_M_AXI_RREADY : STD_LOGIC;
  signal axi_protocol_converter_2_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_2_M_AXI_RVALID : STD_LOGIC;
  signal axi_protocol_converter_2_M_AXI_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_protocol_converter_2_M_AXI_WID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_2_M_AXI_WLAST : STD_LOGIC;
  signal axi_protocol_converter_2_M_AXI_WREADY : STD_LOGIC;
  signal axi_protocol_converter_2_M_AXI_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_protocol_converter_2_M_AXI_WVALID : STD_LOGIC;
  signal axi_protocol_converter_3_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_protocol_converter_3_M_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_3_M_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_3_M_AXI_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_3_M_AXI_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_3_M_AXI_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_3_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_3_M_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_3_M_AXI_ARREADY : STD_LOGIC;
  signal axi_protocol_converter_3_M_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_3_M_AXI_ARVALID : STD_LOGIC;
  signal axi_protocol_converter_3_M_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_protocol_converter_3_M_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_3_M_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_3_M_AXI_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_3_M_AXI_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_3_M_AXI_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_3_M_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_3_M_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_3_M_AXI_AWREADY : STD_LOGIC;
  signal axi_protocol_converter_3_M_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_converter_3_M_AXI_AWVALID : STD_LOGIC;
  signal axi_protocol_converter_3_M_AXI_BID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_protocol_converter_3_M_AXI_BREADY : STD_LOGIC;
  signal axi_protocol_converter_3_M_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_3_M_AXI_BVALID : STD_LOGIC;
  signal axi_protocol_converter_3_M_AXI_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_protocol_converter_3_M_AXI_RID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_protocol_converter_3_M_AXI_RLAST : STD_LOGIC;
  signal axi_protocol_converter_3_M_AXI_RREADY : STD_LOGIC;
  signal axi_protocol_converter_3_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_converter_3_M_AXI_RVALID : STD_LOGIC;
  signal axi_protocol_converter_3_M_AXI_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_protocol_converter_3_M_AXI_WID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_converter_3_M_AXI_WLAST : STD_LOGIC;
  signal axi_protocol_converter_3_M_AXI_WREADY : STD_LOGIC;
  signal axi_protocol_converter_3_M_AXI_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_protocol_converter_3_M_AXI_WVALID : STD_LOGIC;
  signal clk_wiz_1_clk_out2 : STD_LOGIC;
  signal clk_wiz_1_clk_out3 : STD_LOGIC;
  signal clk_wiz_1_locked : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_ARLOCK : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_ARREADY : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_ARUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_ARVALID : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_AWLOCK : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_AWREADY : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_AWUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_AWVALID : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_BREADY : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_BVALID : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_RLAST : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_RREADY : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_RUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_RVALID : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_WLAST : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_WREADY : STD_LOGIC;
  signal nuraghe_soc_0_DATA_OUT_M_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_WUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_DATA_OUT_M_WVALID : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_ARLOCK : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_ARREADY : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_ARUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_ARVALID : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_AWLOCK : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_AWREADY : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_AWUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_AWVALID : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_BREADY : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_BVALID : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_RLAST : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_RREADY : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_RUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_RVALID : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_WLAST : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_WREADY : STD_LOGIC;
  signal nuraghe_soc_0_DMA_TO_DDR_M_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_WUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_DMA_TO_DDR_M_WVALID : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_ARLOCK : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_ARREADY : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_ARUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_ARVALID : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_AWLOCK : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_AWREADY : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_AWUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_AWVALID : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_BID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_BREADY : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_BVALID : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_RID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_RLAST : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_RREADY : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_RUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_RVALID : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_WLAST : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_WREADY : STD_LOGIC;
  signal nuraghe_soc_0_STDOUT_M_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_WUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_STDOUT_M_WVALID : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_ARLOCK : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_ARREADY : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_ARUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_ARVALID : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_AWLOCK : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_AWREADY : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_AWUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_AWVALID : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_BID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_BREADY : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_BVALID : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_RLAST : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_RREADY : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_RUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_RVALID : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_WLAST : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_WREADY : STD_LOGIC;
  signal nuraghe_soc_0_WEI_TO_DDR_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_WUSER : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nuraghe_soc_0_WEI_TO_DDR_WVALID : STD_LOGIC;
  signal nuraghe_soc_0_eoc_o : STD_LOGIC;
  signal nuraghe_soc_0_return_o : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_DDR_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal processing_system7_0_DDR_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_DDR_CAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_CKE : STD_LOGIC;
  signal processing_system7_0_DDR_CK_N : STD_LOGIC;
  signal processing_system7_0_DDR_CK_P : STD_LOGIC;
  signal processing_system7_0_DDR_CS_N : STD_LOGIC;
  signal processing_system7_0_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_DDR_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_ODT : STD_LOGIC;
  signal processing_system7_0_DDR_RAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_RESET_N : STD_LOGIC;
  signal processing_system7_0_DDR_WE_N : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK2 : STD_LOGIC;
  signal processing_system7_0_FCLK_RESET0_N : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRN : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRP : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal processing_system7_0_FIXED_IO_PS_CLK : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_PORB : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_SRSTB : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_ARLOCK : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_ARREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_ARVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWLOCK : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_BREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_BVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_RLAST : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_RREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_RVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_WLAST : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_WREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_WVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_ARLOCK : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_ARREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_ARVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_AWLOCK : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_AWREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_AWVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_BREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_BVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_RLAST : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_RREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_RVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_WLAST : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_WREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal processing_system7_0_axi_periph_M01_AXI_WVALID : STD_LOGIC;
  signal rst_processing_system7_0_50M_interconnect_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_processing_system7_0_50M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal soc_AXI_ctrl_v1_0_0_fech_enable_o : STD_LOGIC;
  signal soc_AXI_ctrl_v1_0_0_mode_select_o : STD_LOGIC;
  signal soc_AXI_ctrl_v1_0_0_test_mode_o : STD_LOGIC;
  signal NLW_axi_protocol_converter_0_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axi_protocol_converter_0_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axi_protocol_converter_0_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axi_protocol_converter_1_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axi_protocol_converter_1_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axi_protocol_converter_1_m_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axi_protocol_converter_1_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axi_protocol_converter_2_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axi_protocol_converter_2_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axi_protocol_converter_2_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axi_protocol_converter_3_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axi_protocol_converter_3_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axi_protocol_converter_3_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_nuraghe_soc_0_from_ps_bus_b_id_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_nuraghe_soc_0_from_ps_bus_b_user_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_nuraghe_soc_0_from_ps_bus_r_id_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_nuraghe_soc_0_from_ps_bus_r_user_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_S_AXI_GP0_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_GP0_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP1_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP1_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP1_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP1_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP2_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP2_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP2_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP2_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_rst_processing_system7_0_50M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_processing_system7_0_50M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_processing_system7_0_50M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_soc_AXI_ctrl_v1_0_0_s00_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_soc_AXI_ctrl_v1_0_0_s00_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_soc_AXI_ctrl_v1_0_0_s00_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_soc_AXI_ctrl_v1_0_0_s00_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  fech_enable_o <= soc_AXI_ctrl_v1_0_0_fech_enable_o;
axi_dwidth_converter_0: component base_zynq_design_axi_dwidth_converter_0_0
     port map (
      m_axi_araddr(31 downto 0) => axi_dwidth_converter_0_M_AXI_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => axi_dwidth_converter_0_M_AXI_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => axi_dwidth_converter_0_M_AXI_ARCACHE(3 downto 0),
      m_axi_arlen(3 downto 0) => axi_dwidth_converter_0_M_AXI_ARLEN(3 downto 0),
      m_axi_arlock(1 downto 0) => axi_dwidth_converter_0_M_AXI_ARLOCK(1 downto 0),
      m_axi_arprot(2 downto 0) => axi_dwidth_converter_0_M_AXI_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => axi_dwidth_converter_0_M_AXI_ARQOS(3 downto 0),
      m_axi_arready => axi_dwidth_converter_0_M_AXI_ARREADY,
      m_axi_arsize(2 downto 0) => axi_dwidth_converter_0_M_AXI_ARSIZE(2 downto 0),
      m_axi_arvalid => axi_dwidth_converter_0_M_AXI_ARVALID,
      m_axi_awaddr(31 downto 0) => axi_dwidth_converter_0_M_AXI_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => axi_dwidth_converter_0_M_AXI_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => axi_dwidth_converter_0_M_AXI_AWCACHE(3 downto 0),
      m_axi_awlen(3 downto 0) => axi_dwidth_converter_0_M_AXI_AWLEN(3 downto 0),
      m_axi_awlock(1 downto 0) => axi_dwidth_converter_0_M_AXI_AWLOCK(1 downto 0),
      m_axi_awprot(2 downto 0) => axi_dwidth_converter_0_M_AXI_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => axi_dwidth_converter_0_M_AXI_AWQOS(3 downto 0),
      m_axi_awready => axi_dwidth_converter_0_M_AXI_AWREADY,
      m_axi_awsize(2 downto 0) => axi_dwidth_converter_0_M_AXI_AWSIZE(2 downto 0),
      m_axi_awvalid => axi_dwidth_converter_0_M_AXI_AWVALID,
      m_axi_bready => axi_dwidth_converter_0_M_AXI_BREADY,
      m_axi_bresp(1 downto 0) => axi_dwidth_converter_0_M_AXI_BRESP(1 downto 0),
      m_axi_bvalid => axi_dwidth_converter_0_M_AXI_BVALID,
      m_axi_rdata(31 downto 0) => axi_dwidth_converter_0_M_AXI_RDATA(31 downto 0),
      m_axi_rlast => axi_dwidth_converter_0_M_AXI_RLAST,
      m_axi_rready => axi_dwidth_converter_0_M_AXI_RREADY,
      m_axi_rresp(1 downto 0) => axi_dwidth_converter_0_M_AXI_RRESP(1 downto 0),
      m_axi_rvalid => axi_dwidth_converter_0_M_AXI_RVALID,
      m_axi_wdata(31 downto 0) => axi_dwidth_converter_0_M_AXI_WDATA(31 downto 0),
      m_axi_wlast => axi_dwidth_converter_0_M_AXI_WLAST,
      m_axi_wready => axi_dwidth_converter_0_M_AXI_WREADY,
      m_axi_wstrb(3 downto 0) => axi_dwidth_converter_0_M_AXI_WSTRB(3 downto 0),
      m_axi_wvalid => axi_dwidth_converter_0_M_AXI_WVALID,
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(31 downto 0) => axi_protocol_converter_1_M_AXI_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => axi_protocol_converter_1_M_AXI_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => axi_protocol_converter_1_M_AXI_ARCACHE(3 downto 0),
      s_axi_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axi_arid(5 downto 0) => axi_protocol_converter_1_M_AXI_ARID(5 downto 0),
      s_axi_arlen(3 downto 0) => axi_protocol_converter_1_M_AXI_ARLEN(3 downto 0),
      s_axi_arlock(1 downto 0) => axi_protocol_converter_1_M_AXI_ARLOCK(1 downto 0),
      s_axi_arprot(2 downto 0) => axi_protocol_converter_1_M_AXI_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => axi_protocol_converter_1_M_AXI_ARQOS(3 downto 0),
      s_axi_arready => axi_protocol_converter_1_M_AXI_ARREADY,
      s_axi_arsize(2 downto 0) => axi_protocol_converter_1_M_AXI_ARSIZE(2 downto 0),
      s_axi_arvalid => axi_protocol_converter_1_M_AXI_ARVALID,
      s_axi_awaddr(31 downto 0) => axi_protocol_converter_1_M_AXI_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => axi_protocol_converter_1_M_AXI_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => axi_protocol_converter_1_M_AXI_AWCACHE(3 downto 0),
      s_axi_awid(5 downto 0) => axi_protocol_converter_1_M_AXI_AWID(5 downto 0),
      s_axi_awlen(3 downto 0) => axi_protocol_converter_1_M_AXI_AWLEN(3 downto 0),
      s_axi_awlock(1 downto 0) => axi_protocol_converter_1_M_AXI_AWLOCK(1 downto 0),
      s_axi_awprot(2 downto 0) => axi_protocol_converter_1_M_AXI_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => axi_protocol_converter_1_M_AXI_AWQOS(3 downto 0),
      s_axi_awready => axi_protocol_converter_1_M_AXI_AWREADY,
      s_axi_awsize(2 downto 0) => axi_protocol_converter_1_M_AXI_AWSIZE(2 downto 0),
      s_axi_awvalid => axi_protocol_converter_1_M_AXI_AWVALID,
      s_axi_bid(5 downto 0) => axi_protocol_converter_1_M_AXI_BID(5 downto 0),
      s_axi_bready => axi_protocol_converter_1_M_AXI_BREADY,
      s_axi_bresp(1 downto 0) => axi_protocol_converter_1_M_AXI_BRESP(1 downto 0),
      s_axi_bvalid => axi_protocol_converter_1_M_AXI_BVALID,
      s_axi_rdata(63 downto 0) => axi_protocol_converter_1_M_AXI_RDATA(63 downto 0),
      s_axi_rid(5 downto 0) => axi_protocol_converter_1_M_AXI_RID(5 downto 0),
      s_axi_rlast => axi_protocol_converter_1_M_AXI_RLAST,
      s_axi_rready => axi_protocol_converter_1_M_AXI_RREADY,
      s_axi_rresp(1 downto 0) => axi_protocol_converter_1_M_AXI_RRESP(1 downto 0),
      s_axi_rvalid => axi_protocol_converter_1_M_AXI_RVALID,
      s_axi_wdata(63 downto 0) => axi_protocol_converter_1_M_AXI_WDATA(63 downto 0),
      s_axi_wlast => axi_protocol_converter_1_M_AXI_WLAST,
      s_axi_wready => axi_protocol_converter_1_M_AXI_WREADY,
      s_axi_wstrb(7 downto 0) => axi_protocol_converter_1_M_AXI_WSTRB(7 downto 0),
      s_axi_wvalid => axi_protocol_converter_1_M_AXI_WVALID
    );
axi_protocol_converter_0: component base_zynq_design_axi_protocol_converter_0_0
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      m_axi_araddr(31 downto 0) => axi_protocol_converter_0_M_AXI_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => axi_protocol_converter_0_M_AXI_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => axi_protocol_converter_0_M_AXI_ARCACHE(3 downto 0),
      m_axi_arid(3 downto 0) => axi_protocol_converter_0_M_AXI_ARID(3 downto 0),
      m_axi_arlen(3 downto 0) => axi_protocol_converter_0_M_AXI_ARLEN(3 downto 0),
      m_axi_arlock(1 downto 0) => axi_protocol_converter_0_M_AXI_ARLOCK(1 downto 0),
      m_axi_arprot(2 downto 0) => axi_protocol_converter_0_M_AXI_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => axi_protocol_converter_0_M_AXI_ARQOS(3 downto 0),
      m_axi_arready => axi_protocol_converter_0_M_AXI_ARREADY,
      m_axi_arsize(2 downto 0) => axi_protocol_converter_0_M_AXI_ARSIZE(2 downto 0),
      m_axi_aruser(5 downto 0) => NLW_axi_protocol_converter_0_m_axi_aruser_UNCONNECTED(5 downto 0),
      m_axi_arvalid => axi_protocol_converter_0_M_AXI_ARVALID,
      m_axi_awaddr(31 downto 0) => axi_protocol_converter_0_M_AXI_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => axi_protocol_converter_0_M_AXI_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => axi_protocol_converter_0_M_AXI_AWCACHE(3 downto 0),
      m_axi_awid(3 downto 0) => axi_protocol_converter_0_M_AXI_AWID(3 downto 0),
      m_axi_awlen(3 downto 0) => axi_protocol_converter_0_M_AXI_AWLEN(3 downto 0),
      m_axi_awlock(1 downto 0) => axi_protocol_converter_0_M_AXI_AWLOCK(1 downto 0),
      m_axi_awprot(2 downto 0) => axi_protocol_converter_0_M_AXI_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => axi_protocol_converter_0_M_AXI_AWQOS(3 downto 0),
      m_axi_awready => axi_protocol_converter_0_M_AXI_AWREADY,
      m_axi_awsize(2 downto 0) => axi_protocol_converter_0_M_AXI_AWSIZE(2 downto 0),
      m_axi_awuser(5 downto 0) => NLW_axi_protocol_converter_0_m_axi_awuser_UNCONNECTED(5 downto 0),
      m_axi_awvalid => axi_protocol_converter_0_M_AXI_AWVALID,
      m_axi_bid(3 downto 0) => axi_protocol_converter_0_M_AXI_BID(3 downto 0),
      m_axi_bready => axi_protocol_converter_0_M_AXI_BREADY,
      m_axi_bresp(1 downto 0) => axi_protocol_converter_0_M_AXI_BRESP(1 downto 0),
      m_axi_bvalid => axi_protocol_converter_0_M_AXI_BVALID,
      m_axi_rdata(63 downto 0) => axi_protocol_converter_0_M_AXI_RDATA(63 downto 0),
      m_axi_rid(3 downto 0) => axi_protocol_converter_0_M_AXI_RID(3 downto 0),
      m_axi_rlast => axi_protocol_converter_0_M_AXI_RLAST,
      m_axi_rready => axi_protocol_converter_0_M_AXI_RREADY,
      m_axi_rresp(1 downto 0) => axi_protocol_converter_0_M_AXI_RRESP(1 downto 0),
      m_axi_ruser(5 downto 0) => B"000000",
      m_axi_rvalid => axi_protocol_converter_0_M_AXI_RVALID,
      m_axi_wdata(63 downto 0) => axi_protocol_converter_0_M_AXI_WDATA(63 downto 0),
      m_axi_wid(3 downto 0) => axi_protocol_converter_0_M_AXI_WID(3 downto 0),
      m_axi_wlast => axi_protocol_converter_0_M_AXI_WLAST,
      m_axi_wready => axi_protocol_converter_0_M_AXI_WREADY,
      m_axi_wstrb(7 downto 0) => axi_protocol_converter_0_M_AXI_WSTRB(7 downto 0),
      m_axi_wuser(5 downto 0) => NLW_axi_protocol_converter_0_m_axi_wuser_UNCONNECTED(5 downto 0),
      m_axi_wvalid => axi_protocol_converter_0_M_AXI_WVALID,
      s_axi_araddr(31 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARCACHE(3 downto 0),
      s_axi_arid(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARID(3 downto 0),
      s_axi_arlen(7 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARLEN(7 downto 0),
      s_axi_arlock(0) => nuraghe_soc_0_DATA_OUT_M_ARLOCK,
      s_axi_arprot(2 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARQOS(3 downto 0),
      s_axi_arready => nuraghe_soc_0_DATA_OUT_M_ARREADY,
      s_axi_arregion(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARSIZE(2 downto 0),
      s_axi_aruser(5 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARUSER(5 downto 0),
      s_axi_arvalid => nuraghe_soc_0_DATA_OUT_M_ARVALID,
      s_axi_awaddr(31 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWCACHE(3 downto 0),
      s_axi_awid(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWID(3 downto 0),
      s_axi_awlen(7 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWLEN(7 downto 0),
      s_axi_awlock(0) => nuraghe_soc_0_DATA_OUT_M_AWLOCK,
      s_axi_awprot(2 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWQOS(3 downto 0),
      s_axi_awready => nuraghe_soc_0_DATA_OUT_M_AWREADY,
      s_axi_awregion(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWSIZE(2 downto 0),
      s_axi_awuser(5 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWUSER(5 downto 0),
      s_axi_awvalid => nuraghe_soc_0_DATA_OUT_M_AWVALID,
      s_axi_bid(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_BID(3 downto 0),
      s_axi_bready => nuraghe_soc_0_DATA_OUT_M_BREADY,
      s_axi_bresp(1 downto 0) => nuraghe_soc_0_DATA_OUT_M_BRESP(1 downto 0),
      s_axi_bvalid => nuraghe_soc_0_DATA_OUT_M_BVALID,
      s_axi_rdata(63 downto 0) => nuraghe_soc_0_DATA_OUT_M_RDATA(63 downto 0),
      s_axi_rid(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_RID(3 downto 0),
      s_axi_rlast => nuraghe_soc_0_DATA_OUT_M_RLAST,
      s_axi_rready => nuraghe_soc_0_DATA_OUT_M_RREADY,
      s_axi_rresp(1 downto 0) => nuraghe_soc_0_DATA_OUT_M_RRESP(1 downto 0),
      s_axi_ruser(5 downto 0) => nuraghe_soc_0_DATA_OUT_M_RUSER(5 downto 0),
      s_axi_rvalid => nuraghe_soc_0_DATA_OUT_M_RVALID,
      s_axi_wdata(63 downto 0) => nuraghe_soc_0_DATA_OUT_M_WDATA(63 downto 0),
      s_axi_wlast => nuraghe_soc_0_DATA_OUT_M_WLAST,
      s_axi_wready => nuraghe_soc_0_DATA_OUT_M_WREADY,
      s_axi_wstrb(7 downto 0) => nuraghe_soc_0_DATA_OUT_M_WSTRB(7 downto 0),
      s_axi_wuser(5 downto 0) => nuraghe_soc_0_DATA_OUT_M_WUSER(5 downto 0),
      s_axi_wvalid => nuraghe_soc_0_DATA_OUT_M_WVALID
    );
axi_protocol_converter_1: component base_zynq_design_axi_protocol_converter_1_0
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      m_axi_araddr(31 downto 0) => axi_protocol_converter_1_M_AXI_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => axi_protocol_converter_1_M_AXI_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => axi_protocol_converter_1_M_AXI_ARCACHE(3 downto 0),
      m_axi_arid(5 downto 0) => axi_protocol_converter_1_M_AXI_ARID(5 downto 0),
      m_axi_arlen(3 downto 0) => axi_protocol_converter_1_M_AXI_ARLEN(3 downto 0),
      m_axi_arlock(1 downto 0) => axi_protocol_converter_1_M_AXI_ARLOCK(1 downto 0),
      m_axi_arprot(2 downto 0) => axi_protocol_converter_1_M_AXI_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => axi_protocol_converter_1_M_AXI_ARQOS(3 downto 0),
      m_axi_arready => axi_protocol_converter_1_M_AXI_ARREADY,
      m_axi_arsize(2 downto 0) => axi_protocol_converter_1_M_AXI_ARSIZE(2 downto 0),
      m_axi_aruser(5 downto 0) => NLW_axi_protocol_converter_1_m_axi_aruser_UNCONNECTED(5 downto 0),
      m_axi_arvalid => axi_protocol_converter_1_M_AXI_ARVALID,
      m_axi_awaddr(31 downto 0) => axi_protocol_converter_1_M_AXI_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => axi_protocol_converter_1_M_AXI_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => axi_protocol_converter_1_M_AXI_AWCACHE(3 downto 0),
      m_axi_awid(5 downto 0) => axi_protocol_converter_1_M_AXI_AWID(5 downto 0),
      m_axi_awlen(3 downto 0) => axi_protocol_converter_1_M_AXI_AWLEN(3 downto 0),
      m_axi_awlock(1 downto 0) => axi_protocol_converter_1_M_AXI_AWLOCK(1 downto 0),
      m_axi_awprot(2 downto 0) => axi_protocol_converter_1_M_AXI_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => axi_protocol_converter_1_M_AXI_AWQOS(3 downto 0),
      m_axi_awready => axi_protocol_converter_1_M_AXI_AWREADY,
      m_axi_awsize(2 downto 0) => axi_protocol_converter_1_M_AXI_AWSIZE(2 downto 0),
      m_axi_awuser(5 downto 0) => NLW_axi_protocol_converter_1_m_axi_awuser_UNCONNECTED(5 downto 0),
      m_axi_awvalid => axi_protocol_converter_1_M_AXI_AWVALID,
      m_axi_bid(5 downto 0) => axi_protocol_converter_1_M_AXI_BID(5 downto 0),
      m_axi_bready => axi_protocol_converter_1_M_AXI_BREADY,
      m_axi_bresp(1 downto 0) => axi_protocol_converter_1_M_AXI_BRESP(1 downto 0),
      m_axi_bvalid => axi_protocol_converter_1_M_AXI_BVALID,
      m_axi_rdata(63 downto 0) => axi_protocol_converter_1_M_AXI_RDATA(63 downto 0),
      m_axi_rid(5 downto 0) => axi_protocol_converter_1_M_AXI_RID(5 downto 0),
      m_axi_rlast => axi_protocol_converter_1_M_AXI_RLAST,
      m_axi_rready => axi_protocol_converter_1_M_AXI_RREADY,
      m_axi_rresp(1 downto 0) => axi_protocol_converter_1_M_AXI_RRESP(1 downto 0),
      m_axi_ruser(5 downto 0) => B"000000",
      m_axi_rvalid => axi_protocol_converter_1_M_AXI_RVALID,
      m_axi_wdata(63 downto 0) => axi_protocol_converter_1_M_AXI_WDATA(63 downto 0),
      m_axi_wid(5 downto 0) => NLW_axi_protocol_converter_1_m_axi_wid_UNCONNECTED(5 downto 0),
      m_axi_wlast => axi_protocol_converter_1_M_AXI_WLAST,
      m_axi_wready => axi_protocol_converter_1_M_AXI_WREADY,
      m_axi_wstrb(7 downto 0) => axi_protocol_converter_1_M_AXI_WSTRB(7 downto 0),
      m_axi_wuser(5 downto 0) => NLW_axi_protocol_converter_1_m_axi_wuser_UNCONNECTED(5 downto 0),
      m_axi_wvalid => axi_protocol_converter_1_M_AXI_WVALID,
      s_axi_araddr(31 downto 0) => nuraghe_soc_0_STDOUT_M_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => nuraghe_soc_0_STDOUT_M_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => nuraghe_soc_0_STDOUT_M_ARCACHE(3 downto 0),
      s_axi_arid(5 downto 4) => B"00",
      s_axi_arid(3 downto 0) => nuraghe_soc_0_STDOUT_M_ARID(3 downto 0),
      s_axi_arlen(7 downto 0) => nuraghe_soc_0_STDOUT_M_ARLEN(7 downto 0),
      s_axi_arlock(0) => nuraghe_soc_0_STDOUT_M_ARLOCK,
      s_axi_arprot(2 downto 0) => nuraghe_soc_0_STDOUT_M_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => nuraghe_soc_0_STDOUT_M_ARQOS(3 downto 0),
      s_axi_arready => nuraghe_soc_0_STDOUT_M_ARREADY,
      s_axi_arregion(3 downto 0) => nuraghe_soc_0_STDOUT_M_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => nuraghe_soc_0_STDOUT_M_ARSIZE(2 downto 0),
      s_axi_aruser(5 downto 0) => nuraghe_soc_0_STDOUT_M_ARUSER(5 downto 0),
      s_axi_arvalid => nuraghe_soc_0_STDOUT_M_ARVALID,
      s_axi_awaddr(31 downto 0) => nuraghe_soc_0_STDOUT_M_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => nuraghe_soc_0_STDOUT_M_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => nuraghe_soc_0_STDOUT_M_AWCACHE(3 downto 0),
      s_axi_awid(5 downto 4) => B"00",
      s_axi_awid(3 downto 0) => nuraghe_soc_0_STDOUT_M_AWID(3 downto 0),
      s_axi_awlen(7 downto 0) => nuraghe_soc_0_STDOUT_M_AWLEN(7 downto 0),
      s_axi_awlock(0) => nuraghe_soc_0_STDOUT_M_AWLOCK,
      s_axi_awprot(2 downto 0) => nuraghe_soc_0_STDOUT_M_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => nuraghe_soc_0_STDOUT_M_AWQOS(3 downto 0),
      s_axi_awready => nuraghe_soc_0_STDOUT_M_AWREADY,
      s_axi_awregion(3 downto 0) => nuraghe_soc_0_STDOUT_M_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => nuraghe_soc_0_STDOUT_M_AWSIZE(2 downto 0),
      s_axi_awuser(5 downto 0) => nuraghe_soc_0_STDOUT_M_AWUSER(5 downto 0),
      s_axi_awvalid => nuraghe_soc_0_STDOUT_M_AWVALID,
      s_axi_bid(5 downto 0) => nuraghe_soc_0_STDOUT_M_BID(5 downto 0),
      s_axi_bready => nuraghe_soc_0_STDOUT_M_BREADY,
      s_axi_bresp(1 downto 0) => nuraghe_soc_0_STDOUT_M_BRESP(1 downto 0),
      s_axi_bvalid => nuraghe_soc_0_STDOUT_M_BVALID,
      s_axi_rdata(63 downto 0) => nuraghe_soc_0_STDOUT_M_RDATA(63 downto 0),
      s_axi_rid(5 downto 0) => nuraghe_soc_0_STDOUT_M_RID(5 downto 0),
      s_axi_rlast => nuraghe_soc_0_STDOUT_M_RLAST,
      s_axi_rready => nuraghe_soc_0_STDOUT_M_RREADY,
      s_axi_rresp(1 downto 0) => nuraghe_soc_0_STDOUT_M_RRESP(1 downto 0),
      s_axi_ruser(5 downto 0) => nuraghe_soc_0_STDOUT_M_RUSER(5 downto 0),
      s_axi_rvalid => nuraghe_soc_0_STDOUT_M_RVALID,
      s_axi_wdata(63 downto 0) => nuraghe_soc_0_STDOUT_M_WDATA(63 downto 0),
      s_axi_wlast => nuraghe_soc_0_STDOUT_M_WLAST,
      s_axi_wready => nuraghe_soc_0_STDOUT_M_WREADY,
      s_axi_wstrb(7 downto 0) => nuraghe_soc_0_STDOUT_M_WSTRB(7 downto 0),
      s_axi_wuser(5 downto 0) => nuraghe_soc_0_STDOUT_M_WUSER(5 downto 0),
      s_axi_wvalid => nuraghe_soc_0_STDOUT_M_WVALID
    );
axi_protocol_converter_2: component base_zynq_design_axi_protocol_converter_0_1
     port map (
      aclk => clk_wiz_1_clk_out3,
      aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      m_axi_araddr(31 downto 0) => axi_protocol_converter_2_M_AXI_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => axi_protocol_converter_2_M_AXI_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => axi_protocol_converter_2_M_AXI_ARCACHE(3 downto 0),
      m_axi_arid(3 downto 0) => axi_protocol_converter_2_M_AXI_ARID(3 downto 0),
      m_axi_arlen(3 downto 0) => axi_protocol_converter_2_M_AXI_ARLEN(3 downto 0),
      m_axi_arlock(1 downto 0) => axi_protocol_converter_2_M_AXI_ARLOCK(1 downto 0),
      m_axi_arprot(2 downto 0) => axi_protocol_converter_2_M_AXI_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => axi_protocol_converter_2_M_AXI_ARQOS(3 downto 0),
      m_axi_arready => axi_protocol_converter_2_M_AXI_ARREADY,
      m_axi_arsize(2 downto 0) => axi_protocol_converter_2_M_AXI_ARSIZE(2 downto 0),
      m_axi_aruser(5 downto 0) => NLW_axi_protocol_converter_2_m_axi_aruser_UNCONNECTED(5 downto 0),
      m_axi_arvalid => axi_protocol_converter_2_M_AXI_ARVALID,
      m_axi_awaddr(31 downto 0) => axi_protocol_converter_2_M_AXI_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => axi_protocol_converter_2_M_AXI_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => axi_protocol_converter_2_M_AXI_AWCACHE(3 downto 0),
      m_axi_awid(3 downto 0) => axi_protocol_converter_2_M_AXI_AWID(3 downto 0),
      m_axi_awlen(3 downto 0) => axi_protocol_converter_2_M_AXI_AWLEN(3 downto 0),
      m_axi_awlock(1 downto 0) => axi_protocol_converter_2_M_AXI_AWLOCK(1 downto 0),
      m_axi_awprot(2 downto 0) => axi_protocol_converter_2_M_AXI_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => axi_protocol_converter_2_M_AXI_AWQOS(3 downto 0),
      m_axi_awready => axi_protocol_converter_2_M_AXI_AWREADY,
      m_axi_awsize(2 downto 0) => axi_protocol_converter_2_M_AXI_AWSIZE(2 downto 0),
      m_axi_awuser(5 downto 0) => NLW_axi_protocol_converter_2_m_axi_awuser_UNCONNECTED(5 downto 0),
      m_axi_awvalid => axi_protocol_converter_2_M_AXI_AWVALID,
      m_axi_bid(3 downto 0) => axi_protocol_converter_2_M_AXI_BID(3 downto 0),
      m_axi_bready => axi_protocol_converter_2_M_AXI_BREADY,
      m_axi_bresp(1 downto 0) => axi_protocol_converter_2_M_AXI_BRESP(1 downto 0),
      m_axi_bvalid => axi_protocol_converter_2_M_AXI_BVALID,
      m_axi_rdata(63 downto 0) => axi_protocol_converter_2_M_AXI_RDATA(63 downto 0),
      m_axi_rid(3 downto 0) => axi_protocol_converter_2_M_AXI_RID(3 downto 0),
      m_axi_rlast => axi_protocol_converter_2_M_AXI_RLAST,
      m_axi_rready => axi_protocol_converter_2_M_AXI_RREADY,
      m_axi_rresp(1 downto 0) => axi_protocol_converter_2_M_AXI_RRESP(1 downto 0),
      m_axi_ruser(5 downto 0) => B"000000",
      m_axi_rvalid => axi_protocol_converter_2_M_AXI_RVALID,
      m_axi_wdata(63 downto 0) => axi_protocol_converter_2_M_AXI_WDATA(63 downto 0),
      m_axi_wid(3 downto 0) => axi_protocol_converter_2_M_AXI_WID(3 downto 0),
      m_axi_wlast => axi_protocol_converter_2_M_AXI_WLAST,
      m_axi_wready => axi_protocol_converter_2_M_AXI_WREADY,
      m_axi_wstrb(7 downto 0) => axi_protocol_converter_2_M_AXI_WSTRB(7 downto 0),
      m_axi_wuser(5 downto 0) => NLW_axi_protocol_converter_2_m_axi_wuser_UNCONNECTED(5 downto 0),
      m_axi_wvalid => axi_protocol_converter_2_M_AXI_WVALID,
      s_axi_araddr(31 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARCACHE(3 downto 0),
      s_axi_arid(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARID(3 downto 0),
      s_axi_arlen(7 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARLEN(7 downto 0),
      s_axi_arlock(0) => nuraghe_soc_0_WEI_TO_DDR_ARLOCK,
      s_axi_arprot(2 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARQOS(3 downto 0),
      s_axi_arready => nuraghe_soc_0_WEI_TO_DDR_ARREADY,
      s_axi_arregion(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARSIZE(2 downto 0),
      s_axi_aruser(5 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARUSER(5 downto 0),
      s_axi_arvalid => nuraghe_soc_0_WEI_TO_DDR_ARVALID,
      s_axi_awaddr(31 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWCACHE(3 downto 0),
      s_axi_awid(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWID(3 downto 0),
      s_axi_awlen(7 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWLEN(7 downto 0),
      s_axi_awlock(0) => nuraghe_soc_0_WEI_TO_DDR_AWLOCK,
      s_axi_awprot(2 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWQOS(3 downto 0),
      s_axi_awready => nuraghe_soc_0_WEI_TO_DDR_AWREADY,
      s_axi_awregion(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWSIZE(2 downto 0),
      s_axi_awuser(5 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWUSER(5 downto 0),
      s_axi_awvalid => nuraghe_soc_0_WEI_TO_DDR_AWVALID,
      s_axi_bid(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_BID(3 downto 0),
      s_axi_bready => nuraghe_soc_0_WEI_TO_DDR_BREADY,
      s_axi_bresp(1 downto 0) => nuraghe_soc_0_WEI_TO_DDR_BRESP(1 downto 0),
      s_axi_bvalid => nuraghe_soc_0_WEI_TO_DDR_BVALID,
      s_axi_rdata(63 downto 0) => nuraghe_soc_0_WEI_TO_DDR_RDATA(63 downto 0),
      s_axi_rid(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_RID(3 downto 0),
      s_axi_rlast => nuraghe_soc_0_WEI_TO_DDR_RLAST,
      s_axi_rready => nuraghe_soc_0_WEI_TO_DDR_RREADY,
      s_axi_rresp(1 downto 0) => nuraghe_soc_0_WEI_TO_DDR_RRESP(1 downto 0),
      s_axi_ruser(5 downto 0) => nuraghe_soc_0_WEI_TO_DDR_RUSER(5 downto 0),
      s_axi_rvalid => nuraghe_soc_0_WEI_TO_DDR_RVALID,
      s_axi_wdata(63 downto 0) => nuraghe_soc_0_WEI_TO_DDR_WDATA(63 downto 0),
      s_axi_wlast => nuraghe_soc_0_WEI_TO_DDR_WLAST,
      s_axi_wready => nuraghe_soc_0_WEI_TO_DDR_WREADY,
      s_axi_wstrb(7 downto 0) => nuraghe_soc_0_WEI_TO_DDR_WSTRB(7 downto 0),
      s_axi_wuser(5 downto 0) => nuraghe_soc_0_WEI_TO_DDR_WUSER(5 downto 0),
      s_axi_wvalid => nuraghe_soc_0_WEI_TO_DDR_WVALID
    );
axi_protocol_converter_3: component base_zynq_design_axi_protocol_converter_3_0
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      m_axi_araddr(31 downto 0) => axi_protocol_converter_3_M_AXI_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => axi_protocol_converter_3_M_AXI_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => axi_protocol_converter_3_M_AXI_ARCACHE(3 downto 0),
      m_axi_arid(3 downto 0) => axi_protocol_converter_3_M_AXI_ARID(3 downto 0),
      m_axi_arlen(3 downto 0) => axi_protocol_converter_3_M_AXI_ARLEN(3 downto 0),
      m_axi_arlock(1 downto 0) => axi_protocol_converter_3_M_AXI_ARLOCK(1 downto 0),
      m_axi_arprot(2 downto 0) => axi_protocol_converter_3_M_AXI_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => axi_protocol_converter_3_M_AXI_ARQOS(3 downto 0),
      m_axi_arready => axi_protocol_converter_3_M_AXI_ARREADY,
      m_axi_arsize(2 downto 0) => axi_protocol_converter_3_M_AXI_ARSIZE(2 downto 0),
      m_axi_aruser(5 downto 0) => NLW_axi_protocol_converter_3_m_axi_aruser_UNCONNECTED(5 downto 0),
      m_axi_arvalid => axi_protocol_converter_3_M_AXI_ARVALID,
      m_axi_awaddr(31 downto 0) => axi_protocol_converter_3_M_AXI_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => axi_protocol_converter_3_M_AXI_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => axi_protocol_converter_3_M_AXI_AWCACHE(3 downto 0),
      m_axi_awid(3 downto 0) => axi_protocol_converter_3_M_AXI_AWID(3 downto 0),
      m_axi_awlen(3 downto 0) => axi_protocol_converter_3_M_AXI_AWLEN(3 downto 0),
      m_axi_awlock(1 downto 0) => axi_protocol_converter_3_M_AXI_AWLOCK(1 downto 0),
      m_axi_awprot(2 downto 0) => axi_protocol_converter_3_M_AXI_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => axi_protocol_converter_3_M_AXI_AWQOS(3 downto 0),
      m_axi_awready => axi_protocol_converter_3_M_AXI_AWREADY,
      m_axi_awsize(2 downto 0) => axi_protocol_converter_3_M_AXI_AWSIZE(2 downto 0),
      m_axi_awuser(5 downto 0) => NLW_axi_protocol_converter_3_m_axi_awuser_UNCONNECTED(5 downto 0),
      m_axi_awvalid => axi_protocol_converter_3_M_AXI_AWVALID,
      m_axi_bid(3 downto 0) => axi_protocol_converter_3_M_AXI_BID(3 downto 0),
      m_axi_bready => axi_protocol_converter_3_M_AXI_BREADY,
      m_axi_bresp(1 downto 0) => axi_protocol_converter_3_M_AXI_BRESP(1 downto 0),
      m_axi_bvalid => axi_protocol_converter_3_M_AXI_BVALID,
      m_axi_rdata(63 downto 0) => axi_protocol_converter_3_M_AXI_RDATA(63 downto 0),
      m_axi_rid(3 downto 0) => axi_protocol_converter_3_M_AXI_RID(3 downto 0),
      m_axi_rlast => axi_protocol_converter_3_M_AXI_RLAST,
      m_axi_rready => axi_protocol_converter_3_M_AXI_RREADY,
      m_axi_rresp(1 downto 0) => axi_protocol_converter_3_M_AXI_RRESP(1 downto 0),
      m_axi_ruser(5 downto 0) => B"000000",
      m_axi_rvalid => axi_protocol_converter_3_M_AXI_RVALID,
      m_axi_wdata(63 downto 0) => axi_protocol_converter_3_M_AXI_WDATA(63 downto 0),
      m_axi_wid(3 downto 0) => axi_protocol_converter_3_M_AXI_WID(3 downto 0),
      m_axi_wlast => axi_protocol_converter_3_M_AXI_WLAST,
      m_axi_wready => axi_protocol_converter_3_M_AXI_WREADY,
      m_axi_wstrb(7 downto 0) => axi_protocol_converter_3_M_AXI_WSTRB(7 downto 0),
      m_axi_wuser(5 downto 0) => NLW_axi_protocol_converter_3_m_axi_wuser_UNCONNECTED(5 downto 0),
      m_axi_wvalid => axi_protocol_converter_3_M_AXI_WVALID,
      s_axi_araddr(31 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARCACHE(3 downto 0),
      s_axi_arid(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARID(3 downto 0),
      s_axi_arlen(7 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARLEN(7 downto 0),
      s_axi_arlock(0) => nuraghe_soc_0_DMA_TO_DDR_M_ARLOCK,
      s_axi_arprot(2 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARQOS(3 downto 0),
      s_axi_arready => nuraghe_soc_0_DMA_TO_DDR_M_ARREADY,
      s_axi_arregion(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARSIZE(2 downto 0),
      s_axi_aruser(5 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARUSER(5 downto 0),
      s_axi_arvalid => nuraghe_soc_0_DMA_TO_DDR_M_ARVALID,
      s_axi_awaddr(31 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWCACHE(3 downto 0),
      s_axi_awid(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWID(3 downto 0),
      s_axi_awlen(7 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWLEN(7 downto 0),
      s_axi_awlock(0) => nuraghe_soc_0_DMA_TO_DDR_M_AWLOCK,
      s_axi_awprot(2 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWQOS(3 downto 0),
      s_axi_awready => nuraghe_soc_0_DMA_TO_DDR_M_AWREADY,
      s_axi_awregion(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWSIZE(2 downto 0),
      s_axi_awuser(5 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWUSER(5 downto 0),
      s_axi_awvalid => nuraghe_soc_0_DMA_TO_DDR_M_AWVALID,
      s_axi_bid(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_BID(3 downto 0),
      s_axi_bready => nuraghe_soc_0_DMA_TO_DDR_M_BREADY,
      s_axi_bresp(1 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_BRESP(1 downto 0),
      s_axi_bvalid => nuraghe_soc_0_DMA_TO_DDR_M_BVALID,
      s_axi_rdata(63 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_RDATA(63 downto 0),
      s_axi_rid(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_RID(3 downto 0),
      s_axi_rlast => nuraghe_soc_0_DMA_TO_DDR_M_RLAST,
      s_axi_rready => nuraghe_soc_0_DMA_TO_DDR_M_RREADY,
      s_axi_rresp(1 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_RRESP(1 downto 0),
      s_axi_ruser(5 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_RUSER(5 downto 0),
      s_axi_rvalid => nuraghe_soc_0_DMA_TO_DDR_M_RVALID,
      s_axi_wdata(63 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_WDATA(63 downto 0),
      s_axi_wlast => nuraghe_soc_0_DMA_TO_DDR_M_WLAST,
      s_axi_wready => nuraghe_soc_0_DMA_TO_DDR_M_WREADY,
      s_axi_wstrb(7 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_WSTRB(7 downto 0),
      s_axi_wuser(5 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_WUSER(5 downto 0),
      s_axi_wvalid => nuraghe_soc_0_DMA_TO_DDR_M_WVALID
    );
clk_wiz_1: component base_zynq_design_clk_wiz_1_0
     port map (
      clk_in1 => processing_system7_0_FCLK_CLK2,
      clk_out1 => processing_system7_0_FCLK_CLK0,
      clk_out2 => clk_wiz_1_clk_out2,
      clk_out3 => clk_wiz_1_clk_out3,
      locked => clk_wiz_1_locked,
      resetn => processing_system7_0_FCLK_RESET0_N
    );
nuraghe_soc_0: component base_zynq_design_nuraghe_soc_0_0
     port map (
      clk_cluster_fast_i => clk_wiz_1_clk_out2,
      clk_soc_i => processing_system7_0_FCLK_CLK0,
      clk_wmem_i => clk_wiz_1_clk_out3,
      dma2ddr_bus_ar_addr(31 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARADDR(31 downto 0),
      dma2ddr_bus_ar_burst(1 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARBURST(1 downto 0),
      dma2ddr_bus_ar_cache(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARCACHE(3 downto 0),
      dma2ddr_bus_ar_id(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARID(3 downto 0),
      dma2ddr_bus_ar_len(7 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARLEN(7 downto 0),
      dma2ddr_bus_ar_lock => nuraghe_soc_0_DMA_TO_DDR_M_ARLOCK,
      dma2ddr_bus_ar_prot(2 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARPROT(2 downto 0),
      dma2ddr_bus_ar_qos(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARQOS(3 downto 0),
      dma2ddr_bus_ar_ready => nuraghe_soc_0_DMA_TO_DDR_M_ARREADY,
      dma2ddr_bus_ar_region(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARREGION(3 downto 0),
      dma2ddr_bus_ar_size(2 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARSIZE(2 downto 0),
      dma2ddr_bus_ar_user(5 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_ARUSER(5 downto 0),
      dma2ddr_bus_ar_valid => nuraghe_soc_0_DMA_TO_DDR_M_ARVALID,
      dma2ddr_bus_aw_addr(31 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWADDR(31 downto 0),
      dma2ddr_bus_aw_burst(1 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWBURST(1 downto 0),
      dma2ddr_bus_aw_cache(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWCACHE(3 downto 0),
      dma2ddr_bus_aw_id(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWID(3 downto 0),
      dma2ddr_bus_aw_len(7 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWLEN(7 downto 0),
      dma2ddr_bus_aw_lock => nuraghe_soc_0_DMA_TO_DDR_M_AWLOCK,
      dma2ddr_bus_aw_prot(2 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWPROT(2 downto 0),
      dma2ddr_bus_aw_qos(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWQOS(3 downto 0),
      dma2ddr_bus_aw_ready => nuraghe_soc_0_DMA_TO_DDR_M_AWREADY,
      dma2ddr_bus_aw_region(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWREGION(3 downto 0),
      dma2ddr_bus_aw_size(2 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWSIZE(2 downto 0),
      dma2ddr_bus_aw_user(5 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_AWUSER(5 downto 0),
      dma2ddr_bus_aw_valid => nuraghe_soc_0_DMA_TO_DDR_M_AWVALID,
      dma2ddr_bus_b_id(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_BID(3 downto 0),
      dma2ddr_bus_b_ready => nuraghe_soc_0_DMA_TO_DDR_M_BREADY,
      dma2ddr_bus_b_resp(1 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_BRESP(1 downto 0),
      dma2ddr_bus_b_user(5 downto 0) => B"000000",
      dma2ddr_bus_b_valid => nuraghe_soc_0_DMA_TO_DDR_M_BVALID,
      dma2ddr_bus_r_data(63 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_RDATA(63 downto 0),
      dma2ddr_bus_r_id(3 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_RID(3 downto 0),
      dma2ddr_bus_r_last => nuraghe_soc_0_DMA_TO_DDR_M_RLAST,
      dma2ddr_bus_r_ready => nuraghe_soc_0_DMA_TO_DDR_M_RREADY,
      dma2ddr_bus_r_resp(1 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_RRESP(1 downto 0),
      dma2ddr_bus_r_user(5 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_RUSER(5 downto 0),
      dma2ddr_bus_r_valid => nuraghe_soc_0_DMA_TO_DDR_M_RVALID,
      dma2ddr_bus_w_data(63 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_WDATA(63 downto 0),
      dma2ddr_bus_w_last => nuraghe_soc_0_DMA_TO_DDR_M_WLAST,
      dma2ddr_bus_w_ready => nuraghe_soc_0_DMA_TO_DDR_M_WREADY,
      dma2ddr_bus_w_strb(7 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_WSTRB(7 downto 0),
      dma2ddr_bus_w_user(5 downto 0) => nuraghe_soc_0_DMA_TO_DDR_M_WUSER(5 downto 0),
      dma2ddr_bus_w_valid => nuraghe_soc_0_DMA_TO_DDR_M_WVALID,
      eoc_o => nuraghe_soc_0_eoc_o,
      fetch_en_i => soc_AXI_ctrl_v1_0_0_fech_enable_o,
      from_ps_bus_ar_addr(31 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARADDR(31 downto 0),
      from_ps_bus_ar_burst(1 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARBURST(1 downto 0),
      from_ps_bus_ar_cache(3 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARCACHE(3 downto 0),
      from_ps_bus_ar_id(9 downto 0) => B"0000000000",
      from_ps_bus_ar_len(7 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARLEN(7 downto 0),
      from_ps_bus_ar_lock => processing_system7_0_axi_periph_M01_AXI_ARLOCK,
      from_ps_bus_ar_prot(2 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARPROT(2 downto 0),
      from_ps_bus_ar_qos(3 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARQOS(3 downto 0),
      from_ps_bus_ar_ready => processing_system7_0_axi_periph_M01_AXI_ARREADY,
      from_ps_bus_ar_region(3 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARREGION(3 downto 0),
      from_ps_bus_ar_size(2 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARSIZE(2 downto 0),
      from_ps_bus_ar_user(5 downto 0) => B"000000",
      from_ps_bus_ar_valid => processing_system7_0_axi_periph_M01_AXI_ARVALID,
      from_ps_bus_aw_addr(31 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWADDR(31 downto 0),
      from_ps_bus_aw_burst(1 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWBURST(1 downto 0),
      from_ps_bus_aw_cache(3 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWCACHE(3 downto 0),
      from_ps_bus_aw_id(9 downto 0) => B"0000000000",
      from_ps_bus_aw_len(7 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWLEN(7 downto 0),
      from_ps_bus_aw_lock => processing_system7_0_axi_periph_M01_AXI_AWLOCK,
      from_ps_bus_aw_prot(2 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWPROT(2 downto 0),
      from_ps_bus_aw_qos(3 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWQOS(3 downto 0),
      from_ps_bus_aw_ready => processing_system7_0_axi_periph_M01_AXI_AWREADY,
      from_ps_bus_aw_region(3 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWREGION(3 downto 0),
      from_ps_bus_aw_size(2 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWSIZE(2 downto 0),
      from_ps_bus_aw_user(5 downto 0) => B"000000",
      from_ps_bus_aw_valid => processing_system7_0_axi_periph_M01_AXI_AWVALID,
      from_ps_bus_b_id(9 downto 0) => NLW_nuraghe_soc_0_from_ps_bus_b_id_UNCONNECTED(9 downto 0),
      from_ps_bus_b_ready => processing_system7_0_axi_periph_M01_AXI_BREADY,
      from_ps_bus_b_resp(1 downto 0) => processing_system7_0_axi_periph_M01_AXI_BRESP(1 downto 0),
      from_ps_bus_b_user(5 downto 0) => NLW_nuraghe_soc_0_from_ps_bus_b_user_UNCONNECTED(5 downto 0),
      from_ps_bus_b_valid => processing_system7_0_axi_periph_M01_AXI_BVALID,
      from_ps_bus_r_data(63 downto 0) => processing_system7_0_axi_periph_M01_AXI_RDATA(63 downto 0),
      from_ps_bus_r_id(9 downto 0) => NLW_nuraghe_soc_0_from_ps_bus_r_id_UNCONNECTED(9 downto 0),
      from_ps_bus_r_last => processing_system7_0_axi_periph_M01_AXI_RLAST,
      from_ps_bus_r_ready => processing_system7_0_axi_periph_M01_AXI_RREADY,
      from_ps_bus_r_resp(1 downto 0) => processing_system7_0_axi_periph_M01_AXI_RRESP(1 downto 0),
      from_ps_bus_r_user(5 downto 0) => NLW_nuraghe_soc_0_from_ps_bus_r_user_UNCONNECTED(5 downto 0),
      from_ps_bus_r_valid => processing_system7_0_axi_periph_M01_AXI_RVALID,
      from_ps_bus_w_data(63 downto 0) => processing_system7_0_axi_periph_M01_AXI_WDATA(63 downto 0),
      from_ps_bus_w_last => processing_system7_0_axi_periph_M01_AXI_WLAST,
      from_ps_bus_w_ready => processing_system7_0_axi_periph_M01_AXI_WREADY,
      from_ps_bus_w_strb(7 downto 0) => processing_system7_0_axi_periph_M01_AXI_WSTRB(7 downto 0),
      from_ps_bus_w_user(5 downto 0) => B"000000",
      from_ps_bus_w_valid => processing_system7_0_axi_periph_M01_AXI_WVALID,
      mode_select_i => soc_AXI_ctrl_v1_0_0_mode_select_o,
      return_o(1 downto 0) => nuraghe_soc_0_return_o(1 downto 0),
      rstn_sync_i => rst_processing_system7_0_50M_peripheral_aresetn(0),
      stdout_master_ar_addr(31 downto 0) => nuraghe_soc_0_STDOUT_M_ARADDR(31 downto 0),
      stdout_master_ar_burst(1 downto 0) => nuraghe_soc_0_STDOUT_M_ARBURST(1 downto 0),
      stdout_master_ar_cache(3 downto 0) => nuraghe_soc_0_STDOUT_M_ARCACHE(3 downto 0),
      stdout_master_ar_id(3 downto 0) => nuraghe_soc_0_STDOUT_M_ARID(3 downto 0),
      stdout_master_ar_len(7 downto 0) => nuraghe_soc_0_STDOUT_M_ARLEN(7 downto 0),
      stdout_master_ar_lock => nuraghe_soc_0_STDOUT_M_ARLOCK,
      stdout_master_ar_prot(2 downto 0) => nuraghe_soc_0_STDOUT_M_ARPROT(2 downto 0),
      stdout_master_ar_qos(3 downto 0) => nuraghe_soc_0_STDOUT_M_ARQOS(3 downto 0),
      stdout_master_ar_ready => nuraghe_soc_0_STDOUT_M_ARREADY,
      stdout_master_ar_region(3 downto 0) => nuraghe_soc_0_STDOUT_M_ARREGION(3 downto 0),
      stdout_master_ar_size(2 downto 0) => nuraghe_soc_0_STDOUT_M_ARSIZE(2 downto 0),
      stdout_master_ar_user(5 downto 0) => nuraghe_soc_0_STDOUT_M_ARUSER(5 downto 0),
      stdout_master_ar_valid => nuraghe_soc_0_STDOUT_M_ARVALID,
      stdout_master_aw_addr(31 downto 0) => nuraghe_soc_0_STDOUT_M_AWADDR(31 downto 0),
      stdout_master_aw_burst(1 downto 0) => nuraghe_soc_0_STDOUT_M_AWBURST(1 downto 0),
      stdout_master_aw_cache(3 downto 0) => nuraghe_soc_0_STDOUT_M_AWCACHE(3 downto 0),
      stdout_master_aw_id(3 downto 0) => nuraghe_soc_0_STDOUT_M_AWID(3 downto 0),
      stdout_master_aw_len(7 downto 0) => nuraghe_soc_0_STDOUT_M_AWLEN(7 downto 0),
      stdout_master_aw_lock => nuraghe_soc_0_STDOUT_M_AWLOCK,
      stdout_master_aw_prot(2 downto 0) => nuraghe_soc_0_STDOUT_M_AWPROT(2 downto 0),
      stdout_master_aw_qos(3 downto 0) => nuraghe_soc_0_STDOUT_M_AWQOS(3 downto 0),
      stdout_master_aw_ready => nuraghe_soc_0_STDOUT_M_AWREADY,
      stdout_master_aw_region(3 downto 0) => nuraghe_soc_0_STDOUT_M_AWREGION(3 downto 0),
      stdout_master_aw_size(2 downto 0) => nuraghe_soc_0_STDOUT_M_AWSIZE(2 downto 0),
      stdout_master_aw_user(5 downto 0) => nuraghe_soc_0_STDOUT_M_AWUSER(5 downto 0),
      stdout_master_aw_valid => nuraghe_soc_0_STDOUT_M_AWVALID,
      stdout_master_b_id(3 downto 0) => nuraghe_soc_0_STDOUT_M_BID(3 downto 0),
      stdout_master_b_ready => nuraghe_soc_0_STDOUT_M_BREADY,
      stdout_master_b_resp(1 downto 0) => nuraghe_soc_0_STDOUT_M_BRESP(1 downto 0),
      stdout_master_b_user(5 downto 0) => B"000000",
      stdout_master_b_valid => nuraghe_soc_0_STDOUT_M_BVALID,
      stdout_master_r_data(63 downto 0) => nuraghe_soc_0_STDOUT_M_RDATA(63 downto 0),
      stdout_master_r_id(3 downto 0) => nuraghe_soc_0_STDOUT_M_RID(3 downto 0),
      stdout_master_r_last => nuraghe_soc_0_STDOUT_M_RLAST,
      stdout_master_r_ready => nuraghe_soc_0_STDOUT_M_RREADY,
      stdout_master_r_resp(1 downto 0) => nuraghe_soc_0_STDOUT_M_RRESP(1 downto 0),
      stdout_master_r_user(5 downto 0) => nuraghe_soc_0_STDOUT_M_RUSER(5 downto 0),
      stdout_master_r_valid => nuraghe_soc_0_STDOUT_M_RVALID,
      stdout_master_w_data(63 downto 0) => nuraghe_soc_0_STDOUT_M_WDATA(63 downto 0),
      stdout_master_w_last => nuraghe_soc_0_STDOUT_M_WLAST,
      stdout_master_w_ready => nuraghe_soc_0_STDOUT_M_WREADY,
      stdout_master_w_strb(7 downto 0) => nuraghe_soc_0_STDOUT_M_WSTRB(7 downto 0),
      stdout_master_w_user(5 downto 0) => nuraghe_soc_0_STDOUT_M_WUSER(5 downto 0),
      stdout_master_w_valid => nuraghe_soc_0_STDOUT_M_WVALID,
      test_mode_i => soc_AXI_ctrl_v1_0_0_test_mode_o,
      to_ps_bus_ar_addr(31 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARADDR(31 downto 0),
      to_ps_bus_ar_burst(1 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARBURST(1 downto 0),
      to_ps_bus_ar_cache(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARCACHE(3 downto 0),
      to_ps_bus_ar_id(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARID(3 downto 0),
      to_ps_bus_ar_len(7 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARLEN(7 downto 0),
      to_ps_bus_ar_lock => nuraghe_soc_0_DATA_OUT_M_ARLOCK,
      to_ps_bus_ar_prot(2 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARPROT(2 downto 0),
      to_ps_bus_ar_qos(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARQOS(3 downto 0),
      to_ps_bus_ar_ready => nuraghe_soc_0_DATA_OUT_M_ARREADY,
      to_ps_bus_ar_region(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARREGION(3 downto 0),
      to_ps_bus_ar_size(2 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARSIZE(2 downto 0),
      to_ps_bus_ar_user(5 downto 0) => nuraghe_soc_0_DATA_OUT_M_ARUSER(5 downto 0),
      to_ps_bus_ar_valid => nuraghe_soc_0_DATA_OUT_M_ARVALID,
      to_ps_bus_aw_addr(31 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWADDR(31 downto 0),
      to_ps_bus_aw_burst(1 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWBURST(1 downto 0),
      to_ps_bus_aw_cache(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWCACHE(3 downto 0),
      to_ps_bus_aw_id(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWID(3 downto 0),
      to_ps_bus_aw_len(7 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWLEN(7 downto 0),
      to_ps_bus_aw_lock => nuraghe_soc_0_DATA_OUT_M_AWLOCK,
      to_ps_bus_aw_prot(2 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWPROT(2 downto 0),
      to_ps_bus_aw_qos(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWQOS(3 downto 0),
      to_ps_bus_aw_ready => nuraghe_soc_0_DATA_OUT_M_AWREADY,
      to_ps_bus_aw_region(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWREGION(3 downto 0),
      to_ps_bus_aw_size(2 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWSIZE(2 downto 0),
      to_ps_bus_aw_user(5 downto 0) => nuraghe_soc_0_DATA_OUT_M_AWUSER(5 downto 0),
      to_ps_bus_aw_valid => nuraghe_soc_0_DATA_OUT_M_AWVALID,
      to_ps_bus_b_id(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_BID(3 downto 0),
      to_ps_bus_b_ready => nuraghe_soc_0_DATA_OUT_M_BREADY,
      to_ps_bus_b_resp(1 downto 0) => nuraghe_soc_0_DATA_OUT_M_BRESP(1 downto 0),
      to_ps_bus_b_user(5 downto 0) => B"000000",
      to_ps_bus_b_valid => nuraghe_soc_0_DATA_OUT_M_BVALID,
      to_ps_bus_r_data(63 downto 0) => nuraghe_soc_0_DATA_OUT_M_RDATA(63 downto 0),
      to_ps_bus_r_id(3 downto 0) => nuraghe_soc_0_DATA_OUT_M_RID(3 downto 0),
      to_ps_bus_r_last => nuraghe_soc_0_DATA_OUT_M_RLAST,
      to_ps_bus_r_ready => nuraghe_soc_0_DATA_OUT_M_RREADY,
      to_ps_bus_r_resp(1 downto 0) => nuraghe_soc_0_DATA_OUT_M_RRESP(1 downto 0),
      to_ps_bus_r_user(5 downto 0) => nuraghe_soc_0_DATA_OUT_M_RUSER(5 downto 0),
      to_ps_bus_r_valid => nuraghe_soc_0_DATA_OUT_M_RVALID,
      to_ps_bus_w_data(63 downto 0) => nuraghe_soc_0_DATA_OUT_M_WDATA(63 downto 0),
      to_ps_bus_w_last => nuraghe_soc_0_DATA_OUT_M_WLAST,
      to_ps_bus_w_ready => nuraghe_soc_0_DATA_OUT_M_WREADY,
      to_ps_bus_w_strb(7 downto 0) => nuraghe_soc_0_DATA_OUT_M_WSTRB(7 downto 0),
      to_ps_bus_w_user(5 downto 0) => nuraghe_soc_0_DATA_OUT_M_WUSER(5 downto 0),
      to_ps_bus_w_valid => nuraghe_soc_0_DATA_OUT_M_WVALID,
      wei2ddr_bus_ar_addr(31 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARADDR(31 downto 0),
      wei2ddr_bus_ar_burst(1 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARBURST(1 downto 0),
      wei2ddr_bus_ar_cache(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARCACHE(3 downto 0),
      wei2ddr_bus_ar_id(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARID(3 downto 0),
      wei2ddr_bus_ar_len(7 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARLEN(7 downto 0),
      wei2ddr_bus_ar_lock => nuraghe_soc_0_WEI_TO_DDR_ARLOCK,
      wei2ddr_bus_ar_prot(2 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARPROT(2 downto 0),
      wei2ddr_bus_ar_qos(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARQOS(3 downto 0),
      wei2ddr_bus_ar_ready => nuraghe_soc_0_WEI_TO_DDR_ARREADY,
      wei2ddr_bus_ar_region(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARREGION(3 downto 0),
      wei2ddr_bus_ar_size(2 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARSIZE(2 downto 0),
      wei2ddr_bus_ar_user(5 downto 0) => nuraghe_soc_0_WEI_TO_DDR_ARUSER(5 downto 0),
      wei2ddr_bus_ar_valid => nuraghe_soc_0_WEI_TO_DDR_ARVALID,
      wei2ddr_bus_aw_addr(31 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWADDR(31 downto 0),
      wei2ddr_bus_aw_burst(1 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWBURST(1 downto 0),
      wei2ddr_bus_aw_cache(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWCACHE(3 downto 0),
      wei2ddr_bus_aw_id(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWID(3 downto 0),
      wei2ddr_bus_aw_len(7 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWLEN(7 downto 0),
      wei2ddr_bus_aw_lock => nuraghe_soc_0_WEI_TO_DDR_AWLOCK,
      wei2ddr_bus_aw_prot(2 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWPROT(2 downto 0),
      wei2ddr_bus_aw_qos(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWQOS(3 downto 0),
      wei2ddr_bus_aw_ready => nuraghe_soc_0_WEI_TO_DDR_AWREADY,
      wei2ddr_bus_aw_region(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWREGION(3 downto 0),
      wei2ddr_bus_aw_size(2 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWSIZE(2 downto 0),
      wei2ddr_bus_aw_user(5 downto 0) => nuraghe_soc_0_WEI_TO_DDR_AWUSER(5 downto 0),
      wei2ddr_bus_aw_valid => nuraghe_soc_0_WEI_TO_DDR_AWVALID,
      wei2ddr_bus_b_id(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_BID(3 downto 0),
      wei2ddr_bus_b_ready => nuraghe_soc_0_WEI_TO_DDR_BREADY,
      wei2ddr_bus_b_resp(1 downto 0) => nuraghe_soc_0_WEI_TO_DDR_BRESP(1 downto 0),
      wei2ddr_bus_b_user(5 downto 0) => B"000000",
      wei2ddr_bus_b_valid => nuraghe_soc_0_WEI_TO_DDR_BVALID,
      wei2ddr_bus_r_data(63 downto 0) => nuraghe_soc_0_WEI_TO_DDR_RDATA(63 downto 0),
      wei2ddr_bus_r_id(3 downto 0) => nuraghe_soc_0_WEI_TO_DDR_RID(3 downto 0),
      wei2ddr_bus_r_last => nuraghe_soc_0_WEI_TO_DDR_RLAST,
      wei2ddr_bus_r_ready => nuraghe_soc_0_WEI_TO_DDR_RREADY,
      wei2ddr_bus_r_resp(1 downto 0) => nuraghe_soc_0_WEI_TO_DDR_RRESP(1 downto 0),
      wei2ddr_bus_r_user(5 downto 0) => nuraghe_soc_0_WEI_TO_DDR_RUSER(5 downto 0),
      wei2ddr_bus_r_valid => nuraghe_soc_0_WEI_TO_DDR_RVALID,
      wei2ddr_bus_w_data(63 downto 0) => nuraghe_soc_0_WEI_TO_DDR_WDATA(63 downto 0),
      wei2ddr_bus_w_last => nuraghe_soc_0_WEI_TO_DDR_WLAST,
      wei2ddr_bus_w_ready => nuraghe_soc_0_WEI_TO_DDR_WREADY,
      wei2ddr_bus_w_strb(7 downto 0) => nuraghe_soc_0_WEI_TO_DDR_WSTRB(7 downto 0),
      wei2ddr_bus_w_user(5 downto 0) => nuraghe_soc_0_WEI_TO_DDR_WUSER(5 downto 0),
      wei2ddr_bus_w_valid => nuraghe_soc_0_WEI_TO_DDR_WVALID
    );
processing_system7_0: component base_zynq_design_processing_system7_0_0
     port map (
      DDR_Addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_BankAddr(2 downto 0) => DDR_ba(2 downto 0),
      DDR_CAS_n => DDR_cas_n,
      DDR_CKE => DDR_cke,
      DDR_CS_n => DDR_cs_n,
      DDR_Clk => DDR_ck_p,
      DDR_Clk_n => DDR_ck_n,
      DDR_DM(3 downto 0) => DDR_dm(3 downto 0),
      DDR_DQ(31 downto 0) => DDR_dq(31 downto 0),
      DDR_DQS(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_DQS_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_DRSTB => DDR_reset_n,
      DDR_ODT => DDR_odt,
      DDR_RAS_n => DDR_ras_n,
      DDR_VRN => FIXED_IO_ddr_vrn,
      DDR_VRP => FIXED_IO_ddr_vrp,
      DDR_WEB => DDR_we_n,
      FCLK_CLK0 => processing_system7_0_FCLK_CLK2,
      FCLK_RESET0_N => processing_system7_0_FCLK_RESET0_N,
      MIO(53 downto 0) => FIXED_IO_mio(53 downto 0),
      M_AXI_GP0_ACLK => processing_system7_0_FCLK_CLK0,
      M_AXI_GP0_ARADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      M_AXI_GP0_ARBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      M_AXI_GP0_ARCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      M_AXI_GP0_ARID(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      M_AXI_GP0_ARLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      M_AXI_GP0_ARLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      M_AXI_GP0_ARPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      M_AXI_GP0_ARQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      M_AXI_GP0_ARREADY => processing_system7_0_M_AXI_GP0_ARREADY,
      M_AXI_GP0_ARSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      M_AXI_GP0_ARVALID => processing_system7_0_M_AXI_GP0_ARVALID,
      M_AXI_GP0_AWADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      M_AXI_GP0_AWBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      M_AXI_GP0_AWCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      M_AXI_GP0_AWID(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      M_AXI_GP0_AWLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      M_AXI_GP0_AWLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      M_AXI_GP0_AWPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      M_AXI_GP0_AWQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      M_AXI_GP0_AWREADY => processing_system7_0_M_AXI_GP0_AWREADY,
      M_AXI_GP0_AWSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      M_AXI_GP0_AWVALID => processing_system7_0_M_AXI_GP0_AWVALID,
      M_AXI_GP0_BID(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      M_AXI_GP0_BREADY => processing_system7_0_M_AXI_GP0_BREADY,
      M_AXI_GP0_BRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      M_AXI_GP0_BVALID => processing_system7_0_M_AXI_GP0_BVALID,
      M_AXI_GP0_RDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      M_AXI_GP0_RID(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      M_AXI_GP0_RLAST => processing_system7_0_M_AXI_GP0_RLAST,
      M_AXI_GP0_RREADY => processing_system7_0_M_AXI_GP0_RREADY,
      M_AXI_GP0_RRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      M_AXI_GP0_RVALID => processing_system7_0_M_AXI_GP0_RVALID,
      M_AXI_GP0_WDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      M_AXI_GP0_WID(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      M_AXI_GP0_WLAST => processing_system7_0_M_AXI_GP0_WLAST,
      M_AXI_GP0_WREADY => processing_system7_0_M_AXI_GP0_WREADY,
      M_AXI_GP0_WSTRB(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      M_AXI_GP0_WVALID => processing_system7_0_M_AXI_GP0_WVALID,
      PS_CLK => FIXED_IO_ps_clk,
      PS_PORB => FIXED_IO_ps_porb,
      PS_SRSTB => FIXED_IO_ps_srstb,
      S_AXI_GP0_ACLK => processing_system7_0_FCLK_CLK0,
      S_AXI_GP0_ARADDR(31 downto 0) => axi_dwidth_converter_0_M_AXI_ARADDR(31 downto 0),
      S_AXI_GP0_ARBURST(1 downto 0) => axi_dwidth_converter_0_M_AXI_ARBURST(1 downto 0),
      S_AXI_GP0_ARCACHE(3 downto 0) => axi_dwidth_converter_0_M_AXI_ARCACHE(3 downto 0),
      S_AXI_GP0_ARID(5 downto 0) => B"000000",
      S_AXI_GP0_ARLEN(3 downto 0) => axi_dwidth_converter_0_M_AXI_ARLEN(3 downto 0),
      S_AXI_GP0_ARLOCK(1 downto 0) => axi_dwidth_converter_0_M_AXI_ARLOCK(1 downto 0),
      S_AXI_GP0_ARPROT(2 downto 0) => axi_dwidth_converter_0_M_AXI_ARPROT(2 downto 0),
      S_AXI_GP0_ARQOS(3 downto 0) => axi_dwidth_converter_0_M_AXI_ARQOS(3 downto 0),
      S_AXI_GP0_ARREADY => axi_dwidth_converter_0_M_AXI_ARREADY,
      S_AXI_GP0_ARSIZE(2 downto 0) => axi_dwidth_converter_0_M_AXI_ARSIZE(2 downto 0),
      S_AXI_GP0_ARVALID => axi_dwidth_converter_0_M_AXI_ARVALID,
      S_AXI_GP0_AWADDR(31 downto 0) => axi_dwidth_converter_0_M_AXI_AWADDR(31 downto 0),
      S_AXI_GP0_AWBURST(1 downto 0) => axi_dwidth_converter_0_M_AXI_AWBURST(1 downto 0),
      S_AXI_GP0_AWCACHE(3 downto 0) => axi_dwidth_converter_0_M_AXI_AWCACHE(3 downto 0),
      S_AXI_GP0_AWID(5 downto 0) => B"000000",
      S_AXI_GP0_AWLEN(3 downto 0) => axi_dwidth_converter_0_M_AXI_AWLEN(3 downto 0),
      S_AXI_GP0_AWLOCK(1 downto 0) => axi_dwidth_converter_0_M_AXI_AWLOCK(1 downto 0),
      S_AXI_GP0_AWPROT(2 downto 0) => axi_dwidth_converter_0_M_AXI_AWPROT(2 downto 0),
      S_AXI_GP0_AWQOS(3 downto 0) => axi_dwidth_converter_0_M_AXI_AWQOS(3 downto 0),
      S_AXI_GP0_AWREADY => axi_dwidth_converter_0_M_AXI_AWREADY,
      S_AXI_GP0_AWSIZE(2 downto 0) => axi_dwidth_converter_0_M_AXI_AWSIZE(2 downto 0),
      S_AXI_GP0_AWVALID => axi_dwidth_converter_0_M_AXI_AWVALID,
      S_AXI_GP0_BID(5 downto 0) => NLW_processing_system7_0_S_AXI_GP0_BID_UNCONNECTED(5 downto 0),
      S_AXI_GP0_BREADY => axi_dwidth_converter_0_M_AXI_BREADY,
      S_AXI_GP0_BRESP(1 downto 0) => axi_dwidth_converter_0_M_AXI_BRESP(1 downto 0),
      S_AXI_GP0_BVALID => axi_dwidth_converter_0_M_AXI_BVALID,
      S_AXI_GP0_RDATA(31 downto 0) => axi_dwidth_converter_0_M_AXI_RDATA(31 downto 0),
      S_AXI_GP0_RID(5 downto 0) => NLW_processing_system7_0_S_AXI_GP0_RID_UNCONNECTED(5 downto 0),
      S_AXI_GP0_RLAST => axi_dwidth_converter_0_M_AXI_RLAST,
      S_AXI_GP0_RREADY => axi_dwidth_converter_0_M_AXI_RREADY,
      S_AXI_GP0_RRESP(1 downto 0) => axi_dwidth_converter_0_M_AXI_RRESP(1 downto 0),
      S_AXI_GP0_RVALID => axi_dwidth_converter_0_M_AXI_RVALID,
      S_AXI_GP0_WDATA(31 downto 0) => axi_dwidth_converter_0_M_AXI_WDATA(31 downto 0),
      S_AXI_GP0_WID(5 downto 0) => B"000000",
      S_AXI_GP0_WLAST => axi_dwidth_converter_0_M_AXI_WLAST,
      S_AXI_GP0_WREADY => axi_dwidth_converter_0_M_AXI_WREADY,
      S_AXI_GP0_WSTRB(3 downto 0) => axi_dwidth_converter_0_M_AXI_WSTRB(3 downto 0),
      S_AXI_GP0_WVALID => axi_dwidth_converter_0_M_AXI_WVALID,
      S_AXI_HP0_ACLK => processing_system7_0_FCLK_CLK0,
      S_AXI_HP0_ARADDR(31 downto 0) => axi_protocol_converter_0_M_AXI_ARADDR(31 downto 0),
      S_AXI_HP0_ARBURST(1 downto 0) => axi_protocol_converter_0_M_AXI_ARBURST(1 downto 0),
      S_AXI_HP0_ARCACHE(3 downto 0) => axi_protocol_converter_0_M_AXI_ARCACHE(3 downto 0),
      S_AXI_HP0_ARID(5 downto 4) => B"00",
      S_AXI_HP0_ARID(3 downto 0) => axi_protocol_converter_0_M_AXI_ARID(3 downto 0),
      S_AXI_HP0_ARLEN(3 downto 0) => axi_protocol_converter_0_M_AXI_ARLEN(3 downto 0),
      S_AXI_HP0_ARLOCK(1 downto 0) => axi_protocol_converter_0_M_AXI_ARLOCK(1 downto 0),
      S_AXI_HP0_ARPROT(2 downto 0) => axi_protocol_converter_0_M_AXI_ARPROT(2 downto 0),
      S_AXI_HP0_ARQOS(3 downto 0) => axi_protocol_converter_0_M_AXI_ARQOS(3 downto 0),
      S_AXI_HP0_ARREADY => axi_protocol_converter_0_M_AXI_ARREADY,
      S_AXI_HP0_ARSIZE(2 downto 0) => axi_protocol_converter_0_M_AXI_ARSIZE(2 downto 0),
      S_AXI_HP0_ARVALID => axi_protocol_converter_0_M_AXI_ARVALID,
      S_AXI_HP0_AWADDR(31 downto 0) => axi_protocol_converter_0_M_AXI_AWADDR(31 downto 0),
      S_AXI_HP0_AWBURST(1 downto 0) => axi_protocol_converter_0_M_AXI_AWBURST(1 downto 0),
      S_AXI_HP0_AWCACHE(3 downto 0) => axi_protocol_converter_0_M_AXI_AWCACHE(3 downto 0),
      S_AXI_HP0_AWID(5 downto 4) => B"00",
      S_AXI_HP0_AWID(3 downto 0) => axi_protocol_converter_0_M_AXI_AWID(3 downto 0),
      S_AXI_HP0_AWLEN(3 downto 0) => axi_protocol_converter_0_M_AXI_AWLEN(3 downto 0),
      S_AXI_HP0_AWLOCK(1 downto 0) => axi_protocol_converter_0_M_AXI_AWLOCK(1 downto 0),
      S_AXI_HP0_AWPROT(2 downto 0) => axi_protocol_converter_0_M_AXI_AWPROT(2 downto 0),
      S_AXI_HP0_AWQOS(3 downto 0) => axi_protocol_converter_0_M_AXI_AWQOS(3 downto 0),
      S_AXI_HP0_AWREADY => axi_protocol_converter_0_M_AXI_AWREADY,
      S_AXI_HP0_AWSIZE(2 downto 0) => axi_protocol_converter_0_M_AXI_AWSIZE(2 downto 0),
      S_AXI_HP0_AWVALID => axi_protocol_converter_0_M_AXI_AWVALID,
      S_AXI_HP0_BID(5 downto 0) => axi_protocol_converter_0_M_AXI_BID(5 downto 0),
      S_AXI_HP0_BREADY => axi_protocol_converter_0_M_AXI_BREADY,
      S_AXI_HP0_BRESP(1 downto 0) => axi_protocol_converter_0_M_AXI_BRESP(1 downto 0),
      S_AXI_HP0_BVALID => axi_protocol_converter_0_M_AXI_BVALID,
      S_AXI_HP0_RACOUNT(2 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP0_RCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_RDATA(63 downto 0) => axi_protocol_converter_0_M_AXI_RDATA(63 downto 0),
      S_AXI_HP0_RDISSUECAP1_EN => '0',
      S_AXI_HP0_RID(5 downto 0) => axi_protocol_converter_0_M_AXI_RID(5 downto 0),
      S_AXI_HP0_RLAST => axi_protocol_converter_0_M_AXI_RLAST,
      S_AXI_HP0_RREADY => axi_protocol_converter_0_M_AXI_RREADY,
      S_AXI_HP0_RRESP(1 downto 0) => axi_protocol_converter_0_M_AXI_RRESP(1 downto 0),
      S_AXI_HP0_RVALID => axi_protocol_converter_0_M_AXI_RVALID,
      S_AXI_HP0_WACOUNT(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP0_WCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP0_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_WDATA(63 downto 0) => axi_protocol_converter_0_M_AXI_WDATA(63 downto 0),
      S_AXI_HP0_WID(5 downto 4) => B"00",
      S_AXI_HP0_WID(3 downto 0) => axi_protocol_converter_0_M_AXI_WID(3 downto 0),
      S_AXI_HP0_WLAST => axi_protocol_converter_0_M_AXI_WLAST,
      S_AXI_HP0_WREADY => axi_protocol_converter_0_M_AXI_WREADY,
      S_AXI_HP0_WRISSUECAP1_EN => '0',
      S_AXI_HP0_WSTRB(7 downto 0) => axi_protocol_converter_0_M_AXI_WSTRB(7 downto 0),
      S_AXI_HP0_WVALID => axi_protocol_converter_0_M_AXI_WVALID,
      S_AXI_HP1_ACLK => clk_wiz_1_clk_out3,
      S_AXI_HP1_ARADDR(31 downto 0) => axi_protocol_converter_2_M_AXI_ARADDR(31 downto 0),
      S_AXI_HP1_ARBURST(1 downto 0) => axi_protocol_converter_2_M_AXI_ARBURST(1 downto 0),
      S_AXI_HP1_ARCACHE(3 downto 0) => axi_protocol_converter_2_M_AXI_ARCACHE(3 downto 0),
      S_AXI_HP1_ARID(5 downto 4) => B"00",
      S_AXI_HP1_ARID(3 downto 0) => axi_protocol_converter_2_M_AXI_ARID(3 downto 0),
      S_AXI_HP1_ARLEN(3 downto 0) => axi_protocol_converter_2_M_AXI_ARLEN(3 downto 0),
      S_AXI_HP1_ARLOCK(1 downto 0) => axi_protocol_converter_2_M_AXI_ARLOCK(1 downto 0),
      S_AXI_HP1_ARPROT(2 downto 0) => axi_protocol_converter_2_M_AXI_ARPROT(2 downto 0),
      S_AXI_HP1_ARQOS(3 downto 0) => axi_protocol_converter_2_M_AXI_ARQOS(3 downto 0),
      S_AXI_HP1_ARREADY => axi_protocol_converter_2_M_AXI_ARREADY,
      S_AXI_HP1_ARSIZE(2 downto 0) => axi_protocol_converter_2_M_AXI_ARSIZE(2 downto 0),
      S_AXI_HP1_ARVALID => axi_protocol_converter_2_M_AXI_ARVALID,
      S_AXI_HP1_AWADDR(31 downto 0) => axi_protocol_converter_2_M_AXI_AWADDR(31 downto 0),
      S_AXI_HP1_AWBURST(1 downto 0) => axi_protocol_converter_2_M_AXI_AWBURST(1 downto 0),
      S_AXI_HP1_AWCACHE(3 downto 0) => axi_protocol_converter_2_M_AXI_AWCACHE(3 downto 0),
      S_AXI_HP1_AWID(5 downto 4) => B"00",
      S_AXI_HP1_AWID(3 downto 0) => axi_protocol_converter_2_M_AXI_AWID(3 downto 0),
      S_AXI_HP1_AWLEN(3 downto 0) => axi_protocol_converter_2_M_AXI_AWLEN(3 downto 0),
      S_AXI_HP1_AWLOCK(1 downto 0) => axi_protocol_converter_2_M_AXI_AWLOCK(1 downto 0),
      S_AXI_HP1_AWPROT(2 downto 0) => axi_protocol_converter_2_M_AXI_AWPROT(2 downto 0),
      S_AXI_HP1_AWQOS(3 downto 0) => axi_protocol_converter_2_M_AXI_AWQOS(3 downto 0),
      S_AXI_HP1_AWREADY => axi_protocol_converter_2_M_AXI_AWREADY,
      S_AXI_HP1_AWSIZE(2 downto 0) => axi_protocol_converter_2_M_AXI_AWSIZE(2 downto 0),
      S_AXI_HP1_AWVALID => axi_protocol_converter_2_M_AXI_AWVALID,
      S_AXI_HP1_BID(5 downto 0) => axi_protocol_converter_2_M_AXI_BID(5 downto 0),
      S_AXI_HP1_BREADY => axi_protocol_converter_2_M_AXI_BREADY,
      S_AXI_HP1_BRESP(1 downto 0) => axi_protocol_converter_2_M_AXI_BRESP(1 downto 0),
      S_AXI_HP1_BVALID => axi_protocol_converter_2_M_AXI_BVALID,
      S_AXI_HP1_RACOUNT(2 downto 0) => NLW_processing_system7_0_S_AXI_HP1_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP1_RCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP1_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP1_RDATA(63 downto 0) => axi_protocol_converter_2_M_AXI_RDATA(63 downto 0),
      S_AXI_HP1_RDISSUECAP1_EN => '0',
      S_AXI_HP1_RID(5 downto 0) => axi_protocol_converter_2_M_AXI_RID(5 downto 0),
      S_AXI_HP1_RLAST => axi_protocol_converter_2_M_AXI_RLAST,
      S_AXI_HP1_RREADY => axi_protocol_converter_2_M_AXI_RREADY,
      S_AXI_HP1_RRESP(1 downto 0) => axi_protocol_converter_2_M_AXI_RRESP(1 downto 0),
      S_AXI_HP1_RVALID => axi_protocol_converter_2_M_AXI_RVALID,
      S_AXI_HP1_WACOUNT(5 downto 0) => NLW_processing_system7_0_S_AXI_HP1_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP1_WCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP1_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP1_WDATA(63 downto 0) => axi_protocol_converter_2_M_AXI_WDATA(63 downto 0),
      S_AXI_HP1_WID(5 downto 4) => B"00",
      S_AXI_HP1_WID(3 downto 0) => axi_protocol_converter_2_M_AXI_WID(3 downto 0),
      S_AXI_HP1_WLAST => axi_protocol_converter_2_M_AXI_WLAST,
      S_AXI_HP1_WREADY => axi_protocol_converter_2_M_AXI_WREADY,
      S_AXI_HP1_WRISSUECAP1_EN => '0',
      S_AXI_HP1_WSTRB(7 downto 0) => axi_protocol_converter_2_M_AXI_WSTRB(7 downto 0),
      S_AXI_HP1_WVALID => axi_protocol_converter_2_M_AXI_WVALID,
      S_AXI_HP2_ACLK => processing_system7_0_FCLK_CLK0,
      S_AXI_HP2_ARADDR(31 downto 0) => axi_protocol_converter_3_M_AXI_ARADDR(31 downto 0),
      S_AXI_HP2_ARBURST(1 downto 0) => axi_protocol_converter_3_M_AXI_ARBURST(1 downto 0),
      S_AXI_HP2_ARCACHE(3 downto 0) => axi_protocol_converter_3_M_AXI_ARCACHE(3 downto 0),
      S_AXI_HP2_ARID(5 downto 4) => B"00",
      S_AXI_HP2_ARID(3 downto 0) => axi_protocol_converter_3_M_AXI_ARID(3 downto 0),
      S_AXI_HP2_ARLEN(3 downto 0) => axi_protocol_converter_3_M_AXI_ARLEN(3 downto 0),
      S_AXI_HP2_ARLOCK(1 downto 0) => axi_protocol_converter_3_M_AXI_ARLOCK(1 downto 0),
      S_AXI_HP2_ARPROT(2 downto 0) => axi_protocol_converter_3_M_AXI_ARPROT(2 downto 0),
      S_AXI_HP2_ARQOS(3 downto 0) => axi_protocol_converter_3_M_AXI_ARQOS(3 downto 0),
      S_AXI_HP2_ARREADY => axi_protocol_converter_3_M_AXI_ARREADY,
      S_AXI_HP2_ARSIZE(2 downto 0) => axi_protocol_converter_3_M_AXI_ARSIZE(2 downto 0),
      S_AXI_HP2_ARVALID => axi_protocol_converter_3_M_AXI_ARVALID,
      S_AXI_HP2_AWADDR(31 downto 0) => axi_protocol_converter_3_M_AXI_AWADDR(31 downto 0),
      S_AXI_HP2_AWBURST(1 downto 0) => axi_protocol_converter_3_M_AXI_AWBURST(1 downto 0),
      S_AXI_HP2_AWCACHE(3 downto 0) => axi_protocol_converter_3_M_AXI_AWCACHE(3 downto 0),
      S_AXI_HP2_AWID(5 downto 4) => B"00",
      S_AXI_HP2_AWID(3 downto 0) => axi_protocol_converter_3_M_AXI_AWID(3 downto 0),
      S_AXI_HP2_AWLEN(3 downto 0) => axi_protocol_converter_3_M_AXI_AWLEN(3 downto 0),
      S_AXI_HP2_AWLOCK(1 downto 0) => axi_protocol_converter_3_M_AXI_AWLOCK(1 downto 0),
      S_AXI_HP2_AWPROT(2 downto 0) => axi_protocol_converter_3_M_AXI_AWPROT(2 downto 0),
      S_AXI_HP2_AWQOS(3 downto 0) => axi_protocol_converter_3_M_AXI_AWQOS(3 downto 0),
      S_AXI_HP2_AWREADY => axi_protocol_converter_3_M_AXI_AWREADY,
      S_AXI_HP2_AWSIZE(2 downto 0) => axi_protocol_converter_3_M_AXI_AWSIZE(2 downto 0),
      S_AXI_HP2_AWVALID => axi_protocol_converter_3_M_AXI_AWVALID,
      S_AXI_HP2_BID(5 downto 0) => axi_protocol_converter_3_M_AXI_BID(5 downto 0),
      S_AXI_HP2_BREADY => axi_protocol_converter_3_M_AXI_BREADY,
      S_AXI_HP2_BRESP(1 downto 0) => axi_protocol_converter_3_M_AXI_BRESP(1 downto 0),
      S_AXI_HP2_BVALID => axi_protocol_converter_3_M_AXI_BVALID,
      S_AXI_HP2_RACOUNT(2 downto 0) => NLW_processing_system7_0_S_AXI_HP2_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP2_RCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP2_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP2_RDATA(63 downto 0) => axi_protocol_converter_3_M_AXI_RDATA(63 downto 0),
      S_AXI_HP2_RDISSUECAP1_EN => '0',
      S_AXI_HP2_RID(5 downto 0) => axi_protocol_converter_3_M_AXI_RID(5 downto 0),
      S_AXI_HP2_RLAST => axi_protocol_converter_3_M_AXI_RLAST,
      S_AXI_HP2_RREADY => axi_protocol_converter_3_M_AXI_RREADY,
      S_AXI_HP2_RRESP(1 downto 0) => axi_protocol_converter_3_M_AXI_RRESP(1 downto 0),
      S_AXI_HP2_RVALID => axi_protocol_converter_3_M_AXI_RVALID,
      S_AXI_HP2_WACOUNT(5 downto 0) => NLW_processing_system7_0_S_AXI_HP2_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP2_WCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP2_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP2_WDATA(63 downto 0) => axi_protocol_converter_3_M_AXI_WDATA(63 downto 0),
      S_AXI_HP2_WID(5 downto 4) => B"00",
      S_AXI_HP2_WID(3 downto 0) => axi_protocol_converter_3_M_AXI_WID(3 downto 0),
      S_AXI_HP2_WLAST => axi_protocol_converter_3_M_AXI_WLAST,
      S_AXI_HP2_WREADY => axi_protocol_converter_3_M_AXI_WREADY,
      S_AXI_HP2_WRISSUECAP1_EN => '0',
      S_AXI_HP2_WSTRB(7 downto 0) => axi_protocol_converter_3_M_AXI_WSTRB(7 downto 0),
      S_AXI_HP2_WVALID => axi_protocol_converter_3_M_AXI_WVALID,
      TTC0_WAVE0_OUT => NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED,
      TTC0_WAVE1_OUT => NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED,
      TTC0_WAVE2_OUT => NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED,
      USB0_PORT_INDCTL(1 downto 0) => NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED(1 downto 0),
      USB0_VBUS_PWRFAULT => '0',
      USB0_VBUS_PWRSELECT => NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED
    );
processing_system7_0_axi_periph: entity work.base_zynq_design_processing_system7_0_axi_periph_0
     port map (
      ACLK => processing_system7_0_FCLK_CLK0,
      ARESETN => rst_processing_system7_0_50M_interconnect_aresetn(0),
      M00_ACLK => processing_system7_0_FCLK_CLK0,
      M00_ARESETN => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M00_AXI_araddr(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arburst(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARCACHE(3 downto 0),
      M00_AXI_arlen(7 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARLEN(7 downto 0),
      M00_AXI_arlock => processing_system7_0_axi_periph_M00_AXI_ARLOCK,
      M00_AXI_arprot(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arqos(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARQOS(3 downto 0),
      M00_AXI_arready => processing_system7_0_axi_periph_M00_AXI_ARREADY,
      M00_AXI_arregion(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARREGION(3 downto 0),
      M00_AXI_arsize(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARSIZE(2 downto 0),
      M00_AXI_arvalid => processing_system7_0_axi_periph_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awburst(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awlen(7 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWLEN(7 downto 0),
      M00_AXI_awlock => processing_system7_0_axi_periph_M00_AXI_AWLOCK,
      M00_AXI_awprot(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWQOS(3 downto 0),
      M00_AXI_awready => processing_system7_0_axi_periph_M00_AXI_AWREADY,
      M00_AXI_awregion(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWREGION(3 downto 0),
      M00_AXI_awsize(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awvalid => processing_system7_0_axi_periph_M00_AXI_AWVALID,
      M00_AXI_bready => processing_system7_0_axi_periph_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => processing_system7_0_axi_periph_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rlast => processing_system7_0_axi_periph_M00_AXI_RLAST,
      M00_AXI_rready => processing_system7_0_axi_periph_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => processing_system7_0_axi_periph_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wlast => processing_system7_0_axi_periph_M00_AXI_WLAST,
      M00_AXI_wready => processing_system7_0_axi_periph_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => processing_system7_0_axi_periph_M00_AXI_WVALID,
      M01_ACLK => processing_system7_0_FCLK_CLK0,
      M01_ARESETN => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M01_AXI_araddr(31 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARADDR(31 downto 0),
      M01_AXI_arburst(1 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARBURST(1 downto 0),
      M01_AXI_arcache(3 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARCACHE(3 downto 0),
      M01_AXI_arlen(7 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARLEN(7 downto 0),
      M01_AXI_arlock => processing_system7_0_axi_periph_M01_AXI_ARLOCK,
      M01_AXI_arprot(2 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARPROT(2 downto 0),
      M01_AXI_arqos(3 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARQOS(3 downto 0),
      M01_AXI_arready => processing_system7_0_axi_periph_M01_AXI_ARREADY,
      M01_AXI_arregion(3 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARREGION(3 downto 0),
      M01_AXI_arsize(2 downto 0) => processing_system7_0_axi_periph_M01_AXI_ARSIZE(2 downto 0),
      M01_AXI_arvalid => processing_system7_0_axi_periph_M01_AXI_ARVALID,
      M01_AXI_awaddr(31 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWADDR(31 downto 0),
      M01_AXI_awburst(1 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWBURST(1 downto 0),
      M01_AXI_awcache(3 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWCACHE(3 downto 0),
      M01_AXI_awlen(7 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWLEN(7 downto 0),
      M01_AXI_awlock => processing_system7_0_axi_periph_M01_AXI_AWLOCK,
      M01_AXI_awprot(2 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWPROT(2 downto 0),
      M01_AXI_awqos(3 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWQOS(3 downto 0),
      M01_AXI_awready => processing_system7_0_axi_periph_M01_AXI_AWREADY,
      M01_AXI_awregion(3 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWREGION(3 downto 0),
      M01_AXI_awsize(2 downto 0) => processing_system7_0_axi_periph_M01_AXI_AWSIZE(2 downto 0),
      M01_AXI_awvalid => processing_system7_0_axi_periph_M01_AXI_AWVALID,
      M01_AXI_bready => processing_system7_0_axi_periph_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => processing_system7_0_axi_periph_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => processing_system7_0_axi_periph_M01_AXI_BVALID,
      M01_AXI_rdata(63 downto 0) => processing_system7_0_axi_periph_M01_AXI_RDATA(63 downto 0),
      M01_AXI_rlast => processing_system7_0_axi_periph_M01_AXI_RLAST,
      M01_AXI_rready => processing_system7_0_axi_periph_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => processing_system7_0_axi_periph_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => processing_system7_0_axi_periph_M01_AXI_RVALID,
      M01_AXI_wdata(63 downto 0) => processing_system7_0_axi_periph_M01_AXI_WDATA(63 downto 0),
      M01_AXI_wlast => processing_system7_0_axi_periph_M01_AXI_WLAST,
      M01_AXI_wready => processing_system7_0_axi_periph_M01_AXI_WREADY,
      M01_AXI_wstrb(7 downto 0) => processing_system7_0_axi_periph_M01_AXI_WSTRB(7 downto 0),
      M01_AXI_wvalid => processing_system7_0_axi_periph_M01_AXI_WVALID,
      S00_ACLK => processing_system7_0_FCLK_CLK0,
      S00_ARESETN => rst_processing_system7_0_50M_peripheral_aresetn(0),
      S00_AXI_araddr(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      S00_AXI_arid(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      S00_AXI_arlen(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      S00_AXI_arlock(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      S00_AXI_arprot(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      S00_AXI_arready => processing_system7_0_M_AXI_GP0_ARREADY,
      S00_AXI_arsize(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      S00_AXI_arvalid => processing_system7_0_M_AXI_GP0_ARVALID,
      S00_AXI_awaddr(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      S00_AXI_awid(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      S00_AXI_awlen(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      S00_AXI_awlock(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      S00_AXI_awprot(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      S00_AXI_awready => processing_system7_0_M_AXI_GP0_AWREADY,
      S00_AXI_awsize(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      S00_AXI_awvalid => processing_system7_0_M_AXI_GP0_AWVALID,
      S00_AXI_bid(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      S00_AXI_bready => processing_system7_0_M_AXI_GP0_BREADY,
      S00_AXI_bresp(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      S00_AXI_bvalid => processing_system7_0_M_AXI_GP0_BVALID,
      S00_AXI_rdata(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      S00_AXI_rid(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      S00_AXI_rlast => processing_system7_0_M_AXI_GP0_RLAST,
      S00_AXI_rready => processing_system7_0_M_AXI_GP0_RREADY,
      S00_AXI_rresp(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      S00_AXI_rvalid => processing_system7_0_M_AXI_GP0_RVALID,
      S00_AXI_wdata(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      S00_AXI_wid(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      S00_AXI_wlast => processing_system7_0_M_AXI_GP0_WLAST,
      S00_AXI_wready => processing_system7_0_M_AXI_GP0_WREADY,
      S00_AXI_wstrb(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      S00_AXI_wvalid => processing_system7_0_M_AXI_GP0_WVALID
    );
rst_processing_system7_0_50M: component base_zynq_design_rst_processing_system7_0_50M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_processing_system7_0_50M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => clk_wiz_1_locked,
      ext_reset_in => processing_system7_0_FCLK_RESET0_N,
      interconnect_aresetn(0) => rst_processing_system7_0_50M_interconnect_aresetn(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_processing_system7_0_50M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_processing_system7_0_50M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => processing_system7_0_FCLK_CLK0
    );
soc_AXI_ctrl_v1_0_0: component base_zynq_design_soc_AXI_ctrl_v1_0_0_0
     port map (
      eoc_i => nuraghe_soc_0_eoc_o,
      fech_enable_o => soc_AXI_ctrl_v1_0_0_fech_enable_o,
      mode_select_o => soc_AXI_ctrl_v1_0_0_mode_select_o,
      return_i(1 downto 0) => nuraghe_soc_0_return_o(1 downto 0),
      s00_axi_aclk => processing_system7_0_FCLK_CLK0,
      s00_axi_araddr(5 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARADDR(5 downto 0),
      s00_axi_arburst(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARBURST(1 downto 0),
      s00_axi_arcache(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARCACHE(3 downto 0),
      s00_axi_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s00_axi_arid(11 downto 0) => B"000000000000",
      s00_axi_arlen(7 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARLEN(7 downto 0),
      s00_axi_arlock => processing_system7_0_axi_periph_M00_AXI_ARLOCK,
      s00_axi_arprot(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARPROT(2 downto 0),
      s00_axi_arqos(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARQOS(3 downto 0),
      s00_axi_arready => processing_system7_0_axi_periph_M00_AXI_ARREADY,
      s00_axi_arregion(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARREGION(3 downto 0),
      s00_axi_arsize(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARSIZE(2 downto 0),
      s00_axi_aruser(0) => '0',
      s00_axi_arvalid => processing_system7_0_axi_periph_M00_AXI_ARVALID,
      s00_axi_awaddr(5 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWADDR(5 downto 0),
      s00_axi_awburst(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWBURST(1 downto 0),
      s00_axi_awcache(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWCACHE(3 downto 0),
      s00_axi_awid(11 downto 0) => B"000000000000",
      s00_axi_awlen(7 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWLEN(7 downto 0),
      s00_axi_awlock => processing_system7_0_axi_periph_M00_AXI_AWLOCK,
      s00_axi_awprot(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWPROT(2 downto 0),
      s00_axi_awqos(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWQOS(3 downto 0),
      s00_axi_awready => processing_system7_0_axi_periph_M00_AXI_AWREADY,
      s00_axi_awregion(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWREGION(3 downto 0),
      s00_axi_awsize(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWSIZE(2 downto 0),
      s00_axi_awuser(0) => '0',
      s00_axi_awvalid => processing_system7_0_axi_periph_M00_AXI_AWVALID,
      s00_axi_bid(11 downto 0) => NLW_soc_AXI_ctrl_v1_0_0_s00_axi_bid_UNCONNECTED(11 downto 0),
      s00_axi_bready => processing_system7_0_axi_periph_M00_AXI_BREADY,
      s00_axi_bresp(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_BRESP(1 downto 0),
      s00_axi_buser(0) => NLW_soc_AXI_ctrl_v1_0_0_s00_axi_buser_UNCONNECTED(0),
      s00_axi_bvalid => processing_system7_0_axi_periph_M00_AXI_BVALID,
      s00_axi_rdata(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_RDATA(31 downto 0),
      s00_axi_rid(11 downto 0) => NLW_soc_AXI_ctrl_v1_0_0_s00_axi_rid_UNCONNECTED(11 downto 0),
      s00_axi_rlast => processing_system7_0_axi_periph_M00_AXI_RLAST,
      s00_axi_rready => processing_system7_0_axi_periph_M00_AXI_RREADY,
      s00_axi_rresp(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_RRESP(1 downto 0),
      s00_axi_ruser(0) => NLW_soc_AXI_ctrl_v1_0_0_s00_axi_ruser_UNCONNECTED(0),
      s00_axi_rvalid => processing_system7_0_axi_periph_M00_AXI_RVALID,
      s00_axi_wdata(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_WDATA(31 downto 0),
      s00_axi_wlast => processing_system7_0_axi_periph_M00_AXI_WLAST,
      s00_axi_wready => processing_system7_0_axi_periph_M00_AXI_WREADY,
      s00_axi_wstrb(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_WSTRB(3 downto 0),
      s00_axi_wuser(0) => '0',
      s00_axi_wvalid => processing_system7_0_axi_periph_M00_AXI_WVALID,
      test_mode_o => soc_AXI_ctrl_v1_0_0_test_mode_o
    );
end STRUCTURE;
