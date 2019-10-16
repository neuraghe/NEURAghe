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
//              Verilog models for the C28SOI_SC_8_COREPBP16_LR.CMOS028SOI
//                    (C28SOI_SC_8_COREPBP16_LR   release 3.0.0)
// 
//
//--------------------------------------------------------------------------------
// 
//Date            : Sat Oct 18 08:06:52 2014
// 
//Copyright       : STMicroelectronics N.V. 2014
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

// Verilog model view for C8T28SOI_LR_AND2X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AND2X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AND2X10_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AND2X10_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_AND2X11_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_AND2X11_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_AND2X11_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_AND2X11_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AND2X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AND2X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AND2X19_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AND2X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AND2X24_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AND2X24_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AND2X24_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AND2X24_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AND2X29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AND2X29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AND2X29_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AND2X29_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AND2X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AND2X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AND2X5_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AND2X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AND3X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AND3X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AND3X10_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AND3X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AND3X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AND3X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AND3X14_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AND3X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AND3X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AND3X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AND3X19_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AND3X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AND3X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AND3X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AND3X5_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AND3X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AND4X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AND4X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AND4X10_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (Z, A, B, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AND4X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AND4X13_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AND4X13_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AND4X13_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (Z, A, B, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AND4X13_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AND4X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AND4X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AND4X2_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (Z, A, B, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AND4X2_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AND4X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AND4X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AND4X3_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (Z, A, B, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AND4X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO112X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO112X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO112X10_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL1, A, B) ;
	or    U2 (Z, INTERNAL1, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO112X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO112X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO112X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO112X19_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL1, A, B) ;
	or    U2 (Z, INTERNAL1, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO112X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO112X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO112X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO112X5_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL1, A, B) ;
	or    U2 (Z, INTERNAL1, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO112X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO12X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO12X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO12X10_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B) ;
	or    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO12X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO12X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO12X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO12X19_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B) ;
	or    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO12X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO12X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO12X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO12X5_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B) ;
	or    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO12X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO212X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO212X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO212X10_P16 (Z, A, B, C, D, E);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	
	and    U1 (INTERNAL1, A, B) ;
	and    U2 (INTERNAL2, C, D) ;
	or    U3 (Z, INTERNAL1, INTERNAL2, E) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D && !E) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && !E) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D) (E +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO212X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO212X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO212X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO212X19_P16 (Z, A, B, C, D, E);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	
	and    U1 (INTERNAL1, A, B) ;
	and    U2 (INTERNAL2, C, D) ;
	or    U3 (Z, INTERNAL1, INTERNAL2, E) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D && !E) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && !E) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D) (E +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO212X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO212X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO212X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO212X5_P16 (Z, A, B, C, D, E);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	
	and    U1 (INTERNAL1, A, B) ;
	and    U2 (INTERNAL2, C, D) ;
	or    U3 (Z, INTERNAL1, INTERNAL2, E) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D && !E) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && !E) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D) (E +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO212X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO21X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO21X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO21X10_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B) ;
	or    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO21X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO21X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO21X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO21X14_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B) ;
	or    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO21X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO21X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO21X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO21X19_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B) ;
	or    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO21X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO21X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO21X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO21X5_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B) ;
	or    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO21X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO222X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO222X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO222X10_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	and    U1 (INTERNAL1, A, B) ;
	and    U2 (INTERNAL2, C, D) ;
	and    U3 (INTERNAL3, E, F) ;
	or    U4 (Z, INTERNAL1, INTERNAL2, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && !D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && !E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && E) (F +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO222X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO222X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO222X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO222X19_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	and    U1 (INTERNAL1, A, B) ;
	and    U2 (INTERNAL2, C, D) ;
	and    U3 (INTERNAL3, E, F) ;
	or    U4 (Z, INTERNAL1, INTERNAL2, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && !D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && !E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && E) (F +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO222X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO222X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO222X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO222X2_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	and    U1 (INTERNAL1, A, B) ;
	and    U2 (INTERNAL2, C, D) ;
	and    U3 (INTERNAL3, E, F) ;
	or    U4 (Z, INTERNAL1, INTERNAL2, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && !D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && !E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && E) (F +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO222X2_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO222X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO222X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO222X5_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	and    U1 (INTERNAL1, A, B) ;
	and    U2 (INTERNAL2, C, D) ;
	and    U3 (INTERNAL3, E, F) ;
	or    U4 (Z, INTERNAL1, INTERNAL2, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && !D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && !E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && E) (F +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO222X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO22X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO22X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO22X10_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL1, A, B) ;
	and    U2 (INTERNAL2, C, D) ;
	or    U3 (Z, INTERNAL1, INTERNAL2) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO22X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO22X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO22X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO22X14_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL1, A, B) ;
	and    U2 (INTERNAL2, C, D) ;
	or    U3 (Z, INTERNAL1, INTERNAL2) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO22X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO22X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO22X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO22X19_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL1, A, B) ;
	and    U2 (INTERNAL2, C, D) ;
	or    U3 (Z, INTERNAL1, INTERNAL2) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO22X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AO22X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AO22X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AO22X5_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL1, A, B) ;
	and    U2 (INTERNAL2, C, D) ;
	or    U3 (Z, INTERNAL1, INTERNAL2) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AO22X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI112X20_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI112X20_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI112X20_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI112X20_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI112X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI112X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI112X3_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI112X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI12X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI12X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI12X10_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI12X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI12X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI12X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI12X19_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI12X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI12X25_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI12X25_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI12X25_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI12X25_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI12X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI12X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI12X3_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI12X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI13X17_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI13X17_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI13X17_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B, C) ;
	or    U2 (INTERNAL1, INTERNAL2, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI13X17_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI13X22_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI13X22_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI13X22_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B, C) ;
	or    U2 (INTERNAL1, INTERNAL2, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI13X22_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI13X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI13X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI13X3_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B, C) ;
	or    U2 (INTERNAL1, INTERNAL2, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI13X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI211X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI211X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI211X10_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI211X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI211X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI211X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI211X19_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI211X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI211X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI211X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI211X2_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI211X2_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI21X12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI21X12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI21X12_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI21X12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI21X25_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI21X25_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI21X25_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI21X25_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI21X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI21X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI21X3_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI21X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI21X6_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI21X6_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI21X6_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI21X6_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI21X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI21X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI21X9_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI21X9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI222X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI222X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI222X2_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	and    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL3, C, D) ;
	and    U3 (INTERNAL4, E, F) ;
	or    U4 (INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	not    U5 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && !D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && !E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && E) (F -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI222X2_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI222X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI222X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI222X5_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	and    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL3, C, D) ;
	and    U3 (INTERNAL4, E, F) ;
	or    U4 (INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	not    U5 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && !D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && !E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && E) (F -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI222X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI222X7_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI222X7_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI222X7_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	and    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL3, C, D) ;
	and    U3 (INTERNAL4, E, F) ;
	or    U4 (INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	not    U5 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && !D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && !E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && E) (F -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI222X7_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI222X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI222X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI222X9_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	and    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL3, C, D) ;
	and    U3 (INTERNAL4, E, F) ;
	or    U4 (INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	not    U5 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && !D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && C && !D && !E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && !E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D && !E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && !E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D && !E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && !E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C && !D && E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C && !D && E) (F -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI222X9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI22X12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI22X12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI22X12_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL3, C, D) ;
	or    U3 (INTERNAL1, INTERNAL2, INTERNAL3) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI22X12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI22X24_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI22X24_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI22X24_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL3, C, D) ;
	or    U3 (INTERNAL1, INTERNAL2, INTERNAL3) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI22X24_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI22X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI22X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI22X2_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL3, C, D) ;
	or    U3 (INTERNAL1, INTERNAL2, INTERNAL3) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI22X2_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI22X6_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI22X6_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI22X6_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL3, C, D) ;
	or    U3 (INTERNAL1, INTERNAL2, INTERNAL3) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI22X6_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_AOI22X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_AOI22X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_AOI22X9_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL3, C, D) ;
	or    U3 (INTERNAL1, INTERNAL2, INTERNAL3) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && !C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_AOI22X9_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_BFX11_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_BFX11_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_BFX11_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_BFX11_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_BFX13_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_BFX13_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_BFX13_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_BFX13_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_BFX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_BFX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_BFX19_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_BFX19_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_BFX23_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_BFX23_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_BFX23_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_BFX23_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_BFX24_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_BFX24_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_BFX24_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_BFX24_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_BFX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_BFX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_BFX29_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_BFX29_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_BFX2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_BFX2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_BFX2_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_BFX2_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_BFX34_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_BFX34_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_BFX34_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_BFX34_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_BFX38_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_BFX38_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_BFX38_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_BFX38_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_BFX46_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_BFX46_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_BFX46_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_BFX46_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_BFX57_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_BFX57_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_BFX57_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_BFX57_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_BFX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_BFX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_BFX5_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_BFX5_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_BFX68_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_BFX68_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_BFX68_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_BFX68_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_BFX91_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_BFX91_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_BFX91_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_BFX91_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_BFX9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_BFX9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_BFX9_P16 (Z, A);
	
	output Z;
	input A;
	
	buf    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_BFX9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CB4I1X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CB4I1X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CB4I1X10_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	and    U3 (Z, INTERNAL1, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CB4I1X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CB4I1X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CB4I1X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CB4I1X14_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	and    U3 (Z, INTERNAL1, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CB4I1X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CB4I1X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CB4I1X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CB4I1X19_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	and    U3 (Z, INTERNAL1, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CB4I1X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CB4I1X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CB4I1X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CB4I1X5_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL1, INTERNAL2, C) ;
	and    U3 (Z, INTERNAL1, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CB4I1X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CBI4I6X12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CBI4I6X12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CBI4I6X12_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL3, A, B) ;
	and    U2 (INTERNAL2, INTERNAL3, C) ;
	or    U3 (INTERNAL1, INTERNAL2, D) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CBI4I6X12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CBI4I6X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CBI4I6X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CBI4I6X3_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL3, A, B) ;
	and    U2 (INTERNAL2, INTERNAL3, C) ;
	or    U3 (INTERNAL1, INTERNAL2, D) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CBI4I6X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CBI4I6X6_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CBI4I6X6_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CBI4I6X6_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL3, A, B) ;
	and    U2 (INTERNAL2, INTERNAL3, C) ;
	or    U3 (INTERNAL1, INTERNAL2, D) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CBI4I6X6_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CBI4I6X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CBI4I6X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CBI4I6X9_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL3, A, B) ;
	and    U2 (INTERNAL2, INTERNAL3, C) ;
	or    U3 (INTERNAL1, INTERNAL2, D) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CBI4I6X9_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_DFPQX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_DFPQX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_DFPQX10_P16 (Q, D, CP);
	
	output Q;
	input D;
	input CP;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U1 (IQ, D, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U2 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U1 (IQ, dD, dCP , NOTIFIER) ;
	buf    U2 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: D)) = (tDELAY,tDELAY);

		$setuphold(posedge CP, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);

		$width(negedge CP, tPULSE, 0, NOTIFIER);
		$width(posedge CP, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_DFPQX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_DFPQX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_DFPQX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_DFPQX19_P16 (Q, D, CP);
	
	output Q;
	input D;
	input CP;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U1 (IQ, D, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U2 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U1 (IQ, dD, dCP , NOTIFIER) ;
	buf    U2 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: D)) = (tDELAY,tDELAY);

		$setuphold(posedge CP, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);

		$width(negedge CP, tPULSE, 0, NOTIFIER);
		$width(posedge CP, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_DFPQX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_DFPRQX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_DFPRQX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_DFPRQX10_P16 (Q, D, CP, RN);
	
	output Q;
	input D;
	input CP;
	input RN;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U1 (IQ, D, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U2 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U1 (IQ, dD, dCP, dRN , NOTIFIER) ;
	buf    U2 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: D)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dRN, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dRN, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);

		$recrem(posedge RN, posedge CP &&& D, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& RN, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& RN, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_DFPRQX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_DFPRQX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_DFPRQX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_DFPRQX19_P16 (Q, D, CP, RN);
	
	output Q;
	input D;
	input CP;
	input RN;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U1 (IQ, D, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U2 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U1 (IQ, dD, dCP, dRN , NOTIFIER) ;
	buf    U2 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: D)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dRN, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dRN, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);

		$recrem(posedge RN, posedge CP &&& D, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& RN, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& RN, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_DFPRQX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_DFPSQX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_DFPSQX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_DFPSQX10_P16 (Q, D, CP, SN);
	
	output Q;
	input D;
	input CP;
	input SN;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U1 (IQ, D, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U2 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U1 (IQ, dD, dCP, dSN , NOTIFIER) ;
	buf    U2 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: D)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dSN, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dSN, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);

		$recrem(posedge SN, posedge CP &&& DX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& SN, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& SN, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_DFPSQX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_DFPSQX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_DFPSQX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_DFPSQX19_P16 (Q, D, CP, SN);
	
	output Q;
	input D;
	input CP;
	input SN;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U1 (IQ, D, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U2 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U1 (IQ, dD, dCP, dSN , NOTIFIER) ;
	buf    U2 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: D)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dSN, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dSN, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);

		$recrem(posedge SN, posedge CP &&& DX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& SN, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& SN, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_DFPSQX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_FA1X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_FA1X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_FA1X14_P16 (S0, CO, A0, B0, CI);
	
	output S0;
	output CO;
	input A0;
	input B0;
	input CI;
	
	xor    U1 (S0, A0, B0, CI) ;
	or    U2 (INTERNAL2, A0, B0) ;
	and    U3 (INTERNAL1, INTERNAL2, CI) ;
	and    U4 (INTERNAL3, A0, B0) ;
	or    U5 (CO, INTERNAL1, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B0 && !CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (B0 && !CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && !CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (B0 && CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !B0) (CI +=> S0) = (tDELAY,tDELAY);
		if (A0 && B0) (CI +=> S0) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_FA1X14_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS1_FA1X18_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS1_FA1X18_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS1_FA1X18_P16 (S0, CO, A0, B0, CI);
	
	output S0;
	output CO;
	input A0;
	input B0;
	input CI;
	
	xor    U1 (S0, A0, B0, CI) ;
	or    U2 (INTERNAL2, A0, B0) ;
	and    U3 (INTERNAL1, INTERNAL2, CI) ;
	and    U4 (INTERNAL3, A0, B0) ;
	or    U5 (CO, INTERNAL1, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B0 && !CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (B0 && !CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && !CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (B0 && CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !B0) (CI +=> S0) = (tDELAY,tDELAY);
		if (A0 && B0) (CI +=> S0) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS1_FA1X18_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_FA1X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_FA1X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_FA1X19_P16 (S0, CO, A0, B0, CI);
	
	output S0;
	output CO;
	input A0;
	input B0;
	input CI;
	
	xor    U1 (S0, A0, B0, CI) ;
	or    U2 (INTERNAL2, A0, B0) ;
	and    U3 (INTERNAL1, INTERNAL2, CI) ;
	and    U4 (INTERNAL3, A0, B0) ;
	or    U5 (CO, INTERNAL1, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B0 && !CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (B0 && !CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && !CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (B0 && CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !B0) (CI +=> S0) = (tDELAY,tDELAY);
		if (A0 && B0) (CI +=> S0) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_FA1X19_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS1_FA1X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS1_FA1X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS1_FA1X4_P16 (S0, CO, A0, B0, CI);
	
	output S0;
	output CO;
	input A0;
	input B0;
	input CI;
	
	xor    U1 (S0, A0, B0, CI) ;
	or    U2 (INTERNAL2, A0, B0) ;
	and    U3 (INTERNAL1, INTERNAL2, CI) ;
	and    U4 (INTERNAL3, A0, B0) ;
	or    U5 (CO, INTERNAL1, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B0 && !CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (B0 && !CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && !CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (B0 && CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !B0) (CI +=> S0) = (tDELAY,tDELAY);
		if (A0 && B0) (CI +=> S0) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS1_FA1X4_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_FA1X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_FA1X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_FA1X5_P16 (S0, CO, A0, B0, CI);
	
	output S0;
	output CO;
	input A0;
	input B0;
	input CI;
	
	xor    U1 (S0, A0, B0, CI) ;
	or    U2 (INTERNAL2, A0, B0) ;
	and    U3 (INTERNAL1, INTERNAL2, CI) ;
	and    U4 (INTERNAL3, A0, B0) ;
	or    U5 (CO, INTERNAL1, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B0 && !CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (B0 && !CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && !CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (B0 && CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !B0) (CI +=> S0) = (tDELAY,tDELAY);
		if (A0 && B0) (CI +=> S0) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_FA1X5_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_FA1X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_FA1X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_FA1X9_P16 (S0, CO, A0, B0, CI);
	
	output S0;
	output CO;
	input A0;
	input B0;
	input CI;
	
	xor    U1 (S0, A0, B0, CI) ;
	or    U2 (INTERNAL2, A0, B0) ;
	and    U3 (INTERNAL1, INTERNAL2, CI) ;
	and    U4 (INTERNAL3, A0, B0) ;
	or    U5 (CO, INTERNAL1, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B0 && !CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (B0 && !CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && !CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (B0 && CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !B0) (CI +=> S0) = (tDELAY,tDELAY);
		if (A0 && B0) (CI +=> S0) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_FA1X9_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS1_FA1X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS1_FA1X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS1_FA1X9_P16 (S0, CO, A0, B0, CI);
	
	output S0;
	output CO;
	input A0;
	input B0;
	input CI;
	
	xor    U1 (S0, A0, B0, CI) ;
	or    U2 (INTERNAL2, A0, B0) ;
	and    U3 (INTERNAL1, INTERNAL2, CI) ;
	and    U4 (INTERNAL3, A0, B0) ;
	or    U5 (CO, INTERNAL1, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B0 && !CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 +=> CO) = (tDELAY,tDELAY);
		if (B0 && !CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && CI) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0 && !CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (B0 && CI) (A0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 +=> CO) = (tDELAY,tDELAY);
		if (A0 && !CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && CI) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && CI) (B0 +=> S0) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI +=> CO) = (tDELAY,tDELAY);
		if (A0 && !B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && B0) (CI -=> S0) = (tDELAY,tDELAY);
		if (!A0 && !B0) (CI +=> S0) = (tDELAY,tDELAY);
		if (A0 && B0) (CI +=> S0) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS1_FA1X9_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS1_HA1X11_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS1_HA1X11_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS1_HA1X11_P16 (S0, CO, A0, B0);
	
	output S0;
	output CO;
	input A0;
	input B0;
	
	xor    U1 (S0, A0, B0) ;
	and    U2 (CO, A0, B0) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B0) (A0 +=> CO) = (tDELAY,tDELAY);
		if (B0) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0) (A0 +=> S0) = (tDELAY,tDELAY);
		if (A0) (B0 +=> CO) = (tDELAY,tDELAY);
		if (A0) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0) (B0 +=> S0) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS1_HA1X11_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_HA1X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_HA1X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_HA1X14_P16 (S0, CO, A0, B0);
	
	output S0;
	output CO;
	input A0;
	input B0;
	
	xor    U1 (S0, A0, B0) ;
	and    U2 (CO, A0, B0) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B0) (A0 +=> CO) = (tDELAY,tDELAY);
		if (B0) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0) (A0 +=> S0) = (tDELAY,tDELAY);
		if (A0) (B0 +=> CO) = (tDELAY,tDELAY);
		if (A0) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0) (B0 +=> S0) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_HA1X14_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_HA1X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_HA1X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_HA1X19_P16 (S0, CO, A0, B0);
	
	output S0;
	output CO;
	input A0;
	input B0;
	
	xor    U1 (S0, A0, B0) ;
	and    U2 (CO, A0, B0) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B0) (A0 +=> CO) = (tDELAY,tDELAY);
		if (B0) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0) (A0 +=> S0) = (tDELAY,tDELAY);
		if (A0) (B0 +=> CO) = (tDELAY,tDELAY);
		if (A0) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0) (B0 +=> S0) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_HA1X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_HA1X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_HA1X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_HA1X5_P16 (S0, CO, A0, B0);
	
	output S0;
	output CO;
	input A0;
	input B0;
	
	xor    U1 (S0, A0, B0) ;
	and    U2 (CO, A0, B0) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B0) (A0 +=> CO) = (tDELAY,tDELAY);
		if (B0) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0) (A0 +=> S0) = (tDELAY,tDELAY);
		if (A0) (B0 +=> CO) = (tDELAY,tDELAY);
		if (A0) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0) (B0 +=> S0) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_HA1X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRS1_HA1X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRS1_HA1X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRS1_HA1X5_P16 (S0, CO, A0, B0);
	
	output S0;
	output CO;
	input A0;
	input B0;
	
	xor    U1 (S0, A0, B0) ;
	and    U2 (CO, A0, B0) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B0) (A0 +=> CO) = (tDELAY,tDELAY);
		if (B0) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0) (A0 +=> S0) = (tDELAY,tDELAY);
		if (A0) (B0 +=> CO) = (tDELAY,tDELAY);
		if (A0) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0) (B0 +=> S0) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRS1_HA1X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_HA1X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_HA1X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_HA1X9_P16 (S0, CO, A0, B0);
	
	output S0;
	output CO;
	input A0;
	input B0;
	
	xor    U1 (S0, A0, B0) ;
	and    U2 (CO, A0, B0) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B0) (A0 +=> CO) = (tDELAY,tDELAY);
		if (B0) (A0 -=> S0) = (tDELAY,tDELAY);
		if (!B0) (A0 +=> S0) = (tDELAY,tDELAY);
		if (A0) (B0 +=> CO) = (tDELAY,tDELAY);
		if (A0) (B0 -=> S0) = (tDELAY,tDELAY);
		if (!A0) (B0 +=> S0) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_HA1X9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_IVX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_IVX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_IVX10_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_IVX10_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_IVX11_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_IVX11_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_IVX11_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_IVX11_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_IVX14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_IVX14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_IVX14_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_IVX14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_IVX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_IVX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_IVX19_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_IVX19_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_IVX23_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_IVX23_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_IVX23_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_IVX23_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_IVX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_IVX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_IVX29_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_IVX29_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_IVX2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_IVX2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_IVX2_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_IVX2_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_IVX34_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_IVX34_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_IVX34_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_IVX34_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_IVX34_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_IVX34_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_IVX34_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_IVX34_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_IVX38_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_IVX38_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_IVX38_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_IVX38_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_IVX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_IVX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_IVX3_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_IVX3_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_IVX46_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_IVX46_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_IVX46_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_IVX46_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_IVX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_IVX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_IVX5_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_IVX5_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_IVX68_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_IVX68_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_IVX68_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_IVX68_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_IVX91_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_IVX91_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_IVX91_P16 (Z, A);
	
	output Z;
	input A;
	
	not    U1 (Z, A) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_IVX91_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_LDHQNX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_LDHQNX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_LDHQNX10_P16 (QN, D, G);
	
	output QN;
	input D;
	input G;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U1 (IQ, D, G , NOTIFIER) ;
	not   #(`st_delay_seq) U2 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U1 (IQ, dD, dG , NOTIFIER) ;
	not    U2 (QN, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (G) (D -=> QN) = (tDELAY,tDELAY);
		(posedge G => (QN -: D)) = (tDELAY,tDELAY);

		$setuphold(negedge G, posedge D, tSETUP, tHOLD, NOTIFIER, , , dG, dD);
		$setuphold(negedge G, negedge D, tSETUP, tHOLD, NOTIFIER, , , dG, dD);

		$width(posedge G, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_LDHQNX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_LDHQX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_LDHQX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_LDHQX19_P16 (Q, D, G);
	
	output Q;
	input D;
	input G;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U1 (IQ, D, G , NOTIFIER) ;
	buf   #(`st_delay_seq) U2 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U1 (IQ, dD, dG , NOTIFIER) ;
	buf    U2 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (G) (D +=> Q) = (tDELAY,tDELAY);
		(posedge G => (Q +: D)) = (tDELAY,tDELAY);

		$setuphold(negedge G, posedge D, tSETUP, tHOLD, NOTIFIER, , , dG, dD);
		$setuphold(negedge G, negedge D, tSETUP, tHOLD, NOTIFIER, , , dG, dD);

		$width(posedge G, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_LDHQX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_LDHQX28_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_LDHQX28_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_LDHQX28_P16 (Q, D, G);
	
	output Q;
	input D;
	input G;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U1 (IQ, D, G , NOTIFIER) ;
	buf   #(`st_delay_seq) U2 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U1 (IQ, dD, dG , NOTIFIER) ;
	buf    U2 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (G) (D +=> Q) = (tDELAY,tDELAY);
		(posedge G => (Q +: D)) = (tDELAY,tDELAY);

		$setuphold(negedge G, posedge D, tSETUP, tHOLD, NOTIFIER, , , dG, dD);
		$setuphold(negedge G, negedge D, tSETUP, tHOLD, NOTIFIER, , , dG, dD);

		$width(posedge G, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_LDHQX28_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_LDHQX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_LDHQX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_LDHQX5_P16 (Q, D, G);
	
	output Q;
	input D;
	input G;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U1 (IQ, D, G , NOTIFIER) ;
	buf   #(`st_delay_seq) U2 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U1 (IQ, dD, dG , NOTIFIER) ;
	buf    U2 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (G) (D +=> Q) = (tDELAY,tDELAY);
		(posedge G => (Q +: D)) = (tDELAY,tDELAY);

		$setuphold(negedge G, posedge D, tSETUP, tHOLD, NOTIFIER, , , dG, dD);
		$setuphold(negedge G, negedge D, tSETUP, tHOLD, NOTIFIER, , , dG, dD);

		$width(posedge G, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_LDHQX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_LDHQX9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_LDHQX9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_LDHQX9_P16 (Q, D, G);
	
	output Q;
	input D;
	input G;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U1 (IQ, D, G , NOTIFIER) ;
	buf   #(`st_delay_seq) U2 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U1 (IQ, dD, dG , NOTIFIER) ;
	buf    U2 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (G) (D +=> Q) = (tDELAY,tDELAY);
		(posedge G => (Q +: D)) = (tDELAY,tDELAY);

		$setuphold(negedge G, posedge D, tSETUP, tHOLD, NOTIFIER, , , dG, dD);
		$setuphold(negedge G, negedge D, tSETUP, tHOLD, NOTIFIER, , , dG, dD);

		$width(posedge G, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_LDHQX9_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_LDLQX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_LDLQX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_LDLQX19_P16 (Q, D, GN);
	
	output Q;
	input D;
	input GN;
	
   `ifdef functional
	reg  NOTIFIER;
	not    U1 (INTERNAL1, GN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U2 (IQ, D, INTERNAL1 , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	not    U1 (INTERNAL1, dGN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U2 (IQ, dD, INTERNAL1 , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (!GN) (D +=> Q) = (tDELAY,tDELAY);
		(negedge GN => (Q +: D)) = (tDELAY,tDELAY);

		$setuphold(posedge GN, posedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);
		$setuphold(posedge GN, negedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);

		$width(negedge GN, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_LDLQX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_LDLQX28_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_LDLQX28_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_LDLQX28_P16 (Q, D, GN);
	
	output Q;
	input D;
	input GN;
	
   `ifdef functional
	reg  NOTIFIER;
	not    U1 (INTERNAL1, GN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U2 (IQ, D, INTERNAL1 , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	not    U1 (INTERNAL1, dGN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U2 (IQ, dD, INTERNAL1 , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (!GN) (D +=> Q) = (tDELAY,tDELAY);
		(negedge GN => (Q +: D)) = (tDELAY,tDELAY);

		$setuphold(posedge GN, posedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);
		$setuphold(posedge GN, negedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);

		$width(negedge GN, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_LDLQX28_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_LDLQX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_LDLQX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_LDLQX5_P16 (Q, D, GN);
	
	output Q;
	input D;
	input GN;
	
   `ifdef functional
	reg  NOTIFIER;
	not    U1 (INTERNAL1, GN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U2 (IQ, D, INTERNAL1 , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	not    U1 (INTERNAL1, dGN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U2 (IQ, dD, INTERNAL1 , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (!GN) (D +=> Q) = (tDELAY,tDELAY);
		(negedge GN => (Q +: D)) = (tDELAY,tDELAY);

		$setuphold(posedge GN, posedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);
		$setuphold(posedge GN, negedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);

		$width(negedge GN, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_LDLQX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_LDLQX9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_LDLQX9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_LDLQX9_P16 (Q, D, GN);
	
	output Q;
	input D;
	input GN;
	
   `ifdef functional
	reg  NOTIFIER;
	not    U1 (INTERNAL1, GN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U2 (IQ, D, INTERNAL1 , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	not    U1 (INTERNAL1, dGN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI   U2 (IQ, dD, INTERNAL1 , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (!GN) (D +=> Q) = (tDELAY,tDELAY);
		(negedge GN => (Q +: D)) = (tDELAY,tDELAY);

		$setuphold(posedge GN, posedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);
		$setuphold(posedge GN, negedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);

		$width(negedge GN, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_LDLQX9_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_LDLRQX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_LDLRQX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_LDLRQX19_P16 (Q, D, GN, RN);
	
	output Q;
	input D;
	input GN;
	input RN;
	
   `ifdef functional
	reg  NOTIFIER;
	not    U1 (INTERNAL1, GN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_RN_NOTI   U2 (IQ, D, INTERNAL1, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	not    U1 (INTERNAL1, dGN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_RN_NOTI   U2 (IQ, dD, INTERNAL1, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (!GN && RN) (D +=> Q) = (tDELAY,tDELAY);
		(negedge GN => (Q +: D)) = (tDELAY,tDELAY);
		(posedge RN => (Q +: 1'b1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge GN &&& dRN, posedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);
		$setuphold(posedge GN &&& dRN, negedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);

		$recrem(posedge RN, posedge GN &&& D, tSETUP, tHOLD, NOTIFIER, , , dRN, dGN);

		$width(negedge RN &&& GN, tPULSE, 0, NOTIFIER);
		$width(negedge GN &&& RN, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_LDLRQX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_LDLRQX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_LDLRQX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_LDLRQX5_P16 (Q, D, GN, RN);
	
	output Q;
	input D;
	input GN;
	input RN;
	
   `ifdef functional
	reg  NOTIFIER;
	not    U1 (INTERNAL1, GN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_RN_NOTI   U2 (IQ, D, INTERNAL1, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	not    U1 (INTERNAL1, dGN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_RN_NOTI   U2 (IQ, dD, INTERNAL1, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (!GN && RN) (D +=> Q) = (tDELAY,tDELAY);
		(negedge GN => (Q +: D)) = (tDELAY,tDELAY);
		(posedge RN => (Q +: 1'b1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge GN &&& dRN, posedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);
		$setuphold(posedge GN &&& dRN, negedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);

		$recrem(posedge RN, posedge GN &&& D, tSETUP, tHOLD, NOTIFIER, , , dRN, dGN);

		$width(negedge RN &&& GN, tPULSE, 0, NOTIFIER);
		$width(negedge GN &&& RN, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_LDLRQX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_LDLRQX9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_LDLRQX9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_LDLRQX9_P16 (Q, D, GN, RN);
	
	output Q;
	input D;
	input GN;
	input RN;
	
   `ifdef functional
	reg  NOTIFIER;
	not    U1 (INTERNAL1, GN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_RN_NOTI   U2 (IQ, D, INTERNAL1, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	not    U1 (INTERNAL1, dGN) ;
	C28SOI_SC_8_COREPBP16_LR_U_LD_P_RN_NOTI   U2 (IQ, dD, INTERNAL1, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (!GN && RN) (D +=> Q) = (tDELAY,tDELAY);
		(negedge GN => (Q +: D)) = (tDELAY,tDELAY);
		(posedge RN => (Q +: 1'b1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge GN &&& dRN, posedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);
		$setuphold(posedge GN &&& dRN, negedge D, tSETUP, tHOLD, NOTIFIER, , , dGN, dD);

		$recrem(posedge RN, posedge GN &&& D, tSETUP, tHOLD, NOTIFIER, , , dRN, dGN);

		$width(negedge RN &&& GN, tPULSE, 0, NOTIFIER);
		$width(negedge GN &&& RN, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_LDLRQX9_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_MUX21X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_MUX21X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_MUX21X14_P16 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !S0) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !S0) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && S0) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && S0) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1) (S0 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_MUX21X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_MUX21X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_MUX21X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_MUX21X19_P16 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !S0) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !S0) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && S0) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && S0) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1) (S0 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_MUX21X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_MUX21X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_MUX21X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_MUX21X5_P16 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !S0) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !S0) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && S0) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && S0) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1) (S0 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_MUX21X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_MUX21X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_MUX21X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_MUX21X9_P16 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !S0) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !S0) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && S0) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && S0) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1) (S0 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_MUX21X9_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_MUX41X13_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_MUX41X13_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_MUX41X13_P16 (Z, D0, D1, D2, D3, S0, S1);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U3 (Z, INTERNAL1, INTERNAL2, S1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_MUX41X13_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_MUX41X18_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_MUX41X18_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_MUX41X18_P16 (Z, D0, D1, D2, D3, S0, S1);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U3 (Z, INTERNAL1, INTERNAL2, S1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_MUX41X18_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_MUX41X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_MUX41X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_MUX41X4_P16 (Z, D0, D1, D2, D3, S0, S1);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U3 (Z, INTERNAL1, INTERNAL2, S1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_MUX41X4_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_MUX41X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_MUX41X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_MUX41X9_P16 (Z, D0, D1, D2, D3, S0, S1);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U3 (Z, INTERNAL1, INTERNAL2, S1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && !D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && D3 && !S0 && !S1) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && !D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && D3 && S0 && !S1) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D3 && !S0 && S1) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && S0 && S1) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && !S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && S1) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S0) (S1 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && !S0) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && S0) (S1 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_MUX41X9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_MUXI21X12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_MUXI21X12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_MUXI21X12_P16 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !S0) (D0 -=> Z) = (tDELAY,tDELAY);
		if (D1 && !S0) (D0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && S0) (D1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && S0) (D1 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1) (S0 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_MUXI21X12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_MUXI21X1_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_MUXI21X1_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_MUXI21X1_P16 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !S0) (D0 -=> Z) = (tDELAY,tDELAY);
		if (D1 && !S0) (D0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && S0) (D1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && S0) (D1 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1) (S0 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_MUXI21X1_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_MUXI21X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_MUXI21X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_MUXI21X2_P16 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !S0) (D0 -=> Z) = (tDELAY,tDELAY);
		if (D1 && !S0) (D0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && S0) (D1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && S0) (D1 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1) (S0 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_MUXI21X2_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_MUXI21X6_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_MUXI21X6_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_MUXI21X6_P16 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !S0) (D0 -=> Z) = (tDELAY,tDELAY);
		if (D1 && !S0) (D0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && S0) (D1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && S0) (D1 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1) (S0 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_MUXI21X6_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_MUXI21X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_MUXI21X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_MUXI21X9_P16 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !S0) (D0 -=> Z) = (tDELAY,tDELAY);
		if (D1 && !S0) (D0 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && S0) (D1 -=> Z) = (tDELAY,tDELAY);
		if (D0 && S0) (D1 -=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1) (S0 -=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1) (S0 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_MUXI21X9_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_MX41X15_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_MX41X15_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_MX41X15_P16 (Z, D0, D1, D2, D3, S0, S1, S2, S3);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	input S2;
	input S3;
	
	and    U1 (INTERNAL1, D0, S0) ;
	and    U2 (INTERNAL2, D1, S1) ;
	and    U3 (INTERNAL3, D2, S2) ;
	and    U4 (INTERNAL4, D3, S3) ;
	or    U5 (Z, INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !D2 && !D3 && S0 && S1 && S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && D3 && S0 && !S1 && S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && D3 && S0 && S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && !D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && D3 && S0 && S1 && S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && !D3 && S0 && !S1 && !S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && !S1 && !S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && !S1 && S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && !S1 && S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && S1 && !S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && !D3 && S0 && !S1 && S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && S1 && S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && !D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && D3 && S0 && !S1 && S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && !D3 && S0 && !S1 && !S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && !D3 && S0 && S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && !D3 && S0 && S1 && !S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && D3 && S0 && S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && !D3 && S0 && !S1 && !S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && !D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && !D3 && S0 && !S1 && S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && S0 && S1 && S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && D3 && !S0 && S1 && S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && D3 && S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && !D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && D3 && S0 && S1 && S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && !D3 && !S0 && S1 && !S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && !S0 && S1 && !S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && !S0 && S1 && S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && !S0 && S1 && S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && S0 && S1 && !S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && !D3 && !S0 && S1 && S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && S0 && S1 && S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && !D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && D3 && !S0 && S1 && S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && !D3 && !S0 && S1 && !S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && !D3 && S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && !D3 && S0 && S1 && !S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && D3 && S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && !D3 && !S0 && S1 && !S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && !D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && !D3 && !S0 && S1 && S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && S0 && S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D3 && !S0 && S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D3 && S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D3 && S0 && S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D3 && !S0 && !S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && !S0 && !S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && !S0 && S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && !S0 && S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && S0 && !S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D3 && !S0 && S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && S0 && S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D3 && !S0 && S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D3 && !S0 && !S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D3 && S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D3 && S0 && !S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D3 && S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D3 && !S0 && !S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D3 && !S0 && S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && S0 && S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !S0 && S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && S0 && S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !S0 && !S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && !S0 && !S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && !S0 && S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && !S0 && S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && S0 && !S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !S0 && S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && S0 && S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !S0 && S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !S0 && !S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && S0 && !S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !S0 && !S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !S0 && S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && S1 && S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S1 && S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && S1 && S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S1 && !S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S1 && !S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S1 && S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S1 && S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && S1 && !S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S1 && S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && S1 && S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S1 && S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && !S1 && !S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && S1 && !S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S1 && !S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S1 && S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && S0 && S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && !S0 && S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && S0 && S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S0 && !S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && !S0 && !S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && !S0 && S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && !S0 && S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && S0 && !S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S0 && S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && S0 && S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S0 && S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && !S0 && !S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S0 && !S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S0 && !S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S0 && S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && S0 && S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && !S0 && S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && S0 && S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S0 && !S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && !S0 && !S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && !S0 && S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && !S0 && S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && S0 && !S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S0 && S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && S0 && S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S0 && S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && !S0 && !S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S0 && !S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S0 && !S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S0 && S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S0 && S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && !S0 && S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && S0 && S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && !S0 && !S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && !S0 && !S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && !S0 && S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && !S0 && S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S0 && !S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S0 && S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S0 && S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S0 && S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S0 && !S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && S0 && !S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S0 && !S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S0 && S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_MX41X15_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_MX41X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_MX41X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_MX41X4_P16 (Z, D0, D1, D2, D3, S0, S1, S2, S3);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	input S2;
	input S3;
	
	and    U1 (INTERNAL1, D0, S0) ;
	and    U2 (INTERNAL2, D1, S1) ;
	and    U3 (INTERNAL3, D2, S2) ;
	and    U4 (INTERNAL4, D3, S3) ;
	or    U5 (Z, INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!D1 && !D2 && !D3 && S0 && S1 && S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && D3 && S0 && !S1 && S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && D3 && S0 && S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && !D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && D3 && S0 && S1 && S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && !D3 && S0 && !S1 && !S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && !S1 && !S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && !S1 && S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && !S1 && S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && S1 && !S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && !D3 && S0 && !S1 && S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && !D2 && !D3 && S0 && S1 && S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && !D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && D3 && S0 && !S1 && S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && !D3 && S0 && !S1 && !S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && D2 && D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && !D3 && S0 && S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && !D3 && S0 && S1 && !S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D1 && D2 && D3 && S0 && S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && !D3 && S0 && !S1 && !S2 && S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && !D3 && S0 && !S1 && !S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (D1 && !D2 && !D3 && S0 && !S1 && S2 && !S3) (D0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && S0 && S1 && S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && D3 && !S0 && S1 && S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && D3 && S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && !D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && D3 && S0 && S1 && S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && !D3 && !S0 && S1 && !S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && !S0 && S1 && !S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && !S0 && S1 && S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && !S0 && S1 && S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && S0 && S1 && !S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && !D3 && !S0 && S1 && S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D2 && !D3 && S0 && S1 && S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && !D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && D3 && !S0 && S1 && S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && !D3 && !S0 && S1 && !S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D2 && D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && !D3 && S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && !D3 && S0 && S1 && !S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D2 && D3 && S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && !D3 && !S0 && S1 && !S2 && S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && !D3 && !S0 && S1 && !S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D2 && !D3 && !S0 && S1 && S2 && !S3) (D1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && S0 && S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D3 && !S0 && S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D3 && S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D3 && S0 && S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D3 && !S0 && !S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && !S0 && !S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && !S0 && S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && !S0 && S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && S0 && !S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D3 && !S0 && S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D3 && S0 && S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D3 && !S0 && S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D3 && !S0 && !S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D3 && S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D3 && S0 && !S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D3 && S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D3 && !S0 && !S1 && S2 && S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D3 && !S0 && !S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D3 && !S0 && S1 && S2 && !S3) (D2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && S0 && S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !S0 && S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && S0 && S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !S0 && !S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && !S0 && !S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && !S0 && S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && !S0 && S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && S0 && !S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !S0 && S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && S0 && S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !S0 && S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !S0 && !S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && S0 && !S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !S0 && !S1 && S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !S0 && !S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !S0 && S1 && !S2 && S3) (D3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && S1 && S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S1 && S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && S1 && S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S1 && !S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S1 && !S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S1 && S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && !S1 && S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && S1 && !S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S1 && S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && !D3 && S1 && S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S1 && S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && !S1 && !S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && S1 && !S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S1 && !S2 && S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S1 && !S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S1 && S2 && !S3) (S0 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && S0 && S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && !S0 && S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && S0 && S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S0 && !S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && !S0 && !S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && !S0 && S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && !S0 && S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && S0 && !S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S0 && S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && !D3 && S0 && S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S0 && S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && !S0 && !S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S0 && !S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S0 && !S2 && S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S0 && !S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && !D3 && !S0 && S2 && !S3) (S1 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && S0 && S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && !S0 && S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && S0 && S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && !S0 && !S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && !S0 && !S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && !S0 && S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && !S0 && S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && S0 && !S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S0 && S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && !D3 && S0 && S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S0 && S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && !D3 && !S0 && !S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && !D3 && S0 && !S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S0 && !S1 && S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S0 && !S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && !D3 && !S0 && S1 && !S3) (S2 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S0 && S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && !S0 && S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && D2 && D3 && S0 && S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && !S0 && !S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && !S0 && !S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && !S0 && S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && !S0 && S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S0 && !S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S0 && S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && !D1 && !D2 && D3 && S0 && S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && D2 && D3 && !S0 && S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && !D2 && D3 && !S0 && !S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && D1 && D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && !D2 && D3 && S0 && !S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (!D0 && D1 && D2 && D3 && S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S0 && !S1 && S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S0 && !S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);
		if (D0 && !D1 && !D2 && D3 && !S0 && S1 && !S2) (S3 +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_MX41X4_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NAND2AX17_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NAND2AX17_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NAND2AX17_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	or    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NAND2AX17_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND2AX23_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND2AX23_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND2AX23_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	or    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND2AX23_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NAND2AX27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NAND2AX27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NAND2AX27_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	or    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NAND2AX27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND2AX2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND2AX2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND2AX2_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	or    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND2AX2_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND2AX31_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND2AX31_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND2AX31_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	or    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND2AX31_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NAND2AX36_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NAND2AX36_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NAND2AX36_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	or    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NAND2AX36_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND2AX4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND2AX4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND2AX4_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	or    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND2AX4_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NAND2AX9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NAND2AX9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NAND2AX9_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	or    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NAND2AX9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND2X12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND2X12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND2X12_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND2X12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRBR0P8_NAND2X12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRBR0P8_NAND2X12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRBR0P8_NAND2X12_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRBR0P8_NAND2X12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND2X15_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND2X15_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND2X15_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND2X15_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRS_NAND2X15_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRS_NAND2X15_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRS_NAND2X15_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRS_NAND2X15_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRBR0P8_NAND2X16_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRBR0P8_NAND2X16_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRBR0P8_NAND2X16_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRBR0P8_NAND2X16_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NAND2X18_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NAND2X18_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NAND2X18_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NAND2X18_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRS_NAND2X23_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRS_NAND2X23_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRS_NAND2X23_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRS_NAND2X23_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND2X24_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND2X24_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND2X24_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND2X24_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NAND2X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NAND2X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NAND2X27_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NAND2X27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND2X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND2X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND2X2_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND2X2_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRS_NAND2X31_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRS_NAND2X31_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRS_NAND2X31_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRS_NAND2X31_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NAND2X36_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NAND2X36_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NAND2X36_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NAND2X36_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND2X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND2X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND2X4_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND2X4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRBR0P8_NAND2X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRBR0P8_NAND2X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRBR0P8_NAND2X4_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRBR0P8_NAND2X4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND2X8_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND2X8_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND2X8_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND2X8_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRS_NAND2X8_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRS_NAND2X8_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRS_NAND2X8_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRS_NAND2X8_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRBR0P8_NAND2X8_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRBR0P8_NAND2X8_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRBR0P8_NAND2X8_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRBR0P8_NAND2X8_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NAND2X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NAND2X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NAND2X9_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NAND2X9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3ABX12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3ABX12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3ABX12_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	not    U1 (INTERNAL2, A) ;
	not    U2 (INTERNAL3, B) ;
	and    U3 (INTERNAL1, INTERNAL2, INTERNAL3, C) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3ABX12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3ABX15_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3ABX15_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3ABX15_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	not    U1 (INTERNAL2, A) ;
	not    U2 (INTERNAL3, B) ;
	and    U3 (INTERNAL1, INTERNAL2, INTERNAL3, C) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3ABX15_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3ABX4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3ABX4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3ABX4_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	not    U1 (INTERNAL2, A) ;
	not    U2 (INTERNAL3, B) ;
	and    U3 (INTERNAL1, INTERNAL2, INTERNAL3, C) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3ABX4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3ABX8_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3ABX8_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3ABX8_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	not    U1 (INTERNAL2, A) ;
	not    U2 (INTERNAL3, B) ;
	and    U3 (INTERNAL1, INTERNAL2, INTERNAL3, C) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3ABX8_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3AX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3AX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3AX10_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	not    U1 (INTERNAL2, A) ;
	and    U2 (INTERNAL1, INTERNAL2, B, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3AX10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3AX14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3AX14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3AX14_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	not    U1 (INTERNAL2, A) ;
	and    U2 (INTERNAL1, INTERNAL2, B, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3AX14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3AX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3AX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3AX3_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	not    U1 (INTERNAL2, A) ;
	and    U2 (INTERNAL1, INTERNAL2, B, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3AX3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3AX7_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3AX7_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3AX7_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	not    U1 (INTERNAL2, A) ;
	and    U2 (INTERNAL1, INTERNAL2, B, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3AX7_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3X10_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRBR0P6_NAND3X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRBR0P6_NAND3X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRBR0P6_NAND3X10_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRBR0P6_NAND3X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3X14_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRBR0P6_NAND3X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRBR0P6_NAND3X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRBR0P6_NAND3X14_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRBR0P6_NAND3X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3X20_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3X20_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3X20_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3X20_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRBR0P6_NAND3X20_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRBR0P6_NAND3X20_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRBR0P6_NAND3X20_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRBR0P6_NAND3X20_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3X27_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3X27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRBR0P6_NAND3X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRBR0P6_NAND3X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRBR0P6_NAND3X27_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRBR0P6_NAND3X27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3X3_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRBR0P6_NAND3X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRBR0P6_NAND3X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRBR0P6_NAND3X3_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRBR0P6_NAND3X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND3X7_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND3X7_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND3X7_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND3X7_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRBR0P6_NAND3X7_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRBR0P6_NAND3X7_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRBR0P6_NAND3X7_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	and    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRBR0P6_NAND3X7_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND4ABX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND4ABX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND4ABX10_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	not    U1 (INTERNAL2, A) ;
	not    U2 (INTERNAL3, B) ;
	and    U3 (INTERNAL1, INTERNAL2, INTERNAL3, C, D) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND4ABX10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND4ABX14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND4ABX14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND4ABX14_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	not    U1 (INTERNAL2, A) ;
	not    U2 (INTERNAL3, B) ;
	and    U3 (INTERNAL1, INTERNAL2, INTERNAL3, C, D) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND4ABX14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND4ABX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND4ABX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND4ABX3_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	not    U1 (INTERNAL2, A) ;
	not    U2 (INTERNAL3, B) ;
	and    U3 (INTERNAL1, INTERNAL2, INTERNAL3, C, D) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND4ABX3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND4ABX7_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND4ABX7_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND4ABX7_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	not    U1 (INTERNAL2, A) ;
	not    U2 (INTERNAL3, B) ;
	and    U3 (INTERNAL1, INTERNAL2, INTERNAL3, C, D) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND4ABX7_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND4X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND4X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND4X10_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL1, A, B, C, D) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND4X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND4X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND4X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND4X14_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL1, A, B, C, D) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND4X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND4X18_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND4X18_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND4X18_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL1, A, B, C, D) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND4X18_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NAND4X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NAND4X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NAND4X5_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	and    U1 (INTERNAL1, A, B, C, D) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NAND4X5_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NOR2AX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NOR2AX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NOR2AX10_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	and    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NOR2AX10_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NOR2AX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NOR2AX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NOR2AX19_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	and    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NOR2AX19_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NOR2AX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NOR2AX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NOR2AX29_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	and    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NOR2AX29_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR2AX2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR2AX2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR2AX2_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	and    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR2AX2_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NOR2AX39_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NOR2AX39_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NOR2AX39_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	and    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NOR2AX39_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR2AX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR2AX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR2AX3_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	and    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR2AX3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR2AX4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR2AX4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR2AX4_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	not    U1 (INTERNAL1, B) ;
	and    U2 (Z, A, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR2AX4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR2X12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR2X12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR2X12_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR2X12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR2X16_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR2X16_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR2X16_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR2X16_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NOR2X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NOR2X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NOR2X19_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NOR2X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRS_NOR2X20_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRS_NOR2X20_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRS_NOR2X20_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRS_NOR2X20_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR2X23_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR2X23_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR2X23_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR2X23_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRS_NOR2X24_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRS_NOR2X24_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRS_NOR2X24_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRS_NOR2X24_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR2X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR2X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR2X27_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR2X27_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NOR2X29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NOR2X29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NOR2X29_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NOR2X29_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR2X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR2X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR2X2_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR2X2_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRS_NOR2X31_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRS_NOR2X31_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRS_NOR2X31_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LRS_NOR2X31_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR2X34_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR2X34_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR2X34_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR2X34_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR2X38_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR2X38_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR2X38_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR2X38_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NOR2X39_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NOR2X39_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NOR2X39_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NOR2X39_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NOR2X46_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NOR2X46_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NOR2X46_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NOR2X46_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR2X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR2X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR2X4_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR2X4_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NOR2X57_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NOR2X57_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NOR2X57_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NOR2X57_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR2X8_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR2X8_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR2X8_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR2X8_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_NOR2X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_NOR2X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_NOR2X9_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_NOR2X9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR3AX11_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR3AX11_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR3AX11_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	not    U1 (INTERNAL2, A) ;
	or    U2 (INTERNAL1, INTERNAL2, B, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR3AX11_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR3AX14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR3AX14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR3AX14_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	not    U1 (INTERNAL2, A) ;
	or    U2 (INTERNAL1, INTERNAL2, B, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR3AX14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR3AX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR3AX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR3AX3_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	not    U1 (INTERNAL2, A) ;
	or    U2 (INTERNAL1, INTERNAL2, B, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR3AX3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR3AX7_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR3AX7_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR3AX7_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	not    U1 (INTERNAL2, A) ;
	or    U2 (INTERNAL1, INTERNAL2, B, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR3AX7_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR3X11_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR3X11_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR3X11_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR3X11_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR3X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR3X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR3X14_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR3X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR3X21_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR3X21_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR3X21_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR3X21_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR3X29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR3X29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR3X29_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR3X29_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR3X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR3X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR3X3_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR3X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR3X7_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR3X7_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR3X7_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR3X7_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR4ABX11_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR4ABX11_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR4ABX11_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	not    U1 (INTERNAL1, C) ;
	not    U2 (INTERNAL2, D) ;
	and    U3 (Z, A, B, INTERNAL1, INTERNAL2) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR4ABX11_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR4ABX14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR4ABX14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR4ABX14_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	not    U1 (INTERNAL1, C) ;
	not    U2 (INTERNAL2, D) ;
	and    U3 (Z, A, B, INTERNAL1, INTERNAL2) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR4ABX14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR4ABX4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR4ABX4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR4ABX4_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	not    U1 (INTERNAL1, C) ;
	not    U2 (INTERNAL2, D) ;
	and    U3 (Z, A, B, INTERNAL1, INTERNAL2) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR4ABX4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR4ABX7_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR4ABX7_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR4ABX7_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	not    U1 (INTERNAL1, C) ;
	not    U2 (INTERNAL2, D) ;
	and    U3 (Z, A, B, INTERNAL1, INTERNAL2) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR4ABX7_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR4X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR4X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR4X10_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL1, A, B, C, D) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR4X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR4X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR4X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR4X14_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL1, A, B, C, D) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR4X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR4X18_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR4X18_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR4X18_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL1, A, B, C, D) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR4X18_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_NOR4X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_NOR4X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_NOR4X5_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL1, A, B, C, D) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_NOR4X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA112X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA112X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA112X10_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL1, A, B) ;
	and    U2 (Z, INTERNAL1, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA112X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA112X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA112X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA112X14_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL1, A, B) ;
	and    U2 (Z, INTERNAL1, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA112X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA112X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA112X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA112X19_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL1, A, B) ;
	and    U2 (Z, INTERNAL1, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA112X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA112X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA112X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA112X4_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL1, A, B) ;
	and    U2 (Z, INTERNAL1, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA112X4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA12X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA12X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA12X10_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL1, A, B) ;
	and    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA12X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA12X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA12X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA12X19_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL1, A, B) ;
	and    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA12X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA12X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA12X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA12X5_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL1, A, B) ;
	and    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA12X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA21X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA21X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA21X10_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL1, A, B) ;
	and    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA21X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA21X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA21X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA21X14_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL1, A, B) ;
	and    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA21X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA21X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA21X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA21X19_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL1, A, B) ;
	and    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA21X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA21X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA21X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA21X5_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL1, A, B) ;
	and    U2 (Z, INTERNAL1, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA21X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA222X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA222X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA222X19_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	or    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL3, C, D) ;
	or    U3 (INTERNAL4, E, F) ;
	and    U4 (INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	not    U5 (NET1, INTERNAL1) ;
	not    U6 (Z, NET1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !E) (F +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA222X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA222X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA222X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA222X4_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	or    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL3, C, D) ;
	or    U3 (INTERNAL4, E, F) ;
	and    U4 (INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	not    U5 (NET1, INTERNAL1) ;
	not    U6 (Z, NET1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !E) (F +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA222X4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA222X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA222X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA222X9_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	or    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL3, C, D) ;
	or    U3 (INTERNAL4, E, F) ;
	and    U4 (INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	not    U5 (NET1, INTERNAL1) ;
	not    U6 (Z, NET1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && !F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && !E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && F) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && !F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && !E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && F) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && !F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && !E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && F) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && !F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && F) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !F) (E +=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !E) (F +=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !E) (F +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA222X9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA22X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA22X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA22X10_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL1, A, B) ;
	or    U2 (INTERNAL2, C, D) ;
	and    U3 (Z, INTERNAL1, INTERNAL2) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA22X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA22X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA22X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA22X14_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL1, A, B) ;
	or    U2 (INTERNAL2, C, D) ;
	and    U3 (Z, INTERNAL1, INTERNAL2) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA22X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA22X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA22X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA22X19_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL1, A, B) ;
	or    U2 (INTERNAL2, C, D) ;
	and    U3 (Z, INTERNAL1, INTERNAL2) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA22X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OA22X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OA22X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OA22X5_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL1, A, B) ;
	or    U2 (INTERNAL2, C, D) ;
	and    U3 (Z, INTERNAL1, INTERNAL2) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!B && C && D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D +=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OA22X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI112X12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI112X12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI112X12_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI112X12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI112X18_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI112X18_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI112X18_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI112X18_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI112X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI112X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI112X3_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI112X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI112X6_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI112X6_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI112X6_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI112X6_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI12X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI12X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI12X10_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI12X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI12X20_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI12X20_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI12X20_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI12X20_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI12X26_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI12X26_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI12X26_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI12X26_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI12X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI12X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI12X3_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI12X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI211X12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI211X12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI211X12_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI211X12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI211X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI211X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI211X3_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI211X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI211X6_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI211X6_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI211X6_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI211X6_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI211X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI211X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI211X9_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C, D) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI211X9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI21X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI21X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI21X10_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI21X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI21X13_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI21X13_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI21X13_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI21X13_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI21X26_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI21X26_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI21X26_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI21X26_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI21X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI21X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI21X3_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI21X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI21X7_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI21X7_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI21X7_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (INTERNAL2, A, B) ;
	and    U2 (INTERNAL1, INTERNAL2, C) ;
	not    U3 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI21X7_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI222X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI222X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI222X10_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	or    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL3, C, D) ;
	or    U3 (INTERNAL4, E, F) ;
	and    U4 (INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	not    U5 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI222X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI222X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI222X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI222X2_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	or    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL3, C, D) ;
	or    U3 (INTERNAL4, E, F) ;
	and    U4 (INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	not    U5 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI222X2_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI222X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI222X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI222X3_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	or    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL3, C, D) ;
	or    U3 (INTERNAL4, E, F) ;
	and    U4 (INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	not    U5 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI222X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI222X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI222X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI222X5_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	or    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL3, C, D) ;
	or    U3 (INTERNAL4, E, F) ;
	and    U4 (INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	not    U5 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI222X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI222X8_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI222X8_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI222X8_P16 (Z, A, B, C, D, E, F);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	input E;
	input F;
	
	or    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL3, C, D) ;
	or    U3 (INTERNAL4, E, F) ;
	and    U4 (INTERNAL1, INTERNAL2, INTERNAL3, INTERNAL4) ;
	not    U5 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && !D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && !F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && !E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D && E && F) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && !F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && !E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D && E && F) (B -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && !F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && !E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D && E && F) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && !F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && !E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && E && F) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !F) (E -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && !B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && !D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C && D && !E) (F -=> Z) = (tDELAY,tDELAY);
		if (!A && B && C && D && !E) (F -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI222X8_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI22X11_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI22X11_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI22X11_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL3, C, D) ;
	and    U3 (INTERNAL1, INTERNAL2, INTERNAL3) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI22X11_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI22X24_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI22X24_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI22X24_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL3, C, D) ;
	and    U3 (INTERNAL1, INTERNAL2, INTERNAL3) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI22X24_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI22X3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI22X3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI22X3_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL3, C, D) ;
	and    U3 (INTERNAL1, INTERNAL2, INTERNAL3) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI22X3_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI22X6_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI22X6_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI22X6_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL3, C, D) ;
	and    U3 (INTERNAL1, INTERNAL2, INTERNAL3) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI22X6_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OAI22X8_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OAI22X8_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OAI22X8_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (INTERNAL2, A, B) ;
	or    U2 (INTERNAL3, C, D) ;
	and    U3 (INTERNAL1, INTERNAL2, INTERNAL3) ;
	not    U4 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && C && !D) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C && D) (A -=> Z) = (tDELAY,tDELAY);
		if (!A && C && !D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C && D) (B -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && B && !D) (C -=> Z) = (tDELAY,tDELAY);
		if (A && !B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (!A && B && !C) (D -=> Z) = (tDELAY,tDELAY);
		if (A && B && !C) (D -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OAI22X8_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR2ABX14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR2ABX14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR2ABX14_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR2ABX14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR2ABX18_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR2ABX18_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR2ABX18_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR2ABX18_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR2ABX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR2ABX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR2ABX5_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR2ABX5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR2ABX9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR2ABX9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR2ABX9_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	and    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR2ABX9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR2X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR2X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR2X19_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR2X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR2X29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR2X29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR2X29_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR2X29_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR2X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR2X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR2X5_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR2X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR2X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR2X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR2X9_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	or    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR2X9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR3X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR3X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR3X10_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR3X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR3X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR3X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR3X14_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR3X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR3X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR3X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR3X19_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR3X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR3X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR3X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR3X5_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	or    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR3X5_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR4X12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR4X12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR4X12_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (Z, A, B, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR4X12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR4X15_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR4X15_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR4X15_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (Z, A, B, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR4X15_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR4X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR4X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR4X4_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (Z, A, B, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR4X4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_OR4X8_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_OR4X8_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_OR4X8_P16 (Z, A, B, C, D);
	
	output Z;
	input A;
	input B;
	input C;
	input D;
	
	or    U1 (Z, A, B, C, D) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && !C && !D) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && !C && !D) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !D) (C +=> Z) = (tDELAY,tDELAY);
		if (!A && !B && !C) (D +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_OR4X8_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_PAO2X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_PAO2X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_PAO2X10_P16 (Z, A, B, P);
	
	output Z;
	input A;
	input B;
	input P;
	
	or    U1 (INTERNAL2, B, P) ;
	and    U2 (INTERNAL1, INTERNAL2, A) ;
	and    U3 (INTERNAL3, B, P) ;
	or    U4 (Z, INTERNAL1, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && P) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !P) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && P) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !P) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (P +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (P +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_PAO2X10_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_PAO2X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_PAO2X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_PAO2X14_P16 (Z, A, B, P);
	
	output Z;
	input A;
	input B;
	input P;
	
	or    U1 (INTERNAL2, B, P) ;
	and    U2 (INTERNAL1, INTERNAL2, A) ;
	and    U3 (INTERNAL3, B, P) ;
	or    U4 (Z, INTERNAL1, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && P) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !P) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && P) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !P) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (P +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (P +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_PAO2X14_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_PAO2X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_PAO2X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_PAO2X19_P16 (Z, A, B, P);
	
	output Z;
	input A;
	input B;
	input P;
	
	or    U1 (INTERNAL2, B, P) ;
	and    U2 (INTERNAL1, INTERNAL2, A) ;
	and    U3 (INTERNAL3, B, P) ;
	or    U4 (Z, INTERNAL1, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && P) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !P) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && P) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !P) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (P +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (P +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_PAO2X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_PAO2X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_PAO2X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_PAO2X5_P16 (Z, A, B, P);
	
	output Z;
	input A;
	input B;
	input P;
	
	or    U1 (INTERNAL2, B, P) ;
	and    U2 (INTERNAL1, INTERNAL2, A) ;
	and    U3 (INTERNAL3, B, P) ;
	or    U4 (Z, INTERNAL1, INTERNAL3) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B && P) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !P) (A +=> Z) = (tDELAY,tDELAY);
		if (!A && P) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !P) (B +=> Z) = (tDELAY,tDELAY);
		if (!A && B) (P +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (P +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_PAO2X5_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPHRQNX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPHRQNX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPHRQNX10_P16 (QN,  D, E, CP, RN, TI, TE);
	
	output QN;
	input CP;
	input RN;
	input TE;
	input TI;
	input E;
	input D;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, D, E) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U4 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, dD, dE) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U4 (QN, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DETEX, dD, dE, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DETEXAND_TETI, AND_DETEX, AND_TETI) ;
	and    X5 (AND_ERN, dE, dRN) ;
	and    X6 (dAND_RNTE, dRN, dTE) ;
	or    X7 (OR_AND_ERNAND_RNTE, AND_ERN, dAND_RNTE) ;
	not    X8 (DX, dD) ;
	and    X9 (AND_DXERNTI, DX, dE, dRN, dTI) ;
	not    X10 (TIX, dTI) ;
	and    X11 (AND_DERNTIX, dD, dE, dRN, TIX) ;
	or    X12 (OR_AND_DXERNTIAND_DERNTIX, AND_DXERNTI, AND_DERNTIX) ;
	and    X13 (AND_DXRNTI, DX, dRN, dTI) ;
	and    X14 (AND_DRNTIX, dD, dRN, TIX) ;
	not    X15 (EX, dE) ;
	and    X16 (AND_EXRN, EX, dRN) ;
	or    X17 (OR_AND_DXRNTIAND_DRNTIXAND_EXRN, AND_DXRNTI, AND_DRNTIX, AND_EXRN) ;
	and    X18 (AND_RNTEX, dRN, dTEX) ;
	and    X19 (dAND_ERNTEX, dE, dRN, dTEX) ;
	
	and  X20 (DE_, dD, dE);
	not X25 (QX_, QN);
	and  X21 (QE_, QX_, EX); 
	or  X22 (DEor_, DE_, QE_);
	xor  X23 (D_orTI, DEor_, dTI);
	and  X24 (AND_D_orTI_RN, D_orTI, RN);
	
	xor    X26 (Y, dD,IQ) ;
	and    X27 (AND_RNTEXY ,dRN,dTEX,Y) ;
	
	
	
	
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_ERNTEX, E, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_ERNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_ERNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& AND_RNTEXY, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_RNTEXY, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DETEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPHRQNX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPHRQNX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPHRQNX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPHRQNX19_P16 (QN,  D, E, CP, RN, TI, TE);
	
	output QN;
	input CP;
	input RN;
	input TE;
	input TI;
	input E;
	input D;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, D, E) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U4 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, dD, dE) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U4 (QN, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DETEX, dD, dE, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DETEXAND_TETI, AND_DETEX, AND_TETI) ;
	and    X5 (AND_ERN, dE, dRN) ;
	and    X6 (dAND_RNTE, dRN, dTE) ;
	or    X7 (OR_AND_ERNAND_RNTE, AND_ERN, dAND_RNTE) ;
	not    X8 (DX, dD) ;
	and    X9 (AND_DXERNTI, DX, dE, dRN, dTI) ;
	not    X10 (TIX, dTI) ;
	and    X11 (AND_DERNTIX, dD, dE, dRN, TIX) ;
	or    X12 (OR_AND_DXERNTIAND_DERNTIX, AND_DXERNTI, AND_DERNTIX) ;
	and    X13 (AND_DXRNTI, DX, dRN, dTI) ;
	and    X14 (AND_DRNTIX, dD, dRN, TIX) ;
	not    X15 (EX, dE) ;
	and    X16 (AND_EXRN, EX, dRN) ;
	or    X17 (OR_AND_DXRNTIAND_DRNTIXAND_EXRN, AND_DXRNTI, AND_DRNTIX, AND_EXRN) ;
	and    X18 (AND_RNTEX, dRN, dTEX) ;
	and    X19 (dAND_ERNTEX, dE, dRN, dTEX) ;
	
	and  X20 (DE_, dD, dE);
	not X25 (QX_, QN);
	and  X21 (QE_, QX_, EX); 
	or  X22 (DEor_, DE_, QE_);
	xor  X23 (D_orTI, DEor_, dTI);
	and  X24 (AND_D_orTI_RN, D_orTI, RN);
	
	xor    X26 (Y, dD,IQ) ;
	and    X27 (AND_RNTEXY ,dRN,dTEX,Y) ;
	
	
	
	
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_ERNTEX, E, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_ERNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_ERNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& AND_RNTEXY, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_RNTEXY, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DETEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPHRQNX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPHRQNX23_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPHRQNX23_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPHRQNX23_P16 (QN,  D, E, CP, RN, TI, TE);
	
	output QN;
	input CP;
	input RN;
	input TE;
	input TI;
	input E;
	input D;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, D, E) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U4 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, dD, dE) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U4 (QN, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DETEX, dD, dE, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DETEXAND_TETI, AND_DETEX, AND_TETI) ;
	and    X5 (AND_ERN, dE, dRN) ;
	and    X6 (dAND_RNTE, dRN, dTE) ;
	or    X7 (OR_AND_ERNAND_RNTE, AND_ERN, dAND_RNTE) ;
	not    X8 (DX, dD) ;
	and    X9 (AND_DXERNTI, DX, dE, dRN, dTI) ;
	not    X10 (TIX, dTI) ;
	and    X11 (AND_DERNTIX, dD, dE, dRN, TIX) ;
	or    X12 (OR_AND_DXERNTIAND_DERNTIX, AND_DXERNTI, AND_DERNTIX) ;
	and    X13 (AND_DXRNTI, DX, dRN, dTI) ;
	and    X14 (AND_DRNTIX, dD, dRN, TIX) ;
	not    X15 (EX, dE) ;
	and    X16 (AND_EXRN, EX, dRN) ;
	or    X17 (OR_AND_DXRNTIAND_DRNTIXAND_EXRN, AND_DXRNTI, AND_DRNTIX, AND_EXRN) ;
	and    X18 (AND_RNTEX, dRN, dTEX) ;
	and    X19 (dAND_ERNTEX, dE, dRN, dTEX) ;
	
	and  X20 (DE_, dD, dE);
	not X25 (QX_, QN);
	and  X21 (QE_, QX_, EX); 
	or  X22 (DEor_, DE_, QE_);
	xor  X23 (D_orTI, DEor_, dTI);
	and  X24 (AND_D_orTI_RN, D_orTI, RN);
	
	xor    X26 (Y, dD,IQ) ;
	and    X27 (AND_RNTEXY ,dRN,dTEX,Y) ;
	
	
	
	
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_ERNTEX, E, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_ERNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_ERNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& AND_RNTEXY, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_RNTEXY, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DETEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPHRQNX23_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPHRQNX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPHRQNX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPHRQNX29_P16 (QN,  D, E, CP, RN, TI, TE);
	
	output QN;
	input CP;
	input RN;
	input TE;
	input TI;
	input E;
	input D;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, D, E) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U4 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, dD, dE) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U4 (QN, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DETEX, dD, dE, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DETEXAND_TETI, AND_DETEX, AND_TETI) ;
	and    X5 (AND_ERN, dE, dRN) ;
	and    X6 (dAND_RNTE, dRN, dTE) ;
	or    X7 (OR_AND_ERNAND_RNTE, AND_ERN, dAND_RNTE) ;
	not    X8 (DX, dD) ;
	and    X9 (AND_DXERNTI, DX, dE, dRN, dTI) ;
	not    X10 (TIX, dTI) ;
	and    X11 (AND_DERNTIX, dD, dE, dRN, TIX) ;
	or    X12 (OR_AND_DXERNTIAND_DERNTIX, AND_DXERNTI, AND_DERNTIX) ;
	and    X13 (AND_DXRNTI, DX, dRN, dTI) ;
	and    X14 (AND_DRNTIX, dD, dRN, TIX) ;
	not    X15 (EX, dE) ;
	and    X16 (AND_EXRN, EX, dRN) ;
	or    X17 (OR_AND_DXRNTIAND_DRNTIXAND_EXRN, AND_DXRNTI, AND_DRNTIX, AND_EXRN) ;
	and    X18 (AND_RNTEX, dRN, dTEX) ;
	and    X19 (dAND_ERNTEX, dE, dRN, dTEX) ;
	
	and  X20 (DE_, dD, dE);
	not X25 (QX_, QN);
	and  X21 (QE_, QX_, EX); 
	or  X22 (DEor_, DE_, QE_);
	xor  X23 (D_orTI, DEor_, dTI);
	and  X24 (AND_D_orTI_RN, D_orTI, RN);
	
	xor    X26 (Y, dD,IQ) ;
	and    X27 (AND_RNTEXY ,dRN,dTEX,Y) ;
	
	
	
	
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_ERNTEX, E, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_ERNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_ERNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& AND_RNTEXY, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_RNTEXY, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DETEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPHRQNX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPHRQNX34_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPHRQNX34_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPHRQNX34_P16 (QN,  D, E, CP, RN, TI, TE);
	
	output QN;
	input CP;
	input RN;
	input TE;
	input TI;
	input E;
	input D;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, D, E) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U4 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, dD, dE) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U4 (QN, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DETEX, dD, dE, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DETEXAND_TETI, AND_DETEX, AND_TETI) ;
	and    X5 (AND_ERN, dE, dRN) ;
	and    X6 (dAND_RNTE, dRN, dTE) ;
	or    X7 (OR_AND_ERNAND_RNTE, AND_ERN, dAND_RNTE) ;
	not    X8 (DX, dD) ;
	and    X9 (AND_DXERNTI, DX, dE, dRN, dTI) ;
	not    X10 (TIX, dTI) ;
	and    X11 (AND_DERNTIX, dD, dE, dRN, TIX) ;
	or    X12 (OR_AND_DXERNTIAND_DERNTIX, AND_DXERNTI, AND_DERNTIX) ;
	and    X13 (AND_DXRNTI, DX, dRN, dTI) ;
	and    X14 (AND_DRNTIX, dD, dRN, TIX) ;
	not    X15 (EX, dE) ;
	and    X16 (AND_EXRN, EX, dRN) ;
	or    X17 (OR_AND_DXRNTIAND_DRNTIXAND_EXRN, AND_DXRNTI, AND_DRNTIX, AND_EXRN) ;
	and    X18 (AND_RNTEX, dRN, dTEX) ;
	and    X19 (dAND_ERNTEX, dE, dRN, dTEX) ;
	
	and  X20 (DE_, dD, dE);
	not X25 (QX_, QN);
	and  X21 (QE_, QX_, EX); 
	or  X22 (DEor_, DE_, QE_);
	xor  X23 (D_orTI, DEor_, dTI);
	and  X24 (AND_D_orTI_RN, D_orTI, RN);
	
	xor    X26 (Y, dD,IQ) ;
	and    X27 (AND_RNTEXY ,dRN,dTEX,Y) ;
	
	
	
	
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_ERNTEX, E, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_ERNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_ERNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& AND_RNTEXY, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_RNTEXY, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DETEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPHRQNX34_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPHRQNX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPHRQNX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPHRQNX5_P16 (QN,  D, E, CP, RN, TI, TE);
	
	output QN;
	input CP;
	input RN;
	input TE;
	input TI;
	input E;
	input D;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, D, E) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U4 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, dD, dE) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U4 (QN, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DETEX, dD, dE, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DETEXAND_TETI, AND_DETEX, AND_TETI) ;
	and    X5 (AND_ERN, dE, dRN) ;
	and    X6 (dAND_RNTE, dRN, dTE) ;
	or    X7 (OR_AND_ERNAND_RNTE, AND_ERN, dAND_RNTE) ;
	not    X8 (DX, dD) ;
	and    X9 (AND_DXERNTI, DX, dE, dRN, dTI) ;
	not    X10 (TIX, dTI) ;
	and    X11 (AND_DERNTIX, dD, dE, dRN, TIX) ;
	or    X12 (OR_AND_DXERNTIAND_DERNTIX, AND_DXERNTI, AND_DERNTIX) ;
	and    X13 (AND_DXRNTI, DX, dRN, dTI) ;
	and    X14 (AND_DRNTIX, dD, dRN, TIX) ;
	not    X15 (EX, dE) ;
	and    X16 (AND_EXRN, EX, dRN) ;
	or    X17 (OR_AND_DXRNTIAND_DRNTIXAND_EXRN, AND_DXRNTI, AND_DRNTIX, AND_EXRN) ;
	and    X18 (AND_RNTEX, dRN, dTEX) ;
	and    X19 (dAND_ERNTEX, dE, dRN, dTEX) ;
	
	and  X20 (DE_, dD, dE);
	not X25 (QX_, QN);
	and  X21 (QE_, QX_, EX); 
	or  X22 (DEor_, DE_, QE_);
	xor  X23 (D_orTI, DEor_, dTI);
	and  X24 (AND_D_orTI_RN, D_orTI, RN);
	
	xor    X26 (Y, dD,IQ) ;
	and    X27 (AND_RNTEXY ,dRN,dTEX,Y) ;
	
	
	
	
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_ERNTEX, E, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_ERNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_ERNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& AND_RNTEXY, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_RNTEXY, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DETEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPHRQNX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPHRQX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPHRQX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPHRQX10_P16 (Q,  D, E, CP, RN, TI, TE);
	
	output Q;
	input CP;
	input RN;
	input TE;
	input TI;
	input E;
	input D;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, D, E) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U4 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, dD, dE) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U4 (Q, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DETEX, dD, dE, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DETEXAND_TETI, AND_DETEX, AND_TETI) ;
	and    X5 (AND_ERN, dE, dRN) ;
	and    X6 (dAND_RNTE, dRN, dTE) ;
	or    X7 (OR_AND_ERNAND_RNTE, AND_ERN, dAND_RNTE) ;
	not    X8 (DX, dD) ;
	and    X9 (AND_DXERNTI, DX, dE, dRN, dTI) ;
	not    X10 (TIX, dTI) ;
	and    X11 (AND_DERNTIX, dD, dE, dRN, TIX) ;
	or    X12 (OR_AND_DXERNTIAND_DERNTIX, AND_DXERNTI, AND_DERNTIX) ;
	and    X13 (AND_DXRNTI, DX, dRN, dTI) ;
	and    X14 (AND_DRNTIX, dD, dRN, TIX) ;
	not    X15 (EX, dE) ;
	and    X16 (AND_EXRN, EX, dRN) ;
	or    X17 (OR_AND_DXRNTIAND_DRNTIXAND_EXRN, AND_DXRNTI, AND_DRNTIX, AND_EXRN) ;
	and    X18 (AND_RNTEX, dRN, dTEX) ;
	and    X19 (dAND_ERNTEX, dE, dRN, dTEX) ;
	
	and  X20 (DE_, dD, dE);
	and  X21 (QE_, Q, EX);
	or  X22 (DEor_, DE_, QE_);
	xor  X23 (D_orTI, DEor_, dTI);
	and  X24 (AND_D_orTI_RN, D_orTI, RN);
	
	xor    X26 (Y, dD,IQ) ;
	and    X27 (AND_RNTEXY ,dRN,dTEX,Y) ;
	
	
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_ERNTEX, E, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_ERNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_ERNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& AND_RNTEXY, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_RNTEXY, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DETEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPHRQX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPHRQX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPHRQX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPHRQX19_P16 (Q,  D, E, CP, RN, TI, TE);
	
	output Q;
	input CP;
	input RN;
	input TE;
	input TI;
	input E;
	input D;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, D, E) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U4 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, dD, dE) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U4 (Q, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DETEX, dD, dE, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DETEXAND_TETI, AND_DETEX, AND_TETI) ;
	and    X5 (AND_ERN, dE, dRN) ;
	and    X6 (dAND_RNTE, dRN, dTE) ;
	or    X7 (OR_AND_ERNAND_RNTE, AND_ERN, dAND_RNTE) ;
	not    X8 (DX, dD) ;
	and    X9 (AND_DXERNTI, DX, dE, dRN, dTI) ;
	not    X10 (TIX, dTI) ;
	and    X11 (AND_DERNTIX, dD, dE, dRN, TIX) ;
	or    X12 (OR_AND_DXERNTIAND_DERNTIX, AND_DXERNTI, AND_DERNTIX) ;
	and    X13 (AND_DXRNTI, DX, dRN, dTI) ;
	and    X14 (AND_DRNTIX, dD, dRN, TIX) ;
	not    X15 (EX, dE) ;
	and    X16 (AND_EXRN, EX, dRN) ;
	or    X17 (OR_AND_DXRNTIAND_DRNTIXAND_EXRN, AND_DXRNTI, AND_DRNTIX, AND_EXRN) ;
	and    X18 (AND_RNTEX, dRN, dTEX) ;
	and    X19 (dAND_ERNTEX, dE, dRN, dTEX) ;
	
	and  X20 (DE_, dD, dE);
	and  X21 (QE_, Q, EX);
	or  X22 (DEor_, DE_, QE_);
	xor  X23 (D_orTI, DEor_, dTI);
	and  X24 (AND_D_orTI_RN, D_orTI, RN);
	
	xor    X26 (Y, dD,IQ) ;
	and    X27 (AND_RNTEXY ,dRN,dTEX,Y) ;
	
	
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_ERNTEX, E, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_ERNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_ERNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& AND_RNTEXY, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_RNTEXY, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DETEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPHRQX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPHRQX23_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPHRQX23_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPHRQX23_P16 (Q,  D, E, CP, RN, TI, TE);
	
	output Q;
	input CP;
	input RN;
	input TE;
	input TI;
	input E;
	input D;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, D, E) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U4 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, dD, dE) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U4 (Q, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DETEX, dD, dE, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DETEXAND_TETI, AND_DETEX, AND_TETI) ;
	and    X5 (AND_ERN, dE, dRN) ;
	and    X6 (dAND_RNTE, dRN, dTE) ;
	or    X7 (OR_AND_ERNAND_RNTE, AND_ERN, dAND_RNTE) ;
	not    X8 (DX, dD) ;
	and    X9 (AND_DXERNTI, DX, dE, dRN, dTI) ;
	not    X10 (TIX, dTI) ;
	and    X11 (AND_DERNTIX, dD, dE, dRN, TIX) ;
	or    X12 (OR_AND_DXERNTIAND_DERNTIX, AND_DXERNTI, AND_DERNTIX) ;
	and    X13 (AND_DXRNTI, DX, dRN, dTI) ;
	and    X14 (AND_DRNTIX, dD, dRN, TIX) ;
	not    X15 (EX, dE) ;
	and    X16 (AND_EXRN, EX, dRN) ;
	or    X17 (OR_AND_DXRNTIAND_DRNTIXAND_EXRN, AND_DXRNTI, AND_DRNTIX, AND_EXRN) ;
	and    X18 (AND_RNTEX, dRN, dTEX) ;
	and    X19 (dAND_ERNTEX, dE, dRN, dTEX) ;
	
	and  X20 (DE_, dD, dE);
	and  X21 (QE_, Q, EX);
	or  X22 (DEor_, DE_, QE_);
	xor  X23 (D_orTI, DEor_, dTI);
	and  X24 (AND_D_orTI_RN, D_orTI, RN);
	
	xor    X26 (Y, dD,IQ) ;
	and    X27 (AND_RNTEXY ,dRN,dTEX,Y) ;
	
	
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_ERNTEX, E, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_ERNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_ERNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& AND_RNTEXY, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_RNTEXY, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DETEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPHRQX23_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPHRQX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPHRQX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPHRQX29_P16 (Q,  D, E, CP, RN, TI, TE);
	
	output Q;
	input CP;
	input RN;
	input TE;
	input TI;
	input E;
	input D;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, D, E) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U4 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, dD, dE) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U4 (Q, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DETEX, dD, dE, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DETEXAND_TETI, AND_DETEX, AND_TETI) ;
	and    X5 (AND_ERN, dE, dRN) ;
	and    X6 (dAND_RNTE, dRN, dTE) ;
	or    X7 (OR_AND_ERNAND_RNTE, AND_ERN, dAND_RNTE) ;
	not    X8 (DX, dD) ;
	and    X9 (AND_DXERNTI, DX, dE, dRN, dTI) ;
	not    X10 (TIX, dTI) ;
	and    X11 (AND_DERNTIX, dD, dE, dRN, TIX) ;
	or    X12 (OR_AND_DXERNTIAND_DERNTIX, AND_DXERNTI, AND_DERNTIX) ;
	and    X13 (AND_DXRNTI, DX, dRN, dTI) ;
	and    X14 (AND_DRNTIX, dD, dRN, TIX) ;
	not    X15 (EX, dE) ;
	and    X16 (AND_EXRN, EX, dRN) ;
	or    X17 (OR_AND_DXRNTIAND_DRNTIXAND_EXRN, AND_DXRNTI, AND_DRNTIX, AND_EXRN) ;
	and    X18 (AND_RNTEX, dRN, dTEX) ;
	and    X19 (dAND_ERNTEX, dE, dRN, dTEX) ;
	
	and  X20 (DE_, dD, dE);
	and  X21 (QE_, Q, EX);
	or  X22 (DEor_, DE_, QE_);
	xor  X23 (D_orTI, DEor_, dTI);
	and  X24 (AND_D_orTI_RN, D_orTI, RN);
	
	xor    X26 (Y, dD,IQ) ;
	and    X27 (AND_RNTEXY ,dRN,dTEX,Y) ;
	
	
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_ERNTEX, E, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_ERNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_ERNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& AND_RNTEXY, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_RNTEXY, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DETEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPHRQX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPHRQX34_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPHRQX34_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPHRQX34_P16 (Q,  D, E, CP, RN, TI, TE);
	
	output Q;
	input CP;
	input RN;
	input TE;
	input TI;
	input E;
	input D;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, D, E) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U4 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, dD, dE) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U4 (Q, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DETEX, dD, dE, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DETEXAND_TETI, AND_DETEX, AND_TETI) ;
	and    X5 (AND_ERN, dE, dRN) ;
	and    X6 (dAND_RNTE, dRN, dTE) ;
	or    X7 (OR_AND_ERNAND_RNTE, AND_ERN, dAND_RNTE) ;
	not    X8 (DX, dD) ;
	and    X9 (AND_DXERNTI, DX, dE, dRN, dTI) ;
	not    X10 (TIX, dTI) ;
	and    X11 (AND_DERNTIX, dD, dE, dRN, TIX) ;
	or    X12 (OR_AND_DXERNTIAND_DERNTIX, AND_DXERNTI, AND_DERNTIX) ;
	and    X13 (AND_DXRNTI, DX, dRN, dTI) ;
	and    X14 (AND_DRNTIX, dD, dRN, TIX) ;
	not    X15 (EX, dE) ;
	and    X16 (AND_EXRN, EX, dRN) ;
	or    X17 (OR_AND_DXRNTIAND_DRNTIXAND_EXRN, AND_DXRNTI, AND_DRNTIX, AND_EXRN) ;
	and    X18 (AND_RNTEX, dRN, dTEX) ;
	and    X19 (dAND_ERNTEX, dE, dRN, dTEX) ;
	
	and  X20 (DE_, dD, dE);
	and  X21 (QE_, Q, EX);
	or  X22 (DEor_, DE_, QE_);
	xor  X23 (D_orTI, DEor_, dTI);
	and  X24 (AND_D_orTI_RN, D_orTI, RN);
	
	xor    X26 (Y, dD,IQ) ;
	and    X27 (AND_RNTEXY ,dRN,dTEX,Y) ;
	
	
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_ERNTEX, E, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_ERNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_ERNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& AND_RNTEXY, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_RNTEXY, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DETEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPHRQX34_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPHRQX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPHRQX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPHRQX5_P16 (Q,  D, E, CP, RN, TI, TE);
	
	output Q;
	input CP;
	input RN;
	input TE;
	input TI;
	input E;
	input D;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, D, E) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U4 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (D1, IQ, dD, dE) ;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U2 (INTERNAL1, D1, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U3 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U4 (Q, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DETEX, dD, dE, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DETEXAND_TETI, AND_DETEX, AND_TETI) ;
	and    X5 (AND_ERN, dE, dRN) ;
	and    X6 (dAND_RNTE, dRN, dTE) ;
	or    X7 (OR_AND_ERNAND_RNTE, AND_ERN, dAND_RNTE) ;
	not    X8 (DX, dD) ;
	and    X9 (AND_DXERNTI, DX, dE, dRN, dTI) ;
	not    X10 (TIX, dTI) ;
	and    X11 (AND_DERNTIX, dD, dE, dRN, TIX) ;
	or    X12 (OR_AND_DXERNTIAND_DERNTIX, AND_DXERNTI, AND_DERNTIX) ;
	and    X13 (AND_DXRNTI, DX, dRN, dTI) ;
	and    X14 (AND_DRNTIX, dD, dRN, TIX) ;
	not    X15 (EX, dE) ;
	and    X16 (AND_EXRN, EX, dRN) ;
	or    X17 (OR_AND_DXRNTIAND_DRNTIXAND_EXRN, AND_DXRNTI, AND_DRNTIX, AND_EXRN) ;
	and    X18 (AND_RNTEX, dRN, dTEX) ;
	and    X19 (dAND_ERNTEX, dE, dRN, dTEX) ;
	
	and  X20 (DE_, dD, dE);
	and  X21 (QE_, Q, EX);
	or  X22 (DEor_, DE_, QE_);
	xor  X23 (D_orTI, DEor_, dTI);
	and  X24 (AND_D_orTI_RN, D_orTI, RN);
	
	xor    X26 (Y, dD,IQ) ;
	and    X27 (AND_RNTEXY ,dRN,dTEX,Y) ;
	
	
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_ERNTEX, E, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_ERNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_ERNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& AND_RNTEXY, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_RNTEXY, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& AND_D_orTI_RN, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DETEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_ERNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPHRQX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQNX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQNX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQNX10_P16 (QN, D, CP, TI, TE);
	
	output QN;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQNX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQNX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQNX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQNX19_P16 (QN, D, CP, TI, TE);
	
	output QN;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQNX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQNX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQNX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQNX29_P16 (QN, D, CP, TI, TE);
	
	output QN;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQNX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LRHF_SDFPQNX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRHF_SDFPQNX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LRHF_SDFPQNX3_P16 (QN, D, CP, TI, TE);
	
	output QN;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRHF_SDFPQNX3_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_SDFPQNX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_SDFPQNX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_SDFPQNX5_P16 (QN, D, CP, TI, TE);
	
	output QN;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_SDFPQNX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQNX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQNX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQNX5_P16 (QN, D, CP, TI, TE);
	
	output QN;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQNX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQNTX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQNTX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQNTX10_P16 (QN, TQ, D, CP, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQNTX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQNTX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQNTX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQNTX19_P16 (QN, TQ, D, CP, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQNTX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQNTX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQNTX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQNTX29_P16 (QN, TQ, D, CP, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQNTX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LRHF_SDFPQNTX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRHF_SDFPQNTX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LRHF_SDFPQNTX3_P16 (QN, TQ, D, CP, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRHF_SDFPQNTX3_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_SDFPQNTX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_SDFPQNTX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_SDFPQNTX5_P16 (QN, TQ, D, CP, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_SDFPQNTX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQNTX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQNTX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQNTX5_P16 (QN, TQ, D, CP, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQNTX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQX10_P16 (Q, D, CP, TI, TE);
	
	output Q;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQX19_P16 (Q, D, CP, TI, TE);
	
	output Q;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQX23_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQX23_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQX23_P16 (Q, D, CP, TI, TE);
	
	output Q;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQX23_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQX29_P16 (Q, D, CP, TI, TE);
	
	output Q;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LRHF_SDFPQX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRHF_SDFPQX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LRHF_SDFPQX3_P16 (Q, D, CP, TI, TE);
	
	output Q;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRHF_SDFPQX3_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_SDFPQX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_SDFPQX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_SDFPQX5_P16 (Q, D, CP, TI, TE);
	
	output Q;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_SDFPQX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQX5_P16 (Q, D, CP, TI, TE);
	
	output Q;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQTX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQTX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQTX10_P16 (Q, TQ, D, CP, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQTX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQTX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQTX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQTX19_P16 (Q, TQ, D, CP, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQTX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQTX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQTX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQTX29_P16 (Q, TQ, D, CP, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQTX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LRHF_SDFPQTX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRHF_SDFPQTX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LRHF_SDFPQTX3_P16 (Q, TQ, D, CP, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRHF_SDFPQTX3_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_SDFPQTX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_SDFPQTX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_SDFPQTX5_P16 (Q, TQ, D, CP, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_SDFPQTX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPQTX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPQTX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPQTX5_P16 (Q, TQ, D, CP, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (dTEX, dTE) ;
	
	not    Xwidth1 (TEX, TE) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXTIAND_DTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPQTX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQNX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQNX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQNX10_P16 (QN, D, CP, RN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQNX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQNX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQNX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQNX19_P16 (QN, D, CP, RN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQNX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQNX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQNX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQNX29_P16 (QN, D, CP, RN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQNX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LRHF_SDFPRQNX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRHF_SDFPRQNX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LRHF_SDFPRQNX3_P16 (QN, D, CP, RN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRHF_SDFPRQNX3_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_SDFPRQNX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_SDFPRQNX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_SDFPRQNX5_P16 (QN, D, CP, RN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_SDFPRQNX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQNX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQNX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQNX5_P16 (QN, D, CP, RN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQNX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQNTX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQNTX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQNTX10_P16 (QN, TQ, D, CP, RN, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);
		(negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQNTX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQNTX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQNTX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQNTX19_P16 (QN, TQ, D, CP, RN, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);
		(negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQNTX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQNTX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQNTX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQNTX29_P16 (QN, TQ, D, CP, RN, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);
		(negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQNTX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LRHF_SDFPRQNTX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRHF_SDFPRQNTX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LRHF_SDFPRQNTX3_P16 (QN, TQ, D, CP, RN, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);
		(negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRHF_SDFPRQNTX3_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_SDFPRQNTX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_SDFPRQNTX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_SDFPRQNTX5_P16 (QN, TQ, D, CP, RN, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);
		(negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_SDFPRQNTX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQNTX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQNTX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQNTX5_P16 (QN, TQ, D, CP, RN, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (QN +: 1'b1)) = (tDELAY,tDELAY);
		(negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQNTX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQX10_P16 (Q, D, CP, RN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQX19_P16 (Q, D, CP, RN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQX29_P16 (Q, D, CP, RN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LRHF_SDFPRQX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRHF_SDFPRQX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LRHF_SDFPRQX3_P16 (Q, D, CP, RN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRHF_SDFPRQX3_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_SDFPRQX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_SDFPRQX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_SDFPRQX5_P16 (Q, D, CP, RN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_SDFPRQX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQX5_P16 (Q, D, CP, RN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQTX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQTX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQTX10_P16 (Q, TQ, D, CP, RN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);
		(negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQTX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQTX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQTX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQTX19_P16 (Q, TQ, D, CP, RN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);
		(negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQTX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQTX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQTX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQTX29_P16 (Q, TQ, D, CP, RN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);
		(negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQTX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LRHF_SDFPRQTX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRHF_SDFPRQTX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LRHF_SDFPRQTX3_P16 (Q, TQ, D, CP, RN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);
		(negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRHF_SDFPRQTX3_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_SDFPRQTX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_SDFPRQTX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_SDFPRQTX5_P16 (Q, TQ, D, CP, RN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);
		(negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_SDFPRQTX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPRQTX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPRQTX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPRQTX5_P16 (Q, TQ, D, CP, RN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (dTEX, dTE) ;
	and    X2 (AND_DTEX, dD, dTEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (dAND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (dAND_RNTEX, dRN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_RNTE, RN, TE) ;
	and    Xwidth3 (AND_RNTEX, RN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge RN => (Q +: 1'b0)) = (tDELAY,tDELAY);
		(negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_RNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_RNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXRNTIAND_DRNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_RNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_RNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPRQTX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQNX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQNX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQNX10_P16 (QN, D, CP, SN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQNX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQNX14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQNX14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQNX14_P16 (QN, D, CP, SN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQNX14_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQNX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQNX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQNX19_P16 (QN, D, CP, SN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQNX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQNX23_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQNX23_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQNX23_P16 (QN, D, CP, SN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQNX23_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQNX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQNX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQNX29_P16 (QN, D, CP, SN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQNX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LRHF_SDFPSQNX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRHF_SDFPSQNX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LRHF_SDFPSQNX3_P16 (QN, D, CP, SN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRHF_SDFPSQNX3_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_SDFPSQNX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_SDFPSQNX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_SDFPSQNX5_P16 (QN, D, CP, SN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_SDFPSQNX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQNX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQNX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQNX5_P16 (QN, D, CP, SN, TI, TE);
	
	output QN;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQNX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQNTX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQNTX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQNTX10_P16 (QN, TQ, D, CP, SN, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);
		(negedge SN => (TQ +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQNTX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQNTX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQNTX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQNTX19_P16 (QN, TQ, D, CP, SN, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);
		(negedge SN => (TQ +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQNTX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQNTX23_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQNTX23_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQNTX23_P16 (QN, TQ, D, CP, SN, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);
		(negedge SN => (TQ +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQNTX23_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQNTX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQNTX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQNTX29_P16 (QN, TQ, D, CP, SN, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);
		(negedge SN => (TQ +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQNTX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LRHF_SDFPSQNTX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRHF_SDFPSQNTX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LRHF_SDFPSQNTX3_P16 (QN, TQ, D, CP, SN, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);
		(negedge SN => (TQ +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRHF_SDFPSQNTX3_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_SDFPSQNTX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_SDFPSQNTX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_SDFPSQNTX5_P16 (QN, TQ, D, CP, SN, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);
		(negedge SN => (TQ +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_SDFPSQNTX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQNTX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQNTX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQNTX5_P16 (QN, TQ, D, CP, SN, TI, TE);
	
	output QN;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	not   #(`st_delay_seq) U3 (QN, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	not    U3 (QN, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (QN -: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (QN +: 1'b0)) = (tDELAY,tDELAY);
		(negedge SN => (TQ +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQNTX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQX10_P16 (Q, D, CP, SN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQX14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQX14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQX14_P16 (Q, D, CP, SN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQX14_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQX19_P16 (Q, D, CP, SN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQX29_P16 (Q, D, CP, SN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LRHF_SDFPSQX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRHF_SDFPSQX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LRHF_SDFPSQX3_P16 (Q, D, CP, SN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRHF_SDFPSQX3_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_SDFPSQX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_SDFPSQX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_SDFPSQX5_P16 (Q, D, CP, SN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_SDFPSQX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQX5_P16 (Q, D, CP, SN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQTX10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQTX10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQTX10_P16 (Q, TQ, D, CP, SN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);
		(negedge SN => (TQ +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQTX10_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQTX19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQTX19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQTX19_P16 (Q, TQ, D, CP, SN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);
		(negedge SN => (TQ +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQTX19_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQTX29_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQTX29_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQTX29_P16 (Q, TQ, D, CP, SN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);
		(negedge SN => (TQ +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQTX29_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LRHF_SDFPSQTX3_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRHF_SDFPSQTX3_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LRHF_SDFPSQTX3_P16 (Q, TQ, D, CP, SN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);
		(negedge SN => (TQ +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRHF_SDFPSQTX3_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_SDFPSQTX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_SDFPSQTX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOI_LR_SDFPSQTX5_P16 (Q, TQ, D, CP, SN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);
		(negedge SN => (TQ +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LR_SDFPSQTX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFPSQTX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFPSQTX5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif

module C8T28SOIDV_LR_SDFPSQTX5_P16 (Q, TQ, D, CP, SN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	buf   #(`st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_COREPBP16_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf    U3 (Q, IQ) ;
	buf    U4 (TQ, IQ) ;
	
	not    X1 (DX, dD) ;
	not    X2 (dTEX, dTE) ;
	and    X3 (AND_DXTEX, DX, dTEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (dAND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (dAND_SNTEX, dSN, dTEX) ;
	
	not    Xwidth1 (TEX, TE) ;
	and    Xwidth2 (AND_SNTE, SN, TE) ;
	and    Xwidth3 (AND_SNTEX, SN, TEX) ;
	
	specify

		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		(posedge CP => (Q +: INTERNAL1)) = (tDELAY,tDELAY);
		(posedge CP => (TQ +: INTERNAL1)) = (tDELAY,tDELAY);
		(negedge SN => (Q +: 1'b1)) = (tDELAY,tDELAY);
		(negedge SN => (TQ +: 1'b1)) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& dAND_SNTEX, posedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& dAND_SNTEX, negedge D, tSETUP, tHOLD, NOTIFIER, , , dCP, dD);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& OR_AND_DXSNTIAND_DSNTIX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& dAND_SNTE, posedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);
		$setuphold(posedge CP &&& dAND_SNTE, negedge TI, tSETUP, tHOLD, NOTIFIER, , , dCP, dTI);

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFPSQTX5_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XNOR2X11_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XNOR2X11_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XNOR2X11_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XNOR2X11_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_XNOR2X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_XNOR2X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_XNOR2X14_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_XNOR2X14_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XNOR2X15_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XNOR2X15_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XNOR2X15_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XNOR2X15_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_XNOR2X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_XNOR2X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_XNOR2X19_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_XNOR2X19_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XNOR2X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XNOR2X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XNOR2X4_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XNOR2X4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_XNOR2X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_XNOR2X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_XNOR2X5_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_XNOR2X5_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XNOR2X8_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XNOR2X8_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XNOR2X8_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XNOR2X8_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_XNOR2X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_XNOR2X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_XNOR2X9_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (INTERNAL1, A, B) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B) (A +=> Z) = (tDELAY,tDELAY);
		if (!B) (A -=> Z) = (tDELAY,tDELAY);
		if (A) (B +=> Z) = (tDELAY,tDELAY);
		if (!A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_XNOR2X9_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_XNOR3X13_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_XNOR3X13_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_XNOR3X13_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_XNOR3X13_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XNOR3X1_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XNOR3X1_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XNOR3X1_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XNOR3X1_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_XNOR3X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_XNOR3X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_XNOR3X2_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_XNOR3X2_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XNOR3X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XNOR3X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XNOR3X2_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XNOR3X2_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_XNOR3X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_XNOR3X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_XNOR3X4_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_XNOR3X4_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XNOR3X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XNOR3X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XNOR3X5_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XNOR3X5_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XNOR3X7_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XNOR3X7_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XNOR3X7_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XNOR3X7_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_XNOR3X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_XNOR3X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_XNOR3X9_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (INTERNAL1, A, B, C) ;
	not    U2 (Z, INTERNAL1) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_XNOR3X9_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XOR2X12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XOR2X12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XOR2X12_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XOR2X12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_XOR2X13_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_XOR2X13_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_XOR2X13_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_XOR2X13_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XOR2X15_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XOR2X15_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XOR2X15_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XOR2X15_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_XOR2X17_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_XOR2X17_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_XOR2X17_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_XOR2X17_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_XOR2X18_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_XOR2X18_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_XOR2X18_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_XOR2X18_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_XOR2X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_XOR2X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_XOR2X2_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_XOR2X2_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XOR2X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XOR2X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XOR2X4_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XOR2X4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_XOR2X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_XOR2X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_XOR2X5_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_XOR2X5_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XOR2X8_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XOR2X8_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XOR2X8_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XOR2X8_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_XOR2X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_XOR2X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_XOR2X9_P16 (Z, A, B);
	
	output Z;
	input A;
	input B;
	
	xor    U1 (Z, A, B) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!B) (A +=> Z) = (tDELAY,tDELAY);
		if (B) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (B +=> Z) = (tDELAY,tDELAY);
		if (A) (B -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_XOR2X9_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_XOR3X13_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_XOR3X13_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_XOR3X13_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_XOR3X13_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XOR3X1_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XOR3X1_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XOR3X1_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XOR3X1_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_XOR3X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_XOR3X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_XOR3X2_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_XOR3X2_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XOR3X2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XOR3X2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XOR3X2_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XOR3X2_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_XOR3X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_XOR3X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_XOR3X4_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_XOR3X4_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XOR3X5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XOR3X5_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XOR3X5_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XOR3X5_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LRS_XOR3X7_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LRS_XOR3X7_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LRS_XOR3X7_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LRS_XOR3X7_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_XOR3X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_XOR3X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_XOR3X9_P16 (Z, A, B, C);
	
	output Z;
	input A;
	input B;
	input C;
	
	xor    U1 (Z, A, B, C) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (B && !C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && C) (A -=> Z) = (tDELAY,tDELAY);
		if (!B && !C) (A +=> Z) = (tDELAY,tDELAY);
		if (B && C) (A +=> Z) = (tDELAY,tDELAY);
		if (A && !C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && C) (B -=> Z) = (tDELAY,tDELAY);
		if (!A && !C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && C) (B +=> Z) = (tDELAY,tDELAY);
		if (A && !B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && B) (C -=> Z) = (tDELAY,tDELAY);
		if (!A && !B) (C +=> Z) = (tDELAY,tDELAY);
		if (A && B) (C +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_XOR3X9_P16

`endcelldefine



primitive C28SOI_SC_8_COREPBP16_LR_U_FD_P_NOTI (Q, D, CP, NOTI_REG);

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


primitive C28SOI_SC_8_COREPBP16_LR_U_FD_P_RN_NOTI (Q, D, CP, RN, NOTI_REG);

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


primitive C28SOI_SC_8_COREPBP16_LR_U_FD_P_SN_NOTI (Q, D, CP, SN, NOTI_REG);

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


primitive C28SOI_SC_8_COREPBP16_LR_U_LD_P_NOTI (Q, D, G, NOTI_REG);
 
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


primitive C28SOI_SC_8_COREPBP16_LR_U_LD_P_RN_NOTI (Q, D, G, RN, NOTI_REG);
 
   output Q;
   input  D,            // data
          G,            // clock
          RN,           // clear active low
          NOTI_REG;
   reg    Q;
 
   table
 
      // D     G     RN    NOTI_REG : Qtn : Qtn+1
 
         ?     ?     0     ?        :  ?  :  0  ;       // Asynchronous clear
 
         (?0)  1     1     ?        :  ?  :  0  ;       // Transparency
         (?1)  1     1     ?        :  ?  :  1  ;
 
         0     (?1)  1     ?        :  ?  :  0  ;
         1     (?1)  1     ?        :  ?  :  1  ;
 
         *     0     1     ?        :  ?  :  -  ;       // Latching
         *     0     x     ?        :  ?  :  -  ;
 
         ?     (?0)  ?     ?        :  ?  :  -  ;       // Ignore falling edges on clock
         ?     (1x)  ?     ?        :  ?  :  -  ;
 
         ?     0     (?1)  ?        :  ?  :  -  ;       // Rising edge on clear
         0     1     (?1)  ?        :  ?  :  0  ;
         1     1     (?1)  ?        :  ?  :  1  ;
         0     X     (?1)  ?        :  0  :  0  ;
 
         0     (0x)  1     ?        :  0  :  0  ;       // Cases reducing pessimism
         1     (0x)  1     ?        :  1  :  1  ;
         0     (0x)  X     ?        :  0  :  0  ;
 
         (?0)  x     1     ?        :  0  :  0  ;
         (?1)  x     1     ?        :  1  :  1  ;
 
         (?0)  1     x     ?        :  ?  :  0  ;
         0     (?1)  x     ?        :  ?  :  0  ;
 
         0     ?     (?x)  ?        :  0  :  0  ;
         1     0     (?x)  ?        :  0  :  0  ;
         X     0     (?x)  ?        :  0  :  0  ;
         ?     ?     ?     *        :  ?  :  x  ;       // X for timing violations

   endtable
 
endprimitive


primitive C28SOI_SC_8_COREPBP16_LR_U_MUX2 (Z, A, B, S);

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
