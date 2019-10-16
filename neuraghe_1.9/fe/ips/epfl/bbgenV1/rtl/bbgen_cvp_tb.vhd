-------------------------------------------------------------------------------
-- Title      : Testbench for the bbgen CVP interface
-------------------------------------------------------------------------------
-- File       : bbgen_cvp_tb.vhd
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
use ieee.numeric_std.all;

library work;
use work.cvp_package.all;

entity bbgen_cvp_tb is

end entity bbgen_cvp_tb;

architecture tb of bbgen_cvp_tb is
  component bbgen_cvp_interface is
    generic (
      CVP_DATA_WIDTH : integer;
      CVP_ADDR_WIDTH : integer);
    port (
      clk          : in  std_logic;
      nRST         : in  std_logic;
      cvp_req      : in  std_logic;
      cvp_ack      : out std_logic;
      cvp_w_data   : in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
      cvp_r_data   : out std_logic_vector(CVP_DATA_WIDTH -1 downto 0);
      cvp_addr     : in  std_logic_vector(CVP_ADDR_WIDTH -1 downto 0);
      cvp_rw       : in  std_logic;
      cvp_be       : in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
      cvp_error    : out std_logic;
      bbgen_en     : out std_logic;
      bbgen_w_data : out std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
      bbgen_r_data : in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
      bbgen_addr   : out std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
      bbgen_rw     : out std_logic;
      bbgen_be     : out std_logic_vector(CVP_BE_WIDTH -1 downto 0);
      bbgen_error  : in  std_logic);
  end component bbgen_cvp_interface;

  signal bbgen_en     : std_logic;
  signal bbgen_w_data : std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
  signal bbgen_r_data : std_logic_vector(CVP_DATA_WIDTH - 1 downto 0) := (others => '1');
  signal bbgen_addr   : std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
  signal bbgen_rw     : std_logic;
  signal bbgen_be     : std_logic_vector(CVP_BE_WIDTH -1 downto 0);
  signal bbgen_error  : std_logic                                     := '0';


  signal cvp_ms : CVP_BUS_MS_t;
  signal cvp_sm : CVP_BUS_SM_t;

  signal clk       : std_logic := '0';
  signal clk_bbgen : std_logic := '0';
  signal nRST      : std_logic := '0';
  signal data      : std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
  signal done      : std_logic := '0';



begin  -- architecture tb

  bbgen_cvp_interface_1 : entity work.bbgen_cvp_interface
    generic map (
      CVP_DATA_WIDTH => CVP_DATA_WIDTH,
      CVP_ADDR_WIDTH => CVP_ADDR_WIDTH)
    port map (
      clk          => clk_bbgen,
      nRST         => nRST,
      cvp_req      => cvp_ms.req,
      cvp_ack      => cvp_sm.ack,
      cvp_w_data   => cvp_ms.w_data,
      cvp_r_data   => cvp_sm.r_data,
      cvp_addr     => cvp_ms.addr,
      cvp_rw       => cvp_ms.rw,
      cvp_be       => cvp_ms.be,
      cvp_error    => cvp_sm.err,
      bbgen_en     => bbgen_en,
      bbgen_w_data => bbgen_w_data,
      bbgen_r_data => bbgen_r_data,
      bbgen_addr   => bbgen_addr,
      bbgen_rw     => bbgen_rw,
      bbgen_be     => bbgen_be,
      bbgen_error  => bbgen_error);

  -- 100 MHz clock
  clk       <= '0' when done = '1' else not clk       after 5 ns;
  -- some clock as uneven as possible (prime ps...)
  clk_bbgen <= '0' when done = '1' else not clk_bbgen after 7333 ps;
  nRST      <= '1'                                    after 101 ns;
  wavegen : process is

  begin  -- process wavegen
    CVP_INIT(cvp_ms);
    CVP_WRITE(cvp_ms, cvp_sm, (others => '0'), (others => '1'));
    CVP_READ(cvp_ms, cvp_sm, (others  => '0'), data);
    done <= '1';
    wait until false;
  end process wavegen;

end architecture tb;

