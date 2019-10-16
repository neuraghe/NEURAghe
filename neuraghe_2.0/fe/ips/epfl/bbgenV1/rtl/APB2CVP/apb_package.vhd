-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : apb_cvp_package.vhd
-- Author     : Christoph Thomas Mueller <christoph.mueller@epfl.ch>
-- Company    : EPFL Lausanne
-- Created    : 2015-06-04
-- Last update: 2015-06-06
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2015 EPFL Lausanne
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Author   Description
-- 2015-06-04  tcmuelle Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.bbgen_package.all;

package apb_package is

  constant APB_ADDR_WIDTH : integer := 12;
  constant APB_DATA_WIDTH : integer := 32;

  type APB_MS_t is record
    ADDR   : std_logic_vector(APB_ADDR_WIDTH - 1 downto 0);
    WDATA  : std_logic_vector(APB_DATA_WIDTH - 1 downto 0);
    WRITE  : std_logic;
    SEL    : std_logic;
    ENABLE : std_logic;
  end record APB_MS_t;

  type APB_SM_t is record
    RDATA  : std_logic_vector(APB_DATA_WIDTH - 1 downto 0);
    READY  : std_logic;
    SLVERR : std_logic;
  end record;

  procedure APB_INIT (
    signal apb_ms : out APB_MS_t
    );

  procedure APB_WRITE (
    -- bus declaration
    signal apb_ms : out APB_MS_t;
    signal apb_sm : in  APB_SM_t;
    -- procedure inputs
    signal clk    : in  std_logic;
    addr          :     std_logic_vector(APB_ADDR_WIDTH -1 downto 0);
    data          :     std_logic_vector(APB_DATA_WIDTH -1 downto 0)
    );
  procedure APB_READ (
    -- bus declaration
    signal apb_ms : out APB_MS_t;
    signal apb_sm : in  APB_SM_t;
    -- procedure inputs
    signal clk    : in  std_logic;
    addr          :     std_logic_vector(APB_ADDR_WIDTH -1 downto 0);
    signal data   : out std_logic_vector(APB_DATA_WIDTH -1 downto 0)
    );

end package apb_package;

package body apb_package is

  
  procedure APB_WRITE (
    -- bus declaration
    signal apb_ms : out APB_MS_t;
    signal apb_sm : in  APB_SM_t;
    -- procedure inputs
    signal clk    : in  std_logic;
    addr          :     std_logic_vector(APB_ADDR_WIDTH -1 downto 0);
    data          :     std_logic_vector(APB_DATA_WIDTH -1 downto 0)
    ) is
  begin
    wait until clk'event and clk = '1';
    apb_ms.ADDR   <= addr;
    apb_ms.WDATA  <= data;
    apb_ms.SEL    <= '1';
    apb_ms.ENABLE <= '0';
    apb_ms.WRITE  <= '1';
    wait until clk'event and clk = '1';
    apb_ms.ENABLE <= '1';
    wait until apb_sm.READY = '1';
    wait until clk'event and clk = '1';
    apb_ms.SEL    <= '0';
    apb_ms.ENABLE <= '0';
    apb_ms.WRITE  <= '0';
  end procedure;
  
  procedure APB_READ (
    -- bus declaration
    signal apb_ms : out APB_MS_t;
    signal apb_sm : in  APB_SM_t;
    -- procedure inputs
    signal clk    : in  std_logic;
    addr          :     std_logic_vector(APB_ADDR_WIDTH -1 downto 0);
    signal data   : out std_logic_vector(APB_DATA_WIDTH -1 downto 0)
    ) is
  begin
    wait until clk'event and clk = '1';
    apb_ms.ADDR   <= addr;
    apb_ms.SEL    <= '1';
    apb_ms.ENABLE <= '0';
    apb_ms.WRITE  <= '0';
    wait until clk'event and clk = '1';
    apb_ms.ENABLE <= '1';
    wait until apb_sm.READY = '1';
    wait until clk'event and clk = '1';
    data          <= apb_sm.RDATA;
    apb_ms.SEL    <= '0';
    apb_ms.ENABLE <= '0';
  end procedure;

  procedure APB_INIT (
    signal apb_ms : out APB_MS_t
    ) is
  begin

    apb_ms.ADDR   <= (others => '0');
    apb_ms.SEL    <= '0';
    apb_ms.ENABLE <= '0';
    apb_ms.WRITE  <= '0';
    apb_ms.WDATA  <= (others => '0');
  end procedure;

end apb_package;
