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


module tcdm_g_slave 
#(
    //FRONT END PARAMS
    parameter ADDR_WIDTH      = 32,
    parameter DATA_WIDTH      = 32,
    parameter BE_WIDTH        = DATA_WIDTH/8,
    
    parameter ADDR_SRAM_WIDTH = 10,
    parameter SIZE = 1
    
)
(

    output  logic [SIZE-1:0]                      data_req_SRAM_master,         // Data request
    output  logic [SIZE-1:0][ADDR_SRAM_WIDTH-1:0] data_add_SRAM_master,         // Data request Address
    output  logic [SIZE-1:0]                      data_wen_SRAM_master,        // Data request type : 0--> Store, 1 --> Load
    output  logic [SIZE-1:0][DATA_WIDTH-1:0]      data_wdata_SRAM_master,       // Data request Write data
    output  logic [SIZE-1:0][BE_WIDTH-1:0]        data_be_SRAM_master,          // Data request Byte enable 
    
    input   logic [SIZE-1:0][DATA_WIDTH-1:0]      data_r_rdata_SRAM_master,       // Data Response DATA (For LOAD commands)  
    
    
    input  logic                               data_req_SRAM_slave,         // Data request
    input  logic         [ADDR_SRAM_WIDTH-1:0] data_add_SRAM_slave,         // Data request Address
    input  logic                               data_wen_SRAM_slave,        // Data request type : 0--> Store, 1 --> Load
    input  logic         [SIZE*DATA_WIDTH-1:0]    data_wdata_SRAM_slave,       // Data request Write data
    input  logic         [SIZE*BE_WIDTH-1:0]      data_be_SRAM_slave,          // Data request Byte enable 
    
    output logic         [SIZE*DATA_WIDTH-1:0]    data_r_rdata_SRAM_slave       // Data Response DATA (For LOAD commands)    
);

    genvar i;
    generate
      for (i=0;i<SIZE;i++) begin
        assign data_r_rdata_SRAM_slave [(i+1)*DATA_WIDTH-1 : i*DATA_WIDTH] = data_r_rdata_SRAM_master[i];
        
        assign data_req_SRAM_master    [i]                                 = data_req_SRAM_slave;
        assign data_add_SRAM_master    [i]                                 = data_add_SRAM_slave;// + i*4096;
        assign data_wen_SRAM_master    [i]                                 = data_wen_SRAM_slave;
        assign data_wdata_SRAM_master  [i]                                 = data_wdata_SRAM_slave [(i+1)*DATA_WIDTH-1 : i*DATA_WIDTH];
        assign data_be_SRAM_master     [i]                                 = data_be_SRAM_slave    [(i+1)*BE_WIDTH-1   : i*BE_WIDTH];
      end
    endgenerate


endmodule
