`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_AO112X17_A_R_Z_R_100 0.1
`define C12T32_LLUAL4_AO112X17_A_F_Z_F_100 0.1
`define C12T32_LLUAL4_AO112X17_B_R_Z_R_100 0.1
`define C12T32_LLUAL4_AO112X17_B_F_Z_F_100 0.1
`define C12T32_LLUAL4_AO112X17_C_R_Z_R_010 0.1
`define C12T32_LLUAL4_AO112X17_C_F_Z_F_010 0.1
`define C12T32_LLUAL4_AO112X17_C_R_Z_R_000 0.1
`define C12T32_LLUAL4_AO112X17_C_F_Z_F_000 0.1
`define C12T32_LLUAL4_AO112X17_C_R_Z_R_100 0.1
`define C12T32_LLUAL4_AO112X17_C_F_Z_F_100 0.1
`define C12T32_LLUAL4_AO112X17_D_R_Z_R_010 0.1
`define C12T32_LLUAL4_AO112X17_D_F_Z_F_010 0.1
`define C12T32_LLUAL4_AO112X17_D_R_Z_R_000 0.1
`define C12T32_LLUAL4_AO112X17_D_F_Z_F_000 0.1
`define C12T32_LLUAL4_AO112X17_D_R_Z_R_100 0.1
`define C12T32_LLUAL4_AO112X17_D_F_Z_F_100 0.1

module C12T32_LLUAL4_AO112X17 (Z, A, B, C, D);

	output Z;
	input A;
	input B;
	input C;
	input D;

	and    U1 (INTERNAL1, A, B) ;
	or   #1 U2 (Z, INTERNAL1, C, D) ;



	specify

		if (B && !C && !D) (A +=> Z) = (`C12T32_LLUAL4_AO112X17_A_R_Z_R_100,`C12T32_LLUAL4_AO112X17_A_F_Z_F_100);
		if (A && !C && !D) (B +=> Z) = (`C12T32_LLUAL4_AO112X17_B_R_Z_R_100,`C12T32_LLUAL4_AO112X17_B_F_Z_F_100);
		if (!A && B && !D) (C +=> Z) = (`C12T32_LLUAL4_AO112X17_C_R_Z_R_010,`C12T32_LLUAL4_AO112X17_C_F_Z_F_010);
		if (!A && !B && !D) (C +=> Z) = (`C12T32_LLUAL4_AO112X17_C_R_Z_R_000,`C12T32_LLUAL4_AO112X17_C_F_Z_F_000);
		if (A && !B && !D) (C +=> Z) = (`C12T32_LLUAL4_AO112X17_C_R_Z_R_100,`C12T32_LLUAL4_AO112X17_C_F_Z_F_100);
		if (!A && B && !C) (D +=> Z) = (`C12T32_LLUAL4_AO112X17_D_R_Z_R_010,`C12T32_LLUAL4_AO112X17_D_F_Z_F_010);
		if (!A && !B && !C) (D +=> Z) = (`C12T32_LLUAL4_AO112X17_D_R_Z_R_000,`C12T32_LLUAL4_AO112X17_D_F_Z_F_000);
		if (A && !B && !C) (D +=> Z) = (`C12T32_LLUAL4_AO112X17_D_R_Z_R_100,`C12T32_LLUAL4_AO112X17_D_F_Z_F_100);


	endspecify

endmodule // C12T32_LLUAL4_AO112X17


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_AO112X8_A_R_Z_R_100 0.1
`define C12T32_LLUAL4_AO112X8_A_F_Z_F_100 0.1
`define C12T32_LLUAL4_AO112X8_B_R_Z_R_100 0.1
`define C12T32_LLUAL4_AO112X8_B_F_Z_F_100 0.1
`define C12T32_LLUAL4_AO112X8_C_R_Z_R_010 0.1
`define C12T32_LLUAL4_AO112X8_C_F_Z_F_010 0.1
`define C12T32_LLUAL4_AO112X8_C_R_Z_R_000 0.1
`define C12T32_LLUAL4_AO112X8_C_F_Z_F_000 0.1
`define C12T32_LLUAL4_AO112X8_C_R_Z_R_100 0.1
`define C12T32_LLUAL4_AO112X8_C_F_Z_F_100 0.1
`define C12T32_LLUAL4_AO112X8_D_R_Z_R_010 0.1
`define C12T32_LLUAL4_AO112X8_D_F_Z_F_010 0.1
`define C12T32_LLUAL4_AO112X8_D_R_Z_R_000 0.1
`define C12T32_LLUAL4_AO112X8_D_F_Z_F_000 0.1
`define C12T32_LLUAL4_AO112X8_D_R_Z_R_100 0.1
`define C12T32_LLUAL4_AO112X8_D_F_Z_F_100 0.1

module C12T32_LLUAL4_AO112X8 (Z, A, B, C, D);

	output Z;
	input A;
	input B;
	input C;
	input D;

	and    U1 (INTERNAL1, A, B) ;
	or   #1 U2 (Z, INTERNAL1, C, D) ;



	specify

		if (B && !C && !D) (A +=> Z) = (`C12T32_LLUAL4_AO112X8_A_R_Z_R_100,`C12T32_LLUAL4_AO112X8_A_F_Z_F_100);
		if (A && !C && !D) (B +=> Z) = (`C12T32_LLUAL4_AO112X8_B_R_Z_R_100,`C12T32_LLUAL4_AO112X8_B_F_Z_F_100);
		if (!A && B && !D) (C +=> Z) = (`C12T32_LLUAL4_AO112X8_C_R_Z_R_010,`C12T32_LLUAL4_AO112X8_C_F_Z_F_010);
		if (!A && !B && !D) (C +=> Z) = (`C12T32_LLUAL4_AO112X8_C_R_Z_R_000,`C12T32_LLUAL4_AO112X8_C_F_Z_F_000);
		if (A && !B && !D) (C +=> Z) = (`C12T32_LLUAL4_AO112X8_C_R_Z_R_100,`C12T32_LLUAL4_AO112X8_C_F_Z_F_100);
		if (!A && B && !C) (D +=> Z) = (`C12T32_LLUAL4_AO112X8_D_R_Z_R_010,`C12T32_LLUAL4_AO112X8_D_F_Z_F_010);
		if (!A && !B && !C) (D +=> Z) = (`C12T32_LLUAL4_AO112X8_D_R_Z_R_000,`C12T32_LLUAL4_AO112X8_D_F_Z_F_000);
		if (A && !B && !C) (D +=> Z) = (`C12T32_LLUAL4_AO112X8_D_R_Z_R_100,`C12T32_LLUAL4_AO112X8_D_F_Z_F_100);


	endspecify

endmodule // C12T32_LLUAL4_AO112X8


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_AO12X17_A_R_Z_R_10 0.1
`define C12T32_LLUAL4_AO12X17_A_F_Z_F_10 0.1
`define C12T32_LLUAL4_AO12X17_B_R_Z_R_10 0.1
`define C12T32_LLUAL4_AO12X17_B_F_Z_F_10 0.1
`define C12T32_LLUAL4_AO12X17_C_R_Z_R_00 0.1
`define C12T32_LLUAL4_AO12X17_C_F_Z_F_00 0.1
`define C12T32_LLUAL4_AO12X17_C_R_Z_R_10 0.1
`define C12T32_LLUAL4_AO12X17_C_F_Z_F_10 0.1
`define C12T32_LLUAL4_AO12X17_C_R_Z_R_01 0.1
`define C12T32_LLUAL4_AO12X17_C_F_Z_F_01 0.1

module C12T32_LLUAL4_AO12X17 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and    U1 (INTERNAL1, A, B) ;
	or   #1 U2 (Z, INTERNAL1, C) ;



	specify

		if (B && !C) (A +=> Z) = (`C12T32_LLUAL4_AO12X17_A_R_Z_R_10,`C12T32_LLUAL4_AO12X17_A_F_Z_F_10);
		if (A && !C) (B +=> Z) = (`C12T32_LLUAL4_AO12X17_B_R_Z_R_10,`C12T32_LLUAL4_AO12X17_B_F_Z_F_10);
		if (!A && !B) (C +=> Z) = (`C12T32_LLUAL4_AO12X17_C_R_Z_R_00,`C12T32_LLUAL4_AO12X17_C_F_Z_F_00);
		if (A && !B) (C +=> Z) = (`C12T32_LLUAL4_AO12X17_C_R_Z_R_10,`C12T32_LLUAL4_AO12X17_C_F_Z_F_10);
		if (!A && B) (C +=> Z) = (`C12T32_LLUAL4_AO12X17_C_R_Z_R_01,`C12T32_LLUAL4_AO12X17_C_F_Z_F_01);


	endspecify

endmodule // C12T32_LLUAL4_AO12X17


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_AO12X8_A_R_Z_R_10 0.1
`define C12T32_LLUAL4_AO12X8_A_F_Z_F_10 0.1
`define C12T32_LLUAL4_AO12X8_B_R_Z_R_10 0.1
`define C12T32_LLUAL4_AO12X8_B_F_Z_F_10 0.1
`define C12T32_LLUAL4_AO12X8_C_R_Z_R_00 0.1
`define C12T32_LLUAL4_AO12X8_C_F_Z_F_00 0.1
`define C12T32_LLUAL4_AO12X8_C_R_Z_R_10 0.1
`define C12T32_LLUAL4_AO12X8_C_F_Z_F_10 0.1
`define C12T32_LLUAL4_AO12X8_C_R_Z_R_01 0.1
`define C12T32_LLUAL4_AO12X8_C_F_Z_F_01 0.1

module C12T32_LLUAL4_AO12X8 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and    U1 (INTERNAL1, A, B) ;
	or   #1 U2 (Z, INTERNAL1, C) ;



	specify

		if (B && !C) (A +=> Z) = (`C12T32_LLUAL4_AO12X8_A_R_Z_R_10,`C12T32_LLUAL4_AO12X8_A_F_Z_F_10);
		if (A && !C) (B +=> Z) = (`C12T32_LLUAL4_AO12X8_B_R_Z_R_10,`C12T32_LLUAL4_AO12X8_B_F_Z_F_10);
		if (!A && !B) (C +=> Z) = (`C12T32_LLUAL4_AO12X8_C_R_Z_R_00,`C12T32_LLUAL4_AO12X8_C_F_Z_F_00);
		if (A && !B) (C +=> Z) = (`C12T32_LLUAL4_AO12X8_C_R_Z_R_10,`C12T32_LLUAL4_AO12X8_C_F_Z_F_10);
		if (!A && B) (C +=> Z) = (`C12T32_LLUAL4_AO12X8_C_R_Z_R_01,`C12T32_LLUAL4_AO12X8_C_F_Z_F_01);


	endspecify

endmodule // C12T32_LLUAL4_AO12X8


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_AOI21X11_A_R_Z_F_10 0.1
`define C12T32_LLUAL4_AOI21X11_A_F_Z_R_10 0.1
`define C12T32_LLUAL4_AOI21X11_B_R_Z_F_10 0.1
`define C12T32_LLUAL4_AOI21X11_B_F_Z_R_10 0.1
`define C12T32_LLUAL4_AOI21X11_C_R_Z_F_00 0.1
`define C12T32_LLUAL4_AOI21X11_C_F_Z_R_00 0.1
`define C12T32_LLUAL4_AOI21X11_C_R_Z_F_10 0.1
`define C12T32_LLUAL4_AOI21X11_C_F_Z_R_10 0.1
`define C12T32_LLUAL4_AOI21X11_C_R_Z_F_01 0.1
`define C12T32_LLUAL4_AOI21X11_C_F_Z_R_01 0.1

module C12T32_LLUAL4_AOI21X11 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	not   #1 U3 (Z, INTERNAL1) ;



	specify

		if (B && !C) (A -=> Z) = (`C12T32_LLUAL4_AOI21X11_A_F_Z_R_10,`C12T32_LLUAL4_AOI21X11_A_R_Z_F_10);
		if (A && !C) (B -=> Z) = (`C12T32_LLUAL4_AOI21X11_B_F_Z_R_10,`C12T32_LLUAL4_AOI21X11_B_R_Z_F_10);
		if (!A && !B) (C -=> Z) = (`C12T32_LLUAL4_AOI21X11_C_F_Z_R_00,`C12T32_LLUAL4_AOI21X11_C_R_Z_F_00);
		if (A && !B) (C -=> Z) = (`C12T32_LLUAL4_AOI21X11_C_F_Z_R_10,`C12T32_LLUAL4_AOI21X11_C_R_Z_F_10);
		if (!A && B) (C -=> Z) = (`C12T32_LLUAL4_AOI21X11_C_F_Z_R_01,`C12T32_LLUAL4_AOI21X11_C_R_Z_F_01);


	endspecify

endmodule // C12T32_LLUAL4_AOI21X11


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_CBI4I6X11_A_R_Z_F_010 0.1
`define C12T32_LLUAL4_CBI4I6X11_A_F_Z_R_010 0.1
`define C12T32_LLUAL4_CBI4I6X11_B_R_Z_F_010 0.1
`define C12T32_LLUAL4_CBI4I6X11_B_F_Z_R_010 0.1
`define C12T32_LLUAL4_CBI4I6X11_C_R_Z_F_010 0.1
`define C12T32_LLUAL4_CBI4I6X11_C_F_Z_R_010 0.1
`define C12T32_LLUAL4_CBI4I6X11_C_R_Z_F_110 0.1
`define C12T32_LLUAL4_CBI4I6X11_C_F_Z_R_110 0.1
`define C12T32_LLUAL4_CBI4I6X11_C_R_Z_F_100 0.1
`define C12T32_LLUAL4_CBI4I6X11_C_F_Z_R_100 0.1
`define C12T32_LLUAL4_CBI4I6X11_D_R_Z_F_010 0.1
`define C12T32_LLUAL4_CBI4I6X11_D_F_Z_R_010 0.1
`define C12T32_LLUAL4_CBI4I6X11_D_R_Z_F_001 0.1
`define C12T32_LLUAL4_CBI4I6X11_D_F_Z_R_001 0.1
`define C12T32_LLUAL4_CBI4I6X11_D_R_Z_F_000 0.1
`define C12T32_LLUAL4_CBI4I6X11_D_F_Z_R_000 0.1
`define C12T32_LLUAL4_CBI4I6X11_D_R_Z_F_110 0.1
`define C12T32_LLUAL4_CBI4I6X11_D_F_Z_R_110 0.1
`define C12T32_LLUAL4_CBI4I6X11_D_R_Z_F_100 0.1
`define C12T32_LLUAL4_CBI4I6X11_D_F_Z_R_100 0.1

module C12T32_LLUAL4_CBI4I6X11 (Z, A, B, C, D);

	output Z;
	input A;
	input B;
	input C;
	input D;

	or    U1 (INTERNAL3, A, B) ;
	and    U2 (INTERNAL2, INTERNAL3, C) ;
	or    U3 (INTERNAL1, INTERNAL2, D) ;
	not   #1 U4 (Z, INTERNAL1) ;



	specify

		if (!B && C && !D) (A -=> Z) = (`C12T32_LLUAL4_CBI4I6X11_A_F_Z_R_010,`C12T32_LLUAL4_CBI4I6X11_A_R_Z_F_010);
		if (!A && C && !D) (B -=> Z) = (`C12T32_LLUAL4_CBI4I6X11_B_F_Z_R_010,`C12T32_LLUAL4_CBI4I6X11_B_R_Z_F_010);
		if (!A && B && !D) (C -=> Z) = (`C12T32_LLUAL4_CBI4I6X11_C_F_Z_R_010,`C12T32_LLUAL4_CBI4I6X11_C_R_Z_F_010);
		if (A && B && !D) (C -=> Z) = (`C12T32_LLUAL4_CBI4I6X11_C_F_Z_R_110,`C12T32_LLUAL4_CBI4I6X11_C_R_Z_F_110);
		if (A && !B && !D) (C -=> Z) = (`C12T32_LLUAL4_CBI4I6X11_C_F_Z_R_100,`C12T32_LLUAL4_CBI4I6X11_C_R_Z_F_100);
		if (!A && B && !C) (D -=> Z) = (`C12T32_LLUAL4_CBI4I6X11_D_F_Z_R_010,`C12T32_LLUAL4_CBI4I6X11_D_R_Z_F_010);
		if (!A && !B && C) (D -=> Z) = (`C12T32_LLUAL4_CBI4I6X11_D_F_Z_R_001,`C12T32_LLUAL4_CBI4I6X11_D_R_Z_F_001);
		if (!A && !B && !C) (D -=> Z) = (`C12T32_LLUAL4_CBI4I6X11_D_F_Z_R_000,`C12T32_LLUAL4_CBI4I6X11_D_R_Z_F_000);
		if (A && B && !C) (D -=> Z) = (`C12T32_LLUAL4_CBI4I6X11_D_F_Z_R_110,`C12T32_LLUAL4_CBI4I6X11_D_R_Z_F_110);
		if (A && !B && !C) (D -=> Z) = (`C12T32_LLUAL4_CBI4I6X11_D_F_Z_R_100,`C12T32_LLUAL4_CBI4I6X11_D_R_Z_F_100);


	endspecify

endmodule // C12T32_LLUAL4_CBI4I6X11


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_CBI4I6X5_A_R_Z_F_010 0.1
`define C12T32_LLUAL4_CBI4I6X5_A_F_Z_R_010 0.1
`define C12T32_LLUAL4_CBI4I6X5_B_R_Z_F_010 0.1
`define C12T32_LLUAL4_CBI4I6X5_B_F_Z_R_010 0.1
`define C12T32_LLUAL4_CBI4I6X5_C_R_Z_F_010 0.1
`define C12T32_LLUAL4_CBI4I6X5_C_F_Z_R_010 0.1
`define C12T32_LLUAL4_CBI4I6X5_C_R_Z_F_110 0.1
`define C12T32_LLUAL4_CBI4I6X5_C_F_Z_R_110 0.1
`define C12T32_LLUAL4_CBI4I6X5_C_R_Z_F_100 0.1
`define C12T32_LLUAL4_CBI4I6X5_C_F_Z_R_100 0.1
`define C12T32_LLUAL4_CBI4I6X5_D_R_Z_F_010 0.1
`define C12T32_LLUAL4_CBI4I6X5_D_F_Z_R_010 0.1
`define C12T32_LLUAL4_CBI4I6X5_D_R_Z_F_001 0.1
`define C12T32_LLUAL4_CBI4I6X5_D_F_Z_R_001 0.1
`define C12T32_LLUAL4_CBI4I6X5_D_R_Z_F_000 0.1
`define C12T32_LLUAL4_CBI4I6X5_D_F_Z_R_000 0.1
`define C12T32_LLUAL4_CBI4I6X5_D_R_Z_F_110 0.1
`define C12T32_LLUAL4_CBI4I6X5_D_F_Z_R_110 0.1
`define C12T32_LLUAL4_CBI4I6X5_D_R_Z_F_100 0.1
`define C12T32_LLUAL4_CBI4I6X5_D_F_Z_R_100 0.1

module C12T32_LLUAL4_CBI4I6X5 (Z, A, B, C, D);

	output Z;
	input A;
	input B;
	input C;
	input D;

	or    U1 (INTERNAL3, A, B) ;
	and    U2 (INTERNAL2, INTERNAL3, C) ;
	or    U3 (INTERNAL1, INTERNAL2, D) ;
	not   #1 U4 (Z, INTERNAL1) ;



	specify

		if (!B && C && !D) (A -=> Z) = (`C12T32_LLUAL4_CBI4I6X5_A_F_Z_R_010,`C12T32_LLUAL4_CBI4I6X5_A_R_Z_F_010);
		if (!A && C && !D) (B -=> Z) = (`C12T32_LLUAL4_CBI4I6X5_B_F_Z_R_010,`C12T32_LLUAL4_CBI4I6X5_B_R_Z_F_010);
		if (!A && B && !D) (C -=> Z) = (`C12T32_LLUAL4_CBI4I6X5_C_F_Z_R_010,`C12T32_LLUAL4_CBI4I6X5_C_R_Z_F_010);
		if (A && B && !D) (C -=> Z) = (`C12T32_LLUAL4_CBI4I6X5_C_F_Z_R_110,`C12T32_LLUAL4_CBI4I6X5_C_R_Z_F_110);
		if (A && !B && !D) (C -=> Z) = (`C12T32_LLUAL4_CBI4I6X5_C_F_Z_R_100,`C12T32_LLUAL4_CBI4I6X5_C_R_Z_F_100);
		if (!A && B && !C) (D -=> Z) = (`C12T32_LLUAL4_CBI4I6X5_D_F_Z_R_010,`C12T32_LLUAL4_CBI4I6X5_D_R_Z_F_010);
		if (!A && !B && C) (D -=> Z) = (`C12T32_LLUAL4_CBI4I6X5_D_F_Z_R_001,`C12T32_LLUAL4_CBI4I6X5_D_R_Z_F_001);
		if (!A && !B && !C) (D -=> Z) = (`C12T32_LLUAL4_CBI4I6X5_D_F_Z_R_000,`C12T32_LLUAL4_CBI4I6X5_D_R_Z_F_000);
		if (A && B && !C) (D -=> Z) = (`C12T32_LLUAL4_CBI4I6X5_D_F_Z_R_110,`C12T32_LLUAL4_CBI4I6X5_D_R_Z_F_110);
		if (A && !B && !C) (D -=> Z) = (`C12T32_LLUAL4_CBI4I6X5_D_F_Z_R_100,`C12T32_LLUAL4_CBI4I6X5_D_R_Z_F_100);


	endspecify

endmodule // C12T32_LLUAL4_CBI4I6X5


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_FA1X6_A0_R_CO_R_10 0.1
`define C12T32_LLUAL4_FA1X6_A0_F_CO_F_10 0.1
`define C12T32_LLUAL4_FA1X6_A0_R_CO_R_01 0.1
`define C12T32_LLUAL4_FA1X6_A0_F_CO_F_01 0.1
`define C12T32_LLUAL4_FA1X6_A0_R_S0_F_10 0.1
`define C12T32_LLUAL4_FA1X6_A0_F_S0_R_10 0.1
`define C12T32_LLUAL4_FA1X6_A0_R_S0_F_01 0.1
`define C12T32_LLUAL4_FA1X6_A0_F_S0_R_01 0.1
`define C12T32_LLUAL4_FA1X6_A0_R_S0_R_00 0.1
`define C12T32_LLUAL4_FA1X6_A0_F_S0_F_00 0.1
`define C12T32_LLUAL4_FA1X6_A0_R_S0_R_11 0.1
`define C12T32_LLUAL4_FA1X6_A0_F_S0_F_11 0.1
`define C12T32_LLUAL4_FA1X6_B0_R_CO_R_10 0.1
`define C12T32_LLUAL4_FA1X6_B0_F_CO_F_10 0.1
`define C12T32_LLUAL4_FA1X6_B0_R_CO_R_01 0.1
`define C12T32_LLUAL4_FA1X6_B0_F_CO_F_01 0.1
`define C12T32_LLUAL4_FA1X6_B0_R_S0_F_10 0.1
`define C12T32_LLUAL4_FA1X6_B0_F_S0_R_10 0.1
`define C12T32_LLUAL4_FA1X6_B0_R_S0_F_01 0.1
`define C12T32_LLUAL4_FA1X6_B0_F_S0_R_01 0.1
`define C12T32_LLUAL4_FA1X6_B0_R_S0_R_00 0.1
`define C12T32_LLUAL4_FA1X6_B0_F_S0_F_00 0.1
`define C12T32_LLUAL4_FA1X6_B0_R_S0_R_11 0.1
`define C12T32_LLUAL4_FA1X6_B0_F_S0_F_11 0.1
`define C12T32_LLUAL4_FA1X6_CI_R_CO_R_10 0.1
`define C12T32_LLUAL4_FA1X6_CI_F_CO_F_10 0.1
`define C12T32_LLUAL4_FA1X6_CI_R_CO_R_01 0.1
`define C12T32_LLUAL4_FA1X6_CI_F_CO_F_01 0.1
`define C12T32_LLUAL4_FA1X6_CI_R_S0_F_10 0.1
`define C12T32_LLUAL4_FA1X6_CI_F_S0_R_10 0.1
`define C12T32_LLUAL4_FA1X6_CI_R_S0_F_01 0.1
`define C12T32_LLUAL4_FA1X6_CI_F_S0_R_01 0.1
`define C12T32_LLUAL4_FA1X6_CI_R_S0_R_00 0.1
`define C12T32_LLUAL4_FA1X6_CI_F_S0_F_00 0.1
`define C12T32_LLUAL4_FA1X6_CI_R_S0_R_11 0.1
`define C12T32_LLUAL4_FA1X6_CI_F_S0_F_11 0.1

module C12T32_LLUAL4_FA1X6 (S0, CO, A0, B0, CI);

	output S0;
	output CO;
	input A0;
	input B0;
	input CI;

	xor   #1 U1 (S0, A0, B0, CI) ;
	or    U2 (INTERNAL2, A0, B0) ;
	and    U3 (INTERNAL1, INTERNAL2, CI) ;
	and    U4 (INTERNAL3, A0, B0) ;
	or   #1 U5 (CO, INTERNAL1, INTERNAL3) ;



	specify

		if (B0 && !CI) (A0 +=> CO) = (`C12T32_LLUAL4_FA1X6_A0_R_CO_R_10,`C12T32_LLUAL4_FA1X6_A0_F_CO_F_10);
		if (!B0 && CI) (A0 +=> CO) = (`C12T32_LLUAL4_FA1X6_A0_R_CO_R_01,`C12T32_LLUAL4_FA1X6_A0_F_CO_F_01);
		if (B0 && !CI) (A0 -=> S0) = (`C12T32_LLUAL4_FA1X6_A0_F_S0_R_10,`C12T32_LLUAL4_FA1X6_A0_R_S0_F_10);
		if (!B0 && CI) (A0 -=> S0) = (`C12T32_LLUAL4_FA1X6_A0_F_S0_R_01,`C12T32_LLUAL4_FA1X6_A0_R_S0_F_01);
		if (!B0 && !CI) (A0 +=> S0) = (`C12T32_LLUAL4_FA1X6_A0_R_S0_R_00,`C12T32_LLUAL4_FA1X6_A0_F_S0_F_00);
		if (B0 && CI) (A0 +=> S0) = (`C12T32_LLUAL4_FA1X6_A0_R_S0_R_11,`C12T32_LLUAL4_FA1X6_A0_F_S0_F_11);
		if (A0 && !CI) (B0 +=> CO) = (`C12T32_LLUAL4_FA1X6_B0_R_CO_R_10,`C12T32_LLUAL4_FA1X6_B0_F_CO_F_10);
		if (!A0 && CI) (B0 +=> CO) = (`C12T32_LLUAL4_FA1X6_B0_R_CO_R_01,`C12T32_LLUAL4_FA1X6_B0_F_CO_F_01);
		if (A0 && !CI) (B0 -=> S0) = (`C12T32_LLUAL4_FA1X6_B0_F_S0_R_10,`C12T32_LLUAL4_FA1X6_B0_R_S0_F_10);
		if (!A0 && CI) (B0 -=> S0) = (`C12T32_LLUAL4_FA1X6_B0_F_S0_R_01,`C12T32_LLUAL4_FA1X6_B0_R_S0_F_01);
		if (!A0 && !CI) (B0 +=> S0) = (`C12T32_LLUAL4_FA1X6_B0_R_S0_R_00,`C12T32_LLUAL4_FA1X6_B0_F_S0_F_00);
		if (A0 && CI) (B0 +=> S0) = (`C12T32_LLUAL4_FA1X6_B0_R_S0_R_11,`C12T32_LLUAL4_FA1X6_B0_F_S0_F_11);
		if (A0 && !B0) (CI +=> CO) = (`C12T32_LLUAL4_FA1X6_CI_R_CO_R_10,`C12T32_LLUAL4_FA1X6_CI_F_CO_F_10);
		if (!A0 && B0) (CI +=> CO) = (`C12T32_LLUAL4_FA1X6_CI_R_CO_R_01,`C12T32_LLUAL4_FA1X6_CI_F_CO_F_01);
		if (A0 && !B0) (CI -=> S0) = (`C12T32_LLUAL4_FA1X6_CI_F_S0_R_10,`C12T32_LLUAL4_FA1X6_CI_R_S0_F_10);
		if (!A0 && B0) (CI -=> S0) = (`C12T32_LLUAL4_FA1X6_CI_F_S0_R_01,`C12T32_LLUAL4_FA1X6_CI_R_S0_F_01);
		if (!A0 && !B0) (CI +=> S0) = (`C12T32_LLUAL4_FA1X6_CI_R_S0_R_00,`C12T32_LLUAL4_FA1X6_CI_F_S0_F_00);
		if (A0 && B0) (CI +=> S0) = (`C12T32_LLUAL4_FA1X6_CI_R_S0_R_11,`C12T32_LLUAL4_FA1X6_CI_F_S0_F_11);


	endspecify

endmodule // C12T32_LLUAL4_FA1X6


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_OA112X17_A_R_Z_R_011 0.1
`define C12T32_LLUAL4_OA112X17_A_F_Z_F_011 0.1
`define C12T32_LLUAL4_OA112X17_B_R_Z_R_011 0.1
`define C12T32_LLUAL4_OA112X17_B_F_Z_F_011 0.1
`define C12T32_LLUAL4_OA112X17_C_R_Z_R_101 0.1
`define C12T32_LLUAL4_OA112X17_C_F_Z_F_101 0.1
`define C12T32_LLUAL4_OA112X17_C_R_Z_R_011 0.1
`define C12T32_LLUAL4_OA112X17_C_F_Z_F_011 0.1
`define C12T32_LLUAL4_OA112X17_C_R_Z_R_111 0.1
`define C12T32_LLUAL4_OA112X17_C_F_Z_F_111 0.1
`define C12T32_LLUAL4_OA112X17_D_R_Z_R_101 0.1
`define C12T32_LLUAL4_OA112X17_D_F_Z_F_101 0.1
`define C12T32_LLUAL4_OA112X17_D_R_Z_R_011 0.1
`define C12T32_LLUAL4_OA112X17_D_F_Z_F_011 0.1
`define C12T32_LLUAL4_OA112X17_D_R_Z_R_111 0.1
`define C12T32_LLUAL4_OA112X17_D_F_Z_F_111 0.1

module C12T32_LLUAL4_OA112X17 (Z, A, B, C, D);

	output Z;
	input A;
	input B;
	input C;
	input D;

	or    U1 (INTERNAL1, A, B) ;
	and   #1 U2 (Z, INTERNAL1, C, D) ;



	specify

		if (!B && C && D) (A +=> Z) = (`C12T32_LLUAL4_OA112X17_A_R_Z_R_011,`C12T32_LLUAL4_OA112X17_A_F_Z_F_011);
		if (!A && C && D) (B +=> Z) = (`C12T32_LLUAL4_OA112X17_B_R_Z_R_011,`C12T32_LLUAL4_OA112X17_B_F_Z_F_011);
		if (A && !B && D) (C +=> Z) = (`C12T32_LLUAL4_OA112X17_C_R_Z_R_101,`C12T32_LLUAL4_OA112X17_C_F_Z_F_101);
		if (!A && B && D) (C +=> Z) = (`C12T32_LLUAL4_OA112X17_C_R_Z_R_011,`C12T32_LLUAL4_OA112X17_C_F_Z_F_011);
		if (A && B && D) (C +=> Z) = (`C12T32_LLUAL4_OA112X17_C_R_Z_R_111,`C12T32_LLUAL4_OA112X17_C_F_Z_F_111);
		if (A && !B && C) (D +=> Z) = (`C12T32_LLUAL4_OA112X17_D_R_Z_R_101,`C12T32_LLUAL4_OA112X17_D_F_Z_F_101);
		if (!A && B && C) (D +=> Z) = (`C12T32_LLUAL4_OA112X17_D_R_Z_R_011,`C12T32_LLUAL4_OA112X17_D_F_Z_F_011);
		if (A && B && C) (D +=> Z) = (`C12T32_LLUAL4_OA112X17_D_R_Z_R_111,`C12T32_LLUAL4_OA112X17_D_F_Z_F_111);


	endspecify

endmodule // C12T32_LLUAL4_OA112X17


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_OA112X8_A_R_Z_R_011 0.1
`define C12T32_LLUAL4_OA112X8_A_F_Z_F_011 0.1
`define C12T32_LLUAL4_OA112X8_B_R_Z_R_011 0.1
`define C12T32_LLUAL4_OA112X8_B_F_Z_F_011 0.1
`define C12T32_LLUAL4_OA112X8_C_R_Z_R_101 0.1
`define C12T32_LLUAL4_OA112X8_C_F_Z_F_101 0.1
`define C12T32_LLUAL4_OA112X8_C_R_Z_R_011 0.1
`define C12T32_LLUAL4_OA112X8_C_F_Z_F_011 0.1
`define C12T32_LLUAL4_OA112X8_C_R_Z_R_111 0.1
`define C12T32_LLUAL4_OA112X8_C_F_Z_F_111 0.1
`define C12T32_LLUAL4_OA112X8_D_R_Z_R_101 0.1
`define C12T32_LLUAL4_OA112X8_D_F_Z_F_101 0.1
`define C12T32_LLUAL4_OA112X8_D_R_Z_R_011 0.1
`define C12T32_LLUAL4_OA112X8_D_F_Z_F_011 0.1
`define C12T32_LLUAL4_OA112X8_D_R_Z_R_111 0.1
`define C12T32_LLUAL4_OA112X8_D_F_Z_F_111 0.1

module C12T32_LLUAL4_OA112X8 (Z, A, B, C, D);

	output Z;
	input A;
	input B;
	input C;
	input D;

	or    U1 (INTERNAL1, A, B) ;
	and   #1 U2 (Z, INTERNAL1, C, D) ;



	specify

		if (!B && C && D) (A +=> Z) = (`C12T32_LLUAL4_OA112X8_A_R_Z_R_011,`C12T32_LLUAL4_OA112X8_A_F_Z_F_011);
		if (!A && C && D) (B +=> Z) = (`C12T32_LLUAL4_OA112X8_B_R_Z_R_011,`C12T32_LLUAL4_OA112X8_B_F_Z_F_011);
		if (A && !B && D) (C +=> Z) = (`C12T32_LLUAL4_OA112X8_C_R_Z_R_101,`C12T32_LLUAL4_OA112X8_C_F_Z_F_101);
		if (!A && B && D) (C +=> Z) = (`C12T32_LLUAL4_OA112X8_C_R_Z_R_011,`C12T32_LLUAL4_OA112X8_C_F_Z_F_011);
		if (A && B && D) (C +=> Z) = (`C12T32_LLUAL4_OA112X8_C_R_Z_R_111,`C12T32_LLUAL4_OA112X8_C_F_Z_F_111);
		if (A && !B && C) (D +=> Z) = (`C12T32_LLUAL4_OA112X8_D_R_Z_R_101,`C12T32_LLUAL4_OA112X8_D_F_Z_F_101);
		if (!A && B && C) (D +=> Z) = (`C12T32_LLUAL4_OA112X8_D_R_Z_R_011,`C12T32_LLUAL4_OA112X8_D_F_Z_F_011);
		if (A && B && C) (D +=> Z) = (`C12T32_LLUAL4_OA112X8_D_R_Z_R_111,`C12T32_LLUAL4_OA112X8_D_F_Z_F_111);


	endspecify

endmodule // C12T32_LLUAL4_OA112X8


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_OA12X17_A_R_Z_R_01 0.1
`define C12T32_LLUAL4_OA12X17_A_F_Z_F_01 0.1
`define C12T32_LLUAL4_OA12X17_B_R_Z_R_01 0.1
`define C12T32_LLUAL4_OA12X17_B_F_Z_F_01 0.1
`define C12T32_LLUAL4_OA12X17_C_R_Z_R_01 0.1
`define C12T32_LLUAL4_OA12X17_C_F_Z_F_01 0.1
`define C12T32_LLUAL4_OA12X17_C_R_Z_R_11 0.1
`define C12T32_LLUAL4_OA12X17_C_F_Z_F_11 0.1
`define C12T32_LLUAL4_OA12X17_C_R_Z_R_10 0.1
`define C12T32_LLUAL4_OA12X17_C_F_Z_F_10 0.1

module C12T32_LLUAL4_OA12X17 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or    U1 (INTERNAL1, A, B) ;
	and   #1 U2 (Z, INTERNAL1, C) ;



	specify

		if (!B && C) (A +=> Z) = (`C12T32_LLUAL4_OA12X17_A_R_Z_R_01,`C12T32_LLUAL4_OA12X17_A_F_Z_F_01);
		if (!A && C) (B +=> Z) = (`C12T32_LLUAL4_OA12X17_B_R_Z_R_01,`C12T32_LLUAL4_OA12X17_B_F_Z_F_01);
		if (!A && B) (C +=> Z) = (`C12T32_LLUAL4_OA12X17_C_R_Z_R_01,`C12T32_LLUAL4_OA12X17_C_F_Z_F_01);
		if (A && B) (C +=> Z) = (`C12T32_LLUAL4_OA12X17_C_R_Z_R_11,`C12T32_LLUAL4_OA12X17_C_F_Z_F_11);
		if (A && !B) (C +=> Z) = (`C12T32_LLUAL4_OA12X17_C_R_Z_R_10,`C12T32_LLUAL4_OA12X17_C_F_Z_F_10);


	endspecify

endmodule // C12T32_LLUAL4_OA12X17


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_OA12X8_A_R_Z_R_01 0.1
`define C12T32_LLUAL4_OA12X8_A_F_Z_F_01 0.1
`define C12T32_LLUAL4_OA12X8_B_R_Z_R_01 0.1
`define C12T32_LLUAL4_OA12X8_B_F_Z_F_01 0.1
`define C12T32_LLUAL4_OA12X8_C_R_Z_R_01 0.1
`define C12T32_LLUAL4_OA12X8_C_F_Z_F_01 0.1
`define C12T32_LLUAL4_OA12X8_C_R_Z_R_11 0.1
`define C12T32_LLUAL4_OA12X8_C_F_Z_F_11 0.1
`define C12T32_LLUAL4_OA12X8_C_R_Z_R_10 0.1
`define C12T32_LLUAL4_OA12X8_C_F_Z_F_10 0.1

module C12T32_LLUAL4_OA12X8 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or    U1 (INTERNAL1, A, B) ;
	and   #1 U2 (Z, INTERNAL1, C) ;



	specify

		if (!B && C) (A +=> Z) = (`C12T32_LLUAL4_OA12X8_A_R_Z_R_01,`C12T32_LLUAL4_OA12X8_A_F_Z_F_01);
		if (!A && C) (B +=> Z) = (`C12T32_LLUAL4_OA12X8_B_R_Z_R_01,`C12T32_LLUAL4_OA12X8_B_F_Z_F_01);
		if (!A && B) (C +=> Z) = (`C12T32_LLUAL4_OA12X8_C_R_Z_R_01,`C12T32_LLUAL4_OA12X8_C_F_Z_F_01);
		if (A && B) (C +=> Z) = (`C12T32_LLUAL4_OA12X8_C_R_Z_R_11,`C12T32_LLUAL4_OA12X8_C_F_Z_F_11);
		if (A && !B) (C +=> Z) = (`C12T32_LLUAL4_OA12X8_C_R_Z_R_10,`C12T32_LLUAL4_OA12X8_C_F_Z_F_10);


	endspecify

endmodule // C12T32_LLUAL4_OA12X8


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_OAI21X11_A_R_Z_F_01 0.1
`define C12T32_LLUAL4_OAI21X11_A_F_Z_R_01 0.1
`define C12T32_LLUAL4_OAI21X11_B_R_Z_F_01 0.1
`define C12T32_LLUAL4_OAI21X11_B_F_Z_R_01 0.1
`define C12T32_LLUAL4_OAI21X11_C_R_Z_F_01 0.1
`define C12T32_LLUAL4_OAI21X11_C_F_Z_R_01 0.1
`define C12T32_LLUAL4_OAI21X11_C_R_Z_F_11 0.1
`define C12T32_LLUAL4_OAI21X11_C_F_Z_R_11 0.1
`define C12T32_LLUAL4_OAI21X11_C_R_Z_F_10 0.1
`define C12T32_LLUAL4_OAI21X11_C_F_Z_R_10 0.1

module C12T32_LLUAL4_OAI21X11 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C) ;
	not   #1 U3 (Z, INTERNAL1) ;



	specify

		if (!B && C) (A -=> Z) = (`C12T32_LLUAL4_OAI21X11_A_F_Z_R_01,`C12T32_LLUAL4_OAI21X11_A_R_Z_F_01);
		if (!A && C) (B -=> Z) = (`C12T32_LLUAL4_OAI21X11_B_F_Z_R_01,`C12T32_LLUAL4_OAI21X11_B_R_Z_F_01);
		if (!A && B) (C -=> Z) = (`C12T32_LLUAL4_OAI21X11_C_F_Z_R_01,`C12T32_LLUAL4_OAI21X11_C_R_Z_F_01);
		if (A && B) (C -=> Z) = (`C12T32_LLUAL4_OAI21X11_C_F_Z_R_11,`C12T32_LLUAL4_OAI21X11_C_R_Z_F_11);
		if (A && !B) (C -=> Z) = (`C12T32_LLUAL4_OAI21X11_C_F_Z_R_10,`C12T32_LLUAL4_OAI21X11_C_R_Z_F_10);


	endspecify

endmodule // C12T32_LLUAL4_OAI21X11


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NAND2X11_A_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X11_A_F_Z_R_1 0.1
`define C12T32_LLUAP4_NAND2X11_B_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X11_B_F_Z_R_1 0.1

module C12T32_LLUAP4_NAND2X11 (Z, A, B);

	output Z;
	input A;
	input B;

	and    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B) (A -=> Z) = (`C12T32_LLUAP4_NAND2X11_A_F_Z_R_1,`C12T32_LLUAP4_NAND2X11_A_R_Z_F_1);
		if (A) (B -=> Z) = (`C12T32_LLUAP4_NAND2X11_B_F_Z_R_1,`C12T32_LLUAP4_NAND2X11_B_R_Z_F_1);


	endspecify

endmodule // C12T32_LLUAP4_NAND2X11


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NAND2X13_A_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X13_A_F_Z_R_1 0.1
`define C12T32_LLUAP4_NAND2X13_B_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X13_B_F_Z_R_1 0.1

module C12T32_LLUAP4_NAND2X13 (Z, A, B);

	output Z;
	input A;
	input B;

	and    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B) (A -=> Z) = (`C12T32_LLUAP4_NAND2X13_A_F_Z_R_1,`C12T32_LLUAP4_NAND2X13_A_R_Z_F_1);
		if (A) (B -=> Z) = (`C12T32_LLUAP4_NAND2X13_B_F_Z_R_1,`C12T32_LLUAP4_NAND2X13_B_R_Z_F_1);


	endspecify

endmodule // C12T32_LLUAP4_NAND2X13


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NAND2X20_A_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X20_A_F_Z_R_1 0.1
`define C12T32_LLUAP4_NAND2X20_B_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X20_B_F_Z_R_1 0.1

module C12T32_LLUAP4_NAND2X20 (Z, A, B);

	output Z;
	input A;
	input B;

	and    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B) (A -=> Z) = (`C12T32_LLUAP4_NAND2X20_A_F_Z_R_1,`C12T32_LLUAP4_NAND2X20_A_R_Z_F_1);
		if (A) (B -=> Z) = (`C12T32_LLUAP4_NAND2X20_B_F_Z_R_1,`C12T32_LLUAP4_NAND2X20_B_R_Z_F_1);


	endspecify

endmodule // C12T32_LLUAP4_NAND2X20


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NAND2X22_A_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X22_A_F_Z_R_1 0.1
`define C12T32_LLUAP4_NAND2X22_B_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X22_B_F_Z_R_1 0.1

module C12T32_LLUAP4_NAND2X22 (Z, A, B);

	output Z;
	input A;
	input B;

	and    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B) (A -=> Z) = (`C12T32_LLUAP4_NAND2X22_A_F_Z_R_1,`C12T32_LLUAP4_NAND2X22_A_R_Z_F_1);
		if (A) (B -=> Z) = (`C12T32_LLUAP4_NAND2X22_B_F_Z_R_1,`C12T32_LLUAP4_NAND2X22_B_R_Z_F_1);


	endspecify

endmodule // C12T32_LLUAP4_NAND2X22


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NAND2X3_A_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X3_A_F_Z_R_1 0.1
`define C12T32_LLUAP4_NAND2X3_B_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X3_B_F_Z_R_1 0.1

module C12T32_LLUAP4_NAND2X3 (Z, A, B);

	output Z;
	input A;
	input B;

	and    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B) (A -=> Z) = (`C12T32_LLUAP4_NAND2X3_A_F_Z_R_1,`C12T32_LLUAP4_NAND2X3_A_R_Z_F_1);
		if (A) (B -=> Z) = (`C12T32_LLUAP4_NAND2X3_B_F_Z_R_1,`C12T32_LLUAP4_NAND2X3_B_R_Z_F_1);


	endspecify

endmodule // C12T32_LLUAP4_NAND2X3


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NAND2X5_A_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X5_A_F_Z_R_1 0.1
`define C12T32_LLUAP4_NAND2X5_B_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X5_B_F_Z_R_1 0.1

module C12T32_LLUAP4_NAND2X5 (Z, A, B);

	output Z;
	input A;
	input B;

	and    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B) (A -=> Z) = (`C12T32_LLUAP4_NAND2X5_A_F_Z_R_1,`C12T32_LLUAP4_NAND2X5_A_R_Z_F_1);
		if (A) (B -=> Z) = (`C12T32_LLUAP4_NAND2X5_B_F_Z_R_1,`C12T32_LLUAP4_NAND2X5_B_R_Z_F_1);


	endspecify

endmodule // C12T32_LLUAP4_NAND2X5


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NAND2X7_A_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X7_A_F_Z_R_1 0.1
`define C12T32_LLUAP4_NAND2X7_B_R_Z_F_1 0.1
`define C12T32_LLUAP4_NAND2X7_B_F_Z_R_1 0.1

module C12T32_LLUAP4_NAND2X7 (Z, A, B);

	output Z;
	input A;
	input B;

	and    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B) (A -=> Z) = (`C12T32_LLUAP4_NAND2X7_A_F_Z_R_1,`C12T32_LLUAP4_NAND2X7_A_R_Z_F_1);
		if (A) (B -=> Z) = (`C12T32_LLUAP4_NAND2X7_B_F_Z_R_1,`C12T32_LLUAP4_NAND2X7_B_R_Z_F_1);


	endspecify

endmodule // C12T32_LLUAP4_NAND2X7


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NAND3X12_A_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X12_A_F_Z_R_11 0.1
`define C12T32_LLUAP4_NAND3X12_B_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X12_B_F_Z_R_11 0.1
`define C12T32_LLUAP4_NAND3X12_C_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X12_C_F_Z_R_11 0.1

module C12T32_LLUAP4_NAND3X12 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and    U1 (INTERNAL1, A, B, C) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B && C) (A -=> Z) = (`C12T32_LLUAP4_NAND3X12_A_F_Z_R_11,`C12T32_LLUAP4_NAND3X12_A_R_Z_F_11);
		if (A && C) (B -=> Z) = (`C12T32_LLUAP4_NAND3X12_B_F_Z_R_11,`C12T32_LLUAP4_NAND3X12_B_R_Z_F_11);
		if (A && B) (C -=> Z) = (`C12T32_LLUAP4_NAND3X12_C_F_Z_R_11,`C12T32_LLUAP4_NAND3X12_C_R_Z_F_11);


	endspecify

endmodule // C12T32_LLUAP4_NAND3X12


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NAND3X15_A_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X15_A_F_Z_R_11 0.1
`define C12T32_LLUAP4_NAND3X15_B_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X15_B_F_Z_R_11 0.1
`define C12T32_LLUAP4_NAND3X15_C_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X15_C_F_Z_R_11 0.1

module C12T32_LLUAP4_NAND3X15 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and    U1 (INTERNAL1, A, B, C) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B && C) (A -=> Z) = (`C12T32_LLUAP4_NAND3X15_A_F_Z_R_11,`C12T32_LLUAP4_NAND3X15_A_R_Z_F_11);
		if (A && C) (B -=> Z) = (`C12T32_LLUAP4_NAND3X15_B_F_Z_R_11,`C12T32_LLUAP4_NAND3X15_B_R_Z_F_11);
		if (A && B) (C -=> Z) = (`C12T32_LLUAP4_NAND3X15_C_F_Z_R_11,`C12T32_LLUAP4_NAND3X15_C_R_Z_F_11);


	endspecify

endmodule // C12T32_LLUAP4_NAND3X15


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NAND3X4_A_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X4_A_F_Z_R_11 0.1
`define C12T32_LLUAP4_NAND3X4_B_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X4_B_F_Z_R_11 0.1
`define C12T32_LLUAP4_NAND3X4_C_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X4_C_F_Z_R_11 0.1

module C12T32_LLUAP4_NAND3X4 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and    U1 (INTERNAL1, A, B, C) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B && C) (A -=> Z) = (`C12T32_LLUAP4_NAND3X4_A_F_Z_R_11,`C12T32_LLUAP4_NAND3X4_A_R_Z_F_11);
		if (A && C) (B -=> Z) = (`C12T32_LLUAP4_NAND3X4_B_F_Z_R_11,`C12T32_LLUAP4_NAND3X4_B_R_Z_F_11);
		if (A && B) (C -=> Z) = (`C12T32_LLUAP4_NAND3X4_C_F_Z_R_11,`C12T32_LLUAP4_NAND3X4_C_R_Z_F_11);


	endspecify

endmodule // C12T32_LLUAP4_NAND3X4


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NAND3X6_A_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X6_A_F_Z_R_11 0.1
`define C12T32_LLUAP4_NAND3X6_B_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X6_B_F_Z_R_11 0.1
`define C12T32_LLUAP4_NAND3X6_C_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X6_C_F_Z_R_11 0.1

module C12T32_LLUAP4_NAND3X6 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and    U1 (INTERNAL1, A, B, C) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B && C) (A -=> Z) = (`C12T32_LLUAP4_NAND3X6_A_F_Z_R_11,`C12T32_LLUAP4_NAND3X6_A_R_Z_F_11);
		if (A && C) (B -=> Z) = (`C12T32_LLUAP4_NAND3X6_B_F_Z_R_11,`C12T32_LLUAP4_NAND3X6_B_R_Z_F_11);
		if (A && B) (C -=> Z) = (`C12T32_LLUAP4_NAND3X6_C_F_Z_R_11,`C12T32_LLUAP4_NAND3X6_C_R_Z_F_11);


	endspecify

endmodule // C12T32_LLUAP4_NAND3X6


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NAND3X7_A_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X7_A_F_Z_R_11 0.1
`define C12T32_LLUAP4_NAND3X7_B_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X7_B_F_Z_R_11 0.1
`define C12T32_LLUAP4_NAND3X7_C_R_Z_F_11 0.1
`define C12T32_LLUAP4_NAND3X7_C_F_Z_R_11 0.1

module C12T32_LLUAP4_NAND3X7 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and    U1 (INTERNAL1, A, B, C) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B && C) (A -=> Z) = (`C12T32_LLUAP4_NAND3X7_A_F_Z_R_11,`C12T32_LLUAP4_NAND3X7_A_R_Z_F_11);
		if (A && C) (B -=> Z) = (`C12T32_LLUAP4_NAND3X7_B_F_Z_R_11,`C12T32_LLUAP4_NAND3X7_B_R_Z_F_11);
		if (A && B) (C -=> Z) = (`C12T32_LLUAP4_NAND3X7_C_F_Z_R_11,`C12T32_LLUAP4_NAND3X7_C_R_Z_F_11);


	endspecify

endmodule // C12T32_LLUAP4_NAND3X7


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NOR2X11_A_R_Z_F_0 0.1
`define C12T32_LLUAP4_NOR2X11_A_F_Z_R_0 0.1
`define C12T32_LLUAP4_NOR2X11_B_R_Z_F_0 0.1
`define C12T32_LLUAP4_NOR2X11_B_F_Z_R_0 0.1

module C12T32_LLUAP4_NOR2X11 (Z, A, B);

	output Z;
	input A;
	input B;

	or    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B) (A -=> Z) = (`C12T32_LLUAP4_NOR2X11_A_F_Z_R_0,`C12T32_LLUAP4_NOR2X11_A_R_Z_F_0);
		if (!A) (B -=> Z) = (`C12T32_LLUAP4_NOR2X11_B_F_Z_R_0,`C12T32_LLUAP4_NOR2X11_B_R_Z_F_0);


	endspecify

endmodule // C12T32_LLUAP4_NOR2X11


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NOR2X14_A_R_Z_F_0 0.1
`define C12T32_LLUAP4_NOR2X14_A_F_Z_R_0 0.1
`define C12T32_LLUAP4_NOR2X14_B_R_Z_F_0 0.1
`define C12T32_LLUAP4_NOR2X14_B_F_Z_R_0 0.1

module C12T32_LLUAP4_NOR2X14 (Z, A, B);

	output Z;
	input A;
	input B;

	or    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B) (A -=> Z) = (`C12T32_LLUAP4_NOR2X14_A_F_Z_R_0,`C12T32_LLUAP4_NOR2X14_A_R_Z_F_0);
		if (!A) (B -=> Z) = (`C12T32_LLUAP4_NOR2X14_B_F_Z_R_0,`C12T32_LLUAP4_NOR2X14_B_R_Z_F_0);


	endspecify

endmodule // C12T32_LLUAP4_NOR2X14


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NOR2X22_A_R_Z_F_0 0.1
`define C12T32_LLUAP4_NOR2X22_A_F_Z_R_0 0.1
`define C12T32_LLUAP4_NOR2X22_B_R_Z_F_0 0.1
`define C12T32_LLUAP4_NOR2X22_B_F_Z_R_0 0.1

module C12T32_LLUAP4_NOR2X22 (Z, A, B);

	output Z;
	input A;
	input B;

	or    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B) (A -=> Z) = (`C12T32_LLUAP4_NOR2X22_A_F_Z_R_0,`C12T32_LLUAP4_NOR2X22_A_R_Z_F_0);
		if (!A) (B -=> Z) = (`C12T32_LLUAP4_NOR2X22_B_F_Z_R_0,`C12T32_LLUAP4_NOR2X22_B_R_Z_F_0);


	endspecify

endmodule // C12T32_LLUAP4_NOR2X22


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NOR2X5_A_R_Z_F_0 0.1
`define C12T32_LLUAP4_NOR2X5_A_F_Z_R_0 0.1
`define C12T32_LLUAP4_NOR2X5_B_R_Z_F_0 0.1
`define C12T32_LLUAP4_NOR2X5_B_F_Z_R_0 0.1

module C12T32_LLUAP4_NOR2X5 (Z, A, B);

	output Z;
	input A;
	input B;

	or    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B) (A -=> Z) = (`C12T32_LLUAP4_NOR2X5_A_F_Z_R_0,`C12T32_LLUAP4_NOR2X5_A_R_Z_F_0);
		if (!A) (B -=> Z) = (`C12T32_LLUAP4_NOR2X5_B_F_Z_R_0,`C12T32_LLUAP4_NOR2X5_B_R_Z_F_0);


	endspecify

endmodule // C12T32_LLUAP4_NOR2X5


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NOR2X7_A_R_Z_F_0 0.1
`define C12T32_LLUAP4_NOR2X7_A_F_Z_R_0 0.1
`define C12T32_LLUAP4_NOR2X7_B_R_Z_F_0 0.1
`define C12T32_LLUAP4_NOR2X7_B_F_Z_R_0 0.1

module C12T32_LLUAP4_NOR2X7 (Z, A, B);

	output Z;
	input A;
	input B;

	or    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B) (A -=> Z) = (`C12T32_LLUAP4_NOR2X7_A_F_Z_R_0,`C12T32_LLUAP4_NOR2X7_A_R_Z_F_0);
		if (!A) (B -=> Z) = (`C12T32_LLUAP4_NOR2X7_B_F_Z_R_0,`C12T32_LLUAP4_NOR2X7_B_R_Z_F_0);


	endspecify

endmodule // C12T32_LLUAP4_NOR2X7


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NOR3X13_A_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X13_A_F_Z_R_00 0.1
`define C12T32_LLUAP4_NOR3X13_B_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X13_B_F_Z_R_00 0.1
`define C12T32_LLUAP4_NOR3X13_C_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X13_C_F_Z_R_00 0.1

module C12T32_LLUAP4_NOR3X13 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or    U1 (INTERNAL1, A, B, C) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B && !C) (A -=> Z) = (`C12T32_LLUAP4_NOR3X13_A_F_Z_R_00,`C12T32_LLUAP4_NOR3X13_A_R_Z_F_00);
		if (!A && !C) (B -=> Z) = (`C12T32_LLUAP4_NOR3X13_B_F_Z_R_00,`C12T32_LLUAP4_NOR3X13_B_R_Z_F_00);
		if (!A && !B) (C -=> Z) = (`C12T32_LLUAP4_NOR3X13_C_F_Z_R_00,`C12T32_LLUAP4_NOR3X13_C_R_Z_F_00);


	endspecify

endmodule // C12T32_LLUAP4_NOR3X13


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NOR3X15_A_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X15_A_F_Z_R_00 0.1
`define C12T32_LLUAP4_NOR3X15_B_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X15_B_F_Z_R_00 0.1
`define C12T32_LLUAP4_NOR3X15_C_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X15_C_F_Z_R_00 0.1

module C12T32_LLUAP4_NOR3X15 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or    U1 (INTERNAL1, A, B, C) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B && !C) (A -=> Z) = (`C12T32_LLUAP4_NOR3X15_A_F_Z_R_00,`C12T32_LLUAP4_NOR3X15_A_R_Z_F_00);
		if (!A && !C) (B -=> Z) = (`C12T32_LLUAP4_NOR3X15_B_F_Z_R_00,`C12T32_LLUAP4_NOR3X15_B_R_Z_F_00);
		if (!A && !B) (C -=> Z) = (`C12T32_LLUAP4_NOR3X15_C_F_Z_R_00,`C12T32_LLUAP4_NOR3X15_C_R_Z_F_00);


	endspecify

endmodule // C12T32_LLUAP4_NOR3X15


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NOR3X4_A_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X4_A_F_Z_R_00 0.1
`define C12T32_LLUAP4_NOR3X4_B_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X4_B_F_Z_R_00 0.1
`define C12T32_LLUAP4_NOR3X4_C_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X4_C_F_Z_R_00 0.1

module C12T32_LLUAP4_NOR3X4 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or    U1 (INTERNAL1, A, B, C) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B && !C) (A -=> Z) = (`C12T32_LLUAP4_NOR3X4_A_F_Z_R_00,`C12T32_LLUAP4_NOR3X4_A_R_Z_F_00);
		if (!A && !C) (B -=> Z) = (`C12T32_LLUAP4_NOR3X4_B_F_Z_R_00,`C12T32_LLUAP4_NOR3X4_B_R_Z_F_00);
		if (!A && !B) (C -=> Z) = (`C12T32_LLUAP4_NOR3X4_C_F_Z_R_00,`C12T32_LLUAP4_NOR3X4_C_R_Z_F_00);


	endspecify

endmodule // C12T32_LLUAP4_NOR3X4


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NOR3X6_A_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X6_A_F_Z_R_00 0.1
`define C12T32_LLUAP4_NOR3X6_B_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X6_B_F_Z_R_00 0.1
`define C12T32_LLUAP4_NOR3X6_C_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X6_C_F_Z_R_00 0.1

module C12T32_LLUAP4_NOR3X6 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or    U1 (INTERNAL1, A, B, C) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B && !C) (A -=> Z) = (`C12T32_LLUAP4_NOR3X6_A_F_Z_R_00,`C12T32_LLUAP4_NOR3X6_A_R_Z_F_00);
		if (!A && !C) (B -=> Z) = (`C12T32_LLUAP4_NOR3X6_B_F_Z_R_00,`C12T32_LLUAP4_NOR3X6_B_R_Z_F_00);
		if (!A && !B) (C -=> Z) = (`C12T32_LLUAP4_NOR3X6_C_F_Z_R_00,`C12T32_LLUAP4_NOR3X6_C_R_Z_F_00);


	endspecify

endmodule // C12T32_LLUAP4_NOR3X6


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAP4_NOR3X8_A_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X8_A_F_Z_R_00 0.1
`define C12T32_LLUAP4_NOR3X8_B_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X8_B_F_Z_R_00 0.1
`define C12T32_LLUAP4_NOR3X8_C_R_Z_F_00 0.1
`define C12T32_LLUAP4_NOR3X8_C_F_Z_R_00 0.1

module C12T32_LLUAP4_NOR3X8 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or    U1 (INTERNAL1, A, B, C) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B && !C) (A -=> Z) = (`C12T32_LLUAP4_NOR3X8_A_F_Z_R_00,`C12T32_LLUAP4_NOR3X8_A_R_Z_F_00);
		if (!A && !C) (B -=> Z) = (`C12T32_LLUAP4_NOR3X8_B_F_Z_R_00,`C12T32_LLUAP4_NOR3X8_B_R_Z_F_00);
		if (!A && !B) (C -=> Z) = (`C12T32_LLUAP4_NOR3X8_C_F_Z_R_00,`C12T32_LLUAP4_NOR3X8_C_R_Z_F_00);


	endspecify

endmodule // C12T32_LLUAP4_NOR3X8


`endcelldefine

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive


