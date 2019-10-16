////////////////////////////////////////////////////////////////////////////////
// Company:        IIS @ ETHZ - Federal Institute of Technology Zurich        //
//                                                                            //
// Engineer:       Florian Glaser, glaserf@ethz.ch                            //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    05/11/2014                                                 //
// Design Name:    Multi-functional platform based on a SAR ADC               //
// Module Name:    fifo_adc.sv	                                              //
// Project Name:   VivoSoC                                                    //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Configurable FIFO with level and overflow output           //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////



module fifo_adc
#(parameter W_FIFO = 4,
  parameter W_DATA = 32 )
(
    // clock and reset
    input  logic clk,
    input  logic rst_n,

    // data input
    input  logic              data_valid_i,
    input  logic [W_DATA-1:0] data_i,

    // interface to control block
    output logic [W_FIFO:0]   fill_level_o,  // 1 Bit wider than W_FIFO to account for full FIFO
    output logic              ovflw_o,
    output logic [W_DATA-1:0] data_o,
    input  logic              read_req_i
 );
   localparam N_ENTRIES = 2**W_FIFO;

   // fifo data and r/w-pointers
   logic [W_DATA-1:0] 	fifo_data_q [N_ENTRIES-1:0];
   logic [W_DATA-1:0]   fifo_data_d [N_ENTRIES-1:0];
   logic [W_FIFO-1:0]	r_pnt_d, r_pnt_q, w_pnt_d, w_pnt_q;
   // overflow logic
   logic                ovflw_d, ovflw_q, ovflw_pre_d, ovflw_pre_q;
   logic 		set_ovflw, clr_ovflw, set_ovflw_pre, clr_ovflw_pre;
   // mini write-FSM encoding
   enum logic {IDLE, DELAY} WRITE_SP, WRITE_SN;

   // output assignments
   assign data_o       = fifo_data_q[r_pnt_q];
   assign ovflw_o      = ovflw_q;

   always_comb begin
      if ( w_pnt_q == r_pnt_q && ovflw_pre_q == 1'b1 )
	fill_level_o = N_ENTRIES;
      else
	fill_level_o = (w_pnt_q - r_pnt_q) % N_ENTRIES;
   end
     
   // read process
   always_comb begin
      r_pnt_d 	    = r_pnt_q;
      clr_ovflw_pre = 1'b0;
      clr_ovflw     = 1'b0;

      if ( read_req_i ) begin
	 if ( (r_pnt_q != w_pnt_q) || (r_pnt_q == w_pnt_q && ovflw_pre_q) ) begin
	    if ( r_pnt_q == N_ENTRIES-1 )
	      r_pnt_d = 'b0;
	    else
	      r_pnt_d = r_pnt_q + 1;
	 end
	 clr_ovflw     = 1'b1;
	 if ( ~set_ovflw && ~ovflw_q ) // only clear prewarning if no ovflw-situation is about to happen or already happend
	   clr_ovflw_pre = 1'b1;
      end
   end // always_comb

   // write process
   always_comb begin
      WRITE_SN 	    = WRITE_SP;
      fifo_data_d   = fifo_data_q;
      w_pnt_d  	    = w_pnt_q;
      set_ovflw_pre = 1'b0;
      set_ovflw	    = 1'b0;

      case(WRITE_SP)
	IDLE: begin
	   if ( data_valid_i ) begin
	      if ( clr_ovflw || ~(w_pnt_q == r_pnt_q && ovflw_pre_q == 1'b1) ) begin
		 fifo_data_d[w_pnt_q] = data_i;
		 if ( w_pnt_q == N_ENTRIES-1 )
		   w_pnt_d = 'b0;
		 else
		   w_pnt_d = w_pnt_q + 1;
		 if ( w_pnt_d == r_pnt_q )
		   set_ovflw_pre = 1'b1;
		 WRITE_SN = DELAY;
	      end
	      else begin
		 set_ovflw = 1'b1;
	      end
	   end
	end
	DELAY: begin
	   if ( ~data_valid_i )
	     WRITE_SN = IDLE;
	end
      endcase
   end

   // some logic for managing the overflows
   always_comb begin
      if ( clr_ovflw_pre )
	ovflw_pre_d = 1'b0;
      else if ( set_ovflw_pre )
	ovflw_pre_d = 1'b1;
      else
	ovflw_pre_d = ovflw_pre_q;

      if ( clr_ovflw )
	ovflw_d = 1'b0;
      else if ( set_ovflw )
	ovflw_d = 1'b1;
      else
	ovflw_d = ovflw_q;
   end	


   // register setup
   always_ff @(posedge clk, negedge rst_n) begin
      if( rst_n == 1'b0 ) begin
	 r_pnt_q     <= 'b0;	// init pointers at same position
	 w_pnt_q     <= 'b0;
	 ovflw_q     <= 1'b0;	// no overflow on init!
	 ovflw_pre_q <= 1'b0;
	 WRITE_SP    <= IDLE;
      end
      else begin
	 fifo_data_q <= fifo_data_d;
	 r_pnt_q     <= r_pnt_d;
	 w_pnt_q     <= w_pnt_d;
	 ovflw_pre_q <= ovflw_pre_d;
	 ovflw_q     <= ovflw_d;
	 WRITE_SP    <= WRITE_SN;
      end
   end

endmodule // fifo_adc
