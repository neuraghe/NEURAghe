////////////////////////////////////////////////////////////////////////////////
// Company:        IIS @ ETHZ - Federal Institute of Technology Zurich        //
//                                                                            //
// Engineer:       Florian Glaser, glaserf@ethz.ch                            //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    24/11/2014                                                 //
// Design Name:    Multi-functional platform based on a SAR ADC               //
// Module Name:    sar_dummy.sv                                               //
// Project Name:   VivoSoC                                                    //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Module to emulate output behavior of the SAR for testing   //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
//                                                                            //
//                                                                            //
//            -->   NOT SYTHESIZABLE DUE TO URAND USAGE   <--                 //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps
`include "defines_cerebro_ctrl.sv"

module sar_dummy
(
 // clock and reset
 input  logic        ana_clk_i,
 input  logic        rst_n,

 // analog IP configuration interface
 input  logic                    block_en_i,
 input  logic [`W_CONF_DATA-1:0] confBus_data_i,     // data of config bus
 input  logic [`W_CONF_OFFS-1:0] confBus_offset_i,   // register offset of config bus

 output logic [`W_SAR_DATA-1:0]  sar_conv_data_o,    // sampled data from SAR ADC
 output logic                    sar_data_valid_o    // data valid signal from SAR ADC
 
 );


   // SAR FSM encoding
   enum   logic  {IDLE, APPLY}  SAR_SP, SAR_SN;

   logic  ana_del_clk;
   logic        dummy_en_q, dummy_en_d;
   logic  [7:0] sar_cnt_q, sar_cnt_d;

   // delay clock for post-layout simulation
   always
     ana_del_clk = #100ps ana_clk_i;
   
   
   // start data production only when enable has been received through config bus
   assign dummy_en_d = (block_en_i && confBus_offset_i == 'b0) ? confBus_data_i : dummy_en_q;

   // SAR FSM
   always_comb begin
      SAR_SN           = SAR_SP;
      sar_cnt_d        = sar_cnt_q;
      sar_conv_data_o  = 8'b0;
      sar_data_valid_o = 1'b0;
	
      case (SAR_SP)
	IDLE: begin
	   if (sar_cnt_q == 8'hFF)
	     SAR_SN = APPLY;
	   else
	     sar_cnt_d = sar_cnt_q + 1;
	end
	APPLY: begin
	   if (dummy_en_q) begin
     	      sar_conv_data_o  = $urandom_range(0,2**(`W_SAR_DATA)-1);
	      sar_data_valid_o = 1'b1; 
	   end
	   sar_cnt_d = 8'b0;
	   SAR_SN    = IDLE;
	end
      endcase
   end
  
   // register setup
   always_ff @(posedge ana_del_clk, negedge rst_n) begin
      if ( rst_n == 1'b0 ) begin
         SAR_SP     <= IDLE;
	 dummy_en_q <= 1'b0;
	 sar_cnt_q  <= 8'b0;
      end
      else begin
         SAR_SP     <= SAR_SN;
	 dummy_en_q <= dummy_en_d;
	 sar_cnt_q  <= sar_cnt_d;
      end
   end

   
endmodule // sar_dummy