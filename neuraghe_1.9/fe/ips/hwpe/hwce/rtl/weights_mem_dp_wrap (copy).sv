
`define XILINX_BRAM_BANK_INSTANCE \
tcdm_bank_i \
( \
  .clka  ( clk_a_i ), \
  .rsta  ( rsta  ), \
  .ena   ( ena   ), \
  .wea   ( wea   ), \
  .addra ( addra ), \
  .dina  ( wdataa ), \
  .douta ( rdataa ), \
  .clkb  ( clk_b_i ), \
  .enb   ( enb   ), \
  .web   ( web   ), \
  .addrb ( addrb ), \
  .dinb  ( wdatab ), \
  .doutb ( rdatab )  \
)
`include "/home/nur/nuraghe/fpga/ips/xilinx_tcdm_bank_8192x32/ip/xilinx_tcdm_bank_8192x32_funcsim.v"
//`include "/home/nur/nuraghe/fpga/ips/xilinx_tcdm_bank_256x32/ip/sim/xilinx_tcdm_bank_256x32.v"
//`include "/home/nur/nuraghe/fpga/ips/xilinx_tcdm_bank_256x32/ip/blk_mem_gen_v8_2/simulation/blk_mem_gen_v8_2.v"
module weights_mem_dp_wrap
#(
  parameter BANK_SIZE = 256,   //- -> OVERRIDE
  parameter NB_BANKS  = 2,     // --> OVERRIDE  
  parameter NB_DMA_PORTS  = 2     // --> OVERRIDE
)
(
  input  logic               clk_a_i,
  input  logic               clk_b_i,
  input  logic               rst_ni,

  XBAR_TCDM_BUS.Slave    wl_port [NB_BANKS-1:0],
  XBAR_TCDM_BUS.Slave    dma_port   [NB_DMA_PORTS-1:0]
);

  
  
   hwce_wmem_xbar
    #(
      .N_MASTERS        ( NB_DMA_PORTS  ),
      .N_SLAVES         ( NB_BANKS                   ),

      //FRONT END PARAMS
      .ADDR_WIDTH      ( ADDR_WIDTH                      ),
      .DATA_WIDTH      ( DATA_WIDTH                      ),
      .BE_WIDTH        ( BE_WIDTH                        ),
      .ADDR_SRAM_WIDTH ( ADDR_SRAM_WIDTH                 )
    )
    hwce_wmem_xbar_i
    ( 

      .clk                 (  clk_fast_i                  ),
      .rst_n               (  rst_ni                 ),
    
      // ---------------- MASTER SIDE  --------------------------
      .data_req_i          (  s_coreb_tcdm_bus_req     [N_MASTERS - 1:0]  ),
      .data_add_i          (  s_coreb_tcdm_bus_add     [N_MASTERS - 1:0]  ),
      .data_wen_i          (  s_coreb_tcdm_bus_wen     [N_MASTERS - 1:0]  ),
      .data_wdata_i        (  s_coreb_tcdm_bus_wdata   [N_MASTERS - 1:0]  ),
      .data_be_i           (  s_coreb_tcdm_bus_be      [N_MASTERS - 1:0]  ),
      .data_gnt_o          (  s_coreb_tcdm_bus_gnt     [N_MASTERS - 1:0]  ),  
      .data_r_valid_o      (  s_coreb_tcdm_bus_r_valid [N_MASTERS - 1:0]  ),
      .data_r_rdata_o      (  s_coreb_tcdm_bus_r_rdata [N_MASTERS - 1:0]  ), 

      // ---------------- MEM_SIDE -------------------------- 

      .data_req_SRAM_o     (  s_tcdm_bus_sramb_req    ),
      .data_add_SRAM_o     (  s_tcdm_bus_sramb_add    ),
      .data_wen_SRAM_o     (  s_tcdm_bus_sramb_wen    ),
      .data_wdata_SRAM_o   (  s_tcdm_bus_sramb_wdata  ),
      .data_be_SRAM_o      (  s_tcdm_bus_sramb_be     ),
      .data_r_rdata_SRAM_i (  s_tcdm_bus_sramb_rdata  )
    );
  
  
  
  
  

                         
  genvar i;
  generate
    for(i=0; i<NB_BANKS; i++) begin : banks_gen
        logic                         rsta;
        logic                         ena;
        logic [31:0]                  wdataa;
        logic [$clog2(BANK_SIZE)-1:0] addra;
        logic  [3:0]                  wea;
        logic [31:0]                  rdataa;
        
        
        // logic                         rstb; // there is not a reset signal for the b port
        logic                         enb;
        logic [31:0]                  wdatab;
        logic [$clog2(BANK_SIZE)-1:0] addrb;
        logic  [3:0]                  web;
        logic [31:0]                  rdatab;



        assign rsta                = ~rst_ni;
       assign ena                 = dma_port[i].req;
        assign wdataa              = dma_port[i].wdata;
        assign addra               = dma_port[i].add[$clog2(BANK_SIZE)-1:0];
        assign wea                 = {4{dma_port[i].req}} & {4{~dma_port[i].wen}} & dma_port[i].be;
        assign dma_port[i].r_rdata = rdataa;
        
        assign dma_port[i].gnt   = dma_port[i].req;
      always_ff @(posedge clk_a_i)
        begin
          if(rst_ni == 1'b0) 
            dma_port[i].r_valid <= 1'b0;
          
          else 
            dma_port[i].r_valid <= dma_port[i].req;
            
        end
           
        
        assign enb                   = wl_port[i].req;
        assign wdatab                = wl_port[i].wdata;
        assign addrb                 = wl_port[i].add[$clog2(BANK_SIZE)-1:0];
        assign web                   = {4{wl_port[i].req}} & {4{~wl_port[i].wen}} & wl_port[i].be;
        assign wl_port[i].r_rdata = rdatab;

        assign wl_port[i].gnt        = wl_port[i].req;              
       
        always_ff @(posedge clk_b_i)
        begin
          if(rst_ni == 1'b0) 
            wl_port[i].r_valid <= 1'b0;
          
          else 
            wl_port[i].r_valid <= wl_port[i].req;
            
        end
        
     
        

        case(BANK_SIZE)
            128: 
            begin : bank_128_gen
              xilinx_tcdm_bank_128x32 `XILINX_BRAM_BANK_INSTANCE;
            end

            256: 
            begin : bank_256_gen
              xilinx_tcdm_bank_256x32 `XILINX_BRAM_BANK_INSTANCE;
            end
            
            512:
             begin : bank_512_gen
              xilinx_tcdm_bank_512x32 `XILINX_BRAM_BANK_INSTANCE;
            end
            
            1024: 
            begin : bank_1024_gen
              xilinx_tcdm_bank_1024x32 `XILINX_BRAM_BANK_INSTANCE;
            end
            
            2048:
            begin : bank_2048_gen
              xilinx_tcdm_bank_2048x32 `XILINX_BRAM_BANK_INSTANCE;
            end
            
            4096:
            begin : bank_4096_gen
              xilinx_tcdm_bank_4096x32 `XILINX_BRAM_BANK_INSTANCE;
            end
            
            8192:
            begin : bank_8192_gen
              xilinx_tcdm_bank_8192x32 `XILINX_BRAM_BANK_INSTANCE;
            end

            default 
            begin : error_gen
            end
        endcase // BANK_SIZE
        
        
        
  end // for Loop --> 0 to NB_BANKS-1

  endgenerate   

endmodule

