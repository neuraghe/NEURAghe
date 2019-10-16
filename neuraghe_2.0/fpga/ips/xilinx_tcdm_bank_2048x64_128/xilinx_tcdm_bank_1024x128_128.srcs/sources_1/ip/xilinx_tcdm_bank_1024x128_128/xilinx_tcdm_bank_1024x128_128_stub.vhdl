-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
-- Date        : Wed Mar 27 12:45:56 2019
-- Host        : eolab running 64-bit SUSE Linux Enterprise Server 12
-- Command     : write_vhdl -force -mode synth_stub
--               /home/gderiu/marco/neuraghe_zc706_tcn/fpga/ips/xilinx_tcdm_bank_1024x128_128/xilinx_tcdm_bank_1024x128_128.srcs/sources_1/ip/xilinx_tcdm_bank_1024x128_128/xilinx_tcdm_bank_1024x128_128_stub.vhdl
-- Design      : xilinx_tcdm_bank_1024x128_128
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045ffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xilinx_tcdm_bank_1024x128_128 is
  Port ( 
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 10 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 63 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 63 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 15 downto 0 );
    addrb : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 127 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 127 downto 0 )
  );

end xilinx_tcdm_bank_1024x128_128;

architecture stub of xilinx_tcdm_bank_1024x128_128 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,rsta,ena,wea[7:0],addra[10:0],dina[63:0],douta[63:0],clkb,enb,web[15:0],addrb[9:0],dinb[127:0],doutb[127:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_3_5,Vivado 2016.4";
begin
end;
