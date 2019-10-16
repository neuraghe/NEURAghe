-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
-- Date        : Mon Sep 25 15:55:14 2017
-- Host        : eolab running 64-bit SUSE Linux Enterprise Server 12
-- Command     : write_vhdl -force -mode synth_stub
--               /home/gderiu/neuraghe_wei2ddr/fpga/ips/xilinx_tcdm_bank_1024x32/xilinx_tcdm_bank_1024x32.srcs/sources_1/ip/xilinx_tcdm_bank_1024x32/xilinx_tcdm_bank_1024x32_stub.vhdl
-- Design      : xilinx_tcdm_bank_1024x32
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045ffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xilinx_tcdm_bank_1024x32 is
  Port ( 
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addrb : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end xilinx_tcdm_bank_1024x32;

architecture stub of xilinx_tcdm_bank_1024x32 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,rsta,ena,wea[3:0],addra[9:0],dina[31:0],douta[31:0],clkb,enb,web[3:0],addrb[9:0],dinb[31:0],doutb[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_3_3,Vivado 2016.2";
begin
end;
