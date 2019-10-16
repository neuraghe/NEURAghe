--!
--! @file clock_mux2.vhd
--! @brief Clock multiplexer (with 1 delta delay) 
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
--! @par  Id: $Id: clock_mux2.vhd 5 2014-01-21 16:03:56Z im219746 $
--! @par  Date: $Date: 2014-01-21 17:03:56 +0100 (Tue, 21 Jan 2014) $
--! @par  Revision: $Rev: 5 $
--!

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY clock_mux2 IS
  PORT(
    clk_in0     : IN  STD_LOGIC;
    clk_in1     : IN  STD_LOGIC;
    clk_select  : IN  STD_LOGIC;

    clk_out     : OUT STD_LOGIC
  );
END clock_mux2;

ARCHITECTURE rtl OF clock_mux2 IS

BEGIN

  -- DO NOT MODIFY THE AFTER VALUE
  clk_out <= clk_in0 AFTER 100 ps when clk_select = '0' else
             clk_in1 AFTER 100 ps;

END rtl;
