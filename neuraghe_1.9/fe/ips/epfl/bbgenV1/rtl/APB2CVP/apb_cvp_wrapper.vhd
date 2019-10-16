library ieee;
use ieee.std_logic_1164.all;

entity apb_cvb_wrapper is
  generic (
    APB_ADDR_WIDTH : integer := 12);

  port (
    HCLK    : in  std_logic;
    HRESETn : in  std_logic;
    PADDR   : in  std_logic_vector(APB_ADDR_WIDTH - 1 downto 0);
    PWDATA  : in  std_logic_vector(31 downto 0);
    PWRITE  : in  std_logic;
    PSEL    : in  std_logic;
    PENABLE : in  std_logic;
    PRDATA  : out std_logic_vector(31 downto 0);
    PREADY  : out std_logic;
    PSLVERR : out std_logic;

    cvp1_pwr_req    : out std_logic;
    cvp1_pwr_wr_rd  : out std_logic;
    cvp1_pwr_add    : out std_logic_vector(28 downto 0);
    cvp1_pwr_be     : out std_logic_vector(7 downto 0);
    cvp1_pwr_data   : out std_logic_vector(63 downto 0);
    cvp1_pwr_ack    : in  std_logic;
    cvp1_pwr_error  : in  std_logic;
    cvp1_pwr_r_data : in  std_logic_vector(63 downto 0);
    cvp2_pwr_req    : out std_logic;
    cvp2_pwr_wr_rd  : out std_logic;
    cvp2_pwr_add    : out std_logic_vector(28 downto 0);
    cvp2_pwr_be     : out std_logic_vector(7 downto 0);
    cvp2_pwr_data   : out std_logic_vector(63 downto 0);
    cvp2_pwr_ack    : in  std_logic;
    cvp2_pwr_error  : in  std_logic;
    cvp2_pwr_r_data : in  std_logic_vector(63 downto 0)
    );
end entity apb_cvb_wrapper;

architecture behavioral of apb_cvb_wrapper is

  component apb_cvp_if
    generic(
      APB_ADDR_WIDTH : integer := 12
      );
    port(
      HCLK            : in  std_logic;
      HRESETn         : in  std_logic;
      PADDR           : in  std_logic_vector;
      PWDATA          : in  std_logic_vector(31 downto 0);
      PWRITE          : in  std_logic;
      PSEL            : in  std_logic;
      PENABLE         : in  std_logic;
      PRDATA          : out std_logic_vector(31 downto 0);
      PREADY          : out std_logic;
      PSLVERR         : out std_logic;
      cvp1_pwr_req    : out std_logic;
      cvp1_pwr_wr_rd  : out std_logic;
      cvp1_pwr_add    : out std_logic_vector(28 downto 0);
      cvp1_pwr_be     : out std_logic_vector(7 downto 0);
      cvp1_pwr_data   : out std_logic_vector(63 downto 0);
      cvp1_pwr_ack    : in  std_logic;
      cvp1_pwr_error  : in  std_logic;
      cvp1_pwr_r_data : in  std_logic_vector(63 downto 0);
      cvp2_pwr_req    : out std_logic;
      cvp2_pwr_wr_rd  : out std_logic;
      cvp2_pwr_add    : out std_logic_vector(28 downto 0);
      cvp2_pwr_be     : out std_logic_vector(7 downto 0);
      cvp2_pwr_data   : out std_logic_vector(63 downto 0);
      cvp2_pwr_ack    : in  std_logic;
      cvp2_pwr_error  : in  std_logic;
      cvp2_pwr_r_data : in  std_logic_vector(63 downto 0)
      );
  end component;

begin  -- architecture behavioral
  apb_cvp_if_1 : apb_cvp_if
    generic map (
      APB_ADDR_WIDTH => 12)
    port map (
      HCLK            => HCLK,
      HRESETn         => HRESETn,
      PADDR           => PADDR,
      PWDATA          => PWDATA,
      PWRITE          => PWRITE,
      PSEL            => PSEL,
      PENABLE         => PENABLE,
      PRDATA          => PRDATA,
      PREADY          => PREADY,
      PSLVERR         => PSLVERR,
      cvp1_pwr_req    => cvp1_pwr_req,
      cvp1_pwr_wr_rd  => cvp1_pwr_wr_rd,
      cvp1_pwr_add    => cvp1_pwr_add,
      cvp1_pwr_be     => cvp1_pwr_be,
      cvp1_pwr_data   => cvp1_pwr_data,
      cvp1_pwr_ack    => cvp1_pwr_ack,
      cvp1_pwr_error  => cvp1_pwr_error,
      cvp1_pwr_r_data => cvp1_pwr_r_data,
      cvp2_pwr_req    => cvp2_pwr_req,
      cvp2_pwr_wr_rd  => cvp2_pwr_wr_rd,
      cvp2_pwr_add    => cvp2_pwr_add,
      cvp2_pwr_be     => cvp2_pwr_be,
      cvp2_pwr_data   => cvp2_pwr_data,
      cvp2_pwr_ack    => cvp2_pwr_ack,
      cvp2_pwr_error  => cvp2_pwr_error,
      cvp2_pwr_r_data => cvp2_pwr_r_data);




end architecture behavioral;
