-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:47:07 MST 2014
-- Date        : Wed Jan  4 12:06:30 2017
-- Host        : asus running 64-bit Linux Mint 17.1 Rebecca
-- Command     : write_vhdl -force -mode synth_stub
--               /home/gianfranco/xilinx_l2_mem_32768x64_dp/xilinx_l2_mem_32768x64_dp.srcs/sources_1/ip/xilinx_l2_mem_32768x64_dp/xilinx_l2_mem_32768x64_dp_stub.vhdl
-- Design      : xilinx_l2_mem_32768x64_dp
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045ffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xilinx_l2_mem_32768x64_dp is
  Port ( 
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 14 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 63 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 63 downto 0 );
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addrb : in STD_LOGIC_VECTOR ( 14 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 63 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );

end xilinx_l2_mem_32768x64_dp;

architecture stub of xilinx_l2_mem_32768x64_dp is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,rsta,ena,wea[7:0],addra[14:0],dina[63:0],douta[63:0],clkb,rstb,enb,web[7:0],addrb[14:0],dinb[63:0],doutb[63:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_2,Vivado 2014.4";
begin
end;
