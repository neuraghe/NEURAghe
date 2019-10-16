-------------------------------------------------------------------------------
-- Title      : Digital control block for the body biasing generator
-------------------------------------------------------------------------------
-- File       : bbgen_control.vhdl
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
use bbgen_lib.bbgen_package.all;
use bbgen_lib.cvp_package.all;

entity bbgen_control is

  port (
    reference_clk : in  std_logic;
    nRST          : in  std_logic;
    ---------------------------------------------------------------------------
    -- CVP interface
    ---------------------------------------------------------------------------
    cvp_req       : in  std_logic;
    cvp_ack       : out std_logic;
    cvp_w_data    : in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
    cvp_r_data    : out std_logic_vector(CVP_DATA_WIDTH -1 downto 0);
    cvp_addr      : in  std_logic_vector(CVP_ADDR_WIDTH -1 downto 0);
    cvp_rw        : in  std_logic;
    cvp_be        : in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
    cvp_error     : out std_logic;

    ---------------------------------------------------------------------------
    -- interface to monitor block
    ---------------------------------------------------------------------------
    -- reference settings
    monitor_nwell_UB : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);  -- upper bound for nwell comperator
    monitor_nwell_LB : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);  -- lower bound for nwell comperator
    monitor_pwell_UB : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);  -- upper bound for pwell comperator
    monitor_pwell_LB : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);  -- lower bound for pwell comperator

    -- sampling clocks
    monitor_nwell_clk     : out std_logic;
    monitor_pos_pwell_clk : out std_logic;
    monitor_neg_pwell_clk : out std_logic;

    -- comparator outputs
    monitor_comp_nwell_UB     : in std_logic;
    monitor_comp_nwell_LB     : in std_logic;
    monitor_comp_pos_pwell_UB : in std_logic;
    monitor_comp_pos_pwell_LB : in std_logic;
    monitor_comp_neg_pwell_UB : in std_logic;
    monitor_comp_neg_pwell_LB : in std_logic;

    ---------------------------------------------------------------------------
    -- Interface to the driver block
    ---------------------------------------------------------------------------

    driver_sel_nwell  : out std_logic_vector(1 downto 0);
    driver_sel_pwell  : out std_logic_vector(1 downto 0);
    driver_charge_clk : out std_logic;
    -- external static signal to mark driver as weak, selecting a slower charge pump clock
    driver_weak       : in  std_logic;

    ---------------------------------------------------------------------------
    -- interface to externally select a preset
    ---------------------------------------------------------------------------

    preset_select   : in std_logic_vector(1 downto 0);
    preset_activate : in std_logic;

    ---------------------------------------------------------------------------
    -- High active signal, high as soon as the body bias targets after a mode
    -- change has been achieved.
    ---------------------------------------------------------------------------
    target_reached : out std_logic;

    ---------------------------------------------------------------------------
    -- force sleep signal to prevent bbgen to turn on
    ---------------------------------------------------------------------------
    force_sleep : in std_logic
    );
end entity bbgen_control;

architecture behavioral of bbgen_control is

  signal nwell_control_state_s : BBGEN_NWELL_CONTROL_STATE_t;
  signal pwell_control_state_s : BBGEN_PWELL_CONTROL_STATE_t;

  signal pwell_update_s, nwell_update_s : std_logic;

  component bbgen_pwell_control
    port (
      clk                            : in  std_logic;
      clk_fast                       : in  std_logic;
      nRST                           : in  std_logic;
      driver_sel_pwell               : out std_logic_vector(1 downto 0);
      driver_pwell_charge_clk        : out std_logic;
      monitor_comp_pos_pwell_UB      : in  std_logic;
      monitor_comp_pos_pwell_LB      : in  std_logic;
      monitor_comp_neg_pwell_UB      : in  std_logic;
      monitor_comp_neg_pwell_LB      : in  std_logic;
      monitor_pwell_neg_sampling_clk : out std_logic;
      monitor_pwell_pos_sampling_clk : out std_logic;
      bbgen_register_bank            : in  BBGEN_REGISTER_BANK_t;
      monitor_pwell_UB               : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_pwell_LB               : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      nwell_control_state            : in  BBGEN_NWELL_CONTROL_STATE_t;
      pwell_control_state            : out BBGEN_PWELL_CONTROL_STATE_t;
      pwell_update                   : in  std_logic
      );
  end component;

  component bbgen_nwell_control
    port (
      clk                        : in  std_logic;
      nRST                       : in  std_logic;
      driver_sel_nwell           : out std_logic_vector(1 downto 0);
      monitor_comp_nwell_UB      : in  std_logic;
      monitor_comp_nwell_LB      : in  std_logic;
      monitor_nwell_sampling_clk : out std_logic;
      bbgen_register_bank        : in  BBGEN_REGISTER_BANK_t;
      monitor_nwell_UB           : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_nwell_LB           : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      nwell_control_state        : out BBGEN_NWELL_CONTROL_STATE_t;
      pwell_control_state        : in  BBGEN_PWELL_CONTROL_STATE_t;
      nwell_update               : in  std_logic
      );
  end component;

  component bbgen_register_bank is
    port (
      clk                 : in  std_logic;
      nRST                : in  std_logic;
      preset_select       : in  std_logic_vector(1 downto 0);
      preset_activate     : in  std_logic;
      driver_weak         : in  std_logic;
      bbgen_register_bank : out BBGEN_REGISTER_BANK_t;
      bbgen_status_bits   : in  BBGEN_STATUS_BITS_t;
      bbgen_en            : in  std_logic;
      bbgen_w_data        : in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
      bbgen_r_data        : out std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
      bbgen_addr          : in  std_logic_vector(CVP_ADDR_WIDTH - 1 downto 0);
      bbgen_rw            : in  std_logic;
      bbgen_be            : in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
      bbgen_error         : out std_logic;
      nwell_control_state : in  BBGEN_NWELL_CONTROL_STATE_t;
      pwell_control_state : in  BBGEN_PWELL_CONTROL_STATE_t;
      pwell_update        : out std_logic;
      nwell_update        : out std_logic;
      force_sleep         : in  std_logic
      );
  end component bbgen_register_bank;

  component bbgen_cvp_interface is
    port (
      clk          : in  std_logic;
      nRST         : in  std_logic;
      cvp_req      : in  std_logic;
      cvp_ack      : out std_logic;
      cvp_w_data   : in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
      cvp_r_data   : out std_logic_vector(CVP_DATA_WIDTH -1 downto 0);
      cvp_addr     : in  std_logic_vector(CVP_ADDR_WIDTH -1 downto 0);
      cvp_rw       : in  std_logic;
      cvp_be       : in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
      cvp_error    : out std_logic;
      bbgen_en     : out std_logic;
      bbgen_w_data : out std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
      bbgen_r_data : in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
      bbgen_addr   : out std_logic_vector(CVP_ADDR_WIDTH - 1 downto 0);
      bbgen_rw     : out std_logic;
      bbgen_be     : out std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
      bbgen_error  : in  std_logic);
  end component bbgen_cvp_interface;

  signal bbgen_register_bank_s : BBGEN_REGISTER_BANK_t;
  signal bbgen_status_bits     : BBGEN_STATUS_BITS_t;
  signal bbgen_en              : std_logic;
  signal bbgen_w_data          : std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
  signal bbgen_r_data          : std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
  signal bbgen_addr            : std_logic_vector(CVP_ADDR_WIDTH - 1 downto 0);
  signal bbgen_rw              : std_logic;
  signal bbgen_be              : std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
  signal bbgen_error           : std_logic;

  signal chargepump_clock_divider : unsigned(BBGEN_CLOCK_DIVISION_COUNTER_WIDTH -1 downto 0);

  component bbgen_clock_box is
    generic (
    INPUT_CLOCK_BYPASS : std_logic);
    port (
      clk_in        : in  std_logic;
      nRST          : in  std_logic;
      clk_out       : out std_logic;
      clock_divider : in  unsigned(BBGEN_CLOCK_DIVISION_COUNTER_WIDTH - 1 downto 0)
      );
  end component bbgen_clock_box;


  signal clk_fast, clk_slow : std_logic;


begin  -- architecture behavioral

  bbgen_pwell_control_1 : entity bbgen_lib.bbgen_pwell_control
    port map (
      clk                            => clk_slow,
      clk_fast                       => clk_fast,
      nRST                           => nRST,
      driver_sel_pwell               => driver_sel_pwell,
      driver_pwell_charge_clk        => driver_charge_clk,
      monitor_comp_pos_pwell_UB      => bbgen_status_bits.pwell_pos_comp_UB,
      monitor_comp_pos_pwell_LB      => bbgen_status_bits.pwell_pos_comp_LB,
      monitor_comp_neg_pwell_UB      => bbgen_status_bits.pwell_neg_comp_UB,
      monitor_comp_neg_pwell_LB      => bbgen_status_bits.pwell_neg_comp_LB,
      monitor_pwell_neg_sampling_clk => monitor_neg_pwell_clk,
      monitor_pwell_pos_sampling_clk => monitor_pos_pwell_clk,
      bbgen_register_bank            => bbgen_register_bank_s,
      monitor_pwell_UB               => bbgen_status_bits.pwell_UB_ref,
      monitor_pwell_LB               => bbgen_status_bits.pwell_LB_ref,
      nwell_control_state            => nwell_control_state_s,
      pwell_control_state            => pwell_control_state_s,
      pwell_update                   => pwell_update_s
      );

  bbgen_nwell_control_1 : bbgen_nwell_control
    port map (
      clk                        => clk_slow,
      nRST                       => nRST,
      driver_sel_nwell           => driver_sel_nwell,
      monitor_comp_nwell_UB      => bbgen_status_bits.nwell_comp_UB,
      monitor_comp_nwell_LB      => bbgen_status_bits.nwell_comp_LB,
      monitor_nwell_sampling_clk => monitor_nwell_clk,
      bbgen_register_bank        => bbgen_register_bank_s,
      monitor_nwell_UB           => bbgen_status_bits.nwell_UB_ref,
      monitor_nwell_LB           => bbgen_status_bits.nwell_LB_ref,
      nwell_control_state        => nwell_control_state_s,
      pwell_control_state        => pwell_control_state_s,
      nwell_update               => nwell_update_s
      );


  bbgen_sampling_clock_box : entity bbgen_lib.bbgen_clock_box
    generic map (
      INPUT_CLOCK_BYPASS => '0')
    port map (
      clk_in        => reference_clk,
      nRST          => nRST,
      clk_out       => clk_slow,
      clock_divider => bbgen_register_bank_s.sample_clock_divider);

  bbgen_charge_pump_clock_box : entity bbgen_lib.bbgen_clock_box
    port map (
      clk_in        => reference_clk,
      nRST          => nRST,
      clk_out       => clk_fast,
      clock_divider => chargepump_clock_divider);
  -- select the right divider depending on the kind of divider used
  chargepump_clock_divider <= bbgen_register_bank_s.weak_chargepump_clock_divider when driver_weak = '1' else bbgen_register_bank_s.chargepump_clock_divider;

  bbgen_register_bank_1 : entity bbgen_lib.bbgen_register_bank
    port map (
      clk                 => clk_slow,
      nRST                => nRST,
      preset_select       => preset_select,
      preset_activate     => preset_activate,
      driver_weak         => driver_weak,
      bbgen_register_bank => bbgen_register_bank_s,
      bbgen_status_bits   => bbgen_status_bits,
      bbgen_en            => bbgen_en,
      bbgen_w_data        => bbgen_w_data,
      bbgen_r_data        => bbgen_r_data,
      bbgen_addr          => bbgen_addr,
      bbgen_rw            => bbgen_rw,
      bbgen_be            => bbgen_be,
      bbgen_error         => bbgen_error,
      nwell_control_state => nwell_control_state_s,
      pwell_control_state => pwell_control_state_s,
      nwell_update        => nwell_update_s,
      pwell_update        => pwell_update_s,
      force_sleep         => force_sleep
      );

  bbgen_cvp_interface_1 : entity bbgen_lib.bbgen_cvp_interface
    port map (
      clk          => clk_slow,
      nRST         => nRST,
      cvp_req      => cvp_req,
      cvp_ack      => cvp_ack,
      cvp_w_data   => cvp_w_data,
      cvp_r_data   => cvp_r_data,
      cvp_addr     => cvp_addr,
      cvp_rw       => cvp_rw,
      cvp_be       => cvp_be,
      cvp_error    => cvp_error,
      bbgen_en     => bbgen_en,
      bbgen_w_data => bbgen_w_data,
      bbgen_r_data => bbgen_r_data,
      bbgen_addr   => bbgen_addr,
      bbgen_rw     => bbgen_rw,
      bbgen_be     => bbgen_be,
      bbgen_error  => bbgen_error);

  target_reached <= bbgen_register_bank_s.target_reached;

  monitor_nwell_LB <= bbgen_status_bits.nwell_LB_ref;
  monitor_nwell_UB <= bbgen_status_bits.nwell_UB_ref;
  monitor_pwell_LB <= bbgen_status_bits.pwell_LB_ref;
  monitor_pwell_UB <= bbgen_status_bits.pwell_UB_ref;

  bbgen_status_bits.nwell_comp_UB     <= monitor_comp_nwell_UB;
  bbgen_status_bits.nwell_comp_LB     <= monitor_comp_nwell_LB;
  bbgen_status_bits.pwell_pos_comp_UB <= monitor_comp_pos_pwell_UB;
  bbgen_status_bits.pwell_pos_comp_LB <= monitor_comp_pos_pwell_LB;
  bbgen_status_bits.pwell_neg_comp_UB <= monitor_comp_neg_pwell_UB;
  bbgen_status_bits.pwell_neg_comp_LB <= monitor_comp_neg_pwell_LB;

  
end architecture behavioral;
