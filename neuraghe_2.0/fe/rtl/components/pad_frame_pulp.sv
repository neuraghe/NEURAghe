`define SPI_STD     2'b00
`define SPI_QUAD_TX 2'b01
`define SPI_QUAD_RX 2'b10

module COMPENSATION_SF_1V8_FC_LIN
  (
   output logic          COMPOK  ,    // OUT --> 1 bit
   output logic   [3:0]  NASRCN  ,    // OUT --> 4 bit
   output logic   [3:0]  NASRCP  ,    // OUT --> 4 bit
   input  logic          ACCURATE,    // IN  --> 1 bit
   input  logic          FASTFRZ ,    // IN  --> 1 bit
   input  logic          FREEZE  ,    // IN  --> 1 bit
   input  logic          COMPTQ  ,    // IN  --> 1 bit
   input  logic          COMPEN  ,    // IN  --> 1 bit
   input  logic          TQ      ,    // IN  --> 1 bit
   input  logic   [3:0]  RASRCN  ,    // IN  --> 4 bit
   input  logic   [3:0]  RASRCP  ,    // IN  --> 4 bit
   inout  wire           ANAREXTPAD    // 1 bit --> analog PAD
   );
endmodule

module pad_frame_pulp 
(
   //PAD TO CORE

   // PAD MODES FROM CORE
   input  logic       test_mode,
   input  logic       test_mode_sel,
  
   input  logic       uart_tx,
   output logic       uart_rx,
  
   input  logic [24:0]       pad_mux,
   input  logic [24:0] [5:0] pad_cfg,

   input  logic [23:0]       gpio_out,
   output logic [23:0]       gpio_in,
   input  logic [23:0]       gpio_dir,
   input  logic [23:0] [5:0] gpio_cfg,
  
   input  logic        i2c_scl_out,
   output logic        i2c_scl_in,
   input  logic        i2c_scl_oe,
   input  logic        i2c_sda_out,
   output logic        i2c_sda_in,
   input  logic        i2c_sda_oe,

   output logic  [1:0] audio_i2s_sd,
   input  logic        audio_i2s_sck,
   input  logic        audio_i2s_ws,

   output logic  [1:0] cam_i2s_sd,
   input  logic        cam_i2s_sck,
   input  logic        cam_i2s_ws,
   
   input  logic        power_down,

   input  logic        clk_out,

   output logic        ref_clk,
   output logic        test_clk,
   output logic        rstn,
   output logic        mode_select,
  
   // TO SPI SLAVE
   output logic spi_slave_csn,
   output logic spi_slave_sck,
   output logic spi_slave_sdi0,
   output logic spi_slave_sdi1,
   output logic spi_slave_sdi2,
   output logic spi_slave_sdi3,
   input  logic spi_slave_sdo0,
   input  logic spi_slave_sdo1,
   input  logic spi_slave_sdo2,
   input  logic spi_slave_sdo3,
   input  logic [1:0] spi_slave_padmode,

   // TO SPI MASTER
   input  logic spi_master_csn,
   input  logic spi_master_sck,
   output logic spi_master_sdi0,
   output logic spi_master_sdi1,
   output logic spi_master_sdi2,
   output logic spi_master_sdi3,
   input  logic spi_master_sdo0,
   input  logic spi_master_sdo1,
   input  logic spi_master_sdo2,
   input  logic spi_master_sdo3,
   input  logic [1:0] spi_master_padmode,
  
   // TO SCAN
   output logic [11:0] si,
   input  logic [11:0] so,
   input  logic [11:0] so_soc,
   output logic se,
  
   // TO JTAG TAP
   output logic jtag_tdi,
   input  logic jtag_tdo,
   output logic jtag_tms,
   output logic jtag_trst,
   output logic jtag_tck,
  
   //EXT CHIP to PAD
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
   inout  wire  pad_ref_clk,
   inout  wire  pad_test_clk,
   inout  wire  pad_out_clk,
   inout  wire  pad_mode_select
);

    logic [3:0] s_spi_slave_oe;
    logic [3:0] s_spi_master_oe;

    logic [24:0] [5:0] cfg_pad;
    logic [23:0] [5:0] gpio_cfg_int;

    logic [11:0] s_buf_so;
    logic [11:0] s_buf_soc_so;
    logic [11:0] s_buf_cluster_so;

    logic        oe_sspi_sio0;
    logic        out_sspi_sio0;
    logic        in_sspi_sio0;
    logic        oe_sspi_sio1;
    logic        out_sspi_sio1;
    logic        in_sspi_sio1;
    logic        oe_sspi_sio2;
    logic        out_sspi_sio2;
    logic        in_sspi_sio2;
    logic        oe_sspi_sio3;
    logic        out_sspi_sio3;
    logic        in_sspi_sio3;
    logic        oe_sspi_csn;
    logic        out_sspi_csn;
    logic        in_sspi_csn;
    logic        oe_sspi_sck;
    logic        out_sspi_sck;
    logic        in_sspi_sck;
    logic        oe_mspi_sio0;
    logic        out_mspi_sio0;
    logic        in_mspi_sio0;
    logic        oe_mspi_sio1;
    logic        out_mspi_sio1;
    logic        in_mspi_sio1;
    logic        oe_mspi_sio2;
    logic        out_mspi_sio2;
    logic        in_mspi_sio2;
    logic        oe_mspi_sio3;
    logic        out_mspi_sio3;
    logic        in_mspi_sio3;
    logic        oe_mspi_csn;
    logic        out_mspi_csn;
    logic        in_mspi_csn;
    logic        oe_mspi_sck;
    logic        out_mspi_sck;
    logic        in_mspi_sck;
    logic        oe_uart_tx;
    logic        out_uart_tx;
    logic        in_uart_tx;
    logic        oe_uart_rx;
    logic        out_uart_rx;
    logic        in_uart_rx;
    logic        oe_i2c_sda;
    logic        out_i2c_sda;
    logic        in_i2c_sda;
    logic        oe_i2c_scl;
    logic        out_i2c_scl;
    logic        in_i2c_scl; 
    logic        oe_audio_i2s_ws;
    logic        out_audio_i2s_ws;
    logic        in_audio_i2s_ws;
    logic        oe_audio_i2s_sck;
    logic        out_audio_i2s_sck;
    logic        in_audio_i2s_sck;
    logic        oe_audio_i2s_sdi0;
    logic        out_audio_i2s_sdi0;
    logic        in_audio_i2s_sdi0;
    logic        oe_audio_i2s_sdi1;
    logic        out_audio_i2s_sdi1;
    logic        in_audio_i2s_sdi1;
    logic        oe_cam_i2s_sck;
    logic        out_cam_i2s_sck;
    logic        in_cam_i2s_sck;
    logic        oe_cam_i2s_ws;
    logic        out_cam_i2s_ws;
    logic        in_cam_i2s_ws;
    logic        oe_cam_i2s_sdi0;
    logic        out_cam_i2s_sdi0;
    logic        in_cam_i2s_sdi0;
    logic        oe_cam_i2s_sdi1;
    logic        out_cam_i2s_sdi1;
    logic        in_cam_i2s_sdi1;
    logic        oe_power_down;
    logic        out_power_down;
    logic        in_power_down;
    logic        in_mode_select;
    logic        s_buf_se;

    BD4SCARUDQPCH_SF_1V8_FC_LIN padinst_sspi_sio0      (.TM(1'b0),               .EN(oe_sspi_sio0),      .A(out_sspi_sio0),      .PUN(cfg_pad[0][0]),  .PDN(cfg_pad[0][1]),  .PUN15K(cfg_pad[0][2]),  .HYST(cfg_pad[0][3]),  .LOWEMI(cfg_pad[0][4]),  .ZI(in_sspi_sio0),      .IO(pad_sspi_sio0)      );
    BD4SCARUDQPCH_SF_1V8_FC_LIN padinst_sspi_sio1      (.TM(1'b0),               .EN(oe_sspi_sio1),      .A(out_sspi_sio1),      .PUN(cfg_pad[1][0]),  .PDN(cfg_pad[1][1]),  .PUN15K(cfg_pad[1][2]),  .HYST(cfg_pad[1][3]),  .LOWEMI(cfg_pad[1][4]),  .ZI(in_sspi_sio1),      .IO(pad_sspi_sio1)      );
    BD4SCARUDQPCH_SF_1V8_FC_LIN padinst_sspi_sio2      (.TM(1'b0),               .EN(oe_sspi_sio2),      .A(out_sspi_sio2),      .PUN(cfg_pad[2][0]),  .PDN(cfg_pad[2][1]),  .PUN15K(cfg_pad[2][2]),  .HYST(cfg_pad[2][3]),  .LOWEMI(cfg_pad[2][4]),  .ZI(in_sspi_sio2),      .IO(pad_sspi_sio2)      );
    BD4SCARUDQPCH_SF_1V8_FC_LIN padinst_sspi_sio3      (.TM(1'b0),               .EN(oe_sspi_sio3),      .A(out_sspi_sio3),      .PUN(cfg_pad[3][0]),  .PDN(cfg_pad[3][1]),  .PUN15K(cfg_pad[3][2]),  .HYST(cfg_pad[3][3]),  .LOWEMI(cfg_pad[3][4]),  .ZI(in_sspi_sio3),      .IO(pad_sspi_sio3)      );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_sspi_csn       (.TM(1'b0),               .EN(oe_sspi_csn),       .A(out_sspi_csn),       .PUN(cfg_pad[4][0]),  .PDN(cfg_pad[4][1]),  .PUN15K(cfg_pad[4][2]),  .HYST(cfg_pad[4][3]),  .LOWEMI(cfg_pad[4][4]),  .ZI(in_sspi_csn),       .IO(pad_sspi_csn)       );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_sspi_sck       (.TM(1'b0),               .EN(oe_sspi_sck),       .A(out_sspi_sck),       .PUN(cfg_pad[5][0]),  .PDN(cfg_pad[5][1]),  .PUN15K(cfg_pad[5][2]),  .HYST(cfg_pad[5][3]),  .LOWEMI(cfg_pad[5][4]),  .ZI(in_sspi_sck),       .IO(pad_sspi_sck)       );
    BD4SCARUDQPCH_SF_1V8_FC_LIN padinst_mspi_sio0      (.TM(1'b0),               .EN(oe_mspi_sio0),      .A(out_mspi_sio0),      .PUN(cfg_pad[6][0]),  .PDN(cfg_pad[6][1]),  .PUN15K(cfg_pad[6][2]),  .HYST(cfg_pad[6][3]),  .LOWEMI(cfg_pad[6][4]),  .ZI(in_mspi_sio0),      .IO(pad_mspi_sio0)      );
    BD4SCARUDQPCH_SF_1V8_FC_LIN padinst_mspi_sio1      (.TM(1'b0),               .EN(oe_mspi_sio1),      .A(out_mspi_sio1),      .PUN(cfg_pad[7][0]),  .PDN(cfg_pad[7][1]),  .PUN15K(cfg_pad[7][2]),  .HYST(cfg_pad[7][3]),  .LOWEMI(cfg_pad[7][4]),  .ZI(in_mspi_sio1),      .IO(pad_mspi_sio1)      );
    BD4SCARUDQPCH_SF_1V8_FC_LIN padinst_mspi_sio2      (.TM(1'b0),               .EN(oe_mspi_sio2),      .A(out_mspi_sio2),      .PUN(cfg_pad[8][0]),  .PDN(cfg_pad[8][1]),  .PUN15K(cfg_pad[8][2]),  .HYST(cfg_pad[8][3]),  .LOWEMI(cfg_pad[8][4]),  .ZI(in_mspi_sio2),      .IO(pad_mspi_sio2)      );
    BD4SCARUDQPCH_SF_1V8_FC_LIN padinst_mspi_sio3      (.TM(1'b0),               .EN(oe_mspi_sio3),      .A(out_mspi_sio3),      .PUN(cfg_pad[9][0]),  .PDN(cfg_pad[9][1]),  .PUN15K(cfg_pad[9][2]),  .HYST(cfg_pad[9][3]),  .LOWEMI(cfg_pad[9][4]),  .ZI(in_mspi_sio3),      .IO(pad_mspi_sio3)      );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_mspi_csn       (.TM(1'b0),               .EN(oe_mspi_csn),       .A(out_mspi_csn),       .PUN(cfg_pad[10][0]), .PDN(cfg_pad[10][1]), .PUN15K(cfg_pad[10][2]), .HYST(cfg_pad[10][3]), .LOWEMI(cfg_pad[10][4]), .ZI(in_mspi_csn),       .IO(pad_mspi_csn)       );
    BD4SCARUDQPCH_SF_1V8_FC_LIN padinst_mspi_sck       (.TM(1'b0),               .EN(oe_mspi_sck),       .A(out_mspi_sck),       .PUN(cfg_pad[11][0]), .PDN(cfg_pad[11][1]), .PUN15K(cfg_pad[11][2]), .HYST(cfg_pad[11][3]), .LOWEMI(cfg_pad[11][4]), .ZI(in_mspi_sck),       .IO(pad_mspi_sck)       );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_uart_tx        (.TM(1'b0),               .EN(oe_uart_tx),        .A(out_uart_tx),        .PUN(cfg_pad[12][0]), .PDN(cfg_pad[12][1]), .PUN15K(cfg_pad[12][2]), .HYST(cfg_pad[12][3]), .LOWEMI(cfg_pad[12][4]), .ZI(in_uart_tx),        .IO(pad_uart_tx)        );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_uart_rx        (.TM(1'b0),               .EN(oe_uart_rx),        .A(out_uart_rx),        .PUN(cfg_pad[13][0]), .PDN(cfg_pad[13][1]), .PUN15K(cfg_pad[13][2]), .HYST(cfg_pad[13][3]), .LOWEMI(cfg_pad[13][4]), .ZI(in_uart_rx),        .IO(pad_uart_rx)        );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_i2c_sda        (.TM(1'b0),               .EN(oe_i2c_sda),        .A(out_i2c_sda),        .PUN(cfg_pad[14][0]), .PDN(cfg_pad[14][1]), .PUN15K(cfg_pad[14][2]), .HYST(cfg_pad[14][3]), .LOWEMI(cfg_pad[14][4]), .ZI(in_i2c_sda),        .IO(pad_i2c_sda)        );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_i2c_scl        (.TM(1'b0),               .EN(oe_i2c_scl),        .A(out_i2c_scl),        .PUN(cfg_pad[15][0]), .PDN(cfg_pad[15][1]), .PUN15K(cfg_pad[15][2]), .HYST(cfg_pad[15][3]), .LOWEMI(cfg_pad[15][4]), .ZI(in_i2c_scl),        .IO(pad_i2c_scl)        );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_audio_i2s_ws   (.TM(1'b0),               .EN(oe_audio_i2s_ws),   .A(out_audio_i2s_ws),   .PUN(cfg_pad[16][0]), .PDN(cfg_pad[16][1]), .PUN15K(cfg_pad[16][2]), .HYST(cfg_pad[16][3]), .LOWEMI(cfg_pad[16][4]), .ZI(in_audio_i2s_ws),   .IO(pad_audio_i2s_ws)   );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_audio_i2s_sck  (.TM(1'b0),               .EN(oe_audio_i2s_sck),  .A(out_audio_i2s_sck),  .PUN(cfg_pad[17][0]), .PDN(cfg_pad[17][1]), .PUN15K(cfg_pad[17][2]), .HYST(cfg_pad[17][3]), .LOWEMI(cfg_pad[17][4]), .ZI(in_audio_i2s_sck),  .IO(pad_audio_i2s_sck)  );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_audio_i2s_sdi0 (.TM(1'b0),               .EN(oe_audio_i2s_sdi0), .A(out_audio_i2s_sdi0), .PUN(cfg_pad[18][0]), .PDN(cfg_pad[18][1]), .PUN15K(cfg_pad[18][2]), .HYST(cfg_pad[18][3]), .LOWEMI(cfg_pad[18][4]), .ZI(in_audio_i2s_sdi0), .IO(pad_audio_i2s_sdi0) );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_audio_i2s_sdi1 (.TM(1'b0),               .EN(oe_audio_i2s_sdi1), .A(out_audio_i2s_sdi1), .PUN(cfg_pad[19][0]), .PDN(cfg_pad[19][1]), .PUN15K(cfg_pad[19][2]), .HYST(cfg_pad[19][3]), .LOWEMI(cfg_pad[19][4]), .ZI(in_audio_i2s_sdi1), .IO(pad_audio_i2s_sdi1) );
    BD4SCARUDQPCH_SF_1V8_FC_LIN padinst_cam_i2s_sck    (.TM(1'b0),               .EN(oe_cam_i2s_sck),    .A(out_cam_i2s_sck),    .PUN(cfg_pad[20][0]), .PDN(cfg_pad[20][1]), .PUN15K(cfg_pad[20][2]), .HYST(cfg_pad[20][3]), .LOWEMI(cfg_pad[20][4]), .ZI(in_cam_i2s_sck),    .IO(pad_cam_i2s_sck)    );
    BD4SCARUDQPCH_SF_1V8_FC_LIN padinst_cam_i2s_ws     (.TM(1'b0),               .EN(oe_cam_i2s_ws),     .A(out_cam_i2s_ws),     .PUN(cfg_pad[21][0]), .PDN(cfg_pad[21][1]), .PUN15K(cfg_pad[21][2]), .HYST(cfg_pad[21][3]), .LOWEMI(cfg_pad[21][4]), .ZI(in_cam_i2s_ws),     .IO(pad_cam_i2s_ws)     );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_cam_i2s_sdi0   (.TM(1'b0),               .EN(oe_cam_i2s_sdi0),   .A(out_cam_i2s_sdi0),   .PUN(cfg_pad[22][0]), .PDN(cfg_pad[22][1]), .PUN15K(cfg_pad[22][2]), .HYST(cfg_pad[22][3]), .LOWEMI(cfg_pad[22][4]), .ZI(in_cam_i2s_sdi0),   .IO(pad_cam_i2s_sdi0)   );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_cam_i2s_sdi1   (.TM(1'b0),               .EN(oe_cam_i2s_sdi1),   .A(out_cam_i2s_sdi1),   .PUN(cfg_pad[23][0]), .PDN(cfg_pad[23][1]), .PUN15K(cfg_pad[23][2]), .HYST(cfg_pad[23][3]), .LOWEMI(cfg_pad[23][4]), .ZI(in_cam_i2s_sdi1),   .IO(pad_cam_i2s_sdi1)   );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_power_down     (.TM(1'b0),               .EN(oe_power_down),     .A(out_power_down),     .PUN(cfg_pad[24][0]), .PDN(cfg_pad[24][1]), .PUN15K(cfg_pad[24][2]), .HYST(cfg_pad[24][3]), .LOWEMI(cfg_pad[24][4]), .ZI(in_power_down),     .IO(pad_power_down)     );

    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_jtag_tdi       (.TM(1'b0),               .EN(1'b1),    .A(1'b0),    .PUN(1'b1),   .PDN(1'b1),       .PUN15K(1'b1),        .HYST(1'b0),       .LOWEMI(1'b0),        .ZI(jtag_tdi),        .IO(pad_jtag_tdi)       );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_jtag_tdo       (.TM(1'b0),               .EN(1'b0),    .A(jtag_tdo),   .PUN(1'b1),   .PDN(1'b1),       .PUN15K(1'b1),        .HYST(1'b1),       .LOWEMI(1'b1),        .ZI(),      .IO(pad_jtag_tdo)    );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_jtag_tms       (.TM(1'b0),               .EN(1'b1),    .A(1'b0),    .PUN(1'b1),   .PDN(1'b1),       .PUN15K(1'b1),        .HYST(1'b0),       .LOWEMI(1'b0),        .ZI(jtag_tms),        .IO(pad_jtag_tms)       );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_jtag_trst      (.TM(1'b0),               .EN(1'b1),    .A(1'b0),    .PUN(1'b1),   .PDN(1'b1),       .PUN15K(1'b1),        .HYST(1'b0),       .LOWEMI(1'b0),        .ZI(jtag_trst),         .IO(pad_jtag_trst)      );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_jtag_tck       (.TM(1'b0),               .EN(1'b1),    .A(1'b0),    .PUN(1'b1),   .PDN(1'b1),       .PUN15K(1'b1),        .HYST(1'b0),       .LOWEMI(1'b0),        .ZI(jtag_tck),        .IO(pad_jtag_tck)       );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_reset_n        (.TM(1'b0),               .EN(1'b1),    .A(1'b0),    .PUN(1'b1),   .PDN(1'b1),       .PUN15K(1'b1),        .HYST(1'b0),       .LOWEMI(1'b0),        .ZI(rstn),     .IO(pad_reset_n)    );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_mode_select    (.TM(1'b0),               .EN(1'b1),    .A(1'b0),    .PUN(1'b1),   .PDN(1'b1),       .PUN15K(1'b1),        .HYST(1'b0),       .LOWEMI(1'b0),        .ZI(in_mode_select),    .IO(pad_mode_select)    );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_test_clk       (.TM(1'b0),               .EN(1'b1),    .A(1'b0),    .PUN(1'b1),   .PDN(1'b1),       .PUN15K(1'b1),        .HYST(1'b0),       .LOWEMI(1'b0),        .ZI(test_clk),        .IO(pad_test_clk)       );
    BD4SCARUDQPCH_SF_1V8_FC_LIN padinst_out_clk        (.TM(1'b0),               .EN(1'b0),    .A(clk_out),    .PUN(1'b1),   .PDN(1'b1),       .PUN15K(1'b1),        .HYST(1'b1),       .LOWEMI(1'b1),        .ZI(),      .IO(pad_out_clk)    );
    BD2SCARUDQPCH_SF_1V8_FC_LIN padinst_ref_clk        (.TM(1'b0),               .EN(1'b1),    .A(1'b0),    .PUN(1'b1),   .PDN(1'b1),       .PUN15K(1'b1),        .HYST(1'b0),       .LOWEMI(1'b0),        .ZI(ref_clk),     .IO(pad_ref_clk)    );

   LBCORNERCELL_SF_FC_LIN I_LBCORNER (  );
   LTCORNERCELL_SF_FC_LIN I_LTCORNER (  );
   RBCORNERCELL_SF_FC_LIN I_RBCORNER (  );
   RTCORNERCELL_SF_FC_LIN I_RTCORNER (  );

    //TODO ADD POWER IO PADS    
  
   //Inputs binded to 0 for NORMAL operation mode, and ACCURATE
   // sets to 0 because ANAREXT is floating
   COMPENSATION_SF_1V8_FC_LIN  padinst_comp
     (
      // LOGIC PINS   @1.0V
      .COMPOK     (         ),    // OUT --> 1 bit
      .NASRCN     (         ),    // OUT --> 4 bit
      .NASRCP     (         ),    // OUT --> 4 bit
      .ACCURATE   ( 1'b0    ),    // IN  --> 1 bit
      .FASTFRZ    ( 1'b0    ),    // IN  --> 1 bit
      .FREEZE     ( 1'b0    ),    // IN  --> 1 bit
      .COMPTQ     ( 1'b0    ),    // IN  --> 1 bit
      .COMPEN     ( 1'b0    ),    // IN  --> 1 bit
      .TQ         ( 1'b0    ),    // IN  --> 1 bit
      .RASRCN     ( 4'b0000 ),    // IN  --> 4 bit
      .RASRCP     ( 4'b0000 ),    // IN  --> 4 bit

      // TRACK PINS  --> INOUT @1.8V  
      //.ASRCN1V8CORE(), // 4 bit
      //.ASRCP1V8CORE(), // 4 bit
      .ANAREXTPAD (         )    // 1 bit --> analog PAD
      );
    
    
    assign oe_sspi_sio0      = test_mode ? 1'b1 : (pad_mux[0]  ? ~gpio_dir[0]  : s_spi_slave_oe[0]);
    assign oe_sspi_sio1      = test_mode ? 1'b1 : (pad_mux[1]  ? ~gpio_dir[1]  : s_spi_slave_oe[1]);
    assign oe_sspi_sio2      = test_mode ? 1'b1 : (pad_mux[2]  ? ~gpio_dir[2]  : s_spi_slave_oe[2]);
    assign oe_sspi_sio3      = test_mode ? 1'b1 : (pad_mux[3]  ? ~gpio_dir[3]  : s_spi_slave_oe[3]);
    assign oe_sspi_csn       = test_mode ? 1'b1 : (pad_mux[4]  ? ~gpio_dir[4]  : 1'b1);
    assign oe_sspi_sck       = 1'b1;
    assign oe_mspi_sio0      = test_mode ? 1'b1 : (pad_mux[6]  ? ~gpio_dir[5]  : s_spi_master_oe[0]);
    assign oe_mspi_sio1      = test_mode ? 1'b1 : (pad_mux[7]  ? ~gpio_dir[6]  : s_spi_master_oe[1]);
    assign oe_mspi_sio2      = test_mode ? 1'b1 : (pad_mux[8]  ? ~gpio_dir[7]  : s_spi_master_oe[2]);
    assign oe_mspi_sio3      = test_mode ? 1'b1 : (pad_mux[9]  ? ~gpio_dir[8]  : s_spi_master_oe[3]);
    assign oe_mspi_csn       = test_mode ? 1'b1 : (pad_mux[10] ? ~gpio_dir[9]  : 1'b0);
    assign oe_mspi_sck       = test_mode ? 1'b1 : (pad_mux[11] ? ~gpio_dir[10] : 1'b0);
    assign oe_uart_tx        = test_mode ? 1'b1 : (pad_mux[12] ? ~gpio_dir[11] : 1'b0);
    assign oe_uart_rx        = test_mode ? 1'b0 : (pad_mux[13] ? ~gpio_dir[12] : 1'b1);
    assign oe_i2c_sda        = test_mode ? 1'b0 : (pad_mux[14] ? ~gpio_dir[13] : i2c_sda_oe);
    assign oe_i2c_scl        = test_mode ? 1'b0 : (pad_mux[15] ? ~gpio_dir[14] : i2c_scl_oe);
    assign oe_audio_i2s_ws   = test_mode ? 1'b0 : (pad_mux[16] ? ~gpio_dir[15] : 1'b0);
    assign oe_audio_i2s_sck  = test_mode ? 1'b0 : (pad_mux[17] ? ~gpio_dir[16] : 1'b0);
    assign oe_audio_i2s_sdi0 = test_mode ? 1'b0 : (pad_mux[18] ? ~gpio_dir[17] : 1'b1);
    assign oe_audio_i2s_sdi1 = test_mode ? 1'b0 : (pad_mux[19] ? ~gpio_dir[18] : 1'b1);
    assign oe_cam_i2s_sck    = test_mode ? 1'b0 : (pad_mux[20] ? ~gpio_dir[19] : 1'b0);
    assign oe_cam_i2s_ws     = test_mode ? 1'b0 : (pad_mux[21] ? ~gpio_dir[20] : 1'b0);
    assign oe_cam_i2s_sdi0   = test_mode ? 1'b0 : (pad_mux[22] ? ~gpio_dir[21] : 1'b1);
    assign oe_cam_i2s_sdi1   = test_mode ? 1'b0 : (pad_mux[23] ? ~gpio_dir[22] : 1'b1);
    assign oe_power_down     = test_mode ? 1'b0 : (pad_mux[24] ? ~gpio_dir[23] : 1'b0);
    
    
    assign out_sspi_sio0      = test_mode ? 1'b0   : (pad_mux[0]  ? gpio_out[0]  : spi_slave_sdo0);
    assign out_sspi_sio1      = test_mode ? 1'b0   : (pad_mux[1]  ? gpio_out[1]  : spi_slave_sdo1);
    assign out_sspi_sio2      = test_mode ? 1'b0   : (pad_mux[2]  ? gpio_out[2]  : spi_slave_sdo2);
    assign out_sspi_sio3      = test_mode ? 1'b0   : (pad_mux[3]  ? gpio_out[3]  : spi_slave_sdo3);
    assign out_sspi_csn       = test_mode ? 1'b0   : (pad_mux[4]  ? gpio_out[4]  : 1'b0);
    
    assign out_mspi_sio0      = test_mode ? 1'b0         : (pad_mux[6]  ? gpio_out[5]  : spi_master_sdo0);
    assign out_mspi_sio1      = test_mode ? 1'b0         : (pad_mux[7]  ? gpio_out[6]  : spi_master_sdo1);
    assign out_mspi_sio2      = test_mode ? 1'b0         : (pad_mux[8]  ? gpio_out[7]  : spi_master_sdo2);
    assign out_mspi_sio3      = test_mode ? 1'b0         : (pad_mux[9]  ? gpio_out[8]  : spi_master_sdo3);
    assign out_mspi_csn       = test_mode ? 1'b0         : (pad_mux[10] ? gpio_out[9]  : spi_master_csn);
    assign out_mspi_sck       = test_mode ? 1'b0         : (pad_mux[11] ? gpio_out[10] : spi_master_sck);
    assign out_uart_tx        = test_mode ? 1'b0         : (pad_mux[12] ? gpio_out[11] : uart_tx);
    assign out_uart_rx        = test_mode ? s_buf_so[0]  : (pad_mux[13] ? gpio_out[12] : 1'b0);
    assign out_i2c_sda        = test_mode ? s_buf_so[1]  : (pad_mux[14] ? gpio_out[13] : i2c_sda_out);
    assign out_i2c_scl        = test_mode ? s_buf_so[2]  : (pad_mux[15] ? gpio_out[14] : i2c_scl_out);
    assign out_audio_i2s_ws   = test_mode ? s_buf_so[3]  : (pad_mux[16] ? gpio_out[15] : audio_i2s_ws);
    assign out_audio_i2s_sck  = test_mode ? s_buf_so[4]  : (pad_mux[17] ? gpio_out[16] : audio_i2s_sck);
    assign out_audio_i2s_sdi0 = test_mode ? s_buf_so[5]  : (pad_mux[18] ? gpio_out[17] : 1'b0);
    assign out_audio_i2s_sdi1 = test_mode ? s_buf_so[6]  : (pad_mux[19] ? gpio_out[18] : 1'b0);
    assign out_cam_i2s_sck    = test_mode ? s_buf_so[7]  : (pad_mux[20] ? gpio_out[19] : cam_i2s_sck);
    assign out_cam_i2s_ws     = test_mode ? s_buf_so[8]  : (pad_mux[21] ? gpio_out[20] : cam_i2s_ws);
    assign out_cam_i2s_sdi0   = test_mode ? s_buf_so[9]  : (pad_mux[22] ? gpio_out[21] : 1'b0);
    assign out_cam_i2s_sdi1   = test_mode ? s_buf_so[10] : (pad_mux[23] ? gpio_out[22] : 1'b0);
    assign out_power_down     = test_mode ? s_buf_so[11] : (pad_mux[24] ? gpio_out[23] : power_down);
    
    assign spi_slave_sdi0  = (test_mode | pad_mux[0] ) ? 1'b0 : in_sspi_sio0;
    assign spi_slave_sdi1  = (test_mode | pad_mux[1] ) ? 1'b0 : in_sspi_sio1;
    assign spi_slave_sdi2  = (test_mode | pad_mux[2] ) ? 1'b0 : in_sspi_sio2;
    assign spi_slave_sdi3  = (test_mode | pad_mux[3] ) ? 1'b0 : in_sspi_sio3;
    assign spi_slave_csn   = (test_mode | pad_mux[4] ) ? 1'b1 : in_sspi_csn;
    assign spi_slave_sck   = in_sspi_sck;

   // this is actually wrong. but to be consistent with other projects we keep the muxing of sdio0/1 here and dont fix the spi_master ip
    assign spi_master_sdi0 = (test_mode | pad_mux[6] ) ? 1'b0 : (spi_master_padmode == `SPI_QUAD_RX) ? in_mspi_sio0 : in_mspi_sio1;
    assign spi_master_sdi1 = (test_mode | pad_mux[7] ) ? 1'b0 : in_mspi_sio1;
    assign spi_master_sdi2 = (test_mode | pad_mux[8] ) ? 1'b0 : in_mspi_sio2;
    assign spi_master_sdi3 = (test_mode | pad_mux[9] ) ? 1'b0 : in_mspi_sio3;

    assign uart_rx         = (test_mode | pad_mux[13]) ? 1'b1 : in_uart_rx;

    assign i2c_sda_in      = (test_mode | pad_mux[14]) ? 1'b0 : in_i2c_sda;
    assign i2c_scl_in      = (test_mode | pad_mux[15]) ? 1'b0 : in_i2c_scl;

    assign audio_i2s_sd[0] = (test_mode | pad_mux[18]) ? 1'b0 : in_audio_i2s_sdi0;
    assign audio_i2s_sd[1] = (test_mode | pad_mux[19]) ? 1'b0 : in_audio_i2s_sdi1;

    assign cam_i2s_sd[0]   = (test_mode | pad_mux[22]) ? 1'b0 : in_cam_i2s_sdi0;
    assign cam_i2s_sd[1]   = (test_mode | pad_mux[23]) ? 1'b0 : in_cam_i2s_sdi1;

    assign mode_select     = (test_mode) ? 1'b0 : in_mode_select;
    
    assign s_buf_se        = (test_mode) ? in_mode_select : 1'b0;
    
    assign gpio_in[0]  = (test_mode | ~pad_mux[0])  ? 1'b0 : in_sspi_sio0;
    assign gpio_in[1]  = (test_mode | ~pad_mux[1])  ? 1'b0 : in_sspi_sio1;
    assign gpio_in[2]  = (test_mode | ~pad_mux[2])  ? 1'b0 : in_sspi_sio2;
    assign gpio_in[3]  = (test_mode | ~pad_mux[3])  ? 1'b0 : in_sspi_sio3;
    assign gpio_in[4]  = (test_mode | ~pad_mux[4])  ? 1'b0 : in_sspi_csn;
    assign gpio_in[5]  = (test_mode | ~pad_mux[6])  ? 1'b0 : in_mspi_sio0;
    assign gpio_in[6]  = (test_mode | ~pad_mux[7])  ? 1'b0 : in_mspi_sio1;
    assign gpio_in[7]  = (test_mode | ~pad_mux[8])  ? 1'b0 : in_mspi_sio2;
    assign gpio_in[8]  = (test_mode | ~pad_mux[9])  ? 1'b0 : in_mspi_sio3;
    assign gpio_in[9]  = (test_mode | ~pad_mux[10]) ? 1'b0 : in_mspi_csn;
    assign gpio_in[10] = (test_mode | ~pad_mux[11]) ? 1'b0 : in_mspi_sck;
    assign gpio_in[11] = (test_mode | ~pad_mux[12]) ? 1'b0 : in_uart_tx;
    assign gpio_in[12] = (test_mode | ~pad_mux[13]) ? 1'b0 : in_uart_rx;
    assign gpio_in[13] = (test_mode | ~pad_mux[14]) ? 1'b0 : in_i2c_sda;
    assign gpio_in[14] = (test_mode | ~pad_mux[15]) ? 1'b0 : in_i2c_scl;
    assign gpio_in[15] = (test_mode | ~pad_mux[16]) ? 1'b0 : in_audio_i2s_ws;
    assign gpio_in[16] = (test_mode | ~pad_mux[17]) ? 1'b0 : in_audio_i2s_sck;
    assign gpio_in[17] = (test_mode | ~pad_mux[18]) ? 1'b0 : in_audio_i2s_sdi0;
    assign gpio_in[18] = (test_mode | ~pad_mux[19]) ? 1'b0 : in_audio_i2s_sdi1;
    assign gpio_in[19] = (test_mode | ~pad_mux[20]) ? 1'b0 : in_cam_i2s_sck;
    assign gpio_in[20] = (test_mode | ~pad_mux[21]) ? 1'b0 : in_cam_i2s_ws;
    assign gpio_in[21] = (test_mode | ~pad_mux[22]) ? 1'b0 : in_cam_i2s_sdi0;
    assign gpio_in[22] = (test_mode | ~pad_mux[23]) ? 1'b0 : in_cam_i2s_sdi1;
    assign gpio_in[23] = (test_mode | ~pad_mux[24]) ? 1'b0 : in_power_down;

    assign cfg_pad[0]  = test_mode ? 6'b000111 : (pad_mux[0]  ? gpio_cfg_int[0]  : pad_cfg[0]);
    assign cfg_pad[1]  = test_mode ? 6'b000111 : (pad_mux[1]  ? gpio_cfg_int[1]  : pad_cfg[1]);
    assign cfg_pad[2]  = test_mode ? 6'b000111 : (pad_mux[2]  ? gpio_cfg_int[2]  : pad_cfg[2]);
    assign cfg_pad[3]  = test_mode ? 6'b000111 : (pad_mux[3]  ? gpio_cfg_int[3]  : pad_cfg[3]);
    assign cfg_pad[4]  = test_mode ? 6'b000111 : (pad_mux[4]  ? gpio_cfg_int[4]  : pad_cfg[4]);
    assign cfg_pad[5]  = test_mode ? 6'b000111 : pad_cfg[5];
    assign cfg_pad[6]  = test_mode ? 6'b000111 : (pad_mux[6]  ? gpio_cfg_int[5]  : pad_cfg[6]);
    assign cfg_pad[7]  = test_mode ? 6'b000111 : (pad_mux[7]  ? gpio_cfg_int[6]  : pad_cfg[7]);
    assign cfg_pad[8]  = test_mode ? 6'b000111 : (pad_mux[8]  ? gpio_cfg_int[7]  : pad_cfg[8]);
    assign cfg_pad[9]  = test_mode ? 6'b000111 : (pad_mux[9]  ? gpio_cfg_int[8]  : pad_cfg[9]);
    assign cfg_pad[10] = test_mode ? 6'b000111 : (pad_mux[10] ? gpio_cfg_int[9]  : pad_cfg[10]);
    assign cfg_pad[11] = test_mode ? 6'b000111 : (pad_mux[11] ? gpio_cfg_int[10] : pad_cfg[11]);
    assign cfg_pad[12] = test_mode ? 6'b000111 : (pad_mux[12] ? gpio_cfg_int[11] : pad_cfg[12]);
    assign cfg_pad[13] = test_mode ? 6'b000111 : (pad_mux[13] ? gpio_cfg_int[12] : pad_cfg[13]);
    assign cfg_pad[14] = test_mode ? 6'b000111 : (pad_mux[14] ? gpio_cfg_int[13] : pad_cfg[14]);
    assign cfg_pad[15] = test_mode ? 6'b000111 : (pad_mux[15] ? gpio_cfg_int[14] : pad_cfg[15]);
    assign cfg_pad[16] = test_mode ? 6'b000111 : (pad_mux[16] ? gpio_cfg_int[15] : pad_cfg[16]);
    assign cfg_pad[17] = test_mode ? 6'b000111 : (pad_mux[17] ? gpio_cfg_int[16] : pad_cfg[17]);
    assign cfg_pad[18] = test_mode ? 6'b000111 : (pad_mux[18] ? gpio_cfg_int[17] : pad_cfg[18]);
    assign cfg_pad[19] = test_mode ? 6'b000111 : (pad_mux[19] ? gpio_cfg_int[18] : pad_cfg[19]);
    assign cfg_pad[20] = test_mode ? 6'b000111 : (pad_mux[20] ? gpio_cfg_int[19] : pad_cfg[20]);
    assign cfg_pad[21] = test_mode ? 6'b000111 : (pad_mux[21] ? gpio_cfg_int[20] : pad_cfg[21]);
    assign cfg_pad[22] = test_mode ? 6'b000111 : (pad_mux[22] ? gpio_cfg_int[21] : pad_cfg[22]);
    assign cfg_pad[23] = test_mode ? 6'b000111 : (pad_mux[23] ? gpio_cfg_int[22] : pad_cfg[23]);
    assign cfg_pad[24] = test_mode ? 6'b000111 : (pad_mux[24] ? gpio_cfg_int[23] : pad_cfg[24]);
         
    //PUN PDN and PUN15K are inverted so from sw side we do not have to care about the inversion
    always_comb
    begin
      for (int i=0;i<24;i++)
      begin
        for (int j=0;j<6;j++)
        begin
          if (j < 3)
            gpio_cfg_int[i][j] = ~gpio_cfg[i][j];
          else
            gpio_cfg_int[i][j] = gpio_cfg[i][j];
        end
      end
    end

        always_comb
        begin
            if (spi_slave_padmode == `SPI_STD)
            begin
                s_spi_slave_oe[0] = 1'b1;
                s_spi_slave_oe[1] = 1'b0;
                s_spi_slave_oe[2] = 1'b1;
                s_spi_slave_oe[3] = 1'b1;
            end
            else if (spi_slave_padmode == `SPI_QUAD_TX)
            begin
                s_spi_slave_oe[0] = 1'b0;
                s_spi_slave_oe[1] = 1'b0;
                s_spi_slave_oe[2] = 1'b0;
                s_spi_slave_oe[3] = 1'b0;
            end
            else
            begin
                s_spi_slave_oe[0] = 1'b1;
                s_spi_slave_oe[1] = 1'b1;
                s_spi_slave_oe[2] = 1'b1;
                s_spi_slave_oe[3] = 1'b1;
            end
        end

        always_comb
        begin
            if (spi_master_padmode == `SPI_STD)
            begin
                s_spi_master_oe[0] = 1'b0;
                s_spi_master_oe[1] = 1'b1;
                s_spi_master_oe[2] = 1'b1;
                s_spi_master_oe[3] = 1'b1;
            end
            else if (spi_master_padmode == `SPI_QUAD_TX)
            begin
                s_spi_master_oe[0] = 1'b0;
                s_spi_master_oe[1] = 1'b0;
                s_spi_master_oe[2] = 1'b0;
                s_spi_master_oe[3] = 1'b0;
            end
            else
            begin
                s_spi_master_oe[0] = 1'b1;
                s_spi_master_oe[1] = 1'b1;
                s_spi_master_oe[2] = 1'b1;
                s_spi_master_oe[3] = 1'b1;
            end
        end

    //buffers to be used as hookup during synthesis

    pulp_buffer buf_so0 (.in_i(so[0]),  .out_o(s_buf_cluster_so[0]));
    pulp_buffer buf_so1 (.in_i(so[1]),  .out_o(s_buf_cluster_so[1]));
    pulp_buffer buf_so2 (.in_i(so[2]),  .out_o(s_buf_cluster_so[2]));
    pulp_buffer buf_so3 (.in_i(so[3]),  .out_o(s_buf_cluster_so[3]));
    pulp_buffer buf_so4 (.in_i(so[4]),  .out_o(s_buf_cluster_so[4]));
    pulp_buffer buf_so5 (.in_i(so[5]),  .out_o(s_buf_cluster_so[5]));
    pulp_buffer buf_so6 (.in_i(so[6]),  .out_o(s_buf_cluster_so[6]));
    pulp_buffer buf_so7 (.in_i(so[7]),  .out_o(s_buf_cluster_so[7]));
    pulp_buffer buf_so8 (.in_i(so[8]),  .out_o(s_buf_cluster_so[8]));
    pulp_buffer buf_so9 (.in_i(so[9]),  .out_o(s_buf_cluster_so[9]));
    pulp_buffer buf_so10(.in_i(so[10]), .out_o(s_buf_cluster_so[10]));
    pulp_buffer buf_so11(.in_i(so[11]), .out_o(s_buf_cluster_so[11]));
        
    pulp_buffer buf_soc_so0 (.in_i(so_soc[0]),  .out_o(s_buf_soc_so[0]));
    pulp_buffer buf_soc_so1 (.in_i(so_soc[1]),  .out_o(s_buf_soc_so[1]));
    pulp_buffer buf_soc_so2 (.in_i(so_soc[2]),  .out_o(s_buf_soc_so[2]));
    pulp_buffer buf_soc_so3 (.in_i(so_soc[3]),  .out_o(s_buf_soc_so[3]));
    pulp_buffer buf_soc_so4 (.in_i(so_soc[4]),  .out_o(s_buf_soc_so[4]));
    pulp_buffer buf_soc_so5 (.in_i(so_soc[5]),  .out_o(s_buf_soc_so[5]));
    pulp_buffer buf_soc_so6 (.in_i(so_soc[6]),  .out_o(s_buf_soc_so[6]));
    pulp_buffer buf_soc_so7 (.in_i(so_soc[7]),  .out_o(s_buf_soc_so[7]));
    pulp_buffer buf_soc_so8 (.in_i(so_soc[8]),  .out_o(s_buf_soc_so[8]));
    pulp_buffer buf_soc_so9 (.in_i(so_soc[9]),  .out_o(s_buf_soc_so[9]));
    pulp_buffer buf_soc_so10(.in_i(so_soc[10]), .out_o(s_buf_soc_so[10]));
    pulp_buffer buf_soc_so11(.in_i(so_soc[11]), .out_o(s_buf_soc_so[11]));
    
    assign s_buf_so  = test_mode_sel ? s_buf_cluster_so : s_buf_soc_so;

    pulp_buffer buf_si0 (.in_i(in_sspi_sio0), .out_o(si[0]));
    pulp_buffer buf_si1 (.in_i(in_sspi_sio1), .out_o(si[1]));
    pulp_buffer buf_si2 (.in_i(in_sspi_sio2), .out_o(si[2]));
    pulp_buffer buf_si3 (.in_i(in_sspi_sio3), .out_o(si[3]));
    pulp_buffer buf_si4 (.in_i(in_sspi_csn),  .out_o(si[4]));
    pulp_buffer buf_si5 (.in_i(in_mspi_sio0), .out_o(si[5]));
    pulp_buffer buf_si6 (.in_i(in_mspi_sio1), .out_o(si[6]));
    pulp_buffer buf_si7 (.in_i(in_mspi_sio2), .out_o(si[7]));
    pulp_buffer buf_si8 (.in_i(in_mspi_sio3), .out_o(si[8]));
    pulp_buffer buf_si9 (.in_i(in_mspi_csn),  .out_o(si[9]));
    pulp_buffer buf_si10(.in_i(in_mspi_sck),  .out_o(si[10]));
    pulp_buffer buf_si11(.in_i(in_uart_tx),   .out_o(si[11]));

    pulp_buffer buf_se (.in_i(s_buf_se),.out_o(se));
        
/*
   clock_mux2 clk_mux_sck_i (
        .clk_in0(spi_slave_sck_int_gated),
        .clk_in1(test_clk),
        .clk_select(test_mode),
        .clk_out(spi_slave_sck)
        );
   */
    
endmodule

