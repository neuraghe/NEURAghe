//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module DI_BTB_G (G0, G1, VSS);
   inout G0, G1, VSS;
   supply0 G0, G1, VSS;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module DI_G (GND, SIG);
   inout GND, SIG;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module DI_P (GND, PWR, SIG);
   inout GND, PWR, SIG;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IAABREAK ();


   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IACLAMP (VDDANA, VSSANA);
   inout VDDANA, VSSANA;
   supply1 VDDANA;
   supply0 VSSANA;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IACLAMPC (VDDANAC, VSSANAC);
   inout VDDANAC, VSSANAC;
   supply1 VDDANAC;
   supply0 VSSANAC;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IAGBREAK (VSSANA, VSSANAC);
   inout VSSANA, VSSANAC;
   supply0 VSSANA, VSSANAC;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IANAIO (AIO250, AIO50, ANAIO, VDDANA, VSSANA);
   inout AIO250, AIO50, ANAIO, VDDANA, VSSANA;
   supply1 VDDANA;
   supply0 VSSANA;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IANAIOC (AIOC250, AIOC50, ANAIOC, VDDANAC, VSSANAC);
   inout AIOC250, AIOC50, ANAIOC, VDDANAC, VSSANAC;
   supply1 VDDANAC;
   supply0 VSSANAC;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module ICORNER (VSS, VSSIO);
   inout VSS, VSSIO;
   supply0 VSS, VSSIO;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module ICORNERA (VSSANA);
   inout VSSANA;
   supply0 VSSANA;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IDABREAKL (VSS, VSSANA, VSSIO);
   inout VSS, VSSANA, VSSIO;
   supply0 VSS, VSSANA, VSSIO;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IDABREAKR (VSS, VSSANA, VSSIO);
   inout VSS, VSSANA, VSSIO;
   supply0 VSS, VSSANA, VSSIO;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IDCLAMPC (VDD, VSS);
   inout VDD, VSS;
   supply1 VDD;
   supply0 VSS;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IDDBREAK (VDD, VSS, VSSIO);
   inout VDD, VSS, VSSIO;
   supply1 VDD;
   supply0 VSS, VSSIO;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IDDIOBREAK (VDDIO, VSS, VSSIO);
   inout VDDIO, VSS, VSSIO;
   supply1 VDDIO;
   supply0 VSS, VSSIO;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IFILLER0 ();


   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IFILLER1 ();


   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IFILLER10 ();


   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IFILLER5 ();


   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog      ***
//*************************************

`timescale 1 ns / 1 ps

`ifdef functional
				// none
`else
	`define SMC_NFORCE 1 	// Flag to force output to x if notifer changes
`endif

`celldefine

module IUMA (OE, IDDQ, DO, PIN1, PIN2, SMT, SR, PD, PU, DI, PAD, VDD, VDDIO, VSS, VSSIO);
  input OE, IDDQ, DO, PIN1, PIN2, SMT, SR, PD, PU;
  output DI;
  inout PAD, VDD, VDDIO, VSS, VSSIO;
  supply1 VDD, VDDIO;
  supply0 VSS, VSSIO;

    buf      bb1      (_SMT, SMT);
    buf      bb2      (_SR, SR);
    buf      bb3      (_PIN1, PIN1);
    buf      bb4      (_PIN2, PIN2);
    not      NOT1     (NOT1_out, PU);
    not      NOT2     (NOT2_out, PD);
    not      NOT3     (NOT3_out, OE);
    not      NOT4     (NOT4_out, IDDQ);
    nand     NAND1    (NAND1_out, PU, NOT3_out, NOT2_out, NOT4_out);
    and      AND1     (AND1_out, OE, NOT4_out); 
    bufif1   BUF1     (NMOS_PAD, DO, AND1_out);
    and      AND2     (AND2_out, NOT1_out, PD, NOT3_out, NOT4_out);
    and      AND3     (AND3_out, PU, PD, NOT4_out);
    /* Pullup (Strength to Weak) */ 
    rpmos    PMOS1    (NMOS_PAD, PMOSA_out, NAND1_out);
    rpmos    PMOSA    (PMOSA_out, PMOSB_out, NAND1_out);
    rpmos    PMOSB    (PMOSB_out, VDD, NAND1_out);    
    /* Pulldown (Strength to Weak) */
    rnmos    NMOS1    (NMOS_PAD, NMOSA_out, AND2_out);
    rnmos    NMOSA    (NMOSA_out, NMOSB_out, AND2_out);
    rnmos    NMOSB    (NMOSB_out, VSS, AND2_out);     
    /* keeper */ 
    not	     NOT5     (NOT5_out, NMOS_PAD);
    not	     NOT6     (NOT6_out, AND3_out);
    not	     NOT7     (NOT7_out, NOT5_out);
    rcmos    CMOS1    (NMOS_PAD, NOT7_out, AND3_out, NOT6_out);
    nmos     NMOS2    (PAD, NMOS_PAD, VDD);
    buf	     BUF2     (DI, PAD);

 `ifdef functional // functional //

  `else // functional //

  specify

    // arc IDDQ --> DI
    (IDDQ => DI) = (1.0);

    // arc IDDQ --> PAD
    (IDDQ => PAD) = (1.0);

    // arc DO --> PAD
    if (PIN1===1'b0 && PIN2===1'b0 && SR===1'b0) 
        (DO => PAD) = (1.0, 1.0);
    if (PIN1===1'b0 && PIN2===1'b0 && SR===1'b1) 
        (DO => PAD) = (1.0, 1.0);

    // arc DO --> PAD
    if (PIN1===1'b1 && PIN2===1'b0 && SR===1'b0) 
        (DO => PAD) = (1.0, 1.0);
    if (PIN1===1'b1 && PIN2===1'b0 && SR===1'b1) 
        (DO => PAD) = (1.0, 1.0);

    // arc DO --> PAD
    if (PIN1===1'b0 && PIN2===1'b1 && SR===1'b0) 
        (DO => PAD) = (1.0, 1.0);
    if (PIN1===1'b0 && PIN2===1'b1 && SR===1'b1) 
        (DO => PAD) = (1.0, 1.0);

    // arc DO --> PAD
    if (PIN1===1'b1 && PIN2===1'b1 && SR===1'b0) 
        (DO => PAD) = (1.0, 1.0);
    if (PIN1===1'b1 && PIN2===1'b1 && SR===1'b1) 
        (DO => PAD) = (1.0, 1.0);

    ifnone
        (DO => PAD) = (1.0, 1.0);

    // arc OE --> PAD
    if (PIN1===1'b0 && PIN2===1'b0 && SR===1'b0) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);
    if (PIN1===1'b0 && PIN2===1'b0 && SR===1'b1) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);

    // arc OE --> PAD
    if (PIN1===1'b1 && PIN2===1'b0 && SR===1'b0) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);
    if (PIN1===1'b1 && PIN2===1'b0 && SR===1'b1) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);

    // arc OE --> PAD
    if (PIN1===1'b0 && PIN2===1'b1 && SR===1'b0) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);
    if (PIN1===1'b0 && PIN2===1'b1 && SR===1'b1) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);

    // arc OE --> PAD
    if (PIN1===1'b1 && PIN2===1'b1 && SR===1'b0) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);
    if (PIN1===1'b1 && PIN2===1'b1 && SR===1'b1) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);

    ifnone
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);

    // arc PAD --> DI
    if (PD===1'b0 && PU===1'b0 && SMT===1'b0) 
        (PAD => DI) = (1.0, 1.0);
    if (PD===1'b0 && PU===1'b0 && SMT===1'b1) 
        (PAD => DI) = (1.0, 1.0);

    // arc PAD --> DI
    if (PD===1'b1 && PU===1'b0 && SMT===1'b0) 
        (PAD => DI) = (1.0, 1.0);
    if (PD===1'b1 && PU===1'b0 && SMT===1'b1) 
        (PAD => DI) = (1.0, 1.0);

    // arc PAD --> DI
    if (PD===1'b0 && PU===1'b1 && SMT===1'b0) 
        (PAD => DI) = (1.0, 1.0);
    if (PD===1'b0 && PU===1'b1 && SMT===1'b1) 
        (PAD => DI) = (1.0, 1.0);

    // arc PAD --> DI
    if (PD===1'b1 && PU===1'b1 && SMT===1'b0) 
        (PAD => DI) = (1.0, 1.0);
    if (PD===1'b1 && PU===1'b1 && SMT===1'b1) 
        (PAD => DI) = (1.0, 1.0);

    ifnone
        (PAD => DI) = (1.0, 1.0);

  endspecify

  `endif // functional //

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog      ***
//*************************************

`timescale 1 ns / 1 ps

`ifdef functional
				// none
`else
	`define SMC_NFORCE 1 	// Flag to force output to x if notifer changes
`endif

`celldefine

module IUMB (OE, IDDQ, DO, PIN1, PIN2, SMT, SR, PD, PU, DI, PAD, VDD, VDDIO, VSS, VSSIO);
  input OE, IDDQ, DO, PIN1, PIN2, SMT, SR, PD, PU;
  output DI;
  inout PAD, VDD, VDDIO, VSS, VSSIO;
  supply1 VDD, VDDIO;
  supply0 VSS, VSSIO;

    buf      bb1      (_SMT, SMT);
    buf      bb2      (_SR, SR);
    buf      bb3      (_PIN1, PIN1);
    buf      bb4      (_PIN2, PIN2);
    not      NOT1     (NOT1_out, PU);
    not      NOT2     (NOT2_out, PD);
    not      NOT3     (NOT3_out, OE);
    not      NOT4     (NOT4_out, IDDQ);
    nand     NAND1    (NAND1_out, PU, NOT3_out, NOT2_out, NOT4_out);
    and      AND1     (AND1_out, OE, NOT4_out); 
    bufif1   BUF1     (NMOS_PAD, DO, AND1_out);
    and      AND2     (AND2_out, NOT1_out, PD, NOT3_out, NOT4_out);
    and      AND3     (AND3_out, PU, PD, NOT4_out);
    /* Pullup (Strength to Weak) */ 
    rpmos    PMOS1    (NMOS_PAD, PMOSA_out, NAND1_out);
    rpmos    PMOSA    (PMOSA_out, PMOSB_out, NAND1_out);
    rpmos    PMOSB    (PMOSB_out, VDD, NAND1_out);    
    /* Pulldown (Strength to Weak) */
    rnmos    NMOS1    (NMOS_PAD, NMOSA_out, AND2_out);
    rnmos    NMOSA    (NMOSA_out, NMOSB_out, AND2_out);
    rnmos    NMOSB    (NMOSB_out, VSS, AND2_out); 
    /* keeper */ 
    not	     NOT5     (NOT5_out, NMOS_PAD);
    not	     NOT6     (NOT6_out, AND3_out);
    not	     NOT7     (NOT7_out, NOT5_out);
    rcmos    CMOS1    (NMOS_PAD, NOT7_out, AND3_out, NOT6_out);
    nmos     NMOS2    (PAD, NMOS_PAD, VDD);
    buf	     BUF2     (DI, PAD);

 `ifdef functional // functional //

  `else // functional //

  specify

    // arc IDDQ --> DI
    (IDDQ => DI) = (1.0);

    // arc IDDQ --> PAD
    (IDDQ => PAD) = (1.0);

    // arc DO --> PAD
    if (PIN1===1'b0 && PIN2===1'b0 && SR===1'b0) 
        (DO => PAD) = (1.0, 1.0);
    if (PIN1===1'b0 && PIN2===1'b0 && SR===1'b1) 
        (DO => PAD) = (1.0, 1.0);

    // arc DO --> PAD
    if (PIN1===1'b1 && PIN2===1'b0 && SR===1'b0) 
        (DO => PAD) = (1.0, 1.0);
    if (PIN1===1'b1 && PIN2===1'b0 && SR===1'b1) 
        (DO => PAD) = (1.0, 1.0);

    // arc DO --> PAD
    if (PIN1===1'b0 && PIN2===1'b1 && SR===1'b0) 
        (DO => PAD) = (1.0, 1.0);
    if (PIN1===1'b0 && PIN2===1'b1 && SR===1'b1) 
        (DO => PAD) = (1.0, 1.0);

    // arc DO --> PAD
    if (PIN1===1'b1 && PIN2===1'b1 && SR===1'b0) 
        (DO => PAD) = (1.0, 1.0);
    if (PIN1===1'b1 && PIN2===1'b1 && SR===1'b1) 
        (DO => PAD) = (1.0, 1.0);

    ifnone
        (DO => PAD) = (1.0, 1.0);

    // arc OE --> PAD
    if (PIN1===1'b0 && PIN2===1'b0 && SR===1'b0) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);
    if (PIN1===1'b0 && PIN2===1'b0 && SR===1'b1) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);

    // arc OE --> PAD
    if (PIN1===1'b1 && PIN2===1'b0 && SR===1'b0) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);
    if (PIN1===1'b1 && PIN2===1'b0 && SR===1'b1) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);

    // arc OE --> PAD
    if (PIN1===1'b0 && PIN2===1'b1 && SR===1'b0) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);
    if (PIN1===1'b0 && PIN2===1'b1 && SR===1'b1) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);

    // arc OE --> PAD
    if (PIN1===1'b1 && PIN2===1'b1 && SR===1'b0) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);
    if (PIN1===1'b1 && PIN2===1'b1 && SR===1'b1) 
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);

    ifnone
        (OE => PAD) = (1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0);

   // arc PAD --> DI
    if (PD===1'b0 && PU===1'b0 && SMT===1'b0) 
        (PAD => DI) = (1.0, 1.0);
    if (PD===1'b0 && PU===1'b0 && SMT===1'b1) 
        (PAD => DI) = (1.0, 1.0);

    // arc PAD --> DI
    if (PD===1'b1 && PU===1'b0 && SMT===1'b0) 
        (PAD => DI) = (1.0, 1.0);
    if (PD===1'b1 && PU===1'b0 && SMT===1'b1) 
        (PAD => DI) = (1.0, 1.0);

    // arc PAD --> DI
    if (PD===1'b0 && PU===1'b1 && SMT===1'b0) 
        (PAD => DI) = (1.0, 1.0);
    if (PD===1'b0 && PU===1'b1 && SMT===1'b1) 
        (PAD => DI) = (1.0, 1.0);

    // arc PAD --> DI
    if (PD===1'b1 && PU===1'b1 && SMT===1'b0) 
        (PAD => DI) = (1.0, 1.0);
    if (PD===1'b1 && PU===1'b1 && SMT===1'b1) 
        (PAD => DI) = (1.0, 1.0);

    ifnone
        (PAD => DI) = (1.0, 1.0);

 

  endspecify

  `endif // functional //

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IVDD (VDD, VSS);
   inout VDD, VSS;
   supply1 VDD;
   supply0 VSS;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IVDDANA (VDDANA, VSSANA);
   inout VDDANA, VSSANA;
   supply1 VDDANA;
   supply0 VSSANA;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IVDDANAC (VDDANAC, VSSANAC);
   inout VDDANAC, VSSANAC;
   supply1 VDDANAC;
   supply0 VSSANAC;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IVDDIO (VDD, VDDIO, VSSIO);
   inout VDD, VDDIO, VSSIO;
   supply1 VDD, VDDIO;
   supply0 VSSIO;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IVSS (VDDIO, VSS, VSSIO);
   inout VDDIO, VSS, VSSIO;
   supply1 VDDIO;
   supply0 VSS, VSSIO;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IVSSANA (VDDANA, VSSANA);
   inout VDDANA, VSSANA;
   supply1 VDDANA;
   supply0 VSSANA;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IVSSANAC (VDDANAC, VSSANAC);
   inout VDDANAC, VSSANAC;
   supply1 VDDANAC;
   supply0 VSSANAC;

   specify
   endspecify

endmodule

`endcelldefine

//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

`timescale 1 ns/1 ps

`celldefine

module IVSSIO (VDD, VSSIO);
   inout VDD, VSSIO;
   supply1 VDD;
   supply0 VSSIO;

   specify
   endspecify

endmodule

`endcelldefine

