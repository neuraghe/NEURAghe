-------------------------------------------------------------------------------
-- Title      : utilities for the dz/iis testbanch
-- Project    : testbench
-------------------------------------------------------------------------------
-- File       : tb_util.vhd
-- Author     : Beat Muheim  <muheim@ee.ethz.ch>
-- Company    : Integrated Systems Laboratory, ETH Zurich
-- Created    : 2012-02-26
-- Last update: 2014-02-26
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: A collection of universal types and subprograms that
--              care of all those lower-level issues of the testbench,
--              not intended for synthesis.
--              By universal we mean independent of the model under test (MUT).
-------------------------------------------------------------------------------
-- Copyright (c) 2012 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author	Description
-- 2012-02-26  1.0      muheim	Created out of the different simulstuff versions.
-- 2012-04-14  1.1      kgf     Added a small command line output to SimRepSummary
-------------------------------------------------------------------------------

use std.textio.all;
library ieee;
use ieee.std_logic_textio.all;  -- read and write overloaded for std_logic
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.Uniform;     -- IEEE 1076.2 real math package
use ieee.math_real.Trunc;
-------------------------------------------------------------------------------

-- package declaration
package tb_util is
  
  -- signal to broadcast the end of simulation
  signal EndOfSim_S : boolean := false;
  -- clock generator     
  procedure ClockGenerator (
     signal Clk_C          : out std_logic;
     constant clkphaselow  : in  time;
     constant clkphasehigh : in  time);  

  -- support for file handling
  function FileOpenMessage (
     filename : string; status : file_open_status)
     return string;
  function FileReadMessage (
     filename : string; read_ok : boolean; lineread : string)
     return string;

  -- purpose: get one entry from the stimuli or expected responses file
  -- binary character => std_logic
  procedure GetFileEntry (
     fileentry            : inout std_logic;
     in_line, in_line_tmp : inout line; filename : string);
  -- binary string => std_logic_vector
  procedure GetFileEntry (
     fileentry            : inout std_logic_vector;
     in_line, in_line_tmp : inout line; filename : string);
  -- binary string => unsigned
  procedure GetFileEntry (
     val                  : inout unsigned;
     in_line, in_line_tmp : inout line; filename : string);
  -- binary string => signed
  procedure GetFileEntry (
     val                  : inout signed;
     in_line, in_line_tmp : inout line; filename : string);
  -- unsigned integer string => unsigned
  procedure GetFileEntryInt2x (
     val                  : inout unsigned;
     in_line, in_line_tmp : inout line; filename : string);
  -- signed/unsigned integer string => signed
  procedure GetFileEntryInt2x (
     val                  : inout signed;
     in_line, in_line_tmp : inout line; filename : string);
  -- signed/unsigned integer string => (signed =>) std_logic_vector
  procedure GetFileEntryInt2x (
     val                  : inout std_logic_vector;
     in_line, in_line_tmp : inout line; filename : string);
  -- unsigned integer string => (unsigned =>) std_logic_vector
  procedure GetFileEntryUInt2x (
     val                  : inout std_logic_vector;
     in_line, in_line_tmp : inout line; filename : string);

  -- support for evaluating responses from the MUT
  type respmatchtype is (
     mne,   -- not evaluated = expected response has the value "don't care"
     mok,   -- o.k. = both logic value and drive strength do match
     mlf,   -- logic fail = logic value or tristate status does not match
     msf,   -- strength fail = weak instead of strong drive or viceversa
     mil);  -- illegal response = actual response has value "don't care"
  
  type vectorwise_matchtable
     is array (respmatchtype, respmatchtype) of respmatchtype;
  constant check_vectorwise : vectorwise_matchtable := (
     --     ---------------------------------------
     --     | mne  mok  mlf  msf  mil       |     |   
     --     ---------------------------------------
            ( mne, mok, mlf, msf, mil ), -- | mne |
            ( mok, mok, mlf, msf, mil ), -- | mok |
            ( mlf, mlf, mlf, mlf, mil ), -- | mlf |
            ( msf, msf, mlf, msf, mil ), -- | msf |
            ( mil, mil, mil, mil, mil )  -- | mil |
            );   -- symmetric, dimensions may be interchanged
  
  type respaccounttype is record
     numberof_mch,  -- number of responses checked so far
     numberof_mne,  -- see above for this and all other fields  
     numberof_mok,
     numberof_mlf,
     numberof_msf,
     numberof_mil : natural;
  end record;

  -- checks if actual and expected response are equal
  procedure CheckValue (
     actresp, expresp : in    std_logic_vector;
     respmatch        : out   respmatchtype;
     respaccount      : inout respaccounttype);
  procedure CheckValue (
     actresp, expresp : in    std_logic;
     respmatch        : out   respmatchtype;
     respaccount      : inout respaccounttype);
  procedure CheckValue (
     actresp, expresp : in    unsigned;
     respmatch        : out   respmatchtype;
     respaccount      : inout respaccounttype);
  procedure CheckValue (
     actresp, expresp : in    signed;
     respmatch        : out   respmatchtype;
     respaccount      : inout respaccounttype);

  -- purpose: summarize simulation report and write it to report file
  procedure PutSimulationReportSummary
     (file simreptfile : text; respaccount : in respaccounttype);

  -- purpose: overload write for signed and unsigned
  procedure write (outline : inout line; val : in unsigned);
  procedure write (outline : inout line; val : in signed);
  -- mode determines output format: binary (0) or hexadecimal (1) for log files
  procedure write (outline : inout line; val : in std_logic_vector; mode : in natural);
  procedure write (outline : inout line; val : in signed; mode : in natural);
  procedure write (outline : inout line; val : in unsigned; mode : in natural);
  procedure write (outline : inout line; val : in std_logic; mode : in natural);

  -- integer to string conversion (for command line output)
  function to_string (val : integer) return string;
  function to_string (val : time) return string;
  function to_string (val : unsigned) return string;
  function to_string (val : signed) return string;

  -- support for generation of random test patterns
  procedure GenerateRandomVector (
     randvectwidth        : in    natural;
     statevar1, statevar2 : inout integer;
     randvect             : out   std_logic_vector);  -- unconstrained array type
  procedure GenerateRandomBit (
     probability_of_1     : in    real;
     statevar1, statevar2 : inout integer;
     randbit              : out   std_logic);
  procedure GenerateRandomInteger (
     min, max             : in    integer;
     statevar1, statevar2 : inout integer;
     randinteger          : out   integer);

  -- compose a failure message line and write it to the report file
  -- mode determines output format: binary (0) or hexadecimal (1) for log files
  procedure PutSimulationReportFailure
    (file simreptfile :    text;
     failuretxt       : in string;
     expresp          : in std_logic_vector;
     respmatch        : in respmatchtype;
     mode             : in natural);
  procedure PutSimulationReportFailure
    (file simreptfile :    text;
     failuretxt       : in string;
     expresp          : in std_logic;
     respmatch        : in respmatchtype;
     mode             : in natural);
  procedure PutSimulationReportFailure
    (file simreptfile :    text;
     failuretxt       : in string;
     expresp          : in unsigned;
     respmatch        : in respmatchtype;
     mode             : in natural);
  procedure PutSimulationReportFailure
    (file simreptfile :    text;
     failuretxt       : in string;
     expresp          : in signed;
     respmatch        : in respmatchtype;
     mode             : in natural);

end package tb_util;
--=============================================================================

-- package body
package body tb_util is

  -- internal function to get # bits required for proper hex data read-in
  -- e.g. dw=13 -> dwhex=16   or   dw=16 -> dwhex=16
  function f_hexceil (dw : natural) return natural is
    variable tmp   : real;
    variable dwhex : natural;
  begin
    tmp   := 4.0 * Trunc( real(dw-1) / 4.0 ) + 4.0;
    dwhex := integer(tmp);
    -- for debugging:
    -- report "DW=" & to_string(dw) & " DWHEX=" & to_string(dwhex) severity note;
    return dwhex;
  end f_hexceil;

  -- internal function to convert non-hex-aligned signals to hex-aligned signals (for hex
  -- printout)
  function f_hexconvert (In_D : std_logic_vector) return std_logic_vector is
    constant DW    : natural := In_D'length;    -- input width
    constant DWHEX : natural := f_hexceil(DW);  -- hex compatible width, e.g. 12,16,...
    variable Out_V : std_logic_vector(DWHEX-1 downto 0) := (others => '0');
  begin
    Out_V(DW-1 downto 0) := In_D;
    return Out_V;
  end f_hexconvert;
  -----------------------------------------------------------------------------
   
   -- purpose: generate a periodic but stoppable clock signal,
   -- generator to be instantiated as a concurrent procedure.
   procedure ClockGenerator
      (signal Clk_C          : out std_logic;
       constant clkphaselow  : in  time;
       constant clkphasehigh : in  time)
   is
   begin
      ClkGen : loop
         Clk_C <= '1';
         wait for clkphasehigh;
         Clk_C <= '0';
         wait for clkphaselow;
         exit ClkGen when EndOfSim_S = true;
      end loop ClkGen;
      wait;                             -- forever
   end procedure ClockGenerator;
-------------------------------------------------------------------------------

   -- purpose: translate file open status into a human-readable text string.
   function FileOpenMessage (filename : string; status : file_open_status)
      return string is
   begin
      case status is
         when open_ok => return "File "& filename &" opened successfully.";
         when status_error => return "File "& filename &" already opened.";
         when name_error => return
            "File "& filename &" does not exist or can not be created.";
         when mode_error => return
            "File "& filename &" can not be opened in write or append mode.";
      end case;
   end FileOpenMessage;

   -- purpose: translate file read status into a human-readable text string.
   function FileReadMessage (filename : string; read_ok : boolean; lineread : string)
      return string is
   begin
      if read_ok = true then
         return "Line `"& lineread &"' sucessfully read from file "
            & filename &".";
      else
         return "Missing or unsuitable entry found while reading line `"
            & lineread &"' from file "& filename &".";
      end if;
   end FileReadMessage;
-------------------------------------------------------------------------------
   
   -- ### binary character => std_logic
   -- purpose: get one entry from the stimuli or expected responses file
   -- source (file entry) : binary
   -- target (VHDL signal): std_logic
   procedure GetFileEntry (
      fileentry            : inout std_logic;
      in_line, in_line_tmp : inout line;
      filename             :       string)
   is
      variable read_ok : boolean;
   begin
      -- extract next entry to obtain the value of formal variable fileentry
      read(in_line, fileentry, read_ok);  -- binary read
      if not read_ok then
         report FileReadMessage(filename, read_ok, in_line_tmp.all) severity error;
      end if;
   end GetFileEntry;

   -- ### binary string => std_logic_vector
   -- purpose: get one entry from the stimuli or expected responses file
   -- source (file entry) : binary
   -- target (VHDL signal): std_logic_vector
   procedure GetFileEntry (
      fileentry            : inout std_logic_vector;
      in_line, in_line_tmp : inout line;
      filename             :       string)
   is
      variable read_ok : boolean;
   begin
      -- extract next entry to obtain the value of formal variable fileentry
      read(in_line, fileentry, read_ok);      -- binary read
      if not read_ok then
         hread(in_line, fileentry, read_ok);  -- try hex-read
         if not read_ok then
            report FileReadMessage(filename, read_ok, in_line_tmp.all) severity error;
         end if;
      end if;
   end GetFileEntry;

   -- ### binary string => unsigned
   -- purpose: get one entry from the stimuli or expected responses file
   -- source (file entry) : binary
   -- target (VHDL signal): unsigned
   procedure GetFileEntry (
      val                  : inout unsigned;
      in_line, in_line_tmp : inout line;
      filename             :       string)
   is
      variable read_ok   : boolean;
      variable fileentry : std_logic_vector(val'high downto val'low);
   begin
      -- extract next entry to obtain the value of formal variable fileentry
      read(in_line, fileentry, read_ok);      -- binary read
      if not read_ok then
         hread(in_line, fileentry, read_ok);  -- try hex-read
         if not read_ok then
            report FileReadMessage(filename, read_ok, in_line_tmp.all) severity error;
         end if;
      end if;
      val := unsigned(fileentry);
   end GetFileEntry;

   -- ### binary string => signed
   -- purpose: get one entry from the stimuli or expected responses file
   -- source (file entry) : binary
   -- target (VHDL signal): signed
   procedure GetFileEntry (
      val                  : inout signed;
      in_line, in_line_tmp : inout line;
      filename             :       string)
   is
      variable read_ok   : boolean;
      variable fileentry : std_logic_vector(val'high downto val'low);
   begin
      -- extract next entry to obtain the value of formal variable fileentry
      read(in_line, fileentry, read_ok);      -- binary read
      if not read_ok then
         hread(in_line, fileentry, read_ok);  -- try hex-read
         if not read_ok then
            report FileReadMessage(filename, read_ok, in_line_tmp.all) severity error;
         end if;
      end if;
      val := signed(fileentry);
   end GetFileEntry;
   
   -- ### unsigned integer string => unsigned
   -- purpose: get one entry from the stimuli or expected responses file
   -- source (file entry) : unsigned integer
   -- target (VHDL signal): unsigned
   procedure GetFileEntryInt2x (
      val                  : inout unsigned;
      in_line, in_line_tmp : inout line;
      filename             :       string)
   is
      variable read_ok   : boolean;
      variable fileentry : integer;
   begin
      -- extract next entry to obtain the value of formal variable fileentry
      read(in_line, fileentry, read_ok);
      if not read_ok then
         report FileReadMessage(filename, read_ok, in_line_tmp.all) severity error;
      end if;
      val := to_unsigned(fileentry, val'length);
   end GetFileEntryInt2x;

   -- ### signed/unsigned integer string => signed
   -- purpose: get one entry from the stimuli or expected responses file
   -- source (file entry) : signed/unsigned integer
   -- target (VHDL signal): signed
   procedure GetFileEntryInt2x (
      val                  : inout signed;
      in_line, in_line_tmp : inout line;
      filename             :       string)
   is
      variable read_ok   : boolean;
      variable fileentry : integer;
   begin
      -- extract next entry to obtain the value of formal variable fileentry
      read(in_line, fileentry, read_ok);
      if not read_ok then
         report FileReadMessage(filename, read_ok, in_line_tmp.all) severity error;
      end if;
      val := to_signed(fileentry, val'length);
   end GetFileEntryInt2x;

   -- ### signed/unsigned integer string => (signed =>) std_logic_vector
   -- purpose: get one entry from the stimuli or expected responses file
   -- source (file entry) : signed/unsigned integer
   -- target (VHDL signal): (signed) std_logic_vector
   procedure GetFileEntryInt2x (
      val                  : inout std_logic_vector;
      in_line, in_line_tmp : inout line;
      filename             :       string)
   is
      variable tmp_signed : signed(1 to val'length);
   begin
      -- use overloaded procedure
      GetFileEntryInt2x(tmp_signed, in_line, in_line_tmp, filename);
      val := std_logic_vector(tmp_signed);
   end GetFileEntryInt2x;

   -- ### unsigned integer string => (unsigned =>) std_logic_vector
   -- purpose: get one entry from the stimuli or expected responses file
   -- source (file entry) : unsigned integer
   -- target (VHDL signal): (unsigned) std_logic_vector
   procedure GetFileEntryUInt2x (
      val                  : inout std_logic_vector;
      in_line, in_line_tmp : inout line;
      filename             :       string)
   is
      variable tmp_unsigned : unsigned(1 to val'length);
   begin
      -- use overloaded procedure
      GetFileEntryInt2x(tmp_unsigned, in_line, in_line_tmp, filename);
      val := std_logic_vector(tmp_unsigned);
   end GetFileEntryUInt2x;
-------------------------------------------------------------------------------

   -- purpose: check to what extent actual and expected responses match,
   --    return a grade and update failure account record accordingly.
   procedure CheckValue (
      actresp, expresp : in    std_logic_vector;
      respmatch        : out   respmatchtype;
      respaccount      : inout respaccounttype)
   is
      type bitwise_matchtable is array (std_logic, std_logic) of respmatchtype;
      constant check_bitwise : bitwise_matchtable := (
      --     ---------------------------------------------------------
      -- exp |  U    X    0    1    Z    W    L    H    -        |act|  
      --     ---------------------------------------------------------
             ( mok, mlf, mlf, mlf, mlf, mlf, mlf, mlf, mne ), -- | U |
             ( mlf, mok, mlf, mlf, mlf, msf, mlf, mlf, mne ), -- | X |
             ( mlf, mlf, mok, mlf, mlf, mlf, msf, mlf, mne ), -- | 0 |
             ( mlf, mlf, mlf, mok, mlf, mlf, mlf, msf, mne ), -- | 1 |
             ( mlf, mlf, mlf, mlf, mok, mlf, mlf, mlf, mne ), -- | Z |
             ( mlf, msf, mlf, mlf, mlf, mok, mlf, mlf, mne ), -- | W |
             ( mlf, mlf, msf, mlf, mlf, mlf, mok, mlf, mne ), -- | L |
             ( mlf, mlf, mlf, msf, mlf, mlf, mlf, mok, mne ), -- | H |
             ( mil, mil, mil, mil, mil, mil, mil, mil, mil )  -- | - |
             );   -- act is the 1st and exp the 2nd dimension

      variable bitwise_match, vectorwise_match : respmatchtype := mne;
   begin
      assert expresp'length = actresp'length and expresp'length > 0
         report " Cardinality of response does not match or is zero."
         severity warning;
      for i in expresp'range loop
         bitwise_match    := check_bitwise(actresp(i), expresp(i));
         vectorwise_match := check_vectorwise(vectorwise_match, bitwise_match);
      end loop;
      respmatch := vectorwise_match;
      case vectorwise_match is
         when mne => respaccount.numberof_mne := respaccount.numberof_mne + 1;
         when mok => respaccount.numberof_mok := respaccount.numberof_mok + 1;
         when mlf => respaccount.numberof_mlf := respaccount.numberof_mlf + 1;
         when msf => respaccount.numberof_msf := respaccount.numberof_msf + 1;
         when mil => respaccount.numberof_mil := respaccount.numberof_mil + 1;
      end case;
      respaccount.numberof_mch := respaccount.numberof_mch + 1;
   end CheckValue;
   
   -- purpose: above procedure overloaded for scalars rather than vectors.
   procedure CheckValue (
      actresp, expresp : in    std_logic;
      respmatch        : out   respmatchtype;
      respaccount      : inout respaccounttype)
   is
      variable actrespvector, exprespvector : std_logic_vector(0 to 0);
   begin
      actrespvector(0) := actresp; exprespvector(0) := expresp;
      CheckValue(actrespvector, exprespvector, respmatch, respaccount);
   end CheckValue;

   -- purpose: above procedure overloaded for unsigned rather than std_logic_vector
   procedure CheckValue (
      actresp, expresp : in    unsigned;
      respmatch        : out   respmatchtype;
      respaccount      : inout respaccounttype)
   is
      variable actrespvector, exprespvector : std_logic_vector(actresp'high downto actresp'low);
   begin
      actrespvector := std_logic_vector(actresp);
      exprespvector := std_logic_vector(expresp);
      CheckValue(actrespvector, exprespvector, respmatch, respaccount);
   end CheckValue;

   -- purpose: above procedure overloaded for signed rather than std_logic_vector
   procedure CheckValue (
      actresp, expresp : in    signed;
      respmatch        : out   respmatchtype;
      respaccount      : inout respaccounttype)
   is
      variable actrespvector, exprespvector : std_logic_vector(actresp'high downto actresp'low);
   begin
      actrespvector := std_logic_vector(actresp);
      exprespvector := std_logic_vector(expresp);
      CheckValue(actrespvector, exprespvector, respmatch, respaccount);
   end CheckValue;
-------------------------------------------------------------------------------

   -- purpose: summarize simulation report and write it to report file.
   procedure PutSimulationReportSummary
      (file simreptfile : text; respaccount : in respaccounttype)
   is
      variable out_line : line;
   begin

      -- the following is written to the simreptfile
      write(out_line, string'(" "));
      writeline(simreptfile, out_line);
      write(out_line, string'("====== Simulation Report Summary ==============================="));
      writeline(simreptfile, out_line);
      write(out_line, string'(" Total of responses: "));
      write(out_line, respaccount.numberof_mch);
      writeline(simreptfile, out_line);
      write(out_line, string'(" "));
      writeline(simreptfile, out_line);
      write(out_line, string'(" "));
      write(out_line, respaccount.numberof_mch - respaccount.numberof_mne);
      write(out_line, string'(" responses have been checked, out of which"));
      writeline(simreptfile, out_line);
      write(out_line, string'("   "));
      write(out_line, respaccount.numberof_mok);
      write(out_line, string'(" matched expectations"));
      writeline(simreptfile, out_line);
      write(out_line, string'("   "));
      write(out_line, respaccount.numberof_mlf + respaccount.numberof_msf + respaccount.numberof_mil);
      write(out_line, string'(" didn't match expectations"));
      writeline(simreptfile, out_line);
      write(out_line, string'("      "));
      write(out_line, respaccount.numberof_mlf);
      write(out_line, string'(" responses failed logically (those with a 'l')"));
      writeline(simreptfile, out_line);
      write(out_line, string'("      "));
      write(out_line, respaccount.numberof_msf);
      write(out_line, string'(" failed in drive strength (those with a 's')"));
      writeline(simreptfile, out_line);
      write(out_line, string'("      "));
      write(out_line, respaccount.numberof_mil);
      write(out_line, string'(" had an illegal logic value (those with a 'i')"));
      writeline(simreptfile, out_line);
      write(out_line, string'(" "));
      writeline(simreptfile, out_line);
      write(out_line, string'(" "));
      write(out_line, respaccount.numberof_mne);
      write(out_line, string'(" responses haven't been checked (those with a '-'), because"));
      writeline(simreptfile, out_line);
      write(out_line, string'(" "));
      write(out_line, string'("expected responses are unavailable or given as "&'"'&"don't care"&'"'&"."));
      writeline(simreptfile, out_line);

      -- write a small summary to the console as well
      write(out_line, string'("Simulation complete; checked "));
      write(out_line, respaccount.numberof_mch - respaccount.numberof_mne);
      write(out_line, string'(" responses, "));
      
      if (respaccount.numberof_mch - respaccount.numberof_mne) /= respaccount.numberof_mok then
        write(out_line, respaccount.numberof_mlf + respaccount.numberof_msf + respaccount.numberof_mil);
        write(out_line, string'(" ERROR(s), see simulation report"));
      else
        write(out_line, string'("all OK"));
      end if;
      writeline(output, out_line);
   end PutSimulationReportSummary;
-------------------------------------------------------------------------------

  -- purpose: overload write method for unsigned
  procedure write (outline : inout line; val : in unsigned) is
  begin
     write(outline, std_logic_vector(val));
  end write;

  -- purpose: overload write method for signed
  procedure write (outline : inout line; val : in signed) is
  begin
     write(outline, std_logic_vector(val));
  end write;

  -- purpose: define output format through 'mode'
  procedure write (outline : inout line; val : in std_logic_vector; mode : in natural) is
  begin
    case mode is
      when 0 =>
        write(outline, std_logic_vector(val));
      when 1 =>
        hwrite(outline, f_hexconvert(std_logic_vector(val)));
      when others =>
        report "Unsupported output mode: " & to_string(mode) severity error;
    end case;
  end write;

  -- purpose: overload write method to accept also signed
  procedure write (outline : inout line; val : in signed; mode : in natural) is
  begin
    write (outline, std_logic_vector(val), mode);
  end write;

  -- purpose: overload write method to accept also unsigned
  procedure write (outline : inout line; val : in unsigned; mode : in natural) is
  begin
    write (outline, std_logic_vector(val), mode);
  end write;
  
  -- purpose: overload write method to accept also std_logic (just for easy
  -- use, i.e. matter of completeness)
  procedure write (outline : inout line; val : in std_logic; mode : in natural) is
    variable tmp : std_logic_vector(3 downto 0) := "0000";
  begin
    tmp(0) := val;
    write (outline, std_logic_vector(tmp), mode);
  end write;

  -----------------------------------------------------------------------------

  -- integer to string conversion (for command line output)
  function to_string (val : integer)
    return string is
  begin
    return integer'image(val);
  end to_string;

  -- time to string conversion (for command line output)
  function to_string (val : time)
    return string is
  begin
    return time'image(val);
  end to_string;

  -- unsigned to string conversion (for command line output)
  function to_string (val : unsigned)
    return string is
  begin
    return to_string(integer'(to_integer(val)));
  end to_string;

  -- signed to string conversion (for command line output)
  function to_string (val : signed)
    return string is
  begin
    return to_string(integer'(to_integer(val)));
  end to_string;

-------------------------------------------------------------------------------

   -- purpose: generate binary random vectors of parametrized word width that 
   --    should be uniformly distributed over interval [0,2**randvectwidth-1].
   -- limitation: mantissa of VHDL type reals has 23bits, so randvectwidth 
   --    must not exceed this value as outcome is otherwise uncertain.
   -- note: state variables of procedure Uniform must be kept within the 
   --    calling process because variables in a subprogram do not persist.
   -- findings: repeated calls of procedure ieee.math_real.Uniform with
   --    identical seeds indeed result in identical pseudo random numbers.
   procedure GenerateRandomVector (
      randvectwidth        : in    natural;
      statevar1, statevar2 : inout integer;
      randvect             : out   std_logic_vector)  -- unconstrained array type
   is
      -- upperbound is (2.0**randvectwidth)-1.0, spreadbound is 1.0 more
      constant spreadbound            : real    := 2.0**randvectwidth;
      variable randreal01             : real    := 0.0;
      variable randscaled, randtruncd : real    := 0.0;
      variable randinteger            : integer := 0;
   begin
      -- obtain a random real in the open interval ]0,1[
      Uniform(statevar1, statevar2, randreal01);
      -- scale open interval ]0,1[ to open interval ]0,spreadbound[
      randscaled  := randreal01*spreadbound;
      -- truncate to next smaller integer (still of type real, though)
      -- in the closed interval [0,upperbound]
      randtruncd  := Trunc(randscaled);
      -- convert to a binary vector
      randinteger := integer(randtruncd);
      randvect    := std_logic_vector(to_unsigned(randinteger, randvectwidth));
   end GenerateRandomVector;

   -- purpose: generate a random bit with some given probability of being '1'.
   -- note: state variables of procedure Uniform must be kept within the 
   --    calling process because variables in a subprogram do not persist.
   -- findings: repeated calls of procedure ieee.math_real.Uniform with
   --    identical seeds indeed result in identical pseudo random numbers.
   procedure GenerateRandomBit (
      probability_of_1     : in    real;
      statevar1, statevar2 : inout integer;
      randbit              : out   std_logic) 
   is
      variable randreal01 : real := 0.0;
   begin
      -- obtain a random real in the open interval ]0,1[
      Uniform(statevar1, statevar2, randreal01);
      -- set randbit according to threshold
      if (probability_of_1 > randreal01) then
         randbit := '1';
      else
         randbit := '0';
      end if;
   end GenerateRandomBit;

   -- purpose: generate random integer in the range [min, max], both included.
   -- note: state variables of procedure Uniform must be kept within the 
   --    calling process because variables in a subprogram do not persist.
   -- findings: repeated calls of procedure ieee.math_real.Uniform with
   --    identical seeds indeed result in identical pseudo random numbers.
   procedure GenerateRandomInteger (
      min, max             : in    integer;
      statevar1, statevar2 : inout integer;
      randinteger          : out   integer)  
   is
      variable randreal01  : real := 0.0;
      constant spreadbound : real := real(max-min+1);
      variable randscaled  : real := 0.0;
   begin
      -- obtain a random real in the open interval ]0,1[
      Uniform(statevar1, statevar2, randreal01);
      -- scale open interval ]0,1[ to open interval ]0,spreadbound[
      randscaled  := randreal01*spreadbound;
      -- truncate to next smaller integer in the closed interval [0,max-min] and
      -- add the mininum value to get an integer in the closed interval [min,max]
      randinteger := integer(Trunc(randscaled)) + min;
   end GenerateRandomInteger;

-------------------------------------------------------------------------------
    
  -- purpose: compose a failure message line and write it to the report file.
   procedure PutSimulationReportFailure
    (file simreptfile :    text;
     failuretxt       : in string;
     expresp          : in std_logic_vector;
     respmatch        : in respmatchtype;
     mode             : in natural)
  is
    variable out_line : line;
  begin
    
    -- if at least one actual doesn't match with its expected response
    if (respmatch /= mok and respmatch /= mne) then

        write(out_line, string'("^^ Failure! "));

    case respmatch is
      when mok => null;
        -- if the actual response matches with the expected one, append nothing
      when mne => null;
        -- if there was no expected response for the actual one, append a '-' 
      when mlf =>
        -- if the actual response doesn't match logically, append an 'l'
        write(out_line, string'("( l ) "));
      when msf =>
        -- if the actual doesn't match in strength, append an 's'
        write(out_line, string'("( s ) "));                       
      when others =>  -- when mil
        -- if the actual response is "don't care", append an 'i'
        write(out_line, string'("( i ) "));  -- 
    end case;                   
      -- if actual response doesn't match with its expected response
       
        write(out_line, failuretxt);
        write(out_line, string'("Expected was : "));
        write(out_line, expresp, mode);

      writeline(simreptfile, out_line);
    end if;
  end PutSimulationReportFailure;

  -- purpose: above procedure overloaded for scalars rather than vectors.
  procedure PutSimulationReportFailure
    (file simreptfile :    text;
     failuretxt       : in string;
     expresp          : in std_logic;
     respmatch        : in respmatchtype;
     mode             : in natural)
  is
    variable exprespvector : std_logic_vector(0 to 0);
  begin
    exprespvector(0) := expresp;
    PutSimulationReportFailure(simreptfile, failuretxt, exprespvector, respmatch, mode);
    
  end PutSimulationReportFailure;

  -- purpose: above procedure overloaded for unsigned rather than std_logic_vector
  procedure PutSimulationReportFailure
    (file simreptfile :    text;
     failuretxt       : in string;
     expresp          : in unsigned;
     respmatch        : in respmatchtype;
     mode             : in natural)
  is
    variable exprespvector : std_logic_vector(expresp'high downto expresp'low);
  begin
    exprespvector := std_logic_vector(expresp);
    PutSimulationReportFailure(simreptfile, failuretxt, exprespvector, respmatch, mode);
    
  end PutSimulationReportFailure;

  -- purpose: above procedure overloaded for signed rather than std_logic_vector
  procedure PutSimulationReportFailure
    (file simreptfile :    text;
     failuretxt       : in string;
     expresp          : in signed;
     respmatch        : in respmatchtype;
     mode             : in natural)
  is
    variable exprespvector : std_logic_vector(expresp'high downto expresp'low);
  begin
    exprespvector := std_logic_vector(expresp);
    PutSimulationReportFailure(simreptfile, failuretxt, exprespvector, respmatch, mode);
    
  end PutSimulationReportFailure;

end package body tb_util;
