
module wb2axi_res_channel
  #(
    // PARAMETERS
    parameter WB_DATA_WIDTH  = 64,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_ID_WIDTH   = 3
    )
   (
    
    input  logic                      clk_i,
    input  logic                      rst_ni,
    
    // PERIPHERAL INTERCONNECT SLAVE
    //***************************************
    //RESPONSE CHANNEL
    output logic 		      wb_slave_ack_o,
    output logic 		      wb_slave_rty_o,
    output logic 		      wb_slave_err_o,
    output logic [WB_DATA_WIDTH-1:0]  wb_slave_dat_o,
    
    // AXI4 MASTER
    //***************************************
    // READ DATA CHANNEL
    input  logic                      axi_master_r_valid_i,
    input  logic [AXI_DATA_WIDTH-1:0] axi_master_r_data_i,
    input  logic [1:0]                axi_master_r_resp_i,
    input  logic                      axi_master_r_last_i,
    input  logic [AXI_ID_WIDTH-1:0]   axi_master_r_id_i,
    input  logic [AXI_USER_WIDTH-1:0] axi_master_r_user_i,
    output logic                      axi_master_r_ready_o,
    
    // WRITE RESPONSE CHANNEL
    input  logic                      axi_master_b_valid_i,
    input  logic [1:0]                axi_master_b_resp_i,
    input  logic [AXI_ID_WIDTH-1:0]   axi_master_b_id_i,
    input  logic [AXI_USER_WIDTH-1:0] axi_master_b_user_i,
    output logic                      axi_master_b_ready_o,

    output logic                      trans_r_valid_o
    
   );
   
   assign axi_master_r_ready_o = 1'b1;
   assign axi_master_b_ready_o = 1'b1;
   
   // wb_b3_ack_o equivalent to r_valid
   assign wb_slave_ack_o = axi_master_r_valid_i;
   
   // wb_b3_rty_o equivalent t
   assign wb_slave_rty_o = '0;
   
   // wb_b3_err_o equivalent to stbus_t3_r_opc_i
   assign wb_slave_err_o = '0;
   
   // wb_b3_dat_o equivalent to stbus_t3_r_data_i
   assign wb_slave_dat_o = axi_master_r_data_i;
   
   assign trans_r_valid_o = axi_master_r_ready_o && axi_master_r_valid_i && axi_master_r_last_i;
   
endmodule
