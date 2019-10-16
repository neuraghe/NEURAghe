--! @file cvp_clock_gen.vhd
--! @brief 
--! 
--! 
--! 
--! 
--! @par  Module owner: Ivan MIRO PANADES
--!       ivan.miro-panades@cea.fr
--! 
--! @par  Copyright (C) 2011 CEA
--! 
--! @par  Authors: Ivan MIRO PANADES
--! 
--! @par  Id: $Id: cvp_clock_gen.vhd 1 2014-01-15 16:11:08Z im219746 $
--! @par  Date: $Date: 2014-01-15 17:11:08 +0100 (Wed, 15 Jan 2014) $
--! @par  Revision: $Rev: 1 $
--!

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY fll_lib;
USE fll_lib.ALL;

ENTITY cvp_clock_gen IS
  GENERIC(
    ADDRESS_SIZE           : NATURAL := 3;  --Number of bits used on the address. Minimum 3
    NUM_FREQ_MODES         : NATURAL := 4;  --Number of frequency_modes. Maximum 8
    BYPASS_MODE_AFTER_RESET: STD_LOGIC := '1';
    BYPASS_CMD_AFTER_RESET : STD_LOGIC_VECTOR(7 downto 0) := "10000000";
    ENABLE_AFTER_RESET     : STD_LOGIC := '1';
    FLL_CMD_AFTER_RESET    : STD_LOGIC_VECTOR(7 downto 0) := "10000000";
    CLK_DIV_AFTER_RESET    : STD_LOGIC_VECTOR(3 downto 0) := "0101"
  );

  PORT(
    -- General signals
    rst_n          : IN  STD_LOGIC;
    rst_ref_n      : IN  STD_LOGIC;                    -- reset, already re-synchronized with the clk_ref clock 
    rst_async_n    : IN  STD_LOGIC;                    -- hard reset, fully asynchronous (used by fll_counter and fll_clk_ref)
    clk            : IN  STD_LOGIC;
    clk_ref        : IN  STD_LOGIC;                    -- external reference clock (= 100MHz)
    test_mode      : IN  STD_LOGIC;                    -- test_mode : only DFT on the control block (clk domain)

    in_data        : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
    in_address     : IN  STD_LOGIC_VECTOR(ADDRESS_SIZE-1 DOWNTO 0);
    in_be          : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    in_wr_rd       : IN  STD_LOGIC;      -- '1' > read / '0' > write
    in_req         : IN  STD_LOGIC;

    out_data       : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    out_valid      : OUT STD_LOGIC;
    out_error      : OUT STD_LOGIC;

    -- Power controller interface
    cmd_freq          : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
    cmd_safe          : IN  STD_LOGIC;
    valid_clk         : OUT STD_LOGIC; 
    valid_xpct_clk    : OUT STD_LOGIC; 
    current_set_point : OUT STD_LOGIC_VECTOR(7 downto 0);  
    
    -- Generated clock  
    clk_out	          : OUT STD_LOGIC
  );
END cvp_clock_gen;

ARCHITECTURE rtl OF cvp_clock_gen IS

  COMPONENT fll_top IS
    GENERIC (
      BYPASS_CMD_AFTER_RESET : STD_LOGIC_VECTOR(7 downto 0) := "10000000";
      CLK_DIV_AFTER_RESET    : STD_LOGIC_VECTOR := "1000"  -- Value aplied to the muxes at reset 
    );
    PORT(
      -- General signals
      rst_n               : IN  STD_LOGIC;                    -- reset, already re-synchronized with the CVP-U clock : clk
      rst_ref_n           : IN  STD_LOGIC;                    -- reset, already re-synchronized with the clk_ref clock 
      rst_async_n         : IN  STD_LOGIC;                    -- hard reset, fully asynchronous (used by fll_counter and fll_clk_ref)
      clk                 : IN  STD_LOGIC;                    -- CVP-U clock (~ 1GHz)
      clk_ref             : IN  STD_LOGIC;                    -- external reference clock (= 100MHz)
      enable              : IN  STD_LOGIC;
      test_mode           : IN  STD_LOGIC;                    -- test_mode : only DFT on the control block (clk domain)
      test_se             : IN  STD_LOGIC;
      --test_si             : IN  STD_LOGIC;
      --test_so             : OUT STD_LOGIC;
      
      -- configuration values
      cfg_done            : IN  STD_LOGIC;                    -- a new configuration is done, update the loop control
      cfg_gain            : IN  STD_LOGIC_VECTOR(8 downto 0); -- gain value (unsigned 8bit, fixed point, 7 fraction bits, value from 0 to 3.99)
      cfg_set_point       : IN  STD_LOGIC_VECTOR(7 downto 0); -- set-point value (unsigned 8bit, from 0 to 255)
      cfg_sample_clocks   : IN  STD_LOGIC_VECTOR(3 downto 0);  -- nb cycles the sampling is done (from 0 to 15, default is 5)
      cfg_capture_clocks  : IN  STD_LOGIC_VECTOR(3 downto 0);  -- nb cycles the capture is done (from 0 to 15, default is 15)
      cfg_init            : IN  STD_LOGIC;                    -- a new init is done, re-init the loop control 
      cfg_init_command    : IN  STD_LOGIC_VECTOR(7 downto 0); -- init command for freq to DCO (unsigned 8bit, from 0 to 255)
      cfg_nb_multi_cycles : IN  STD_LOGIC_VECTOR(2 downto 0); -- number of multi-cycles path for combinational logic (1..7 range, default is 4)
      cfg_bypass          : IN  STD_LOGIC;                    -- bypass control signal
      cfg_bypass_command  : IN  STD_LOGIC_VECTOR(7 downto 0); -- bypass command for direct DCO control (unsigned 8bit, from 0 to 255)
      cfg_div             : IN  STD_LOGIC_VECTOR(3 downto 0); -- config to select the DCO division factor (2^0 to 2^15)
  
      -- outputs
      measure_value       : OUT STD_LOGIC_VECTOR(7 downto 0); -- measure value (unsigned 8bit, from 0 to 255)
      error_value         : OUT STD_LOGIC_VECTOR(8 downto 0); -- error value (signed 9bit, from -256 to 255)
      dco_value           : OUT STD_LOGIC_VECTOR(7 downto 0); -- DCO applied value (unsigned 8bit, from 0 to 255)
      valid_clk           : OUT STD_LOGIC;                    -- output control to indicate that generated clock is now stable
      new_value_to_dco    : OUT STD_LOGIC;                    -- Generate a pulse on each new value to DCO
      current_set_point   : OUT STD_LOGIC_VECTOR(7 downto 0); -- current set_point
      current_div         : OUT STD_LOGIC_VECTOR(3 downto 0); -- current division factor
      clk_out             : OUT STD_LOGIC                     -- generated clock
    );
  END COMPONENT;

  TYPE   T_32BITS IS ARRAY (0 to 8-1) OF STD_LOGIC_VECTOR(31 DOWNTO 0);

  --Memory mapped registers
  SIGNAL freq_mode_r         : T_32BITS;
  SIGNAL freq_mode_s         : T_32BITS;

  SIGNAL config_fll_r        : STD_LOGIC_VECTOR(31 downto 0);
  SIGNAL config_fll_s        : STD_LOGIC_VECTOR(31 downto 0);

  SIGNAL config_clk_gen_r    : STD_LOGIC_VECTOR(31 downto 0);
  SIGNAL config_clk_gen_s    : STD_LOGIC_VECTOR(31 downto 0);

  --General registers
  SIGNAL cfg_done_r          : STD_LOGIC;         
  SIGNAL cfg_done_s          : STD_LOGIC;         


  SIGNAL current_freq_mode_r : STD_LOGIC_VECTOR(2 downto 0);
  SIGNAL current_freq_mode_s : STD_LOGIC_VECTOR(2 downto 0);
  SIGNAL current_freq_mode_i : INTEGER RANGE 0 TO 7;


  SIGNAL cfg_div_i           : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL reprogram_fll       : STD_LOGIC;         
  SIGNAL reprogram_set_point : STD_LOGIC;                   

  SIGNAL enable              : STD_LOGIC;
  SIGNAL cfg_done            : STD_LOGIC;         
  SIGNAL cfg_gain            : STD_LOGIC_VECTOR(8 downto 0);
  SIGNAL cfg_set_point       : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL cfg_sample_clocks   : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL cfg_capture_clocks  : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL cfg_init            : STD_LOGIC;
  SIGNAL cfg_init_command    : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL cfg_nb_multi_cycles : STD_LOGIC_VECTOR(2 downto 0);
  SIGNAL cfg_bypass          : STD_LOGIC;                   
  SIGNAL cfg_bypass_command  : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL cfg_div             : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL measure_value       : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL error_value         : STD_LOGIC_VECTOR(8 downto 0);
  SIGNAL dco_value           : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL valid_clk_fll       : STD_LOGIC;                   
  SIGNAL clk_out_i           : STD_LOGIC;                   
  SIGNAL new_value_to_dco    : STD_LOGIC;                     
  SIGNAL current_set_point_i : STD_LOGIC_VECTOR(7 downto 0); 
  SIGNAL new_set_point       : STD_LOGIC_VECTOR(7 downto 0); 
  SIGNAL applied_set_point   : STD_LOGIC_VECTOR(7 downto 0); 
  SIGNAL current_div         : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL new_div             : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL applied_div         : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL wait_div_r          : STD_LOGIC;                     
  SIGNAL wait_div_s          : STD_LOGIC;                     
  SIGNAL wait_set_point_r    : STD_LOGIC;                     
  SIGNAL wait_set_point_s    : STD_LOGIC;                     

  FUNCTION inc_sat(input : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
    CONSTANT ALL_ONES  : STD_LOGIC_VECTOR(input'LENGTH-1 DOWNTO 0) := (others => '1');
    BEGIN
      if (input = ALL_ONES) then
        --The maximum value is reachead
        return input;
      else
        return std_logic_vector(unsigned(input) + 1); 
      end if;
    END;
  
 
BEGIN

  u_fll_top : fll_top 
    GENERIC MAP (
      BYPASS_CMD_AFTER_RESET => BYPASS_CMD_AFTER_RESET,
      CLK_DIV_AFTER_RESET    => CLK_DIV_AFTER_RESET
    )
    PORT MAP (
      -- General signals
      rst_n               => rst_n,
      rst_ref_n           => rst_ref_n,
      rst_async_n         => rst_async_n,
      clk                 => clk,
      clk_ref             => clk_ref,        
      enable              => enable,
      test_mode           => test_mode,
      test_se             => '0',        --Used only when the FLL is a macro
      --test_si             => '0',        --Used only when the FLL is a macro
      --test_so             => open,       --Used only when the FLL is a macro
      
      -- configuration values
      cfg_done            => cfg_done,        
      cfg_gain            => cfg_gain,        
      cfg_set_point       => cfg_set_point,   
      cfg_sample_clocks   => cfg_sample_clocks ,
      cfg_capture_clocks  => cfg_capture_clocks,
      cfg_init            => cfg_init,        
      cfg_init_command    => cfg_init_command,
      cfg_nb_multi_cycles => cfg_nb_multi_cycles,
      cfg_bypass          => cfg_bypass,
      cfg_bypass_command  => cfg_bypass_command,
      cfg_div             => cfg_div,  

      -- outputs        -- outputs
      measure_value       => measure_value,
      error_value         => error_value,      
      dco_value           => dco_value,
      valid_clk           => valid_clk_fll,
      new_value_to_dco    => new_value_to_dco,
      current_set_point   => current_set_point_i,
      current_div         => current_div,
      clk_out             => clk_out_i
      );



  pClock : process(rst_n,clk)
    begin
			if (rst_n='0') then
        current_freq_mode_r            <= (others => '0');
        config_fll_r                   <= (others => '0');         --Default value
        config_fll_r(19 downto 16)     <= "0101";                  --Configure sample_cycles : 5
        config_fll_r(23 downto 20)     <= "1111";                  --Configure capture_cycles: 15
        config_fll_r(26 downto 24)     <= "101";                   --Configure multi_cycle_path: 5
        config_fll_r(31)               <= ENABLE_AFTER_RESET;      --Configure DCO_enable 
        config_clk_gen_r               <= (others => '0');         --Default value
        config_clk_gen_r(24)           <= BYPASS_MODE_AFTER_RESET; --Configure force_DCO
        config_clk_gen_r( 7 downto  0) <= BYPASS_CMD_AFTER_RESET;  --Configure force_DCO_value
        config_clk_gen_r(19 downto 16) <= "0100";                  --Configure max_error: 4
        cfg_done_r                     <= '0';
        wait_div_r                     <= '0';
        wait_set_point_r               <= '0';
        for i in 0 to NUM_FREQ_MODES-1 loop
          freq_mode_r(i)( 7 downto  0) <= FLL_CMD_AFTER_RESET;     --Configure the Set_point
          freq_mode_r(i)(11 downto  8) <= CLK_DIV_AFTER_RESET;     --Configure the div_factor
          freq_mode_r(i)(31 downto 12) <= (others => '0');         --Usless bits
        end loop;
        --Usless registers
        for i in NUM_FREQ_MODES to 8-1 loop
          freq_mode_r(i)       <= (others => '0');
        end loop;
			elsif(clk='1' and clk'event) then
        current_freq_mode_r <= current_freq_mode_s;
        config_fll_r        <= config_fll_s;
        config_clk_gen_r    <= config_clk_gen_s;
        cfg_done_r          <= cfg_done_s;
        wait_div_r          <= wait_div_s;
        wait_set_point_r    <= wait_set_point_s;
        for i in 0 to NUM_FREQ_MODES-1 loop
          freq_mode_r(i)       <= freq_mode_s(i);
        end loop;
        --Usless registers
        for i in NUM_FREQ_MODES to 8-1 loop
          freq_mode_r(i)       <= (others => '0');
        end loop;
 			end if;
    end process;


  pCounter : process(in_req, in_data, in_address, in_wr_rd, in_be, freq_mode_r, current_freq_mode_r, config_fll_r, config_clk_gen_r, error_value, measure_value, dco_value )
    variable addr_lsb : INTEGER RANGE 0 TO 3;
    begin
      for i in 0 to 8-1 loop
        freq_mode_s(i)    <= freq_mode_r(i);
      end loop;
      config_fll_s      <= config_fll_r;
      config_clk_gen_s  <= config_clk_gen_r;

      out_data          <= (others => '0');
      out_valid         <= '0';
      out_error         <= '0';

      reprogram_fll <= '0';
      addr_lsb := to_integer(unsigned(in_address(1 downto 0))); --LSB bits of the address. Can be 0 to 3, used to select the freq_mode.

      if (in_req = '1') then
        out_valid <= '1'; --Default: valid=1 on any request
        case to_integer(unsigned(in_address)) is
          when 0 | 1 | 2 | 3 => --Address: 0x00, 0x04, 0x08, 0x0C, 0x10, 0x14, 0x18, 0x1C
            if (in_wr_rd = '0') then --write operation
              -- Low 32bit word: freq_mode_r
              if (in_be(0) = '1') then freq_mode_s(addr_lsb*2+0)( 7 downto  0) <= in_data( 7 downto  0); end if;
              if (in_be(1) = '1') then freq_mode_s(addr_lsb*2+0)(15 downto  8) <= in_data(15 downto  8); end if;
              if (in_be(2) = '1') then freq_mode_s(addr_lsb*2+0)(23 downto 16) <= in_data(23 downto 16); end if;
              if (in_be(3) = '1') then freq_mode_s(addr_lsb*2+0)(31 downto 24) <= in_data(31 downto 24); end if;
              -- High 32bit word: freq_mode_r
              if (in_be(4) = '1') then freq_mode_s(addr_lsb*2+1)( 7 downto  0) <= in_data(39 downto 32); end if;
              if (in_be(5) = '1') then freq_mode_s(addr_lsb*2+1)(15 downto  8) <= in_data(47 downto 40); end if;
              if (in_be(6) = '1') then freq_mode_s(addr_lsb*2+1)(23 downto 16) <= in_data(55 downto 48); end if;
              if (in_be(7) = '1') then freq_mode_s(addr_lsb*2+1)(31 downto 24) <= in_data(63 downto 56); end if;
              -- Force to 0 the usless bits
              freq_mode_s(addr_lsb*2+0)(31 downto 12) <= (others => '0');
              freq_mode_s(addr_lsb*2+1)(31 downto 12) <= (others => '0');
              --Test is a new config is programmed into the current mode
              if ((to_integer(unsigned(current_freq_mode_r)) = addr_lsb*2+0) AND (in_be(3 downto 0) /= "0000")) OR
                 ((to_integer(unsigned(current_freq_mode_r)) = addr_lsb*2+1) AND (in_be(7 downto 4) /= "0000")) then
                 reprogram_fll <= '1';
              end if;
            else
              out_data(31 downto  0) <= freq_mode_r(addr_lsb*2+0);
              out_data(63 downto 32) <= freq_mode_r(addr_lsb*2+1);
            end if;

           when 4 => --Address: 0x20, 0x24
            if (in_wr_rd = '0') then --write operation
              --Low 32bit word: config_fll_r
              if (in_be(0) = '1') then config_fll_s( 7 downto  0) <= in_data( 7 downto  0); end if;
              if (in_be(1) = '1') then config_fll_s(15 downto  8) <= in_data(15 downto  8); end if;
              if (in_be(2) = '1') then config_fll_s(23 downto 16) <= in_data(23 downto 16); end if;
              if (in_be(3) = '1') then config_fll_s(31 downto 24) <= in_data(31 downto 24); end if;
              --High 32bit word: config_clk_gen_r
              if (in_be(4) = '1') then config_clk_gen_s( 7 downto  0) <= in_data(39 downto 32); end if;
              if (in_be(5) = '1') then config_clk_gen_s(15 downto  8) <= in_data(47 downto 40); end if;
              if (in_be(6) = '1') then config_clk_gen_s(23 downto 16) <= in_data(55 downto 48); end if;
              if (in_be(7) = '1') then config_clk_gen_s(31 downto 24) <= in_data(63 downto 56); end if;
              --Guarantee that the FLL take into account the new values
              reprogram_fll <= '1';
              --Usless bits
              config_fll_s(15 downto  9) <= (others => '0');
              config_fll_s(30 downto 27) <= (others => '0');
              config_clk_gen_s (15 downto 11) <= (others => '0');
              config_clk_gen_s (23 downto 20) <= (others => '0');
              config_clk_gen_s (31 downto 26) <= (others => '0');
            else
              -- Read operation
              out_data(31 downto  0) <= config_fll_r;
              out_data(63 downto 32) <= config_clk_gen_r;
            end if;

           when 5 => --Address: 0x28, 0x2C
            if (in_wr_rd = '0') then --write operation
              --Low 32bit word: status (read_only)
              if in_be(3 downto 0) /= "0000" then
                out_error <= '1'; --No operation allowed on this registers
              end if;
              --High 32bit word: empty 
              if in_be(7 downto 4) /= "0000" then
                out_error <= '1'; --No operation allowed on this registers
              end if;
            else
              -- Read operation: status register
              out_data( 8 downto  0) <= error_value;
              out_data(15 downto  9) <= (others => '0');
              out_data(23 downto 16) <= measure_value;
              out_data(31 downto 24) <= dco_value;
              -- Empty register
              out_data(63 downto 32) <= (others => '0');
            end if;

          when others =>
            out_error <= '1';
        end case;
      end if;
    end process;

  pFreqMode : process(current_freq_mode_r, cmd_freq, reprogram_fll)
    begin
      current_freq_mode_s <= current_freq_mode_r;
      cfg_done_s          <= '0';                 --Stop the reprogramming by default
      if (current_freq_mode_r /= cmd_freq) then
        --Change the current freq_mode
        current_freq_mode_s <= cmd_freq;
        --Start an new reprogramming of FLL
        cfg_done_s <= '1';
      end if;
      if (reprogram_fll = '1') then
        -- A new reprogramming is required
        cfg_done_s <= '1';
      end if;
    end process;


  current_freq_mode_i <= to_integer(unsigned(current_freq_mode_r))           WHEN config_clk_gen_r(25) = '0' ELSE   --No foce
                         to_integer(unsigned(config_clk_gen_r(10 downto 8)));                                       --Force a freq_mode

  new_div       <= freq_mode_r(current_freq_mode_i)(11 downto 8);
  new_set_point <= freq_mode_r(current_freq_mode_i)(7 downto 0);


  pProgram_Div_Set_Point : process(new_div, current_div, new_set_point, current_set_point_i, error_value, valid_clk_fll, wait_div_r, wait_set_point_r)
    begin
      --Default values
      applied_div         <= new_div;      
      applied_set_point   <= new_set_point;
      wait_div_s          <= wait_div_r;
      wait_set_point_s    <= wait_set_point_r;
      reprogram_set_point <= '0';
      if    (wait_div_r = '1') then
          if (valid_clk_fll = '0') then
            --The div factor is not yet aplied. Keep the current set_point
            applied_set_point <= current_set_point_i;
          else
            --The division factor is applied, update the set_point
            wait_div_s          <= '0';
            reprogram_set_point <= '1';
          end if;
      elsif (wait_set_point_r = '1') then
        if (signed(error_value) < 0) then
          --The frequency is too high. Wait to stabilize the frequency
          applied_div <= current_div;
        else
          --The frequency is lower than the required. Applie the new div factor
          wait_set_point_s <= '0';
        end if;
      else  
        --(wait_div_r = '0') AND (wait_set_point_r = '0')
        if (unsigned(new_div) < unsigned(current_div)) AND (unsigned(new_set_point) < unsigned(current_set_point_i)) then
          --Wait for set_point before change the div_factor
          applied_div      <= current_div;  --Keep current div factor
          wait_set_point_s <= '1';
        end if;
        if (unsigned(new_div) > unsigned(current_div)) AND (unsigned(new_set_point) > unsigned(current_set_point_i)) then
          --Wait for div_factor before change the set_point
          applied_set_point <= current_set_point_i; --Keep current set_point
          wait_div_s        <= '1';
        end if;
      end if;
    end process;

  --In case of warning (cmd_safe = '1') increase the division factor by 1
  cfg_div_i <=         applied_div    WHEN cmd_safe = '0' ELSE
               inc_sat(applied_div); --Increment and saturate the division factor
  
  --FLL commands
  cfg_done            <= cfg_done_r OR reprogram_set_point; 
  cfg_gain            <= config_fll_r( 8 downto  0); 
  cfg_sample_clocks   <= config_fll_r(19 downto 16); 
  cfg_capture_clocks  <= config_fll_r(23 downto 20); 
  cfg_nb_multi_cycles <= config_fll_r(26 downto 24);
  enable              <= config_fll_r(31);
  cfg_set_point       <= applied_set_point; 
  cfg_bypass          <= config_clk_gen_r(24);
  cfg_bypass_command  <= config_clk_gen_r(7 downto 0); 
  cfg_div             <= cfg_div_i;
  cfg_init            <= '0'; 
  cfg_init_command    <= (others => '0'); --Not used on this design 

  --Output ports
  valid_clk          <= valid_clk_fll;
  clk_out            <= clk_out_i;
  current_set_point  <= current_set_point_i;
  --The valid clock is generated if the FLL error is less than the max_error
  valid_xpct_clk     <= '1' WHEN (abs(signed(error_value(8) & error_value)) <= signed('0' & config_clk_gen_r(19 downto 16))) AND (valid_clk_fll = '1') AND (wait_div_r = '0') AND (wait_set_point_r = '0') ELSE
                        '0';

  --Some verifications
  ASSERT ADDRESS_SIZE >= 3 REPORT "ADDRESS_SIZE should be >= 3" SEVERITY FAILURE;
  ASSERT NOT ((rst_n = '1') AND (current_freq_mode_i > (NUM_FREQ_MODES-1))) REPORT "Frequency_mode not supported" SEVERITY WARNING;
END rtl;
