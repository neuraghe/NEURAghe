--!
--! @file clock_gating_cmos028_fdsoi.vhd
--! @brief Clock gating cell for Back-End implementation 
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
--! @par  Id: $Id: clock_gating_cmos028_fdsoi.vhd 26 2014-03-26 13:57:28Z im219746 $
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

ENTITY clock_gating IS
  PORT(
    clk_in      : IN  STD_LOGIC;
    enable      : IN  STD_LOGIC;
    test_mode   : IN  STD_LOGIC;
    
    clk_out     : OUT STD_LOGIC
  );
END clock_gating;

ARCHITECTURE rtl_cmos028_fdsoi OF clock_gating IS

-- Available cells:
-- C12T28SOI_LLP_CNHLSX58_P0
-- C12T28SOI_LLP_CNHLSX58_P4
-- C12T28SOI_LLP_CNHLSX58_P10
-- C12T28SOI_LLP_CNHLSX58_P16
-- C12T32_LLUAL4_CNHLSX7

COMPONENT C12T32_LLUAL4_CNHLSX7
    PORT (	-- from C28SOI_SC_12_CLK_LL library
        	Q  : OUT STD_LOGIC;
	        CP : IN  STD_LOGIC;
	        E  : IN  STD_LOGIC;
	        TE : IN  STD_LOGIC
    );
  END COMPONENT;

BEGIN

  u_manual_clockgate : C12T32_LLUAL4_CNHLSX7
    PORT MAP (
        Q  => clk_out,
        CP => clk_in,
        E  => enable,
        TE => test_mode
    );

END rtl_cmos028_fdsoi;
