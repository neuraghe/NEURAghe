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
 * File:           mul.sv                                                     *
 * Description:    Wallace Tree Multiplier                                    *
 *                                                                            *
 ******************************************************************************/

module mul
#(
   parameter N=4
)
(
   input  logic [1:0]     s,  // 0 for unsigned, 1 for signed
   input  logic [N-1:0]   x,
   input  logic [N-1:0]   y,  //x,y 2 #s for multiplying
   output logic [2*N-1:0] p   //Product
);

   logic [N:0][N:0] par_p;   //Partial products of Xi&yj
   logic [N:0][N:0] c;       //Carries
   logic [N:0][N:0] sums;    //Sums
   logic [N:0] x_int;
   logic [N:0] y_int;
   logic [2*N+1:0] p_int;

   assign x_int = (s[1]==1'b1) ? {~x[N-1], x} : {1'b0, x};
   assign y_int = (s[0]==1'b1) ? {~y[N-1], y} : {1'b0, y};

   // define the Partial products matrix with xi&yj
   genvar i,j;
   generate

      for (i=0; i<N+1; i++) begin
         for (j=0; j<N+1; j++) begin
            assign par_p[i][j] = x_int[i] & y_int[j];
         end
      end

      //Define the first row of matrix s, s[0][j] and the last column of matrix s, s[i][N-1]
      for (j=0; j<N; j++) begin
         assign sums[0][j] = par_p[0][j];
      end
      for (i=0; i<N+1; i++) begin
         assign sums[i][N] = par_p[i][N];
      end

      // calculate the first row by using half adders
      for (j=0; j<N; j++) begin
         half_adder ha_i(
            .a(par_p[1][j]  ),
            .b(sums [0][j+1]),
            .c(c    [1][j]  ),
            .s(sums [1][j]  )
         );
      end

      // calculate the rest rows by using full adders
      for (i=0;i<N-1;i++) begin
         for (j=0;j<N;j++) begin
            full_adder fa_i(
               .a   (par_p[i+2][j]  ),
               .b   (sums [i+1][j+1]),
               .cin (c    [i+1][j]  ),
               .cout(c    [i+2][j]  ),
               .s   (sums [i+2][j]  )
            );
         end
      end

      // define the first half part of the product
      for (i=0; i<N+1; i++) begin
         assign p_int[i] = sums[i][0];
      end

   endgenerate

   // calculate the rest half part of the product by adding partial products
   carry_lookahead_adder #(
      .N(N)
   )
   cla_i (
      .a(sums[N][N:1]),
      .b(c[N][N-1:0]),
      .s(p_int[2*N:N+1]),
      .cout(p_int[2*N+1])
   );

   assign p = p_int[2*N-1:0];

endmodule

