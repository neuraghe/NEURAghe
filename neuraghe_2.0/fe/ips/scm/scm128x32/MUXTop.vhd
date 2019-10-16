-------------------------------------------------------------------------------
-- Title        : Output multiplexer top level MUXTop
-- Project      : Semicustom Memories: MUX
-------------------------------------------------------------------------------
-- File         : MUXTop.vhd
-- Project Root : /home/meinerzh/Memories/MUX/vers1/
-- Author       : Pascal Meinerzhagen (meinerzhagen@iis.ee.ethz.ch)
-- Company      : Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Description: Output multiplexer vers1 of the semicustom memory.
-- Instantiates 'WS' MUX slices to build the top level output multiplexer.
-------------------------------------------------------------------------------
-- Copyright (c) 2009 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date         Version  Author    Description
-- Jul-15-2009  1.0      meinerzh  Created
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.SCM_pkg.all;

entity MUXTop is
  generic (
    WORDS : integer;
    WS    : integer);
  port (
    RAddrOneHotxDI : in  std_logic_vector(WORDS-1 downto 0);
    MemContentxDI  : in  WordVector;
    RDataxDO       : out std_logic_vector(WS-1 downto 0));
end MUXTop;

architecture rtl of MUXTop is

  subtype Column is std_logic_vector(WORDS-1 downto 0);
  type ColumnVector is array (WS-1 downto 0) of Column;

--- Adi Added
  type TwoBytesVector is array (WS-1/16 downto 0) of Column;
 
  component MUX
    generic (
      WORDS : integer);
    port (
      RAddrOneHotxDI : in  std_logic_vector(WORDS-1 downto 0);
      DataxDI        : in  std_logic_vector(WORDS-1 downto 0);
      DataOutxDO     : out std_logic);
  end component;

--- Adi Added
--------------------  
  component C12T32_LLUP0_BFX16 -- SIZE 0.544 BY 1.200
    port (
      A : in  std_logic;
      Z : out std_logic);
  end component;
--- end Adi Added
--------------------

  signal MemxD : ColumnVector;


--- Adi Added
--------------------  
  signal RAddrOneHotIntxS : TwoBytesVector;  -- Buffered One Hot Read Address - 4 of them
  --signal RAddrOneHotIntxS : ColumnVector;  -- Buffered One Hot Read Address - 4 of them
--- End Adi Added


begin  -- rtl

--  -- Re-arrange data
--  l_ws: for i in WS-1 downto 0 generate
--    l_words: for j in WORDS-1 downto 0 generate
--      MemxD(i)(j) <= MemContentxDI(j)(i);
--    end generate l_words;
--  end generate l_ws;

  -- PM Feb. 2014: Support Byte-Enable
  -- Re-arrange data
  l_ws        : for i in WS/8-1 downto 0 generate
    l_bits    : for k in 7 downto 0 generate
      l_words : for j in WORDS-1 downto 0 generate
        MemxD(8*i+k)(j) <= MemContentxDI(j,i)(k);
      end generate l_words;
    end generate l_bits;
  end generate l_ws;

-- RDataxDO( 8*(i+1)-1 downto 8*i ) <= MemContentxDP(to_integer(RAddrRegxDP),i);
 

-----------------------------------------------------------------------------
-- Buffering the RAddrOneHot ---Adi Added
-----------------------------------------------------------------------------
  l_buffer_row : for row in WORDS-1 downto 0 generate
    --l_buffer_twoBytes: for twoBytes in 0 to WS/16-1 generate
    l_buffer_twoBytes: for twoBytes in WS/16-1 downto 0 generate
      raddr_buffer: C12T32_LLUP0_BFX16
        port map (
          A => RAddrOneHotxDI(row),
          Z => RAddrOneHotIntxS(twoBytes)(row));
    end generate l_buffer_twoBytes;    
  end generate l_buffer_row;
--- End Adi Added  

---------------------------------------
-- Adi Removed 
--  l_width: for i in WS-1 downto 0 generate
--    
--    MUX_Intst: MUX
--      generic map (
--        WORDS => WORDS)
--      port map (
--        RAddrOneHotxDI => RAddrOneHotxDI,
--        DataxDI        => MemxD(i),
--        DataOutxDO     => RDataxDO(i));  
--  end generate l_width;
-- End Adi Removed 
--------------------------------------

---------------------------------------
-- Adi Added 
  l_twoBytes: for twoBytes in WS/16-1 downto 0 generate
    --l_twoBytes_bits: for bits in WS/4-1 downto 0 generate
    l_twoBytes_bits: for bits in 15 downto 0 generate
      MUX_Intst: MUX
        generic map (
          WORDS => WORDS)
        port map (
          RAddrOneHotxDI => RAddrOneHotIntxS(twoBytes)(WORDS-1 downto 0),
          DataxDI        => MemxD(16*twoBytes+bits),
          DataOutxDO     => RDataxDO(16*twoBytes+bits));
    end generate l_twoBytes_bits;    
  end generate l_twoBytes;

end rtl;
