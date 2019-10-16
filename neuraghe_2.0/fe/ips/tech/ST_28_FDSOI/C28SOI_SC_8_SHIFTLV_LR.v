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
//              Verilog models for the C28SOI_SC_8_SHIFTLV_LR.CMOS028SOI
//                    (C28SOI_SC_8_SHIFTLV_LR   release 1.1.0)
// 
//
//--------------------------------------------------------------------------------
// 
//Date            : Sat Oct 20 15:36:34 2012
// 
//Copyright       : STMicroelectronics N.V. 2012
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

// Verilog model view for C8T28SOIDV_LRV_LSINCL0X32
//(c) 1997-2008 STMicroelectronics TRND/CCDS 5.9 (Feb  9 2010 11:40:53) 14-Apr-2010
// Cell C8T28SOIDV_LRV_LSINCL0X32

`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C8T28SOIDV_LRV_LSINCL0X32_A_R_Z_R_0 0.1
`define C8T28SOIDV_LRV_LSINCL0X32_A_F_Z_F_0 0.1
`define C8T28SOIDV_LRV_LSINCL0X32_R_R_Z_F_1 0.1
`define C8T28SOIDV_LRV_LSINCL0X32_R_F_Z_R_1 0.1

module C8T28SOIDV_LRV_LSINCL0X32 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C8T28SOIDV_LRV_LSINCL0X32_A_R_Z_R_0,`C8T28SOIDV_LRV_LSINCL0X32_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C8T28SOIDV_LRV_LSINCL0X32_R_F_Z_R_1,`C8T28SOIDV_LRV_LSINCL0X32_R_R_Z_F_1);

	endspecify

endmodule // C8T28SOIDV_LRV_LSINCL0X32

`endcelldefine
// Verilog model view for C8T28SOIDV_LRV_LSINCL1X32
//(c) 1997-2008 STMicroelectronics TRND/CCDS 5.9 (Feb  9 2010 11:40:53) 14-Apr-2010
// Cell C8T28SOIDV_LRV_LSINCL1X32

`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C8T28SOIDV_LRV_LSINCL1X32_A_R_Z_R_0 0.1
`define C8T28SOIDV_LRV_LSINCL1X32_A_F_Z_F_0 0.1
`define C8T28SOIDV_LRV_LSINCL1X32_S_R_Z_R_0 0.1
`define C8T28SOIDV_LRV_LSINCL1X32_S_F_Z_F_0 0.1

module C8T28SOIDV_LRV_LSINCL1X32 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C8T28SOIDV_LRV_LSINCL1X32_A_R_Z_R_0,`C8T28SOIDV_LRV_LSINCL1X32_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C8T28SOIDV_LRV_LSINCL1X32_S_R_Z_R_0,`C8T28SOIDV_LRV_LSINCL1X32_S_F_Z_F_0);

	endspecify

endmodule // C8T28SOIDV_LRV_LSINCL1X32

`endcelldefine
// Verilog model view for C8T28SOIDV_LRV_LSINRETX32
//(c) 1997-2008 STMicroelectronics TRND/CCDS 5.9 (Feb  9 2010 11:40:53) 14-Apr-2010
// Cell C8T28SOIDV_LRV_LSINRETX32

`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C8T28SOIDV_LRV_LSINRETX32_A_R_Z_R_1 0.1
`define C8T28SOIDV_LRV_LSINRETX32_A_F_Z_F_1 0.1
`define C8T28SOIDV_LRV_LSINRETX32_G_R_Z_R_1 0.1
`define C8T28SOIDV_LRV_LSINRETX32_G_R_Z_F_0 0.1

module C8T28SOIDV_LRV_LSINRETX32 (Z, A, G);

        output Z;
        input A;
        input G;

`ifdef functional
        reg  NOTIFIER;
        C28SOI_SC_8_SHIFTLV_LR_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

`else
        reg  NOTIFIER;
        C28SOI_SC_8_SHIFTLV_LR_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

        specify

                if (G) (A +=> Z) = (`C8T28SOIDV_LRV_LSINRETX32_A_R_Z_R_1,`C8T28SOIDV_LRV_LSINRETX32_A_F_Z_F_1);
                (posedge G => (Z +: A)) = (`C8T28SOIDV_LRV_LSINRETX32_G_R_Z_R_1,`C8T28SOIDV_LRV_LSINRETX32_G_R_Z_F_0);

        endspecify

`endif

endmodule // C8T28SOIDV_LRV_LSINRETX32

`endcelldefine
// Verilog model view for C8T28SOIDV_LRV_LSINX32
//(c) 1997-2008 STMicroelectronics TRND/CCDS 5.9 (Feb  9 2010 11:40:53) 14-Apr-2010
// Cell C8T28SOIDV_LRV_LSINX32

`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C8T28SOIDV_LRV_LSINX32_A_R_Z_R 0.1
`define C8T28SOIDV_LRV_LSINX32_A_F_Z_F 0.1

module C8T28SOIDV_LRV_LSINX32 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;

	specify

		(A +=> Z) = (`C8T28SOIDV_LRV_LSINX32_A_R_Z_R,`C8T28SOIDV_LRV_LSINX32_A_F_Z_F);

	endspecify

endmodule // C8T28SOIDV_LRV_LSINX32

`endcelldefine
// Verilog model view for C8T28SOITV_LRV_LSOUTCL0X32
//(c) 1997-2008 STMicroelectronics TRND/CCDS 5.9 (Feb  9 2010 11:40:53) 14-Apr-2010
// Cell C8T28SOITV_LRV_LSOUTCL0X32

`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C8T28SOITV_LRV_LSOUTCL0X32_A_R_Z_R_0 0.1
`define C8T28SOITV_LRV_LSOUTCL0X32_A_F_Z_F_0 0.1
`define C8T28SOITV_LRV_LSOUTCL0X32_R_R_Z_F_1 0.1
`define C8T28SOITV_LRV_LSOUTCL0X32_R_F_Z_R_1 0.1

module C8T28SOITV_LRV_LSOUTCL0X32 (Z, A, R);

	output Z;
	input A;
	input R;

	not    U1 (INTERNAL1, R) ;
	and   #1 U2 (Z, A, INTERNAL1) ;

	specify

		if (!R) (A +=> Z) = (`C8T28SOITV_LRV_LSOUTCL0X32_A_R_Z_R_0,`C8T28SOITV_LRV_LSOUTCL0X32_A_F_Z_F_0);
		if (A) (R -=> Z) = (`C8T28SOITV_LRV_LSOUTCL0X32_R_F_Z_R_1,`C8T28SOITV_LRV_LSOUTCL0X32_R_R_Z_F_1);

	endspecify

endmodule // C8T28SOITV_LRV_LSOUTCL0X32

`endcelldefine
// Verilog model view for C8T28SOITV_LRV_LSOUTCL1X32
//(c) 1997-2008 STMicroelectronics TRND/CCDS 5.9 (Feb  9 2010 11:40:53) 14-Apr-2010
// Cell C8T28SOITV_LRV_LSOUTCL1X32

`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C8T28SOITV_LRV_LSOUTCL1X32_A_R_Z_R_0 0.1
`define C8T28SOITV_LRV_LSOUTCL1X32_A_F_Z_F_0 0.1
`define C8T28SOITV_LRV_LSOUTCL1X32_S_R_Z_R_0 0.1
`define C8T28SOITV_LRV_LSOUTCL1X32_S_F_Z_F_0 0.1

module C8T28SOITV_LRV_LSOUTCL1X32 (Z, A, S);

	output Z;
	input A;
	input S;

	or   #1 U1 (Z, A, S) ;

	specify

		if (!S) (A +=> Z) = (`C8T28SOITV_LRV_LSOUTCL1X32_A_R_Z_R_0,`C8T28SOITV_LRV_LSOUTCL1X32_A_F_Z_F_0);
		if (!A) (S +=> Z) = (`C8T28SOITV_LRV_LSOUTCL1X32_S_R_Z_R_0,`C8T28SOITV_LRV_LSOUTCL1X32_S_F_Z_F_0);

	endspecify

endmodule // C8T28SOITV_LRV_LSOUTCL1X32

`endcelldefine
// Verilog model view for C8T28SOITV_LRV_LSOUTRETX32
//(c) 1997-2008 STMicroelectronics TRND/CCDS 5.9 (Feb  9 2010 11:40:53) 14-Apr-2010
// Cell C8T28SOITV_LRV_LSOUTRETX32

`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C8T28SOITV_LRV_LSOUTRETX32_A_R_Z_R_1 0.1
`define C8T28SOITV_LRV_LSOUTRETX32_A_F_Z_F_1 0.1
`define C8T28SOITV_LRV_LSOUTRETX32_G_R_Z_R_1 0.1
`define C8T28SOITV_LRV_LSOUTRETX32_G_R_Z_F_0 0.1

module C8T28SOITV_LRV_LSOUTRETX32 (Z, A, G);

        output Z;
        input A;
        input G;

`ifdef functional
        reg  NOTIFIER;
        C28SOI_SC_8_SHIFTLV_LR_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

`else
        reg  NOTIFIER;
        C28SOI_SC_8_SHIFTLV_LR_U_LD_P_NOTI   U1 (IQ, A, G , NOTIFIER) ;
        buf   #1 U2 (Z, IQ) ;

        specify

                if (G) (A +=> Z) = (`C8T28SOITV_LRV_LSOUTRETX32_A_R_Z_R_1,`C8T28SOITV_LRV_LSOUTRETX32_A_F_Z_F_1);
                 (posedge G => (Z +: A)) = (`C8T28SOITV_LRV_LSOUTRETX32_G_R_Z_R_1,`C8T28SOITV_LRV_LSOUTRETX32_G_R_Z_F_0);
        endspecify

`endif

endmodule // C8T28SOITV_LRV_LSOUTRETX32

`endcelldefine
// Verilog model view for C8T28SOITV_LRV_LSOUTX32
//(c) 1997-2008 STMicroelectronics TRND/CCDS 5.9 (Feb  9 2010 11:40:53) 14-Apr-2010
// Cell C8T28SOITV_LRV_LSOUTX32

`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C8T28SOITV_LRV_LSOUTX32_A_R_Z_R 0.1
`define C8T28SOITV_LRV_LSOUTX32_A_F_Z_F 0.1

module C8T28SOITV_LRV_LSOUTX32 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;

	specify

		(A +=> Z) = (`C8T28SOITV_LRV_LSOUTX32_A_R_Z_R,`C8T28SOITV_LRV_LSOUTX32_A_F_Z_F);

	endspecify

endmodule // C8T28SOITV_LRV_LSOUTX32

`endcelldefine


primitive C28SOI_SC_8_SHIFTLV_LR_U_LD_P_NOTI (Q, D, G, NOTI_REG);
 
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
