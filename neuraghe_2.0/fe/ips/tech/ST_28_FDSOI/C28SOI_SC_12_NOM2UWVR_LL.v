`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLN2U4S_BFX16_A_R_Z_R 0.1
`define C12T32_LLN2U4S_BFX16_A_F_Z_F 0.1

module C12T32_LLN2U4S_BFX16 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T32_LLN2U4S_BFX16_A_R_Z_R,`C12T32_LLN2U4S_BFX16_A_F_Z_F);


	endspecify

endmodule // C12T32_LLN2U4S_BFX16


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLN2U2S_BFX16_A_R_Z_R 0.1
`define C12T32_LLN2U2S_BFX16_A_F_Z_F 0.1

module C12T32_LLN2U2S_BFX16 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T32_LLN2U2S_BFX16_A_R_Z_R,`C12T32_LLN2U2S_BFX16_A_F_Z_F);


	endspecify

endmodule // C12T32_LLN2U2S_BFX16


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLN2U_BFX16_A_R_Z_R 0.1
`define C12T32_LLN2U_BFX16_A_F_Z_F 0.1

module C12T32_LLN2U_BFX16 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T32_LLN2U_BFX16_A_R_Z_R,`C12T32_LLN2U_BFX16_A_F_Z_F);


	endspecify

endmodule // C12T32_LLN2U_BFX16


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32DG_LLN2USPW_BFX16_A_R_Z_R 0.1
`define C12T32DG_LLN2USPW_BFX16_A_F_Z_F 0.1

module C12T32DG_LLN2USPW_BFX16 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T32DG_LLN2USPW_BFX16_A_R_Z_R,`C12T32DG_LLN2USPW_BFX16_A_F_Z_F);


	endspecify

endmodule // C12T32DG_LLN2USPW_BFX16


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


