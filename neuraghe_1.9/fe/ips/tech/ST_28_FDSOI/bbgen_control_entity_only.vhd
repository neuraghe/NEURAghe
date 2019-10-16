-------------------------------------------------------------------------------
-- Title      : Digital control block for the body biasing generator
-------------------------------------------------------------------------------
-- File       : bbgen_control.vhdl
-- Author     : Christoph Thomas Mueller <christoph.mueller@epfl.ch>
-- Company    : EPFL Lausanne
-- Created    : 2015-05-21
-- Last update: 2015-06-05
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

entity bbgen_control is

  port (
    reference_clk : in  std_logic;
    nRST          : in  std_logic;
    ---------------------------------------------------------------------------
    -- CVP interface
    ---------------------------------------------------------------------------
    cvp_req       : in  std_logic;
    cvp_ack       : out std_logic;
    cvp_w_data    : in  std_logic_vector(63 downto 0);
    cvp_r_data    : out std_logic_vector(63 downto 0);
    cvp_addr      : in  std_logic_vector(31 downto 0);
    cvp_rw        : in  std_logic;
    cvp_be        : in  std_logic_vector(7 downto 0);
    cvp_error     : out std_logic;

    ---------------------------------------------------------------------------
    -- interface to monitor block
    ---------------------------------------------------------------------------
    -- reference settings
    monitor_nwell_UB : out std_logic_vector(15 downto 0);  -- upper bound for nwell comperator
    monitor_nwell_LB : out std_logic_vector(15 downto 0);  -- lower bound for nwell comperator
    monitor_pwell_UB : out std_logic_vector(15 downto 0);  -- upper bound for pwell comperator
    monitor_pwell_LB : out std_logic_vector(15 downto 0);  -- lower bound for pwell comperator

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

    ---------------------------------------------------------------------------
    -- interface to externally select a preset
    ---------------------------------------------------------------------------

    preset_select : in std_logic_vector(1 downto 0);
    preset_activate : in std_logic;

    ---------------------------------------------------------------------------
    -- High active signal, high as soon as the body bias target is reached
    -- after a mode change.
    ---------------------------------------------------------------------------
    target_reached : out std_logic
    );
end entity bbgen_control;

