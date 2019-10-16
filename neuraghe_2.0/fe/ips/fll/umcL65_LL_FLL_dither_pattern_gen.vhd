-------------------------------------------------------------------------------
-- Title      : umcL65 Frequency Locked Loop Digital Controlled Oscillator 
-- Project    : PULP 65nm
-------------------------------------------------------------------------------
-- File       : umcL65_LL_dither_pattern_gen.vhd
-- Author     : David Bellasi  <bellasi@ee.ethz.ch>
-- Company    : Integrated Systems Laboratory, ETH Zurich
-- Created    : 2015-03-18
-- Last update: 2015-04-02
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : 
-------------------------------------------------------------------------------
-- Description: Dither pattern generator
--              Generates a sequence of ideally spaced zeros and ones
--              in which the percentage of ones corresponds to the 
--              fractional number present at the input of the unit.
--
--              The circuit that produces such a sequence is a simple
--              sigma-delta loop with one-bit quantizer.
--
-------------------------------------------------------------------------------
-- Copyright (c) 2015 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author              Description
-- 2015-03-18  1.0      bellasid            created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity umcL65_LL_FLL_dither_pattern_gen is
  generic (
    FRACTIONAL_BITS : natural := 3
    );
  port(
    -- inputs
    Frac_DI          : in  std_logic_vector(FRACTIONAL_BITS-1 downto 0);  -- fractional bits input
    Update_SI        : in  std_logic;
    --
    -- outputs
    DitherPattern_DO : out std_logic;
    --
    -- config signals
    ClkDiv_SI        : in  std_logic_vector(4 downto 0);
    En_SI            : in  std_logic;
    --
    -- Test port
    TestMode_TI      : in std_logic;
    --
    -- general signals
    Clk_CI           : in  std_logic;  -- DCO clock or any integer division of it
    Rst_RBI          : in  std_logic    -- reset
    );
end umcL65_LL_FLL_dither_pattern_gen;


architecture rtl of umcL65_LL_FLL_dither_pattern_gen is

  signal Frac_DP, Frac_DN         : std_logic_vector(FRACTIONAL_BITS-1 downto 0);
  --
  signal ClkCount_DN, ClkCount_DP : unsigned(4 downto 0);
  signal ClkEn_S                  : std_logic;
  --  
  signal Input_D                  : signed(FRACTIONAL_BITS+1 downto 0);
  --
  signal Delta_D                  : signed(FRACTIONAL_BITS+1 downto 0);
  --
  signal Sigma_DP, Sigma_DN       : signed(FRACTIONAL_BITS downto 0);
  -- NOTE: the accumulator (sigma) only assumes values between -1 and 1,
  -- requires one bit more that the input wordwidth

  signal Output_D : std_logic;
  
begin

  -----------------------------------------------------------------------------
  -- Clock Divider
  -----------------------------------------------------------------------------

  update_clkcount : process (ClkCount_DP, ClkDiv_SI)
  begin  -- process update_clkcount
    ClkCount_DN <= ClkCount_DP - 1;
    ClkEn_S     <= '0';
    if ClkCount_DP = to_unsigned(0, ClkCount_DP'length) then
      ClkCount_DN <= unsigned(ClkDiv_SI);
      ClkEn_S     <= '1';
    end if;
  end process update_clkcount;

  clkcount : process (Clk_CI, Rst_RBI)
  begin
    if Rst_RBI = '0' then
      ClkCount_DP <= (others => '0');
    elsif Clk_CI'event and Clk_CI = '1' then
      if En_SI = '1' then
        ClkCount_DP <= ClkCount_DN;
      end if;
    end if;
  end process clkcount;


  -----------------------------------------------------------------------------
  -- Dither pattern generator (sigma delta loop with single bit quantizer)
  -----------------------------------------------------------------------------

  Frac_DN <= Frac_DI;

  Input_D          <= signed("00" & Frac_DP);  -- extend with signed and integer bit
  DitherPattern_DO <= Output_D;

  DeltaSigma : process (Delta_D, Input_D, Output_D, Sigma_DP)
  begin  -- process accumulate

    Delta_D <= Input_D - to_signed(2**FRACTIONAL_BITS, Delta_D'length);
    if Output_D = '0' then
      Delta_D <= Input_D;
    end if;

    Sigma_DN <= Sigma_DP + Delta_D(Delta_D'length-2 downto 0);

    Output_D <= '0';
    if Sigma_DP >= to_signed(0, Sigma_DP'length) then
      Output_D <= '1';
    end if;
    
  end process DeltaSigma;


  mem : process (Clk_CI, Rst_RBI)
  begin  -- process mem
    if Rst_RBI = '0' then               -- asynchronous reset (active low)
      Sigma_DP <= (others => '0');
      Frac_DP  <= (others => '0');
    elsif Clk_CI'event and Clk_CI = '1' then  -- rising clock edge
      if (En_SI = '1' and ClkEn_S = '1') then
        Sigma_DP <= Sigma_DN;
      end if;
      if (Update_SI = '1' or TestMode_TI = '1') then
        Frac_DP <= Frac_DN;
      end if;
    end if;
  end process mem;

  
end rtl;

