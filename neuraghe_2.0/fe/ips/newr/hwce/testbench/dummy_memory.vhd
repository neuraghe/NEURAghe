--!
--! @file dummy_memory.vhd
--! @brief Fake memory for testbench
--!
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
--! @par  Module owner:
--!       francesco.conti@st.com
--!
--! @par  Copyright (C) 2012 STMicroelectronics
--!
--! @par  Author: Francesco Conti
--!
--! @par  Id: $Id$
--! @par  Date: $Date$
--! @par  Revision: $Rev$
--!

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.math_real.all;
  use ieee.numeric_std.all;

library std;
  use std.textio.all;
  
entity dummy_memory is
  generic (
    N_HW_ACC_PORT : natural  := 4;
    FILE_NAME     : string   := "write.log";
    MEMORY        : boolean  := True;
    FIXED_PATTERN : boolean  := False;
    RANDOM_VALUES : boolean := False;
    BASE_ADDR     : natural := 0;
    MEM_SIZE      : natural := 4096;
    P_STALL       : real     := 0.1;
    C_SEED_1      : positive := 1;
    C_SEED_2      : positive := 1;
    C_SEED_3      : positive := 1;
    C_SEED_4      : positive := 1
  );
  port (
    clk   : in  std_logic;
    rst_n : in  std_logic;
    add   : in  std_logic_vector(N_HW_ACC_PORT*30-1 downto 0);
    be    : in  std_logic_vector(N_HW_ACC_PORT*4-1  downto 0);
    req   : in  std_logic_vector(N_HW_ACC_PORT-1    downto 0);
    din   : in  std_logic_vector(N_HW_ACC_PORT*32-1 downto 0);
    gnt   : out std_logic_vector(N_HW_ACC_PORT-1    downto 0);
    opc   : in  std_logic_vector(N_HW_ACC_PORT-1    downto 0);
    src_i : in  std_logic_vector(N_HW_ACC_PORT*2-1  downto 0);
    dout  : out std_logic_vector(N_HW_ACC_PORT*32-1 downto 0);
    err   : out std_logic_vector(N_HW_ACC_PORT*8-1  downto 0);
    valid : out std_logic_vector(N_HW_ACC_PORT-1    downto 0);
    src_o : out std_logic_vector(N_HW_ACC_PORT*2-1  downto 0);
    dump  : in  std_logic
  );    
end entity dummy_memory;

architecture RTL of dummy_memory is

  file log_file : text open write_mode is FILE_NAME;

  -- constant RANDOM_VALUES : boolean := True;
  -- constant BASE_ADDR : natural := 0;
  -- constant MEM_SIZE : natural := 64;
  
  signal gnt_s : std_logic_vector(N_HW_ACC_PORT-1 downto 0);
  signal count_s : natural := 0;
  --  signal realn0, real : real;

  type real_array is array(natural range <>) of real;
  type slv32_array is array(natural range <>) of std_logic_vector(32-1 downto 0);

  signal mem_s : slv32_array(0 to MEM_SIZE-1);
  signal realn : real_array(0 to N_HW_ACC_PORT-1);
  
  function hstr(slv: std_logic_vector) return string;
  function fix
    (arg_str : string;
     ret_len_c : natural := 10;
     fill_char_c : character := '0')
    return string;
  
  function fix
    (arg_str : string;
     ret_len_c : natural := 10;
     fill_char_c : character := '0')
    return string is
    variable ret_v : string (1 to ret_len_c);
    constant pad_len_c : integer := ret_len_c - arg_str'length;
    constant pad_c : string (1 to abs(pad_len_c))
      := (others => fill_char_c);
  begin
    if pad_len_c < 1 then
      ret_v := arg_str(ret_v'range);
    else
      ret_v := pad_c & arg_str;
    end if;
    return ret_v;
  end fix;

  constant MEM_INIT : slv32_array := (
    x"0000034b", x"00000062", x"0000000c", x"ffffffa3", x"00000030", x"0000003a", x"00000020", x"ffffffe9",
    x"ffffffdf", x"fffffffd", x"ffffffe2", x"00000000", x"0000001c", x"00000001", x"00000007", x"00000010",
    x"ffffff22", x"000000d6", x"fffffff0", x"ffffffe9", x"00000035", x"00000020", x"0000000b", x"00000020",
    x"000000e5", x"00000047", x"ffffffe5", x"fffffff3", x"00000006", x"00000015", x"ffffffed", x"ffffffdc",
    x"00000047", x"ffffffb4", x"ffffffed", x"00000025", x"fffffff2", x"ffffffca", x"00000005", x"00000008",
    x"ffffff9d", x"00000000", x"ffffffd1", x"00000025", x"00000013", x"ffffffd0", x"ffffffff", x"00000024",
    x"ffffffb1", x"0000000c", x"00000041", x"fffffff3", x"ffffffda", x"00000010", x"fffffff8", x"fffffff2",
    x"0000000c", x"000000b1", x"fffffffa", x"ffffffff", x"0000000d", x"fffffff9", x"0000000c", x"00000003"
  );

  -- converts a std_logic_vector into a hex string.
  function hstr(slv: std_logic_vector) return string is
    variable hexlen: integer;
    variable longslv : std_logic_vector(67 downto 0) := (others => '0');
    variable hex : string(1 to 16);
    variable fourbit : std_logic_vector(3 downto 0);
  begin
    hexlen := (slv'length)/4;
    if (slv'length) mod 4 /= 0 then
      hexlen := hexlen + 1;
    end if;
    longslv(slv'length-1 downto 0) := slv;
    for i in (hexlen -1) downto 0 loop
      fourbit := longslv(((i*4)+3) downto (i*4));
      case fourbit is
        when "0000" => hex(hexlen -I) := '0';
        when "0001" => hex(hexlen -I) := '1';
        when "0010" => hex(hexlen -I) := '2';
        when "0011" => hex(hexlen -I) := '3';
        when "0100" => hex(hexlen -I) := '4';
        when "0101" => hex(hexlen -I) := '5';
        when "0110" => hex(hexlen -I) := '6';
        when "0111" => hex(hexlen -I) := '7';
        when "1000" => hex(hexlen -I) := '8';
        when "1001" => hex(hexlen -I) := '9';
        when "1010" => hex(hexlen -I) := 'A';
        when "1011" => hex(hexlen -I) := 'B';
        when "1100" => hex(hexlen -I) := 'C';
        when "1101" => hex(hexlen -I) := 'D';
        when "1110" => hex(hexlen -I) := 'E';
        when "1111" => hex(hexlen -I) := 'F';
        when "ZZZZ" => hex(hexlen -I) := 'z';
        when "UUUU" => hex(hexlen -I) := 'u';
        when "XXXX" => hex(hexlen -I) := 'x';
        when others => hex(hexlen -I) := '?';
      end case;
    end loop;
    return hex(1 to hexlen);
  end hstr;

begin

  mem_memory_gen : if MEMORY=True and FIXED_PATTERN=False generate
    dummy_proc : process(clk, rst_n)
      variable rnd_r : real;
      variable rnd_s : std_logic_vector(31 downto 0);
      variable seed_1, seed_2 : positive;
      variable mem : slv32_array(0 to MEM_SIZE-1);
      variable l : line;
      variable count : natural;
    begin
      if rst_n='0' then
        count := 0;
        dout  <= (others => '0');
        err   <= (others => '0');
        valid <= (others => '0');
        src_o <= (others => '0');
        seed_1 := C_SEED_3;
        seed_2 := C_SEED_4;
      elsif rst_n'event and rst_n='1' then
        for i in 0 to MEM_SIZE-1 loop
          if RANDOM_VALUES then
            uniform(seed_1, seed_2, rnd_r);
            rnd_s := std_logic_vector(to_unsigned(integer(floor(rnd_r*256.0)),32));
            mem(i) := rnd_s;
          else
            mem(i) := x"0000" & std_logic_vector(to_unsigned(i,16)); --MEM_INIT(i);
          end if;
        end loop;
      elsif clk'event and clk='1' then
        mem_s <= mem(0 to MEM_SIZE-1);
        for i in 0 to N_HW_ACC_PORT-1 loop
          if req(i)='0' then
            dout  ((i+1)*32-1 downto i*32) <= (others => 'Z');
            err   ((i+1)*8-1  downto i*8 ) <= (others => '0');
            valid (i)                      <= '0';
            src_o ((i+1)*2-1  downto i*2 ) <= src_i((i+1)*2-1  downto i*2 );
          else
            if gnt_s(i)='1' and opc(i) = '0' then
              dout  ((i+1)*32-1 downto i*32) <= mem(to_integer(unsigned(add((i+1)*30-1 downto i*30)))- BASE_ADDR/4);
              err   ((i+1)*8-1  downto i*8 ) <= (others => '0');
              valid (i)                      <= gnt_s(i);
              src_o ((i+1)*2-1  downto i*2 ) <= src_i((i+1)*2-1  downto i*2 );
            elsif gnt_s(i)='1' and opc(i) = '1' then
              -- write(l, "Write 0x" & hstr(din((i+1)*32-1 downto i*32)) & " to address 0x" & hstr(add((i+1)*30-1 downto i*30) & "00"));
              -- writeline(log_file, l);
              mem(to_integer(unsigned(add((i+1)*30-1 downto i*30))) - BASE_ADDR/4):= din((i+1)*32-1 downto i*32);
              dout  ((i+1)*32-1 downto i*32) <= din((i+1)*32-1 downto i*32);
              err   ((i+1)*8-1  downto i*8 ) <= (others => '0');
              valid (i)                      <= '0';
              src_o ((i+1)*2-1  downto i*2 ) <= src_i((i+1)*2-1  downto i*2 );
            elsif gnt_s(i)='0' then
              dout  ((i+1)*32-1 downto i*32) <= (others => 'X');
              err   ((i+1)*8-1  downto i*8 ) <= (others => '0');
              valid (i)                      <= '0';
              src_o ((i+1)*2-1  downto i*2 ) <= src_i((i+1)*2-1  downto i*2 );
            else
              dout  ((i+1)*32-1 downto i*32) <= (others => 'Z');
              err   ((i+1)*8-1  downto i*8 ) <= (others => '0');
              valid (i)                      <= '0';
              src_o ((i+1)*2-1  downto i*2 ) <= src_i((i+1)*2-1  downto i*2 );
            end if;
          end if;
        end loop;
        if dump='1' then
          write(l, "Dump " & integer'image(count));
          writeline(log_file, l); 
          for i in 0 to MEM_SIZE-1 loop
            write(l, "M(" & hstr(std_logic_vector(to_unsigned(i,8))) & ") := 0x" & hstr(mem(i)));
            writeline(log_file, l);       
          end loop;
          count := count + 1;
          count_s <= count;
        end if;
      end if;
    end process dummy_proc;
  end generate mem_memory_gen;
  
  -- mem_random_gen : if MEMORY=False and FIXED_PATTERN=False generate
  --   dummy_proc : process(clk, rst_n)
  --     variable rnd_r : real;
  --     variable rnd_s : std_logic_vector(31 downto 0);
  --     variable seed_1, seed_2 : positive;
  --   begin
  --     if rst_n='0' then
  --       dout  <= (others => '0');
  --       err   <= (others => '0');
  --       valid <= '0';
  --       src_o <= (others => '0');
  --       seed_1 := C_SEED_3;
  --       seed_2 := C_SEED_4;
  --     elsif clk'event and clk='1' then
  --       if req='0' then
  --         dout  <= (others => 'Z');
  --         err   <= (others => '0');
  --         valid <= '0';
  --         src_o <= src_i;
  --       else
  --         if gnt_s='1' and opc = x"01" then
  --           uniform(seed_1, seed_2, rnd_r);
  --           realn1 <= rnd_r;
  --           rnd_s := std_logic_vector(to_unsigned(integer(floor(rnd_r*256.0)),32));
  --           dout  <= rnd_s;
  --           valid <= gnt_s;
  --           err   <= (others => '0');
  --           src_o <= src_i;
  --         elsif gnt_s='1' and opc = x"00" then
  --           dout  <= din;
  --           valid <= '0';
  --           err   <= (others => '0');
  --           src_o <= src_i;
  --           --write(l, "0x" & hstr(din));
  --           --writeline(log_file, l);
  --         elsif gnt_s='0' then
  --           dout  <= (others => 'X');
  --           err   <= (others => '0');
  --           valid <= '0';
  --           src_o <= src_i;
  --         else
  --           dout  <= (others => 'Z');
  --           err   <= (others => '0');
  --           valid <= '0';
  --           src_o <= src_i;
  --         end if;
  --       end if;
  --     end if;
  --   end process dummy_proc;
  -- end generate mem_random_gen;
  
  -- mem_fixed_gen : if FIXED_PATTERN=True generate
  --   dummy_proc : process(clk, rst_n)
  --     variable l     : line;
  --     variable count : natural;
  --   begin
  --     if rst_n='0' then
  --       dout  <= (others => '0');
  --       err   <= (others => '0');
  --       valid <= '0';
  --       src_o <= (others => '0');
  --       count := 0;
  --     elsif clk'event and clk='1' then
  --       if req='0' then
  --         dout  <= (others => 'Z');
  --         err   <= (others => '0');
  --         valid <= '0';
  --         src_o <= src_i;
  --       else
  --         if gnt_s='1' and opc = x"01" then
  --           dout  <= "00" & add;
  --           valid <= gnt_s;
  --           err   <= (others => '0');
  --           src_o <= src_i;
  --         elsif gnt_s='1' and opc = x"00" then
  --           dout  <= din;
  --           valid <= '0';
  --           err   <= (others => '0');
  --           src_o <= src_i;
  --           write(l, "0x" & hstr(din));
  --           writeline(log_file, l);
  --         elsif gnt_s='0' then
  --           dout  <= (others => 'X');
  --           err   <= (others => '0');
  --           valid <= '0';
  --           src_o <= src_i;
  --         else
  --           dout  <= (others => 'Z');
  --           err   <= (others => '0');
  --           valid <= '0';
  --           src_o <= src_i;
  --         end if;
  --       end if;
  --     end if;
  --   end process dummy_proc;
  -- end generate mem_fixed_gen;  

  gnt_proc : process(clk, rst_n)
    variable rnd_r : real; 
    variable seed_1, seed_2 : positive;
  begin
    if rst_n='0' then
      seed_1 := C_SEED_1;
      seed_2 := C_SEED_2;
    else
      if clk'event and clk='1' then
        for i in 0 to N_HW_ACC_PORT-1 loop
          uniform(seed_1, seed_2, rnd_r);
          realn(i) <= rnd_r;
        end loop;
      end if;
      -- if rnd_r > P_STALL then
      --   gnt_s <= req;
      -- else
      --   gnt_s <= '0';
      -- end if;
    end if;
  end process gnt_proc;

  grant_gen : for i in 0 to N_HW_ACC_PORT-1 generate
    gnt_s(i) <= req(i) when realn(i) > P_STALL else '0';  
    gnt  (i) <= gnt_s(i);
  end generate grant_gen;


  
               
end RTL;
