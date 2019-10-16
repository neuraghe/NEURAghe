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
 * File:           half_adder.sv                                              *
 * Description:    Half adder                                                 *
 *                                                                            *
 ******************************************************************************/

module half_adder(
   input logic a,
   input logic b,
   output logic c,
   output logic s
);

   assign s = a^b;
   assign c = a&b;

endmodule
