-------------------------------------------------------------------------------
-- Title      : umcL65 Frequency Locked Loop Digital Controlled Oscillator 
-- Project    : PULP 65nm
-------------------------------------------------------------------------------
-- File       : reset_synchronizer.vhd
-- Author     : David Bellasi  <bellasi@ee.ethz.ch>
-- Company    : Integrated Systems Laboratory, ETH Zurich
-- Created    : 2015-03-18
-- Last update: 2015-04-01
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : 
-------------------------------------------------------------------------------
-- Description: Reset_synchronizer with test_mode bypass
--              
-------------------------------------------------------------------------------
-- Copyright (c) 2015 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author              Description
-- 2014-01-24  1.0      Ivan MIRO PANADES   Original version by CEA
--                                          (ivan.miro-panades@cea.fr)
-- 2015-03-18  2.0      bellasid            added enable signal
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reset_synchronizer is
  generic(
    SYNCHRONIZERS : natural := 2        -- Number of synchronizers 
    );
  port(
    clk       : in std_logic;
    rst_n     : in std_logic;
    test_mode : in std_logic;
    enable    : in std_logic;
    rst_out_n : out std_logic
    );
end reset_synchronizer;

architecture rtl of reset_synchronizer is

  signal reset_resynch_r : std_logic_vector(SYNCHRONIZERS-1 downto 0);

begin

  p_reset_sync : process(clk, rst_n)
  begin
    if rst_n = '0' then
      reset_resynch_r <= (others => '0');
    elsif rising_edge(clk) then
      if enable = '1' then
      reset_resynch_r <= reset_resynch_r(SYNCHRONIZERS-2 downto 0) & '1';
      end if;
    end if;
  end process;

  rst_out_n <= rst_n and (reset_resynch_r(SYNCHRONIZERS-1) or test_mode);

end rtl;
