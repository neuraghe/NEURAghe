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


module hwce_wmem_xbar 
#(
    parameter N_MASTERS       = 12, //32. from 12 to 31 are bound to 0
    parameter N_SLAVES        = 16, //32
    parameter BANK_SIZE       = 1024, 

    //FRONT END PARAMS
    parameter ADDR_WIDTH      = 32,
    parameter DATA_WIDTH      = 32,
    parameter BE_WIDTH        = DATA_WIDTH/8

    
)
(
    input  logic           clk,
    input  logic           rst_n,
    
    
    XBAR_TCDM_BUS_64BIT.Slave    dma_port [N_MASTERS-1:0],
    XBAR_TCDM_BUS_64BIT.Master   mem_bus  [N_SLAVES-1:0]
 );
 
 
 
 
logic [N_MASTERS-1:0]                         data_req_i;            // Data request
logic [N_MASTERS-1:0][ADDR_WIDTH-1:0]         data_add_i;            // Data request Address
logic [N_MASTERS-1:0]                         data_wen_i;            // Data request type : 0--> Store; 1 --> Load
logic [N_MASTERS-1:0][DATA_WIDTH-1:0]         data_wdata_i;          // Data request Write data
logic [N_MASTERS-1:0][BE_WIDTH-1:0]           data_be_i;             // Data request Byte enable
    
logic [N_MASTERS-1:0]                         data_gnt_o;            // Grant Incoming Request
logic [N_MASTERS-1:0]                         data_r_valid_o;        // Data Response Valid (For LOAD/STORE commands)
logic [N_MASTERS-1:0][DATA_WIDTH-1:0]         data_r_rdata_o;        // Data Response DATA (For LOAD commands)
 
 
 
logic [N_SLAVES-1:0]                      data_req_SRAM_o;       // Data request
logic [N_SLAVES-1:0][ADDR_WIDTH-1:0]      data_add_SRAM_o;       // Data request Address
logic [N_SLAVES-1:0]                      data_wen_SRAM_o;       // Data request type : 0--> Store; 1 --> Load
logic [N_SLAVES-1:0][DATA_WIDTH-1:0]      data_wdata_SRAM_o;     // Data request Wrire data
logic [N_SLAVES-1:0][BE_WIDTH-1:0]        data_be_SRAM_o;        // Data request Byte enable 
   
logic [N_SLAVES-1:0][DATA_WIDTH-1:0]      data_r_rdata_SRAM_i;   // Data Response DATA (For LOAD commands)
 
 
 
genvar m, n;
    
    
    
    
    
// ---------------- MASTER SIDE  --------------------------
generate     
  for (n=0;n<N_MASTERS;n++) begin
    assign data_req_i   [n] = dma_port[n].req;           // Data request
    assign data_add_i   [n] = dma_port[n].add;           // Data request Address
    assign data_wen_i   [n] = dma_port[n].wen;          // Data request type : 0--> Store= 1 --> Load
    assign data_wdata_i [n] = dma_port[n].wdata;        // Data request Write data
    assign data_be_i    [n] = dma_port[n].be;            // Data request Byte enable
    
    assign dma_port[n].gnt     = data_gnt_o[n];            // Grant Incoming Request
    assign dma_port[n].r_valid = data_r_valid_o[n];        // Data Response Valid (For LOAD/STORE commands)
    assign dma_port[n].r_rdata = data_r_rdata_o[n];        // Data Response DATA (For LOAD commands)
  end
    
    
    // ---------------- SLAVE_SIDE -------------------------- 
  for (m=0;m<N_SLAVES;m++) begin    
    assign mem_bus[m].req   = data_req_SRAM_o   [m];     // Data request
    assign mem_bus[m].add   = {3'b000,data_add_SRAM_o   [m][31:$clog2(DATA_WIDTH/8)]};      // Data request Address
    assign mem_bus[m].wen   = data_wen_SRAM_o   [m];     // Data request type : 0--> Store= 1 --> Load
    assign mem_bus[m].wdata = data_wdata_SRAM_o [m];   // Data request Wrire data
    assign mem_bus[m].be    = data_be_SRAM_o    [m];       // Data request Byte enable 
    
    assign data_r_rdata_SRAM_i[m] = mem_bus[m].r_rdata;   // Data Response DATA (For LOAD commands)      

end
        
  endgenerate
  
  

localparam S_M = N_SLAVES/N_MASTERS;

    generate
    
    for(n=0; n<N_MASTERS; n++) begin : master_req_gen
      for (m=(0 + n*S_M); m < (S_M + n*S_M); m++) begin : slave_req_gen       
         
         
         logic req_int;
         
         xbar_req_gen
          #(
            .N_SLAVE    ( N_SLAVES            ),
            .ADDR_WIDTH ( 32                  ),
            .LSB_ADDR   ( $clog2(BANK_SIZE*8*4)),
            .SLAVE_NUM  ( m                    )
          )
          xbar_req_gen_i
          (
            .data_add_i ( data_add_i     [n] ),
            .en         ( data_req_i     [n] ),
            .req_out    ( req_int            )
          );
      
      
         assign data_req_SRAM_o     [m] = req_int;  
         assign data_add_SRAM_o     [m] = data_add_i  [n]; 
         assign data_wen_SRAM_o     [m] = data_wen_i  [n];      
         assign data_wdata_SRAM_o   [m] = data_wdata_i[n];
         assign data_be_SRAM_o      [m] = data_be_i   [n];        
      
         
         
         
      end
    end
endgenerate
  
    logic [N_MASTERS-1:0]                                    data_valid;
    
    always_ff @(posedge clk) begin
      if (rst_n==1'b0) 
        data_valid <= {N_MASTERS{1'b0}};    
      else 
        data_valid <= data_req_i;  
    end

    
generate
    
    for (n=0;n<N_MASTERS;n++)
    begin
        
      assign data_gnt_o     [n]= 1'b1;//data_req_i     [n];       
      assign data_r_valid_o [n]= data_valid [n];        
      assign data_r_rdata_o [n]= 32'hDEADBEEF;      
        
       
    end
  
  
endgenerate


endmodule
