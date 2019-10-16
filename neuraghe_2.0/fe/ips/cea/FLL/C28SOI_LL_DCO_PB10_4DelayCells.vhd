--!
--! @file C12T32_LL_DCO_PB10_4DelayCells.vhd
--! @brief Frequency Locked Loop Digital Controlled Oscillator 
--! 
--! This is the behavioral model of the Digital Controlled Oscillator (DCO).
--! This block is actually designed with a DAC and VCO, and implemented as a hard macro.
--! (not described here)
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
--! @par  Id: $Id: C12T32_LL_DCO_PB10_4DelayCells.vhd 1 2014-01-15 16:11:08Z im219746 $
--! @par  Date: $Date: 2014-01-15 17:11:08 +0100 (Wed, 15 Jan 2014) $
--! @par  Revision: $Rev: 1 $
--!


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
-- synopsys translate_off
USE ieee.math_real.ALL; 
-- synopsys translate_on

ENTITY C28SOI_LL_DCO_PB10_4DelayCells IS
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
END C28SOI_LL_DCO_PB10_4DelayCells;

ARCHITECTURE behav of C28SOI_LL_DCO_PB10_4DelayCells IS

-- synopsys translate_off
SIGNAL LOCAL_CLOCK     : STD_LOGIC := '0';
SIGNAL DEMI_PERIODE_NS : TIME := 1.0 ns;
SIGNAL FREQ_DCO        : REAL;
SIGNAL FREQ_r          : STD_LOGIC_VECTOR(8-1 downto 0);
-- synopsys translate_on

-- DCO simple order model :
-- - freq input command :   range is from 0 to 255
-- - fout generated clock : range from 0.096 to 4.83 GHz.

BEGIN

-- synopsys translate_off


  pClock : process(RN,CP)
    begin
			if (RN='0') then
        FREQ_r     <= (others => '0');
			elsif(CP='1' and CP'event) then
        FREQ_r     <= FREQ;
 			end if;
    end process;

  pFreq : process(FREQ_r)
    variable freq_integer : integer;
    variable freq_real : real;
    begin
      freq_integer := to_integer(unsigned(FREQ_r));
      freq_real := -7.090E-08*real(freq_integer)**3.0 + 2.833E-05*real(freq_integer)**2.0 + 1.257E-02*real(freq_integer) + 9.462E-01;
      FREQ_DCO  <= freq_real;
      DEMI_PERIODE_NS <= (1.0 / (2.0 * freq_real)) * 1 ns;
    end process;

  LOCAL_CLOCK <= not(LOCAL_CLOCK) after DEMI_PERIODE_NS;

  FOUT <= LOCAL_CLOCK when ENAB='1' else '0';
-- synopsys translate_on

END behav;
