--!
--! @file fll_fdiv2.vhd
--! @brief Frequency frequency divider 
--! 
--! This is a simple frequency divider by 2, consisting in a single flip-flop.
--! => it used to be a dedicated custom cell (C12T32_LL_FDIV2), not used anymore to help integration
--! 
--! <B>
--! @n
--! This file is part of the Platform 2012 program,
--! a cooperation between STMicroelectronics and CEA.@n
--! Redistribution of this file to outside parties is
--! strictly prohibited without the written consent
--! of the module owner indicated below.@n
--! </B>
--! 
--! @par  Module owner: Pascal VIVET
--!       pascal.vivet@cea.fr
--! 
--! @par  Copyright (C) 2009 CEA
--! 
--! @par  Authors: Pascal VIVET
--! 
--! @par  Id: $Id: fll_fdiv2.vhd 1 2014-01-15 16:11:08Z im219746 $
--! @par  Date: $Date: 2014-01-15 17:11:08 +0100 (Wed, 15 Jan 2014) $
--! @par  Revision: $Rev: 1 $
--!


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY fll_fdiv2 IS PORT (
  RST_N       : IN  STD_LOGIC;
  CLKI        : IN  STD_LOGIC;
  CLKO        : OUT STD_LOGIC
  );
END fll_fdiv2;

ARCHITECTURE rtl of fll_fdiv2 IS

SIGNAL CLKO_i : STD_LOGIC;

BEGIN

  PROCESS (CLKI, RST_N)
  BEGIN
    IF (RST_N='0') THEN
      CLKO_i <= '1';
    ELSIF CLKI = '1' AND CLKI'EVENT THEN
      CLKO_i <= not(CLKO_i);
    END IF;
  END PROCESS;

  CLKO <= CLKO_i;
 
END rtl;
