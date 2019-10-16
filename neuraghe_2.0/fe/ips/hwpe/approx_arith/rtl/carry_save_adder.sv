/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineers:      Bi Danyu, Chen Shiyi (approx. arithmetic student project)  *
 *                 Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        ETM approximate multiplier                                 *
 * File:           carry_save_adder.sv                                        *
 * Description:    Carry-Save Adder                                           *
 *                                                                            *
 ******************************************************************************/

module carry_save_adder
#(
   parameter N=4
)
(
   input  logic [N-1:0] a,
   input  logic [N-1:0] b,
   input  logic [N-1:0] d,
   output logic [N:0] s,
   output logic cout
);

   logic [N:0] c1,c2,s1,s2;
   //s1 are the sum of half_adder; s2 are the sum of full_adder;
   //c1 are the carry output bits of half_adder; c2 are the carryout bits of full_adder;

   assign c1[0]=0,c2[0]=0;

   genvar i;
   generate
      for (i=0;i<N;i++) begin
         half_adder ha_i(
            .a(a[i]   ),
            .b(b[i]   ),
            .c(c1[i+1]),    //since half adder's carryouts are the carryinputs of full adder with 1 bit delay,so here we use c1[i+1] instead of c1[i];
            .s(s1[i]  )
         );

         full_adder fa_u(
            .a   (d[i]   ),
            .b   (s1[i]  ),
            .cin (c1[i]  ),
            .cout(c2[i+1]),  //Since full adder's couts should be added in N bits RCA with 1 bit delay, so here we use c2[i+1] instead of c2[i]. Similar to the previous one;
            .s   (s2[i]  )
         );
      end

      //up to now, we defined s2[0:N-1], which means s2[N] hasn't been defined. Since s2 should be added in N bits RCA, s2[N]=c1[N];
      assign s2[N]=c1[N];
   endgenerate

   ripple_carry_adder rca_i (
      .a   (c2[N:1]), //c2, s2 and s are 1 bit delayed. So we write c2[N:1] instead of c2[N:0]. The same to s2 and s.
      .b   (s2[N:1]),
      .s   (s[N:1] ),
      .cout(cout   )
   );

   //up to now, we defined s[1:N], since the first bit of sum is the same as the first bit of full adder's sum, s[0]=s2[0];
   assign s[0]=s2[0];

endmodule
