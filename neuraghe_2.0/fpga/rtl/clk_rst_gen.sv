module clk_rst_gen
(
    input  logic        ref_clk_i,
    input  logic        rst_ni,
    output logic        locked,

    input  logic        clking_axi_aclk,
    input  logic        clking_axi_aresetn,
    input  logic [10:0] clking_axi_awaddr,
    input  logic        clking_axi_awvalid,
    output logic        clking_axi_awready,
    input  logic [31:0] clking_axi_wdata,
    input  logic  [3:0] clking_axi_wstrb,
    input  logic        clking_axi_wvalid,
    output logic        clking_axi_wready,
    output logic  [1:0] clking_axi_bresp,
    output logic        clking_axi_bvalid,
    input  logic        clking_axi_bready,
    input  logic [10:0] clking_axi_araddr,
    input  logic        clking_axi_arvalid,
    output logic        clking_axi_arready,
    output logic [31:0] clking_axi_rdata,
    output logic  [1:0] clking_axi_rresp,
    output logic        clking_axi_rvalid,
    input  logic        clking_axi_rready,

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
    (
        .s_axi_aclk    ( clking_axi_aclk    ),
        .s_axi_aresetn ( clking_axi_aresetn ),
        .s_axi_awaddr  ( clking_axi_awaddr  ),
        .s_axi_awvalid ( clking_axi_awvalid ),
        .s_axi_awready ( clking_axi_awready ),
        .s_axi_wdata   ( clking_axi_wdata   ),
        .s_axi_wstrb   ( clking_axi_wstrb   ),
        .s_axi_wvalid  ( clking_axi_wvalid  ),
        .s_axi_wready  ( clking_axi_wready  ),
        .s_axi_bresp   ( clking_axi_bresp   ),
        .s_axi_bvalid  ( clking_axi_bvalid  ),
        .s_axi_bready  ( clking_axi_bready  ),
        .s_axi_araddr  ( clking_axi_araddr  ),
        .s_axi_arvalid ( clking_axi_arvalid ),
        .s_axi_arready ( clking_axi_arready ),
        .s_axi_rdata   ( clking_axi_rdata   ),
        .s_axi_rresp   ( clking_axi_rresp   ),
        .s_axi_rvalid  ( clking_axi_rvalid  ),
        .s_axi_rready  ( clking_axi_rready  ),
        .clk_i         ( ref_clk_i          ),
        .clk_o         ( s_clk_nongated     ),
        .clk_out2      ( s_clk_gated        ),
        .clk_out2_ce   ( s_clk_ce           ),
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
