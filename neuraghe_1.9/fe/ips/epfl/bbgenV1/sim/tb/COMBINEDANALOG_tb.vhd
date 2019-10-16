-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : COMBINEDANALOG_tb.vhd
-- Author     : Christoph Thomas Mueller <christoph.mueller@epfl.ch>
-- Company    : EPFL Lausanne
-- Created    : 2015-05-24
-- Last update: 2015-06-08
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2015 EPFL Lausanne
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Author   Description
-- 2015-05-24  tcmuelle Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library bbgen_lib;
use bbgen_lib.bbgen_package.all;
use bbgen_lib.cvp_package.all;
use bbgen_lib.apb_package.all;
-------------------------------------------------------------------------------

entity COMBINEDANALOG_tb is

end entity COMBINEDANALOG_tb;

-------------------------------------------------------------------------------

architecture behavioral of COMBINEDANALOG_tb is

  -- component ports
  signal driver_charge_clk         : std_logic;
  signal monitor_nwell_LB          : std_logic_vector(4 downto 0) := (others => '0');
  signal monitor_nwell_UB          : std_logic_vector(4 downto 0) := (others => '0');
  signal monitor_pwell_LB          : std_logic_vector(4 downto 0) := (others => '0');
  signal monitor_pwell_UB          : std_logic_vector(4 downto 0) := (others => '0');
  signal sample_nwell_clk          : std_logic                    := '0';
  signal sample_pwell_neg_clk      : std_logic                    := '0';
  signal sample_pwell_pos_clk      : std_logic                    := '0';
  signal sel_nwell                 : std_logic_vector(1 downto 0) := (others => '0');
  signal sel_pwell                 : std_logic_vector(1 downto 0) := (others => '0');
  signal monitor_comp_neg_pwell_LB : std_logic;
  signal monitor_comp_neg_pwell_UB : std_logic;
  signal monitor_comp_nwell_LB     : std_logic;
  signal monitor_comp_nwell_UB     : std_logic;
  signal monitor_comp_pos_pwell_LB : std_logic;
  signal monitor_comp_pos_pwell_UB : std_logic;

  -- clock
  signal Clk  : std_logic := '1';
  signal nRST : std_logic := '0';

  signal done : std_logic := '0';

  component bbgen_control
    port (
      reference_clk             : in  std_logic;
      nRST                      : in  std_logic;
      cvp_req                   : in  std_logic;
      cvp_ack                   : out std_logic;
      cvp_w_data                : in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
      cvp_r_data                : out std_logic_vector(CVP_DATA_WIDTH -1 downto 0);
      cvp_addr                  : in  std_logic_vector(CVP_ADDR_WIDTH -1 downto 0);
      cvp_rw                    : in  std_logic;
      cvp_be                    : in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
      cvp_error                 : out std_logic;
      monitor_nwell_UB          : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_nwell_LB          : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_pwell_UB          : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_pwell_LB          : out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);
      monitor_nwell_clk         : out std_logic;
      monitor_pos_pwell_clk     : out std_logic;
      monitor_neg_pwell_clk     : out std_logic;
      monitor_comp_nwell_UB     : in  std_logic;
      monitor_comp_nwell_LB     : in  std_logic;
      monitor_comp_pos_pwell_UB : in  std_logic;
      monitor_comp_pos_pwell_LB : in  std_logic;
      monitor_comp_neg_pwell_UB : in  std_logic;
      monitor_comp_neg_pwell_LB : in  std_logic;
      driver_sel_nwell          : out std_logic_vector(1 downto 0);
      driver_sel_pwell          : out std_logic_vector(1 downto 0);
      driver_charge_clk         : out std_logic;
      driver_weak               : in  std_logic;
      preset_select             : in  std_logic_vector(1 downto 0);
      preset_activate           : in  std_logic;
      target_reached            : out std_logic;
      force_sleep               : in  std_logic
      );
  end component;


  signal open_cvp_loop : std_logic;

  signal preset_select   : std_logic_vector(1 downto 0) := (others => '0');
  signal preset_activate : std_logic                    := '0';
  signal target_reached  : std_logic;

  -- CVP and APB interfaces
  signal cvp_ms, cvp2_ms : CVP_BUS_MS_t;
  signal cvp_sm, cvp2_sm : CVP_BUS_SM_t;
  signal apb_ms          : APB_MS_t;
  signal apb_sm          : APB_SM_t;

  signal force_sleep : std_logic := '0';
  signal driver_weak : std_logic := '0';
  
begin  -- architecture 

  -- component instantiation
  DUT : entity bbgen_lib.COMBINEDANALOG
    port map (
      driver_charge_clk         => driver_charge_clk,
      monitor_nwell_LB          => monitor_nwell_LB,
      monitor_nwell_UB          => monitor_nwell_UB,
      monitor_pwell_LB          => monitor_pwell_LB,
      monitor_pwell_UB          => monitor_pwell_UB,
      m_nwell_clk               => sample_nwell_clk,
      m_neg_pwell_clk           => sample_pwell_neg_clk,
      m_pos_pwell_clk           => sample_pwell_pos_clk,
      sel_nwell                 => sel_nwell,
      sel_pwell                 => sel_pwell,
      monitor_comp_neg_pwell_LB => monitor_comp_neg_pwell_LB,
      monitor_comp_neg_pwell_UB => monitor_comp_neg_pwell_UB,
      monitor_comp_nwell_LB     => monitor_comp_nwell_LB,
      monitor_comp_nwell_UB     => monitor_comp_nwell_UB,
      monitor_comp_pos_pwell_LB => monitor_comp_pos_pwell_LB,
      monitor_comp_pos_pwell_UB => monitor_comp_pos_pwell_UB);


  bbgen_control_1 : entity bbgen_lib.bbgen_control
    port map (
      reference_clk             => Clk,
      nRST                      => nRST,
      cvp_req                   => cvp_ms.req,
      cvp_ack                   => cvp_sm.ack,
      cvp_w_data                => cvp_ms.w_data,
      cvp_r_data                => cvp_sm.r_data,
      cvp_addr                  => cvp_ms.addr,
      cvp_rw                    => cvp_ms.rw,
      cvp_be                    => cvp_ms.be,
      cvp_error                 => cvp_sm.err,
      monitor_nwell_UB          => monitor_nwell_UB,
      monitor_nwell_LB          => monitor_nwell_LB,
      monitor_pwell_UB          => monitor_pwell_UB,
      monitor_pwell_LB          => monitor_pwell_LB,
      monitor_nwell_clk         => sample_nwell_clk,
      monitor_pos_pwell_clk     => sample_pwell_pos_clk,
      monitor_neg_pwell_clk     => sample_pwell_neg_clk,
      monitor_comp_nwell_UB     => monitor_comp_nwell_UB,
      monitor_comp_nwell_LB     => monitor_comp_nwell_LB,
      monitor_comp_pos_pwell_UB => monitor_comp_pos_pwell_UB,
      monitor_comp_pos_pwell_LB => monitor_comp_pos_pwell_LB,
      monitor_comp_neg_pwell_UB => monitor_comp_neg_pwell_UB,
      monitor_comp_neg_pwell_LB => monitor_comp_neg_pwell_LB,
      driver_sel_nwell          => sel_nwell,
      driver_sel_pwell          => sel_pwell,
      driver_charge_clk         => driver_charge_clk,
      driver_weak               => driver_weak,
      preset_select             => preset_select,
      preset_activate           => preset_activate,
      target_reached            => target_reached,
      force_sleep               => force_sleep
      );

  apb_cvb_wrapper_1 : entity bbgen_lib.apb_cvb_wrapper
    generic map (
      APB_ADDR_WIDTH => APB_ADDR_WIDTH)
    port map (
      HCLK            => Clk,
      HRESETn         => nRST,
      PADDR           => apb_ms.ADDR,
      PWDATA          => apb_ms.WDATA,
      PWRITE          => apb_ms.WRITE,
      PSEL            => apb_ms.SEL,
      PENABLE         => apb_ms.ENABLE,
      PRDATA          => apb_sm.RDATA,
      PREADY          => apb_sm.READY,
      PSLVERR         => apb_sm.SLVERR,
      -- 
      cvp1_pwr_req    => cvp_ms.req,
      cvp1_pwr_wr_rd  => cvp_ms.rw,
      cvp1_pwr_add    => cvp_ms.addr,
      cvp1_pwr_be     => cvp_ms.be,
      cvp1_pwr_data   => cvp_ms.w_data,
      cvp1_pwr_ack    => cvp_sm.ack,
      cvp1_pwr_error  => cvp_sm.err,
      cvp1_pwr_r_data => cvp_sm.r_data,
      -- not used, directly acknowledge each request
      cvp2_pwr_req    => cvp2_ms.req,
      cvp2_pwr_wr_rd  => cvp2_ms.rw,
      cvp2_pwr_add    => cvp2_ms.addr,
      cvp2_pwr_be     => cvp2_ms.be,
      cvp2_pwr_data   => cvp2_ms.w_data,
      cvp2_pwr_ack    => cvp2_sm.ack,
      cvp2_pwr_error  => cvp2_sm.err,
      cvp2_pwr_r_data => cvp2_sm.r_data);

  -- sort the request back for cvp2
  cvp2_sm.ack    <= cvp2_ms.req;
  cvp2_sm.err    <= '0';
  cvp2_sm.r_data <= (others => '0');
  -- clock generation
  Clk            <= '0' when done = '1' else not Clk after 5 ns;
  nRST           <= '1'                              after 101 ns;

  -- waveform generation
  WaveGen_Proc : process
    variable addr   : std_logic_vector(APB_ADDR_WIDTH - 1 downto 0) := (others => '0');  --
    variable data   : std_logic_vector(APB_DATA_WIDTH - 1 downto 0);
    variable data_s : string(APB_DATA_WIDTH downto 1);
  begin
    -- insert signal assignments here
    
    wait until Clk = '1';
    --bbgen_register_bank.idle_time   <= to_unsigned(0, bbgen_register_bank.idle_time'length);
    data := BBGEN_CMD_IDLE_TIME & x"00" & x"00" & std_logic_vector(to_unsigned(10, 8));

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

    --if false then
      
    --bbgen_register_bank.nwell_bound <= to_unsigned(31, bbgen_register_bank.nwell_bound'length);   
    for i in 0 to 3 loop
      data          := BBGEN_CMD_SET_PRESET & std_logic_vector(to_unsigned(i, 8)) & std_logic_vector(to_signed(-i - 4, 8)) & std_logic_vector(to_unsigned(i+4, 8));
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
    end loop;  -- i in 0 to 3

    --end if;
    

    -- read all registers
    for i in 1 to 6 loop
      wait until clk'event and clk = '1';
      apb_ms.ADDR   <= std_logic_vector(to_unsigned(i, APB_ADDR_WIDTH-3) & "000");
      apb_ms.SEL    <= '1';
      apb_ms.ENABLE <= '0';
      apb_ms.WRITE  <= '0';
      wait until clk'event and clk = '1';
      apb_ms.ENABLE <= '1';
      wait until apb_sm.READY = '1';
      --wait until clk'event and clk = '1';
      data          := apb_sm.RDATA;
      apb_ms.SEL    <= '0';
      apb_ms.ENABLE <= '0';

      for j in data'range loop
        case data(j) is
          when '1' =>
            data_s(j+1) := '1';
          when '0' =>
            data_s(j+1) := '0';
          when others =>
            data_s(j+1) := '?';
        end case;

      end loop;  -- j 

      report "======== Register " & integer'image(i) & " ========" severity note;
      report "Data: " & data_s severity note;
      report "Byte 0: " & integer'image(to_integer(signed(data(7 downto 0)))) severity note;
      report "Byte 1: " & integer'image(to_integer(signed(data(15 downto 8)))) severity note;
      report "Byte 2: " & integer'image(to_integer(signed(data(23 downto 16)))) severity note;
      report "Byte 3: " & integer'image(to_integer(signed(data(31 downto 24)))) severity note;
    end loop;  -- i
    --bbgen_register_bank.pwell_bound <= to_signed(-18, bbgen_register_bank.pwell_bound'length);


    --APB_WRITE(apb_ms, apb_sm, clk, (others => '0'), BBGEN_CMD_PWELL_BOUND & x"00" & x"00" & std_logic_vector(to_signed(-18, 8)));
    data := BBGEN_CMD_SELECT_PRESET & x"00" & x"00" & x"00";

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

    wait for 20 us;
    --bbgen_register_bank.nwell_bound <= to_unsigned(0, bbgen_register_bank.nwell_bound'length);
    --bbgen_register_bank.pwell_bound <= to_signed(10, bbgen_register_bank.pwell_bound'length);
    data := BBGEN_CMD_NWELL_BOUND & x"00" & x"00" & std_logic_vector(to_unsigned(0, 8));

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

    --bbgen_register_bank.pwell_bound <= to_signed(-18, bbgen_register_bank.pwell_bound'length);


    --APB_WRITE(apb_ms, apb_sm, clk, (others => '0'), BBGEN_CMD_PWELL_BOUND & x"00" & x"00" & std_logic_vector(to_signed(-18, 8)));
    data := BBGEN_CMD_PWELL_BOUND & x"00" & x"00" & std_logic_vector(to_signed(10, 8));

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

    wait for 10 us;
    -- read all registers
    for i in 1 to 6 loop
      wait until clk'event and clk = '1';
      apb_ms.ADDR   <= std_logic_vector(to_unsigned(i, APB_ADDR_WIDTH-3) & "000");
      apb_ms.SEL    <= '1';
      apb_ms.ENABLE <= '0';
      apb_ms.WRITE  <= '0';
      wait until clk'event and clk = '1';
      apb_ms.ENABLE <= '1';
      wait until apb_sm.READY = '1';
      --wait until clk'event and clk = '1';
      data          := apb_sm.RDATA;
      apb_ms.SEL    <= '0';
      apb_ms.ENABLE <= '0';

      for j in data'range loop
        case data(j) is
          when '1' =>
            data_s(j+1) := '1';
          when '0' =>
            data_s(j+1) := '0';
          when others =>
            data_s(j+1) := '?';
        end case;

      end loop;  -- j 

      report "======== Register " & integer'image(i) & " ========" severity note;
      report "Data: " & data_s severity note;
      report "Byte 0: " & integer'image(to_integer(signed(data(7 downto 0)))) severity note;
      report "Byte 1: " & integer'image(to_integer(signed(data(15 downto 8)))) severity note;
      report "Byte 2: " & integer'image(to_integer(signed(data(23 downto 16)))) severity note;
      report "Byte 3: " & integer'image(to_integer(signed(data(31 downto 24)))) severity note;
    end loop;  -- i
    -- disable the bbgen
    data          := BBGEN_CMD_ENABLE_DISABLE & x"00" & x"00" & x"00";
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
    wait for 1 us;
    -- stop the clock & lock process.
    done          <= '1';
    wait until false;
  end process WaveGen_Proc;

  

end architecture;

