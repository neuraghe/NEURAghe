-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : bbgen_pwell_control.vhdl
-- Author     : Christoph Thomas Mueller <christoph.mueller@epfl.ch>
-- Company    : EPFL Lausanne
-- Created    : 2015-05-21
-- Last update: 2015-06-08
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2015 EPFL Lausanne
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Author   Description
-- 2015-05-21  tcmuelle Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library bbgen_lib;
use bbgen_lib.bbgen_package.all;
-------------------------------------------------------------------------------

entity bbgen_pwell_control is

  port (
    clk                            : in  std_logic;
    clk_fast                       : in  std_logic;
    nRST                           : in  std_logic;
    driver_sel_pwell               : out std_logic_vector(1 downto 0);
    driver_pwell_charge_clk        : out std_logic;
    monitor_comp_pos_pwell_UB      : in  std_logic;
    monitor_comp_pos_pwell_LB      : in  std_logic;
    monitor_comp_neg_pwell_UB      : in  std_logic;
    monitor_comp_neg_pwell_LB      : in  std_logic;
    monitor_pwell_neg_sampling_clk : out std_logic;
    monitor_pwell_pos_sampling_clk : out std_logic;
    monitor_pwell_UB               : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
    monitor_pwell_LB               : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
    --;

    ---------------------------------------------------------------------------
    -- register bank related
    ---------------------------------------------------------------------------
    -- read port
    bbgen_register_bank : in  BBGEN_REGISTER_BANK_t;
    nwell_control_state : in  BBGEN_NWELL_CONTROL_STATE_t;
    pwell_control_state : out BBGEN_PWELL_CONTROL_STATE_t;
    pwell_update : in std_logic
    );

end entity bbgen_pwell_control;

-------------------------------------------------------------------------------

architecture str of bbgen_pwell_control is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  signal control_state, next_control_state : BBGEN_PWELL_CONTROL_STATE_t;
  signal c_reg, next_c_reg                 : BBGEN_PWELL_CONTROL_REGISTER_t;
  signal sel                               : std_logic_vector(1 downto 0);
  signal clk_p_gate, clk_n_gate            : std_logic;
  signal clk_chargepump_gate               : std_logic;

  signal neg_comperators : std_logic_vector(1 downto 0);
  signal pos_comperators : std_logic_vector(1 downto 0);

  signal pwell_state : std_logic;

  signal abs_LB, abs_UB : unsigned(BBGEN_DAC_WIDTH - 1 downto 0);
begin  -- architecture str

  neg_comperators <= monitor_comp_neg_pwell_UB & monitor_comp_neg_pwell_LB;
  pos_comperators <= monitor_comp_pos_pwell_UB & monitor_comp_pos_pwell_LB;

  -- purpose: state transition
  -- type   : sequential
  -- inputs : clk, nRST, control_state, control_state_next
  -- outputs: 
  seq : process (clk, nRST) is
  begin  -- process seq
    if nRST = '0' then                  -- asynchronous reset (active low)
      control_state <= SLEEP;
      c_reg         <= BBGEN_PWELL_CONTROL_REGISTER_RESET;
    elsif clk'event and clk = '1' then  -- rising clock edge
      control_state <= next_control_state;
      c_reg         <= next_c_reg;
    end if;
  end process seq;

  state_machine : process (neg_comperators, pos_comperators, control_state, pwell_state, bbgen_register_bank, abs_LB, abs_UB, c_reg, nwell_control_state) is
  begin  -- process state_machine
    -- default values
    next_control_state  <= control_state;
    next_c_reg          <= c_reg;
    clk_p_gate          <= '0';
    clk_n_gate          <= '0';
    clk_chargepump_gate <= '0';
    sel                 <= BBGEN_PWELL_DO_NOTHING;
    pwell_state         <= BBGEN_P_POSITIVE;

    -- decrease the idle counter until 0 has been reached
    if c_reg.idle_count /= 0 then
      next_c_reg.idle_count <= c_reg.idle_count - 1;
    end if;

    -- state machine
    case control_state is
      when SLEEP =>
        sel <= BBGEN_PWELL_DO_NOTHING;
        next_c_reg <= BBGEN_PWELL_CONTROL_REGISTER_RESET;
        if bbgen_register_bank.pwell_enable = '1' then
          next_control_state <= INIT;
        end if;
      -------------------------------------------------------------------------
      -- Drive the biasing into a known state on reset:
      -- 1) enable charge towards GND
      -- 2) setup idle timer to a value where we can be sure to have
      --    reached GND
      -- 3) jump into positive sample state
      -------------------------------------------------------------------------
      when INIT =>
        sel <= BBGEN_PWELL_CHARGE_GND;
        if c_reg.idle_count = 0 then
          next_control_state    <= pCHARGEpDISCHARGE;
          -- 100 cycles @ 10 MHz = 10 us
          next_c_reg.pwell_mode <= '1';
        end if;


        -------------------------------------------------------------------------
        -- negative Idle state - the well has sattled and the idle counter
        -- sets the sampling interval
        -------------------------------------------------------------------------
      when nIDLE =>
        sel         <= BBGEN_PWELL_DO_NOTHING;
        pwell_state <= BBGEN_P_NEGATIVE;
        -- sample when the idle timer has reached 0 or when the coupled other
        -- well is charged or discharged
        if c_reg.idle_count = 0 or nwell_control_state = CHARGEDISCHARGE then
          next_control_state <= nSAMPLE;
        else
          next_c_reg.idle_count <= c_reg.idle_count - 1;
        end if;

        -- fresh settings available
        if pwell_update = '1' then
          next_control_state <= nCHARGEnDISCHARGE;
        end if;
        -------------------------------------------------------------------------
        -- Sampling state
        -------------------------------------------------------------------------
      when nSAMPLE =>
        sel         <= BBGEN_PWELL_DO_NOTHING;
        pwell_state <= BBGEN_P_NEGATIVE;
        -- sample using the negative sampler
        clk_n_gate  <= '1';
        -- decide on the next state depending on the sampling result:
        case neg_comperators is
          when BBGEN_TARGET_REACHED =>
            if c_reg.transition_flag = '0' then
              if nwell_control_state = CHARGEDISCHARGE then
                next_control_state <= nSAMPLE;
              else
                next_control_state    <= nIDLE;
                next_c_reg.idle_count <= bbgen_register_bank.idle_time;
              end if;
            else
              next_control_state <= npTRANSITION;
            end if;
          when others =>
            next_control_state <= nCHARGEnDISCHARGE;
        end case;

        -- fresh settings available
        if pwell_update = '1' then
          next_control_state <= nCHARGEnDISCHARGE;
        end if;
        -------------------------------------------------------------------------
        -- Charge state:
        -- enables the negative charge pump and samples repeatedly until the
        -- target voltage has been reached
        -------------------------------------------------------------------------

      when nCHARGEnDISCHARGE =>
        -- sample using the positive sampler
        clk_n_gate  <= '1';
        pwell_state <= BBGEN_P_NEGATIVE;
        -- run until the target has been reached
        case neg_comperators is
          when BBGEN_TARGET_REACHED =>
            sel                <= BBGEN_PWELL_DO_NOTHING;
            next_control_state <= nSAMPLE;
          when BBGEN_ABOVE_THRESHOLD =>
            sel <= BBGEN_PWELL_CHARGE_GND;
          when BBGEN_BELOW_THRESHOLD =>
            sel                 <= BBGEN_PWELL_NEGATIVE_CHARGE_PUMP;
            clk_chargepump_gate <= '1';
          when others => null;
        end case;

        -------------------------------------------------------------------------
        -- Transition from negative to positive mode
        -------------------------------------------------------------------------  
      when npTRANSITION =>
        pwell_state                <= BBGEN_P_POSITIVE;
        next_c_reg.transition_flag <= '0';
        next_c_reg.pwell_mode      <= '1';
        next_control_state         <= pCHARGEpDISCHARGE;


        -------------------------------------------------------------------------
        -- Transition from positive to negative mode
        -------------------------------------------------------------------------                    
      when pnTRANSITION =>
        pwell_state                <= BBGEN_P_NEGATIVE;
        next_c_reg.transition_flag <= '0';
        next_c_reg.pwell_mode      <= '0';
        next_control_state         <= nCHARGEnDISCHARGE;

        -------------------------------------------------------------------------
        -- positive Idle state - the well has sattled and the idle counter
        -- sets the sampling interval
        -------------------------------------------------------------------------                    
      when pIDLE =>
        sel <= BBGEN_PWELL_DO_NOTHING;
        -- sample when the idle timer has reached 0 or when the coupled other
        -- well is charged or discharged
        if c_reg.idle_count = 0 or nwell_control_state = CHARGEDISCHARGE then
          next_control_state <= pSAMPLE;
        else
          next_c_reg.idle_count <= c_reg.idle_count - 1;
        end if;
        -- fresh settings available
        if pwell_update = '1' then
          next_control_state <= pCHARGEpDISCHARGE;
        end if;
        -------------------------------------------------------------------------
        -- Sampling state
        -------------------------------------------------------------------------  
      when pSAMPLE =>
        sel        <= BBGEN_PWELL_DO_NOTHING;
        clk_p_gate <= '1';
        case pos_comperators is
          when BBGEN_TARGET_REACHED =>
            if c_reg.transition_flag = '0' then
              if nwell_control_state = CHARGEDISCHARGE then
                next_control_state <= pSAMPLE;
              else
                next_control_state    <= pIDLE;
                next_c_reg.idle_count <= bbgen_register_bank.idle_time;
              end if;
            else
              next_control_state <= pnTRANSITION;
            end if;
          when others =>
            next_control_state <= pCHARGEpDISCHARGE;
        end case;
        -- fresh settings available
        if pwell_update = '1' then
          next_control_state <= pCHARGEpDISCHARGE;
        end if;
        -------------------------------------------------------------------------
        -- Charge state:
        -- enables driver towards VDD until and samples until the target voltage ]\
        -- has been reached  
        -------------------------------------------------------------------------  
      when pCHARGEpDISCHARGE =>
        -- sample using the positive sampler
        clk_p_gate <= '1';
        -- run until the target has been reached
        case pos_comperators is
          when BBGEN_TARGET_REACHED =>
            sel                <= BBGEN_PWELL_DO_NOTHING;
            next_control_state <= pSAMPLE;
          when BBGEN_ABOVE_THRESHOLD =>
            sel <= BBGEN_PWELL_CHARGE_GND;
          when BBGEN_BELOW_THRESHOLD =>
            sel <= BBGEN_PWELL_CHARGE_VDD;
          when others => null;
        end case;
        
      when others => null;
    end case;

    ---------------------------------------------------------------------------
    -- Handling of the boundary settings
    ---------------------------------------------------------------------------
    case pwell_state is
      when BBGEN_P_POSITIVE =>
        if bbgen_register_bank.pwell_bound < 0 then
          next_c_reg.LB              <= (others => '0');
          next_c_reg.UB              <= std_logic_vector(resize(bbgen_register_bank.gnd_transition_window_size, BBGEN_DAC_WIDTH));
          next_c_reg.transition_flag <= '1';
        else
          next_c_reg.LB <= std_logic_vector(abs_LB);
          next_c_reg.UB <= std_logic_vector(abs_UB);
        end if;
        
      when BBGEN_P_NEGATIVE =>
        if bbgen_register_bank.pwell_bound > 0 then
          next_c_reg.LB              <= (others => '0');
          next_c_reg.UB              <= std_logic_vector(resize(bbgen_register_bank.gnd_transition_window_size, BBGEN_DAC_WIDTH));
          next_c_reg.transition_flag <= '1';
        else
          next_c_reg.LB <= std_logic_vector(abs_LB);
          next_c_reg.UB <= std_logic_vector(abs_UB);
        end if;
      when others => null;
    end case;

    ---------------------------------------------------------------------------
    -- SLEEP MODE
    ---------------------------------------------------------------------------
    if bbgen_register_bank.pwell_enable = '0' then
      next_control_state <= SLEEP;
    end if;
  end process state_machine;


  -----------------------------------------------------------------------------
  -- upper and lower boundary values for the monitor block
  -----------------------------------------------------------------------------

  monitor_pwell_LB <= c_reg.LB;
  monitor_pwell_UB <= c_reg.UB;

  -----------------------------------------------------------------------------
  -- generate the settings for lower and upper bound based on the definitions
  -- in the register bank
  -----------------------------------------------------------------------------

  abs_LB <= resize(unsigned(abs(bbgen_register_bank.pwell_bound)), abs_LB'length);
  abs_UB <= abs_LB + bbgen_register_bank.pwell_bound_window_size;

  -----------------------------------------------------------------------------
  -- sample clock gates
  -----------------------------------------------------------------------------
  monitor_pwell_pos_sampling_clk <= clk when clk_p_gate = '1' else '0';
  monitor_pwell_neg_sampling_clk <= clk when clk_n_gate = '1' else '0';

  -----------------------------------------------------------------------------
  -- charge pump clock gate
  -----------------------------------------------------------------------------

  driver_pwell_charge_clk <= clk_fast when clk_chargepump_gate = '1' else '0';
  -----------------------------------------------------------------------------
  -- driver select signals
  -----------------------------------------------------------------------------
  driver_sel_pwell        <= sel;

  -----------------------------------------------------------------------------
  -- pass the control state towards the pwell control state
  -----------------------------------------------------------------------------

  pwell_control_state <= control_state;
end architecture str;

-------------------------------------------------------------------------------
