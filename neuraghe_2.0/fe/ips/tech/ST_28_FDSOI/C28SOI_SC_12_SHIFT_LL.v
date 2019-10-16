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
//              Verilog models for the C28SOI_SC_12_SHIFT_LL.CMOS028SOI
//                    (C28SOI_SC_12_SHIFT_LL   release 2.1.0)
// 
//
//--------------------------------------------------------------------------------
// 
//Date            : Wed Jun 26 12:19:37 2013
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

// Verilog model view for C12T28SOIDV_LLV_CNLSINCL0X32_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSINCL0X32_P0

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

`define C12T28SOIDV_LLV_CNLSINCL0X32_P0_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL0X32_P0_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL0X32_P0_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_CNLSINCL0X32_P0_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_CNLSINCL0X32_P0 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSINCL0X32_P0_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSINCL0X32_P0_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_CNLSINCL0X32_P0_R_F_Z_R_1,`C12T28SOIDV_LLV_CNLSINCL0X32_P0_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSINCL0X32_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSINCL0X32_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSINCL0X32_P4

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

`define C12T28SOIDV_LLV_CNLSINCL0X32_P4_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL0X32_P4_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL0X32_P4_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_CNLSINCL0X32_P4_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_CNLSINCL0X32_P4 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSINCL0X32_P4_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSINCL0X32_P4_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_CNLSINCL0X32_P4_R_F_Z_R_1,`C12T28SOIDV_LLV_CNLSINCL0X32_P4_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSINCL0X32_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSINCL0X32_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSINCL0X32_P10

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

`define C12T28SOIDV_LLV_CNLSINCL0X32_P10_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL0X32_P10_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL0X32_P10_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_CNLSINCL0X32_P10_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_CNLSINCL0X32_P10 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSINCL0X32_P10_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSINCL0X32_P10_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_CNLSINCL0X32_P10_R_F_Z_R_1,`C12T28SOIDV_LLV_CNLSINCL0X32_P10_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSINCL0X32_P10

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSINCL0X32_P16
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSINCL0X32_P16

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

`define C12T28SOIDV_LLV_CNLSINCL0X32_P16_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL0X32_P16_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL0X32_P16_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_CNLSINCL0X32_P16_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_CNLSINCL0X32_P16 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSINCL0X32_P16_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSINCL0X32_P16_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_CNLSINCL0X32_P16_R_F_Z_R_1,`C12T28SOIDV_LLV_CNLSINCL0X32_P16_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSINCL0X32_P16

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSINCL1X32_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSINCL1X32_P0

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

`define C12T28SOIDV_LLV_CNLSINCL1X32_P0_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL1X32_P0_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL1X32_P0_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL1X32_P0_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_CNLSINCL1X32_P0 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSINCL1X32_P0_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSINCL1X32_P0_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_CNLSINCL1X32_P0_S_R_Z_R_0,`C12T28SOIDV_LLV_CNLSINCL1X32_P0_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSINCL1X32_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSINCL1X32_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSINCL1X32_P4

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

`define C12T28SOIDV_LLV_CNLSINCL1X32_P4_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL1X32_P4_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL1X32_P4_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL1X32_P4_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_CNLSINCL1X32_P4 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSINCL1X32_P4_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSINCL1X32_P4_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_CNLSINCL1X32_P4_S_R_Z_R_0,`C12T28SOIDV_LLV_CNLSINCL1X32_P4_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSINCL1X32_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSINCL1X32_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSINCL1X32_P10

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

`define C12T28SOIDV_LLV_CNLSINCL1X32_P10_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL1X32_P10_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL1X32_P10_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL1X32_P10_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_CNLSINCL1X32_P10 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSINCL1X32_P10_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSINCL1X32_P10_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_CNLSINCL1X32_P10_S_R_Z_R_0,`C12T28SOIDV_LLV_CNLSINCL1X32_P10_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSINCL1X32_P10

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSINCL1X32_P16
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSINCL1X32_P16

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

`define C12T28SOIDV_LLV_CNLSINCL1X32_P16_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL1X32_P16_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL1X32_P16_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSINCL1X32_P16_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_CNLSINCL1X32_P16 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSINCL1X32_P16_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSINCL1X32_P16_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_CNLSINCL1X32_P16_S_R_Z_R_0,`C12T28SOIDV_LLV_CNLSINCL1X32_P16_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSINCL1X32_P16

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSOUTCL0X32_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSOUTCL0X32_P0

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

`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P0_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P0_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P0_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P0_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_CNLSOUTCL0X32_P0 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL0X32_P0_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSOUTCL0X32_P0_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL0X32_P0_R_F_Z_R_1,`C12T28SOIDV_LLV_CNLSOUTCL0X32_P0_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSOUTCL0X32_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSOUTCL0X32_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSOUTCL0X32_P4

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

`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P4_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P4_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P4_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P4_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_CNLSOUTCL0X32_P4 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL0X32_P4_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSOUTCL0X32_P4_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL0X32_P4_R_F_Z_R_1,`C12T28SOIDV_LLV_CNLSOUTCL0X32_P4_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSOUTCL0X32_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSOUTCL0X32_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSOUTCL0X32_P10

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

`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P10_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P10_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P10_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P10_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_CNLSOUTCL0X32_P10 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL0X32_P10_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSOUTCL0X32_P10_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL0X32_P10_R_F_Z_R_1,`C12T28SOIDV_LLV_CNLSOUTCL0X32_P10_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSOUTCL0X32_P10

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSOUTCL0X32_P16
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSOUTCL0X32_P16

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

`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P16_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P16_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P16_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL0X32_P16_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_CNLSOUTCL0X32_P16 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL0X32_P16_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSOUTCL0X32_P16_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL0X32_P16_R_F_Z_R_1,`C12T28SOIDV_LLV_CNLSOUTCL0X32_P16_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSOUTCL0X32_P16

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSOUTCL1X32_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSOUTCL1X32_P0

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

`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P0_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P0_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P0_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P0_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_CNLSOUTCL1X32_P0 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL1X32_P0_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSOUTCL1X32_P0_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL1X32_P0_S_R_Z_R_0,`C12T28SOIDV_LLV_CNLSOUTCL1X32_P0_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSOUTCL1X32_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSOUTCL1X32_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSOUTCL1X32_P4

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

`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P4_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P4_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P4_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P4_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_CNLSOUTCL1X32_P4 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL1X32_P4_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSOUTCL1X32_P4_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL1X32_P4_S_R_Z_R_0,`C12T28SOIDV_LLV_CNLSOUTCL1X32_P4_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSOUTCL1X32_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSOUTCL1X32_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSOUTCL1X32_P10

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

`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P10_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P10_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P10_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P10_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_CNLSOUTCL1X32_P10 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL1X32_P10_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSOUTCL1X32_P10_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL1X32_P10_S_R_Z_R_0,`C12T28SOIDV_LLV_CNLSOUTCL1X32_P10_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSOUTCL1X32_P10

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_CNLSOUTCL1X32_P16
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_CNLSOUTCL1X32_P16

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

`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P16_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P16_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P16_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_CNLSOUTCL1X32_P16_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_CNLSOUTCL1X32_P16 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL1X32_P16_A_R_Z_R_0,`C12T28SOIDV_LLV_CNLSOUTCL1X32_P16_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_CNLSOUTCL1X32_P16_S_R_Z_R_0,`C12T28SOIDV_LLV_CNLSOUTCL1X32_P16_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_CNLSOUTCL1X32_P16

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINCL0X32_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINCL0X32_P0

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

`define C12T28SOIDV_LLV_LSINCL0X32_P0_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSINCL0X32_P0_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSINCL0X32_P0_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSINCL0X32_P0_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_LSINCL0X32_P0 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_LSINCL0X32_P0_A_R_Z_R_0,`C12T28SOIDV_LLV_LSINCL0X32_P0_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_LSINCL0X32_P0_R_F_Z_R_1,`C12T28SOIDV_LLV_LSINCL0X32_P0_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_LSINCL0X32_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINCL0X32_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINCL0X32_P4

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

`define C12T28SOIDV_LLV_LSINCL0X32_P4_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSINCL0X32_P4_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSINCL0X32_P4_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSINCL0X32_P4_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_LSINCL0X32_P4 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_LSINCL0X32_P4_A_R_Z_R_0,`C12T28SOIDV_LLV_LSINCL0X32_P4_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_LSINCL0X32_P4_R_F_Z_R_1,`C12T28SOIDV_LLV_LSINCL0X32_P4_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_LSINCL0X32_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINCL0X32_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINCL0X32_P10

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

`define C12T28SOIDV_LLV_LSINCL0X32_P10_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSINCL0X32_P10_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSINCL0X32_P10_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSINCL0X32_P10_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_LSINCL0X32_P10 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_LSINCL0X32_P10_A_R_Z_R_0,`C12T28SOIDV_LLV_LSINCL0X32_P10_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_LSINCL0X32_P10_R_F_Z_R_1,`C12T28SOIDV_LLV_LSINCL0X32_P10_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_LSINCL0X32_P10

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINCL0X32_P16
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINCL0X32_P16

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

`define C12T28SOIDV_LLV_LSINCL0X32_P16_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSINCL0X32_P16_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSINCL0X32_P16_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSINCL0X32_P16_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_LSINCL0X32_P16 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_LSINCL0X32_P16_A_R_Z_R_0,`C12T28SOIDV_LLV_LSINCL0X32_P16_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_LSINCL0X32_P16_R_F_Z_R_1,`C12T28SOIDV_LLV_LSINCL0X32_P16_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_LSINCL0X32_P16

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINCL1X32_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINCL1X32_P0

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

`define C12T28SOIDV_LLV_LSINCL1X32_P0_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSINCL1X32_P0_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSINCL1X32_P0_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSINCL1X32_P0_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_LSINCL1X32_P0 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_LSINCL1X32_P0_A_R_Z_R_0,`C12T28SOIDV_LLV_LSINCL1X32_P0_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_LSINCL1X32_P0_S_R_Z_R_0,`C12T28SOIDV_LLV_LSINCL1X32_P0_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_LSINCL1X32_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINCL1X32_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINCL1X32_P4

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

`define C12T28SOIDV_LLV_LSINCL1X32_P4_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSINCL1X32_P4_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSINCL1X32_P4_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSINCL1X32_P4_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_LSINCL1X32_P4 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_LSINCL1X32_P4_A_R_Z_R_0,`C12T28SOIDV_LLV_LSINCL1X32_P4_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_LSINCL1X32_P4_S_R_Z_R_0,`C12T28SOIDV_LLV_LSINCL1X32_P4_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_LSINCL1X32_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINCL1X32_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINCL1X32_P10

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

`define C12T28SOIDV_LLV_LSINCL1X32_P10_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSINCL1X32_P10_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSINCL1X32_P10_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSINCL1X32_P10_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_LSINCL1X32_P10 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_LSINCL1X32_P10_A_R_Z_R_0,`C12T28SOIDV_LLV_LSINCL1X32_P10_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_LSINCL1X32_P10_S_R_Z_R_0,`C12T28SOIDV_LLV_LSINCL1X32_P10_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_LSINCL1X32_P10

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINCL1X32_P16
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINCL1X32_P16

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

`define C12T28SOIDV_LLV_LSINCL1X32_P16_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSINCL1X32_P16_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSINCL1X32_P16_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSINCL1X32_P16_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_LSINCL1X32_P16 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_LSINCL1X32_P16_A_R_Z_R_0,`C12T28SOIDV_LLV_LSINCL1X32_P16_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_LSINCL1X32_P16_S_R_Z_R_0,`C12T28SOIDV_LLV_LSINCL1X32_P16_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_LSINCL1X32_P16

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINRETX32_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINRETX32_P0

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

`define C12T28SOIDV_LLV_LSINRETX32_P0_A_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSINRETX32_P0_A_F_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSINRETX32_P0_G_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSINRETX32_P0_G_R_Z_F_0 0.1

module C12T28SOIDV_LLV_LSINRETX32_P0 (Z, A, G);

        output Z;
        input A;
        input G;

`ifdef functional
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

`else
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

        specify

                if (G) (A +=> Z) = (`C12T28SOIDV_LLV_LSINRETX32_P0_A_R_Z_R_1,`C12T28SOIDV_LLV_LSINRETX32_P0_A_F_Z_F_1);
                (posedge G => (Z +: A)) = (`C12T28SOIDV_LLV_LSINRETX32_P0_G_R_Z_R_1,`C12T28SOIDV_LLV_LSINRETX32_P0_G_R_Z_F_0);

        endspecify

`endif

endmodule // C12T28SOIDV_LLV_LSINRETX32_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINRETX32_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINRETX32_P4

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

`define C12T28SOIDV_LLV_LSINRETX32_P4_A_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSINRETX32_P4_A_F_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSINRETX32_P4_G_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSINRETX32_P4_G_R_Z_F_0 0.1

module C12T28SOIDV_LLV_LSINRETX32_P4 (Z, A, G);

        output Z;
        input A;
        input G;

`ifdef functional
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

`else
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

        specify

                if (G) (A +=> Z) = (`C12T28SOIDV_LLV_LSINRETX32_P4_A_R_Z_R_1,`C12T28SOIDV_LLV_LSINRETX32_P4_A_F_Z_F_1);
                (posedge G => (Z +: A)) = (`C12T28SOIDV_LLV_LSINRETX32_P4_G_R_Z_R_1,`C12T28SOIDV_LLV_LSINRETX32_P4_G_R_Z_F_0);

        endspecify

`endif

endmodule // C12T28SOIDV_LLV_LSINRETX32_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINRETX32_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINRETX32_P10

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

`define C12T28SOIDV_LLV_LSINRETX32_P10_A_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSINRETX32_P10_A_F_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSINRETX32_P10_G_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSINRETX32_P10_G_R_Z_F_0 0.1

module C12T28SOIDV_LLV_LSINRETX32_P10 (Z, A, G);

        output Z;
        input A;
        input G;

`ifdef functional
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

`else
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

        specify

                if (G) (A +=> Z) = (`C12T28SOIDV_LLV_LSINRETX32_P10_A_R_Z_R_1,`C12T28SOIDV_LLV_LSINRETX32_P10_A_F_Z_F_1);
                (posedge G => (Z +: A)) = (`C12T28SOIDV_LLV_LSINRETX32_P10_G_R_Z_R_1,`C12T28SOIDV_LLV_LSINRETX32_P10_G_R_Z_F_0);

        endspecify

`endif

endmodule // C12T28SOIDV_LLV_LSINRETX32_P10

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINRETX32_P16
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINRETX32_P16

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

`define C12T28SOIDV_LLV_LSINRETX32_P16_A_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSINRETX32_P16_A_F_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSINRETX32_P16_G_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSINRETX32_P16_G_R_Z_F_0 0.1

module C12T28SOIDV_LLV_LSINRETX32_P16 (Z, A, G);

        output Z;
        input A;
        input G;

`ifdef functional
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

`else
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

        specify

                if (G) (A +=> Z) = (`C12T28SOIDV_LLV_LSINRETX32_P16_A_R_Z_R_1,`C12T28SOIDV_LLV_LSINRETX32_P16_A_F_Z_F_1);
                (posedge G => (Z +: A)) = (`C12T28SOIDV_LLV_LSINRETX32_P16_G_R_Z_R_1,`C12T28SOIDV_LLV_LSINRETX32_P16_G_R_Z_F_0);

        endspecify

`endif

endmodule // C12T28SOIDV_LLV_LSINRETX32_P16

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINX32_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINX32_P0

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

`define C12T28SOIDV_LLV_LSINX32_P0_A_R_Z_R 0.1
`define C12T28SOIDV_LLV_LSINX32_P0_A_F_Z_F 0.1

module C12T28SOIDV_LLV_LSINX32_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;

	specify

		(A +=> Z) = (`C12T28SOIDV_LLV_LSINX32_P0_A_R_Z_R,`C12T28SOIDV_LLV_LSINX32_P0_A_F_Z_F);

	endspecify

endmodule // C12T28SOIDV_LLV_LSINX32_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINX32_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINX32_P4

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

`define C12T28SOIDV_LLV_LSINX32_P4_A_R_Z_R 0.1
`define C12T28SOIDV_LLV_LSINX32_P4_A_F_Z_F 0.1

module C12T28SOIDV_LLV_LSINX32_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;

	specify

		(A +=> Z) = (`C12T28SOIDV_LLV_LSINX32_P4_A_R_Z_R,`C12T28SOIDV_LLV_LSINX32_P4_A_F_Z_F);

	endspecify

endmodule // C12T28SOIDV_LLV_LSINX32_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINX32_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINX32_P10

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

`define C12T28SOIDV_LLV_LSINX32_P10_A_R_Z_R 0.1
`define C12T28SOIDV_LLV_LSINX32_P10_A_F_Z_F 0.1

module C12T28SOIDV_LLV_LSINX32_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;

	specify

		(A +=> Z) = (`C12T28SOIDV_LLV_LSINX32_P10_A_R_Z_R,`C12T28SOIDV_LLV_LSINX32_P10_A_F_Z_F);

	endspecify

endmodule // C12T28SOIDV_LLV_LSINX32_P10

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSINX32_P16
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSINX32_P16

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

`define C12T28SOIDV_LLV_LSINX32_P16_A_R_Z_R 0.1
`define C12T28SOIDV_LLV_LSINX32_P16_A_F_Z_F 0.1

module C12T28SOIDV_LLV_LSINX32_P16 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;

	specify

		(A +=> Z) = (`C12T28SOIDV_LLV_LSINX32_P16_A_R_Z_R,`C12T28SOIDV_LLV_LSINX32_P16_A_F_Z_F);

	endspecify

endmodule // C12T28SOIDV_LLV_LSINX32_P16

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTCL0X32_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTCL0X32_P0

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

`define C12T28SOIDV_LLV_LSOUTCL0X32_P0_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL0X32_P0_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL0X32_P0_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSOUTCL0X32_P0_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_LSOUTCL0X32_P0 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_LSOUTCL0X32_P0_A_R_Z_R_0,`C12T28SOIDV_LLV_LSOUTCL0X32_P0_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_LSOUTCL0X32_P0_R_F_Z_R_1,`C12T28SOIDV_LLV_LSOUTCL0X32_P0_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_LSOUTCL0X32_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTCL0X32_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTCL0X32_P4

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

`define C12T28SOIDV_LLV_LSOUTCL0X32_P4_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL0X32_P4_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL0X32_P4_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSOUTCL0X32_P4_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_LSOUTCL0X32_P4 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_LSOUTCL0X32_P4_A_R_Z_R_0,`C12T28SOIDV_LLV_LSOUTCL0X32_P4_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_LSOUTCL0X32_P4_R_F_Z_R_1,`C12T28SOIDV_LLV_LSOUTCL0X32_P4_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_LSOUTCL0X32_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTCL0X32_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTCL0X32_P10

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

`define C12T28SOIDV_LLV_LSOUTCL0X32_P10_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL0X32_P10_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL0X32_P10_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSOUTCL0X32_P10_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_LSOUTCL0X32_P10 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_LSOUTCL0X32_P10_A_R_Z_R_0,`C12T28SOIDV_LLV_LSOUTCL0X32_P10_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_LSOUTCL0X32_P10_R_F_Z_R_1,`C12T28SOIDV_LLV_LSOUTCL0X32_P10_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_LSOUTCL0X32_P10

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTCL0X32_P16
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTCL0X32_P16

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

`define C12T28SOIDV_LLV_LSOUTCL0X32_P16_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL0X32_P16_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL0X32_P16_R_R_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSOUTCL0X32_P16_R_F_Z_R_1 0.1

module C12T28SOIDV_LLV_LSOUTCL0X32_P16 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C12T28SOIDV_LLV_LSOUTCL0X32_P16_A_R_Z_R_0,`C12T28SOIDV_LLV_LSOUTCL0X32_P16_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C12T28SOIDV_LLV_LSOUTCL0X32_P16_R_F_Z_R_1,`C12T28SOIDV_LLV_LSOUTCL0X32_P16_R_R_Z_F_1);

	endspecify

endmodule // C12T28SOIDV_LLV_LSOUTCL0X32_P16

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTCL1X32_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTCL1X32_P0

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

`define C12T28SOIDV_LLV_LSOUTCL1X32_P0_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL1X32_P0_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL1X32_P0_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL1X32_P0_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_LSOUTCL1X32_P0 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_LSOUTCL1X32_P0_A_R_Z_R_0,`C12T28SOIDV_LLV_LSOUTCL1X32_P0_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_LSOUTCL1X32_P0_S_R_Z_R_0,`C12T28SOIDV_LLV_LSOUTCL1X32_P0_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_LSOUTCL1X32_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTCL1X32_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTCL1X32_P4

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

`define C12T28SOIDV_LLV_LSOUTCL1X32_P4_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL1X32_P4_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL1X32_P4_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL1X32_P4_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_LSOUTCL1X32_P4 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_LSOUTCL1X32_P4_A_R_Z_R_0,`C12T28SOIDV_LLV_LSOUTCL1X32_P4_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_LSOUTCL1X32_P4_S_R_Z_R_0,`C12T28SOIDV_LLV_LSOUTCL1X32_P4_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_LSOUTCL1X32_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTCL1X32_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTCL1X32_P10

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

`define C12T28SOIDV_LLV_LSOUTCL1X32_P10_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL1X32_P10_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL1X32_P10_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL1X32_P10_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_LSOUTCL1X32_P10 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_LSOUTCL1X32_P10_A_R_Z_R_0,`C12T28SOIDV_LLV_LSOUTCL1X32_P10_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_LSOUTCL1X32_P10_S_R_Z_R_0,`C12T28SOIDV_LLV_LSOUTCL1X32_P10_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_LSOUTCL1X32_P10

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTCL1X32_P16
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTCL1X32_P16

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

`define C12T28SOIDV_LLV_LSOUTCL1X32_P16_A_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL1X32_P16_A_F_Z_F_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL1X32_P16_S_R_Z_R_0 0.1
`define C12T28SOIDV_LLV_LSOUTCL1X32_P16_S_F_Z_F_0 0.1

module C12T28SOIDV_LLV_LSOUTCL1X32_P16 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C12T28SOIDV_LLV_LSOUTCL1X32_P16_A_R_Z_R_0,`C12T28SOIDV_LLV_LSOUTCL1X32_P16_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C12T28SOIDV_LLV_LSOUTCL1X32_P16_S_R_Z_R_0,`C12T28SOIDV_LLV_LSOUTCL1X32_P16_S_F_Z_F_0);

	endspecify

endmodule // C12T28SOIDV_LLV_LSOUTCL1X32_P16

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTRETX32_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTRETX32_P0

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

`define C12T28SOIDV_LLV_LSOUTRETX32_P0_A_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSOUTRETX32_P0_A_F_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSOUTRETX32_P0_G_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSOUTRETX32_P0_G_R_Z_F_0 0.1

module C12T28SOIDV_LLV_LSOUTRETX32_P0 (Z, A, G);

        output Z;
        input A;
        input G;

`ifdef functional
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

`else
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

        specify

                if (G) (A +=> Z) = (`C12T28SOIDV_LLV_LSOUTRETX32_P0_A_R_Z_R_1,`C12T28SOIDV_LLV_LSOUTRETX32_P0_A_F_Z_F_1);
                 (posedge G => (Z +: A)) = (`C12T28SOIDV_LLV_LSOUTRETX32_P0_G_R_Z_R_1,`C12T28SOIDV_LLV_LSOUTRETX32_P0_G_R_Z_F_0);
        endspecify

`endif

endmodule // C12T28SOIDV_LLV_LSOUTRETX32_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTRETX32_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTRETX32_P4

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

`define C12T28SOIDV_LLV_LSOUTRETX32_P4_A_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSOUTRETX32_P4_A_F_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSOUTRETX32_P4_G_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSOUTRETX32_P4_G_R_Z_F_0 0.1

module C12T28SOIDV_LLV_LSOUTRETX32_P4 (Z, A, G);

        output Z;
        input A;
        input G;

`ifdef functional
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

`else
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

        specify

                if (G) (A +=> Z) = (`C12T28SOIDV_LLV_LSOUTRETX32_P4_A_R_Z_R_1,`C12T28SOIDV_LLV_LSOUTRETX32_P4_A_F_Z_F_1);
                 (posedge G => (Z +: A)) = (`C12T28SOIDV_LLV_LSOUTRETX32_P4_G_R_Z_R_1,`C12T28SOIDV_LLV_LSOUTRETX32_P4_G_R_Z_F_0);
        endspecify

`endif

endmodule // C12T28SOIDV_LLV_LSOUTRETX32_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTRETX32_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTRETX32_P10

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

`define C12T28SOIDV_LLV_LSOUTRETX32_P10_A_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSOUTRETX32_P10_A_F_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSOUTRETX32_P10_G_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSOUTRETX32_P10_G_R_Z_F_0 0.1

module C12T28SOIDV_LLV_LSOUTRETX32_P10 (Z, A, G);

        output Z;
        input A;
        input G;

`ifdef functional
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

`else
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

        specify

                if (G) (A +=> Z) = (`C12T28SOIDV_LLV_LSOUTRETX32_P10_A_R_Z_R_1,`C12T28SOIDV_LLV_LSOUTRETX32_P10_A_F_Z_F_1);
                 (posedge G => (Z +: A)) = (`C12T28SOIDV_LLV_LSOUTRETX32_P10_G_R_Z_R_1,`C12T28SOIDV_LLV_LSOUTRETX32_P10_G_R_Z_F_0);
        endspecify

`endif

endmodule // C12T28SOIDV_LLV_LSOUTRETX32_P10

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTRETX32_P16
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTRETX32_P16

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

`define C12T28SOIDV_LLV_LSOUTRETX32_P16_A_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSOUTRETX32_P16_A_F_Z_F_1 0.1
`define C12T28SOIDV_LLV_LSOUTRETX32_P16_G_R_Z_R_1 0.1
`define C12T28SOIDV_LLV_LSOUTRETX32_P16_G_R_Z_F_0 0.1

module C12T28SOIDV_LLV_LSOUTRETX32_P16 (Z, A, G);

        output Z;
        input A;
        input G;

`ifdef functional
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

`else
        reg  NOTIFIER;
        C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

        specify

                if (G) (A +=> Z) = (`C12T28SOIDV_LLV_LSOUTRETX32_P16_A_R_Z_R_1,`C12T28SOIDV_LLV_LSOUTRETX32_P16_A_F_Z_F_1);
                 (posedge G => (Z +: A)) = (`C12T28SOIDV_LLV_LSOUTRETX32_P16_G_R_Z_R_1,`C12T28SOIDV_LLV_LSOUTRETX32_P16_G_R_Z_F_0);
        endspecify

`endif

endmodule // C12T28SOIDV_LLV_LSOUTRETX32_P16

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTX32_P0
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTX32_P0

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

`define C12T28SOIDV_LLV_LSOUTX32_P0_A_R_Z_R 0.1
`define C12T28SOIDV_LLV_LSOUTX32_P0_A_F_Z_F 0.1

module C12T28SOIDV_LLV_LSOUTX32_P0 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;

	specify

		(A +=> Z) = (`C12T28SOIDV_LLV_LSOUTX32_P0_A_R_Z_R,`C12T28SOIDV_LLV_LSOUTX32_P0_A_F_Z_F);

	endspecify

endmodule // C12T28SOIDV_LLV_LSOUTX32_P0

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTX32_P4
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTX32_P4

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

`define C12T28SOIDV_LLV_LSOUTX32_P4_A_R_Z_R 0.1
`define C12T28SOIDV_LLV_LSOUTX32_P4_A_F_Z_F 0.1

module C12T28SOIDV_LLV_LSOUTX32_P4 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;

	specify

		(A +=> Z) = (`C12T28SOIDV_LLV_LSOUTX32_P4_A_R_Z_R,`C12T28SOIDV_LLV_LSOUTX32_P4_A_F_Z_F);

	endspecify

endmodule // C12T28SOIDV_LLV_LSOUTX32_P4

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTX32_P10
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTX32_P10

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

`define C12T28SOIDV_LLV_LSOUTX32_P10_A_R_Z_R 0.1
`define C12T28SOIDV_LLV_LSOUTX32_P10_A_F_Z_F 0.1

module C12T28SOIDV_LLV_LSOUTX32_P10 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;

	specify

		(A +=> Z) = (`C12T28SOIDV_LLV_LSOUTX32_P10_A_R_Z_R,`C12T28SOIDV_LLV_LSOUTX32_P10_A_F_Z_F);

	endspecify

endmodule // C12T28SOIDV_LLV_LSOUTX32_P10

`endcelldefine

// Verilog model view for C12T28SOIDV_LLV_LSOUTX32_P16
// STMicroelectronics TRND/CCDS
// Cell C12T28SOIDV_LLV_LSOUTX32_P16

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

`define C12T28SOIDV_LLV_LSOUTX32_P16_A_R_Z_R 0.1
`define C12T28SOIDV_LLV_LSOUTX32_P16_A_F_Z_F 0.1

module C12T28SOIDV_LLV_LSOUTX32_P16 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;

	specify

		(A +=> Z) = (`C12T28SOIDV_LLV_LSOUTX32_P16_A_R_Z_R,`C12T28SOIDV_LLV_LSOUTX32_P16_A_F_Z_F);

	endspecify

endmodule // C12T28SOIDV_LLV_LSOUTX32_P16

`endcelldefine



primitive C28SOI_SC_12_SHIFT_LL_U_LD_P_NOTI (Q, D, G, NOTI_REG);
 
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
