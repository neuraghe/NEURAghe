-------------------------------------------------------------------------------
-- Title      : configBusIP1
-- Project    : vivoSoC
-------------------------------------------------------------------------------
-- File       : configBusIP1.vhd
-- Author     : Giovanni Rovere <rovere@iis.ee.ethz.ch>
-- Company    : Integrated Systems Laboratory, ETH Zurich
-- Created    : 2014-10-31
-- Last update: 2014-11-06
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: The configuration decoder for the analog IP1
-------------------------------------------------------------------------------
-- Copyright (c) 2012 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-11-03  1.0      rovere Created
-------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity configIP1 is
  
  port (
    dataBus_DI : in std_logic_vector(13 downto 0);
    offsetBus_DI : in std_logic_vector(1 downto 0);
    enableConfig_SI : in std_logic;

    chEnable_DO : out std_logic;
    gainSelCh_DO : out std_logic_vector(5 downto 0);
    deoDacCh_DO : out std_logic_vector(13 downto 0);
    paoDacCh_DO : out std_logic_vector(9 downto 0));
    
end configIP1; 

architecture rtl of configIP1 is

  -----------------------------------------------------------------------------
  -- Signals
  -----------------------------------------------------------------------------

signal trigger : std_logic_vector(3 downto 0);


  begin                                  
    
    p_trigger : process (enableConfig_SI, offsetBus_DI)
    begin  -- process

      for k in 0 to 3 loop

        if enableConfig_SI = '1' and to_integer(unsigned(offsetBus_DI)) = k then
          trigger(k) <= '1';
        else
          trigger(k) <= '0';
        end if;

      end loop;

    end process;                           
    

    p_latches : process (trigger, dataBus_DI)
    begin  -- process

      for k  in 0 to 3 loop
        if trigger(k) = '1' then
           case k is
             when 0 =>
               chEnable_DO <= dataBus_DI(0);
             when 1 =>
               gainSelCh_DO <= dataBus_DI(5 downto 0);
             when 2 =>
               deoDacCh_DO <= dataBus_DI(13 downto 0);
             when 3 =>
               paoDacCh_DO <= dataBus_DI(9 downto 0);
             when others => null;
           end case;
          
        end if;
      end loop;  -- k
     
    end process;

    
end rtl;
