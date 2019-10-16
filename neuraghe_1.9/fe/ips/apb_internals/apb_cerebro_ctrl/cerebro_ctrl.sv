////////////////////////////////////////////////////////////////////////////////
// Company:        IIS @ ETHZ - Federal Institute of Technology Zurich        //
//                                                                            //
// Engineer:       Florian Glaser, glaserf@ethz.ch                            //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    20/10/2014                                                 //
// Design Name:    Multi-functional platform based on a SAR ADC               //
// Module Name:    apb_cerebro_ctrl.sv                                        //
// Project Name:   VivoSoC                                                    //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Top-level block to control all analog IPs                  //
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

module apb_cerebro_ctrl
(
 // clock and reset
 input  logic        clk,               // clock for APB, logic
 input  logic        cerebro_clk_i,     // clock from cerebro, for confBus, potentially slower than clk
 input  logic        rst_n,

 // APB interface
 input  logic                    apb_clk_i,          // APB bus clock
 input  logic                    apb_sel_i,          // APB chip select
 input  logic                    apb_en_i,           // APB transfer enable
 input  logic                    apb_write_i,        // APB read/write select
 output logic                    apb_ready_o,        // APB slave ready
 output logic                    apb_slverr_o,       // APB slave error
 input  logic [`W_APB_ADDR-1:0]  apb_address_i,      // APB address
 input  logic [`W_APB_DATA-1:0]  apb_wdata_i,        // APB write data in
 output logic [`W_APB_DATA-1:0]  apb_rdata_o,        // APB read data out

 output logic                    sar_int_o,          // muxed interrupt line of the SAR ADC to PULP (edge triggered)

 // analog IP configuration interface
 output logic [`NUM_ANA_IPS-1:0] block_en_o,         // chip select for analog IPs
 output logic [`NUM_ANA_CHS-1:0] channel_en_o,       // chip select for analog channels
 output logic [`W_CONF_DATA-1:0] confBus_data_o,     // data of config bus
 output logic [`W_CONF_OFFS-1:0] confBus_offset_o,   // register offset of config bus

 input  logic [`W_SAR_DATA-1:0]  sar_conv_data_i,    // sampled data from SAR ADC
 input  logic                    sar_data_valid_i    // data valid signal from SAR ADC
 
 );

   // APB Slave FSM encoding
   enum   logic [1:0] {IDLE, WAIT_EN, DECODE, WAIT_READY}  APB_SLV_SP, APB_SLV_SN;

   // internal control/handshake lines
   logic [1:0] block_ready;
   logic [1:0] block_data_valid;
   logic       block_select;
   logic       confBus_broadcast;
   logic       store_apb_addr, store_apb_wdata, store_apb_rdata;

   // internal data lines
   logic [`W_APB_ADDR-1:0]  apb_address_q, apb_address_d;
   logic [`W_APB_DATA-1:0]  apb_wdata_q, apb_wdata_d;
   logic [`W_APB_DATA-1:0]  apb_rdata_q, apb_rdata_d;

   // mappings
   assign apb_slverr_o  = 1'b0;
   assign apb_address_d = apb_address_i;
   assign apb_wdata_d   = apb_wdata_i;
   assign apb_rdata_o   = apb_rdata_q;
   // 31 is the internal IP address, then check for broadcast offset
   assign confBus_broadcast = ( apb_address_q[`W_APB_ADDR-1:`W_CONF_OFFS+2] == 6'd31 && apb_address_q[`W_CONF_OFFS+1:2] == `BRDCST_OFFS );
   // compute block_select, 1 means data get directed to confBus Master
   assign block_select  = ( apb_address_q[`W_APB_ADDR-1:`W_CONF_OFFS+2] >  6'd31        || 
			    apb_address_q[`W_APB_ADDR-1:`W_CONF_OFFS+2] <  `NUM_ANA_IPS ||
			    confBus_broadcast == 1'b1 );

   // APB Slave FSM
   always_comb begin
      block_data_valid  = 2'b0;
      store_apb_addr    = 1'b0;
      store_apb_wdata   = 1'b0;
      store_apb_rdata   = 1'b0;
      apb_ready_o       = 1'b0;
      
      APB_SLV_SN = APB_SLV_SP;
      
      case(APB_SLV_SP)
	IDLE: begin
	   if( apb_sel_i ) APB_SLV_SN = WAIT_EN; 
	end
	WAIT_EN: begin
	   if( apb_en_i ) begin
	      if( apb_write_i ) store_apb_wdata = 1'b1;
	      store_apb_addr = 1'b1;
	      APB_SLV_SN     = DECODE;
	   end
	end
	DECODE: begin
	   block_data_valid[block_select] = 1'b1;
	   if( block_ready[block_select] == 1'b1 ) begin
	      if( ~apb_write_i ) store_apb_rdata = 1'b1;
	      APB_SLV_SN = WAIT_READY;
	   end
	end
	WAIT_READY: begin
	   if( block_select )
	     block_data_valid[block_select] = 1'b1;
	   if( ~block_select || ( block_select && block_ready[block_select] == 1'b0 ) ) begin
	      apb_ready_o = 1'b1;
	      APB_SLV_SN  = IDLE;
	   end
	end
      endcase // case (APB_SLV_SP)
   end 

   confBus_Master confBus_Master_i 
     (
      .clk(cerebro_clk_i),
      .rst_n(rst_n),
      .conf_address_i(apb_address_q),
      .conf_data_i(apb_wdata_q),
      .conf_write_i(apb_write_i),
      .conf_broadcast_i(confBus_broadcast),
      .conf_data_valid(block_data_valid[1]),
      .conf_block_ready(block_ready[1]),
      .block_en_o(block_en_o),
      .channel_en_o(channel_en_o),
      .confBus_data_o(confBus_data_o),
      .confBus_offset_o(confBus_offset_o)
      );

   adc_ctrl   
     #( .W_ADC_DATA(`W_SAR_DATA),
	.W_ADC_RAWDATA(`W_SAR_RAWDATA),
	.W_ADC_FIFO(`W_SAR_FIFO) )
   sar_ctrl_i
     (
      .clk(clk),
      .rst_n(rst_n),
      .apb_address_i(apb_address_q),
      .apb_write_i(apb_write_i),
      .apb_data_i(apb_wdata_q),
      .apb_data_o(apb_rdata_d),
      .apb_data_valid_i(block_data_valid[0]),
      .block_ready_o(block_ready[0]),
      .adc_data_valid_i(sar_data_valid_i),
      .adc_data_i(sar_conv_data_i),
      .adc_int_out_o(sar_int_o)
      );
   
   // register setup
   always_ff @(posedge clk , negedge rst_n) begin
      if ( rst_n == 1'b0 ) begin
         APB_SLV_SP     <= IDLE;
      end
      else begin
         APB_SLV_SP     <= APB_SLV_SN;
	 if ( store_apb_addr )
	   apb_address_q  <= apb_address_d;
	 if ( store_apb_wdata )
	   apb_wdata_q  <= apb_wdata_d;
	 if ( store_apb_rdata )
	   apb_rdata_q  <= apb_rdata_d;
      end
   end

   
endmodule // cerebro_ctrl
