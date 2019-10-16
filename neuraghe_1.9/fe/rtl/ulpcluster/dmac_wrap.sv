////////////////////////////////////////////////////////////////////////////////
// Company:        Multitherman Laboratory @ DEIS - University of Bologna     //
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Davide Rossi - davide.rossi@unibo.it                       //
//                                                                            //
// Additional contributions by:                                               //
//                 Igor Loi     - igor.loi@unibo.it                           //
//                                                                            //
//                                                                            //
// Create Date:    13/02/2013                                                 // 
// Design Name:    ULPSoC                                                     // 
// Module Name:    ulpcluster_top                                             //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    ULPSoC cluster                                             //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - (23/02/2015) REmoved Tab, improved identation, and         //
//                 exported some parameters (APPROVED)                        //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "ulpsoc_defines.sv"

module dmac_wrap
  #(
    parameter NB_CORES       = 1,
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_ID_WIDTH   = 4,
    parameter BANK_SIZE_32BIT= 8192,
    
    parameter TCDM_ADD_WIDTH = 13,
    
    parameter DATA_WIDTH     = 32,
    parameter ADDR_WIDTH     = 32,
    parameter BE_WIDTH       = DATA_WIDTH/8,
    parameter DMA_REMAP      = 0
    )
   (
    
    input logic                      clk_i,
    input logic                      rst_ni,
    
    input logic                      test_mode_i,
    
    XBAR_TCDM_BUS.Slave              ctrl_slave[NB_CORES-1:0],
    
    XBAR_TCDM_BUS.Master             tcdm_master[3:0],
    
    AXI_BUS.Master                   ext_master,

    output logic [NB_CORES-1:0]      term_event_o,
    output logic                     busy_o
    
    );
   
   // CORE --> MCHAN CTRL INTERFACE BUS SIGNALS
   logic [NB_CORES-1:0][DATA_WIDTH-1:0] s_ctrl_bus_wdata;
   logic [NB_CORES-1:0][ADDR_WIDTH-1:0] s_ctrl_bus_add;
   logic [NB_CORES-1:0] 		            s_ctrl_bus_req;
   logic [NB_CORES-1:0] 		            s_ctrl_bus_wen;
   logic [NB_CORES-1:0][BE_WIDTH-1:0] 	s_ctrl_bus_be;
   logic [NB_CORES-1:0] 		            s_ctrl_bus_gnt;
   logic [NB_CORES-1:0][DATA_WIDTH-1:0] s_ctrl_bus_r_rdata;
   logic [NB_CORES-1:0] 		            s_ctrl_bus_r_valid;
   
   // MCHAN TCDM INIT --> TCDM MEMORY BUS SIGNALS
   logic [3:0][DATA_WIDTH-1:0] 		s_tcdm_bus_wdata;
   logic [3:0][ADDR_WIDTH-1:0] 		s_tcdm_bus_add;
   logic [3:0] 				            s_tcdm_bus_req;
   logic [3:0] 				            s_tcdm_bus_wen;
   logic [3:0][BE_WIDTH-1:0] 		  s_tcdm_bus_be;
   logic [3:0] 				            s_tcdm_bus_gnt;
   logic [3:0][DATA_WIDTH-1:0] 		s_tcdm_bus_r_rdata;
   logic [3:0] 				            s_tcdm_bus_r_valid;
   
   logic [NB_CORES-1:0][DATA_WIDTH-1:0] s_ctrl_bus_wdata_to_mchan;
   logic [NB_CORES-1:0][ADDR_WIDTH-1:0] s_ctrl_bus_add_to_mchan;
   logic [NB_CORES-1:0] 		            s_ctrl_bus_req_to_mchan;
   logic [NB_CORES-1:0] 		            s_ctrl_bus_wen_to_mchan;
   logic [NB_CORES-1:0][BE_WIDTH-1:0] 	s_ctrl_bus_be_to_mchan;
   
   logic [NB_CORES-1:0] 		            s_ctrl_bus_gnt_from_mchan;
   logic [NB_CORES-1:0][DATA_WIDTH-1:0] s_ctrl_bus_r_rdata_from_mchan;
   logic [NB_CORES-1:0] 		            s_ctrl_bus_r_valid_from_mchan;
   
   logic [DATA_WIDTH-1:0] wdata_to_load;
   logic                  req_to_load;          
   logic [ADDR_WIDTH-1:0] add_to_load;           
   logic                  wen_to_load;           
   logic [BE_WIDTH-1:0]   be_to_load;
   logic                  gnt_from_load;          
   logic                  r_valid_from_load;  
   logic [DATA_WIDTH-1:0] r_rdata_from_load; 
   logic [DATA_WIDTH-1:0] wdata_to_store;       
   logic                  req_to_store;           
   logic [ADDR_WIDTH-1:0] add_to_store;           
   logic                  wen_to_store;           
   logic [BE_WIDTH-1:0]   be_to_store; 
   logic                  gnt_from_store;          
   logic                  r_valid_from_store;  
   logic [DATA_WIDTH-1:0] r_rdata_from_store;
   
   genvar 				i;
   
   //********************************************************
   //************************ DMAC **************************
   //********************************************************
   
   generate
      
      for (i=0; i<NB_CORES; i++)
	begin : CTRL_SLAVE_BIND
           assign s_ctrl_bus_add[i]     = ctrl_slave[i].add;
           assign s_ctrl_bus_req[i]     = ctrl_slave[i].req;
           assign s_ctrl_bus_wdata[i]   = ctrl_slave[i].wdata;
           assign s_ctrl_bus_wen[i]     = ctrl_slave[i].wen;
           assign s_ctrl_bus_be[i]      = ctrl_slave[i].be;
	   
           assign ctrl_slave[i].gnt     = s_ctrl_bus_gnt[i];
           assign ctrl_slave[i].r_opc   = 'b0;
           assign ctrl_slave[i].r_valid = s_ctrl_bus_r_valid[i];
           assign ctrl_slave[i].r_rdata = s_ctrl_bus_r_rdata[i];
	end
      
   endgenerate
   
   generate
      
      for (i=0; i<4; i++)
	begin : TCDM_MASTER_BIND
           assign tcdm_master[i].add      = s_tcdm_bus_add[i];
           assign tcdm_master[i].req      = s_tcdm_bus_req[i];
           assign tcdm_master[i].wdata    = s_tcdm_bus_wdata[i];
           assign tcdm_master[i].wen      = s_tcdm_bus_wen[i];
           assign tcdm_master[i].be       = s_tcdm_bus_be[i];
	   
           assign s_tcdm_bus_gnt[i]       = tcdm_master[i].gnt;
           assign s_tcdm_bus_r_valid[i]   = tcdm_master[i].r_valid;
           assign s_tcdm_bus_r_rdata[i]   = tcdm_master[i].r_rdata;
	end
      
   endgenerate
   
   
   
   // *** DMA REMAP ***
   localparam SRAM_ADD_WIDTH = TCDM_ADD_WIDTH - 1; //Whole TCDM address (SRAM+SCM) minus the bit of SCM
   
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
       assign s_tcdm_bus_add = s_tcdm_bus_add_post;
     else
       assign s_tcdm_bus_add = s_tcdm_bus_add_pre;
   endgenerate
   
   
   localparam BANK_SIZE_B = BANK_SIZE_32BIT <<< 2;   
      
      
   uC_to_prog
    #(
      .NB_CORES       (NB_CORES),
      .DATA_WIDTH     (DATA_WIDTH),
      .ADDR_WIDTH     (ADDR_WIDTH),
      .BE_WIDTH       (BE_WIDTH),
      .BANK_SIZE_B    (BANK_SIZE_B)
    )
    uC_to_prog_i
      (  
        .clk_i                     ( clk_i        ),
        .rst_ni                    ( rst_ni       ),
        //input core
        .wdata             (s_ctrl_bus_wdata[0]   ),
        .req               (s_ctrl_bus_req[0]     ),
        .add               (s_ctrl_bus_add[0]     ),
        .wen               (s_ctrl_bus_wen[0]     ),
        .be                (s_ctrl_bus_be[0]      ),
        //output core
        .gnt               (s_ctrl_bus_gnt[0]     ),
        .r_valid           (s_ctrl_bus_r_valid[0] ),
        .r_rdata           (s_ctrl_bus_r_rdata[0] ),
        //output load
        .wdata_to_load    (
                            wdata_to_load
//                              s_ctrl_bus_wdata_to_mchan[0]  
                              ),
        .req_to_load      (
                            req_to_load  
//                              s_ctrl_bus_req_to_mchan[0]   
                              ),
        .add_to_load      (
                            add_to_load   
//                              s_ctrl_bus_add_to_mchan[0]   
                              ),
        .wen_to_load      (
                            wen_to_load   
//                              s_ctrl_bus_wen_to_mchan[0]  
                              ),
        .be_to_load       (
                            be_to_load    
//                              s_ctrl_bus_be_to_mchan[0]  
                              ),
        //input load
        .gnt_from_load     (
                             gnt_from_load     
//                            s_ctrl_bus_gnt_from_mchan[0]  
                             ),
        .r_valid_from_load (
                             r_valid_from_load 
//                             s_ctrl_bus_r_valid_from_mchan[0]
                             ),
        .r_rdata_from_load (
                             r_rdata_from_load 
//                             s_ctrl_bus_r_rdata_from_mchan[0]
                             ),
        //output store
        .wdata_to_store    (
                            wdata_to_store
//                              s_ctrl_bus_wdata_to_mchan[1]   
                            ),
        .req_to_store      (
                            req_to_store
//                              s_ctrl_bus_req_to_mchan[1]     
                            ),
        .add_to_store      (
                            add_to_store
//                              s_ctrl_bus_add_to_mchan[1]     
                            ),
        .wen_to_store      (
                            wen_to_store
//                              s_ctrl_bus_wen_to_mchan[1]     
                            ),
        .be_to_store       (
                            be_to_store
//                              s_ctrl_bus_be_to_mchan[1]      
                            ),
        //input store
        .gnt_from_store     (
                            gnt_from_store
//                              s_ctrl_bus_gnt_from_mchan[1]     
                             ),
        .r_valid_from_store (
                            r_valid_from_store
//                              s_ctrl_bus_r_valid_from_mchan[1] 
                             ),
        .r_rdata_from_store (
                            r_rdata_from_store
//                              s_ctrl_bus_r_rdata_from_mchan[1] 
                             )
      );
   
   
   
   
   mchan_prog
    #(
      .NB_CORES       (NB_CORES),
      .DATA_WIDTH     (DATA_WIDTH),
      .ADDR_WIDTH     (ADDR_WIDTH),
      .BE_WIDTH       (BE_WIDTH),
      .BANK_SIZE_B    (BANK_SIZE_B)
    )
    mchan_actload_prog_i
      (  
        .clk_i                     ( clk_i                ),
        .rst_ni                    ( rst_ni               ),
        //input load
        .wdata             (wdata_to_load  ),
        .req               (req_to_load     ),
        .add               (add_to_load     ),
        .wen               (wen_to_load     ),
        .be                (be_to_load      ),
        //output load
        .gnt               (gnt_from_load     ),
        .r_valid           (r_valid_from_load ),
        .r_rdata           (r_rdata_from_load ),
        //output dma
        .wdata_to_mchan    (s_ctrl_bus_wdata_to_mchan[0]   ),
        .req_to_mchan      (s_ctrl_bus_req_to_mchan[0]     ),
        .add_to_mchan      (s_ctrl_bus_add_to_mchan[0]     ),
        .wen_to_mchan      (s_ctrl_bus_wen_to_mchan[0]     ),
        .be_to_mchan       (s_ctrl_bus_be_to_mchan[0]      ),
        //input dma
        .gnt_from_mchan     (s_ctrl_bus_gnt_from_mchan[0]     ),
        .r_valid_from_mchan (s_ctrl_bus_r_valid_from_mchan[0] ),
        .r_rdata_from_mchan (s_ctrl_bus_r_rdata_from_mchan[0] )
      );
      
      
      mchan_prog
    #(
      .NB_CORES       (NB_CORES),
      .DATA_WIDTH     (DATA_WIDTH),
      .ADDR_WIDTH     (ADDR_WIDTH),
      .BE_WIDTH       (BE_WIDTH),
      .BANK_SIZE_B    (BANK_SIZE_B)
    )
    mchan_actstore_prog_i
      (  
        .clk_i                     ( clk_i                ),
        .rst_ni                    ( rst_ni               ),
        //input store
        .wdata             (wdata_to_store   ),
        .req               (req_to_store     ),
        .add               (add_to_store     ),
        .wen               (wen_to_store     ),
        .be                (be_to_store      ),
        //output store
        .gnt               (gnt_from_store     ),
        .r_valid           (r_valid_from_store ),
        .r_rdata           (r_rdata_from_store ),
        //output dma
        .wdata_to_mchan    (s_ctrl_bus_wdata_to_mchan[1]   ),
        .req_to_mchan      (s_ctrl_bus_req_to_mchan[1]     ),
        .add_to_mchan      (s_ctrl_bus_add_to_mchan[1]     ),
        .wen_to_mchan      (s_ctrl_bus_wen_to_mchan[1]     ),
        .be_to_mchan       (s_ctrl_bus_be_to_mchan[1]      ),
        //input dma
        .gnt_from_mchan     (s_ctrl_bus_gnt_from_mchan[1]     ),
        .r_valid_from_mchan (s_ctrl_bus_r_valid_from_mchan[1] ),
        .r_rdata_from_mchan (s_ctrl_bus_r_rdata_from_mchan[1] )
      );
   
   
   mchan
     #(
       .NB_CTRLS                 ( NB_CORES             ),    // NUMBER OF CORES
       .CTRL_TRANS_QUEUE_DEPTH   ( 2                    ),    // DEPTH OF PRIVATE PER-CORE COMMAND QUEUE (CTRL_UNIT)
       .GLOBAL_TRANS_QUEUE_DEPTH ( 2                    ),    // DEPTH OF GLOBAL COMMAND QUEUE (CTRL_UNIT)
       .TCDM_ADD_WIDTH           ( TCDM_ADD_WIDTH       ),    // WIDTH OF TCDM ADDRESS
       .EXT_ADD_WIDTH            ( 32                   ),    // WIDTH OF GLOBAL EXTERNAL ADDRESS
       .NB_OUTSND_TRANS          ( 8                    ),    // NUMBER OF OUTSTANDING TRANSACTIONS
       .MCHAN_BURST_LENGTH       ( 1024                 ),    // ANY POWER OF 2 VALUE FROM 32 TO 2048
       
       .AXI_ADDR_WIDTH           ( 32                   ),
       .AXI_DATA_WIDTH           ( 64                   ),
       .AXI_USER_WIDTH           ( 6                    ),
       .AXI_ID_WIDTH             ( AXI_ID_WIDTH         )
   )
   mchan_i
     (
      .clk_i                     ( clk_i                ),
      .rst_ni                    ( rst_ni               ),
      
      .test_mode_i               (test_mode_i           ),
      
      // CONTROL TARGET
      //***************************************
      .ctrl_targ_req_i           ( s_ctrl_bus_req_to_mchan  ),
      .ctrl_targ_add_i           ( s_ctrl_bus_add_to_mchan  ),
      .ctrl_targ_type_i          ( s_ctrl_bus_wen_to_mchan  ),
      .ctrl_targ_be_i            ( s_ctrl_bus_be_to_mchan   ),
      .ctrl_targ_data_i          ( s_ctrl_bus_wdata_to_mchan),
      .ctrl_targ_id_i            ( '0     ),  
      
      .ctrl_targ_gnt_o           ( s_ctrl_bus_gnt_from_mchan      ),
      .ctrl_targ_r_valid_o       ( s_ctrl_bus_r_valid_from_mchan  ),
      .ctrl_targ_r_data_o        ( s_ctrl_bus_r_rdata_from_mchan  ),
      .ctrl_targ_r_opc_o         (    ),
      .ctrl_targ_r_id_o          (    ),
    
      // TCDM INITIATOR
      //***************************************
      .tcdm_init_req_o           ( s_tcdm_bus_req       ),
      .tcdm_init_add_o           ( s_tcdm_bus_add_pre   ),
      .tcdm_init_type_o          ( s_tcdm_bus_wen       ),
      .tcdm_init_be_o            ( s_tcdm_bus_be        ),
      .tcdm_init_data_o          ( s_tcdm_bus_wdata     ),
      .tcdm_init_sid_o           (                      ),
      
      .tcdm_init_gnt_i           ( s_tcdm_bus_gnt       ),
      .tcdm_init_r_valid_i       ( s_tcdm_bus_r_valid   ),
      .tcdm_init_r_data_i        ( s_tcdm_bus_r_rdata   ),
      
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
      .axi_master_aw_id_o        ( ext_master.aw_id[AXI_ID_WIDTH-1:0]),
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
      .axi_master_ar_id_o        ( ext_master.ar_id[AXI_ID_WIDTH-1:0]),
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
      .axi_master_r_id_i         ( ext_master.r_id[AXI_ID_WIDTH-1:0] ),
      .axi_master_r_user_i       ( ext_master.r_user    ),
      .axi_master_r_ready_o      ( ext_master.r_ready   ),

      .axi_master_b_valid_i      ( ext_master.b_valid   ),
      .axi_master_b_resp_i       ( ext_master.b_resp    ),
      .axi_master_b_id_i         ( ext_master.b_id[AXI_ID_WIDTH-1:0] ),
      .axi_master_b_user_i       ( ext_master.b_user    ),
      .axi_master_b_ready_o      ( ext_master.b_ready   ),
      
      .term_evt_o              ( term_event_o         ),
      
      .busy_o                    ( busy_o               )
   );

endmodule
