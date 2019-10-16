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

module ulpcluster_ls_wrap
#(
    //CLUSTER PARAMETERS
    parameter NB_CORES              = 4,
    parameter NB_HWACC_PORTS        = 4,
    parameter NB_DMAS               = 4,
    parameter NB_MPERIPHS           = 1,
    parameter NB_TCDM_BANKS         = 16,
    parameter NB_SPERIPHS           = 8,

    // AXI PARAMETERS
    parameter AXI_ADDR_WIDTH        = 32,
    parameter AXI_DATA_WIDTH        = 64,
    parameter AXI_USER_WIDTH        = 6,
    parameter AXI_STRB_WIDTH        = AXI_DATA_WIDTH/8,
    parameter AXI_ID_WIDTH          = 10,

    parameter DC_SLICE_BUFFER_WIDTH = 8
)
(

   // From ULPSoC
   input logic              clk_i,
   input logic              clk_fast_i,
   input logic              rst_ni,
   input logic              ref_clk_i,
   input logic              ref_rst_n_i,


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

   input  logic             fetch_en_i,
   input  logic [7:0]       ext_events_val_i,

   output logic             eoc_o,

   output logic             busy_o,

   output logic [1:0]       return_o,

   AXI_BUS_ASYNC.Slave      data_slave_soc,

   AXI_BUS_ASYNC.Master     instr_master_soc,

   AXI_BUS_ASYNC.Master     data_master_soc,

   input  logic [10:0]      SI,
   input  logic             SE,
   output logic [10:0]      SO,

   input  logic             CLUSTER_PMB_serial_in_i,
   input  logic [1:0]       CLUSTER_PMB_shift_en_i,
   input  logic [1:0]       CLUSTER_PMB_select_ctr_i,
   input  logic [1:0]       CLUSTER_PMB_pmbw_req_i,








   // To ULPCLUSTER
   output logic              clk_o,
   output logic              clk_fast_o,
   output logic              rst_no,
   output logic              ref_clk_o,
   output logic              ref_rst_n_o,

   output  logic             tck_o,
   output  logic             tms_o,
   output  logic             trstn_o,
   output  logic             tdi_o,
   input   logic             tdo_i,

`ifdef REMAP_ADDRESS
   output  logic [3:0]        base_addr_o,
`endif

   output logic              test_mode_o,

   output logic              en_sa_boot_o,

   output logic [4:0]        cluster_id_o,

   output logic              fetch_en_o,
   output logic [7:0]        ext_events_val_o,

   input logic               eoc_i,

   input logic               busy_i,

   input  logic [1:0]       return_i,

   AXI_BUS_ASYNC.Master     data_slave_cluster,

   AXI_BUS_ASYNC.Slave      instr_master_cluster,

   AXI_BUS_ASYNC.Slave      data_master_cluster,

   output  logic [10:0]      SI_o,
   output  logic             SE_o,
   input   logic [10:0]      SO_i,

   output logic              CLUSTER_PMB_serial_in_o,
   output logic [1:0]        CLUSTER_PMB_shift_en_o,
   output logic [1:0]        CLUSTER_PMB_select_ctr_o,
   output logic [1:0]        CLUSTER_PMB_pmbw_req_o
);



   genvar i;
   generate

   pulp_level_shifter_in lev_shifter_serial_in_o         ( .in_i(CLUSTER_PMB_serial_in_i  ) , .out_o(CLUSTER_PMB_serial_in_o       ) );
   for(i=0;i<2;i++) 
   begin : lev_shifter_CLUSTER_PMB_shift_en_o
      pulp_level_shifter_in lev_shifter_CLUSTER_PMB_shift_en_o ( .in_i(CLUSTER_PMB_shift_en_i[i]  ) , .out_o(CLUSTER_PMB_shift_en_o[i]   ) );
   end
   for(i=0;i<2;i++) 
   begin : lev_shifter_CLUSTER_PMB_select_ctr_o
      pulp_level_shifter_in lev_shifter_CLUSTER_PMB_select_ctr_o ( .in_i(CLUSTER_PMB_select_ctr_i[i]  ) , .out_o(CLUSTER_PMB_select_ctr_o[i]   ) );
   end
   for(i=0;i<2;i++) 
   begin : lev_shifter_CLUSTER_PMB_pmbw_req_o
      pulp_level_shifter_in lev_shifter_CLUSTER_PMB_pmbw_req_o( .in_i(CLUSTER_PMB_pmbw_req_i[i]  ) , .out_o(CLUSTER_PMB_pmbw_req_o[i]   ) );
   end





   //Level Shifters
   pulp_level_shifter_in lev_shifter_clk_i         ( .in_i(clk_i     ) , .out_o(clk_o       ) );
   pulp_level_shifter_in lev_shifter_clk_fast_i    ( .in_i(clk_fast_i) , .out_o(clk_fast_o  ) );
   pulp_level_shifter_in lev_shifter_rst_ni        ( .in_i(rst_ni    ) , .out_o(rst_no      ) );
   pulp_level_shifter_in lev_shifter_ref_clk_i     ( .in_i(ref_clk_i ) , .out_o(ref_clk_o   ) );
   pulp_level_shifter_in lev_shifter_ref_rst_n_o   ( .in_i(ref_rst_n_i    ) , .out_o(ref_rst_n_o      ) );

   pulp_level_shifter_in lev_shifter_tck_i         ( .in_i(tck_i     ) , .out_o(tck_o       ) );
   pulp_level_shifter_in lev_shifter_tms_i         ( .in_i(tms_i     ) , .out_o(tms_o       ) );
   pulp_level_shifter_in lev_shifter_trstn_i       ( .in_i(trstn_i   ) , .out_o(trstn_o     ) );
   pulp_level_shifter_in lev_shifter_tdi_i         ( .in_i(tdi_i     ) , .out_o(tdi_o       ) );
   
   assign tdo_o  = tdo_i;
   assign eoc_o  = eoc_i;
   assign busy_o = busy_i;

   assign return_o = return_i;

   
`ifdef REMAP_ADDRESS
   for(i=0;i<4;i++) 
   begin : lev_shifter_base_addr_i
      pulp_level_shifter_in lev_shifter_base_addr_i   ( .in_i(base_addr_i[i]  ) , .out_o(base_addr_o[i]   ) );
   end
`endif

   pulp_level_shifter_in lev_shifter_test_mode_i  ( .in_i(test_mode_i   ) , .out_o(test_mode_o   ) );
   pulp_level_shifter_in lev_shifter_en_sa_boot_i ( .in_i(en_sa_boot_i  ) , .out_o(en_sa_boot_o   ) );
   pulp_level_shifter_in lev_shifter_fetch_en_i   ( .in_i(fetch_en_i    ) , .out_o(fetch_en_o   ) );

   for(i=0;i<5;i++) 
   begin : lev_shifter_cluster_id_i
      pulp_level_shifter_in lev_shifter_cluster_id_i ( .in_i(cluster_id_i[i]  ) , .out_o(cluster_id_o[i]   ) );
   end
   
   for(i=0;i<8;i++) 
   begin : lev_shifter_ext_events_val_i
      pulp_level_shifter_in lev_shifter_ext_events_val_i ( .in_i(ext_events_val_i[i]  ) , .out_o(ext_events_val_o[i]   ) );
   end
   
   for(i=0;i<11;i++) 
   begin : lev_shifter_lev_shifter_SI
      pulp_level_shifter_in lev_shifter_SI           ( .in_i(SI[i]            ) , .out_o(SI_o[i]   ) );
   end
   pulp_level_shifter_in lev_shifter_SE           ( .in_i(SE            ) , .out_o(SE_o   ) );
   
   assign SO = SO_i;




    //AXI_INSTR_BUS
    ulpcluster_axi_master_LSIN_wrap
    #(
        .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH   ),
        .AXI_ID_WIDTH   (AXI_ID_WIDTH     ),
        .AXI_USER_WIDTH (AXI_USER_WIDTH   ),
        .AXI_DATA_WIDTH (AXI_DATA_WIDTH   ),
        .AXI_STRB_WIDTH (AXI_STRB_WIDTH   ),
        .BUFFER_WIDTH   (DC_SLICE_BUFFER_WIDTH     )
    )
    axi_master_INSTR_LS
    (
        .slave_in     (instr_master_cluster    ),
        .master_out   (instr_master_soc        )
    );

    //AXI_DATA_OUT_BUS
    ulpcluster_axi_master_LSIN_wrap
    #(
        .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH   ),
        .AXI_ID_WIDTH   (AXI_ID_WIDTH     ),
        .AXI_USER_WIDTH (AXI_USER_WIDTH   ),
        .AXI_DATA_WIDTH (AXI_DATA_WIDTH   ),
        .AXI_STRB_WIDTH (AXI_STRB_WIDTH   ),
        .BUFFER_WIDTH   (DC_SLICE_BUFFER_WIDTH     )
    )
    axi_master_DATA_OUT_LS
    (
        .slave_in     (data_master_cluster        ),
        .master_out   (data_master_soc            )
    );

    //AXI_DATA_IN_BUS
    ulpcluster_axi_slave_LSIN_wrap
    #(
        .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH   ),
        .AXI_ID_WIDTH   (AXI_ID_WIDTH     ),
        .AXI_USER_WIDTH (AXI_USER_WIDTH   ),
        .AXI_DATA_WIDTH (AXI_DATA_WIDTH   ),
        .AXI_STRB_WIDTH (AXI_STRB_WIDTH   ),
        .BUFFER_WIDTH   (DC_SLICE_BUFFER_WIDTH     )
    )
    axi_master_DATA_IN_LS
    (
        .slave_in     (data_slave_soc               ),
        .master_out   (data_slave_cluster           )
    );
   endgenerate


endmodule
