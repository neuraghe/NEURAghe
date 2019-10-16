-------------------------------------------------------------------------------
-- Title      : Testbench for the bbgen CVP interface
-------------------------------------------------------------------------------
-- File       : bbgen_cvp_tb.vhd
-- Author     : Christoph Thomas Mueller <christoph.mueller@epfl.ch>
-- Company    : EPFL Lausanne
-- Created    : 2015-05-29
-- Last update: 2015-06-08
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
use ieee.numeric_std.all;

library work;
use work.cvp_package.all;
use work.bbgen_package.all;
use work.apb_package.all;

entity bbgen_apb_tb is

end entity bbgen_apb_tb;

architecture tb of bbgen_apb_tb is

  constant APB_ADDR_WIDTH : integer := 12;
  signal   cvp_ms         : CVP_BUS_MS_t;
  signal   cvp_sm         : CVP_BUS_SM_t;

  signal apb_ms : APB_MS_t;
  signal apb_sm : APB_SM_t;

  signal clk       : std_logic := '0';
  signal clk_bbgen : std_logic := '0';
  signal nRST      : std_logic := '0';
  signal data      : std_logic_vector(APB_DATA_WIDTH - 1 downto 0);
  signal done      : std_logic := '0';

  component bbgen_control is
    port (
      reference_clk             : in  std_logic;
      nRST                      : in  std_logic;
      cvp_req                   : in  std_logic;
      cvp_ack                   : out std_logic;
      cvp_w_data                : in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
      cvp_r_data                : out std_logic_vector(CVP_DATA_WIDTH -1 downto 0);
      cvp_addr                  : in  std_logic_vector(CVP_ADDR_WIDTH -1 downto 0);
      cvp_rw                    : in  std_logic;
      cvp_be                    : in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
      cvp_error                 : out std_logic;
      monitor_nwell_UB          : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_nwell_LB          : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_pwell_UB          : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_pwell_LB          : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_nwell_clk         : out std_logic;
      monitor_pos_pwell_clk     : out std_logic;
      monitor_neg_pwell_clk     : out std_logic;
      monitor_comp_nwell_UB     : in  std_logic;
      monitor_comp_nwell_LB     : in  std_logic;
      monitor_comp_pos_pwell_UB : in  std_logic;
      monitor_comp_pos_pwell_LB : in  std_logic;
      monitor_comp_neg_pwell_UB : in  std_logic;
      monitor_comp_neg_pwell_LB : in  std_logic;
      driver_sel_nwell          : out std_logic_vector(1 downto 0);
      driver_sel_pwell          : out std_logic_vector(1 downto 0);
      driver_charge_clk         : out std_logic;
      preset_select             : in  std_logic_vector(1 downto 0);
      preset_activate           : in  std_logic;
      force_sleep               : in  std_logic);
  end component bbgen_control;

  signal monitor_nwell_UB : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
  signal monitor_nwell_LB : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
  signal monitor_pwell_UB : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
  signal monitor_pwell_LB : std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);

  signal monitor_nwell_clk     : std_logic;
  signal monitor_pos_pwell_clk : std_logic;
  signal monitor_neg_pwell_clk : std_logic;

  -- all comparators settled
  signal monitor_comp_nwell_UB     : std_logic := '0';
  signal monitor_comp_nwell_LB     : std_logic := '1';
  signal monitor_comp_pos_pwell_UB : std_logic := '0';
  signal monitor_comp_pos_pwell_LB : std_logic := '1';
  signal monitor_comp_neg_pwell_UB : std_logic := '0';
  signal monitor_comp_neg_pwell_LB : std_logic := '1';

  signal driver_sel_nwell : std_logic_vector(1 downto 0);
  signal driver_sel_pwell : std_logic_vector(1 downto 0);

  signal driver_charge_clk : std_logic;
  signal preset_select     : std_logic_vector(1 downto 0);
  signal preset_activate   : std_logic;

  signal open_cvp_loop : std_logic;

  signal HCLK    : std_logic;
  signal HRESETn : std_logic;
  signal PADDR   : std_logic_vector(APB_ADDR_WIDTH - 1 downto 0);
  signal PWDATA  : std_logic_vector(31 downto 0);
  signal PWRITE  : std_logic;
  signal PSEL    : std_logic;
  signal PENABLE : std_logic;
  signal PRDATA  : std_logic_vector(31 downto 0);
  signal PREADY  : std_logic;
  signal PSLVERR : std_logic;

begin  -- architecture tb

  bbgen_control_1 : entity work.bbgen_control
    port map (
      reference_clk             => clk_bbgen,
      nRST                      => nRST,
      cvp_req                   => cvp_ms.req,
      cvp_ack                   => cvp_sm.ack,
      cvp_w_data                => cvp_ms.w_data,
      cvp_r_data                => cvp_sm.r_data,
      cvp_addr                  => cvp_ms.addr,
      cvp_rw                    => cvp_ms.rw,
      cvp_be                    => cvp_ms.be,
      cvp_error                 => cvp_sm.err,
      monitor_nwell_UB          => monitor_nwell_UB,
      monitor_nwell_LB          => monitor_nwell_LB,
      monitor_pwell_UB          => monitor_pwell_UB,
      monitor_pwell_LB          => monitor_pwell_LB,
      monitor_nwell_clk         => monitor_nwell_clk,
      monitor_pos_pwell_clk     => monitor_pos_pwell_clk,
      monitor_neg_pwell_clk     => monitor_neg_pwell_clk,
      monitor_comp_nwell_UB     => monitor_comp_nwell_UB,
      monitor_comp_nwell_LB     => monitor_comp_nwell_LB,
      monitor_comp_pos_pwell_UB => monitor_comp_pos_pwell_UB,
      monitor_comp_pos_pwell_LB => monitor_comp_pos_pwell_LB,
      monitor_comp_neg_pwell_UB => monitor_comp_neg_pwell_UB,
      monitor_comp_neg_pwell_LB => monitor_comp_neg_pwell_LB,
      driver_sel_nwell          => driver_sel_nwell,
      driver_sel_pwell          => driver_sel_pwell,
      driver_charge_clk         => driver_charge_clk,
      driver_weak               => '1',
      preset_select             => preset_select,
      preset_activate           => preset_activate,
      force_sleep               => '0');

  apb_cvb_wrapper_1 : entity work.apb_cvb_wrapper
    generic map (
      APB_ADDR_WIDTH => APB_ADDR_WIDTH)
    port map (
      HCLK            => clk,
      HRESETn         => nRST,
      PADDR           => apb_ms.ADDR,
      PWDATA          => apb_ms.WDATA,
      PWRITE          => apb_ms.WRITE,
      PSEL            => apb_ms.SEL,
      PENABLE         => apb_ms.ENABLE,
      PRDATA          => apb_sm.RDATA,
      PREADY          => apb_sm.READY,
      PSLVERR         => apb_sm.SLVERR,
      -- 
      cvp1_pwr_req    => cvp_ms.req,
      cvp1_pwr_wr_rd  => cvp_ms.rw,
      cvp1_pwr_add    => cvp_ms.addr,
      cvp1_pwr_be     => cvp_ms.be,
      cvp1_pwr_data   => cvp_ms.w_data,
      cvp1_pwr_ack    => cvp_sm.ack,
      cvp1_pwr_error  => cvp_sm.err,
      cvp1_pwr_r_data => cvp_sm.r_data,
      -- not used, directly acknowledge each request
      cvp2_pwr_req    => open_cvp_loop,
      cvp2_pwr_wr_rd  => open,
      cvp2_pwr_add    => open,
      cvp2_pwr_be     => open,
      cvp2_pwr_data   => open,
      cvp2_pwr_ack    => open_cvp_loop,
      cvp2_pwr_error  => '0',
      cvp2_pwr_r_data => (others => '0'));

  -- 100 MHz clock
  clk       <= '0' when done = '1' else not clk       after 5 ns;
  -- some clock as uneven as possible (prime ps...)
  clk_bbgen <= '0' when done = '1' else not clk_bbgen after 7333 ps;
  nRST      <= '1'                                    after 101 ns;

  wavegen : process is
  begin  -- process wavegen
    wait until nRST = '1';
    APB_INIT(apb_ms);
    -- write to the preset registers
    APB_WRITE(apb_ms, apb_sm, clk, (others => '0'), BBGEN_CMD_SET_PRESET & x"00" & x"01" & x"02");
    APB_WRITE(apb_ms, apb_sm, clk, (others => '0'), BBGEN_CMD_SET_PRESET & x"01" & x"03" & x"04");
    APB_WRITE(apb_ms, apb_sm, clk, (others => '0'), BBGEN_CMD_SET_PRESET & x"02" & x"05" & x"06");
    APB_WRITE(apb_ms, apb_sm, clk, (others => '0'), BBGEN_CMD_SET_PRESET & x"03" & x"07" & x"08");
    -- select preset 3
    APB_WRITE(apb_ms, apb_sm, clk, (others => '0'), BBGEN_CMD_SELECT_PRESET & x"00" & x"00" & x"03");
    -- speed sampling clock up
    APB_WRITE(apb_ms, apb_sm, clk, (others => '0'), BBGEN_CMD_SAMPLE_CLK & x"00" & x"00" & x"01");
    -- set the idle timer to 255
    APB_WRITE(apb_ms, apb_sm, clk, (others => '0'), BBGEN_CMD_IDLE_TIME & x"00" & x"00" & x"FF");
    -- set the nwell and pwell window size
    APB_WRITE(apb_ms, apb_sm, clk, (others => '0'), BBGEN_CMD_NWELL_WSIZE & x"00" & x"00" & x"01");
    APB_WRITE(apb_ms, apb_sm, clk, (others => '0'), BBGEN_CMD_PWELL_WSIZE & x"00" & x"00" & x"01");
    -- set the nwell and pwell window size
    APB_WRITE(apb_ms, apb_sm, clk, (others => '0'), BBGEN_CMD_NWELL_BOUND & x"00" & x"00" & x"05");
    APB_WRITE(apb_ms, apb_sm, clk, (others => '0'), BBGEN_CMD_PWELL_BOUND & x"00" & x"00" & std_logic_vector(to_signed(-5, 8)));

    APB_READ(apb_ms, apb_sm, clk, std_logic_vector(to_unsigned(1, 9)) & "000", data);
    APB_READ(apb_ms, apb_sm, clk, std_logic_vector(to_unsigned(2, 9)) & "000", data);
    APB_READ(apb_ms, apb_sm, clk, std_logic_vector(to_unsigned(3, 9)) & "000", data);


    preset_select   <= "10";
    wait for 1 ns;
    preset_activate <= '1';
    wait for 300 ns;
    preset_activate <= '0';
    done            <= '1';
    wait until false;
  end process wavegen;

end architecture tb;

