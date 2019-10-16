module jtag_tap_top
(
    input  logic              tck_i,
    input  logic              trst_ni,
    input  logic              tms_i,
    input  logic              td_i,
    output logic              td_o,

    output logic              cluster_tck_o,
    output logic              cluster_trstn_o,
    output logic              cluster_tms_o,
    output logic              cluster_tdi_o,
    input  logic              cluster_tdo_i,

    input  logic              test_clk_i,
    input  logic              test_rstn_i,

    output logic              test_mode_o,
    output logic              test_mode_sel_o,
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
    output logic              force_sleep_cp1_o,
    output logic              force_sleep_cp2_o,

    output logic              pm_bbgen_bypass_o,
    output logic        [1:0] pm_bbgen_value_soc_o,
    output logic        [1:0] pm_bbgen_value_cluster_o,

   // tap
   output logic               jtag_shift_dr_o,
   output logic               jtag_update_dr_o,
   output logic               jtag_capture_dr_o,
   output logic               axireg_sel_o,

   output logic               dbg_axi_scan_in_o,
   input  logic               dbg_axi_scan_out_i
);

    logic                       scan_in;
    logic [21:0]                s_confreg;
    logic                       confscan;
    logic                       confreg_sel;
    logic                       td_o_int;
    assign dbg_axi_scan_in = scan_in;

    pulp_clock_mux2 tck_dft_bypass_i
    (
        .clk_o(cluster_tck_o),
        .clk0_i(tck_i),
        .clk1_i(test_clk_i),
        .clk_sel_i(test_mode_o)
    );

    assign cluster_trstn_o = test_mode_o ? test_rstn_i : trst_ni;
    assign cluster_tms_o = test_mode_o ? 1'b0 : tms_i;
    assign cluster_tdi_o = test_mode_o ? 1'b0 : td_o_int;

    assign td_o = test_mode_o ? td_o_int : cluster_tdo_i;


    // jtag tap controller
    tap_top tap_top_i
    (
        .tms_i                  (tms_i          ),
        .tck_i                  (tck_i          ), 
        .rst_ni                 (trst_ni        ), 
        .td_i                   (td_i           ), 
        .td_o                   (td_o_int       ), 

        .shift_dr_o             (jtag_shift_dr_o  ),
        .update_dr_o            (jtag_update_dr_o ),
        .capture_dr_o           (jtag_capture_dr_o),

        .axireg_sel_o           (axireg_sel_o   ),
        .bbmuxreg_sel_o         (               ),
        .clkgatereg_sel_o       (               ),
        .confreg_sel_o          (confreg_sel    ),
        .testmodereg_sel_o      (               ),
        .bistreg_sel_o          (               ),

        .scan_in_o              (scan_i         ),

        .axireg_out_i           (dbg_axi_scan_out_i    ),
        .bbmuxreg_out_i         (1'b0           ),
        .clkgatereg_out_i       (1'b0           ),
        .confreg_out_i          (confscan       ),
        .testmodereg_out_i      (1'b0           ),
        .bistreg_out_i          (1'b0           )
    ); 

    // pulp configuration register
    jtagreg
    #(
        .JTAGREGSIZE(22),
        .SYNC(0)
    )
    confreg
    (
        .clk_i                  ( tck_i             ),
        .rst_ni                 ( trst_ni           ),
        .enable_i               ( confreg_sel       ),
        .capture_dr_i           ( jtag_capture_dr_o ),
        .shift_dr_i             ( jtag_shift_dr_o   ),
        .update_dr_i            ( jtag_update_dr_o  ),
        .jtagreg_in_i           ( 22'h0             ), //at sys rst enable the fll
        .mode_i                 ( 1'b1              ),
        .scan_in_i              ( scan_i            ),
        .jtagreg_out_o          ( s_confreg         ),
        .scan_out_o             ( confscan          )
    );
   assign dbg_axi_scan_in_o     =  scan_i;
   assign test_mode_o           =  s_confreg[0];
   assign scan_compress_mode_o  =  s_confreg[1];
   assign fll_bypass_soc_o      =  s_confreg[2];
   assign fll_bypass_cluster_o  =  s_confreg[3];
   assign use_one_fll_o         =  s_confreg[4];
   assign use_fll_soc_o         = ~s_confreg[5];
   assign use_fll_cluster_o     = ~s_confreg[6];
   assign enable_clk_xor_o      =  s_confreg[7];
   assign xtal_disable_o        =  s_confreg[8];
   assign soc_rst_inhibit_o     =  s_confreg[9];
   assign cluster_rst_inhibit_o =  s_confreg[10];
   assign enable_clk_out_o      =  s_confreg[11];
   assign clk_out_sel_o[0]      =  s_confreg[12];
   assign clk_out_sel_o[1]      =  s_confreg[13];
   assign force_sleep_cp1_o     =  s_confreg[14];
   assign force_sleep_cp2_o     =  s_confreg[15];
   assign pm_bbgen_bypass_o           =  s_confreg[16];
   assign pm_bbgen_value_soc_o[0]     =  s_confreg[17];
   assign pm_bbgen_value_soc_o[1]     =  s_confreg[18];
   assign pm_bbgen_value_cluster_o[0] =  s_confreg[19];
   assign pm_bbgen_value_cluster_o[1] =  s_confreg[20];
   assign test_mode_sel_o             =  s_confreg[21];

endmodule


// //  -->>   TEMPLATE   <<--   //
// jtag_tap_top jtag_tap_top_i
// (
//     .tck_i                      (      ),
//     .trst_ni                    (      ),
//     .tms_i                      (      ),
//     .td_i                       (      ),
//     .td_o                       (      ),
// 
//     .test_mode_o                (      ),
//     .fll_bypass_soc_o           (      ),
//     .fll_bypass_cluster_o       (      ),
//     .use_one_fll_o              (      ),
//     .use_fll_soc_o              (      ),
//     .use_fll_cluster_o          (      ),
//     .enable_clk_xor_o           (      ),
//     .xtal_disable_o             (      ),
//     .enable_clk_out_o           (      ),
//     .clk_out_sel_o              (      ),
//     .scan_compress_mode_o       (      ),
//     .soc_rst_inhibit_o          (      ),
//     .cluster_rst_inhibit_o      (      ),
// 
//     .jtag_shift_dr_o            (      ),
//     .jtag_update_dr_o           (      ),
//     .jtag_capture_dr_o          (      ),
//     .axireg_sel_o               (      ),
// 
//     .dbg_axi_scan_in_o          (      ),
//     .dbg_axi_scan_out_i         (      )
// );


