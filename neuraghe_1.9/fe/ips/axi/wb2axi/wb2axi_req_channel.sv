
`include "wb2axi_parameters.sv"

module wb2axi_req_channel
  #(
    // PARAMETERS
    parameter CORE_ID        = 0,
    parameter WB_ADDR_WIDTH  = 32,
    parameter WB_DATA_WIDTH  = 64,
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_ID_WIDTH   = 3,
    // LOCAL PARAMETERS --> DO NOT OVERRIDE
    parameter AXI_STRB_WIDTH = AXI_DATA_WIDTH/8 // DO NOT OVERRIDE
    )
   (
    input  logic                      clk_i,
    input  logic                      rst_ni,
    // PERIPHERAL INTERCONNECT SLAVE
    //***************************************
    //REQUEST CHANNEL
    input  logic 		      wb_slave_cyc_i,
    input  logic 		      wb_slave_stb_i,
    input  logic 		      wb_slave_we_i,
    input  logic [2:0] 	              wb_slave_cti_i,
    input  logic [1:0] 	              wb_slave_bte_i,
    input  logic [7:0] 	              wb_slave_sel_i,
    input  logic [WB_ADDR_WIDTH-1:0]  wb_slave_adr_i,
    input  logic [WB_DATA_WIDTH-1:0]  wb_slave_dat_i,
    
    // AXI4 MASTER
    //***************************************
    // WRITE ADDRESS CHANNEL
    output  logic                     axi_master_aw_valid_o,
    output logic [AXI_ADDR_WIDTH-1:0] axi_master_aw_addr_o,
    output logic [2:0]                axi_master_aw_prot_o,
    output logic [3:0]                axi_master_aw_region_o,
    output logic [7:0]                axi_master_aw_len_o,
    output logic [2:0]                axi_master_aw_size_o,
    output logic [1:0]                axi_master_aw_burst_o,
    output logic                      axi_master_aw_lock_o,
    output logic [3:0]                axi_master_aw_cache_o,
    output logic [3:0]                axi_master_aw_qos_o,
    output logic [AXI_ID_WIDTH-1:0]   axi_master_aw_id_o,
    output logic [AXI_USER_WIDTH-1:0] axi_master_aw_user_o,
    input  logic                      axi_master_aw_ready_i,
    
    // READ ADDRESS CHANNEL
    output logic                      axi_master_ar_valid_o,
    output logic [AXI_ADDR_WIDTH-1:0] axi_master_ar_addr_o,
    output logic [2:0]                axi_master_ar_prot_o,
    output logic [3:0]                axi_master_ar_region_o,
    output logic [7:0]                axi_master_ar_len_o,
    output logic [2:0]                axi_master_ar_size_o,
    output logic [1:0]                axi_master_ar_burst_o,
    output logic                      axi_master_ar_lock_o,
    output logic [3:0]                axi_master_ar_cache_o,
    output logic [3:0]                axi_master_ar_qos_o,
    output logic [AXI_ID_WIDTH-1:0]   axi_master_ar_id_o,
    output logic [AXI_USER_WIDTH-1:0] axi_master_ar_user_o,
    input  logic                      axi_master_ar_ready_i,
    
    // WRITE DATA CHANNEL
    output logic                      axi_master_w_valid_o,
    output logic [AXI_DATA_WIDTH-1:0] axi_master_w_data_o,
    output logic [AXI_STRB_WIDTH-1:0] axi_master_w_strb_o,
    output logic [AXI_USER_WIDTH-1:0] axi_master_w_user_o,
    output logic                      axi_master_w_last_o,
    input  logic                      axi_master_w_ready_i,
    
    input  logic                      trans_r_valid_i
    );
   
   integer 			      i;
   
   // FSM STATES SIGNALS
   enum 			       `ifdef SYNTHESIS logic [1:0] `endif { TRANS_IDLE, TRANS_PENDING } CS, NS;
   logic 			       s_trans_r_valid;
   
   always_ff @(posedge clk_i, negedge  rst_ni)
     begin
	if(rst_ni == 1'b0)
	  CS <= TRANS_IDLE;
	else
	  CS <= NS;
     end
   
   // AXI REQUEST GENERATION
   always_comb
     begin
	
	axi_master_ar_valid_o = 1'b0;
	NS                    = TRANS_IDLE;
	
	case(CS)
	  
	  TRANS_IDLE:
	    begin
	       if (wb_slave_stb_i == 1'b1 &&      // REQUEST FROM WHISHBONE BUS
		   axi_master_ar_ready_i == 1'b1) // AXI READ ADDRESS CHANNEL AVAILABLE
		 begin 
		    axi_master_ar_valid_o = 1'b1;
		    NS = TRANS_PENDING;
		 end
	       else
		 begin
		    axi_master_ar_valid_o = 1'b0;
		    NS = TRANS_IDLE;
		 end
	    end
	  
	  TRANS_PENDING:
	    begin
	       if (s_trans_r_valid == 1'b1)
		 begin
		    NS = TRANS_IDLE;
		 end
	       else
		 begin
		    NS = TRANS_PENDING;
		 end
	    end
	  
	  default:
	    begin
	       NS = TRANS_IDLE;
	    end
	  
	endcase
     end // always_comb begin
   
   always_ff @(posedge clk_i, negedge  rst_ni)
     begin
	if(rst_ni == 1'b0)
	  s_trans_r_valid <= 1'b0;
	else
	  s_trans_r_valid <= trans_r_valid_i;
     end
   
   // AXI ADDRESS GENERATION
   // this address is cacheline aligned for bursts and word aligned for single words
   assign axi_master_ar_addr_o = wb_slave_adr_i;
   
   // AXI ID GENERATION - CORE ID
   assign axi_master_ar_id_o = CORE_ID;
   
   // bits 1:0 :
   // 000 : 1 byte operation
   // 001 : 2 bytes operation
   // 010 : 4 bytes operation
   // 100 : 16 bytes operation
   always_comb
     begin : AXI_OPC_MUX
	if ( (wb_slave_sel_i == 8'b11110000) | (wb_slave_sel_i == 8'b00001111)      // read 1 word only (4 bytes each cycle)
		  && (wb_slave_cti_i == 3'b000) )
	  begin
	     axi_master_ar_size_o = 3'b010;
	     axi_master_ar_len_o  = 4'b0000;
	  end
	else
	  begin
	     if ( (wb_slave_sel_i == 8'b11111111)                                // read 4 words (8 bytes each cycle)
       		  && (wb_slave_cti_i == 3'b010) )                                // cti 010 = incrementing burst cycle
	       begin
		  axi_master_ar_size_o = 3'b011;
	     axi_master_ar_len_o  = 4'b0001;
	       end
	     else
	       begin
		  axi_master_ar_size_o = 3'b000;
		  axi_master_ar_len_o  = 4'b0000;
	       end
	  end
     end
   
   // no write operations supported
   assign axi_master_ar_burst_o = 2'b01;
   
   // UNUSED SIGNALS
   assign axi_master_aw_valid_o  = '0;
   assign axi_master_aw_addr_o   = '0;
   assign axi_master_aw_id_o     = '0;
   assign axi_master_aw_size_o   = '0;
   assign axi_master_aw_len_o    = '0;
   assign axi_master_aw_burst_o  = '0;
   assign axi_master_aw_prot_o   = '0;
   assign axi_master_aw_region_o = '0;
   assign axi_master_aw_lock_o   = '0;
   assign axi_master_aw_cache_o  = '0;
   assign axi_master_aw_qos_o    = '0;
   assign axi_master_aw_user_o   = '0;
   
   assign axi_master_w_valid_o   = '0;
   assign axi_master_w_last_o    = '0;
   assign axi_master_w_user_o    = '0;
   assign axi_master_w_data_o    = '0;
   assign axi_master_w_strb_o    = '0;
   
   assign axi_master_ar_prot_o   = '0;
   assign axi_master_ar_region_o = '0;
   assign axi_master_ar_lock_o   = '0;
   assign axi_master_ar_cache_o  = '0;
   assign axi_master_ar_qos_o    = '0;
   assign axi_master_ar_user_o   = '0;
   
endmodule
