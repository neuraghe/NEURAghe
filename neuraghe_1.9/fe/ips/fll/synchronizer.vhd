-------------------------------------------------------------------------------
-- Title      : umcL65 Frequency Locked Loop Digital Controlled Oscillator 
-- Project    : PULP 65nm
-------------------------------------------------------------------------------
-- File       : synchronizer.vhd
-- Author     : David Bellasi  <bellasi@ee.ethz.ch>
-- Company    : Integrated Systems Laboratory, ETH Zurich
-- Created    : 2015-03-18
-- Last update: 2015-04-01
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : 
-------------------------------------------------------------------------------
-- Description: multi-stage one-way  synchronizer with edge detection
--              
-------------------------------------------------------------------------------
-- Copyright (c) 2015 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author              Description
-- 2014-01-24  1.0      Ivan MIRO PANADES   Original version by CEA
--                                          (ivan.miro-panades@cea.fr)
-- 2015-03-18  2.0      bellasid            modified for configurable length
--                                          added edge detection
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity synchronizer is
  generic(
    SYNCHRONIZERS : natural   := 3;     -- Number of synchronizers (min 3)
    RESET_VALUE   : std_logic := '0'    -- Output value at reset 
    );
  port(
    rst_n       : in  std_logic;
    clk         : in  std_logic;
    data_in     : in  std_logic;
    data_out    : out std_logic;
    falling_out : out std_logic;
    rising_out  : out std_logic;
    enable      : in  std_logic
    );
end synchronizer;

architecture rtl of synchronizer is
  signal syncs : std_logic_vector(SYNCHRONIZERS-1 downto 0);
begin

  pClock : process(clk, rst_n)
  begin
    if rst_n = '0' then
      syncs <= (others => RESET_VALUE);
    elsif clk'event and clk = '1' then
      if enable = '1' then
        syncs <= syncs(SYNCHRONIZERS-2 downto 0) & data_in;
      end if;
    end if;
  end process;

  data_out <= syncs(SYNCHRONIZERS-1);

  falling_out <= (not syncs(syncs'high-1)) and syncs(syncs'high);
  rising_out  <= syncs(syncs'high-1) and (not syncs(syncs'high));

end rtl;
