--!
--! @file fll_clk_ref.vhd
--! @brief Frequency Locked Loop : clk ref Control part 
--! 
--! This block implements the clk ref FSM of the Frequency Locked Loop (FLL)
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
--! @par  Module owner: Pascal VIVET
--!       pascal.vivet@cea.fr
--! 
--! @par  Copyright (C) 2009 CEA
--! 
--! @par  Authors: Pascal VIVET
--! 
--! @par  Id: $Id: fll_clk_ref.vhd 1 2014-01-15 16:11:08Z im219746 $
--! @par  Date: $Date: 2014-01-15 17:11:08 +0100 (Wed, 15 Jan 2014) $
--! @par  Revision: $Rev: 1 $
--!


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_arith.ALL;

ENTITY fll_clk_ref IS
  PORT(
    -- General signals
    rst_ref_n           : IN  STD_LOGIC;                 -- reset sync with clk_ref
    clk_ref             : IN  STD_LOGIC;                 -- external reference clock (= 100MHz)
    test_mode           : IN  STD_LOGIC;                 -- test_mode from CVP-U

    -- configuration values
    sample_clocks       : IN  STD_LOGIC_VECTOR(3 downto 0);  -- nb cycles the sampling is done (from 0 to 15, default is 5)
    capture_clocks      : IN  STD_LOGIC_VECTOR(3 downto 0);  -- nb cycles the capture is done (from 0 to 15, default is 15)

    -- outputs
    sample              : OUT STD_LOGIC                        -- sample signal to clock counter
    );
END fll_clk_ref;


ARCHITECTURE rtl of fll_clk_ref IS 

  ----------------------------------------------------------------------
  -- Signals/contants declarations -------------------------------------
  ----------------------------------------------------------------------

  SIGNAL sample_clocks_r  : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL capture_clocks_r : STD_LOGIC_VECTOR(3 downto 0);

  SIGNAL counter_r : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL counter_s : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL sample_r  : STD_LOGIC;
  SIGNAL sample_s  : STD_LOGIC;

BEGIN

  --------------------------------------------------------------------------------
  -- clk_ref counter and control (100 MHz)
  --------------------------------------------------------------------------------

  -- re-sycnhronize sample_clocks (from clk domain) with clk_ref domain
  -- => this is not a real synchronizer, but enough for a static value, allow clear timing domain.
  PROCESS (clk_ref, rst_ref_n)
  BEGIN
    IF (rst_ref_n = '0') THEN
      sample_clocks_r  <= (others => '0');
      capture_clocks_r <= (others => '1');
    ELSIF clk_ref = '1' AND clk_ref'EVENT THEN
      sample_clocks_r  <= sample_clocks;
      capture_clocks_r <= capture_clocks;
    END IF;
  END PROCESS;


  pClock : process(rst_ref_n,clk_ref)
    begin
			if (rst_ref_n='0') then
        counter_r   <= (others => '0');
        sample_r    <= '0';
			elsif(clk_ref='1' and clk_ref'event) then
        counter_r   <= counter_s;
        sample_r    <= sample_s;
 			end if;
    end process;


  pCounter : process(sample_r, counter_r, sample_clocks_r, capture_clocks_r )
    VARIABLE new_counter_value : STD_LOGIC_VECTOR(3 downto 0);
    begin
      new_counter_value := unsigned(counter_r) + 1;
      counter_s         <= new_counter_value;
      sample_s          <= sample_r;

      if (sample_r='1') then
        --Sampling
        if (new_counter_value = sample_clocks_r) then
          sample_s  <= '0';   --Switch to Campture
          counter_s <= (others => '0');
        end if;
      else
        --Capturing
        if (new_counter_value = capture_clocks_r) then
          sample_s  <= '1';   --Switch to Sample
          counter_s <= (others => '0');
        end if;
 			end if;
    end process;

  sample <= sample_r;

END rtl;

