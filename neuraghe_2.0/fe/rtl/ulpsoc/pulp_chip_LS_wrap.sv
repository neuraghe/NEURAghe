module pulp_chip_LS_wrap
#(
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ID_WIDTH      = 10,
    parameter AXI_USER_WIDTH    = 6,
    parameter AXI_STRB_WIDTH    = AXI_DATA_WIDTH/8
)
(
    // FROM PULP_CHIP
    input  logic                       ref_clk_i,
    input  logic                       test_clk_i,
    input  logic                       rst_ni,

    input  logic                       test_mode_i,
    input  logic                       mode_select_i,
    input  logic                       fetch_en_i,
    output logic                       eoc_o,
    // jtag ports
    input  logic                       tck_i,
    input  logic                       trst_ni,
    input  logic                       tms_i,
    input  logic                       tdi_i,
    output logic                       tdo_o,

    input  logic [31:0]                gpio_in,
    output logic [31:0]                gpio_out,
    output logic [31:0]                gpio_dir,
    output logic [31:0] [5:0]          gpio_cfg,

    output logic [24:0]                pad_mux,
    output logic [24:0] [5:0]          pad_cfg,

    output logic                       uart_tx,
    input  logic                       uart_rx,
    output logic                       uart_rts,
    output logic                       uart_dtr,
    input  logic                       uart_cts,
    input  logic                       uart_dsr,

    input  logic                       i2c_scl_i_i,
    output logic                       i2c_scl_o_o,
    output logic                       i2c_scl_oe_o_o,
    input  logic                       i2c_sda_i_i,
    output logic                       i2c_sda_o_o,
    output logic                       i2c_sda_oe_o_o,

    input  logic [7:0]                 audio_i2s_sd_i,
    output logic                       audio_i2s_sck_o,
    output logic                       audio_i2s_ws_o,

    input  logic [1:0]                 cam_i2s_sd_i,
    output logic                       cam_i2s_sck_o,
    output logic                       cam_i2s_ws_o,

    output logic                       spi_master_clk,
    output logic                       spi_master_csn,
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

    input  logic [11:0]                 si,
    input  logic                        se,
    output logic [11:0]                 so,
    output logic [11:0]                 so_soc,

    output logic                        clock_enable_o,        // s_clock_enable
    output logic                        cluster_sw_rstn_o,     //

    input  logic                        jtag_shift_dr_i,
    input  logic                        jtag_update_dr_i,
    input  logic                        jtag_capture_dr_i,
    input  logic                        axireg_sel_i,
    input  logic                        axireg_tdi_i,
    output logic                        axireg_tdo_o,


    output logic                      pm_power_down_req_o,
    output logic                      pm_cluster_rst_req_o,
    output logic                      pm_wakeup_polarity_o,
    output logic                [4:0] pm_wakeup_select_o,
    output logic                [7:0] pm_busy_cycle_o,
    output logic                [7:0] pm_rst_cycle_o,
    output logic                      pm_valid_o,
    output logic                      pm_cluster_busy_o,
    input  logic                      pm_ack_i,
    input  logic                      pm_power_down_i,

    output logic                      pm_BBGEN_req_o,
    output logic [1:0]                pm_BBGEN_dat_o,
    output logic [2:0]                pm_BBGEN_sel_o,

    output logic  [7:0]                 clk_div0_data_o,
    output logic                        clk_div0_valid_o,
    input  logic                        clk_div0_ack_i,
    output logic  [7:0]                 clk_div1_data_o,
    output logic                        clk_div1_valid_o,
    input  logic                        clk_div1_ack_i,
    output logic  [7:0]                 clk_div2_data_o,
    output logic                        clk_div2_valid_o,
    input  logic                        clk_div2_ack_i,
    output logic  [7:0]                 clk_div3_data_o,        // BBGEN_100M divider
    output logic                        clk_div3_valid_o ,   // BBGEN_100M divider
    input  logic                        clk_div3_ack_i,
    output logic  [7:0]                 clk_div4_data_o,        // BBGEN_100M divider
    output logic                        clk_div4_valid_o ,   // BBGEN_100M divider
    input  logic                        clk_div4_ack_i,

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

    output logic                        cp1_pwr_req_o,
    output logic                        cp1_pwr_wr_rd_o,
    output logic [28:0]                 cp1_pwr_add_o,
    output logic  [7:0]                 cp1_pwr_be_o,
    output logic [63:0]                 cp1_pwr_w_data_o,
    input  logic                        cp1_pwr_ack_i,
    input  logic                        cp1_pwr_error_i,
    input  logic [63:0]                 cp1_pwr_r_data_i,

    output logic                        cp2_pwr_req_o,
    output logic                        cp2_pwr_wr_rd_o,
    output logic [28:0]                 cp2_pwr_add_o,
    output logic  [7:0]                 cp2_pwr_be_o,
    output logic [63:0]                 cp2_pwr_w_data_o,
    input  logic                        cp2_pwr_ack_i,
    input  logic                        cp2_pwr_error_i,
    input  logic [63:0]                 cp2_pwr_r_data_i,

    input  logic                        rstn_sync_i,
    input  logic                        initn_sync_i,
    input  logic                        rstn_cluster_sync_i,
    input  logic                        rstn_cluster_sync_soc_i,
    input  logic                        clk_soc_i,
    input  logic                        clk_cluster_i,

    input  logic                       SAFE_PMB_serial_out_i,
    output logic                       SAFE_PMB_serial_in_o,
    output logic                       SAFE_PMB_shift_en_o,
    output logic                       SAFE_PMB_select_ctr_o,
    output logic                       SAFE_PMB_pmbw_req_o,
    input  logic                       SAFE_PMB_pmbw_ack_i,





   // FROM PULP_CHIP
    output logic                       ref_clk_o,
    output logic                       test_clk_o,
    output logic                       rst_no,

    output logic                       test_mode_o,
    output logic                       mode_select_o,
    output logic                       fetch_en_o,
    input  logic                       eoc_i,

    // jtag ports
    output  logic                      tck_o,
    output  logic                      trst_no,
    output  logic                      tms_o,
    output  logic                      tdi_o,
    input   logic                      tdo_i,

    output logic [31:0]                gpio_in_o,
    input  logic [31:0]                gpio_out_i,
    input  logic [31:0]                gpio_dir_i,
    input  logic [31:0] [5:0]          gpio_cfg_i,

    input  logic [24:0]                pad_mux_i,
    input  logic [24:0] [5:0]          pad_cfg_i,

    input  logic                       uart_tx_i,
    output logic                       uart_rx_o,
    input  logic                       uart_rts_i,
    input  logic                       uart_dtr_i,
    output logic                       uart_cts_o,
    output logic                       uart_dsr_o,

    output logic                       i2c_scl_i_o,
    input  logic                       i2c_scl_o_i,
    input  logic                       i2c_scl_oe_o_i,
    output logic                       i2c_sda_i_o,
    input  logic                       i2c_sda_o_i,
    input  logic                       i2c_sda_oe_o_i,

    output logic [7:0]                 audio_i2s_sd_o,
    input  logic                       audio_i2s_sck_i,
    input  logic                       audio_i2s_ws_i,

    output logic [1:0]                 cam_i2s_sd_o,
    input  logic                       cam_i2s_sck_i,
    input  logic                       cam_i2s_ws_i,

    input  logic                       spi_master_clk_i,
    input  logic                       spi_master_csn_i,
    input  logic [1:0]                 spi_master_mode_i,
    input  logic                       spi_master_sdo0_i,
    input  logic                       spi_master_sdo1_i,
    input  logic                       spi_master_sdo2_i,
    input  logic                       spi_master_sdo3_i,
    output logic                       spi_master_sdi0_o,
    output logic                       spi_master_sdi1_o,
    output logic                       spi_master_sdi2_o,
    output logic                       spi_master_sdi3_o,

    output logic                       spi_slave_clk_o,
    output logic                       spi_slave_cs_o,
    input  logic [1:0]                 spi_slave_mode_i,
    input  logic                       spi_slave_sdo0_i,
    input  logic                       spi_slave_sdo1_i,
    input  logic                       spi_slave_sdo2_i,
    input  logic                       spi_slave_sdo3_i,
    output logic                       spi_slave_sdi0_o,
    output logic                       spi_slave_sdi1_o,
    output logic                       spi_slave_sdi2_o,
    output logic                       spi_slave_sdi3_o,

    output  logic [11:0]               si_o,
    output  logic                      se_o,
    input   logic [11:0]               so_i,
    input   logic [11:0]               so_soc_i,

    input  logic                       clock_enable_i,
    input  logic                       cluster_sw_rstn_i,

    output logic                       jtag_shift_dr_o,
    output logic                       jtag_update_dr_o,
    output logic                       jtag_capture_dr_o,
    output logic                       axireg_sel_o,
    output logic                       axireg_tdi_o,
    input  logic                       axireg_tdo_i,

    input  logic                       pm_power_down_req_i,
    input  logic                       pm_cluster_rst_req_i,
    input  logic                       pm_wakeup_polarity_i,
    input  logic  [4:0]                pm_wakeup_select_i,
    input  logic  [7:0]                pm_busy_cycle_i,
    input  logic  [7:0]                pm_rst_cycle_i,
    input  logic                       pm_valid_i,
    input  logic                       pm_cluster_busy_i,
    output logic                       pm_ack_o,
    output logic                       pm_power_down_o,

    input  logic                       pm_BBGEN_req_i,
    input  logic [1:0]                 pm_BBGEN_dat_i,
    input  logic [2:0]                 pm_BBGEN_sel_i,

    input logic  [7:0]                 clk_div0_data_i,
    input logic                        clk_div0_valid_i,
    output logic                       clk_div0_ack_o,
    input logic  [7:0]                 clk_div1_data_i,
    input logic                        clk_div1_valid_i,
    output logic                       clk_div1_ack_o,
    input logic  [7:0]                 clk_div2_data_i,
    input logic                        clk_div2_valid_i,
    output logic                       clk_div2_ack_o,
    input logic  [7:0]                 clk_div3_data_i,        // BBGEN_100M divider
    input logic                        clk_div3_valid_i,   // BBGEN_100M divider
    output logic                       clk_div3_ack_o,
    input logic  [7:0]                 clk_div4_data_i,
    input logic                        clk_div4_valid_i,
    output logic                       clk_div4_ack_o,

    input  logic                       cvp_soc_pwr_req_i,
    input  logic                       cvp_soc_pwr_wr_rd_i,
    input  logic [28:0]                cvp_soc_pwr_add_i,
    input  logic  [7:0]                cvp_soc_pwr_be_i,
    input  logic [63:0]                cvp_soc_pwr_w_data_i,
    output logic                       cvp_soc_pwr_ack_o,
    output logic                       cvp_soc_pwr_error_o,
    output logic [63:0]                cvp_soc_pwr_r_data_o,

    input logic                        cvp_cluster_pwr_req_i,
    input logic                        cvp_cluster_pwr_wr_rd_i,
    input logic [28:0]                 cvp_cluster_pwr_add_i,
    input logic  [7:0]                 cvp_cluster_pwr_be_i,
    input logic [63:0]                 cvp_cluster_pwr_w_data_i,
    output  logic                      cvp_cluster_pwr_ack_o,
    output  logic                      cvp_cluster_pwr_error_o,
    output  logic [63:0]               cvp_cluster_pwr_r_data_o,


    input  logic                       cp1_pwr_req_i,
    input  logic                       cp1_pwr_wr_rd_i,
    input  logic [28:0]                cp1_pwr_add_i,
    input  logic  [7:0]                cp1_pwr_be_i,
    input  logic [63:0]                cp1_pwr_w_data_i,
    output logic                       cp1_pwr_ack_o,
    output logic                       cp1_pwr_error_o,
    output logic [63:0]                cp1_pwr_r_data_o,

    input logic                        cp2_pwr_req_i,
    input logic                        cp2_pwr_wr_rd_i,
    input logic [28:0]                 cp2_pwr_add_i,
    input logic  [7:0]                 cp2_pwr_be_i,
    input logic [63:0]                 cp2_pwr_w_data_i,
    output  logic                      cp2_pwr_ack_o,
    output  logic                      cp2_pwr_error_o,
    output  logic [63:0]               cp2_pwr_r_data_o,


    output  logic                      rstn_sync_o,
    output  logic                      initn_sync_o,
    output  logic                      rstn_cluster_sync_o,
    output  logic                      rstn_cluster_sync_soc_o,
    output  logic                      clk_soc_o,
    output  logic                      clk_cluster_o,

    output logic                       SAFE_PMB_serial_out_o,
    input  logic                       SAFE_PMB_serial_in_i,
    input  logic                       SAFE_PMB_shift_en_i,
    input  logic                       SAFE_PMB_select_ctr_i,
    input  logic                       SAFE_PMB_pmbw_req_i,
    output logic                       SAFE_PMB_pmbw_ack_o
);

    genvar i, j;
    // FROM PULP_CHIP
    //pulp_level_shifter_out  lev_shifter_      ( .out_o(),       .in_i()       );
    //pulp_level_shifter_in   lev_shifter_      ( .out_o(),       .in_i()       );
    //pulp_level_shifter_out_multi #( .WIDTH() )  lev_shifter_      ( .out_o(),       .in_i()       );

    generate
    pulp_level_shifter_out  lev_shifter_ref_clk_i          ( .out_o(ref_clk_o),             .in_i(ref_clk_i)        );
    pulp_level_shifter_out  lev_shifter_test_clk_i         ( .out_o(test_clk_o),            .in_i(test_clk_i)       );
    pulp_level_shifter_out  lev_shifter_rst_ni             ( .out_o(rst_no),                .in_i(rst_ni)           );
    
    pulp_level_shifter_out  lev_shifter_test_mode_i        ( .out_o(test_mode_o),           .in_i(test_mode_i)      );
    pulp_level_shifter_out  lev_shifter_mode_select_i      ( .out_o(mode_select_o),         .in_i(mode_select_i)    );
    pulp_level_shifter_out  lev_shifter_fetch_en_o         ( .out_o(fetch_en_o),            .in_i(fetch_en_i)       );
    pulp_level_shifter_in   lev_shifter_eoc_o              ( .out_o(eoc_o),                 .in_i(eoc_i)            );

    pulp_level_shifter_out lev_shifter_tck_i               ( .out_o(tck_o),         .in_i(tck_i)       );
    pulp_level_shifter_out lev_shifter_trst_ni             ( .out_o(trst_no),       .in_i(trst_ni)     );
    pulp_level_shifter_out lev_shifter_tms_i               ( .out_o(tms_o),         .in_i(tms_i)       );
    pulp_level_shifter_out lev_shifter_td_i                ( .out_o(tdi_o),         .in_i(tdi_i)       );
    pulp_level_shifter_in  lev_shifter_td_o                ( .out_o(tdo_o),         .in_i(tdo_i)       );

    for(i=0;i<32;i++)
    begin : lev_shifter_gpio_in
        pulp_level_shifter_out    lev_shifter_gpio_in            ( .out_o(gpio_in_o[i]),       .in_i(gpio_in[i])       );
    end

    for(i=0;i<32;i++)
    begin : lev_shifter_gpio_out
        pulp_level_shifter_in     lev_shifter_gpio_out           ( .out_o(gpio_out[i]),        .in_i(gpio_out_i[i])    );
    end

    for(i=0;i<32;i++)
    begin : lev_shifter_gpio_dir
        pulp_level_shifter_in     lev_shifter_gpio_dir           ( .out_o(gpio_dir[i]),        .in_i(gpio_dir_i[i])    );
    end

    for(i=0;i<32;i++)
    begin : lev_shifter_gpio_cfg_reg_num
        for(j=0;j<6;j++)
        begin : lev_shifter_gpio_cfg_reg_width
            pulp_level_shifter_in lev_shifter_gpio_cfg           ( .out_o(gpio_cfg[i][j]),        .in_i(gpio_cfg_i[i][j])    );
        end
    end

    for(i=0;i<25;i++)
    begin : lev_shifter_pad_mux
        pulp_level_shifter_in lev_shifter_pad_mux           ( .out_o(pad_mux[i]),        .in_i(pad_mux_i[i])       );
    end

    for(i=0;i<25;i++)
    begin : lev_shifter_pad_cfg_reg_num
        for(j=0;j<6;j++)
        begin : lev_shifter_pad_cfg_reg_width
            pulp_level_shifter_in lev_shifter_pad_cfg           ( .out_o(pad_cfg[i][j]),        .in_i(pad_cfg_i[i][j])       );
        end
    end

    pulp_level_shifter_in  lev_shifter_uart_tx               ( .out_o(uart_tx      ),         .in_i(uart_tx_i   )       );
    pulp_level_shifter_out lev_shifter_uart_rx               ( .out_o(uart_rx_o    ),         .in_i(uart_rx     )       );
    pulp_level_shifter_in  lev_shifter_uart_rts              ( .out_o(uart_rts     ),         .in_i(uart_rts_i  )       );
    pulp_level_shifter_in  lev_shifter_uart_dtr              ( .out_o(uart_dtr     ),         .in_i(uart_dtr_i  )       );
    pulp_level_shifter_out lev_shifter_uart_cts              ( .out_o(uart_cts_o   ),         .in_i(uart_cts    )       );
    pulp_level_shifter_out lev_shifter_uart_dsr              ( .out_o(uart_dsr_o   ),         .in_i(uart_dsr    )       );

    pulp_level_shifter_out  lev_shifter_i2c_scl_i            ( .out_o(i2c_scl_i_o),          .in_i(i2c_scl_i_i)       );
    pulp_level_shifter_in   lev_shifter_i2c_scl_o            ( .out_o(i2c_scl_o_o),          .in_i(i2c_scl_o_i)       );
    pulp_level_shifter_in   lev_shifter_i2c_scl_oe_o         ( .out_o(i2c_scl_oe_o_o),       .in_i(i2c_scl_oe_o_i)    );
    pulp_level_shifter_out  lev_shifter_i2c_sda_i            ( .out_o(i2c_sda_i_o),          .in_i(i2c_sda_i_i)       );
    pulp_level_shifter_in   lev_shifter_i2c_sda_o            ( .out_o(i2c_sda_o_o),          .in_i(i2c_sda_o_i)       );
    pulp_level_shifter_in   lev_shifter_i2c_sda_oe_o         ( .out_o(i2c_sda_oe_o_o),       .in_i(i2c_sda_oe_o_i)    );
    
    for(i=0;i<8;i++)
    begin : lev_shifter_audio_i2s_sd_i
        pulp_level_shifter_out  lev_shifter_audio_i2s_sd_i            ( .out_o(audio_i2s_sd_o[i]),       .in_i(audio_i2s_sd_i[i])       );
    end
    pulp_level_shifter_in   lev_shifter_audio_i2s_sck_o   ( .out_o(audio_i2s_sck_o),       .in_i(audio_i2s_sck_i)    );
    pulp_level_shifter_in   lev_shifter_audio_i2s_ws_o    ( .out_o(audio_i2s_ws_o),        .in_i(audio_i2s_ws_i)     );
    pulp_level_shifter_out  lev_shifter_cam_i2s_sd_i_0    ( .out_o(cam_i2s_sd_o[0]),       .in_i(cam_i2s_sd_i[0])    );
    pulp_level_shifter_out  lev_shifter_cam_i2s_sd_i_1    ( .out_o(cam_i2s_sd_o[1]),       .in_i(cam_i2s_sd_i[1])    );
    
    pulp_level_shifter_in   lev_shifter_cam_i2s_sck_o     ( .out_o(cam_i2s_sck_o),        .in_i(cam_i2s_sck_i)     );
    pulp_level_shifter_in   lev_shifter_cam_i2s_ws_o      ( .out_o(cam_i2s_ws_o),         .in_i(cam_i2s_ws_i)      );

    pulp_level_shifter_in   lev_shifter_spi_master_clk      ( .out_o(spi_master_clk  ),         .in_i(spi_master_clk_i     )      );
    pulp_level_shifter_in   lev_shifter_spi_master_csn      ( .out_o(spi_master_csn  ),         .in_i(spi_master_csn_i     )      );
    pulp_level_shifter_in   lev_shifter_spi_master_mode0    ( .out_o(spi_master_mode[0] ),      .in_i(spi_master_mode_i[0] )      );
    pulp_level_shifter_in   lev_shifter_spi_master_mode1    ( .out_o(spi_master_mode[1] ),      .in_i(spi_master_mode_i[1] )      );
    pulp_level_shifter_in   lev_shifter_spi_master_sdo0     ( .out_o(spi_master_sdo0 ),         .in_i(spi_master_sdo0_i    )      ); 
    pulp_level_shifter_in   lev_shifter_spi_master_sdo1     ( .out_o(spi_master_sdo1 ),         .in_i(spi_master_sdo1_i    )      ); 
    pulp_level_shifter_in   lev_shifter_spi_master_sdo2     ( .out_o(spi_master_sdo2 ),         .in_i(spi_master_sdo2_i    )      ); 
    pulp_level_shifter_in   lev_shifter_spi_master_sdo3     ( .out_o(spi_master_sdo3 ),         .in_i(spi_master_sdo3_i    )      ); 
    pulp_level_shifter_out  lev_shifter_spi_master_sdi0     ( .out_o(spi_master_sdi0_o),        .in_i(spi_master_sdi0      )      );
    pulp_level_shifter_out  lev_shifter_spi_master_sdi1     ( .out_o(spi_master_sdi1_o),        .in_i(spi_master_sdi1      )      );
    pulp_level_shifter_out  lev_shifter_spi_master_sdi2     ( .out_o(spi_master_sdi2_o),        .in_i(spi_master_sdi2      )      );
    pulp_level_shifter_out  lev_shifter_spi_master_sdi3     ( .out_o(spi_master_sdi3_o),        .in_i(spi_master_sdi3      )      );

    pulp_level_shifter_out  lev_shifter_spi_slave_clk      ( .out_o(spi_slave_clk_o   ),      .in_i(spi_slave_clk       )      );
    pulp_level_shifter_out  lev_shifter_spi_slave_cs       ( .out_o(spi_slave_cs_o    ),      .in_i(spi_slave_cs        )      );
    pulp_level_shifter_in   lev_shifter_spi_slave_mode0    ( .out_o(spi_slave_mode[0] ),      .in_i(spi_slave_mode_i[0] )      );
    pulp_level_shifter_in   lev_shifter_spi_slave_mode1    ( .out_o(spi_slave_mode[1] ),      .in_i(spi_slave_mode_i[1] )      );
    pulp_level_shifter_in   lev_shifter_spi_slave_sdo0     ( .out_o(spi_slave_sdo0 ),         .in_i(spi_slave_sdo0_i    )      ); 
    pulp_level_shifter_in   lev_shifter_spi_slave_sdo1     ( .out_o(spi_slave_sdo1 ),         .in_i(spi_slave_sdo1_i    )      ); 
    pulp_level_shifter_in   lev_shifter_spi_slave_sdo2     ( .out_o(spi_slave_sdo2 ),         .in_i(spi_slave_sdo2_i    )      ); 
    pulp_level_shifter_in   lev_shifter_spi_slave_sdo3     ( .out_o(spi_slave_sdo3 ),         .in_i(spi_slave_sdo3_i    )      ); 
    pulp_level_shifter_out  lev_shifter_spi_slave_sdi0     ( .out_o(spi_slave_sdi0_o),        .in_i(spi_slave_sdi0      )      );
    pulp_level_shifter_out  lev_shifter_spi_slave_sdi1     ( .out_o(spi_slave_sdi1_o),        .in_i(spi_slave_sdi1      )      );
    pulp_level_shifter_out  lev_shifter_spi_slave_sdi2     ( .out_o(spi_slave_sdi2_o),        .in_i(spi_slave_sdi2      )      );
    pulp_level_shifter_out  lev_shifter_spi_slave_sdi3     ( .out_o(spi_slave_sdi3_o),        .in_i(spi_slave_sdi3      )      );

    for(i=0;i<12;i++)
    begin : lev_shifter_si
        pulp_level_shifter_out  lev_shifter_si     ( .out_o(si_o[i]),        .in_i(si[i]      )  );
    end
    pulp_level_shifter_out  lev_shifter_se         ( .out_o(se_o),            .in_i(se        )  );
    for(i=0;i<12;i++)
    begin : lev_shifter_so
        pulp_level_shifter_in  lev_shifter_so      ( .out_o(so[i]),        .in_i(so_i[i]      )  );
        pulp_level_shifter_in  lev_shifter_so_soc  ( .out_o(so_soc[i]),    .in_i(so_soc_i[i]  )  );
    end

    pulp_level_shifter_in   lev_shifter_clock_enable_o            ( .out_o(clock_enable_o        ),         .in_i(clock_enable_i        )      );
    pulp_level_shifter_in   lev_shifter_cluster_sw_rstn_o         ( .out_o(cluster_sw_rstn_o     ),         .in_i(cluster_sw_rstn_i     )      );
    
    
    pulp_level_shifter_out  lev_shifter_jtag_shift_dr_i       ( .out_o(jtag_shift_dr_o),        .in_i(jtag_shift_dr_i   )      );
    pulp_level_shifter_out  lev_shifter_jtag_update_dr_i      ( .out_o(jtag_update_dr_o),       .in_i(jtag_update_dr_i  )      );
    pulp_level_shifter_out  lev_shifter_jtag_capture_dr_i     ( .out_o(jtag_capture_dr_o),      .in_i(jtag_capture_dr_i )      );
    pulp_level_shifter_out  lev_shifter_axireg_sel_o          ( .out_o(axireg_sel_o),           .in_i( axireg_sel_i     )      );
    pulp_level_shifter_out  lev_shifter_axireg_tdi_o          ( .out_o(axireg_tdi_o),           .in_i( axireg_tdi_i     )      );
    pulp_level_shifter_in   lev_shifter_axireg_tdo_i          ( .out_o(axireg_tdo_o),           .in_i(axireg_tdo_i      )      );
    

    //signals from soc controller to power manager
    pulp_level_shifter_in   lev_shifter_pm_BBGEN_req_i            ( .out_o(pm_BBGEN_req_o   ),  .in_i(pm_BBGEN_req_i   ) );
    for(i=0;i<3;i++)
    begin : lev_shifter_pm_BBGEN_sel_i
        pulp_level_shifter_in   lev_shifter_pm_BBGEN_sel_i            ( .out_o(pm_BBGEN_sel_o[i]   ),  .in_i(pm_BBGEN_sel_i[i]   ) );
    end
    for(i=0;i<2;i++)
    begin : lev_shifter_pm_BBGEN_dat_i
        pulp_level_shifter_in   lev_shifter_pm_BBGEN_dat_i            ( .out_o(pm_BBGEN_dat_o[i]   ),  .in_i(pm_BBGEN_dat_i[i]   ) );
    end

    



    pulp_level_shifter_in   lev_shifter_pm_power_down_req_i       ( .out_o(pm_power_down_req_o   ),  .in_i(pm_power_down_req_i   ) );
    pulp_level_shifter_in   lev_shifter_pm_cluster_rst_req_i      ( .out_o(pm_cluster_rst_req_o  ),  .in_i(pm_cluster_rst_req_i  ) );
    pulp_level_shifter_in   lev_shifter_pm_wakeup_polarity_i      ( .out_o(pm_wakeup_polarity_o  ),  .in_i(pm_wakeup_polarity_i  ) );

    for(i=0;i<5;i++)
    begin : lev_shifter_pm_wakeup_select_o
        pulp_level_shifter_in   lev_shifter_pm_wakeup_select_o    ( .out_o(pm_wakeup_select_o[i] ),  .in_i(pm_wakeup_select_i[i] ) );
    end
    for(i=0;i<8;i++)
    begin : lev_shifter_pm_busy_cycle_o
        pulp_level_shifter_in   lev_shifter_pm_busy_cycle_o       ( .out_o(pm_busy_cycle_o[i]    ),  .in_i(pm_busy_cycle_i[i]    ) );
    end
    for(i=0;i<8;i++)
    begin : lev_shifter_pm_rst_cycle_o
        pulp_level_shifter_in   lev_shifter_pm_rst_cycle_o        ( .out_o(pm_rst_cycle_o[i]     ),  .in_i(pm_rst_cycle_i[i]     ) );
    end
    pulp_level_shifter_in   lev_shifter_pm_valid_o                ( .out_o(pm_valid_o            ),  .in_i(pm_valid_i            ) );
    pulp_level_shifter_in   lev_shifter_pm_cluster_busy_o         ( .out_o(pm_cluster_busy_o     ),  .in_i(pm_cluster_busy_i     ) );
    pulp_level_shifter_out  lev_shifter_pm_ack_i                  ( .out_o(pm_ack_o              ),  .in_i(pm_ack_i              ) );  
    pulp_level_shifter_out  lev_shifter_pm_power_down_i           ( .out_o(pm_power_down_o       ),  .in_i(pm_power_down_i       ) );  


    for(i=0;i<8;i++)
    begin : lev_shifter_clk_div0_o
        pulp_level_shifter_in   lev_shifter_clk_div0_o            ( .out_o(clk_div0_data_o[i]       ),         .in_i(clk_div0_data_i[i]       )      );
    end
    pulp_level_shifter_in   lev_shifter_clk_div0_valid_o          ( .out_o(clk_div0_valid_o ),         .in_i(clk_div0_valid_i)      );
    pulp_level_shifter_out  lev_shifter_clk_div0_ack_i            ( .out_o(clk_div0_ack_o),            .in_i(clk_div0_ack_i)        );  
    
    for(i=0;i<8;i++)
    begin : lev_shifter_clk_div1_o
        pulp_level_shifter_in   lev_shifter_clk_div1_o            ( .out_o(clk_div1_data_o[i]       ),         .in_i(clk_div1_data_i[i]       )      );
    end
    pulp_level_shifter_in   lev_shifter_clk_div1_valid_o          ( .out_o(clk_div1_valid_o ),         .in_i(clk_div1_valid_i )      );
    pulp_level_shifter_out  lev_shifter_clk_div1_ack_i            ( .out_o(clk_div1_ack_o),            .in_i(clk_div1_ack_i)        );  

    for(i=0;i<8;i++)
    begin : lev_shifter_clk_div2_o
        pulp_level_shifter_in   lev_shifter_clk_div2_o            ( .out_o(clk_div2_data_o[i]       ),         .in_i(clk_div2_data_i[i]       )      );
    end
    pulp_level_shifter_in   lev_shifter_clk_div2_valid_o          ( .out_o(clk_div2_valid_o ),         .in_i(clk_div2_valid_i )      );
    pulp_level_shifter_out  lev_shifter_clk_div2_ack_i            ( .out_o(clk_div2_ack_o),            .in_i(clk_div2_ack_i)        );  

    for(i=0;i<8;i++)
    begin : lev_shifter_clk_div3_o
        pulp_level_shifter_in   lev_shifter_clk_div3_o            ( .out_o(clk_div3_data_o[i]       ),         .in_i(clk_div3_data_i[i]       )      );
    end
    pulp_level_shifter_in   lev_shifter_clk_div3_valid_o          ( .out_o(clk_div3_valid_o ),         .in_i(clk_div3_valid_i )      );
    pulp_level_shifter_out  lev_shifter_clk_div3_ack_i            ( .out_o(clk_div3_ack_o),            .in_i(clk_div3_ack_i)        );  

    for(i=0;i<8;i++)
    begin : lev_shifter_clk_div4_o
        pulp_level_shifter_in   lev_shifter_clk_div4_o            ( .out_o(clk_div4_data_o[i]       ),         .in_i(clk_div4_data_i[i]       )      );
    end
    pulp_level_shifter_in   lev_shifter_clk_div4_valid_o          ( .out_o(clk_div4_valid_o ),         .in_i(clk_div4_valid_i )      );
    pulp_level_shifter_out  lev_shifter_clk_div4_ack_i            ( .out_o(clk_div4_ack_o),            .in_i(clk_div4_ack_i)        );  




    pulp_level_shifter_in   lev_shifter_cvp_soc_pwr_req_o         ( .out_o(cvp_soc_pwr_req_o    ),         .in_i(cvp_soc_pwr_req_i )        );
    pulp_level_shifter_in   lev_shifter_cvp_soc_pwr_wr_rd_o       ( .out_o(cvp_soc_pwr_wr_rd_o  ),         .in_i(cvp_soc_pwr_wr_rd_i )      );
    for(i=0;i<29;i++)
    begin :  lev_shifter_cvp_soc_pwr_add_o
        pulp_level_shifter_in   lev_shifter_cvp_soc_pwr_add_o     ( .out_o(cvp_soc_pwr_add_o[i] ),         .in_i(cvp_soc_pwr_add_i[i] )      );
    end
    for(i=0;i<8;i++)
    begin :  lev_shifter_cvp_soc_pwr_be_o
        pulp_level_shifter_in   lev_shifter_cvp_soc_pwr_be_o       ( .out_o(cvp_soc_pwr_be_o[i] ),         .in_i(cvp_soc_pwr_be_i[i] )      );
    end
    for(i=0;i<64;i++)
    begin :  lev_shifter_cvp_soc_pwr_w_data_o
        pulp_level_shifter_in   lev_shifter_cvp_soc_pwr_w_data_o      ( .out_o(cvp_soc_pwr_w_data_o[i] ),         .in_i(cvp_soc_pwr_w_data_i[i] )      );
    end
    pulp_level_shifter_out   lev_shifter_cvp_soc_pwr_ack_i        ( .out_o(cvp_soc_pwr_ack_o    ),         .in_i(cvp_soc_pwr_ack_i )        );
    pulp_level_shifter_out   lev_shifter_cvp_soc_pwr_error_i      ( .out_o(cvp_soc_pwr_error_o    ),         .in_i(cvp_soc_pwr_error_i )        );
    for(i=0;i<64;i++)
    begin :  lev_shifter_cvp_soc_pwr_r_data_io
        pulp_level_shifter_out   lev_shifter_cvp_soc_pwr_r_data_i     ( .out_o(cvp_soc_pwr_r_data_o[i] ),         .in_i(cvp_soc_pwr_r_data_i[i] )      );
    end


    pulp_level_shifter_in   lev_shifter_cvp_cluster_pwr_req_o      ( .out_o(cvp_cluster_pwr_req_o    ),         .in_i(cvp_cluster_pwr_req_i )        );
    pulp_level_shifter_in   lev_shifter_cvp_cluster_pwr_wr_rd_o    ( .out_o(cvp_cluster_pwr_wr_rd_o  ),         .in_i(cvp_cluster_pwr_wr_rd_i )      );
    for(i=0;i<29;i++)
    begin :  lev_shifter_cvp_cluster_pwr_add_o
        pulp_level_shifter_in   lev_shifter_cvp_cluster_pwr_add_o      ( .out_o(cvp_cluster_pwr_add_o[i] ),         .in_i(cvp_cluster_pwr_add_i[i] )      );
    end
    for(i=0;i<8;i++)
    begin :  lev_shifter_cvp_cluster_pwr_be_o
        pulp_level_shifter_in   lev_shifter_cvp_cluster_pwr_be_o       ( .out_o(cvp_cluster_pwr_be_o[i] ),         .in_i(cvp_cluster_pwr_be_i[i] )      );
    end
    for(i=0;i<64;i++)
    begin :  lev_shifter_cvp_cluster_pwr_w_data_o
        pulp_level_shifter_in   lev_shifter_cvp_cluster_pwr_w_data_o      ( .out_o(cvp_cluster_pwr_w_data_o[i] ),         .in_i(cvp_cluster_pwr_w_data_i[i] )      );
    end
    pulp_level_shifter_out   lev_shifter_cvp_cluster_pwr_ack_i        ( .out_o(cvp_cluster_pwr_ack_o    ),         .in_i(cvp_cluster_pwr_ack_i )        );
    pulp_level_shifter_out   lev_shifter_cvp_cluster_pwr_error_i      ( .out_o(cvp_cluster_pwr_error_o    ),         .in_i(cvp_cluster_pwr_error_i )        );
    for(i=0;i<64;i++)
    begin :  lev_shifter_cvp_cluster_pwr_r_data_io
        pulp_level_shifter_out   lev_shifter_cvp_cluster_pwr_r_data_i     ( .out_o(cvp_cluster_pwr_r_data_o[i] ),         .in_i(cvp_cluster_pwr_r_data_i[i] )      );
    end
    
    
    

    //CHARGE PUMP 1
    pulp_level_shifter_in   lev_shifter_cp1_pwr_req_o         ( .out_o(cp1_pwr_req_o    ),         .in_i(cp1_pwr_req_i )        );
    pulp_level_shifter_in   lev_shifter_cp1_pwr_wr_rd_o       ( .out_o(cp1_pwr_wr_rd_o  ),         .in_i(cp1_pwr_wr_rd_i )      );
    for(i=0;i<29;i++)
    begin :  lev_shifter_cp1_pwr_add_o
        pulp_level_shifter_in   lev_shifter_cp1_pwr_add_o     ( .out_o(cp1_pwr_add_o[i] ),         .in_i(cp1_pwr_add_i[i] )      );
    end
    for(i=0;i<8;i++)
    begin :  lev_shifter_cp1_pwr_be_o
        pulp_level_shifter_in   lev_shifter_cp1_pwr_be_o       ( .out_o(cp1_pwr_be_o[i] ),         .in_i(cp1_pwr_be_i[i] )      );
    end
    for(i=0;i<64;i++)
    begin :  lev_shifter_cp1_pwr_w_data_o
        pulp_level_shifter_in   lev_shifter_cp1_pwr_w_data_o      ( .out_o(cp1_pwr_w_data_o[i] ),         .in_i(cp1_pwr_w_data_i[i] )      );
    end
    pulp_level_shifter_out   lev_shifter_cp1_pwr_ack_i        ( .out_o(cp1_pwr_ack_o    ),         .in_i(cp1_pwr_ack_i )        );
    pulp_level_shifter_out   lev_shifter_cp1_pwr_error_i      ( .out_o(cp1_pwr_error_o    ),         .in_i(cp1_pwr_error_i )        );
    for(i=0;i<64;i++)
    begin :  lev_shifter_cp1_pwr_r_data_io
        pulp_level_shifter_out   lev_shifter_cp1_pwr_r_data_i     ( .out_o(cp1_pwr_r_data_o[i] ),         .in_i(cp1_pwr_r_data_i[i] )      );
    end


    //CHARGE PUMP 2
    pulp_level_shifter_in   lev_shifter_cp2_pwr_req_o         ( .out_o(cp2_pwr_req_o    ),         .in_i(cp2_pwr_req_i )        );
    pulp_level_shifter_in   lev_shifter_cp2_pwr_wr_rd_o       ( .out_o(cp2_pwr_wr_rd_o  ),         .in_i(cp2_pwr_wr_rd_i )      );
    for(i=0;i<29;i++)
    begin :  lev_shifter_cp2_pwr_add_o
        pulp_level_shifter_in   lev_shifter_cp2_pwr_add_o     ( .out_o(cp2_pwr_add_o[i] ),         .in_i(cp2_pwr_add_i[i] )      );
    end
    for(i=0;i<8;i++)
    begin :  lev_shifter_cp2_pwr_be_o
        pulp_level_shifter_in   lev_shifter_cp2_pwr_be_o       ( .out_o(cp2_pwr_be_o[i] ),         .in_i(cp2_pwr_be_i[i] )      );
    end
    for(i=0;i<64;i++)
    begin :  lev_shifter_cp2_pwr_w_data_o
        pulp_level_shifter_in   lev_shifter_cp2_pwr_w_data_o      ( .out_o(cp2_pwr_w_data_o[i] ),         .in_i(cp2_pwr_w_data_i[i] )      );
    end
    pulp_level_shifter_out   lev_shifter_cp2_pwr_ack_i        ( .out_o(cp2_pwr_ack_o    ),         .in_i(cp2_pwr_ack_i )        );
    pulp_level_shifter_out   lev_shifter_cp2_pwr_error_i      ( .out_o(cp2_pwr_error_o    ),         .in_i(cp2_pwr_error_i )        );
    for(i=0;i<64;i++)
    begin :  lev_shifter_cp2_pwr_r_data_io
        pulp_level_shifter_out   lev_shifter_cp2_pwr_r_data_i     ( .out_o(cp2_pwr_r_data_o[i] ),         .in_i(cp2_pwr_r_data_i[i] )      );
    end




    
    pulp_level_shifter_out  lev_shifter_rstn_sync_i              ( .out_o(rstn_sync_o             ),         .in_i(rstn_sync_i             )      );
    pulp_level_shifter_out  lev_shifter_initn_sync_i             ( .out_o(initn_sync_o            ),         .in_i(initn_sync_i            )      );
    pulp_level_shifter_out  lev_shifter_rstn_cluster_sync_i      ( .out_o(rstn_cluster_sync_o     ),         .in_i(rstn_cluster_sync_i     )      );
    pulp_level_shifter_out  lev_shifter_rstn_cluster_sync_soc_i  ( .out_o(rstn_cluster_sync_soc_o ),         .in_i(rstn_cluster_sync_soc_i )      );
    pulp_level_shifter_out  lev_shifter_clk_soc_i                ( .out_o(clk_soc_o               ),         .in_i(clk_soc_i               )      );
    pulp_level_shifter_out  lev_shifter_clk_cluster_i            ( .out_o(clk_cluster_o           ),         .in_i(clk_cluster_i           )      );



    pulp_level_shifter_out   lev_shifter_SAFE_PMB_serial_out_o    ( .out_o(SAFE_PMB_serial_out_o    ),         .in_i(SAFE_PMB_serial_out_i )        );
    pulp_level_shifter_in   lev_shifter_SAFE_PMB_serial_in_i       ( .out_o(SAFE_PMB_serial_in_o    ),         .in_i(SAFE_PMB_serial_in_i  )        );
    pulp_level_shifter_in   lev_shifter_SAFE_PMB_shift_en_i        ( .out_o(SAFE_PMB_shift_en_o     ),         .in_i(SAFE_PMB_shift_en_i   )        );
    pulp_level_shifter_in   lev_shifter_SAFE_PMB_select_ctr_i      ( .out_o(SAFE_PMB_select_ctr_o   ),         .in_i(SAFE_PMB_select_ctr_i )        );
    pulp_level_shifter_in   lev_shifter_SAFE_PMB_pmbw_req_i        ( .out_o(SAFE_PMB_pmbw_req_o     ),         .in_i(SAFE_PMB_pmbw_req_i   )        );
    pulp_level_shifter_out  lev_shifter_SAFE_PMB_pmbw_ack_o        ( .out_o(SAFE_PMB_pmbw_ack_o     ),         .in_i(SAFE_PMB_pmbw_ack_i   )        );

    endgenerate
 endmodule