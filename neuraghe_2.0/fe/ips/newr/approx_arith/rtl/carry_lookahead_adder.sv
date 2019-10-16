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
 * File:           carry_lookahead_adder.sv                                   *
 * Description:    Carry-Lookahead Adder                                      *
 *                                                                            *
 ******************************************************************************/

module carry_lookahead_adder
#(
   parameter N=4
)
(
   input  logic [N-1:0] a,
   input  logic [N-1:0] b,
   output logic [N-1:0] s,
   output logic cout
);

   logic [N:0] c;
   logic [N:0] p;
   logic [N:0] g;

   assign c[0] = 0;

   genvar i;
   generate
      for (i=0; i<N; i++) begin
         assign p[i] = a[i] ^ b[i]; //carry propagator(P)
         assign g[i] = a[i] & b[i]; //carry generator(G)
      end
      for (i=0; i<N; i++) begin
         assign s[i]   = p[i] ^ c[i];         //output sum
         assign c[i+1] = g[i] | p[i] & c[i];  //output carry
      end
   endgenerate

   assign cout = c[N];

endmodule
