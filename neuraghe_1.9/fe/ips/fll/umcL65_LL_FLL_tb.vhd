-------------------------------------------------------------------------------
-- Title      : umcL65 Frequency Locked Loop Digital Controlled Oscillator 
-- Project    : PULP 65nm
-------------------------------------------------------------------------------
-- File       : umcL65_LL_FLL.vhd
-- Author     : David Bellasi  <bellasi@ee.ethz.ch>
-- Company    : Integrated Systems Laboratory, ETH Zurich
-- Created    : 2015-03-18
-- Last update: 2015-04-01
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : 
-------------------------------------------------------------------------------
-- Description: test bench for the fll (at digital level)
--              Includes the loop filter (i.e., control), DCO, the clock counter,
--              and the clock divider
--              
-------------------------------------------------------------------------------
-- Copyright (c) 2015 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author              Description
-- 2015-03-18  2.0      bellasid            created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.tb_util.all;

entity umcL65_LL_FLL_tb is

end umcL65_LL_FLL_tb;


architecture rtl of umcL65_LL_FLL_tb is

  ----------------------------------------------------------------------
  -- Design constants   ------------------------------------------------
  ----------------------------------------------------------------------

  -- timing of clock and simulation events
  constant CLK_PHASE_HIGH           : time := 15625 ns;
  constant CLK_PHASE_LOW            : time := 15625 ns;
  constant STIMULI_APPLICATION_TIME : time := 0.1*2*15625 ns;

  ----------------------------------------------------------------------
  -- Signals/contants declarations -------------------------------------
  ----------------------------------------------------------------------

  signal RefClk_C : std_logic := '1';   -- driving clock
  signal Rst_RB : std_logic := '0';

  ----------------------------------------------------------------------
  -- Components declarations -------------------------------------------
  ----------------------------------------------------------------------

  component umcL65_LL_FLL_model
    port (
      FLLCLK : out std_logic;
      FLLOE  : in  std_logic;
      REFCLK : in  std_logic;
      LOCK   : out std_logic;
      CFGREQ : in  std_logic;
      CFGACK : out std_logic;
      CFGAD  : in  std_logic_vector(1 downto 0);
      CFGD   : in  std_logic_vector(31 downto 0);
      CFGQ   : out std_logic_vector(31 downto 0);
      CFGWEB : in  std_logic;
      RSTB   : in  std_logic;
      PWDB   : in  std_logic;
      TM     : in  std_logic;
      TE     : in  std_logic;
      TD     : in  std_logic;
      TQ     : out std_logic); 
  end component;



  
begin

  -- pausable clock generator with programmable mark and space widths
  -----------------------------------------------------------------------------
  -- The procedure ClockGenerator is defined in the package simulstuff.
  -- This concurrent procedure call is a process that calls the procedure,
  -- with a syntax that looks like a "process instance".
  
  ClkGen : ClockGenerator(
    Clk_C        => RefClk_C,
    clkphaselow  => CLK_PHASE_LOW,
    clkphasehigh => CLK_PHASE_HIGH);


  i_umcL65_LL_FLL_model_1: umcL65_LL_FLL_model
    port map (
      FLLCLK => open,
      FLLOE  => '1',
      REFCLK => RefClk_C,
      LOCK   => open,
      CFGREQ => '0',
      CFGACK => open,
      CFGAD  => "00",
      CFGD   => x"00000000",
      CFGQ   => open,
      CFGWEB => '1',
      RSTB   => Rst_RB,
      PWDB   => Rst_RB,
      TM     => '0',
      TE     => '0',
      TD     => '0',
      TQ     => open);


  -- apply hard coded stimuli
  -----------------------------------------------------------------------------
  StimAppli : process
  begin
    
    Rst_RB <= '0';

    AppliLoop : while true loop
      wait until RefClk_C'event and RefClk_C = '1';

      -- wait until time has come for stimulus application
      wait for STIMULI_APPLICATION_TIME;

      -- apply stimulus to MUT
      Rst_RB <= '1';
    end loop AppliLoop;
    
  end process StimAppli;
  
  
end rtl;

