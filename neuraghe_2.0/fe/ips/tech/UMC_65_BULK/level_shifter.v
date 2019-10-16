
`celldefine

`timescale 1ns/1ps

`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define DZ_LSEM4_A_R_Z_R_0 0.1
`define DZ_LSEM4_A_F_Z_F_0 0.1
`define DZ_LSEM4_R_R_Z_F_1 0.1
`define DZ_LSEM4_R_F_Z_R_1 0.1

module DZ_LSEM4 (H, L, EN);

    output H;
    input L;
    input EN;

    not    U1 (INTERNAL1, EN) ;
    and   #1 U2 (H, L, INTERNAL1) ;

    specify

            if (!EN) (L +=> H) = (`DZ_LSEM4_A_R_Z_R_0, `DZ_LSEM4_A_F_Z_F_0);
            if (L) (EN -=> H) = (`DZ_LSEM4_R_F_Z_R_1,  `DZ_LSEM4_R_R_Z_F_1);

    endspecify

endmodule // DZ_LSEM4

`endcelldefine






`celldefine

`timescale 1ns/1ps


`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define SHIFT_IN_X10_A_R_Z_R 0.1
`define SHIFT_IN_X10_A_F_Z_F 0.1

module SHIFT_IN_X10 (Z, A);

    output Z;
    input A;

    buf   #1 U1 (Z, A) ;

    specify

            (A +=> Z) = (`SHIFT_IN_X10_A_R_Z_R,`SHIFT_IN_X10_A_F_Z_F);

    endspecify

endmodule // SHIFT_IN_X10

`endcelldefine


`celldefine

`timescale 1ns/1ps


`ifdef functional
   `delay_mode_zero
`else
   `delay_mode_path
`endif

`define SHIFT_OUT_X10_A_R_Z_R 0.1
`define SHIFT_OUT_X10_A_F_Z_F 0.1

module SHIFT_OUT_X10 (Z, A);

      output Z;
      input A;

      buf   #1 U1 (Z, A) ;

      specify

              (A +=> Z) = (`SHIFT_OUT_X10_A_R_Z_R,`SHIFT_OUT_X10_A_F_Z_F);

      endspecify

endmodule // SHIFT_OUT_X10

`endcelldefine
