-------------------------------------------------------------------------------
-- Title        : Package for semicustom memories
-- Project      : Semicustom Memories: MUX
-------------------------------------------------------------------------------
-- File         : SCM_pkg.vhd
-- Project Root : /home/meinerzh/Memories/MUX/vers1/
-- Author       : Pascal Meinerzhagen (meinerzhagen@iis.ee.ethz.ch)
-- Company      : Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Description: This package defines subtypes and types used for the semicutom
-- memories
-------------------------------------------------------------------------------
-- Copyright (c) 2009 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date         Version  Author    Description
-- Jul-15-2009  1.0      meinerzh  Created
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
--use work.tb_SCM_pkg.all;

package SCM_pkg is

  constant WORDS : integer := 128;
  constant WS : integer := 32;
  constant TAGWORDS : integer := 64;
  constant TAGWS : integer := 23;

--  subtype Word is std_logic_vector(WS-1 downto 0);
--  type    WordVector is array (WORDS-1 downto 0) of Word;
  subtype Clocks is std_logic_vector(WORDS-1 downto 0);

  
  subtype Byte is std_logic_vector(7 downto 0);
  type WordVector is array (WORDS-1 downto 0,WS/8-1 downto 0) of Byte;
  
  type Word is array (WS/8-1 downto 0) of Byte;
  
  type OneHotAddr is array (WORDS-1 downto 0,WS/8-1 downto 0) of std_logic;

 
  type TagVector is array (TAGWORDS-1 downto 0) of std_logic_vector(TAGWS-1 downto 0);  
end SCM_pkg;
