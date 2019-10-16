////////////////////////////////////////////////////////////////////////////////
// Company:              DIEE - University of Cagliari                        //
//                                                                            //
// Engineer:       Gianfranco Deriu gian.deriu@gmail.com                      //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    12/05/2016                                                 // 
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


module tcdm_xbar 
#(
    parameter N_MASTERS       = 12, //32. from 12 to 31 are bound to 0
    parameter N_SLAVES        = 16, //32
    parameter G_SIZE = 1  ,
    
    //FRONT END PARAMS
    parameter ADDR_WIDTH      = 32,
    parameter DATA_WIDTH      = 32,
    parameter BE_WIDTH        = DATA_WIDTH/8,
    parameter LSB_ADDR        = 17,      // depends on bank_size

    //BACKEND parameters
  //  parameter ADDR_MEM_WIDTH  = 11,
    parameter ADDR_SRAM_WIDTH = 10,
  //  parameter ADDR_SCM_WIDTH  = 8,
    
    parameter N_MASTER_G      = N_MASTERS/G_SIZE, 
    parameter N_SLAVE_G       = N_SLAVES/G_SIZE,
    
    parameter ADDR_OFFSET     = 32'h00060000
    
    
)
(
    input  logic                                     clk,
    input  logic                                     rst_n,
    
    // ---------------- MASTER CH0+CH1 SIDE  --------------------------
    input  logic [N_MASTERS-1:0]                         data_req_i,            // Data request
    input  logic [N_MASTERS-1:0][ADDR_WIDTH-1:0]         data_add_i,            // Data request Address
    input  logic [N_MASTERS-1:0]                         data_wen_i,            // Data request type : 0--> Store, 1 --> Load
    input  logic [N_MASTERS-1:0][DATA_WIDTH-1:0]         data_wdata_i,          // Data request Write data
    input  logic [N_MASTERS-1:0][BE_WIDTH-1:0]           data_be_i,             // Data request Byte enable
    
    output logic [N_MASTERS-1:0]                         data_gnt_o,            // Grant Incoming Request
    output logic [N_MASTERS-1:0]                         data_r_valid_o,        // Data Response Valid (For LOAD/STORE commands)
    output logic [N_MASTERS-1:0][DATA_WIDTH-1:0]         data_r_rdata_o,        // Data Response DATA (For LOAD commands)

    // ---------------- MM_SIDE -------------------------- 

    output  logic [N_SLAVES-1:0]                      data_req_SRAM_o,       // Data request
    output  logic [N_SLAVES-1:0][ADDR_SRAM_WIDTH-1:0] data_add_SRAM_o,       // Data request Address
    output  logic [N_SLAVES-1:0]                      data_wen_SRAM_o,       // Data request type : 0--> Store, 1 --> Load
    output  logic [N_SLAVES-1:0][DATA_WIDTH-1:0]      data_wdata_SRAM_o,     // Data request Wrire data
    output  logic [N_SLAVES-1:0][BE_WIDTH-1:0]        data_be_SRAM_o,        // Data request Byte enable 
    
    input   logic [N_SLAVES-1:0][DATA_WIDTH-1:0]      data_r_rdata_SRAM_i   // Data Response DATA (For LOAD commands)      

);
    
    
    localparam MSB_ADDR = LSB_ADDR + $clog2(N_SLAVE_G) - 1; 
    localparam WORD_BITS = $clog2(DATA_WIDTH/8);

    logic [N_MASTER_G -1:0][$clog2(N_SLAVE_G) - 1 : 0]        sel_slave;
    logic [N_SLAVE_G  -1:0][$clog2(N_MASTER_G)- 1 : 0]        sel_master;
    logic [N_SLAVE_G  -1:0]                                   en_out;
  
    logic [N_MASTER_G-1:0]                                    data_valid;
  
  
  
    logic [N_MASTER_G-1:0]                                    data_req_int;           
    logic [N_MASTER_G-1:0][ADDR_WIDTH-1:0]                    data_add_int;    
    logic [N_MASTER_G-1:0]                                    data_wen_int;    
    logic [N_MASTER_G-1:0][G_SIZE*DATA_WIDTH-1:0]                  data_wdata_int;   
    logic [N_MASTER_G-1:0][G_SIZE*BE_WIDTH-1:0]                    data_be_int;       
    
    logic [N_MASTER_G-1:0]                                    data_gnt_int;      
    logic [N_MASTER_G-1:0]                                    data_r_valid_int;  
    logic [N_MASTER_G-1:0][G_SIZE*DATA_WIDTH-1:0]                  data_r_rdata_int;  


    logic [N_SLAVE_G-1:0]                                    data_req_SRAM_int;  
    logic [N_SLAVE_G-1:0][ADDR_SRAM_WIDTH-1:0]               data_add_SRAM_int;         
    logic [N_SLAVE_G-1:0]                                    data_wen_SRAM_int;       
    logic [N_SLAVE_G-1:0][G_SIZE*DATA_WIDTH-1:0]                  data_wdata_SRAM_int;     
    logic [N_SLAVE_G-1:0][G_SIZE*BE_WIDTH-1:0]                    data_be_SRAM_int;      
    
    logic [N_SLAVE_G-1:0][G_SIZE*DATA_WIDTH-1:0]                  data_r_rdata_SRAM_int;    
  
  
  
  
    

    genvar i, j, k, l, m, n;

    generate
      if (G_SIZE>1)
      begin 
        for (m=0;m<N_SLAVE_G;m++) begin : slave_groups // 8 groups
      
          tcdm_g_slave
          #(
            .ADDR_WIDTH      (ADDR_WIDTH),
            .DATA_WIDTH      (DATA_WIDTH),
            .ADDR_SRAM_WIDTH (ADDR_SRAM_WIDTH),
            .SIZE(G_SIZE)
          )
          tcdm_g_slave_i
          (
            .data_req_SRAM_master     ( data_req_SRAM_o     [G_SIZE*(m+1)-1: G_SIZE*m] ),         
            .data_add_SRAM_master     ( data_add_SRAM_o     [G_SIZE*(m+1)-1: G_SIZE*m] ), 
            .data_wen_SRAM_master     ( data_wen_SRAM_o     [G_SIZE*(m+1)-1: G_SIZE*m] ),      
            .data_wdata_SRAM_master   ( data_wdata_SRAM_o   [G_SIZE*(m+1)-1: G_SIZE*m] ),      
            .data_be_SRAM_master      ( data_be_SRAM_o      [G_SIZE*(m+1)-1: G_SIZE*m] ),        
    
            .data_r_rdata_SRAM_master ( data_r_rdata_SRAM_i [G_SIZE*(m+1)-1: G_SIZE*m] ),   
    
    
            .data_req_SRAM_slave      ( data_req_SRAM_int     [m] ),         
            .data_add_SRAM_slave      ( data_add_SRAM_int     [m] ),   
            .data_wen_SRAM_slave      ( data_wen_SRAM_int     [m] ),     
            .data_wdata_SRAM_slave    ( data_wdata_SRAM_int   [m] ),   
            .data_be_SRAM_slave       ( data_be_SRAM_int      [m] ),        
    
            .data_r_rdata_SRAM_slave  ( data_r_rdata_SRAM_int [m] )
          );
        end       
      end
      else
      begin
        assign data_req_SRAM_o       = data_req_SRAM_int;
        assign data_add_SRAM_o       = data_add_SRAM_int;
        assign data_wen_SRAM_o       = data_wen_SRAM_int;
        assign data_wdata_SRAM_o     = data_wdata_SRAM_int;
        assign data_be_SRAM_o        = data_be_SRAM_int;
        assign data_r_rdata_SRAM_int = data_r_rdata_SRAM_i;
      end

endgenerate

generate
  if (G_SIZE>1)
  begin 
    for (n=0;n<N_MASTER_G;n++) begin : master_group // 8 groups
       
       tcdm_g_master
      #(
        .ADDR_WIDTH      (ADDR_WIDTH),
        .DATA_WIDTH      (DATA_WIDTH),
        .SIZE(G_SIZE)
      )
      tcdm_g_master_i
      (    
        .data_req_slave      ( data_req_i     [G_SIZE*(n+1)-1: G_SIZE*n] ),          
        .data_add_slave      ( data_add_i     [G_SIZE*(n+1)-1: G_SIZE*n] ),          
        .data_wen_slave      ( data_wen_i     [G_SIZE*(n+1)-1: G_SIZE*n] ),          
        .data_wdata_slave    ( data_wdata_i   [G_SIZE*(n+1)-1: G_SIZE*n] ),        
        .data_be_slave       ( data_be_i      [G_SIZE*(n+1)-1: G_SIZE*n] ),         
        
        .data_gnt_slave      ( data_gnt_o     [G_SIZE*(n+1)-1: G_SIZE*n] ),        
        .data_r_valid_slave  ( data_r_valid_o [G_SIZE*(n+1)-1: G_SIZE*n] ),         
        .data_r_rdata_slave  ( data_r_rdata_o [G_SIZE*(n+1)-1: G_SIZE*n] ),      
        
        
        .data_req_master     ( data_req_int   [n] ),          
        .data_add_master     ( data_add_int   [n] ),        
        .data_wen_master     ( data_wen_int   [n] ),        
        .data_wdata_master   ( data_wdata_int [n] ),        
        .data_be_master      ( data_be_int    [n] ),         
        
        .data_gnt_master     ( data_gnt_int   [n] ),      
        .data_r_valid_master ( data_r_valid_int [n] ),
        .data_r_rdata_master ( data_r_rdata_int [n] )
      
      );
       
    end
  end
  else
  begin
    assign data_req_int   = data_req_i;
    assign data_add_int   = data_add_i;
    assign data_wen_int   = data_wen_i;
    assign data_wdata_int = data_wdata_i;
    assign data_be_int    = data_be_i;
    assign data_gnt_o     = data_gnt_int;
    assign data_r_valid_o = data_r_valid_int;
    assign data_r_rdata_o = data_r_rdata_int;
  end
  
  
endgenerate

generate

  
  
   //           ██████╗ ███████╗ ██████╗ 
   //           ██╔══██╗██╔════╝██╔═══██╗
   //           ██████╔╝█████╗  ██║   ██║
   //           ██╔══██╗██╔══╝  ██║▄▄ ██║
   //           ██║  ██║███████╗╚██████╔╝
   //           ╚═╝  ╚═╝╚══════╝ ╚══▀▀═╝ 
   // TCDM SIDE

    for (i=0; i<N_SLAVE_G; i++) begin : REQ_mux // 8 req muxs
      assign data_req_SRAM_int   [i] = data_req_int   [sel_master[i]] && en_out[i];
      assign data_add_SRAM_int   [i] = data_add_int   [sel_master[i]][ADDR_SRAM_WIDTH-1 + WORD_BITS:WORD_BITS];
      assign data_wen_SRAM_int   [i] = data_wen_int   [sel_master[i]];
      assign data_wdata_SRAM_int [i] = data_wdata_int [sel_master[i]];
      assign data_be_SRAM_int    [i] = data_be_int    [sel_master[i]];
      
      
      xbar_master_sel
      #(
        .NUM_INPUT  ( N_MASTER_G    ),
        .ADDR_WIDTH ( ADDR_WIDTH    ),
        .LSB_ADDR   ( LSB_ADDR      ),
        .MSB_ADDR   ( MSB_ADDR      ),
        .SLAVE_NUM  ( i             ),
        .ADDR_OFFSET( ADDR_OFFSET             )
      )
      xbar_master_sel_i
      (
        .data_add_i ( data_add_int  ),
        .en         ( data_req_int  ),
        .sel        ( sel_master[i] ),
        .en_out     ( en_out    [i] )
      );
    
    end
 
endgenerate




always_ff @(posedge clk) begin
  if (rst_n==1'b0) 
    data_valid <= {N_MASTER_G{1'b0}};    
  else 
    data_valid <= data_req_int;  
end


generate   
    
   //           ██████╗ ███████╗███████╗██████╗ 
   //           ██╔══██╗██╔════╝██╔════╝██╔══██╗
   //           ██████╔╝█████╗  ███████╗██████╔╝
   //           ██╔══██╗██╔══╝  ╚════██║██╔═══╝ 
   //           ██║  ██║███████╗███████║██║     
   //           ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     
   // HWCE SIDE                           
    
    
    
    for (j=0; j<N_MASTER_G; j++) begin : RESP_MUX // 8 resp muxs
      assign data_gnt_int     [j] = 1'b1; //data_req_int[j]; //1'b1;
      assign data_r_valid_int [j] = data_valid  [j];
      assign data_r_rdata_int [j] = data_r_rdata_SRAM_int [sel_slave[j]];
      
      
      always_ff @(posedge clk) begin
        if (data_req_int[j]==1'b1)
          sel_slave [j] <= data_add_int[j][MSB_ADDR:LSB_ADDR] - ADDR_OFFSET[MSB_ADDR:LSB_ADDR];
        else 
          sel_slave [j] <= 0;
      end
      
    end
    


endgenerate

/*
generate

    for (l=12; l<16;l++) begin : unused_master_ports
      
      assign data_gnt_o     [l] = 1'b0;
      assign data_r_valid_o [l] = 1'b0;
      assign data_r_rdata_o [l] = 0;
      
      
    end



  endgenerate

*/
endmodule
