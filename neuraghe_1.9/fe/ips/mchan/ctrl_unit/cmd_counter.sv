// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

// Davide Rossi <davide.rossi@unibo.it>

module cmd_counter
  #(
    parameter MCHAN_LEN_WIDTH    = 16,
    parameter TWD_COUNT_WIDTH    = 16,
    parameter TWD_STRIDE_WIDTH   = 16,
    parameter EXT_ADD_WIDTH      = 29,
    parameter TCDM_ADD_WIDTH     = 29,
    parameter MCHAN_BURST_LENGTH = 64
    )
   (
    
    input logic 		       clk_i,
    input logic 		       rst_ni,
    
    input logic 		       cmd_req_i,
    input logic [MCHAN_LEN_WIDTH-1:0]  cmd_len_i,
    input logic 		       cmd_twd_ext_i,
    input logic 		       cmd_twd_tcdm_i,
   
    input logic [TWD_COUNT_WIDTH-1:0]  cmd_ext_count_i,
    input logic [TWD_STRIDE_WIDTH-1:0] cmd_ext_stride_i,
    input logic [TWD_COUNT_WIDTH-1:0]  cmd_tcdm_count_i,
    input logic [TWD_STRIDE_WIDTH-1:0] cmd_tcdm_stride_i,
    
    input logic [EXT_ADD_WIDTH-1:0]    ext_add_i,
    input logic [TCDM_ADD_WIDTH-1:0]   tcdm_add_i,
    
    output logic 		       cmd_req_o,
    output logic [MCHAN_LEN_WIDTH-1:0] cmd_nb_o
    
    );
   
   // FSM STATES SIGNALS
   enum                                 `ifdef SYNTHESIS logic [1:0] `endif { TRANS_IDLE, TRANS_RUN } CS, NS;
   
   // MCHAN TWD QUEUE SIGNALS
   logic 				s_mchan_twd_ext;
   logic 				s_mchan_twd_tcdm;
   logic [TWD_COUNT_WIDTH-1:0] 		s_mchan_ext_count;
   logic [TWD_STRIDE_WIDTH-1:0] 	s_mchan_ext_stride;
   logic [TWD_COUNT_WIDTH-1:0] 		s_mchan_tcdm_count;
   logic [TWD_STRIDE_WIDTH-1:0] 	s_mchan_tcdm_stride;
   logic [TCDM_ADD_WIDTH-1:0] 		s_mchan_tcdm_add, s_mchan_tcdm_base_add;
   logic [EXT_ADD_WIDTH-1:0] 		s_mchan_ext_add, s_mchan_ext_base_add;
   
   logic [MCHAN_LEN_WIDTH-1:0] 		s_mchan_rem_len, s_ext_rem_len, s_tcdm_rem_len;
   logic [MCHAN_LEN_WIDTH-1:0] 		s_mchan_cur_len, s_mchan_first_len;
   
   logic 				s_ext_len_smaller, s_tcdm_len_smaller;
   
   logic 				s_trans_complete;
   
   logic 				s_ext_add_burst_crossed,s_ext_add_burst_aligned;
   logic [MCHAN_LEN_WIDTH-1:0] 		s_mchan_init_rem_len;
   
   //**********************************************************
   //***** SAMPLES THE OPCODE, SID OF CURRENT TRANSFER ********
   //**********************************************************
   
   always_ff @ (posedge clk_i, negedge rst_ni)
     begin
	if (rst_ni == 1'b0)
	  begin
	     s_mchan_twd_ext     <= 0;
	     s_mchan_twd_tcdm    <= 0;
	  end
	else
	  begin
	     if ( cmd_req_i == 1'b1 ) // SAMPLES DATA AT THE BEGINNING OF EACH MCHAN TRANSFER
	       begin
		  s_mchan_twd_ext  <= cmd_twd_ext_i;  // 2D EXT
		  s_mchan_twd_tcdm <= cmd_twd_tcdm_i; // 2D TCDM
	       end
	  end
     end
   
   //**********************************************************
   //***** COMPUTES THE LENGTH OF CURRNT TRANSACTION **********
   //**********************************************************
   
   always_ff @ (posedge clk_i, negedge rst_ni)
     begin
	if (rst_ni == 1'b0)
	  begin
	     s_mchan_rem_len        <= 0;
	     s_ext_rem_len          <= 0;
	     s_tcdm_rem_len         <= 0;
	     s_mchan_ext_add        <= 0;
	     s_mchan_ext_base_add   <= 0;
	     s_mchan_tcdm_add       <= 0;
	     s_mchan_tcdm_base_add  <= 0;
	     s_mchan_ext_count      <= 0;
	     s_mchan_ext_stride     <= 0;
	     s_mchan_tcdm_count     <= 0;
	     s_mchan_tcdm_stride    <= 0;
	  end
	else
	  begin
	     if ( cmd_req_i == 1 )
	       begin
		  
		  // EXT ADD COMPUTATION
		  s_mchan_ext_add       <= ext_add_i;
		  s_mchan_ext_base_add  <= ext_add_i;
		  
		  s_mchan_tcdm_add      <= tcdm_add_i;
		  s_mchan_tcdm_base_add <= tcdm_add_i;
		  
		  // EXT STRIDE AND COUNT COMPUTATION
		  if ( cmd_twd_ext_i == 1 )
		    begin
		       s_mchan_ext_count    <= cmd_ext_count_i + 1;
		       s_mchan_ext_stride   <= cmd_ext_stride_i + 1;
		    end
		  else
		    begin
		       s_mchan_ext_count    <= cmd_len_i + 1;
		       s_mchan_ext_stride   <= 0;
		    end
		  
		  // TCDM STRIDE AND COUNT COMPUTATION
		  if ( cmd_twd_tcdm_i == 1)
		    begin
		       s_mchan_tcdm_count   <= cmd_tcdm_count_i + 1;
		       s_mchan_tcdm_stride  <= cmd_tcdm_stride_i + 1;
		    end
		  else
		    begin
		       s_mchan_tcdm_count   <= cmd_len_i + 1;
		       s_mchan_tcdm_stride  <= 0;
		    end
		  
		  // INITIAL REM LEN COMPUTATION
		  s_mchan_rem_len <= cmd_len_i + 1;
		  
		  if ( ( cmd_tcdm_count_i < cmd_len_i )  &&  ( cmd_twd_tcdm_i == 1 ) )
		    s_tcdm_rem_len      <= cmd_tcdm_count_i + 1;
		  else
		    s_tcdm_rem_len      <= cmd_len_i + 1;
		  
		  if ( ( cmd_ext_count_i <= cmd_len_i ) && ( cmd_twd_ext_i == 1) )
		    s_ext_rem_len       <= cmd_ext_count_i + 1;
		  else
		    s_ext_rem_len       <= cmd_len_i + 1;
		  
	       end
	     else
	       begin
		  if ( cmd_req_o == 1'b1 )
		    begin
		       
		       s_mchan_rem_len <= s_mchan_rem_len - s_mchan_cur_len;
		       
		       if ( s_ext_rem_len > s_mchan_cur_len )
			 begin
			    s_ext_rem_len         <= s_ext_rem_len   - s_mchan_cur_len;
			    s_mchan_ext_add       <= s_mchan_ext_add + s_mchan_cur_len;
			 end
		       else
			 begin
			    s_ext_rem_len         <= s_mchan_ext_count;
			    s_mchan_ext_add       <= s_mchan_ext_base_add + s_mchan_ext_stride;
			    s_mchan_ext_base_add  <= s_mchan_ext_base_add + s_mchan_ext_stride;
			 end
		       
		       if ( s_tcdm_rem_len > s_mchan_cur_len )
			 begin
			    s_tcdm_rem_len        <= s_tcdm_rem_len - s_mchan_cur_len;
			    s_mchan_tcdm_add      <= s_mchan_tcdm_add + s_mchan_cur_len;
			 end
		       else
			 begin
			    s_tcdm_rem_len        <= s_mchan_tcdm_count;
			    s_mchan_tcdm_add      <= s_mchan_tcdm_base_add + s_mchan_tcdm_stride;
			    s_mchan_tcdm_base_add <= s_mchan_tcdm_base_add + s_mchan_tcdm_stride;
			 end
		       
		    end
	       end
	  end
     end
   
   always_comb
     begin
	
	// CUR LEN COMPUTATION
	s_ext_len_smaller  =  ( s_ext_rem_len  <= s_tcdm_rem_len ) && ( s_ext_rem_len  <= s_mchan_rem_len );
	s_tcdm_len_smaller =  ( s_tcdm_rem_len <= s_ext_rem_len  ) && ( s_tcdm_rem_len <= s_mchan_rem_len );
	
	if ( s_ext_len_smaller ==  1)
	  s_mchan_cur_len     = s_ext_rem_len;
	else
	  if ( s_tcdm_len_smaller ==  1)
	    s_mchan_cur_len   = s_tcdm_rem_len;
	  else
	    s_mchan_cur_len   = s_mchan_rem_len;
     end
   
   always_comb
     begin
        if ( ( s_mchan_rem_len <= s_mchan_cur_len ) )
          begin
             s_trans_complete = 1;
          end
        else
          begin
             s_trans_complete = 0;
          end
     end
      
   //**********************************************************
   //********** FINITE STATE MACHINE TO COMPUTE REQ ***********
   //**********************************************************
   
   // UPDATE THE STATE
   always_ff @(posedge clk_i, negedge rst_ni)
     begin
        if(rst_ni == 1'b0)
          CS <= TRANS_IDLE;
        else
          CS <= NS;
     end
   
   // COMPUTES NEXT STATE
   always_comb
     begin
        
        cmd_req_o = 0;
        
        case(CS)
          
          TRANS_IDLE:
            begin
               cmd_req_o = 0;
               if ( cmd_req_i == 1'b1 )
                 NS = TRANS_RUN;
               else
                 NS = TRANS_IDLE;
            end
          
          TRANS_RUN:
            begin
               cmd_req_o = 1;
               if ( s_trans_complete == 1'b1 || ( ( s_mchan_twd_ext == 1'b0 ) && ( s_mchan_twd_tcdm == 1'b0 ) ) )
                 begin
                    NS = TRANS_IDLE;
                 end
               else
                 begin
                    NS =  TRANS_RUN;
                 end
            end
          
          default:
            begin
               NS = TRANS_IDLE;
            end
          
        endcase
        
     end
   
   //**********************************************************
   //***** COMPUTE NUMBER OF COMMANDS *************************
   //**********************************************************
   
   // CHECKS BURST BOUNDARY CROSSING CONDITION
   always_comb
     begin
        if ( s_mchan_ext_add[EXT_ADD_WIDTH-1:$clog2(MCHAN_BURST_LENGTH)] != ( ( s_mchan_ext_add + s_mchan_cur_len ) >>  $clog2(MCHAN_BURST_LENGTH) ) )
          s_ext_add_burst_crossed = 1'b1;
        else
          s_ext_add_burst_crossed = 1'b0;
     end
   
   // COMPUTE LENGTH OF FIRST TRANSFER
   always_comb
     begin
        if ( s_ext_add_burst_crossed == 1'b0  )
          s_mchan_first_len = s_mchan_cur_len; // BURST BOUNDARY NOT CROSSED
        else
          s_mchan_first_len = MCHAN_BURST_LENGTH - s_mchan_ext_add[$clog2(MCHAN_BURST_LENGTH)-1:0]; // BURST BOUNDARY CROSSED
     end
   
   assign s_mchan_init_rem_len      = s_mchan_cur_len - s_mchan_first_len;
   
   always_comb
     begin
        if ( s_mchan_init_rem_len[$clog2(MCHAN_BURST_LENGTH)-1:0] == 0 )
          s_ext_add_burst_aligned = 1'b1;
        else
          s_ext_add_burst_aligned = 1'b0;
     end
   
   // COMPUTE NUMBER OF COMMANDS
   always_comb
     begin
        if ( s_ext_add_burst_crossed == 1'b0 )
          cmd_nb_o = 1;
        else
          if ( s_ext_add_burst_aligned == 1'b1 )
            cmd_nb_o = ( s_mchan_init_rem_len >> $clog2(MCHAN_BURST_LENGTH) ) + 1;
          else
            cmd_nb_o = ( s_mchan_init_rem_len >> $clog2(MCHAN_BURST_LENGTH) ) + 2;
     end
   
endmodule
