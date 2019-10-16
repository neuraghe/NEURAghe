
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

//`include "/home/nur/neuraghe/fpga/ips/xilinx_tcdm_bank_1024x64/ip/xilinx_tcdm_bank_1024x64_funcsim.v"
//`include "/home/nur/neuraghe_2.0/neuraghe_1.9/fpga/ips/xilinx_tcdm_bank_2048x64/ip/xilinx_tcdm_bank_2048x64_sim_netlist.v"

module weights_mem_dp_wrap
#(
  parameter BANK_SIZE     = 256,   //- -> OVERRIDE
  parameter DATA_WIDTH    = 64,
  parameter BE_WIDTH      = DATA_WIDTH/8,
  parameter NB_BANKS      = 2,     // --> OVERRIDE  
  parameter NB_DMA_PORTS  = 1     // --> OVERRIDE
)
(
  input  logic              clk_a_i, //hwce clock
  input  logic              clk_b_i, //dma clock
  input  logic              rst_ni,

  XBAR_TCDM_BUS_64BIT.Slave wl_port  [NB_BANKS     - 1 :0],
  XBAR_TCDM_BUS_64BIT.Slave dma_port [NB_DMA_PORTS - 1 :0]   
);


  XBAR_TCDM_BUS_64BIT    mem_bus   [NB_BANKS-1:0]();
  
  
  
   hwce_wmem_xbar
    #(
      .N_MASTERS  ( NB_DMA_PORTS ),
      .N_SLAVES   ( NB_BANKS     ),
      .BANK_SIZE  ( BANK_SIZE    ),

      //FRONT END PARAMS
      .ADDR_WIDTH ( 32           ),
      .DATA_WIDTH ( DATA_WIDTH   )
    )
    hwce_wmem_xbar_i
    ( 

      .clk        ( clk_a_i      ),
      .rst_n      ( rst_ni       ),
    
      .dma_port   ( dma_port     ),
      .mem_bus    ( mem_bus      )
    );
  
  
  
  
  

                         
  genvar i;
  generate
    for(i=0; i<NB_BANKS; i++) begin : banks_gen
      
      // A port -> HWCE
      
      logic                         rsta;
      logic                         ena;
      logic [DATA_WIDTH-1:0]        wdataa;
      logic [$clog2(BANK_SIZE)-1:0] addra;
      logic [BE_WIDTH-1:0]          wea;
      logic [DATA_WIDTH-1:0]        rdataa;
      

      assign rsta               = ~rst_ni;
      assign ena                = mem_bus[i].req;
      assign wdataa             = mem_bus[i].wdata;
      assign addra              = mem_bus[i].add[$clog2(BANK_SIZE)-1:0];
      assign wea                = {BE_WIDTH{mem_bus[i].req}} & {BE_WIDTH{~mem_bus[i].wen}} & mem_bus[i].be;
      
      assign mem_bus[i].r_rdata = rdataa;      
      assign mem_bus[i].gnt     = mem_bus[i].req;
      
      always_ff @(posedge clk_a_i) // hwce
        begin
          if(rst_ni == 1'b0) 
            wl_port[i].r_valid <= 1'b0;        
          else 
            wl_port[i].r_valid <= wl_port[i].req;
          
        end    
      
      
      // B port -> DMA
      
      logic                         enb;
      logic [DATA_WIDTH-1:0]        wdatab;
      logic [$clog2(BANK_SIZE)-1:0] addrb;
      logic [BE_WIDTH -1:0]         web;
      logic [DATA_WIDTH-1:0]        rdatab;

      
      assign enb                = wl_port[i].req;
      assign wdatab             = wl_port[i].wdata;
      assign addrb              = wl_port[i].add[$clog2(BANK_SIZE)-1:0];
      assign web                = {BE_WIDTH{wl_port[i].req}} & {BE_WIDTH{~wl_port[i].wen}} & wl_port[i].be;
      
      assign wl_port[i].r_rdata = rdatab;
      assign wl_port[i].gnt     = wl_port[i].req;              
     
      
      always_ff @(posedge clk_b_i) // dma
      begin
        if(rst_ni == 1'b0) 
          mem_bus[i].r_valid <= 1'b0;          
        else 
          mem_bus[i].r_valid <= mem_bus[i].req;          
      end
      
      
   
      

      case(BANK_SIZE)
          16: 
          begin : bank_16_gen
            xilinx_tcdm_bank_16x32 `XILINX_BRAM_BANK_INSTANCE;
          end
          
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
            xilinx_tcdm_bank_1024x64 `XILINX_BRAM_BANK_INSTANCE;
          end
          
          /*2048:
          begin : bank_2048_gen
            xilinx_tcdm_bank_2048x32 `XILINX_BRAM_BANK_INSTANCE;
          end*/

	  2048:
          begin : bank_2048_gen
            xilinx_tcdm_bank_2048x64 `XILINX_BRAM_BANK_INSTANCE;
          end
          
          4096:
          begin : bank_4096_gen
            xilinx_tcdm_bank_4096x64 `XILINX_BRAM_BANK_INSTANCE;	//era 4096x32
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

