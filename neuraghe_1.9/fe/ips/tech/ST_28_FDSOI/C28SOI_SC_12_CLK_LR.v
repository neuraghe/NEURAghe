//--------------------------------------------------------------------------------
// 
//                  STMicroelectronics NOIDA
// 
//                            LIBRARY GROUP
// 
//--------------------------------------------------------------------------------
// 
//--------------------------------------------------------------------------------
// 
//              Verilog models for the C28SOI_SC_12_CLK_LR.CMOS028SOI
//                    (C28SOI_SC_12_CLK_LR   release 2.1.0)
// 
//
//--------------------------------------------------------------------------------
// 
//Date            : Wed Jun 19 16:05:19 2013
// 
//Copyright       : STMicroelectronics N.V. 2013
//                  All rights reserved. Reproduction
//                  in whole or part is prohibited
//                  without the written consent of the
//                  copyright holder.
// 
//Address         : STMicroelectronics
//                  Plot No -1
//                  Knowledge park-III
//                  Greater Noida (INDIA)
//                  FTM-CCDS
//
//--------------------------------------------------------------------------------
//STMicroelectronics RESERVES THE RIGHTS TO MAKE CHANGES WITHOUT 
//NOTICE AT ANY TIME. STMicroelectronics MAKES NO WARRANTY,
//EXPRESSED, IMPLIED OR STATUTARY, INCLUDING BUT NOT LIMITED TO ANY IMPLIED
//WARRANTY OR MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE,
//OR THAT THE USE WILL NOT INFRINGE ANY THIRD PARTY PATENT,
//COPYRIGHT OR TRADEMARK. STMicroelectronics SHALL NOT BE LIABLE 
//FOR ANY LOSS OR DAMAGE ARISING FROM THE USE OF ITS LIBRARIES OR
//SOFTWARE.
//--------------------------------------------------------------------------------

// Verilog model view for C12T28SOI_LR_CNAND2X15_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND2X15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND2X15_P0_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X15_P0_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNAND2X15_P0_B_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X15_P0_B_F_Z_F_1 0.1

module C12T28SOI_LR_CNAND2X15_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	and   #1 U1 (Z, A, B) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNAND2X15_P0_A_R_Z_R_1,`C12T28SOI_LR_CNAND2X15_P0_A_F_Z_F_1);
		if (A) (B +=> Z) = (`C12T28SOI_LR_CNAND2X15_P0_B_R_Z_R_1,`C12T28SOI_LR_CNAND2X15_P0_B_F_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNAND2X15_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND2X15_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND2X15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND2X15_P4_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X15_P4_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNAND2X15_P4_B_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X15_P4_B_F_Z_F_1 0.1

module C12T28SOI_LR_CNAND2X15_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	and   #1 U1 (Z, A, B) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNAND2X15_P4_A_R_Z_R_1,`C12T28SOI_LR_CNAND2X15_P4_A_F_Z_F_1);
		if (A) (B +=> Z) = (`C12T28SOI_LR_CNAND2X15_P4_B_R_Z_R_1,`C12T28SOI_LR_CNAND2X15_P4_B_F_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNAND2X15_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND2X15_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND2X15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND2X15_P10_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X15_P10_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNAND2X15_P10_B_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X15_P10_B_F_Z_F_1 0.1

module C12T28SOI_LR_CNAND2X15_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	and   #1 U1 (Z, A, B) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNAND2X15_P10_A_R_Z_R_1,`C12T28SOI_LR_CNAND2X15_P10_A_F_Z_F_1);
		if (A) (B +=> Z) = (`C12T28SOI_LR_CNAND2X15_P10_B_R_Z_R_1,`C12T28SOI_LR_CNAND2X15_P10_B_F_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNAND2X15_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND2X20_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND2X20_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND2X20_P0_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X20_P0_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNAND2X20_P0_B_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X20_P0_B_F_Z_F_1 0.1

module C12T28SOI_LR_CNAND2X20_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	and   #1 U1 (Z, A, B) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNAND2X20_P0_A_R_Z_R_1,`C12T28SOI_LR_CNAND2X20_P0_A_F_Z_F_1);
		if (A) (B +=> Z) = (`C12T28SOI_LR_CNAND2X20_P0_B_R_Z_R_1,`C12T28SOI_LR_CNAND2X20_P0_B_F_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNAND2X20_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND2X20_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND2X20_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND2X20_P4_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X20_P4_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNAND2X20_P4_B_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X20_P4_B_F_Z_F_1 0.1

module C12T28SOI_LR_CNAND2X20_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	and   #1 U1 (Z, A, B) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNAND2X20_P4_A_R_Z_R_1,`C12T28SOI_LR_CNAND2X20_P4_A_F_Z_F_1);
		if (A) (B +=> Z) = (`C12T28SOI_LR_CNAND2X20_P4_B_R_Z_R_1,`C12T28SOI_LR_CNAND2X20_P4_B_F_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNAND2X20_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND2X20_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND2X20_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND2X20_P10_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X20_P10_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNAND2X20_P10_B_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X20_P10_B_F_Z_F_1 0.1

module C12T28SOI_LR_CNAND2X20_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	and   #1 U1 (Z, A, B) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNAND2X20_P10_A_R_Z_R_1,`C12T28SOI_LR_CNAND2X20_P10_A_F_Z_F_1);
		if (A) (B +=> Z) = (`C12T28SOI_LR_CNAND2X20_P10_B_R_Z_R_1,`C12T28SOI_LR_CNAND2X20_P10_B_F_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNAND2X20_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND2X33_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND2X33_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND2X33_P0_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X33_P0_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNAND2X33_P0_B_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X33_P0_B_F_Z_F_1 0.1

module C12T28SOI_LR_CNAND2X33_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	and   #1 U1 (Z, A, B) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNAND2X33_P0_A_R_Z_R_1,`C12T28SOI_LR_CNAND2X33_P0_A_F_Z_F_1);
		if (A) (B +=> Z) = (`C12T28SOI_LR_CNAND2X33_P0_B_R_Z_R_1,`C12T28SOI_LR_CNAND2X33_P0_B_F_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNAND2X33_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND2X33_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND2X33_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND2X33_P4_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X33_P4_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNAND2X33_P4_B_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X33_P4_B_F_Z_F_1 0.1

module C12T28SOI_LR_CNAND2X33_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	and   #1 U1 (Z, A, B) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNAND2X33_P4_A_R_Z_R_1,`C12T28SOI_LR_CNAND2X33_P4_A_F_Z_F_1);
		if (A) (B +=> Z) = (`C12T28SOI_LR_CNAND2X33_P4_B_R_Z_R_1,`C12T28SOI_LR_CNAND2X33_P4_B_F_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNAND2X33_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND2X33_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND2X33_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND2X33_P10_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X33_P10_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNAND2X33_P10_B_R_Z_R_1 0.1
`define C12T28SOI_LR_CNAND2X33_P10_B_F_Z_F_1 0.1

module C12T28SOI_LR_CNAND2X33_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	and   #1 U1 (Z, A, B) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNAND2X33_P10_A_R_Z_R_1,`C12T28SOI_LR_CNAND2X33_P10_A_F_Z_F_1);
		if (A) (B +=> Z) = (`C12T28SOI_LR_CNAND2X33_P10_B_R_Z_R_1,`C12T28SOI_LR_CNAND2X33_P10_B_F_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNAND2X33_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND3X17_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND3X17_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND3X17_P0_A_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X17_P0_A_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X17_P0_B_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X17_P0_B_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X17_P0_C_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X17_P0_C_F_Z_F_11 0.1

module C12T28SOI_LR_CNAND3X17_P0 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and   #1 U1 (Z, A, B, C) ;



	specify

		if (B && C) (A +=> Z) = (`C12T28SOI_LR_CNAND3X17_P0_A_R_Z_R_11,`C12T28SOI_LR_CNAND3X17_P0_A_F_Z_F_11);
		if (A && C) (B +=> Z) = (`C12T28SOI_LR_CNAND3X17_P0_B_R_Z_R_11,`C12T28SOI_LR_CNAND3X17_P0_B_F_Z_F_11);
		if (A && B) (C +=> Z) = (`C12T28SOI_LR_CNAND3X17_P0_C_R_Z_R_11,`C12T28SOI_LR_CNAND3X17_P0_C_F_Z_F_11);


	endspecify

endmodule // C12T28SOI_LR_CNAND3X17_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND3X17_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND3X17_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND3X17_P4_A_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X17_P4_A_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X17_P4_B_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X17_P4_B_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X17_P4_C_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X17_P4_C_F_Z_F_11 0.1

module C12T28SOI_LR_CNAND3X17_P4 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and   #1 U1 (Z, A, B, C) ;



	specify

		if (B && C) (A +=> Z) = (`C12T28SOI_LR_CNAND3X17_P4_A_R_Z_R_11,`C12T28SOI_LR_CNAND3X17_P4_A_F_Z_F_11);
		if (A && C) (B +=> Z) = (`C12T28SOI_LR_CNAND3X17_P4_B_R_Z_R_11,`C12T28SOI_LR_CNAND3X17_P4_B_F_Z_F_11);
		if (A && B) (C +=> Z) = (`C12T28SOI_LR_CNAND3X17_P4_C_R_Z_R_11,`C12T28SOI_LR_CNAND3X17_P4_C_F_Z_F_11);


	endspecify

endmodule // C12T28SOI_LR_CNAND3X17_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND3X17_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND3X17_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND3X17_P10_A_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X17_P10_A_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X17_P10_B_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X17_P10_B_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X17_P10_C_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X17_P10_C_F_Z_F_11 0.1

module C12T28SOI_LR_CNAND3X17_P10 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and   #1 U1 (Z, A, B, C) ;



	specify

		if (B && C) (A +=> Z) = (`C12T28SOI_LR_CNAND3X17_P10_A_R_Z_R_11,`C12T28SOI_LR_CNAND3X17_P10_A_F_Z_F_11);
		if (A && C) (B +=> Z) = (`C12T28SOI_LR_CNAND3X17_P10_B_R_Z_R_11,`C12T28SOI_LR_CNAND3X17_P10_B_F_Z_F_11);
		if (A && B) (C +=> Z) = (`C12T28SOI_LR_CNAND3X17_P10_C_R_Z_R_11,`C12T28SOI_LR_CNAND3X17_P10_C_F_Z_F_11);


	endspecify

endmodule // C12T28SOI_LR_CNAND3X17_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND3X25_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND3X25_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND3X25_P0_A_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X25_P0_A_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X25_P0_B_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X25_P0_B_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X25_P0_C_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X25_P0_C_F_Z_F_11 0.1

module C12T28SOI_LR_CNAND3X25_P0 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and   #1 U1 (Z, A, B, C) ;



	specify

		if (B && C) (A +=> Z) = (`C12T28SOI_LR_CNAND3X25_P0_A_R_Z_R_11,`C12T28SOI_LR_CNAND3X25_P0_A_F_Z_F_11);
		if (A && C) (B +=> Z) = (`C12T28SOI_LR_CNAND3X25_P0_B_R_Z_R_11,`C12T28SOI_LR_CNAND3X25_P0_B_F_Z_F_11);
		if (A && B) (C +=> Z) = (`C12T28SOI_LR_CNAND3X25_P0_C_R_Z_R_11,`C12T28SOI_LR_CNAND3X25_P0_C_F_Z_F_11);


	endspecify

endmodule // C12T28SOI_LR_CNAND3X25_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND3X25_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND3X25_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND3X25_P4_A_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X25_P4_A_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X25_P4_B_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X25_P4_B_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X25_P4_C_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X25_P4_C_F_Z_F_11 0.1

module C12T28SOI_LR_CNAND3X25_P4 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and   #1 U1 (Z, A, B, C) ;



	specify

		if (B && C) (A +=> Z) = (`C12T28SOI_LR_CNAND3X25_P4_A_R_Z_R_11,`C12T28SOI_LR_CNAND3X25_P4_A_F_Z_F_11);
		if (A && C) (B +=> Z) = (`C12T28SOI_LR_CNAND3X25_P4_B_R_Z_R_11,`C12T28SOI_LR_CNAND3X25_P4_B_F_Z_F_11);
		if (A && B) (C +=> Z) = (`C12T28SOI_LR_CNAND3X25_P4_C_R_Z_R_11,`C12T28SOI_LR_CNAND3X25_P4_C_F_Z_F_11);


	endspecify

endmodule // C12T28SOI_LR_CNAND3X25_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND3X25_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND3X25_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND3X25_P10_A_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X25_P10_A_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X25_P10_B_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X25_P10_B_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X25_P10_C_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X25_P10_C_F_Z_F_11 0.1

module C12T28SOI_LR_CNAND3X25_P10 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and   #1 U1 (Z, A, B, C) ;



	specify

		if (B && C) (A +=> Z) = (`C12T28SOI_LR_CNAND3X25_P10_A_R_Z_R_11,`C12T28SOI_LR_CNAND3X25_P10_A_F_Z_F_11);
		if (A && C) (B +=> Z) = (`C12T28SOI_LR_CNAND3X25_P10_B_R_Z_R_11,`C12T28SOI_LR_CNAND3X25_P10_B_F_Z_F_11);
		if (A && B) (C +=> Z) = (`C12T28SOI_LR_CNAND3X25_P10_C_R_Z_R_11,`C12T28SOI_LR_CNAND3X25_P10_C_F_Z_F_11);


	endspecify

endmodule // C12T28SOI_LR_CNAND3X25_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND3X33_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND3X33_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND3X33_P0_A_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X33_P0_A_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X33_P0_B_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X33_P0_B_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X33_P0_C_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X33_P0_C_F_Z_F_11 0.1

module C12T28SOI_LR_CNAND3X33_P0 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and   #1 U1 (Z, A, B, C) ;



	specify

		if (B && C) (A +=> Z) = (`C12T28SOI_LR_CNAND3X33_P0_A_R_Z_R_11,`C12T28SOI_LR_CNAND3X33_P0_A_F_Z_F_11);
		if (A && C) (B +=> Z) = (`C12T28SOI_LR_CNAND3X33_P0_B_R_Z_R_11,`C12T28SOI_LR_CNAND3X33_P0_B_F_Z_F_11);
		if (A && B) (C +=> Z) = (`C12T28SOI_LR_CNAND3X33_P0_C_R_Z_R_11,`C12T28SOI_LR_CNAND3X33_P0_C_F_Z_F_11);


	endspecify

endmodule // C12T28SOI_LR_CNAND3X33_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND3X33_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND3X33_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND3X33_P4_A_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X33_P4_A_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X33_P4_B_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X33_P4_B_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X33_P4_C_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X33_P4_C_F_Z_F_11 0.1

module C12T28SOI_LR_CNAND3X33_P4 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and   #1 U1 (Z, A, B, C) ;



	specify

		if (B && C) (A +=> Z) = (`C12T28SOI_LR_CNAND3X33_P4_A_R_Z_R_11,`C12T28SOI_LR_CNAND3X33_P4_A_F_Z_F_11);
		if (A && C) (B +=> Z) = (`C12T28SOI_LR_CNAND3X33_P4_B_R_Z_R_11,`C12T28SOI_LR_CNAND3X33_P4_B_F_Z_F_11);
		if (A && B) (C +=> Z) = (`C12T28SOI_LR_CNAND3X33_P4_C_R_Z_R_11,`C12T28SOI_LR_CNAND3X33_P4_C_F_Z_F_11);


	endspecify

endmodule // C12T28SOI_LR_CNAND3X33_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNAND3X33_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNAND3X33_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNAND3X33_P10_A_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X33_P10_A_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X33_P10_B_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X33_P10_B_F_Z_F_11 0.1
`define C12T28SOI_LR_CNAND3X33_P10_C_R_Z_R_11 0.1
`define C12T28SOI_LR_CNAND3X33_P10_C_F_Z_F_11 0.1

module C12T28SOI_LR_CNAND3X33_P10 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	and   #1 U1 (Z, A, B, C) ;



	specify

		if (B && C) (A +=> Z) = (`C12T28SOI_LR_CNAND3X33_P10_A_R_Z_R_11,`C12T28SOI_LR_CNAND3X33_P10_A_F_Z_F_11);
		if (A && C) (B +=> Z) = (`C12T28SOI_LR_CNAND3X33_P10_B_R_Z_R_11,`C12T28SOI_LR_CNAND3X33_P10_B_F_Z_F_11);
		if (A && B) (C +=> Z) = (`C12T28SOI_LR_CNAND3X33_P10_C_R_Z_R_11,`C12T28SOI_LR_CNAND3X33_P10_C_F_Z_F_11);


	endspecify

endmodule // C12T28SOI_LR_CNAND3X33_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX133_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX133_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX133_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX133_P0_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX133_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX133_P0_A_R_Z_R,`C12T28SOI_LR_CNBFX133_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX133_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX133_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX133_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX133_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX133_P4_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX133_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX133_P4_A_R_Z_R,`C12T28SOI_LR_CNBFX133_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX133_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX133_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX133_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX133_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX133_P10_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX133_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX133_P10_A_R_Z_R,`C12T28SOI_LR_CNBFX133_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX133_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX15_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX15_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX15_P0_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX15_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX15_P0_A_R_Z_R,`C12T28SOI_LR_CNBFX15_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX15_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX15_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX15_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX15_P4_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX15_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX15_P4_A_R_Z_R,`C12T28SOI_LR_CNBFX15_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX15_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX15_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX15_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX15_P10_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX15_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX15_P10_A_R_Z_R,`C12T28SOI_LR_CNBFX15_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX15_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX22_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX22_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX22_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX22_P0_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX22_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX22_P0_A_R_Z_R,`C12T28SOI_LR_CNBFX22_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX22_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX22_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX22_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX22_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX22_P4_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX22_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX22_P4_A_R_Z_R,`C12T28SOI_LR_CNBFX22_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX22_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX22_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX22_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX22_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX22_P10_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX22_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX22_P10_A_R_Z_R,`C12T28SOI_LR_CNBFX22_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX22_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX30_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX30_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX30_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX30_P0_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX30_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX30_P0_A_R_Z_R,`C12T28SOI_LR_CNBFX30_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX30_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX30_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX30_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX30_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX30_P4_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX30_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX30_P4_A_R_Z_R,`C12T28SOI_LR_CNBFX30_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX30_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX30_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX30_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX30_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX30_P10_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX30_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX30_P10_A_R_Z_R,`C12T28SOI_LR_CNBFX30_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX30_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX38_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX38_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX38_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX38_P0_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX38_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX38_P0_A_R_Z_R,`C12T28SOI_LR_CNBFX38_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX38_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX38_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX38_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX38_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX38_P4_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX38_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX38_P4_A_R_Z_R,`C12T28SOI_LR_CNBFX38_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX38_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX38_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX38_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX38_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX38_P10_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX38_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX38_P10_A_R_Z_R,`C12T28SOI_LR_CNBFX38_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX38_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX44_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX44_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX44_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX44_P0_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX44_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX44_P0_A_R_Z_R,`C12T28SOI_LR_CNBFX44_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX44_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX44_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX44_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX44_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX44_P4_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX44_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX44_P4_A_R_Z_R,`C12T28SOI_LR_CNBFX44_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX44_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX44_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX44_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX44_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX44_P10_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX44_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX44_P10_A_R_Z_R,`C12T28SOI_LR_CNBFX44_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX44_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX4_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX4_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX4_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX4_P0_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX4_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX4_P0_A_R_Z_R,`C12T28SOI_LR_CNBFX4_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX4_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX4_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX4_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX4_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX4_P4_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX4_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX4_P4_A_R_Z_R,`C12T28SOI_LR_CNBFX4_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX4_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX4_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX4_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX4_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX4_P10_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX4_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX4_P10_A_R_Z_R,`C12T28SOI_LR_CNBFX4_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX4_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX52_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX52_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX52_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX52_P0_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX52_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX52_P0_A_R_Z_R,`C12T28SOI_LR_CNBFX52_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX52_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX52_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX52_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX52_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX52_P4_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX52_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX52_P4_A_R_Z_R,`C12T28SOI_LR_CNBFX52_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX52_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX52_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX52_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX52_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX52_P10_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX52_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX52_P10_A_R_Z_R,`C12T28SOI_LR_CNBFX52_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX52_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX59_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX59_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX59_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX59_P0_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX59_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX59_P0_A_R_Z_R,`C12T28SOI_LR_CNBFX59_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX59_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX59_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX59_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX59_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX59_P4_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX59_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX59_P4_A_R_Z_R,`C12T28SOI_LR_CNBFX59_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX59_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX59_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX59_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX59_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX59_P10_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX59_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX59_P10_A_R_Z_R,`C12T28SOI_LR_CNBFX59_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX59_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX70_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX70_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX70_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX70_P0_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX70_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX70_P0_A_R_Z_R,`C12T28SOI_LR_CNBFX70_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX70_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX70_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX70_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX70_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX70_P4_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX70_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX70_P4_A_R_Z_R,`C12T28SOI_LR_CNBFX70_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX70_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX70_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX70_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX70_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX70_P10_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX70_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX70_P10_A_R_Z_R,`C12T28SOI_LR_CNBFX70_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX70_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX7_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX7_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX7_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX7_P0_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX7_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX7_P0_A_R_Z_R,`C12T28SOI_LR_CNBFX7_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX7_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX7_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX7_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX7_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX7_P4_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX7_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX7_P4_A_R_Z_R,`C12T28SOI_LR_CNBFX7_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX7_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX7_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX7_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX7_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX7_P10_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX7_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX7_P10_A_R_Z_R,`C12T28SOI_LR_CNBFX7_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX7_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX94_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX94_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX94_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX94_P0_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX94_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX94_P0_A_R_Z_R,`C12T28SOI_LR_CNBFX94_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX94_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX94_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX94_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX94_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX94_P4_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX94_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX94_P4_A_R_Z_R,`C12T28SOI_LR_CNBFX94_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX94_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNBFX94_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNBFX94_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNBFX94_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_CNBFX94_P10_A_F_Z_F 0.1

module C12T28SOI_LR_CNBFX94_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_CNBFX94_P10_A_R_Z_R,`C12T28SOI_LR_CNBFX94_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNBFX94_P10


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_CNGFMUX21X15_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_CNGFMUX21X15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_PWL 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_R_CLK_OUT_R_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_R_CLK_OUT_R_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_R_CLK_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_R_CLK_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_EN_ALT_CLK_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_EN_ALT_CLK_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_EN_ALT_CLK_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_EN_ALT_CLK_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_PLL_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_PLL_OUT_R_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_PWL 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_CLK_OUT_R_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_CLK_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_CLK_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_CLK_OUT_R_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_EN_PLL_CLK_LS_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_EN_PLL_CLK_LS_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_EN_PLL_CLK_LS_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_EN_PLL_CLK_LS_SETUP_posedge_posedge 0.01

module C12T28SOIDV_LR_CNGFMUX21X15_P0 (CLK_OUT, PLL_OUT, PLL_EN, ALT_EN, PLL_CLK_LS, ALT_CLK);

	output CLK_OUT;
	output PLL_OUT;
	input PLL_EN;
	input ALT_EN;
	input PLL_CLK_LS;
	input ALT_CLK;

`ifdef functional
        reg  NOTIFIER;
        and    U1 (INTERNAL3, PLL_CLK_LS, IPLL_EN_LD) ;
        not    U2 (INTERNAL2, INTERNAL3) ;
        and    U3 (INTERNAL5, ALT_CLK, IALT_EN_LD) ;
        not    U4 (INTERNAL4, INTERNAL5) ;
        and    U5 (INTERNAL1, INTERNAL2, INTERNAL4) ;
        not   #1 U6 (CLK_OUT, INTERNAL1) ;
        not    U7 (INTERNAL6, PLL_CLK_LS) ;
        C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U8 (IPLL_EN_LD, PLL_EN, INTERNAL6 , NOTIFIER) ;
        not    U9 (INTERNAL7, ALT_CLK) ;
        C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U10 (IALT_EN_LD, ALT_EN, INTERNAL7 , NOTIFIER) ;
        buf   #1 U11 (PLL_OUT, PLL_CLK_LS) ;

`else
       reg  NOTIFIER;
       and    U1 (INTERNAL3, dPLL_CLK_LS, IPLL_EN_LD) ;
       not    U2 (INTERNAL2, INTERNAL3) ;
       and    U3 (INTERNAL5, dALT_CLK, IALT_EN_LD) ;
       not    U4 (INTERNAL4, INTERNAL5) ;
       and    U5 (INTERNAL1, INTERNAL2, INTERNAL4) ;
       not   #1 U6 (CLK_OUT, INTERNAL1) ;
       not    U7 (INTERNAL6, dPLL_CLK_LS) ;
       C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U8 (IPLL_EN_LD, dPLL_EN, INTERNAL6 , NOTIFIER) ;
       not    U9 (INTERNAL7, dALT_CLK) ;
       C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U10 (IALT_EN_LD, dALT_EN, INTERNAL7 , NOTIFIER) ;
       buf   #1 U11 (PLL_OUT, dPLL_CLK_LS) ;


	specify

		if (ALT_EN &&  PLL_CLK_LS && !PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_R_CLK_OUT_R_011,`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_011);
		if (ALT_EN &&  !PLL_CLK_LS && PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_R_CLK_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_110);
		if (ALT_EN &&   PLL_CLK_LS && PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_R_CLK_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_111);
		if (ALT_EN &&  !PLL_CLK_LS && !PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_R_CLK_OUT_R_010,`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_010);

		if (!ALT_EN &&  PLL_CLK_LS && !PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_001,`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_001);
		if (!ALT_EN &&  !PLL_CLK_LS && PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_100,`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_100);
		if (!ALT_EN && !PLL_CLK_LS && !PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_000,`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_000);
                if (!ALT_EN && PLL_CLK_LS && PLL_EN)   (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_101,`C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_F_CLK_OUT_F_101); 

		if (ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_CLK_OUT_R_101,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_101);
		if (!ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_CLK_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_110);
		if (ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_CLK_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_111);
		if (!ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_CLK_OUT_R_100,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_100);

		if (ALT_CLK && !ALT_EN &&  !PLL_EN)  (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_001,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_001);
		if (!ALT_CLK && ALT_EN &&  !PLL_EN)  (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_010,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_010);
		if (ALT_CLK && ALT_EN &&  !PLL_EN)   (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_011,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_011);
		if (!ALT_CLK && !ALT_EN &&  !PLL_EN) (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_000,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_CLK_OUT_F_000);

		if (!ALT_CLK && !ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_000,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_000);
		if (ALT_CLK && ALT_EN && !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_PLL_OUT_R_011,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_F_PLL_OUT_F_011);
		if (!ALT_CLK && ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_010,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_010);
		if (ALT_CLK && !ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_001,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_001);
		if (!ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_100,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_100);
		if (ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_111);
		if (!ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_110);
		if (ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_R_101,`C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_R_PLL_OUT_F_101);

		$setuphold(posedge ALT_CLK, posedge ALT_EN, `C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_EN_ALT_CLK_SETUP_posedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_EN_ALT_CLK_HOLD_posedge_posedge , NOTIFIER,, , dALT_CLK, dALT_EN );
		$setuphold(posedge ALT_CLK, negedge ALT_EN, `C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_EN_ALT_CLK_SETUP_negedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_EN_ALT_CLK_HOLD_negedge_posedge , NOTIFIER,, , dALT_CLK, dALT_EN );
		$setuphold(posedge PLL_CLK_LS, posedge PLL_EN, `C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_EN_PLL_CLK_LS_SETUP_posedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_EN_PLL_CLK_LS_HOLD_posedge_posedge , NOTIFIER,,  , dPLL_CLK_LS, dPLL_EN );
		$setuphold(posedge PLL_CLK_LS, negedge PLL_EN, `C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_EN_PLL_CLK_LS_SETUP_negedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_EN_PLL_CLK_LS_HOLD_negedge_posedge , NOTIFIER,, , dPLL_CLK_LS, dPLL_EN );
		$width(negedge PLL_CLK_LS, `C12T28SOIDV_LR_CNGFMUX21X15_P0_PLL_CLK_LS_PWL ,0, NOTIFIER);
		$width(negedge ALT_CLK, `C12T28SOIDV_LR_CNGFMUX21X15_P0_ALT_CLK_PWL ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOIDV_LR_CNGFMUX21X15_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LR_CNGFMUX21X15_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_CNGFMUX21X15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_PWL 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_R_CLK_OUT_R_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_R_CLK_OUT_R_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_R_CLK_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_R_CLK_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_EN_ALT_CLK_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_EN_ALT_CLK_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_EN_ALT_CLK_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_EN_ALT_CLK_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_PLL_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_PLL_OUT_R_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_PWL 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_CLK_OUT_R_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_CLK_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_CLK_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_CLK_OUT_R_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_EN_PLL_CLK_LS_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_EN_PLL_CLK_LS_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_EN_PLL_CLK_LS_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_EN_PLL_CLK_LS_SETUP_posedge_posedge 0.01

module C12T28SOIDV_LR_CNGFMUX21X15_P4 (CLK_OUT, PLL_OUT, PLL_EN, ALT_EN, PLL_CLK_LS, ALT_CLK);

	output CLK_OUT;
	output PLL_OUT;
	input PLL_EN;
	input ALT_EN;
	input PLL_CLK_LS;
	input ALT_CLK;

`ifdef functional
        reg  NOTIFIER;
        and    U1 (INTERNAL3, PLL_CLK_LS, IPLL_EN_LD) ;
        not    U2 (INTERNAL2, INTERNAL3) ;
        and    U3 (INTERNAL5, ALT_CLK, IALT_EN_LD) ;
        not    U4 (INTERNAL4, INTERNAL5) ;
        and    U5 (INTERNAL1, INTERNAL2, INTERNAL4) ;
        not   #1 U6 (CLK_OUT, INTERNAL1) ;
        not    U7 (INTERNAL6, PLL_CLK_LS) ;
        C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U8 (IPLL_EN_LD, PLL_EN, INTERNAL6 , NOTIFIER) ;
        not    U9 (INTERNAL7, ALT_CLK) ;
        C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U10 (IALT_EN_LD, ALT_EN, INTERNAL7 , NOTIFIER) ;
        buf   #1 U11 (PLL_OUT, PLL_CLK_LS) ;

`else
       reg  NOTIFIER;
       and    U1 (INTERNAL3, dPLL_CLK_LS, IPLL_EN_LD) ;
       not    U2 (INTERNAL2, INTERNAL3) ;
       and    U3 (INTERNAL5, dALT_CLK, IALT_EN_LD) ;
       not    U4 (INTERNAL4, INTERNAL5) ;
       and    U5 (INTERNAL1, INTERNAL2, INTERNAL4) ;
       not   #1 U6 (CLK_OUT, INTERNAL1) ;
       not    U7 (INTERNAL6, dPLL_CLK_LS) ;
       C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U8 (IPLL_EN_LD, dPLL_EN, INTERNAL6 , NOTIFIER) ;
       not    U9 (INTERNAL7, dALT_CLK) ;
       C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U10 (IALT_EN_LD, dALT_EN, INTERNAL7 , NOTIFIER) ;
       buf   #1 U11 (PLL_OUT, dPLL_CLK_LS) ;


	specify

		if (ALT_EN &&  PLL_CLK_LS && !PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_R_CLK_OUT_R_011,`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_011);
		if (ALT_EN &&  !PLL_CLK_LS && PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_R_CLK_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_110);
		if (ALT_EN &&   PLL_CLK_LS && PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_R_CLK_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_111);
		if (ALT_EN &&  !PLL_CLK_LS && !PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_R_CLK_OUT_R_010,`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_010);

		if (!ALT_EN &&  PLL_CLK_LS && !PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_001,`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_001);
		if (!ALT_EN &&  !PLL_CLK_LS && PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_100,`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_100);
		if (!ALT_EN && !PLL_CLK_LS && !PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_000,`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_000);
                if (!ALT_EN && PLL_CLK_LS && PLL_EN)   (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_101,`C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_F_CLK_OUT_F_101); 

		if (ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_CLK_OUT_R_101,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_101);
		if (!ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_CLK_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_110);
		if (ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_CLK_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_111);
		if (!ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_CLK_OUT_R_100,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_100);

		if (ALT_CLK && !ALT_EN &&  !PLL_EN)  (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_001,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_001);
		if (!ALT_CLK && ALT_EN &&  !PLL_EN)  (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_010,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_010);
		if (ALT_CLK && ALT_EN &&  !PLL_EN)   (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_011,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_011);
		if (!ALT_CLK && !ALT_EN &&  !PLL_EN) (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_000,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_CLK_OUT_F_000);

		if (!ALT_CLK && !ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_000,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_000);
		if (ALT_CLK && ALT_EN && !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_PLL_OUT_R_011,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_F_PLL_OUT_F_011);
		if (!ALT_CLK && ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_010,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_010);
		if (ALT_CLK && !ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_001,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_001);
		if (!ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_100,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_100);
		if (ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_111);
		if (!ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_110);
		if (ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_R_101,`C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_R_PLL_OUT_F_101);

		$setuphold(posedge ALT_CLK, posedge ALT_EN, `C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_EN_ALT_CLK_SETUP_posedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_EN_ALT_CLK_HOLD_posedge_posedge , NOTIFIER,, , dALT_CLK, dALT_EN );
		$setuphold(posedge ALT_CLK, negedge ALT_EN, `C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_EN_ALT_CLK_SETUP_negedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_EN_ALT_CLK_HOLD_negedge_posedge , NOTIFIER,, , dALT_CLK, dALT_EN );
		$setuphold(posedge PLL_CLK_LS, posedge PLL_EN, `C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_EN_PLL_CLK_LS_SETUP_posedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_EN_PLL_CLK_LS_HOLD_posedge_posedge , NOTIFIER,,  , dPLL_CLK_LS, dPLL_EN );
		$setuphold(posedge PLL_CLK_LS, negedge PLL_EN, `C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_EN_PLL_CLK_LS_SETUP_negedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_EN_PLL_CLK_LS_HOLD_negedge_posedge , NOTIFIER,, , dPLL_CLK_LS, dPLL_EN );
		$width(negedge PLL_CLK_LS, `C12T28SOIDV_LR_CNGFMUX21X15_P4_PLL_CLK_LS_PWL ,0, NOTIFIER);
		$width(negedge ALT_CLK, `C12T28SOIDV_LR_CNGFMUX21X15_P4_ALT_CLK_PWL ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOIDV_LR_CNGFMUX21X15_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LR_CNGFMUX21X15_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_CNGFMUX21X15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_PWL 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_R_CLK_OUT_R_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_R_CLK_OUT_R_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_R_CLK_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_R_CLK_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_EN_ALT_CLK_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_EN_ALT_CLK_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_EN_ALT_CLK_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_EN_ALT_CLK_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_PLL_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_PLL_OUT_R_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_PWL 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_CLK_OUT_R_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_CLK_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_CLK_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_CLK_OUT_R_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_EN_PLL_CLK_LS_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_EN_PLL_CLK_LS_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_EN_PLL_CLK_LS_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_EN_PLL_CLK_LS_SETUP_posedge_posedge 0.01

module C12T28SOIDV_LR_CNGFMUX21X15_P10 (CLK_OUT, PLL_OUT, PLL_EN, ALT_EN, PLL_CLK_LS, ALT_CLK);

	output CLK_OUT;
	output PLL_OUT;
	input PLL_EN;
	input ALT_EN;
	input PLL_CLK_LS;
	input ALT_CLK;

`ifdef functional
        reg  NOTIFIER;
        and    U1 (INTERNAL3, PLL_CLK_LS, IPLL_EN_LD) ;
        not    U2 (INTERNAL2, INTERNAL3) ;
        and    U3 (INTERNAL5, ALT_CLK, IALT_EN_LD) ;
        not    U4 (INTERNAL4, INTERNAL5) ;
        and    U5 (INTERNAL1, INTERNAL2, INTERNAL4) ;
        not   #1 U6 (CLK_OUT, INTERNAL1) ;
        not    U7 (INTERNAL6, PLL_CLK_LS) ;
        C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U8 (IPLL_EN_LD, PLL_EN, INTERNAL6 , NOTIFIER) ;
        not    U9 (INTERNAL7, ALT_CLK) ;
        C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U10 (IALT_EN_LD, ALT_EN, INTERNAL7 , NOTIFIER) ;
        buf   #1 U11 (PLL_OUT, PLL_CLK_LS) ;

`else
       reg  NOTIFIER;
       and    U1 (INTERNAL3, dPLL_CLK_LS, IPLL_EN_LD) ;
       not    U2 (INTERNAL2, INTERNAL3) ;
       and    U3 (INTERNAL5, dALT_CLK, IALT_EN_LD) ;
       not    U4 (INTERNAL4, INTERNAL5) ;
       and    U5 (INTERNAL1, INTERNAL2, INTERNAL4) ;
       not   #1 U6 (CLK_OUT, INTERNAL1) ;
       not    U7 (INTERNAL6, dPLL_CLK_LS) ;
       C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U8 (IPLL_EN_LD, dPLL_EN, INTERNAL6 , NOTIFIER) ;
       not    U9 (INTERNAL7, dALT_CLK) ;
       C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U10 (IALT_EN_LD, dALT_EN, INTERNAL7 , NOTIFIER) ;
       buf   #1 U11 (PLL_OUT, dPLL_CLK_LS) ;


	specify

		if (ALT_EN &&  PLL_CLK_LS && !PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_R_CLK_OUT_R_011,`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_011);
		if (ALT_EN &&  !PLL_CLK_LS && PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_R_CLK_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_110);
		if (ALT_EN &&   PLL_CLK_LS && PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_R_CLK_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_111);
		if (ALT_EN &&  !PLL_CLK_LS && !PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_R_CLK_OUT_R_010,`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_010);

		if (!ALT_EN &&  PLL_CLK_LS && !PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_001,`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_001);
		if (!ALT_EN &&  !PLL_CLK_LS && PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_100,`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_100);
		if (!ALT_EN && !PLL_CLK_LS && !PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_000,`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_000);
                if (!ALT_EN && PLL_CLK_LS && PLL_EN)   (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_101,`C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_F_CLK_OUT_F_101); 

		if (ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_CLK_OUT_R_101,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_101);
		if (!ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_CLK_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_110);
		if (ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_CLK_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_111);
		if (!ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_CLK_OUT_R_100,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_100);

		if (ALT_CLK && !ALT_EN &&  !PLL_EN)  (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_001,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_001);
		if (!ALT_CLK && ALT_EN &&  !PLL_EN)  (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_010,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_010);
		if (ALT_CLK && ALT_EN &&  !PLL_EN)   (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_011,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_011);
		if (!ALT_CLK && !ALT_EN &&  !PLL_EN) (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_000,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_CLK_OUT_F_000);

		if (!ALT_CLK && !ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_000,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_000);
		if (ALT_CLK && ALT_EN && !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_PLL_OUT_R_011,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_F_PLL_OUT_F_011);
		if (!ALT_CLK && ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_010,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_010);
		if (ALT_CLK && !ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_001,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_001);
		if (!ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_100,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_100);
		if (ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_111);
		if (!ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_110);
		if (ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_R_101,`C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_R_PLL_OUT_F_101);

		$setuphold(posedge ALT_CLK, posedge ALT_EN, `C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_EN_ALT_CLK_SETUP_posedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_EN_ALT_CLK_HOLD_posedge_posedge , NOTIFIER,, , dALT_CLK, dALT_EN );
		$setuphold(posedge ALT_CLK, negedge ALT_EN, `C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_EN_ALT_CLK_SETUP_negedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_EN_ALT_CLK_HOLD_negedge_posedge , NOTIFIER,, , dALT_CLK, dALT_EN );
		$setuphold(posedge PLL_CLK_LS, posedge PLL_EN, `C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_EN_PLL_CLK_LS_SETUP_posedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_EN_PLL_CLK_LS_HOLD_posedge_posedge , NOTIFIER,,  , dPLL_CLK_LS, dPLL_EN );
		$setuphold(posedge PLL_CLK_LS, negedge PLL_EN, `C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_EN_PLL_CLK_LS_SETUP_negedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_EN_PLL_CLK_LS_HOLD_negedge_posedge , NOTIFIER,, , dPLL_CLK_LS, dPLL_EN );
		$width(negedge PLL_CLK_LS, `C12T28SOIDV_LR_CNGFMUX21X15_P10_PLL_CLK_LS_PWL ,0, NOTIFIER);
		$width(negedge ALT_CLK, `C12T28SOIDV_LR_CNGFMUX21X15_P10_ALT_CLK_PWL ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOIDV_LR_CNGFMUX21X15_P10

`endcelldefine

// Verilog model view for C12T28SOIDV_LR_CNGFMUX21X30_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_CNGFMUX21X30_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_PWL 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_R_CLK_OUT_R_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_R_CLK_OUT_R_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_R_CLK_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_R_CLK_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_EN_ALT_CLK_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_EN_ALT_CLK_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_EN_ALT_CLK_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_EN_ALT_CLK_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_PLL_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_PLL_OUT_R_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_PWL 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_CLK_OUT_R_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_CLK_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_CLK_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_CLK_OUT_R_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_EN_PLL_CLK_LS_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_EN_PLL_CLK_LS_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_EN_PLL_CLK_LS_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_EN_PLL_CLK_LS_SETUP_posedge_posedge 0.01

module C12T28SOIDV_LR_CNGFMUX21X30_P0 (CLK_OUT, PLL_OUT, PLL_EN, ALT_EN, PLL_CLK_LS, ALT_CLK);

	output CLK_OUT;
	output PLL_OUT;
	input PLL_EN;
	input ALT_EN;
	input PLL_CLK_LS;
	input ALT_CLK;

`ifdef functional
        reg  NOTIFIER;
        and    U1 (INTERNAL3, PLL_CLK_LS, IPLL_EN_LD) ;
        not    U2 (INTERNAL2, INTERNAL3) ;
        and    U3 (INTERNAL5, ALT_CLK, IALT_EN_LD) ;
        not    U4 (INTERNAL4, INTERNAL5) ;
        and    U5 (INTERNAL1, INTERNAL2, INTERNAL4) ;
        not   #1 U6 (CLK_OUT, INTERNAL1) ;
        not    U7 (INTERNAL6, PLL_CLK_LS) ;
        C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U8 (IPLL_EN_LD, PLL_EN, INTERNAL6 , NOTIFIER) ;
        not    U9 (INTERNAL7, ALT_CLK) ;
        C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U10 (IALT_EN_LD, ALT_EN, INTERNAL7 , NOTIFIER) ;
        buf   #1 U11 (PLL_OUT, PLL_CLK_LS) ;

`else
       reg  NOTIFIER;
       and    U1 (INTERNAL3, dPLL_CLK_LS, IPLL_EN_LD) ;
       not    U2 (INTERNAL2, INTERNAL3) ;
       and    U3 (INTERNAL5, dALT_CLK, IALT_EN_LD) ;
       not    U4 (INTERNAL4, INTERNAL5) ;
       and    U5 (INTERNAL1, INTERNAL2, INTERNAL4) ;
       not   #1 U6 (CLK_OUT, INTERNAL1) ;
       not    U7 (INTERNAL6, dPLL_CLK_LS) ;
       C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U8 (IPLL_EN_LD, dPLL_EN, INTERNAL6 , NOTIFIER) ;
       not    U9 (INTERNAL7, dALT_CLK) ;
       C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U10 (IALT_EN_LD, dALT_EN, INTERNAL7 , NOTIFIER) ;
       buf   #1 U11 (PLL_OUT, dPLL_CLK_LS) ;


	specify

		if (ALT_EN &&  PLL_CLK_LS && !PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_R_CLK_OUT_R_011,`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_011);
		if (ALT_EN &&  !PLL_CLK_LS && PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_R_CLK_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_110);
		if (ALT_EN &&   PLL_CLK_LS && PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_R_CLK_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_111);
		if (ALT_EN &&  !PLL_CLK_LS && !PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_R_CLK_OUT_R_010,`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_010);

		if (!ALT_EN &&  PLL_CLK_LS && !PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_001,`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_001);
		if (!ALT_EN &&  !PLL_CLK_LS && PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_100,`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_100);
		if (!ALT_EN && !PLL_CLK_LS && !PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_000,`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_000);
                if (!ALT_EN && PLL_CLK_LS && PLL_EN)   (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_101,`C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_F_CLK_OUT_F_101); 

		if (ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_CLK_OUT_R_101,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_101);
		if (!ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_CLK_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_110);
		if (ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_CLK_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_111);
		if (!ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_CLK_OUT_R_100,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_100);

		if (ALT_CLK && !ALT_EN &&  !PLL_EN)  (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_001,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_001);
		if (!ALT_CLK && ALT_EN &&  !PLL_EN)  (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_010,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_010);
		if (ALT_CLK && ALT_EN &&  !PLL_EN)   (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_011,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_011);
		if (!ALT_CLK && !ALT_EN &&  !PLL_EN) (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_000,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_CLK_OUT_F_000);

		if (!ALT_CLK && !ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_000,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_000);
		if (ALT_CLK && ALT_EN && !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_PLL_OUT_R_011,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_F_PLL_OUT_F_011);
		if (!ALT_CLK && ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_010,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_010);
		if (ALT_CLK && !ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_001,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_001);
		if (!ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_100,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_100);
		if (ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_111);
		if (!ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_110);
		if (ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_R_101,`C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_R_PLL_OUT_F_101);

		$setuphold(posedge ALT_CLK, posedge ALT_EN, `C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_EN_ALT_CLK_SETUP_posedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_EN_ALT_CLK_HOLD_posedge_posedge , NOTIFIER,, , dALT_CLK, dALT_EN );
		$setuphold(posedge ALT_CLK, negedge ALT_EN, `C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_EN_ALT_CLK_SETUP_negedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_EN_ALT_CLK_HOLD_negedge_posedge , NOTIFIER,, , dALT_CLK, dALT_EN );
		$setuphold(posedge PLL_CLK_LS, posedge PLL_EN, `C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_EN_PLL_CLK_LS_SETUP_posedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_EN_PLL_CLK_LS_HOLD_posedge_posedge , NOTIFIER,,  , dPLL_CLK_LS, dPLL_EN );
		$setuphold(posedge PLL_CLK_LS, negedge PLL_EN, `C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_EN_PLL_CLK_LS_SETUP_negedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_EN_PLL_CLK_LS_HOLD_negedge_posedge , NOTIFIER,, , dPLL_CLK_LS, dPLL_EN );
		$width(negedge PLL_CLK_LS, `C12T28SOIDV_LR_CNGFMUX21X30_P0_PLL_CLK_LS_PWL ,0, NOTIFIER);
		$width(negedge ALT_CLK, `C12T28SOIDV_LR_CNGFMUX21X30_P0_ALT_CLK_PWL ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOIDV_LR_CNGFMUX21X30_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LR_CNGFMUX21X30_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_CNGFMUX21X30_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_PWL 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_R_CLK_OUT_R_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_R_CLK_OUT_R_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_R_CLK_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_R_CLK_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_EN_ALT_CLK_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_EN_ALT_CLK_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_EN_ALT_CLK_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_EN_ALT_CLK_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_PLL_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_PLL_OUT_R_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_PWL 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_CLK_OUT_R_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_CLK_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_CLK_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_CLK_OUT_R_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_EN_PLL_CLK_LS_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_EN_PLL_CLK_LS_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_EN_PLL_CLK_LS_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_EN_PLL_CLK_LS_SETUP_posedge_posedge 0.01

module C12T28SOIDV_LR_CNGFMUX21X30_P4 (CLK_OUT, PLL_OUT, PLL_EN, ALT_EN, PLL_CLK_LS, ALT_CLK);

	output CLK_OUT;
	output PLL_OUT;
	input PLL_EN;
	input ALT_EN;
	input PLL_CLK_LS;
	input ALT_CLK;

`ifdef functional
        reg  NOTIFIER;
        and    U1 (INTERNAL3, PLL_CLK_LS, IPLL_EN_LD) ;
        not    U2 (INTERNAL2, INTERNAL3) ;
        and    U3 (INTERNAL5, ALT_CLK, IALT_EN_LD) ;
        not    U4 (INTERNAL4, INTERNAL5) ;
        and    U5 (INTERNAL1, INTERNAL2, INTERNAL4) ;
        not   #1 U6 (CLK_OUT, INTERNAL1) ;
        not    U7 (INTERNAL6, PLL_CLK_LS) ;
        C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U8 (IPLL_EN_LD, PLL_EN, INTERNAL6 , NOTIFIER) ;
        not    U9 (INTERNAL7, ALT_CLK) ;
        C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U10 (IALT_EN_LD, ALT_EN, INTERNAL7 , NOTIFIER) ;
        buf   #1 U11 (PLL_OUT, PLL_CLK_LS) ;

`else
       reg  NOTIFIER;
       and    U1 (INTERNAL3, dPLL_CLK_LS, IPLL_EN_LD) ;
       not    U2 (INTERNAL2, INTERNAL3) ;
       and    U3 (INTERNAL5, dALT_CLK, IALT_EN_LD) ;
       not    U4 (INTERNAL4, INTERNAL5) ;
       and    U5 (INTERNAL1, INTERNAL2, INTERNAL4) ;
       not   #1 U6 (CLK_OUT, INTERNAL1) ;
       not    U7 (INTERNAL6, dPLL_CLK_LS) ;
       C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U8 (IPLL_EN_LD, dPLL_EN, INTERNAL6 , NOTIFIER) ;
       not    U9 (INTERNAL7, dALT_CLK) ;
       C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U10 (IALT_EN_LD, dALT_EN, INTERNAL7 , NOTIFIER) ;
       buf   #1 U11 (PLL_OUT, dPLL_CLK_LS) ;


	specify

		if (ALT_EN &&  PLL_CLK_LS && !PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_R_CLK_OUT_R_011,`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_011);
		if (ALT_EN &&  !PLL_CLK_LS && PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_R_CLK_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_110);
		if (ALT_EN &&   PLL_CLK_LS && PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_R_CLK_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_111);
		if (ALT_EN &&  !PLL_CLK_LS && !PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_R_CLK_OUT_R_010,`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_010);

		if (!ALT_EN &&  PLL_CLK_LS && !PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_001,`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_001);
		if (!ALT_EN &&  !PLL_CLK_LS && PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_100,`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_100);
		if (!ALT_EN && !PLL_CLK_LS && !PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_000,`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_000);
                if (!ALT_EN && PLL_CLK_LS && PLL_EN)   (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_101,`C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_F_CLK_OUT_F_101); 

		if (ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_CLK_OUT_R_101,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_101);
		if (!ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_CLK_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_110);
		if (ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_CLK_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_111);
		if (!ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_CLK_OUT_R_100,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_100);

		if (ALT_CLK && !ALT_EN &&  !PLL_EN)  (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_001,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_001);
		if (!ALT_CLK && ALT_EN &&  !PLL_EN)  (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_010,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_010);
		if (ALT_CLK && ALT_EN &&  !PLL_EN)   (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_011,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_011);
		if (!ALT_CLK && !ALT_EN &&  !PLL_EN) (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_000,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_CLK_OUT_F_000);

		if (!ALT_CLK && !ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_000,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_000);
		if (ALT_CLK && ALT_EN && !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_PLL_OUT_R_011,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_F_PLL_OUT_F_011);
		if (!ALT_CLK && ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_010,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_010);
		if (ALT_CLK && !ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_001,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_001);
		if (!ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_100,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_100);
		if (ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_111);
		if (!ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_110);
		if (ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_R_101,`C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_R_PLL_OUT_F_101);

		$setuphold(posedge ALT_CLK, posedge ALT_EN, `C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_EN_ALT_CLK_SETUP_posedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_EN_ALT_CLK_HOLD_posedge_posedge , NOTIFIER,, , dALT_CLK, dALT_EN );
		$setuphold(posedge ALT_CLK, negedge ALT_EN, `C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_EN_ALT_CLK_SETUP_negedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_EN_ALT_CLK_HOLD_negedge_posedge , NOTIFIER,, , dALT_CLK, dALT_EN );
		$setuphold(posedge PLL_CLK_LS, posedge PLL_EN, `C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_EN_PLL_CLK_LS_SETUP_posedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_EN_PLL_CLK_LS_HOLD_posedge_posedge , NOTIFIER,,  , dPLL_CLK_LS, dPLL_EN );
		$setuphold(posedge PLL_CLK_LS, negedge PLL_EN, `C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_EN_PLL_CLK_LS_SETUP_negedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_EN_PLL_CLK_LS_HOLD_negedge_posedge , NOTIFIER,, , dPLL_CLK_LS, dPLL_EN );
		$width(negedge PLL_CLK_LS, `C12T28SOIDV_LR_CNGFMUX21X30_P4_PLL_CLK_LS_PWL ,0, NOTIFIER);
		$width(negedge ALT_CLK, `C12T28SOIDV_LR_CNGFMUX21X30_P4_ALT_CLK_PWL ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOIDV_LR_CNGFMUX21X30_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LR_CNGFMUX21X30_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_CNGFMUX21X30_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_PWL 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_R_CLK_OUT_R_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_R_CLK_OUT_R_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_R_CLK_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_R_CLK_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_EN_ALT_CLK_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_EN_ALT_CLK_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_EN_ALT_CLK_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_EN_ALT_CLK_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_PLL_OUT_F_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_PLL_OUT_R_011 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_PWL 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_CLK_OUT_R_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_CLK_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_CLK_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_000 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_001 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_010 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_101 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_110 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_111 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_CLK_OUT_R_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_100 0.1
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_EN_PLL_CLK_LS_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_EN_PLL_CLK_LS_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_EN_PLL_CLK_LS_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_EN_PLL_CLK_LS_SETUP_posedge_posedge 0.01

module C12T28SOIDV_LR_CNGFMUX21X30_P10 (CLK_OUT, PLL_OUT, PLL_EN, ALT_EN, PLL_CLK_LS, ALT_CLK);

	output CLK_OUT;
	output PLL_OUT;
	input PLL_EN;
	input ALT_EN;
	input PLL_CLK_LS;
	input ALT_CLK;

`ifdef functional
        reg  NOTIFIER;
        and    U1 (INTERNAL3, PLL_CLK_LS, IPLL_EN_LD) ;
        not    U2 (INTERNAL2, INTERNAL3) ;
        and    U3 (INTERNAL5, ALT_CLK, IALT_EN_LD) ;
        not    U4 (INTERNAL4, INTERNAL5) ;
        and    U5 (INTERNAL1, INTERNAL2, INTERNAL4) ;
        not   #1 U6 (CLK_OUT, INTERNAL1) ;
        not    U7 (INTERNAL6, PLL_CLK_LS) ;
        C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U8 (IPLL_EN_LD, PLL_EN, INTERNAL6 , NOTIFIER) ;
        not    U9 (INTERNAL7, ALT_CLK) ;
        C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U10 (IALT_EN_LD, ALT_EN, INTERNAL7 , NOTIFIER) ;
        buf   #1 U11 (PLL_OUT, PLL_CLK_LS) ;

`else
       reg  NOTIFIER;
       and    U1 (INTERNAL3, dPLL_CLK_LS, IPLL_EN_LD) ;
       not    U2 (INTERNAL2, INTERNAL3) ;
       and    U3 (INTERNAL5, dALT_CLK, IALT_EN_LD) ;
       not    U4 (INTERNAL4, INTERNAL5) ;
       and    U5 (INTERNAL1, INTERNAL2, INTERNAL4) ;
       not   #1 U6 (CLK_OUT, INTERNAL1) ;
       not    U7 (INTERNAL6, dPLL_CLK_LS) ;
       C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U8 (IPLL_EN_LD, dPLL_EN, INTERNAL6 , NOTIFIER) ;
       not    U9 (INTERNAL7, dALT_CLK) ;
       C28SOI_SC_12_CLK_LR_U_LD_P_NOTI   U10 (IALT_EN_LD, dALT_EN, INTERNAL7 , NOTIFIER) ;
       buf   #1 U11 (PLL_OUT, dPLL_CLK_LS) ;


	specify

		if (ALT_EN &&  PLL_CLK_LS && !PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_R_CLK_OUT_R_011,`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_011);
		if (ALT_EN &&  !PLL_CLK_LS && PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_R_CLK_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_110);
		if (ALT_EN &&   PLL_CLK_LS && PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_R_CLK_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_111);
		if (ALT_EN &&  !PLL_CLK_LS && !PLL_EN) (ALT_CLK +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_R_CLK_OUT_R_010,`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_010);

		if (!ALT_EN &&  PLL_CLK_LS && !PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_001,`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_001);
		if (!ALT_EN &&  !PLL_CLK_LS && PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_100,`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_100);
		if (!ALT_EN && !PLL_CLK_LS && !PLL_EN) (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_000,`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_000);
                if (!ALT_EN && PLL_CLK_LS && PLL_EN)   (negedge ALT_CLK => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_101,`C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_F_CLK_OUT_F_101); 

		if (ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_CLK_OUT_R_101,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_101);
		if (!ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_CLK_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_110);
		if (ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_CLK_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_111);
		if (!ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> CLK_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_CLK_OUT_R_100,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_100);

		if (ALT_CLK && !ALT_EN &&  !PLL_EN)  (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_001,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_001);
		if (!ALT_CLK && ALT_EN &&  !PLL_EN)  (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_010,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_010);
		if (ALT_CLK && ALT_EN &&  !PLL_EN)   (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0)) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_011,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_011);
		if (!ALT_CLK && !ALT_EN &&  !PLL_EN) (negedge PLL_CLK_LS => (CLK_OUT +: 1'b0))  = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_000,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_CLK_OUT_F_000);

		if (!ALT_CLK && !ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_000,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_000);
		if (ALT_CLK && ALT_EN && !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_PLL_OUT_R_011,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_F_PLL_OUT_F_011);
		if (!ALT_CLK && ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_010,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_010);
		if (ALT_CLK && !ALT_EN &&  !PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_001,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_001);
		if (!ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_100,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_100);
		if (ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_111,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_111);
		if (!ALT_CLK && ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_110,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_110);
		if (ALT_CLK && !ALT_EN &&  PLL_EN) (PLL_CLK_LS +=> PLL_OUT) = (`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_R_101,`C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_R_PLL_OUT_F_101);

		$setuphold(posedge ALT_CLK, posedge ALT_EN, `C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_EN_ALT_CLK_SETUP_posedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_EN_ALT_CLK_HOLD_posedge_posedge , NOTIFIER,, , dALT_CLK, dALT_EN );
		$setuphold(posedge ALT_CLK, negedge ALT_EN, `C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_EN_ALT_CLK_SETUP_negedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_EN_ALT_CLK_HOLD_negedge_posedge , NOTIFIER,, , dALT_CLK, dALT_EN );
		$setuphold(posedge PLL_CLK_LS, posedge PLL_EN, `C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_EN_PLL_CLK_LS_SETUP_posedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_EN_PLL_CLK_LS_HOLD_posedge_posedge , NOTIFIER,,  , dPLL_CLK_LS, dPLL_EN );
		$setuphold(posedge PLL_CLK_LS, negedge PLL_EN, `C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_EN_PLL_CLK_LS_SETUP_negedge_posedge, `C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_EN_PLL_CLK_LS_HOLD_negedge_posedge , NOTIFIER,, , dPLL_CLK_LS, dPLL_EN );
		$width(negedge PLL_CLK_LS, `C12T28SOIDV_LR_CNGFMUX21X30_P10_PLL_CLK_LS_PWL ,0, NOTIFIER);
		$width(negedge ALT_CLK, `C12T28SOIDV_LR_CNGFMUX21X30_P10_ALT_CLK_PWL ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOIDV_LR_CNGFMUX21X30_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX15_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX15_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX15_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX15_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX15_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX15_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX15_P0_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX15_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX15_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX15_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX15_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX15_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX15_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX15_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX15_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX15_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX15_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX15_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX15_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX15_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX15_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX15_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX15_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX15_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX15_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX15_P4_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX15_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX15_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX15_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX15_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX15_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX15_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX15_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX15_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX15_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX15_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX15_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX15_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX15_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX15_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX15_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX15_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX15_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX15_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX15_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX15_P10_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX15_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX15_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX15_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX15_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX15_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX15_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX15_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX15_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX15_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX15_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX15_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX15_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX22_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX22_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX22_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX22_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX22_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX22_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX22_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX22_P0_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX22_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX22_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX22_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX22_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX22_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX22_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX22_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX22_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX22_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX22_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX22_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX22_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX22_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX22_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX22_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX22_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX22_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX22_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX22_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX22_P4_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX22_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX22_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX22_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX22_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX22_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX22_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX22_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX22_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX22_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX22_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX22_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX22_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX22_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX22_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX22_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX22_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX22_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX22_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX22_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX22_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX22_P10_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX22_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX22_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX22_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX22_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX22_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX22_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX22_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX22_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX22_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX22_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX22_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX22_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX29_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX29_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX29_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX29_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX29_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX29_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX29_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX29_P0_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX29_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX29_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX29_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX29_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX29_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX29_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX29_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX29_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX29_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX29_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX29_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX29_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX29_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX29_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX29_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX29_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX29_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX29_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX29_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX29_P4_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX29_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX29_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX29_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX29_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX29_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX29_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX29_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX29_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX29_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX29_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX29_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX29_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX29_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX29_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX29_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX29_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX29_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX29_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX29_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX29_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX29_P10_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX29_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX29_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX29_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX29_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX29_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX29_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX29_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX29_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX29_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX29_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX29_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX29_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX29_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX29_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX29_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX29_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX29_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX29_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX29_P0_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX29_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX29_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX29_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX29_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX29_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX29_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX29_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX29_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX29_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX29_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX29_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX29_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX29_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX29_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX29_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX29_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX29_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX29_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX29_P4_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX29_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX29_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX29_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX29_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX29_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX29_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX29_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX29_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX29_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX29_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX29_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX29_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX29_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX29_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX29_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX29_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX29_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX29_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX29_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX29_P10_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX29_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX29_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX29_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX29_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX29_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX29_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX29_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX29_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX29_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX29_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX29_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX29_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX36_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX36_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX36_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX36_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX36_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX36_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX36_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX36_P0_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX36_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX36_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX36_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX36_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX36_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX36_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX36_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX36_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX36_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX36_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX36_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX36_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX36_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX36_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX36_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX36_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX36_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX36_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX36_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX36_P4_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX36_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX36_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX36_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX36_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX36_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX36_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX36_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX36_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX36_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX36_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX36_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX36_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX36_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX36_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX36_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX36_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX36_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX36_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX36_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX36_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX36_P10_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX36_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX36_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX36_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX36_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX36_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX36_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX36_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX36_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX36_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX36_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX36_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX36_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX36_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX36_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX36_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX36_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX36_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX36_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX36_P0_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX36_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX36_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX36_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX36_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX36_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX36_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX36_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX36_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX36_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX36_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX36_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX36_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX36_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX36_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX36_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX36_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX36_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX36_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX36_P4_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX36_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX36_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX36_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX36_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX36_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX36_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX36_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX36_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX36_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX36_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX36_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX36_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX36_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX36_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX36_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX36_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX36_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX36_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX36_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX36_P10_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX36_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX36_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX36_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX36_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX36_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX36_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX36_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX36_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX36_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX36_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX36_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX36_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX44_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX44_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX44_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX44_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX44_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX44_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX44_P0_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX44_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX44_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX44_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX44_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX44_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX44_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX44_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX44_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX44_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX44_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX44_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX44_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX44_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX44_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX44_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX44_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX44_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX44_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX44_P4_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX44_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX44_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX44_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX44_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX44_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX44_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX44_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX44_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX44_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX44_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX44_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX44_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX44_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX44_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX44_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX44_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX44_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX44_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX44_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX44_P10_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX44_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX44_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX44_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX44_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX44_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX44_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX44_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX44_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX44_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX44_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX44_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX44_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX51_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX51_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX51_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX51_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX51_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX51_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX51_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX51_P0_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX51_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX51_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX51_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX51_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX51_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX51_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX51_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX51_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX51_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX51_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX51_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX51_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX51_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX51_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX51_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX51_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX51_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX51_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX51_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX51_P4_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX51_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX51_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX51_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX51_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX51_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX51_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX51_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX51_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX51_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX51_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX51_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX51_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX51_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX51_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX51_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX51_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX51_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX51_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX51_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX51_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX51_P10_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX51_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX51_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX51_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX51_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX51_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX51_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX51_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX51_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX51_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX51_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX51_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX51_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX51_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX51_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX51_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX51_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX51_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX51_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX51_P0_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX51_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX51_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX51_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX51_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX51_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX51_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX51_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX51_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX51_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX51_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX51_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX51_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX51_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX51_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX51_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX51_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX51_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX51_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX51_P4_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX51_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX51_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX51_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX51_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX51_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX51_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX51_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX51_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX51_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX51_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX51_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX51_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX51_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX51_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX51_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX51_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX51_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX51_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX51_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX51_P10_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX51_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX51_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX51_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX51_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX51_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX51_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX51_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX51_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX51_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX51_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX51_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX51_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX58_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX58_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX58_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX58_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX58_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX58_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX58_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX58_P0_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX58_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX58_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX58_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX58_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX58_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX58_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX58_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX58_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX58_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX58_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX58_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX58_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX58_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX58_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX58_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX58_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX58_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX58_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX58_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX58_P4_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX58_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX58_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX58_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX58_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX58_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX58_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX58_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX58_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX58_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX58_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX58_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX58_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX58_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX58_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX58_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX58_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX58_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX58_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX58_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX58_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX58_P10_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX58_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX58_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX58_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX58_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX58_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX58_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX58_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX58_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX58_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX58_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX58_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX58_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX58_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX58_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX58_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX58_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX58_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX58_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX58_P0_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX58_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX58_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX58_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX58_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX58_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX58_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX58_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX58_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX58_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX58_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX58_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX58_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX58_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX58_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX58_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX58_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX58_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX58_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX58_P4_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX58_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX58_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX58_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX58_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX58_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX58_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX58_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX58_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX58_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX58_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX58_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX58_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX58_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX58_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX58_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX58_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX58_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX58_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX58_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX58_P10_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX58_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX58_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX58_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX58_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX58_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX58_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX58_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX58_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX58_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX58_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX58_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX58_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX71_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX71_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX71_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX71_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX71_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX71_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX71_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX71_P0_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX71_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX71_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX71_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX71_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX71_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX71_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX71_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX71_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX71_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX71_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX71_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX71_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX71_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX71_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX71_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX71_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX71_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX71_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX71_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX71_P4_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX71_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX71_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX71_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX71_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX71_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX71_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX71_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX71_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX71_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX71_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX71_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX71_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX71_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX71_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX71_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX71_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX71_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX71_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX71_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX71_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX71_P10_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX71_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX71_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX71_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX71_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX71_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX71_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX71_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX71_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX71_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX71_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX71_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX71_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX71_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX71_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX71_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX71_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX71_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX71_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX71_P0_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX71_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX71_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX71_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX71_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX71_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX71_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX71_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX71_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX71_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX71_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX71_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX71_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX71_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX71_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX71_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX71_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX71_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX71_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX71_P4_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX71_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX71_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX71_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX71_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX71_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX71_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX71_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX71_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX71_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX71_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX71_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX71_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX71_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX71_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX71_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX71_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX71_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX71_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX71_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX71_P10_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX71_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX71_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX71_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX71_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX71_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX71_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX71_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX71_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX71_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX71_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX71_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX71_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX7_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX7_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX7_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX7_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX7_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX7_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX7_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX7_P0_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX7_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX7_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX7_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX7_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX7_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX7_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX7_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX7_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX7_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX7_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX7_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX7_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX7_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX7_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX7_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX7_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX7_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX7_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX7_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX7_P4_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX7_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX7_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX7_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX7_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX7_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX7_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX7_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX7_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX7_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX7_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX7_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX7_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX7_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX7_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX7_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX7_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX7_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX7_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX7_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX7_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX7_P10_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX7_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX7_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX7_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX7_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX7_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX7_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX7_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX7_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX7_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX7_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX7_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX7_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX86_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX86_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX86_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX86_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX86_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX86_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX86_P0_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX86_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX86_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX86_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX86_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX86_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX86_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX86_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX86_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX86_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX86_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX86_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX86_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX86_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX86_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX86_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX86_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX86_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX86_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX86_P4_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX86_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX86_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX86_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX86_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX86_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX86_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX86_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX86_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX86_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX86_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX86_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX86_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRPHP_CNHLSX86_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRPHP_CNHLSX86_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRPHP_CNHLSX86_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRPHP_CNHLSX86_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRPHP_CNHLSX86_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRPHP_CNHLSX86_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRPHP_CNHLSX86_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRPHP_CNHLSX86_P10_CP_R_Q_R,`C12T28SOI_LRPHP_CNHLSX86_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRPHP_CNHLSX86_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX86_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRPHP_CNHLSX86_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX86_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRPHP_CNHLSX86_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRPHP_CNHLSX86_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRPHP_CNHLSX86_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRPHP_CNHLSX86_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRPHP_CNHLSX86_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRPHP_CNHLSX86_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRPHP_CNHLSX86_P10

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX93_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX93_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX93_P0_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX93_P0_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX93_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P0_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P0_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P0_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P0_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P0_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX93_P0_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX93_P0 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX93_P0_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX93_P0_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX93_P0_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX93_P0_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX93_P0_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX93_P0_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX93_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX93_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX93_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX93_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX93_P0_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX93_P0_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX93_P0

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX93_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX93_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX93_P4_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX93_P4_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX93_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P4_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P4_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P4_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P4_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P4_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX93_P4_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX93_P4 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX93_P4_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX93_P4_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX93_P4_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX93_P4_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX93_P4_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX93_P4_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX93_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX93_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX93_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX93_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX93_P4_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX93_P4_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX93_P4

`endcelldefine

// Verilog model view for C12T28SOI_LRP_CNHLSX93_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LRP_CNHLSX93_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LRP_CNHLSX93_P10_CP_R_Q_R 0.1
`define C12T28SOI_LRP_CNHLSX93_P10_CP_F_Q_F 0.1
`define C12T28SOI_LRP_CNHLSX93_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P10_E_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P10_E_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P10_E_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P10_E_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LRP_CNHLSX93_P10_CP_PWL_state_2 0.01
`define C12T28SOI_LRP_CNHLSX93_P10_CP_PWL_state_1 0.01

module C12T28SOI_LRP_CNHLSX93_P10 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        C28SOI_SC_12_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T28SOI_LRP_CNHLSX93_P10_CP_R_Q_R,`C12T28SOI_LRP_CNHLSX93_P10_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T28SOI_LRP_CNHLSX93_P10_E_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX93_P10_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T28SOI_LRP_CNHLSX93_P10_E_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX93_P10_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LRP_CNHLSX93_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LRP_CNHLSX93_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LRP_CNHLSX93_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LRP_CNHLSX93_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T28SOI_LRP_CNHLSX93_P10_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOI_LRP_CNHLSX93_P10_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOI_LRP_CNHLSX93_P10

`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX133_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX133_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX133_P0_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX133_P0_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX133_P0 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX133_P0_A_F_Z_R,`C12T28SOI_LR_CNIVX133_P0_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX133_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX133_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX133_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX133_P4_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX133_P4_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX133_P4 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX133_P4_A_F_Z_R,`C12T28SOI_LR_CNIVX133_P4_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX133_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX133_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX133_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX133_P10_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX133_P10_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX133_P10 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX133_P10_A_F_Z_R,`C12T28SOI_LR_CNIVX133_P10_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX133_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX16_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX16_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX16_P0_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX16_P0_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX16_P0 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX16_P0_A_F_Z_R,`C12T28SOI_LR_CNIVX16_P0_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX16_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX16_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX16_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX16_P4_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX16_P4_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX16_P4 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX16_P4_A_F_Z_R,`C12T28SOI_LR_CNIVX16_P4_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX16_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX16_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX16_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX16_P10_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX16_P10_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX16_P10 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX16_P10_A_F_Z_R,`C12T28SOI_LR_CNIVX16_P10_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX16_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX23_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX23_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX23_P0_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX23_P0_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX23_P0 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX23_P0_A_F_Z_R,`C12T28SOI_LR_CNIVX23_P0_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX23_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX23_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX23_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX23_P4_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX23_P4_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX23_P4 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX23_P4_A_F_Z_R,`C12T28SOI_LR_CNIVX23_P4_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX23_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX23_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX23_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX23_P10_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX23_P10_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX23_P10 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX23_P10_A_F_Z_R,`C12T28SOI_LR_CNIVX23_P10_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX23_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX31_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX31_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX31_P0_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX31_P0_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX31_P0 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX31_P0_A_F_Z_R,`C12T28SOI_LR_CNIVX31_P0_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX31_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX31_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX31_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX31_P4_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX31_P4_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX31_P4 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX31_P4_A_F_Z_R,`C12T28SOI_LR_CNIVX31_P4_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX31_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX31_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX31_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX31_P10_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX31_P10_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX31_P10 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX31_P10_A_F_Z_R,`C12T28SOI_LR_CNIVX31_P10_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX31_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX39_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX39_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX39_P0_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX39_P0_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX39_P0 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX39_P0_A_F_Z_R,`C12T28SOI_LR_CNIVX39_P0_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX39_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX39_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX39_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX39_P4_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX39_P4_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX39_P4 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX39_P4_A_F_Z_R,`C12T28SOI_LR_CNIVX39_P4_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX39_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX39_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX39_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX39_P10_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX39_P10_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX39_P10 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX39_P10_A_F_Z_R,`C12T28SOI_LR_CNIVX39_P10_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX39_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX47_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX47_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX47_P0_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX47_P0_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX47_P0 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX47_P0_A_F_Z_R,`C12T28SOI_LR_CNIVX47_P0_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX47_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX47_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX47_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX47_P4_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX47_P4_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX47_P4 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX47_P4_A_F_Z_R,`C12T28SOI_LR_CNIVX47_P4_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX47_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX47_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX47_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX47_P10_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX47_P10_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX47_P10 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX47_P10_A_F_Z_R,`C12T28SOI_LR_CNIVX47_P10_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX47_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX55_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX55_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX55_P0_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX55_P0_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX55_P0 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX55_P0_A_F_Z_R,`C12T28SOI_LR_CNIVX55_P0_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX55_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX55_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX55_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX55_P4_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX55_P4_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX55_P4 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX55_P4_A_F_Z_R,`C12T28SOI_LR_CNIVX55_P4_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX55_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX55_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX55_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX55_P10_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX55_P10_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX55_P10 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX55_P10_A_F_Z_R,`C12T28SOI_LR_CNIVX55_P10_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX55_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX5_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX5_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX5_P0_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX5_P0_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX5_P0 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX5_P0_A_F_Z_R,`C12T28SOI_LR_CNIVX5_P0_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX5_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX5_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX5_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX5_P4_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX5_P4_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX5_P4 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX5_P4_A_F_Z_R,`C12T28SOI_LR_CNIVX5_P4_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX5_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX5_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX5_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX5_P10_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX5_P10_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX5_P10 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX5_P10_A_F_Z_R,`C12T28SOI_LR_CNIVX5_P10_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX5_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX61_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX61_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX61_P0_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX61_P0_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX61_P0 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX61_P0_A_F_Z_R,`C12T28SOI_LR_CNIVX61_P0_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX61_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX61_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX61_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX61_P4_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX61_P4_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX61_P4 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX61_P4_A_F_Z_R,`C12T28SOI_LR_CNIVX61_P4_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX61_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX61_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX61_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX61_P10_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX61_P10_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX61_P10 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX61_P10_A_F_Z_R,`C12T28SOI_LR_CNIVX61_P10_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX61_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX70_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX70_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX70_P0_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX70_P0_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX70_P0 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX70_P0_A_F_Z_R,`C12T28SOI_LR_CNIVX70_P0_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX70_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX70_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX70_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX70_P4_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX70_P4_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX70_P4 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX70_P4_A_F_Z_R,`C12T28SOI_LR_CNIVX70_P4_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX70_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX70_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX70_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX70_P10_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX70_P10_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX70_P10 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX70_P10_A_F_Z_R,`C12T28SOI_LR_CNIVX70_P10_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX70_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX8_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX8_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX8_P0_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX8_P0_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX8_P0 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX8_P0_A_F_Z_R,`C12T28SOI_LR_CNIVX8_P0_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX8_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX8_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX8_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX8_P4_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX8_P4_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX8_P4 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX8_P4_A_F_Z_R,`C12T28SOI_LR_CNIVX8_P4_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX8_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX8_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX8_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX8_P10_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX8_P10_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX8_P10 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX8_P10_A_F_Z_R,`C12T28SOI_LR_CNIVX8_P10_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX8_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX94_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX94_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX94_P0_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX94_P0_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX94_P0 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX94_P0_A_F_Z_R,`C12T28SOI_LR_CNIVX94_P0_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX94_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX94_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX94_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX94_P4_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX94_P4_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX94_P4 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX94_P4_A_F_Z_R,`C12T28SOI_LR_CNIVX94_P4_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX94_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNIVX94_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNIVX94_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNIVX94_P10_A_R_Z_F 0.1
`define C12T28SOI_LR_CNIVX94_P10_A_F_Z_R 0.1

module C12T28SOI_LR_CNIVX94_P10 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T28SOI_LR_CNIVX94_P10_A_F_Z_R,`C12T28SOI_LR_CNIVX94_P10_A_R_Z_F);


	endspecify

endmodule // C12T28SOI_LR_CNIVX94_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNMUX21X17_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNMUX21X17_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNMUX21X17_P0_D0_R_Z_R_00 0.1
`define C12T28SOI_LR_CNMUX21X17_P0_D0_F_Z_F_00 0.1
`define C12T28SOI_LR_CNMUX21X17_P0_D0_R_Z_R_10 0.1
`define C12T28SOI_LR_CNMUX21X17_P0_D0_F_Z_F_10 0.1
`define C12T28SOI_LR_CNMUX21X17_P0_D1_R_Z_R_01 0.1
`define C12T28SOI_LR_CNMUX21X17_P0_D1_F_Z_F_01 0.1
`define C12T28SOI_LR_CNMUX21X17_P0_D1_R_Z_R_11 0.1
`define C12T28SOI_LR_CNMUX21X17_P0_D1_F_Z_F_11 0.1
`define C12T28SOI_LR_CNMUX21X17_P0_S0_R_Z_F_10 0.1
`define C12T28SOI_LR_CNMUX21X17_P0_S0_F_Z_R_10 0.1
`define C12T28SOI_LR_CNMUX21X17_P0_S0_R_Z_R_01 0.1
`define C12T28SOI_LR_CNMUX21X17_P0_S0_F_Z_F_01 0.1

module C12T28SOI_LR_CNMUX21X17_P0 (Z, D0, D1, S0);

	output Z;
	input D0;
	input D1;
	input S0;

	C28SOI_SC_12_CLK_LR_U_MUX2  #1 U1 (Z, D0, D1, S0) ;



	specify

		if (!D1 && !S0) (D0 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P0_D0_R_Z_R_00,`C12T28SOI_LR_CNMUX21X17_P0_D0_F_Z_F_00);
		if (D1 && !S0) (D0 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P0_D0_R_Z_R_10,`C12T28SOI_LR_CNMUX21X17_P0_D0_F_Z_F_10);
		if (!D0 && S0) (D1 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P0_D1_R_Z_R_01,`C12T28SOI_LR_CNMUX21X17_P0_D1_F_Z_F_01);
		if (D0 && S0) (D1 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P0_D1_R_Z_R_11,`C12T28SOI_LR_CNMUX21X17_P0_D1_F_Z_F_11);
		if (D0 && !D1) (S0 -=> Z) = (`C12T28SOI_LR_CNMUX21X17_P0_S0_F_Z_R_10,`C12T28SOI_LR_CNMUX21X17_P0_S0_R_Z_F_10);
		if (!D0 && D1) (S0 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P0_S0_R_Z_R_01,`C12T28SOI_LR_CNMUX21X17_P0_S0_F_Z_F_01);


	endspecify

endmodule // C12T28SOI_LR_CNMUX21X17_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNMUX21X17_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNMUX21X17_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNMUX21X17_P4_D0_R_Z_R_00 0.1
`define C12T28SOI_LR_CNMUX21X17_P4_D0_F_Z_F_00 0.1
`define C12T28SOI_LR_CNMUX21X17_P4_D0_R_Z_R_10 0.1
`define C12T28SOI_LR_CNMUX21X17_P4_D0_F_Z_F_10 0.1
`define C12T28SOI_LR_CNMUX21X17_P4_D1_R_Z_R_01 0.1
`define C12T28SOI_LR_CNMUX21X17_P4_D1_F_Z_F_01 0.1
`define C12T28SOI_LR_CNMUX21X17_P4_D1_R_Z_R_11 0.1
`define C12T28SOI_LR_CNMUX21X17_P4_D1_F_Z_F_11 0.1
`define C12T28SOI_LR_CNMUX21X17_P4_S0_R_Z_F_10 0.1
`define C12T28SOI_LR_CNMUX21X17_P4_S0_F_Z_R_10 0.1
`define C12T28SOI_LR_CNMUX21X17_P4_S0_R_Z_R_01 0.1
`define C12T28SOI_LR_CNMUX21X17_P4_S0_F_Z_F_01 0.1

module C12T28SOI_LR_CNMUX21X17_P4 (Z, D0, D1, S0);

	output Z;
	input D0;
	input D1;
	input S0;

	C28SOI_SC_12_CLK_LR_U_MUX2  #1 U1 (Z, D0, D1, S0) ;



	specify

		if (!D1 && !S0) (D0 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P4_D0_R_Z_R_00,`C12T28SOI_LR_CNMUX21X17_P4_D0_F_Z_F_00);
		if (D1 && !S0) (D0 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P4_D0_R_Z_R_10,`C12T28SOI_LR_CNMUX21X17_P4_D0_F_Z_F_10);
		if (!D0 && S0) (D1 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P4_D1_R_Z_R_01,`C12T28SOI_LR_CNMUX21X17_P4_D1_F_Z_F_01);
		if (D0 && S0) (D1 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P4_D1_R_Z_R_11,`C12T28SOI_LR_CNMUX21X17_P4_D1_F_Z_F_11);
		if (D0 && !D1) (S0 -=> Z) = (`C12T28SOI_LR_CNMUX21X17_P4_S0_F_Z_R_10,`C12T28SOI_LR_CNMUX21X17_P4_S0_R_Z_F_10);
		if (!D0 && D1) (S0 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P4_S0_R_Z_R_01,`C12T28SOI_LR_CNMUX21X17_P4_S0_F_Z_F_01);


	endspecify

endmodule // C12T28SOI_LR_CNMUX21X17_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNMUX21X17_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNMUX21X17_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNMUX21X17_P10_D0_R_Z_R_00 0.1
`define C12T28SOI_LR_CNMUX21X17_P10_D0_F_Z_F_00 0.1
`define C12T28SOI_LR_CNMUX21X17_P10_D0_R_Z_R_10 0.1
`define C12T28SOI_LR_CNMUX21X17_P10_D0_F_Z_F_10 0.1
`define C12T28SOI_LR_CNMUX21X17_P10_D1_R_Z_R_01 0.1
`define C12T28SOI_LR_CNMUX21X17_P10_D1_F_Z_F_01 0.1
`define C12T28SOI_LR_CNMUX21X17_P10_D1_R_Z_R_11 0.1
`define C12T28SOI_LR_CNMUX21X17_P10_D1_F_Z_F_11 0.1
`define C12T28SOI_LR_CNMUX21X17_P10_S0_R_Z_F_10 0.1
`define C12T28SOI_LR_CNMUX21X17_P10_S0_F_Z_R_10 0.1
`define C12T28SOI_LR_CNMUX21X17_P10_S0_R_Z_R_01 0.1
`define C12T28SOI_LR_CNMUX21X17_P10_S0_F_Z_F_01 0.1

module C12T28SOI_LR_CNMUX21X17_P10 (Z, D0, D1, S0);

	output Z;
	input D0;
	input D1;
	input S0;

	C28SOI_SC_12_CLK_LR_U_MUX2  #1 U1 (Z, D0, D1, S0) ;



	specify

		if (!D1 && !S0) (D0 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P10_D0_R_Z_R_00,`C12T28SOI_LR_CNMUX21X17_P10_D0_F_Z_F_00);
		if (D1 && !S0) (D0 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P10_D0_R_Z_R_10,`C12T28SOI_LR_CNMUX21X17_P10_D0_F_Z_F_10);
		if (!D0 && S0) (D1 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P10_D1_R_Z_R_01,`C12T28SOI_LR_CNMUX21X17_P10_D1_F_Z_F_01);
		if (D0 && S0) (D1 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P10_D1_R_Z_R_11,`C12T28SOI_LR_CNMUX21X17_P10_D1_F_Z_F_11);
		if (D0 && !D1) (S0 -=> Z) = (`C12T28SOI_LR_CNMUX21X17_P10_S0_F_Z_R_10,`C12T28SOI_LR_CNMUX21X17_P10_S0_R_Z_F_10);
		if (!D0 && D1) (S0 +=> Z) = (`C12T28SOI_LR_CNMUX21X17_P10_S0_R_Z_R_01,`C12T28SOI_LR_CNMUX21X17_P10_S0_F_Z_F_01);


	endspecify

endmodule // C12T28SOI_LR_CNMUX21X17_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNMUX21X33_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNMUX21X33_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNMUX21X33_P0_D0_R_Z_R_00 0.1
`define C12T28SOI_LR_CNMUX21X33_P0_D0_F_Z_F_00 0.1
`define C12T28SOI_LR_CNMUX21X33_P0_D0_R_Z_R_10 0.1
`define C12T28SOI_LR_CNMUX21X33_P0_D0_F_Z_F_10 0.1
`define C12T28SOI_LR_CNMUX21X33_P0_D1_R_Z_R_01 0.1
`define C12T28SOI_LR_CNMUX21X33_P0_D1_F_Z_F_01 0.1
`define C12T28SOI_LR_CNMUX21X33_P0_D1_R_Z_R_11 0.1
`define C12T28SOI_LR_CNMUX21X33_P0_D1_F_Z_F_11 0.1
`define C12T28SOI_LR_CNMUX21X33_P0_S0_R_Z_F_10 0.1
`define C12T28SOI_LR_CNMUX21X33_P0_S0_F_Z_R_10 0.1
`define C12T28SOI_LR_CNMUX21X33_P0_S0_R_Z_R_01 0.1
`define C12T28SOI_LR_CNMUX21X33_P0_S0_F_Z_F_01 0.1

module C12T28SOI_LR_CNMUX21X33_P0 (Z, D0, D1, S0);

	output Z;
	input D0;
	input D1;
	input S0;

	C28SOI_SC_12_CLK_LR_U_MUX2  #1 U1 (Z, D0, D1, S0) ;



	specify

		if (!D1 && !S0) (D0 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P0_D0_R_Z_R_00,`C12T28SOI_LR_CNMUX21X33_P0_D0_F_Z_F_00);
		if (D1 && !S0) (D0 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P0_D0_R_Z_R_10,`C12T28SOI_LR_CNMUX21X33_P0_D0_F_Z_F_10);
		if (!D0 && S0) (D1 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P0_D1_R_Z_R_01,`C12T28SOI_LR_CNMUX21X33_P0_D1_F_Z_F_01);
		if (D0 && S0) (D1 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P0_D1_R_Z_R_11,`C12T28SOI_LR_CNMUX21X33_P0_D1_F_Z_F_11);
		if (D0 && !D1) (S0 -=> Z) = (`C12T28SOI_LR_CNMUX21X33_P0_S0_F_Z_R_10,`C12T28SOI_LR_CNMUX21X33_P0_S0_R_Z_F_10);
		if (!D0 && D1) (S0 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P0_S0_R_Z_R_01,`C12T28SOI_LR_CNMUX21X33_P0_S0_F_Z_F_01);


	endspecify

endmodule // C12T28SOI_LR_CNMUX21X33_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNMUX21X33_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNMUX21X33_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNMUX21X33_P4_D0_R_Z_R_00 0.1
`define C12T28SOI_LR_CNMUX21X33_P4_D0_F_Z_F_00 0.1
`define C12T28SOI_LR_CNMUX21X33_P4_D0_R_Z_R_10 0.1
`define C12T28SOI_LR_CNMUX21X33_P4_D0_F_Z_F_10 0.1
`define C12T28SOI_LR_CNMUX21X33_P4_D1_R_Z_R_01 0.1
`define C12T28SOI_LR_CNMUX21X33_P4_D1_F_Z_F_01 0.1
`define C12T28SOI_LR_CNMUX21X33_P4_D1_R_Z_R_11 0.1
`define C12T28SOI_LR_CNMUX21X33_P4_D1_F_Z_F_11 0.1
`define C12T28SOI_LR_CNMUX21X33_P4_S0_R_Z_F_10 0.1
`define C12T28SOI_LR_CNMUX21X33_P4_S0_F_Z_R_10 0.1
`define C12T28SOI_LR_CNMUX21X33_P4_S0_R_Z_R_01 0.1
`define C12T28SOI_LR_CNMUX21X33_P4_S0_F_Z_F_01 0.1

module C12T28SOI_LR_CNMUX21X33_P4 (Z, D0, D1, S0);

	output Z;
	input D0;
	input D1;
	input S0;

	C28SOI_SC_12_CLK_LR_U_MUX2  #1 U1 (Z, D0, D1, S0) ;



	specify

		if (!D1 && !S0) (D0 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P4_D0_R_Z_R_00,`C12T28SOI_LR_CNMUX21X33_P4_D0_F_Z_F_00);
		if (D1 && !S0) (D0 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P4_D0_R_Z_R_10,`C12T28SOI_LR_CNMUX21X33_P4_D0_F_Z_F_10);
		if (!D0 && S0) (D1 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P4_D1_R_Z_R_01,`C12T28SOI_LR_CNMUX21X33_P4_D1_F_Z_F_01);
		if (D0 && S0) (D1 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P4_D1_R_Z_R_11,`C12T28SOI_LR_CNMUX21X33_P4_D1_F_Z_F_11);
		if (D0 && !D1) (S0 -=> Z) = (`C12T28SOI_LR_CNMUX21X33_P4_S0_F_Z_R_10,`C12T28SOI_LR_CNMUX21X33_P4_S0_R_Z_F_10);
		if (!D0 && D1) (S0 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P4_S0_R_Z_R_01,`C12T28SOI_LR_CNMUX21X33_P4_S0_F_Z_F_01);


	endspecify

endmodule // C12T28SOI_LR_CNMUX21X33_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNMUX21X33_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNMUX21X33_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNMUX21X33_P10_D0_R_Z_R_00 0.1
`define C12T28SOI_LR_CNMUX21X33_P10_D0_F_Z_F_00 0.1
`define C12T28SOI_LR_CNMUX21X33_P10_D0_R_Z_R_10 0.1
`define C12T28SOI_LR_CNMUX21X33_P10_D0_F_Z_F_10 0.1
`define C12T28SOI_LR_CNMUX21X33_P10_D1_R_Z_R_01 0.1
`define C12T28SOI_LR_CNMUX21X33_P10_D1_F_Z_F_01 0.1
`define C12T28SOI_LR_CNMUX21X33_P10_D1_R_Z_R_11 0.1
`define C12T28SOI_LR_CNMUX21X33_P10_D1_F_Z_F_11 0.1
`define C12T28SOI_LR_CNMUX21X33_P10_S0_R_Z_F_10 0.1
`define C12T28SOI_LR_CNMUX21X33_P10_S0_F_Z_R_10 0.1
`define C12T28SOI_LR_CNMUX21X33_P10_S0_R_Z_R_01 0.1
`define C12T28SOI_LR_CNMUX21X33_P10_S0_F_Z_F_01 0.1

module C12T28SOI_LR_CNMUX21X33_P10 (Z, D0, D1, S0);

	output Z;
	input D0;
	input D1;
	input S0;

	C28SOI_SC_12_CLK_LR_U_MUX2  #1 U1 (Z, D0, D1, S0) ;



	specify

		if (!D1 && !S0) (D0 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P10_D0_R_Z_R_00,`C12T28SOI_LR_CNMUX21X33_P10_D0_F_Z_F_00);
		if (D1 && !S0) (D0 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P10_D0_R_Z_R_10,`C12T28SOI_LR_CNMUX21X33_P10_D0_F_Z_F_10);
		if (!D0 && S0) (D1 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P10_D1_R_Z_R_01,`C12T28SOI_LR_CNMUX21X33_P10_D1_F_Z_F_01);
		if (D0 && S0) (D1 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P10_D1_R_Z_R_11,`C12T28SOI_LR_CNMUX21X33_P10_D1_F_Z_F_11);
		if (D0 && !D1) (S0 -=> Z) = (`C12T28SOI_LR_CNMUX21X33_P10_S0_F_Z_R_10,`C12T28SOI_LR_CNMUX21X33_P10_S0_R_Z_F_10);
		if (!D0 && D1) (S0 +=> Z) = (`C12T28SOI_LR_CNMUX21X33_P10_S0_R_Z_R_01,`C12T28SOI_LR_CNMUX21X33_P10_S0_F_Z_F_01);


	endspecify

endmodule // C12T28SOI_LR_CNMUX21X33_P10


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_CNMUX41X17_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_CNMUX41X17_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_00000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_00000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_11100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_11100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_00010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_00010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_11110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_11110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_00001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_00001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_10001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_10001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_11111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_11111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_01111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_01111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_00111 0.1

module C12T28SOIDV_LR_CNMUX41X17_P0 (Z, D0, D1, D2, D3, S0, S1);

	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;

	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_12_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_12_CLK_LR_U_MUX2  #1 U3 (Z, INTERNAL1, INTERNAL2, S1) ;



	specify

		if (!D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_00000,`C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_00000);
		if (D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_10100,`C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_10100);
		if (D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_11000,`C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_11000);
		if (D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_11100,`C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_11100);
		if (D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_10000);
		if (!D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_00100,`C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_00100);
		if (!D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_01000,`C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_01000);
		if (!D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D0_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X17_P0_D0_F_Z_F_01100);
		if (!D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_00010,`C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_00010);
		if (D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_10110,`C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_10110);
		if (D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_11010,`C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_11010);
		if (D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_11110,`C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_11110);
		if (D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_10010);
		if (!D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_00110,`C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_00110);
		if (!D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_01010,`C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_01010);
		if (!D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D1_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X17_P0_D1_F_Z_F_01110);
		if (!D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_00001,`C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_00001);
		if (D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_10101,`C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_10101);
		if (D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_11001,`C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_11001);
		if (D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_11101);
		if (D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_10001,`C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_10001);
		if (!D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_00101,`C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_00101);
		if (!D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_01001,`C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_01001);
		if (!D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D2_R_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X17_P0_D2_F_Z_F_01101);
		if (!D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_00011);
		if (D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_10111,`C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_10111);
		if (D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_11011,`C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_11011);
		if (D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_11111,`C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_11111);
		if (D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_10011);
		if (!D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_00111,`C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_00111);
		if (!D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_01011,`C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_01011);
		if (!D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_D3_R_Z_R_01111,`C12T28SOIDV_LR_CNMUX41X17_P0_D3_F_Z_F_01111);
		if (!D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_00101,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_00101);
		if (D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_10101,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_10101);
		if (D0 && !D1 && D2 && D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_10110,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_10110);
		if (D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_11101);
		if (D0 && !D1 && D2 && !D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_10100,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_10100);
		if (!D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_01101);
		if (D0 && !D1 && !D2 && !D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_10000);
		if (D0 && !D1 && !D2 && D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_F_10010);
		if (!D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_00011);
		if (!D0 && D1 && D2 && D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_01110);
		if (D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_10011);
		if (D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_11011,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_11011);
		if (!D0 && D1 && D2 && !D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_01100);
		if (!D0 && D1 && !D2 && !D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_01000,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_01000);
		if (!D0 && D1 && !D2 && D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_01010,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_01010);
		if (!D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S0_R_Z_R_01011,`C12T28SOIDV_LR_CNMUX41X17_P0_S0_F_Z_F_01011);
		if (!D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_01001,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_01001);
		if (D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_11001,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_11001);
		if (D0 && D1 && !D2 && D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_11010,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_11010);
		if (D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_11101);
		if (D0 && D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_11000,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_11000);
		if (!D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_01101);
		if (D0 && !D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_10000);
		if (D0 && !D1 && !D2 && D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_F_10010);
		if (!D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_00011);
		if (!D0 && D1 && D2 && D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_01110);
		if (D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_10011);
		if (D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_10111,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_10111);
		if (!D0 && D1 && D2 && !D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_01100);
		if (!D0 && !D1 && D2 && !D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_00100,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_00100);
		if (!D0 && !D1 && D2 && D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_00110,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_00110);
		if (!D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P0_S1_R_Z_R_00111,`C12T28SOIDV_LR_CNMUX41X17_P0_S1_F_Z_F_00111);


	endspecify

endmodule // C12T28SOIDV_LR_CNMUX41X17_P0


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_CNMUX41X17_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_CNMUX41X17_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_00000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_00000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_11100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_11100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_00010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_00010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_11110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_11110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_00001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_00001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_10001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_10001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_11111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_11111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_01111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_01111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_00111 0.1

module C12T28SOIDV_LR_CNMUX41X17_P4 (Z, D0, D1, D2, D3, S0, S1);

	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;

	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_12_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_12_CLK_LR_U_MUX2  #1 U3 (Z, INTERNAL1, INTERNAL2, S1) ;



	specify

		if (!D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_00000,`C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_00000);
		if (D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_10100,`C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_10100);
		if (D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_11000,`C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_11000);
		if (D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_11100,`C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_11100);
		if (D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_10000);
		if (!D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_00100,`C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_00100);
		if (!D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_01000,`C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_01000);
		if (!D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D0_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X17_P4_D0_F_Z_F_01100);
		if (!D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_00010,`C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_00010);
		if (D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_10110,`C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_10110);
		if (D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_11010,`C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_11010);
		if (D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_11110,`C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_11110);
		if (D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_10010);
		if (!D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_00110,`C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_00110);
		if (!D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_01010,`C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_01010);
		if (!D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D1_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X17_P4_D1_F_Z_F_01110);
		if (!D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_00001,`C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_00001);
		if (D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_10101,`C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_10101);
		if (D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_11001,`C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_11001);
		if (D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_11101);
		if (D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_10001,`C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_10001);
		if (!D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_00101,`C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_00101);
		if (!D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_01001,`C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_01001);
		if (!D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D2_R_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X17_P4_D2_F_Z_F_01101);
		if (!D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_00011);
		if (D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_10111,`C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_10111);
		if (D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_11011,`C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_11011);
		if (D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_11111,`C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_11111);
		if (D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_10011);
		if (!D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_00111,`C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_00111);
		if (!D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_01011,`C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_01011);
		if (!D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_D3_R_Z_R_01111,`C12T28SOIDV_LR_CNMUX41X17_P4_D3_F_Z_F_01111);
		if (!D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_00101,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_00101);
		if (D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_10101,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_10101);
		if (D0 && !D1 && D2 && D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_10110,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_10110);
		if (D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_11101);
		if (D0 && !D1 && D2 && !D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_10100,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_10100);
		if (!D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_01101);
		if (D0 && !D1 && !D2 && !D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_10000);
		if (D0 && !D1 && !D2 && D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_F_10010);
		if (!D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_00011);
		if (!D0 && D1 && D2 && D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_01110);
		if (D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_10011);
		if (D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_11011,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_11011);
		if (!D0 && D1 && D2 && !D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_01100);
		if (!D0 && D1 && !D2 && !D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_01000,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_01000);
		if (!D0 && D1 && !D2 && D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_01010,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_01010);
		if (!D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S0_R_Z_R_01011,`C12T28SOIDV_LR_CNMUX41X17_P4_S0_F_Z_F_01011);
		if (!D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_01001,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_01001);
		if (D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_11001,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_11001);
		if (D0 && D1 && !D2 && D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_11010,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_11010);
		if (D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_11101);
		if (D0 && D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_11000,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_11000);
		if (!D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_01101);
		if (D0 && !D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_10000);
		if (D0 && !D1 && !D2 && D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_F_10010);
		if (!D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_00011);
		if (!D0 && D1 && D2 && D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_01110);
		if (D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_10011);
		if (D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_10111,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_10111);
		if (!D0 && D1 && D2 && !D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_01100);
		if (!D0 && !D1 && D2 && !D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_00100,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_00100);
		if (!D0 && !D1 && D2 && D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_00110,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_00110);
		if (!D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P4_S1_R_Z_R_00111,`C12T28SOIDV_LR_CNMUX41X17_P4_S1_F_Z_F_00111);


	endspecify

endmodule // C12T28SOIDV_LR_CNMUX41X17_P4


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_CNMUX41X17_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_CNMUX41X17_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_00000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_00000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_11100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_11100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_00010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_00010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_11110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_11110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_00001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_00001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_10001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_10001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_11111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_11111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_01111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_01111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_00111 0.1

module C12T28SOIDV_LR_CNMUX41X17_P10 (Z, D0, D1, D2, D3, S0, S1);

	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;

	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_12_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_12_CLK_LR_U_MUX2  #1 U3 (Z, INTERNAL1, INTERNAL2, S1) ;



	specify

		if (!D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_00000,`C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_00000);
		if (D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_10100,`C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_10100);
		if (D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_11000,`C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_11000);
		if (D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_11100,`C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_11100);
		if (D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_10000);
		if (!D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_00100,`C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_00100);
		if (!D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_01000,`C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_01000);
		if (!D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D0_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X17_P10_D0_F_Z_F_01100);
		if (!D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_00010,`C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_00010);
		if (D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_10110,`C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_10110);
		if (D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_11010,`C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_11010);
		if (D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_11110,`C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_11110);
		if (D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_10010);
		if (!D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_00110,`C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_00110);
		if (!D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_01010,`C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_01010);
		if (!D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D1_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X17_P10_D1_F_Z_F_01110);
		if (!D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_00001,`C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_00001);
		if (D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_10101,`C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_10101);
		if (D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_11001,`C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_11001);
		if (D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_11101);
		if (D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_10001,`C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_10001);
		if (!D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_00101,`C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_00101);
		if (!D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_01001,`C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_01001);
		if (!D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D2_R_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X17_P10_D2_F_Z_F_01101);
		if (!D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_00011);
		if (D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_10111,`C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_10111);
		if (D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_11011,`C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_11011);
		if (D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_11111,`C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_11111);
		if (D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_10011);
		if (!D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_00111,`C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_00111);
		if (!D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_01011,`C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_01011);
		if (!D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_D3_R_Z_R_01111,`C12T28SOIDV_LR_CNMUX41X17_P10_D3_F_Z_F_01111);
		if (!D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_00101,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_00101);
		if (D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_10101,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_10101);
		if (D0 && !D1 && D2 && D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_10110,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_10110);
		if (D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_11101);
		if (D0 && !D1 && D2 && !D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_10100,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_10100);
		if (!D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_01101);
		if (D0 && !D1 && !D2 && !D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_10000);
		if (D0 && !D1 && !D2 && D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_F_10010);
		if (!D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_00011);
		if (!D0 && D1 && D2 && D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_01110);
		if (D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_10011);
		if (D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_11011,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_11011);
		if (!D0 && D1 && D2 && !D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_01100);
		if (!D0 && D1 && !D2 && !D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_01000,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_01000);
		if (!D0 && D1 && !D2 && D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_01010,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_01010);
		if (!D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S0_R_Z_R_01011,`C12T28SOIDV_LR_CNMUX41X17_P10_S0_F_Z_F_01011);
		if (!D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_01001,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_01001);
		if (D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_11001,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_11001);
		if (D0 && D1 && !D2 && D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_11010,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_11010);
		if (D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_11101);
		if (D0 && D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_11000,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_11000);
		if (!D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_01101);
		if (D0 && !D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_10000);
		if (D0 && !D1 && !D2 && D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_F_10010);
		if (!D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_00011);
		if (!D0 && D1 && D2 && D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_01110);
		if (D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_10011);
		if (D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_10111,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_10111);
		if (!D0 && D1 && D2 && !D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_01100);
		if (!D0 && !D1 && D2 && !D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_00100,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_00100);
		if (!D0 && !D1 && D2 && D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_00110,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_00110);
		if (!D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X17_P10_S1_R_Z_R_00111,`C12T28SOIDV_LR_CNMUX41X17_P10_S1_F_Z_F_00111);


	endspecify

endmodule // C12T28SOIDV_LR_CNMUX41X17_P10


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_CNMUX41X27_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_CNMUX41X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_00000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_00000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_11100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_11100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_00010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_00010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_11110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_11110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_00001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_00001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_10001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_10001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_11111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_11111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_01111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_01111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_00111 0.1

module C12T28SOIDV_LR_CNMUX41X27_P0 (Z, D0, D1, D2, D3, S0, S1);

	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;

	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_12_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_12_CLK_LR_U_MUX2  #1 U3 (Z, INTERNAL1, INTERNAL2, S1) ;



	specify

		if (!D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_00000,`C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_00000);
		if (D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_10100,`C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_10100);
		if (D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_11000,`C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_11000);
		if (D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_11100,`C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_11100);
		if (D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_10000);
		if (!D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_00100,`C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_00100);
		if (!D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_01000,`C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_01000);
		if (!D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D0_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X27_P0_D0_F_Z_F_01100);
		if (!D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_00010,`C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_00010);
		if (D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_10110,`C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_10110);
		if (D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_11010,`C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_11010);
		if (D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_11110,`C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_11110);
		if (D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_10010);
		if (!D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_00110,`C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_00110);
		if (!D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_01010,`C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_01010);
		if (!D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D1_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X27_P0_D1_F_Z_F_01110);
		if (!D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_00001,`C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_00001);
		if (D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_10101,`C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_10101);
		if (D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_11001,`C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_11001);
		if (D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_11101);
		if (D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_10001,`C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_10001);
		if (!D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_00101,`C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_00101);
		if (!D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_01001,`C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_01001);
		if (!D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D2_R_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X27_P0_D2_F_Z_F_01101);
		if (!D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_00011);
		if (D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_10111,`C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_10111);
		if (D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_11011,`C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_11011);
		if (D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_11111,`C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_11111);
		if (D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_10011);
		if (!D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_00111,`C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_00111);
		if (!D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_01011,`C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_01011);
		if (!D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_D3_R_Z_R_01111,`C12T28SOIDV_LR_CNMUX41X27_P0_D3_F_Z_F_01111);
		if (!D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_00101,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_00101);
		if (D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_10101,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_10101);
		if (D0 && !D1 && D2 && D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_10110,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_10110);
		if (D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_11101);
		if (D0 && !D1 && D2 && !D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_10100,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_10100);
		if (!D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_01101);
		if (D0 && !D1 && !D2 && !D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_10000);
		if (D0 && !D1 && !D2 && D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_F_10010);
		if (!D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_00011);
		if (!D0 && D1 && D2 && D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_01110);
		if (D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_10011);
		if (D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_11011,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_11011);
		if (!D0 && D1 && D2 && !D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_01100);
		if (!D0 && D1 && !D2 && !D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_01000,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_01000);
		if (!D0 && D1 && !D2 && D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_01010,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_01010);
		if (!D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S0_R_Z_R_01011,`C12T28SOIDV_LR_CNMUX41X27_P0_S0_F_Z_F_01011);
		if (!D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_01001,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_01001);
		if (D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_11001,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_11001);
		if (D0 && D1 && !D2 && D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_11010,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_11010);
		if (D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_11101);
		if (D0 && D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_11000,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_11000);
		if (!D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_01101);
		if (D0 && !D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_10000);
		if (D0 && !D1 && !D2 && D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_F_10010);
		if (!D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_00011);
		if (!D0 && D1 && D2 && D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_01110);
		if (D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_10011);
		if (D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_10111,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_10111);
		if (!D0 && D1 && D2 && !D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_01100);
		if (!D0 && !D1 && D2 && !D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_00100,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_00100);
		if (!D0 && !D1 && D2 && D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_00110,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_00110);
		if (!D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P0_S1_R_Z_R_00111,`C12T28SOIDV_LR_CNMUX41X27_P0_S1_F_Z_F_00111);


	endspecify

endmodule // C12T28SOIDV_LR_CNMUX41X27_P0


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_CNMUX41X27_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_CNMUX41X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_00000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_00000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_11100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_11100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_00010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_00010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_11110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_11110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_00001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_00001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_10001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_10001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_11111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_11111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_01111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_01111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_00111 0.1

module C12T28SOIDV_LR_CNMUX41X27_P4 (Z, D0, D1, D2, D3, S0, S1);

	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;

	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_12_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_12_CLK_LR_U_MUX2  #1 U3 (Z, INTERNAL1, INTERNAL2, S1) ;



	specify

		if (!D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_00000,`C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_00000);
		if (D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_10100,`C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_10100);
		if (D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_11000,`C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_11000);
		if (D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_11100,`C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_11100);
		if (D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_10000);
		if (!D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_00100,`C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_00100);
		if (!D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_01000,`C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_01000);
		if (!D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D0_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X27_P4_D0_F_Z_F_01100);
		if (!D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_00010,`C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_00010);
		if (D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_10110,`C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_10110);
		if (D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_11010,`C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_11010);
		if (D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_11110,`C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_11110);
		if (D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_10010);
		if (!D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_00110,`C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_00110);
		if (!D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_01010,`C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_01010);
		if (!D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D1_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X27_P4_D1_F_Z_F_01110);
		if (!D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_00001,`C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_00001);
		if (D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_10101,`C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_10101);
		if (D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_11001,`C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_11001);
		if (D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_11101);
		if (D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_10001,`C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_10001);
		if (!D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_00101,`C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_00101);
		if (!D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_01001,`C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_01001);
		if (!D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D2_R_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X27_P4_D2_F_Z_F_01101);
		if (!D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_00011);
		if (D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_10111,`C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_10111);
		if (D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_11011,`C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_11011);
		if (D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_11111,`C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_11111);
		if (D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_10011);
		if (!D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_00111,`C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_00111);
		if (!D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_01011,`C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_01011);
		if (!D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_D3_R_Z_R_01111,`C12T28SOIDV_LR_CNMUX41X27_P4_D3_F_Z_F_01111);
		if (!D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_00101,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_00101);
		if (D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_10101,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_10101);
		if (D0 && !D1 && D2 && D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_10110,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_10110);
		if (D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_11101);
		if (D0 && !D1 && D2 && !D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_10100,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_10100);
		if (!D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_01101);
		if (D0 && !D1 && !D2 && !D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_10000);
		if (D0 && !D1 && !D2 && D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_F_10010);
		if (!D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_00011);
		if (!D0 && D1 && D2 && D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_01110);
		if (D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_10011);
		if (D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_11011,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_11011);
		if (!D0 && D1 && D2 && !D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_01100);
		if (!D0 && D1 && !D2 && !D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_01000,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_01000);
		if (!D0 && D1 && !D2 && D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_01010,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_01010);
		if (!D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S0_R_Z_R_01011,`C12T28SOIDV_LR_CNMUX41X27_P4_S0_F_Z_F_01011);
		if (!D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_01001,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_01001);
		if (D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_11001,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_11001);
		if (D0 && D1 && !D2 && D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_11010,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_11010);
		if (D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_11101);
		if (D0 && D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_11000,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_11000);
		if (!D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_01101);
		if (D0 && !D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_10000);
		if (D0 && !D1 && !D2 && D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_F_10010);
		if (!D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_00011);
		if (!D0 && D1 && D2 && D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_01110);
		if (D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_10011);
		if (D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_10111,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_10111);
		if (!D0 && D1 && D2 && !D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_01100);
		if (!D0 && !D1 && D2 && !D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_00100,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_00100);
		if (!D0 && !D1 && D2 && D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_00110,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_00110);
		if (!D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P4_S1_R_Z_R_00111,`C12T28SOIDV_LR_CNMUX41X27_P4_S1_F_Z_F_00111);


	endspecify

endmodule // C12T28SOIDV_LR_CNMUX41X27_P4


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_CNMUX41X27_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_CNMUX41X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_00000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_00000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_11100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_11100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_00010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_00010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_11110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_11110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_00001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_00001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_10001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_10001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_11111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_11111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_01111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_01111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_00101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_10101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_10110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_10100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_11011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_01000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_01010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_01011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_01001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_11001 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_11010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_11101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_11000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_01101 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_10000 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_10010 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_00011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_01110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_10011 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_10111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_01100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_00100 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_00110 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_00111 0.1
`define C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_00111 0.1

module C12T28SOIDV_LR_CNMUX41X27_P10 (Z, D0, D1, D2, D3, S0, S1);

	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;

	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_12_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_12_CLK_LR_U_MUX2  #1 U3 (Z, INTERNAL1, INTERNAL2, S1) ;



	specify

		if (!D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_00000,`C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_00000);
		if (D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_10100,`C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_10100);
		if (D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_11000,`C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_11000);
		if (D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_11100,`C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_11100);
		if (D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_10000);
		if (!D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_00100,`C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_00100);
		if (!D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_01000,`C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_01000);
		if (!D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D0_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X27_P10_D0_F_Z_F_01100);
		if (!D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_00010,`C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_00010);
		if (D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_10110,`C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_10110);
		if (D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_11010,`C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_11010);
		if (D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_11110,`C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_11110);
		if (D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_10010);
		if (!D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_00110,`C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_00110);
		if (!D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_01010,`C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_01010);
		if (!D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D1_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X27_P10_D1_F_Z_F_01110);
		if (!D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_00001,`C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_00001);
		if (D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_10101,`C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_10101);
		if (D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_11001,`C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_11001);
		if (D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_11101);
		if (D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_10001,`C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_10001);
		if (!D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_00101,`C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_00101);
		if (!D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_01001,`C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_01001);
		if (!D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D2_R_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X27_P10_D2_F_Z_F_01101);
		if (!D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_00011);
		if (D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_10111,`C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_10111);
		if (D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_11011,`C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_11011);
		if (D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_11111,`C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_11111);
		if (D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_10011);
		if (!D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_00111,`C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_00111);
		if (!D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_01011,`C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_01011);
		if (!D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_D3_R_Z_R_01111,`C12T28SOIDV_LR_CNMUX41X27_P10_D3_F_Z_F_01111);
		if (!D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_00101,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_00101);
		if (D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_10101,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_10101);
		if (D0 && !D1 && D2 && D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_10110,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_10110);
		if (D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_11101);
		if (D0 && !D1 && D2 && !D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_10100,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_10100);
		if (!D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_01101);
		if (D0 && !D1 && !D2 && !D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_10000);
		if (D0 && !D1 && !D2 && D3 && !S1) (S0 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_F_10010);
		if (!D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_00011);
		if (!D0 && D1 && D2 && D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_01110);
		if (D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_10011);
		if (D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_11011,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_11011);
		if (!D0 && D1 && D2 && !D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_01100);
		if (!D0 && D1 && !D2 && !D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_01000,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_01000);
		if (!D0 && D1 && !D2 && D3 && !S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_01010,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_01010);
		if (!D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S0_R_Z_R_01011,`C12T28SOIDV_LR_CNMUX41X27_P10_S0_F_Z_F_01011);
		if (!D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_01001,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_01001);
		if (D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_11001,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_11001);
		if (D0 && D1 && !D2 && D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_11010,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_11010);
		if (D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_11101,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_11101);
		if (D0 && D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_11000,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_11000);
		if (!D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_01101,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_01101);
		if (D0 && !D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_10000,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_10000);
		if (D0 && !D1 && !D2 && D3 && !S0) (S1 -=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_R_10010,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_F_10010);
		if (!D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_00011,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_00011);
		if (!D0 && D1 && D2 && D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_01110,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_01110);
		if (D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_10011,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_10011);
		if (D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_10111,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_10111);
		if (!D0 && D1 && D2 && !D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_01100,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_01100);
		if (!D0 && !D1 && D2 && !D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_00100,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_00100);
		if (!D0 && !D1 && D2 && D3 && !S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_00110,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_00110);
		if (!D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (`C12T28SOIDV_LR_CNMUX41X27_P10_S1_R_Z_R_00111,`C12T28SOIDV_LR_CNMUX41X27_P10_S1_F_Z_F_00111);


	endspecify

endmodule // C12T28SOIDV_LR_CNMUX41X27_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNAND2AX17_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNAND2AX17_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNAND2AX17_P0_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNNAND2AX17_P0_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2AX17_P0_B_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNAND2AX17_P0_B_F_Z_R_0 0.1

module C12T28SOI_LR_CNNAND2AX17_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	not    U1 (INTERNAL1, B) ;
	or   #1 U2 (Z, A, INTERNAL1) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNNAND2AX17_P0_A_R_Z_R_1,`C12T28SOI_LR_CNNAND2AX17_P0_A_F_Z_F_1);
		if (!A) (B -=> Z) = (`C12T28SOI_LR_CNNAND2AX17_P0_B_F_Z_R_0,`C12T28SOI_LR_CNNAND2AX17_P0_B_R_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNNAND2AX17_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNAND2AX17_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNAND2AX17_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNAND2AX17_P4_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNNAND2AX17_P4_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2AX17_P4_B_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNAND2AX17_P4_B_F_Z_R_0 0.1

module C12T28SOI_LR_CNNAND2AX17_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	not    U1 (INTERNAL1, B) ;
	or   #1 U2 (Z, A, INTERNAL1) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNNAND2AX17_P4_A_R_Z_R_1,`C12T28SOI_LR_CNNAND2AX17_P4_A_F_Z_F_1);
		if (!A) (B -=> Z) = (`C12T28SOI_LR_CNNAND2AX17_P4_B_F_Z_R_0,`C12T28SOI_LR_CNNAND2AX17_P4_B_R_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNNAND2AX17_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNAND2AX17_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNAND2AX17_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNAND2AX17_P10_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNNAND2AX17_P10_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2AX17_P10_B_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNAND2AX17_P10_B_F_Z_R_0 0.1

module C12T28SOI_LR_CNNAND2AX17_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	not    U1 (INTERNAL1, B) ;
	or   #1 U2 (Z, A, INTERNAL1) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNNAND2AX17_P10_A_R_Z_R_1,`C12T28SOI_LR_CNNAND2AX17_P10_A_F_Z_F_1);
		if (!A) (B -=> Z) = (`C12T28SOI_LR_CNNAND2AX17_P10_B_F_Z_R_0,`C12T28SOI_LR_CNNAND2AX17_P10_B_R_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNNAND2AX17_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNAND2AX27_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNAND2AX27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNAND2AX27_P0_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNNAND2AX27_P0_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2AX27_P0_B_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNAND2AX27_P0_B_F_Z_R_0 0.1

module C12T28SOI_LR_CNNAND2AX27_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	not    U1 (INTERNAL1, B) ;
	or   #1 U2 (Z, A, INTERNAL1) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNNAND2AX27_P0_A_R_Z_R_1,`C12T28SOI_LR_CNNAND2AX27_P0_A_F_Z_F_1);
		if (!A) (B -=> Z) = (`C12T28SOI_LR_CNNAND2AX27_P0_B_F_Z_R_0,`C12T28SOI_LR_CNNAND2AX27_P0_B_R_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNNAND2AX27_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNAND2AX27_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNAND2AX27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNAND2AX27_P4_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNNAND2AX27_P4_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2AX27_P4_B_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNAND2AX27_P4_B_F_Z_R_0 0.1

module C12T28SOI_LR_CNNAND2AX27_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	not    U1 (INTERNAL1, B) ;
	or   #1 U2 (Z, A, INTERNAL1) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNNAND2AX27_P4_A_R_Z_R_1,`C12T28SOI_LR_CNNAND2AX27_P4_A_F_Z_F_1);
		if (!A) (B -=> Z) = (`C12T28SOI_LR_CNNAND2AX27_P4_B_F_Z_R_0,`C12T28SOI_LR_CNNAND2AX27_P4_B_R_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNNAND2AX27_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNAND2AX27_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNAND2AX27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNAND2AX27_P10_A_R_Z_R_1 0.1
`define C12T28SOI_LR_CNNAND2AX27_P10_A_F_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2AX27_P10_B_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNAND2AX27_P10_B_F_Z_R_0 0.1

module C12T28SOI_LR_CNNAND2AX27_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	not    U1 (INTERNAL1, B) ;
	or   #1 U2 (Z, A, INTERNAL1) ;



	specify

		if (B) (A +=> Z) = (`C12T28SOI_LR_CNNAND2AX27_P10_A_R_Z_R_1,`C12T28SOI_LR_CNNAND2AX27_P10_A_F_Z_F_1);
		if (!A) (B -=> Z) = (`C12T28SOI_LR_CNNAND2AX27_P10_B_F_Z_R_0,`C12T28SOI_LR_CNNAND2AX27_P10_B_R_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNNAND2AX27_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNAND2X15_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNAND2X15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNAND2X15_P0_A_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2X15_P0_A_F_Z_R_1 0.1
`define C12T28SOI_LR_CNNAND2X15_P0_B_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2X15_P0_B_F_Z_R_1 0.1

module C12T28SOI_LR_CNNAND2X15_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	and    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B) (A -=> Z) = (`C12T28SOI_LR_CNNAND2X15_P0_A_F_Z_R_1,`C12T28SOI_LR_CNNAND2X15_P0_A_R_Z_F_1);
		if (A) (B -=> Z) = (`C12T28SOI_LR_CNNAND2X15_P0_B_F_Z_R_1,`C12T28SOI_LR_CNNAND2X15_P0_B_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNNAND2X15_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNAND2X15_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNAND2X15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNAND2X15_P4_A_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2X15_P4_A_F_Z_R_1 0.1
`define C12T28SOI_LR_CNNAND2X15_P4_B_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2X15_P4_B_F_Z_R_1 0.1

module C12T28SOI_LR_CNNAND2X15_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	and    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B) (A -=> Z) = (`C12T28SOI_LR_CNNAND2X15_P4_A_F_Z_R_1,`C12T28SOI_LR_CNNAND2X15_P4_A_R_Z_F_1);
		if (A) (B -=> Z) = (`C12T28SOI_LR_CNNAND2X15_P4_B_F_Z_R_1,`C12T28SOI_LR_CNNAND2X15_P4_B_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNNAND2X15_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNAND2X15_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNAND2X15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNAND2X15_P10_A_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2X15_P10_A_F_Z_R_1 0.1
`define C12T28SOI_LR_CNNAND2X15_P10_B_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2X15_P10_B_F_Z_R_1 0.1

module C12T28SOI_LR_CNNAND2X15_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	and    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B) (A -=> Z) = (`C12T28SOI_LR_CNNAND2X15_P10_A_F_Z_R_1,`C12T28SOI_LR_CNNAND2X15_P10_A_R_Z_F_1);
		if (A) (B -=> Z) = (`C12T28SOI_LR_CNNAND2X15_P10_B_F_Z_R_1,`C12T28SOI_LR_CNNAND2X15_P10_B_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNNAND2X15_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNAND2X33_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNAND2X33_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNAND2X33_P0_A_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2X33_P0_A_F_Z_R_1 0.1
`define C12T28SOI_LR_CNNAND2X33_P0_B_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2X33_P0_B_F_Z_R_1 0.1

module C12T28SOI_LR_CNNAND2X33_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	and    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B) (A -=> Z) = (`C12T28SOI_LR_CNNAND2X33_P0_A_F_Z_R_1,`C12T28SOI_LR_CNNAND2X33_P0_A_R_Z_F_1);
		if (A) (B -=> Z) = (`C12T28SOI_LR_CNNAND2X33_P0_B_F_Z_R_1,`C12T28SOI_LR_CNNAND2X33_P0_B_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNNAND2X33_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNAND2X33_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNAND2X33_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNAND2X33_P4_A_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2X33_P4_A_F_Z_R_1 0.1
`define C12T28SOI_LR_CNNAND2X33_P4_B_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2X33_P4_B_F_Z_R_1 0.1

module C12T28SOI_LR_CNNAND2X33_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	and    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B) (A -=> Z) = (`C12T28SOI_LR_CNNAND2X33_P4_A_F_Z_R_1,`C12T28SOI_LR_CNNAND2X33_P4_A_R_Z_F_1);
		if (A) (B -=> Z) = (`C12T28SOI_LR_CNNAND2X33_P4_B_F_Z_R_1,`C12T28SOI_LR_CNNAND2X33_P4_B_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNNAND2X33_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNAND2X33_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNAND2X33_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNAND2X33_P10_A_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2X33_P10_A_F_Z_R_1 0.1
`define C12T28SOI_LR_CNNAND2X33_P10_B_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNAND2X33_P10_B_F_Z_R_1 0.1

module C12T28SOI_LR_CNNAND2X33_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	and    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (B) (A -=> Z) = (`C12T28SOI_LR_CNNAND2X33_P10_A_F_Z_R_1,`C12T28SOI_LR_CNNAND2X33_P10_A_R_Z_F_1);
		if (A) (B -=> Z) = (`C12T28SOI_LR_CNNAND2X33_P10_B_F_Z_R_1,`C12T28SOI_LR_CNNAND2X33_P10_B_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNNAND2X33_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNOR2AX15_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNOR2AX15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNOR2AX15_P0_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNNOR2AX15_P0_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2AX15_P0_B_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNOR2AX15_P0_B_F_Z_R_1 0.1

module C12T28SOI_LR_CNNOR2AX15_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	not    U1 (INTERNAL1, B) ;
	and   #1 U2 (Z, A, INTERNAL1) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNNOR2AX15_P0_A_R_Z_R_0,`C12T28SOI_LR_CNNOR2AX15_P0_A_F_Z_F_0);
		if (A) (B -=> Z) = (`C12T28SOI_LR_CNNOR2AX15_P0_B_F_Z_R_1,`C12T28SOI_LR_CNNOR2AX15_P0_B_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNNOR2AX15_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNOR2AX15_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNOR2AX15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNOR2AX15_P4_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNNOR2AX15_P4_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2AX15_P4_B_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNOR2AX15_P4_B_F_Z_R_1 0.1

module C12T28SOI_LR_CNNOR2AX15_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	not    U1 (INTERNAL1, B) ;
	and   #1 U2 (Z, A, INTERNAL1) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNNOR2AX15_P4_A_R_Z_R_0,`C12T28SOI_LR_CNNOR2AX15_P4_A_F_Z_F_0);
		if (A) (B -=> Z) = (`C12T28SOI_LR_CNNOR2AX15_P4_B_F_Z_R_1,`C12T28SOI_LR_CNNOR2AX15_P4_B_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNNOR2AX15_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNOR2AX15_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNOR2AX15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNOR2AX15_P10_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNNOR2AX15_P10_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2AX15_P10_B_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNOR2AX15_P10_B_F_Z_R_1 0.1

module C12T28SOI_LR_CNNOR2AX15_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	not    U1 (INTERNAL1, B) ;
	and   #1 U2 (Z, A, INTERNAL1) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNNOR2AX15_P10_A_R_Z_R_0,`C12T28SOI_LR_CNNOR2AX15_P10_A_F_Z_F_0);
		if (A) (B -=> Z) = (`C12T28SOI_LR_CNNOR2AX15_P10_B_F_Z_R_1,`C12T28SOI_LR_CNNOR2AX15_P10_B_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNNOR2AX15_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNOR2AX27_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNOR2AX27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNOR2AX27_P0_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNNOR2AX27_P0_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2AX27_P0_B_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNOR2AX27_P0_B_F_Z_R_1 0.1

module C12T28SOI_LR_CNNOR2AX27_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	not    U1 (INTERNAL1, B) ;
	and   #1 U2 (Z, A, INTERNAL1) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNNOR2AX27_P0_A_R_Z_R_0,`C12T28SOI_LR_CNNOR2AX27_P0_A_F_Z_F_0);
		if (A) (B -=> Z) = (`C12T28SOI_LR_CNNOR2AX27_P0_B_F_Z_R_1,`C12T28SOI_LR_CNNOR2AX27_P0_B_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNNOR2AX27_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNOR2AX27_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNOR2AX27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNOR2AX27_P4_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNNOR2AX27_P4_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2AX27_P4_B_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNOR2AX27_P4_B_F_Z_R_1 0.1

module C12T28SOI_LR_CNNOR2AX27_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	not    U1 (INTERNAL1, B) ;
	and   #1 U2 (Z, A, INTERNAL1) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNNOR2AX27_P4_A_R_Z_R_0,`C12T28SOI_LR_CNNOR2AX27_P4_A_F_Z_F_0);
		if (A) (B -=> Z) = (`C12T28SOI_LR_CNNOR2AX27_P4_B_F_Z_R_1,`C12T28SOI_LR_CNNOR2AX27_P4_B_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNNOR2AX27_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNOR2AX27_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNOR2AX27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNOR2AX27_P10_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNNOR2AX27_P10_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2AX27_P10_B_R_Z_F_1 0.1
`define C12T28SOI_LR_CNNOR2AX27_P10_B_F_Z_R_1 0.1

module C12T28SOI_LR_CNNOR2AX27_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	not    U1 (INTERNAL1, B) ;
	and   #1 U2 (Z, A, INTERNAL1) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNNOR2AX27_P10_A_R_Z_R_0,`C12T28SOI_LR_CNNOR2AX27_P10_A_F_Z_F_0);
		if (A) (B -=> Z) = (`C12T28SOI_LR_CNNOR2AX27_P10_B_F_Z_R_1,`C12T28SOI_LR_CNNOR2AX27_P10_B_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNNOR2AX27_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNOR2X14_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNOR2X14_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNOR2X14_P0_A_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2X14_P0_A_F_Z_R_0 0.1
`define C12T28SOI_LR_CNNOR2X14_P0_B_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2X14_P0_B_F_Z_R_0 0.1

module C12T28SOI_LR_CNNOR2X14_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	or    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B) (A -=> Z) = (`C12T28SOI_LR_CNNOR2X14_P0_A_F_Z_R_0,`C12T28SOI_LR_CNNOR2X14_P0_A_R_Z_F_0);
		if (!A) (B -=> Z) = (`C12T28SOI_LR_CNNOR2X14_P0_B_F_Z_R_0,`C12T28SOI_LR_CNNOR2X14_P0_B_R_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNNOR2X14_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNOR2X14_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNOR2X14_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNOR2X14_P4_A_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2X14_P4_A_F_Z_R_0 0.1
`define C12T28SOI_LR_CNNOR2X14_P4_B_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2X14_P4_B_F_Z_R_0 0.1

module C12T28SOI_LR_CNNOR2X14_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	or    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B) (A -=> Z) = (`C12T28SOI_LR_CNNOR2X14_P4_A_F_Z_R_0,`C12T28SOI_LR_CNNOR2X14_P4_A_R_Z_F_0);
		if (!A) (B -=> Z) = (`C12T28SOI_LR_CNNOR2X14_P4_B_F_Z_R_0,`C12T28SOI_LR_CNNOR2X14_P4_B_R_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNNOR2X14_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNOR2X14_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNOR2X14_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNOR2X14_P10_A_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2X14_P10_A_F_Z_R_0 0.1
`define C12T28SOI_LR_CNNOR2X14_P10_B_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2X14_P10_B_F_Z_R_0 0.1

module C12T28SOI_LR_CNNOR2X14_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	or    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B) (A -=> Z) = (`C12T28SOI_LR_CNNOR2X14_P10_A_F_Z_R_0,`C12T28SOI_LR_CNNOR2X14_P10_A_R_Z_F_0);
		if (!A) (B -=> Z) = (`C12T28SOI_LR_CNNOR2X14_P10_B_F_Z_R_0,`C12T28SOI_LR_CNNOR2X14_P10_B_R_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNNOR2X14_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNOR2X33_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNOR2X33_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNOR2X33_P0_A_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2X33_P0_A_F_Z_R_0 0.1
`define C12T28SOI_LR_CNNOR2X33_P0_B_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2X33_P0_B_F_Z_R_0 0.1

module C12T28SOI_LR_CNNOR2X33_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	or    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B) (A -=> Z) = (`C12T28SOI_LR_CNNOR2X33_P0_A_F_Z_R_0,`C12T28SOI_LR_CNNOR2X33_P0_A_R_Z_F_0);
		if (!A) (B -=> Z) = (`C12T28SOI_LR_CNNOR2X33_P0_B_F_Z_R_0,`C12T28SOI_LR_CNNOR2X33_P0_B_R_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNNOR2X33_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNOR2X33_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNOR2X33_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNOR2X33_P4_A_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2X33_P4_A_F_Z_R_0 0.1
`define C12T28SOI_LR_CNNOR2X33_P4_B_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2X33_P4_B_F_Z_R_0 0.1

module C12T28SOI_LR_CNNOR2X33_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	or    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B) (A -=> Z) = (`C12T28SOI_LR_CNNOR2X33_P4_A_F_Z_R_0,`C12T28SOI_LR_CNNOR2X33_P4_A_R_Z_F_0);
		if (!A) (B -=> Z) = (`C12T28SOI_LR_CNNOR2X33_P4_B_F_Z_R_0,`C12T28SOI_LR_CNNOR2X33_P4_B_R_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNNOR2X33_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNNOR2X33_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNNOR2X33_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNNOR2X33_P10_A_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2X33_P10_A_F_Z_R_0 0.1
`define C12T28SOI_LR_CNNOR2X33_P10_B_R_Z_F_0 0.1
`define C12T28SOI_LR_CNNOR2X33_P10_B_F_Z_R_0 0.1

module C12T28SOI_LR_CNNOR2X33_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	or    U1 (INTERNAL1, A, B) ;
	not   #1 U2 (Z, INTERNAL1) ;



	specify

		if (!B) (A -=> Z) = (`C12T28SOI_LR_CNNOR2X33_P10_A_F_Z_R_0,`C12T28SOI_LR_CNNOR2X33_P10_A_R_Z_F_0);
		if (!A) (B -=> Z) = (`C12T28SOI_LR_CNNOR2X33_P10_B_F_Z_R_0,`C12T28SOI_LR_CNNOR2X33_P10_B_R_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNNOR2X33_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR2X15_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR2X15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR2X15_P0_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X15_P0_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNOR2X15_P0_B_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X15_P0_B_F_Z_F_0 0.1

module C12T28SOI_LR_CNOR2X15_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	or   #1 U1 (Z, A, B) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNOR2X15_P0_A_R_Z_R_0,`C12T28SOI_LR_CNOR2X15_P0_A_F_Z_F_0);
		if (!A) (B +=> Z) = (`C12T28SOI_LR_CNOR2X15_P0_B_R_Z_R_0,`C12T28SOI_LR_CNOR2X15_P0_B_F_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNOR2X15_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR2X15_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR2X15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR2X15_P4_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X15_P4_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNOR2X15_P4_B_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X15_P4_B_F_Z_F_0 0.1

module C12T28SOI_LR_CNOR2X15_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	or   #1 U1 (Z, A, B) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNOR2X15_P4_A_R_Z_R_0,`C12T28SOI_LR_CNOR2X15_P4_A_F_Z_F_0);
		if (!A) (B +=> Z) = (`C12T28SOI_LR_CNOR2X15_P4_B_R_Z_R_0,`C12T28SOI_LR_CNOR2X15_P4_B_F_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNOR2X15_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR2X15_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR2X15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR2X15_P10_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X15_P10_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNOR2X15_P10_B_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X15_P10_B_F_Z_F_0 0.1

module C12T28SOI_LR_CNOR2X15_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	or   #1 U1 (Z, A, B) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNOR2X15_P10_A_R_Z_R_0,`C12T28SOI_LR_CNOR2X15_P10_A_F_Z_F_0);
		if (!A) (B +=> Z) = (`C12T28SOI_LR_CNOR2X15_P10_B_R_Z_R_0,`C12T28SOI_LR_CNOR2X15_P10_B_F_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNOR2X15_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR2X20_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR2X20_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR2X20_P0_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X20_P0_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNOR2X20_P0_B_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X20_P0_B_F_Z_F_0 0.1

module C12T28SOI_LR_CNOR2X20_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	or   #1 U1 (Z, A, B) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNOR2X20_P0_A_R_Z_R_0,`C12T28SOI_LR_CNOR2X20_P0_A_F_Z_F_0);
		if (!A) (B +=> Z) = (`C12T28SOI_LR_CNOR2X20_P0_B_R_Z_R_0,`C12T28SOI_LR_CNOR2X20_P0_B_F_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNOR2X20_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR2X20_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR2X20_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR2X20_P4_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X20_P4_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNOR2X20_P4_B_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X20_P4_B_F_Z_F_0 0.1

module C12T28SOI_LR_CNOR2X20_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	or   #1 U1 (Z, A, B) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNOR2X20_P4_A_R_Z_R_0,`C12T28SOI_LR_CNOR2X20_P4_A_F_Z_F_0);
		if (!A) (B +=> Z) = (`C12T28SOI_LR_CNOR2X20_P4_B_R_Z_R_0,`C12T28SOI_LR_CNOR2X20_P4_B_F_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNOR2X20_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR2X20_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR2X20_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR2X20_P10_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X20_P10_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNOR2X20_P10_B_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X20_P10_B_F_Z_F_0 0.1

module C12T28SOI_LR_CNOR2X20_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	or   #1 U1 (Z, A, B) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNOR2X20_P10_A_R_Z_R_0,`C12T28SOI_LR_CNOR2X20_P10_A_F_Z_F_0);
		if (!A) (B +=> Z) = (`C12T28SOI_LR_CNOR2X20_P10_B_R_Z_R_0,`C12T28SOI_LR_CNOR2X20_P10_B_F_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNOR2X20_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR2X33_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR2X33_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR2X33_P0_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X33_P0_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNOR2X33_P0_B_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X33_P0_B_F_Z_F_0 0.1

module C12T28SOI_LR_CNOR2X33_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	or   #1 U1 (Z, A, B) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNOR2X33_P0_A_R_Z_R_0,`C12T28SOI_LR_CNOR2X33_P0_A_F_Z_F_0);
		if (!A) (B +=> Z) = (`C12T28SOI_LR_CNOR2X33_P0_B_R_Z_R_0,`C12T28SOI_LR_CNOR2X33_P0_B_F_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNOR2X33_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR2X33_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR2X33_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR2X33_P4_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X33_P4_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNOR2X33_P4_B_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X33_P4_B_F_Z_F_0 0.1

module C12T28SOI_LR_CNOR2X33_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	or   #1 U1 (Z, A, B) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNOR2X33_P4_A_R_Z_R_0,`C12T28SOI_LR_CNOR2X33_P4_A_F_Z_F_0);
		if (!A) (B +=> Z) = (`C12T28SOI_LR_CNOR2X33_P4_B_R_Z_R_0,`C12T28SOI_LR_CNOR2X33_P4_B_F_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNOR2X33_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR2X33_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR2X33_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR2X33_P10_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X33_P10_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNOR2X33_P10_B_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X33_P10_B_F_Z_F_0 0.1

module C12T28SOI_LR_CNOR2X33_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	or   #1 U1 (Z, A, B) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNOR2X33_P10_A_R_Z_R_0,`C12T28SOI_LR_CNOR2X33_P10_A_F_Z_F_0);
		if (!A) (B +=> Z) = (`C12T28SOI_LR_CNOR2X33_P10_B_R_Z_R_0,`C12T28SOI_LR_CNOR2X33_P10_B_F_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNOR2X33_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR2X37_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR2X37_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR2X37_P0_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X37_P0_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNOR2X37_P0_B_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X37_P0_B_F_Z_F_0 0.1

module C12T28SOI_LR_CNOR2X37_P0 (Z, A, B);

	output Z;
	input A;
	input B;

	or   #1 U1 (Z, A, B) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNOR2X37_P0_A_R_Z_R_0,`C12T28SOI_LR_CNOR2X37_P0_A_F_Z_F_0);
		if (!A) (B +=> Z) = (`C12T28SOI_LR_CNOR2X37_P0_B_R_Z_R_0,`C12T28SOI_LR_CNOR2X37_P0_B_F_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNOR2X37_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR2X37_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR2X37_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR2X37_P4_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X37_P4_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNOR2X37_P4_B_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X37_P4_B_F_Z_F_0 0.1

module C12T28SOI_LR_CNOR2X37_P4 (Z, A, B);

	output Z;
	input A;
	input B;

	or   #1 U1 (Z, A, B) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNOR2X37_P4_A_R_Z_R_0,`C12T28SOI_LR_CNOR2X37_P4_A_F_Z_F_0);
		if (!A) (B +=> Z) = (`C12T28SOI_LR_CNOR2X37_P4_B_R_Z_R_0,`C12T28SOI_LR_CNOR2X37_P4_B_F_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNOR2X37_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR2X37_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR2X37_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR2X37_P10_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X37_P10_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNOR2X37_P10_B_R_Z_R_0 0.1
`define C12T28SOI_LR_CNOR2X37_P10_B_F_Z_F_0 0.1

module C12T28SOI_LR_CNOR2X37_P10 (Z, A, B);

	output Z;
	input A;
	input B;

	or   #1 U1 (Z, A, B) ;



	specify

		if (!B) (A +=> Z) = (`C12T28SOI_LR_CNOR2X37_P10_A_R_Z_R_0,`C12T28SOI_LR_CNOR2X37_P10_A_F_Z_F_0);
		if (!A) (B +=> Z) = (`C12T28SOI_LR_CNOR2X37_P10_B_R_Z_R_0,`C12T28SOI_LR_CNOR2X37_P10_B_F_Z_F_0);


	endspecify

endmodule // C12T28SOI_LR_CNOR2X37_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR3X14_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR3X14_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR3X14_P0_A_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X14_P0_A_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X14_P0_B_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X14_P0_B_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X14_P0_C_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X14_P0_C_F_Z_F_00 0.1

module C12T28SOI_LR_CNOR3X14_P0 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or   #1 U1 (Z, A, B, C) ;



	specify

		if (!B && !C) (A +=> Z) = (`C12T28SOI_LR_CNOR3X14_P0_A_R_Z_R_00,`C12T28SOI_LR_CNOR3X14_P0_A_F_Z_F_00);
		if (!A && !C) (B +=> Z) = (`C12T28SOI_LR_CNOR3X14_P0_B_R_Z_R_00,`C12T28SOI_LR_CNOR3X14_P0_B_F_Z_F_00);
		if (!A && !B) (C +=> Z) = (`C12T28SOI_LR_CNOR3X14_P0_C_R_Z_R_00,`C12T28SOI_LR_CNOR3X14_P0_C_F_Z_F_00);


	endspecify

endmodule // C12T28SOI_LR_CNOR3X14_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR3X14_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR3X14_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR3X14_P4_A_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X14_P4_A_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X14_P4_B_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X14_P4_B_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X14_P4_C_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X14_P4_C_F_Z_F_00 0.1

module C12T28SOI_LR_CNOR3X14_P4 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or   #1 U1 (Z, A, B, C) ;



	specify

		if (!B && !C) (A +=> Z) = (`C12T28SOI_LR_CNOR3X14_P4_A_R_Z_R_00,`C12T28SOI_LR_CNOR3X14_P4_A_F_Z_F_00);
		if (!A && !C) (B +=> Z) = (`C12T28SOI_LR_CNOR3X14_P4_B_R_Z_R_00,`C12T28SOI_LR_CNOR3X14_P4_B_F_Z_F_00);
		if (!A && !B) (C +=> Z) = (`C12T28SOI_LR_CNOR3X14_P4_C_R_Z_R_00,`C12T28SOI_LR_CNOR3X14_P4_C_F_Z_F_00);


	endspecify

endmodule // C12T28SOI_LR_CNOR3X14_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR3X14_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR3X14_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR3X14_P10_A_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X14_P10_A_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X14_P10_B_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X14_P10_B_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X14_P10_C_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X14_P10_C_F_Z_F_00 0.1

module C12T28SOI_LR_CNOR3X14_P10 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or   #1 U1 (Z, A, B, C) ;



	specify

		if (!B && !C) (A +=> Z) = (`C12T28SOI_LR_CNOR3X14_P10_A_R_Z_R_00,`C12T28SOI_LR_CNOR3X14_P10_A_F_Z_F_00);
		if (!A && !C) (B +=> Z) = (`C12T28SOI_LR_CNOR3X14_P10_B_R_Z_R_00,`C12T28SOI_LR_CNOR3X14_P10_B_F_Z_F_00);
		if (!A && !B) (C +=> Z) = (`C12T28SOI_LR_CNOR3X14_P10_C_R_Z_R_00,`C12T28SOI_LR_CNOR3X14_P10_C_F_Z_F_00);


	endspecify

endmodule // C12T28SOI_LR_CNOR3X14_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR3X20_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR3X20_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR3X20_P0_A_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X20_P0_A_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X20_P0_B_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X20_P0_B_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X20_P0_C_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X20_P0_C_F_Z_F_00 0.1

module C12T28SOI_LR_CNOR3X20_P0 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or   #1 U1 (Z, A, B, C) ;



	specify

		if (!B && !C) (A +=> Z) = (`C12T28SOI_LR_CNOR3X20_P0_A_R_Z_R_00,`C12T28SOI_LR_CNOR3X20_P0_A_F_Z_F_00);
		if (!A && !C) (B +=> Z) = (`C12T28SOI_LR_CNOR3X20_P0_B_R_Z_R_00,`C12T28SOI_LR_CNOR3X20_P0_B_F_Z_F_00);
		if (!A && !B) (C +=> Z) = (`C12T28SOI_LR_CNOR3X20_P0_C_R_Z_R_00,`C12T28SOI_LR_CNOR3X20_P0_C_F_Z_F_00);


	endspecify

endmodule // C12T28SOI_LR_CNOR3X20_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR3X20_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR3X20_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR3X20_P4_A_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X20_P4_A_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X20_P4_B_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X20_P4_B_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X20_P4_C_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X20_P4_C_F_Z_F_00 0.1

module C12T28SOI_LR_CNOR3X20_P4 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or   #1 U1 (Z, A, B, C) ;



	specify

		if (!B && !C) (A +=> Z) = (`C12T28SOI_LR_CNOR3X20_P4_A_R_Z_R_00,`C12T28SOI_LR_CNOR3X20_P4_A_F_Z_F_00);
		if (!A && !C) (B +=> Z) = (`C12T28SOI_LR_CNOR3X20_P4_B_R_Z_R_00,`C12T28SOI_LR_CNOR3X20_P4_B_F_Z_F_00);
		if (!A && !B) (C +=> Z) = (`C12T28SOI_LR_CNOR3X20_P4_C_R_Z_R_00,`C12T28SOI_LR_CNOR3X20_P4_C_F_Z_F_00);


	endspecify

endmodule // C12T28SOI_LR_CNOR3X20_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR3X20_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR3X20_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR3X20_P10_A_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X20_P10_A_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X20_P10_B_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X20_P10_B_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X20_P10_C_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X20_P10_C_F_Z_F_00 0.1

module C12T28SOI_LR_CNOR3X20_P10 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or   #1 U1 (Z, A, B, C) ;



	specify

		if (!B && !C) (A +=> Z) = (`C12T28SOI_LR_CNOR3X20_P10_A_R_Z_R_00,`C12T28SOI_LR_CNOR3X20_P10_A_F_Z_F_00);
		if (!A && !C) (B +=> Z) = (`C12T28SOI_LR_CNOR3X20_P10_B_R_Z_R_00,`C12T28SOI_LR_CNOR3X20_P10_B_F_Z_F_00);
		if (!A && !B) (C +=> Z) = (`C12T28SOI_LR_CNOR3X20_P10_C_R_Z_R_00,`C12T28SOI_LR_CNOR3X20_P10_C_F_Z_F_00);


	endspecify

endmodule // C12T28SOI_LR_CNOR3X20_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR3X27_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR3X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR3X27_P0_A_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X27_P0_A_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X27_P0_B_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X27_P0_B_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X27_P0_C_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X27_P0_C_F_Z_F_00 0.1

module C12T28SOI_LR_CNOR3X27_P0 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or   #1 U1 (Z, A, B, C) ;



	specify

		if (!B && !C) (A +=> Z) = (`C12T28SOI_LR_CNOR3X27_P0_A_R_Z_R_00,`C12T28SOI_LR_CNOR3X27_P0_A_F_Z_F_00);
		if (!A && !C) (B +=> Z) = (`C12T28SOI_LR_CNOR3X27_P0_B_R_Z_R_00,`C12T28SOI_LR_CNOR3X27_P0_B_F_Z_F_00);
		if (!A && !B) (C +=> Z) = (`C12T28SOI_LR_CNOR3X27_P0_C_R_Z_R_00,`C12T28SOI_LR_CNOR3X27_P0_C_F_Z_F_00);


	endspecify

endmodule // C12T28SOI_LR_CNOR3X27_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR3X27_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR3X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR3X27_P4_A_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X27_P4_A_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X27_P4_B_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X27_P4_B_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X27_P4_C_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X27_P4_C_F_Z_F_00 0.1

module C12T28SOI_LR_CNOR3X27_P4 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or   #1 U1 (Z, A, B, C) ;



	specify

		if (!B && !C) (A +=> Z) = (`C12T28SOI_LR_CNOR3X27_P4_A_R_Z_R_00,`C12T28SOI_LR_CNOR3X27_P4_A_F_Z_F_00);
		if (!A && !C) (B +=> Z) = (`C12T28SOI_LR_CNOR3X27_P4_B_R_Z_R_00,`C12T28SOI_LR_CNOR3X27_P4_B_F_Z_F_00);
		if (!A && !B) (C +=> Z) = (`C12T28SOI_LR_CNOR3X27_P4_C_R_Z_R_00,`C12T28SOI_LR_CNOR3X27_P4_C_F_Z_F_00);


	endspecify

endmodule // C12T28SOI_LR_CNOR3X27_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR3X27_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR3X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR3X27_P10_A_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X27_P10_A_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X27_P10_B_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X27_P10_B_F_Z_F_00 0.1
`define C12T28SOI_LR_CNOR3X27_P10_C_R_Z_R_00 0.1
`define C12T28SOI_LR_CNOR3X27_P10_C_F_Z_F_00 0.1

module C12T28SOI_LR_CNOR3X27_P10 (Z, A, B, C);

	output Z;
	input A;
	input B;
	input C;

	or   #1 U1 (Z, A, B, C) ;



	specify

		if (!B && !C) (A +=> Z) = (`C12T28SOI_LR_CNOR3X27_P10_A_R_Z_R_00,`C12T28SOI_LR_CNOR3X27_P10_A_F_Z_F_00);
		if (!A && !C) (B +=> Z) = (`C12T28SOI_LR_CNOR3X27_P10_B_R_Z_R_00,`C12T28SOI_LR_CNOR3X27_P10_B_F_Z_F_00);
		if (!A && !B) (C +=> Z) = (`C12T28SOI_LR_CNOR3X27_P10_C_R_Z_R_00,`C12T28SOI_LR_CNOR3X27_P10_C_F_Z_F_00);


	endspecify

endmodule // C12T28SOI_LR_CNOR3X27_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR4X20_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR4X20_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR4X20_P0_A_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X20_P0_A_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X20_P0_B_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X20_P0_B_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X20_P0_C_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X20_P0_C_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X20_P0_D_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X20_P0_D_F_Z_F_000 0.1

module C12T28SOI_LR_CNOR4X20_P0 (Z, A, B, C, D);

	output Z;
	input A;
	input B;
	input C;
	input D;

	or   #1 U1 (Z, A, B, C, D) ;



	specify

		if (!B && !C && !D) (A +=> Z) = (`C12T28SOI_LR_CNOR4X20_P0_A_R_Z_R_000,`C12T28SOI_LR_CNOR4X20_P0_A_F_Z_F_000);
		if (!A && !C && !D) (B +=> Z) = (`C12T28SOI_LR_CNOR4X20_P0_B_R_Z_R_000,`C12T28SOI_LR_CNOR4X20_P0_B_F_Z_F_000);
		if (!A && !B && !D) (C +=> Z) = (`C12T28SOI_LR_CNOR4X20_P0_C_R_Z_R_000,`C12T28SOI_LR_CNOR4X20_P0_C_F_Z_F_000);
		if (!A && !B && !C) (D +=> Z) = (`C12T28SOI_LR_CNOR4X20_P0_D_R_Z_R_000,`C12T28SOI_LR_CNOR4X20_P0_D_F_Z_F_000);


	endspecify

endmodule // C12T28SOI_LR_CNOR4X20_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR4X20_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR4X20_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR4X20_P4_A_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X20_P4_A_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X20_P4_B_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X20_P4_B_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X20_P4_C_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X20_P4_C_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X20_P4_D_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X20_P4_D_F_Z_F_000 0.1

module C12T28SOI_LR_CNOR4X20_P4 (Z, A, B, C, D);

	output Z;
	input A;
	input B;
	input C;
	input D;

	or   #1 U1 (Z, A, B, C, D) ;



	specify

		if (!B && !C && !D) (A +=> Z) = (`C12T28SOI_LR_CNOR4X20_P4_A_R_Z_R_000,`C12T28SOI_LR_CNOR4X20_P4_A_F_Z_F_000);
		if (!A && !C && !D) (B +=> Z) = (`C12T28SOI_LR_CNOR4X20_P4_B_R_Z_R_000,`C12T28SOI_LR_CNOR4X20_P4_B_F_Z_F_000);
		if (!A && !B && !D) (C +=> Z) = (`C12T28SOI_LR_CNOR4X20_P4_C_R_Z_R_000,`C12T28SOI_LR_CNOR4X20_P4_C_F_Z_F_000);
		if (!A && !B && !C) (D +=> Z) = (`C12T28SOI_LR_CNOR4X20_P4_D_R_Z_R_000,`C12T28SOI_LR_CNOR4X20_P4_D_F_Z_F_000);


	endspecify

endmodule // C12T28SOI_LR_CNOR4X20_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR4X20_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR4X20_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR4X20_P10_A_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X20_P10_A_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X20_P10_B_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X20_P10_B_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X20_P10_C_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X20_P10_C_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X20_P10_D_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X20_P10_D_F_Z_F_000 0.1

module C12T28SOI_LR_CNOR4X20_P10 (Z, A, B, C, D);

	output Z;
	input A;
	input B;
	input C;
	input D;

	or   #1 U1 (Z, A, B, C, D) ;



	specify

		if (!B && !C && !D) (A +=> Z) = (`C12T28SOI_LR_CNOR4X20_P10_A_R_Z_R_000,`C12T28SOI_LR_CNOR4X20_P10_A_F_Z_F_000);
		if (!A && !C && !D) (B +=> Z) = (`C12T28SOI_LR_CNOR4X20_P10_B_R_Z_R_000,`C12T28SOI_LR_CNOR4X20_P10_B_F_Z_F_000);
		if (!A && !B && !D) (C +=> Z) = (`C12T28SOI_LR_CNOR4X20_P10_C_R_Z_R_000,`C12T28SOI_LR_CNOR4X20_P10_C_F_Z_F_000);
		if (!A && !B && !C) (D +=> Z) = (`C12T28SOI_LR_CNOR4X20_P10_D_R_Z_R_000,`C12T28SOI_LR_CNOR4X20_P10_D_F_Z_F_000);


	endspecify

endmodule // C12T28SOI_LR_CNOR4X20_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR4X27_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR4X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR4X27_P0_A_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X27_P0_A_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X27_P0_B_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X27_P0_B_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X27_P0_C_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X27_P0_C_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X27_P0_D_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X27_P0_D_F_Z_F_000 0.1

module C12T28SOI_LR_CNOR4X27_P0 (Z, A, B, C, D);

	output Z;
	input A;
	input B;
	input C;
	input D;

	or   #1 U1 (Z, A, B, C, D) ;



	specify

		if (!B && !C && !D) (A +=> Z) = (`C12T28SOI_LR_CNOR4X27_P0_A_R_Z_R_000,`C12T28SOI_LR_CNOR4X27_P0_A_F_Z_F_000);
		if (!A && !C && !D) (B +=> Z) = (`C12T28SOI_LR_CNOR4X27_P0_B_R_Z_R_000,`C12T28SOI_LR_CNOR4X27_P0_B_F_Z_F_000);
		if (!A && !B && !D) (C +=> Z) = (`C12T28SOI_LR_CNOR4X27_P0_C_R_Z_R_000,`C12T28SOI_LR_CNOR4X27_P0_C_F_Z_F_000);
		if (!A && !B && !C) (D +=> Z) = (`C12T28SOI_LR_CNOR4X27_P0_D_R_Z_R_000,`C12T28SOI_LR_CNOR4X27_P0_D_F_Z_F_000);


	endspecify

endmodule // C12T28SOI_LR_CNOR4X27_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR4X27_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR4X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR4X27_P4_A_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X27_P4_A_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X27_P4_B_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X27_P4_B_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X27_P4_C_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X27_P4_C_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X27_P4_D_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X27_P4_D_F_Z_F_000 0.1

module C12T28SOI_LR_CNOR4X27_P4 (Z, A, B, C, D);

	output Z;
	input A;
	input B;
	input C;
	input D;

	or   #1 U1 (Z, A, B, C, D) ;



	specify

		if (!B && !C && !D) (A +=> Z) = (`C12T28SOI_LR_CNOR4X27_P4_A_R_Z_R_000,`C12T28SOI_LR_CNOR4X27_P4_A_F_Z_F_000);
		if (!A && !C && !D) (B +=> Z) = (`C12T28SOI_LR_CNOR4X27_P4_B_R_Z_R_000,`C12T28SOI_LR_CNOR4X27_P4_B_F_Z_F_000);
		if (!A && !B && !D) (C +=> Z) = (`C12T28SOI_LR_CNOR4X27_P4_C_R_Z_R_000,`C12T28SOI_LR_CNOR4X27_P4_C_F_Z_F_000);
		if (!A && !B && !C) (D +=> Z) = (`C12T28SOI_LR_CNOR4X27_P4_D_R_Z_R_000,`C12T28SOI_LR_CNOR4X27_P4_D_F_Z_F_000);


	endspecify

endmodule // C12T28SOI_LR_CNOR4X27_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNOR4X27_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNOR4X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNOR4X27_P10_A_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X27_P10_A_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X27_P10_B_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X27_P10_B_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X27_P10_C_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X27_P10_C_F_Z_F_000 0.1
`define C12T28SOI_LR_CNOR4X27_P10_D_R_Z_R_000 0.1
`define C12T28SOI_LR_CNOR4X27_P10_D_F_Z_F_000 0.1

module C12T28SOI_LR_CNOR4X27_P10 (Z, A, B, C, D);

	output Z;
	input A;
	input B;
	input C;
	input D;

	or   #1 U1 (Z, A, B, C, D) ;



	specify

		if (!B && !C && !D) (A +=> Z) = (`C12T28SOI_LR_CNOR4X27_P10_A_R_Z_R_000,`C12T28SOI_LR_CNOR4X27_P10_A_F_Z_F_000);
		if (!A && !C && !D) (B +=> Z) = (`C12T28SOI_LR_CNOR4X27_P10_B_R_Z_R_000,`C12T28SOI_LR_CNOR4X27_P10_B_F_Z_F_000);
		if (!A && !B && !D) (C +=> Z) = (`C12T28SOI_LR_CNOR4X27_P10_C_R_Z_R_000,`C12T28SOI_LR_CNOR4X27_P10_C_F_Z_F_000);
		if (!A && !B && !C) (D +=> Z) = (`C12T28SOI_LR_CNOR4X27_P10_D_R_Z_R_000,`C12T28SOI_LR_CNOR4X27_P10_D_F_Z_F_000);


	endspecify

endmodule // C12T28SOI_LR_CNOR4X27_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNSDFPRQTX15_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNSDFPRQTX15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNSDFPRQTX15_P0_CP_R_Q_R 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P0_CP_R_Q_F 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P0_CP_R_TQ_R 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P0_CP_R_TQ_F 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P0_RN_F_Q_F 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P0_RN_F_TQ_F 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P0_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_RN_CP_REC_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_RN_CP_REM_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_RN_PWL 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_CP_PWL_state_4 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_CP_PWL_state_3 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_CP_PWH_state_2 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P0_CP_PWH_state_1 0.01




module C12T28SOI_LR_CNSDFPRQTX15_P0 (Q, TQ, D, CP, RN, TI, TE);

	output Q;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;
	buf   #1 U4 (TQ, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;
	buf   #1 U4 (TQ, IQ) ;

	not    X1 (TEX, dTE) ;
	and    X2 (AND_DTEX, dD, TEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (AND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (AND_RNTEX, dRN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOI_LR_CNSDFPRQTX15_P0_CP_R_Q_R,`C12T28SOI_LR_CNSDFPRQTX15_P0_CP_R_Q_F);
		 (posedge CP => (TQ +: INTERNAL1)) = (`C12T28SOI_LR_CNSDFPRQTX15_P0_CP_R_TQ_R,`C12T28SOI_LR_CNSDFPRQTX15_P0_CP_R_TQ_F);
		 (negedge RN => (Q +: 1'b0)) = (`C12T28SOI_LR_CNSDFPRQTX15_P0_RN_F_Q_F,`C12T28SOI_LR_CNSDFPRQTX15_P0_RN_F_Q_F);
		 (negedge RN => (TQ +: 1'b0)) = (`C12T28SOI_LR_CNSDFPRQTX15_P0_RN_F_TQ_F,`C12T28SOI_LR_CNSDFPRQTX15_P0_RN_F_TQ_F);

		$setuphold(posedge CP, posedge D, `C12T28SOI_LR_CNSDFPRQTX15_P0_D_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P0_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOI_LR_CNSDFPRQTX15_P0_D_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P0_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LR_CNSDFPRQTX15_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LR_CNSDFPRQTX15_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOI_LR_CNSDFPRQTX15_P0_TI_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P0_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOI_LR_CNSDFPRQTX15_P0_TI_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P0_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$recrem(posedge RN, posedge CP, `C12T28SOI_LR_CNSDFPRQTX15_P0_RN_CP_REC_posedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P0_RN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DTEXAND_TETI, dRN, dCP);
		$width(negedge RN, `C12T28SOI_LR_CNSDFPRQTX15_P0_RN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, `C12T28SOI_LR_CNSDFPRQTX15_P0_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, `C12T28SOI_LR_CNSDFPRQTX15_P0_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, `C12T28SOI_LR_CNSDFPRQTX15_P0_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, `C12T28SOI_LR_CNSDFPRQTX15_P0_CP_PWH_state_1 ,0, NOTIFIER);
		
	endspecify

`endif

endmodule // C12T28SOI_LR_CNSDFPRQTX15_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNSDFPRQTX15_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNSDFPRQTX15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNSDFPRQTX15_P4_CP_R_Q_R 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P4_CP_R_Q_F 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P4_CP_R_TQ_R 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P4_CP_R_TQ_F 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P4_RN_F_Q_F 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P4_RN_F_TQ_F 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P4_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_RN_CP_REC_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_RN_CP_REM_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_RN_PWL 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_CP_PWL_state_4 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_CP_PWL_state_3 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_CP_PWH_state_2 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P4_CP_PWH_state_1 0.01




module C12T28SOI_LR_CNSDFPRQTX15_P4 (Q, TQ, D, CP, RN, TI, TE);

	output Q;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;
	buf   #1 U4 (TQ, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;
	buf   #1 U4 (TQ, IQ) ;

	not    X1 (TEX, dTE) ;
	and    X2 (AND_DTEX, dD, TEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (AND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (AND_RNTEX, dRN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOI_LR_CNSDFPRQTX15_P4_CP_R_Q_R,`C12T28SOI_LR_CNSDFPRQTX15_P4_CP_R_Q_F);
		 (posedge CP => (TQ +: INTERNAL1)) = (`C12T28SOI_LR_CNSDFPRQTX15_P4_CP_R_TQ_R,`C12T28SOI_LR_CNSDFPRQTX15_P4_CP_R_TQ_F);
		 (negedge RN => (Q +: 1'b0)) = (`C12T28SOI_LR_CNSDFPRQTX15_P4_RN_F_Q_F,`C12T28SOI_LR_CNSDFPRQTX15_P4_RN_F_Q_F);
		 (negedge RN => (TQ +: 1'b0)) = (`C12T28SOI_LR_CNSDFPRQTX15_P4_RN_F_TQ_F,`C12T28SOI_LR_CNSDFPRQTX15_P4_RN_F_TQ_F);

		$setuphold(posedge CP, posedge D, `C12T28SOI_LR_CNSDFPRQTX15_P4_D_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P4_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOI_LR_CNSDFPRQTX15_P4_D_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P4_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LR_CNSDFPRQTX15_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LR_CNSDFPRQTX15_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOI_LR_CNSDFPRQTX15_P4_TI_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P4_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOI_LR_CNSDFPRQTX15_P4_TI_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P4_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$recrem(posedge RN, posedge CP, `C12T28SOI_LR_CNSDFPRQTX15_P4_RN_CP_REC_posedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P4_RN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DTEXAND_TETI, dRN, dCP);
		$width(negedge RN, `C12T28SOI_LR_CNSDFPRQTX15_P4_RN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, `C12T28SOI_LR_CNSDFPRQTX15_P4_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, `C12T28SOI_LR_CNSDFPRQTX15_P4_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, `C12T28SOI_LR_CNSDFPRQTX15_P4_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, `C12T28SOI_LR_CNSDFPRQTX15_P4_CP_PWH_state_1 ,0, NOTIFIER);
		
	endspecify

`endif

endmodule // C12T28SOI_LR_CNSDFPRQTX15_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNSDFPRQTX15_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNSDFPRQTX15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNSDFPRQTX15_P10_CP_R_Q_R 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P10_CP_R_Q_F 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P10_CP_R_TQ_R 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P10_CP_R_TQ_F 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P10_RN_F_Q_F 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P10_RN_F_TQ_F 0.1
`define C12T28SOI_LR_CNSDFPRQTX15_P10_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_RN_CP_REC_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_RN_CP_REM_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_RN_PWL 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_CP_PWL_state_4 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_CP_PWL_state_3 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_CP_PWH_state_2 0.01
`define C12T28SOI_LR_CNSDFPRQTX15_P10_CP_PWH_state_1 0.01




module C12T28SOI_LR_CNSDFPRQTX15_P10 (Q, TQ, D, CP, RN, TI, TE);

	output Q;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;
	buf   #1 U4 (TQ, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;
	buf   #1 U4 (TQ, IQ) ;

	not    X1 (TEX, dTE) ;
	and    X2 (AND_DTEX, dD, TEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (AND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (AND_RNTEX, dRN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOI_LR_CNSDFPRQTX15_P10_CP_R_Q_R,`C12T28SOI_LR_CNSDFPRQTX15_P10_CP_R_Q_F);
		 (posedge CP => (TQ +: INTERNAL1)) = (`C12T28SOI_LR_CNSDFPRQTX15_P10_CP_R_TQ_R,`C12T28SOI_LR_CNSDFPRQTX15_P10_CP_R_TQ_F);
		 (negedge RN => (Q +: 1'b0)) = (`C12T28SOI_LR_CNSDFPRQTX15_P10_RN_F_Q_F,`C12T28SOI_LR_CNSDFPRQTX15_P10_RN_F_Q_F);
		 (negedge RN => (TQ +: 1'b0)) = (`C12T28SOI_LR_CNSDFPRQTX15_P10_RN_F_TQ_F,`C12T28SOI_LR_CNSDFPRQTX15_P10_RN_F_TQ_F);

		$setuphold(posedge CP, posedge D, `C12T28SOI_LR_CNSDFPRQTX15_P10_D_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P10_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOI_LR_CNSDFPRQTX15_P10_D_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P10_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LR_CNSDFPRQTX15_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LR_CNSDFPRQTX15_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOI_LR_CNSDFPRQTX15_P10_TI_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P10_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOI_LR_CNSDFPRQTX15_P10_TI_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P10_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$recrem(posedge RN, posedge CP, `C12T28SOI_LR_CNSDFPRQTX15_P10_RN_CP_REC_posedge_posedge, `C12T28SOI_LR_CNSDFPRQTX15_P10_RN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DTEXAND_TETI, dRN, dCP);
		$width(negedge RN, `C12T28SOI_LR_CNSDFPRQTX15_P10_RN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, `C12T28SOI_LR_CNSDFPRQTX15_P10_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, `C12T28SOI_LR_CNSDFPRQTX15_P10_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, `C12T28SOI_LR_CNSDFPRQTX15_P10_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, `C12T28SOI_LR_CNSDFPRQTX15_P10_CP_PWH_state_1 ,0, NOTIFIER);
		
	endspecify

`endif

endmodule // C12T28SOI_LR_CNSDFPRQTX15_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNSDFPSQTX15_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNSDFPSQTX15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNSDFPSQTX15_P0_CP_R_Q_R 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P0_CP_R_Q_F 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P0_CP_R_TQ_R 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P0_CP_R_TQ_F 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P0_SN_F_Q_R 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P0_SN_F_TQ_R 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P0_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_SN_CP_REC_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_SN_CP_REM_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_SN_PWL 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_CP_PWL_state_4 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_CP_PWL_state_3 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_CP_PWH_state_2 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P0_CP_PWH_state_1 0.01

module C12T28SOI_LR_CNSDFPSQTX15_P0 (Q, TQ, D, CP, SN, TI, TE);

	output Q;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;
	buf   #1 U4 (TQ, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;
	buf   #1 U4 (TQ, IQ) ;

	not    X1 (DX, dD) ;
	not    X2 (TEX, dTE) ;
	and    X3 (AND_DXTEX, DX, TEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (AND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (AND_SNTEX, dSN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOI_LR_CNSDFPSQTX15_P0_CP_R_Q_R,`C12T28SOI_LR_CNSDFPSQTX15_P0_CP_R_Q_F);
		 (posedge CP => (TQ +: INTERNAL1)) = (`C12T28SOI_LR_CNSDFPSQTX15_P0_CP_R_TQ_R,`C12T28SOI_LR_CNSDFPSQTX15_P0_CP_R_TQ_F);
		 (negedge SN => (Q +: 1'b1)) = (`C12T28SOI_LR_CNSDFPSQTX15_P0_SN_F_Q_R,`C12T28SOI_LR_CNSDFPSQTX15_P0_SN_F_Q_R);
		 (negedge SN => (TQ +: 1'b1)) = (`C12T28SOI_LR_CNSDFPSQTX15_P0_SN_F_TQ_R,`C12T28SOI_LR_CNSDFPSQTX15_P0_SN_F_TQ_R);

		$setuphold(posedge CP, posedge D, `C12T28SOI_LR_CNSDFPSQTX15_P0_D_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P0_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOI_LR_CNSDFPSQTX15_P0_D_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P0_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LR_CNSDFPSQTX15_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LR_CNSDFPSQTX15_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOI_LR_CNSDFPSQTX15_P0_TI_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P0_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOI_LR_CNSDFPSQTX15_P0_TI_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P0_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$recrem(posedge SN, posedge CP, `C12T28SOI_LR_CNSDFPSQTX15_P0_SN_CP_REC_posedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P0_SN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DXTEXAND_TETIX, dSN, dCP);
		$width(negedge SN, `C12T28SOI_LR_CNSDFPSQTX15_P0_SN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, `C12T28SOI_LR_CNSDFPSQTX15_P0_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, `C12T28SOI_LR_CNSDFPSQTX15_P0_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, `C12T28SOI_LR_CNSDFPSQTX15_P0_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, `C12T28SOI_LR_CNSDFPSQTX15_P0_CP_PWH_state_1 ,0, NOTIFIER);



	endspecify

`endif

endmodule // C12T28SOI_LR_CNSDFPSQTX15_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNSDFPSQTX15_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNSDFPSQTX15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNSDFPSQTX15_P4_CP_R_Q_R 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P4_CP_R_Q_F 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P4_CP_R_TQ_R 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P4_CP_R_TQ_F 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P4_SN_F_Q_R 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P4_SN_F_TQ_R 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P4_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_SN_CP_REC_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_SN_CP_REM_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_SN_PWL 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_CP_PWL_state_4 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_CP_PWL_state_3 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_CP_PWH_state_2 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P4_CP_PWH_state_1 0.01

module C12T28SOI_LR_CNSDFPSQTX15_P4 (Q, TQ, D, CP, SN, TI, TE);

	output Q;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;
	buf   #1 U4 (TQ, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;
	buf   #1 U4 (TQ, IQ) ;

	not    X1 (DX, dD) ;
	not    X2 (TEX, dTE) ;
	and    X3 (AND_DXTEX, DX, TEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (AND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (AND_SNTEX, dSN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOI_LR_CNSDFPSQTX15_P4_CP_R_Q_R,`C12T28SOI_LR_CNSDFPSQTX15_P4_CP_R_Q_F);
		 (posedge CP => (TQ +: INTERNAL1)) = (`C12T28SOI_LR_CNSDFPSQTX15_P4_CP_R_TQ_R,`C12T28SOI_LR_CNSDFPSQTX15_P4_CP_R_TQ_F);
		 (negedge SN => (Q +: 1'b1)) = (`C12T28SOI_LR_CNSDFPSQTX15_P4_SN_F_Q_R,`C12T28SOI_LR_CNSDFPSQTX15_P4_SN_F_Q_R);
		 (negedge SN => (TQ +: 1'b1)) = (`C12T28SOI_LR_CNSDFPSQTX15_P4_SN_F_TQ_R,`C12T28SOI_LR_CNSDFPSQTX15_P4_SN_F_TQ_R);

		$setuphold(posedge CP, posedge D, `C12T28SOI_LR_CNSDFPSQTX15_P4_D_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P4_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOI_LR_CNSDFPSQTX15_P4_D_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P4_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LR_CNSDFPSQTX15_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LR_CNSDFPSQTX15_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOI_LR_CNSDFPSQTX15_P4_TI_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P4_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOI_LR_CNSDFPSQTX15_P4_TI_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P4_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$recrem(posedge SN, posedge CP, `C12T28SOI_LR_CNSDFPSQTX15_P4_SN_CP_REC_posedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P4_SN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DXTEXAND_TETIX, dSN, dCP);
		$width(negedge SN, `C12T28SOI_LR_CNSDFPSQTX15_P4_SN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, `C12T28SOI_LR_CNSDFPSQTX15_P4_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, `C12T28SOI_LR_CNSDFPSQTX15_P4_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, `C12T28SOI_LR_CNSDFPSQTX15_P4_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, `C12T28SOI_LR_CNSDFPSQTX15_P4_CP_PWH_state_1 ,0, NOTIFIER);



	endspecify

`endif

endmodule // C12T28SOI_LR_CNSDFPSQTX15_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNSDFPSQTX15_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNSDFPSQTX15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNSDFPSQTX15_P10_CP_R_Q_R 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P10_CP_R_Q_F 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P10_CP_R_TQ_R 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P10_CP_R_TQ_F 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P10_SN_F_Q_R 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P10_SN_F_TQ_R 0.1
`define C12T28SOI_LR_CNSDFPSQTX15_P10_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_SN_CP_REC_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_SN_CP_REM_posedge_posedge 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_SN_PWL 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_CP_PWL_state_4 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_CP_PWL_state_3 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_CP_PWH_state_2 0.01
`define C12T28SOI_LR_CNSDFPSQTX15_P10_CP_PWH_state_1 0.01

module C12T28SOI_LR_CNSDFPSQTX15_P10 (Q, TQ, D, CP, SN, TI, TE);

	output Q;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;
	buf   #1 U4 (TQ, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;
	buf   #1 U4 (TQ, IQ) ;

	not    X1 (DX, dD) ;
	not    X2 (TEX, dTE) ;
	and    X3 (AND_DXTEX, DX, TEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (AND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (AND_SNTEX, dSN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOI_LR_CNSDFPSQTX15_P10_CP_R_Q_R,`C12T28SOI_LR_CNSDFPSQTX15_P10_CP_R_Q_F);
		 (posedge CP => (TQ +: INTERNAL1)) = (`C12T28SOI_LR_CNSDFPSQTX15_P10_CP_R_TQ_R,`C12T28SOI_LR_CNSDFPSQTX15_P10_CP_R_TQ_F);
		 (negedge SN => (Q +: 1'b1)) = (`C12T28SOI_LR_CNSDFPSQTX15_P10_SN_F_Q_R,`C12T28SOI_LR_CNSDFPSQTX15_P10_SN_F_Q_R);
		 (negedge SN => (TQ +: 1'b1)) = (`C12T28SOI_LR_CNSDFPSQTX15_P10_SN_F_TQ_R,`C12T28SOI_LR_CNSDFPSQTX15_P10_SN_F_TQ_R);

		$setuphold(posedge CP, posedge D, `C12T28SOI_LR_CNSDFPSQTX15_P10_D_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P10_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOI_LR_CNSDFPSQTX15_P10_D_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P10_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOI_LR_CNSDFPSQTX15_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOI_LR_CNSDFPSQTX15_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOI_LR_CNSDFPSQTX15_P10_TI_CP_SETUP_posedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P10_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOI_LR_CNSDFPSQTX15_P10_TI_CP_SETUP_negedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P10_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$recrem(posedge SN, posedge CP, `C12T28SOI_LR_CNSDFPSQTX15_P10_SN_CP_REC_posedge_posedge, `C12T28SOI_LR_CNSDFPSQTX15_P10_SN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DXTEXAND_TETIX, dSN, dCP);
		$width(negedge SN, `C12T28SOI_LR_CNSDFPSQTX15_P10_SN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, `C12T28SOI_LR_CNSDFPSQTX15_P10_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, `C12T28SOI_LR_CNSDFPSQTX15_P10_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, `C12T28SOI_LR_CNSDFPSQTX15_P10_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, `C12T28SOI_LR_CNSDFPSQTX15_P10_CP_PWH_state_1 ,0, NOTIFIER);



	endspecify

`endif

endmodule // C12T28SOI_LR_CNSDFPSQTX15_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_CNXOR2X16_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNXOR2X16_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNXOR2X16_P0_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNXOR2X16_P0_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNXOR2X16_P0_A_R_Z_F_1 0.1
`define C12T28SOI_LR_CNXOR2X16_P0_A_F_Z_R_1 0.1
`define C12T28SOI_LR_CNXOR2X16_P0_S_R_Z_R_0 0.1
`define C12T28SOI_LR_CNXOR2X16_P0_S_F_Z_F_0 0.1
`define C12T28SOI_LR_CNXOR2X16_P0_S_R_Z_F_1 0.1
`define C12T28SOI_LR_CNXOR2X16_P0_S_F_Z_R_1 0.1

module C12T28SOI_LR_CNXOR2X16_P0 (Z, A, S);

	output Z;
	input A;
	input S;

	xor   #1 U1 (Z, A, S) ;



	specify

		if (!S) (A +=> Z) = (`C12T28SOI_LR_CNXOR2X16_P0_A_R_Z_R_0,`C12T28SOI_LR_CNXOR2X16_P0_A_F_Z_F_0);
		if (S) (A -=> Z) = (`C12T28SOI_LR_CNXOR2X16_P0_A_F_Z_R_1,`C12T28SOI_LR_CNXOR2X16_P0_A_R_Z_F_1);
		if (!A) (S +=> Z) = (`C12T28SOI_LR_CNXOR2X16_P0_S_R_Z_R_0,`C12T28SOI_LR_CNXOR2X16_P0_S_F_Z_F_0);
		if (A) (S -=> Z) = (`C12T28SOI_LR_CNXOR2X16_P0_S_F_Z_R_1,`C12T28SOI_LR_CNXOR2X16_P0_S_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNXOR2X16_P0

`endcelldefine

// Verilog model view for C12T28SOI_LR_CNXOR2X16_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNXOR2X16_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNXOR2X16_P4_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNXOR2X16_P4_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNXOR2X16_P4_A_R_Z_F_1 0.1
`define C12T28SOI_LR_CNXOR2X16_P4_A_F_Z_R_1 0.1
`define C12T28SOI_LR_CNXOR2X16_P4_S_R_Z_R_0 0.1
`define C12T28SOI_LR_CNXOR2X16_P4_S_F_Z_F_0 0.1
`define C12T28SOI_LR_CNXOR2X16_P4_S_R_Z_F_1 0.1
`define C12T28SOI_LR_CNXOR2X16_P4_S_F_Z_R_1 0.1

module C12T28SOI_LR_CNXOR2X16_P4 (Z, A, S);

	output Z;
	input A;
	input S;

	xor   #1 U1 (Z, A, S) ;



	specify

		if (!S) (A +=> Z) = (`C12T28SOI_LR_CNXOR2X16_P4_A_R_Z_R_0,`C12T28SOI_LR_CNXOR2X16_P4_A_F_Z_F_0);
		if (S) (A -=> Z) = (`C12T28SOI_LR_CNXOR2X16_P4_A_F_Z_R_1,`C12T28SOI_LR_CNXOR2X16_P4_A_R_Z_F_1);
		if (!A) (S +=> Z) = (`C12T28SOI_LR_CNXOR2X16_P4_S_R_Z_R_0,`C12T28SOI_LR_CNXOR2X16_P4_S_F_Z_F_0);
		if (A) (S -=> Z) = (`C12T28SOI_LR_CNXOR2X16_P4_S_F_Z_R_1,`C12T28SOI_LR_CNXOR2X16_P4_S_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNXOR2X16_P4

`endcelldefine

// Verilog model view for C12T28SOI_LR_CNXOR2X16_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNXOR2X16_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNXOR2X16_P10_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNXOR2X16_P10_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNXOR2X16_P10_A_R_Z_F_1 0.1
`define C12T28SOI_LR_CNXOR2X16_P10_A_F_Z_R_1 0.1
`define C12T28SOI_LR_CNXOR2X16_P10_S_R_Z_R_0 0.1
`define C12T28SOI_LR_CNXOR2X16_P10_S_F_Z_F_0 0.1
`define C12T28SOI_LR_CNXOR2X16_P10_S_R_Z_F_1 0.1
`define C12T28SOI_LR_CNXOR2X16_P10_S_F_Z_R_1 0.1

module C12T28SOI_LR_CNXOR2X16_P10 (Z, A, S);

	output Z;
	input A;
	input S;

	xor   #1 U1 (Z, A, S) ;



	specify

		if (!S) (A +=> Z) = (`C12T28SOI_LR_CNXOR2X16_P10_A_R_Z_R_0,`C12T28SOI_LR_CNXOR2X16_P10_A_F_Z_F_0);
		if (S) (A -=> Z) = (`C12T28SOI_LR_CNXOR2X16_P10_A_F_Z_R_1,`C12T28SOI_LR_CNXOR2X16_P10_A_R_Z_F_1);
		if (!A) (S +=> Z) = (`C12T28SOI_LR_CNXOR2X16_P10_S_R_Z_R_0,`C12T28SOI_LR_CNXOR2X16_P10_S_F_Z_F_0);
		if (A) (S -=> Z) = (`C12T28SOI_LR_CNXOR2X16_P10_S_F_Z_R_1,`C12T28SOI_LR_CNXOR2X16_P10_S_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNXOR2X16_P10

`endcelldefine

// Verilog model view for C12T28SOI_LR_CNXOR2X27_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNXOR2X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNXOR2X27_P0_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNXOR2X27_P0_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNXOR2X27_P0_A_R_Z_F_1 0.1
`define C12T28SOI_LR_CNXOR2X27_P0_A_F_Z_R_1 0.1
`define C12T28SOI_LR_CNXOR2X27_P0_S_R_Z_R_0 0.1
`define C12T28SOI_LR_CNXOR2X27_P0_S_F_Z_F_0 0.1
`define C12T28SOI_LR_CNXOR2X27_P0_S_R_Z_F_1 0.1
`define C12T28SOI_LR_CNXOR2X27_P0_S_F_Z_R_1 0.1

module C12T28SOI_LR_CNXOR2X27_P0 (Z, A, S);

	output Z;
	input A;
	input S;

	xor   #1 U1 (Z, A, S) ;



	specify

		if (!S) (A +=> Z) = (`C12T28SOI_LR_CNXOR2X27_P0_A_R_Z_R_0,`C12T28SOI_LR_CNXOR2X27_P0_A_F_Z_F_0);
		if (S) (A -=> Z) = (`C12T28SOI_LR_CNXOR2X27_P0_A_F_Z_R_1,`C12T28SOI_LR_CNXOR2X27_P0_A_R_Z_F_1);
		if (!A) (S +=> Z) = (`C12T28SOI_LR_CNXOR2X27_P0_S_R_Z_R_0,`C12T28SOI_LR_CNXOR2X27_P0_S_F_Z_F_0);
		if (A) (S -=> Z) = (`C12T28SOI_LR_CNXOR2X27_P0_S_F_Z_R_1,`C12T28SOI_LR_CNXOR2X27_P0_S_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNXOR2X27_P0

`endcelldefine

// Verilog model view for C12T28SOI_LR_CNXOR2X27_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNXOR2X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNXOR2X27_P4_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNXOR2X27_P4_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNXOR2X27_P4_A_R_Z_F_1 0.1
`define C12T28SOI_LR_CNXOR2X27_P4_A_F_Z_R_1 0.1
`define C12T28SOI_LR_CNXOR2X27_P4_S_R_Z_R_0 0.1
`define C12T28SOI_LR_CNXOR2X27_P4_S_F_Z_F_0 0.1
`define C12T28SOI_LR_CNXOR2X27_P4_S_R_Z_F_1 0.1
`define C12T28SOI_LR_CNXOR2X27_P4_S_F_Z_R_1 0.1

module C12T28SOI_LR_CNXOR2X27_P4 (Z, A, S);

	output Z;
	input A;
	input S;

	xor   #1 U1 (Z, A, S) ;



	specify

		if (!S) (A +=> Z) = (`C12T28SOI_LR_CNXOR2X27_P4_A_R_Z_R_0,`C12T28SOI_LR_CNXOR2X27_P4_A_F_Z_F_0);
		if (S) (A -=> Z) = (`C12T28SOI_LR_CNXOR2X27_P4_A_F_Z_R_1,`C12T28SOI_LR_CNXOR2X27_P4_A_R_Z_F_1);
		if (!A) (S +=> Z) = (`C12T28SOI_LR_CNXOR2X27_P4_S_R_Z_R_0,`C12T28SOI_LR_CNXOR2X27_P4_S_F_Z_F_0);
		if (A) (S -=> Z) = (`C12T28SOI_LR_CNXOR2X27_P4_S_F_Z_R_1,`C12T28SOI_LR_CNXOR2X27_P4_S_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNXOR2X27_P4

`endcelldefine

// Verilog model view for C12T28SOI_LR_CNXOR2X27_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_CNXOR2X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_CNXOR2X27_P10_A_R_Z_R_0 0.1
`define C12T28SOI_LR_CNXOR2X27_P10_A_F_Z_F_0 0.1
`define C12T28SOI_LR_CNXOR2X27_P10_A_R_Z_F_1 0.1
`define C12T28SOI_LR_CNXOR2X27_P10_A_F_Z_R_1 0.1
`define C12T28SOI_LR_CNXOR2X27_P10_S_R_Z_R_0 0.1
`define C12T28SOI_LR_CNXOR2X27_P10_S_F_Z_F_0 0.1
`define C12T28SOI_LR_CNXOR2X27_P10_S_R_Z_F_1 0.1
`define C12T28SOI_LR_CNXOR2X27_P10_S_F_Z_R_1 0.1

module C12T28SOI_LR_CNXOR2X27_P10 (Z, A, S);

	output Z;
	input A;
	input S;

	xor   #1 U1 (Z, A, S) ;



	specify

		if (!S) (A +=> Z) = (`C12T28SOI_LR_CNXOR2X27_P10_A_R_Z_R_0,`C12T28SOI_LR_CNXOR2X27_P10_A_F_Z_F_0);
		if (S) (A -=> Z) = (`C12T28SOI_LR_CNXOR2X27_P10_A_F_Z_R_1,`C12T28SOI_LR_CNXOR2X27_P10_A_R_Z_F_1);
		if (!A) (S +=> Z) = (`C12T28SOI_LR_CNXOR2X27_P10_S_R_Z_R_0,`C12T28SOI_LR_CNXOR2X27_P10_S_F_Z_F_0);
		if (A) (S -=> Z) = (`C12T28SOI_LR_CNXOR2X27_P10_S_F_Z_R_1,`C12T28SOI_LR_CNXOR2X27_P10_S_R_Z_F_1);


	endspecify

endmodule // C12T28SOI_LR_CNXOR2X27_P10

`endcelldefine

// Verilog model view for C12T28SOI_LR_DLYHFM4X15_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_DLYHFM4X15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_DLYHFM4X15_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_DLYHFM4X15_P0_A_F_Z_F 0.1

module C12T28SOI_LR_DLYHFM4X15_P0 (Z, A);

	output Z;
	input A;

	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf   #1 U2 (Z, IZ) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_DLYHFM4X15_P0_A_R_Z_R,`C12T28SOI_LR_DLYHFM4X15_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_DLYHFM4X15_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_DLYHFM4X15_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_DLYHFM4X15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_DLYHFM4X15_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_DLYHFM4X15_P4_A_F_Z_F 0.1

module C12T28SOI_LR_DLYHFM4X15_P4 (Z, A);

	output Z;
	input A;

	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf   #1 U2 (Z, IZ) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_DLYHFM4X15_P4_A_R_Z_R,`C12T28SOI_LR_DLYHFM4X15_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_DLYHFM4X15_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_DLYHFM8X15_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_DLYHFM8X15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_DLYHFM8X15_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_DLYHFM8X15_P0_A_F_Z_F 0.1

module C12T28SOI_LR_DLYHFM8X15_P0 (Z, A);

	output Z;
	input A;

	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf   #1 U2 (Z, IZ) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_DLYHFM8X15_P0_A_R_Z_R,`C12T28SOI_LR_DLYHFM8X15_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_DLYHFM8X15_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_DLYHFM8X15_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_DLYHFM8X15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_DLYHFM8X15_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_DLYHFM8X15_P4_A_F_Z_F 0.1

module C12T28SOI_LR_DLYHFM8X15_P4 (Z, A);

	output Z;
	input A;

	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf   #1 U2 (Z, IZ) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_DLYHFM8X15_P4_A_R_Z_R,`C12T28SOI_LR_DLYHFM8X15_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_DLYHFM8X15_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_DLYHFM4X15_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_DLYHFM4X15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_DLYHFM4X15_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_DLYHFM4X15_P10_A_F_Z_F 0.1

module C12T28SOI_LR_DLYHFM4X15_P10 (Z, A);

	output Z;
	input A;

	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf   #1 U2 (Z, IZ) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_DLYHFM4X15_P10_A_R_Z_R,`C12T28SOI_LR_DLYHFM4X15_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_DLYHFM4X15_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_DLYHFM8X15_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_DLYHFM8X15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_DLYHFM8X15_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_DLYHFM8X15_P10_A_F_Z_F 0.1

module C12T28SOI_LR_DLYHFM8X15_P10 (Z, A);

	output Z;
	input A;

	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf   #1 U2 (Z, IZ) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_DLYHFM8X15_P10_A_R_Z_R,`C12T28SOI_LR_DLYHFM8X15_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_DLYHFM8X15_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_DLYHFM4X7_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_DLYHFM4X7_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_DLYHFM4X7_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_DLYHFM4X7_P0_A_F_Z_F 0.1

module C12T28SOI_LR_DLYHFM4X7_P0 (Z, A);

	output Z;
	input A;

	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf   #1 U2 (Z, IZ) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_DLYHFM4X7_P0_A_R_Z_R,`C12T28SOI_LR_DLYHFM4X7_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_DLYHFM4X7_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_DLYHFM4X7_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_DLYHFM4X7_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_DLYHFM4X7_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_DLYHFM4X7_P4_A_F_Z_F 0.1

module C12T28SOI_LR_DLYHFM4X7_P4 (Z, A);

	output Z;
	input A;

	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf   #1 U2 (Z, IZ) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_DLYHFM4X7_P4_A_R_Z_R,`C12T28SOI_LR_DLYHFM4X7_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_DLYHFM4X7_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_DLYHFM8X7_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_DLYHFM8X7_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_DLYHFM8X7_P0_A_R_Z_R 0.1
`define C12T28SOI_LR_DLYHFM8X7_P0_A_F_Z_F 0.1

module C12T28SOI_LR_DLYHFM8X7_P0 (Z, A);

	output Z;
	input A;

	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf   #1 U2 (Z, IZ) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_DLYHFM8X7_P0_A_R_Z_R,`C12T28SOI_LR_DLYHFM8X7_P0_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_DLYHFM8X7_P0


`endcelldefine

// Verilog model view for C12T28SOI_LR_DLYHFM8X7_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_DLYHFM8X7_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_DLYHFM8X7_P4_A_R_Z_R 0.1
`define C12T28SOI_LR_DLYHFM8X7_P4_A_F_Z_F 0.1

module C12T28SOI_LR_DLYHFM8X7_P4 (Z, A);

	output Z;
	input A;

	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf   #1 U2 (Z, IZ) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_DLYHFM8X7_P4_A_R_Z_R,`C12T28SOI_LR_DLYHFM8X7_P4_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_DLYHFM8X7_P4


`endcelldefine

// Verilog model view for C12T28SOI_LR_DLYHFM4X7_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_DLYHFM4X7_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_DLYHFM4X7_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_DLYHFM4X7_P10_A_F_Z_F 0.1

module C12T28SOI_LR_DLYHFM4X7_P10 (Z, A);

	output Z;
	input A;

	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf   #1 U2 (Z, IZ) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_DLYHFM4X7_P10_A_R_Z_R,`C12T28SOI_LR_DLYHFM4X7_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_DLYHFM4X7_P10


`endcelldefine

// Verilog model view for C12T28SOI_LR_DLYHFM8X7_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOI_LR_DLYHFM8X7_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define C12T28SOI_LR_DLYHFM8X7_P10_A_R_Z_R 0.1
`define C12T28SOI_LR_DLYHFM8X7_P10_A_F_Z_F 0.1

module C12T28SOI_LR_DLYHFM8X7_P10 (Z, A);

	output Z;
	input A;

	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf   #1 U2 (Z, IZ) ;



	specify

		(A +=> Z) = (`C12T28SOI_LR_DLYHFM8X7_P10_A_R_Z_R,`C12T28SOI_LR_DLYHFM8X7_P10_A_F_Z_F);


	endspecify

endmodule // C12T28SOI_LR_DLYHFM8X7_P10


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_SDFSYNCPQX8_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_SDFSYNCPQX8_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_CP_R_Q_R 0.1
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_CP_R_Q_F 0.1
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_CP_PWL_state_4 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_CP_PWL_state_3 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_CP_PWH_state_2 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P0_CP_PWH_state_1 0.01

module C12T28SOIDV_LR_SDFSYNCPQX8_P0 (Q, D, CP, TI, TE);

	output Q;
	input D;
	input CP;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (TEX, dTE) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOIDV_LR_SDFSYNCPQX8_P0_CP_R_Q_R,`C12T28SOIDV_LR_SDFSYNCPQX8_P0_CP_R_Q_F);

		$setuphold(posedge CP, posedge D, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_D_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_D_CP_HOLD_posedge_posedge , NOTIFIER,, TEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_D_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_D_CP_HOLD_negedge_posedge , NOTIFIER,, TEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXTIAND_DTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXTIAND_DTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_TI_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_TI_CP_HOLD_posedge_posedge , NOTIFIER,, dTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_TI_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_TI_CP_HOLD_negedge_posedge , NOTIFIER,, dTE, dCP, dTI);
		$width(negedge CP &&& TE, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& TE, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& TEX, `C12T28SOIDV_LR_SDFSYNCPQX8_P0_CP_PWH_state_1 ,0, NOTIFIER);


	endspecify

`endif

endmodule // C12T28SOIDV_LR_SDFSYNCPQX8_P0


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_SDFSYNCPQX8_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_SDFSYNCPQX8_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_CP_R_Q_R 0.1
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_CP_R_Q_F 0.1
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_CP_PWL_state_4 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_CP_PWL_state_3 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_CP_PWH_state_2 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P4_CP_PWH_state_1 0.01

module C12T28SOIDV_LR_SDFSYNCPQX8_P4 (Q, D, CP, TI, TE);

	output Q;
	input D;
	input CP;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (TEX, dTE) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOIDV_LR_SDFSYNCPQX8_P4_CP_R_Q_R,`C12T28SOIDV_LR_SDFSYNCPQX8_P4_CP_R_Q_F);

		$setuphold(posedge CP, posedge D, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_D_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_D_CP_HOLD_posedge_posedge , NOTIFIER,, TEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_D_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_D_CP_HOLD_negedge_posedge , NOTIFIER,, TEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXTIAND_DTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXTIAND_DTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_TI_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_TI_CP_HOLD_posedge_posedge , NOTIFIER,, dTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_TI_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_TI_CP_HOLD_negedge_posedge , NOTIFIER,, dTE, dCP, dTI);
		$width(negedge CP &&& TE, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& TE, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& TEX, `C12T28SOIDV_LR_SDFSYNCPQX8_P4_CP_PWH_state_1 ,0, NOTIFIER);


	endspecify

`endif

endmodule // C12T28SOIDV_LR_SDFSYNCPQX8_P4


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_SDFSYNCPQX8_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_SDFSYNCPQX8_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_CP_R_Q_R 0.1
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_CP_R_Q_F 0.1
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_CP_PWL_state_4 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_CP_PWL_state_3 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_CP_PWH_state_2 0.01
`define C12T28SOIDV_LR_SDFSYNCPQX8_P10_CP_PWH_state_1 0.01

module C12T28SOIDV_LR_SDFSYNCPQX8_P10 (Q, D, CP, TI, TE);

	output Q;
	input D;
	input CP;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (TEX, dTE) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOIDV_LR_SDFSYNCPQX8_P10_CP_R_Q_R,`C12T28SOIDV_LR_SDFSYNCPQX8_P10_CP_R_Q_F);

		$setuphold(posedge CP, posedge D, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_D_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_D_CP_HOLD_posedge_posedge , NOTIFIER,, TEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_D_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_D_CP_HOLD_negedge_posedge , NOTIFIER,, TEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXTIAND_DTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXTIAND_DTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_TI_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_TI_CP_HOLD_posedge_posedge , NOTIFIER,, dTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_TI_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_TI_CP_HOLD_negedge_posedge , NOTIFIER,, dTE, dCP, dTI);
		$width(negedge CP &&& TE, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& TE, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& TEX, `C12T28SOIDV_LR_SDFSYNCPQX8_P10_CP_PWH_state_1 ,0, NOTIFIER);


	endspecify

`endif

endmodule // C12T28SOIDV_LR_SDFSYNCPQX8_P10


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_SDFSYNCPRQX8_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_SDFSYNCPRQX8_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_CP_R_Q_R 0.1
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_CP_R_Q_F 0.1
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_RN_F_Q_F 0.1
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_RN_CP_REC_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_RN_CP_REM_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_RN_PWL 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_CP_PWL_state_4 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_CP_PWL_state_3 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_CP_PWH_state_2 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P0_CP_PWH_state_1 0.01

module C12T28SOIDV_LR_SDFSYNCPRQX8_P0 (Q, D, CP, RN, TI, TE);

	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (TEX, dTE) ;
	and    X2 (AND_DTEX, dD, TEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (AND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (AND_RNTEX, dRN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOIDV_LR_SDFSYNCPRQX8_P0_CP_R_Q_R,`C12T28SOIDV_LR_SDFSYNCPRQX8_P0_CP_R_Q_F);
		 (negedge RN => (Q +: 1'b0)) = (`C12T28SOIDV_LR_SDFSYNCPRQX8_P0_RN_F_Q_F,`C12T28SOIDV_LR_SDFSYNCPRQX8_P0_RN_F_Q_F);

		$setuphold(posedge CP, posedge D, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_D_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_D_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TI_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TI_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$recrem(posedge RN, posedge CP, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_RN_CP_REC_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_RN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DTEXAND_TETI, dRN, dCP);
		$width(negedge RN, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_RN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, `C12T28SOIDV_LR_SDFSYNCPRQX8_P0_CP_PWH_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOIDV_LR_SDFSYNCPRQX8_P0


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_SDFSYNCPRQX8_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_SDFSYNCPRQX8_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_CP_R_Q_R 0.1
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_CP_R_Q_F 0.1
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_RN_F_Q_F 0.1
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_RN_CP_REC_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_RN_CP_REM_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_RN_PWL 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_CP_PWL_state_4 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_CP_PWL_state_3 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_CP_PWH_state_2 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P4_CP_PWH_state_1 0.01

module C12T28SOIDV_LR_SDFSYNCPRQX8_P4 (Q, D, CP, RN, TI, TE);

	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (TEX, dTE) ;
	and    X2 (AND_DTEX, dD, TEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (AND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (AND_RNTEX, dRN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOIDV_LR_SDFSYNCPRQX8_P4_CP_R_Q_R,`C12T28SOIDV_LR_SDFSYNCPRQX8_P4_CP_R_Q_F);
		 (negedge RN => (Q +: 1'b0)) = (`C12T28SOIDV_LR_SDFSYNCPRQX8_P4_RN_F_Q_F,`C12T28SOIDV_LR_SDFSYNCPRQX8_P4_RN_F_Q_F);

		$setuphold(posedge CP, posedge D, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_D_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_D_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TI_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TI_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$recrem(posedge RN, posedge CP, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_RN_CP_REC_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_RN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DTEXAND_TETI, dRN, dCP);
		$width(negedge RN, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_RN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, `C12T28SOIDV_LR_SDFSYNCPRQX8_P4_CP_PWH_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOIDV_LR_SDFSYNCPRQX8_P4


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_SDFSYNCPRQX8_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_SDFSYNCPRQX8_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_CP_R_Q_R 0.1
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_CP_R_Q_F 0.1
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_RN_F_Q_F 0.1
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_RN_CP_REC_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_RN_CP_REM_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_RN_PWL 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_CP_PWL_state_4 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_CP_PWL_state_3 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_CP_PWH_state_2 0.01
`define C12T28SOIDV_LR_SDFSYNCPRQX8_P10_CP_PWH_state_1 0.01

module C12T28SOIDV_LR_SDFSYNCPRQX8_P10 (Q, D, CP, RN, TI, TE);

	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (TEX, dTE) ;
	and    X2 (AND_DTEX, dD, TEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (AND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (AND_RNTEX, dRN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOIDV_LR_SDFSYNCPRQX8_P10_CP_R_Q_R,`C12T28SOIDV_LR_SDFSYNCPRQX8_P10_CP_R_Q_F);
		 (negedge RN => (Q +: 1'b0)) = (`C12T28SOIDV_LR_SDFSYNCPRQX8_P10_RN_F_Q_F,`C12T28SOIDV_LR_SDFSYNCPRQX8_P10_RN_F_Q_F);

		$setuphold(posedge CP, posedge D, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_D_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_D_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TI_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TI_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$recrem(posedge RN, posedge CP, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_RN_CP_REC_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_RN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DTEXAND_TETI, dRN, dCP);
		$width(negedge RN, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_RN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, `C12T28SOIDV_LR_SDFSYNCPRQX8_P10_CP_PWH_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOIDV_LR_SDFSYNCPRQX8_P10


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_SDFSYNCPSQX8_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_SDFSYNCPSQX8_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_CP_R_Q_R 0.1
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_CP_R_Q_F 0.1
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_SN_F_Q_R 0.1
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_SN_CP_REC_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_SN_CP_REM_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_SN_PWL 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_CP_PWL_state_4 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_CP_PWL_state_3 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_CP_PWH_state_2 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P0_CP_PWH_state_1 0.01


module C12T28SOIDV_LR_SDFSYNCPSQX8_P0 (Q, D, CP, SN, TI, TE);

	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (DX, dD) ;
	not    X2 (TEX, dTE) ;
	and    X3 (AND_DXTEX, DX, TEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (AND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (AND_SNTEX, dSN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOIDV_LR_SDFSYNCPSQX8_P0_CP_R_Q_R,`C12T28SOIDV_LR_SDFSYNCPSQX8_P0_CP_R_Q_F);
		 (negedge SN => (Q +: 1'b1)) = (`C12T28SOIDV_LR_SDFSYNCPSQX8_P0_SN_F_Q_R,`C12T28SOIDV_LR_SDFSYNCPSQX8_P0_SN_F_Q_R);

		$setuphold(posedge CP, posedge D, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_D_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_D_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TE_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TE_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TI_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TI_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$recrem(posedge SN, posedge CP, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_SN_CP_REC_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_SN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DXTEXAND_TETIX, dSN, dCP);
		$width(negedge SN, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_SN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, `C12T28SOIDV_LR_SDFSYNCPSQX8_P0_CP_PWH_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOIDV_LR_SDFSYNCPSQX8_P0


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_SDFSYNCPSQX8_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_SDFSYNCPSQX8_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_CP_R_Q_R 0.1
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_CP_R_Q_F 0.1
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_SN_F_Q_R 0.1
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_SN_CP_REC_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_SN_CP_REM_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_SN_PWL 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_CP_PWL_state_4 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_CP_PWL_state_3 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_CP_PWH_state_2 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P4_CP_PWH_state_1 0.01


module C12T28SOIDV_LR_SDFSYNCPSQX8_P4 (Q, D, CP, SN, TI, TE);

	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (DX, dD) ;
	not    X2 (TEX, dTE) ;
	and    X3 (AND_DXTEX, DX, TEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (AND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (AND_SNTEX, dSN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOIDV_LR_SDFSYNCPSQX8_P4_CP_R_Q_R,`C12T28SOIDV_LR_SDFSYNCPSQX8_P4_CP_R_Q_F);
		 (negedge SN => (Q +: 1'b1)) = (`C12T28SOIDV_LR_SDFSYNCPSQX8_P4_SN_F_Q_R,`C12T28SOIDV_LR_SDFSYNCPSQX8_P4_SN_F_Q_R);

		$setuphold(posedge CP, posedge D, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_D_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_D_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TE_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TE_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TI_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TI_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$recrem(posedge SN, posedge CP, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_SN_CP_REC_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_SN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DXTEXAND_TETIX, dSN, dCP);
		$width(negedge SN, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_SN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, `C12T28SOIDV_LR_SDFSYNCPSQX8_P4_CP_PWH_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOIDV_LR_SDFSYNCPSQX8_P4


`endcelldefine

// Verilog model view for C12T28SOIDV_LR_SDFSYNCPSQX8_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LR_SDFSYNCPSQX8_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef functional
   `delay_mode_unit
`else
   `delay_mode_path
`endif

`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_CP_R_Q_R 0.1
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_CP_R_Q_F 0.1
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_SN_F_Q_R 0.1
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TI_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TI_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TI_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TI_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TE_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TE_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TE_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TE_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_D_CP_HOLD_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_D_CP_HOLD_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_D_CP_SETUP_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_D_CP_SETUP_negedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_SN_CP_REC_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_SN_CP_REM_posedge_posedge 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_SN_PWL 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_CP_PWL_state_4 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_CP_PWL_state_3 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_CP_PWH_state_2 0.01
`define C12T28SOIDV_LR_SDFSYNCPSQX8_P10_CP_PWH_state_1 0.01


module C12T28SOIDV_LR_SDFSYNCPSQX8_P10 (Q, D, CP, SN, TI, TE);

	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	C28SOI_SC_12_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_12_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (DX, dD) ;
	not    X2 (TEX, dTE) ;
	and    X3 (AND_DXTEX, DX, TEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (AND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (AND_SNTEX, dSN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T28SOIDV_LR_SDFSYNCPSQX8_P10_CP_R_Q_R,`C12T28SOIDV_LR_SDFSYNCPSQX8_P10_CP_R_Q_F);
		 (negedge SN => (Q +: 1'b1)) = (`C12T28SOIDV_LR_SDFSYNCPSQX8_P10_SN_F_Q_R,`C12T28SOIDV_LR_SDFSYNCPSQX8_P10_SN_F_Q_R);

		$setuphold(posedge CP, posedge D, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_D_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_D_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TE_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TE_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TI_CP_SETUP_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TI_CP_SETUP_negedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$recrem(posedge SN, posedge CP, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_SN_CP_REC_posedge_posedge, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_SN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DXTEXAND_TETIX, dSN, dCP);
		$width(negedge SN, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_SN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, `C12T28SOIDV_LR_SDFSYNCPSQX8_P10_CP_PWH_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T28SOIDV_LR_SDFSYNCPSQX8_P10


`endcelldefine



primitive C28SOI_SC_12_CLK_LR_U_FD_P_NOTI (Q, D, CP, NOTI_REG);

   output Q;
   input  D,		// data
          CP,		// clock
          NOTI_REG;
   reg    Q;

   table

      // D     CP    NOTI_REG    : Qtn : Qtn+1

         0     (01)  ?           :  ?  :  0  ;		// Normal clocking
         1     (01)  ?           :  ?  :  1  ;

         *     b     ?           :  ?  :  -  ;		// Ignore edges on data

         ?     (?0)  ?           :  ?  :  -  ;		// Ignore falling edges on clock

         0     (1x)  ?           :  0  :  0  ;		// Cases reducing pessimism
         1     (1x)  ?           :  1  :  1  ;
         0     (0x)  ?           :  0  :  0  ;
         0     (x1)  ?           :  0  :  0  ;
         1     (0x)  ?           :  1  :  1  ;
         1     (x1)  ?           :  1  :  1  ;

         ?     ?     *           :  ?  :  x  ;		// X for timing violations

   endtable

endprimitive


primitive C28SOI_SC_12_CLK_LR_U_FD_P_RN_NOTI (Q, D, CP, RN, NOTI_REG);

   output Q;
   input  D,		// data
          CP,		// clock
          RN,		// clear active low
          NOTI_REG;
   reg    Q;

   table
 
      // D     CP    RN    NOTI_REG    : Qtn : Qtn+1

         ?     ?     0     ?           :  ?  :  0  ;	// Asynchronous clear

         1     (01)  1     ?           :  ?  :  1  ;	// Normal clocking
         0     (01)  1     ?           :  ?  :  0  ;

         *     b     ?     ?           :  ?  :  -  ;	// Ignore edges on data

         ?     (?0)  ?     ?           :  ?  :  -  ;	// Ignore falling edges on clock

         0     (1x)  ?     ?           :  0  :  0  ;
         1     (1x)  1     ?           :  1  :  1  ;

         ?     b     (?1)  ?           :  ?  :  -  ;	// Ignore rising edges on clear
         0     x     (?1)  ?           :  0  :  0  ;	// Ignore rising edges on clear

         0     (0x)  ?     ?           :  0  :  0  ;	// Cases reducing pessimism
         0     (x1)  ?     ?           :  0  :  0  ;
         1     (0x)  1     ?           :  1  :  1  ;
         1     (x1)  1     ?           :  1  :  1  ;

         0     (01)  x     ?           :  ?  :  0  ;
         ?     b     (?x)  ?           :  0  :  0  ;
         0     x     (?x)  ?           :  0  :  0  ;

         ?     ?     ?     *           :  ?  :  x  ;	// X for timing violations

   endtable

endprimitive


primitive C28SOI_SC_12_CLK_LR_U_FD_P_SN_NOTI (Q, D, CP, SN, NOTI_REG);

   output Q;
   input  D,		// data
          CP,		// clock
          SN,		// preset active low
          NOTI_REG;
   reg    Q;

   table
 
      // D     CP    SN    NOTI_REG    : Qtn : Qtn+1

         ?     ?     0     ?           :  ?  :  1  ;	// Asynchronous preset

         1     (01)  1     ?           :  ?  :  1  ;	// Normal clocking
         0     (01)  1     ?           :  ?  :  0  ;

         *     b     ?     ?           :  ?  :  -  ;	// Ignore edges on data

         ?     (?0)  ?     ?           :  ?  :  -  ;	// Ignore falling edges on clock

         0     (1x)  1     ?           :  0  :  0  ;
         1     (1x)  ?     ?           :  1  :  1  ;

         ?     b     (?1)  ?           :  ?  :  -  ;	// Ignore rising edges on set
         1     x     (?1)  ?           :  1  :  1  ;	// Ignore rising edges on set

         0     (0x)  1     ?           :  0  :  0  ;	// Cases reducing pessimism
         0     (x1)  1     ?           :  0  :  0  ;
         1     (0x)  ?     ?           :  1  :  1  ;
         1     (x1)  ?     ?           :  1  :  1  ;

         1     (01)  x     ?           :  ?  :  1  ;
         ?     b     (?x)  ?           :  1  :  1  ;
         1     x     (?x)  ?           :  1  :  1  ;

         ?     ?     ?     *           :  ?  :  x  ;	// X for timing violations

   endtable

endprimitive


primitive C28SOI_SC_12_CLK_LR_U_LD_N_NOTI (Q, D, GN, NOTI_REG);
 
   output Q;
   input  D,            // data
          GN,           // clock active low
          NOTI_REG;
   reg    Q;
 
   table
 
      // D     GN    NOTI_REG    : Qtn : Qtn+1
 
         (?0)  0     ?           :  ?  :  0  ;          // Transparency
         (?1)  0     ?           :  ?  :  1  ;
 
         0     (?0)  ?           :  ?  :  0  ;
         1     (?0)  ?           :  ?  :  1  ;
 
         *     1     ?           :  ?  :  -  ;          // Latching
 
         ?     (?1)  ?           :  ?  :  -  ;          // Ignore rising edges on clock
         ?     (0x)  ?           :  ?  :  -  ;
 
         0     (1x)  ?           :  0  :  0  ;          // Cases reducing pessimism
         1     (1x)  ?           :  1  :  1  ;
         (?0)  x     ?           :  0  :  0  ;
         (?1)  x     ?           :  1  :  1  ;
 
         ?     ?     *           :  ?  :  x  ;          // X for timing violations
 
   endtable
 

endprimitive


primitive C28SOI_SC_12_CLK_LR_U_LD_P_NOTI (Q, D, G, NOTI_REG);
 
   output Q;
   input  D,            // data
          G,            // clock
          NOTI_REG;
   reg    Q;
 
   table
 
      // D     G     NOTI_REG    : Qtn : Qtn+1
 
         (?0)  1     ?           :  ?  :  0  ;          // Transparency
         (?1)  1     ?           :  ?  :  1  ;
 
         0     (?1)  ?           :  ?  :  0  ;
         1     (?1)  ?           :  ?  :  1  ;
 
         *     0     ?           :  ?  :  -  ;          // Latching
 
         ?     (?0)  ?           :  ?  :  -  ;          // Ignore falling edges on clock
         ?     (1x)  ?           :  ?  :  -  ;
 
         0     (0x)  ?           :  0  :  0  ;          // Cases reducing pessimism
         1     (0x)  ?           :  1  :  1  ;
         (?0)  x     ?           :  0  :  0  ;
         (?1)  x     ?           :  1  :  1  ;
 
         ?     ?     *           :  ?  :  x  ;          // X for timing violations
 
   endtable
 

endprimitive


primitive C28SOI_SC_12_CLK_LR_U_MUX2 (Z, A, B, S);

   output Z;
   input  A, B, S;

   table

      // A  B  S  :  Z

         0  ?  0  :  0  ;
         1  ?  0  :  1  ;

         ?  0  1  :  0  ;
         ?  1  1  :  1  ;

      // Cases reducing pessimism

         0  0  x  :  0  ;
         1  1  x  :  1  ;

   endtable


endprimitive
