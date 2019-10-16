////////////////////////////////////////////////////////////////////////////////
// Company:        Multitherman Laboratory @ DEIS - University of Bologna     //
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Davide Rossi - davide.rossi@unibo.it                       //
//                                                                            //
// Additional contributions by:                                               //
//                  Igor Loi - igor.loi@unibo.it                              //
//                                                                            //
//                                                                            //
// Create Date:    13/02/2013                                                 //
// Design Name:    Mia Wallace                                                //
// Module Name:    ulpcluster                                                 //
// Project Name:   Mia Wallace                                                //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    ULPSoC cluster                                             //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - (14-02-2015): Support for FLexible CLuster                 //
// Revision v0.3 - (27-03-2015): Moved LS in the SoC domain                   //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "ulpsoc_defines.sv"

module ulpcluster
#(
    //CLUSTER PARAMETERS
    parameter NB_CORES              = `NB_CORES,
    parameter NB_HWACC_PORTS        = 4,
    parameter NB_DMAS               = `NB_DMAS,
    parameter NB_MPERIPHS           = `NB_MPERIPHS,
    parameter NB_TCDM_BANKS         = `NB_TCDM_BANKS,
    parameter NB_SPERIPHS           = `NB_SPERIPHS,
    parameter BANK_SIZE             = `BANK_SIZE,

    //ICACHE PARAMETERS
    parameter NB_CACHE_BANKS        = 4,


    //CORE PARAMETERS
    parameter ROM_BOOT_ADDR         = 32'h1A000000,
    parameter BOOT_ADDR             = 32'h1C000000,
`ifdef RISCV
    parameter INSTR_RDATA_WIDTH     = 128,
`else
    parameter INSTR_RDATA_WIDTH     = 32,
`endif

    // AXI PARAMETERS
    parameter AXI_ADDR_WIDTH        = 32,
    parameter AXI_DATA_WIDTH        = 64,
    parameter AXI_USER_WIDTH        = 6,
    parameter AXI_ID_WIDTH          = 10,
    parameter DC_SLICE_BUFFER_WIDTH = 8,

    //CLUSTER MAIN PARAMETERS
    parameter DATA_WIDTH            = 32,
    parameter ADDR_WIDTH            = 32,
    parameter BE_WIDTH              = DATA_WIDTH/8,

    //MCHAN PARAMETERS
    parameter TCDM_ADD_WIDTH        = $clog2(BANK_SIZE * NB_TCDM_BANKS * 4)+1,//18, // Total bit used to address the whole TCDM ( 2^17 = 128K, TCDM SIZE = 64Kof SRAM + 8K of SCM, ADDR WIDTH = 17 bits )

    //TCDM PARAMETERS
    parameter TEST_SET_BIT          = 22, // bits used to indicate a test and set opration during a load in TCDM
    parameter ADDR_MEM_WIDTH        = $clog2(BANK_SIZE)+1, //12, // total bits used to address a BANKin TCDM (SCM+SRAM): --> FIXME  = TCDM_ADD_WIDTH - 2
    parameter ADDR_SRAM_WIDTH       = $clog2(BANK_SIZE), //11, // bits used to address a single bank in SRAM TCDM
    parameter ADDR_SCM_WIDTH        = $clog2(256), //11, //8,  // bits used to address a single bank in SCM TCDM
  
    //PERIPH PARAMETERS
    parameter PE_ROUTING_LSB        = 10, // LSB used as routing BIT in periph interco
    parameter PE_ROUTING_MSB        = 13,  // MSB used as routing BIT in periph interco
    parameter NPF            = 3 // number of parallel filters 3x3
)
(

   input logic              clk_i,
   input logic              clk_fast_i,
   input logic              clk_wmem_i,
   input logic              rst_ni,

   input  logic             tck_i,
   input  logic             tms_i,
   input  logic             trstn_i,
   input  logic             tdi_i,
   output logic             tdo_o,

`ifdef REMAP_ADDRESS
   input logic [3:0]        base_addr_i,
`endif

   input logic              test_mode_i,

   input logic              en_sa_boot_i,

   input logic [4:0]        cluster_id_i,

   input logic              fetch_en_i,
   input  logic [7:0]       ext_events_val_i,
   output logic [7:0]       ext_events_ack_o,

   output logic             eoc_o,

   output logic             busy_o,

   output logic [1:0]       return_o,

   AXI_BUS_ASYNC.Slave      data_slave,

 output logic [NB_CORES-1:0] instr_req,
 output logic [NB_CORES-1:0] [31:0] instr_addr,
 input logic [NB_CORES-1:0] instr_gnt,
 input logic [NB_CORES-1:0] instr_r_valid,
 input logic [NB_CORES-1:0] [31:0] instr_r_rdata,

   AXI_BUS_ASYNC.Master     data_master,
   
   AXI_BUS_ASYNC.Master     dma2ddr_master,
   
   AXI_BUS_ASYNC.Master           wei_dma_master,

   input  logic [10:0]      SI,
   input  logic             SE,
   output logic [10:0]      SO


`ifdef TRACE_EXECUTION
   ,
   output logic [NB_CORES*64-1:0] instr_trace_cycles_o,
   output logic [NB_CORES*32-1:0] instr_trace_instr_o,
   output logic [NB_CORES*32-1:0] instr_trace_pc_o,
   output logic [NB_CORES-1:0]    instr_trace_valid_o
`endif

);
   localparam N_ROW = 2; //`NB_HWCE_ROW;
   localparam N_COL = 2; //`NB_HWCE_COL;
   
   localparam N_BPORTS = 2**($clog2(N_ROW*2+NPF*N_COL)); // 2**($clog2(4*2+3*4))=2**($clog2(20))=2**(5)=32
   


    //********************************************************
    //***************** SIGNALS DECLARATION ******************
    //********************************************************
    logic [NB_CORES-1:0]                fetch_enable_reg_int;
    logic [NB_CORES-1:0]                fetch_en_int;
    logic                               s_addr_tran_en;
    logic                               s_rst_n;



    // CORES - XBAR TCDM BUS SIGNALS
    XBAR_TCDM_BUS
      s_core_xbar_bus[NB_CORES+NB_HWACC_PORTS-1:0]();

    // CORES - DMACTRL BUS SIGNALS
    XBAR_TCDM_BUS
      s_core_dmactrl_bus[4-1:0]();

   // CORES - Event Unit Direct BUS SIGNALS
    XBAR_PERIPH_BUS
      s_core_euctrl_bus[NB_CORES-1:0]();

    // CORES - XBAR PERIPH BUS SIGNALS
    XBAR_PERIPH_BUS
      s_core_periph_bus[NB_CORES-1:0]();

    // DATA SLAVE
    AXI_BUS
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH)
    )
    s_data_slave();

    // DATA MASTER
    AXI_BUS
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH)
    )
    s_data_master();
    
    AXI_BUS
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH)
    )
    wei_dma_cntr_master();
    
    // DATA MASTER
    AXI_BUS
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH)
    )
    s_dma2ddr_master();

AXI_BUS
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH)
    )
    s_wei_dma_master();

    // CORES INSTRUCTION BUS SIGNALS
    AXI_BUS
    #(
        .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH ),
        .AXI_DATA_WIDTH (AXI_DATA_WIDTH ),
        .AXI_ID_WIDTH   (AXI_ID_WIDTH   ),
        .AXI_USER_WIDTH (AXI_USER_WIDTH )
    )
    s_core_instr_bus();

    // HWACC configuration port
    XBAR_PERIPH_BUS
      s_hwacc_cfg_bus();

    logic [3:0]         hwacc_evt_interrupt; //FIXME FRANCESCO --> 4 bit or should be parametrizable

    XBAR_TCDM_BUS       s_hwce_xbar_bport_bus  [N_BPORTS-1:0](); // [31:0]
    TCDM_BANK_MEM_BUS   s_tcdm_bus_sram_bport  [NB_TCDM_BANKS-1:0](); 

   //----------------------------------------------------------------------//
   // Interfaces between ICache - L0 - Icache_Interco and Icache_ctrl_unit //
   //                                                                      //
   ICACHE_CTRL_UNIT_BUS  IC_ctrl_unit_bus[NB_CACHE_BANKS]();
   L0_CTRL_UNIT_BUS      L0_ctrl_unit_bus[NB_CORES]();
   //----------------------------------------------------------------------//

  // Interfaces between TCDM_INTERCO and SCM-SRAM MEMORIES
  TCDM_BANK_MEM_BUS                  s_tcdm_bus_sram[NB_TCDM_BANKS-1:0]();
  TCDM_BANK_MEM_BUS                  s_tcdm_bus_scm [NB_TCDM_BANKS-1:0]();

  // Interfaces for BBMUX Control unit and Clock Gating control unit
  CLKGATE_CONFIG_BUS                 clkgate_int_bus();



  // CLK reset, and other control signals

  logic                              s_cluster_int_busy;

  logic [1:0]                       return_int;

  logic [7:0]                        ext_events_int;

  logic [NB_CORES-1:0]               ready_to_shutdown;



   AXI_BUS
   #( 
      .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
      .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
      .AXI_ID_WIDTH(AXI_ID_WIDTH),
      .AXI_USER_WIDTH(AXI_USER_WIDTH)
   )
   jtag_axi_bus();

   CLKGATE_CONFIG_BUS               int_clkgate_ext_bus();

   logic                            tcdm_sleep;
   
   
   

`ifndef DUAL_CORE
      assign ready_to_shutdown[1]=0;
      assign instr_req[1]=0;
      assign instr_addr[1]=0;
      
      assign s_core_dmactrl_bus[1].req=0;
      assign s_core_dmactrl_bus[1].add=0;
      assign s_core_dmactrl_bus[1].wen=0;
      assign s_core_dmactrl_bus[1].wdata=0;
      assign s_core_dmactrl_bus[1].be=0;
      
      assign s_core_euctrl_bus[1].req=0;
      assign s_core_euctrl_bus[1].add=0;
      assign s_core_euctrl_bus[1].wen=0;
      assign s_core_euctrl_bus[1].wdata=0;
      assign s_core_euctrl_bus[1].be=0;
      assign s_core_euctrl_bus[1].id=0;
   
      assign s_core_periph_bus[1].req=0;
      assign s_core_periph_bus[1].add=0;
      assign s_core_periph_bus[1].wen=0;
      assign s_core_periph_bus[1].wdata=0;
      assign s_core_periph_bus[1].be=0;
      assign s_core_periph_bus[1].id=0; 

`endif





   //********************************************************
   //***************** BBMUX/CLKGATE ************************
   //********************************************************

  genvar index;

  assign busy_o = s_cluster_int_busy | (| ready_to_shutdown);

  assign fetch_en_int   = fetch_enable_reg_int;

  assign return_o = return_int;
 
  assign s_rst_n= rst_ni;


   //********************************************************
   //***************** INT ISLAND ***************************
   //********************************************************
   logic[NB_CORES-1:0] IRQ_link;
   logic[NB_CORES-1:0] NMIRQ_link;


   cluster_int_region
   #(
       .NB_CORES          ( NB_CORES           ),
       .NB_HWACC_PORTS    ( NB_HWACC_PORTS     ),
       .NB_DMAS           ( NB_DMAS            ),
       .NB_MPERIPHS       ( NB_MPERIPHS        ),
       .NB_TCDM_BANKS     ( NB_TCDM_BANKS      ),
       .NB_SPERIPHS       ( NB_SPERIPHS        ),
       // AXI PARAMETERS
       .AXI_ADDR_WIDTH    ( AXI_ADDR_WIDTH     ),
       .AXI_DATA_WIDTH    ( AXI_DATA_WIDTH     ),
       .AXI_ID_WIDTH      ( AXI_ID_WIDTH       ),
       .AXI_USER_WIDTH    ( AXI_USER_WIDTH     ),

       .NB_CACHE_BANKS    ( NB_CACHE_BANKS     ),

       //MCHAN tcdm parameter
       .TCDM_ADD_WIDTH    ( TCDM_ADD_WIDTH     ), // Total bit used to address the whole TCDM minus 3 bits (because uses 64bit data aka 2 tcdm ports)

       //CLUSTER MAIN PARAMETERS
       .DATA_WIDTH        ( DATA_WIDTH         ),
       .ADDR_WIDTH        ( ADDR_WIDTH         ),
       .BE_WIDTH          ( BE_WIDTH           ),

       //TCDM PARAMETERS
       .TEST_SET_BIT      ( TEST_SET_BIT       ), // bits used to indicate a test and set opration during a load in TCDM
       .ADDR_MEM_WIDTH    ( ADDR_MEM_WIDTH     ), // total bits used to address a BANKin TCDM (SCM+SRAM): --> FIXME  = TCDM_ADD_WIDTH - 2
       .ADDR_SRAM_WIDTH   ( ADDR_SRAM_WIDTH    ), // bits used to address a single bank in SRAM TCDM
       .ADDR_SCM_WIDTH    ( ADDR_SCM_WIDTH     ), // bits used to address a single bank in SCM TCDM
       .RM_SIZE           ( 4            ), // bits used to regulate the TCDM SRAM READ MARGIN
       .WM_SIZE           ( 4            ), // bits used to regulate the TCDM SRAM WRITE MARGIN

       //PERIPH PARAMETERS
       .LOG_CLUSTER       ( 5        ), // NOT USED RIGTH NOW
       .PE_ROUTING_LSB    ( PE_ROUTING_LSB     ), //LSB used as routing BIT in periph interco
       .PE_ROUTING_MSB    ( PE_ROUTING_MSB     ),  //MSB used as routing BIT in periph interco
       .N_BPORTS          ( N_BPORTS           ), //32

       .NPF               (        NPF          ),
       .N_ROW             (       N_ROW         ),
       .N_COL             (       N_COL         )
   )
   cluster_int_region_i
   (
      .clk_i                (clk_i             ),
      .clk_fast_i           ( clk_fast_i         ),
      .rst_ni               (s_rst_n             ),

      .test_mode_i          (test_mode_i         ),
      .cluster_id_i         (cluster_id_i        ),

      .en_sa_boot_i         (en_sa_boot_i        ),
      .ready_to_shutdown_i  (ready_to_shutdown   ),

      .busy_o               (s_cluster_int_busy  ),

      .ext_events_i         (ext_events_int      ),
      .fetch_en_i           (fetch_en_i          ),

      .eoc_o                (eoc_o               ),
      .return_o             (return_int          ),

      .fetch_enable_reg_o   (fetch_enable_reg_int),
      .addr_tran_en_o       (s_addr_tran_en      ),
      .IRQ_o                (IRQ_link            ),
      .NMIRQ_o              (NMIRQ_link          ),

      .core_dmactrl_bus     (s_core_dmactrl_bus  ),

      .core_xbar_slave       (s_core_xbar_bus     ),
      .core_xbar_bport_slave (s_hwce_xbar_bport_bus ),

      .core_periph_slave    (s_core_periph_bus   ),
      .core_eu_direct_link  (s_core_euctrl_bus   ),

      .hwacc_cfg_master     (s_hwacc_cfg_bus     ),
// ################################################################ FIXME
      //.hwacc_events_i       (hwacc_evt_interrupt ),
      .hwacc_events_i       ('0), //workaround to disable interrupt

      .data_slave           (s_data_slave        ),

      .data_master          (s_data_master       ),
      
      .wei_dma_master       (wei_dma_cntr_master       ),

      .dma2ddr_master       (s_dma2ddr_master    ),

      .jtag_slave           (jtag_axi_bus        ),

      // SRAM Speed Control for TCDM
      .rm_o                 (rm                  ),
      .wm_o                 (wm                  ),
      .LS_o                 (LS                  ),
      .HS_o                 (HS                  ),

      .clkgate_bus          (clkgate_int_bus     ),

      .tcdm_bus_scm_master  (s_tcdm_bus_scm      ),

      .tcdm_bus_sram_master (s_tcdm_bus_sram     ),

      .tcdm_bus_sram_master_bport (s_tcdm_bus_sram_bport     ),
      .tcdm_enable          ( 1'b1               ),

      //icache ctrl info
      .IC_ctrl_unit_bus     ( IC_ctrl_unit_bus   ),
      .L0_ctrl_unit_bus     ( L0_ctrl_unit_bus   )
   );



   //********************************************************
   //***************** CORE ISLANDS *************************
   //********************************************************
   //------------------------------------------------------//
   //          ██████╗ ██████╗ ██████╗ ███████╗            //
   //         ██╔════╝██╔═══██╗██╔══██╗██╔════╝            //
   //         ██║     ██║   ██║██████╔╝█████╗              //
   //         ██║     ██║   ██║██╔══██╗██╔══╝              //
   //         ╚██████╗╚██████╔╝██║  ██║███████╗            //
   //          ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝            //
   //------------------------------------------------------//
  
core_region
            #(
                .CORE_ID             ( 0                ),
                .ADDR_WIDTH          ( 32                ),
                .DATA_WIDTH          ( 32                ),
                .INSTR_RDATA_WIDTH   ( INSTR_RDATA_WIDTH ),
                .ROM_BOOT_ADDR       ( ROM_BOOT_ADDR     ),
                .BOOT_ADDR           ( BOOT_ADDR         )
            )
            core_region_i
            (
                .clk_i               (  clk_i          ),
                .rst_ni              (  s_rst_n              ),
        `ifdef REMAP_ADDRESS
                .base_addr_i         (  base_addr_i          ),
        `endif
                .init_ni             (  0             ),
                .cluster_id_i        (  cluster_id_i         ),
                .fetch_en_i          (  fetch_en_int[0]      ),
                .addr_tran_en_i      (  s_addr_tran_en       ),
                .IRQ_i               (  IRQ_link[0]          ),
                .NMIRQ_i             (  NMIRQ_link[0]        ),
                .test_mode_i         (  test_mode_i          ),
                .ready_to_shutdown_o ( ready_to_shutdown[0]  ),

                //----- INSTRUCTION CACHE BIND --------------//
                .instr_req_o         (  instr_req[0]         ),
                .instr_gnt_i         (  instr_gnt[0]         ),
                .instr_addr_o        (  instr_addr[0]        ),
                .instr_r_rdata_i     (  instr_r_rdata[0]     ),
                .instr_r_valid_i     (  instr_r_valid[0]     ),

                //----- DEBUG UNIT I$ BIND -----------------//
                .dbginf_stall_i      (  0      ),
                .dbginf_bp_o         (          ),
                .dbginf_strobe_i     (  0     ),
                .dbginf_ack_o        (         ),
                .dbginf_we_i         (  0         ),
                .dbginf_addr_i       (  0       ),
                .dbginf_data_i       (  0      ),
                .dbginf_data_o       (        ),

                // Interfaces to TCDM interco, DMA ctrl unit, PERIP interco
                .tcdm_data_master   (  //TODO    ),
                .dma_ctrl_master    (  s_core_dmactrl_bus[0] ),
                .eu_ctrl_master     (  s_core_euctrl_bus[0]  ),
                .periph_data_master (  s_core_periph_bus[0]  )

                // Execution traces (FPGA only)
`ifdef TRACE_EXECUTION
                ,
                .instr_trace_cycles_o ( instr_trace_cycles_o[((i+1)*64)-1:i*64] ),
                .instr_trace_instr_o  ( instr_trace_instr_o [((i+1)*32)-1:i*32] ),
                .instr_trace_pc_o     ( instr_trace_pc_o    [((i+1)*32)-1:i*32] ),
                .instr_trace_valid_o  ( instr_trace_valid_o [0]                 )
`endif
              );
        
   
   
   genvar iii;
   
   generate
      for (genvar iii=NB_CORES; iii<4; iii++) begin
        assign s_core_dmactrl_bus[iii].req   = 0;
        assign s_core_dmactrl_bus[iii].add   = 0;
        assign s_core_dmactrl_bus[iii].wen   = 0;
        assign s_core_dmactrl_bus[iii].wdata = 0;
        assign s_core_dmactrl_bus[iii].be    = 0;
      end
  endgenerate






XBAR_TCDM_BUS    weights_mem_bus[4-1:0]();



dmac_per_wrap
    #(
        .AXI_ADDR_WIDTH ( AXI_ADDR_WIDTH   ),
        .AXI_DATA_WIDTH ( AXI_DATA_WIDTH   ),
        .AXI_ID_WIDTH   ( AXI_ID_WIDTH     ),
        .AXI_USER_WIDTH ( AXI_USER_WIDTH   ),

        // Bits used to address the TCDM
        .MEM_ADD_WIDTH  ( TCDM_ADD_WIDTH   ),
        //main CLuster paramters
        .DATA_WIDTH     ( DATA_WIDTH       ),
        .ADDR_WIDTH     ( ADDR_WIDTH       ),
        .BE_WIDTH       ( BE_WIDTH              ),
        .BUFFER_WIDTH   ( DC_SLICE_BUFFER_WIDTH )
    )
    dmac_wei_wrap_i
    (
        .clk_dma_i      ( clk_wmem_i            ),
        .clk_axi_i      ( clk_i               ),
        .rst_ni         ( s_rst_n               ),
              
        .ctrl_slave     ( wei_dma_cntr_master   ),

        .mem_master     ( weights_mem_bus       ),

        .ext_master     ( s_wei_dma_master        )
    );




genvar m;
  generate
    for (m=0;m<2;m++)
    begin
      assign weights_mem_bus[m].gnt = 0;
      assign weights_mem_bus[m].r_valid = 0;
      assign weights_mem_bus[m].r_rdata = 0;
    end
  endgenerate









  //**********************************************
  //*************** HW ACCELERATORS **************
  //**********************************************
  //--------------------------------------------//
  //     ██╗  ██╗██╗    ██╗ ██████╗███████╗     //
  //     ██║  ██║██║    ██║██╔════╝██╔════╝     //
  //     ███████║██║ █╗ ██║██║     █████╗       //
  //     ██╔══██║██║███╗██║██║     ██╔══╝       //
  //     ██║  ██║╚███╔███╔╝╚██████╗███████╗     //
  //     ╚═╝  ╚═╝ ╚══╝╚══╝  ╚═════╝╚══════╝     //
  //--------------------------------------------//
   localparam HWCE_PORTS=NPF*N_COL+2*N_ROW
  hwce_wrap
   #(
      .N_MASTER_PORT ( HWCE_PORTS    ), //20
      .BANK_SIZE     ( BANK_SIZE            ),
      .ID_WIDTH      ( NB_CORES+NB_MPERIPHS ),
      .N_ROW         ( N_ROW                ),
      .N_COL         ( N_COL                ),
      .NPF           ( NPF           )
   )
   hwce_wrap_i
   (
      .clk_i            ( clk_i                                     ),
      .clk_fast_i       ( clk_fast_i                                    ),
      .clk_wmem_i       ( clk_wmem_i                     ),
      .rst_n            ( s_rst_n                                       ),
      .test_mode        ( test_mode_i                                   ),
      .hwacc_xbar_master( s_hwce_xbar_bport_bus [HWCE_PORTS-1:0] ), //3*4+2*4=20
      .hwacc_cfg_slave  ( s_hwacc_cfg_bus                               ),
      .weights_mem_bus  ( weights_mem_bus [3:2]),
      .evt_interrupt_o  ( hwacc_evt_interrupt[0]                        )
    );

  genvar ii, kk;
  generate
 
  
  for (kk=HWCE_PORTS; kk<N_BPORTS; kk++)  // binding to ground unsed bport bus.
  begin
    assign s_hwce_xbar_bport_bus[kk].req   = 1'b0;
    assign s_hwce_xbar_bport_bus[kk].add   = 32'b0;
    assign s_hwce_xbar_bport_bus[kk].wen   = 1'b1;
    assign s_hwce_xbar_bport_bus[kk].be    = 4'b0;
    assign s_hwce_xbar_bport_bus[kk].wdata = 32'b0;
  end
  endgenerate
  
  //assign s_hwce_xbar_bport_bus[3].req   = '0;
  //assign s_hwce_xbar_bport_bus[3].add   = '0;
  //assign s_hwce_xbar_bport_bus[3].wen   = '0;
  //assign s_hwce_xbar_bport_bus[3].be    = '0;
  //assign s_hwce_xbar_bport_bus[3].wdata = '0;

  assign hwacc_evt_interrupt[3:1] = 4'b0;


  ///////////////////////////////////////////////////////////////////////////////////
  // ███████╗██████╗  █████╗ ███╗   ███╗        ██╗    ██╗██████╗  █████╗ ██████╗  //
  // ██╔════╝██╔══██╗██╔══██╗████╗ ████║        ██║    ██║██╔══██╗██╔══██╗██╔══██╗ //
  // ███████╗██████╔╝███████║██╔████╔██║        ██║ █╗ ██║██████╔╝███████║██████╔╝ //
  // ╚════██║██╔══██╗██╔══██║██║╚██╔╝██║        ██║███╗██║██╔══██╗██╔══██║██╔═══╝  //
  // ███████║██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝██║  ██║██║  ██║██║      //
  // ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝      //
  ///////////////////////////////////////////////////////////////////////////////////

   tcdm_dp_banks_wrap
   #(
       .BANK_SIZE       ( `BANK_SIZE       ),
       .BANK_TYPE       ( "XILINX_BRAM"    ),
       .NB_BANKS        ( NB_TCDM_BANKS    )
   )
   tcdm_sram_island
   (
      .clk_a_i            ( clk_i     ),
      .clk_b_i            ( clk_fast_i     ),
      .rst_ni           ( s_rst_n           ),
      .init_ni          ( 0          ),
      .stdby_i          ( tcdm_sleep        ),
      .test_mode_i      ( test_mode_i       ),
      .rm_i             (                 ),
      .wm_i             (                 ),
      .LS_i             (                 ),
      .HS_i             (                 ),
      .tcdm_slave       ( s_tcdm_bus_sram   ),
      .tcdm_slave_b     ( s_tcdm_bus_sram_bport   )
   );




   //********************************************************
   //**************** AXI REGISTER SLICES *******************
   //********************************************************

   axi_slice_dc_slave_wrap
   #( 
       .AXI_ADDR_WIDTH  ( AXI_ADDR_WIDTH         ),
       .AXI_DATA_WIDTH  ( AXI_DATA_WIDTH         ),
       .AXI_USER_WIDTH  ( AXI_USER_WIDTH         ),
       .AXI_ID_WIDTH    ( AXI_ID_WIDTH           ),
       .BUFFER_WIDTH    ( DC_SLICE_BUFFER_WIDTH  )
   )
   data_master_slice_i
   ( 
      .clk_i            ( clk_i                  ),
      .rst_ni           ( s_rst_n                ),
      .axi_slave        ( s_data_master          ),
      .axi_master_async ( data_master            )
   );
   
   
   axi_slice_dc_slave_wrap
   #( 
       .AXI_ADDR_WIDTH  ( AXI_ADDR_WIDTH         ),
       .AXI_DATA_WIDTH  ( AXI_DATA_WIDTH         ),
       .AXI_USER_WIDTH  ( AXI_USER_WIDTH         ),
       .AXI_ID_WIDTH    ( AXI_ID_WIDTH           ),
       .BUFFER_WIDTH    ( DC_SLICE_BUFFER_WIDTH  )
   )
   dma2ddr_master_slice_i
   ( 
      .clk_i            ( clk_i                  ),
      .rst_ni           ( s_rst_n                ),
      .axi_slave        ( s_dma2ddr_master          ),
      .axi_master_async ( dma2ddr_master            )
   );



axi_slice_dc_slave_wrap
   #( 
       .AXI_ADDR_WIDTH  ( AXI_ADDR_WIDTH         ),
       .AXI_DATA_WIDTH  ( AXI_DATA_WIDTH         ),
       .AXI_USER_WIDTH  ( AXI_USER_WIDTH         ),
       .AXI_ID_WIDTH    ( AXI_ID_WIDTH           ),
       .BUFFER_WIDTH    ( DC_SLICE_BUFFER_WIDTH  )
   )
   wei2ddr_master_slice_i
   ( 
      .clk_i            ( clk_wmem_i                  ),
      .rst_ni           ( s_rst_n                ),
      .axi_slave        ( s_wei_dma_master          ),
      .axi_master_async ( wei_dma_master            )
   );


   axi_slice_dc_master_wrap
   #(
       .AXI_ADDR_WIDTH  ( AXI_ADDR_WIDTH         ),
       .AXI_DATA_WIDTH  ( AXI_DATA_WIDTH         ),
       .AXI_USER_WIDTH  ( AXI_USER_WIDTH         ),
       .AXI_ID_WIDTH    ( AXI_ID_WIDTH           ),
       .BUFFER_WIDTH    ( DC_SLICE_BUFFER_WIDTH  )
   )
   data_slave_slice_i
   (
      .clk_i            ( clk_i                  ),
      .rst_ni           ( s_rst_n                ),
      .axi_slave_async  ( data_slave             ),
      .axi_master       ( s_data_slave           )
   );


    genvar i;
    generate
        for(i=0;i<8;i++)
        begin :  edge_propagator_rx_i
            edge_propagator_rx       edge_propagator_rx_i
            (
                .clk_i   (clk_i                     ),
                .rstn_i  (s_rst_n                   ),
                .valid_i (ext_events_val_i[i]       ),
                .ack_o   (ext_events_ack_o[i]       ),
                .valid_o (ext_events_int[i]         )
            );
        end
    endgenerate
endmodule
