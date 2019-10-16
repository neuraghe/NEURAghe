////////////////////////////////////////////////////////////////////////////////
// Company:        IIS @ ETHZ - Federal Institute of Technology Zurich        //
//                                                                            //
// Engineer:       Florian Glaser, glaserf@ethz.ch                            //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    29/10/2014                                                 //
// Design Name:    Multi-functional platform based on a SAR ADC               //
// Module Name:    adc_ctrl.sv                                                //
// Project Name:   VivoSoC                                                    //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Block to read out an ADC and configure and control it      //
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


`include "defines_cerebro_ctrl.sv"

module adc_ctrl
#(parameter W_ADC_DATA = 32,
  parameter W_ADC_RAWDATA = 16,
  parameter W_ADC_FIFO = 8 )
(
    // clock and reset
    input  logic  clk,
    input  logic  rst_n,

    // data lines to APB slave
    input  logic [`W_APB_ADDR-1:0] apb_address_i,
    input  logic                   apb_write_i,
    input  logic [`W_APB_DATA-1:0] apb_data_i,
    output logic [`W_APB_DATA-1:0] apb_data_o,
    
    // handshake
    input  logic       	           apb_data_valid_i,
    output logic                   block_ready_o,
    
    // interface to adc
    input  logic 	           adc_data_valid_i,
    input  logic [W_ADC_DATA-1:0]  adc_data_i,
   
    output logic                   adc_int_out_o
    
 );

   // register signals
   logic [W_ADC_FIFO-1:0]    watermark_reg_d, watermark_reg_q;
   logic [W_ADC_RAWDATA-1:0] thresh_low_d, thresh_low_q;
   logic                     thresh_low_sc_d, thresh_low_sc_q;
   logic                     thresh_high_sc_d, thresh_high_sc_q;
   logic [W_ADC_RAWDATA-1:0] thresh_high_d, thresh_high_q;
   logic [2:0] 		     int_en_reg_d, int_en_reg_q;
   logic [2:0] 		     int_stat_reg_d, int_stat_reg_q; 

   // register control signals
   logic [2:0] 		     set_int, clr_int;

   // fifo signals
   logic [W_ADC_FIFO:0]      fifo_level;
   logic [1:0] 		     fifo_status;
   logic                     fifo_ovflw;
   logic [W_ADC_DATA-1:0]    fifo_odata;
   logic                     fifo_read_req;		     

   // assignment of FIFO status
   always_comb begin
      if ( fifo_ovflw )
	fifo_status = 2'b11;
      else if ( fifo_level == 'b0 )
	fifo_status = 2'b00;
      else
	fifo_status = 2'b01;
   end

   // interrupt unit
   always_comb begin
      set_int = 3'b0;
      // assignment of interrupt lines
      if ( int_en_reg_q[0] == 1'b1 && fifo_level > watermark_reg_q )
	set_int[0] = 1'b1;
      if ( int_en_reg_q[1] == 1'b1 && adc_data_valid_i == 1'b1 )
	set_int[1] = ( thresh_low_sc_q == 1'b1 ) ? 
		     $signed(adc_data_i[`W_SAR_RAWDATA-1:0]) < $signed(thresh_low_q) :
		     adc_data_i[`W_SAR_RAWDATA-1:0] < thresh_low_q;
      if ( int_en_reg_q[2] == 1'b1 && adc_data_valid_i == 1'b1 )
	set_int[2] = ( thresh_high_sc_q == 1'b1 ) ? 
		     $signed(adc_data_i[`W_SAR_RAWDATA-1:0]) > $signed(thresh_high_q) :
		     adc_data_i[`W_SAR_RAWDATA-1:0] > thresh_high_q;
   end // always_comb

   assign adc_int_out_o = ( set_int != 3'b0 );

   // set has priority over clear
   generate
      genvar I;
      for ( I=0; I<3; I=I+1 ) begin
	 always @(*) begin
	    int_stat_reg_d[I] = int_stat_reg_q[I];
	    if ( set_int[I] )
	      int_stat_reg_d[I] = 1'b1;
	    else if ( clr_int[I] )
	      int_stat_reg_d[I] = 1'b0;
	 end
      end
   endgenerate
   
   // register read/write logic
   always_comb begin
      // defaults
      watermark_reg_d   = watermark_reg_q;
      thresh_low_d	= thresh_low_q;
      thresh_low_sc_d   = thresh_low_sc_q;
      thresh_high_d	= thresh_high_q;
      thresh_high_sc_d  = thresh_high_sc_q;
      int_en_reg_d      = int_en_reg_q;  

      block_ready_o     = 1'b0;
      apb_data_o        = 'b0;

      clr_int           = 3'b0;
      fifo_read_req     = 1'b0;

      if ( apb_data_valid_i ) begin
	 block_ready_o = 1'b1;
	 if ( apb_write_i ) begin
	    // only write allowed bits
	    case ( apb_address_i[`W_CONF_OFFS+1:2] )
	      7'h00: watermark_reg_d = apb_data_i[W_ADC_FIFO-1:0];
	      7'h01: begin
		 thresh_low_d     = apb_data_i[W_ADC_RAWDATA-1:0];
		 thresh_low_sc_d  = apb_data_i[31];
	      end
	      7'h02: begin
		 thresh_high_d    = apb_data_i[W_ADC_RAWDATA-1:0];
		 thresh_high_sc_d = apb_data_i[31];
	      end
	      7'h03: int_en_reg_d = apb_data_i[2:0];
	    endcase
	 end
	 else begin
	    // mux correct out-data
	    case ( apb_address_i[`W_CONF_OFFS+1:2] )
	      7'h00: apb_data_o[W_ADC_FIFO-1:0] = watermark_reg_q;
	      7'h01: begin
		 apb_data_o[W_ADC_RAWDATA-1:0] = thresh_low_q;
		 apb_data_o[31]                = thresh_low_sc_q;
	      end
	      7'h02: begin
		 apb_data_o[W_ADC_RAWDATA-1:0] = thresh_high_q;
		 apb_data_o[31]                = thresh_high_sc_q;
	      end
	      7'h03: apb_data_o[2:0] = int_en_reg_q;
	      7'h04: begin
		 apb_data_o[2:0] = int_stat_reg_q;
		 clr_int = 3'b1;
	      end
	      7'h05: apb_data_o[1:0] = fifo_status;
	      7'h06: begin
		 apb_data_o    = fifo_odata;
		 fifo_read_req = 1'b1;
	      end
	    endcase
	 end
      end
	 
   end // always_comb

   fifo_adc #( .W_FIFO(W_ADC_FIFO),
	       .W_DATA(W_ADC_DATA) ) 
            fifo_adc_i (
	    .clk(clk),
	    .rst_n(rst_n),
            .data_valid_i(adc_data_valid_i),
            .data_i(adc_data_i),
	    .fill_level_o(fifo_level),
            .ovflw_o(fifo_ovflw),
	    .read_req_i(fifo_read_req),
	    .data_o(fifo_odata)
	    );

   // register setup
   always_ff @(posedge clk, negedge rst_n) begin
      if( rst_n == 1'b0 ) begin
	 int_en_reg_q   <= 3'b0;	// should be set to 0 in order not to activate any interrupts on reset
	 int_stat_reg_q <= 3'b0;
      end
      else begin
	 watermark_reg_q  <= watermark_reg_d;
	 thresh_low_q	  <= thresh_low_d;
	 thresh_low_sc_q  <= thresh_low_sc_d;
	 thresh_high_q	  <= thresh_high_d;
	 thresh_high_sc_q <= thresh_high_sc_d;
	 int_en_reg_q     <= int_en_reg_d;
	 int_stat_reg_q   <= int_stat_reg_d;
      end
   end


endmodule // adc_ctrl
