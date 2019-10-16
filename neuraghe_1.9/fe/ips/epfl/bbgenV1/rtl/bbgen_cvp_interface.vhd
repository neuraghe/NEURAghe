-------------------------------------------------------------------------------
-- Title      : CVP interface
-------------------------------------------------------------------------------
-- File       : bbgen_cvp_interface.vhd
-- Author     : Christoph Thomas Mueller <christoph.mueller@epfl.ch>
-- Company    : EPFL Lausanne
-- Created    : 2015-05-29
-- Last update: 2015-06-07
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
library bbgen_lib;
use bbgen_lib.cvp_package.all;

-------------------------------------------------------------------------------

entity bbgen_cvp_interface is

  port (
    clk          : in  std_logic;
    nRST         : in  std_logic;
    ---------------------------------------------------------------------------
    -- external asynchronous interface
    ---------------------------------------------------------------------------
    cvp_req      : in  std_logic;
    cvp_ack      : out std_logic;
    cvp_w_data   : in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
    cvp_r_data   : out std_logic_vector(CVP_DATA_WIDTH -1 downto 0);
    cvp_addr     : in  std_logic_vector(CVP_ADDR_WIDTH -1 downto 0);
    cvp_rw       : in  std_logic;
    cvp_be       : in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
    cvp_error    : out std_logic;
    ---------------------------------------------------------------------------
    -- internal synchronous interface
    ---------------------------------------------------------------------------
    bbgen_en     : out std_logic;
    bbgen_w_data : out std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
    bbgen_r_data : in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
    bbgen_addr   : out std_logic_vector(CVP_ADDR_WIDTH - 1 downto 0);
    bbgen_rw     : out std_logic;
    bbgen_be     : out std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
    bbgen_error  : in  std_logic
    );

end bbgen_cvp_interface;

-------------------------------------------------------------------------------

architecture str of bbgen_cvp_interface is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  signal req, ack : std_logic;

  -----------------------------------------------------------------------------
  -- Component declarations
  -----------------------------------------------------------------------------
  component bbgen_synchronizer
    port (
      clk  : in  std_logic;
      nRST : in  std_logic;
      A    : in  std_logic;
      Z    : out std_logic);
  end component;

  type CVP_STATE_t is (waitREQ_S, REQ_S, ACK_S, waitREQn_S, ACKn_S);

  signal interface_state, next_interface_state : CVP_STATE_t;

begin  -- str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------
  request_synchronizer : bbgen_synchronizer
    port map (
      clk  => clk,
      nRST => nRST,
      A    => cvp_req,
      Z    => req);

  state_transition : process (clk, nRST) is
  begin  -- process state_transition
    if nRST = '0' then                  -- asynchronous reset (active low)
      interface_state <= waitREQ_S;     -- wait for a request
    elsif clk'event and clk = '1' then  -- rising clock edge
      interface_state <= next_interface_state;
    end if;
  end process state_transition;

  state_machine : process (req, interface_state, bbgen_r_data, bbgen_error) is
  begin  -- process state_machine
    -- default asignments 
    next_interface_state <= interface_state;
    bbgen_en             <= '0';
    bbgen_rw             <= cvp_rw;
    -- guaranteed to be stable during read/write operation
    bbgen_be             <= cvp_be;
    bbgen_w_data         <= cvp_w_data;
    bbgen_addr <= cvp_addr;
    ack <= '0';
    cvp_r_data <= bbgen_r_data;
    -- error signal not supported
    cvp_error <= '0';
    
    case interface_state is
      when waitREQ_S =>
        ack <= '0';
        if req = '1' then
          next_interface_state <= ACK_S;
        -- capture incomming data
          bbgen_en <= '1';
        end if;
      when ACK_S =>
        ack                  <= '1';
        -- provide outgoing data
        next_interface_state <= waitREQn_S; 
      when waitREQn_S =>
        ack <= '1';
        if req = '0' then
          next_interface_state <= ACKn_S;
        end if;
      when ACKn_S =>
        ack                  <= '0';
        next_interface_state <=  waitREQ_S;
      when others => null;
    end case;
  end process state_machine;

  cvp_ack <= transport ack after CVP_SIMULATION_DELAY;
end str;

-------------------------------------------------------------------------------
