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
 * File:           etm.sv                                                     *
 * Description:    Error Tolerant Multiplier (imprecise part), see:           *
 *                   Khaing Yin Kyaw, Wang Ling Goh, and Kiat Seng Yeo        *
 *                   Low-Power High-Speed Multiplier For Error­Tolerant       *
 *                     Application,                                           *
 *                   2010 IEEE International Conference of Electron Devices   *
 *                     and Solid-State Circuits (EDSSC)                       *
 *                                                                            *
 ******************************************************************************/

module etm
#(
   parameter N=4
)
(
   input  logic [N-1:0] x,
   input  logic [N-1:0] y,
   output logic [2*N-1:0] p
);

   assign p[2*N-1] = x[N-1]|y[N-1]; //assign the highest bit of product for NMP

   genvar i;
   generate
      // calculate the high half part of the product p[i] with (x[i] and y[i] and p[i-1])
      for (i=0; i<N-1; i++) begin
         assign p[2*N-2-i] = x[N-2-i]|y[N-2-i]|p[2*N-1-i];
      end
      // propagate the low half part of the product p[i] with p[i-1]
      for (i=0; i<N; i++) begin
         assign p[N-1-i]=p[N-i];
      end
   endgenerate

endmodule

