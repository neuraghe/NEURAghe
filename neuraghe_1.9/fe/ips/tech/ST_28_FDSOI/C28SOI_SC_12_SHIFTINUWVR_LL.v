// Verilog model view for C12T32DG_LLU_LSINX26
//(c) 1997-2008 STMicroelectronics TRND/CCDS 5.9 (Feb  9 2010 11:40:53) 14-Apr-2010
// Cell C12T32DG_LLU_LSINX26

`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32DG_LLU_LSINX26_A_R_Z_R 0.1
`define C12T32DG_LLU_LSINX26_A_F_Z_F 0.1

module C12T32DG_LLU_LSINX26 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;

	specify

		(A +=> Z) = (`C12T32DG_LLU_LSINX26_A_R_Z_R,`C12T32DG_LLU_LSINX26_A_F_Z_F);

	endspecify

endmodule // C12T32DG_LLU_LSINX26

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


