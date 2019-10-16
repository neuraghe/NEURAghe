-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : bbgen_nwell_control.vhd
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
library bbgen_lib;
use bbgen_lib.bbgen_package.all;
-------------------------------------------------------------------------------

entity bbgen_nwell_control is

  port (
    clk                        : in  std_logic;
    nRST                       : in  std_logic;
    driver_sel_nwell           : out std_logic_vector(1 downto 0);
    monitor_comp_nwell_UB      : in  std_logic;
    monitor_comp_nwell_LB      : in  std_logic;
    monitor_nwell_sampling_clk : out std_logic;
    monitor_nwell_UB           : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
    monitor_nwell_LB           : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
    bbgen_register_bank        : in  BBGEN_REGISTER_BANK_t;
    nwell_control_state        : out BBGEN_NWELL_CONTROL_STATE_t;
    pwell_control_state        : in  BBGEN_PWELL_CONTROL_STATE_t;
    nwell_update               : in  std_logic
    );

end bbgen_nwell_control;

-------------------------------------------------------------------------------

architecture str of bbgen_nwell_control is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  signal control_state, next_control_state : BBGEN_NWELL_CONTROL_STATE_t;
  signal c_reg, next_c_reg                 : BBGEN_NWELL_CONTROL_REGISTER_t;
  signal sel                               : std_logic_vector(1 downto 0);
  signal clk_gate                          : std_logic;
  signal comperators                       : std_logic_vector(1 downto 0);
  signal LB, UB                            : unsigned(BBGEN_DAC_WIDTH - 1 downto 0);
begin  -- str
  comperators <= monitor_comp_nwell_UB & monitor_comp_nwell_LB;

  -- purpose: state transition
  -- type   : sequential
  -- inputs : clk, nRST, control_state, control_state_next
  -- outputs: 
  seq : process (clk, nRST) is
  begin  -- process seq
    if nRST = '0' then                  -- asynchronous reset (active low)
      control_state <= SLEEP;
      c_reg         <= BBGEN_NWELL_CONTROL_REGISTER_RESET;
    elsif clk'event and clk = '1' then  -- rising clock edge
      control_state <= next_control_state;
      c_reg         <= next_c_reg;
    end if;
  end process seq;

  state_machine : process (comperators, bbgen_register_bank, control_state, c_reg, LB, UB, pwell_control_state, nwell_update)
  begin  -- process state_machine
    -- default values
    next_control_state <= control_state;
    next_c_reg         <= c_reg;
    next_c_reg.LB      <= std_logic_vector(LB);
    next_c_reg.UB      <= std_logic_vector(UB);
    clk_gate           <= '0';
    sel                <= BBGEN_NWELL_DO_NOTHING;

    -- decrease the idle counter until 0 has been reached
    if c_reg.idle_count /= 0 then
      next_c_reg.idle_count <= c_reg.idle_count - 1;
    end if;

    case control_state is
      when SLEEP =>
        sel <= BBGEN_NWELL_DO_NOTHING;
        next_c_reg <= BBGEN_NWELL_CONTROL_REGISTER_RESET;
        if bbgen_register_bank.nwell_enable = '1' then
          next_control_state <= INIT;
        end if;
      when INIT =>
        sel <= BBGEN_NWELL_CHARGE_GND;
        if c_reg.idle_count = 0 then
          next_control_state <= CHARGEDISCHARGE;
        end if;
      when IDLE =>
        sel <= BBGEN_NWELL_DO_NOTHING;
        -- sample when the idle timer has reached 0 or when the coupled other
        -- well is charged or discharged or when the 
        if c_reg.idle_count = 0 or pwell_control_state = nCHARGEnDISCHARGE or pwell_control_state = pCHARGEpDISCHARGE then
          next_control_state <= SAMPLE;
        end if;
        -- fresh settings available
        if nwell_update = '1' then
          next_control_state <= CHARGEDISCHARGE;
        end if;
      when SAMPLE =>
        sel      <= BBGEN_NWELL_DO_NOTHING;
        -- sample 
        clk_gate <= '1';
        -- decide on the next state depending on the sampling result:
        case comperators is
          when BBGEN_TARGET_REACHED =>
            -- stay in sampling mode if the other well is charged or discharged
            if pwell_control_state = nCHARGEnDISCHARGE or pwell_control_state = pCHARGEpDISCHARGE then
              next_control_state <= SAMPLE;
            else
              next_control_state    <= IDLE;
              next_c_reg.idle_count <= bbgen_register_bank.idle_time;
            end if;
          when others =>
            next_control_state <= CHARGEDISCHARGE;
        end case;
        --fresh settings available
        if nwell_update = '1' then
          next_control_state <= CHARGEDISCHARGE;
        end if;
      when CHARGEDISCHARGE =>
        -- sample
        clk_gate <= '1';
        -- run until the target has been reached
        case comperators is
          when BBGEN_TARGET_REACHED =>
            sel                <= BBGEN_NWELL_DO_NOTHING;
            next_control_state <= SAMPLE;
          when BBGEN_ABOVE_THRESHOLD =>
            sel <= BBGEN_NWELL_CHARGE_GND;
          when BBGEN_BELOW_THRESHOLD =>
            sel <= BBGEN_NWELL_CHARGE_VDD1V8;
          when others => null;
        end case;
      when others => null;
    end case;

    ---------------------------------------------------------------------------
    -- SLEEP MODE
    ---------------------------------------------------------------------------
    if bbgen_register_bank.nwell_enable = '0' then
      next_control_state <= SLEEP;
    end if;
  end process state_machine;

-----------------------------------------------------------------------------
  -- upper and lower boundary values for the monitor block
  -----------------------------------------------------------------------------
  monitor_nwell_LB <= c_reg.LB;
  monitor_nwell_UB <= c_reg.UB;

  -----------------------------------------------------------------------------
  -- generate the settings for lower and upper bound based on the definitions
  -- in the register bank
  -----------------------------------------------------------------------------
  LB <= bbgen_register_bank.nwell_bound;
  UB <= LB + bbgen_register_bank.nwell_bound_window_size;

  -----------------------------------------------------------------------------
  -- sample clock gates
  -----------------------------------------------------------------------------
  monitor_nwell_sampling_clk <= clk when clk_gate = '1' else '0';

  -----------------------------------------------------------------------------
  -- driver select signals
  -----------------------------------------------------------------------------
  driver_sel_nwell <= sel;

  -----------------------------------------------------------------------------
  -- pass the control state towards the pwell controller
  -----------------------------------------------------------------------------
  nwell_control_state <= control_state;
end str;

-------------------------------------------------------------------------------
