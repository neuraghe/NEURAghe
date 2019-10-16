////////////////////////////////////////////////////////////////////////////////
// Company:              DIEE - University of Cagliari                        //
//                                                                            //
// Engineer:       Gianfranco Deriu gian.deriu@gmail.com                      //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
// Create Date:    12/05/2014                                                 // 
// Module Name:    Encoder for hwce request routing                           //
// Project Name:   PULP                                                       //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    This Block creates a connection point-to-point between     //
//                 each TCDM bank and each HWCE port.                         //
//                 There is not requests arbitration.                         //
//                                                                            //
// Revision:                                                                  //
// v0.1 - File Created                                                        //
//                                                                            //
// Additional Comments:                                                       //                                                                            
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module xbar_req_gen 
#(
    parameter N_SLAVE  = 8,
    parameter ADDR_WIDTH = 32,
    parameter LSB_ADDR   = 16,
    parameter MSB_ADDR   = LSB_ADDR + $clog2(N_SLAVE) - 1,
    parameter SLAVE_NUM = 0
    
)
(   
    input  logic [ADDR_WIDTH-1:0]  data_add_i,            // Data request Address
    input  logic                   en,    
    output logic                   req_out
);

  
  always_comb begin
    req_out = 1'b0;
    if ((data_add_i [MSB_ADDR : LSB_ADDR] == SLAVE_NUM) && (en==1'b1))
    begin
        req_out = 1'b1;
    end
  end
      
endmodule
