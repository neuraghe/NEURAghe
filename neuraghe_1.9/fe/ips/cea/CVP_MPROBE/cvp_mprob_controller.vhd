--! @file cvp_mprob_controller.vhd
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
--! @par  Id: $Id: cvp_mprob_controller.vhd 1736 2014-11-18 16:54:30Z im219746 $
--! @par  Date: $Date: 2014-11-18 17:54:30 +0100 (Tue, 18 Nov 2014) $
--! @par  Revision: $Rev: 1736 $
--!


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY common_cells_lib;
USE common_cells_lib.ALL;

ENTITY cvp_mprob_controller IS
  GENERIC(
    ADDRESS_SIZE     : natural := 3  --Number of bits used on the address. Minimum 3
  );

  PORT(
    -- General signals
    rst_n      : IN  STD_LOGIC; --Reset synchronized with clk
    rst_ref_n  : IN  STD_LOGIC; --Reset synchronized with clk_ref
    clk        : IN  STD_LOGIC;
    clk_ref    : IN  STD_LOGIC;

    in_data    : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
    in_address : IN  STD_LOGIC_VECTOR(ADDRESS_SIZE-1 DOWNTO 0);
    in_be      : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    in_wr_rd   : IN  STD_LOGIC;      -- '1' > read / '0' > write
    in_req     : IN  STD_LOGIC;

    out_data   : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    out_valid  : OUT STD_LOGIC;
    out_error  : OUT STD_LOGIC;

    -- Multiprobes interface
    mprob_rst_n      : OUT STD_LOGIC;
    mprob_mode       : OUT STD_LOGIC;
    mprob_sample     : OUT STD_LOGIC;
    mprob_serdes_clk : OUT STD_LOGIC;
    mprob_serdes_out : OUT STD_LOGIC;
    mprob_serdes_in  : IN  STD_LOGIC;
    mprob_test_freq  : OUT STD_LOGIC;

    it_end_of_sampling  : OUT STD_LOGIC  --Edge sensitive
  );
END cvp_mprob_controller;

ARCHITECTURE rtl OF cvp_mprob_controller IS

  COMPONENT synchronizer IS
     GENERIC(
      RESET_VALUE : STD_LOGIC := '0'  -- Output value at reset 
    );
    PORT(
      rst_n     : IN  STD_LOGIC;
      clk       : IN  STD_LOGIC;
  
      data_in   : IN  STD_LOGIC;
      data_out  : OUT STD_LOGIC
    );
  END COMPONENT;

  COMPONENT clock_buffer IS
    PORT(
      clk_in      : IN  STD_LOGIC;
      clk_out     : OUT STD_LOGIC
    );
  END COMPONENT;
  
  type T_SERDES_STATE is (IDLE, STARTING, LOW, HIGH, ENDING);
  signal current_state, next_state : T_SERDES_STATE;

  SIGNAL serdes_value_r        : STD_LOGIC_VECTOR(31 downto 0);
  SIGNAL serdes_value_s        : STD_LOGIC_VECTOR(31 downto 0);
  SIGNAL prog_serdes_value_r   : STD_LOGIC_VECTOR(31 downto 0);
  SIGNAL prog_serdes_value_s   : STD_LOGIC_VECTOR(31 downto 0);
  SIGNAL serdes_control_r      : STD_LOGIC_VECTOR(31 downto 0);
  SIGNAL serdes_control_s      : STD_LOGIC_VECTOR(31 downto 0);
  SIGNAL sample_time_r         : STD_LOGIC_VECTOR(31 downto 0);
  SIGNAL sample_time_s         : STD_LOGIC_VECTOR(31 downto 0);
  SIGNAL mprob_control_r       : STD_LOGIC_VECTOR(31 downto 0);
  SIGNAL mprob_control_s       : STD_LOGIC_VECTOR(31 downto 0);

  SIGNAL sample_start_r         : STD_LOGIC;
  SIGNAL sample_start_s         : STD_LOGIC;
  SIGNAL sample_busy_sync       : STD_LOGIC;
  SIGNAL serdes_shift_start     : STD_LOGIC;
  SIGNAL serdes_shift_busy      : STD_LOGIC;
  SIGNAL serdes_prescaler_tick  : STD_LOGIC;
  
  SIGNAL serdes_prescaler_counter_r  : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL serdes_prescaler_counter_s  : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL serdes_shift_counter_r      : STD_LOGIC_VECTOR(4 downto 0);
  SIGNAL serdes_shift_counter_s      : STD_LOGIC_VECTOR(4 downto 0);

  SIGNAL mprob_serdes_clk_r     : STD_LOGIC;
  SIGNAL mprob_serdes_clk_s     : STD_LOGIC;
  SIGNAL mprob_mode_r           : STD_LOGIC;
  SIGNAL mprob_mode_s           : STD_LOGIC;

  SIGNAL sample_busy_sync_r     : STD_LOGIC;

  -- clk_ref registers/signals
  SIGNAL sample_counter_r      : STD_LOGIC_VECTOR(23 downto 0);
  SIGNAL sample_counter_s      : STD_LOGIC_VECTOR(23 downto 0);
  SIGNAL sample_generate_r     : STD_LOGIC;
  SIGNAL sample_generate_s     : STD_LOGIC;
  SIGNAL sample_busy_r         : STD_LOGIC;
  SIGNAL sample_busy_s         : STD_LOGIC;
  SIGNAL sample_start_sync     : STD_LOGIC;
  -- end clk_ref registers/signals


BEGIN

  pClock : process(rst_n,clk)
    begin
			if (rst_n='0') then
        serdes_value_r       <= (others => '0');
        prog_serdes_value_r  <= (others => '0');
        serdes_control_r     <= (others => '0');
        sample_time_r        <= (others => '0');
        mprob_control_r      <= (others => '0');
        current_state        <= IDLE;
        mprob_serdes_clk_r   <= '0';
        mprob_mode_r         <= '0';
        sample_start_r       <= '0';
        sample_busy_sync_r   <= '1';
        serdes_prescaler_counter_r <= (others => '0');
        serdes_shift_counter_r     <= (others => '0');
			elsif(clk='1' and clk'event) then
        serdes_value_r       <= serdes_value_s;
        prog_serdes_value_r  <= prog_serdes_value_s;
        serdes_control_r     <= serdes_control_s;
        sample_time_r        <= sample_time_s;   
        mprob_control_r      <= mprob_control_s; 
        current_state        <= next_state;
        mprob_serdes_clk_r   <= mprob_serdes_clk_s;
        mprob_mode_r         <= mprob_mode_s;
        sample_start_r       <= sample_start_s;
        sample_busy_sync_r   <= sample_busy_sync;    --Register to detect generate the it_end_of_sampling
        serdes_prescaler_counter_r <= serdes_prescaler_counter_s;
        serdes_shift_counter_r     <= serdes_shift_counter_s;
 			end if;
    end process;


  pInterface : process(in_req, in_data, in_address, in_wr_rd, in_be, serdes_value_r, prog_serdes_value_r, serdes_shift_busy, sample_start_r, serdes_control_r, sample_time_r, mprob_control_r, sample_busy_sync)
    begin
      prog_serdes_value_s <= prog_serdes_value_r;
      serdes_control_s    <= serdes_control_r;
      sample_time_s       <= sample_time_r;   
      mprob_control_s     <= mprob_control_r; 
      sample_start_s      <= sample_start_r;
      serdes_shift_start  <= '0';

      --Stop generating sample_start after the conter takes into account the signal
      if (sample_busy_sync = '1') then 
        sample_start_s <= '0'; 
      end if;

      out_data          <= (others => '0');
      out_valid         <= '0';
      out_error         <= '0';

      if (in_req = '1') then
        out_valid <= '1'; --Default: valid=1 on any request
        case to_integer(unsigned(in_address)) is
          when 0 => --Address: 0x00 & 0x04 
            -- serdes_value, (serdes_value_r + shift)
            if (serdes_shift_busy = '0') then --The serdes is busy? => Wait until the serdes ends
              if (in_wr_rd = '0') then --write operation
                out_error <= '1'; --No operation allowed on these registers
              else
                out_data(31 downto  0) <= serdes_value_r;
                out_data(63 downto 32) <= serdes_value_r;
                if in_be(7 downto 4) /= "0000" then -- Register : (serdes_value_r + shift) => Start a shift after the read value
                  serdes_shift_start <= '1';
                end if;
              end if;
            else
              out_valid <= '0'; -- Wait until the serdes ends
            end if;

          when 1 => --Address: 0x08 & 0x0C
            if (serdes_shift_busy = '0') then --The serdes is busy? => Wait until the serdes ends
              if (in_wr_rd = '0') then --write operation
                --Low 32bit word: prog_serdes_value_r
                if (in_be(0) = '1') then prog_serdes_value_s ( 7 downto  0) <= in_data( 7 downto  0); end if;
                if (in_be(1) = '1') then prog_serdes_value_s (15 downto  8) <= in_data(15 downto  8); end if;
                if (in_be(2) = '1') then prog_serdes_value_s (23 downto 16) <= in_data(23 downto 16); end if;
                if (in_be(3) = '1') then prog_serdes_value_s (31 downto 24) <= in_data(31 downto 24); end if;
                --High 32bit word: prog_serdes_value_r + shift
                if (in_be(4) = '1') then prog_serdes_value_s ( 7 downto  0) <= in_data(39 downto 32); end if;
                if (in_be(5) = '1') then prog_serdes_value_s (15 downto  8) <= in_data(47 downto 40); end if;
                if (in_be(6) = '1') then prog_serdes_value_s (23 downto 16) <= in_data(55 downto 48); end if;
                if (in_be(7) = '1') then prog_serdes_value_s (31 downto 24) <= in_data(63 downto 56); end if;
                if in_be(7 downto 4) /= "0000" then -- Register : (prog_serdes_value + shift) => Start a shift after write the value
                  serdes_shift_start <= '1';
                end if;
              else
                out_data(31 downto  0) <= prog_serdes_value_r;
                out_data(63 downto 32) <= prog_serdes_value_r;
              end if;
            else
              out_valid <= '0'; -- Wait until the serdes ends
            end if;

           when 2 => --Address: 0x10, 0x14
            if (in_wr_rd = '0') then --write operation
              --Low 32bit word: serdes_control_r
              if (in_be(0) = '1') then serdes_control_s( 7 downto  0) <= in_data( 7 downto  0); end if;
              --Usless bits
              serdes_control_s(31 downto  4) <= (others => '0'); --Bit 8 is a status bit => usless
              --High 32bit word: sample_time_r
              if (in_be(4) = '1') then sample_time_s( 7 downto  0) <= in_data(39 downto 32); end if;
              if (in_be(5) = '1') then sample_time_s(15 downto  8) <= in_data(47 downto 40); end if;
              if (in_be(6) = '1') then sample_time_s(23 downto 16) <= in_data(55 downto 48); end if;
              if (in_be(7) = '1') then sample_time_s(31 downto 24) <= in_data(63 downto 56); end if;
              --Usless bits
              sample_time_s(31 downto 24) <= (others => '0');
            else
              -- Read the content of serdes_control_r
              out_data(31 downto  0) <= serdes_control_r;
              out_data(8) <= serdes_shift_busy;   --serdes_control_r(8) is the serdes status bit
              -- Read the content of sample_time_r
              out_data(63 downto 32) <= sample_time_r;
            end if;
           
 
           when 3 => --Address: 0x18, 0x1C
            if (in_wr_rd = '0') then --write operation
              --Low 32bit word: mprob_control_r
              if (in_be(0) = '1') then mprob_control_s( 7 downto  0) <= in_data( 7 downto  0); end if;
              if (in_be(1) = '1') then mprob_control_s(15 downto  8) <= in_data(15 downto  8); end if;
              if (in_be(2) = '1') then mprob_control_s(23 downto 16) <= in_data(23 downto 16); end if;
              if (in_be(3) = '1') then mprob_control_s(31 downto 24) <= in_data(31 downto 24); end if;
              --Usless bits
              mprob_control_s(31 downto 17) <= (others => '0');
              mprob_control_s(15 downto  9) <= (others => '0');
              mprob_control_s( 7 downto  2) <= (others => '0');
              mprob_control_s( 0 downto  0) <= (others => '0');
              if (in_be(0) = '1') and (in_data(0) = '1') then --Start a new sampling
                --Last sampling finished?
                if (sample_busy_sync = '0') and (sample_start_r = '0') then
                  --Start a new sampling
                  sample_start_s <= '1';
                else
                  out_valid  <= '0'; --Waint until current sampling finishes
                end if;
              end if;
              -- High 32bit word: empty
              if in_be(7 downto 4) /= "0000" then
                out_error <= '1'; --No operation allowed on this registers
              end if;
            else
              -- Read the content of mprob_control_r 
              out_data(31 downto  0) <= mprob_control_r;
              out_data(0) <= sample_busy_sync OR sample_start_r;

              out_data(63 downto 32) <= (others => '0');
            end if;
         
          when others =>
            out_error <= '1';
        end case;
      end if;
    end process;


  pSerdesPrescaler : process(serdes_prescaler_counter_r, serdes_shift_busy, serdes_control_r)
    begin
      serdes_prescaler_counter_s <= serdes_prescaler_counter_r;
      serdes_prescaler_tick <= '0';

      if (serdes_shift_busy = '1') then
        -- Increase the prescaler_counter
        serdes_prescaler_counter_s  <= std_logic_vector(unsigned(serdes_prescaler_counter_r) + 1);
        -- Generate a prescaler tick?
        if (serdes_prescaler_counter_r = serdes_control_r(3 downto 0)) then --serdes_control_r(3..0)  => prescaler_value
          serdes_prescaler_tick <= '1';
          --Restart the counter
          serdes_prescaler_counter_s <= (others => '0');
        end if;
      else 
        --Stop the counter
        serdes_prescaler_counter_s <= (others => '0');
      end if;
    end process;

  pSerdesState : process(current_state, mprob_serdes_clk_r, serdes_shift_start, serdes_shift_counter_r, serdes_prescaler_tick, mprob_mode_r)
    begin
      serdes_shift_busy      <= '0';
      mprob_mode_s           <= mprob_mode_r;
      mprob_serdes_clk_s     <= mprob_serdes_clk_r;
      serdes_shift_counter_s <= serdes_shift_counter_r;
      next_state <= current_state;

      case current_state is
        when IDLE =>
          if serdes_shift_start = '1' then
            next_state         <= STARTING;
            mprob_mode_s       <= '1';
          end if;
          serdes_shift_counter_s <= (others => '0');

        when STARTING =>
          if (serdes_prescaler_tick = '1') then 
            next_state         <= LOW;
          end if;
          serdes_shift_busy <= '1';

        when LOW =>
          if (serdes_prescaler_tick = '1') then 
            next_state         <= HIGH;
            mprob_serdes_clk_s <= '1';
          end if;
          serdes_shift_busy <= '1';

        when HIGH =>
          if (serdes_prescaler_tick = '1') then
            --Increase the counter
            serdes_shift_counter_s <= std_logic_vector(unsigned(serdes_shift_counter_r) + 1);
            if unsigned(serdes_shift_counter_r) = 31 then
              next_state         <= ENDING;   --Shift is ended
              mprob_mode_s       <= '0';      --Lower the mprob_mode
            else
              next_state         <= LOW;
              mprob_serdes_clk_s <= '0';
            end if;
          end if;
          serdes_shift_busy <= '1';

        when ENDING =>
          if (serdes_prescaler_tick = '1') then 
            next_state         <= IDLE;
            mprob_serdes_clk_s <= '0';    --The mprob_mode is already 0 => lower the clock
          end if;
          serdes_shift_busy <= '1';

        when others =>
          assert FALSE report "Use of WHEN OTHERS in a CASE statement" severity FAILURE;
      end case;
    end process;

  --Store the serdes in bits into the serdes_value
  pSerdesIn : process(serdes_value_r, serdes_shift_counter_r, mprob_serdes_in, mprob_mode_r, mprob_serdes_clk_r)
    begin
      serdes_value_s <= serdes_value_r;
      if (mprob_serdes_clk_r = '0') AND (mprob_mode_r = '1') then
        serdes_value_s(31-to_integer(unsigned(serdes_shift_counter_r))) <= mprob_serdes_in;
      end if;
    end process;

  -- Clocked by clk_ref
  ---------------------
  pClockRef : process(rst_ref_n, clk_ref)
    begin
			if (rst_ref_n='0') then
        sample_counter_r  <= (others => '0');
        sample_generate_r <= '0';
        sample_busy_r     <= '0';
			elsif(clk_ref='1' and clk_ref'event) then
        sample_counter_r  <= sample_counter_s;
        sample_generate_r <= sample_generate_s;
        sample_busy_r     <= sample_busy_s;
 			end if;
    end process;

  -- Clocked by clk_ref
  ---------------------
  pSampleCounter : process(sample_counter_r, sample_generate_r, sample_time_r, sample_busy_r, sample_start_sync)
    begin
      sample_counter_s  <= sample_counter_r;
      sample_generate_s <= sample_generate_r;
      sample_busy_s     <= sample_busy_r;
      if (sample_start_sync = '1') or (sample_busy_r = '1') then
        sample_busy_s     <= '1';
        -- Increase the sample_counter
        sample_counter_s  <= std_logic_vector(unsigned(sample_counter_r) + 1);
        -- Start the counter
        if (sample_counter_r = x"000000") then                    -- The counter is at 0 and needs to start => generate a sample pulse
          --Start the generation of the sample pulse
          sample_generate_s <= '1';
        elsif sample_counter_r = sample_time_r(23 downto 0) then  -- The counter reachead the counting value
                                                                  -- sample_time_r is stable when used (no need to synchronize)
          --End the generation of the sample pulse
          sample_generate_s <= '0';
          -- Reset the sample_counter
          sample_counter_s <= (others => '0');
          --Freeze the counter value
          --sample_counter_s  <= sample_counter_r;  ************************************
          --The sample is no longer busy
          sample_busy_s <= '0';
        end if;
      else 
        -- Reset the sample_counter
--        sample_counter_s <= (others => '0');******************************************
      end if;
    end process;

  -- Clocked by clk_ref
  ---------------------
  u_sample_start_sync : synchronizer
    GENERIC MAP(
      RESET_VALUE => '0'  -- Output value at reset 
    )
    PORT MAP(
      rst_n    => rst_ref_n, 
      clk      => clk_ref,
      data_in  => sample_start_r, 
      data_out => sample_start_sync 
    );

  u_sample_busy_sync : synchronizer
    GENERIC MAP(
      RESET_VALUE => '0'  -- Output value at reset 
    )
    PORT MAP(
      rst_n    => rst_n, 
      clk      => clk,
      data_in  => sample_busy_r, 
      data_out => sample_busy_sync 
    );

  --Generated clock needs to be an output of a register to avoid glitches
  --Add a clock buffer to break the clock arc between the gererated clock and the main clock
  u_clk_buf : clock_buffer
    PORT MAP(
      clk_in    => mprob_serdes_clk_r,  
      clk_out   => mprob_serdes_clk  
    );

  --MPROB ports
  mprob_rst_n      <= mprob_control_r( 8); -- mprob_control_r( 8): mprob_rst_n
  mprob_test_freq  <= mprob_control_r(16); -- mprob_control_r(16): Test_tone
  mprob_sample     <= sample_generate_r OR mprob_control_r(1); -- mprob_control_r(1): force sampling
  mprob_serdes_out <= prog_serdes_value_r(31-to_integer(unsigned(serdes_shift_counter_r)));
  mprob_mode       <= mprob_mode_r;

  it_end_of_sampling <= sample_busy_sync_r AND (not sample_busy_sync); --generate a pulse to indicate the end_of_sampling

  --Some verifications
  ASSERT ADDRESS_SIZE >= 3 REPORT "ADDRESS_SIZE should be >= 3" SEVERITY FAILURE;

END rtl;
