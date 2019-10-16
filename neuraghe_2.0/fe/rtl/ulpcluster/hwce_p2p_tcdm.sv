////////////////////////////////////////////////////////////////////////////////
// Company:              DIEE - University of Cagliari                        //
//                                                                            //
// Engineer:       Gianfranco Deriu gian.deriu@gmail.com                      //
//                 Alessio Pani                                               //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    05/12/2017                                                 // 
// Module Name:    HWCE P2P XBAR                                              //
// Project Name:   NEURAGHE                                                   //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    This Block creates a connection between HWCE and TCDM.     //
//                 The first 8 banks of HWCE are connected into a XBAR,       //
//                 the last 12 banks are actually connected point-to-point    //
//                 to the first 12 banks in the TCDM.                         //
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

module hwce_p2p_tcdm

#(
    //FRONT END PARAMS
    parameter ADDR_WIDTH      = 32,
    parameter DATA_WIDTH      = 32,
    parameter BE_WIDTH        = DATA_WIDTH/8,
    parameter N_MASTERS_XBAR  = 8,
    parameter N_P2P   = 12,
    parameter N_SLAVES_XBAR   = 20,

    //BACKEND parameters
    parameter ADDR_SRAM_WIDTH = 10,
    parameter ADDR_SRAM_WIDTH_x = 10,
    
    parameter N_ROW = 2,
    parameter NPX   = 4
)
(
    input  logic                                                   clk,
    input  logic                                                   rst_n,
    
    // IN WRAPPER
    // IN HWCE P2P
    input  logic [N_P2P-1:0][NPX-1:0]                                       data_req_p2p_i,            // Data request
    input  logic [N_P2P-1:0][NPX-1:0][ADDR_WIDTH-1:0]                       data_add_p2p_i,            // Data request Address
    input  logic [N_P2P-1:0][NPX-1:0]                                       data_wen_p2p_i,            // Data request type : 0--> Store, 1 --> Load
    input  logic [N_P2P-1:0][NPX-1:0][DATA_WIDTH-1:0]                       data_wdata_p2p_i,          // Data request Write data
    input  logic [N_P2P-1:0][NPX-1:0][BE_WIDTH-1:0]                         data_be_p2p_i,             // Data request Byte enable
    output logic [N_P2P-1:0][NPX-1:0]                                       data_gnt_p2p_o,            // Grant Incoming Request
    output logic [N_P2P-1:0][NPX-1:0]                                       data_r_valid_p2p_o,        // Data Response Valid (For LOAD/STORE commands)
    output logic [N_P2P-1:0][NPX-1:0][DATA_WIDTH-1:0]                       data_r_rdata_p2p_o,        // Data Response DATA (For LOAD commands)
    
    // IN XBAR
    input  logic [N_MASTERS_XBAR-1:0][NPX-1:0]                              data_req_i,            // Data request
    input  logic [N_MASTERS_XBAR-1:0][NPX-1:0][ADDR_WIDTH-1:0]              data_add_i,            // Data request Address
    input  logic [N_MASTERS_XBAR-1:0][NPX-1:0]                              data_wen_i,            // Data request type : 0--> Store, 1 --> Load
    input  logic [N_MASTERS_XBAR-1:0][NPX-1:0][DATA_WIDTH-1:0]              data_wdata_i,          // Data request Write data
    input  logic [N_MASTERS_XBAR-1:0][NPX-1:0][BE_WIDTH-1:0]                data_be_i,             // Data request Byte enable
    output logic [N_MASTERS_XBAR-1:0][NPX-1:0]                              data_gnt_o,            // Grant Incoming Request
    output logic [N_MASTERS_XBAR-1:0][NPX-1:0]                              data_r_valid_o,        // Data Response Valid (For LOAD/STORE commands)
    output logic [N_MASTERS_XBAR-1:0][NPX-1:0][DATA_WIDTH-1:0]              data_r_rdata_o,        // Data Response DATA (For LOAD commands)
        
    // SLAVE WRAPPER
    // XBAR
    output  logic [N_SLAVES_XBAR-1:0][NPX-1:0]                         data_req_o,       // Data request
    output  logic [N_SLAVES_XBAR-1:0][NPX-1:0][ADDR_SRAM_WIDTH_x-1:0]    data_add_o,       // Data request Address
    output  logic [N_SLAVES_XBAR-1:0][NPX-1:0]                         data_wen_o,       // Data request type : 0--> Store, 1 --> Load
    output  logic [N_SLAVES_XBAR-1:0][NPX-1:0][DATA_WIDTH-1:0]         data_wdata_o,     // Data request Wrire data
    output  logic [N_SLAVES_XBAR-1:0][NPX-1:0][BE_WIDTH-1:0]           data_be_o,        // Data request Byte enable 
    input   logic [N_SLAVES_XBAR-1:0][NPX-1:0][DATA_WIDTH-1:0]         data_r_rdata_i,    // Data Response DATA (For LOAD commands)  
    
    // TCDM P2P 
    output  logic [N_P2P-1:0][NPX-1:0]                                   data_req_p2p_o,       // Data request
    output  logic [N_P2P-1:0][NPX-1:0][ADDR_SRAM_WIDTH_x-1:0]              data_add_p2p_o,       // Data request Address
    output  logic [N_P2P-1:0][NPX-1:0]                                   data_wen_p2p_o,       // Data request type : 0--> Store, 1 --> Load
    output  logic [N_P2P-1:0][NPX-1:0][DATA_WIDTH-1:0]                   data_wdata_p2p_o,     // Data request Wrire data
    output  logic [N_P2P-1:0][NPX-1:0][BE_WIDTH-1:0]                     data_be_p2p_o,        // Data request Byte enable 
    input   logic [N_P2P-1:0][NPX-1:0][DATA_WIDTH-1:0]                   data_r_rdata_p2p_i    // Data Response DATA (For LOAD commands)
 );

  localparam WORD_BITS = (DATA_WIDTH/8 <= 2) ? 1 : $clog2(DATA_WIDTH/8);

  localparam ROW_BYTE = $clog2(N_ROW*2);

  // XBAR Definition
    tcdm_hwce_xbar
    #(
      .N_MASTERS        (   N_MASTERS_XBAR   ),
      .N_SLAVES         (   N_SLAVES_XBAR     ),

      //FRONT END PARAMS
      .ADDR_WIDTH      ( ADDR_WIDTH                        ),
      .DATA_WIDTH      ( /*DATA_WIDTH*/ 16                 ),
      .ADDR_SRAM_WIDTH ( ADDR_SRAM_WIDTH_x                   ),
      .G_SIZE          ( N_ROW                             ),
      .LSB_ADDR        ( ADDR_SRAM_WIDTH + ROW_BYTE        ), // 17 = clog2(BANK_SIZE * 4 * N_ROW) = ADDR_SRAM_WIDTH + clog2(N_ROW*4)
      .ADDR_OFFSET     ( 32'h00000000                      ),
      .NPX             ( NPX                               )
    )
    hwce_xbar_i
    (
      // ---------------- MASTER CH0+CH1 SIDE  --------------------------
      .data_req_i          (  data_req_i        ), 
      .data_add_i          (  data_add_i        ), 
      .data_wen_i          (  data_wen_i        ), 
      .data_wdata_i        (  data_wdata_i      ), 
      .data_be_i           (  data_be_i         ),  
      .data_gnt_o          (  data_gnt_o        ),  
      .data_r_valid_o      (  data_r_valid_o    ),
      .data_r_rdata_o      (  data_r_rdata_o    ), 

      // ---------------- MM_SIDE -------------------------- 
      .data_req_SRAM_o     ( data_req_o     ),
      .data_add_SRAM_o     ( data_add_o     ),
      .data_wen_SRAM_o     ( data_wen_o     ),
      .data_wdata_SRAM_o   ( data_wdata_o   ),
      .data_be_SRAM_o      ( data_be_o      ),
      .data_r_rdata_SRAM_i ( data_r_rdata_i ), 

      .clk                 ( clk            ),
      .rst_n               ( rst_n          )
    );
    
    logic [N_P2P-1:0]   data_req_p2p_del;
    
    always_ff @(posedge clk) begin
      if (rst_n==1'b0) 
        data_req_p2p_del <= {N_P2P{1'b0}};    
      else 
        data_req_p2p_del <= data_req_p2p_i;  
    end
    // ASSIGN P2P: HWCE->TCDM
    genvar i,j;
    
    generate 
      for (i=0; i<N_P2P; i++)begin
        for (j=0; j<NPX; j++)begin
            assign data_req_p2p_o   [i][j] = data_req_p2p_i   [i][j];
            assign data_add_p2p_o   [i][j] = data_add_p2p_i   [i][j][ADDR_SRAM_WIDTH_x-1 + 1 : 1/*WORD_BITS:WORD_BITS*/];
            assign data_wen_p2p_o   [i][j] = data_wen_p2p_i   [i][j];         
            assign data_wdata_p2p_o [i][j] = data_wdata_p2p_i [i][j];
            assign data_be_p2p_o    [i][j] = data_be_p2p_i    [i][j];
            
            
            assign data_gnt_p2p_o     [i][j] = 1'b1;
            assign data_r_valid_p2p_o [i][j] = data_req_p2p_del   [i];
            assign data_r_rdata_p2p_o [i][j] = data_r_rdata_p2p_i [i][j];
         end   
        end
    endgenerate
    
endmodule 
