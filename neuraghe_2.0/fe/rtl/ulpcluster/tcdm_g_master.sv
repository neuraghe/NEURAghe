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
    parameter SIZE            = 1,
    parameter NPX             = 4  
    
)
(
    
    input  logic [SIZE-1:0][NPX-1:0]                  data_req_slave,            // Data request
    input  logic [SIZE-1:0][NPX-1:0][ADDR_WIDTH-1:0]  data_add_slave,            // Data request Address
    input  logic [SIZE-1:0][NPX-1:0]                  data_wen_slave,            // Data request type : 0--> Store, 1 --> Load
    input  logic [SIZE-1:0][NPX-1:0][DATA_WIDTH-1:0]  data_wdata_slave,            // Data request Write data
    input  logic [SIZE-1:0][NPX-1:0][BE_WIDTH-1:0]    data_be_slave,            // Data request Byte enable
    
    output logic [SIZE-1:0][NPX-1:0]                  data_gnt_slave,              // Grant Incoming Request
    output logic [SIZE-1:0][NPX-1:0]                  data_r_valid_slave,            // Data Response Valid (For LOAD/STORE commands)
    output logic [SIZE-1:0][NPX-1:0][DATA_WIDTH-1:0]  data_r_rdata_slave,       // Data Response DATA (For LOAD commands)
    
    
    output logic [NPX-1:0]                         data_req_master,            // Data request
    output logic [NPX-1:0][ADDR_WIDTH-1:0]         data_add_master,            // Data request Address
    output logic [NPX-1:0]                         data_wen_master,            // Data request type : 0--> Store, 1 --> Load
    output logic [NPX-1:0][SIZE*DATA_WIDTH-1:0]       data_wdata_master,            // Data request Write data
    output logic [NPX-1:0][SIZE*BE_WIDTH-1:0]         data_be_master,            // Data request Byte enable
    
    input  logic [NPX-1:0]                         data_gnt_master,              // Grant Incoming Request
    input  logic [NPX-1:0]                         data_r_valid_master,            // Data Response Valid (For LOAD/STORE commands)
    input  logic [NPX-1:0][SIZE*DATA_WIDTH-1:0]       data_r_rdata_master       // Data Response DATA (For LOAD commands)
);

 genvar i,j;
    generate
      for (i=0;i<SIZE;i++) begin
        for(j=0;j<NPX;j++) begin
          assign data_r_rdata_slave [i][j]                                   = data_r_rdata_master [j][(i+1)*DATA_WIDTH-1 : i*DATA_WIDTH];
          assign data_r_valid_slave [i][j]                                   = data_r_valid_master[j];
          assign data_gnt_slave     [i][j]                                   = data_gnt_master[j];
          assign data_wdata_master  [j][(i+1)*DATA_WIDTH-1 : i*DATA_WIDTH]   = data_wdata_slave    [i][j];
          assign data_be_master     [j][(i+1)*BE_WIDTH-1   : i*BE_WIDTH]     = data_be_slave       [i][j];     
        end
      end
    endgenerate
        
     for(j=0;j<NPX;j++) begin   
        assign data_req_master[j] = data_req_slave [0][j];
        assign data_add_master[j] = data_add_slave [0][j];
        assign data_wen_master[j] = data_wen_slave [0][j];
     end

endmodule
