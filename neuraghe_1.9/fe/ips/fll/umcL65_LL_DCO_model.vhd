-------------------------------------------------------------------------------
-- Title      : umcL65 Frequency Locked Loop Digital Controlled Oscillator 
-- Project    : PULP 65nm
-------------------------------------------------------------------------------
-- File       : umcL65_LL_DCO_model.vhd
-- Author     : David Bellasi  <bellasi@ee.ethz.ch>
-- Company    : Integrated Systems Laboratory, ETH Zurich
-- Created    : 2015-03-18
-- Last update: 2015-04-07
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : 
-------------------------------------------------------------------------------
-- Description: Behavioral model of the Digitally Controlled Oscillator (DCO).
--              The model is a second order approximation of the DCO transfer
--              function.
--              
-------------------------------------------------------------------------------
-- Copyright (c) 2015 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author              Description
-- 2014-01-15  1.0      Ivan MIRO PANADES   Original version by CEA
--                                          (ivan.miro-panades@cea.fr)
-- 2015-03-18  2.0      bellasid            Ported to UMC 65nm node,
--                                          modified for PULP 65nm
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- synopsys translate_off
use ieee.math_real.all;
-- synopsys translate_on

entity umcL65_LL_DCO_behavioral is
  port (
    Din_DI   : in  std_logic_vector(9 downto 0);
    Clk_CI   : in  std_logic;
    Rst_RBI  : in  std_logic;
    En_SI    : in  std_logic;
    Freq_DO  : out std_logic;
    FreqReal : out real
    );

end umcL65_LL_DCO_behavioral;


architecture Behavioral of umcL65_LL_DCO_behavioral is

-- synopsys translate_off
  signal LocalClock_C   : std_logic := '0';
  signal HALF_PERIOD_NS : time      := 1.0 ns;
  signal REF_CLK_PERIOD : time      := 30.50 us;
  signal Din_DP, Din_DN : std_logic_vector(Din_DI'length-1 downto 0);
  signal go             : std_logic := '0';
-- synopsys translate_on

-- linearized transfer function of the DCO :
-- - freq input command :   range is from 0 to 1023 (output starts at 264)
-- - fout generated clock : range from 93.230 kHz to 542.998 MHz


begin  -- Behavioral

-- synopsys translate_off

  Din_DN <= Din_DI;

  pClock : process(Clk_CI, Rst_RBI)
  begin
    if Rst_RBI = '0' then
      Din_DP <= (others => '0');
    elsif Clk_CI = '1' and Clk_CI'event then
      Din_DP <= Din_DN;
    end if;
  end process;

  pFreq : process(Din_DP, En_SI)
    variable freq_integer : integer;
    variable freq_real    : real;
  begin
    freq_integer := to_integer(unsigned(Din_DP));

    if freq_integer < 264 then
      --freq_real := 0.09323;
      freq_real := 0.000001;
    else
      freq_real := real(-0.000202)*real(freq_integer)**2.0 + real(0.975372)*real(freq_integer) + real(-243.320581);
      go        <=  '1';
    end if;

	if En_SI = '0' then
		go <= '0';
	end if;


    HALF_PERIOD_NS <= (1.0 / (2.0 * freq_real)) * 1 us;

    FreqReal <= freq_real;
    
  end process;

  clk_out : process
  begin  -- process clk_out

    loop
    
    wait until go = '1';

    wait for REF_CLK_PERIOD ;

    clkloop : loop 
    exit clkloop when En_SI = '0';
      LocalClock_C <= not(LocalClock_C);
      wait for HALF_PERIOD_NS;
    end loop;

  end loop;
    
  end process clk_out;

  Freq_DO <= LocalClock_C when En_SI = '1' else '0';

-- synopsys translate_on

end Behavioral;



