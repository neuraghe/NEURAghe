library ieee;
use ieee.std_logic_1164.all;

entity COMBINEDANALOG is
  
  port (
    driver_charge_clk         : in  std_logic;
    monitor_nwell_LB          : in  std_logic_vector(4 downto 0);
    monitor_nwell_UB          : in  std_logic_vector(4 downto 0);
    monitor_pwell_LB          : in  std_logic_vector(4 downto 0);
    monitor_pwell_UB          : in  std_logic_vector(4 downto 0);
    m_neg_pwell_clk           : in  std_logic;
    m_pos_pwell_clk           : in  std_logic;
    m_nwell_clk               : in  std_logic;
--    sample_nwell_clk          : in  std_logic;
--    sample_pwell_neg_clk      : in  std_logic;
--    sample_pwell_pos_clk      : in  std_logic;
    sel_nwell                 : in  std_logic_vector(1 downto 0);
    sel_pwell                 : in  std_logic_vector(1 downto 0);
    monitor_comp_neg_pwell_LB : out std_logic;
    monitor_comp_neg_pwell_UB : out std_logic;
    monitor_comp_nwell_LB     : out std_logic;
    monitor_comp_nwell_UB     : out std_logic;
    monitor_comp_pos_pwell_LB : out std_logic;
    monitor_comp_pos_pwell_UB : out std_logic);

end entity COMBINEDANALOG;

architecture behavioral of COMBINEDANALOG is

begin  -- behavioral

  monitor_comp_pos_pwell_UB <= '0';
  monitor_comp_pos_pwell_LB <= '0';
  monitor_comp_neg_pwell_UB <= '0';
  monitor_comp_neg_pwell_LB <= '0';
  monitor_comp_nwell_UB     <= '0';
  monitor_comp_nwell_LB     <= '0';

  
end behavioral;
