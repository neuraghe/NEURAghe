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
// Module Name:    tcdm_if                                                    //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    MINI DMA CHANNEL - TCDM INTERFACE                          //
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

module axi2mem_tcdm_rd_if
  (
   
   input  logic        clk_i,
   input  logic        rst_ni,
   
   // CMD LD INTERFACE
   //***************************************
   input  logic        trans_last_i,
   input  logic [5:0]  trans_id_i,
   input  logic [31:0] trans_add_i,
   input  logic        trans_req_i,
   output logic        trans_gnt_o,
   
   // READ DATA INTERFACE
   //***************************************
   output logic [31:0] data_dat_o,
   output logic [5:0]  data_id_o,
   output logic        data_last_o,
   output logic        data_req_o,
   input  logic        data_gnt_i,
   
   // EXTERNAL INITIATOR
   //***************************************
   output logic        tcdm_req_o,
   output logic [31:0] tcdm_add_o,
   output logic        tcdm_we_o,
   output logic [31:0] tcdm_wdata_o,
   output logic [3:0]  tcdm_be_o,
   input  logic        tcdm_gnt_i,
   
   input  logic [31:0] tcdm_r_rdata_i,
   input  logic	       tcdm_r_valid_i
   
   );
   
   logic [31:0]        s_tcdm_r_rdata;
   logic [5:0] 	       s_trans_id;
   logic 	       s_trans_last;
   logic 	       s_push_req,s_pop_req;
   logic 	       s_trans_stalled;
   
   logic 	       s_sample_data, s_forward_data;
   
   // FSM STATES SIGNALS
   enum 	       `ifdef SYNTHESIS logic [1:0] `endif { TRANS_RUN, TRANS_STALLED } CS, NS;
   
   // SAMPLES tcdm_r_rdata WHEN A STALL CONDITION OCCOURS
   always_ff @ (posedge clk_i, negedge rst_ni)
     begin
	if (rst_ni == 1'b0)
	  begin
	     s_tcdm_r_rdata <= '0;
	  end
	else
	  begin
	     if ( s_sample_data == 1'b1 )
	       begin
		  s_tcdm_r_rdata <= tcdm_r_rdata_i;
	       end
	  end
     end
   
   // MUXES THE COMBINATIONAL AND SYNCHRONOUS VESRION OF tcdm_r_rdata
   always_comb
     begin
	if ( s_forward_data == 1'b1 )
	  begin
	     data_dat_o  = s_tcdm_r_rdata;
	  end
	else
	  begin
	     data_dat_o  = tcdm_r_rdata_i;
	  end
     end
   
   //**********************************************************
   //*************** REQUEST CHANNEL **************************
   //**********************************************************
   
   // COMPUTE NEXT STATE
   always_comb
     begin
	
	tcdm_req_o       = '0;
	tcdm_be_o        = '0;
	trans_gnt_o      = '0;
	s_push_req       = '0;
	
	begin
	   if ( trans_req_i == 1'b1 && s_trans_stalled == 1'b0 ) // REQUEST FROM COMMAND QUEUE && RX OPERATION && TX BUFFER AVAILABLE
	     begin
		tcdm_req_o = 1'b1;
		tcdm_be_o  = '1;
		if ( tcdm_gnt_i == 1'b1 ) // THE TRANSACTION IS GRANTED FROM THE TCDM
		  begin
		     trans_gnt_o  = 1'b1;
		     s_push_req  = 1'b1;
		  end
	     end
	end
     end
   
   //**********************************************************
   //********** DECOUPLE REQUEST AND RESPONE CHANNEL **********
   //**********************************************************
   
   axi2mem_buffer
     #(
       .DATA_WIDTH(7),
       .BUFFER_DEPTH(2)
       )
   tcdm_cmd_queue_i
     (
      
      .clk_i(clk_i),
      .rst_ni(rst_ni),
      
      .data_i({trans_id_i,trans_last_i}),
      .valid_i(s_push_req),
      .ready_o(),
      
      .data_o({s_trans_id,s_trans_last}),
      .ready_i(s_pop_req),
      .valid_o()
      
      );
   
   //**********************************************************
   //*************** RESPONSE CHANNEL *************************
   //**********************************************************
   
   // UPDATE THE STATE
   always_ff @(posedge clk_i, negedge  rst_ni)
     begin : UPDATE_STATE
	if(rst_ni == 1'b0)
	  CS <= TRANS_RUN;
	else
	  CS <= NS;
     end
   
   // COMPUTE NEXT STATE
   always_comb
     begin : COMPUTE_STATE
	
	data_req_o      = '0;
	data_last_o     = '0;
	data_id_o       = '0;
	s_pop_req       = '0;
	s_sample_data   = '0;
	s_forward_data  = '0;
	s_trans_stalled = '0;
	
	case(CS)
	
	  TRANS_RUN:
	    begin
	       s_sample_data  = 1'b1;
	       if ( tcdm_r_valid_i == 1'b1 )
		 begin
		    if ( data_gnt_i == 1'b1 )
		      begin
			 s_pop_req = 1'b1;
			 data_req_o = 1'b1;
			 NS = TRANS_RUN;
			 if ( s_trans_last == 1'b1)
			   begin
			      data_last_o = 1'b1;
			      data_id_o = s_trans_id;
			   end
		      end
		    else
		      begin
			 s_trans_stalled = 1'b1;
			 NS              = TRANS_STALLED;
		      end
		 end
	       else
		 begin
		    NS = TRANS_RUN;
		 end
	    end
	  
	  TRANS_STALLED:
	    begin
	       s_forward_data  = 1'b1;
	       s_trans_stalled = 1'b1;
	       if ( data_gnt_i == 1'b1 )
		 begin
		    s_pop_req = 1'b1;
		    data_req_o = 1'b1;
		    NS = TRANS_RUN;
		    if ( s_trans_last == 1'b1)
		      begin
			 data_last_o = 1'b1;
			 data_id_o   = s_trans_id;
		      end
		 end
	       else
		 begin
		    NS = TRANS_STALLED;
		 end
	    end
	  
	  default:
	    NS = TRANS_RUN;
	  
	endcase
	
     end
   
   //**********************************************************
   //********** BINDING OF INPUT/OUTPUT SIGNALS ***************
   //**********************************************************
   
   assign tcdm_add_o   = trans_add_i;
   assign tcdm_we_o    = 1'b1;
   assign tcdm_wdata_o = '0;
   
endmodule
