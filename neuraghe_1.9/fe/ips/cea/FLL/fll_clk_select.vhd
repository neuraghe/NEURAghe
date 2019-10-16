--!
--! @file fll_clk_select.vhd
--! @brief Frequency Locked Loop Clock Selector 
--! 
--! Glitch free Clock Selector
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
--! @par  Copyright (C) 2011 CEA
--! 
--! @par  Authors:
--!       Ivan MIRO PANADES
--! 
--! @par  Id: $Id: fll_clk_select.vhd 1 2014-01-15 16:11:08Z im219746 $
--! @par  Date: $Date: 2014-01-15 17:11:08 +0100 (Wed, 15 Jan 2014) $
--! @par  Revision: $Rev: 1 $
--!


LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY common_cells_lib;
USE common_cells_lib.ALL;

ENTITY fll_clk_select IS 
  PORT(
    rst_n       : IN  STD_LOGIC;
    clk_0       : IN  STD_LOGIC;
    clk_1       : IN  STD_LOGIC;
    select_clk  : IN  STD_LOGIC;
    test_mode   : IN  STD_LOGIC;
    clk_out     : OUT STD_LOGIC;
    selected0   : OUT STD_LOGIC;
    selected1   : OUT STD_LOGIC
  );
END ENTITY;

ARCHITECTURE rtl of fll_clk_select IS

  COMPONENT synchronizer IS
    GENERIC(
      RESET_VALUE : STD_LOGIC := '0'  -- OUTPUT VALUE AT RESET 
    );
    PORT(
      rst_n     : IN  STD_LOGIC;
      clk       : IN  STD_LOGIC;
      data_in   : IN  STD_LOGIC;
      data_out  : OUT STD_LOGIC
    );
  END COMPONENT;

  COMPONENT clock_gating 
    PORT(
      clk_in      : IN  STD_LOGIC;
      enable      : IN  STD_LOGIC;
      test_mode   : IN  STD_LOGIC;
      clk_out     : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL select_0_async  : STD_LOGIC;
  SIGNAL select_1_async  : STD_LOGIC;
  SIGNAL select_0_sync   : STD_LOGIC;
  SIGNAL select_1_sync   : STD_LOGIC;
  SIGNAL clk_0_cg        : STD_LOGIC;
  SIGNAL clk_1_cg        : STD_LOGIC;

BEGIN

  -- Mutex
  select_0_async <= NOT (select_1_sync OR     select_clk);
  select_1_async <= NOT (select_0_sync OR NOT select_clk);

  -- Synchonizers
  u_Select0_sync : synchronizer 
    GENERIC MAP (
      RESET_VALUE => '0'
    )
    PORT MAP(
      rst_n     => rst_n,
      clk       => clk_0,
      data_in   => select_0_async,
      data_out  => select_0_sync 
    );

  u_Select1_sync : synchronizer 
    GENERIC MAP (
      RESET_VALUE => '0'
    )
    PORT MAP(
      rst_n     => rst_n,
      clk       => clk_1,
      data_in   => select_1_async,
      data_out  => select_1_sync 
    );

  -- Clock gate cells
  u_Select0_cg : clock_gating
    PORT MAP(
      clk_in      => clk_0,
      enable      => select_0_sync,
      test_mode   => test_mode,
      clk_out     => clk_0_cg
    );

  u_Select1_cg : clock_gating
    PORT MAP(
      clk_in      => clk_1,
      enable      => select_1_sync,
      test_mode   => test_mode,
      clk_out     => clk_1_cg
    );

  -- Output ports
  clk_out   <= clk_0_cg OR clk_1_cg;
  selected0 <= select_0_sync;
  selected1 <= select_1_sync;

END rtl;
