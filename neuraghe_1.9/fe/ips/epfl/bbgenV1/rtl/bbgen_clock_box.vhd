-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : bbgen_clock_box.vhdl
-- Author     : Christoph Thomas Mueller <christoph.mueller@epfl.ch>
-- Company    : EPFL Lausanne
-- Created    : 2015-05-22
-- Last update: 2015-06-08
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2015 EPFL Lausanne
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Author   Description
-- 2015-05-22  tcmuelle Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library bbgen_lib;
use bbgen_lib.bbgen_package.all;

-------------------------------------------------------------------------------

entity bbgen_clock_box is
  generic (
    INPUT_CLOCK_BYPASS : std_logic := '1');

  port (
    clk_in              : in  std_logic;
    nRST                : in  std_logic;
    clk_out             : out std_logic;
    clock_divider: in unsigned(BBGEN_CLOCK_DIVISION_COUNTER_WIDTH - 1 downto 0)
    );

end entity bbgen_clock_box;

-------------------------------------------------------------------------------

architecture str of bbgen_clock_box is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  signal counter, counter_next : unsigned(BBGEN_CLOCK_DIVISION_COUNTER_WIDTH - 1 downto 0);

  signal clock_slow, clock_slow_next : std_logic;
begin  -- architecture str

  state_trans : process (clk_in, nRST) is
  begin  -- process state_trans
    if nRST = '0' then                  -- asynchronous reset (active low)
      counter    <= (others => '0');
      clock_slow <= '0';
    elsif clk_in'event and clk_in = '1' then  -- rising clock edge
      counter    <= counter_next;
      clock_slow <= clock_slow_next;
    end if;
  end process state_trans;

  count : process (clk_in, counter, clock_slow) is

  begin  -- process count
    if counter <= 1 then
      counter_next    <= clock_divider;
      clock_slow_next <= not clock_slow;
    else
      counter_next    <= counter - 1;
      clock_slow_next <= clock_slow;
    end if;
  end process count;

  clk_out <= clk_in when (clock_divider = 0 and INPUT_CLOCK_BYPASS = '1') else clock_slow;

end architecture str;

-------------------------------------------------------------------------------
