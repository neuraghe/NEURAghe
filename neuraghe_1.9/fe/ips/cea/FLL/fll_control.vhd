--!
--! @file fll_control.vhd
--! @brief Frequency Locked Loop Control part 
--! 
--! This block is the control part of the Frequency Locked Loop (FLL)
--! This block implements the feedback loop, that generates a stable command 
--! to the DCO / VCO, according to a target frequency, programmed as a set point, and corrected by a gain factor.
--! 
--! <B>
--! @n
--! This file is part of the Platform 2012 program,
--! a cooperation between STMicroelectronics and CEA.@n
--! Redistribution of this file to outside parties is
--! strictly prohibited without the written consent
--! of the module owner indicated below.@n
--! </B>
--! 
--! @par  Module owner: Ivan MIRO PANADES 
--!       ivan.miro-panades@cea.fr
--! 
--! @par  Copyright (C) 2013 CEA
--! 
--! @par  Authors:  Ivan MIRO PANADES
--!                 Pascal VIVET
--! 
--! @par  Id: $Id: fll_control.vhd 1 2014-01-15 16:11:08Z im219746 $
--! @par  Date: $Date: 2014-01-15 17:11:08 +0100 (Wed, 15 Jan 2014) $
--! @par  Revision: $Rev: 1 $
--!


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY common_cells_lib;
USE common_cells_lib.ALL;

ENTITY fll_control IS
  GENERIC (
    BYPASS_CMD_AFTER_RESET : STD_LOGIC_VECTOR(7 downto 0) := "10000000"
  );
  PORT(
    -- General signals
    rst_n             : IN  STD_LOGIC;                     -- reset already synchronized within CVP-U
    clk               : IN  STD_LOGIC;                     -- this is the CVP-U clock (~ 1GHz)
    test_mode         : IN  STD_LOGIC;                     -- test_mode from CVP-U

    -- configuration values
    cfg_done            : IN  STD_LOGIC;                     -- a new configuration is done, update the loop control
    cfg_gain            : IN  STD_LOGIC_VECTOR(8 downto 0);  -- gain value (unsigned 9bit, fixed point, 7 fraction bits, value from 0 to 3.99)
    cfg_set_point       : IN  STD_LOGIC_VECTOR(7 downto 0);  -- set-point value (unsigned 8bit, from 0 to 255)
    cfg_init            : IN  STD_LOGIC;                     -- a new init is done, re-init the loop control 
    cfg_init_command    : IN  STD_LOGIC_VECTOR(7 downto 0);  -- init command for freq to DCO (unsigned 8bit, from 0 to 255)
    cfg_nb_multi_cycles : IN  STD_LOGIC_VECTOR(2 downto 0);  -- number of multi-cycles path for combinational logic (1..7 range, default is 4)
    cfg_bypass          : IN  STD_LOGIC;                     -- bypass control signal
    cfg_bypass_command  : IN  STD_LOGIC_VECTOR(7 downto 0);  -- bypass command for direct DCO control (unsigned 8bit, from 0 to 255)

    -- From/To counter module
    sample            : IN  STD_LOGIC;                     -- sample signal from counter
    counter           : IN  STD_LOGIC_VECTOR(7 downto 0);  -- counter value from DCO (unsigned 8bit, from 0 to 255)
    clear             : OUT STD_LOGIC;                     -- clear signal back to the counter
    
    -- outputs
    new_value_to_dco  : OUT STD_LOGIC;                     -- Generate a pulse on each new value to DCO
    current_set_point : OUT STD_LOGIC_VECTOR(7 downto 0);  -- current set_point
    freq_to_dco       : OUT STD_LOGIC_VECTOR(7 downto 0);  -- control to DCO (unsigned 8bit, from 0 to 255)
    dco_value         : OUT STD_LOGIC_VECTOR(7 downto 0);  -- Current DCO value (unsigned 8bit, from 0 to 255)
    measure_value     : OUT STD_LOGIC_VECTOR(7 downto 0);  -- measure value (unsigned 8bit, from 0 to 255)
    error_value       : OUT STD_LOGIC_VECTOR(8 downto 0)   -- error value (signed 9bit, from -256 to 255)
    );
END fll_control;


ARCHITECTURE rtl of fll_control IS 

  ----------------------------------------------------------------------
  -- Components declarations -------------------------------------------
  ----------------------------------------------------------------------

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


  ----------------------------------------------------------------------
  -- Signals/contants declarations -------------------------------------
  ----------------------------------------------------------------------
  SIGNAL error_value_s    : STD_LOGIC_VECTOR(8  downto 0);  -- signed 9bit, from -256 to 255
  SIGNAL error_value_r    : STD_LOGIC_VECTOR(8  downto 0);  -- error register
  
  SIGNAL kerror_no_sat    : STD_LOGIC_VECTOR(18 downto 0);  -- signed 19bit, fixed point, 7 fraction bits 
  SIGNAL kerror           : STD_LOGIC_VECTOR(15 downto 0);  -- signed 16bit, fixed point, 7 fraction bits
  
  SIGNAL command_n_d_no_sat : STD_LOGIC_VECTOR(16 downto 0);  -- unsigned, fixed point, 7 fraction bits, from 0 to 511.99
  SIGNAL command_n_d        : STD_LOGIC_VECTOR(15 downto 0);  -- unsigned, fixed point, 7 fraction bits, from 0 to 511.99
  SIGNAL command_n_q        : STD_LOGIC_VECTOR(15 downto 0);  -- unsigned, fixed point, 7 fraction bits, from 0 to 511.99
  SIGNAL command_n_1        : STD_LOGIC_VECTOR(15 downto 0);  -- unsigned, fixed point, 7 fraction bits, from 0 to 511.99
  
  SIGNAL sample2               : STD_LOGIC;
  SIGNAL sample3               : STD_LOGIC;
  SIGNAL update_phase0         : STD_LOGIC;
  SIGNAL update_phase1         : STD_LOGIC;
  SIGNAL update_phase2         : STD_LOGIC;
  
  SIGNAL nb_cycles_d, nb_cycles_q : STD_LOGIC_VECTOR(2 downto 0);
  
  SIGNAL updated_measure      : STD_LOGIC_VECTOR(7 downto 0);  -- unsigned 8bit
  SIGNAL updated_set_point    : STD_LOGIC_VECTOR(7 downto 0);  -- unsigned 8bit
  SIGNAL updated_gain         : STD_LOGIC_VECTOR(8 downto 0);  -- unsigned 8bit

  SIGNAL need_to_update_r     : STD_LOGIC;
  SIGNAL new_value_to_dco_i   : STD_LOGIC;

  -- synopsys translate_off
  SIGNAL error_rel : REAL;
  -- synopsys translate_on

BEGIN

  --------------------------------------------------------------------------------
  -- FLL Control : 
  -- Data Path which implement the Backward Euler Accumulation
  -- Command(n) = Command(n-1) + Gain * Error
  --------------------------------------------------------------------------------

  -- Sum0 :
  -- 8bit unsigned - 8bit unsigned = 9 bit signed
  error_value_s <= SIGNED('0' & updated_set_point) - SIGNED('0' & updated_measure) after 1.2 ns;
  
  -- Product0 :
  -- 9bit signed * 9bit unsigned = 19 bit signed
  kerror_no_sat <= SIGNED(error_value_s) * UNSIGNED(updated_gain) after 1.2 ns;

  -- Product0 : saturation on 16bit (do not need the full range)
  kerror <= "0111111111111111" WHEN (kerror_no_sat(18) = '0') AND (kerror_no_sat(17 downto 15) /= "000") ELSE
            "1000000000000000" WHEN (kerror_no_sat(18) = '1') AND (kerror_no_sat(17 downto 15) /= "111") ELSE
            kerror_no_sat(18) & kerror_no_sat(14 DOWNTO 0); --Get the sign + value

  -- next command
  -- 16bit signed (extended) + 16bit signed (extended) = 17 bit signed
  command_n_d_no_sat <= SIGNED(kerror(15) & kerror) + SIGNED(command_n_1(15) & command_n_1) after 1.2 ns;

  -- command value must be positive : saturate for negative/positive values. only the 15 bits are significative.
  command_n_d <= "0000000000000000" WHEN command_n_d_no_sat(16) = '1'            ELSE
                 "0111111111111111" WHEN command_n_d_no_sat(16 downto 15) = "01" ELSE
                 command_n_d_no_sat(16) & command_n_d_no_sat(14 downto 0); --Get the sign + value

-- synopsys translate_off
  -- error signal, to mesure the ratio between the clk target and the clk measure
  error_rel <= 0.0 when real(conv_integer(UNSIGNED(cfg_set_point)))=0.0 ELSE
               100.0 * real(conv_integer(SIGNED(error_value_s))) / real(conv_integer(UNSIGNED(cfg_set_point))) ;
-- synopsys translate_on


  --------------------------------------------------------------------------------
  -- control logic
  --------------------------------------------------------------------------------

  -- feedback loop register : this is the command(n-1) value 
  -- this register is :
  -- - initialized with cfg_init_command
  -- - updated according to clk_ref counter at each update phase
  PROCESS (clk, rst_n)
  BEGIN
    IF (rst_n = '0') THEN
      command_n_1 <= (others => '0');
    ELSIF clk = '1' AND clk'EVENT THEN 
      IF (cfg_init='1') THEN
        command_n_1 <= '0' & cfg_init_command & "0000000";
      ELSIF (update_phase0='1') THEN
        command_n_1 <= command_n_q;
      END IF;
    END IF;
  END PROCESS;

  -- multi-cycle path logic (multicycle lenght can be 1 to 7):
  -- the datapath logic is full combinationnal and implemented using multi-cycle path
  -- we count some cycles before to update the command register.
  -- the counter is restarted each time a new update phase is done or a new init phase is done.
  nb_cycles_d <= cfg_nb_multi_cycles WHEN update_phase0='1' OR cfg_init='1' ELSE
                 UNSIGNED(nb_cycles_q) - 1 WHEN nb_cycles_q/="000" ELSE
                 nb_cycles_q;
  
  -- multi-cycle path counter register
  PROCESS (clk, rst_n)
  BEGIN
    IF (rst_n = '0') THEN
      nb_cycles_q <= (others => '0');
    ELSIF clk = '1' AND clk'EVENT THEN 
      nb_cycles_q <= nb_cycles_d;
    END IF;
  END PROCESS;
  
  -- command register : 
  -- - in bypass mode, this is forced to the bypass command value
  -- - the command is updated according to the multicycle path length
  PROCESS (clk, rst_n)
  BEGIN
    IF (rst_n = '0') THEN
      command_n_q <= '0' & BYPASS_CMD_AFTER_RESET & "0000000";
    ELSIF clk = '1' AND clk'EVENT THEN
      IF (cfg_bypass='1') THEN
        command_n_q <= "0" & cfg_bypass_command & "0000000";
      ELSIF (nb_cycles_q="001") THEN
        command_n_q <= command_n_d;
      END IF;
    END IF;
  END PROCESS;

  -- output signal value to the DCO
  freq_to_dco        <= command_n_d(14 downto 7) when (cfg_bypass='0') else     -- keep only significative 8bit
                        cfg_bypass_command;
  dco_value          <= command_n_q(14 downto 7);                    -- keep only significative 8bit
  new_value_to_dco_i <= '1' when nb_cycles_q="001" else '0';

  --------------------------------------------------------------------------------
  -- DCO counter register : stable measure, updated in update phase
  --------------------------------------------------------------------------------

  -- sample signal proper resynchronization with synchronizer cell
  sample_sync_u : synchronizer
    GENERIC MAP ( RESET_VALUE => '0' )
    PORT MAP(
      rst_n     => rst_n,
      clk       => clk,
      data_in   => sample,
      data_out  => sample2
    );

  -- sample signal resynchronization with clk : last stage for edge detection
  PROCESS (clk, rst_n)
  BEGIN
    IF (rst_n = '0') THEN
      sample3 <= '0';
    ELSIF clk = '1' AND clk'EVENT THEN 
      sample3 <= sample2;
    END IF;
  END PROCESS;
  
  -- update phase : when falling edge of the sample signal
  update_phase0  <= '1' when sample3='1' and sample2='0' else '0';

  -- register the DCO counter value in clk domain when update phase : this is the updated measure
  PROCESS (clk, rst_n)
  BEGIN
    IF (rst_n = '0') THEN
      updated_measure <= (others => '0');
    ELSIF clk = '1' AND clk'EVENT THEN
      IF (update_phase0='1') THEN
        updated_measure <= counter;
      END IF;
    END IF;
  END PROCESS;

  -- register the configuration inputs, which need to be synchronized with the update phase
  PROCESS (clk, rst_n)
  BEGIN
    IF (rst_n = '0') THEN
      updated_gain      <= (others => '0');
      updated_set_point <= (others => '0');
      need_to_update_r  <= '0';
    ELSIF clk = '1' AND clk'EVENT THEN
      IF (update_phase0='1') THEN
        updated_gain      <= cfg_gain;
        updated_set_point <= cfg_set_point;
        need_to_update_r  <= '0';
      ELSIF (cfg_done='1') THEN
        --A new config is availoable but not yet used
        need_to_update_r  <= '1';
      END IF;
    END IF;
  END PROCESS;

  -- clear signal back to the counter
  -- (two cycles delayed after update_phase0, to make sure enough time to register the measure before asynchronous clear)
  PROCESS (clk, rst_n)
  BEGIN
    IF (rst_n = '0') THEN
      update_phase1 <= '0';
      update_phase2 <= '0';
    ELSIF clk = '1' AND clk'EVENT THEN
      update_phase1 <= update_phase0;
      update_phase2 <= update_phase1;
    END IF;
  END PROCESS;


  --------------------------------------------------------------------------------
  -- error register :
  -- - when a new config is loaded (set_point), since we wait the next update phase to use the new config value,
  --   the maximum error is generated temporarly, to alarm the hopping controller, that the error is not yet a valid value
  -- - the error is updated two cycle after the update phase
  --   (this leave time to the first adder to converge, in case of low freq clk, even if should be ok in one cycle)
  --------------------------------------------------------------------------------
  PROCESS (clk, rst_n)
  BEGIN
    IF (rst_n = '0') THEN
      error_value_r <= (others => '0');
    ELSIF clk = '1' AND clk'EVENT THEN
      --A new congfig is available or the last one is not yet used
      IF (cfg_done='1') OR (need_to_update_r='1') THEN
        error_value_r <= "100000000";
      ELSIF (update_phase2='1') THEN
        error_value_r <= error_value_s;
      END IF;
    END IF;
  END PROCESS;


  --------------------------------------------------------------------------------
  -- output signals
  --------------------------------------------------------------------------------

  error_value       <= error_value_r;
  measure_value     <= updated_measure;
  clear             <= update_phase2;
  current_set_point <= updated_set_point;
  new_value_to_dco  <= new_value_to_dco_i;

  --Some verifications on close-loop
  ASSERT NOT (rst_n = '1' AND cfg_bypass = '0' AND sample ='1' AND update_phase2 = '1') REPORT  "The capturte phase is overlaping the sample phase. Increase the capture time OR the clk frequency" SEVERITY FAILURE;
  ASSERT NOT (rst_n = '1' AND cfg_bypass = '0' AND sample ='1' AND new_value_to_dco_i = '1') REPORT  "The new value to DCO is overlaping the sample phase. Increase the capture time OR the clk frequency" SEVERITY WARNING;

END rtl;

