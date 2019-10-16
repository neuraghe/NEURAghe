-------------------------------------------------------------------------------
-- Title      : VHDL Tools Library
-- Project    : 
-------------------------------------------------------------------------------
-- File       : VHDLTools.vhd
-- Author     : Andreas P. Burg (apburg@iis.ee.ethz.ch)
-- Company    : Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Description: This package contains a set of functions and types to ease the
-- designers life with VHDL. 
-------------------------------------------------------------------------------
-- Copyright (c) 2003 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2002        1.0      apburg	Created
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package VHDLTools is

  -----------------------------------------------------------------------------
  -- ThermometerEncode(x)
  -----------------------------------------------------------------------------
  function ThermometerEncode (n : unsigned) return std_logic_vector;
  -----------------------------------------------------------------------------
  -- Ceil(Log2(x))
  -----------------------------------------------------------------------------
  function log2ceil (n : natural) return natural;
  -----------------------------------------------------------------------------
  -- Floor(Log2(x))
  -----------------------------------------------------------------------------
  function log2floor (n : natural) return natural;
  function log2floor (n : unsigned) return unsigned;
  -----------------------------------------------------------------------------
  -- Max(n,m)
  -----------------------------------------------------------------------------
  function max (n : integer;m : integer) return integer;
  -----------------------------------------------------------------------------
  -- Min(n,m)
  -----------------------------------------------------------------------------
  function minimum (n : integer;m : integer) return integer;
  -----------------------------------------------------------------------------
  -- Reverse Byte Order
  -----------------------------------------------------------------------------
  function ReverseByteOrder (constant A : integer) return integer;
    
end VHDLTools;

package body VHDLTools is

  -- purpose : do thermometer encoding of an unsigned number
  function ThermometerEncode (n : unsigned) return std_logic_vector is
    variable v_Out : std_logic_vector((2**n'length)-1-1 downto 0);
  begin
    for i in 0 to (2**n'length)-1-1 loop
      if n > i then
        v_Out(i) := '1';
      else
        v_Out(i) := '0';
      end if;
    end loop;  -- i
    return v_Out;
  end ThermometerEncode;
  
  -- purpose : computes ceil(log2(n)) to get "bit width"
--   function log2ceil (n : natural) return natural is
--     variable m, p      : natural;
--   begin  -- log2ceil
--     if n = 1 then
--       return 1;
--     end if;
--     m     := 0;
--     p     := 1;
--     for i in 0 to n loop
--       if p < n then
--         m := m + 1;
--         p := p * 2;
--       end if;
--     end loop;
--     return m;
--   end log2ceil;
  function log2ceil (n : natural) return natural is
    variable n_bit : unsigned(31 downto 0);
  begin  -- log2ceil
    if n = 0 then
      return 0;
    end if;
    n_bit := to_unsigned(n-1,32);
    for i in 31 downto 0 loop
      if n_bit(i) = '1' then
        return i+1;
      end if;
    end loop;  -- i
    return 1;
  end log2ceil;

  -- purpose : computes floor(log2(n)) 
  function log2floor (n : natural) return natural is
    variable n_bit : unsigned(31 downto 0);
  begin  -- log2ceil
    n_bit := to_unsigned(n,32);
    for i in 31 downto 0 loop
      if n_bit(i) = '1' then
        return i;
      end if;
    end loop;  -- i
    return 0;
  end log2floor;

  -- purpose : computes floor(log2(n)) 
  function log2floor (n : unsigned) return unsigned is
  begin  -- log2ceil
    for i in n'length-1 downto 0 loop
      if n(i+n'low) = '1' then
        return to_unsigned(i,log2ceil(n'length));
      end if;
    end loop;  -- i
    return to_unsigned(0,log2ceil(n'length));
  end log2floor;

  -- purpose : computes max(n,m)
  function max (n : integer; m : integer) return integer is
  begin  -- max(n,m)
    if n > m then
      return n;
    else
      return m;
    end if;
  end max;

  -- purpose : computes minimum(n,m)
  function minimum (n : integer; m : integer) return integer is
   begin  -- min(n,m)
     if n < m then
       return n;
     else
       return m;
     end if;
   end minimum;

  -- purpose : ReverseByteOrger(integer) reverses the order of the bytes
  -- to convert between little and big-endian
  function ReverseByteOrder (
    constant A : integer)
    return integer is
    variable temp : signed(32-1 downto 0);
    variable temp2 : signed(32-1 downto 0);
    begin 
      temp := to_signed(A,temp'length);
      temp2(32-1 downto 32-8) := temp(8-1 downto 0);
      temp2(24-1 downto 24-8) := temp(16-1 downto 8);
      temp2(16-1 downto 16-8) := temp(24-1 downto 16);
      temp2(8-1 downto 8-8) := temp(32-1 downto 24);
      return to_integer(temp2);
    end ReverseByteOrder;

end VHDLTools;


