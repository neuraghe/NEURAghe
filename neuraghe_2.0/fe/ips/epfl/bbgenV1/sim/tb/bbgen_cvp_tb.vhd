-------------------------------------------------------------------------------
-- Title      : Testbench for the bbgen CVP interface
-------------------------------------------------------------------------------
-- File       : bbgen_cvp_tb.vhd
-- Author     : Christoph Thomas Mueller <christoph.mueller@epfl.ch>
-- Company    : EPFL Lausanne
-- Created    : 2015-05-29
-- Last update: 2015-06-03
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2015 EPFL Lausanne
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Author   Description
-- 2015-05-29  tcmuelle Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cvp_package.all;
use work.bbgen_package.all;

entity bbgen_cvp_tb is

end entity bbgen_cvp_tb;

architecture tb of bbgen_cvp_tb is

  signal cvp_ms : CVP_BUS_MS_t;
  signal cvp_sm : CVP_BUS_SM_t;

  signal clk       : std_logic := '0';
  signal clk_bbgen : std_logic := '0';
  signal nRST      : std_logic := '0';
  signal data      : std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
  signal done      : std_logic := '0';

  component bbgen_control is
    port (
      reference_clk             : in  std_logic;
      nRST                      : in  std_logic;
      cvp_req                   : in  std_logic;
      cvp_ack                   : out std_logic;
      cvp_w_data                : in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
      cvp_r_data                : out std_logic_vector(CVP_DATA_WIDTH -1 downto 0);
      cvp_addr                  : in  std_logic_vector(CVP_ADDR_WIDTH -1 downto 0);
      cvp_rw                    : in  std_logic;
      cvp_be                    : in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
      cvp_error                 : out std_logic;
      monitor_nwell_UB          : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_nwell_LB          : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_pwell_UB          : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_pwell_LB          : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_nwell_clk         : out std_logic;
      monitor_pos_pwell_clk     : out std_logic;
      monitor_neg_pwell_clk     : out std_logic;
      monitor_comp_nwell_UB     : in  std_logic;
      monitor_comp_nwell_LB     : in  std_logic;
      monitor_comp_pos_pwell_UB : in  std_logic;
      monitor_comp_pos_pwell_LB : in  std_logic;
      monitor_comp_neg_pwell_UB : in  std_logic;
      monitor_comp_neg_pwell_LB : in  std_logic;
      driver_sel_nwell          : out std_logic_vector(1 downto 0);
      driver_sel_pwell          : out std_logic_vector(1 downto 0);
      driver_charge_clk         : out std_logic;
      preset_select             : in  std_logic_vector(1 downto 0);
      preset_activate           : in  std_logic);
  end component bbgen_control;

  signal monitor_nwell_UB          : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
  signal monitor_nwell_LB          : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
  signal monitor_pwell_UB          : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
  signal monitor_pwell_LB          : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
  
  signal monitor_nwell_clk         : std_logic;
  signal monitor_pos_pwell_clk     : std_logic;
  signal monitor_neg_pwell_clk     : std_logic;

  signal monitor_comp_nwell_UB     : std_logic;
  signal monitor_comp_nwell_LB     : std_logic;
  signal monitor_comp_pos_pwell_UB : std_logic;
  signal monitor_comp_pos_pwell_LB : std_logic;
  signal monitor_comp_neg_pwell_UB : std_logic;
  signal monitor_comp_neg_pwell_LB : std_logic;

  signal driver_sel_nwell          : std_logic_vector(1 downto 0);
  signal driver_sel_pwell          : std_logic_vector(1 downto 0);

  signal driver_charge_clk         : std_logic;
  signal preset_select             : std_logic_vector(1 downto 0);
  signal preset_activate           : std_logic;
begin  -- architecture tb

  bbgen_control_1 : entity work.bbgen_control
    port map (
      reference_clk             => clk_bbgen,
      nRST                      => nRST,
      cvp_req                   => cvp_ms.req,
      cvp_ack                   => cvp_sm.ack,
      cvp_w_data                => cvp_ms.w_data,
      cvp_r_data                => cvp_sm.r_data,
      cvp_addr                  => cvp_ms.addr,
      cvp_rw                    => cvp_ms.rw,
      cvp_be                    => cvp_ms.be,
      cvp_error                 => cvp_sm.err,
      monitor_nwell_UB          => monitor_nwell_UB,
      monitor_nwell_LB          => monitor_nwell_LB,
      monitor_pwell_UB          => monitor_pwell_UB,
      monitor_pwell_LB          => monitor_pwell_LB,
      monitor_nwell_clk         => monitor_nwell_clk,
      monitor_pos_pwell_clk     => monitor_pos_pwell_clk,
      monitor_neg_pwell_clk     => monitor_neg_pwell_clk,
      monitor_comp_nwell_UB     => monitor_comp_nwell_UB,
      monitor_comp_nwell_LB     => monitor_comp_nwell_LB,
      monitor_comp_pos_pwell_UB => monitor_comp_pos_pwell_UB,
      monitor_comp_pos_pwell_LB => monitor_comp_pos_pwell_LB,
      monitor_comp_neg_pwell_UB => monitor_comp_neg_pwell_UB,
      monitor_comp_neg_pwell_LB => monitor_comp_neg_pwell_LB,
      driver_sel_nwell          => driver_sel_nwell,
      driver_sel_pwell          => driver_sel_pwell,
      driver_charge_clk         => driver_charge_clk,
      preset_select             => preset_select,
      preset_activate           => preset_activate);

  -- 100 MHz clock
  clk       <= '0' when done = '1' else not clk       after 5 ns;
  -- some clock as uneven as possible (prime ps...)
  clk_bbgen <= '0' when done = '1' else not clk_bbgen after 7333 ps;
  nRST      <= '1'                                    after 101 ns;
  wavegen : process is

  begin  -- process wavegen
    CVP_INIT(cvp_ms);
    CVP_WRITE(cvp_ms, cvp_sm, (others => '0'), (others => '1'));
    CVP_READ(cvp_ms, cvp_sm, (others  => '0'), data);
    done <= '1';
    wait until false;
  end process wavegen;

end architecture tb;

