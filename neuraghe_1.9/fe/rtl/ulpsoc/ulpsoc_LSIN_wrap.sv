`include "ulpsoc_defines.sv"

module ulpsoc_LSIN_wrap
#(
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ID_WIDTH      = 10,
    parameter AXI_USER_WIDTH    = 6,
    parameter AXI_STRB_WIDTH    = AXI_DATA_WIDTH/8
)
(
    // FROM PULP_CHIP
    input logic                        ref_clk_i,
    input logic                        test_clk_i,
    input logic                        rst_ni,
    output logic                       xtal_disable_o,
    output logic                       test_mode_o,
    input  logic                       mode_select_i,
    input logic                        fetch_en_i,
    output logic                       eoc_o,
    output logic                       power_down_o,

    // jtag ports
    input  logic                       tck_i,
    input  logic                       trst_ni,
    input  logic                       tms_i,
    input  logic                       td_i,
    output logic                       td_o,

    input  logic [31:0]                gpio_in,
    output logic [31:0]                gpio_out,
    output logic [31:0]                gpio_dir,
    output logic [31:0] [5:0]          gpio_cfg,

    output logic [32:0]                pad_mux,
    output logic [32:0] [5:0]          pad_cfg,

    output logic                       uart_tx,
    input  logic                       uart_rx,
    output logic                       uart_rts,
    output logic                       uart_dtr,
    input  logic                       uart_cts,
    input  logic                       uart_dsr,

    input  logic                       i2c_scl_i,
    output logic                       i2c_scl_o,
    output logic                       i2c_scl_oe_o,
    input  logic                       i2c_sda_i,
    output logic                       i2c_sda_o,
    output logic                       i2c_sda_oe_o,

    input  logic [7:0]                 audio_i2s_sd_i,
    output logic                       audio_i2s_sck_o,
    output logic                       audio_i2s_ws_o,

    input  logic [1:0]                 cam_i2s_sd_i,
    output logic                       cam_i2s_sck_o,
    output logic                       cam_i2s_ws_o,

    output logic                       spi_master_clk,
    output logic                       spi_master_csn0,
    output logic                       spi_master_csn1,
    output logic                       spi_master_csn2,
    output logic                       spi_master_csn3,
    output logic [1:0]                 spi_master_mode,
    output logic                       spi_master_sdo0,
    output logic                       spi_master_sdo1,
    output logic                       spi_master_sdo2,
    output logic                       spi_master_sdo3,
    input  logic                       spi_master_sdi0,
    input  logic                       spi_master_sdi1,
    input  logic                       spi_master_sdi2,
    input  logic                       spi_master_sdi3,

    input  logic                       spi_slave_clk,
    input  logic                       spi_slave_cs,
    output logic [1:0]                 spi_slave_mode,
    output logic                       spi_slave_sdo0,
    output logic                       spi_slave_sdo1,
    output logic                       spi_slave_sdo2,
    output logic                       spi_slave_sdo3,
    input  logic                       spi_slave_sdi0,
    input  logic                       spi_slave_sdi1,
    input  logic                       spi_slave_sdi2,
    input  logic                       spi_slave_sdi3,

    input  logic [15:0]                 si,
    input  logic                        se,
    output logic [15:0]                 so,

    output logic                        fll_bypass_soc_o,
    output logic                        fll_bypass_cluster_o,
    output logic                        use_one_fll_o,
    output logic                        use_fll_soc_o,
    output logic                        use_fll_cluster_o,
    output logic                        enable_clock_xor_o,
    output logic                        clock_enable_o,        // s_clock_enable
    output logic                        enable_clk_out_o,      // s_enable_clk_out
    output logic  [1:0]                 clk_out_sel_o,         // s_clk_out_sel
    output logic                        soc_rst_inhibit_o,     // s_soc_rst_inhibit
    output logic                        cluster_rst_inhibit_o, //
    output logic                        cluster_sw_rstn_o,     //


    output logic  [7:0]                 clk_div0_o,
    output logic                        clk_div0_valid_o,
    output logic  [7:0]                 clk_div1_o,
    output logic                        clk_div1_valid_o,
    output logic  [7:0]                 clk_div2_o,
    output logic                        clk_div2_valid_o,
    output logic  [7:0]                 clk_div3_o,        // BBGEN_100M divider
    output logic                        clk_div3_valid_o ,   // BBGEN_100M divider

    output logic                        cvp_soc_pwr_req_o,
    output logic                        cvp_soc_pwr_wr_rd_o,
    output logic [28:0]                 cvp_soc_pwr_add_o,
    output logic  [7:0]                 cvp_soc_pwr_be_o,
    output logic [63:0]                 cvp_soc_pwr_w_data_o,
    input  logic                        cvp_soc_pwr_ack_i,
    input  logic                        cvp_soc_pwr_error_i,
    input  logic [63:0]                 cvp_soc_pwr_r_data_i,

    output logic                        cvp_cluster_pwr_req_o,
    output logic                        cvp_cluster_pwr_wr_rd_o,
    output logic [28:0]                 cvp_cluster_pwr_add_o,
    output logic  [7:0]                 cvp_cluster_pwr_be_o,
    output logic [63:0]                 cvp_cluster_pwr_w_data_o,
    input  logic                        cvp_cluster_pwr_ack_i,
    input  logic                        cvp_cluster_pwr_error_i,
    input  logic [63:0]                 cvp_cluster_pwr_r_data_i,

    input  logic                        rstn_sync_i,
    input  logic                        initn_sync_i,
    input  logic                        rstn_cluster_sync_i,
    input  logic                        rstn_cluster_sync_soc_i,
    input  logic                        clk_soc_i,
    input  logic                        clk_cluster_i


);

    AXI_BUS
    #(
        .AXI_ADDR_WIDTH(32),
        .AXI_DATA_WIDTH(64),
        .AXI_ID_WIDTH(10),
        .AXI_USER_WIDTH(6)
    )
    s_printf_bus();

    genvar i;

    logic                       ref_clk_i_shift;
    logic                       test_clk_i_shift;
    logic                       rst_ni_shift;
    logic                       mode_select_i_shift;
    logic                       fetch_en_i_shift;

    logic                       tck_i_shift;
    logic                       trst_ni_shift;
    logic                       tms_i_shift;
    logic                       td_i_shift;
    logic [31:0]                gpio_in_shift;
    logic                       uart_rx_shift;
    logic                       uart_cts_shift;
    logic                       uart_dsr_shift;
    logic [7:0]                 audio_i2s_sd_shift;
    logic [1:0]                 cam_i2s_sd_shift;
    logic                       spi_master_sdi0_shift;
    logic                       spi_master_sdi1_shift;
    logic                       spi_master_sdi2_shift;
    logic                       spi_master_sdi3_shift;

    logic                       spi_slave_clk_shift;
    logic                       spi_slave_cs_shift;
    logic                       spi_slave_sdi0_shift;
    logic                       spi_slave_sdi1_shift;
    logic                       spi_slave_sdi2_shift;
    logic                       spi_slave_sdi3_shift;

    logic [15:0]                si_shift;
    logic                       se_shift;

    logic                        cvp_soc_pwr_ack_i_shift;
    logic                        cvp_soc_pwr_error_i_shift;
    logic [63:0]                 cvp_soc_pwr_r_data_i_shift;

    logic                        cvp_cluster_pwr_ack_i_shift;
    logic                        cvp_cluster_pwr_error_i_shift;
    logic [63:0]                 cvp_cluster_pwr_r_data_i_shift;

    logic                        rstn_sync_i_shift;
    logic                        initn_sync_i_shift;
    logic                        rstn_cluster_sync_i_shift;
    logic                        rstn_cluster_sync_soc_i_shift;
    logic                        clk_soc_i_shift;
    logic                        clk_cluster_i_shift;


    assign s_printf_bus.aw_ready    = '0;
    assign s_printf_bus.ar_ready    = '0;
    assign s_printf_bus.w_ready     = '0;
    assign s_printf_bus.b_id        = '0;
    assign s_printf_bus.b_resp      = '0;
    assign s_printf_bus.b_valid     = '0;
    assign s_printf_bus.b_user      = '0;

    assign s_printf_bus.r_id        = '0;
    assign s_printf_bus.r_data      = '0;
    assign s_printf_bus.r_resp      = '0;
    assign s_printf_bus.r_last      = '0;
    assign s_printf_bus.r_user      = '0;
    assign s_printf_bus.r_valid     = '0;

    generate
        pulp_level_shifter_in lev_shifter_ref_clk_i      ( .out_o(ref_clk_i_shift),           .in_i(ref_clk_i)     );
        pulp_level_shifter_in lev_shifter_test_clk_i     ( .out_o(test_clk_i_shift),          .in_i(test_clk_i)    );
        pulp_level_shifter_in lev_shifter_rst_ni         ( .out_o(rst_ni_shift),              .in_i(rst_ni)        );
        pulp_level_shifter_in lev_shifter_mode_select_i  ( .out_o(mode_select_i_shift),       .in_i(mode_select_i) );
        pulp_level_shifter_in lev_shifter_fetch_en_i     ( .out_o(fetch_en_i_shift),          .in_i(fetch_en_i)    );

        pulp_level_shifter_in lev_shifter_tck_i          ( .out_o(tck_i_shift),               .in_i(tck_i)    );
        pulp_level_shifter_in lev_shifter_trst_ni        ( .out_o(trst_ni_shift),             .in_i(trst_ni)  );
        pulp_level_shifter_in lev_shifter_tms_i          ( .out_o(tms_i_shift),               .in_i(tms_i)    );
        pulp_level_shifter_in lev_shifter_td_i           ( .out_o(td_i_shift),                .in_i(td_i)     );

        for(i=0;i<32;i++)
        begin : lev_shifter_gpio_in
            pulp_level_shifter_in lev_shifter_gpio_in    ( .out_o(gpio_in_shift[i]),          .in_i(gpio_in[i]) );
        end

        pulp_level_shifter_in lev_shifter_uart_rx        ( .out_o(uart_rx_shift),             .in_i(uart_rx)    );

        pulp_level_shifter_in lev_shifter_uart_cts       ( .out_o(uart_cts_shift),            .in_i(uart_cts)   );

        //pulp_level_shifter_in lev_shifter_uart_dsr     ( .out_ouart_dsr_shift(),            .in_i(uart_dsr) );
        assign uart_dsr_shift = uart_dsr;

        pulp_level_shifter_in lev_shifter_i2c_scl_i       ( .out_o(i2c_scl_shift),              .in_i(i2c_scl_i) );
        pulp_level_shifter_in lev_shifter_i2c_sda_i       ( .out_o(i2c_sda_shift),              .in_i(i2c_sda_i) );

        for(i=0;i<8;i++)
        begin : lev_shifter_audio_i2s_sd_i
            pulp_level_shifter_in lev_shifter_audio_i2s_sd_i  ( .out_o(audio_i2s_sd_shift[i]),         .in_i(audio_i2s_sd_i[i]) );
        end

        
        pulp_level_shifter_in lev_shifter_cam_i2s_sd_i_0    ( .out_o(cam_i2s_sd_shift[0]),           .in_i(cam_i2s_sd_i[0]) );
        pulp_level_shifter_in lev_shifter_cam_i2s_sd_i_1    ( .out_o(cam_i2s_sd_shift[1]),           .in_i(cam_i2s_sd_i[1]) );

        pulp_level_shifter_in lev_shifter_spi_master_sdi0     ( .out_o(spi_master_sdi0_shift),      .in_i(spi_master_sdi0) );
        pulp_level_shifter_in lev_shifter_spi_master_sdi1     ( .out_o(spi_master_sdi1_shift),      .in_i(spi_master_sdi1) );
        pulp_level_shifter_in lev_shifter_spi_master_sdi2     ( .out_o(spi_master_sdi2_shift),      .in_i(spi_master_sdi2) );
        pulp_level_shifter_in lev_shifter_spi_master_sdi3     ( .out_o(spi_master_sdi3_shift),      .in_i(spi_master_sdi3) );


        pulp_level_shifter_in lev_shifter_spi_slave_sdi0     ( .out_o(spi_slave_sdi0_shift),      .in_i(spi_slave_sdi0) );
        pulp_level_shifter_in lev_shifter_spi_slave_sdi1     ( .out_o(spi_slave_sdi1_shift),      .in_i(spi_slave_sdi1) );
        pulp_level_shifter_in lev_shifter_spi_slave_sdi2     ( .out_o(spi_slave_sdi2_shift),      .in_i(spi_slave_sdi2) );
        pulp_level_shifter_in lev_shifter_spi_slave_sdi3     ( .out_o(spi_slave_sdi3_shift),      .in_i(spi_slave_sdi3) );

        for(i=0;i<16;i++)
        begin : lev_shifter_si
            pulp_level_shifter_in lev_shifter_si                 ( .out_o(si_shift[i]),      .in_i(si[i]) );
        end
        pulp_level_shifter_in lev_shifter_se                 ( .out_o(se_shift),      .in_i(se) );

        pulp_level_shifter_in lev_shifter_cvp_soc_pwr_ack_i       ( .out_o(cvp_soc_pwr_ack_i_shift),      .in_i(cvp_soc_pwr_ack_i) );
        pulp_level_shifter_in lev_shifter_cvp_soc_pwr_error_i     ( .out_o(cvp_soc_pwr_error_i_shift),    .in_i(cvp_soc_pwr_error_i) );
        for(i=0;i<64;i++)
        begin : lev_shifter_cvp_soc_pwr_r_data_i
            pulp_level_shifter_in lev_shifter_cvp_soc_pwr_r_data_i     ( .out_o(cvp_soc_pwr_r_data_i_shift[i]),      .in_i(cvp_soc_pwr_r_data_i[i]) );
        end

        pulp_level_shifter_in lev_shifter_cvp_cluster_pwr_ack_i       ( .out_o(cvp_cluster_pwr_ack_i_shift),      .in_i(cvp_cluster_pwr_ack_i) );
        pulp_level_shifter_in lev_shifter_cvp_cluster_pwr_error_i     ( .out_o(cvp_cluster_pwr_error_i_shift),    .in_i(cvp_cluster_pwr_error_i) );
        for(i=0;i<64;i++)
        begin : lev_shifter_cvp_cluster_pwr_r_data_i
            pulp_level_shifter_in lev_shifter_cvp_cluster_pwr_r_data_i     ( .out_o(cvp_cluster_pwr_r_data_i_shift[i]),      .in_i(cvp_cluster_pwr_r_data_i[i]) );
        end

        pulp_level_shifter_in lev_shifter_rstn_sync_i               ( .out_o(rstn_sync_i_shift),               .in_i(rstn_sync_i)             );
        pulp_level_shifter_in lev_shifter_initn_sync_i              ( .out_o(initn_sync_i_shift),              .in_i(initn_sync_i)            );
        pulp_level_shifter_in lev_shifter_rstn_cluster_sync_i       ( .out_o(rstn_cluster_sync_i_shift),       .in_i(rstn_cluster_sync_i)     );
        pulp_level_shifter_in lev_shifter_rstn_cluster_sync_soc_i   ( .out_o(rstn_cluster_sync_soc_i_shift),   .in_i(rstn_cluster_sync_soc_i) );
        pulp_level_shifter_in lev_shifter_clk_soc_i                 ( .out_o(clk_soc_i_shift),                 .in_i(clk_soc_i)               );
        pulp_level_shifter_in lev_shifter_clk_cluster_i             ( .out_o(clk_cluster_i_shift),             .in_i(clk_cluster_i)           );
    endgenerate


   // PULP INSTANCE
   ulpsoc
   #(
        .AXI_ADDR_WIDTH  (AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH  (AXI_DATA_WIDTH),
        .AXI_ID_WIDTH    (AXI_ID_WIDTH),
        .AXI_USER_WIDTH  (AXI_USER_WIDTH)
   )
   ulpsoc_i
   (
        .ref_clk_i          ( ref_clk_shift       ),
        .test_clk_i         ( test_clk_shift      ),
        .rst_ni             ( s_rstn              ),
        .xtal_disable_o     ( xtal_disable_o      ),
        .mode_select_i      ( mode_select_shift   ),
        .test_mode_o        ( test_mode_o         ),
        .fetch_en_i         ( fetch_en_shift      ),
        .eoc_o              ( eoc_o               ),
        .power_down_o       ( power_down_o        ),

        .stdout_master      ( s_printf_bus        ),

        .tck_i              ( tck_shift           ),
        .trst_ni            ( trst_n_shift        ),
        .tms_i              ( tms_shift           ),
        .td_i               ( td_i_shift          ),
        .td_o               ( td_o                ),

        .gpio_in            ( gpio_in_shift       ),
        .gpio_out           ( gpio_out            ),
        .gpio_dir           ( gpio_dir            ),
        .gpio_cfg           ( gpio_cfg            ),

        .pad_mux            ( pad_mux             ),
        .pad_cfg            ( pad_cfg             ),

        .uart_tx            ( uart_tx             ),
        .uart_rx            ( uart_rx_shift       ),
        .uart_rts           ( uart_rts            ),
        .uart_dtr           ( uart_dtr            ),
        .uart_cts           ( uart_cts_shift      ),
        .uart_dsr           ( uart_dsr_shift      ),

        .i2c_scl_i          ( i2c_scl_shift       ),
        .i2c_scl_o          ( i2c_scl_o           ),
        .i2c_scl_oe_o       ( i2c_scl_oe          ),
        .i2c_sda_i          ( i2c_sda_shift       ),
        .i2c_sda_o          ( i2c_sda_o           ),
        .i2c_sda_oe_o       ( i2c_sda_oe          ),

        .audio_i2s_sd_i     ( audio_i2s_sd_shift  ),
        .audio_i2s_sck_o    ( audio_i2s_sck_o     ),
        .audio_i2s_ws_o     ( audio_i2s_ws_o      ),

        .cam_i2s_sd_i       ( cam_i2s_sd_shift    ),
        .cam_i2s_sck_o      ( cam_i2s_sck_o       ),
        .cam_i2s_ws_o       ( cam_i2s_ws_o        ),

        .spi_master_clk     ( spi_master_clk      ),
        .spi_master_csn0    ( spi_master_csn0     ),
        .spi_master_csn1    ( spi_master_csn1     ),
        .spi_master_csn2    ( spi_master_csn2     ),
        .spi_master_csn3    ( spi_master_csn3     ),
        .spi_master_mode    ( spi_master_mode     ),
        .spi_master_sdo0    ( spi_master_sdo0     ),
        .spi_master_sdo1    ( spi_master_sdo1     ),
        .spi_master_sdo2    ( spi_master_sdo2     ),
        .spi_master_sdo3    ( spi_master_sdo3     ),
        .spi_master_sdi0    ( spi_master_sdi0_shift ),
        .spi_master_sdi1    ( spi_master_sdi1_shift ),
        .spi_master_sdi2    ( spi_master_sdi2_shift ),
        .spi_master_sdi3    ( spi_master_sdi3_shift ),

        .spi_slave_clk      ( spi_slave_clk_shift    ),
        .spi_slave_cs       ( spi_slave_cs_shift     ),
        .spi_slave_mode     ( spi_slave_mode         ),
        .spi_slave_sdo0     ( spi_slave_sdo0         ),
        .spi_slave_sdo1     ( spi_slave_sdo1         ),
        .spi_slave_sdo2     ( spi_slave_sdo2         ),
        .spi_slave_sdo3     ( spi_slave_sdo3         ),
        .spi_slave_sdi0     ( spi_slave_sdi0_shift   ),
        .spi_slave_sdi1     ( spi_slave_sdi1_shift   ),
        .spi_slave_sdi2     ( spi_slave_sdi2_shift   ),
        .spi_slave_sdi3     ( spi_slave_sdi3_shift   ),

        .si                 ( si_shift               ),
        .se                 ( se_shift               ),
        .so                 ( so                     ),

        .fll_bypass_soc_o     ( fll_bypass_soc_o      ),
        .fll_bypass_cluster_o ( fll_bypass_cluster_o  ),
        .use_one_fll_o        ( use_one_fll_o         ),
        .use_fll_soc_o        ( use_fll_soc_o         ),
        .use_fll_cluster_o    ( use_fll_cluster_o     ),
        .enable_clock_xor_o   ( enable_clock_xor_o    ),
        .clock_enable_o       ( clock_enable_o        ),
        .enable_clk_out_o     ( enable_clk_out_o      ),
        .clk_out_sel_o        ( clk_out_sel_o         ),
        .soc_rst_inhibit_o    ( soc_rst_inhibit_o     ),
        .cluster_rst_inhibit_o( cluster_rst_inhibit_o ),
        .cluster_sw_rstn_o    ( cluster_sw_rstn_o     ),

        .clk_div0_o           ( clk_div0_o            ),
        .clk_div0_valid_o     ( clk_div0_valid_o      ),
        .clk_div1_o           ( clk_div1_o            ),
        .clk_div1_valid_o     ( clk_div1_valid_o      ),
        .clk_div2_o           ( clk_div2_o            ),
        .clk_div2_valid_o     ( clk_div2_valid_o      ),
        .clk_div3_o           ( clk_div3_o            ),
        .clk_div3_valid_o     ( clk_div3_valid_o      ),

        .cvp_soc_pwr_req_o    ( cvp_soc_pwr_req_o          ),
        .cvp_soc_pwr_wr_rd_o  ( cvp_soc_pwr_wr_rd_o        ),
        .cvp_soc_pwr_add_o    ( cvp_soc_pwr_add_o          ),
        .cvp_soc_pwr_be_o     ( cvp_soc_pwr_be_o           ),
        .cvp_soc_pwr_w_data_o ( cvp_soc_pwr_w_data_o       ),
        .cvp_soc_pwr_ack_i    ( cvp_soc_pwr_ack_i_shift    ),
        .cvp_soc_pwr_error_i  ( cvp_soc_pwr_error_i_shift  ),
        .cvp_soc_pwr_r_data_i ( cvp_soc_pwr_r_data_i_shift ),

        .cvp_cluster_pwr_req_o    ( cvp_cluster_pwr_req_o    ),
        .cvp_cluster_pwr_wr_rd_o  ( cvp_cluster_pwr_wr_rd_o  ),
        .cvp_cluster_pwr_add_o    ( cvp_cluster_pwr_add_o    ),
        .cvp_cluster_pwr_be_o     ( cvp_cluster_pwr_be_o     ),
        .cvp_cluster_pwr_w_data_o ( cvp_cluster_pwr_w_data_o ),
        .cvp_cluster_pwr_ack_i    ( cvp_cluster_pwr_ack_i_shift    ),
        .cvp_cluster_pwr_error_i  ( cvp_cluster_pwr_error_i_shift  ),
        .cvp_cluster_pwr_r_data_i ( cvp_cluster_pwr_r_data_i_shift ),

        .rstn_sync_i              ( rstn_sync_i_shift               ),
        .initn_sync_i             ( initn_sync_i_shift              ),
        .rstn_cluster_sync_i      ( rstn_cluster_sync_i_shift       ),
        .rstn_cluster_sync_soc_i  ( rstn_cluster_sync_soc_i_shift   ),
        .clk_soc_i                ( clk_soc_i_shift                 ),
        .clk_cluster_i            ( clk_cluster_i_shift             )

    );

endmodule