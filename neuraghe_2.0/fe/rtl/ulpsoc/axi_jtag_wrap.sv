`include "ulpsoc_defines.sv"

module axi_jtag_wrap
#(
    parameter AXI_ADDRESS_WIDTH = 32,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ID_WIDTH      = 16,
    parameter AXI_USER_WIDTH    = 10
)
(
    input  logic              tck_i,
    input  logic              trst_ni,
    input  logic              tms_i,
    input  logic              td_i,
    output logic              td_o,

    input  logic              clk_i,
    input  logic              rst_ni,

    output logic              test_mode_o,
    output logic              fll_bypass_soc_o,
    output logic              fll_bypass_cluster_o,
    output logic              use_one_fll_o,
    output logic              use_fll_soc_o,
    output logic              use_fll_cluster_o,
    output logic              enable_clk_xor_o,
    output logic              xtal_disable_o,
    output logic              enable_clk_out_o,
    output logic        [1:0] clk_out_sel_o,
    output logic              scan_compress_mode_o,
    output logic              soc_rst_inhibit_o,
    output logic              cluster_rst_inhibit_o,
    AXI_BUS.Master            jtag_master
);

   logic [95:0]          axireg_i;
   logic [95:0]          axireg_o;

   logic [13:0]          confreg_o;


   // tap
   logic                 s_shift_dr;
   logic                 s_pause_dr;
   logic                 s_update_dr;
   logic                 s_capture_dr;

   logic                 axireg_sel;
   logic                 confreg_sel;
   logic                 scan_i;
   logic                 axiscan_o;
   logic                 confscan_o;


    // Top module
    adbg_axionly_top
    #(
        .AXI_ADDR_WIDTH(AXI_ADDRESS_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH)
    )
    dbg_module_i
    (
        // JTAG signals
        .tck_i(tck_i),
        .tdi_i(scan_i),
        .tdo_o(s_debug_tdo),
        .trstn_i(trst_ni),

        // TAP states
        .shift_dr_i(s_shift_dr),
        .pause_dr_i(s_pause_dr),
        .update_dr_i(s_update_dr),
        .capture_dr_i(s_capture_dr),

        // Instructions
        .debug_select_i(axireg_sel),

        .axi_aclk(clk_i),
        .axi_aresetn(rst_ni),

        .axi_master_aw_valid(jtag_master.aw_valid),
        .axi_master_aw_addr(jtag_master.aw_addr),
        .axi_master_aw_prot(jtag_master.aw_prot),
        .axi_master_aw_region(jtag_master.aw_region),
        .axi_master_aw_len(jtag_master.aw_len),
        .axi_master_aw_size(jtag_master.aw_size),
        .axi_master_aw_burst(jtag_master.aw_burst),
        .axi_master_aw_lock(jtag_master.aw_lock),
        .axi_master_aw_cache(jtag_master.aw_cache),
        .axi_master_aw_qos(jtag_master.aw_qos),
        .axi_master_aw_id(jtag_master.aw_id),
        .axi_master_aw_user(jtag_master.aw_user),
        .axi_master_aw_ready(jtag_master.aw_ready),

        .axi_master_ar_valid(jtag_master.ar_valid),
        .axi_master_ar_addr(jtag_master.ar_addr),
        .axi_master_ar_prot(jtag_master.ar_prot),
        .axi_master_ar_region(jtag_master.ar_region),
        .axi_master_ar_len(jtag_master.ar_len),
        .axi_master_ar_size(jtag_master.ar_size),
        .axi_master_ar_burst(jtag_master.ar_burst),
        .axi_master_ar_lock(jtag_master.ar_lock),
        .axi_master_ar_cache(jtag_master.ar_cache),
        .axi_master_ar_qos(jtag_master.ar_qos),
        .axi_master_ar_id(jtag_master.ar_id),
        .axi_master_ar_user(jtag_master.ar_user),
        .axi_master_ar_ready(jtag_master.ar_ready),

        .axi_master_w_valid(jtag_master.w_valid),
        .axi_master_w_data(jtag_master.w_data),
        .axi_master_w_strb(jtag_master.w_strb),
        .axi_master_w_user(jtag_master.w_user),
        .axi_master_w_last(jtag_master.w_last),
        .axi_master_w_ready(jtag_master.w_ready),

        .axi_master_r_valid(jtag_master.r_valid),
        .axi_master_r_data(jtag_master.r_data),
        .axi_master_r_resp(jtag_master.r_resp),
        .axi_master_r_last(jtag_master.r_last),
        .axi_master_r_id(jtag_master.r_id),
        .axi_master_r_user(jtag_master.r_user),
        .axi_master_r_ready(jtag_master.r_ready),

        .axi_master_b_valid(jtag_master.b_valid),
        .axi_master_b_resp(jtag_master.b_resp),
        .axi_master_b_id(jtag_master.b_id),
        .axi_master_b_user(jtag_master.b_user),
        .axi_master_b_ready(jtag_master.b_ready)
    );

    // jtag tap controller
    tap_top tap_top_i
    (
        .tms_i(tms_i), 
        .tck_i(tck_i), 
        .rst_ni(trst_ni), 
        .td_i(td_i), 
        .td_o(td_o), 

        .shift_dr_o(s_shift_dr),
        .update_dr_o(s_update_dr),
        .capture_dr_o(s_capture_dr),

        .axireg_sel_o(axireg_sel),
        .bbmuxreg_sel_o(),
        .clkgatereg_sel_o(),
        .confreg_sel_o(confreg_sel),
        .testmodereg_sel_o(),
        .bistreg_sel_o(),

        .scan_in_o(scan_i),

        .axireg_out_i(s_debug_tdo),
        .bbmuxreg_out_i(1'b0),
        .clkgatereg_out_i(1'b0),
        .confreg_out_i(confscan_o),
        .testmodereg_out_i(1'b0),
        .bistreg_out_i(1'b0)
    ); 

    // pulp configuration register
    jtagreg
    #(
        .JTAGREGSIZE(14),
        .SYNC(0)
    )
    confreg
    (
        .clk_i(tck_i),
        .rst_ni(trst_ni),
        .enable_i(confreg_sel),
        .capture_dr_i(s_capture_dr),
        .shift_dr_i(s_shift_dr),
        .update_dr_i(s_update_dr),
        .jtagreg_in_i(14'h0), //at sys rst enable the fll
        .mode_i(1'b1),
        .scan_in_i(scan_i),
        .jtagreg_out_o(confreg_o),
        .scan_out_o(confscan_o)
    );

   assign test_mode_o           =  confreg_o[0];
   assign scan_compress_mode_o  =  confreg_o[1];
   assign fll_bypass_soc_o      =  confreg_o[2];
   assign fll_bypass_cluster_o  =  confreg_o[3];
   assign use_one_fll_o         =  confreg_o[4];
   assign use_fll_soc_o         = ~confreg_o[5];
   assign use_fll_cluster_o     = ~confreg_o[6];
   assign enable_clk_xor_o      =  confreg_o[7];
   assign xtal_disable_o        =  confreg_o[8];
   assign soc_rst_inhibit_o     =  confreg_o[9];
   assign cluster_rst_inhibit_o =  confreg_o[10];
   assign enable_clk_out_o      =  confreg_o[11];
   assign clk_out_sel_o[0]      =  confreg_o[12];
   assign clk_out_sel_o[1]      =  confreg_o[13];

endmodule // jtag_wrap
