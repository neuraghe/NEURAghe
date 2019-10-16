--!
--! @file synchronizer_cmos028_fdsoi.vhd
--! @brief 2-flop synchronizer for Back-End implementation 
--! 
--! 
--! 
--! 
--! @par  Module owner: Ivan MIRO PANADES
--!       ivan.miro-panades@cea.fr
--! 
--! @par  Copyright (C) 2014 CEA
--! 
--! @par  Authors:
--!       Ivan MIRO PANADES
--! 
--! @par  Id: $Id: synchronizer_cmos028_fdsoi.vhd 26 2014-03-26 13:57:28Z im219746 $
--! @par  Date: $Date: 2014-03-26 14:57:28 +0100 (Wed, 26 Mar 2014) $
--! @par  Revision: $Rev: 26 $
--!
--!
--! --------------------------------------------
--! ---WARNING---WARNING---WARNING----WARNING---
--! --------------------------------------------
--!      There is no FFSYNC for FDSOI 
--!      So, use FF Standard
--! --------------------------------------------
--! --------------------------------------------
--! --------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY C28SOI_SC_12_CLK_LL;
USE C28SOI_SC_12_CLK_LL.ALL;

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

ARCHITECTURE rtl_cmos028_fdsoi OF synchronizer IS

-- Available cells:
-- C12T28SOIDV_LL_SDFSYNCPRQX8_P0
-- C12T28SOIDV_LL_SDFSYNCPRQX8_P4
-- C12T28SOIDV_LL_SDFSYNCPRQX8_P10
-- C12T28SOIDV_LL_SDFSYNCPRQX8_P16

-- C12T28SOIDV_LL_SDFSYNCPSQX8_P0
-- C12T28SOIDV_LL_SDFSYNCPSQX8_P4
-- C12T28SOIDV_LL_SDFSYNCPSQX8_P10
-- C12T28SOIDV_LL_SDFSYNCPSQX8_P16

  COMPONENT C12T28SOIDV_LL_SDFSYNCPRQX8_P0 IS
    PORT (	-- from C28SOI_SC_12_CLK_LL library
  	  RN       : IN     STD_LOGIC ;
  	  D        : IN     STD_LOGIC ;
  	  TI       : IN     STD_LOGIC ;
  	  TE       : IN     STD_LOGIC ;
  	  Q        : OUT    STD_LOGIC ;
  	  CP       : IN     STD_LOGIC
    );
  END COMPONENT;

  COMPONENT C12T28SOIDV_LL_SDFSYNCPSQX8_P0 IS
    PORT (	-- from C28SOI_SC_12_CLK_LL library
  	  SN       : IN     STD_LOGIC ;
  	  D        : IN     STD_LOGIC ;
  	  TI       : IN     STD_LOGIC ;
  	  TE       : IN     STD_LOGIC ;
  	  Q        : OUT    STD_LOGIC ;
  	  CP       : IN     STD_LOGIC
    );
  END COMPONENT;

  SIGNAL sync_0     : STD_LOGIC; 
 
  CONSTANT tie_low  : STD_LOGIC := '0';
  
BEGIN

  
reset_synchro : IF (RESET_VALUE='0') GENERATE
  u_manual_synchronizer_reg_0 : C12T28SOIDV_LL_SDFSYNCPRQX8_P0
    PORT MAP (
      RN => rst_n  ,
      CP => clk    ,
      D  => data_in,
      Q  => sync_0 ,
      TI => tie_low,
      TE => tie_low
    );
    
  u_manual_synchronizer_reg_1 : C12T28SOIDV_LL_SDFSYNCPRQX8_P0
    PORT MAP (
      CP => clk     ,
      RN => rst_n   ,
      D  => sync_0  ,
      Q  => data_out,
      TI => tie_low ,
      TE => tie_low
    );
END GENERATE;

set_synchro_u : IF (RESET_VALUE='1') GENERATE
  u_manual_synchronizer_reg_0 : C12T28SOIDV_LL_SDFSYNCPSQX8_P0
    PORT MAP (
      SN => rst_n  ,
      CP => clk    ,
      D  => data_in,
      Q  => sync_0 ,
      TI => tie_low,
      TE => tie_low
    );
    
  u_manual_synchronizer_reg_1 : C12T28SOIDV_LL_SDFSYNCPSQX8_P0
    PORT MAP (
      SN => rst_n   ,
      CP => clk     ,
      D  => sync_0  ,
      Q  => data_out,
      TI => tie_low ,
      TE => tie_low
    );
END GENERATE;


END rtl_cmos028_fdsoi;
