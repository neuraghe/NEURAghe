
`include "ulpsoc_defines.sv"

module dmac_per_wrap
  #(
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_ID_WIDTH_CNTR   = 4,
    parameter AXI_ID_WIDTH_EXT = 6,
    parameter WEI_MEM_BANK_SIZE= 1024,
    
    parameter MEM_ADD_WIDTH = 13,
    
    parameter DATA_WIDTH     = 32,
    parameter ADDR_WIDTH     = 32,
    parameter BE_WIDTH       = DATA_WIDTH/8,
    parameter BUFFER_WIDTH   = 8,
    parameter DMA_REMAP      = 0,
    
    parameter TX_CH           = 2,
    parameter RX_CH           = 2,
    parameter WEI_MEM_CHAN    = 4,
    parameter WEI_BANKS_STRIDE = 1024
    )
   (
    
    input logic                      clk_dma_i,
    input logic                      clk_axi_i,
    input logic                      rst_ni,
        
    
    AXI_BUS.Slave                    ctrl_slave,
    
    XBAR_TCDM_BUS_64BIT.Master       mem_master[RX_CH-1:0],
    
    AXI_BUS.Master                   ext_master[1:0]
    
    );
   
   // CORE --> MCHAN CTRL INTERFACE BUS SIGNALS
   logic [DATA_WIDTH-1:0] s_ctrl_bus_wdata;
   logic [ADDR_WIDTH-1:0] s_ctrl_bus_add;
   logic  		            s_ctrl_bus_req;
   logic  	            	s_ctrl_bus_wen;
   logic [BE_WIDTH-1:0] 	s_ctrl_bus_be;
   logic  	            	s_ctrl_bus_gnt;
   logic [DATA_WIDTH-1:0] s_ctrl_bus_r_rdata;
   logic  	            	s_ctrl_bus_r_valid;
   
   // MCHAN MEM INIT --> MEM MEMORY BUS SIGNALS
   logic [2*WEI_MEM_CHAN-1:0][DATA_WIDTH-1:0] 	s_mem_bus_wdata;
   logic [2*WEI_MEM_CHAN-1:0][ADDR_WIDTH-1:0] 	s_mem_bus_add;
   logic [2*WEI_MEM_CHAN-1:0] 				          s_mem_bus_req;
   logic [2*WEI_MEM_CHAN-1:0] 				          s_mem_bus_wen;
   logic [2*WEI_MEM_CHAN-1:0][BE_WIDTH-1:0] 		s_mem_bus_be;
   logic [2*WEI_MEM_CHAN-1:0] 				          s_mem_bus_gnt;
   logic [2*WEI_MEM_CHAN-1:0][DATA_WIDTH-1:0] 	s_mem_bus_r_rdata;
   logic [2*WEI_MEM_CHAN-1:0] 				          s_mem_bus_r_valid;
   
   genvar 				i;
   
   
   XBAR_TCDM_BUS
      periph_bus();
   
   
   //********************************************************
   //************************ DMAC **************************
   //********************************************************
   /*
    
   assign s_ctrl_bus_add     = ctrl_slave.add;
   assign s_ctrl_bus_req     = ctrl_slave.req;
   assign s_ctrl_bus_wdata   = ctrl_slave.wdata;
   assign s_ctrl_bus_wen    = ctrl_slave.wen;
   assign s_ctrl_bus_be     = ctrl_slave.be;

   assign ctrl_slave.gnt     = s_ctrl_bus_gnt;
   assign ctrl_slave.r_opc   = '0;
   assign ctrl_slave.r_valid = s_ctrl_bus_r_valid;
   assign ctrl_slave.r_rdata = s_ctrl_bus_r_rdata;
	     
      */
   
   generate
      
    for (i=0; i<RX_CH; i++)
	    begin : mem_MASTER_BIND
         assign mem_master[i].add      = s_mem_bus_add    [i*(RX_CH+TX_CH)   + TX_CH];
         assign mem_master[i].req      = s_mem_bus_req    [i*(RX_CH+TX_CH)   + TX_CH];
         assign mem_master[i].wdata    ={s_mem_bus_wdata  [i*(RX_CH+TX_CH)+1 + TX_CH], s_mem_bus_wdata[i*(RX_CH+TX_CH) + TX_CH]};
         assign mem_master[i].wen      = s_mem_bus_wen    [i*(RX_CH+TX_CH)   + TX_CH];
         assign mem_master[i].be       ={s_mem_bus_be     [i*(RX_CH+TX_CH)+1 + TX_CH], s_mem_bus_be[i*(RX_CH+TX_CH) + TX_CH]};

         assign s_mem_bus_gnt    [i*(RX_CH+TX_CH)   + TX_CH]   = mem_master[i].gnt;
         assign s_mem_bus_gnt    [i*(RX_CH+TX_CH)+1 + TX_CH]   = mem_master[i].gnt;
         assign s_mem_bus_r_valid[i*(RX_CH+TX_CH)   + TX_CH]   = mem_master[i].r_valid;
         assign s_mem_bus_r_valid[i*(RX_CH+TX_CH)+1 + TX_CH]   = mem_master[i].r_valid;
         assign s_mem_bus_r_rdata[i*(RX_CH+TX_CH)   + TX_CH]   = mem_master[i].r_rdata;
         assign s_mem_bus_r_rdata[i*(RX_CH+TX_CH)+1 + TX_CH]   = mem_master[i].r_rdata;
	    end      
   endgenerate
    
   
   AXI_BUS
    #(
        .AXI_ADDR_WIDTH ( AXI_ADDR_WIDTH ),
        .AXI_DATA_WIDTH ( AXI_DATA_WIDTH ),
        .AXI_ID_WIDTH   ( AXI_ID_WIDTH_CNTR   ),
        .AXI_USER_WIDTH ( AXI_USER_WIDTH )
    )
    axi_master();
    
    AXI_BUS_ASYNC
    #(
        .AXI_ADDR_WIDTH ( AXI_ADDR_WIDTH ),
        .AXI_DATA_WIDTH ( AXI_DATA_WIDTH ),
        .AXI_ID_WIDTH   ( AXI_ID_WIDTH_CNTR   ),
        .AXI_USER_WIDTH ( AXI_USER_WIDTH ),
        .BUFFER_WIDTH   ( BUFFER_WIDTH   )
    )
    axi_async();
   
   axi_slice_dc_slave_wrap
   #( 
       .AXI_ADDR_WIDTH  ( AXI_ADDR_WIDTH         ),
       .AXI_DATA_WIDTH  ( AXI_DATA_WIDTH         ),
       .AXI_USER_WIDTH  ( AXI_USER_WIDTH         ),
       .AXI_ID_WIDTH    ( AXI_ID_WIDTH_CNTR           ),
       .BUFFER_WIDTH    ( BUFFER_WIDTH  )
   )
   slave_slice_i
   ( 
      .clk_i            ( clk_axi_i                  ),
      .rst_ni           ( rst_ni                ),
      .axi_slave        ( ctrl_slave          ),
      .axi_master_async ( axi_async            )
   );
   
   
   
   axi_slice_dc_master_wrap
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH_CNTR),
        .AXI_USER_WIDTH(AXI_USER_WIDTH),
        .BUFFER_WIDTH(BUFFER_WIDTH)
    )
    master_slice_i
    (
        .clk_i(clk_dma_i),
        .rst_ni(rst_ni),
        .axi_master(axi_master),
        .axi_slave_async(axi_async)
    );
   
   
   
   
   
   axi2per_wrap
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH_CNTR),
        .AXI_USER_WIDTH(AXI_USER_WIDTH)
    )
    axi2per_wrap_i
    (
        .clk_i(clk_dma_i),
        .rst_ni(rst_ni),

        .axi_slave(axi_master),

        .periph_master(periph_bus),

        .busy_o(  )
    );
   
   
      
    // *** DMA REMAP ***
   localparam SRAM_ADD_WIDTH = MEM_ADD_WIDTH - 1; //Whole TCDM address (SRAM+SCM) minus the bit of SCM
   
//   logic [3:0][ADDR_WIDTH-1:0] 		s_tcdm_bus_add_pre;
//   logic [3:0][ADDR_WIDTH-1:0] 		s_tcdm_bus_add_post;
//   
//   
//   generate
//     for (i=0; i<4; i++) begin
//       //assign s_tcdm_bus_add_post[i] = {s_tcdm_bus_add_pre[i][31:18], s_tcdm_bus_add_pre[i][5:4], s_tcdm_bus_add_pre[i][15:6], s_tcdm_bus_add_pre[i][17:16], s_tcdm_bus_add_pre[i][3:0]};
//       //assign s_tcdm_bus_add_post[i] = {s_tcdm_bus_add_pre[i][31:18], s_tcdm_bus_add_pre[i][15:4], s_tcdm_bus_add_pre[i][17:16], s_tcdm_bus_add_pre[i][3:0]};
//       
//       // 16 banks 4096 words
//       //assign s_tcdm_bus_add_post[i] = {s_tcdm_bus_add_pre[i][31:SRAM_ADD_WIDTH], s_tcdm_bus_add_pre[i][SRAM_ADD_WIDTH-3:4], s_tcdm_bus_add_pre[i][SRAM_ADD_WIDTH-1:SRAM_ADD_WIDTH-2], s_tcdm_bus_add_pre[i][3:0]};
//       
//       // 32 banks 4096 words || 8192 words
//       assign s_tcdm_bus_add_post[i] = {s_tcdm_bus_add_pre[i][31:SRAM_ADD_WIDTH], s_tcdm_bus_add_pre[i][SRAM_ADD_WIDTH-4:4], s_tcdm_bus_add_pre[i][SRAM_ADD_WIDTH-1:SRAM_ADD_WIDTH-3], s_tcdm_bus_add_pre[i][3:0]};
//         
//     end
//     if (DMA_REMAP==1)
//       assign s_mem_bus_add = s_tcdm_bus_add_post;
//     else
//       assign s_mem_bus_add = s_tcdm_bus_add_pre;
//   endgenerate
   
   
   logic [RX_CH-1:0]gnt_dummy;
   logic [RX_CH-1:0]r_valid_dummy;
   logic [RX_CH-1:0][31:0] r_data_dummy;   
   
   logic [DATA_WIDTH-1:0] wdata_to_dma0,  wdata_0;
   logic                  req_to_dma0,    req_0;          
   logic [ADDR_WIDTH-1:0] add_to_dma0,    add_0;           
   logic                  wen_to_dma0,    wen_0;           
   logic [BE_WIDTH-1:0]   be_to_dma0,     be_0;             

   logic                  gnt_from_dma0,      gnt_0;          
   logic                  r_valid_from_dma0,  r_valid_0;  
   logic [DATA_WIDTH-1:0] r_rdata_from_dma0,  r_rdata_0;  

   logic [DATA_WIDTH-1:0] wdata_to_dma1,  wdata_1;
   logic                  req_to_dma1,    req_1;          
   logic [ADDR_WIDTH-1:0] add_to_dma1,    add_1;           
   logic                  wen_to_dma1,    wen_1;           
   logic [BE_WIDTH-1:0]   be_to_dma1,     be_1;             

   logic                  gnt_from_dma1,       gnt_1;          
   logic                  r_valid_from_dma1,   r_valid_1;  
   logic [DATA_WIDTH-1:0] r_rdata_from_dma1,   r_rdata_1; 
   
   
//   uC_to_wei
//   #(
//     .DATA_WIDTH       ( DATA_WIDTH       ),
//     .ADDR_WIDTH       ( ADDR_WIDTH       ),
//     .BE_WIDTH         ( BE_WIDTH         ),
//     .WEI_BANKS_STRIDE ( WEI_BANKS_STRIDE )
//   )
//   uC_to_wei_i
//     (
//        .clk_i                     ( clk_dma_i        ),
//        .rst_ni                    ( rst_ni       ),
//        //input core
//        .wdata             (periph_bus.wdata   ),
//        .req               (periph_bus.req     ),
//        .add               (periph_bus.add     ),
//        .wen               (periph_bus.wen     ),
//        .be                (periph_bus.be      ),
//        //output core
//        .gnt               (periph_bus.gnt     ),
//        .r_valid           (periph_bus.r_valid ),
//        .r_rdata           (periph_bus.r_rdata ),
//        //output dma0
//        .wdata_to_dma0    (wdata_to_dma0),
//        .req_to_dma0      (req_to_dma0),
//        .add_to_dma0      (add_to_dma0  ),
//        .wen_to_dma0      (wen_to_dma0  ),
//        .be_to_dma0       (be_to_dma0  ),
//        //input dma0
//        .gnt_from_dma0     (gnt_from_dma0   ),
//        .r_valid_from_dma0 (r_valid_from_dma0  ),
//        .r_rdata_from_dma0 (r_rdata_from_dma0 ),
//        //output dma1
//        .wdata_to_dma1    (wdata_to_dma1 ),
//        .req_to_dma1      (req_to_dma1 ),
//        .add_to_dma1      (add_to_dma1 ),
//        .wen_to_dma1      (wen_to_dma1),
//        .be_to_dma1       (be_to_dma1 ),
//        //input dma1
//        .gnt_from_dma1     (gnt_from_dma1 ),
//        .r_valid_from_dma1 (r_valid_from_dma1 ),
//        .r_rdata_from_dma1 (r_rdata_from_dma1)
//     );

   wei_to_uC
   #(
     .DATA_WIDTH       ( DATA_WIDTH       ),
     .ADDR_WIDTH       ( ADDR_WIDTH       ),
     .BE_WIDTH         ( BE_WIDTH         ),
     .WEI_BANKS_STRIDE ( WEI_BANKS_STRIDE )
   )
   wei_to_uC_i
   (
        .clk_i             ( clk_dma_i    ),
        .rst_ni            ( rst_ni       ),
        
        //input core
        .wdata             ( periph_bus.wdata   ),
        .req               ( periph_bus.req     ),
        .add               ( periph_bus.add     ),
        .wen               ( periph_bus.wen     ),
        .be                ( periph_bus.be      ),
        //output core
        .gnt_to_uC         ( periph_bus.gnt     ),
        .r_valid_to_uC     ( periph_bus.r_valid ),
        .r_rdata_to_uC     ( periph_bus.r_rdata ),
        //output to dmas
        .wdata_to_dma0      ( wdata_0   ),
        .req_to_dma0        ( req_0     ),
        .add_to_dma0        ( add_0     ),
        .wen_to_dma0        ( wen_0     ),
        .be_to_dma0         ( be_0      ),
        //input from dma0
        .gnt_from_dma0     ( gnt_0     ),
        .r_valid_from_dma0 ( r_valid_0 ),
        .r_rdata_from_dma0 ( r_rdata_0 ),
        //output to dmas
        .wdata_to_dma1      ( wdata_1   ),
        .req_to_dma1        ( req_1     ),
        .add_to_dma1        ( add_1     ),
        .wen_to_dma1        ( wen_1     ),
        .be_to_dma1         ( be_1      ),
        //input from dma1
        .gnt_from_dma1     ( gnt_1     ),
        .r_valid_from_dma1 ( r_valid_1 ),
        .r_rdata_from_dma1 ( r_rdata_1 )
   );
   
   
   uC_to_wei
   #(
     .DATA_WIDTH       ( DATA_WIDTH       ),
     .ADDR_WIDTH       ( ADDR_WIDTH       ),
     .BE_WIDTH         ( BE_WIDTH         ),
     .WEI_BANKS_STRIDE ( 0 )
   )
   uC_to_wei_0_i
     (
        .clk_i             ( clk_dma_i        ),
        .rst_ni            ( rst_ni       ),
        //input core
        .wdata             (wdata_0   ),
        .req               (req_0     ),
        .add               (add_0     ),
        .wen               (wen_0     ),
        .be                (be_0      ),
        //output core
        .gnt_from_dma_o     (gnt_0     ),
        .r_valid_from_dma_o (r_valid_0 ),
        .r_rdata_from_dma_o (r_rdata_0 ),
        //output to dma
        .wdata_to_dma    (wdata_to_dma0),
        .req_to_dma      (req_to_dma0),
        .add_to_dma      (add_to_dma0  ),
        .wen_to_dma      (wen_to_dma0  ),
        .be_to_dma       (be_to_dma0  ),
        //input from dma
        .gnt_from_dma_i     (gnt_from_dma0   ),
        .r_valid_from_dma_i (r_valid_from_dma0  ),
        .r_rdata_from_dma_i (r_rdata_from_dma0 )
     );
     
     
   uC_to_wei
   #(
     .DATA_WIDTH       ( DATA_WIDTH       ),
     .ADDR_WIDTH       ( ADDR_WIDTH       ),
     .BE_WIDTH         ( BE_WIDTH         ),
     .WEI_BANKS_STRIDE ( WEI_BANKS_STRIDE )
   )
   uC_to_wei_1_i
     (
        .clk_i             ( clk_dma_i        ),
        .rst_ni            ( rst_ni       ),
        //input core
        .wdata             (wdata_1   ),
        .req               (req_1     ),
        .add               (add_1     ),
        .wen               (wen_1     ),
        .be                (be_1      ),
        //output core
        .gnt_from_dma_o     (gnt_1     ),
        .r_valid_from_dma_o (r_valid_1 ),
        .r_rdata_from_dma_o (r_rdata_1 ),
        //output to dma
        .wdata_to_dma    (wdata_to_dma1),
        .req_to_dma      (req_to_dma1),
        .add_to_dma      (add_to_dma1  ),
        .wen_to_dma      (wen_to_dma1  ),
        .be_to_dma       (be_to_dma1  ),
        //input from dma
        .gnt_from_dma_i     (gnt_from_dma1   ),
        .r_valid_from_dma_i (r_valid_from_dma1  ),
        .r_rdata_from_dma_i (r_rdata_from_dma1 )
     );
   
   
   mchan
     #(
       .NB_CTRLS                 ( 2                    ),    // NUMBER OF CORES >= 1
       .NB_TRANSFERS		 ( 1			),

       .CTRL_TRANS_QUEUE_DEPTH   ( 2                    ),    // DEPTH OF PRIVATE PER-CORE COMMAND QUEUE (CTRL_UNIT)
       .GLOBAL_TRANS_QUEUE_DEPTH ( 2                    ),    // DEPTH OF GLOBAL COMMAND QUEUE (CTRL_UNIT)
       .TCDM_ADD_WIDTH           ( MEM_ADD_WIDTH        ),    // WIDTH OF MEM ADDRESS
       .EXT_ADD_WIDTH            ( 32                   ),    // WIDTH OF GLOBAL EXTERNAL ADDRESS
       
       .TX_CH                    ( TX_CH                ),
       .RX_CH                    ( RX_CH                ),
       .TCDM_CHAN                ( WEI_MEM_CHAN         ),
       
       .NB_OUTSND_TRANS          ( 2                    ),    // NUMBER OF OUTSTANDING TRANSACTIONS
       .MCHAN_BURST_LENGTH       ( 1024                  ),     // ANY POWER OF 2 VALUE FROM 32 TO 2048
       
       .AXI_ADDR_WIDTH           ( 32                   ),
       .AXI_DATA_WIDTH           ( 64                   ),
       .AXI_USER_WIDTH           ( 6                    ),
       .AXI_ID_WIDTH             ( AXI_ID_WIDTH_EXT     )
   )
   mchan0_per_i
     (
      .clk_i                     ( clk_dma_i            ),
      .rst_ni                    ( rst_ni               ),
      
      .test_mode_i               ( '0                   ),
      
      // CONTROL TARGET
      //***************************************
      .ctrl_targ_req_i           ( {'0,           req_to_dma0}     ),
      .ctrl_targ_add_i           ( {32'h00000000, add_to_dma0}     ),
      .ctrl_targ_type_i          ( {1'b1,         wen_to_dma0}     ),
      .ctrl_targ_be_i            ( {4'h0,         be_to_dma0}     ),
      .ctrl_targ_data_i          ( {32'h00000000, wdata_to_dma0}   ),
      .ctrl_targ_id_i            ( {'0,'0}     ),
      
      .ctrl_targ_gnt_o           ( {gnt_dummy[0],      gnt_from_dma0}     ),
      .ctrl_targ_r_valid_o       ( {r_valid_dummy[0],  r_valid_from_dma0} ),
      .ctrl_targ_r_data_o        ( {r_data_dummy[0],   r_rdata_from_dma0}  ),
      .ctrl_targ_r_opc_o         (    ),
      .ctrl_targ_r_id_o          (    ),
    
    
      // MEM INITIATOR
      //***************************************
      .tcdm_init_req_o           ( s_mem_bus_req     [WEI_MEM_CHAN-1:0] ),
      .tcdm_init_add_o           ( s_mem_bus_add     [WEI_MEM_CHAN-1:0] ),
      .tcdm_init_type_o          ( s_mem_bus_wen     [WEI_MEM_CHAN-1:0] ),
      .tcdm_init_be_o            ( s_mem_bus_be      [WEI_MEM_CHAN-1:0] ),
      .tcdm_init_data_o          ( s_mem_bus_wdata   [WEI_MEM_CHAN-1:0] ),
      
      .tcdm_init_gnt_i           ( s_mem_bus_gnt     [WEI_MEM_CHAN-1:0] ),
      .tcdm_init_r_valid_i       ( s_mem_bus_r_valid [WEI_MEM_CHAN-1:0] ),
      .tcdm_init_r_data_i        ( s_mem_bus_r_rdata [WEI_MEM_CHAN-1:0] ),
      .tcdm_init_sid_o           (                     ),
      
      // EXTERNAL INITIATOR
      //***************************************
      .axi_master_aw_valid_o     ( ext_master[0].aw_valid  ),
      .axi_master_aw_addr_o      ( ext_master[0].aw_addr   ),
      .axi_master_aw_prot_o      ( ext_master[0].aw_prot   ),
      .axi_master_aw_region_o    ( ext_master[0].aw_region ),
      .axi_master_aw_len_o       ( ext_master[0].aw_len    ),
      .axi_master_aw_size_o      ( ext_master[0].aw_size   ),
      .axi_master_aw_burst_o     ( ext_master[0].aw_burst  ),
      .axi_master_aw_lock_o      ( ext_master[0].aw_lock   ),
      .axi_master_aw_cache_o     ( ext_master[0].aw_cache  ),
      .axi_master_aw_qos_o       ( ext_master[0].aw_qos    ),
      .axi_master_aw_id_o        ( ext_master[0].aw_id[AXI_ID_WIDTH_EXT-1:0]),
      .axi_master_aw_user_o      ( ext_master[0].aw_user   ),
      .axi_master_aw_ready_i     ( ext_master[0].aw_ready  ),
      
      .axi_master_ar_valid_o     ( ext_master[0].ar_valid  ),
      .axi_master_ar_addr_o      ( ext_master[0].ar_addr   ),
      .axi_master_ar_prot_o      ( ext_master[0].ar_prot   ),
      .axi_master_ar_region_o    ( ext_master[0].ar_region ),
      .axi_master_ar_len_o       ( ext_master[0].ar_len    ),
      .axi_master_ar_size_o      ( ext_master[0].ar_size   ),
      .axi_master_ar_burst_o     ( ext_master[0].ar_burst  ),
      .axi_master_ar_lock_o      ( ext_master[0].ar_lock   ),
      .axi_master_ar_cache_o     ( ext_master[0].ar_cache  ),
      .axi_master_ar_qos_o       ( ext_master[0].ar_qos    ),
      .axi_master_ar_id_o        ( ext_master[0].ar_id[AXI_ID_WIDTH_EXT-1:0]),
      .axi_master_ar_user_o      ( ext_master[0].ar_user   ),
      .axi_master_ar_ready_i     ( ext_master[0].ar_ready  ),
      
      .axi_master_w_valid_o      ( ext_master[0].w_valid   ),
      .axi_master_w_data_o       ( ext_master[0].w_data    ),
      .axi_master_w_strb_o       ( ext_master[0].w_strb    ),
      .axi_master_w_user_o       ( ext_master[0].w_user    ),
      .axi_master_w_last_o       ( ext_master[0].w_last    ),
      .axi_master_w_ready_i      ( ext_master[0].w_ready   ),

      .axi_master_r_valid_i      ( ext_master[0].r_valid   ),
      .axi_master_r_data_i       ( ext_master[0].r_data    ),
      .axi_master_r_resp_i       ( ext_master[0].r_resp    ),
      .axi_master_r_last_i       ( ext_master[0].r_last    ),
      .axi_master_r_id_i         ( ext_master[0].r_id[AXI_ID_WIDTH_EXT-1:0] ),
      .axi_master_r_user_i       ( ext_master[0].r_user    ),
      .axi_master_r_ready_o      ( ext_master[0].r_ready   ),

      .axi_master_b_valid_i      ( ext_master[0].b_valid   ),
      .axi_master_b_resp_i       ( ext_master[0].b_resp    ),
      .axi_master_b_id_i         ( ext_master[0].b_id[AXI_ID_WIDTH_EXT-1:0] ),
      .axi_master_b_user_i       ( ext_master[0].b_user    ),
      .axi_master_b_ready_o      ( ext_master[0].b_ready   ),
      
      .term_evt_o              (          ),
      
      .busy_o                    (                )
   );
   
   
   mchan
     #(
       .NB_CTRLS                 ( 2                    ),    // NUMBER OF CORES >= 2
       .NB_TRANSFERS		 ( 1			),

       .CTRL_TRANS_QUEUE_DEPTH   ( 2                    ),    // DEPTH OF PRIVATE PER-CORE COMMAND QUEUE (CTRL_UNIT)
       .GLOBAL_TRANS_QUEUE_DEPTH ( 2                    ),    // DEPTH OF GLOBAL COMMAND QUEUE (CTRL_UNIT)
       .TCDM_ADD_WIDTH           ( MEM_ADD_WIDTH        ),    // WIDTH OF MEM ADDRESS
       .EXT_ADD_WIDTH            ( 32                   ),    // WIDTH OF GLOBAL EXTERNAL ADDRESS
       
       .TX_CH                    ( TX_CH                ),
       .RX_CH                    ( RX_CH                ),
       .TCDM_CHAN                ( WEI_MEM_CHAN         ),
       
       .NB_OUTSND_TRANS          ( 2                    ),    // NUMBER OF OUTSTANDING TRANSACTIONS
       .MCHAN_BURST_LENGTH       ( 1024                 ),    // ANY POWER OF 2 VALUE FROM 32 TO 2048
       
       .AXI_ADDR_WIDTH           ( 32                   ),
       .AXI_DATA_WIDTH           ( 64                   ),
       .AXI_USER_WIDTH           ( 6                    ),
       .AXI_ID_WIDTH             ( AXI_ID_WIDTH_EXT     )
   )
   mchan1_per_i
     (
      .clk_i                     ( clk_dma_i            ),
      .rst_ni                    ( rst_ni               ),
      
      .test_mode_i               ( '0                   ),
      
      // CONTROL TARGET
      //***************************************
      .ctrl_targ_req_i           ( {'0,           req_to_dma1}     ),
      .ctrl_targ_add_i           ( {32'h00000000, add_to_dma1}     ),
      .ctrl_targ_type_i          ( {1'b1,         wen_to_dma1}     ),
      .ctrl_targ_be_i            ( {4'h0,         be_to_dma1}     ),
      .ctrl_targ_data_i          ( {32'h00000000, wdata_to_dma1}   ),
      .ctrl_targ_id_i            ( {'0,'0}     ),
      
      .ctrl_targ_gnt_o           ( {gnt_dummy[1],      gnt_from_dma1}     ),
      .ctrl_targ_r_valid_o       ( {r_valid_dummy[1],  r_valid_from_dma1} ),
      .ctrl_targ_r_data_o        ( {r_data_dummy[1],   r_rdata_from_dma1}  ),
      .ctrl_targ_r_opc_o         (    ),
      .ctrl_targ_r_id_o          (    ),
    
    
      // MEM INITIATOR
      //***************************************
      .tcdm_init_req_o           ( s_mem_bus_req    [2*WEI_MEM_CHAN-1:WEI_MEM_CHAN] ),
      .tcdm_init_add_o           ( s_mem_bus_add    [2*WEI_MEM_CHAN-1:WEI_MEM_CHAN] ),
      .tcdm_init_type_o          ( s_mem_bus_wen    [2*WEI_MEM_CHAN-1:WEI_MEM_CHAN] ),
      .tcdm_init_be_o            ( s_mem_bus_be     [2*WEI_MEM_CHAN-1:WEI_MEM_CHAN] ),
      .tcdm_init_data_o          ( s_mem_bus_wdata  [2*WEI_MEM_CHAN-1:WEI_MEM_CHAN] ),
      
      .tcdm_init_gnt_i           ( s_mem_bus_gnt     [2*WEI_MEM_CHAN-1:WEI_MEM_CHAN]),
      .tcdm_init_r_valid_i       ( s_mem_bus_r_valid [2*WEI_MEM_CHAN-1:WEI_MEM_CHAN]),
      .tcdm_init_r_data_i        ( s_mem_bus_r_rdata [2*WEI_MEM_CHAN-1:WEI_MEM_CHAN]),
      .tcdm_init_sid_o           (                     ),
      
      // EXTERNAL INITIATOR
      //***************************************
      .axi_master_aw_valid_o     ( ext_master[1].aw_valid  ),
      .axi_master_aw_addr_o      ( ext_master[1].aw_addr   ),
      .axi_master_aw_prot_o      ( ext_master[1].aw_prot   ),
      .axi_master_aw_region_o    ( ext_master[1].aw_region ),
      .axi_master_aw_len_o       ( ext_master[1].aw_len    ),
      .axi_master_aw_size_o      ( ext_master[1].aw_size   ),
      .axi_master_aw_burst_o     ( ext_master[1].aw_burst  ),
      .axi_master_aw_lock_o      ( ext_master[1].aw_lock   ),
      .axi_master_aw_cache_o     ( ext_master[1].aw_cache  ),
      .axi_master_aw_qos_o       ( ext_master[1].aw_qos    ),
      .axi_master_aw_id_o        ( ext_master[1].aw_id[AXI_ID_WIDTH_EXT-1:0]),
      .axi_master_aw_user_o      ( ext_master[1].aw_user   ),
      .axi_master_aw_ready_i     ( ext_master[1].aw_ready  ),
      
      .axi_master_ar_valid_o     ( ext_master[1].ar_valid  ),
      .axi_master_ar_addr_o      ( ext_master[1].ar_addr   ),
      .axi_master_ar_prot_o      ( ext_master[1].ar_prot   ),
      .axi_master_ar_region_o    ( ext_master[1].ar_region ),
      .axi_master_ar_len_o       ( ext_master[1].ar_len    ),
      .axi_master_ar_size_o      ( ext_master[1].ar_size   ),
      .axi_master_ar_burst_o     ( ext_master[1].ar_burst  ),
      .axi_master_ar_lock_o      ( ext_master[1].ar_lock   ),
      .axi_master_ar_cache_o     ( ext_master[1].ar_cache  ),
      .axi_master_ar_qos_o       ( ext_master[1].ar_qos    ),
      .axi_master_ar_id_o        ( ext_master[1].ar_id[AXI_ID_WIDTH_EXT-1:0]),
      .axi_master_ar_user_o      ( ext_master[1].ar_user   ),
      .axi_master_ar_ready_i     ( ext_master[1].ar_ready  ),
      
      .axi_master_w_valid_o      ( ext_master[1].w_valid   ),
      .axi_master_w_data_o       ( ext_master[1].w_data    ),
      .axi_master_w_strb_o       ( ext_master[1].w_strb    ),
      .axi_master_w_user_o       ( ext_master[1].w_user    ),
      .axi_master_w_last_o       ( ext_master[1].w_last    ),
      .axi_master_w_ready_i      ( ext_master[1].w_ready   ),

      .axi_master_r_valid_i      ( ext_master[1].r_valid   ),
      .axi_master_r_data_i       ( ext_master[1].r_data    ),
      .axi_master_r_resp_i       ( ext_master[1].r_resp    ),
      .axi_master_r_last_i       ( ext_master[1].r_last    ),
      .axi_master_r_id_i         ( ext_master[1].r_id[AXI_ID_WIDTH_EXT-1:0] ),
      .axi_master_r_user_i       ( ext_master[1].r_user    ),
      .axi_master_r_ready_o      ( ext_master[1].r_ready   ),

      .axi_master_b_valid_i      ( ext_master[1].b_valid   ),
      .axi_master_b_resp_i       ( ext_master[1].b_resp    ),
      .axi_master_b_id_i         ( ext_master[1].b_id[AXI_ID_WIDTH_EXT-1:0] ),
      .axi_master_b_user_i       ( ext_master[1].b_user    ),
      .axi_master_b_ready_o      ( ext_master[1].b_ready   ),
      
      .term_evt_o              (          ),
      
      .busy_o                    (                )
   );

endmodule
