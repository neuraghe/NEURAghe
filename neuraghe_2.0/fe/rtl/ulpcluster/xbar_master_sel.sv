////////////////////////////////////////////////////////////////////////////////
// Company:              DIEE - University of Cagliari                        //
//                                                                            //
// Engineer:       Gianfranco Deriu gian.deriu@gmail.com                      //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
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
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module xbar_master_sel 
#(
    parameter NUM_INPUT  = 3,
    parameter SEL_WIDTH  = $clog2(NUM_INPUT),
    parameter ADDR_WIDTH = 32,
    parameter LSB_ADDR   = 15,
    parameter MSB_ADDR   = 17,
    parameter SLAVE_NUM  = 1,
    
    parameter ADDR_OFFSET = 32'h00060000
    
)
(   
    input  logic [NUM_INPUT - 1 : 0][ADDR_WIDTH-1:0]  data_add_i,            // Data request Address
    input  logic [NUM_INPUT - 1 : 0]                  en,
    output logic [SEL_WIDTH - 1 : 0]                  sel,
    output logic                                      en_out
);

  localparam ADDR = ADDR_OFFSET[MSB_ADDR : LSB_ADDR];
  always_comb begin
    sel = 0;
    en_out = 1'b0;
    for (int k=0; k<NUM_INPUT; k++) begin        
      if ((data_add_i [k][MSB_ADDR : LSB_ADDR] - ADDR == SLAVE_NUM) && (en[k]==1'b1)) begin
        sel = k;
        en_out = 1'b1;
      end
    end
  end
      
endmodule
