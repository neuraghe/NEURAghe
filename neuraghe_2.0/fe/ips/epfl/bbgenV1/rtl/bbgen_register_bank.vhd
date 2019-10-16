-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : bbgen_pwell_register_bank.vhdl
-- Author     : Christoph Thomas Mueller <christoph.mueller@epfl.ch>
-- Company    : EPFL Lausanne
-- Created    : 2015-05-22
-- Last update: 2015-06-10
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2015 EPFL Lausanne
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Author   Description
-- 2015-05-22  tcmuelle Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library bbgen_lib;
use bbgen_lib.bbgen_package.all;
use bbgen_lib.cvp_package.all;

-------------------------------------------------------------------------------

entity bbgen_register_bank is

  port (
    clk                 : in  std_logic;
    nRST                : in  std_logic;
    ---------------------------------------------------------------------------
    -- 
    ---------------------------------------------------------------------------
    preset_select       : in  std_logic_vector(1 downto 0);
    preset_activate     : in  std_logic;
    driver_weak         : in  std_logic;
    ---------------------------------------------------------------------------
    -- configuration register bank
    ---------------------------------------------------------------------------
    bbgen_register_bank : out BBGEN_REGISTER_BANK_t;
    ---------------------------------------------------------------------------
    -- read only status data for debugging purposes
    ---------------------------------------------------------------------------
    bbgen_status_bits   : in  BBGEN_STATUS_BITS_t;
    ---------------------------------------------------------------------------
    -- Interface towards CVP
    ---------------------------------------------------------------------------
    bbgen_en            : in  std_logic;
    bbgen_w_data        : in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
    bbgen_r_data        : out std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
    bbgen_addr          : in  std_logic_vector(CVP_ADDR_WIDTH - 1 downto 0);
    bbgen_rw            : in  std_logic;
    bbgen_be            : in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
    bbgen_error         : out std_logic;
    nwell_control_state : in  BBGEN_NWELL_CONTROL_STATE_t;
    pwell_control_state : in  BBGEN_PWELL_CONTROL_STATE_t;
    pwell_update        : out std_logic;
    nwell_update        : out std_logic;
    ---------------------------------------------------------------------------
    -- force sleep mode for bypass operation
    ---------------------------------------------------------------------------
    force_sleep         : in  std_logic
    );

end entity bbgen_register_bank;

-------------------------------------------------------------------------------

architecture str of bbgen_register_bank is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  signal register_bank, next_register_bank : BBGEN_REGISTER_BANK_t;
  alias addr_lower_byte                    : std_logic_vector(7 downto 0) is bbgen_addr(7 downto 0);
  type   byte_sepparation is array (3 downto 0) of std_logic_vector(7 downto 0);
  signal w_data                            : byte_sepparation;

  type bytemap_t is array (BBGEN_REG_NUM - 1 downto 0) of byte_sepparation;

  signal mapping_read, mapping_write : bytemap_t;

  signal preset_activate_sync : std_logic;
  component bbgen_synchronizer is
    port (
      clk  : in  std_logic;
      nRST : in  std_logic;
      A    : in  std_logic;
      Z    : out std_logic);
  end component bbgen_synchronizer;

begin  -- architecture str

  -----------------------------------------------------------------------------
  -- for convinienec: split the data into bytes to simplify data sepparation
  -----------------------------------------------------------------------------
  w_data(0)    <= bbgen_w_data(7 downto 0);
  w_data(1)    <= bbgen_w_data(15 downto 8);
  w_data(2)    <= bbgen_w_data(23 downto 16);
  w_data(3)    <= bbgen_w_data(31 downto 24);
  --w_data(4)    <= bbgen_w_data(39 downto 32);
  --w_data(5)    <= bbgen_w_data(47 downto 40);
  --w_data(6)    <= bbgen_w_data(55 downto 48);
  --w_data(7)    <= bbgen_w_data(63 downto 56);
  -----------------------------------------------------------------------------
  bbgen_r_data <= x"00000000" & register_bank.return_register;
  -----------------------------------------------------------------------------

  bbgen_error <= '0';
  -----------------------------------------------------------------------------
  -- register transition
  -----------------------------------------------------------------------------
  register_transition : process (clk, nRST) is
  begin  -- process register_transition
    if nRST = '0' then                  -- asynchronous reset (active low)
      register_bank <= BBGEN_REGISTER_BANK_RESET;
    elsif clk'event and clk = '1' then  -- rising clock edge
      register_bank <= next_register_bank;
    end if;
  end process register_transition;

  -- purpose: overrides the enable outputs when force_sleep is active
  -- type   : combinational
  -- inputs : register_bank, force_sleep
  -- outputs: bbgen_register_bank
  force_sleep_override : process (register_bank, force_sleep)
  begin  -- process force_sleep
    bbgen_register_bank <= register_bank;
    if force_sleep = '1' then
      bbgen_register_bank.pwell_enable <= '0';
      bbgen_register_bank.nwell_enable <= '0';
    end if;
  end process force_sleep_override;

  -----------------------------------------------------------------------------
  -- register mapping
  -----------------------------------------------------------------------------
  -- purpose: mapps the content of the register bank to the memory interface
  -- and back to new register bank values
  -- type   : combinational
  -- inputs : register_bank, mapping_write
  -- outputs: mapping_read
  register_map : process (register_bank, w_data, bbgen_addr, bbgen_en, bbgen_rw, pwell_control_state, nwell_control_state, preset_activate_sync, preset_select) is
  begin  -- process register_map
    -- default values
    next_register_bank <= register_bank;
    pwell_update       <= '0';
    nwell_update       <= '0';


    if (pwell_control_state = nIDLE or pwell_control_state = pIDLE or pwell_control_state = nSAMPLE or pwell_control_state = pSAMPLE) and (nwell_control_state = IDLE or nwell_control_state = SAMPLE) then
      next_register_bank.target_reached <= '1';
    end if;

    -- address 0: commands (write), return value (read)
    if bbgen_addr = (bbgen_addr'range => '0') then
      if bbgen_en = '1' and bbgen_rw = '0' then
        case w_data(3) is
          when BBGEN_CMD_SELECT_PRESET =>
            case w_data(0)(1 downto 0) is
              when "00" =>
                next_register_bank.pwell_bound <= register_bank.pwell_bound_preset0;
                next_register_bank.nwell_bound <= register_bank.nwell_bound_preset0;
              when "01" =>
                next_register_bank.pwell_bound <= register_bank.pwell_bound_preset1;
                next_register_bank.nwell_bound <= register_bank.nwell_bound_preset1;
              when "10" =>
                next_register_bank.pwell_bound <= register_bank.pwell_bound_preset2;
                next_register_bank.nwell_bound <= register_bank.nwell_bound_preset2;
              when "11" =>
                next_register_bank.pwell_bound <= register_bank.pwell_bound_preset3;
                next_register_bank.nwell_bound <= register_bank.nwell_bound_preset3;
              when others => null;
            end case;
            next_register_bank.target_reached <= '0';
            pwell_update                      <= '1';
            nwell_update                      <= '1';
          when BBGEN_CMD_SET_PRESET =>
            case w_data(2)(1 downto 0) is
              when "00" =>
                next_register_bank.pwell_bound_preset0 <= resize(signed(w_data(1)), BBGEN_DAC_WIDTH + 1);
                next_register_bank.nwell_bound_preset0 <= resize(unsigned(w_data(0)), BBGEN_DAC_WIDTH);
              when "01" =>
                next_register_bank.pwell_bound_preset1 <= resize(signed(w_data(1)), BBGEN_DAC_WIDTH + 1);
                next_register_bank.nwell_bound_preset1 <= resize(unsigned(w_data(0)), BBGEN_DAC_WIDTH);
              when "10" =>
                next_register_bank.pwell_bound_preset2 <= resize(signed(w_data(1)), BBGEN_DAC_WIDTH + 1);
                next_register_bank.nwell_bound_preset2 <= resize(unsigned(w_data(0)), BBGEN_DAC_WIDTH);
              when "11" =>
                next_register_bank.pwell_bound_preset3 <= resize(signed(w_data(1)), BBGEN_DAC_WIDTH + 1);
                next_register_bank.nwell_bound_preset3 <= resize(unsigned(w_data(0)), BBGEN_DAC_WIDTH);
              when others => null;
            end case;
          when BBGEN_CMD_NWELL_BOUND =>
            next_register_bank.nwell_bound    <= resize(unsigned(w_data(0)), BBGEN_DAC_WIDTH);
            next_register_bank.target_reached <= '0';
            nwell_update                      <= '1';
          when BBGEN_CMD_PWELL_BOUND =>
            next_register_bank.pwell_bound    <= resize(signed(w_data(0)), BBGEN_DAC_WIDTH + 1);
            next_register_bank.target_reached <= '0';
            pwell_update                      <= '1';
          when BBGEN_CMD_NWELL_WSIZE =>
            next_register_bank.nwell_bound_window_size <= resize(unsigned(w_data(0)), BBGEN_COMP_WINDOW_WIDTH);
          when BBGEN_CMD_PWELL_WSIZE =>
            next_register_bank.pwell_bound_window_size <= resize(unsigned(w_data(0)), BBGEN_COMP_WINDOW_WIDTH);
          when BBGEN_CMD_IDLE_TIME =>
            next_register_bank.idle_time <= unsigned(w_data(1)) & unsigned(w_data(0));
          when BBGEN_CMD_SAMPLE_CLK =>
            next_register_bank.sample_clock_divider <= resize(unsigned(w_data(0)), BBGEN_CLOCK_DIVISION_COUNTER_WIDTH);
          when BBGEN_CMD_CHARGEPUMP_CLK =>
            case driver_weak is
              when '1' =>
                next_register_bank.weak_chargepump_clock_divider <= resize(unsigned(w_data(0)), BBGEN_CLOCK_DIVISION_COUNTER_WIDTH);
              when others =>
                next_register_bank.chargepump_clock_divider <= resize(unsigned(w_data(0)), BBGEN_CLOCK_DIVISION_COUNTER_WIDTH);
            end case;
          when BBGEN_CMD_GND_TRANSITION_WSIZE =>
            next_register_bank.gnd_transition_window_size <= resize(unsigned(w_data(0)), BBGEN_COMP_WINDOW_WIDTH);

          when BBGEN_CMD_ENABLE_DISABLE =>
            next_register_bank.pwell_enable <= w_data(0)(1);
            next_register_bank.nwell_enable <= w_data(0)(0);
          when others => null;
        end case;
      end if;
    end if;

    if bbgen_en = '1' and bbgen_rw = '1' then
      -- empty the register contents (default value)
      next_register_bank.return_register <= (others => '0');
      case bbgen_addr(7 downto 0) is
        when x"01" =>

          -- address 1: reference settings
          next_register_bank.return_register(7 downto 0)   <= "000" & bbgen_status_bits.nwell_LB_ref;
          next_register_bank.return_register(15 downto 8)  <= "000" & bbgen_status_bits.nwell_UB_ref;
          next_register_bank.return_register(23 downto 16) <= "000" & bbgen_status_bits.pwell_LB_ref;
          next_register_bank.return_register(31 downto 24) <= "000" & bbgen_status_bits.pwell_UB_ref;
        when x"02" =>
          -- address 2 : comparator outputs
          next_register_bank.return_register(7 downto 0) <= register_bank.pwell_enable
                                                            & register_bank.nwell_enable
                                                            & bbgen_status_bits.nwell_comp_LB
                                                            & bbgen_status_bits.nwell_comp_UB
                                                            & bbgen_status_bits.pwell_pos_comp_LB
                                                            & bbgen_status_bits.pwell_pos_comp_UB
                                                            & bbgen_status_bits.pwell_neg_comp_LB
                                                            & bbgen_status_bits.pwell_neg_comp_UB;
          next_register_bank.return_register(8)            <= force_sleep;
          next_register_bank.return_register(9)            <= driver_weak;
          next_register_bank.return_register(23 downto 16) <= std_logic_vector(resize(register_bank.gnd_transition_window_size, 8));
          
        when x"03" =>
          -- address 3: read pwell/nwell bounds and window widths
          next_register_bank.return_register(7 downto 0)   <= std_logic_vector(resize(register_bank.nwell_bound, 8));
          next_register_bank.return_register(15 downto 8)  <= std_logic_vector(resize(register_bank.pwell_bound, 8));
          next_register_bank.return_register(23 downto 16) <= std_logic_vector(resize(register_bank.nwell_bound_window_size, 8));
          next_register_bank.return_register(31 downto 24) <= std_logic_vector(resize(register_bank.pwell_bound_window_size, 8));

        when x"04" =>
          -- idle timer:
          next_register_bank.return_register(15 downto 0) <= std_logic_vector(register_bank.idle_time(15 downto 0));

          -- chargepump clock divider
          case driver_weak is
            when '1' =>
              next_register_bank.return_register(23 downto 16) <= std_logic_vector(resize(register_bank.weak_chargepump_clock_divider, 8));
            when others =>
              next_register_bank.return_register(23 downto 16) <= std_logic_vector(resize(register_bank.chargepump_clock_divider, 8));
          end case;

          -- clock divider settings (inversion after ... cycles of reference clock)
          next_register_bank.return_register(31 downto 24) <= std_logic_vector(resize(register_bank.sample_clock_divider, 8));
        when x"05" =>
          --address 2: preset values 0 and 1
          next_register_bank.return_register(7 downto 0)   <= std_logic_vector(resize(register_bank.nwell_bound_preset0, 8));
          next_register_bank.return_register(15 downto 8)  <= std_logic_vector(resize(register_bank.pwell_bound_preset0, 8));
          next_register_bank.return_register(23 downto 16) <= std_logic_vector(resize(register_bank.nwell_bound_preset1, 8));
          next_register_bank.return_register(31 downto 24) <= std_logic_vector(resize(register_bank.pwell_bound_preset1, 8));
        when x"06" =>
          --address 2: preset values 2 and 3
          next_register_bank.return_register(7 downto 0)   <= std_logic_vector(resize(register_bank.nwell_bound_preset2, 8));
          next_register_bank.return_register(15 downto 8)  <= std_logic_vector(resize(register_bank.pwell_bound_preset2, 8));
          next_register_bank.return_register(23 downto 16) <= std_logic_vector(resize(register_bank.nwell_bound_preset3, 8));
          next_register_bank.return_register(31 downto 24) <= std_logic_vector(resize(register_bank.pwell_bound_preset3, 8));
          
        when others =>
          null;
      end case;
    end if;

    ---------------------------------------------------------------------------
    -- external preset handling - overrides if needed.
    ---------------------------------------------------------------------------
    if preset_activate_sync = '1' then
      case preset_select is
        when "00" =>
          next_register_bank.pwell_bound <= register_bank.pwell_bound_preset0;
          next_register_bank.nwell_bound <= register_bank.nwell_bound_preset0;
        when "01" =>
          next_register_bank.pwell_bound <= register_bank.pwell_bound_preset1;
          next_register_bank.nwell_bound <= register_bank.nwell_bound_preset1;
        when "10" =>
          next_register_bank.pwell_bound <= register_bank.pwell_bound_preset2;
          next_register_bank.nwell_bound <= register_bank.nwell_bound_preset2;
        when "11" =>
          next_register_bank.pwell_bound <= register_bank.pwell_bound_preset3;
          next_register_bank.nwell_bound <= register_bank.nwell_bound_preset3;
        when others => null;
      end case;
      next_register_bank.target_reached <= '0';
      pwell_update                      <= '1';
      nwell_update                      <= '1';
      -- enable the bbgen
      next_register_bank.nwell_enable   <= '1';
      next_register_bank.pwell_enable   <= '1';
    end if;

  end process register_map;

  preset_activate_synchronizer : entity bbgen_lib.bbgen_synchronizer
    port map (
      clk  => clk,
      nRST => nRST,
      A    => preset_activate,
      Z    => preset_activate_sync);

end architecture str;

-------------------------------------------------------------------------------
