`include "ulpsoc_defines.sv"

module cluster_int_region
#(
    parameter NB_CORES       = 4,
    parameter NB_HWACC_PORTS = 4,
    parameter NB_DMAS        = 1,
    parameter NB_MPERIPHS    = 1,
    parameter NB_TCDM_BANKS  = 8,
    parameter NB_SPERIPHS    = 1,
    parameter NB_CACHE_BANKS = 4,
    
    parameter N_BPORTS       = 4,

    //MCHAN tcdm parameter 
    parameter TCDM_ADD_WIDTH = 13, // Total bit used to address the whole TCDM minus 3 bits (because uses 64bit data aka 2 tcdm ports)

    // AXI PARAMETERS
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_ID_WIDTH   = 10,

    //CLUSTER MAIN PARAMETERS
    parameter DATA_WIDTH      = 32,
    parameter ADDR_WIDTH      = 32,
    parameter BE_WIDTH        = DATA_WIDTH/8,

    //TCDM PARAMETERS
    parameter TEST_SET_BIT    = 20, // bits used to indicate a test and set opration during a load in TCDM
    parameter ADDR_MEM_WIDTH  = 11, // total bits used to address a BANKin TCDM (SCM+SRAM): --> FIXME  = TCDM_ADD_WIDTH - 2 
    parameter ADDR_SRAM_WIDTH = 10, // bits used to address a single bank in SRAM TCDM
    parameter ADDR_SCM_WIDTH  = 8,  // bits used to address a single bank in SCM TCDM
    parameter RM_SIZE         = 4,  // READ MARGIN TCDM  SRAM
    parameter WM_SIZE         = 4,  // WRITE MARGIN TCDM SRAM
 
    //PERIPH PARAMETERS
    parameter LOG_CLUSTER     = 5,  // NOT USED RIGTH NOW
    parameter PE_ROUTING_LSB  = 16, //LSB used as routing BIT in periph interco
    parameter PE_ROUTING_MSB  = 19,  //MSB used as routing BIT in periph interco

    parameter NPF             = 3,
    parameter N_ROW           = 4,
    parameter N_COL           = 4
)
(

    input logic                   clk_i,
    input logic                   clk_fast_i,
    input logic                   rst_ni,
    input logic [4:0]             cluster_id_i,
    
    input logic                   test_mode_i,

    input logic [7:0]             ext_events_i,
    input logic                   fetch_en_i,

    input logic                   en_sa_boot_i,
    input logic [NB_CORES-1:0]    ready_to_shutdown_i,

    output logic                  eoc_o,
    output logic [1:0]            return_o,
    
    output logic[NB_CORES-1:0]    fetch_enable_reg_o,
    output logic                  addr_tran_en_o,
    output logic[NB_CORES-1:0]    IRQ_o,
    output logic[NB_CORES-1:0]    NMIRQ_o,

    // SIGNALS FROM DEMUX
    XBAR_TCDM_BUS.Slave           core_dmactrl_bus[4-1:0],

    XBAR_TCDM_BUS.Slave           core_xbar_slave[NB_CORES+NB_HWACC_PORTS-1:0],

    XBAR_TCDM_BUS.Slave           core_xbar_bport_slave[N_BPORTS-1:0],

    XBAR_PERIPH_BUS.Slave         core_periph_slave[NB_CORES-1:0],

    XBAR_PERIPH_BUS.Slave         core_eu_direct_link[NB_CORES-1:0], //Event Unit direct link from periph demux

    XBAR_PERIPH_BUS.Master        hwacc_cfg_master,

    input logic [3:0]             hwacc_events_i,

    // CLUSTER BUS SIGNALS
    AXI_BUS.Slave                 data_slave,

    AXI_BUS.Master                data_master,

    AXI_BUS.Master                dma2ddr_master,
    
    AXI_BUS.Master                wei_dma_master,

    // JTAG BUS SIGNALS
    AXI_BUS.Slave                 jtag_slave,

    output logic [RM_SIZE-1:0]    rm_o,
    output logic [WM_SIZE-1:0]    wm_o,

    output logic                  LS_o,
    output logic                  HS_o,

    //CKGATE BUS
    CLKGATE_CONFIG_BUS.Master     clkgate_bus,

    // TO TCDM (SRAM +SCM)
    TCDM_BANK_MEM_BUS.Master      tcdm_bus_sram_master[NB_TCDM_BANKS-1:0],
    TCDM_BANK_MEM_BUS.Master      tcdm_bus_sram_master_bport[NB_TCDM_BANKS-1:0],

    TCDM_BANK_MEM_BUS.Master      tcdm_bus_scm_master[NB_TCDM_BANKS-1:0],

    input logic                   tcdm_enable,

    output logic                  busy_o,

    // Control ports
    ICACHE_CTRL_UNIT_BUS.Master         IC_ctrl_unit_bus[NB_CACHE_BANKS],
    L0_CTRL_UNIT_BUS.Master             L0_ctrl_unit_bus[NB_CORES]
);

    genvar i;

    logic [NB_TCDM_BANKS-1:0]           enable_req_pipe;
    logic [NB_TCDM_BANKS-1:0]           enable_resp_pipe;

    logic [NB_CORES-1:0]                s_term_event;

    logic s_per2axi_busy;
    logic s_axi2per_busy;
    logic s_axi2mem_busy;
    logic s_dmac_busy;

    assign busy_o = s_per2axi_busy | s_axi2per_busy | s_axi2mem_busy | s_dmac_busy;


   //********************************************************
   //***************** SIGNALS DECLARATION ******************
   //********************************************************
    // EXTBUS - AXI2MEM SIGNALS
    AXI_BUS
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH)
    )
    s_ext_tcdm_bus();

    // PER2AXI - EXT BUS SIGNALS
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

    // CLUSTER BUS - AXI2PER SIGNALS
    AXI_BUS
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH)
    )
    s_ext_mperiph_bus();

    XBAR_TCDM_BUS
      s_ext_xbar_bus[NB_DMAS-1:0]();

    XBAR_TCDM_BUS
      s_dma_xbar_bus[NB_DMAS-1:0]();

    // XBAR - SLAVE PERIPHERALS BUS SIGNALS
    XBAR_PERIPH_BUS
      s_xbar_speriph_bus[NB_SPERIPHS-1:0]();

    // EXT - XBAR PERIPHS BUS SIGNALS
    XBAR_TCDM_BUS
      s_mperiph_xbar_bus[`NB_MPERIPHS-1:0]();

    // MMU CONFIGURATION SIGNALS (from peripheral unit)
    MMU_CONFIG_BUS
      s_mmu_bus();

    // bus connections from MMUs to cluster interconnect
    // with translated addresses
    XBAR_TCDM_BUS
      s_trans_dma_xbar_bus  [NB_DMAS-1:0]                (),
      s_trans_ext_xbar_bus  [NB_DMAS-1:0]                (),
      s_trans_core_xbar_bus [NB_CORES+NB_HWACC_PORTS-1:0]();

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
        .clk_i         ( clk_i             ),
        .rst_ni        ( rst_ni            ),
        .test_en_i     ( test_mode_i       ),

        .cluster_id_i  ( cluster_id_i      ),

        .data_slave    ( s_core_ext_bus    ),

        .dma_slave     ( s_dma_ext_bus     ), //unconnected

        .ext_slave     ( data_slave        ), //from uplcluster

        .jtag_slave    ( jtag_slave        ), //from uplcluster

        .tcdm_master   ( s_ext_tcdm_bus    ),

        .periph_master ( s_ext_mperiph_bus ),

        .ext_master    ( data_master       ),

        .wei_dma_master    ( wei_dma_master       )
    );

    //********************************************************
    //************************ AXI2MEM ***********************
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

        .tcdm_master(s_ext_xbar_bus),

        .busy_o(s_axi2mem_busy)
    );

    //********************************************************
    //************************ AXI2PER ***********************
    //********************************************************
    axi2per_wrap
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH)
    )
    axi2per_wrap_i
    (
        .clk_i(clk_i),
        .rst_ni(rst_ni),

        .axi_slave(s_ext_mperiph_bus),

        .periph_master(s_mperiph_xbar_bus[`NB_MPERIPHS-1]),

        .busy_o(s_axi2per_busy)
    );

    //********************************************************
    //************************ PER2AXI ***********************
    //********************************************************

    per2axi_wrap
    #(
        .NB_CORES       (4),
        .PER_ADDR_WIDTH (32),
        .PER_ID_WIDTH   (NB_CORES+NB_MPERIPHS),
        .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH (AXI_DATA_WIDTH),
        .AXI_USER_WIDTH (AXI_USER_WIDTH),
        .AXI_ID_WIDTH   (4) //IGOR FIXES: was AXI_ID_WIDTH aka 6
    )
    per2axi_wrap_i
    (
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        .periph_slave(s_xbar_speriph_bus[`SPER_EXT_ID]),
        .axi_master(s_core_ext_bus),
        .busy_o(s_per2axi_busy)
    );

    //********************************************************
    //************************* DMAC *************************
    //********************************************************
    logic [4-1:0]                s_term_event_int;
    assign s_term_event = s_term_event_int[NB_CORES-1:0]; // workaround for a warning: Port size (4) does not match connection size (2) for port 'term_event_o'.
    
    dmac_wrap
    #(
        .NB_CORES       ( 4                ), //FIXME, cores are actually 2 but changing this parameter to 2 will get errors.
        .AXI_ADDR_WIDTH ( AXI_ADDR_WIDTH   ),
        .AXI_DATA_WIDTH ( AXI_DATA_WIDTH   ),
        .AXI_ID_WIDTH   ( AXI_ID_WIDTH     ),
        .AXI_USER_WIDTH ( AXI_USER_WIDTH   ),

        // Bits used to address the TCDM
        .TCDM_ADD_WIDTH ( TCDM_ADD_WIDTH   ),
        //main CLuster paramters
        .DATA_WIDTH     ( DATA_WIDTH       ),
        .ADDR_WIDTH     ( ADDR_WIDTH       ),
        .BE_WIDTH       ( BE_WIDTH         )
    )
    dmac_wrap_i
    (
        .clk_i          ( clk_i            ),
        .rst_ni         ( rst_ni           ),        
        .test_mode_i    ( test_mode_i      ),
        .term_event_o   ( s_term_event_int ),
        .busy_o         ( s_dmac_busy      ),
        
        .ctrl_slave     ( core_dmactrl_bus ),

        .tcdm_master    ( s_dma_xbar_bus   ),

        .ext_master     ( dma2ddr_master   )
    );

    //********************************************************
    //*************** CLUSTER INTERCONNECT *******************
    //********************************************************
    
    cluster_interconnect_wrap
    #(
        .NB_CORES           ( NB_CORES        ),
        .NB_HWACC_PORTS     ( NB_HWACC_PORTS  ),
        .NB_DMAS            ( NB_DMAS         ),
        .NB_MPERIPHS        ( NB_MPERIPHS     ),
        .NB_TCDM_BANKS      ( NB_TCDM_BANKS   ),
        .NB_SPERIPHS        ( NB_SPERIPHS     ),

        .DATA_WIDTH         ( DATA_WIDTH      ),
        .ADDR_WIDTH         ( ADDR_WIDTH      ),
        .BE_WIDTH           ( BE_WIDTH        ),

        .TEST_SET_BIT       ( TEST_SET_BIT    ),
        .ADDR_MEM_WIDTH     ( ADDR_MEM_WIDTH  ),
        .ADDR_SRAM_WIDTH    ( ADDR_SRAM_WIDTH ),
        .ADDR_SCM_WIDTH     ( ADDR_SCM_WIDTH  ),

        .LOG_CLUSTER        ( LOG_CLUSTER     ),
        .PE_ROUTING_LSB     ( PE_ROUTING_LSB  ),
        .PE_ROUTING_MSB     ( PE_ROUTING_MSB  ),
        .N_BPORTS           ( N_BPORTS        ),
        .NPF                (       NPF       ),
        .N_ROW              (      N_ROW      ),
        .N_COL              (      N_COL      )
    )
    cluster_interconnect_wrap_i
    (
        .clk_i              ( clk_i                               ),
        .clk_fast_i         ( clk_fast_i                          ),
        .rst_ni             ( rst_ni                              ),
      
        .core_tcdm_slave        ( s_trans_core_xbar_bus               ),
        .core_tcdm_bport_slave  (core_xbar_bport_slave              ), // deve essere corretta facendo passare il bus nel MMU
        .core_periph_slave  ( core_periph_slave                   ),
        .ext_slave          ( s_trans_ext_xbar_bus                ),
        .dma_slave          ( s_trans_dma_xbar_bus                ),
        .mperiph_slave          ( s_mperiph_xbar_bus[NB_MPERIPHS-1:0] ),

        .tcdm_sram_master       ( tcdm_bus_sram_master                ), // to memories
        .tcdm_sram_master_bport ( tcdm_bus_sram_master_bport          ), // to memories
        .tcdm_scm_master        ( tcdm_bus_scm_master                 ), // to memories

        .speriph_master     ( s_xbar_speriph_bus                  ),
        .enable_req_pipe_i  ( enable_req_pipe                     ),
        .enable_resp_pipe_i ( enable_resp_pipe                    )
    );

    //********************************************************
    //************** CLUSTER PERIPHERALS *********************
    //********************************************************

   cluster_peripherals
   #(
       .NB_CORES       ( NB_CORES       ),
       .NB_SPERIPHS    ( NB_SPERIPHS    ),
       .NB_CACHE_BANKS ( NB_CACHE_BANKS ),
       .NB_TCDM_BANKS  ( NB_TCDM_BANKS  ),
       .NB_HWACC_PORTS ( NB_HWACC_PORTS ),
       .RM_SIZE        ( RM_SIZE        ),
       .WM_SIZE        ( WM_SIZE        )
   )
   cluster_peripherals_i
   (

      .clk_i(clk_i),
      .rst_ni(rst_ni),

      .ext_events_i(ext_events_i),
      .dma_events_i(s_term_event),
      .en_sa_boot_i(en_sa_boot_i),
      .fetch_en_i(fetch_en_i),
      .ready_to_shutdown_i(ready_to_shutdown_i),

      .addr_tran_en_o(addr_tran_en_o),

      .speriph_slave(s_xbar_speriph_bus[NB_SPERIPHS-2:0]),

      .core_eu_direct_link (core_eu_direct_link),

      .hwacc_cfg_master(hwacc_cfg_master),
      .hwacc_events_i(hwacc_events_i),

      .eoc_o(eoc_o),
      .return_o(return_o),
      
      .fetch_enable_reg_o(fetch_enable_reg_o),
      .IRQ_o(IRQ_o),
      .NMIRQ_o(NMIRQ_o),
      .enable_req_pipe_o (enable_req_pipe),
      .enable_resp_pipe_o (enable_resp_pipe) ,

      .clkgate_bus(clkgate_bus),

      .mmu_bus(s_mmu_bus),

      // SRAM SPEED REGULATION --> TCDM
      .rm_o   (rm_o),
      .wm_o   (wm_o),

      .LS_o   (LS_o),
      .HS_o   (HS_o),

      .IC_ctrl_unit_bus     ( IC_ctrl_unit_bus ),
      .L0_ctrl_unit_bus     ( L0_ctrl_unit_bus )
   );

   //********************************************************
   //***************** MMUs *********************************
   //********************************************************

   mmu_wrap
   #(
       .NB_CORES(NB_CORES+NB_HWACC_PORTS),
       .NB_DMAS(NB_DMAS)
   )
   mmu_wrap_i
   (
      .clk_i(clk_i),
      .rst_ni(rst_ni),

      .tcdm_enable(tcdm_enable),

      .mmu_slave(s_mmu_bus),

      .core_xbar_slave(core_xbar_slave),

      .dma_xbar_slave(s_dma_xbar_bus),

      .ext_xbar_slave(s_ext_xbar_bus),

      .core_xbar_master(s_trans_core_xbar_bus),

      .dma_xbar_master(s_trans_dma_xbar_bus),

      .ext_xbar_master(s_trans_ext_xbar_bus)
   );

endmodule
