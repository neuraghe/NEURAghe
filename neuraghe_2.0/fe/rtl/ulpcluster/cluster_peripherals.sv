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
// Revision v0.2 - (27/03/2015) Removed bbmux_bus in MIA                      //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "ulpsoc_defines.sv"
`define FEATURE_DEMUX_MAPPED

module cluster_peripherals
#(
    parameter NB_CORES       = 4,
    parameter NB_MPERIPHS    = 1,
    parameter NB_CACHE_BANKS = 4,
    parameter NB_SPERIPHS    = 1,
    parameter NB_TCDM_BANKS  = 8,
    parameter NB_HWACC_PORTS = 4,
    parameter RM_SIZE        = 4,
    parameter WM_SIZE        = 4
)
(

    input logic                         clk_i,
    input logic                         rst_ni,

    input logic [7:0]                   ext_events_i,
    input logic [NB_CORES-1:0]          dma_events_i,
    input logic                         en_sa_boot_i,
    input logic                         fetch_en_i,
    input logic [NB_CORES-1:0]          ready_to_shutdown_i,

    output logic                        addr_tran_en_o,

    XBAR_PERIPH_BUS.Slave               speriph_slave[NB_SPERIPHS-2:0],
    XBAR_PERIPH_BUS.Slave               core_eu_direct_link[NB_CORES-1:0],
 
    XBAR_PERIPH_BUS.Master              hwacc_cfg_master,

    input logic [3:0]                   hwacc_events_i,
 
    output logic                        eoc_o,
    output logic [1:0]                  return_o,

    output logic [NB_CORES-1:0]         fetch_enable_reg_o, //fetch enable driven by the internal register
    output logic [NB_TCDM_BANKS-1:0]    enable_req_pipe_o,
    output logic [NB_TCDM_BANKS-1:0]    enable_resp_pipe_o,
    output logic [NB_CORES-1:0]         IRQ_o,
    output logic [NB_CORES-1:0]         NMIRQ_o,

    CLKGATE_CONFIG_BUS.Master           clkgate_bus,
    MMU_CONFIG_BUS.Master               mmu_bus,

    // SRAM SPEED REGULATION --> TCDM
    output logic [RM_SIZE-1:0]          rm_o,
    output logic [WM_SIZE-1:0]          wm_o,
    
    output logic                        LS_o,
    output logic                        HS_o,

    // Control ports
    ICACHE_CTRL_UNIT_BUS.Master         IC_ctrl_unit_bus[NB_CACHE_BANKS],
    L0_CTRL_UNIT_BUS.Master             L0_ctrl_unit_bus[NB_CORES]
);

   logic                        s_cluster_control_event;
   logic                        s_timer_event_0;
   logic                        s_timer_event_1;
   logic                        s_timer_event_2;
   logic                        s_timer_event_3;
   logic [23:0]                 s_cluster_events;

   logic [NB_CORES-1:0]         s_fetch_en_cc;
   logic [NB_CORES-1:0]         s_fetch_en_cg;

   BBMUX_CONFIG_BUS             DUMMY_bbmux_bus();

   assign s_cluster_events = {hwacc_events_i,{(16-NB_CORES){1'b0}},dma_events_i,s_timer_event_3,s_timer_event_2,s_timer_event_1,s_timer_event_0};

   assign fetch_enable_reg_o = s_fetch_en_cc & s_fetch_en_cg;


   //********************************************************
   //************ END OF COMPUTATION UNIT *******************
   //********************************************************
   cluster_control_unit 
   #(
        .PER_ID_WIDTH  ( NB_CORES+NB_MPERIPHS         ),
        .CORE_NUM      ( NB_CORES                     ),
        .RM_SIZE       ( RM_SIZE                      ),
        .WM_SIZE       ( WM_SIZE                      )
   )
   cluster_control_unit_i
   (
        .clk_i         ( clk_i                        ),
        .rst_ni        ( rst_ni                       ),

        .en_sa_boot_i  ( en_sa_boot_i                 ),
        .fetch_en_i    ( fetch_en_i                   ),

        .addr_tran_en_o( addr_tran_en_o               ),

        .speriph_slave ( speriph_slave[`SPER_EOC_ID]  ),

        .eoc_o         ( eoc_o                        ),

        // SRAM SPEED REGULATION --> TCDM
        .LS_o          ( LS_o                         ),
        .HS_o          ( HS_o                         ),
        .WM_o          ( wm_o                         ),
        .RM_o          ( rm_o                         ),

        .return_o      ( return_o                     ),
        .fetch_enable_o( s_fetch_en_cc                )
   );

   //********************************************************
   //******************** TIMER *****************************
   //********************************************************
   timer_unit 
   #(
        .PER_ID_WIDTH(NB_CORES+NB_MPERIPHS)
   )
   timer_unit_i
   (
      .clk_i(clk_i),
      .rst_ni(rst_ni),

      .event_t0_o(s_timer_event_0),
      .event_t1_o(s_timer_event_1),
      .event_t2_o(s_timer_event_2),
      .event_t3_o(s_timer_event_3),

      .speriph_slave(speriph_slave[`SPER_TIMER_ID])
   );

    //********************************************************
    //************** CLKGATE & BBMUX UNIT ********************
    //********************************************************
    event_unit 
    #(
        .NUM_CORES(NB_CORES)
    )
    event_unit_i
    (
        .clk_i                ( clk_i                ),
        .rst_ni               ( rst_ni               ),

        .ext_events_i         ( ext_events_i         ),
        .cluster_events_i     ( s_cluster_events     ),
        .ready_to_shutdown_i  ( ready_to_shutdown_i  ),
        .fetch_en_o           ( s_fetch_en_cg        ),
        .IRQ_o                ( IRQ_o                ),
        .NMIRQ_o              ( NMIRQ_o              ),
        .speriph_slave        ( speriph_slave[`SPER_BBMUX_ID]),
`ifdef FEATURE_DEMUX_MAPPED
        .event_unit_slave     ( core_eu_direct_link  ),
`endif
        .bbmux_bus            ( DUMMY_bbmux_bus      ),  // removed in MIA bbmux_bus //TODO // FIXME
        .clkgate_bus          ( clkgate_bus          )
    );

    //********************************************************
    //******************** RECONFIG. PIPESTAGES **************
    //********************************************************
    tcdm_pipe_unit
    #(
        .N_SLAVE(NB_TCDM_BANKS),
        .ID_WIDTH(NB_CORES+NB_MPERIPHS)
    )
    tcdm_pipe_unit_i
    (
        .clk_i   (clk_i),
        .rst_ni  (rst_ni),

        .speriph_slave (speriph_slave[`SPER_RPIPE_ID]),

        .enable_resp_pipe_o (enable_resp_pipe_o),
        .enable_req_pipe_o  (enable_req_pipe_o)
    );


    //********************************************************
    //******************** MMU *******************************
    //********************************************************   
    mmu_config_unit mmu_config_unit_i
    (
        .clk_i(clk_i),
        .rst_ni(rst_ni),

        .speriph_slave(speriph_slave[`SPER_MMU_ID]),

        .mmu_bus(mmu_bus)
    );
 
    //********************************************************
    //******************** icache_ctrl_unit ******************
    //********************************************************
    icache_ctrl_unit
    #(
        .NB_CACHE_BANKS(NB_CACHE_BANKS),
        .NB_CORES(NB_CORES)
    )
    icache_ctrl_unit_i
    (
        .clk_i                       (  clk_i                            ),
        .rst_ni                      (  rst_ni                           ),

        .speriph_slave               (  speriph_slave[`SPER_ICACHE_CTRL] ),
        .IC_ctrl_unit_master_if      (  IC_ctrl_unit_bus                 ),
        .L0_ctrl_unit_master_if      (  L0_ctrl_unit_bus                 )
    );
 
    //********************************************************
    //******************** HW ACC  ***************************
    //********************************************************
    generate

      if(NB_HWACC_PORTS > 0)
      begin

        assign speriph_slave[`SPER_HWACC_ID].gnt     = hwacc_cfg_master.gnt;
        assign speriph_slave[`SPER_HWACC_ID].r_rdata = hwacc_cfg_master.r_rdata;
        assign speriph_slave[`SPER_HWACC_ID].r_opc   = hwacc_cfg_master.r_opc;
        assign speriph_slave[`SPER_HWACC_ID].r_id    = hwacc_cfg_master.r_id;
        assign speriph_slave[`SPER_HWACC_ID].r_valid = hwacc_cfg_master.r_valid;
    
        assign hwacc_cfg_master.req   = speriph_slave[`SPER_HWACC_ID].req;
        assign hwacc_cfg_master.add   = speriph_slave[`SPER_HWACC_ID].add;
        assign hwacc_cfg_master.wen   = speriph_slave[`SPER_HWACC_ID].wen;
        assign hwacc_cfg_master.wdata = speriph_slave[`SPER_HWACC_ID].wdata;
        assign hwacc_cfg_master.be    = speriph_slave[`SPER_HWACC_ID].be;
        assign hwacc_cfg_master.id    = speriph_slave[`SPER_HWACC_ID].id;

      end
      else begin

        assign speriph_slave[`SPER_HWACC_ID].gnt     = 1'b1;
        assign speriph_slave[`SPER_HWACC_ID].r_rdata = 32'hdeadbeef;
        assign speriph_slave[`SPER_HWACC_ID].r_opc   = '0;

        always_ff @(posedge clk_i or negedge rst_ni)
        begin
          if (rst_ni == 1'b0) begin
            speriph_slave[`SPER_HWACC_ID].r_valid = 1'b0;
            speriph_slave[`SPER_HWACC_ID].r_id    = '0;
          end
          else begin
            speriph_slave[`SPER_HWACC_ID].r_valid = speriph_slave[`SPER_HWACC_ID].req;
            speriph_slave[`SPER_HWACC_ID].r_id    = speriph_slave[`SPER_HWACC_ID].id;
          end
        end

      end

    endgenerate


   //Event Unit stuff
`ifndef FEATURE_DEMUX_MAPPED
    genvar i;
    generate
      for(i=0;i< NB_CORES; i++)
      begin
          assign core_eu_direct_link[i].gnt      = 1'b0;
          assign core_eu_direct_link[i].r_rdata  = 32'h0000_0000;
          assign core_eu_direct_link[i].r_valid  = 1'b0;
          assign core_eu_direct_link[i].r_opc    = 1'b0;
      end
    endgenerate
`endif
endmodule // cluster_peripherals
