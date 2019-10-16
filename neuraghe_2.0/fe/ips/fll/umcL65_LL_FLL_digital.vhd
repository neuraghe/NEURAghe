-------------------------------------------------------------------------------
-- Title      : umcL65 Frequency Locked Loop Digital Controlled Oscillator 
-- Project    : PULP 65nm
-------------------------------------------------------------------------------
-- File       : umcL65_LL_FLL_digital.vhd
-- Author     : David Bellasi  <bellasi@ee.ethz.ch>
-- Company    : Integrated Systems Laboratory, ETH Zurich
-- Created    : 2015-03-18
-- Last update: 2015-04-03
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : 
-------------------------------------------------------------------------------
-- Description: Top level cell for the digital part of the FLL.
--              Includes the loop filter (i.e., control), DCO, the clock counter,
--              and the clock divider
--              
-------------------------------------------------------------------------------
-- Copyright (c) 2015 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author              Description
-- 2015-03-18  2.0      bellasid            created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity umcL65_LL_FLL_digital is
  port(
    --
    -- to/from DCO clock domain
    DITH   : out std_logic;             -- dithering pattern
    DITHB  : out std_logic;             -- dithering pattern inverted
    DCOCLK : in  std_logic;             -- DCO clock in
    FLLCLK : out std_logic;             -- FLL clock out
    FLLOE  : in  std_logic;  -- FLL clock output enable (active high)
    --
    -- to/from ref clock domain
    DCOD   : out std_logic_vector(9 downto 0);  -- DCO digital control word
    DCODB  : out std_logic_vector(9 downto 0);  -- DCO digital control word inverted
    DCOEN  : out std_logic;             -- DCO power enable
    REFCLK : in  std_logic;             -- reference clock input
    --
    -- to/from SoC clock domain
    LOCK   : out std_logic;             -- FLL lock signal (active high)
    CFGREQ : in  std_logic;             -- configuration port handshake
    CFGACK : out std_logic;             -- configuration port handshake
    CFGAD  : in  std_logic_vector(1 downto 0);  -- config address in
    CFGD   : in  std_logic_vector(31 downto 0);  -- config data in
    CFGQ   : out std_logic_vector(31 downto 0);  -- config data out
    CFGWEB : in  std_logic;             -- config reg write enable (active low)
    --
    -- asynchronous
    RSTB   : in  std_logic;             -- global async reset (active low)
    PWDB   : in  std_logic;             -- async power down (active low)
    --
    -- test signals
    TM     : in  std_logic;             -- test mode
    TE     : in  std_logic;             -- scan enable
    TD     : in  std_logic;             -- scan in
    TQ     : out std_logic              -- scan out
    );
end umcL65_LL_FLL_digital;


architecture rtl of umcL65_LL_FLL_digital is

  constant CLK_PERIOD_QUANTIZER_WIDTH : natural := 16;
  constant GAIN_WORDWIDTH             : natural := 16;
  constant DCO_WORDWIDTH              : natural := 10;
  constant DITHER_WORDWIDTH           : natural := 5;
  constant UNSTABLE_CYCLE_WIDTH       : natural := 8;
  constant STABLE_CYCLE_WIDTH         : natural := 8;
  constant LOCKTOLERANCE_WIDTH        : natural := 16;

  ----------------------------------------------------------------------
  -- Default configuration register settings
  -- (see in the code section below for a complete description of
  --  the register bitmap)
  ----------------------------------------------------------------------

  constant CFG_REG1_MASK : std_logic_vector(31 downto 0) :=
    x"0000" & x"FFFF";
  constant CFG_REG1_DEFAULT : std_logic_vector(31 downto 0) :=
    x"0000" & x"05F5";
  
  constant CFG_REG2_MASK : std_logic_vector(31 downto 0) :=
    '1' & '1' & "11111" & "000000000" & x"FFFF";
  constant CFG_REG2_DEFAULT : std_logic_vector(31 downto 0) :=
    '1' & '0' & "00000" & "000000000" & x"0100";
  
  constant CFG_REG3_MASK : std_logic_vector(31 downto 0) :=
    x"FFFF" & x"FF" & x"FF";
  constant CFG_REG3_DEFAULT : std_logic_vector(31 downto 0) :=
    x"0040" & x"10" & x"02";

  ----------------------------------------------------------------------
  -- Signals/contants declarations -------------------------------------
  ----------------------------------------------------------------------

  signal RefClkMultFactor_D           : std_logic_vector(CLK_PERIOD_QUANTIZER_WIDTH-1 downto 0);
  signal DCOValue_D                   : std_logic_vector(9 downto 0);
  signal DitherValue_D                : std_logic_vector(DITHER_WORDWIDTH-1 downto 0);
  signal DitherPattern_D              : std_logic;
  signal DitherUpdate_S               : std_logic;
  signal DitherEnable_S               : std_logic;
  signal CfgDitherEnable_S            : std_logic;
  signal CfgDitherClkDiv_S            : std_logic_vector(4 downto 0);
  signal FLLenable_S                  : std_logic;
  signal FLLenableDCO_S               : std_logic;
  signal FLLclkoutEnable_S            : std_logic;
  signal CfgLockGatedClkOut_S         : std_logic;
  signal Lock_S                       : std_logic;
  signal LockReset_S                  : std_logic;
  signal CfgTargetRefClkMultFactor_D  : std_logic_vector(CLK_PERIOD_QUANTIZER_WIDTH-2 downto 0);
  signal CfgGain_D                    : std_logic_vector(GAIN_WORDWIDTH-1 downto 0);
  signal CfgLockTolerance_D           : std_logic_vector(LOCKTOLERANCE_WIDTH-1 downto 0);
  signal CfgStableCycles_D            : std_logic_vector(STABLE_CYCLE_WIDTH-1 downto 0);
  signal CfgUnstableCycles_D          : std_logic_vector(UNSTABLE_CYCLE_WIDTH-1 downto 0);
  --
  signal CfgReqSync_SP, CfgReqSync_SN : std_logic_vector(3 downto 0);
  signal CfgReqEdge_S                 : std_logic;
  --
  signal CfgAddr_SN, CfgAddr_SP       : std_logic_vector(1 downto 0);
  signal CfgReg1_DN, CfgReg1_DP       : std_logic_vector(31 downto 0);
  signal CfgReg2_DN, CfgReg2_DP       : std_logic_vector(31 downto 0);
  signal CfgReg3_DN, CfgReg3_DP       : std_logic_vector(31 downto 0);
  --
  signal DCOClk_C                     : std_logic;
  --
  signal RstPwd_RB                    : std_logic;
  signal RstRef_RB                    : std_logic;
  signal RstDCO_RB                    : std_logic;

  ----------------------------------------------------------------------
  -- Components declarations -------------------------------------------
  ----------------------------------------------------------------------

  component umcL65_LL_FLL_loop_filter_and_control
    generic (
      CLK_PERIOD_QUANTIZER_WIDTH : natural;
      GAIN_WORDWIDTH             : natural;
      DCO_WORDWIDTH              : natural;
      DITHER_WORDWIDTH           : natural;
      LOCKTOLERANCE_WIDTH        : natural;
      STABLE_CYCLE_WIDTH         : natural;
      UNSTABLE_CYCLE_WIDTH       : natural);
    port (
      cfg_gain            : in  std_logic_vector(GAIN_WORDWIDTH-1 downto 0);
      cfg_setpoint        : in  std_logic_vector(CLK_PERIOD_QUANTIZER_WIDTH-2 downto 0);
      cfg_lock_tolerance  : in  std_logic_vector(LOCKTOLERANCE_WIDTH-1 downto 0);
      cfg_stable_cycles   : in  std_logic_vector(STABLE_CYCLE_WIDTH-1 downto 0);
      cfg_unstable_cycles : in  std_logic_vector(UNSTABLE_CYCLE_WIDTH-1 downto 0);
      --
      clk_ref_mult_factor : in  std_logic_vector(CLK_PERIOD_QUANTIZER_WIDTH-1 downto 0);
      dco_value           : out std_logic_vector(DCO_WORDWIDTH-1 downto 0);
      dither_value        : out std_logic_vector(DITHER_WORDWIDTH-1 downto 0);
      lock                : out std_logic;
      lock_reset          : in  std_logic;
      --
      enable              : in  std_logic;
      rst_n               : in  std_logic;
      clk                 : in  std_logic
      );
  end component;

  component umcL65_LL_FLL_clk_period_quantizer
    generic (
      COUNTER_WIDTH : natural);
    port (
      clk_dco : in  std_logic;
      clk_ref : in  std_logic;
      rst_dco : in  std_logic;
      enable  : in  std_logic;
      counter : out std_logic_vector(COUNTER_WIDTH-1 downto 0)
      );
  end component;

  component umcL65_LL_FLL_dither_pattern_gen
    generic (
      FRACTIONAL_BITS : natural);
    port (
      Frac_DI          : in  std_logic_vector(FRACTIONAL_BITS-1 downto 0);
      Update_SI        : in  std_logic;
      DitherPattern_DO : out std_logic;
      ClkDiv_SI        : in  std_logic_vector(4 downto 0);
      En_SI            : in  std_logic;
      TestMode_TI      : in  std_logic;
      Clk_CI           : in  std_logic;
      Rst_RBI          : in  std_logic
      );
  end component;

  component synchronizer
    generic (
      SYNCHRONIZERS : natural;
      RESET_VALUE   : std_logic);
    port (
      rst_n       : in  std_logic;
      clk         : in  std_logic;
      data_in     : in  std_logic;
      data_out    : out std_logic;
      falling_out : out std_logic;
      rising_out  : out std_logic;
      enable      : in  std_logic
      );
  end component;

  component reset_synchronizer
    generic (
      SYNCHRONIZERS : natural);
    port (
      clk       : in  std_logic;
      rst_n     : in  std_logic;
      test_mode : in  std_logic;
      enable    : in  std_logic;
      rst_out_n : out std_logic
      );
  end component;


  component LAGCESM2WA
    port (
      SE  : in  std_logic;
      E   : in  std_logic;
      CK  : in  std_logic;
      GCK : out std_logic
      );
  end component;

  component CKMUX2M16WA
    port (
      A : in  std_logic;
      B : in  std_logic;
      S : in  std_logic;
      Z : out std_logic
      );
  end component;
  
begin

  -----------------------------------------------------------------------------
  -- Clock mux for testability of blocks that are clocked with the DCO clock
  -----------------------------------------------------------------------------

  i_test_clk_mux : CKMUX2M16WA
    port map (
      A => DCOCLK,
      B => REFCLK,
      S => TM,
      Z => DCOClk_C
      );

  -----------------------------------------------------------------------------
  -- Output clock gate
  -----------------------------------------------------------------------------

  FLLclkoutEnable_S <= ((Lock_S and CfgLockGatedClkOut_S) and FLLOE) and (not TM);


  i_LAGCESM2WA_1 : LAGCESM2WA
    port map (
      CK  => DCOCLK,
      E   => FLLclkoutEnable_S,
      SE  => TM,
      GCK => FLLCLK);

  -----------------------------------------------------------------------------
  -- Lock output
  -----------------------------------------------------------------------------

  LOCK <= Lock_S;

  -----------------------------------------------------------------------------
  -- Main reset synchronizer 
  -----------------------------------------------------------------------------

  RstPwd_RB <= RSTB and PWDB;

  i_rstsynch_RefClk : reset_synchronizer
    generic map (
      SYNCHRONIZERS => 2)
    port map (
      clk       => REFCLK,
      rst_n     => RstPwd_RB,
      test_mode => TM,
      enable    => RstPwd_RB,
      rst_out_n => RstRef_RB
      );

  -----------------------------------------------------------------------------
  -- FLL loop filter and control unit
  -----------------------------------------------------------------------------

  i_loop_filter_and_control : umcL65_LL_FLL_loop_filter_and_control
    generic map (
      CLK_PERIOD_QUANTIZER_WIDTH => CLK_PERIOD_QUANTIZER_WIDTH,
      GAIN_WORDWIDTH             => GAIN_WORDWIDTH,
      DCO_WORDWIDTH              => DCO_WORDWIDTH,
      DITHER_WORDWIDTH           => DITHER_WORDWIDTH,
      LOCKTOLERANCE_WIDTH        => LOCKTOLERANCE_WIDTH,
      STABLE_CYCLE_WIDTH         => STABLE_CYCLE_WIDTH,
      UNSTABLE_CYCLE_WIDTH       => UNSTABLE_CYCLE_WIDTH
      )
    port map (
      cfg_gain            => CfgGain_D,
      cfg_setpoint        => CfgTargetRefClkMultFactor_D,
      cfg_lock_tolerance  => CfgLockTolerance_D,
      cfg_stable_cycles   => CfgStableCycles_D,
      cfg_unstable_cycles => CfgUnstableCycles_D,
      --
      clk_ref_mult_factor => RefClkMultFactor_D,
      dco_value           => DCOValue_D,
      dither_value        => DitherValue_D,
      lock                => Lock_S,
      lock_reset          => LockReset_S,
      --
      enable              => FLLenable_S,
      rst_n               => RstRef_RB,
      clk                 => REFCLK
      );

  -----------------------------------------------------------------------------
  -- Power down the R2R DAC by setting both its inputs and its inverted inputs
  -- to zero when the FLL is in reset
  -----------------------------------------------------------------------------
  
  DCOD  <= DCOValue_D          when RstRef_RB = '1' else std_logic_vector(to_unsigned(0, DCOD'length));
  DCODB <= not DCOValue_D      when RstRef_RB = '1' else std_logic_vector(to_unsigned(0, DCOD'length));
  --
  DITH  <= DitherPattern_D     when RstRef_RB = '1' else '0';
  DITHB <= not DitherPattern_D when RstRef_RB = '1' else '0';
  --
  DCOEN <= RstRef_RB;

  -----------------------------------------------------------------------------
  -- clock gate the digital logic of the FLL to save power when in reset 
  -----------------------------------------------------------------------------

  FLLenable_S <= RstRef_RB;
  FLLenableDCO_S <= RstDCO_RB;

  -----------------------------------------------------------------------------
  -- Reset Synchronizer for DCO clock domain:
  -- Reset goes to :
  --    1) dither pattern generator 
  --    2) ref clock period quantizer
  -----------------------------------------------------------------------------

  i_rstsynch_DCOClk : reset_synchronizer
    generic map (
      SYNCHRONIZERS => 2)
    port map (
      clk       => DCOClk_C,
      rst_n     => RstRef_RB,
      test_mode => TM,
      enable    => FLLenable_S,
      rst_out_n => RstDCO_RB
      );

  -----------------------------------------------------------------------------
  -- Dither pattern generator.
  -- Works at the DCO clock speed (i.e., is in the DCO clock domain)
  -- For savety reasons the updates of the dither value are delayed by a couple
  -- of DCO clock cycles.
  -----------------------------------------------------------------------------

  i_DitherUpdate_S_synchronizer : synchronizer
    generic map (
      SYNCHRONIZERS => 4,
      RESET_VALUE   => '0')
    port map (
      rst_n       => RstDCO_RB,
      clk         => DCOClk_C,
      data_in     => REFCLK,
      data_out    => open,
      falling_out => open,
      rising_out  => DitherUpdate_S,
      enable      => FLLenableDCO_S
      );


  DitherEnable_S <= CfgDitherEnable_S and FLLenableDCO_S;

  i_dither_pattern_gen : umcL65_LL_FLL_dither_pattern_gen
    generic map (
      FRACTIONAL_BITS => DITHER_WORDWIDTH
      )
    port map (
      Frac_DI          => DitherValue_D,
      Update_SI        => DitherUpdate_S,
      DitherPattern_DO => DitherPattern_D,
      ClkDiv_SI        => CfgDitherClkDiv_S,
      En_SI            => DitherEnable_S,
      TestMode_TI      => TM,
      Clk_CI           => DCOClk_C,
      Rst_RBI          => RstDCO_RB
      );

  -----------------------------------------------------------------------------
  -- Measure the current multiplication factor.
  -- No synchronization with the ref clock domain required since the
  -- counter output is updated at the falling edge of the ref clock.
  -----------------------------------------------------------------------------

  i_clk_period_quantizer : umcL65_LL_FLL_clk_period_quantizer
    generic map (
      COUNTER_WIDTH => CLK_PERIOD_QUANTIZER_WIDTH)
    port map (
      clk_dco => DCOClk_C,
      clk_ref => REFCLK,
      rst_dco => RstDCO_RB,
      enable  => FLLenableDCO_S,
      counter => RefClkMultFactor_D
      );


  -----------------------------------------------------------------------------
  -- Configuration update with handshake between SoCClk domain and RefClk Domain
  -----------------------------------------------------------------------------

  CfgReqSync_SN(0)          <= CFGREQ;
  CfgReqSync_SN(3 downto 1) <= CfgReqSync_SP(2 downto 0);
  --
  CfgReqEdge_S              <= CfgReqSync_SP(1) and (not CfgReqSync_SP(2));
  --
  CFGACK                    <= CfgReqSync_SP(3);

  cfg_handshake : process (REFCLK, RstRef_RB)
  begin  -- process cfg_handshake
    if RstRef_RB = '0' then             -- asynchronous reset (active low)
      CfgReqSync_SP <= (others => '0');
    elsif REFCLK'event and REFCLK = '1' then  -- rising clock edge
      if FLLenable_S = '1' then
        CfgReqSync_SP <= CfgReqSync_SN;
      end if;
    end if;
  end process cfg_handshake;


  -----------------------------------------------------------------------------
  -- Configuration register (are all in the ref clock domain)
  -----------------------------------------------------------------------------
  --
  -- CfgReg I Bitmap:
  --
  --   Bit range                            | Function
  --   ---------------------------------------------------------------------
  --   31 - CLK_PERIOD_QUANTIZER_WIDTH      | unused
  --   (CLK_PERIOD_QUANTIZER_WIDTH-2) - 0   | target clk multiplication factor
  --
  CfgTargetRefClkMultFactor_D <= CfgReg1_DP(CLK_PERIOD_QUANTIZER_WIDTH-2 downto 0);
  --
  --
  -- CfgReg II Bitmap
  --
  --   Bit range                            | Function
  --   ---------------------------------------------------------------------
  --   31                                   | fll clk output gated by lock signal
  --   30                                   | dithering enable (active high)
  --   29-25                                | DCO clock divider (only for dithering)
  --   24-20                                | unused
  --   19 - GAIN_WORDWIDTH                  | unused
  --   (GAIN_WORDWIDTH-1) - 0               | gain setting
  --
  CfgLockGatedClkOut_S        <= CfgReg2_DP(31);                -- def: 1
  CfgDitherEnable_S           <= CfgReg2_DP(30);                -- def: 0
  CfgDitherClkDiv_S           <= CfgReg2_DP(29 downto 25);      -- def: 00000
  CfgGain_D                   <= CfgReg2_DP(GAIN_WORDWIDTH-1 downto 0);  -- def: 0x0100
  --
  --
  -- CfgReg III Bitmap
  --
  --   Bit range                            | Function
  --   ---------------------------------------------------------------------
  --   31-16                                | lock tolerance
  --   15-8                                 | stable cycles to lock assert
  --   7-0                                  | unstable cycles to lock de-assert
  --
  CfgLockTolerance_D          <= CfgReg3_DP(4*8-1 downto 2*8);  -- def: 128
  CfgStableCycles_D           <= CfgReg3_DP(2*8-1 downto 1*8);  -- def: 16
  CfgUnstableCycles_D         <= CfgReg3_DP(1*8-1 downto 0*8);  -- def: 16


  CfgAddr_SN <= CFGAD;

  CfgReg1_DN <= CFGD when CFGAD = "01" else CfgReg1_DP;
  CfgReg2_DN <= CFGD when CFGAD = "10" else CfgReg2_DP;
  CfgReg3_DN <= CFGD when CFGAD = "11" else CfgReg3_DP;

  CFGQ <= CfgReg1_DP when CfgAddr_SP = "01" else
          CfgReg2_DP when CfgAddr_SP = "10" else
          CfgReg3_DP when CfgAddr_SP = "11" else
          (others => '0');

  update_cfg_regs : process (REFCLK, RstRef_RB) is
  begin  -- process update_cfg_regs
    if RstRef_RB = '0' then             -- asynchronous reset (active low)
      CfgReg1_DP <= CFG_REG1_DEFAULT;
      CfgReg2_DP <= CFG_REG2_DEFAULT;
      CfgReg3_DP <= CFG_REG3_DEFAULT;
      CfgAddr_SP <= (others => '0');
    elsif REFCLK'event and REFCLK = '1' then  -- rising clock edge
      if CfgReqEdge_S = '1' and CFGWEB = '0' then
        CfgReg1_DP <= CfgReg1_DN and CFG_REG1_MASK;
        CfgReg2_DP <= CfgReg2_DN and CFG_REG2_MASK;
        CfgReg3_DP <= CfgReg3_DN and CFG_REG3_MASK;
      end if;
      if CfgReqEdge_S = '1' then
        CfgAddr_SP <= CfgAddr_SN;
      end if;
    end if;
  end process update_cfg_regs;

  -- reset the lock signal whenever config reg I is updated
  LockReset_S <= '1' when (CfgReqEdge_S = '1' and CFGWEB = '0' and CFGAD = "01") else '0';


end rtl;

