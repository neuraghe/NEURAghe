--!
--! @file synchronizer.vhd
--! @brief 2-flop synchronizer 
--! 
--! 
--! 
--! 
--! @par  Module owner: Ivan MIRO PANADES
--!       ivan.miro-panades@cea.fr
--! 
--! @par  Copyright (C) 2010 CEA
--! 
--! @par  Authors:
--!       Ivan MIRO PANADES
--! 
--! @par  Id: $Id: synchronizer.vhd 6 2014-01-24 13:21:37Z im219746 $
--! @par  Date: $Date: 2014-01-24 14:21:37 +0100 (Fri, 24 Jan 2014) $
--! @par  Revision: $Rev: 6 $
--!

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY synchronizer IS
  GENERIC(
    RESET_VALUE : STD_LOGIC := '0'  -- Output value at reset 
  );
  PORT(
    rst_n     : IN  STD_LOGIC;
    clk       : IN  STD_LOGIC;
    data_in   : IN  STD_LOGIC;
    data_out  : OUT STD_LOGIC
  );
END synchronizer;

ARCHITECTURE rtl OF synchronizer IS
  SIGNAL sync_0         : STD_LOGIC; 
  SIGNAL sync_1         : STD_LOGIC; 
BEGIN

  pClock : process(rst_n,clk)
    begin
      if (rst_n='0') then
        sync_0 <= RESET_VALUE;
        sync_1 <= RESET_VALUE;
      elsif(clk='1' and clk'event) then
        sync_0 <= data_in;
        sync_1 <= sync_0;
      end if;
    end process;

  data_out <= sync_1;

END rtl;
