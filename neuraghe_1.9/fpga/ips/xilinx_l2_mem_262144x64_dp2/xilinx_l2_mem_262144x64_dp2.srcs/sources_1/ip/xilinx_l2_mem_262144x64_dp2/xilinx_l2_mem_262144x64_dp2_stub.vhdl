-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:48:31 MST 2014
-- Date        : Mon Jul 31 13:44:41 2017
-- Host        : eolab running 64-bit SUSE Linux Enterprise Server 12
-- Command     : write_vhdl -force -mode synth_stub
--               /home/gderiu/neuraghe_wei2ddr/fpga/ips/xilinx_l2_mem_262144x64_dp2/xilinx_l2_mem_262144x64_dp2.srcs/sources_1/ip/xilinx_l2_mem_262144x64_dp2/xilinx_l2_mem_262144x64_dp2_stub.vhdl
-- Design      : xilinx_l2_mem_262144x64_dp2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045ffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xilinx_l2_mem_262144x64_dp2 is
  Port ( 
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 17 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 63 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 63 downto 0 );
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addrb : in STD_LOGIC_VECTOR ( 18 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end xilinx_l2_mem_262144x64_dp2;

architecture stub of xilinx_l2_mem_262144x64_dp2 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,rsta,ena,wea[7:0],addra[17:0],dina[63:0],douta[63:0],clkb,rstb,enb,web[3:0],addrb[18:0],dinb[31:0],doutb[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_2,Vivado 2014.4";
begin
end;
