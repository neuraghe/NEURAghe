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
// Module Name:    FanInPrimitive_Req                                         //
// Project Name:   MegaLEON                                                   //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Arbitration primitives used to build the arbitration trees.//
//                 They are part of the request network with a distributed    //
//                 arbiter. The arbitration Algorithm is ROUND ROBIN          //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - 14/08/2012  Added Dual FlowControl Support,                //
// Revision v0.3 - 19/02/2013  Added read Broadcast feature,                  //
//                 Added Read Only Variant                                    //
// Revision v0.4 - 16/02/2015  - Improveved flexibility - configurability     //
//                                                                            //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module FanInPrimitive_Req_IC 
  #(
      parameter ADDR_WIDTH = 32, 
      parameter ID_WIDTH   = 16
   )
   (
      input logic					RR_FLAG,	
      // LEFT SIDE
      input  logic [ADDR_WIDTH-1:0]			data_add0_i,
      input  logic [ADDR_WIDTH-1:0]			data_add1_i,
      input  logic					data_req0_i,
      input  logic					data_req1_i,
      input  logic [ID_WIDTH-1:0]			data_ID0_i,
      input  logic [ID_WIDTH-1:0]			data_ID1_i,     
      output logic					data_gnt0_o,
      output logic					data_gnt1_o,	

      // RIGTH SIDE
      output logic [ADDR_WIDTH-1:0]			data_add_o,
      output logic					data_req_o,
      output logic [ID_WIDTH-1:0]			data_ID_o,          
      input  logic 					data_gnt_i

    );

	logic	SEL;
	
	assign data_req_o 	=     data_req0_i | data_req1_i;
	assign SEL		=    ~data_req0_i | ( RR_FLAG & data_req1_i);	// SEL FOR ROUND ROBIN MUX
	
	
	
	// Grant gnt0 and gnt1
	assign data_gnt0_o	=    (( data_req0_i & ~data_req1_i) | ( data_req0_i & ~RR_FLAG)) & data_gnt_i;
	assign data_gnt1_o	=    ((~data_req0_i &  data_req1_i) | ( data_req1_i &  RR_FLAG)) & data_gnt_i;
		
	// SEL CONTROLLER
	
	//MUXES AND DEMUXES 
	always_comb
	begin : FanIn_MUX2
	    case(SEL) //synopsys full_case
	    1'b0:  	begin //PRIORITY ON CH_0
			  data_add_o   = data_add0_i;
			  data_ID_o    = data_ID0_i;
			end
	    
	    1'b1:  	begin //PRIORITY ON CH_1
			  data_add_o   = data_add1_i;
			  data_ID_o    = data_ID1_i;
			end

	    endcase
	end
	
	
	
endmodule
