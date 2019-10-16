`include "ulpsoc_defines.sv"

module pulp_chip
(
    inout  wire  pad_sspi_sio0,
    inout  wire  pad_sspi_sio1,
    inout  wire  pad_sspi_sio2,
    inout  wire  pad_sspi_sio3,
    inout  wire  pad_sspi_csn,
    inout  wire  pad_sspi_sck,
    inout  wire  pad_mspi_sio0,
    inout  wire  pad_mspi_sio1,
    inout  wire  pad_mspi_sio2,
    inout  wire  pad_mspi_sio3,
    inout  wire  pad_mspi_csn,
    inout  wire  pad_mspi_sck,
    inout  wire  pad_uart_tx,
    inout  wire  pad_uart_rx,
    inout  wire  pad_i2c_sda,
    inout  wire  pad_i2c_scl,
    inout  wire  pad_audio_i2s_ws,
    inout  wire  pad_audio_i2s_sck,
    inout  wire  pad_audio_i2s_sdi0,
    inout  wire  pad_audio_i2s_sdi1,
    inout  wire  pad_cam_i2s_sck,
    inout  wire  pad_cam_i2s_ws,
    inout  wire  pad_cam_i2s_sdi0,
    inout  wire  pad_cam_i2s_sdi1,
    inout  wire  pad_power_down,
    inout  wire  pad_jtag_tdi,
    inout  wire  pad_jtag_tdo,
    inout  wire  pad_jtag_tms,
    inout  wire  pad_jtag_trst,
    inout  wire  pad_jtag_tck,
    inout  wire  pad_reset_n,
    inout  wire  pad_test_clk,
    inout  wire  pad_ref_clk,
    inout  wire  pad_out_clk,
    inout  wire  pad_mode_select
);
   parameter AXI_ADDR_WIDTH = 32;
   parameter AXI_DATA_WIDTH = 64;
   parameter AXI_ID_WIDTH   = 10;
   parameter AXI_USER_WIDTH = 6;

   logic [1:0]                  s_sspi_mode;
   logic                        s_sspi_csn;
   logic                        s_sspi_sck;
   logic                        s_sspi_sdi0;
   logic                        s_sspi_sdi1;
   logic                        s_sspi_sdi2;
   logic                        s_sspi_sdi3;
   logic                        s_sspi_sdo0;
   logic                        s_sspi_sdo1;
   logic                        s_sspi_sdo2;
   logic                        s_sspi_sdo3;

   logic [1:0]                  s_mspi_mode;
   logic                        s_mspi_csn;
   logic                        s_mspi_sck;
   logic                        s_mspi_sdi0;
   logic                        s_mspi_sdi1;
   logic                        s_mspi_sdi2;
   logic                        s_mspi_sdi3;
   logic                        s_mspi_sdo0;
   logic                        s_mspi_sdo1;
   logic                        s_mspi_sdo2;
   logic                        s_mspi_sdo3;

   logic                        s_testmode;
   logic                        s_testmode_sel;
   logic                        s_ref_clk;
   logic                        s_test_clk;
   logic                        s_mode_select;

   logic                        s_fetch_en;
   logic                        s_eoc;

   logic [31:0]                 s_gpreg_out;
   logic [31:0]                 s_gpreg_in;
   logic [31:0]                 s_gpreg_dir;
   logic [31:0] [5:0]           s_gpreg_cfg;

   logic [24:0]                 s_pad_mux;
   logic [24:0] [5:0]           s_pad_cfg;

   logic                        s_uart_rx;
   logic                        s_uart_tx;
   logic                        s_uart_rts;
   logic                        s_uart_dtr;
   logic                        s_uart_cts;
   logic                        s_uart_dsr;

   logic                        s_i2c_scl_i;
   logic                        s_i2c_scl_o;
   logic                        s_i2c_scl_oe;
   logic                        s_i2c_sda_i;
   logic                        s_i2c_sda_o;
   logic                        s_i2c_sda_oe;

   logic  [7:0]                 s_audio_i2s_sd_i;
   logic                        s_audio_i2s_sck_o;
   logic                        s_audio_i2s_ws_o;

   logic  [1:0]                 s_cam_i2s_sd_i;
   logic                        s_cam_i2s_sck_o;
   logic                        s_cam_i2s_ws_o;

   logic                        s_tdi;
   logic                        s_tdo;
   logic                        s_tms;
   logic                        s_trst_n;
   logic                        s_tck;
   logic                        s_rstn;

   logic [11:0]                 si;
   logic [11:0]                 so;
   logic [11:0]                 so_soc;
   logic                        se;

   logic                        s_clk_out;
   logic                        s_power_down;


   logic                        s_bbgen_bypass;
   logic  [1:0]                 s_bbgen_value_soc;
   logic  [1:0]                 s_bbgen_value_cluster;


   //Signals from SOC to CVP
   logic                        s_fll_bypass_soc;
   logic                        s_fll_bypass_cluster;
   logic                        s_use_one_fll;
   logic                        s_use_fll_soc;
   logic                        s_use_fll_cluster;
   logic                        s_enable_clock_xor;
   logic                        s_clock_enable;
   logic                        s_enable_clk_out;
   logic  [1:0]                 s_clk_out_sel;
   logic                        s_soc_rst_inhibit;
   logic                        s_cluster_rst_inhibit;
   logic                        s_cluster_sw_rstn;
   logic                        s_soc_sw_rstn;
   logic                        s_force_sleep_cp1;
   logic                        s_force_sleep_cp2;

   logic                        pm_power_down_req;
   logic                        pm_cluster_rst_req;
   logic                        pm_wakeup_polarity;
   logic  [4:0]                 pm_wakeup_select;
   logic  [7:0]                 pm_busy_cycle;     
   logic  [7:0]                 pm_rst_cycle;      
   logic                        pm_valid;     
   logic                        pm_ack;

   logic  [7:0]                 clk_div0_data;
   logic                        clk_div0_valid;
   logic                        clk_div0_ack;
   logic  [7:0]                 clk_div1_data;
   logic                        clk_div1_valid;
   logic                        clk_div1_ack;
   logic  [7:0]                 clk_div2_data;
   logic                        clk_div2_valid;
   logic                        clk_div2_ack;
   logic  [7:0]                 clk_div3_data;  // BBGEN_100M divider
   logic                        clk_div3_valid; // BGEN_100M divider
   logic                        clk_div3_ack;
   logic  [7:0]                 clk_div4_data;  // BBGEN_100M divider
   logic                        clk_div4_valid; // BGEN_100M divider
   logic                        clk_div4_ack;

   logic                        cvp_soc_pwr_req;
   logic                        cvp_soc_pwr_wr_rd;
   logic [28:0]                 cvp_soc_pwr_add;
   logic  [7:0]                 cvp_soc_pwr_be;
   logic [63:0]                 cvp_soc_pwr_w_data;
   logic                        cvp_soc_pwr_ack;
   logic                        cvp_soc_pwr_error;
   logic [63:0]                 cvp_soc_pwr_r_data;

   logic                        cvp_cluster_pwr_req;
   logic                        cvp_cluster_pwr_wr_rd;
   logic [28:0]                 cvp_cluster_pwr_add;
   logic  [7:0]                 cvp_cluster_pwr_be;
   logic [63:0]                 cvp_cluster_pwr_w_data;
   logic                        cvp_cluster_pwr_ack;
   logic                        cvp_cluster_pwr_error;
   logic [63:0]                 cvp_cluster_pwr_r_data;

   logic                        cp1_pwr_req;
   logic                        cp1_pwr_wr_rd;
   logic [28:0]                 cp1_pwr_add;
   logic  [7:0]                 cp1_pwr_be;
   logic [63:0]                 cp1_pwr_w_data;
   logic                        cp1_pwr_ack;
   logic                        cp1_pwr_error;
   logic [63:0]                 cp1_pwr_r_data;

   logic                        cp2_pwr_req;
   logic                        cp2_pwr_wr_rd;
   logic [28:0]                 cp2_pwr_add;
   logic  [7:0]                 cp2_pwr_be;
   logic [63:0]                 cp2_pwr_w_data;
   logic                        cp2_pwr_ack;
   logic                        cp2_pwr_error;
   logic [63:0]                 cp2_pwr_r_data;


   logic                        s_rstn_sync;
   logic                        s_initn_sync;
   logic                        s_rstn_cluster_sync;
   logic                        s_rstn_cluster_sync_soc;
   logic                        s_clk_soc;
   logic                        s_clk_cluster;

    AXI_BUS
    #(
        .AXI_ADDR_WIDTH(32),
        .AXI_DATA_WIDTH(64),
        .AXI_ID_WIDTH(10),
        .AXI_USER_WIDTH(6)
    )
    s_printf_bus();

    ////////////////////////////////////////////////////////////////////////////
    //   _                _   ___ _    _  __ _             _  _     _         //
    //  | |   _____ _____| | / __| |_ (_)/ _| |_ ___ _ _  | \| |___| |_ ___   //
    //  | |__/ -_) V / -_) | \__ \ ' \| |  _|  _/ -_) '_| | .` / -_)  _(_-<   //
    //  |____\___|\_/\___|_| |___/_||_|_|_|  \__\___|_|   |_|\_\___|\__/__/   //
    ////////////////////////////////////////////////////////////////////////////
    logic                               s_ref_clk_shift;
    logic                               s_test_clk_shift;
    logic                               s_rstn_shift;

    logic                               s_mode_select_shift;
    logic                               s_testmode_shift;
    logic                               s_fetch_en_shift;
    logic                               s_eoc_shift;

    logic                               s_cluster_tck_shift;
    logic                               s_cluster_trstn_shift;
    logic                               s_cluster_tms_shift;
    logic                               s_cluster_tdi_shift;
    logic                               s_cluster_tdo_shift;
    logic                               s_cluster_tck;
    logic                               s_cluster_trstn;
    logic                               s_cluster_tms;
    logic                               s_cluster_tdi;
    logic                               s_cluster_tdo;

    logic [31:0]                        s_gpreg_in_shift;
    logic [31:0]                        s_gpreg_out_shift;
    logic [31:0]                        s_gpreg_dir_shift;
    logic [31:0] [5:0]                  s_gpreg_cfg_shift;
    logic [24:0]                        s_pad_mux_shift;
    logic [24:0] [5:0]                  s_pad_cfg_shift;
    logic                               s_uart_rx_shift;
    logic                               s_uart_tx_shift;
    logic                               s_uart_rts_shift;
    logic                               s_uart_dtr_shift;
    logic                               s_uart_cts_shift;
    logic                               s_uart_dsr_shift;

    logic                               s_i2c_scl_o_shift;
    logic                               s_i2c_scl_i_shift;
    logic                               s_i2c_scl_oe_shift;
    logic                               s_i2c_sda_o_shift;
    logic                               s_i2c_sda_i_shift;
    logic                               s_i2c_sda_oe_shift;

    logic  [7:0]                        s_audio_i2s_sd_i_shift;
    logic                               s_audio_i2s_sck_o_shift;
    logic                               s_audio_i2s_ws_o_shift;
 
    logic  [1:0]                        s_cam_i2s_sd_i_shift;
    logic                               s_cam_i2s_sck_o_shift;
    logic                               s_cam_i2s_ws_o_shift;

    logic [1:0]                         s_mspi_mode_shift;
    logic                               s_mspi_csn_shift;
    logic                               s_mspi_sck_shift;
    logic                               s_mspi_sdi0_shift;
    logic                               s_mspi_sdi1_shift;
    logic                               s_mspi_sdi2_shift;
    logic                               s_mspi_sdi3_shift;
    logic                               s_mspi_sdo0_shift;
    logic                               s_mspi_sdo1_shift;
    logic                               s_mspi_sdo2_shift;
    logic                               s_mspi_sdo3_shift;

    logic [1:0]                         s_sspi_mode_shift;
    logic                               s_sspi_csn_shift;
    logic                               s_sspi_sck_shift;
    logic                               s_sspi_sdi0_shift;
    logic                               s_sspi_sdi1_shift;
    logic                               s_sspi_sdi2_shift;
    logic                               s_sspi_sdi3_shift;
    logic                               s_sspi_sdo0_shift;
    logic                               s_sspi_sdo1_shift;
    logic                               s_sspi_sdo2_shift;
    logic                               s_sspi_sdo3_shift;

    logic [11:0]                        si_shift;
    logic [11:0]                        so_shift;
    logic [11:0]                        so_soc_shift;
    logic                               se_shift;

    //Signals from SOC to CLK RST GEN
    logic                              s_clock_enable_shift;

   logic                        pm_power_down_req_shift;
   logic                        pm_cluster_rst_req_shift;
   logic                        pm_wakeup_polarity_shift;
   logic  [4:0]                 pm_wakeup_select_shift;
   logic  [7:0]                 pm_busy_cycle_shift;     
   logic  [7:0]                 pm_rst_cycle_shift;      
   logic                        pm_valid_shift;     
   logic                        pm_ack_shift;
   logic                        pm_power_down_shift;

    logic  [7:0]                 clk_div0_data_shift;
    logic                        clk_div0_valid_shift;
    logic                        clk_div0_ack_shift;
    logic  [7:0]                 clk_div1_data_shift;
    logic                        clk_div1_valid_shift;
    logic                        clk_div1_ack_shift;
    logic  [7:0]                 clk_div2_data_shift;
    logic                        clk_div2_valid_shift;
    logic                        clk_div2_ack_shift;
    logic  [7:0]                 clk_div3_data_shift;  // BBGEN_100M divider
    logic                        clk_div3_valid_shift; // BBGEN_100M divider
    logic                        clk_div3_ack_shift;
    logic  [7:0]                 clk_div4_data_shift;  // BBGEN_100M divider
    logic                        clk_div4_valid_shift; // BBGEN_100M divider
    logic                        clk_div4_ack_shift;

    logic                        cvp_soc_pwr_req_shift;
    logic                        cvp_soc_pwr_wr_rd_shift;
    logic [28:0]                 cvp_soc_pwr_add_shift;
    logic  [7:0]                 cvp_soc_pwr_be_shift;
    logic [63:0]                 cvp_soc_pwr_w_data_shift;
    logic                        cvp_soc_pwr_ack_shift;
    logic                        cvp_soc_pwr_error_shift;
    logic [63:0]                 cvp_soc_pwr_r_data_shift;

    logic                        cvp_cluster_pwr_req_shift;
    logic                        cvp_cluster_pwr_wr_rd_shift;
    logic [28:0]                 cvp_cluster_pwr_add_shift;
    logic  [7:0]                 cvp_cluster_pwr_be_shift;
    logic [63:0]                 cvp_cluster_pwr_w_data_shift;
    logic                        cvp_cluster_pwr_ack_shift;
    logic                        cvp_cluster_pwr_error_shift;
    logic [63:0]                 cvp_cluster_pwr_r_data_shift;

    logic                        cp1_pwr_req_shift;
    logic                        cp1_pwr_wr_rd_shift;
    logic [28:0]                 cp1_pwr_add_shift;
    logic  [7:0]                 cp1_pwr_be_shift;
    logic [63:0]                 cp1_pwr_w_data_shift;
    logic                        cp1_pwr_ack_shift;
    logic                        cp1_pwr_error_shift;
    logic [63:0]                 cp1_pwr_r_data_shift;

    logic                        cp2_pwr_req_shift;
    logic                        cp2_pwr_wr_rd_shift;
    logic [28:0]                 cp2_pwr_add_shift;
    logic  [7:0]                 cp2_pwr_be_shift;
    logic [63:0]                 cp2_pwr_w_data_shift;
    logic                        cp2_pwr_ack_shift;
    logic                        cp2_pwr_error_shift;
    logic [63:0]                 cp2_pwr_r_data_shift;

    logic                        s_rstn_sync_shift;
    logic                        s_initn_sync_shift;
    logic                        s_rstn_cluster_syncv;
    logic                        s_rstn_cluster_sync_soc_shift;
    logic                        s_clk_soc_shift;
    logic                        s_clk_cluster_shift;

    logic [1:0]                  preset_select_cp1;
    logic                        preset_activate_cp1;
    logic                        target_reached_cp1;
    logic [1:0]                  preset_select_cp2;
    logic                        preset_activate_cp2;
    logic                        target_reached_cp2;

    // I/O to PMB Logic Wrapper
    logic                       SAFE_PMB_serial_out;
    logic                       SAFE_PMB_serial_in;
    logic                       SAFE_PMB_shift_en;
    logic                       SAFE_PMB_select_ctr;
    logic                       SAFE_PMB_pmbw_req;
    logic                       SAFE_PMB_pmbw_ack;
    logic                       SAFE_PMB_serial_out_shift;
    logic                       SAFE_PMB_serial_in_shift;
    logic                       SAFE_PMB_shift_en_shift;
    logic                       SAFE_PMB_select_ctr_shift;
    logic                       SAFE_PMB_pmbw_req_shift;
    logic                       SAFE_PMB_pmbw_ack_shift;

    logic                       clk_soc_bbgen100M;
    logic                       rstn_soc_bbgen100M;

    logic                       clk_cluster_bbgen100M;
    logic                       rstn_cluster_bbgen100M;

    logic                       pm_BBGEN_req;
    logic [1:0]                 pm_BBGEN_dat;
    logic [2:0]                 pm_BBGEN_sel;
    logic                       pm_BBGEN_req_shift;
    logic [1:0]                 pm_BBGEN_dat_shift;
    logic [2:0]                 pm_BBGEN_sel_shift;



    pad_frame_pulp pad_frame_pulp_i
    (
        // PAD MODES FROM CORE
        .test_mode      ( s_testmode             ),
        .test_mode_sel  ( s_testmode_sel         ),

        .gpio_in        (s_gpreg_in[23:0]),
        .gpio_out       (s_gpreg_out_shift[23:0]),
        .gpio_dir       (s_gpreg_dir_shift[23:0]),
        .gpio_cfg       (s_gpreg_cfg_shift[23:0]),

        .pad_mux        (s_pad_mux_shift),
        .pad_cfg        (s_pad_cfg_shift),

        .uart_tx        ( s_uart_tx_shift        ),
        .uart_rx        ( s_uart_rx              ),

        .i2c_scl_out    (s_i2c_scl_o_shift       ),
        .i2c_scl_in     (s_i2c_scl_i             ),
        .i2c_scl_oe     (s_i2c_scl_oe_shift      ),
        .i2c_sda_out    (s_i2c_sda_o_shift       ),
        .i2c_sda_in     (s_i2c_sda_i             ),
        .i2c_sda_oe     (s_i2c_sda_oe_shift      ),


//        .audio_i2s_sd   (s_audio_i2s_sd_i),
//        .audio_i2s_sck  (s_audio_i2s_sck_o_shift ),
//        .audio_i2s_ws   (s_audio_i2s_ws_o_shift  ),

        .audio_i2s_sd   (s_audio_i2s_sd_i[1:0]   ),
        .audio_i2s_sck  (s_audio_i2s_sck_o_shift ),
        .audio_i2s_ws   (s_audio_i2s_ws_o_shift  ),


        .cam_i2s_sd     ( s_cam_i2s_sd_i         ),  // out
        .cam_i2s_sck    ( s_cam_i2s_sck_o_shift  ),  // in
        .cam_i2s_ws     ( s_cam_i2s_ws_o_shift   ),  // in

        .power_down     ( s_power_down           ),

        .ref_clk        ( s_ref_clk              ),
        .test_clk       ( s_test_clk             ),
        .clk_out        ( s_clk_out              ),
        .rstn           ( s_rstn                 ),
        .mode_select    ( s_mode_select          ),  //output

        // TO SPI SLAVE
        .spi_slave_csn     ( s_sspi_csn         ),
        .spi_slave_sck     ( s_sspi_sck         ),
        .spi_slave_sdi0    ( s_sspi_sdi0        ),
        .spi_slave_sdi1    ( s_sspi_sdi1        ),
        .spi_slave_sdi2    ( s_sspi_sdi2        ),
        .spi_slave_sdi3    ( s_sspi_sdi3        ),
        .spi_slave_sdo0    ( s_sspi_sdo0_shift  ),
        .spi_slave_sdo1    ( s_sspi_sdo1_shift  ),
        .spi_slave_sdo2    ( s_sspi_sdo2_shift  ),
        .spi_slave_sdo3    ( s_sspi_sdo3_shift  ),
        .spi_slave_padmode ( s_sspi_mode_shift  ),

        // TO SPI MASTER
        .spi_master_csn     ( s_mspi_csn_shift  ),
        .spi_master_sck     ( s_mspi_sck_shift  ),
        .spi_master_sdi0    ( s_mspi_sdi0       ),
        .spi_master_sdi1    ( s_mspi_sdi1       ),
        .spi_master_sdi2    ( s_mspi_sdi2       ),
        .spi_master_sdi3    ( s_mspi_sdi3       ),
        .spi_master_sdo0    ( s_mspi_sdo0_shift ),
        .spi_master_sdo1    ( s_mspi_sdo1_shift ),
        .spi_master_sdo2    ( s_mspi_sdo2_shift ),
        .spi_master_sdo3    ( s_mspi_sdo3_shift ),
        .spi_master_padmode ( s_mspi_mode_shift ),

        // TO SCAN
        .si                 ( si                ), //out
        .so                 ( so_shift          ), //in from cluster
        .so_soc             ( so_soc_shift      ), //in from soc
        .se                 ( se                ), //out

        // TO JTAG TAP
        .jtag_tdi    ( s_tdi          ),
        .jtag_tdo    ( s_tdo          ),
        .jtag_tms    ( s_tms          ),
        .jtag_trst   ( s_trst_n       ),
        .jtag_tck    ( s_tck          ),

        .pad_sspi_sio0(pad_sspi_sio0),
        .pad_sspi_sio1(pad_sspi_sio1),
        .pad_sspi_sio2(pad_sspi_sio2),
        .pad_sspi_sio3(pad_sspi_sio3),
        .pad_sspi_csn(pad_sspi_csn),
        .pad_sspi_sck(pad_sspi_sck),
        .pad_mspi_sio0(pad_mspi_sio0),
        .pad_mspi_sio1(pad_mspi_sio1),
        .pad_mspi_sio2(pad_mspi_sio2),
        .pad_mspi_sio3(pad_mspi_sio3),
        .pad_mspi_csn(pad_mspi_csn),
        .pad_mspi_sck(pad_mspi_sck),
        .pad_uart_tx(pad_uart_tx),
        .pad_uart_rx(pad_uart_rx),
        .pad_i2c_sda(pad_i2c_sda),
        .pad_i2c_scl(pad_i2c_scl),
        .pad_audio_i2s_ws(pad_audio_i2s_ws),
        .pad_audio_i2s_sck(pad_audio_i2s_sck),
        .pad_audio_i2s_sdi0(pad_audio_i2s_sdi0),
        .pad_audio_i2s_sdi1(pad_audio_i2s_sdi1),
        .pad_cam_i2s_sck(pad_cam_i2s_sck),
        .pad_cam_i2s_ws(pad_cam_i2s_ws),
        .pad_cam_i2s_sdi0(pad_cam_i2s_sdi0),
        .pad_cam_i2s_sdi1(pad_cam_i2s_sdi1),
        .pad_power_down(pad_power_down),
        .pad_jtag_tdi(pad_jtag_tdi),
        .pad_jtag_tdo(pad_jtag_tdo),
        .pad_jtag_tms(pad_jtag_tms),
        .pad_jtag_trst(pad_jtag_trst),
        .pad_jtag_tck(pad_jtag_tck),
        .pad_reset_n(pad_reset_n),
        .pad_test_clk(pad_test_clk),
        .pad_ref_clk(pad_ref_clk),
        .pad_out_clk(pad_out_clk),
        .pad_mode_select(pad_mode_select)
    );



   // PULP INSTANCE
   ulpsoc
   #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH)
   )
   ulpsoc_i
   (
        .ref_clk_i                ( s_ref_clk_shift                 ),
        .test_clk_i               ( s_test_clk_shift                ),
        .rst_ni                   ( s_rstn_shift                    ),

        .mode_select_i            ( s_mode_select_shift             ),
        .test_mode_i              ( s_testmode_shift                ),
        .fetch_en_i               ( s_fetch_en_shift                ),
        .eoc_o                    ( s_eoc                           ),

        .stdout_master            ( s_printf_bus                    ),

        .tck_i                    ( s_cluster_tck_shift             ),
        .trst_ni                  ( s_cluster_trstn_shift           ),
        .tms_i                    ( s_cluster_tms_shift             ),
        .td_i                     ( s_cluster_tdi_shift             ),
        .td_o                     ( s_cluster_tdo                   ),


        .gpio_in                  ( s_gpreg_in_shift                ),
        .gpio_out                 ( s_gpreg_out                     ),
        .gpio_dir                 ( s_gpreg_dir                     ),
        .gpio_cfg                 ( s_gpreg_cfg                     ),

        .pad_mux                  ( s_pad_mux                       ),
        .pad_cfg                  ( s_pad_cfg                       ),

        .uart_tx                  ( s_uart_tx                       ), // out
        .uart_rx                  ( s_uart_rx_shift                 ), // in
        .uart_rts                 ( s_uart_rts                      ), // out
        .uart_dtr                 ( s_uart_dtr                      ), // out 
        .uart_cts                 ( s_uart_cts_shift                ), // in
        .uart_dsr                 ( 1'b0                            ), // in

        .i2c_scl_i                ( s_i2c_scl_i_shift               ),
        .i2c_scl_o                ( s_i2c_scl_o                     ),
        .i2c_scl_oe_o             ( s_i2c_scl_oe                    ),
        .i2c_sda_i                ( s_i2c_sda_i_shift               ),
        .i2c_sda_o                ( s_i2c_sda_o                     ),
        .i2c_sda_oe_o             ( s_i2c_sda_oe                    ),

        .audio_i2s_sd_i           ( s_audio_i2s_sd_i_shift          ),
        .audio_i2s_sck_o          ( s_audio_i2s_sck_o               ),
        .audio_i2s_ws_o           ( s_audio_i2s_ws_o                ),

        .cam_i2s_sd_i             ( s_cam_i2s_sd_i_shift            ),
        .cam_i2s_sck_o            ( s_cam_i2s_sck_o                 ),
        .cam_i2s_ws_o             ( s_cam_i2s_ws_o                  ),

        .spi_master_clk           ( s_mspi_sck                      ),
        .spi_master_csn           ( s_mspi_csn                      ), 
        .spi_master_mode          ( s_mspi_mode                     ),
        .spi_master_sdo0          ( s_mspi_sdo0                     ),
        .spi_master_sdo1          ( s_mspi_sdo1                     ),
        .spi_master_sdo2          ( s_mspi_sdo2                     ),
        .spi_master_sdo3          ( s_mspi_sdo3                     ),
        .spi_master_sdi0          ( s_mspi_sdi0_shift               ),
        .spi_master_sdi1          ( s_mspi_sdi1_shift               ),
        .spi_master_sdi2          ( s_mspi_sdi2_shift               ),
        .spi_master_sdi3          ( s_mspi_sdi3_shift               ),

        .spi_slave_clk            ( s_sspi_sck_shift                ), 
        .spi_slave_csn            ( s_sspi_csn_shift                ),  
        .spi_slave_mode           ( s_sspi_mode                     ),  //outptu 2 bit
        .spi_slave_sdo0           ( s_sspi_sdo0                     ),
        .spi_slave_sdo1           ( s_sspi_sdo1                     ),
        .spi_slave_sdo2           ( s_sspi_sdo2                     ),
        .spi_slave_sdo3           ( s_sspi_sdo3                     ),
        .spi_slave_sdi0           ( s_sspi_sdi0_shift               ),
        .spi_slave_sdi1           ( s_sspi_sdi1_shift               ),
        .spi_slave_sdi2           ( s_sspi_sdi2_shift               ),
        .spi_slave_sdi3           ( s_sspi_sdi3_shift               ),

        .si                       ( si_shift                        ),
        .se                       ( se_shift                        ),
        .so                       ( so                              ),
        .so_soc                   ( so_soc                          ),

        .jtag_shift_dr_i          ( s_jtag_shift_dr_shift           ),
        .jtag_update_dr_i         ( s_jtag_supdate_dr_shift         ),
        .jtag_capture_dr_i        ( s_jtag_capture_dr_shift         ),
        .axireg_sel_i             ( s_axireg_sel_shift              ),
        .axireg_tdi_i             ( s_axireg_tdi_shift              ),
        .axireg_tdo_o             ( s_axireg_tdo                    ),

        .pm_power_down_req_o      ( pm_power_down_req               ),
        .pm_cluster_rst_req_o     ( pm_cluster_rst_req              ),
        .pm_wakeup_polarity_o     ( pm_wakeup_polarity              ),
        .pm_wakeup_select_o       ( pm_wakeup_select                ),
        .pm_busy_cycle_o          ( pm_busy_cycle                   ),
        .pm_rst_cycle_o           ( pm_rst_cycle                    ),
        .pm_valid_o               ( pm_valid                        ),
        .pm_ack_i                 ( pm_ack_shift                    ),
        .pm_cluster_busy_o        ( pm_cluster_busy                 ),
        .pm_power_down_i          ( pm_power_down_shift             ),

        .pm_BBGEN_req_o           ( pm_BBGEN_req                    ),
        .pm_BBGEN_dat_o           ( pm_BBGEN_dat                    ),
        .pm_BBGEN_sel_o           ( pm_BBGEN_sel                    ),

        .clk_div0_data_o          ( clk_div0_data                   ),
        .clk_div0_valid_o         ( clk_div0_valid                  ),
        .clk_div0_ack_i           ( clk_div0_ack_shift              ),
        .clk_div1_data_o          ( clk_div1_data                   ),
        .clk_div1_valid_o         ( clk_div1_valid                  ),
        .clk_div1_ack_i           ( clk_div1_ack_shift              ),
        .clk_div2_data_o          ( clk_div2_data                   ),
        .clk_div2_valid_o         ( clk_div2_valid                  ),
        .clk_div2_ack_i           ( clk_div2_ack_shift              ),
        .clk_div3_data_o          ( clk_div3_data                   ),
        .clk_div3_valid_o         ( clk_div3_valid                  ),
        .clk_div3_ack_i           ( clk_div3_ack_shift              ),
        .clk_div4_data_o          ( clk_div4_data                   ),
        .clk_div4_valid_o         ( clk_div4_valid                  ),
        .clk_div4_ack_i           ( clk_div4_ack_shift              ),

        .cvp_soc_pwr_req_o        ( cvp_soc_pwr_req                 ),
        .cvp_soc_pwr_wr_rd_o      ( cvp_soc_pwr_wr_rd               ),
        .cvp_soc_pwr_add_o        ( cvp_soc_pwr_add                 ),
        .cvp_soc_pwr_be_o         ( cvp_soc_pwr_be                  ),
        .cvp_soc_pwr_w_data_o     ( cvp_soc_pwr_w_data              ),
        .cvp_soc_pwr_ack_i        ( cvp_soc_pwr_ack_shift           ),
        .cvp_soc_pwr_error_i      ( cvp_soc_pwr_error_shift         ),
        .cvp_soc_pwr_r_data_i     ( cvp_soc_pwr_r_data_shift        ),

        .cvp_cluster_pwr_req_o    ( cvp_cluster_pwr_req             ),
        .cvp_cluster_pwr_wr_rd_o  ( cvp_cluster_pwr_wr_rd           ),
        .cvp_cluster_pwr_add_o    ( cvp_cluster_pwr_add             ),
        .cvp_cluster_pwr_be_o     ( cvp_cluster_pwr_be              ),
        .cvp_cluster_pwr_w_data_o ( cvp_cluster_pwr_w_data          ),
        .cvp_cluster_pwr_ack_i    ( cvp_cluster_pwr_ack_shift       ),
        .cvp_cluster_pwr_error_i  ( cvp_cluster_pwr_error_shift     ),
        .cvp_cluster_pwr_r_data_i ( cvp_cluster_pwr_r_data_shift    ),

        .cp1_pwr_req_o            ( cp1_pwr_req                     ),
        .cp1_pwr_wr_rd_o          ( cp1_pwr_wr_rd                   ),
        .cp1_pwr_add_o            ( cp1_pwr_add                     ),
        .cp1_pwr_be_o             ( cp1_pwr_be                      ),
        .cp1_pwr_w_data_o         ( cp1_pwr_w_data                  ),
        .cp1_pwr_ack_i            ( cp1_pwr_ack_shift               ),
        .cp1_pwr_error_i          ( cp1_pwr_error_shift             ),
        .cp1_pwr_r_data_i         ( cp1_pwr_r_data_shift            ),

        .cp2_pwr_req_o            ( cp2_pwr_req                     ),
        .cp2_pwr_wr_rd_o          ( cp2_pwr_wr_rd                   ),
        .cp2_pwr_add_o            ( cp2_pwr_add                     ),
        .cp2_pwr_be_o             ( cp2_pwr_be                      ),
        .cp2_pwr_w_data_o         ( cp2_pwr_w_data                  ),
        .cp2_pwr_ack_i            ( cp2_pwr_ack_shift               ),
        .cp2_pwr_error_i          ( cp2_pwr_error_shift             ),
        .cp2_pwr_r_data_i         ( cp2_pwr_r_data_shift            ),


        .rstn_sync_i              ( s_rstn_sync_shift               ),
        .initn_sync_i             ( s_initn_sync_shift              ),
        .rstn_cluster_sync_i      ( s_rstn_cluster_sync_shift       ),
        .rstn_cluster_sync_soc_i  ( s_rstn_cluster_sync_soc_shift   ),
        .clk_soc_i                ( s_clk_soc_shift                 ),
        .clk_cluster_i            ( s_clk_cluster_shift             ),
         // I/O to PMB Logic Wrapper
        .SAFE_PMB_serial_out_i    ( SAFE_PMB_serial_out_shift       ),
        .SAFE_PMB_serial_in_o     ( SAFE_PMB_serial_in              ),
        .SAFE_PMB_shift_en_o      ( SAFE_PMB_shift_en               ),
        .SAFE_PMB_select_ctr_o    ( SAFE_PMB_select_ctr             ),
        .SAFE_PMB_pmbw_req_o      ( SAFE_PMB_pmbw_req               ),
        .SAFE_PMB_pmbw_ack_i      ( SAFE_PMB_pmbw_ack_shift         )
    );

`ifndef D_USE_FAKE_PRINTF
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
`endif


    jtag_tap_top jtag_tap_top_i
    (
        .tck_i                   ( s_tck                  ),                        
        .trst_ni                 ( s_trst_n               ),                        
        .tms_i                   ( s_tms                  ),                        
        .td_i                    ( s_tdi                  ),                        
        .td_o                    ( s_tdo                  ),                        
 
        .cluster_tck_o           ( s_cluster_tck          ),
        .cluster_trstn_o         ( s_cluster_trstn        ),
        .cluster_tms_o           ( s_cluster_tms          ),
        .cluster_tdi_o           ( s_cluster_tdi          ),
        .cluster_tdo_i           ( s_cluster_tdo_shift    ),

        .pm_bbgen_bypass_o       ( s_bbgen_bypass         ),
        .pm_bbgen_value_soc_o    ( s_bbgen_value_soc      ),
        .pm_bbgen_value_cluster_o( s_bbgen_value_cluster  ),
        
        .test_clk_i              ( s_test_clk             ),   
        .test_rstn_i             ( s_rstn                 ),
 
        .test_mode_o             ( s_testmode             ),
        .test_mode_sel_o         ( s_testmode_sel         ),
        .fll_bypass_soc_o        ( s_fll_bypass_soc       ),
        .fll_bypass_cluster_o    ( s_fll_bypass_cluster   ),
        .use_one_fll_o           ( s_use_one_fll          ),
        .use_fll_soc_o           ( s_use_fll_soc          ),
        .use_fll_cluster_o       ( s_use_fll_cluster      ),
        .enable_clk_xor_o        ( s_enable_clock_xor     ),
        .xtal_disable_o          (                        ),
 
        .clk_out_sel_o           ( s_clk_out_sel          ),
        .scan_compress_mode_o    ( s_scan_compress_mode   ), // not yet going anywhere 
        .soc_rst_inhibit_o       ( s_soc_rst_inhibit      ), // to clk gen
 
        .enable_clk_out_o        ( s_enable_clk_out       ),
        .cluster_rst_inhibit_o   ( s_cluster_rst_inhibit  ), // to clk gen
 
        .force_sleep_cp1_o       ( s_force_sleep_cp1      ),
        .force_sleep_cp2_o       ( s_force_sleep_cp2      ),
 
        .jtag_shift_dr_o         ( s_jtag_shift_dr        ),  
        .jtag_update_dr_o        ( s_jtag_update_dr       ),  
        .jtag_capture_dr_o       ( s_jtag_capture_dr      ),  
        .axireg_sel_o            ( s_axireg_sel           ),  
 
        .dbg_axi_scan_in_o       ( s_axireg_tdi           ),  
        .dbg_axi_scan_out_i      ( s_axireg_tdo_shift     )
    );

    // Cluster CVP and SOC CVP 
    clock_rst_gen i_clk_rst_gen
    (
        .ref_clk_i                  ( s_ref_clk               ), // OK
        .test_clk_i                 ( s_test_clk              ), // OK
        .rstn_i                     ( s_rstn                  ), // OK

        .test_mode_i                ( s_testmode              ), // OK
        .shift_enable_i             ( se                      ), // OK
        .fll_si_i                   (                         ), // FIXME ANTONIO please connect the chain
        .fll_so_o                   (                         ), // FIXME ANTONIO please connect the chain

        .clk_out_o                  ( s_clk_out               ), // OK
        // SOC_BBGEN
        .clk_soc_bbgen100M_o        ( clk_soc_bbgen100M       ), // OK
        .rstn_soc_bbgen100M_o       ( rstn_soc_bbgen100M      ), // OK

        // SOC_BBGEN
        .clk_cluster_bbgen100M_o    ( clk_cluster_bbgen100M   ), // OK
        .rstn_cluster_bbgen100M_o   ( rstn_cluster_bbgen100M  ), // OK


        .ref_clk_o                  ( s_ref_clk_dft           ),
        .ref_rstn_sync_o            ( s_ref_rstn_dft          ),

        .jtag_fll_bypass_soc_i      ( s_fll_bypass_soc        ), // OK
        .jtag_fll_bypass_cluster_i  ( s_fll_bypass_cluster    ), // OK
        .jtag_use_one_fll_i         ( s_use_one_fll           ), // OK
        .jtag_use_fll_soc_i         ( s_use_fll_soc           ), // OK
        .jtag_use_fll_cluster_i     ( s_use_fll_cluster       ), // OK
        .jtag_enable_clk_xor_i      ( s_enable_clock_xor      ), // OK
        .jtag_enable_clk_out_i      ( s_enable_clk_out        ), // OK
        .jtag_clk_out_sel_i         ( s_clk_out_sel           ), // OK
        .jtag_soc_rst_inhibit_i     ( s_soc_rst_inhibit       ), // OK
        .jtag_cluster_rst_inhibit_i ( s_cluster_rst_inhibit   ), // OK

        .pm_enable_soc_clk_i        ( s_enable_soc_clk        ),
        .pm_enable_cluster_clk_i    ( s_enable_cluster_clk    ),
        .pm_cluster_sw_rstn_i       ( s_cluster_sw_rstn       ), // OK
        .pm_soc_sw_rstn_i           ( s_soc_sw_rstn           ), // OK

        //BROKEN CODE  Francesco Conti please update it
        .clking_axi_aclk    (clking_axi_aclk   ),
        .clking_axi_aresetn (clking_axi_aresetn),
        .clking_axi_awaddr  (clking_axi_awaddr ),
        .clking_axi_awvalid (clking_axi_awvalid),
        .clking_axi_awready (clking_axi_awready),
        .clking_axi_wdata   (clking_axi_wdata  ),
        .clking_axi_wstrb   (clking_axi_wstrb  ),
        .clking_axi_wvalid  (clking_axi_wvalid ),
        .clking_axi_wready  (clking_axi_wready ),
        .clking_axi_bresp   (clking_axi_bresp  ),
        .clking_axi_bvalid  (clking_axi_bvalid ),
        .clking_axi_bready  (clking_axi_bready ),
        .clking_axi_araddr  (clking_axi_araddr ),
        .clking_axi_arvalid (clking_axi_arvalid),
        .clking_axi_arready (clking_axi_arready),
        .clking_axi_rdata   (clking_axi_rdata  ),
        .clking_axi_rresp   (clking_axi_rresp  ),
        .clking_axi_rvalid  (clking_axi_rvalid ),
        .clking_axi_rready  (clking_axi_rready ),

        .clk_div0_data_i        ( clk_div0_data_shift      ), // 
        .clk_div0_valid_i       ( clk_div0_valid_shift     ), // 
        .clk_div0_ack_o         ( clk_div0_ack             ), //
        .clk_div1_data_i        ( clk_div1_data_shift      ), // 
        .clk_div1_valid_i       ( clk_div1_valid_shift     ), // 
        .clk_div1_ack_o         ( clk_div1_ack             ), //
        .clk_div2_data_i        ( clk_div2_data_shift      ), // 
        .clk_div2_valid_i       ( clk_div2_valid_shift     ), // 
        .clk_div2_ack_o         ( clk_div2_ack             ), //
        .clk_div3_data_i        ( clk_div3_data_shift      ), // 
        .clk_div3_valid_i       ( clk_div3_valid_shift     ), // 
        .clk_div3_ack_o         ( clk_div3_ack             ), //
        .clk_div4_data_i        ( clk_div4_data_shift      ), // 
        .clk_div4_valid_i       ( clk_div4_valid_shift     ), // 
        .clk_div4_ack_o         ( clk_div4_ack             ), //

        .cvp_soc_pwr_req        ( cvp_soc_pwr_req_shift    ), // 
        .cvp_soc_pwr_wr_rd      ( cvp_soc_pwr_wr_rd_shift  ), // 
        .cvp_soc_pwr_add        ( cvp_soc_pwr_add_shift    ), // 
        .cvp_soc_pwr_be         ( cvp_soc_pwr_be_shift     ), // 
        .cvp_soc_pwr_w_data     ( cvp_soc_pwr_w_data_shift ), // 
        .cvp_soc_pwr_ack        ( cvp_soc_pwr_ack          ), // 
        .cvp_soc_pwr_error      ( cvp_soc_pwr_error        ), // 
        .cvp_soc_pwr_r_data     ( cvp_soc_pwr_r_data       ), // OUTPUT

        .cvp_cluster_pwr_req    ( cvp_cluster_pwr_req_shift      ), // OK
        .cvp_cluster_pwr_wr_rd  ( cvp_cluster_pwr_wr_rd_shift    ), // OK
        .cvp_cluster_pwr_add    ( cvp_cluster_pwr_add_shift      ), // OK
        .cvp_cluster_pwr_be     ( cvp_cluster_pwr_be_shift       ), // OK
        .cvp_cluster_pwr_w_data ( cvp_cluster_pwr_w_data_shift   ), // OK
        .cvp_cluster_pwr_ack    ( cvp_cluster_pwr_ack            ), // OK
        .cvp_cluster_pwr_error  ( cvp_cluster_pwr_error          ), // OK
        .cvp_cluster_pwr_r_data ( cvp_cluster_pwr_r_data         ), // OK

        .rstn_sync_o             ( s_rstn_sync             ), //OK
        .initn_sync_o            ( s_initn_sync            ), //OK
        .rstn_sync_ref_o         ( s_rstn_sync_ref         ),
        .rstn_cluster_o          ( s_rstn_cluster_sync     ), //OK
        .rstn_cluster_sync_soc_o ( s_rstn_cluster_sync_soc ), //OK
        .clk_soc_o               ( s_clk_soc               ), //OK
        .clk_cluster_o           ( s_clk_cluster           )  //OK
    );

    power_manager i_power_manager 
    (
        .clk_i(s_ref_clk),
        .rstn_i(s_rstn_sync_ref),

        .test_mode_i(s_testmode),

        .padframe_gpio_i(s_gpreg_in),
        .padframe_power_down_o(s_power_down),

        .jtag_bbgen_off_soc_i        ( s_force_sleep_cp1         ),
        .jtag_bbgen_off_cluster_i    ( s_force_sleep_cp2         ),
        .jtag_bbgen_bypass_i         ( s_bbgen_bypass            ),
        .jtag_bbgen_value_soc_i      ( s_bbgen_value_soc         ),
        .jtag_bbgen_value_cluster_i  ( s_bbgen_value_cluster     ),

        .socctrl_power_down_req_i    ( pm_power_down_req_shift   ),
        .socctrl_cluster_rst_req_i   ( pm_cluster_rst_req_shift  ),
        .socctrl_wakeup_polarity_i   ( pm_wakeup_polarity_shift  ),
        .socctrl_wakeup_select_i     ( pm_wakeup_select_shift    ),
        .socctrl_busy_cycle_i        ( pm_busy_cycle_shift       ),
        .socctrl_rst_cycle_i         ( pm_rst_cycle_shift        ),
        .socctrl_valid_i             ( pm_valid_shift            ),
        .socctrl_ack_o               ( pm_ack                    ),
        .socctrl_power_down_o        ( pm_power_down             ),
  
        .socctrl_bbgen_req_i         ( pm_BBGEN_req_shift        ),
        .socctrl_bbgen_sel_i         ( pm_BBGEN_sel_shift        ),
        .socctrl_bbgen_dat_i         ( pm_BBGEN_dat_shift        ),
  
        .cluster_busy_i              ( pm_cluster_busy_shift     ),
        .fetch_en_o                  ( s_fetch_en                ),

        .clkgen_enable_soc_clk_o     ( s_enable_soc_clk          ),
        .clkgen_enable_cluster_clk_o ( s_enable_cluster_clk      ),
  
        .clkgen_cluster_rstn_o       ( s_cluster_sw_rstn         ),
        .clkgen_soc_rstn_o           ( s_soc_sw_rstn             ),
  
        .preset_select_cp1_o         ( preset_select_cp1         ),
        .preset_activate_cp1_o       ( preset_activate_cp1       ),
        .target_reached_cp1_i        ( target_reached_cp1        ),
        .preset_select_cp2_o         ( preset_select_cp2         ),
        .preset_activate_cp2_o       ( preset_activate_cp2       ),
        .target_reached_cp2_i        ( target_reached_cp2        )     
    );

    pulp_chip_LS_wrap
    #(
        .AXI_ADDR_WIDTH    (32),
        .AXI_DATA_WIDTH    (64),
        .AXI_ID_WIDTH      (10),
        .AXI_USER_WIDTH    (6 )
    )
    pulp_chip_LS_wrap_i
    (
        .ref_clk_i      (s_ref_clk_dft        ),
        .test_clk_i     (s_test_clk           ),
        .rst_ni         (s_ref_rstn_dft       ),

        .test_mode_i    (s_testmode           ),
        .mode_select_i  (s_mode_select        ),
        .fetch_en_i     (s_fetch_en           ),
        .eoc_o          (s_eoc_shift          ),


        .tck_i          (s_cluster_tck        ),
        .trst_ni        (s_cluster_trstn      ),
        .tms_i          (s_cluster_tms        ),
        .tdi_i          (s_cluster_tdi        ),
        .tdo_o          (s_cluster_tdo_shift  ),

        .gpio_in        (s_gpreg_in           ),
        .gpio_out       (s_gpreg_out_shift    ),
        .gpio_dir       (s_gpreg_dir_shift    ),
        .gpio_cfg       (s_gpreg_cfg_shift    ),

        .pad_mux        (s_pad_mux_shift      ),
        .pad_cfg        (s_pad_cfg_shift      ),

        .uart_tx        (s_uart_tx_shift      ),
        .uart_rx        (s_uart_rx            ),
        .uart_rts       (s_uart_rts_shift     ),
        .uart_dtr       (s_uart_dtr_shift     ),
        .uart_cts       (s_uart_cts           ),
        .uart_dsr        ( ),

        .i2c_scl_i_i     (s_i2c_scl_i         ),
        .i2c_scl_o_o     (s_i2c_scl_o_shift   ),
        .i2c_scl_oe_o_o  (s_i2c_scl_oe_shift  ),
        .i2c_sda_i_i     (s_i2c_sda_i         ),
        .i2c_sda_o_o     (s_i2c_sda_o_shift   ),
        .i2c_sda_oe_o_o  (s_i2c_sda_oe_shift  ),

        .audio_i2s_sd_i  (s_audio_i2s_sd_i ),
        .audio_i2s_sck_o (s_audio_i2s_sck_o_shift ),
        .audio_i2s_ws_o  (s_audio_i2s_ws_o_shift  ),

        .cam_i2s_sd_i    (s_cam_i2s_sd_i          ),
        .cam_i2s_sck_o   (s_cam_i2s_sck_o_shift   ),
        .cam_i2s_ws_o    (s_cam_i2s_ws_o_shift    ),

        .spi_master_clk  ( s_mspi_sck_shift  ),
        .spi_master_csn  ( s_mspi_csn_shift ),
        .spi_master_mode ( s_mspi_mode_shift ),
        .spi_master_sdo0 ( s_mspi_sdo0_shift ),
        .spi_master_sdo1 ( s_mspi_sdo1_shift ),
        .spi_master_sdo2 ( s_mspi_sdo2_shift ),
        .spi_master_sdo3 ( s_mspi_sdo3_shift ),
        .spi_master_sdi0 ( s_mspi_sdi0       ),
        .spi_master_sdi1 ( s_mspi_sdi1       ),
        .spi_master_sdi2 ( s_mspi_sdi2       ),
        .spi_master_sdi3 ( s_mspi_sdi3       ),

        .spi_slave_clk   ( s_sspi_sck        ),
        .spi_slave_cs    ( s_sspi_csn        ),
        .spi_slave_mode  ( s_sspi_mode_shift ),
        .spi_slave_sdo0  ( s_sspi_sdo0_shift ),
        .spi_slave_sdo1  ( s_sspi_sdo1_shift ),
        .spi_slave_sdo2  ( s_sspi_sdo2_shift ),
        .spi_slave_sdo3  ( s_sspi_sdo3_shift ),
        .spi_slave_sdi0  ( s_sspi_sdi0       ),
        .spi_slave_sdi1  ( s_sspi_sdi1       ),
        .spi_slave_sdi2  ( s_sspi_sdi2       ),
        .spi_slave_sdi3  ( s_sspi_sdi3       ),

        .si              (si                 ),
        .se              (se                 ),
        .so              (so_shift           ),
        .so_soc          (so_soc_shift       ),



        // Signals From Soc Peripherals
        .clock_enable_o       ( s_clock_enable_shift        ),     //
        .cluster_sw_rstn_o    (                             ),     //
        .jtag_shift_dr_i      ( s_jtag_shift_dr             ),
        .jtag_update_dr_i     ( s_jtag_update_dr            ),
        .jtag_capture_dr_i    ( s_jtag_capture_dr           ),
        .axireg_sel_i         ( s_axireg_sel                ),
        .axireg_tdi_i         ( s_axireg_tdi                ),
        .axireg_tdo_o         ( s_axireg_tdo_shift          ),

        .pm_power_down_req_o  ( pm_power_down_req_shift     ),
        .pm_cluster_rst_req_o ( pm_cluster_rst_req_shift    ),
        .pm_wakeup_polarity_o ( pm_wakeup_polarity_shift    ),
        .pm_wakeup_select_o   ( pm_wakeup_select_shift      ),
        .pm_busy_cycle_o      ( pm_busy_cycle_shift         ),
        .pm_rst_cycle_o       ( pm_rst_cycle_shift          ),
        .pm_valid_o           ( pm_valid_shift              ),
        .pm_ack_i             ( pm_ack                      ),
        .pm_cluster_busy_o    ( pm_cluster_busy_shift       ),
        .pm_power_down_i      ( pm_power_down               ),

        .pm_BBGEN_req_o       ( pm_BBGEN_req_shift          ),
        .pm_BBGEN_dat_o       ( pm_BBGEN_dat_shift          ),
        .pm_BBGEN_sel_o       ( pm_BBGEN_sel_shift          ),

        .clk_div0_data_o      (clk_div0_data_shift          ),
        .clk_div0_valid_o     (clk_div0_valid_shift         ),
        .clk_div0_ack_i       (clk_div0_ack                 ),
        .clk_div1_data_o      (clk_div1_data_shift          ),
        .clk_div1_valid_o     (clk_div1_valid_shift         ),
        .clk_div1_ack_i       (clk_div1_ack                 ),
        .clk_div2_data_o      (clk_div2_data_shift          ),
        .clk_div2_valid_o     (clk_div2_valid_shift         ),
        .clk_div2_ack_i       (clk_div2_ack                 ),
        .clk_div3_data_o      (clk_div3_data_shift          ),   // BBGEN_100M divider
        .clk_div3_valid_o     (clk_div3_valid_shift         ),   // BBGEN_100M divider
        .clk_div3_ack_i       (clk_div3_ack                 ),
        .clk_div4_data_o      (clk_div4_data_shift          ),   // BBGEN_100M divider
        .clk_div4_valid_o     (clk_div4_valid_shift         ),   // BBGEN_100M divider
        .clk_div4_ack_i       (clk_div4_ack                 ),

        .cvp_soc_pwr_req_o         ( cvp_soc_pwr_req_shift        ),
        .cvp_soc_pwr_wr_rd_o       ( cvp_soc_pwr_wr_rd_shift      ),
        .cvp_soc_pwr_add_o         ( cvp_soc_pwr_add_shift        ),
        .cvp_soc_pwr_be_o          ( cvp_soc_pwr_be_shift         ),
        .cvp_soc_pwr_w_data_o      ( cvp_soc_pwr_w_data_shift     ),
        .cvp_soc_pwr_ack_i         ( cvp_soc_pwr_ack              ),
        .cvp_soc_pwr_error_i       ( cvp_soc_pwr_error            ),
        .cvp_soc_pwr_r_data_i      ( cvp_soc_pwr_r_data           ),

        .cvp_cluster_pwr_req_o     ( cvp_cluster_pwr_req_shift    ),
        .cvp_cluster_pwr_wr_rd_o   ( cvp_cluster_pwr_wr_rd_shift  ),
        .cvp_cluster_pwr_add_o     ( cvp_cluster_pwr_add_shift    ),
        .cvp_cluster_pwr_be_o      ( cvp_cluster_pwr_be_shift     ),
        .cvp_cluster_pwr_w_data_o  ( cvp_cluster_pwr_w_data_shift ),
        .cvp_cluster_pwr_ack_i     ( cvp_cluster_pwr_ack          ),
        .cvp_cluster_pwr_error_i   ( cvp_cluster_pwr_error        ),
        .cvp_cluster_pwr_r_data_i  ( cvp_cluster_pwr_r_data       ),

        .cp1_pwr_req_o             ( cp1_pwr_req_shift            ),
        .cp1_pwr_wr_rd_o           ( cp1_pwr_wr_rd_shift          ),
        .cp1_pwr_add_o             ( cp1_pwr_add_shift            ),
        .cp1_pwr_be_o              ( cp1_pwr_be_shift             ),
        .cp1_pwr_w_data_o          ( cp1_pwr_w_data_shift         ),
        .cp1_pwr_ack_i             ( cp1_pwr_ack                  ),
        .cp1_pwr_error_i           ( cp1_pwr_error                ),
        .cp1_pwr_r_data_i          ( cp1_pwr_r_data               ),

        .cp2_pwr_req_o             ( cp2_pwr_req_shift            ),
        .cp2_pwr_wr_rd_o           ( cp2_pwr_wr_rd_shift          ),
        .cp2_pwr_add_o             ( cp2_pwr_add_shift            ),
        .cp2_pwr_be_o              ( cp2_pwr_be_shift             ),
        .cp2_pwr_w_data_o          ( cp2_pwr_w_data_shift         ),
        .cp2_pwr_ack_i             ( cp2_pwr_ack                  ),
        .cp2_pwr_error_i           ( cp2_pwr_error                ),
        .cp2_pwr_r_data_i          ( cp2_pwr_r_data               ),


        .rstn_sync_i               ( s_rstn_sync                  ),
        .initn_sync_i              ( s_initn_sync                 ),
        .rstn_cluster_sync_i       ( s_rstn_cluster_sync          ),
        .rstn_cluster_sync_soc_i   ( s_rstn_cluster_sync_soc      ),
        .clk_soc_i                 ( s_clk_soc                    ),
        .clk_cluster_i             ( s_clk_cluster                ),

        .SAFE_PMB_serial_out_i     ( SAFE_PMB_serial_out          ),
        .SAFE_PMB_serial_in_o      ( SAFE_PMB_serial_in_shift     ),
        .SAFE_PMB_shift_en_o       ( SAFE_PMB_shift_en_shift      ),
        .SAFE_PMB_select_ctr_o     ( SAFE_PMB_select_ctr_shift    ),
        .SAFE_PMB_pmbw_req_o       ( SAFE_PMB_pmbw_req_shift      ),
        .SAFE_PMB_pmbw_ack_i       ( SAFE_PMB_pmbw_ack            ),





        // TO ULPSOC
        .ref_clk_o           (s_ref_clk_shift      ),
        .test_clk_o          (s_test_clk_shift     ),
        .rst_no              (s_rstn_shift         ),

        .test_mode_o         (s_testmode_shift     ),
        .mode_select_o       (s_mode_select_shift  ),
        .fetch_en_o          (s_fetch_en_shift     ),
        .eoc_i               (s_eoc                ),

        .tck_o               (s_cluster_tck_shift    ),
        .trst_no             (s_cluster_trstn_shift  ),
        .tms_o               (s_cluster_tms_shift    ),
        .tdi_o               (s_cluster_tdi_shift    ),
        .tdo_i               (s_cluster_tdo          ),

        .gpio_in_o           (s_gpreg_in_shift     ),
        .gpio_out_i          (s_gpreg_out          ),
        .gpio_dir_i          (s_gpreg_dir          ),
        .gpio_cfg_i          (s_gpreg_cfg          ), 

        .pad_mux_i           (s_pad_mux            ),
        .pad_cfg_i           (s_pad_cfg            ),

        .uart_tx_i           (s_uart_tx            ),
        .uart_rx_o           (s_uart_rx_shift      ),
        .uart_rts_i          (s_uart_rts           ),
        .uart_dtr_i          (s_uart_dtr           ),
        .uart_cts_o          (s_uart_cts_shift     ),
        .uart_dsr_o          (                     ),

        .i2c_scl_i_o         (s_i2c_scl_i_shift    ),
        .i2c_scl_o_i         (s_i2c_scl_o          ),
        .i2c_scl_oe_o_i      (s_i2c_scl_oe         ),
        .i2c_sda_i_o         (s_i2c_sda_i_shift    ),
        .i2c_sda_o_i         (s_i2c_sda_o          ),
        .i2c_sda_oe_o_i      (s_i2c_sda_oe         ),

        .audio_i2s_sd_o      (s_audio_i2s_sd_i_shift),
        .audio_i2s_sck_i     (s_audio_i2s_sck_o),
        .audio_i2s_ws_i      (s_audio_i2s_ws_o),

        .cam_i2s_sd_o        (s_cam_i2s_sd_i_shift ),
        .cam_i2s_sck_i       (s_cam_i2s_sck_o      ),
        .cam_i2s_ws_i        (s_cam_i2s_ws_o       ),

        .spi_master_clk_i   (s_mspi_sck        ),
        .spi_master_csn_i   (s_mspi_csn        ),
        .spi_master_mode_i  (s_mspi_mode       ),
        .spi_master_sdo0_i  (s_mspi_sdo0       ),
        .spi_master_sdo1_i  (s_mspi_sdo1       ),
        .spi_master_sdo2_i  (s_mspi_sdo2       ),
        .spi_master_sdo3_i  (s_mspi_sdo3       ),
        .spi_master_sdi0_o  (s_mspi_sdi0_shift ),
        .spi_master_sdi1_o  (s_mspi_sdi1_shift ),
        .spi_master_sdi2_o  (s_mspi_sdi2_shift ),
        .spi_master_sdi3_o  (s_mspi_sdi3_shift ),

        .spi_slave_clk_o    ( s_sspi_sck_shift  ),
        .spi_slave_cs_o     ( s_sspi_csn_shift  ),
        .spi_slave_mode_i   ( s_sspi_mode       ),
        .spi_slave_sdo0_i   ( s_sspi_sdo0       ),
        .spi_slave_sdo1_i   ( s_sspi_sdo1       ),
        .spi_slave_sdo2_i   ( s_sspi_sdo2       ),
        .spi_slave_sdo3_i   ( s_sspi_sdo3       ),
        .spi_slave_sdi0_o   ( s_sspi_sdi0_shift ),
        .spi_slave_sdi1_o   ( s_sspi_sdi1_shift ),
        .spi_slave_sdi2_o   ( s_sspi_sdi2_shift ),
        .spi_slave_sdi3_o   ( s_sspi_sdi3_shift ),

        .si_o               ( si_shift          ),
        .se_o               ( se_shift          ),
        .so_i               ( so                ),
        .so_soc_i           ( so_soc            ),

        .clock_enable_i       ( s_clock_enable           ), // s_clock_enable
        .cluster_sw_rstn_i    ( 1'b0                     ), //
        .jtag_shift_dr_o      ( s_jtag_shift_dr_shift    ),
        .jtag_update_dr_o     ( s_jtag_supdate_dr_shift  ),
        .jtag_capture_dr_o    ( s_jtag_capture_dr_shift  ),
        .axireg_sel_o         ( s_axireg_sel_shift       ),
        .axireg_tdi_o         ( s_axireg_tdi_shift       ),
        .axireg_tdo_i         ( s_axireg_tdo             ),

        .pm_power_down_req_i  ( pm_power_down_req        ),
        .pm_cluster_rst_req_i ( pm_cluster_rst_req       ),
        .pm_wakeup_polarity_i ( pm_wakeup_polarity       ),
        .pm_wakeup_select_i   ( pm_wakeup_select         ),
        .pm_busy_cycle_i      ( pm_busy_cycle            ),
        .pm_rst_cycle_i       ( pm_rst_cycle             ),
        .pm_valid_i           ( pm_valid                 ),
        .pm_ack_o             ( pm_ack_shift             ),
        .pm_cluster_busy_i    ( pm_cluster_busy          ),
        .pm_power_down_o      ( pm_power_down_shift      ),

        .pm_BBGEN_req_i       ( pm_BBGEN_req             ),
        .pm_BBGEN_dat_i       ( pm_BBGEN_dat             ),
        .pm_BBGEN_sel_i       ( pm_BBGEN_sel             ),

        .clk_div0_data_i      ( clk_div0_data            ),
        .clk_div0_valid_i     ( clk_div0_valid           ),
        .clk_div0_ack_o       ( clk_div0_ack_shift       ),
        .clk_div1_data_i      ( clk_div1_data            ),
        .clk_div1_valid_i     ( clk_div1_valid           ),
        .clk_div1_ack_o       ( clk_div1_ack_shift       ),
        .clk_div2_data_i      ( clk_div2_data            ),
        .clk_div2_valid_i     ( clk_div2_valid           ),
        .clk_div2_ack_o       ( clk_div2_ack_shift       ),
        .clk_div3_data_i      ( clk_div3_data            ),
        .clk_div3_valid_i     ( clk_div3_valid           ),
        .clk_div3_ack_o       ( clk_div3_ack_shift       ),
        .clk_div4_data_i      ( clk_div4_data            ),
        .clk_div4_valid_i     ( clk_div4_valid           ),
        .clk_div4_ack_o       ( clk_div4_ack_shift       ),

        .cvp_soc_pwr_req_i        ( cvp_soc_pwr_req          ),
        .cvp_soc_pwr_wr_rd_i      ( cvp_soc_pwr_wr_rd        ),
        .cvp_soc_pwr_add_i        ( cvp_soc_pwr_add          ),
        .cvp_soc_pwr_be_i         ( cvp_soc_pwr_be           ),
        .cvp_soc_pwr_w_data_i     ( cvp_soc_pwr_w_data       ),
        .cvp_soc_pwr_ack_o        ( cvp_soc_pwr_ack_shift    ),
        .cvp_soc_pwr_error_o      ( cvp_soc_pwr_error_shift  ),
        .cvp_soc_pwr_r_data_o     ( cvp_soc_pwr_r_data_shift ),

        .cvp_cluster_pwr_req_i    ( cvp_cluster_pwr_req          ),
        .cvp_cluster_pwr_wr_rd_i  ( cvp_cluster_pwr_wr_rd        ),
        .cvp_cluster_pwr_add_i    ( cvp_cluster_pwr_add          ),
        .cvp_cluster_pwr_be_i     ( cvp_cluster_pwr_be           ),
        .cvp_cluster_pwr_w_data_i ( cvp_cluster_pwr_w_data       ),
        .cvp_cluster_pwr_ack_o    ( cvp_cluster_pwr_ack_shift    ),
        .cvp_cluster_pwr_error_o  ( cvp_cluster_pwr_error_shift  ),
        .cvp_cluster_pwr_r_data_o ( cvp_cluster_pwr_r_data_shift ),

        .cp1_pwr_req_i            ( cp1_pwr_req                   ),
        .cp1_pwr_wr_rd_i          ( cp1_pwr_wr_rd                 ),
        .cp1_pwr_add_i            ( cp1_pwr_add                   ),
        .cp1_pwr_be_i             ( cp1_pwr_be                    ),
        .cp1_pwr_w_data_i         ( cp1_pwr_w_data                ),
        .cp1_pwr_ack_o            ( cp1_pwr_ack_shift             ),
        .cp1_pwr_error_o          ( cp1_pwr_error_shift           ),
        .cp1_pwr_r_data_o         ( cp1_pwr_r_data_shift          ),

        .cp2_pwr_req_i            ( cp2_pwr_req                   ),
        .cp2_pwr_wr_rd_i          ( cp2_pwr_wr_rd                 ),
        .cp2_pwr_add_i            ( cp2_pwr_add                   ),
        .cp2_pwr_be_i             ( cp2_pwr_be                    ),
        .cp2_pwr_w_data_i         ( cp2_pwr_w_data                ),
        .cp2_pwr_ack_o            ( cp2_pwr_ack_shift             ),
        .cp2_pwr_error_o          ( cp2_pwr_error_shift           ),
        .cp2_pwr_r_data_o         ( cp2_pwr_r_data_shift          ),

        .rstn_sync_o              ( s_rstn_sync_shift             ),
        .initn_sync_o             ( s_initn_sync_shift            ),
        .rstn_cluster_sync_o      ( s_rstn_cluster_sync_shift     ),
        .rstn_cluster_sync_soc_o  ( s_rstn_cluster_sync_soc_shift ),
        .clk_soc_o                ( s_clk_soc_shift               ),
        .clk_cluster_o            ( s_clk_cluster_shift           ),

        .SAFE_PMB_serial_out_o    ( SAFE_PMB_serial_out_shift     ),
        .SAFE_PMB_serial_in_i     ( SAFE_PMB_serial_in            ),
        .SAFE_PMB_shift_en_i      ( SAFE_PMB_shift_en             ),
        .SAFE_PMB_select_ctr_i    ( SAFE_PMB_select_ctr           ),
        .SAFE_PMB_pmbw_req_i      ( SAFE_PMB_pmbw_req             ),
        .SAFE_PMB_pmbw_ack_o      ( SAFE_PMB_pmbw_ack_shift       )
    );


// synopsys translate_off
  always_ff @(posedge s_clk_soc)
  begin
    if (target_reached_cp1 == 1'b0)
    begin
      $display("[BBGEN] ERROR: SOC clock active when BBgen updating the status");
      $finish;
    end
  end
  always_ff @(posedge s_clk_cluster)
  begin
    if (target_reached_cp2 == 1'b0)
    begin
      $display("[BBGEN] ERROR: Cluster clock active when BBgen updating the status");
      $finish;
    end
  end
// synopsys translate_on



    BBGEN_wrap
    #(
        .CVP_DATA_WIDTH ( 64 ),
        .CVP_ADDR_WIDTH ( 29 ),
        .CVP_BE_WIDTH   ( 8  ),
        .IS_WEAK        ( 1  )
    )
    BBGEN_wrap_soc
    (
        .clk_i             ( clk_soc_bbgen100M     ),
        .rst_n             ( rstn_soc_bbgen100M    ), // FIXME ANTONIO PLEASE CHECK

        //-------------------------------------------------------------------------
        // CVP interface
        //-------------------------------------------------------------------------
        .cvp_req_i         ( cp1_pwr_req_shift     ), // in  std_logic;
        .cvp_ack_o         ( cp1_pwr_ack           ), // out std_logic;
        .cvp_w_data_i      ( cp1_pwr_w_data_shift  ), // in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
        .cvp_r_data_o      ( cp1_pwr_r_data        ), // out std_logic_vector(CVP_DATA_WIDTH -1 downto 0);
        .cvp_addr_i        ( cp1_pwr_add_shift     ), // in  std_logic_vector(CVP_ADDR_WIDTH -1 downto 0);
        .cvp_rw_i          ( cp1_pwr_wr_rd_shift   ), // in  std_logic;
        .cvp_be_i          ( cp1_pwr_be_shift      ), // in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
        .cvp_error_o       ( cp1_pwr_error         ), // out std_logic;

        .preset_select_i   ( preset_select_cp1     ), // in std_logic_vector(1 downto 0);
        .preset_activate_i ( preset_activate_cp1   ), // in std_logic;

        .target_reached_o  ( target_reached_cp1    ),  // out std_logic
        .force_sleep_i     ( s_force_sleep_cp1     )        
    );


    BBGEN_wrap
    #(
        .CVP_DATA_WIDTH ( 64 ),
        .CVP_ADDR_WIDTH ( 29 ),
        .CVP_BE_WIDTH   ( 8  ),
        .IS_WEAK        ( 0  )
    )
    BBGEN_wrap_cluster
    (
        .clk_i             ( clk_cluster_bbgen100M  ),
        .rst_n             ( rstn_cluster_bbgen100M ), // FIXME ANTONIO PLEASE CHECK

        //-------------------------------------------------------------------------
        // CVP interface
        //-------------------------------------------------------------------------
        .cvp_req_i         ( cp2_pwr_req_shift     ), // in  std_logic;
        .cvp_ack_o         ( cp2_pwr_ack           ), // out std_logic;
        .cvp_w_data_i      ( cp2_pwr_w_data_shift  ), // in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
        .cvp_r_data_o      ( cp2_pwr_r_data        ), // out std_logic_vector(CVP_DATA_WIDTH -1 downto 0);
        .cvp_addr_i        ( cp2_pwr_add_shift     ), // in  std_logic_vector(CVP_ADDR_WIDTH -1 downto 0);
        .cvp_rw_i          ( cp2_pwr_wr_rd_shift   ), // in  std_logic;
        .cvp_be_i          ( cp2_pwr_be_shift      ), // in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
        .cvp_error_o       ( cp2_pwr_error         ), // out std_logic;

        .preset_select_i   ( preset_select_cp2     ), // in std_logic_vector(1 downto 0);
        .preset_activate_i ( preset_activate_cp2   ), // in std_logic;

        .target_reached_o  ( target_reached_cp2    ), // out std_logic
        .force_sleep_i     ( s_force_sleep_cp2     )        
    );


    C28SOI_PM_CONTROL_LR_ASYNC_pmb_wrapper 
    #(
        .k_COUNTER_SIZE    ( 32                    ),   
        .k_period_speed    ( 10*(3)                ),         
        .k_period_leak     ( 10*(3)                ),         
        .k_logic_lprvt     ( 1'b1                  ),   
        .k_logic_lprvt_p4  ( 1'b0                  ),   
        .k_logic_lprvt_p10 ( 1'b0                  ),   
        .k_logic_lprvt_go2 ( 1'b0                  ),   
        .k_logic_lprvt_p16 ( 1'b0                  )
    )
    SAFE_REGION_pmb_wrapper
    (
        .pmbw_clk        ( s_ref_clk_dft             ),    
        .pmbw_rstn       ( s_ref_rstn_dft            ),    
        .pmbw_req        ( SAFE_PMB_pmbw_req_shift   ),    
        .pmbw_ack        ( SAFE_PMB_pmbw_ack         ),    
        .serial_in       ( SAFE_PMB_serial_in_shift  ),
        .serial_out      ( SAFE_PMB_serial_out       ),    
        .shift_en        ( SAFE_PMB_shift_en_shift   ),    
        .select_ctr      ( SAFE_PMB_select_ctr_shift ),    
        .ring_osc_clk    (                           ),
        .tcr_muxclk_mode ( s_testmode                ),
        .tst_reset_mux2  ( s_testmode                )
    );
    // defparams inside generate block not supported in synthesis tool
    // synopsys translate_off
    // defparam u_logic_lprvt.PERIOD_SPEEDO = 10*(3);
    // defparam u_logic_lprvt.PERIOD_LEAKO = 10*(3);
    // synopsys translate_on

endmodule
