--!
--! @file clock_gating.vhd
--! @brief Clock gating cell (with 1 delta delay) 
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
--! @par  Id: $Id: clock_gating.vhd 5 2014-01-21 16:03:56Z im219746 $
--! @par  Date: $Date: 2014-01-21 17:03:56 +0100 (Tue, 21 Jan 2014) $
--! @par  Revision: $Rev: 5 $
--!

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY clock_gating IS
  PORT(
    clk_in      : IN  STD_LOGIC;
    enable      : IN  STD_LOGIC;
    test_mode   : IN  STD_LOGIC;

    clk_out     : OUT STD_LOGIC
  );
END clock_gating;

ARCHITECTURE rtl OF clock_gating IS

  SIGNAL enable_clock : STD_LOGIC;

BEGIN

  p_latch: process(clk_in,enable,test_mode)
    begin
      if (clk_in = '0') then
         enable_clock <= enable OR test_mode;
      end if;
    end process;

  -- DO NOT MODIFY THE AFTER VALUE
  clk_out <= clk_in AND enable_clock AFTER 100 ps;

END rtl;
