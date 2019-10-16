-------------------------------------------------------------------------------
-- Title        : Two-Port Word-Acces Generic Memory
-- Project      : Semi-Custom Memories
-------------------------------------------------------------------------------
-- File         : TWLR1W1C1v2.vhd
-- Project Root : /home/meinerzh/Semi-custom/EDA/
-- Author       : Pascal Meinerzhagen (meinerzhagen@iis.ee.ethz.ch)
-- Company      : Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Description: Template for a Two-Port Word-Access Memory. The following
-- parameters can be set as desired:
-- 1) Number of words (WORDS)
-- 2) Word Size (WS)
-------------------------------------------------------------------------------
-- Copyright (c) 2009 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date         Version  Author    Description
-- May-04-2009  1.0      meinerzh  Created
-- Feb 24 2014  3.0      meinerzh  Took version from Davide Rossi, implemented
-- detailed AND-then-OR tree MUXES
-------------------------------------------------------------------------------

-- la mcp (latch multiplexer clock_gates)

-------------------------------------------------------------------------------
-- Two-Port Word-Access, Latch-based, Read Latency 1, Write Latency 1, 1 common
-- *        *            *            *            *  *             *  *    <->
-- Clock, version 2
-- *      *       *
--
-- ==== TWLR1W1C1v2 ====
--
-- InDataReg:           NO
-- OutDataReg:          NO
-- WAddrReg    
--      Before RD:      NO
--      After RD:       NO
-- RAddrReg
--      Before RD:      YES
--      After RD:       NO
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.VHDLTools.all;
use work.SCM_pkg.all;




entity latchram_WORDS128_WS32 is
  
  generic (
    WORDS : integer := 128;            -- Number of words / Memory height
    WS    : integer := 32);            -- Word Size / Number of bits per word
  
  port (
    
    ClkxCI   : in  std_logic;          -- Common clock for
                                       -- read and write operations
    -- Read port
    RExSBI   : in  std_logic;           -- Read Enable, active low
    RAddrxDI : in  unsigned(log2ceil(WORDS)-1 downto 0);  -- Read address
    RDataxDO : out std_logic_vector(WS-1 downto 0);  -- Read data, the entire word is accessed to simultaneously
    
    -- Write port
    WExSBI   : in std_logic;            -- Write Enable, active low
    BExSBI   : in  unsigned(WS/8-1 downto 0);  -- Byte enabled
    WAddrxDI : in unsigned(log2ceil(WORDS)-1 downto 0);  -- Write address
    WDataxDI : in std_logic_vector(WS-1 downto 0));  -- Write data, the entire word is accessed to simultaneously
  
end latchram_WORDS128_WS32;

architecture rtl of latchram_WORDS128_WS32 is

  -----------------------------------------------------------------------------
  -- Component declarations
  -----------------------------------------------------------------------------  
  component C12T32_LLUAL4_CNHLSX7    -- SIZE 1.768 BY 1.200
    port (
      CP : in  std_logic;
      TE : in  std_logic;
      E  : in  std_logic;
      Q  : out std_logic);
  end component;

  component MUXTop
    generic (
      WORDS : integer;
      WS    : integer);
    port (
      RAddrOneHotxDI : in  std_logic_vector(WORDS-1 downto 0);
      MemContentxDI  : in  WordVector;
      RDataxDO       : out std_logic_vector(WS-1 downto 0));
  end component;
  
  
  -----------------------------------------------------------------------------
  -- Signals and Types
  -----------------------------------------------------------------------------
  
  -- PM Feb 2014. Moved subtype & type definitions to SCM_pkg package

  
  -- Read address register, located at the input of the address decoder
  signal RAddrRegxDP, RAddrRegxDN       : unsigned(log2ceil(WORDS)-1 downto 0);
  signal RAddrOneHotxD                  : std_logic_vector(WORDS-1 downto 0);  -- Output of RAD    
  signal MemContentxDP                  : WordVector;
  
  signal WAddrOneHotxD                  : OneHotAddr;
  -- Define a vector containing M = WORDS clock signals, one for each word
  signal ClocksxC                       : OneHotAddr;
  signal WDataIntxD                     : Word;
  
begin  -- rtl
  
  -----------------------------------------------------------------------------
  -- READ : Read address register
  -----------------------------------------------------------------------------
  RAddrRegxDN <= RAddrxDI;
  
  p_RAddrReg: process (ClkxCI)
  begin  -- process p_RAddrReg
    if ClkxCI'event and ClkxCI = '1' then  -- rising clock edge
      if RExSBI = '0' then                 -- Chip selected
        RAddrRegxDP <= RAddrRegxDN;    
      end if;
    end if;
  end process p_RAddrReg;
  
  -----------------------------------------------------------------------------
  -- READ : Read address decoder RAD
  -----------------------------------------------------------------------------  
  p_RAD: process (RAddrRegxDP)
  begin  -- process p_RAD
    RAddrOneHotxD <= (others => '0');
    RAddrOneHotxD(to_integer(RAddrRegxDP)) <= '1';
  end process p_RAD;
  
  -----------------------------------------------------------------------------
  -- READ : Output multiplexer MUX
  -----------------------------------------------------------------------------
  MUXTop_1 : MUXTop
    generic map (
      WORDS => WORDS,
      WS    => WS)
    port map (
      RAddrOneHotxDI => RAddrOneHotxD,
      MemContentxDI  => MemContentxDP,
      RDataxDO       => RDataxDO);

--  -- This was the 1-liner MUX from Davide Rossi (with Byte-enable support), disable! PM Feb. 2014  
--  -----------------------------------------------------------------------------
--  -- READ : Read operation
--  -----------------------------------------------------------------------------
--  ReadData: for i in 0 to WS/8-1 generate
--    RDataxDO( 8*(i+1)-1 downto 8*i ) <= MemContentxDP(to_integer(RAddrRegxDP),i);
--  end generate ReadData;
  


  
  -----------------------------------------------------------------------------
  -- WRITE : Write Address Decoder (WAD), combinatorial process
  -----------------------------------------------------------------------------
  p_WordIter: for i in 0 to WORDS-1 generate
    p_ByteIter: for j in 0 to WS/8-1 generate
      p_WAD: process (WAddrxDI, WExSBI, BExSBI)
      begin  -- process p_WAD
        WAddrOneHotxD(i,j) <= '0';
        if ( WExSBI = '0' and BExSBI(j) = '0' and WAddrxDI = i ) then
          WAddrOneHotxD(i,j) <= '1';
        end if;
      end process p_WAD;
    end generate p_ByteIter;
  end generate p_WordIter;
  
  
  
-- if you do not have integrated clock-gating cells, leave
-- this section enabled, else disable it and enable the next section.
--  -----------------------------------------------------------------------------
--  -- WRITE : Clock gating (if no integrated clock-gating cells available)
--  -----------------------------------------------------------------------------
--   l_ClkGate : for i in 0 to WORDS-1 generate
--     signal Q : std_logic;               -- Output of the latch
--   begin

--     -- purpose: Latch of the clock gate
--     -- type   : sequential
--     -- inputs : WClkxCI, WAddrOneHotxD(i)
--     -- outputs: Q
--     p_ClkGate : process (ClkxCI, WAddrOneHotxD(i))
--     begin  -- process p_ClkGate
--       if ClkxCI = '1' then
--         Q <= not WAddrOneHotxD(i);
--       end if;
--     end process p_ClkGate;

--     ClocksxC(i) <= ClkxCI or Q;
  
--   end generate l_ClkGate;

  
-- !!!! LAURI and colleagues !!!!: adapt it to your design kit (your ST28 standard-cell library)
  -----------------------------------------------------------------------------
  -- WRITE : Clock gating (if integrated clock-gating cells are available)
  -----------------------------------------------------------------------------
   l_Word_iter: for i in 0 to WORDS-1 generate
     l_Byte_iter: for j in 0 to WS/8-1 generate
       CG_Inst : C12T32_LLUAL4_CNHLSX7
         port map (
           Q   => ClocksxC(i,j),
           E   => WAddrOneHotxD(i,j),
           TE  => '0',
           CP  => ClkxCI);
     end generate l_Byte_iter;
   end generate l_Word_iter;
  
  -----------------------------------------------------------------------------
  -- WRITE : SAMPLE INPUT DATA
  --     Adi 12/3/14 - changed latches into flip flops to solve hold paths from falling edge
  --                   of clock through data in latch to memory latches
  -----------------------------------------------------------------------------  
  a_ByteIter: for i in 0 to WS/8-1 generate
    --p_Write: process (ClkxCI, WDataxDI)
   p_Write: process (ClkxCI)
   begin  -- process p_Write
      --if ClkxCI = '0' then
      if ClkxCI'event and ClkxCI = '1' then  -- rising clock edge
 	   if ( WExSBI = '0' and BExSBI(i) = '0' ) then        
	       WDataIntxD(i) <= WDataxDI( 8*i+7 downto 8*i );
           end if;
      end if;
    end process p_Write;
  end generate a_ByteIter;
 

   
  -----------------------------------------------------------------------------
  -- WRITE : Write operation
  -----------------------------------------------------------------------------  
  -- Generate M = WORDS sequential processes, each of which describes one
  -- word of the memory. The processes are synchronized with the clocks
  -- ClocksxC(i), i = 0, 1, ..., M-1
  -- Use active low, i.e. transparent on low latches as storage elements
  -- Data is sampled on rising clock edge
  w_WordIter: for i in 0 to WORDS-1 generate
    w_ByteIter: for j in 0 to WS/8-1 generate
--        p_Write: process (ClocksxC(i), WDataxDI)
      p_Write: process (ClocksxC, WDataIntxD)
      begin  -- process p_Write
        if ClocksxC(i,j) = '1' then
          MemContentxDP(i,j) <= WDataIntxD(j);
        end if;
      end process p_Write;
    end generate w_ByteIter;
  end generate w_WordIter;
  
end rtl;
