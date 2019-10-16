--!
--! @file C28SOI_LL_MULTIPROBE.vhd
--! @brief Fucntional shell for the Multi-probe macro
--! 
--! 
--! @par  Module owner: Ivan MIRO PANADES
--!       ivan.miro-panades@cea.fr
--! 
--! @par  Copyright (C) 2011 CEA
--! 
--! @par  Authors:
--!       Ivan MIRO PANADES
--! 
--! @par  Id: $Id: C28SOI_LL_MULTIPROBE_rtl.vhd 31 2014-04-11 13:53:42Z im219746 $
--! @par  Date: $Date: 2014-04-11 15:53:42 +0200 (Fri, 11 Apr 2014) $
--! @par  Revision: $Rev: 31 $
--!


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;


ENTITY C28SOI_LL_MULTIPROBE IS
  PORT (
    RST_N     : IN  STD_LOGIC;
    MODE      : IN  STD_LOGIC;
    SAMPLE    : IN  STD_LOGIC;
    TEST_FREQ : IN  STD_LOGIC;
    
    -- functional scan chain, do not use for test
    SCAN_CLK  : IN  STD_LOGIC;
    SCAN_IN   : IN  STD_LOGIC;
    SCAN_OUT  : OUT STD_LOGIC
  );
END ENTITY C28SOI_LL_MULTIPROBE;


ARCHITECTURE RTL OF C28SOI_LL_MULTIPROBE IS

-- RTL_SYNTHESIS OFF
  CONSTANT DELAY_RING1  : TIME :=  100 ps;
  CONSTANT DELAY_RING2  : TIME :=  200 ps;
  CONSTANT DELAY_RING3  : TIME :=  300 ps;
  CONSTANT DELAY_RING4  : TIME :=  400 ps;
  CONSTANT DELAY_RING5  : TIME :=  500 ps;
  CONSTANT DELAY_RING6  : TIME :=  600 ps;
  CONSTANT DELAY_RING7  : TIME :=  700 ps;

  SIGNAL counter_r        : STD_LOGIC_VECTOR(27 DOWNTO 0);
  SIGNAL counter_s        : STD_LOGIC_VECTOR(27 DOWNTO 0);
  SIGNAL overflow_r       : STD_LOGIC;
  SIGNAL overflow_s       : STD_LOGIC;
  SIGNAL config_r         : STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL config_s         : STD_LOGIC_VECTOR(2 DOWNTO 0);

  SIGNAL clk_ring         : STD_LOGIC;
  SIGNAL clk_reg          : STD_LOGIC;
  SIGNAL oscillator       : STD_LOGIC;

  SIGNAL MODE_d           : STD_LOGIC;
  SIGNAL SAMPLE_d         : STD_LOGIC;
  SIGNAL TEST_FREQ_d      : STD_LOGIC;
  SIGNAL SCAN_IN_d        : STD_LOGIC;
  
  SIGNAL DELAY_OSCILLATOR : TIME := 100 ps;
-- RTL_SYNTHESIS ON

BEGIN
  
-- RTL_SYNTHESIS OFF

  --WARNING this generates a delta_delay!!! Take into account all the inputs
  clk_reg <= SCAN_CLK when MODE = '1' else clk_ring;
  --To correct the delta_delay, add a delay to all inputs and use ONLY this signals!!!
  MODE_d      <= MODE;
  SAMPLE_d    <= SAMPLE;
  TEST_FREQ_d <= TEST_FREQ;
  SCAN_IN_d   <= SCAN_IN;

  pClock : process(RST_N,clk_reg)
    begin
			if (RST_N='0') then
        counter_r  <= (others => '0');
        overflow_r <= '0';
        config_r   <= (others => '0');
			elsif(clk_reg='1' and clk_reg'event) then
        counter_r  <= counter_s;
        overflow_r <= overflow_s;
        config_r   <= config_s;
 			end if;
    end process;

  pCounter : process(counter_r, overflow_r, config_r, MODE_d, SCAN_IN_d)
    begin
      counter_s  <= counter_r;
      overflow_s <= overflow_r;
      config_s   <= config_r;
      if (MODE_d = '0') then    --Continue to count
        counter_s <= unsigned(counter_r) + 1;
        if (counter_r = "1111111111111111111111111111") then  --Overflow?
          overflow_s <= '1';
        end if;
      else --Shift mode
        counter_s  <= counter_r(26 downto 0) & SCAN_IN_d;
        overflow_s <= counter_r(27);
        config_s   <= config_r(1 downto 0) & overflow_r;
      end if;
    end process;


 DELAY_OSCILLATOR <= DELAY_RING1 when config_r = "001" else 
                     DELAY_RING2 when config_r = "010" else
                     DELAY_RING3 when config_r = "011" else
                     DELAY_RING4 when config_r = "100" else
                     DELAY_RING5 when config_r = "101" else
                     DELAY_RING6 when config_r = "110" else
                     DELAY_RING7 when config_r = "111" else
                     DELAY_RING1;


  pRing : process(config_r, oscillator, TEST_FREQ_d, SAMPLE_d, DELAY_OSCILLATOR)
    begin
      if config_r = "000" then
        --Test frequency
        clk_ring   <= TEST_FREQ_d;
        --Oscillator stopped
        oscillator <= '1';
      else
        --Use the ring oscillators
        oscillator <= TRANSPORT not (oscillator AND SAMPLE_d) AFTER DELAY_OSCILLATOR;
        clk_ring   <= not oscillator;
      end if;
    end process;

  SCAN_OUT <= config_r(2);

  --Some verifications
  ASSERT not (SCAN_CLK='1' AND (MODE='1' AND MODE'event) AND RST_N='1') REPORT "SCAN_CLK should be 0 when rising MODE" SEVERITY FAILURE;
  ASSERT not (SCAN_CLK='0' AND (MODE='0' AND MODE'event) AND RST_N='1') REPORT "SCAN_CLK should be 1 when lowering MODE" SEVERITY FAILURE;

-- RTL_SYNTHESIS ON

END RTL;
