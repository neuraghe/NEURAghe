/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 *          EOLAB @ DIEE - Università degli studi di Cagliari                 *
 *                      Via marengo 2 - 09123                                 *
 *                              Cagliari                                      *
 *                                                                            *
 *                                                                            *
 * Engineer:       Gianfranco Deriu - gian.deriu@gmail.com                    *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           hwce_sop_add.sv                                                *
 * Description:    Simple adder                                 *
 *                                                                            *
 ******************************************************************************/

`include "hwce_types.sv"

module hwce_sop_add
#(
   parameter NB_TRELLIS = 3,
   parameter SUM_WIDHT  = 37,
   parameter USE_ADDER_TREE = 0
)
(     
   
   input  logic signed [NB_TRELLIS-1:0][SUM_WIDHT -1:0] in,
   output logic signed                 [SUM_WIDHT -1:0] out
);

  localparam LAYERS  = $clog2(NB_TRELLIS) + 1;
  localparam ADDER_PER_LAY = 2**($clog2(NB_TRELLIS));

  logic signed [LAYERS-1:0][ADDER_PER_LAY-1:0][SUM_WIDHT-1:0] adder;  
  
  genvar add_i, add_j;
  generate
     if (USE_ADDER_TREE==1) begin       //use adder tree
       for(add_j=0; add_j<ADDER_PER_LAY; add_j++) begin
         if (add_j<NB_TRELLIS)
           assign adder[LAYERS-1][add_j] = in[add_j];
         else
           assign adder[LAYERS-1][add_j] = 0;
       end  
          
       for(add_i=LAYERS-2; add_i>=0; add_i--) begin
         for(add_j=0; add_j<2**add_i; add_j++) begin
           assign adder[add_i][add_j] = adder[add_i+1][2*add_j] + adder[add_i+1][2*add_j+1];
         end
       end
         
       assign out=adder[0][0];
     end
     else begin // don't use adder tree
     
       integer i;
        always_comb begin
          out = 0;
          for (i=0;i<NB_TRELLIS;i++)
            out = out + in[i];
        end
     
     end

  endgenerate

endmodule
