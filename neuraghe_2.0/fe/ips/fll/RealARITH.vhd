-------------------------------------------------------------------------------
-- Title      : Real Arithmetic Library
-- Project    : 
-------------------------------------------------------------------------------
-- File       : RealARITH.vhd
-- Author     : Andreas P. Burg (apburg@iis.ee.ethz.ch)
-- Company    : Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Description: This package contains a set of functions and types to work to
-- carry out arithmetic operations on real numbers that are not normally
-- covered by VHDL standard packages
-- Functions are beased on functions of the VHDLTools package
-------------------------------------------------------------------------------
-- Copyright (c) 2003 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2003        1.0      apburg	Created
-- 10/03/2004  1.1      apburg  First Release
-- 12/01/2005  1.2      apburg  Fixed RealROUND-bug when NrOfBits==x'length
-- 08/04/2005  1.3      apburg  Fixed bug in RealMULT (sgn/uns) with NrOfBits
-- 04/09/2007  1.4      zwicky  Major revision
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.VHDLTools.all;

package RealARITH is

  -----------------------------------------------------------------------------
  -- Speed grades & other constants
  -----------------------------------------------------------------------------
  type ARITHQuant is (WrpTrc, WrpRnd, ClpTrc, ClpRnd, SatTrc, SatRnd);
  type Signal_Type is (s,u,i);            -- s for signed, u for unsigned,
                                          -- i for integer (for TB only)
  type FixP is record  -- never ever change order of INT and FRAC
    WIDTH_INT  : integer;
    WIDTH_FRAC : integer;
    SIG_TYPE   : Signal_Type;
  end record;


  -----------------------------------------------------------------------------
  -- Auxiliary functions
  -----------------------------------------------------------------------------
  -- function GetSWIDTH (constant InA_FixP : FixP) return integer;
  -- function GetUWIDTH (constant InA_FixP : FixP) return integer;
  function RealWIDTH (constant InA_FixP : FixP) return integer;
  function RealALIGN (constant InA      : signed;
                      constant InA_FixP : FixP;
                      constant InB_FixP : FixP;
                      constant ExtraMSB : integer) return signed;
  function RealALIGN (constant InA      : unsigned;
                      constant InA_FixP : FixP;
                      constant InB_FixP : FixP;
                      constant ExtraMSB : integer) return unsigned;
  
  -----------------------------------------------------------------------------
  -- Resizing
  -----------------------------------------------------------------------------
  function RealRESIZE (constant InA       : signed;
                       constant InA_FixP  : FixP;
                       constant Out_FixP  : FixP;
                       constant QuantType : ARITHQuant) return signed;
  function RealRESIZE (constant InA       : unsigned;
                       constant InA_FixP  : FixP;
                       constant Out_FixP  : FixP;
                       constant QuantType : ARITHQuant) return unsigned;
  
  -----------------------------------------------------------------------------
  -- ABS
  -----------------------------------------------------------------------------
  function RealABS (constant InA       : signed;
                    constant InA_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return unsigned; 
  
  -----------------------------------------------------------------------------
  -- NEG
  -----------------------------------------------------------------------------
  function RealNEG (constant InA       : in signed;
                    constant InA_FixP  : in FixP;
                    constant Out_FixP  : in FixP;
                    constant QuantType : in ARITHQuant) return signed;
  function RealNEG (constant InA       : in unsigned;
                    constant InA_FixP  : in FixP;
                    constant Out_FixP  : in FixP;
                    constant QuantType : in ARITHQuant) return signed;

  -----------------------------------------------------------------------------
  -- ADDSUB
  -----------------------------------------------------------------------------
  function RealADDSUB (constant InA       : signed;
                       constant InB       : signed;
                       constant AddSub    : std_logic;
                       constant InA_FixP  : FixP;
                       constant InB_FixP  : FixP;
                       constant Out_FixP  : FixP;
                       constant QuantType : ARITHQuant) return signed;

  -----------------------------------------------------------------------------
  -- ADD
  -----------------------------------------------------------------------------
  function RealADD (constant InA       : signed;
                    constant InB       : signed;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed;
  function RealADD (constant InA       : unsigned;
                    constant InB       : unsigned;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return unsigned;    
  function RealADD (constant InA       : signed;
                    constant InB       : unsigned;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed;
  function RealADD (constant InA       : unsigned;
                    constant InB       : signed;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed;
 
  -----------------------------------------------------------------------------
  -- SUB
  -----------------------------------------------------------------------------
  function RealSUB (constant InA       : signed;
                    constant InB       : signed;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed;
  function RealSUB (constant InA       : unsigned;
                    constant InB       : unsigned;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return unsigned;
  function RealSUB (constant InA       : unsigned;
                    constant InB       : unsigned;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed;      
  function RealSUB (constant InA       : signed;
                    constant InB       : unsigned;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed;
   function RealSUB (constant InA       : unsigned;
                     constant InB       : signed;
                     constant InA_FixP  : FixP;
                     constant InB_FixP  : FixP;
                     constant Out_FixP  : FixP;
                     constant QuantType : ARITHQuant) return signed;
 
  -----------------------------------------------------------------------------
  -- ASL, ASR
  -----------------------------------------------------------------------------
  function RealASL (constant InA       : signed;
                    constant InSHIFT   : unsigned;
                    constant InA_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed;
  function RealASL (constant InA       : unsigned;
                    constant InSHIFT   : unsigned;
                    constant InA_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return unsigned;
  function RealASR (constant InA       : signed;
                    constant InSHIFT   : unsigned;
                    constant InA_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed;
  function RealASR (constant InA       : unsigned;
                    constant InSHIFT   : unsigned;
                    constant InA_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return unsigned;
  function RealAS (constant InA       : unsigned;
                   constant InSHIFT   : integer;
                   constant InA_FixP  : FixP;
                   constant Out_FixP  : FixP;
                   constant QuantType : ARITHQuant) return unsigned;
  function RealAS (constant InA       : signed;
                   constant InSHIFT   : integer;
                   constant InA_FixP  : FixP;
                   constant Out_FixP  : FixP;
                   constant QuantType : ARITHQuant) return signed;
  function RealAS (constant InA       : unsigned;
                   constant InSHIFT   : signed;
                   constant InA_FixP  : FixP;
                   constant Out_FixP  : FixP;
                   constant QuantType : ARITHQuant) return unsigned;
  function RealAS (constant InA       : signed;
                   constant InSHIFT   : signed;
                   constant InA_FixP  : FixP;
                   constant Out_FixP  : FixP;
                   constant QuantType : ARITHQuant) return signed;
 
  -----------------------------------------------------------------------------
  -- MULT
  -----------------------------------------------------------------------------
  function RealMULT (constant InA       : signed;
                     constant InB       : signed;
                     constant InA_FixP  : FixP;
                     constant InB_FixP  : FixP;
                     constant Out_FixP  : FixP;
                     constant QuantType : ARITHQuant) return signed;
  function RealMULT (constant InA       : unsigned;
                     constant InB       : unsigned;
                     constant InA_FixP  : FixP;
                     constant InB_FixP  : FixP;
                     constant Out_FixP  : FixP;
                     constant QuantType : ARITHQuant) return unsigned;
  function RealMULT (constant InA       : unsigned;
                     constant InB       : signed;
                     constant InA_FixP  : FixP;
                     constant InB_FixP  : FixP;
                     constant Out_FixP  : FixP;
                     constant QuantType : ARITHQuant) return signed;
  function RealMULT (constant InA       : signed;
                     constant InB       : unsigned;
                     constant InA_FixP  : FixP;
                     constant InB_FixP  : FixP;
                     constant Out_FixP  : FixP;
                     constant QuantType : ARITHQuant) return signed;

end RealARITH;

package body RealARITH is

  -----------------------------------------------------------------------------
  -- Auxiliary functions
  -----------------------------------------------------------------------------
  -- function GetSWIDTH (constant InA_FixP : FixP) return integer is
  -- begin
  --   return InA_FixP.WIDTH_INT+InA_FixP.WIDTH_FRAC+1;
  -- end;
  -- 
  -- function GetUWIDTH (constant InA_FixP : FixP) return integer is
  -- begin
  --   return InA_FixP.WIDTH_INT+InA_FixP.WIDTH_FRAC;
  -- end;
  function RealWIDTH (
    constant InA_FixP : FixP) return integer is
  begin  -- RealWIDTH
    if InA_FixP.SIG_TYPE = u then
      return InA_FixP.WIDTH_INT+InA_FixP.WIDTH_FRAC;
    elsif InA_FixP.SIG_TYPE = s then
      return InA_FixP.WIDTH_INT+InA_FixP.WIDTH_FRAC+1;
    elsif InA_FixP.SIG_TYPE = i then
      -- for testbench only
      return 0;
    else
      assert false report "FixP.SIG_TYPE of real signals must be s (signed), u (unsigned) or i (integer, for TB only)"
        severity failure;
      return 0;
    end if;
  end RealWIDTH;
  
  function RealALIGN (constant InA      : signed;
                      constant InA_FixP : FixP;
                      constant InB_FixP : FixP;
                      constant ExtraMSB : integer) return signed is
    constant c_extFixP  : FixP    := (max(InA_FixP.WIDTH_INT, InB_FixP.WIDTH_INT)+ExtraMSB,
                                      max(InA_FixP.WIDTH_FRAC, InB_FixP.WIDTH_FRAC), s);
    constant c_extW     : integer := RealWIDTH(c_extFixP);
    constant c_addWFrac : integer := max(0, InB_FixP.WIDTH_FRAC-InA_FixP.WIDTH_FRAC);
    variable v_extA     : signed(c_extW-1 downto 0);
  begin  -- RealALIGN
    v_extA                                := (others => '0');
    v_extA(v_extA'high downto c_addWFrac) := resize(InA, RealWIDTH((c_extFixP.WIDTH_INT, InA_FixP.WIDTH_FRAC, s)));
    return v_extA;
  end RealALIGN;
  
  function RealALIGN (constant InA      : unsigned;
                      constant InA_FixP : FixP;
                      constant InB_FixP : FixP;
                      constant ExtraMSB : integer) return unsigned is
    constant c_extFixP  : FixP    := (max(InA_FixP.WIDTH_INT, InB_FixP.WIDTH_INT)+ExtraMSB,
                                      max(InA_FixP.WIDTH_FRAC, InB_FixP.WIDTH_FRAC), u);
    constant c_extW     : integer := RealWIDTH(c_extFixP);
    constant c_addWFrac : integer := max(0, InB_FixP.WIDTH_FRAC-InA_FixP.WIDTH_FRAC);
    variable v_extA     : unsigned(c_extW-1 downto 0);
  begin  -- RealALIGN
    v_extA                                := (others => '0');
    v_extA(v_extA'high downto c_addWFrac) := resize(InA, RealWIDTH((c_extFixP.WIDTH_INT, InA_FixP.WIDTH_FRAC, u)));
    return v_extA;
  end RealALIGN;

  -----------------------------------------------------------------------------
  -- Resizing
  -----------------------------------------------------------------------------
  function RealRESIZE (constant InA       : signed;
                       constant InA_FixP  : FixP;
                       constant Out_FixP  : FixP;
                       constant QuantType : ARITHQuant) return signed is
    -- number of bits that v_ext is longer than v_out
    -- number of MSBs that are cut off
    constant N_MSB  : integer := max(0, InA_FixP.WIDTH_INT-Out_FixP.WIDTH_INT);
    -- number of LSBs that are cut off
    constant N_LSB : integer := max(0, InA_FixP.WIDTH_FRAC-Out_FixP.WIDTH_FRAC);
    -- return value
    variable v_out      : signed(RealWIDTH(Out_FixP)-1 downto 0);
    -- InA aligned with Output (with potentially added MSBs/LSBs)
    variable v_ext      : signed(v_out'length+N_MSB+N_LSB-1 downto 0);
    -- same as v_ext, but with additional MSB to prevent overflow while rounding
    variable v_extPlus  : signed(v_out'length+N_MSB+N_LSB downto 0);
    -- result of rounding, but before saturation
    variable v_rndPlus  : signed(v_extPlus'length-N_LSB downto 0);
    -- same as v_out, but with extra LSB for rounding
    variable v_rnd      : signed(v_out'length downto 0);
  begin
    -- align InA to Out_FixP (add MSBs/LSBs where needed, do not cut off anything)
    v_ext := RealALIGN(InA,InA_FixP,Out_FixP,0);
    -- initialize return value, cut off unwanted bits
    v_out := v_ext(v_ext'high-N_MSB downto N_LSB);
    if (QuantType = WrpRnd or QuantType = ClpRnd or QuantType = SatRnd) and N_LSB > 0 then
      -- there is at least one LSB cut off and the result must be rounded
      if QuantType = SatRnd and (InA_FixP.WIDTH_INT-Out_FixP.WIDTH_INT) >= 0 then
        -- There are no MSBs added and the result must be rounded and
        -- saturated. Rounding potentially causes an overflow,
        -- even if no MSBs are cut off. Hence, if no MSBs are added, the
        -- potential overflow must be caught with an extra MSB before
        -- saturation.
        v_extPlus := RealALIGN(InA,InA_FixP,Out_FixP,1);  -- with extra MSB
        -- Rounding is done by adding "1" to the value that has one LSB more
        -- than the return value. The extra MSB assures that there are no
        -- overflows.
        v_rndPlus := v_extPlus(v_extPlus'high downto N_LSB-1) + 1;  -- round
        if (v_rndPlus(v_rndPlus'high downto v_rndPlus'high-N_MSB-1) /= 0 and
            v_rndPlus(v_rndPlus'high downto v_rndPlus'high-N_MSB-1) /= -1)
          -- The bits that are cut off (including the extra MSB that was
          -- added for catching rounding-overflows) are not all equal. This
          -- means that instead of clipping the MSBs, the result must be
          -- saturated to the largest/smallest representable value.
          or (v_rndPlus(v_rndPlus'high-N_MSB-1) = '1' and
              v_rndPlus(v_rndPlus'high-N_MSB-2 downto 1) = 0) then
          -- This is a check only on the bits that are returned.
          -- The most negative value (i.e. 100...00) is saturated to the next
          -- larger value (i.e. 100...01) such that every returned value has a
          -- positive counterpart (symmetrical dynamic range).
          v_out := (others => not(InA(InA'high)));
          v_out(v_out'high) := InA(InA'high);
          v_out(v_out'low) := '1';
        else
          -- no saturation, just clip MSBs (including the one that has been
          -- added for rounding) and truncate the LSB that was used for
          -- rounding
          v_out := v_rndPlus(v_rndPlus'high-N_MSB-1 downto 1);
        end if;
      else
        -- round and clip (no saturate)
        -- Rounding is done by adding "1" to the value that has one LSB more
        -- than the return value. There is no need for an extra MSB, since
        -- overflows can be tolerated.
        v_rnd := v_ext(v_ext'high-N_MSB downto N_LSB-1) + 1;  -- round
        -- cut off the LSB that was used in the previous line
        v_out := v_rnd(v_rnd'high downto 1);
      end if;
    else
      -- any QuantType is possible, but no rounding is required
      if (QuantType = SatTrc or QuantType = SatRnd) and (InA_FixP.WIDTH_INT-Out_FixP.WIDTH_INT) >= 0 then
        -- There are no MSBs added and the result must be saturated. Even if no
        -- MSBs are added, the most negative value (i.e. 100...00) is saturated
        -- to the next larger value (i.e. 100...01).
        if (v_ext(v_ext'high downto v_ext'high-N_MSB) /= 0 and
            v_ext(v_ext'high downto v_ext'high-N_MSB) /= -1)
          -- The bits that are cut off are not all equal. This
          -- means that instead of clipping the MSBs, the result must be
          -- saturated to the largest/smallest representable value.
          or (v_out(v_out'high) = '1' and v_out(v_out'high-1 downto 0) = 0) then
          -- This is a check only on the bits that are returned.
          -- The most negative value (i.e. 100...00) is saturated to the next
          -- larger value (i.e. 100...01) such that every returned value has a
          -- positive counterpart (symmetrical dynamic range).
          v_out := (others => not(InA(InA'high)));
          v_out(v_out'high) := InA(InA'high);
          v_out(v_out'low) := '1';
        end if;
      end if;
    end if;
    return v_out;
  end RealRESIZE;

  function RealRESIZE (constant InA       : unsigned;
                       constant InA_FixP  : FixP;
                       constant Out_FixP  : FixP;
                       constant QuantType : ARITHQuant) return unsigned is
    -- number of bits that v_ext is longer than v_out
    -- number of MSBs that are cut off
    constant N_MSB  : integer := max(0, InA_FixP.WIDTH_INT-Out_FixP.WIDTH_INT);
    -- number of LSBs that are cut off
    constant N_LSB : integer := max(0, InA_FixP.WIDTH_FRAC-Out_FixP.WIDTH_FRAC);
    -- return value
    variable v_out      : unsigned(RealWIDTH(Out_FixP)-1 downto 0);
    -- InA aligned with Output (with potentially added MSBs/LSBs)
    variable v_ext      : unsigned(v_out'length+N_MSB+N_LSB-1 downto 0);
    -- same as v_ext, but with additional MSB to prevent overflow while rounding
    variable v_extPlus  : unsigned(v_out'length+N_MSB+N_LSB downto 0);
    -- result of rounding, but before saturation
    variable v_rndPlus  : unsigned(v_extPlus'length-N_LSB downto 0);
    -- same as v_out, but with extra LSB for rounding
    variable v_rnd      : unsigned(v_out'length downto 0);
  begin
    -- align InA to Out_FixP (add MSBs/LSBs where needed, do not cut off anything)
    v_ext := RealALIGN(InA,InA_FixP,Out_FixP,0);
    -- initialize return value, cut off unwanted bits
    v_out := v_ext(v_ext'high-N_MSB downto N_LSB);
    if (QuantType = WrpRnd or QuantType = ClpRnd or QuantType = SatRnd) and N_LSB > 0 then
      -- there is at least one LSB cut off and the result must be rounded
      if QuantType = SatRnd and (InA_FixP.WIDTH_INT-Out_FixP.WIDTH_INT) >= 0 then
        -- There are no MSBs added and the result must be rounded and
        -- saturated. Rounding potentially causes an overflow,
        -- even if no MSBs are cut off. Hence, if no MSBs are added, the
        -- potential overflow must be caught with an extra MSB before
        -- saturation.
        v_extPlus := RealALIGN(InA,InA_FixP,Out_FixP,1);  -- with extra MSB
        -- Rounding is done by adding "1" to the value that has one LSB more
        -- than the return value. The extra MSB assures that there are no
        -- overflows.
        v_rndPlus := v_extPlus(v_extPlus'high downto N_LSB-1) + 1;  -- round
        if v_rndPlus(v_rndPlus'high downto v_rndPlus'high-N_MSB) /= 0 then
          -- The bits that are cut off (including the extra MSB that was
          -- added for catching rounding-overflows) are not all zero. This
          -- means that instead of clipping the MSBs, the result must be
          -- saturated to the largest representable value.
          v_out := (others => '1');
        else
          -- no saturation, just clip MSBs (including the one that was
          -- added for rounding) and truncate the LSB that was used for
          -- rounding
          v_out := v_rndPlus(v_rndPlus'high-N_MSB-1 downto 1);
        end if;
      else
        -- round and clip (no saturate)
        -- Rounding is done by adding "1" to the value that has one LSB more
        -- than the return value. There is no need for an extra MSB, since
        -- overflows can be tolerated.
        v_rnd := v_ext(v_ext'high-N_MSB downto N_LSB-1) + 1;  -- round
        -- cut off the LSB that was used in the previous line
        v_out := v_rnd(v_rnd'high downto 1);
      end if;
    else
      -- any QuantType possible, but no rounding required
      if (QuantType = SatTrc or QuantType = SatRnd) and N_MSB > 0 then
        -- At least one MSB is cut off and the result must be saturated
        if v_ext(v_ext'high downto v_ext'high-N_MSB+1) /= 0 then
          -- The bits that are cut off are not all zero. Saturate to the
          -- largest representable value.
          v_out := (others => '1');
        end if;
      end if;
    end if;
    return v_out;
  end RealRESIZE;
      
  -----------------------------------------------------------------------------
  -- ABS
  -----------------------------------------------------------------------------
  function RealABS (constant InA       : signed;
                    constant InA_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return unsigned is
    variable v_temp : signed(InA'length-1 downto 0);
    variable v_out : unsigned(InA'length-1 downto 0);
  begin
    if InA >= 0 then
      v_out := unsigned(InA);
    else
      v_temp := -InA;
      v_out := unsigned(v_temp); 
    end if;
    return RealRESIZE(v_out,(InA_FixP.WIDTH_INT+1,InA_FixP.WIDTH_FRAC, u),Out_FixP,QuantType);
  end;

  -----------------------------------------------------------------------------
  -- NEG
  -----------------------------------------------------------------------------
  function RealNEG (constant InA       : in signed;
                    constant InA_FixP  : in FixP;
                    constant Out_FixP  : in FixP;
                    constant QuantType : in ARITHQuant) return signed is
    variable v_out : signed(InA'length downto 0);
  begin
    v_out := resize(InA,v_out'length);  -- add extra MSB
    v_out := -v_out;
    return RealRESIZE(v_out,(InA_FixP.WIDTH_INT+1,InA_FixP.WIDTH_FRAC,s),Out_FixP,QuantType);
  end;
  
  function RealNEG (constant InA       : in unsigned;
                    constant InA_FixP  : in FixP;
                    constant Out_FixP  : in FixP;
                    constant QuantType : in ARITHQuant) return signed is
    variable v_out : signed(InA'length downto 0);
  begin
    v_out := signed(resize(InA,v_out'length));  -- zero extension
    v_out := -v_out;
    return RealRESIZE(v_out,InA_FixP,Out_FixP,QuantType);
  end;

  -----------------------------------------------------------------------------
  -- ADDSUB ('0'=add, '1'=sub)
  -----------------------------------------------------------------------------
  function RealADDSUB (constant InA       : signed;
                       constant InB       : signed;
                       constant AddSub    : std_logic;
                       constant InA_FixP  : FixP;
                       constant InB_FixP  : FixP;
                       constant Out_FixP  : FixP;
                       constant QuantType : ARITHQuant) return signed is
    constant c_extFixP : FixP := (max(InA_FixP.WIDTH_INT, InB_FixP.WIDTH_INT)+1,
                                  max(InA_FixP.WIDTH_FRAC, InB_FixP.WIDTH_FRAC), s);
    constant c_extW    : integer := RealWIDTH(c_extFixP);
    variable v_extA    : signed(c_extW-1 downto 0);
    variable v_extB    : signed(c_extW-1 downto 0);
    variable v_sum     : signed(c_extW-1 downto 0);
  begin
    v_extA := RealALIGN(InA, InA_FixP, InB_FixP, 1);
    v_extB := RealALIGN(InB, InB_FixP, InA_FixP, 1);
    if AddSub = '0' then
      v_sum  := v_extA + v_extB;
    else
      v_sum  := v_extA - v_extB;
    end if;
    return RealRESIZE(v_sum, c_extFixP, Out_FixP, QuantType);
  end RealADDSUB;
    
  -----------------------------------------------------------------------------
  -- ADD
  -----------------------------------------------------------------------------
  function RealADD (constant InA       : signed;
                    constant InB       : signed;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed is
  begin
    return RealADDSUB(InA, InB, '0', InA_FixP, InB_FixP, Out_FixP, QuantType);
  end RealADD;
  
  function RealADD (constant InA       : unsigned;
                    constant InB       : unsigned;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return unsigned is
    constant c_extFixP : FixP := (max(InA_FixP.WIDTH_INT, InB_FixP.WIDTH_INT)+1,
                                  max(InA_FixP.WIDTH_FRAC, InB_FixP.WIDTH_FRAC), u);
    constant c_extW    : integer := RealWIDTH(c_extFixP);
    variable v_extA    : unsigned(c_extW-1 downto 0);
    variable v_extB    : unsigned(c_extW-1 downto 0);
    variable v_sum     : unsigned(c_extW-1 downto 0);
  begin
    v_extA := RealALIGN(InA, InA_FixP, InB_FixP, 1);
    v_extB := RealALIGN(InB, InB_FixP, InA_FixP, 1);
    v_sum  := v_extA + v_extB;
    return RealRESIZE(v_sum, c_extFixP, Out_FixP, QuantType);
  end RealADD;

  function RealADD (constant InA       : unsigned;
                    constant InB       : signed;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed is
    variable v_A : signed(InA'length downto 0);
  begin
    v_A := signed(resize(InA,v_A'length));
    return RealADD(v_A, InB, InA_FixP, InB_FixP, Out_FixP, QuantType);
  end RealADD;
    
  function RealADD (constant InA       : signed;
                    constant InB       : unsigned;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed is
    variable v_B : signed(InB'length downto 0);
  begin
    v_B := signed(resize(InB,v_B'length));
    return RealADD(InA, v_B, InA_FixP, InB_FixP, Out_FixP, QuantType);
  end RealADD;

  -----------------------------------------------------------------------------
  -- SUB
  -----------------------------------------------------------------------------
  function RealSUB (constant InA       : signed;
                    constant InB       : signed;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed is
  begin
    return RealADDSUB(InA, InB, '1', InA_FixP, InB_FixP, Out_FixP, QuantType);
  end RealSUB;
  
  function RealSUB (constant InA       : unsigned;
                    constant InB       : unsigned;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return unsigned is
    constant c_extFixP : FixP := (max(InA_FixP.WIDTH_INT, InB_FixP.WIDTH_INT),
                                  max(InA_FixP.WIDTH_FRAC, InB_FixP.WIDTH_FRAC), s);
    constant c_vOutFixP : FixP := (Out_FixP.WIDTH_INT, Out_FixP.WIDTH_FRAC, s);
    constant c_extW    : integer := RealWIDTH(c_extFixP);
    variable v_diff    : signed(c_extW-1 downto 0);
    variable v_out     : signed(RealWIDTH(c_vOutFixP)-1 downto 0);
  begin
    v_diff := RealSUB(InA, InB, InA_FixP, InB_FixP, c_extFixP, WrpTrc);
    -- check for negative values, saturate to 0
    if (QuantType = SatTrc or QuantType = SatRnd) and v_diff(v_diff'high) = '1' then
      v_diff := (others => '0');
    end if;
    v_out := RealRESIZE(v_diff, c_extFixP, c_vOutFixP, QuantType);
    return unsigned(v_out(v_out'high-1 downto 0));
  end RealSUB;

  function RealSUB (constant InA       : unsigned;
                    constant InB       : unsigned;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed is
    constant c_extFixP : FixP := (max(InA_FixP.WIDTH_INT, InB_FixP.WIDTH_INT),
                                  max(InA_FixP.WIDTH_FRAC, InB_FixP.WIDTH_FRAC), s);
    constant c_extW    : integer := RealWIDTH(c_extFixP);
    variable v_extA    : signed(c_extW-1 downto 0);
    variable v_extB    : signed(c_extW-1 downto 0);
    variable v_diff    : signed(c_extW-1 downto 0);
  begin
    v_extA := signed(RealALIGN(InA, InA_FixP, InB_FixP, 1));
    v_extB := signed(RealALIGN(InB, InB_FixP, InA_FixP, 1));
    v_diff := v_extA - v_extB;
    return RealRESIZE(v_diff, c_extFixP, Out_FixP, QuantType);
  end RealSUB;

  function RealSUB (constant InA       : unsigned;
                    constant InB       : signed;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed is
    variable v_A : signed(InA'length downto 0);
  begin
    v_A := signed(resize(InA,v_A'length));
    return RealSUB(v_A, InB, InA_FixP, InB_FixP, Out_FixP, QuantType);
  end RealSUB;
 
  function RealSUB (constant InA       : signed;
                    constant InB       : unsigned;
                    constant InA_FixP  : FixP;
                    constant InB_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed is
    variable v_B : signed(InB'length downto 0);
  begin
    v_B := signed(resize(InB,v_B'length));
    return RealSUB(InA, v_B, InA_FixP, InB_FixP, Out_FixP, QuantType);
  end RealSUB;

  -----------------------------------------------------------------------------
  -- ASL, ASR
  -----------------------------------------------------------------------------
  function RealASL (constant InA       : signed;
                    constant InSHIFT   : unsigned;
                    constant InA_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed is
    constant c_addMSB : integer := (2**InSHIFT'length)-1;
    variable v_out    : signed(InA'length+c_addMSB-1 downto 0);
    variable v_shift  : natural range 0 to c_addMSB;
  begin
    v_out   := resize(InA, v_out'length);
    v_shift := to_integer(InSHIFT);
    v_out   := SHIFT_LEFT(v_out, v_shift);
    return RealRESIZE(v_out, (InA_FixP.WIDTH_INT+c_addMSB, InA_FixP.WIDTH_FRAC, s), Out_FixP, QuantType);
  end RealASL;
  
  function RealASL (constant InA       : unsigned;
                    constant InSHIFT   : unsigned;
                    constant InA_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return unsigned is
    constant c_addMSB : integer := (2**InSHIFT'length)-1;
    variable v_out    : unsigned(InA'length+c_addMSB-1 downto 0);
    variable v_shift  : natural range 0 to c_addMSB;
  begin
    v_out   := resize(InA, v_out'length);
    v_shift := to_integer(InSHIFT);
    v_out   := SHIFT_LEFT(v_out, v_shift);
    return RealRESIZE(v_out, (InA_FixP.WIDTH_INT+c_addMSB, InA_FixP.WIDTH_FRAC, u), Out_FixP, QuantType);
  end RealASL;
 
  function RealASR (constant InA       : signed;
                    constant InSHIFT   : unsigned;
                    constant InA_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return signed is
    -- add one extra LSB for rounding
    constant c_outFixP : FixP := (InA_FixP.WIDTH_INT, max(Out_FixP.WIDTH_FRAC, -InA_FixP.WIDTH_INT)+1, s);
    variable v_out     : signed(RealWIDTH(c_outFixP)-1 downto 0);
    variable v_shift   : natural range 0 to (2**InSHIFT'length)-1;
  begin
    v_out   := (others => '0');
    v_out(v_out'high downto max(0, v_out'length-InA'length)) := InA(InA'high downto max(0, InA'length-v_out'length));
    v_shift := to_integer(InSHIFT);
    v_out   := SHIFT_RIGHT(v_out, v_shift);
    return RealRESIZE(v_out, c_outFixP, Out_FixP, QuantType);
  end RealASR;
                                                 
  function RealASR (constant InA       : unsigned;
                    constant InSHIFT   : unsigned;
                    constant InA_FixP  : FixP;
                    constant Out_FixP  : FixP;
                    constant QuantType : ARITHQuant) return unsigned is
    -- add one extra LSB for rounding
    constant c_outFixP : FixP := (InA_FixP.WIDTH_INT, max(Out_FixP.WIDTH_FRAC,-InA_FixP.WIDTH_INT)+1, u);
    variable v_out     : unsigned(RealWIDTH(c_outFixP)-1 downto 0);
    variable v_shift   : natural range 0 to (2**InSHIFT'length)-1;
  begin
    v_out   := (others => '0');
    v_out(v_out'high downto max(0, v_out'length-InA'length)) := InA(InA'high downto max(0,InA'length-v_out'length));
    v_shift := to_integer(InSHIFT);
    v_out   := SHIFT_RIGHT(v_out, v_shift);
    return RealRESIZE(v_out, c_outFixP, Out_FixP, QuantType);
  end RealASR;

  function RealAS (constant InA       : unsigned;
                   constant InSHIFT   : integer;  -- assumed constant
                   constant InA_FixP  : FixP;
                   constant Out_FixP  : FixP;
                   constant QuantType : ARITHQuant) return unsigned is
    constant c_inShift : natural := abs(InSHIFT);
    constant c_n : natural := log2floor(c_inShift);
    variable v_shift : unsigned(c_n downto 0);
  begin
    v_shift := to_unsigned(c_inShift,c_n+1);
    if InSHIFT > 0 then
      return RealASL(InA, v_shift, InA_FixP, Out_FixP, QuantType);
    elsif InShift < 0 then
      return RealASR(InA, v_shift, InA_FixP, Out_FixP, QuantType);
    else
      return RealRESIZE(InA, InA_FixP, Out_FixP, QuantType);
    end if;
  end RealAS;
    
  function RealAS (constant InA       : signed;
                   constant InSHIFT   : integer;  -- assumed constant
                   constant InA_FixP  : FixP;
                   constant Out_FixP  : FixP;
                   constant QuantType : ARITHQuant) return signed is
    constant c_inShift : natural := abs(InSHIFT);
    constant c_n : natural := log2floor(c_inShift);
    variable v_shift : unsigned(c_n downto 0);
  begin
    v_shift := to_unsigned(c_inShift,c_n+1);
    if InSHIFT > 0 then
      return RealASL(InA, v_shift, InA_FixP, Out_FixP, QuantType);
    elsif InSHIFT < 0 then
      return RealASR(InA, v_shift, InA_FixP, Out_FixP, QuantType);
    else
      return RealRESIZE(InA, InA_FixP, Out_FixP, QuantType);
    end if;
  end RealAS;

  function RealAS (constant InA       : unsigned;
                   constant InSHIFT   : signed;
                   constant InA_FixP  : FixP;
                   constant Out_FixP  : FixP;
                   constant QuantType : ARITHQuant) return unsigned is
  begin
    if InSHIFT(InSHIFT'high) = '1' then
      if InSHIFT(InSHIFT'high-1 downto 0) = 0 then
        return RealASR(InA, to_unsigned(2**(InSHIFT'length-1),InSHIFT'length), InA_FixP, Out_FixP, QuantType);
      else
        return RealASR(InA, RealABS(InSHIFT, (InSHIFT'length-1, 0, s), (InSHIFT'length-1, 0, u), WrpTrc),
                       InA_FixP, Out_FixP, QuantType);        
      end if;
    else
      return RealASL(InA, unsigned(InSHIFT(InSHIFT'high-1 downto 0)), InA_FixP, Out_FixP, QuantType);
    end if;
  end RealAS;
  
  function RealAS (constant InA       : signed;
                   constant InSHIFT   : signed;
                   constant InA_FixP  : FixP;
                   constant Out_FixP  : FixP;
                   constant QuantType : ARITHQuant) return signed is
  begin
    if InSHIFT(InSHIFT'high) = '1' then
      if InSHIFT(InSHIFT'high-1 downto 0) = 0 then
        return RealASR(InA, to_unsigned(2**(InSHIFT'length-1),InSHIFT'length), InA_FixP, Out_FixP, QuantType);
      else
        return RealASR(InA, RealABS(InSHIFT, (InSHIFT'length-1, 0, s), (InSHIFT'length-1, 0, u), WrpTrc),
                       InA_FixP, Out_FixP, QuantType);        
      end if;
    else
      return RealASL(InA, unsigned(InSHIFT(InSHIFT'high-1 downto 0)), InA_FixP, Out_FixP, QuantType);
    end if;
  end RealAS;

  -----------------------------------------------------------------------------
  -- MULT
  -----------------------------------------------------------------------------
  function RealMULT (constant InA       : signed;
                     constant InB       : signed;
                     constant InA_FixP  : FixP;
                     constant InB_FixP  : FixP;
                     constant Out_FixP  : FixP;
                     constant QuantType : ARITHQuant) return signed is
    constant c_outFixP : FixP := (InA_FixP.WIDTH_INT+InB_FixP.WIDTH_INT+1,
                                  InA_FixP.WIDTH_FRAC+InB_FixP.WIDTH_FRAC, s);
    variable v_out : signed(RealWIDTH(c_outFixP)-1 downto 0);
  begin
    v_out := InA*InB;
    return RealRESIZE(v_out, c_outFixP, Out_FixP, QuantType);
  end RealMULT;
    
  function RealMULT (constant InA       : unsigned;
                     constant InB       : unsigned;
                     constant InA_FixP  : FixP;
                     constant InB_FixP  : FixP;
                     constant Out_FixP  : FixP;
                     constant QuantType : ARITHQuant) return unsigned is
    constant c_outFixP : FixP := (InA_FixP.WIDTH_INT+InB_FixP.WIDTH_INT,
                                  InA_FixP.WIDTH_FRAC+InB_FixP.WIDTH_FRAC, u);
    variable v_out : unsigned(RealWIDTH(c_outFixP)-1 downto 0);
  begin
    v_out := InA*InB;
    return RealRESIZE(v_out, c_outFixP, Out_FixP, QuantType);
  end RealMULT;

  function RealMULT (constant InA       : unsigned;
                     constant InB       : signed;
                     constant InA_FixP  : FixP;
                     constant InB_FixP  : FixP;
                     constant Out_FixP  : FixP;
                     constant QuantType : ARITHQuant) return signed is
    variable v_A : signed(InA'length downto 0);
  begin
    v_A := signed(resize(InA,v_A'length));
    return RealMULT(v_A, InB, InA_FixP, InB_FixP, Out_FixP, QuantType);
  end RealMULT;

  function RealMULT (constant InA       : signed;
                     constant InB       : unsigned;
                     constant InA_FixP  : FixP;
                     constant InB_FixP  : FixP;
                     constant Out_FixP  : FixP;
                     constant QuantType : ARITHQuant) return signed is
    variable v_B : signed(InB'length downto 0);
  begin
    v_B := signed(resize(InB,v_B'length));
    return RealMULT(InA, v_B, InA_FixP, InB_FixP, Out_FixP, QuantType);
  end RealMULT;

end RealARITH;


