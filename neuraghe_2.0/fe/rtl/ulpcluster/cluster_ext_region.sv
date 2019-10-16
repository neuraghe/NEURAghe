module cluster_ext_region
  #(
    parameter NB_CORES=1,
    parameter NB_DMAS=1,
    parameter NB_MPERIPHS=1,
    parameter PER_ADDR_WIDTH = 32,
    parameter PER_ID_WIDTH   = 5,
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_ID_WIDTH   = 6
    )
   (
    
    input logic           clk_i,
    input logic           rst_ni,
    
    input logic [4:0]     cluster_id_i,
    
    // DMA
    XBAR_TCDM_BUS.Slave   core_dmactrl_bus[NB_CORES-1:0],
    XBAR_TCDM_BUS.Master  dma_xbar_bus[3:0],
    
    // PER2AXI
    XBAR_PERIPH_BUS.Slave xbar_speriph_ext_bus,
    
    // AXI2MEM
    XBAR_TCDM_BUS.Master  ext_xbar_bus[NB_DMAS-1:0],
    
    // CLUSTER BUS
    AXI_BUS.Slave         data_slave,
    
    AXI_BUS.Master        ext_mperiph_bus,
    
    AXI_BUS.Master        data_master
    
    );
   
   //********************************************************
   //***************** SIGNALS DECLARATION ******************
   //********************************************************
   
   // EXTBUS - EXT2MEM SIGNALS
   AXI_BUS
     #(
       .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
       .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
       .AXI_ID_WIDTH(AXI_ID_WIDTH),
       .AXI_USER_WIDTH(AXI_USER_WIDTH)
       )
   s_ext_tcdm_bus();
   
   // ENC2EXT - EXT BUS SIGNALS
   AXI_BUS
     #(
       .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
       .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
       .AXI_ID_WIDTH(AXI_ID_WIDTH),
       .AXI_USER_WIDTH(AXI_USER_WIDTH)
       )
   s_core_ext_bus();
   
   // DMA - EXT BUS SIGNALS
   AXI_BUS
     #(
       .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
       .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
       .AXI_ID_WIDTH(AXI_ID_WIDTH),
       .AXI_USER_WIDTH(AXI_USER_WIDTH)
       )
   s_dma_ext_bus();
   
   //********************************************************
   //************************* DMAC *************************
   //********************************************************
   
   dmac_wrap
     #(
       .NB_CORES(NB_CORES),
       .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
       .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
       .AXI_ID_WIDTH(AXI_ID_WIDTH),
       .AXI_USER_WIDTH(AXI_USER_WIDTH)
       )
   dmac_wrap_i
     (
      
      .clk_i(clk_i),
      .rst_ni(rst_ni),
      
      .ctrl_slave(core_dmactrl_bus),
      
      .tcdm_master(dma_xbar_bus),
      
      .ext_master(s_dma_ext_bus)
      
      );
   
   //********************************************************
   //************************ ENC2EXT ***********************
   //********************************************************
   
   per2axi_wrap
     #(
       .NB_CORES(4),
       .PER_ADDR_WIDTH(32),
       .PER_ID_WIDTH(NB_CORES+NB_MPERIPHS),
       .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
       .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
       .AXI_USER_WIDTH(AXI_USER_WIDTH),
       .AXI_ID_WIDTH(AXI_ID_WIDTH)
       )
   per2axi_wrap_i
     (
      
      .clk_i(clk_i),
      .rst_ni(rst_ni),
      
      .periph_slave(xbar_speriph_ext_bus),
      
      .axi_master(s_core_ext_bus)
      
      );
   
   //********************************************************
   //************************ EXT2MEM ***********************
   //********************************************************
   
   axi2mem_wrap
     #(
       .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
       .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
       .AXI_USER_WIDTH(AXI_USER_WIDTH),
       .AXI_ID_WIDTH(AXI_ID_WIDTH)
       )
   axi2mem_wrap_i
     (
      
      .clk_i(clk_i),
      .rst_ni(rst_ni),
      
      .axi_slave(s_ext_tcdm_bus),
      
      .tcdm_master(ext_xbar_bus)
      
      );
   
   //********************************************************
   //********************* CLUSTER BUS **********************
   //********************************************************
   
   cluster_bus_wrap
     #(
       .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
       .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
       .AXI_USER_WIDTH(AXI_USER_WIDTH),
       .AXI_ID_WIDTH(AXI_ID_WIDTH)
       )
   cluster_bus_wrap_i
     (
      
      .clk_i(clk_i),
      .rst_ni(rst_ni),
      
      .data_slave(s_core_ext_bus),
      
      .dma_slave(s_dma_ext_bus),
      
      .ext_slave(data_slave),
      
      .tcdm_master(s_ext_tcdm_bus),
      
      .periph_master(ext_mperiph_bus),
      
      .ext_master(data_master)
      
      );

endmodule // cluster_ext_region
