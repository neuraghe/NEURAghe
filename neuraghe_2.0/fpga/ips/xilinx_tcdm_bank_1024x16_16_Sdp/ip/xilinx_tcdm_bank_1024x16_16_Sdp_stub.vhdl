-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
-- Date        : Wed Feb 13 10:48:12 2019
-- Host        : eolab running 64-bit SUSE Linux Enterprise Server 12
-- Command     : write_vhdl -force -mode synth_stub
--               /home/gderiu/marco/neuraghe_zed_tcn/fpga/ips/xilinx_tcdm_bank_1024x16_16_Sdp/xilinx_tcdm_bank_1024x16_16_Sdp.srcs/sources_1/ip/xilinx_tcdm_bank_1024x16_16_Sdp/xilinx_tcdm_bank_1024x16_16_Sdp_stub.vhdl
-- Design      : xilinx_tcdm_bank_1024x16_16_Sdp
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xilinx_tcdm_bank_1024x16_16_Sdp is
  Port ( 
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 1 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 9 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end xilinx_tcdm_bank_1024x16_16_Sdp;

architecture stub of xilinx_tcdm_bank_1024x16_16_Sdp is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,ena,wea[1:0],addra[9:0],dina[15:0],clkb,enb,addrb[9:0],doutb[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_3_5,Vivado 2016.4";
begin
end;
