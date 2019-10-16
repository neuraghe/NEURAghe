--!----------------------------------------------------------------
--! CAUTION : this file was generated automatically
--! Generator : /home/archive/Data/projets/P2012/MAG3D/users/vivet/magali3d/generators/hdlbuilder/bin/codegen
--! Generator revision : 9740
--! Template : /home/projets/IRT3D/users/im219746/lisan_svn/IPs/CVP/trunk/templates/cvp.vhd.template
--! Template revision  : 12
--! Generation parameters :
--!     $entity_name="cvp"; $number_clk_gen=1;  $number_MPROB=1; $number_TMFLT=0; $number_TMFLT_ring=0; $number_IT_ctrl=0; $number_thermal_sens=0; $input_resync=1; $reset_resync=1
--!
--! If you need to modify this file for a specific need :
--!     ===> remove this banner
--! If you found a generic bug in the file :
--!     ===> see template author for modification of the template
--!----------------------------------------------------------------
--! @file cvp
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
--! @par  Id: $Id: cvp.vhd 17251 2011-09-20 12:02:17Z imiro $
--! @par  Date: $Date: 2011-09-20 14:02:17 +0200 (Tue, 20 Sep 2011) $
--! @par  Revision: $Rev: 17251 $
--!




LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY common_cells_lib;
USE common_cells_lib.ALL;


ENTITY cvp_mprobe IS
  GENERIC(
    ADDRESS_SIZE   : NATURAL := 10  --Number of bits used on the address
    ;NUM_FREQ_MODES_0  : NATURAL := 4  --Number of frequency_modes on clock_generator. Maximum 8
  );
  PORT(
    -- reset and clock for the CVP synchronous domain
    rst_async_n       : IN STD_LOGIC;
    clk_cvp           : IN STD_LOGIC;
    clk_ref           : IN STD_LOGIC;
    -- signals to the core
    clk_fll_0     : OUT STD_LOGIC;


    power_on          : IN STD_LOGIC;

    -- CVP interface
    pwr_req           : IN  STD_LOGIC;
    pwr_w_data        : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
    pwr_addr          : IN  STD_LOGIC_VECTOR(31 DOWNTO 3);
    pwr_be            : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    pwr_wr_rd         : IN  STD_LOGIC; -- '1' > read / '0' > write
    pwr_ack           : OUT STD_LOGIC;
    pwr_r_data        : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    pwr_error         : OUT STD_LOGIC;
    



    


    -- multiprobes interface
    mprob_0_rst_n       : OUT STD_LOGIC;
    mprob_0_mode        : OUT STD_LOGIC;
    mprob_0_sample      : OUT STD_LOGIC;
    mprob_0_serdes_clk  : OUT STD_LOGIC;
    mprob_0_serdes_out  : OUT STD_LOGIC;
    mprob_0_serdes_in   : IN  STD_LOGIC;
    mprob_0_test_freq   : OUT STD_LOGIC;
    
    -- DEBUG obervation interface
    core_rst_n        : OUT STD_LOGIC;
    core_power_on     : OUT STD_LOGIC;

    -- TEST part  
    test_mode         : IN  STD_LOGIC;
    test_se           : IN  STD_LOGIC;
    test_si           : IN  STD_LOGIC;
    test_so           : OUT STD_LOGIC
  );
END ENTITY cvp_mprobe;

ARCHITECTURE RTL OF cvp_mprobe IS


  COMPONENT synchronizer IS
    GENERIC(
      RESET_VALUE : STD_LOGIC := '0'  -- OUTPUT VALUE AT RESET 
    );
    PORT(
      rst_n     : IN  STD_LOGIC;
      clk       : IN  STD_LOGIC;
      data_in   : IN  STD_LOGIC;
      data_out  : OUT STD_LOGIC
    );
  END COMPONENT;
  
  COMPONENT reset_synchronizer IS
    GENERIC(
      SYNCHRONIZERS    : NATURAL :=  2  -- Number of synchronizers 
    );
    PORT(
      clk        : IN  STD_LOGIC;
      rst_n      : IN  STD_LOGIC;
      test_mode  : IN  STD_LOGIC;

      rst_out_n  : OUT STD_LOGIC
    );
  END COMPONENT;





  COMPONENT cvp_mprob_controller IS
    GENERIC(
      ADDRESS_SIZE     : NATURAL := 3  --Number of bits used on the address. Minimum 3
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
  END COMPONENT;


  COMPONENT cvp_clock_gen IS
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
  END COMPONENT;





  CONSTANT CVP_PAGE_SIZE  : NATURAL := 7; --Number of bits of the address to define a CVP page. 7=> 32regs of 32bits per page

  SIGNAL rst_cvp_n        : STD_LOGIC;
  SIGNAL rst_ref_n    : STD_LOGIC;
  SIGNAL modules_data     : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL modules_valid    : STD_LOGIC;
  SIGNAL modules_error    : STD_LOGIC;





  --Module MPROB controller
  SIGNAL mod_mprob_0_data   : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL mod_mprob_0_valid  : STD_LOGIC;
  SIGNAL mod_mprob_0_error  : STD_LOGIC;
  SIGNAL mod_mprob_0_req    : STD_LOGIC;


  
  --Module clock_gen
  SIGNAL mod_clk_gen_0_data   : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL mod_clk_gen_0_valid  : STD_LOGIC;
  SIGNAL mod_clk_gen_0_error  : STD_LOGIC;
  SIGNAL mod_clk_gen_0_req    : STD_LOGIC;


  --Module Error generator
  SIGNAL mod_error_data   : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL mod_error_valid  : STD_LOGIC;
  SIGNAL mod_error_error  : STD_LOGIC;

  SIGNAL pwr_req_sync_r   : STD_LOGIC;
  SIGNAL pwr_r_data_r     : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL pwr_r_data_s     : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL pwr_error_r      : STD_LOGIC;
  SIGNAL pwr_error_s      : STD_LOGIC;
  SIGNAL ready_to_answer_r: STD_LOGIC;
  SIGNAL ready_to_answer_s: STD_LOGIC;

  -- Interface state machine
  TYPE   T_PWRIF_STATE is (READY, ANSWER);
  SIGNAL pwrif_current_state, pwrif_next_state : T_PWRIF_STATE;

  


  SIGNAL cmd_freq_0                  : STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL cmd_safe_0                  : STD_LOGIC;
  SIGNAL it_clk_gen_0_valid_clk      : STD_LOGIC;
  SIGNAL it_clk_gen_0_valid_xpct_clk : STD_LOGIC;

  SIGNAL it_mprob_0_end_of_sampling  : STD_LOGIC; -- Edge sensitive


  --ADAPTATION SIGNALS
  --------------------

  -- hopping sequencer to hopping controller
  --END ADAPTATION SIGNALS

BEGIN

  pClock : process(clk_cvp, rst_cvp_n)
    begin
      if rst_cvp_n = '0' then
        pwrif_current_state <= READY;
        pwr_r_data_r        <= (others => '0');
        pwr_error_r         <= '0';
        ready_to_answer_r   <= '1';
      elsif (clk_cvp='1' and clk_cvp'event) then
        pwrif_current_state <= pwrif_next_state;
        pwr_r_data_r        <= pwr_r_data_s;
        pwr_error_r         <= pwr_error_s;
        ready_to_answer_r   <= ready_to_answer_s;
      end if;
    end process;

  pwrif_combproc : process(pwrif_current_state, pwr_req_sync_r, pwr_r_data_r, modules_valid, modules_data, modules_error, pwr_error_r)
    begin
      pwrif_next_state <= pwrif_current_state;
      pwr_r_data_s <= pwr_r_data_r;
      pwr_error_s  <= pwr_error_r;
      -- output & next state calculation
      case pwrif_current_state is
        when READY =>
          if (pwr_req_sync_r = '1') AND (modules_valid = '1') then
            -- A new request is ready and the answer to this resquest is also ready (valid = 1)
            pwrif_next_state <= ANSWER;
            --Store the answer of the request
            pwr_r_data_s <= modules_data;
            pwr_error_s  <= modules_error;
          end if;
        when ANSWER =>
          if pwr_req_sync_r = '0' then
            pwrif_next_state <= READY;
          end if;
        when others =>
          assert FALSE report "Use of WHEN OTHERS in a CASE statement" severity FAILURE;
      end case;
    end process;

  p_ready_to_answer : process(ready_to_answer_r, modules_valid, pwr_req_sync_r)
    begin
      ready_to_answer_s <= ready_to_answer_r;
      if modules_valid = '1' then
        ready_to_answer_s <= '0';   --The answer is the current request is ready => stop sending requests
      end if;
      if pwr_req_sync_r = '0' then
        ready_to_answer_s <= '1';   --I am ready to answer the next request
      end if;
    end process;


  p_decoding : process(pwr_req_sync_r, ready_to_answer_r, pwr_addr)
    begin

                                                          mod_mprob_0_req              <= '0';
                                                          mod_clk_gen_0_req          <= '0';
    
      mod_error_data  <= (others => '0');
      mod_error_valid <= '0';
      mod_error_error <= '0';
      if (pwr_req_sync_r = '1') AND (ready_to_answer_r = '1') then --A new request without having been answered
        --Make a request to the module that should answer
        case to_integer(unsigned(pwr_addr(ADDRESS_SIZE-1 downto CVP_PAGE_SIZE))) is

                                                       when 0 => --Module clock_gen
                                                         mod_clk_gen_0_req <= '1';
                                                       when 1 => --Module MPROB controller
                                                         mod_mprob_0_req <= '1';
        
          when others =>
            --Request not valid => Error
            mod_error_data  <= (others => '0');
            mod_error_valid <= '1';
            mod_error_error <= '1';
        end case;
      end if;
    end process;







  u_mprob_controller_0 : cvp_mprob_controller
    GENERIC MAP(
      ADDRESS_SIZE  => CVP_PAGE_SIZE - 3
    )
    PORT MAP(
      -- General signals
      rst_n         => rst_cvp_n,
      rst_ref_n     => rst_ref_n, 
      clk           => clk_cvp, 
      clk_ref       => clk_ref,
  
      in_data       => pwr_w_data,                          
      in_address    => pwr_addr(CVP_PAGE_SIZE-1 downto 3), 
      in_be         => pwr_be, 
      in_wr_rd      => pwr_wr_rd, 
      in_req        => mod_mprob_0_req, 
                                                            
      out_data      => mod_mprob_0_data, 
      out_valid     => mod_mprob_0_valid, 
      out_error     => mod_mprob_0_error, 
  
      -- Multiprobes interface
      mprob_rst_n       => mprob_0_rst_n,     
      mprob_mode        => mprob_0_mode,      
      mprob_sample      => mprob_0_sample,    
      mprob_serdes_clk  => mprob_0_serdes_clk,
      mprob_serdes_out  => mprob_0_serdes_out,
      mprob_serdes_in   => mprob_0_serdes_in, 
      mprob_test_freq   => mprob_0_test_freq, 
  
      it_end_of_sampling  => it_mprob_0_end_of_sampling
    );



  u_cvp_clock_gen_0 : cvp_clock_gen
    GENERIC MAP(
      ADDRESS_SIZE           => CVP_PAGE_SIZE - 3,
      NUM_FREQ_MODES         => NUM_FREQ_MODES_0, --Number of frequency_modes. Maximum 8
      BYPASS_MODE_AFTER_RESET=> '1',        -- start in debug mode at reset
      BYPASS_CMD_AFTER_RESET => "10000000", -- debug mode value at reset = 128, as for the set point
      ENABLE_AFTER_RESET     => '1',        -- start after reset 
      FLL_CMD_AFTER_RESET    => "10000000", -- 128 => 2560MHz 
      CLK_DIV_AFTER_RESET    => "0101"      -- div_factor=5 => division par (2 * 2^5) => 40MHz for clk_out
    )
    PORT MAP(
      -- General signals
      rst_n          => rst_cvp_n,
      rst_ref_n      => rst_ref_n,
      rst_async_n    => rst_async_n,
      clk            => clk_cvp,
      clk_ref        => clk_ref,
      test_mode      => test_mode,
  
      in_data        => pwr_w_data,                          
      in_address     => pwr_addr(CVP_PAGE_SIZE-1 downto 3), 
      in_be          => pwr_be, 
      in_wr_rd       => pwr_wr_rd, 
      in_req         => mod_clk_gen_0_req, 
  
      out_data       => mod_clk_gen_0_data, 
      out_valid      => mod_clk_gen_0_valid,
      out_error      => mod_clk_gen_0_error,
  
      -- Power controller interface
      cmd_freq          => cmd_freq_0,
      cmd_safe          => cmd_safe_0,
      valid_clk         => it_clk_gen_0_valid_clk     ,
      valid_xpct_clk    => it_clk_gen_0_valid_xpct_clk,
      current_set_point => open,
      
      -- Generated clock
      clk_out	          => clk_fll_0
    );

        --No power sequencer connecte to the current clock generator
        cmd_freq_0 <= "000";

        cmd_safe_0 <= '0';





  -- reset synchronisation
  u_reset_sync : reset_synchronizer
    PORT MAP(
      clk        => clk_cvp         ,
      rst_n      => rst_async_n ,
      test_mode  => test_mode   ,
      rst_out_n  => rst_cvp_n 
    );

  -- Clocked by clk_ref
  ---------------------
  -- reset synchronisation
  u_reset_ref_sync : reset_synchronizer
    PORT MAP(
      clk        => clk_ref     ,
      rst_n      => rst_async_n ,
      test_mode  => test_mode   ,
      rst_out_n  => rst_ref_n 
    );

  -- resynchronisation of the request signal
  u_req_sync : synchronizer 
    GENERIC MAP (
      RESET_VALUE => '0'
    )
    PORT MAP(
      rst_n     => rst_cvp_n    ,
      clk       => clk_cvp           ,
      data_in   => pwr_req       ,
      data_out  => pwr_req_sync_r 
    );

  --Collect all the answers
                                      modules_valid <=  
                                                     mod_mprob_0_valid               OR
                                                     mod_clk_gen_0_valid           OR
                                                     mod_error_valid; -- OR all modules


                                      modules_data  <= 
                                                     mod_mprob_0_data               OR
                                                     mod_clk_gen_0_data           OR
                                                     mod_error_data; -- OR all modules


                                      modules_error <= 
                                                     mod_mprob_0_error               OR
                                                     mod_clk_gen_0_error           OR
                                                     mod_error_error; -- OR all modules




  --Generate output signals
  pwr_r_data <= pwr_r_data_r;
  pwr_error  <= pwr_error_r;
  pwr_ack    <= '1' when pwrif_current_state = ANSWER else '0';


  --DEBUG TODO

  core_rst_n    <= rst_async_n;
  core_power_on <= power_on;

  

END RTL;

