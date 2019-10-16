////////////////////////////////////////////////////////////////////////////////
// Company:              DIEE - University of Cagliari                        //
//                                                                            //
// Engineer:       Gianfranco Deriu gian.deriu@gmail.com                      //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    12/05/2014                                                 // 
// Module Name:    HWCE TCDM XBAR                                             //
// Project Name:   PULP                                                       //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    This Block creates a connection point-to-point between     //
//                 each TCDM bank and each HWCE port.                         //
//                 There is not requests arbitration.                         //
//                                                                            //
// Revision:                                                                  //
// v0.1 - File Created                                                        //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////


module tcdm_g_master 
#(
    //FRONT END PARAMS
    parameter ADDR_WIDTH      = 32,
    parameter DATA_WIDTH      = 32,
    parameter BE_WIDTH        = DATA_WIDTH/8,
    parameter SIZE = 1
    
)
(
    
    input  logic [SIZE-1:0]                  data_req_slave,            // Data request
    input  logic [SIZE-1:0][ADDR_WIDTH-1:0]  data_add_slave,            // Data request Address
    input  logic [SIZE-1:0]                  data_wen_slave,            // Data request type : 0--> Store, 1 --> Load
    input  logic [SIZE-1:0][DATA_WIDTH-1:0]  data_wdata_slave,            // Data request Write data
    input  logic [SIZE-1:0][BE_WIDTH-1:0]    data_be_slave,            // Data request Byte enable
    
    output logic [SIZE-1:0]                  data_gnt_slave,              // Grant Incoming Request
    output logic [SIZE-1:0]                  data_r_valid_slave,            // Data Response Valid (For LOAD/STORE commands)
    output logic [SIZE-1:0][DATA_WIDTH-1:0]  data_r_rdata_slave,       // Data Response DATA (For LOAD commands)
    
    
    output logic                          data_req_master,            // Data request
    output logic [ADDR_WIDTH-1:0]         data_add_master,            // Data request Address
    output logic                          data_wen_master,            // Data request type : 0--> Store, 1 --> Load
    output logic [SIZE*DATA_WIDTH-1:0]       data_wdata_master,            // Data request Write data
    output logic [SIZE*BE_WIDTH-1:0]         data_be_master,            // Data request Byte enable
    
    input  logic                          data_gnt_master,              // Grant Incoming Request
    input  logic                          data_r_valid_master,            // Data Response Valid (For LOAD/STORE commands)
    input  logic [SIZE*DATA_WIDTH-1:0]       data_r_rdata_master       // Data Response DATA (For LOAD commands)
);

 genvar i;
    generate
      for (i=0;i<SIZE;i++) begin
        assign data_r_rdata_slave [i]                                   = data_r_rdata_master [(i+1)*DATA_WIDTH-1 : i*DATA_WIDTH];
        assign data_r_valid_slave [i]                                   = data_r_valid_master;
        assign data_gnt_slave     [i]                                   = data_gnt_master;
        assign data_wdata_master  [(i+1)*DATA_WIDTH-1 : i*DATA_WIDTH]   = data_wdata_slave    [i];
        assign data_be_master     [(i+1)*BE_WIDTH-1   : i*BE_WIDTH]     = data_be_slave       [i];     
      
      end
    endgenerate
        
        
        assign data_req_master = data_req_slave [0];
        assign data_add_master = data_add_slave [0];
        assign data_wen_master = data_wen_slave [0];

endmodule
