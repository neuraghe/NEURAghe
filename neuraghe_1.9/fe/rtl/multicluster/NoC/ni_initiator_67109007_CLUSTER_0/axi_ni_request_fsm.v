`include "noc_parameters.v"

module axi_ni_request_fsm(clk, rst, last_beat, tx_gone, aw_rempty, wd_rempty, ar_rempty, aw_rinc, ar_rinc, wd_rinc, is_payload, sample_header, sample_payload, send_message, flit_sequence, num_flit_to_transmit, outs_rd_ovfl, outs_wr_ovfl, outs_rd_unfl, outs_wr_unfl, outs_rd_max, outs_wr_max, curr_tid, write_select, decr_outs_wr_cntr, decr_outs_rd_cntr, response_awaited);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter MAX_SUPPORTED_IDS = 16;
    parameter LOG_MAX_OUTSTANDING_WRITES_PER_ID = 4;
    parameter LOG_MAX_OUTSTANDING_READS_PER_ID = 0;
    `include "axi_parameters.v"
    `include "ni_parameters.v"

    input                                  clk;
    input                                  rst;
    input                                  last_beat;
    input                                  tx_gone;
    input [MAX_SUPPORTED_IDS - 1 : 0]      aw_rempty;
    input [MAX_SUPPORTED_IDS - 1 : 0]      wd_rempty;
    input [MAX_SUPPORTED_IDS - 1 : 0]      ar_rempty;
    //output							    
    output reg [MAX_SUPPORTED_IDS - 1 : 0] aw_rinc;
    output reg [MAX_SUPPORTED_IDS - 1 : 0] ar_rinc;
    output reg [MAX_SUPPORTED_IDS - 1 : 0] wd_rinc;
    output reg                             is_payload;
    output reg                             sample_header;
    output reg                             sample_payload;
    output reg                             send_message;
    output reg [`FTYPEWD - 1 : 0]          flit_sequence;
    output reg [`COUNTERFLITWD - 1 : 0]    num_flit_to_transmit;
    //alarm/error flags	    
    output reg [MAX_SUPPORTED_IDS - 1 : 0] outs_rd_ovfl;
    output reg [MAX_SUPPORTED_IDS - 1 : 0] outs_wr_ovfl;
    output reg [MAX_SUPPORTED_IDS - 1 : 0] outs_rd_unfl;
    output reg [MAX_SUPPORTED_IDS - 1 : 0] outs_wr_unfl;
    output     [MAX_SUPPORTED_IDS - 1 : 0] outs_rd_max;
    output     [MAX_SUPPORTED_IDS - 1 : 0] outs_wr_max;
    output     [`AXIIDWD - 1 : 0]          curr_tid;
    output reg                             write_select;
    // response FSM 
    input [MAX_SUPPORTED_IDS - 1 : 0]      decr_outs_wr_cntr;
    input [MAX_SUPPORTED_IDS - 1 : 0]      decr_outs_rd_cntr;
    output [MAX_SUPPORTED_IDS - 1 : 0]     response_awaited;

//------------------------------------------------------------------------------
// Constants declaration
//------------------------------------------------------------------------------

localparam IDLE = 3'b000;
localparam WRITE_HEADER_TX = 3'b001;
localparam READ_HEADER_TX = 3'b010;
localparam WRITE_PAYLOAD_TX = 3'b011;
localparam WRITE_LAST_PAYLOAD_TX = 3'b100;
localparam WRITE_PAUSE_TX = 3'b101;

localparam NOP_ID = 3'b000;
localparam READ_ID = 3'b001;
localparam WRITE_ID = 3'b010;
localparam OVFL_READ_ID = 3'b011;
localparam OVFL_WRITE_ID = 3'b100;

//------------------------------------------------------------------------------
// Function declaration
//------------------------------------------------------------------------------

// --------------------------------------------------------------------------
// ------------ Round robin algorithm for the next ID selection -------------
// --------------------------------------------------------------------------
function [`AXIIDWD+2:0] next_id (input reg [`AXIIDWD+2:0] previous_op_id, 
                                  input reg [MAX_SUPPORTED_IDS-1:0] outs_rd_max,
                                  input reg [MAX_SUPPORTED_IDS-1:0] outs_wr_max,
                                  input reg [MAX_SUPPORTED_IDS-1:0] ar_rempty,
                                  input reg [MAX_SUPPORTED_IDS-1:0] aw_rempty,
                                  input reg [MAX_SUPPORTED_IDS-1:0] wd_rempty
				  );
  reg [`AXIIDWD+2:0] tmp;
  reg [`AXIIDWD-1:0] id, p_id;
  reg [2:0] p_op;  
  reg end_search_id;
  integer index;
  
  begin
     tmp            = {NOP_ID, 4'b0000};
     p_op           =  previous_op_id[`AXIIDWD+2:`AXIIDWD]; 

     p_id           =  previous_op_id[`AXIIDWD-1:0]; 
//     p_id[3]    =  previous_op_id[3];	    
//     p_id[2]    =  previous_op_id[2];	    
//     p_id[1]    =  previous_op_id[1];	    
//     p_id[0]    =  previous_op_id[0];	         
     
     id             =  p_id;           
     end_search_id  = 0;
     for(index=0; index<MAX_SUPPORTED_IDS; index=index+1)    // replace while loop with for loop due to synthesis limitation
     begin
        if (!end_search_id)
//     while  (!end_search_id)
        begin	   
           if (id==p_id && p_op == NOP_ID && !ar_rempty[id])				  // current = none, next = RD
           begin
              if (!outs_rd_max[id])   
                 tmp = {READ_ID, id};
              else
                 tmp = {OVFL_READ_ID, id};
              end_search_id = 1;  
           end
           else if (id==p_id && p_op == NOP_ID && !aw_rempty[id] && !wd_rempty[id])	  // current = none, next = WR
           begin
              if (!outs_wr_max[id])   
                 tmp = {WRITE_ID, id};
              else 
                 tmp = {OVFL_WRITE_ID, id};
              end_search_id = 1;  
           end
           else if (id==p_id && p_op == READ_ID && !aw_rempty[id] && !wd_rempty[id])	   // current = RD, next = WR
           begin
              if (!outs_wr_max[id])   
                 tmp = {WRITE_ID, id};
              else 
                 tmp = {OVFL_WRITE_ID, id};
              end_search_id = 1;  
           end  	   
           else if (id != p_id && !ar_rempty[id])				      // next = RD	       
           begin 
              if (!outs_rd_max[id])   
                 tmp = {READ_ID, id};
              else
                 tmp = {OVFL_READ_ID, id};
              end_search_id = 1;  
           end     
           else if (id != p_id && !aw_rempty[id] && !wd_rempty[id])		      // next = WR	       
           begin    
              if (!outs_wr_max[id])   
                 tmp = {WRITE_ID, id};
              else
                 tmp = {OVFL_WRITE_ID, id};
              end_search_id = 1;  
           end  	      
           else if (id==(MAX_SUPPORTED_IDS-1) && (p_id != 0))				      // wrapping
              id = 0;  
           else if ((id==(MAX_SUPPORTED_IDS-1) && (p_id == 0)) || id==(p_id-1) )		      // last search
              end_search_id = 1;    
           else 								      // increment 
              id = id + 1;
//      end  // end while loop
        end  // end if search
     end  // end for loop
// failed search     
     if (tmp == NOP_ID && !aw_rempty[p_id] && !wd_rempty[p_id] && !outs_wr_max[p_id])      // next = previous WR
        tmp = {WRITE_ID, p_id};
     else if (tmp == NOP_ID && !ar_rempty[p_id] && !outs_rd_max[p_id])                     // next = previous RD
        tmp = {READ_ID, p_id};
     else if (tmp == NOP_ID && !aw_rempty[p_id] && !wd_rempty[p_id] && outs_wr_max[p_id])  // next = OVFL_WR
        tmp = {OVFL_WRITE_ID, p_id};
     else if (tmp == NOP_ID && !ar_rempty[p_id] && outs_rd_max[p_id])                      // next = OVFL_RD
        tmp = {OVFL_READ_ID, p_id};
     next_id = tmp;  
     `ifdef DEBUG
        $display("INFO: NII_AXI ID ARBITER => Next ID selected = %h",next_id);
     `endif  
  end 
endfunction




//------------------------------------------------------------------------------
// Internal signals declaration
//------------------------------------------------------------------------------
reg [2:0]            req_fsm_cstate;
reg [2:0]            req_fsm_nstate;
reg [LOG_MAX_OUTSTANDING_READS_PER_ID : 0] outs_rd_cntr[MAX_SUPPORTED_IDS - 1 : 0];    // outstanding read counter
reg [LOG_MAX_OUTSTANDING_WRITES_PER_ID : 0] outs_wr_cntr[MAX_SUPPORTED_IDS - 1 : 0];    // outstanding write counter
reg [MAX_SUPPORTED_IDS-1:0]      incr_outs_wr_cntr;
reg [MAX_SUPPORTED_IDS-1:0]      incr_outs_rd_cntr;
reg [MAX_SUPPORTED_IDS-1:0]      outs_rd_ovfl_c;
reg [MAX_SUPPORTED_IDS-1:0]      outs_wr_ovfl_c;
reg [`AXIIDWD+2:0]    curr_id_c; 
reg [`AXIIDWD+2:0]    curr_id; 
reg                   ovfl_error;

wire [LOG_MAX_OUTSTANDING_WRITES_PER_ID : 0]    outs_wr_sup;
wire [LOG_MAX_OUTSTANDING_READS_PER_ID : 0]     outs_rd_sup;


//------------------------------------------------------------------------------
// FSM current state
//------------------------------------------------------------------------------

always@(posedge clk `RESET_SENSITIVITY)
begin : fsm_cstate_outc
   if (rst == `RESET_ACTIVE_VALUE)
      req_fsm_cstate <= IDLE;
   else
      req_fsm_cstate <= req_fsm_nstate;
end

//------------------------------------------------------------------------------
// FSM next state and outputs
//------------------------------------------------------------------------------

always@(req_fsm_cstate or curr_id or curr_tid or outs_rd_max or outs_wr_max or ar_rempty or aw_rempty or wd_rempty or
        last_beat or tx_gone)
begin : fsm_nstate
// variables
  integer i;
  reg [`AXIIDWD + 2 : 0]  tmp_id;
     // default values
     req_fsm_nstate	    <= req_fsm_cstate;	    	   
     aw_rinc		    <= 0;	    	   
     ar_rinc		    <= 0;
     wd_rinc		    <= 0; 	    	   
     is_payload 	    <= 0;	    	   
     sample_header	    <= 0;	    	   
     sample_payload	    <= 0;	    	   	    	       	   
     send_message	    <= 0;	    	   
     flit_sequence	    <= `ENC_HEAD;   	    
     num_flit_to_transmit   <= 0;	    	   
     curr_id_c 		    <= 0;
     write_select           <= 0;
     tmp_id                  = 0;
     outs_wr_ovfl_c         <= 0;
     outs_rd_ovfl_c         <= 0;   
     incr_outs_wr_cntr      <= 0; 
     incr_outs_rd_cntr      <= 0; 
     ovfl_error             <= 0;     		   
     case (req_fsm_cstate)											    
        IDLE:
     	begin													    
	   tmp_id  = next_id(curr_id,outs_rd_max,outs_wr_max,ar_rempty,aw_rempty,wd_rempty); 		    
           if ((tmp_id[`AXIIDWD+2:`AXIIDWD] == WRITE_ID) || (tmp_id[`AXIIDWD+2:`AXIIDWD] == READ_ID))
     	   begin												    
   	      sample_header	                           <= 1;
     	      curr_id_c                                    <= tmp_id;					    								    
              if (tmp_id[`AXIIDWD+2:`AXIIDWD] == WRITE_ID)
	      begin  	
	         aw_rinc[tmp_id[`AXIIDWD-1:0]]             <= 1;  					    
     	         incr_outs_wr_cntr[tmp_id[`AXIIDWD-1:0]]   <= 1;
		 write_select                              <= 1;
                 req_fsm_nstate	                           <= WRITE_HEADER_TX;
	      end 									    
 	      else
	      begin
	         ar_rinc[tmp_id[`AXIIDWD-1:0]]             <= 1;    
     	         incr_outs_rd_cntr[tmp_id[`AXIIDWD-1:0]]   <= 1;
                 req_fsm_nstate	                           <= READ_HEADER_TX;
              end		 		   					    
     	   end	
           else if (tmp_id[`AXIIDWD+2:`AXIIDWD] == OVFL_WRITE_ID)
	   begin 
     	      curr_id_c                             <= tmp_id;					    								    
	      outs_wr_ovfl_c[tmp_id[`AXIIDWD-1:0]]  <= 1;  	      
              req_fsm_nstate	                    <= IDLE;
              ovfl_error                            <= 1;     		   
   	   end	               
           else if (tmp_id[`AXIIDWD+2:`AXIIDWD] == OVFL_READ_ID)
	   begin 
     	      curr_id_c                             <= tmp_id;					    								    
	      outs_rd_ovfl_c[tmp_id[`AXIIDWD-1:0]]  <= 1;  	            
              req_fsm_nstate	                    <= IDLE;
              ovfl_error                            <= 1;     		   
   	   end
	   else
	   begin	   
              req_fsm_nstate	                    <= IDLE;
   	   end	      	   	 	   	  							    
     	end													    			    	
        WRITE_HEADER_TX:
     	begin
	   send_message	            <= 1;									    	   		        						   
     	   flit_sequence	    <= `ENC_HEAD;	        						   
     	   num_flit_to_transmit     <= REQ_HEADERFLITS;  
	   write_select             <= 1;       					   	        	  														    
     	   if (tx_gone) 											    
     	   begin												    
//     	      is_payload	       <= 1;									    
     	      sample_payload	       <= 1;									    								    
//     	      flit_sequence	       <= `ENC_PAYL;								    						    
              wd_rinc[curr_tid]        <= 1;
	      if (!last_beat)									    
                 req_fsm_nstate        <= WRITE_PAYLOAD_TX;
	      else
                 req_fsm_nstate        <= WRITE_LAST_PAYLOAD_TX;
     	   end
	   else
     	   begin						    
              req_fsm_nstate	       <= WRITE_HEADER_TX;
     	   end	   	     												    
     	end													    
        WRITE_PAYLOAD_TX:
     	begin													    
     	   is_payload	            <= 1;	
	   send_message  	    <= 1;									    	   		        						   
     	   flit_sequence	    <= `ENC_PAYL;	        						   
     	   num_flit_to_transmit     <= WRITE_REQ_PAYLOADFLITS;     		    				     	    
	   write_select             <= 1;  
     	   if (tx_gone && !last_beat && !wd_rempty[curr_tid]) 	     // burst										    
     	   begin
	      wd_rinc[curr_tid]     <= 1;
     	      sample_payload	    <= 1;									    		      													    
              req_fsm_nstate        <= WRITE_PAYLOAD_TX;
     	   end  
     	   else if (tx_gone && last_beat && !wd_rempty[curr_tid])      // last beat
     	   begin
	      wd_rinc[curr_tid]     <= 1;
     	      sample_payload	    <= 1;									    	      													    
              req_fsm_nstate        <= WRITE_LAST_PAYLOAD_TX;
     	   end  	   			   
     	   else if (tx_gone && wd_rempty[curr_tid])      // empty buffer	
     	   begin
//     	      sample_payload	    <= 1;									    		      												    
              req_fsm_nstate        <= WRITE_PAUSE_TX;
     	   end
	   else
           begin
              req_fsm_nstate        <= WRITE_PAYLOAD_TX;
	   end 	     	   												    
     	end													    
        WRITE_PAUSE_TX:
     	begin	
    	   is_payload	            <= 1;	
     	   flit_sequence	    <= `ENC_PAYL;	        						   
     	   num_flit_to_transmit     <= WRITE_REQ_PAYLOADFLITS;    
	   write_select             <= 1;  
	   if (!wd_rempty[curr_tid] && !last_beat)
	   begin	   
	      wd_rinc[curr_tid]     <= 1;
     	      sample_payload	    <= 1;									    	      													    
              req_fsm_nstate        <= WRITE_PAYLOAD_TX;
	   end
	   else if (!wd_rempty[curr_tid] && last_beat)
	   begin	   
	      wd_rinc[curr_tid]     <= 1;
     	      sample_payload	    <= 1;									    	      													    
              req_fsm_nstate        <= WRITE_LAST_PAYLOAD_TX;
	   end	      
	   else
              req_fsm_nstate        <= WRITE_PAUSE_TX;
     	end
        WRITE_LAST_PAYLOAD_TX:
     	begin	
     	   is_payload	            <= 1;	
	   send_message	            <= 1;									    	   		        						   
     	   flit_sequence	    <= `ENC_TAIL;	        						   
     	   num_flit_to_transmit     <= WRITE_REQ_PAYLOADFLITS;    	        
	   write_select             <= 1;  
	   if (tx_gone)	   
              req_fsm_nstate        <= IDLE;
	   else
              req_fsm_nstate        <= WRITE_LAST_PAYLOAD_TX;
     	end		
        READ_HEADER_TX:
     	begin													    
	   send_message  	    <= 1;									    	   		        						   
     	   flit_sequence	    <= `ENC_SING;	        						   
     	   num_flit_to_transmit     <= REQ_HEADERFLITS;         					   	        	  														    
     	   if (tx_gone) 											    												    								    					    
              req_fsm_nstate	    <= IDLE;
	   else					    
              req_fsm_nstate	    <= READ_HEADER_TX;
     	end													    
     	default:
	begin  
           req_fsm_nstate	  <= IDLE;
           aw_rinc		  <= 0; 	         
           ar_rinc		  <= 0; 	         
           wd_rinc		  <= 0; 	         
           is_payload 	          <= 0; 	         
           sample_header	  <= 0; 	         
           sample_payload	  <= 0; 	         	         	         
           send_message	          <= 0; 	         
           flit_sequence	  <= `ENC_HEAD;          
           num_flit_to_transmit   <= 0; 	         
           curr_id_c		  <= 0; 
	   write_select           <= 0;  	   
	   tmp_id                  = 0;	         
           outs_wr_ovfl_c         <= 0;
           outs_rd_ovfl_c         <= 0;  
           incr_outs_wr_cntr      <= 0; 
           incr_outs_rd_cntr      <= 0;   	      	    	
           ovfl_error             <= 0;     		   
	end								    
     endcase													    		 
end
  

//------------------------------------------------------------------------------
// Outstanding write/read request counters/flags + current ID
//------------------------------------------------------------------------------

assign  curr_tid = (sample_header == 1) ? curr_id_c[`AXIIDWD-1:0] : curr_id[`AXIIDWD-1:0];


always@(posedge clk `RESET_SENSITIVITY)
begin : fsm_outputs_cntr
// variables
  integer i;
   			  
	if (rst == `RESET_ACTIVE_VALUE)
	begin 
	   curr_id     <= 0;         
           for (i=0; i<MAX_SUPPORTED_IDS;i=i+1)
	   begin       
	      outs_rd_cntr[i]     <= 0;  
              outs_wr_cntr[i]	  <= 0;
	      outs_rd_ovfl[i] 	  <= 0;  
	      outs_wr_ovfl[i] 	  <= 0; 
	      outs_rd_unfl[i] 	  <= 0;  
	      outs_wr_unfl[i] 	  <= 0; 	      	      
	   end   
         end 
	else
	begin
	   if (sample_header | ovfl_error)
	      curr_id  <= curr_id_c;   
           for (i=0; i<MAX_SUPPORTED_IDS;i=i+1)
	   begin
	      outs_rd_ovfl[i] 	  <= outs_rd_ovfl_c[i];  
	      outs_wr_ovfl[i] 	  <= outs_wr_ovfl_c[i]; 
	      outs_rd_unfl[i]     <= 0; 
	      outs_wr_unfl[i]     <= 0; 	      
              // read counter	      	      
	      if (incr_outs_rd_cntr[i] && !outs_rd_max[i])       
	         outs_rd_cntr[i]     <= outs_rd_cntr[i] +1; 
	      else if (decr_outs_rd_cntr[i] && outs_rd_cntr[i] != 0)
	         outs_rd_cntr[i]     <= outs_rd_cntr[i] -1;
	      else if (decr_outs_rd_cntr[i] && outs_rd_cntr[i] == 0)
	         outs_rd_unfl[i]     <= 1; 
              // write counter	      	  	      	  
              if (incr_outs_wr_cntr[i] && !outs_wr_max[i]) 	      
	         outs_wr_cntr[i]     <= outs_wr_cntr[i] + 1; 
	      else if (decr_outs_wr_cntr[i] && outs_wr_cntr[i] != 0)
	         outs_wr_cntr[i]     <= outs_wr_cntr[i] - 1;
	      else if (decr_outs_wr_cntr[i] && outs_wr_cntr[i] == 0)
	         outs_wr_unfl[i]     <= 1; 		 		  
	   end   	   			 		 	   	   
	end   		 
end

//------------------------------------------------------------------------------
// outstanding max 
//------------------------------------------------------------------------------

assign outs_wr_sup = 2 ** LOG_MAX_OUTSTANDING_WRITES_PER_ID;
assign outs_rd_sup = 2 ** LOG_MAX_OUTSTANDING_READS_PER_ID;

genvar i;
generate
   for(i=0; i<MAX_SUPPORTED_IDS; i=i+1)
   begin:outs_max
   assign outs_rd_max[i]      = ((outs_rd_cntr[i] == outs_rd_sup) ? 1'b1 : 1'b0);
   assign outs_wr_max[i]      = ((outs_wr_cntr[i] == outs_wr_sup)? 1'b1 : 1'b0);
   assign response_awaited[i] = ((outs_wr_cntr[i] > 0 || outs_rd_cntr[i] > 0) ? 1'b1 : 1'b0);
   end 
endgenerate


endmodule
