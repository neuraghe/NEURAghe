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
//              Verilog models for the C28SOI_SC_8_CLK_LR.CMOS028SOI
//                    (C28SOI_SC_8_CLK_LR   release 3.1.0)
// 
//
//--------------------------------------------------------------------------------
// 
//Date            : Sat Oct 18 10:26:50 2014
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

// Verilog model view for C8T28SOI_LR_CNAND2X14_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND2X14_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND2X14_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNAND2X14_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND2X14_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND2X14_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND2X14_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNAND2X14_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND2X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND2X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND2X14_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNAND2X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND2X14_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND2X14_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND2X14_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNAND2X14_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND2X19_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND2X19_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND2X19_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNAND2X19_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND2X19_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND2X19_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND2X19_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNAND2X19_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND2X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND2X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND2X19_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNAND2X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND2X19_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND2X19_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND2X19_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNAND2X19_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND2X27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND2X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND2X27_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNAND2X27_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND2X27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND2X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND2X27_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNAND2X27_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND2X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND2X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND2X27_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNAND2X27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND2X27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND2X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND2X27_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNAND2X27_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X10_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X10_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X10_P0 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X10_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X10_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X10_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X10_P10 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X10_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X10_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X10_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X10_P16 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X10_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X10_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X10_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X10_P4 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X10_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X14_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X14_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X14_P0 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X14_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X14_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X14_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X14_P10 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X14_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X14_P16 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X14_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X14_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X14_P4 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X14_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X19_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X19_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X19_P0 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X19_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X19_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X19_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X19_P10 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X19_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X19_P16 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X19_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X19_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X19_P4 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X19_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X27_P0 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X27_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X27_P10 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X27_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X27_P16 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNAND3X27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNAND3X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNAND3X27_P4 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNAND3X27_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX18_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX18_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX18_P0 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX18_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX18_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX18_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX18_P10 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX18_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX18_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX18_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX18_P16 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX18_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX18_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX18_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX18_P4 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX18_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX28_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX28_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX28_P0 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX28_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX28_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX28_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX28_P10 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX28_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX28_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX28_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX28_P16 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX28_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX28_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX28_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX28_P4 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX28_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX37_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX37_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX37_P0 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX37_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX37_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX37_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX37_P10 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX37_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX37_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX37_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX37_P16 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX37_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX37_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX37_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX37_P4 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX37_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX55_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX55_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX55_P0 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX55_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX55_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX55_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX55_P10 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX55_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX55_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX55_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX55_P16 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX55_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX55_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX55_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX55_P4 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX55_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX74_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX74_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX74_P0 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX74_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX74_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX74_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX74_P10 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX74_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX74_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX74_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX74_P16 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX74_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNBFX74_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNBFX74_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNBFX74_P4 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNBFX74_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX12_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX12_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX12_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX12_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX12_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX12_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX12_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX12_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX12_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX12_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX12_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX12_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX12_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX18_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX18_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX18_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX18_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX18_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX18_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX18_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX18_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX18_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX18_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX18_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX18_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX18_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX18_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX18_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX18_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX23_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX23_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX23_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX23_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX23_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX23_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX23_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX23_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX23_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX23_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX23_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX23_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX23_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX23_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX23_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX23_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX28_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX28_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX28_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX28_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX28_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX28_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX28_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX28_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX28_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX28_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX28_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX28_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX28_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX28_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX28_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX28_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX2_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX2_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX2_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX2_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX2_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX2_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX2_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX2_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX2_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX2_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX2_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX2_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX2_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX2_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX32_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX32_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX32_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX32_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX32_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX32_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX32_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX32_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX32_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX32_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX32_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX32_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX32_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX32_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX32_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX32_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX37_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX37_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX37_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX37_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX37_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX37_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX37_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX37_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX37_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX37_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX37_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX37_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX37_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX37_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX37_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX37_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX4_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX4_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX4_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX4_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX4_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX4_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX4_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX4_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX4_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX4_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX4_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX4_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX4_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX54_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX54_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX54_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX54_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX54_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX54_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX54_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX54_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX54_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX54_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX54_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX54_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX54_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX54_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX54_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX54_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX8_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX8_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX8_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX8_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX8_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX8_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX8_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX8_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX8_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX8_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX8_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX8_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNBFX8_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNBFX8_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNBFX8_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNBFX8_P4

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX13_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX13_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX13_P0 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX13_P0

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX13_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX13_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX13_P10 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX13_P10

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX13_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX13_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX13_P16 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX13_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX13_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX13_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX13_P4 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX13_P4

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX17_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX17_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX17_P0 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX17_P0

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX17_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX17_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX17_P10 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX17_P10

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX17_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX17_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX17_P16 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX17_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX17_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX17_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX17_P4 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX17_P4

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX21_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX21_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX21_P0 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX21_P0

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX21_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX21_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX21_P10 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX21_P10

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX21_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX21_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX21_P16 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX21_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX21_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX21_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX21_P4 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX21_P4

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX27_P0 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX27_P0

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX27_P10 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX27_P10

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX27_P16 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX27_P4 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX27_P4

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX30_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX30_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX30_P0 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX30_P0

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX30_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX30_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX30_P10 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX30_P10

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX30_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX30_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX30_P16 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX30_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX30_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX30_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX30_P4 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX30_P4

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX38_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX38_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX38_P0 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX38_P0

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX38_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX38_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX38_P10 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX38_P10

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX38_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX38_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX38_P16 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX38_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX38_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX38_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX38_P4 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX38_P4

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX4_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX4_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX4_P0 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX4_P0

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX4_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX4_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX4_P10 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX4_P10

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX4_P16 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX4_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX4_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX4_P4 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX4_P4

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX54_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX54_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX54_P0 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX54_P0

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX54_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX54_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX54_P10 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX54_P10

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX54_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX54_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX54_P16 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX54_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX54_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX54_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX54_P4 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX54_P4

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX9_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX9_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX9_P0 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX9_P0

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX9_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX9_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX9_P10 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX9_P10

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX9_P16 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LRP_CNHLSX9_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LRP_CNHLSX9_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LRP_CNHLSX9_P4 (Q, CP, E, TE);
	
	output Q;
	input CP;
	input E;
	input TE;
	
   `ifdef functional
	reg  NOTIFIER;
	or    U1 (INTERNAL1, E, TE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, CP) ;
	buf    U5 (Q, INTERNAL3) ;
	
   `else
	reg  NOTIFIER;
	or    U1 (INTERNAL1, dE, dTE) ;
	C28SOI_SC_8_CLK_LR_U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
	and   U4 (INTERNAL3, IE, dCP) ;
	buf    U5 (Q, INTERNAL3) ;
	
	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
	not                   U10 (conditiontrue, 1'b0);
	
	specify

		specparam tDELAY = 0.0 ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;

		if (conditiontrue)  (CP +=> Q) = (tDELAY,tDELAY);

		$setuphold(posedge CP &&& TEX, posedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& TEX, negedge E, tSETUP, tHOLD, NOTIFIER, , , dCP, dE);
		$setuphold(posedge CP &&& EX, posedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);
		$setuphold(posedge CP &&& EX, negedge TE, tSETUP, tHOLD, NOTIFIER, , , dCP, dTE);

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER);

	endspecify
   `endif

endmodule // C8T28SOI_LRP_CNHLSX9_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX18_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX18_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX18_P0 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX18_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX18_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX18_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX18_P10 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX18_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX18_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX18_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX18_P16 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX18_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX18_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX18_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX18_P4 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX18_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX28_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX28_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX28_P0 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX28_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX28_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX28_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX28_P10 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX28_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX28_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX28_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX28_P16 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX28_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX28_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX28_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX28_P4 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX28_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX37_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX37_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX37_P0 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX37_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX37_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX37_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX37_P10 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX37_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX37_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX37_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX37_P16 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX37_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX37_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX37_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX37_P4 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX37_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX55_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX55_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX55_P0 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX55_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX55_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX55_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX55_P10 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX55_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX55_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX55_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX55_P16 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX55_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX55_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX55_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX55_P4 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX55_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX74_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX74_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX74_P0 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX74_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX74_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX74_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX74_P10 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX74_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX74_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX74_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX74_P16 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX74_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNIVX74_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNIVX74_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNIVX74_P4 (Z, A);
	
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

endmodule // C8T28SOIDV_LR_CNIVX74_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX14_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX14_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX14_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX14_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX14_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX14_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX14_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX14_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX14_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX14_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX14_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX14_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX14_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX18_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX18_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX18_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX18_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX18_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX18_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX18_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX18_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX18_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX18_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX18_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX18_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX18_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX18_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX18_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX18_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX22_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX22_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX22_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX22_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX22_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX22_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX22_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX22_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX22_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX22_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX22_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX22_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX22_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX22_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX22_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX22_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX27_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX27_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX27_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX27_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX27_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX27_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX27_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX2_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX2_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX2_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX2_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX2_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX2_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX2_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX2_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX2_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX2_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX2_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX2_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX2_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX2_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX2_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX2_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX32_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX32_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX32_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX32_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX32_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX32_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX32_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX32_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX32_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX32_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX32_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX32_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX32_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX32_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX32_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX32_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX37_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX37_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX37_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX37_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX37_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX37_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX37_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX37_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX37_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX37_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX37_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX37_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX37_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX37_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX37_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX37_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX4_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX4_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX4_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX4_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX4_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX4_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX4_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX4_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX4_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX4_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX4_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX4_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX4_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX74_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX74_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX74_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX74_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX74_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX74_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX74_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX74_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX74_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX74_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX74_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX74_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX74_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX74_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX74_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX74_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX9_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX9_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX9_P0 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX9_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX9_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX9_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX9_P10 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX9_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX9_P16 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNIVX9_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNIVX9_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNIVX9_P4 (Z, A);
	
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

endmodule // C8T28SOI_LR_CNIVX9_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNMUX21X15_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNMUX21X15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNMUX21X15_P0 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
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

endmodule // C8T28SOI_LR_CNMUX21X15_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNMUX21X15_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNMUX21X15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNMUX21X15_P10 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
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

endmodule // C8T28SOI_LR_CNMUX21X15_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNMUX21X15_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNMUX21X15_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNMUX21X15_P16 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
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

endmodule // C8T28SOI_LR_CNMUX21X15_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNMUX21X15_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNMUX21X15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNMUX21X15_P4 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
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

endmodule // C8T28SOI_LR_CNMUX21X15_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNMUX21X27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNMUX21X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNMUX21X27_P0 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
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

endmodule // C8T28SOI_LR_CNMUX21X27_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNMUX21X27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNMUX21X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNMUX21X27_P10 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
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

endmodule // C8T28SOI_LR_CNMUX21X27_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNMUX21X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNMUX21X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNMUX21X27_P16 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
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

endmodule // C8T28SOI_LR_CNMUX21X27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNMUX21X27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNMUX21X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNMUX21X27_P4 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
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

endmodule // C8T28SOI_LR_CNMUX21X27_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNMUX21X9_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNMUX21X9_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNMUX21X9_P0 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
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

endmodule // C8T28SOI_LR_CNMUX21X9_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNMUX21X9_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNMUX21X9_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNMUX21X9_P10 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
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

endmodule // C8T28SOI_LR_CNMUX21X9_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNMUX21X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNMUX21X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNMUX21X9_P16 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
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

endmodule // C8T28SOI_LR_CNMUX21X9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNMUX21X9_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNMUX21X9_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNMUX21X9_P4 (Z, D0, D1, S0);
	
	output Z;
	input D0;
	input D1;
	input S0;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (Z, D0, D1, S0) ;
	
	
	
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

endmodule // C8T28SOI_LR_CNMUX21X9_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNMUX41X27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNMUX41X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNMUX41X27_P0 (Z, D0, D1, D2, D3, S0, S1);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U3 (Z, INTERNAL1, INTERNAL2, S1) ;
	
	
	
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

endmodule // C8T28SOIDV_LR_CNMUX41X27_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNMUX41X27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNMUX41X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNMUX41X27_P10 (Z, D0, D1, D2, D3, S0, S1);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U3 (Z, INTERNAL1, INTERNAL2, S1) ;
	
	
	
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

endmodule // C8T28SOIDV_LR_CNMUX41X27_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNMUX41X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNMUX41X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNMUX41X27_P16 (Z, D0, D1, D2, D3, S0, S1);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U3 (Z, INTERNAL1, INTERNAL2, S1) ;
	
	
	
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

endmodule // C8T28SOIDV_LR_CNMUX41X27_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNMUX41X27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNMUX41X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNMUX41X27_P4 (Z, D0, D1, D2, D3, S0, S1);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U3 (Z, INTERNAL1, INTERNAL2, S1) ;
	
	
	
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

endmodule // C8T28SOIDV_LR_CNMUX41X27_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNMUX41X9_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNMUX41X9_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNMUX41X9_P0 (Z, D0, D1, D2, D3, S0, S1);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U3 (Z, INTERNAL1, INTERNAL2, S1) ;
	
	
	
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

endmodule // C8T28SOIDV_LR_CNMUX41X9_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNMUX41X9_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNMUX41X9_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNMUX41X9_P10 (Z, D0, D1, D2, D3, S0, S1);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U3 (Z, INTERNAL1, INTERNAL2, S1) ;
	
	
	
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

endmodule // C8T28SOIDV_LR_CNMUX41X9_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNMUX41X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNMUX41X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNMUX41X9_P16 (Z, D0, D1, D2, D3, S0, S1);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U3 (Z, INTERNAL1, INTERNAL2, S1) ;
	
	
	
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

endmodule // C8T28SOIDV_LR_CNMUX41X9_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNMUX41X9_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNMUX41X9_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNMUX41X9_P4 (Z, D0, D1, D2, D3, S0, S1);
	
	output Z;
	input D0;
	input D1;
	input D2;
	input D3;
	input S0;
	input S1;
	
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
	C28SOI_SC_8_CLK_LR_U_MUX2   U3 (Z, INTERNAL1, INTERNAL2, S1) ;
	
	
	
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

endmodule // C8T28SOIDV_LR_CNMUX41X9_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2X15_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2X15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2X15_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2X15_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2X15_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2X15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2X15_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2X15_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2X15_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2X15_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2X15_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2X15_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2X15_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2X15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2X15_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2X15_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2X27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2X27_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2X27_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2X27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2X27_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2X27_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2X27_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2X27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2X27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2X27_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2X27_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2X8_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2X8_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2X8_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2X8_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2X8_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2X8_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2X8_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2X8_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2X8_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2X8_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2X8_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2X8_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2X8_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2X8_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2X8_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2X8_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2AX15_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2AX15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2AX15_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2AX15_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2AX15_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2AX15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2AX15_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2AX15_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2AX15_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2AX15_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2AX15_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2AX15_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2AX15_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2AX15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2AX15_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2AX15_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2AX27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2AX27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2AX27_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2AX27_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2AX27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2AX27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2AX27_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2AX27_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2AX27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2AX27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2AX27_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2AX27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2AX27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2AX27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2AX27_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2AX27_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2AX9_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2AX9_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2AX9_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2AX9_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2AX9_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2AX9_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2AX9_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2AX9_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2AX9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2AX9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2AX9_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2AX9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNAND2AX9_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNAND2AX9_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNAND2AX9_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNAND2AX9_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2X15_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2X15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2X15_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2X15_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2X15_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2X15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2X15_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2X15_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2X15_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2X15_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2X15_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2X15_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2X15_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2X15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2X15_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2X15_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2X27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2X27_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2X27_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2X27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2X27_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2X27_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2X27_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2X27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2X27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2X27_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2X27_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2X8_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2X8_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2X8_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2X8_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2X8_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2X8_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2X8_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2X8_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2X8_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2X8_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2X8_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2X8_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2X8_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2X8_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2X8_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2X8_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2AX15_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2AX15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2AX15_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2AX15_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2AX15_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2AX15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2AX15_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2AX15_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2AX15_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2AX15_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2AX15_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2AX15_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2AX15_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2AX15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2AX15_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2AX15_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2AX27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2AX27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2AX27_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2AX27_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2AX27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2AX27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2AX27_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2AX27_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2AX27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2AX27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2AX27_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2AX27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2AX27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2AX27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2AX27_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2AX27_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2AX9_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2AX9_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2AX9_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2AX9_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2AX9_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2AX9_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2AX9_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2AX9_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2AX9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2AX9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2AX9_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2AX9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNNOR2AX9_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNNOR2AX9_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNNOR2AX9_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNNOR2AX9_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR2X19_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR2X19_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR2X19_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNOR2X19_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR2X19_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR2X19_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR2X19_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNOR2X19_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR2X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR2X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR2X19_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNOR2X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR2X19_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR2X19_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR2X19_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNOR2X19_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR2X37_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR2X37_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR2X37_P0 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNOR2X37_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR2X37_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR2X37_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR2X37_P10 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNOR2X37_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR2X37_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR2X37_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR2X37_P16 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNOR2X37_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR2X37_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR2X37_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR2X37_P4 (Z, A, B);
	
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

endmodule // C8T28SOI_LR_CNOR2X37_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNOR3X27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNOR3X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNOR3X27_P0 (Z, A, B, C);
	
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

endmodule // C8T28SOIDV_LR_CNOR3X27_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNOR3X27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNOR3X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNOR3X27_P10 (Z, A, B, C);
	
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

endmodule // C8T28SOIDV_LR_CNOR3X27_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNOR3X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNOR3X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNOR3X27_P16 (Z, A, B, C);
	
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

endmodule // C8T28SOIDV_LR_CNOR3X27_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNOR3X27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNOR3X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNOR3X27_P4 (Z, A, B, C);
	
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

endmodule // C8T28SOIDV_LR_CNOR3X27_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR3X14_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR3X14_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR3X14_P0 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNOR3X14_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR3X14_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR3X14_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR3X14_P10 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNOR3X14_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR3X14_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR3X14_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR3X14_P16 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNOR3X14_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR3X14_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR3X14_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR3X14_P4 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNOR3X14_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR3X19_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR3X19_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR3X19_P0 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNOR3X19_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR3X19_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR3X19_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR3X19_P10 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNOR3X19_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR3X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR3X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR3X19_P16 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNOR3X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR3X19_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR3X19_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR3X19_P4 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNOR3X19_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR3X27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR3X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR3X27_P0 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNOR3X27_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR3X27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR3X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR3X27_P10 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNOR3X27_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR3X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR3X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR3X27_P16 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNOR3X27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR3X27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR3X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR3X27_P4 (Z, A, B, C);
	
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

endmodule // C8T28SOI_LR_CNOR3X27_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNOR4X27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNOR4X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNOR4X27_P0 (Z, A, B, C, D);
	
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

endmodule // C8T28SOIDV_LR_CNOR4X27_P0

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNOR4X27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNOR4X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNOR4X27_P10 (Z, A, B, C, D);
	
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

endmodule // C8T28SOIDV_LR_CNOR4X27_P10

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNOR4X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNOR4X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNOR4X27_P16 (Z, A, B, C, D);
	
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

endmodule // C8T28SOIDV_LR_CNOR4X27_P16

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNOR4X27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNOR4X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOIDV_LR_CNOR4X27_P4 (Z, A, B, C, D);
	
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

endmodule // C8T28SOIDV_LR_CNOR4X27_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR4X19_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR4X19_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR4X19_P0 (Z, A, B, C, D);
	
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

endmodule // C8T28SOI_LR_CNOR4X19_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR4X19_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR4X19_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR4X19_P10 (Z, A, B, C, D);
	
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

endmodule // C8T28SOI_LR_CNOR4X19_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR4X19_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR4X19_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR4X19_P16 (Z, A, B, C, D);
	
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

endmodule // C8T28SOI_LR_CNOR4X19_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR4X19_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR4X19_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR4X19_P4 (Z, A, B, C, D);
	
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

endmodule // C8T28SOI_LR_CNOR4X19_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR4X27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR4X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR4X27_P0 (Z, A, B, C, D);
	
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

endmodule // C8T28SOI_LR_CNOR4X27_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR4X27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR4X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR4X27_P10 (Z, A, B, C, D);
	
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

endmodule // C8T28SOI_LR_CNOR4X27_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR4X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR4X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR4X27_P16 (Z, A, B, C, D);
	
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

endmodule // C8T28SOI_LR_CNOR4X27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNOR4X27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNOR4X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNOR4X27_P4 (Z, A, B, C, D);
	
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

endmodule // C8T28SOI_LR_CNOR4X27_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNSDFPRQTX9_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNSDFPRQTX9_P0

`celldefine

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

module C8T28SOIDV_LR_CNSDFPRQTX9_P0 (Q, TQ, D, CP, RN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
	parameter p_st_delay_seq = `st_delay_seq ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(p_st_delay_seq) U3 (Q, IQ) ;
	buf   #(p_st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
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

endmodule // C8T28SOIDV_LR_CNSDFPRQTX9_P0

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNSDFPRQTX9_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNSDFPRQTX9_P10

`celldefine

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

module C8T28SOIDV_LR_CNSDFPRQTX9_P10 (Q, TQ, D, CP, RN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
	parameter p_st_delay_seq = `st_delay_seq ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(p_st_delay_seq) U3 (Q, IQ) ;
	buf   #(p_st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
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

endmodule // C8T28SOIDV_LR_CNSDFPRQTX9_P10

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNSDFPRQTX9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNSDFPRQTX9_P16

`celldefine

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

module C8T28SOIDV_LR_CNSDFPRQTX9_P16 (Q, TQ, D, CP, RN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
	parameter p_st_delay_seq = `st_delay_seq ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(p_st_delay_seq) U3 (Q, IQ) ;
	buf   #(p_st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
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

endmodule // C8T28SOIDV_LR_CNSDFPRQTX9_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNSDFPRQTX9_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNSDFPRQTX9_P4

`celldefine

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

module C8T28SOIDV_LR_CNSDFPRQTX9_P4 (Q, TQ, D, CP, RN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;
	
	parameter p_st_delay_seq = `st_delay_seq ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(p_st_delay_seq) U3 (Q, IQ) ;
	buf   #(p_st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
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

endmodule // C8T28SOIDV_LR_CNSDFPRQTX9_P4

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNSDFPSQTX9_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNSDFPSQTX9_P0

`celldefine

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

module C8T28SOIDV_LR_CNSDFPSQTX9_P0 (Q, TQ, D, CP, SN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
	parameter p_st_delay_seq = `st_delay_seq ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(p_st_delay_seq) U3 (Q, IQ) ;
	buf   #(p_st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
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

endmodule // C8T28SOIDV_LR_CNSDFPSQTX9_P0

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNSDFPSQTX9_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNSDFPSQTX9_P10

`celldefine

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

module C8T28SOIDV_LR_CNSDFPSQTX9_P10 (Q, TQ, D, CP, SN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
	parameter p_st_delay_seq = `st_delay_seq ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(p_st_delay_seq) U3 (Q, IQ) ;
	buf   #(p_st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
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

endmodule // C8T28SOIDV_LR_CNSDFPSQTX9_P10

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNSDFPSQTX9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNSDFPSQTX9_P16

`celldefine

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

module C8T28SOIDV_LR_CNSDFPSQTX9_P16 (Q, TQ, D, CP, SN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
	parameter p_st_delay_seq = `st_delay_seq ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(p_st_delay_seq) U3 (Q, IQ) ;
	buf   #(p_st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
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

endmodule // C8T28SOIDV_LR_CNSDFPSQTX9_P16

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_CNSDFPSQTX9_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_CNSDFPSQTX9_P4

`celldefine

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

module C8T28SOIDV_LR_CNSDFPSQTX9_P4 (Q, TQ, D, CP, SN, TI, TE);
	
	output Q;
	output TQ;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;
	
	parameter p_st_delay_seq = `st_delay_seq ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(p_st_delay_seq) U3 (Q, IQ) ;
	buf   #(p_st_delay_seq) U4 (TQ, IQ) ;
	
   `else
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
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

endmodule // C8T28SOIDV_LR_CNSDFPSQTX9_P4

`undef st_delay_seq

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNXOR2X15_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNXOR2X15_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNXOR2X15_P0 (Z, A, S);
	
	output Z;
	input A;
	input S;
	
	xor    U1 (Z, A, S) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!S) (A +=> Z) = (tDELAY,tDELAY);
		if (S) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (S +=> Z) = (tDELAY,tDELAY);
		if (A) (S -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CNXOR2X15_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNXOR2X15_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNXOR2X15_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNXOR2X15_P10 (Z, A, S);
	
	output Z;
	input A;
	input S;
	
	xor    U1 (Z, A, S) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!S) (A +=> Z) = (tDELAY,tDELAY);
		if (S) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (S +=> Z) = (tDELAY,tDELAY);
		if (A) (S -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CNXOR2X15_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNXOR2X15_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNXOR2X15_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNXOR2X15_P16 (Z, A, S);
	
	output Z;
	input A;
	input S;
	
	xor    U1 (Z, A, S) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!S) (A +=> Z) = (tDELAY,tDELAY);
		if (S) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (S +=> Z) = (tDELAY,tDELAY);
		if (A) (S -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CNXOR2X15_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNXOR2X15_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNXOR2X15_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNXOR2X15_P4 (Z, A, S);
	
	output Z;
	input A;
	input S;
	
	xor    U1 (Z, A, S) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!S) (A +=> Z) = (tDELAY,tDELAY);
		if (S) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (S +=> Z) = (tDELAY,tDELAY);
		if (A) (S -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CNXOR2X15_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNXOR2X27_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNXOR2X27_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNXOR2X27_P0 (Z, A, S);
	
	output Z;
	input A;
	input S;
	
	xor    U1 (Z, A, S) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!S) (A +=> Z) = (tDELAY,tDELAY);
		if (S) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (S +=> Z) = (tDELAY,tDELAY);
		if (A) (S -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CNXOR2X27_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNXOR2X27_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNXOR2X27_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNXOR2X27_P10 (Z, A, S);
	
	output Z;
	input A;
	input S;
	
	xor    U1 (Z, A, S) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!S) (A +=> Z) = (tDELAY,tDELAY);
		if (S) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (S +=> Z) = (tDELAY,tDELAY);
		if (A) (S -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CNXOR2X27_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNXOR2X27_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNXOR2X27_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNXOR2X27_P16 (Z, A, S);
	
	output Z;
	input A;
	input S;
	
	xor    U1 (Z, A, S) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!S) (A +=> Z) = (tDELAY,tDELAY);
		if (S) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (S +=> Z) = (tDELAY,tDELAY);
		if (A) (S -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CNXOR2X27_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNXOR2X27_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNXOR2X27_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNXOR2X27_P4 (Z, A, S);
	
	output Z;
	input A;
	input S;
	
	xor    U1 (Z, A, S) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!S) (A +=> Z) = (tDELAY,tDELAY);
		if (S) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (S +=> Z) = (tDELAY,tDELAY);
		if (A) (S -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CNXOR2X27_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNXOR2X9_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNXOR2X9_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNXOR2X9_P0 (Z, A, S);
	
	output Z;
	input A;
	input S;
	
	xor    U1 (Z, A, S) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!S) (A +=> Z) = (tDELAY,tDELAY);
		if (S) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (S +=> Z) = (tDELAY,tDELAY);
		if (A) (S -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CNXOR2X9_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNXOR2X9_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNXOR2X9_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNXOR2X9_P10 (Z, A, S);
	
	output Z;
	input A;
	input S;
	
	xor    U1 (Z, A, S) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!S) (A +=> Z) = (tDELAY,tDELAY);
		if (S) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (S +=> Z) = (tDELAY,tDELAY);
		if (A) (S -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CNXOR2X9_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNXOR2X9_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNXOR2X9_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNXOR2X9_P16 (Z, A, S);
	
	output Z;
	input A;
	input S;
	
	xor    U1 (Z, A, S) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!S) (A +=> Z) = (tDELAY,tDELAY);
		if (S) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (S +=> Z) = (tDELAY,tDELAY);
		if (A) (S -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CNXOR2X9_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_CNXOR2X9_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_CNXOR2X9_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_CNXOR2X9_P4 (Z, A, S);
	
	output Z;
	input A;
	input S;
	
	xor    U1 (Z, A, S) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		if (!S) (A +=> Z) = (tDELAY,tDELAY);
		if (S) (A -=> Z) = (tDELAY,tDELAY);
		if (!A) (S +=> Z) = (tDELAY,tDELAY);
		if (A) (S -=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_CNXOR2X9_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM4X12_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM4X12_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM4X12_P0 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM4X12_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM4X12_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM4X12_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM4X12_P10 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM4X12_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM4X12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM4X12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM4X12_P16 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM4X12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM4X12_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM4X12_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM4X12_P4 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM4X12_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM4X4_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM4X4_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM4X4_P0 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM4X4_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM4X4_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM4X4_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM4X4_P10 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM4X4_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM4X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM4X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM4X4_P16 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM4X4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM4X4_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM4X4_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM4X4_P4 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM4X4_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM8X12_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM8X12_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM8X12_P0 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM8X12_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM8X12_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM8X12_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM8X12_P10 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM8X12_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM8X12_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM8X12_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM8X12_P16 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM8X12_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM8X12_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM8X12_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM8X12_P4 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM8X12_P4

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM8X4_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM8X4_P0

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM8X4_P0 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM8X4_P0

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM8X4_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM8X4_P10

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM8X4_P10 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM8X4_P10

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM8X4_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM8X4_P16

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM8X4_P16 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM8X4_P16

`endcelldefine

// Verilog model view for C8T28SOI_LR_DLYHFM8X4_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOI_LR_DLYHFM8X4_P4

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

module C8T28SOI_LR_DLYHFM8X4_P4 (Z, A);
	
	output Z;
	input A;
	
	reg  NOTIFIER;
	buf    U1 (IZ, A) ;
	buf    U2 (Z, IZ) ;
	
	
	
   `ifdef functional
   `else
	specify

		specparam tDELAY = 0.0 ;

		(A +=> Z) = (tDELAY,tDELAY);

	endspecify
   `endif

endmodule // C8T28SOI_LR_DLYHFM8X4_P4

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFSYNCPQX5_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFSYNCPQX5_P0

`celldefine

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

`ifdef ST_MSG_CONTROL_TIME
    `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
    `define st_msg_cntrl_time 0.001
`endif


module C8T28SOIDV_LR_SDFSYNCPQX5_P0 (Q, D, CP, TI, TE);
	
	output Q;
	input D;
	input CP;
	input TI;
	input TE;

	parameter message_control_time = `st_msg_cntrl_time;
	
	reg [1:0] debug_level;
	
	`ifdef ST_ALL_MSG_MODE
		parameter p_debug_level = 2'b11;
	`elsif ST_ERROR_ONLY_MODE
		parameter p_debug_level = 2'b01;
	`elsif ST_NO_MSG_MODE
		parameter p_debug_level = 2'b00;
	`else
		parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
	`endif
	
	initial
	begin
	  debug_level= p_debug_level ;
	end
	
	initial
	begin
	  $timeformat(-9,6," ns --",10);
	end

	parameter param_st_ignore_setuphold_syncflop = 0 ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	reg  NOTIFIER_UPD;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER_UPD) ;
	buf    U3 (Q, IQ) ;

	always @(NOTIFIER)
	 begin
	   if (param_st_ignore_setuphold_syncflop != 1)
		NOTIFIER_UPD <= NOTIFIER ;
	   else
	     if( (debug_level > 1) && ($realtime > message_control_time) )
	          $display ("%m - %t ST_INFO : SYNC FLOP parameter param_st_ignore_setuphold_syncflop found active, Checks on Setup/Hold will be de-activated, X will not be propagated on output.", $realtime);
	 end

	
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

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER_UPD);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFSYNCPQX5_P0

`undef st_delay_seq
`undef st_msg_cntrl_time

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFSYNCPQX5_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFSYNCPQX5_P10

`celldefine

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

`ifdef ST_MSG_CONTROL_TIME
    `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
    `define st_msg_cntrl_time 0.001
`endif


module C8T28SOIDV_LR_SDFSYNCPQX5_P10 (Q, D, CP, TI, TE);
	
	output Q;
	input D;
	input CP;
	input TI;
	input TE;

	parameter message_control_time = `st_msg_cntrl_time;
	
	reg [1:0] debug_level;
	
	`ifdef ST_ALL_MSG_MODE
		parameter p_debug_level = 2'b11;
	`elsif ST_ERROR_ONLY_MODE
		parameter p_debug_level = 2'b01;
	`elsif ST_NO_MSG_MODE
		parameter p_debug_level = 2'b00;
	`else
		parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
	`endif
	
	initial
	begin
	  debug_level= p_debug_level ;
	end
	
	initial
	begin
	  $timeformat(-9,6," ns --",10);
	end

	parameter param_st_ignore_setuphold_syncflop = 0 ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	reg  NOTIFIER_UPD;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER_UPD) ;
	buf    U3 (Q, IQ) ;

	always @(NOTIFIER)
	 begin
	   if (param_st_ignore_setuphold_syncflop != 1)
		NOTIFIER_UPD <= NOTIFIER ;
	   else
	     if( (debug_level > 1) && ($realtime > message_control_time) )
	          $display ("%m - %t ST_INFO : SYNC FLOP parameter param_st_ignore_setuphold_syncflop found active, Checks on Setup/Hold will be de-activated, X will not be propagated on output.", $realtime);
	 end

	
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

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER_UPD);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFSYNCPQX5_P10

`undef st_delay_seq
`undef st_msg_cntrl_time

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFSYNCPQX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFSYNCPQX5_P16

`celldefine

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

`ifdef ST_MSG_CONTROL_TIME
    `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
    `define st_msg_cntrl_time 0.001
`endif


module C8T28SOIDV_LR_SDFSYNCPQX5_P16 (Q, D, CP, TI, TE);
	
	output Q;
	input D;
	input CP;
	input TI;
	input TE;

	parameter message_control_time = `st_msg_cntrl_time;
	
	reg [1:0] debug_level;
	
	`ifdef ST_ALL_MSG_MODE
		parameter p_debug_level = 2'b11;
	`elsif ST_ERROR_ONLY_MODE
		parameter p_debug_level = 2'b01;
	`elsif ST_NO_MSG_MODE
		parameter p_debug_level = 2'b00;
	`else
		parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
	`endif
	
	initial
	begin
	  debug_level= p_debug_level ;
	end
	
	initial
	begin
	  $timeformat(-9,6," ns --",10);
	end

	parameter param_st_ignore_setuphold_syncflop = 0 ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	reg  NOTIFIER_UPD;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER_UPD) ;
	buf    U3 (Q, IQ) ;

	always @(NOTIFIER)
	 begin
	   if (param_st_ignore_setuphold_syncflop != 1)
		NOTIFIER_UPD <= NOTIFIER ;
	   else
	     if( (debug_level > 1) && ($realtime > message_control_time) )
	          $display ("%m - %t ST_INFO : SYNC FLOP parameter param_st_ignore_setuphold_syncflop found active, Checks on Setup/Hold will be de-activated, X will not be propagated on output.", $realtime);
	 end

	
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

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER_UPD);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFSYNCPQX5_P16

`undef st_delay_seq
`undef st_msg_cntrl_time

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFSYNCPQX5_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFSYNCPQX5_P4

`celldefine

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

`ifdef ST_MSG_CONTROL_TIME
    `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
    `define st_msg_cntrl_time 0.001
`endif


module C8T28SOIDV_LR_SDFSYNCPQX5_P4 (Q, D, CP, TI, TE);
	
	output Q;
	input D;
	input CP;
	input TI;
	input TE;

	parameter message_control_time = `st_msg_cntrl_time;
	
	reg [1:0] debug_level;
	
	`ifdef ST_ALL_MSG_MODE
		parameter p_debug_level = 2'b11;
	`elsif ST_ERROR_ONLY_MODE
		parameter p_debug_level = 2'b01;
	`elsif ST_NO_MSG_MODE
		parameter p_debug_level = 2'b00;
	`else
		parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
	`endif
	
	initial
	begin
	  debug_level= p_debug_level ;
	end
	
	initial
	begin
	  $timeformat(-9,6," ns --",10);
	end

	parameter param_st_ignore_setuphold_syncflop = 0 ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	reg  NOTIFIER_UPD;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER_UPD) ;
	buf    U3 (Q, IQ) ;

	always @(NOTIFIER)
	 begin
	   if (param_st_ignore_setuphold_syncflop != 1)
		NOTIFIER_UPD <= NOTIFIER ;
	   else
	     if( (debug_level > 1) && ($realtime > message_control_time) )
	          $display ("%m - %t ST_INFO : SYNC FLOP parameter param_st_ignore_setuphold_syncflop found active, Checks on Setup/Hold will be de-activated, X will not be propagated on output.", $realtime);
	 end

	
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

		$width(negedge CP &&& TE, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& TEX, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& TE, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& TEX, tPULSE, 0, NOTIFIER_UPD);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFSYNCPQX5_P4

`undef st_delay_seq
`undef st_msg_cntrl_time

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFSYNCPRQX5_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFSYNCPRQX5_P0

`celldefine

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

`ifdef ST_MSG_CONTROL_TIME
    `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
    `define st_msg_cntrl_time 0.001
`endif


module C8T28SOIDV_LR_SDFSYNCPRQX5_P0 (Q, D, CP, RN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;

	parameter message_control_time = `st_msg_cntrl_time;
	
	reg [1:0] debug_level;
	
	`ifdef ST_ALL_MSG_MODE
		parameter p_debug_level = 2'b11;
	`elsif ST_ERROR_ONLY_MODE
		parameter p_debug_level = 2'b01;
	`elsif ST_NO_MSG_MODE
		parameter p_debug_level = 2'b00;
	`else
		parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
	`endif
	
	initial
	begin
	  debug_level= p_debug_level ;
	end
	
	initial
	begin
	  $timeformat(-9,6," ns --",10);
	end

	parameter param_st_ignore_setuphold_syncflop = 0 ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	reg  NOTIFIER_UPD;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER_UPD) ;
	buf    U3 (Q, IQ) ;

	always @(NOTIFIER)
	 begin
	   if (param_st_ignore_setuphold_syncflop != 1)
		NOTIFIER_UPD <= NOTIFIER ;
	   else
	     if( (debug_level > 1) && ($realtime > message_control_time) )
	          $display ("%m - %t ST_INFO : SYNC FLOP parameter param_st_ignore_setuphold_syncflop found active, Checks on Setup/Hold will be de-activated, X will not be propagated on output.", $realtime);
	 end

	
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

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER_UPD, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER_UPD);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFSYNCPRQX5_P0

`undef st_delay_seq
`undef st_msg_cntrl_time

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFSYNCPRQX5_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFSYNCPRQX5_P10

`celldefine

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

`ifdef ST_MSG_CONTROL_TIME
    `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
    `define st_msg_cntrl_time 0.001
`endif


module C8T28SOIDV_LR_SDFSYNCPRQX5_P10 (Q, D, CP, RN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;

	parameter message_control_time = `st_msg_cntrl_time;
	
	reg [1:0] debug_level;
	
	`ifdef ST_ALL_MSG_MODE
		parameter p_debug_level = 2'b11;
	`elsif ST_ERROR_ONLY_MODE
		parameter p_debug_level = 2'b01;
	`elsif ST_NO_MSG_MODE
		parameter p_debug_level = 2'b00;
	`else
		parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
	`endif
	
	initial
	begin
	  debug_level= p_debug_level ;
	end
	
	initial
	begin
	  $timeformat(-9,6," ns --",10);
	end

	parameter param_st_ignore_setuphold_syncflop = 0 ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	reg  NOTIFIER_UPD;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER_UPD) ;
	buf    U3 (Q, IQ) ;

	always @(NOTIFIER)
	 begin
	   if (param_st_ignore_setuphold_syncflop != 1)
		NOTIFIER_UPD <= NOTIFIER ;
	   else
	     if( (debug_level > 1) && ($realtime > message_control_time) )
	          $display ("%m - %t ST_INFO : SYNC FLOP parameter param_st_ignore_setuphold_syncflop found active, Checks on Setup/Hold will be de-activated, X will not be propagated on output.", $realtime);
	 end

	
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

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER_UPD, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER_UPD);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFSYNCPRQX5_P10

`undef st_delay_seq
`undef st_msg_cntrl_time

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFSYNCPRQX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFSYNCPRQX5_P16

`celldefine

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

`ifdef ST_MSG_CONTROL_TIME
    `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
    `define st_msg_cntrl_time 0.001
`endif


module C8T28SOIDV_LR_SDFSYNCPRQX5_P16 (Q, D, CP, RN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;

	parameter message_control_time = `st_msg_cntrl_time;
	
	reg [1:0] debug_level;
	
	`ifdef ST_ALL_MSG_MODE
		parameter p_debug_level = 2'b11;
	`elsif ST_ERROR_ONLY_MODE
		parameter p_debug_level = 2'b01;
	`elsif ST_NO_MSG_MODE
		parameter p_debug_level = 2'b00;
	`else
		parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
	`endif
	
	initial
	begin
	  debug_level= p_debug_level ;
	end
	
	initial
	begin
	  $timeformat(-9,6," ns --",10);
	end

	parameter param_st_ignore_setuphold_syncflop = 0 ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	reg  NOTIFIER_UPD;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER_UPD) ;
	buf    U3 (Q, IQ) ;

	always @(NOTIFIER)
	 begin
	   if (param_st_ignore_setuphold_syncflop != 1)
		NOTIFIER_UPD <= NOTIFIER ;
	   else
	     if( (debug_level > 1) && ($realtime > message_control_time) )
	          $display ("%m - %t ST_INFO : SYNC FLOP parameter param_st_ignore_setuphold_syncflop found active, Checks on Setup/Hold will be de-activated, X will not be propagated on output.", $realtime);
	 end

	
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

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER_UPD, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER_UPD);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFSYNCPRQX5_P16

`undef st_delay_seq
`undef st_msg_cntrl_time

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFSYNCPRQX5_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFSYNCPRQX5_P4

`celldefine

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

`ifdef ST_MSG_CONTROL_TIME
    `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
    `define st_msg_cntrl_time 0.001
`endif


module C8T28SOIDV_LR_SDFSYNCPRQX5_P4 (Q, D, CP, RN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;

	parameter message_control_time = `st_msg_cntrl_time;
	
	reg [1:0] debug_level;
	
	`ifdef ST_ALL_MSG_MODE
		parameter p_debug_level = 2'b11;
	`elsif ST_ERROR_ONLY_MODE
		parameter p_debug_level = 2'b01;
	`elsif ST_NO_MSG_MODE
		parameter p_debug_level = 2'b00;
	`else
		parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
	`endif
	
	initial
	begin
	  debug_level= p_debug_level ;
	end
	
	initial
	begin
	  $timeformat(-9,6," ns --",10);
	end

	parameter param_st_ignore_setuphold_syncflop = 0 ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	reg  NOTIFIER_UPD;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER_UPD) ;
	buf    U3 (Q, IQ) ;

	always @(NOTIFIER)
	 begin
	   if (param_st_ignore_setuphold_syncflop != 1)
		NOTIFIER_UPD <= NOTIFIER ;
	   else
	     if( (debug_level > 1) && ($realtime > message_control_time) )
	          $display ("%m - %t ST_INFO : SYNC FLOP parameter param_st_ignore_setuphold_syncflop found active, Checks on Setup/Hold will be de-activated, X will not be propagated on output.", $realtime);
	 end

	
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

		$recrem(posedge RN, posedge CP &&& OR_AND_DTEXAND_TETI, tSETUP, tHOLD, NOTIFIER_UPD, , , dRN, dCP);

		$width(negedge RN, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_RNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_RNTEX, tPULSE, 0, NOTIFIER_UPD);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFSYNCPRQX5_P4

`undef st_delay_seq
`undef st_msg_cntrl_time

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFSYNCPSQX5_P0
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFSYNCPSQX5_P0

`celldefine

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

`ifdef ST_MSG_CONTROL_TIME
    `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
    `define st_msg_cntrl_time 0.001
`endif


module C8T28SOIDV_LR_SDFSYNCPSQX5_P0 (Q, D, CP, SN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;

	parameter message_control_time = `st_msg_cntrl_time;
	
	reg [1:0] debug_level;
	
	`ifdef ST_ALL_MSG_MODE
		parameter p_debug_level = 2'b11;
	`elsif ST_ERROR_ONLY_MODE
		parameter p_debug_level = 2'b01;
	`elsif ST_NO_MSG_MODE
		parameter p_debug_level = 2'b00;
	`else
		parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
	`endif
	
	initial
	begin
	  debug_level= p_debug_level ;
	end
	
	initial
	begin
	  $timeformat(-9,6," ns --",10);
	end

	parameter param_st_ignore_setuphold_syncflop = 0 ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	reg  NOTIFIER_UPD;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER_UPD) ;
	buf    U3 (Q, IQ) ;

	always @(NOTIFIER)
	 begin
	   if (param_st_ignore_setuphold_syncflop != 1)
		NOTIFIER_UPD <= NOTIFIER ;
	   else
	     if( (debug_level > 1) && ($realtime > message_control_time) )
	          $display ("%m - %t ST_INFO : SYNC FLOP parameter param_st_ignore_setuphold_syncflop found active, Checks on Setup/Hold will be de-activated, X will not be propagated on output.", $realtime);
	 end

	
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

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER_UPD, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER_UPD);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFSYNCPSQX5_P0

`undef st_delay_seq
`undef st_msg_cntrl_time

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFSYNCPSQX5_P10
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFSYNCPSQX5_P10

`celldefine

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

`ifdef ST_MSG_CONTROL_TIME
    `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
    `define st_msg_cntrl_time 0.001
`endif


module C8T28SOIDV_LR_SDFSYNCPSQX5_P10 (Q, D, CP, SN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;

	parameter message_control_time = `st_msg_cntrl_time;
	
	reg [1:0] debug_level;
	
	`ifdef ST_ALL_MSG_MODE
		parameter p_debug_level = 2'b11;
	`elsif ST_ERROR_ONLY_MODE
		parameter p_debug_level = 2'b01;
	`elsif ST_NO_MSG_MODE
		parameter p_debug_level = 2'b00;
	`else
		parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
	`endif
	
	initial
	begin
	  debug_level= p_debug_level ;
	end
	
	initial
	begin
	  $timeformat(-9,6," ns --",10);
	end

	parameter param_st_ignore_setuphold_syncflop = 0 ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	reg  NOTIFIER_UPD;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER_UPD) ;
	buf    U3 (Q, IQ) ;

	always @(NOTIFIER)
	 begin
	   if (param_st_ignore_setuphold_syncflop != 1)
		NOTIFIER_UPD <= NOTIFIER ;
	   else
	     if( (debug_level > 1) && ($realtime > message_control_time) )
	          $display ("%m - %t ST_INFO : SYNC FLOP parameter param_st_ignore_setuphold_syncflop found active, Checks on Setup/Hold will be de-activated, X will not be propagated on output.", $realtime);
	 end

	
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

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER_UPD, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER_UPD);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFSYNCPSQX5_P10

`undef st_delay_seq
`undef st_msg_cntrl_time

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFSYNCPSQX5_P16
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFSYNCPSQX5_P16

`celldefine

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

`ifdef ST_MSG_CONTROL_TIME
    `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
    `define st_msg_cntrl_time 0.001
`endif


module C8T28SOIDV_LR_SDFSYNCPSQX5_P16 (Q, D, CP, SN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;

	parameter message_control_time = `st_msg_cntrl_time;
	
	reg [1:0] debug_level;
	
	`ifdef ST_ALL_MSG_MODE
		parameter p_debug_level = 2'b11;
	`elsif ST_ERROR_ONLY_MODE
		parameter p_debug_level = 2'b01;
	`elsif ST_NO_MSG_MODE
		parameter p_debug_level = 2'b00;
	`else
		parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
	`endif
	
	initial
	begin
	  debug_level= p_debug_level ;
	end
	
	initial
	begin
	  $timeformat(-9,6," ns --",10);
	end

	parameter param_st_ignore_setuphold_syncflop = 0 ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	reg  NOTIFIER_UPD;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER_UPD) ;
	buf    U3 (Q, IQ) ;

	always @(NOTIFIER)
	 begin
	   if (param_st_ignore_setuphold_syncflop != 1)
		NOTIFIER_UPD <= NOTIFIER ;
	   else
	     if( (debug_level > 1) && ($realtime > message_control_time) )
	          $display ("%m - %t ST_INFO : SYNC FLOP parameter param_st_ignore_setuphold_syncflop found active, Checks on Setup/Hold will be de-activated, X will not be propagated on output.", $realtime);
	 end

	
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

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER_UPD, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER_UPD);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFSYNCPSQX5_P16

`undef st_delay_seq
`undef st_msg_cntrl_time

`endcelldefine

// Verilog model view for C8T28SOIDV_LR_SDFSYNCPSQX5_P4
// STMicroelectronics TRND/CCDS
// Cell C8T28SOIDV_LR_SDFSYNCPSQX5_P4

`celldefine

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

`ifdef ST_MSG_CONTROL_TIME
    `define st_msg_cntrl_time `ST_MSG_CONTROL_TIME
`else
    `define st_msg_cntrl_time 0.001
`endif


module C8T28SOIDV_LR_SDFSYNCPSQX5_P4 (Q, D, CP, SN, TI, TE);
	
	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;

	parameter message_control_time = `st_msg_cntrl_time;
	
	reg [1:0] debug_level;
	
	`ifdef ST_ALL_MSG_MODE
		parameter p_debug_level = 2'b11;
	`elsif ST_ERROR_ONLY_MODE
		parameter p_debug_level = 2'b01;
	`elsif ST_NO_MSG_MODE
		parameter p_debug_level = 2'b00;
	`else
		parameter p_debug_level = 2'b10;  //By default model will display ERRORS and Warnings
	`endif
	
	initial
	begin
	  debug_level= p_debug_level ;
	end
	
	initial
	begin
	  $timeformat(-9,6," ns --",10);
	end

	parameter param_st_ignore_setuphold_syncflop = 0 ;
	
   `ifdef functional
	reg  NOTIFIER;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #(`st_delay_seq) U3 (Q, IQ) ;
	
   `else
	reg  NOTIFIER;
	reg  NOTIFIER_UPD;
	C28SOI_SC_8_CLK_LR_U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER_UPD) ;
	buf    U3 (Q, IQ) ;

	always @(NOTIFIER)
	 begin
	   if (param_st_ignore_setuphold_syncflop != 1)
		NOTIFIER_UPD <= NOTIFIER ;
	   else
	     if( (debug_level > 1) && ($realtime > message_control_time) )
	          $display ("%m - %t ST_INFO : SYNC FLOP parameter param_st_ignore_setuphold_syncflop found active, Checks on Setup/Hold will be de-activated, X will not be propagated on output.", $realtime);
	 end

	
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

		$recrem(posedge SN, posedge CP &&& OR_AND_DXTEXAND_TETIX, tSETUP, tHOLD, NOTIFIER_UPD, , , dSN, dCP);

		$width(negedge SN, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(negedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_SNTE, tPULSE, 0, NOTIFIER_UPD);
		$width(posedge CP &&& AND_SNTEX, tPULSE, 0, NOTIFIER_UPD);

	endspecify
   `endif

endmodule // C8T28SOIDV_LR_SDFSYNCPSQX5_P4

`undef st_delay_seq
`undef st_msg_cntrl_time

`endcelldefine



primitive C28SOI_SC_8_CLK_LR_U_FD_P_NOTI (Q, D, CP, NOTI_REG);

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


primitive C28SOI_SC_8_CLK_LR_U_FD_P_RN_NOTI (Q, D, CP, RN, NOTI_REG);

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


primitive C28SOI_SC_8_CLK_LR_U_FD_P_SN_NOTI (Q, D, CP, SN, NOTI_REG);

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


primitive C28SOI_SC_8_CLK_LR_U_LD_N_NOTI (Q, D, GN, NOTI_REG);
 
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


primitive C28SOI_SC_8_CLK_LR_U_MUX2 (Z, A, B, S);

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
