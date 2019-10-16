`include "ulpsoc_defines.sv"

module axi_dbg_wrap
#(
    parameter AXI_ADDRESS_WIDTH = 32,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ID_WIDTH      = 16,
    parameter AXI_USER_WIDTH    = 10
)
(
    //From PULP_CHIPS
    input  logic              tck_i,
    input  logic              trst_ni,
    input  logic              tms_i,
    input  logic              td_i,
    output logic              td_o,

    input  logic              axireg_sel_i,
    input  logic              jtag_shift_dr_i,
    input  logic              jtag_update_dr_i,
    input  logic              jtag_capture_dr_i,

    // From SOC
    input  logic              clk_i,
    input  logic              rst_ni,
    AXI_BUS.Master            jtag_master
);



   // tap


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
        // JTAG signals from PULP_CHIP
        .tck_i          (tck_i   ),
        .tdi_i          (td_i    ),
        .tdo_o          (td_o    ),
        .trstn_i        (trst_ni ),

        // TAP states
        .shift_dr_i     ( jtag_shift_dr_i    ),
        .pause_dr_i     ( 1'b0               ),
        .update_dr_i    ( jtag_update_dr_i  ),
        .capture_dr_i   ( jtag_capture_dr_i ),

        // Instructions
        .debug_select_i (axireg_sel_i        ),

        .axi_aclk       (clk_i),
        .axi_aresetn    (rst_ni),

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

endmodule // jtag_axi_dbg_wrap




/*
axi_dbg_wrap 
#(
    .AXI_ADDRESS_WIDTH (),
    .AXI_DATA_WIDTH    (),
    .AXI_ID_WIDTH      (),
    .AXI_USER_WIDTH    ()
)
axi_dbg_wrap_i
(
    //From PULP_CHIP
    .tck_i              (),
    .trst_ni            (),
    .tms_i              (),
    .td_i               (),
    .td_o               (),

    .axireg_sel_i       (),
    .jtag_shift_dr_i    (),
    .jtag_update_dr_i   (),
    .jtag_capture_dr_i  (),

    // From SOC
    .clk_i              (),
    .rst_ni             (),
    .jtag_master        ()
);  */