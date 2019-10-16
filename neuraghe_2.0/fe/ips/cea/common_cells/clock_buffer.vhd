--!
--! @file clock_buffer.vhd
--! @brief Clock buffer for Back-End implementation 
--!        Usefull to define a clock source
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
--! @par  Id: $Id: clock_buffer.vhd 5 2014-01-21 16:03:56Z im219746 $
--! @par  Date: $Date: 2014-01-21 17:03:56 +0100 (Tue, 21 Jan 2014) $
--! @par  Revision: $Rev: 5 $
--!

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY clock_buffer IS
  PORT(
    clk_in      : IN  STD_LOGIC;
    clk_out     : OUT STD_LOGIC
  );
END clock_buffer;

ARCHITECTURE rtl OF clock_buffer IS

BEGIN

  -- DO NOT MODIFY THE AFTER VALUE
  clk_out <= clk_in AFTER 100 ps;

END rtl;
