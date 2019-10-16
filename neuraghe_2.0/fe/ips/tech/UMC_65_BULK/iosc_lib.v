//*************************************
//***     UMC 65 nm IO Verilog     ***
//*************************************

//`timescale 1 ns / 1 ps

`ifdef functional
				// none
`else
	`define SMC_NFORCE 1 	// Flag to force output to x if notifer changes
`endif

`celldefine

module IOSC (PD, XIN, XO, XOUT, VDD, VDDIO, VSS, VSSIO);
  input PD, XIN;
  output XO, XOUT;
  inout VDD, VDDIO, VSS, VSSIO;
  supply1 VDD, VDDIO;
  supply0 VSS, VSSIO;

    buf SMC_I0(OUT0, PD);
    buf SMC_I1(OUT1, XIN);
    or SMC_I2(XO, OUT0, OUT1);
    not SMC_I3(PD_bar, PD);
    not SMC_I4(XIN_bar, XIN);
    and SMC_I5(XOUT, PD_bar, XIN_bar);

  `ifdef functional // functional //

  `else // functional //

  specify

    // arc PD --> XO
    (PD => XO) = (1.0, 1.0);

    // arc PD --> XOUT
    (PD => XOUT) = (1.0, 1.0);

    // arc XIN --> XO
    (XIN => XO) = (1.0, 1.0);

    // arc XIN --> XOUT
    (XIN => XOUT) = (1.0, 1.0);

  endspecify

  `endif // functional //

endmodule

`endcelldefine

