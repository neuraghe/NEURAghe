////////////////////////////////////////////////////////////////////////////////
// Company:        Micrel Lab @ DEIS - University of Bologna                  //  
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Igor Loi - igor.loi@unibo.it                               //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    29/06/2011                                                 // 
// Design Name:    LOG_INTERCONNECT                                           // 
// Module Name:    FanInPrimitive_Resp                                        //
// Project Name:   MegaLEON                                                   //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Routing primitives used to build the Routing trees.        //
//                 They are part of the response network                      //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - 16/02/2015  - Improveved flexibility - configurability     //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module FanInPrimitive_Resp_IC
#(
          parameter     DATA_WIDTH = 32,
          parameter     ID_WIDTH   = 16
)
(
          // UPSTREAM SIDE 
          input  logic [DATA_WIDTH-1:0]          data_r_rdata0_i,
          input  logic [DATA_WIDTH-1:0]          data_r_rdata1_i,
          input  logic                           data_r_valid0_i,
          input  logic                           data_r_valid1_i,
          input  logic [ID_WIDTH-1:0]            data_r_ID0_i,
          input  logic [ID_WIDTH-1:0]            data_r_ID1_i,
   
          // DOWNSTREAM SIDE
          output logic [DATA_WIDTH-1:0]          data_r_rdata_o,
          output logic                           data_r_valid_o,
          output logic [ID_WIDTH-1:0]            data_r_ID_o
          
);
        
        // Selector for the FanOut multiplexer
        logic                        SEL;

        // VAlid is simply the or of the two requests
        assign data_r_valid_o = data_r_valid1_i | data_r_valid0_i;
        
        // FIXME: (req0 & req1) must be always 0
        assign SEL = data_r_valid1_i;

                
        // SEL CONTROLLER
        always_comb
        begin : FanOut_MUX2
            case(SEL) //synopsys full_case
                1'b0: begin data_r_rdata_o  = data_r_rdata0_i; data_r_ID_o = data_r_ID0_i; end
                1'b1: begin data_r_rdata_o  = data_r_rdata1_i; data_r_ID_o = data_r_ID1_i; end
            endcase
        end        
endmodule