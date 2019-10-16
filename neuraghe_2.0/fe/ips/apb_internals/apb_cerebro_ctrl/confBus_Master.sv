////////////////////////////////////////////////////////////////////////////////
// Company:        IIS @ ETHZ - Federal Institute of Technology Zurich        //
//                                                                            //
// Engineer:       Florian Glaser, glaserf@ethz.ch                            //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    28/10/2014                                                 //
// Design Name:    Multi-functional platform based on a SAR ADC               //
// Module Name:    confBus_Master.sv                                          //
// Project Name:   VivoSoC                                                    //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Master Unit for the VivoSoc Configuration Bus              //
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


module confBus_Master
(
 // clock and reset
 input  logic 			 clk,
 input  logic 			 rst_n,

 // Data input
 input  logic [`W_APB_ADDR-1:0]  conf_address_i,   // address of register to be written
 input  logic [`W_APB_DATA-1:0]  conf_data_i,      // register data
 input  logic                    conf_write_i,     // R/W signal
 input  logic                    conf_broadcast_i, // when 1, either all Chs and IPs get activated or deactivated
 input  logic 			 conf_data_valid,  // signal for APB interface to flag new data 	
 output logic 			 conf_block_ready, // flag that block is ready to receive new data

 // analog IP configuration interface
 output logic [`NUM_ANA_IPS-1:0] block_en_o,       // chip select for analog IPs
 output logic [`NUM_ANA_CHS-1:0] channel_en_o,     // chip select for analog channels
 output logic [`W_CONF_DATA-1:0] confBus_data_o,   // data of config bus
 output logic [`W_CONF_OFFS-1:0] confBus_offset_o  // register offset of config bus
 
 );

   // confBus FSM encoding
   enum 			 logic [1:0] {IDLE, CYC1, CYC2, CYC3}  CONF_FSM_SP, CONF_FSM_SN;

   // internal control lines
   logic 			 store_enable; 			 
   
   // internal data lines
   logic [`W_APB_ADDR-1:0] 	 conf_address_q, conf_address_d;
   logic [`W_CONF_DATA-1:0] 	 conf_data_q, conf_data_d;
   logic [`W_CONF_OFFS-1:0]	 offset_q, offset_d;
   logic                         write_q, write_d;
   logic  			 conf_broadcast_q, conf_broadcast_d;
   logic [`NUM_ANA_IPS-1:0] 	 block_en_q, block_en_d;
   logic [`NUM_ANA_CHS-1:0] 	 channel_en_q, channel_en_d;

   // mappings
   assign confBus_data_o   = conf_data_q;
   assign confBus_offset_o = offset_q;
   assign block_en_o       = block_en_q;
   assign channel_en_o     = channel_en_q;

   // combinatorial calculation of enables
   generate
      genvar I;
      for ( I=0; I<`NUM_ANA_IPS; I=I+1 ) begin
	 assign block_en_d[I]   = ( CONF_FSM_SP == CYC2 && 
				    ( conf_address_q[`W_APB_ADDR-1:`W_CONF_OFFS+2] == I         || conf_broadcast_q == 1'b1 ) );
      end
      for ( I=0; I<`NUM_ANA_CHS; I=I+1 ) begin
	 assign channel_en_d[I] = ( CONF_FSM_SP == CYC2 && 
				    ( conf_address_q[`W_APB_ADDR-1:`W_CONF_OFFS+2] == I + 6'd32 || conf_broadcast_q == 1'b1 ) );
      end
   endgenerate
		   
   // confBus Master FSM
   always_comb begin
      conf_block_ready = 1'b0;

      conf_address_d   = conf_address_q;
      conf_data_d      = conf_data_q;
      conf_broadcast_d = conf_broadcast_q;
      write_d          = write_q;
      offset_d         = offset_q;
      store_enable     = 1'b0;
      
      CONF_FSM_SN = CONF_FSM_SP;
      
      case(CONF_FSM_SP)
	IDLE: begin
	   if ( conf_data_valid ) begin
	      conf_block_ready = 1'b1;
	      conf_address_d   = conf_address_i;
	      conf_data_d      = conf_data_i[`W_CONF_DATA-1:0];
	      conf_broadcast_d = conf_broadcast_i;
	      write_d          = conf_write_i;
	      CONF_FSM_SN      = CYC1;
	   end
	end
	CYC1: begin
	   conf_block_ready = 1'b1;
	   if ( conf_broadcast_q )
	     offset_d = 'b0;
	   else
	     offset_d = conf_address_q[`W_CONF_OFFS+1:2]; // lower 2 Bits always zero due to byte addressing
	   CONF_FSM_SN  = CYC2;
	end
	CYC2: begin
	   if ( write_q )  // only activate enables upon write access
	     store_enable = 1'b1;
	   CONF_FSM_SN  = CYC3;
	end
	CYC3: begin
	   store_enable = 1'b1;
	   CONF_FSM_SN  = IDLE;
	end
      endcase // case (CONF_FSM_SP)
   end
   
   // register setup
   always_ff @(posedge clk , negedge rst_n) begin
      if ( rst_n == 1'b0 ) begin
         CONF_FSM_SP     <= IDLE;
      end
      else begin
         CONF_FSM_SP     <= CONF_FSM_SN;

	 conf_address_q   <= conf_address_d;
	 conf_data_q      <= conf_data_d;
	 conf_broadcast_q <= conf_broadcast_d;
	 write_q          <= write_d;
	 offset_q         <= offset_d;
	 if ( store_enable ) begin
	    block_en_q   <= block_en_d;
	    channel_en_q <= channel_en_d;
	 end
      end
   end // always_ff @ (posedge clk , negedge rst_n)

endmodule // confBus_Master