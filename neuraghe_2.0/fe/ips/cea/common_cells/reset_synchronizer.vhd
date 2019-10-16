--!
--! @file reset_synchronizer.vhd
--! @brief  Synchronization of reset 
--! 
--! 
--! 
--! @par  Module owner: Ivan MIRO PANADES
--!       ivan.miro-panades@cea.fr
--! 
--! @par  Copyright (C) 2010 CEA
--! 
--! @par  Authors:
--!       Ivan MIRO PANADES
--! 
--! @par  Id: $Id: reset_synchronizer.vhd 6 2014-01-24 13:21:37Z im219746 $
--! @par  Date: $Date: 2014-01-24 14:21:37 +0100 (Fri, 24 Jan 2014) $
--! @par  Revision: $Rev: 6 $
--!

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY reset_synchronizer IS
  GENERIC(
    SYNCHRONIZERS    : natural :=  2  -- Number of synchronizers 
  );
  PORT(
    clk        : IN  STD_LOGIC;
    rst_n      : IN  STD_LOGIC;
    test_mode  : IN  STD_LOGIC;

    rst_out_n  : OUT STD_LOGIC
  );
END reset_synchronizer;

ARCHITECTURE rtl OF reset_synchronizer IS

  SIGNAL reset_resynch_r : STD_LOGIC_VECTOR(SYNCHRONIZERS-1 downto 0);

BEGIN

  p_reset_sync: process(clk, rst_n)
    begin
      if rst_n='0' then
        reset_resynch_r <=  (others => '0');
      elsif rising_edge(clk) then
        reset_resynch_r(0) <= '1';
        for i in 1 to SYNCHRONIZERS-1 loop
          reset_resynch_r(i) <= reset_resynch_r(i-1);
        end loop;      
      end if;
    end process;

  rst_out_n <= rst_n AND (reset_resynch_r(SYNCHRONIZERS-1) OR test_mode);

END rtl;
