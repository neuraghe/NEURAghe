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
 * File:           full_adder.sv                                              *
 * Description:    Full adder                                                 *
 *                                                                            *
 ******************************************************************************/

module full_adder(
   input  logic a,
   input  logic b,
   input  logic cin,
   output logic cout,
   output logic s
);

   logic c1;
   logic s1;
   logic c2;

   half_adder my_half_adder_1(
      .a(a),
      .b(b),
      .c(c1),
      .s(s1)
   );

   half_adder my_half_adder_2(
      .a(s1),
      .b(cin),
      .c(c2),
      .s(s)
   );

   assign cout = c1 | c2;

endmodule
