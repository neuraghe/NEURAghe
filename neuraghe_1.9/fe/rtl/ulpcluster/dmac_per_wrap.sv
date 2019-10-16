
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
    parameter DMA_REMAP      = 0
    )
   (
    
    input logic                      clk_dma_i,
    input logic                      clk_axi_i,
    input logic                      rst_ni,
        
    
    AXI_BUS.Slave                    ctrl_slave,
    
    XBAR_TCDM_BUS_64BIT.Master             mem_master[2-1:0],
    
    AXI_BUS.Master                   ext_master
    
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
   logic [3:0][DATA_WIDTH-1:0] 		s_mem_bus_wdata;
   logic [3:0][ADDR_WIDTH-1:0] 		s_mem_bus_add;
   logic [3:0] 				s_mem_bus_req;
   logic [3:0] 				s_mem_bus_wen;
   logic [3:0][BE_WIDTH-1:0] 		s_mem_bus_be;
   logic [3:0] 				s_mem_bus_gnt;
   logic [3:0][DATA_WIDTH-1:0] 		s_mem_bus_r_rdata;
   logic [3:0] 				s_mem_bus_r_valid;
   
   genvar 				i;
   
   logic [DATA_WIDTH-1:0] wdata_to_mchan_per;
   logic [ADDR_WIDTH-1:0] add_to_mchan_per;
   logic  		            req_to_mchan_per;
   logic  	            	wen_to_mchan_per;
   logic [BE_WIDTH-1:0] 	be_to_mchan_per;
   logic  	            	gnt_from_mchan_per;
   logic [DATA_WIDTH-1:0] r_rdata_from_mchan_per;
   logic  	            	r_valid_from_mchan_per;
   
   
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
      
      for (i=0; i<2; i++)
	begin : mem_MASTER_BIND
           assign mem_master[i].add      = s_mem_bus_add[i*2];
           assign mem_master[i].req      = s_mem_bus_req[i*2];
           assign mem_master[i].wdata    ={s_mem_bus_wdata[i*2+1], s_mem_bus_wdata[i*2]};
           assign mem_master[i].wen      = s_mem_bus_wen[i*2];
           assign mem_master[i].be       ={s_mem_bus_be[i*2+1], s_mem_bus_be[i*2]};
	   
           assign s_mem_bus_gnt[i*2]       = mem_master[i].gnt;
           assign s_mem_bus_gnt[i*2+1]       = mem_master[i].gnt;
           assign s_mem_bus_r_valid[i*2]   = mem_master[i].r_valid;
           assign s_mem_bus_r_valid[i*2+1]   = mem_master[i].r_valid;
           assign s_mem_bus_r_rdata[i*2]   = mem_master[i].r_rdata;
           assign s_mem_bus_r_rdata[i*2+1]   = mem_master[i].r_rdata;
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
   
   logic [3:0][ADDR_WIDTH-1:0] 		s_tcdm_bus_add_pre;
   logic [3:0][ADDR_WIDTH-1:0] 		s_tcdm_bus_add_post;
   
   
   generate
     for (i=0; i<4; i++) begin
       //assign s_tcdm_bus_add_post[i] = {s_tcdm_bus_add_pre[i][31:18], s_tcdm_bus_add_pre[i][5:4], s_tcdm_bus_add_pre[i][15:6], s_tcdm_bus_add_pre[i][17:16], s_tcdm_bus_add_pre[i][3:0]};
       //assign s_tcdm_bus_add_post[i] = {s_tcdm_bus_add_pre[i][31:18], s_tcdm_bus_add_pre[i][15:4], s_tcdm_bus_add_pre[i][17:16], s_tcdm_bus_add_pre[i][3:0]};
       
       // 16 banks 4096 words
       //assign s_tcdm_bus_add_post[i] = {s_tcdm_bus_add_pre[i][31:SRAM_ADD_WIDTH], s_tcdm_bus_add_pre[i][SRAM_ADD_WIDTH-3:4], s_tcdm_bus_add_pre[i][SRAM_ADD_WIDTH-1:SRAM_ADD_WIDTH-2], s_tcdm_bus_add_pre[i][3:0]};
       
       // 32 banks 4096 words || 8192 words
       assign s_tcdm_bus_add_post[i] = {s_tcdm_bus_add_pre[i][31:SRAM_ADD_WIDTH], s_tcdm_bus_add_pre[i][SRAM_ADD_WIDTH-4:4], s_tcdm_bus_add_pre[i][SRAM_ADD_WIDTH-1:SRAM_ADD_WIDTH-3], s_tcdm_bus_add_pre[i][3:0]};
         
     end
     if (DMA_REMAP==1)
       assign s_mem_bus_add = s_tcdm_bus_add_post;
     else
       assign s_mem_bus_add = s_tcdm_bus_add_pre;
   endgenerate
   
   
   logic gnt_dummy;
   logic r_valid_dummy;
   logic [31:0] r_data_dummy;
   
//   mchan_prog
//    #(
//      .NB_CORES       (1         ),
//      .DATA_WIDTH     (DATA_WIDTH),
//      .ADDR_WIDTH     (ADDR_WIDTH),
//      .BE_WIDTH       (BE_WIDTH),
//      .BANK_SIZE_B    (WEI_MEM_BANK_SIZE*8)
//    )
//    mchan_wei_prog_i
//      (  
//        .clk_i             ( clk_dma_i            ),
//        .rst_ni            ( rst_ni               ),
//        //input
//        .wdata             (periph_bus.wdata   ),
//        .req               (periph_bus.req     ),
//        .add               (periph_bus.add     ),
//        .wen               (periph_bus.wen     ),
//        .be                (periph_bus.be      ),
//        //output
//        .wdata_to_mchan    (wdata_to_mchan_per   ),
//        .req_to_mchan      (req_to_mchan_per     ),
//        .add_to_mchan      (add_to_mchan_per     ),
//        .wen_to_mchan      (wen_to_mchan_per     ),
//        .be_to_mchan       (be_to_mchan_per      ),
//        //input
//        .gnt_from_mchan     (gnt_from_mchan_per     ),
//        .r_valid_from_mchan (r_valid_from_mchan_per ),
//        .r_rdata_from_mchan (r_rdata_from_mchan_per ),
//        //output
//        .gnt               (periph_bus.gnt      ),
//        .r_valid           (periph_bus.r_valid  ),
//        .r_rdata           (periph_bus.r_rdata  )
//      );
   
   
   
   
   mchan
     #(
       .NB_CTRLS                 ( 2                    ),    // NUMBER OF CORES
       .CTRL_TRANS_QUEUE_DEPTH   ( 2                    ),    // DEPTH OF PRIVATE PER-CORE COMMAND QUEUE (CTRL_UNIT)
       .GLOBAL_TRANS_QUEUE_DEPTH ( 2                    ),    // DEPTH OF GLOBAL COMMAND QUEUE (CTRL_UNIT)
       .TCDM_ADD_WIDTH           ( MEM_ADD_WIDTH        ),    // WIDTH OF MEM ADDRESS
       .EXT_ADD_WIDTH            ( 32                   ),    // WIDTH OF GLOBAL EXTERNAL ADDRESS
       .NB_OUTSND_TRANS          ( 8                    ),    // NUMBER OF OUTSTANDING TRANSACTIONS
       .MCHAN_BURST_LENGTH       ( 1024                 ),    // ANY POWER OF 2 VALUE FROM 32 TO 2048
       
       .AXI_ADDR_WIDTH           ( 32                   ),
       .AXI_DATA_WIDTH           ( 64                   ),
       .AXI_USER_WIDTH           ( 6                    ),
       .AXI_ID_WIDTH             ( AXI_ID_WIDTH_EXT     )
   )
   mchan_per_i
     (
      .clk_i                     ( clk_dma_i            ),
      .rst_ni                    ( rst_ni               ),
      
      .test_mode_i               ( '0                   ),
      
      // CONTROL TARGET
      //***************************************
      .ctrl_targ_req_i           ( {'0,/*req_to_mchan_per*/periph_bus.req}     ),
      .ctrl_targ_add_i           ( {32'h00000000,/*add_to_mchan_per*/periph_bus.add}     ),
      .ctrl_targ_type_i          ( {'0,/*wen_to_mchan_per*/periph_bus.wen}     ),
      .ctrl_targ_be_i            ( {4'h0,/*be_to_mchan_per*/ periph_bus.be}     ),
      .ctrl_targ_data_i          ( {32'h00000000,/*wdata_to_mchan_per*/periph_bus.wdata}   ),
      .ctrl_targ_id_i            ( {'0,'0}     ),
      
      .ctrl_targ_gnt_o           ( {gnt_dummy,/*gnt_from_mchan_per*/periph_bus.gnt}         ),
      .ctrl_targ_r_valid_o       ( {r_valid_dummy,/*r_valid_from_mchan_per*/periph_bus.r_valid} ),
      .ctrl_targ_r_data_o        ( {r_data_dummy,/*r_rdata_from_mchan_per*/periph_bus.r_rdata}  ),
      .ctrl_targ_r_opc_o         (    ),
      .ctrl_targ_r_id_o          (    ),
      
//      .ctrl_targ_req_i           ( {'0,req_to_mchan_per/*periph_bus.req*/}     ),
//      .ctrl_targ_add_i           ( {'0,add_to_mchan_per/*periph_bus.add*/}     ),
//      .ctrl_targ_type_i          ( {'0,wen_to_mchan_per/*periph_bus.wen*/}     ),
//      .ctrl_targ_be_i            ( {'0,be_to_mchan_per /*periph_bus.be*/}     ),
//      .ctrl_targ_data_i          ( {'0,wdata_to_mchan_per/*periph_bus.wdata*/}   ),
//      .ctrl_targ_id_i            ( {'0,'0}     ),
//      
//      .ctrl_targ_gnt_o           ( {gnt_dummy,gnt_from_mchan_per/*periph_bus.gnt*/}         ),
//      .ctrl_targ_r_valid_o       ( {r_valid_dummy,r_valid_from_mchan_per/*periph_bus.r_valid*/} ),
//      .ctrl_targ_r_data_o        ( {r_data_dummy,r_rdata_from_mchan_per/*periph_bus.r_rdata*/}  ),
//      .ctrl_targ_r_opc_o         (    ),
//      .ctrl_targ_r_id_o          (    ),
    
    
      // MEM INITIATOR
      //***************************************
      .tcdm_init_req_o           ( s_mem_bus_req       ),
      .tcdm_init_add_o           ( s_tcdm_bus_add_pre  ),
      .tcdm_init_type_o          ( s_mem_bus_wen       ),
      .tcdm_init_be_o            ( s_mem_bus_be        ),
      .tcdm_init_data_o          ( s_mem_bus_wdata     ),
      
      .tcdm_init_gnt_i           ( s_mem_bus_gnt       ),
      .tcdm_init_r_valid_i       ( s_mem_bus_r_valid   ),
      .tcdm_init_r_data_i        ( s_mem_bus_r_rdata   ),
      .tcdm_init_sid_o           (                     ),
      
      // EXTERNAL INITIATOR
      //***************************************
      .axi_master_aw_valid_o     ( ext_master.aw_valid  ),
      .axi_master_aw_addr_o      ( ext_master.aw_addr   ),
      .axi_master_aw_prot_o      ( ext_master.aw_prot   ),
      .axi_master_aw_region_o    ( ext_master.aw_region ),
      .axi_master_aw_len_o       ( ext_master.aw_len    ),
      .axi_master_aw_size_o      ( ext_master.aw_size   ),
      .axi_master_aw_burst_o     ( ext_master.aw_burst  ),
      .axi_master_aw_lock_o      ( ext_master.aw_lock   ),
      .axi_master_aw_cache_o     ( ext_master.aw_cache  ),
      .axi_master_aw_qos_o       ( ext_master.aw_qos    ),
      .axi_master_aw_id_o        ( ext_master.aw_id[AXI_ID_WIDTH_EXT-1:0]),
      .axi_master_aw_user_o      ( ext_master.aw_user   ),
      .axi_master_aw_ready_i     ( ext_master.aw_ready  ),
      
      .axi_master_ar_valid_o     ( ext_master.ar_valid  ),
      .axi_master_ar_addr_o      ( ext_master.ar_addr   ),
      .axi_master_ar_prot_o      ( ext_master.ar_prot   ),
      .axi_master_ar_region_o    ( ext_master.ar_region ),
      .axi_master_ar_len_o       ( ext_master.ar_len    ),
      .axi_master_ar_size_o      ( ext_master.ar_size   ),
      .axi_master_ar_burst_o     ( ext_master.ar_burst  ),
      .axi_master_ar_lock_o      ( ext_master.ar_lock   ),
      .axi_master_ar_cache_o     ( ext_master.ar_cache  ),
      .axi_master_ar_qos_o       ( ext_master.ar_qos    ),
      .axi_master_ar_id_o        ( ext_master.ar_id[AXI_ID_WIDTH_EXT-1:0]),
      .axi_master_ar_user_o      ( ext_master.ar_user   ),
      .axi_master_ar_ready_i     ( ext_master.ar_ready  ),
      
      .axi_master_w_valid_o      ( ext_master.w_valid   ),
      .axi_master_w_data_o       ( ext_master.w_data    ),
      .axi_master_w_strb_o       ( ext_master.w_strb    ),
      .axi_master_w_user_o       ( ext_master.w_user    ),
      .axi_master_w_last_o       ( ext_master.w_last    ),
      .axi_master_w_ready_i      ( ext_master.w_ready   ),

      .axi_master_r_valid_i      ( ext_master.r_valid   ),
      .axi_master_r_data_i       ( ext_master.r_data    ),
      .axi_master_r_resp_i       ( ext_master.r_resp    ),
      .axi_master_r_last_i       ( ext_master.r_last    ),
      .axi_master_r_id_i         ( ext_master.r_id[AXI_ID_WIDTH_EXT-1:0] ),
      .axi_master_r_user_i       ( ext_master.r_user    ),
      .axi_master_r_ready_o      ( ext_master.r_ready   ),

      .axi_master_b_valid_i      ( ext_master.b_valid   ),
      .axi_master_b_resp_i       ( ext_master.b_resp    ),
      .axi_master_b_id_i         ( ext_master.b_id[AXI_ID_WIDTH_EXT-1:0] ),
      .axi_master_b_user_i       ( ext_master.b_user    ),
      .axi_master_b_ready_o      ( ext_master.b_ready   ),
      
      .term_evt_o              (          ),
      
      .busy_o                    (                )
   );

endmodule
