-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : bbgen_synchronizer.vhd
-- Author     : Christoph Thomas Mueller <christoph.mueller@epfl.ch>
-- Company    : EPFL Lausanne
-- Created    : 2015-05-29
-- Last update: 2015-05-29
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

-------------------------------------------------------------------------------

entity bbgen_synchronizer is

  port (
    clk  : in  std_logic;
    nRST : in  std_logic;
    A    : in  std_logic;
    Z    : out std_logic);

end bbgen_synchronizer;

-------------------------------------------------------------------------------

architecture str of bbgen_synchronizer is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

  signal ff1, ff1_next, ff2, ff2_next : std_logic;
  
begin  -- str

  floppydiflopflop: process (clk, nRST)
  begin  -- process floppydiflopflop
    if nRST= '0' then  -- asynchronous reset (active low)
      ff1 <= '0';
      ff2 <= '0';
    elsif clk'event and clk = '1' then     -- rising clock edge
      ff1 <= ff1_next;
      ff2 <= ff2_next;
    end if;
  end process floppydiflopflop;
  
  ff1_next <= A;
  ff2_next <= ff1;
  Z <= ff2;
              
end str;

-------------------------------------------------------------------------------
