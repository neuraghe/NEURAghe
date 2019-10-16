--!
--! @file clock_buffer_cmos028_fdsoi.vhd
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
--! @par  Id: $Id: clock_buffer_cmos028_fdsoi.vhd 26 2014-03-26 13:57:28Z im219746 $
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

ENTITY clock_inverter IS
  PORT(
    clk_in      : IN  STD_LOGIC;
    clk_out     : OUT STD_LOGIC
  );
END clock_inverter;

ARCHITECTURE rtl_cmos028_fdsoi OF clock_inverter IS

-- Available cells:
-- C12T28SOI_LL_CNBFX38_P0
-- C12T28SOI_LL_CNBFX38_P4
-- C12T28SOI_LL_CNBFX38_P10
-- C12T28SOI_LL_CNBFX38_P16
-- C12T32_LLUP10_CNBFX36
  
 COMPONENT C8T28SOI_LR_CNBFX37_P0
    PORT (
      A  : IN  STD_LOGIC;
      Z  : OUT STD_LOGIC
    );
  END COMPONENT;

BEGIN

  u_manual_clock_inverter : C8T28SOI_LR_CNBFX37_P0
    PORT MAP (
      A => clk_in,
      Z => clk_out
    );

END rtl_cmos028_fdsoi;

