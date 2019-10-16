--!
--! @file DCO.vhd
--! @brief  
--! 
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
--! @par  Module owner: Ivan MIRO PANADES 
--!       ivan.miro-panades@cea.fr
--! 
--! @par  Copyright (C) 2013 CEA
--! 
--! @par  Authors: Ivan MIRO PANADES
--! 
--! @par  Id: $Id: DCO_cmos028_fdsoi.vhd 21 2014-03-18 11:20:00Z im219746 $
--! @par  Date: $Date: 2014-03-18 12:20:00 +0100 (Tue, 18 Mar 2014) $
--! @par  Revision: $Rev: 21 $
--!


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY DCO IS
  PORT(
    FREQ   : IN  STD_LOGIC_VECTOR(7 downto 0);
    TI     : IN  STD_LOGIC;
    TE     : IN  STD_LOGIC;
    CP     : IN  STD_LOGIC;
    RN     : IN  STD_LOGIC;
    ENAB   : IN  STD_LOGIC;
    TQ     : OUT STD_LOGIC;
    FOUT   : OUT STD_LOGIC
    );
END DCO;

ARCHITECTURE rtl_cmos028_fdsoi of DCO IS

  COMPONENT C12T32_LL_DCO_PB10_4DelayCells IS
    PORT(
      FREQ   : IN  STD_LOGIC_VECTOR(7 downto 0);
      TI     : IN  STD_LOGIC;
      TE     : IN  STD_LOGIC;
      CP     : IN  STD_LOGIC;
      RN     : IN  STD_LOGIC;
      ENAB   : IN  STD_LOGIC;
      TQ     : OUT STD_LOGIC;
      FOUT   : OUT STD_LOGIC
    );
  END COMPONENT;

BEGIN

  u_DCO : C12T32_LL_DCO_PB10_4DelayCells
    PORT MAP(
      FREQ  => FREQ, 
      TI    => TI  , 
      TE    => TE  , 
      CP    => CP  , 
      RN    => RN  , 
      ENAB  => ENAB, 
      TQ    => TQ  , 
      FOUT  => FOUT 
    );

END rtl_cmos028_fdsoi;
