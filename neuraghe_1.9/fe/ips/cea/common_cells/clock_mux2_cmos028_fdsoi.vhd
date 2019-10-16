--!
--! @file clock_mux2_cmos028_fdsoi.vhd
--! @brief Clock multiplexer for Back-End implementation 
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
--! @par  Id: $Id: clock_mux2_cmos028_fdsoi.vhd 26 2014-03-26 13:57:28Z im219746 $
--! @par  Date: $Date: 2014-03-26 14:57:28 +0100 (Wed, 26 Mar 2014) $
--! @par  Revision: $Rev: 26 $
--!

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-- synopsys translate_off
LIBRARY tech_lib;
USE tech_lib.ALL;
-- synopsys translate_on

ENTITY clock_mux2 IS
  PORT(
    clk_in0     : IN  STD_LOGIC;
    clk_in1     : IN  STD_LOGIC;
    clk_select  : IN  STD_LOGIC;
    clk_out     : OUT STD_LOGIC
  );
END clock_mux2;

ARCHITECTURE rtl_cmos028_fdsoi OF clock_mux2 IS

-- Available cells:
-- C12T28SOI_LL_CNMUX21X17_P0;
-- C12T28SOI_LL_CNMUX21X17_P4;
-- C12T28SOI_LL_CNMUX21X17_P10;
-- C12T28SOI_LL_CNMUX21X17_P16;

-- C12T28SOI_LL_CNMUX21X33_P0;
-- C12T28SOI_LL_CNMUX21X33_P4;
-- C12T28SOI_LL_CNMUX21X33_P10;
-- C12T28SOI_LL_CNMUX21X33_P16;
-- C12T32_LLUP10_CNMUX21X17

  COMPONENT C12T32_LLUP10_CNMUX21X17
    PORT (	-- from C28SOI_SC_12_CLK_LL library
          D0 : IN  STD_LOGIC;
          D1 : IN  STD_LOGIC;
          S0 : IN  STD_LOGIC;
          Z  : OUT STD_LOGIC
    );
  END COMPONENT;

BEGIN

  u_manual_clock_mux : C12T32_LLUP10_CNMUX21X17
    PORT MAP (
      D0 => clk_in0,
      D1 => clk_in1,
      S0 => clk_select,
      Z  => clk_out
    );
  
END rtl_cmos028_fdsoi;
