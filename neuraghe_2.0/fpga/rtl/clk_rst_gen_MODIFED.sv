module clk_rst_gen
(
    input  logic        ref_clk_i,
    input  logic        rst_ni,
    output logic        locked,

    input  logic        clk_soc_enable_i,
    input  logic        clk_cluster_enable_i,

    output logic        rstn_sync_o,
    output logic        initn_sync_o,
    output logic        rstn_cluster_o,
    output logic        rstn_cluster_sync_soc_o,
    output logic        clk_soc_o,
    output logic        clk_cluster_o,
    output logic        clk_soc_nongated_o,
    output logic        clk_cluster_nongated_o
);

    logic s_clk_int;
    logic s_clk_gated;
    logic s_clk_nongated;
    logic s_clk_ce;
    logic s_clk_feedback_in;
    logic s_clk_feedback_out;
  
    xilinx_clock_manager clk_manager_i
    (   .clk_i         ( ref_clk_i          ),
        .clk_o         ( s_clk_nongated     ),
        .clk_out2      ( s_clk_gated        ),
        .clk_out2_ce   ( s_clk_ce           ),
        .resetn        ( rst_ni              ),
        .locked        ( locked             )
    );

    assign rstn_sync_o             = rst_ni;
    assign initn_sync_o            = rst_ni;
    assign rstn_cluster_o          = rst_ni;
    assign rstn_cluster_sync_soc_o = rst_ni;

    // clock gating - clk_soc & clk_cluster are the same clock for the moment
    // assign s_clk_ce = clk_soc_enable_i & clk_cluster_enable_i;
    always_ff @(posedge s_clk_nongated)
        s_clk_ce = clk_soc_enable_i & clk_cluster_enable_i;

    // BUFGCE bufgce_i (
    //     .I  ( s_clk_int   ),
    //     .CE ( s_clk_ce    ),
    //     .O  ( s_clk_gated )
    // );

    // BUFG bufg_i (
    //     .I  ( s_clk_int      ),
    //     .O  ( s_clk_nongated )
    // );

    assign clk_soc_o     = s_clk_gated;
    assign clk_cluster_o = s_clk_gated;
    assign clk_soc_nongated_o     = s_clk_nongated;
    assign clk_cluster_nongated_o = s_clk_nongated;

    // MMCM feedback
    assign s_clk_feedback_in = s_clk_nongated;

endmodule
