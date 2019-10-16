-------------------------------------------------------------------------------
-- Title      : umcL65 Frequency Locked Loop Digital Controlled Oscillator 
-- Project    : PULP 65nm
-------------------------------------------------------------------------------
-- File       : umcL65_LL_FLL_loop_filter_and_control.vhd
-- Author     : David Bellasi  <bellasi@ee.ethz.ch>
-- Company    : Integrated Systems Laboratory, ETH Zurich
-- Created    : 2015-03-18
-- Last update: 2015-04-02
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : 
-------------------------------------------------------------------------------
-- Description: Loop filter (= integrator with gain) and
--              control and configuration facilities
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

library work;
use work.RealARITH.all;


--library common_cells_lib;
--use common_cells_lib.all;
entity umcL65_LL_FLL_loop_filter_and_control is
  generic (
    CLK_PERIOD_QUANTIZER_WIDTH : natural := 16;
    GAIN_WORDWIDTH             : natural := 16;
    DCO_WORDWIDTH              : natural := 8;
    DITHER_WORDWIDTH           : natural := 8;
    LOCKTOLERANCE_WIDTH        : natural := 16;
    STABLE_CYCLE_WIDTH         : natural := 8;
    UNSTABLE_CYCLE_WIDTH       : natural := 8
    );
  port(
    -- configuration values
    cfg_gain            : in std_logic_vector(GAIN_WORDWIDTH-1 downto 0);  -- gain value (all fractional bits)
    cfg_setpoint        : in std_logic_vector(CLK_PERIOD_QUANTIZER_WIDTH-2 downto 0);  -- target clock multiplication factor
    cfg_lock_tolerance  : in std_logic_vector(LOCKTOLERANCE_WIDTH-1 downto 0);
    cfg_stable_cycles   : in std_logic_vector(STABLE_CYCLE_WIDTH-1 downto 0);
    cfg_unstable_cycles : in std_logic_vector(UNSTABLE_CYCLE_WIDTH-1 downto 0);

    -- from period quantizer
    clk_ref_mult_factor : in std_logic_vector(CLK_PERIOD_QUANTIZER_WIDTH-1 downto 0);  -- measured multiplication factor

    -- to dco
    dco_value    : out std_logic_vector(DCO_WORDWIDTH-1 downto 0);  -- current DCO value
    dither_value : out std_logic_vector(DITHER_WORDWIDTH-1 downto 0);  -- current dither value

    -- status
    lock       : out std_logic;
    lock_reset : in  std_logic;

    -- General signals
    enable : in std_logic;
    rst_n  : in std_logic;
    clk    : in std_logic  -- this entity is clocked with the ref clock
    );
end umcL65_LL_FLL_loop_filter_and_control;


architecture rtl of umcL65_LL_FLL_loop_filter_and_control is

  ----------------------------------------------------------------------
  -- Components declarations -------------------------------------------
  ----------------------------------------------------------------------

  ----------------------------------------------------------------------
  -- Signal declarations     -------------------------------------------
  ----------------------------------------------------------------------

  signal target_mult_factor : unsigned(CLK_PERIOD_QUANTIZER_WIDTH-2 downto 0);

  signal actual_mult_factor, actual_mult_factor_next : unsigned(CLK_PERIOD_QUANTIZER_WIDTH-1 downto 0);
  -- the actual clk_mult_factor requires more bits than the target mult_factorization
  -- to account for the case when the DCO runs faster than the target frequency.
  --
  signal delta                                       : signed(CLK_PERIOD_QUANTIZER_WIDTH+1 downto 0);
  -- delta holds the difference between target mult_factorization and
  --
  signal gain                                        : unsigned(GAIN_WORDWIDTH-1 downto 0);
  signal amp_delta                                   : signed((CLK_PERIOD_QUANTIZER_WIDTH+1+GAIN_WORDWIDTH+1)-1 downto 0);
  signal sigma, sigma_next                           : signed((DCO_WORDWIDTH-1+GAIN_WORDWIDTH-1+1)-1 downto 0);

  signal current_lock, current_lock_next         : std_logic;
  signal stable_counter, stable_counter_next     : unsigned(STABLE_CYCLE_WIDTH-1 downto 0);
  signal unstable_counter, unstable_counter_next : unsigned(UNSTABLE_CYCLE_WIDTH-1 downto 0);

  signal reset_or_disable : std_logic;

  ----------------------------------------------------------------------
  -- fixed-point constants   -------------------------------------------
  ----------------------------------------------------------------------

  constant TRG_MULT_FIXP  : FixP := (CLK_PERIOD_QUANTIZER_WIDTH-1, 0, u);
  constant ACT_MULT_FIXP  : FixP := (CLK_PERIOD_QUANTIZER_WIDTH, 0, u);
  constant DELTA_FIXP     : FixP := (CLK_PERIOD_QUANTIZER_WIDTH+1, 0, s);
  constant GAIN_FIXP      : FixP := (0, GAIN_WORDWIDTH, u);
  constant AMP_DELTA_FIXP : FixP := (CLK_PERIOD_QUANTIZER_WIDTH+1, GAIN_WORDWIDTH, s);
  constant SIGMA_FIXP     : FixP := (DCO_WORDWIDTH-1, GAIN_WORDWIDTH-1, s);


begin

  actual_mult_factor_next <= unsigned(clk_ref_mult_factor);
  target_mult_factor      <= unsigned(cfg_setpoint);
  gain                    <= unsigned(cfg_gain);

  delta <= RealSUB(target_mult_factor, actual_mult_factor, TRG_MULT_FIXP, ACT_MULT_FIXP, DELTA_FIXP, SatTrc);

  amp_delta <= RealMULT(delta, gain, DELTA_FIXP, GAIN_FIXP, AMP_DELTA_FIXP, SatTrc);

  sigma_next <= RealADD(amp_delta, sigma, AMP_DELTA_FIXP, SIGMA_FIXP, SIGMA_FIXP, SatTrc);

  -- The dco control code is given by the integer bits of the sigma signal
  -- (which is a signed integer between, say, -X and X-lsb) shifted to the positive
  -- range between 0 and 2X-lsb; i.e., the number has to be floored and a
  -- constant offset of X has to be added. All this is effectively done by
  -- simply inverting the signed bit (since the number is in 2's complement format)
  --
  dco_value <= not(sigma(sigma'length-1)) & std_logic_vector(sigma(sigma'length-2 downto sigma'length-(DCO_WORDWIDTH)));

  -- Dithering requires the fractional bits of the sigma signal. Again, since
  -- sigma is in 2's complement format we can simple take the fractional bits
  -- as they are:
  --
  dither_value <= std_logic_vector(sigma(sigma'length-(DCO_WORDWIDTH)-1 downto sigma'length-(DCO_WORDWIDTH)-DITHER_WORDWIDTH));


  reset_or_disable <= rst_n and enable;

  process (clk, reset_or_disable)
  begin  -- process
    if reset_or_disable = '0' then      -- asynchronous reset (active low)
      actual_mult_factor <= (others => '0');
      sigma              <= (others => '0');
      sigma(sigma'high)  <= '1';
    elsif clk'event and clk = '1' then  -- rising clock edge
      if enable = '1' then
        actual_mult_factor <= actual_mult_factor_next;
        sigma              <= sigma_next;
      end if;
    end if;
  end process;



  -- Lock signal assert/de-assert logic:
  -- Count consecutive cycles in which the delta signal stays within the
  -- tolerance specified by cfg_lock_tolerance. If the number of cycles specified
  -- by cfg_stable_cycles is reached the lock signal is asserted. Then, 
  -- if the lock signal is high, consecutive cycles are counted in which the
  -- error is out of tolerance. If the counter reaches the number of cycles
  -- specified by cfg_unstable_cycles, the lock is deasserted (i.e., the FLL is
  -- out of tune)

  process (cfg_lock_tolerance, cfg_stable_cycles, cfg_unstable_cycles,
           current_lock, delta, lock_reset, stable_counter, unstable_counter) is
  begin
    current_lock_next     <= current_lock;
    lock                  <= current_lock;
    unstable_counter_next <= unstable_counter;
    stable_counter_next   <= stable_counter;
    if unsigned(abs(delta)) < unsigned(cfg_lock_tolerance) then
      stable_counter_next   <= stable_counter + 1;
      unstable_counter_next <= (others => '0');
      if stable_counter = unsigned(cfg_stable_cycles) then
        stable_counter_next <= stable_counter;
        current_lock_next   <= '1';
      end if;
    else
      stable_counter_next   <= (others => '0');
      unstable_counter_next <= unstable_counter+1;
      if unstable_counter = unsigned(cfg_unstable_cycles) then
        unstable_counter_next <= unstable_counter;
        current_lock_next     <= '0';
      end if;
    end if;
    if lock_reset = '1' then
      current_lock_next     <= '0';
      unstable_counter_next <= (others => '0');
      stable_counter_next   <= (others => '0');
    end if;
  end process;


  process (clk, reset_or_disable) is
  begin  -- process
    if reset_or_disable = '0' then      -- asynchronous reset (active low)
      current_lock     <= '0';
      stable_counter   <= (others => '0');
      unstable_counter <= (others => '0');
    elsif clk'event and clk = '1' then  -- rising clock edge
      if enable = '1' then
        current_lock     <= current_lock_next;
        stable_counter   <= stable_counter_next;
        unstable_counter <= unstable_counter_next;
      end if;
    end if;
  end process;





end rtl;

