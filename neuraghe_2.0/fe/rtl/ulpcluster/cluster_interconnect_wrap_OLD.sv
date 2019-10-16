////////////////////////////////////////////////////////////////////////////////
// Company:        Multitherman Laboratory @ DEIS - University of Bologna     //
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Davide Rossi - davide.rossi@unibo.it                       //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
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
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "ulpsoc_defines.sv"

module cluster_interconnect_wrap
#(
    parameter NB_CORES        = 8,
    parameter NB_HWACC_PORTS  = 4,
    parameter NB_DMAS         = 4,
    parameter NB_MPERIPHS     = 1,
    parameter NB_TCDM_BANKS   = 16,
    parameter NB_SPERIPHS     = 3,
    
    parameter N_BPORTS        = 4, //32
    
    parameter DATA_WIDTH_A      = 64,
    parameter DATA_WIDTH      = 32,
    parameter ADDR_WIDTH      = 32,
    parameter BE_WIDTH_A        = DATA_WIDTH_A/8,
    parameter BE_WIDTH        = DATA_WIDTH/8,

    //TCDM PARAMETERS
    parameter TEST_SET_BIT    = 20,
   // parameter ADDR_MEM_WIDTH  = 11,
    parameter ADDR_SRAM_WIDTH_A = 12,
    parameter ADDR_SRAM_WIDTH_B = 13,
 //   parameter ADDR_SCM_WIDTH  = 8,
    
    parameter LOG_CLUSTER     = 5,
    parameter PE_ROUTING_LSB  = 16,
    parameter PE_ROUTING_MSB  = 19
)
(
    input logic                          clk_i,
    input logic                          clk_fast_i,
    input logic                          rst_ni,

    XBAR_TCDM_BUS.Slave                  hwce_tcdm_slave[N_BPORTS-1:0],

  //  XBAR_TCDM_BUS.Slave                  core_tcdm_slave[NB_CORES+NB_HWACC_PORTS-1:0], //unused

    XBAR_PERIPH_BUS.Slave                core_periph_slave[NB_CORES-1:0],

  //  XBAR_TCDM_BUS.Slave                  ext_slave[NB_DMAS-1:0],

    XBAR_TCDM_BUS.Slave                  dma_slave[NB_DMAS-1:0], //FIXME IGOR --> check NB_CORES depend ASK DAVIDE

    XBAR_TCDM_BUS.Slave                  mperiph_slave[NB_MPERIPHS-1:0],

 //   TCDM_BANK_MEM_BUS.Master             tcdm_scm_master[NB_TCDM_BANKS-1:0],
    TCDM_BANK_MEM_BUS_64BIT.Master       tcdm_sram_master[NB_TCDM_BANKS-1:0],
    TCDM_BANK_MEM_BUS.Master             tcdm_sram_master_bport[NB_TCDM_BANKS-1:0],

    XBAR_PERIPH_BUS.Master               speriph_master[NB_SPERIPHS-1:0],

    input logic [NB_TCDM_BANKS-1:0]      enable_req_pipe_i,
    input logic [NB_TCDM_BANKS-1:0]      enable_resp_pipe_i
);
   localparam DMAPORTS_64BIT = NB_DMAS/2;
   // DMA --> LOGARITHMIC INTERCONNECT BUS SIGNALS
   logic [DMAPORTS_64BIT-1:0][DATA_WIDTH_A-1:0]              s_dma_bus_wdata;
   logic [DMAPORTS_64BIT-1:0][ADDR_WIDTH-1:0]              s_dma_bus_add;
   logic [DMAPORTS_64BIT-1:0]                              s_dma_bus_req;
   logic [DMAPORTS_64BIT-1:0]                              s_dma_bus_wen;
   logic [DMAPORTS_64BIT-1:0][BE_WIDTH-1:0]                s_dma_bus_be;
   logic [DMAPORTS_64BIT-1:0]                              s_dma_bus_gnt;
   logic [DMAPORTS_64BIT-1:0][DATA_WIDTH_A-1:0]              s_dma_bus_r_rdata;
   logic [DMAPORTS_64BIT-1:0]                              s_dma_bus_r_valid;

   // MASTER PRTIPHERALS --> PERIPHERAL INTERCONNECT BUS SIGNALS
   logic [NB_MPERIPHS-1:0][DATA_WIDTH-1:0]            s_mperiph_bus_wdata;
   logic [NB_MPERIPHS-1:0][ADDR_WIDTH-1:0]            s_mperiph_bus_add;
   logic [NB_MPERIPHS-1:0]                            s_mperiph_bus_req;
   logic [NB_MPERIPHS-1:0]                            s_mperiph_bus_wen;
   logic [NB_MPERIPHS-1:0][BE_WIDTH-1:0]              s_mperiph_bus_be;
   logic [NB_MPERIPHS-1:0]                            s_mperiph_bus_gnt;
   logic [NB_MPERIPHS-1:0]                            s_mperiph_bus_r_opc;
   logic [NB_MPERIPHS-1:0][DATA_WIDTH-1:0]            s_mperiph_bus_r_rdata;
   logic [NB_MPERIPHS-1:0]                            s_mperiph_bus_r_valid;
/*
   // DEMUX --> LOGARITHMIC INTERCONNECT BUS SIGNALS
   logic [NB_CORES+NB_HWACC_PORTS-1:0][DATA_WIDTH-1:0] s_core_tcdm_bus_wdata;
   logic [NB_CORES+NB_HWACC_PORTS-1:0][ADDR_WIDTH-1:0] s_core_tcdm_bus_add;
   logic [NB_CORES+NB_HWACC_PORTS-1:0]                 s_core_tcdm_bus_req;
   logic [NB_CORES+NB_HWACC_PORTS-1:0]                 s_core_tcdm_bus_wen;
   logic [NB_CORES+NB_HWACC_PORTS-1:0][BE_WIDTH-1:0]   s_core_tcdm_bus_be;
   logic [NB_CORES+NB_HWACC_PORTS-1:0]                 s_core_tcdm_bus_gnt;
   logic [NB_CORES+NB_HWACC_PORTS-1:0][DATA_WIDTH-1:0] s_core_tcdm_bus_r_rdata;
   logic [NB_CORES+NB_HWACC_PORTS-1:0]                 s_core_tcdm_bus_r_valid;
*/
   // DEMUX --> LOGARITHMIC INTERCONNECT BUS SIGNALS BPORT
   logic [N_BPORTS-1:0][DATA_WIDTH-1:0] hwce_tcdm_bus_wdata;
   logic [N_BPORTS-1:0][ADDR_WIDTH-1:0] hwce_tcdm_bus_add;
   logic [N_BPORTS-1:0]                 hwce_tcdm_bus_req;
   logic [N_BPORTS-1:0]                 hwce_tcdm_bus_wen;
   logic [N_BPORTS-1:0][BE_WIDTH-1:0]   hwce_tcdm_bus_be;
   logic [N_BPORTS-1:0]                 hwce_tcdm_bus_gnt;
   logic [N_BPORTS-1:0][DATA_WIDTH-1:0] hwce_tcdm_bus_r_rdata;
   logic [N_BPORTS-1:0]                 hwce_tcdm_bus_r_valid;

   // DEMUX -->  PERIPHERAL INTERCONNECT BUS SIGNALS
   logic [NB_CORES-1:0][ADDR_WIDTH-1:0]               s_core_periph_bus_add;
   logic [NB_CORES-1:0]                               s_core_periph_bus_req;
   logic [NB_CORES-1:0][DATA_WIDTH-1:0]               s_core_periph_bus_wdata;
   logic [NB_CORES-1:0]                               s_core_periph_bus_wen;
   logic [NB_CORES-1:0][BE_WIDTH-1:0]                 s_core_periph_bus_be;
   logic [NB_CORES-1:0]                               s_core_periph_bus_gnt;
   logic [NB_CORES-1:0]                               s_core_periph_bus_r_opc;
   logic [NB_CORES-1:0]                               s_core_periph_bus_r_valid;
   logic [NB_CORES-1:0][DATA_WIDTH-1:0]               s_core_periph_bus_r_rdata;

   // LOGARITHMIC INTERCONNECT --> SRAM TCDM BUS SIGNALS
   logic [NB_TCDM_BANKS-1:0][DATA_WIDTH_A-1:0]          s_tcdm_bus_sram_wdata;
   logic [NB_TCDM_BANKS-1:0][ADDR_SRAM_WIDTH_A-1:0]     s_tcdm_bus_sram_add;
   logic [NB_TCDM_BANKS-1:0]                          s_tcdm_bus_sram_req;
   logic [NB_TCDM_BANKS-1:0]                          s_tcdm_bus_sram_wen;
   logic [NB_TCDM_BANKS-1:0][BE_WIDTH_A-1:0]            s_tcdm_bus_sram_be;
   logic [NB_TCDM_BANKS-1:0][DATA_WIDTH_A-1:0]          s_tcdm_bus_sram_rdata;
   
   // LOGARITHMIC INTERCONNECT --> SRAM TCDM BUS SIGNALS BPORT
   logic [NB_TCDM_BANKS-1:0][DATA_WIDTH-1:0]          s_tcdm_bus_sramb_wdata;
   logic [NB_TCDM_BANKS-1:0][ADDR_SRAM_WIDTH_B-1:0]     s_tcdm_bus_sramb_add;
   logic [NB_TCDM_BANKS-1:0]                          s_tcdm_bus_sramb_req;
   logic [NB_TCDM_BANKS-1:0]                          s_tcdm_bus_sramb_wen;
   logic [NB_TCDM_BANKS-1:0][BE_WIDTH-1:0]            s_tcdm_bus_sramb_be;
   logic [NB_TCDM_BANKS-1:0][DATA_WIDTH-1:0]          s_tcdm_bus_sramb_rdata;
/*
   // LOGARITHMIC INTERCONNECT --> SCM TCDM BUS SIGNALS
   logic [NB_TCDM_BANKS-1:0][DATA_WIDTH-1:0]          s_tcdm_bus_scm_wdata;
   logic [NB_TCDM_BANKS-1:0][ADDR_SCM_WIDTH-1:0]      s_tcdm_bus_scm_add;
   logic [NB_TCDM_BANKS-1:0]                          s_tcdm_bus_scm_req;
   logic [NB_TCDM_BANKS-1:0]                          s_tcdm_bus_scm_wen;
   logic [NB_TCDM_BANKS-1:0][BE_WIDTH-1:0]            s_tcdm_bus_scm_be;
   logic [NB_TCDM_BANKS-1:0][DATA_WIDTH-1:0]          s_tcdm_bus_scm_rdata;
   */
   // PERIPHERAL INTERCONNECT INTERCONNECT --> SLAVE PERIPHERALS BUS SIGNALS
   logic [NB_SPERIPHS-1:0][DATA_WIDTH-1:0]            s_speriph_bus_wdata;
   logic [NB_SPERIPHS-1:0][ADDR_WIDTH-1:0]            s_speriph_bus_add;
   logic [NB_SPERIPHS-1:0]                            s_speriph_bus_req;
   logic [NB_SPERIPHS-1:0]                            s_speriph_bus_wen;
   logic [NB_SPERIPHS-1:0][BE_WIDTH-1:0]              s_speriph_bus_be;
   logic [NB_SPERIPHS-1:0][NB_CORES+NB_MPERIPHS-1:0]  s_speriph_bus_id;
   logic [NB_SPERIPHS-1:0]                            s_speriph_bus_gnt;
   logic [NB_SPERIPHS-1:0]                            s_speriph_bus_r_opc;
   logic [NB_SPERIPHS-1:0][NB_CORES+NB_MPERIPHS-1:0]  s_speriph_bus_r_id;
   logic [NB_SPERIPHS-1:0][DATA_WIDTH-1:0]            s_speriph_bus_r_rdata;
   logic [NB_SPERIPHS-1:0]                            s_speriph_bus_r_valid;

   //********************************************************
   //****** BINDING INTERFACES TO INTERNAL BUS SINGALS ******
   //********************************************************
   genvar i;

   generate

      for (i=0; i<NB_CORES; i++)

      begin : CORE_PERIPH_BIND
         assign s_core_periph_bus_add[i]      =  core_periph_slave[i].add;
         assign s_core_periph_bus_req[i]      =  core_periph_slave[i].req;
         assign s_core_periph_bus_wdata[i]    =  core_periph_slave[i].wdata;
         assign s_core_periph_bus_wen[i]      =  core_periph_slave[i].wen;
         assign s_core_periph_bus_be[i]       =  core_periph_slave[i].be;

         assign core_periph_slave[i].gnt      =  s_core_periph_bus_gnt[i];
         assign core_periph_slave[i].r_opc    =  s_core_periph_bus_r_opc[i];
         assign core_periph_slave[i].r_valid  =  s_core_periph_bus_r_valid[i];
         assign core_periph_slave[i].r_rdata  =  s_core_periph_bus_r_rdata[i];
      end // block: CORE_PERIPH_BIND

   endgenerate
/*
   generate

      for (i=0; i<NB_CORES+NB_HWACC_PORTS; i++)

      begin : CORE_TCDM_BIND
         assign s_core_tcdm_bus_add[i]      = core_tcdm_slave[i].add;
         assign s_core_tcdm_bus_req[i]      = core_tcdm_slave[i].req;
         assign s_core_tcdm_bus_wdata[i]    = core_tcdm_slave[i].wdata;
         assign s_core_tcdm_bus_wen[i]      = core_tcdm_slave[i].wen;
         assign s_core_tcdm_bus_be[i]       = core_tcdm_slave[i].be;

         assign core_tcdm_slave[i].gnt      = s_core_tcdm_bus_gnt[i];
         assign core_tcdm_slave[i].r_valid  = s_core_tcdm_bus_r_valid[i];
         assign core_tcdm_slave[i].r_rdata  = s_core_tcdm_bus_r_rdata[i];
      end // block: CORE_TCDM_BIND

   endgenerate
   */
   generate

      for (i=0; i<N_BPORTS; i++) //32

      begin : CORE_TCDM_BPORT_BIND
         assign hwce_tcdm_bus_add[i]      = hwce_tcdm_slave[i].add;
         assign hwce_tcdm_bus_req[i]      = hwce_tcdm_slave[i].req;
         assign hwce_tcdm_bus_wdata[i]    = hwce_tcdm_slave[i].wdata;
         assign hwce_tcdm_bus_wen[i]      = hwce_tcdm_slave[i].wen;
         assign hwce_tcdm_bus_be[i]       = hwce_tcdm_slave[i].be;

         assign hwce_tcdm_slave[i].gnt      = hwce_tcdm_bus_gnt[i];
         assign hwce_tcdm_slave[i].r_valid  = hwce_tcdm_bus_r_valid[i];
         assign hwce_tcdm_slave[i].r_rdata  = hwce_tcdm_bus_r_rdata[i];

         assign hwce_tcdm_slave[i].r_opc      = '0;
      end // block: CORE_TCDM_BIND

   endgenerate
/*
   generate

      for (i=0; i<4; i++)
      begin : AXI2MEM_BIND
         assign s_dma_bus_add[i]      = ext_slave[i].add;
         assign s_dma_bus_req[i]      = ext_slave[i].req;
         assign s_dma_bus_wdata[i]    = ext_slave[i].wdata;
         assign s_dma_bus_wen[i]      = ext_slave[i].wen;
         assign s_dma_bus_be[i]       = ext_slave[i].be;

         assign ext_slave[i].gnt      = s_dma_bus_gnt[i];
         assign ext_slave[i].r_valid  = s_dma_bus_r_valid[i];
         assign ext_slave[i].r_rdata  = s_dma_bus_r_rdata[i];
      end

   endgenerate
*/
   generate

      for (i=0; i<DMAPORTS_64BIT; i++)  //from 32 bit ports to 64bit ports
      begin : DMAS_BIND
         assign s_dma_bus_add   [i] = dma_slave[i*2].add;
         assign s_dma_bus_req   [i] = dma_slave[i*2].req;
         assign s_dma_bus_wdata [i] = {dma_slave[i*2+1].wdata,dma_slave[i*2].wdata};
         assign s_dma_bus_wen   [i] = dma_slave[i*2].wen;
         assign s_dma_bus_be    [i] = {dma_slave[i*2+1].be,dma_slave[i*2].be};

         assign dma_slave[i*2   ].gnt     = s_dma_bus_gnt[i];
         assign dma_slave[i*2+1 ].gnt     = s_dma_bus_gnt[i];
         
         assign dma_slave[i*2   ].r_valid = s_dma_bus_r_valid[i];
         assign dma_slave[i*2+1 ].r_valid = s_dma_bus_r_valid[i];
         
         assign dma_slave[i*2   ].r_rdata = s_dma_bus_r_rdata[i][31:0];
         assign dma_slave[i*2+1 ].r_rdata = s_dma_bus_r_rdata[i][63:32];

         assign dma_slave[i*2   ].r_opc      = '0;
         assign dma_slave[i*2+1 ].r_opc      = '0;
      end
   endgenerate

   generate

      for (i=0; i<NB_MPERIPHS; i++)

      begin : MPERIPHS_BIND
         assign s_mperiph_bus_add[i]      = mperiph_slave[i].add;
         assign s_mperiph_bus_req[i]      = mperiph_slave[i].req;
         assign s_mperiph_bus_wdata[i]    = mperiph_slave[i].wdata;
         assign s_mperiph_bus_wen[i]      = mperiph_slave[i].wen;
         assign s_mperiph_bus_be[i]       = mperiph_slave[i].be;

         assign mperiph_slave[i].gnt      = s_mperiph_bus_gnt[i];
         assign mperiph_slave[i].r_opc    = s_mperiph_bus_r_opc[i];
         assign mperiph_slave[i].r_valid  = s_mperiph_bus_r_valid[i];
         assign mperiph_slave[i].r_rdata  = s_mperiph_bus_r_rdata[i];
      end // block: MPERIPHS_BIND

   endgenerate

   generate
      for (i=0; i<NB_TCDM_BANKS; i++)
      begin : TCDM_BANKS_BIND

         assign tcdm_sram_master[i].req   = s_tcdm_bus_sram_req   [i];
         assign tcdm_sram_master[i].add   = s_tcdm_bus_sram_add   [i];
         assign tcdm_sram_master[i].wen   = s_tcdm_bus_sram_wen   [i];
         assign tcdm_sram_master[i].wdata = s_tcdm_bus_sram_wdata [i];
         assign tcdm_sram_master[i].be    = s_tcdm_bus_sram_be    [i];
         assign s_tcdm_bus_sram_rdata[i]  = tcdm_sram_master[i].rdata;
/*
         assign tcdm_scm_master[i].req   = s_tcdm_bus_scm_req   [i];
         assign tcdm_scm_master[i].add   = s_tcdm_bus_scm_add   [i];
         assign tcdm_scm_master[i].wen   = s_tcdm_bus_scm_wen   [i];
         assign tcdm_scm_master[i].wdata = s_tcdm_bus_scm_wdata [i];
         assign tcdm_scm_master[i].be    = s_tcdm_bus_scm_be    [i];
         assign s_tcdm_bus_scm_rdata[i]  = tcdm_scm_master[i].rdata;
        */ 
      end // block: TCDM_BANKS_BIND
   endgenerate
   
   generate
      for (i=0; i<NB_TCDM_BANKS; i++)
      begin : TCDM_BANKS_BIND_BPORT

         assign tcdm_sram_master_bport[i].req   = s_tcdm_bus_sramb_req   [i];
         assign tcdm_sram_master_bport[i].add   = s_tcdm_bus_sramb_add   [i];
         assign tcdm_sram_master_bport[i].wen   = s_tcdm_bus_sramb_wen   [i];
         assign tcdm_sram_master_bport[i].wdata = s_tcdm_bus_sramb_wdata [i];
         assign tcdm_sram_master_bport[i].be    = s_tcdm_bus_sramb_be    [i];
         assign s_tcdm_bus_sramb_rdata[i]  = tcdm_sram_master_bport[i].rdata;
         
      end // block: TCDM_BANKS_BPORT
   endgenerate


   generate
      for (i=0; i<NB_SPERIPHS; i++)
      begin : SPERIPHS_BIND
         assign speriph_master[i].add       = s_speriph_bus_add[i];
         assign speriph_master[i].req       = s_speriph_bus_req[i];
         assign speriph_master[i].wdata     = s_speriph_bus_wdata[i];
         assign speriph_master[i].wen       = s_speriph_bus_wen[i];
         assign speriph_master[i].be        = s_speriph_bus_be[i];
         assign speriph_master[i].id        = s_speriph_bus_id[i];

         assign s_speriph_bus_gnt[i]        = speriph_master[i].gnt;
         assign s_speriph_bus_r_id[i]       = speriph_master[i].r_id;
         assign s_speriph_bus_r_opc[i]      = speriph_master[i].r_opc;
         assign s_speriph_bus_r_valid[i]    = speriph_master[i].r_valid;
         assign s_speriph_bus_r_rdata[i]    = speriph_master[i].r_rdata;
      end // block: SPERIPHS_BIND
   endgenerate
    
    
    
    //-***************************************************************
   //-*********** XBAR INTERCONNECT TO TCDM FROM EXT/AXI  ***********
   //-***************************************************************
   
    tcdm_xbar
    #(
      .N_MASTERS        ( 2                ),
      .N_SLAVES         ( 32               ),

      //FRONT END PARAMS
      .ADDR_WIDTH      ( ADDR_WIDTH        ),
      .DATA_WIDTH      ( 64                ),
      .BE_WIDTH        ( BE_WIDTH          ),
      .ADDR_SRAM_WIDTH ( ADDR_SRAM_WIDTH_A ),
      .LSB_ADDR        ( 15                )
    )
    dma_tcdm_xbar_i
    (
      // ---------------- MASTER CH0+CH1 SIDE  --------------------------
      .data_req_i          (  s_dma_bus_req      ), 
      .data_add_i          (  s_dma_bus_add      ), 
      .data_wen_i          (  s_dma_bus_wen      ), 
      .data_wdata_i        (  s_dma_bus_wdata    ), 
      .data_be_i           (  s_dma_bus_be       ),  
      .data_gnt_o          (  s_dma_bus_gnt      ),  
      .data_r_valid_o      (  s_dma_bus_r_valid  ),
      .data_r_rdata_o      (  s_dma_bus_r_rdata  ), 

      // ---------------- MM_SIDE -------------------------- 
      .data_req_SRAM_o     (  s_tcdm_bus_sram_req    ),
      .data_add_SRAM_o     (  s_tcdm_bus_sram_add    ),
      .data_wen_SRAM_o     (  s_tcdm_bus_sram_wen    ),
      .data_wdata_SRAM_o   (  s_tcdm_bus_sram_wdata  ),
      .data_be_SRAM_o      (  s_tcdm_bus_sram_be     ),
      .data_r_rdata_SRAM_i (  s_tcdm_bus_sram_rdata  ), 

      .clk                 (  clk_i              ),
      .rst_n               (  rst_ni                  )
    );
      
   
   //-***************************************************************
   //-*********** XBAR INTERCONNECT TO TCDM PORT B ***********
   //-***************************************************************
   
   localparam N_MASTERS = N_BPORTS; // 32;
   
    tcdm_xbar
    #(
      .N_MASTERS       ( N_MASTERS         ),
      .N_SLAVES        ( NB_TCDM_BANKS     ),
      .ADDR_WIDTH      ( ADDR_WIDTH        ),
      .DATA_WIDTH      ( DATA_WIDTH        ),
      .BE_WIDTH        ( BE_WIDTH          ),
      .ADDR_SRAM_WIDTH ( ADDR_SRAM_WIDTH_B ),
      .G_SIZE          ( 4                 )
    )
    hwce_tcdm_xbar
    (
      // ---------------- MASTER CH0+CH1 SIDE  --------------------------
      .data_req_i          (  hwce_tcdm_bus_req     [N_MASTERS - 1:0]  ),
      .data_add_i          (  hwce_tcdm_bus_add     [N_MASTERS - 1:0]  ),
      .data_wen_i          (  hwce_tcdm_bus_wen     [N_MASTERS - 1:0]  ),
      .data_wdata_i        (  hwce_tcdm_bus_wdata   [N_MASTERS - 1:0]  ),
      .data_be_i           (  hwce_tcdm_bus_be      [N_MASTERS - 1:0]  ),
      .data_gnt_o          (  hwce_tcdm_bus_gnt     [N_MASTERS - 1:0]  ),  
      .data_r_valid_o      (  hwce_tcdm_bus_r_valid [N_MASTERS - 1:0]  ),
      .data_r_rdata_o      (  hwce_tcdm_bus_r_rdata [N_MASTERS - 1:0]  ), 

      // ---------------- MM_SIDE -------------------------- 

      .data_req_SRAM_o     (  s_tcdm_bus_sramb_req    ),
      .data_add_SRAM_o     (  s_tcdm_bus_sramb_add    ),
      .data_wen_SRAM_o     (  s_tcdm_bus_sramb_wen    ),
      .data_wdata_SRAM_o   (  s_tcdm_bus_sramb_wdata  ),
      .data_be_SRAM_o      (  s_tcdm_bus_sramb_be     ),
      .data_r_rdata_SRAM_i (  s_tcdm_bus_sramb_rdata  ), 

      .clk                 (  clk_fast_i              ),
      .rst_n               (  rst_ni                  )
    );
   
   
   
   
   
   
   //********************************************************
   //******* LOGARITHMIC INTERCONNECT TO PERIPHERALS ********
   //********************************************************
    XBAR_PE
    #(
        .N_CH0            ( NB_CORES             ),
        .N_CH1            ( NB_MPERIPHS          ),
        .N_SLAVE          ( NB_SPERIPHS          ),
        .ID_WIDTH         ( NB_CORES+NB_MPERIPHS ),
        .PE_LSB           ( 0                    ),
        .PE_MSB           ( ADDR_WIDTH-1         ),

        .LOG_CLUSTER      ( LOG_CLUSTER          ),
        .ADDR_WIDTH       ( ADDR_WIDTH           ),
        .DATA_WIDTH       ( DATA_WIDTH           ),
        .BE_WIDTH         ( BE_WIDTH             ),
        .PE_ROUTING_LSB   ( PE_ROUTING_LSB       ),
        .PE_ROUTING_MSB   ( PE_ROUTING_MSB       )
    )
    xbar_pe_inst
    (
        .clk              ( clk_i),
        .rst_n            ( rst_ni),

        //.CLUSTER_ID(cluster_id),
        .CLUSTER_ID       ( 5'b00000),

        .data_req_i       ( {s_mperiph_bus_req,     s_core_periph_bus_req}     ),
        .data_add_i       ( {s_mperiph_bus_add,     s_core_periph_bus_add}     ),
        .data_wen_i       ( {s_mperiph_bus_wen,     s_core_periph_bus_wen}     ),
        .data_wdata_i     ( {s_mperiph_bus_wdata,   s_core_periph_bus_wdata}   ),
        .data_be_i        ( {s_mperiph_bus_be,      s_core_periph_bus_be}      ),
        .data_gnt_o       ( {s_mperiph_bus_gnt,     s_core_periph_bus_gnt}     ),
        .data_r_valid_o   ( {s_mperiph_bus_r_valid, s_core_periph_bus_r_valid} ),
        .data_r_rdata_o   ( {s_mperiph_bus_r_rdata, s_core_periph_bus_r_rdata} ),
        .data_r_opc_o     ( {s_mperiph_bus_r_opc,   s_core_periph_bus_r_opc}   ),

        .data_req_o       ( s_speriph_bus_req                                  ),
        .data_add_o       ( s_speriph_bus_add                                  ),
        .data_wen_o       ( s_speriph_bus_wen                                  ),
        .data_wdata_o     ( s_speriph_bus_wdata                                ),
        .data_be_o        ( s_speriph_bus_be                                   ),
        .data_ID_o        ( s_speriph_bus_id                                   ),
        .data_gnt_i       ( s_speriph_bus_gnt                                  ),
        .data_r_rdata_i   ( s_speriph_bus_r_rdata                              ),
        .data_r_valid_i   ( s_speriph_bus_r_valid                              ),
        .data_r_ID_i      ( s_speriph_bus_r_id                                 ),
        .data_r_opc_i     ( s_speriph_bus_r_opc                                )
    );

endmodule
