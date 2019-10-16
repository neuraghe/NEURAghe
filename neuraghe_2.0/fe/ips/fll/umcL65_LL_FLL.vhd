-------------------------------------------------------------------------------
-- Title      : umcL65 Frequency Locked Loop Digital Controlled Oscillator 
-- Project    : PULP 65nm
-------------------------------------------------------------------------------
-- File       : umcL65_LL_FLL_digital.vhd
-- Author     : David Bellasi  <bellasi@ee.ethz.ch>
-- Company    : Integrated Systems Laboratory, ETH Zurich
-- Created    : 2015-03-18
-- Last update: 2015-04-01
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : 
-------------------------------------------------------------------------------
-- Description: Behavioral model of the complete FLL
--              Includes DCO model and RTL of the digital part
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


entity umcL65_LL_FLL is

  port (
    FLLCLK : out std_logic;
    FLLOE  : in  std_logic;
    REFCLK : in  std_logic;
    LOCK   : out std_logic;
    CFGREQ : in  std_logic;
    CFGACK : out std_logic;
    CFGAD  : in  std_logic_vector(1 downto 0);
    CFGD   : in  std_logic_vector(31 downto 0);
    CFGQ   : out std_logic_vector(31 downto 0);
    CFGWEB : in  std_logic;
    RSTB   : in  std_logic;
    PWDB   : in  std_logic;
    TM     : in  std_logic;
    TE     : in  std_logic;
    TD     : in  std_logic;
    TQ     : out std_logic);

end umcL65_LL_FLL;


architecture behavioral of umcL65_LL_FLL is

-- synopsys translate_off
  signal DCOClk_C : std_logic;
  signal DCO_D    : std_logic_vector(9 downto 0);
  signal DCOEn_S : std_logic;
  signal FreqReal : real := 0.0;
-- synopsys translate_on

  component umcL65_LL_DCO_behavioral
    port (
      Din_DI  : in  std_logic_vector(9 downto 0);
      Clk_CI  : in  std_logic;
      Rst_RBI : in  std_logic;
      En_SI   : in  std_logic;
      Freq_DO : out std_logic;
      FreqReal : out real
      );
  end component;

  component umcL65_LL_FLL_digital
    port (
      DITH   : out std_logic;
      DITHB  : out std_logic;
      DCOCLK : in  std_logic;
      FLLCLK : out std_logic;
      FLLOE  : in  std_logic;
      DCOD   : out std_logic_vector(9 downto 0);
      DCODB  : out std_logic_vector(9 downto 0);
      DCOEN  : out std_logic;
      REFCLK : in  std_logic;
      LOCK   : out std_logic;
      CFGREQ : in  std_logic;
      CFGACK : out std_logic;
      CFGAD  : in  std_logic_vector(1 downto 0);
      CFGD   : in  std_logic_vector(31 downto 0);
      CFGQ   : out std_logic_vector(31 downto 0);
      CFGWEB : in  std_logic;
      RSTB   : in  std_logic;
      PWDB   : in  std_logic;
      TM     : in  std_logic;
      TE     : in  std_logic;
      TD     : in  std_logic;
      TQ     : out std_logic);
  end component;
  
begin

-- synopsys translate_off
  
  i_DCO : umcL65_LL_DCO_behavioral
    port map (
      Din_DI  => DCO_D,
      Clk_CI  => REFCLK,
      Rst_RBI => RSTB,
      En_SI   => DCOEn_S,
      Freq_DO => DCOClk_C,
      FreqReal => FreqReal
      );


  i_umcL65_LL_FLL_digital: umcL65_LL_FLL_digital
    port map (
      DITH   => open,
      DITHB  => open,
      DCOCLK => DCOClk_C,
      FLLCLK => FLLCLK,
      FLLOE  => FLLOE,
      DCOD   => DCO_D,
      DCODB  => open,
      DCOEN  => DCOEn_S,
      REFCLK => REFCLK,
      LOCK   => LOCK,
      CFGREQ => CFGREQ,
      CFGACK => CFGACK,
      CFGAD  => CFGAD,
      CFGD   => CFGD,
      CFGQ   => CFGQ,
      CFGWEB => CFGWEB,
      RSTB   => RSTB,
      PWDB   => PWDB,
      TM     => TM,
      TE     => TE,
      TD     => TD,
      TQ     => TQ
      );

-- synopsys translate_on
  
end behavioral;

