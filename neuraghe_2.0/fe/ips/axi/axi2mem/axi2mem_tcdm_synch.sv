////////////////////////////////////////////////////////////////////////////////
// Company:        Multitherman Laboratory @ DEIS - University of Bologna     //
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Davide Rossi - davide.rossi@unibo.it                       //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    11/04/2013                                                 // 
// Design Name:    ULPSoC                                                     // 
// Module Name:    minichan                                                   //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    MINI DMA CHANNEL                                           //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module axi2mem_tcdm_synch
  (
   
   input  logic            clk_i,
   input  logic            rst_ni,
   
   input  logic [1:0]      synch_req_i,
   input  logic [1:0][5:0] synch_id_i,
   
   input  logic            synch_gnt_i,
   output logic            synch_req_o,
   output logic [5:0]      synch_id_o
   
   );
   
   logic [1:0] 		   s_synch_req;
   logic 		   s_synch_gnt;
   logic [1:0][5:0] 	   s_synch_id;
   
   genvar 		   i;
   
   generate
      
      for (i=0; i<2; i++)
	
	begin : synch
	   
	   axi2mem_buffer
	     #(
	       .DATA_WIDTH(6),
	       .BUFFER_DEPTH(2) // IMPORTANT: DATA DEPTH MUST BE THE SAME AS CMD QUEUE DATA DEPTH
	       )
	   synch_i
	     (
	      
	      .clk_i(clk_i),
	      .rst_ni(rst_ni),
	      
	      .data_i(synch_id_i[i]),
	      .valid_i(synch_req_i[i]),
	      .ready_o(),
	      
	      .data_o(s_synch_id[i]),
	      .valid_o(s_synch_req[i]),
	      .ready_i(s_synch_gnt && synch_gnt_i)
	      
	      );
	   
	end
      
   endgenerate
   
   assign s_synch_gnt = s_synch_req[0] & s_synch_req[1];
   
   assign synch_req_o = s_synch_gnt;
   assign synch_id_o  = s_synch_id[0];
   
endmodule
