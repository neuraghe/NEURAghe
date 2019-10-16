`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUAL4_CNHLSX7_CP_R_Q_R 0.1
`define C12T32_LLUAL4_CNHLSX7_CP_F_Q_F 0.1
`define C12T32_LLUAL4_CNHLSX7_TE_CP_HOLD_posedge_posedge 0.1
`define C12T32_LLUAL4_CNHLSX7_TE_CP_HOLD_negedge_posedge 0.1
`define C12T32_LLUAL4_CNHLSX7_TE_CP_SETUP_posedge_posedge 0.1
`define C12T32_LLUAL4_CNHLSX7_TE_CP_SETUP_negedge_posedge 0.1
`define C12T32_LLUAL4_CNHLSX7_E_CP_HOLD_posedge_posedge 0.1
`define C12T32_LLUAL4_CNHLSX7_E_CP_HOLD_negedge_posedge 0.1
`define C12T32_LLUAL4_CNHLSX7_E_CP_SETUP_posedge_posedge 0.1
`define C12T32_LLUAL4_CNHLSX7_E_CP_SETUP_negedge_posedge 0.1
`define C12T32_LLUAL4_CNHLSX7_CP_PWL_state_2 0.1
`define C12T32_LLUAL4_CNHLSX7_CP_PWL_state_1 0.1

module C12T32_LLUAL4_CNHLSX7 (Q, CP, E, TE);

	output Q;
	input CP;
	input E;
	input TE;

`ifdef functional
        reg  NOTIFIER;
        or    U1 (INTERNAL1, E, TE) ;
        U_LD_N_NOTI U3 (IE, INTERNAL1, CP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, CP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

`else
        reg  NOTIFIER;
        or    U1 (INTERNAL1, dE, dTE) ;
        U_LD_N_NOTI U3 (IE, INTERNAL1, dCP , NOTIFIER) ;
        and   U4 (INTERNAL3, IE, dCP) ;
        buf   #1 U5 (Q, INTERNAL3) ;

	not    X1 (EX, dE) ;
	not    X2 (TEX, dTE) ;
        not                   U10 (conditiontrue, 1'b0);

	specify

	       if (conditiontrue)  (CP +=> Q) = (`C12T32_LLUAL4_CNHLSX7_CP_R_Q_R,`C12T32_LLUAL4_CNHLSX7_CP_F_Q_F);

        	$setuphold(posedge CP &&& TEX, posedge E, `C12T32_LLUAL4_CNHLSX7_E_CP_SETUP_posedge_posedge, `C12T32_LLUAL4_CNHLSX7_E_CP_HOLD_posedge_posedge , NOTIFIER,, , dCP, dE);
        	$setuphold(posedge CP &&& TEX, negedge E, `C12T32_LLUAL4_CNHLSX7_E_CP_SETUP_negedge_posedge, `C12T32_LLUAL4_CNHLSX7_E_CP_HOLD_negedge_posedge , NOTIFIER,, , dCP, dE);
		$setuphold(posedge CP, posedge TE, `C12T32_LLUAL4_CNHLSX7_TE_CP_SETUP_posedge_posedge, `C12T32_LLUAL4_CNHLSX7_TE_CP_HOLD_posedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T32_LLUAL4_CNHLSX7_TE_CP_SETUP_negedge_posedge, `C12T32_LLUAL4_CNHLSX7_TE_CP_HOLD_negedge_posedge , NOTIFIER,, EX, dCP, dTE);
		$width(negedge CP &&& TE, `C12T32_LLUAL4_CNHLSX7_CP_PWL_state_2 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T32_LLUAL4_CNHLSX7_CP_PWL_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T32_LLUAL4_CNHLSX7

`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUP10_CNBFX24_A_R_Z_R 0.1
`define C12T32_LLUP10_CNBFX24_A_F_Z_F 0.1

module C12T32_LLUP10_CNBFX24 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T32_LLUP10_CNBFX24_A_R_Z_R,`C12T32_LLUP10_CNBFX24_A_F_Z_F);


	endspecify

endmodule // C12T32_LLUP10_CNBFX24


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUP10_CNBFX36_A_R_Z_R 0.1
`define C12T32_LLUP10_CNBFX36_A_F_Z_F 0.1

module C12T32_LLUP10_CNBFX36 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T32_LLUP10_CNBFX36_A_R_Z_R,`C12T32_LLUP10_CNBFX36_A_F_Z_F);


	endspecify

endmodule // C12T32_LLUP10_CNBFX36


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUP10_CNBFX64_A_R_Z_R 0.1
`define C12T32_LLUP10_CNBFX64_A_F_Z_F 0.1

module C12T32_LLUP10_CNBFX64 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T32_LLUP10_CNBFX64_A_R_Z_R,`C12T32_LLUP10_CNBFX64_A_F_Z_F);


	endspecify

endmodule // C12T32_LLUP10_CNBFX64


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUP10_CNBFX72_A_R_Z_R 0.1
`define C12T32_LLUP10_CNBFX72_A_F_Z_F 0.1

module C12T32_LLUP10_CNBFX72 (Z, A);

	output Z;
	input A;

	buf   #1 U1 (Z, A) ;



	specify

		(A +=> Z) = (`C12T32_LLUP10_CNBFX72_A_R_Z_R,`C12T32_LLUP10_CNBFX72_A_F_Z_F);


	endspecify

endmodule // C12T32_LLUP10_CNBFX72


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUP10_CNIVX16_A_R_Z_F 0.1
`define C12T32_LLUP10_CNIVX16_A_F_Z_R 0.1

module C12T32_LLUP10_CNIVX16 (Z, A);

	output Z;
	input A;

	not   #1 U1 (Z, A) ;



	specify

		(A -=> Z) = (`C12T32_LLUP10_CNIVX16_A_F_Z_R,`C12T32_LLUP10_CNIVX16_A_R_Z_F);


	endspecify

endmodule // C12T32_LLUP10_CNIVX16


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_zero
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUP10_CNMUX21X17_D0_R_Z_R_00 0.1
`define C12T32_LLUP10_CNMUX21X17_D0_F_Z_F_00 0.1
`define C12T32_LLUP10_CNMUX21X17_D0_R_Z_R_10 0.1
`define C12T32_LLUP10_CNMUX21X17_D0_F_Z_F_10 0.1
`define C12T32_LLUP10_CNMUX21X17_D1_R_Z_R_01 0.1
`define C12T32_LLUP10_CNMUX21X17_D1_F_Z_F_01 0.1
`define C12T32_LLUP10_CNMUX21X17_D1_R_Z_R_11 0.1
`define C12T32_LLUP10_CNMUX21X17_D1_F_Z_F_11 0.1
`define C12T32_LLUP10_CNMUX21X17_S0_R_Z_F_10 0.1
`define C12T32_LLUP10_CNMUX21X17_S0_F_Z_R_10 0.1
`define C12T32_LLUP10_CNMUX21X17_S0_R_Z_R_01 0.1
`define C12T32_LLUP10_CNMUX21X17_S0_F_Z_F_01 0.1

module C12T32_LLUP10_CNMUX21X17 (Z, D0, D1, S0);

	output Z;
	input D0;
	input D1;
	input S0;

	U_MUX2  #1 U1 (Z, D0, D1, S0) ;



	specify

		if (!D1 && !S0) (D0 +=> Z) = (`C12T32_LLUP10_CNMUX21X17_D0_R_Z_R_00,`C12T32_LLUP10_CNMUX21X17_D0_F_Z_F_00);
		if (D1 && !S0) (D0 +=> Z) = (`C12T32_LLUP10_CNMUX21X17_D0_R_Z_R_10,`C12T32_LLUP10_CNMUX21X17_D0_F_Z_F_10);
		if (!D0 && S0) (D1 +=> Z) = (`C12T32_LLUP10_CNMUX21X17_D1_R_Z_R_01,`C12T32_LLUP10_CNMUX21X17_D1_F_Z_F_01);
		if (D0 && S0) (D1 +=> Z) = (`C12T32_LLUP10_CNMUX21X17_D1_R_Z_R_11,`C12T32_LLUP10_CNMUX21X17_D1_F_Z_F_11);
		if (D0 && !D1) (S0 -=> Z) = (`C12T32_LLUP10_CNMUX21X17_S0_F_Z_R_10,`C12T32_LLUP10_CNMUX21X17_S0_R_Z_F_10);
		if (!D0 && D1) (S0 +=> Z) = (`C12T32_LLUP10_CNMUX21X17_S0_R_Z_R_01,`C12T32_LLUP10_CNMUX21X17_S0_F_Z_F_01);


	endspecify

endmodule // C12T32_LLUP10_CNMUX21X17


`endcelldefine

primitive U_LD_N (Q, D, GN);
        output Q;
        input  D, GN;
        reg    Q;

        table
        //D     GN       : Qn : Qn+1
         0      0       :  ? :  0 ;
         1      0       :  ? :  1 ;
         X      0       :  ? :  X ;
       (01)     0       :  ? :  1 ;
       (10)     0       :  ? :  0 ;
         ?      1       :  ? :  - ;
         *      1       :  ? :  - ;
         0      X       :  0 :  0 ;
         1      X       :  1 :  1 ;


        endtable

endprimitive
primitive U_LD_N_NOTI (Q, D, GN, NOTI_REG);
 
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
primitive U_LD_N_NOTI_POWER (Q, D, GN, GND_FINAL, VDD_FINAL, NOTI_REG);
   output          Q;
   input           D,            // data
                   GN,           // clock active low
                   NOTI_REG;
   input           GND_FINAL, VDD_FINAL;
   reg             Q;

   table 
      // D  GN    GND_FINAL VDD_FINAL NOTI_REG    : Qtn : Qtn+1
      (?0)  0     1         1        ?           :  ?  :  0  ;          // Transparency
      0     0     1         1        ?           :  ?  :  0  ;          // Transparency
      (?1)  0     1         1        ?           :  ?  :  1  ;
      1     0     1         1        ?           :  ?  :  1  ;
      *     1     1         1        ?           :  ?  :  -  ;          // Latching
      ?     (?1)  1         1        ?           :  ?  :  -  ;          // Ignore rising edges on clock
      ?     (0x)  1         1        ?           :  ?  :  -  ;
      0     (1x)  1         1        ?           :  0  :  0  ;          // Cases reducing pessimism
      1     (1x)  1         1        ?           :  1  :  1  ;
      (?0)  x     1         1        ?           :  0  :  0  ;
      (?1)  x     1         1        ?           :  1  :  1  ;
      ?     ?     1         1        *           :  ?  :  x  ;          // X for timing violations
   endtable
endprimitive // u_ld_n_noti_power

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

primitive U_MUX2 (Z, A, B, S);

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


