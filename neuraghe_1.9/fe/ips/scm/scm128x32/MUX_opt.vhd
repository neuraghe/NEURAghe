-------------------------------------------------------------------------------
-- Title        : Output multiplexer MUX
-- Project      : Semicustom Memories: MUX
-------------------------------------------------------------------------------
-- File         : MUX.vhd
-- Project Root : /home/meinerzh/Memories/MUX/vers1/
-- Author       : Pascal Meinerzhagen (meinerzhagen@iis.ee.ethz.ch)
-- Company      : Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Description: Output multiplexer vers1 of the semicustom memory. This multiplexer
-- is controlled by a one-hot encoded read address; each data bit is 'and-ed'
-- with its one-hot address bit, then all and gate outputs are 'or-ed'
-------------------------------------------------------------------------------
-- Copyright (c) 2009 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date         Version  Author    Description
-- Jul-15-2009  1.0      meinerzh  Created
-- Feb-2014     2.0      meinerzh  Simplify, make it only work for EVEN nb. WORDS,
-- use only 2 input NAND/NOR gates!
-------------------------------------------------------------------------------

-- *** The parameter 'WORDS' must be >= 3 !!! ********************************

-- PM Feb. 25, 2014
-- THIS CODE IS BASICALLY GENERIC. However, one assumption is that the last
-- stage in the MUX tree is an OR gate, i.e., that there is an odd number of stages/
-- levels in the MUX tree. THIS IS THE CASE FOR WORDS=64 !
-- AT Apr 8, 2014
-- Updated to WORDS=128 so the last stage is a NAND gate
-- To get a good output drive, a buffer is instantiated at the end.

library IEEE;
use IEEE.std_logic_1164.all;
use work.SCM_pkg.all;
use work.VHDLTools.all;

entity MUX is
  
  generic (
    WORDS : integer);

  port (
    RAddrOneHotxDI : in  std_logic_vector(WORDS-1 downto 0);
    DataxDI        : in  std_logic_vector(WORDS-1 downto 0);
    DataOutxDO     : out std_logic);

end MUX;

architecture rtl of MUX is
  
  component C12T32_LLUP0_NAND2X7 -- SIZE 0.408 BY 1.200 
    port (
      A : in  std_logic;
      B : in  std_logic;
      Z : out std_logic);
  end component;

  component C12T32_LLUP0_NOR2X7 -- SIZE 0.408 BY 1.200
    port (
      A : in  std_logic;
      B : in  std_logic;
      Z : out std_logic);
  end component;

  component C12T32_LLUP0_IVX17 -- SIZE 0.408 BY 1.200
    port (
      A : in  std_logic;
      Z : out std_logic);
  end component;

  component C12T32_LLUP0_BFX33 -- SIZE 0.952 BY 1.200
    port (
      A : in  std_logic;
      Z : out std_logic);
  end component;

  constant H : integer := WORDS/2;        -- Number of level 2 outputs. Notice
                                          -- that WORDS/2 is truncated if WORDS
                                          -- is odd, which is desired.
  constant L : integer := log2floor(H);   -- Number of OR stages, excluding the
                                          -- last 2NR or 3NR

  -- In the following data structure 'ColumnVector', only column 'L-1' is
  -- entirly used; the remining columns are not fully used and should be
  -- 'optimized away' during synthesis or back-end design.
  -- ****** VERIFY IF OPTIMIZATION IS PERFORMED !!! ***************************
  subtype Column is std_logic_vector(H-1 downto 0);
  --type ColumnVector is array (L-1 downto 0) of Column;
  type ColumnVector is array (L downto 0) of Column;

  signal l1xD : std_logic_vector(WORDS-1 downto 0);  -- Level 1 output
  signal lixD : ColumnVector;                        -- level i outputs, i = 2,...,L+1

  signal DataOutInvxD : std_logic;


  --variable cH : integer := WORDS/2;  -- current height, i.e. height at output of this level
  -- WORDS = 24: cH = 12
  -- WORDS = 88: cH = 44

begin  -- rtl  
  

 

  -----------------------------------------------------------------------------
  -- Level 7 - 128 NANDs between word line and latch output
  -----------------------------------------------------------------------------
  l_and : for i in WORDS-1 downto 0 generate
    
    -- l1xD(i) <= not (DataxDI(i) and RAddrOneHotxDI(i));

    level_7: C12T32_LLUP0_NAND2X7
      port map (
          A => DataxDI(i),
          B => RAddrOneHotxDI(i),
          Z => l1xD(i));
    
  end generate l_and;
  
  
  -----------------------------------------------------------------------------
  -- Level 6 - 64 ORs between two rows. Level 7 output is inverted so this is a NAND gate
  -----------------------------------------------------------------------------
  
  -- Assign all but the highest bit
  l_height: for i in H-1 downto 0 generate
    
    -- lixD(L-1)(i) <= not (l1xD(2*i+1) and l1xD(2*i));

    level_6: C12T32_LLUP0_NAND2X7
      port map (
          A => l1xD(2*i+1),
          B => l1xD(2*i),
          --Z => lixD(L-1)(i));
          Z => lixD(L)(i)); -- Adi changed it to level 6 instead of 5
        
  end generate l_height;
  

  
  -----------------------------------------------------------------------------
  -- Level 5,...,0                            (Total: L+1-2 = L-1)
  -- Corresponds to indices i, i=L-2 downto 0   (Total: L-2+1 = L-1)
  -----------------------------------------------------------------------------
  --l_length : for i in L-2 downto 0 generate
  l_length : for i in L-1 downto 0 generate -- so it goes 5,4,3,2,1,0

    even       : if (i mod 2) = 0 generate
      -- At this level, use a NAND gate
      --l_height : for j in WORDS/(2**(L-i))-1 downto 0 generate
      l_height : for j in WORDS/(2**(L-i+1))-1 downto 0 generate

        -- lixD(i)(j) <= lixD(i+1)(2*j+1) or lixD(i+1)(2*j);

        level : C12T32_LLUP0_NAND2X7
          port map (
            A => lixD(i+1)(2*j+1),
            B => lixD(i+1)(2*j),
            Z => lixD(i)(j));

      end generate l_height;

    end generate even;

    odd        : if (i mod 2) = 1 generate
      -- At this level, use a NOR gate
      --l_height : for j in WORDS/(2**(L-i))-1 downto 0 generate
      l_height : for j in WORDS/(2**(L-i+1))-1 downto 0 generate

        -- lixD(i)(j) <= lixD(i+1)(2*j+1) or lixD(i+1)(2*j);

        level : C12T32_LLUP0_NOR2X7
          port map (
            A => lixD(i+1)(2*j+1),
            B => lixD(i+1)(2*j),
            Z => lixD(i)(j));

      end generate l_height;
    end generate odd;


  end generate l_length;
  
  
  -----------------------------------------------------------------------------
  -- Last level -- output buffer
  -----------------------------------------------------------------------------
    level_o: C12T32_LLUP0_BFX33
      port map (
          A => lixD(0)(0),
          Z => DataOutxDO); 
 
    --level_o1: C12T32_LLUP0_NOR2X7
    --  port map (
    --    A => lixD(0)(1),
    --      B => lixD(0)(0),
    --      Z => DataOutInvxD);

    --level_o2: C12T32_LLUP0_IVX17
    --  port map (
    --      A => DataOutInvxD,
    --      Z => DataOutxDO);
  
  


end rtl;
