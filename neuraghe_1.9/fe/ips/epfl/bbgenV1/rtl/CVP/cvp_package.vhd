-------------------------------------------------------------------------------
-- Title      : CVP package
-------------------------------------------------------------------------------
-- File       : cvp_package.vhd
-- Author     : Christoph Thomas Mueller <christoph.mueller@epfl.ch>
-- Company    : EPFL Lausanne
-- Created    : 2015-05-29
-- Last update: 2015-06-03
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

package cvp_package is

  constant CVP_DATA_WIDTH : integer := 64;
  constant CVP_ADDR_WIDTH : integer := 29;
  constant CVP_BE_WIDTH   : integer := 8;

  constant CVP_SIMULATION_DELAY : time := 7 ns;


  type CVP_BUS_MS_t is record           --
    req    : std_logic;
    w_data : std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
    addr   : std_logic_vector(CVP_ADDR_WIDTH - 1 downto 0);
    rw     : std_logic;
    be     : std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
  end record CVP_BUS_MS_t;

  type CVP_BUS_SM_t is record           --
    ack    : std_logic;
    r_data : std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
    err    : std_logic;
  end record CVP_BUS_SM_t;
  
  procedure CVP_READ (
    signal cvp_ms  : out CVP_BUS_MS_t;
    signal cvp_sm : in CVP_BUS_SM_t;
    addr        :       std_logic_vector(CVP_ADDR_WIDTH - 1 downto 0);
    signal data : out   std_logic_vector(CVP_DATA_WIDTH - 1 downto 0));

  procedure CVP_WRITE (
    signal cvp_ms  : out CVP_BUS_MS_t;
    signal cvp_sm : in CVP_BUS_SM_t;
    addr       :       std_logic_vector(CVP_ADDR_WIDTH - 1 downto 0);
    data       :       std_logic_vector(CVP_DATA_WIDTH - 1 downto 0)
    );

  procedure CVP_INIT (
    signal cvp_ms : out CVP_BUS_MS_t);

end package cvp_package;

package body cvp_package is

  procedure CVP_INIT (
    signal cvp_ms : out CVP_BUS_MS_t) is
  begin  -- procedure CVP_INIT
    cvp_ms.w_data <= (others => '0');
    cvp_ms.addr   <= (others => '0');
    cvp_ms.req    <= '0';
    cvp_ms.rw     <= '0';
    cvp_ms.be     <= (others => '0');
  end procedure CVP_INIT;

  procedure CVP_READ (
    signal cvp_ms : out CVP_BUS_MS_t;
    signal cvp_sm : in CVP_BUS_SM_t;
    addr        :       std_logic_vector(CVP_ADDR_WIDTH - 1 downto 0);
    signal data : out   std_logic_vector(CVP_DATA_WIDTH - 1 downto 0)
    ) is
  begin
    cvp_ms.req  <= '1';
    cvp_ms.rw   <= '1';
    cvp_ms.addr <= addr;
    wait until cvp_sm.ack = '1';
    wait for CVP_SIMULATION_DELAY;
    data     <= cvp_sm.r_data;
    cvp_ms.req  <= '0';
    wait until cvp_sm.ack = '0';
    wait for CVP_SIMULATION_DELAY;
  end procedure;

  procedure CVP_WRITE (
    signal cvp_ms : out CVP_BUS_MS_t;
    signal cvp_sm : in CVP_BUS_SM_t;
    addr       :       std_logic_vector(CVP_ADDR_WIDTH - 1 downto 0);
    data       :       std_logic_vector(CVP_DATA_WIDTH - 1 downto 0)
    ) is
  begin
    cvp_ms.req    <= '1';
    cvp_ms.rw     <= '0';
    cvp_ms.addr   <= addr;
    cvp_ms.w_data <= data;
    wait until cvp_sm.ack = '1';
    wait for CVP_SIMULATION_DELAY;
    cvp_ms.req    <= '0';
    wait until cvp_sm.ack = '0';
    wait for CVP_SIMULATION_DELAY;
  end procedure;

end package body cvp_package;
