-------------------------------------------------------------------------------
-- Title      : bbgen package
-------------------------------------------------------------------------------
-- File       : bbgen_package.vhdl
-- Author     : Christoph Thomas Mueller <christoph.mueller@epfl.ch>
-- Company    : EPFL Lausanne
-- Created    : 2015-05-21
-- Last update: 2015-06-08
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2015 EPFL Lausanne
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Author   Description
-- 2015-05-21  tcmuelle Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library bbgen_lib;
package bbgen_package is

  constant BBGEN_DAC_WIDTH         : integer := 5;
  constant BBGEN_COMP_WINDOW_WIDTH : integer := 2;

  constant BBGEN_IDLE_COUNTER_WIDTH : integer   := 16;
  constant BBGEN_P_NEGATIVE         : std_logic := '1';
  constant BBGEN_P_POSITIVE         : std_logic := '0';

  constant BBGEN_REG_NUM : integer := 7;

  constant BBGEN_PWELL_DO_NOTHING           : std_logic_vector(1 downto 0) := "00";
  constant BBGEN_PWELL_NEGATIVE_CHARGE_PUMP : std_logic_vector(1 downto 0) := "10";
  constant BBGEN_PWELL_CHARGE_GND           : std_logic_vector(1 downto 0) := "01";
  constant BBGEN_PWELL_CHARGE_VDD           : std_logic_vector(1 downto 0) := "11";

  constant BBGEN_NWELL_DO_NOTHING    : std_logic_vector(1 downto 0) := "00";
  constant BBGEN_NWELL_CHARGE_GND    : std_logic_vector(1 downto 0) := "01";
  constant BBGEN_NWELL_CHARGE_VDD1V8 : std_logic_vector(1 downto 0) := "10";

  constant BBGEN_BELOW_THRESHOLD : std_logic_vector(1 downto 0) := "00";
  constant BBGEN_ABOVE_THRESHOLD : std_logic_vector(1 downto 0) := "11";
  constant BBGEN_TARGET_REACHED  : std_logic_vector(1 downto 0) := "01";

  constant BBGEN_CLOCK_DIVISION_COUNTER_WIDTH : integer := 4;

  -----------------------------------------------------------------------------
  -- Commands to configure the BBGEN
  -----------------------------------------------------------------------------
  -- set nwell bound
  constant BBGEN_CMD_NWELL_BOUND          : std_logic_vector(7 downto 0) := x"01";
  -- set pwell bound
  constant BBGEN_CMD_PWELL_BOUND          : std_logic_vector(7 downto 0) := x"02";
  -- set nwell window size 
  constant BBGEN_CMD_NWELL_WSIZE          : std_logic_vector(7 downto 0) := x"03";
  -- set pwell window size 
  constant BBGEN_CMD_PWELL_WSIZE          : std_logic_vector(7 downto 0) := x"04";
  -- set idle time for sampler when its value has been reached
  constant BBGEN_CMD_IDLE_TIME            : std_logic_vector(7 downto 0) := x"05";
  -- set sampling clock division
  constant BBGEN_CMD_SAMPLE_CLK           : std_logic_vector(7 downto 0) := x"06";
  -- set preset
  constant BBGEN_CMD_SET_PRESET           : std_logic_vector(7 downto 0) := x"07";
  -- select a preset
  constant BBGEN_CMD_SELECT_PRESET        : std_logic_vector(7 downto 0) := x"08";
  -- pwell window size for the transition from positive to negative and vice versa
  constant BBGEN_CMD_GND_TRANSITION_WSIZE : std_logic_vector(7 downto 0) := x"09";
  -- enable/disable pwell and nwell bbgen
  constant BBGEN_CMD_ENABLE_DISABLE       : std_logic_vector(7 downto 0) := x"0A";
  -- Charge pump clock
  constant BBGEN_CMD_CHARGEPUMP_CLK : std_logic_vector(7 downto 0) := x"0B";

  -----------------------------------------------------------------------------
  -- Enumeration types for NWELL & PWELL control blocks
  -----------------------------------------------------------------------------
  type BBGEN_NWELL_CONTROL_STATE_t is (INIT, IDLE, SAMPLE, CHARGEDISCHARGE, SLEEP);
  type BBGEN_PWELL_CONTROL_STATE_t is (INIT, nIDLE, nSAMPLE, nCHARGEnDISCHARGE, npTRANSITION, pnTRANSITION, pSAMPLE, pCHARGEpDISCHARGE, pIDLE, SLEEP);

  type BBGEN_NWELL_CONTROL_REGISTER_t is record
    idle_count  : unsigned(BBGEN_IDLE_COUNTER_WIDTH - 1 downto 0);
    sel         : std_logic_vector(1 downto 0);
    slow_charge : std_logic;
    UB          : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
    LB          : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
  end record BBGEN_NWELL_CONTROL_REGISTER_t;

  constant BBGEN_NWELL_CONTROL_REGISTER_RESET : BBGEN_NWELL_CONTROL_REGISTER_t := (
    idle_count  => to_unsigned(100, BBGEN_IDLE_COUNTER_WIDTH),
    sel         => (others => '0'),
    slow_charge => '0',
    UB          => (others => '0'),
    LB          => (others => '0')
    );

  type BBGEN_PWELL_CONTROL_REGISTER_t is record
    idle_count      : unsigned(BBGEN_IDLE_COUNTER_WIDTH - 1 downto 0);
    sel             : std_logic_vector(1 downto 0);
    slow_charge     : std_logic;
    transition_flag : std_logic;
    operation_mode  : std_logic;
    UB              : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
    LB              : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
    pwell_mode      : std_logic;
  end record BBGEN_PWELL_CONTROL_REGISTER_t;

  constant BBGEN_PWELL_CONTROL_REGISTER_RESET : BBGEN_PWELL_CONTROL_REGISTER_t := (
    idle_count      => to_unsigned(100, BBGEN_IDLE_COUNTER_WIDTH),
    sel             => (others => '0'),
    slow_charge     => '0',
    transition_flag => '0',
    operation_mode  => BBGEN_P_POSITIVE,
    UB              => (others => '0'),
    LB              => (others => '0'),
    pwell_mode      => '0'
    );

  type BBGEN_REGISTER_BANK_t is record
    nwell_bound                : unsigned(BBGEN_DAC_WIDTH - 1 downto 0);
    nwell_bound_window_size    : unsigned(BBGEN_COMP_WINDOW_WIDTH - 1 downto 0);
    -- pwell 
    pwell_bound                : signed(BBGEN_DAC_WIDTH downto 0);
    pwell_bound_window_size    : unsigned(BBGEN_COMP_WINDOW_WIDTH - 1 downto 0);
    idle_time                  : unsigned(BBGEN_IDLE_COUNTER_WIDTH - 1 downto 0);
    gnd_transition_window_size : unsigned(1 downto 0);
    sample_clock_divider       : unsigned(BBGEN_CLOCK_DIVISION_COUNTER_WIDTH - 1 downto 0);
    chargepump_clock_divider   : unsigned(BBGEN_CLOCK_DIVISION_COUNTER_WIDTH - 1 downto 0);
    weak_chargepump_clock_divider   : unsigned(BBGEN_CLOCK_DIVISION_COUNTER_WIDTH - 1 downto 0);
    -- presets
    nwell_bound_preset0        : unsigned(BBGEN_DAC_WIDTH - 1 downto 0);
    pwell_bound_preset0        : signed(BBGEN_DAC_WIDTH downto 0);
    nwell_bound_preset1        : unsigned(BBGEN_DAC_WIDTH - 1 downto 0);
    pwell_bound_preset1        : signed(BBGEN_DAC_WIDTH downto 0);
    nwell_bound_preset2        : unsigned(BBGEN_DAC_WIDTH - 1 downto 0);
    pwell_bound_preset2        : signed(BBGEN_DAC_WIDTH downto 0);
    nwell_bound_preset3        : unsigned(BBGEN_DAC_WIDTH - 1 downto 0);
    pwell_bound_preset3        : signed(BBGEN_DAC_WIDTH downto 0);
    -- return value
    return_register            : std_logic_vector(31 downto 0);
    -- target reached
    target_reached             : std_logic;
    -- pwell control enable/disable
    pwell_enable               : std_logic;
    -- nwell control enable/disable
    nwell_enable               : std_logic;
    
  end record BBGEN_REGISTER_BANK_t;

  constant BBGEN_REGISTER_BANK_RESET : BBGEN_REGISTER_BANK_t := (
    nwell_bound                => to_unsigned(8,BBGEN_DAC_WIDTH),
    nwell_bound_window_size    => (others => '0'),
    pwell_bound                => (others => '0'),
    pwell_bound_window_size    => (others => '0'),
    -- initial value for the idle counter, the larger the longer the period
    -- between two sampling events after the value has settled
    idle_time                  => (others => '0'),
    -- Windowsize for flipping to positive / negative
    gnd_transition_window_size => to_unsigned(1, 2),
    -- 100 MHz -> 10 MHz (5 cycles high phase, 5 cycles low phase)
    sample_clock_divider       => to_unsigned(5, BBGEN_CLOCK_DIVISION_COUNTER_WIDTH),
    chargepump_clock_divider   => (others => '0'),
    weak_chargepump_clock_divider => to_unsigned(2, BBGEN_CLOCK_DIVISION_COUNTER_WIDTH),
    -------------------------------------------------------------------------------
    -- Presets for biasing settings
    -------------------------------------------------------------------------------
    -- externally selectable presets
    nwell_bound_preset0        => to_unsigned(8,BBGEN_DAC_WIDTH),
    pwell_bound_preset0        => (others => '0'),
    nwell_bound_preset1        => to_unsigned(10,BBGEN_DAC_WIDTH),
    pwell_bound_preset1        => (others => '0'),
    nwell_bound_preset2        => to_unsigned(12,BBGEN_DAC_WIDTH),
    pwell_bound_preset2        => (others => '0'),
    nwell_bound_preset3        => to_unsigned(14,BBGEN_DAC_WIDTH),
    pwell_bound_preset3        => (others => '0'),
    ---------------------------------------------------------------------------
    -- return register
    ---------------------------------------------------------------------------
    return_register            => (others => '0'),
    ---------------------------------------------------------------------------
    -- target reached
    ---------------------------------------------------------------------------
    target_reached             => '0',
    pwell_enable               => '1',
    nwell_enable               => '1'
    );


  type BBGEN_STATUS_BITS_t is record
    nwell_comp_LB     : std_logic;
    nwell_comp_UB     : std_logic;
    pwell_pos_comp_LB : std_logic;
    pwell_pos_comp_UB : std_logic;
    pwell_neg_comp_LB : std_logic;
    pwell_neg_comp_UB : std_logic;
    nwell_LB_ref      : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
    nwell_UB_ref      : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);  -- pwell_UB_ref
    pwell_LB_ref      : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
    pwell_UB_ref      : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
  end record BBGEN_STATUS_BITS_t;


  --signal bbgen_register_bank : BBGEN_REGISTER_BANK_t := BBGEN_REGISTER_BANK_RESET;

end package bbgen_package;
