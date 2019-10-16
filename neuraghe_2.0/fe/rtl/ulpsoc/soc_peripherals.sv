////////////////////////////////////////////////////////////////////////////////
// Company:        Multitherman Laboratory @ DEIS - University of Bologna     //
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Davide Rossi    - davide.rossi@unibo.it                    //
//                                                                            //
// Additional contributions by:                                               //
//                 Antonio Pullini - pullinia@iis.ee.ethz.ch                  //
//                 Igor Loi        - igor.loi@unibo.it                        //
//                                                                            //
//                                                                            //
// Create Date:    13/02/2013                                                 // 
// Design Name:    ULPSoC                                                     // 
// Module Name:    ulpcluster_top                                             //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    ULPSoC cluster                                             //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - (19/03/2015) Removed Tabs- improved identation             //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "ulpsoc_defines.sv"

module soc_peripherals
#(
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_ID_WIDTH   = 6,
    parameter RM_SIZE        = 3,
    parameter WM_SIZE        = 2,
    parameter NB_SENSORS     = 5,
    parameter NB_CORES       = 4,
    parameter NB_CLUSTERS    = 1
)
(
    input logic                clk_i,
    input logic                rst_ni,
    input logic                init_ni,

    input logic                test_clk_i,
    input logic                test_mode_i,

    // SLAVE PORTS
    AXI_BUS.Slave              axi_slave,

    output logic [RM_SIZE-1:0] rm_l2_mem_o,
    output logic [WM_SIZE-1:0] wm_l2_mem_o,
    output logic               LS_l2_mem_o,
    output logic               HS_l2_mem_o,
    output logic               sleep_l2_mem_o,

    input  logic       [31:0]  gpio_in,
    output logic       [31:0]  gpio_out,
    output logic       [31:0]  gpio_dir,
    output logic [31:0] [5:0]  gpio_padcfg,

    output logic       [24:0]  pad_mux,
    output logic [24:0] [5:0]  pad_cfg,

    output logic               uart_tx,
    input  logic               uart_rx,
    output logic               uart_rts,
    output logic               uart_dtr,
    input  logic               uart_cts,
    input  logic               uart_dsr,

    input  logic              i2c_scl_i,
    output logic              i2c_scl_o,
    output logic              i2c_scl_oe_o,
    input  logic              i2c_sda_i,
    output logic              i2c_sda_o,
    output logic              i2c_sda_oe_o,

    input  logic        [7:0] audio_i2s_sd_i,
    output logic              audio_i2s_sck_o,
    output logic              audio_i2s_ws_o,

    input  logic        [1:0] cam_i2s_sd_i,
    output logic              cam_i2s_sck_o,
    output logic              cam_i2s_ws_o,

    output logic              pm_power_down_req_o,
    output logic              pm_cluster_rst_req_o,
    output logic              pm_wakeup_polarity_o,
    output logic        [4:0] pm_wakeup_select_o,
    output logic        [7:0] pm_busy_cycle_o,
    output logic        [7:0] pm_rst_cycle_o,
    output logic              pm_valid_o,
    input  logic              pm_ack_i,

    output logic              pm_BBGEN_req_o,
    output logic [1:0]        pm_BBGEN_dat_o,
    output logic [2:0]        pm_BBGEN_sel_o,

    output logic        [7:0] clk_div0_data_o,
    output logic              clk_div0_valid_o,
    input  logic              clk_div0_ack_i,
    output logic        [7:0] clk_div1_data_o,
    output logic              clk_div1_valid_o,
    input  logic              clk_div1_ack_i,
    output logic        [7:0] clk_div2_data_o,
    output logic              clk_div2_valid_o,
    input  logic              clk_div2_ack_i,
    output logic        [7:0] clk_div3_data_o,         // BBGEN_100M divider
    output logic              clk_div3_valid_o,   // BBGEN_100M divider
    input  logic              clk_div3_ack_i,
    
    output logic        [7:0] clk_div4_data_o,         // BBGEN_100M divider
    output logic              clk_div4_valid_o,   // BBGEN_100M divider
    input  logic              clk_div4_ack_i,


    output logic              spi_master_clk,
    output logic              spi_master_csn0,
    output logic              spi_master_csn1,
    output logic              spi_master_csn2,
    output logic              spi_master_csn3,
    output logic       [1:0]  spi_master_mode,
    output logic              spi_master_sdo0,
    output logic              spi_master_sdo1,
    output logic              spi_master_sdo2,
    output logic              spi_master_sdo3,
    input  logic              spi_master_sdi0,
    input  logic              spi_master_sdi1,
    input  logic              spi_master_sdi2,
    input  logic              spi_master_sdi3,

    output logic              cvp1_pwr_req,
    output logic              cvp1_pwr_wr_rd,
    output logic       [28:0] cvp1_pwr_add,
    output logic        [7:0] cvp1_pwr_be,
    output logic       [63:0] cvp1_pwr_data,
    input  logic              cvp1_pwr_ack,
    input  logic              cvp1_pwr_error,
    input  logic       [63:0] cvp1_pwr_r_data,
    
    output logic              cvp2_pwr_req,
    output logic              cvp2_pwr_wr_rd,
    output logic       [28:0] cvp2_pwr_add,
    output logic        [7:0] cvp2_pwr_be,
    output logic       [63:0] cvp2_pwr_data,
    input  logic              cvp2_pwr_ack,
    input  logic              cvp2_pwr_error,
    input  logic       [63:0] cvp2_pwr_r_data,


    output logic              cp1_pwr_req,
    output logic              cp1_pwr_wr_rd,
    output logic       [28:0] cp1_pwr_add,
    output logic        [7:0] cp1_pwr_be,
    output logic       [63:0] cp1_pwr_data,
    input  logic              cp1_pwr_ack,
    input  logic              cp1_pwr_error,
    input  logic       [63:0] cp1_pwr_r_data,

    output logic              cp2_pwr_req,
    output logic              cp2_pwr_wr_rd,
    output logic       [28:0] cp2_pwr_add,
    output logic        [7:0] cp2_pwr_be,
    output logic       [63:0] cp2_pwr_data,
    input  logic              cp2_pwr_ack,
    input  logic              cp2_pwr_error,
    input  logic       [63:0] cp2_pwr_r_data,


    output logic        [7:0] events_o,

     // I/O to PMB Logic Wrapper
    input  logic [NB_SENSORS-1:0]      PMB_serial_out_i,
    output logic                       PMB_serial_in_o,
    output logic [NB_SENSORS-1:0]      PMB_shift_en_o,
    output logic [NB_SENSORS-1:0]      PMB_select_ctr_o,
    output logic [NB_SENSORS-1:0]      PMB_pmbw_req_o,
    input  logic [NB_SENSORS-1:0]      PMB_pmbw_ack_i
);

    localparam APB_NUM_SLAVES = 10;
    localparam APB_ADDR_WIDTH = 12;
    
    localparam DR_LENGTH             = 16;
    localparam REF_COUNTER_LENGTH    = 32;
    localparam SENSOR_CTRL_LENGTH    = 16;
    localparam SENSOR_STAT_LENGTH    = 32;
    localparam k_COUNTER_SIZE        = 32;
    localparam IR_LENGTH             = 5;
    localparam k_SENS_CTRL_ADDRESS   = 5'b00100;
    localparam k_REF_COUNTER_ADDRESS = 5'b01000;
    localparam k_SENS_STAT_ADDRESS   = 5'b01100;
    localparam k_APBIF_MODE          = 2'b00;
    localparam k_JTAGIF_MODE         = 2'b01;
    localparam k_DEBUG_MODE          = 2'b10;
    localparam k_PARALLEL_MODE       = 2'b11;
    localparam IDCODE_LENGTH         = 32;
    localparam IDCODE_VALUE          = 32'hBA20A005;
    localparam k_APB_ADDRESS_LENGTH  = 5;
    localparam k_APB_DATA_LENGTH     = 32;
    localparam SENS_RING_COUNT       = 3*NB_SENSORS; // total number of rings



    logic                               s_penable;
    logic                               s_pwrite;
    logic        [APB_ADDR_WIDTH-1:0]   s_paddr;
    logic        [APB_NUM_SLAVES-1:0]   s_psel;
    logic                      [31:0]   s_pwdata;
    logic [APB_NUM_SLAVES-1:0] [31:0]   s_prdata;
    logic        [APB_NUM_SLAVES-1:0]   s_pready;
    logic        [APB_NUM_SLAVES-1:0]   s_pslverr;


    logic                               s_gpio_event;
    logic  [1:0]                        s_spim_event;
    logic                               s_uart_event;
    logic                               s_i2c_event;
    logic                               s_i2s_event;
    logic                               s_i2s_cam_event;
    logic                               s_power_event;
    logic                               s_pmb_event;

    logic [NB_SENSORS-1:0]              PMB_serial_out;
    logic                               PMB_serial_in;
    logic [NB_SENSORS-1:0]              PMB_shift_en;
    logic [NB_SENSORS-1:0]              PMB_select_ctr;
    logic [NB_SENSORS-1:0]              PMB_pmbw_req;
    logic [NB_SENSORS-1:0]              PMB_pmbw_ack;
    logic [NB_SENSORS-1:0]              PMB_pmbw_clk;  // clks of the wrapper 
    logic [NB_SENSORS-1:0]              PMB_pmbw_rstn; // reset of the wrapper 




    assign events_o[0]   = s_gpio_event;
    assign events_o[1]   = s_spim_event[0];
    assign events_o[2]   = s_spim_event[1];
    assign events_o[3]   = s_uart_event;
    assign events_o[4]   = s_i2c_event;
    assign events_o[5]   = s_i2s_event;
    assign events_o[6]   = s_i2s_cam_event;
    assign events_o[7]   = s_pmb_event;



    axi2apb_wrap
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH), 
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),  
        .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
        .APB_NUM_SLAVES(APB_NUM_SLAVES)
    )
    axi2apb_i
    (
        .clk_i(clk_i),
        .rst_ni(rst_ni),

        .axi_slave(axi_slave),

        .penable(s_penable),
        .pwrite(s_pwrite),
        .paddr(s_paddr),
        .psel(s_psel),
        .pwdata(s_pwdata),
        .prdata(s_prdata),
        .pready(s_pready),
        .pslverr(s_pslverr)
    );

    //////////////////////////////////////////////////////////////////
    ///                                                            ///
    /// APB Slave 0: APB CVP interface                             ///
    ///                                                            ///
    //////////////////////////////////////////////////////////////////
    apb_cvp_if apb_cvp_if_i 
    (
        .HCLK(clk_i),
        .HRESETn(rst_ni),

        .PADDR(s_paddr),
        .PWDATA(s_pwdata),
        .PWRITE(s_pwrite),
        .PSEL(s_psel[0]),
        .PENABLE(s_penable),
        .PRDATA(s_prdata[0]),
        .PREADY(s_pready[0]),
        .PSLVERR(s_pslverr[0]),

        .cvp1_pwr_req(cvp1_pwr_req),
        .cvp1_pwr_wr_rd(cvp1_pwr_wr_rd),
        .cvp1_pwr_add(cvp1_pwr_add),
        .cvp1_pwr_be(cvp1_pwr_be),
        .cvp1_pwr_data(cvp1_pwr_data),
        .cvp1_pwr_ack(cvp1_pwr_ack),
        .cvp1_pwr_error(cvp1_pwr_error),
        .cvp1_pwr_r_data(cvp1_pwr_r_data),

        .cvp2_pwr_req(cvp2_pwr_req),
        .cvp2_pwr_wr_rd(cvp2_pwr_wr_rd),
        .cvp2_pwr_add(cvp2_pwr_add),
        .cvp2_pwr_be(cvp2_pwr_be),
        .cvp2_pwr_data(cvp2_pwr_data),
        .cvp2_pwr_ack(cvp2_pwr_ack),
        .cvp2_pwr_error(cvp2_pwr_error),
        .cvp2_pwr_r_data(cvp2_pwr_r_data)
    );











//     apb_fll_if apb_fll_if_i
//     (
//           .HCLK(clk_i),
//           .HRESETn(rst_ni),
// 
//           .PADDR(s_paddr),
//           .PWDATA(s_pwdata),
//           .PWRITE(s_pwrite),
//           .PSEL(s_psel[0]),
//           .PENABLE(s_penable),
//           .PRDATA(s_prdata[0]),
//           .PREADY(s_pready[0]),
//           .PSLVERR(s_pslverr[0]),
// 
//           .fll1_req(fll1_req),
//           .fll1_wrn(fll1_wrn),
//           .fll1_add(fll1_add),
//           .fll1_data(fll1_data),
//           .fll1_ack(fll1_ack),
//           .fll1_r_data(fll1_r_data),
// 
//           .fll2_req(fll2_req),
//           .fll2_wrn(fll2_wrn),
//           .fll2_add(fll2_add),
//           .fll2_data(fll2_data),
//           .fll2_ack(fll2_ack),
//           .fll2_r_data(fll2_r_data)
//       );

      //////////////////////////////////////////////////////////////////
      ///                                                            ///
      /// APB Slave 1: APB GPIO interface                            ///
      ///                                                            ///
      //////////////////////////////////////////////////////////////////
      apb_gpio apb_gpio_i
      (
          .HCLK       ( clk_i        ),
          .HRESETn    ( rst_ni       ),

          .PADDR      ( s_paddr      ),
          .PWDATA     ( s_pwdata     ),
          .PWRITE     ( s_pwrite     ),
          .PSEL       ( s_psel[1]    ),
          .PENABLE    ( s_penable    ),
          .PRDATA     ( s_prdata[1]  ),
          .PREADY     ( s_pready[1]  ),
          .PSLVERR    ( s_pslverr[1] ),

          .gpio_in    ( gpio_in      ),
          .gpio_out   ( gpio_out     ),
          .gpio_dir   ( gpio_dir     ),
          .gpio_padcfg( gpio_padcfg  ),
          .interrupt  ( s_gpio_event )
      );

      //////////////////////////////////////////////////////////////////
      ///                                                            ///
      /// APB Slave 2: APB SPI Master interface                      ///
      ///                                                            ///
      //////////////////////////////////////////////////////////////////

      apb_spi_master
      #(
          .BUFFER_DEPTH(8)
      )
      apb_spi_master_i 
      (
          .HCLK      ( clk_i            ),
          .HRESETn   ( rst_ni           ),

          .PADDR     ( s_paddr          ),
          .PWDATA    ( s_pwdata         ),
          .PWRITE    ( s_pwrite         ),
          .PSEL      ( s_psel[2]        ),
          .PENABLE   ( s_penable        ),
          .PRDATA    ( s_prdata[2]      ),
          .PREADY    ( s_pready[2]      ),
          .PSLVERR   ( s_pslverr[2]     ),

          .events_o  ( s_spim_event     ),

          .spi_clk   ( spi_master_clk   ),
          .spi_csn0  ( spi_master_csn0  ),
          .spi_csn1  ( spi_master_csn1  ),
          .spi_csn2  ( spi_master_csn2  ),
          .spi_csn3  ( spi_master_csn3  ),
          .spi_mode  ( spi_master_mode  ),
          .spi_sdo0  ( spi_master_sdo0  ),
          .spi_sdo1  ( spi_master_sdo1  ),
          .spi_sdo2  ( spi_master_sdo2  ),
          .spi_sdo3  ( spi_master_sdo3  ),
          .spi_sdi0  ( spi_master_sdi0  ),
          .spi_sdi1  ( spi_master_sdi1  ),
          .spi_sdi2  ( spi_master_sdi2  ),
          .spi_sdi3  ( spi_master_sdi3  )
      );

    //////////////////////////////////////////////////////////////////
    ///                                                            ///
    /// APB Slave 3: APB UART interface                            ///
    ///                                                            ///
    //////////////////////////////////////////////////////////////////

    apb_uart i_apb_uart 
    (
        .CLK(clk_i),
        .RSTN(rst_ni),

        .PSEL(s_psel[3]),
        .PENABLE(s_penable),
        .PWRITE(s_pwrite),
        .PADDR(s_paddr[4:2]),
        .PWDATA(s_pwdata),
        .PRDATA(s_prdata[3]),
        .PREADY(s_pready[3]),
        .PSLVERR(s_pslverr[3]),

        .INT(s_uart_event),                      //Interrupt output

        .OUT1N(),                    //Output 1
        .OUT2N(),                    //Output 2
        .RTSN(uart_rts),             //RTS output
        .DTRN(uart_dtr),             //DTR output
        .CTSN(uart_cts),             //CTS input
        .DSRN(uart_dsr),             //DSR input
        .DCDN(1'b1),                 //DCD input
        .RIN(1'b1),                  //RI input
        .SIN(uart_rx),
        .SOUT(uart_tx)
    );


    //////////////////////////////////////////////////////////////////
    ///                                                            ///
    /// APB Slave 4: APB SOC configuration                         ///
    ///                                                            ///
    //////////////////////////////////////////////////////////////////

    apb_soc_ctrl
    #(
        .RM_SIZE(RM_SIZE),
        .WM_SIZE(WM_SIZE),
        .NB_CORES(NB_CORES),
        .NB_CLUSTERS(NB_CLUSTERS)
    )
    apb_clkdiv_i
    (
        .HCLK                 ( clk_i                ),
        .HRESETn              ( rst_ni               ),

        .PADDR                ( s_paddr              ),
        .PWDATA               ( s_pwdata             ),
        .PWRITE               ( s_pwrite             ),
        .PSEL                 ( s_psel[4]            ),
        .PENABLE              ( s_penable            ),
        .PRDATA               ( s_prdata[4]          ),
        .PREADY               ( s_pready[4]          ),
        .PSLVERR              ( s_pslverr[4]         ),

        .rm_l2_mem_o          ( rm_l2_mem_o          ),
        .wm_l2_mem_o          ( wm_l2_mem_o          ),
        .LS_l2_mem_o          ( LS_l2_mem_o          ),
        .HS_l2_mem_o          ( HS_l2_mem_o          ),
        .sleep_l2_mem_o       ( sleep_l2_mem_o       ),

        .pm_power_down_req_o  ( pm_power_down_req_o  ),
        .pm_cluster_rst_req_o ( pm_cluster_rst_req_o ),
        .pm_wakeup_polarity_o ( pm_wakeup_polarity_o ),
        .pm_wakeup_select_o   ( pm_wakeup_select_o   ),
        .pm_busy_cycle_o      ( pm_busy_cycle_o      ),
        .pm_rst_cycle_o       ( pm_rst_cycle_o       ),
        .pm_valid_o           ( pm_valid_o           ),
        .pm_ack_i             ( pm_ack_i             ),
        .pm_BBGEN_req_o       ( pm_BBGEN_req_o       ),
        .pm_BBGEN_dat_o       ( pm_BBGEN_dat_o       ),
        .pm_BBGEN_sel_o       ( pm_BBGEN_sel_o       ),
        
        .clk_div0_data_o      ( clk_div0_data_o      ),
        .clk_div0_valid_o     ( clk_div0_valid_o     ),
        .clk_div0_ack_i       ( clk_div0_ack_i       ),
        .clk_div1_data_o      ( clk_div1_data_o      ),
        .clk_div1_valid_o     ( clk_div1_valid_o     ),
        .clk_div1_ack_i       ( clk_div1_ack_i       ),
        .clk_div2_data_o      ( clk_div2_data_o      ),
        .clk_div2_valid_o     ( clk_div2_valid_o     ),
        .clk_div2_ack_i       ( clk_div2_ack_i       ),
        .clk_div3_data_o      ( clk_div3_data_o      ),
        .clk_div3_valid_o     ( clk_div3_valid_o     ),
        .clk_div3_ack_i       ( clk_div3_ack_i       ),
        .clk_div4_data_o      ( clk_div4_data_o      ),
        .clk_div4_valid_o     ( clk_div4_valid_o     ),
        .clk_div4_ack_i       ( clk_div4_ack_i       ),

        .pad_mux              ( pad_mux              ),
        .pad_cfg              ( pad_cfg              )
    );

    //////////////////////////////////////////////////////////////////
    ///                                                            ///
    /// APB Slave 5: APB I2C interface                             ///
    ///                                                            ///
    //////////////////////////////////////////////////////////////////

    apb_i2c #(.APB_ADDR_WIDTH(12)) i_apb_i2c
    (
        .HCLK(clk_i),
        .HRESETn(rst_ni),

        .PADDR(s_paddr),
        .PWDATA(s_pwdata),
        .PWRITE(s_pwrite),
        .PSEL(s_psel[5]),
        .PENABLE(s_penable),
        .PRDATA(s_prdata[5]),
        .PREADY(s_pready[5]),
        .PSLVERR(s_pslverr[5]),

        .interrupt_o(s_i2c_event),
        .scl_pad_i(i2c_scl_i), 
        .scl_pad_o(i2c_scl_o),
        .scl_padoen_o(i2c_scl_oe_o),
        .sda_pad_i(i2c_sda_i),
        .sda_pad_o(i2c_sda_o),
        .sda_padoen_o(i2c_sda_oe_o)
    );


    //////////////////////////////////////////////////////////////////
    ///                                                            ///
    /// APB Slave 6: APB Audio interface(8 channels)               ///
    ///                                                            ///
    //////////////////////////////////////////////////////////////////

    apb_audio 
    #(
        .APB_ADDR_WIDTH(12),
        .NUM_CHANNELS(2),
        .BUFFER_DEPTH(16)
    ) 
    i_apb_audio 
    (
        .HCLK(clk_i),
        .HRESETn(rst_ni),

        .PADDR(s_paddr),
        .PWDATA(s_pwdata),
        .PWRITE(s_pwrite),
        .PSEL(s_psel[6]),
        .PENABLE(s_penable),
        .PRDATA(s_prdata[6]),
        .PREADY(s_pready[6]),
        .PSLVERR(s_pslverr[6]),

        .ext_sck_i(1'b0),
        .ext_ws_i(1'b0),
        .ext_sd_i(audio_i2s_sd_i[1:0]),
        .ext_sck_o(audio_i2s_sck_o),
        .ext_ws_o(audio_i2s_ws_o),

        .int_o(s_i2s_event),
        .err_o()
    );

    //////////////////////////////////////////////////////////////////
    ///                                                            ///
    /// APB Slave 7: APB CAM interface(2 channels)                 ///
    ///                                                            ///
    //////////////////////////////////////////////////////////////////

    apb_audio 
    #(
        .APB_ADDR_WIDTH(12),
        .NUM_CHANNELS(2),
        .BUFFER_DEPTH(16)
    )
    i_apb_cam
    (
         .HCLK(clk_i),
         .HRESETn(rst_ni),

         .PADDR(s_paddr),
         .PWDATA(s_pwdata),
         .PWRITE(s_pwrite),
         .PSEL(s_psel[7]),
         .PENABLE(s_penable),
         .PRDATA(s_prdata[7]),
         .PREADY(s_pready[7]),
         .PSLVERR(s_pslverr[7]),

         .ext_sck_i(1'b0),
         .ext_ws_i(1'b0),
         .ext_sd_i(cam_i2s_sd_i),
         .ext_sck_o(cam_i2s_sck_o),
         .ext_ws_o(cam_i2s_ws_o),

         .int_o(s_i2s_cam_event),
         .err_o()
    );



    //////////////////////////////////////////////////////////////////
    ///                                                            ///
    /// APB Slave 8: APB Charge Pump interface                     ///
    ///                                                            ///
    //////////////////////////////////////////////////////////////////
    apb_cvp_if axi_cp_if_i 
    (
        .HCLK(clk_i),
        .HRESETn(rst_ni),

        .PADDR(s_paddr),
        .PWDATA(s_pwdata),
        .PWRITE(s_pwrite),
        .PSEL(s_psel[8]),
        .PENABLE(s_penable),
        .PRDATA(s_prdata[8]),
        .PREADY(s_pready[8]),
        .PSLVERR(s_pslverr[8]),

        .cvp1_pwr_req(cp1_pwr_req),
        .cvp1_pwr_wr_rd(cp1_pwr_wr_rd),
        .cvp1_pwr_add(cp1_pwr_add),
        .cvp1_pwr_be(cp1_pwr_be),
        .cvp1_pwr_data(cp1_pwr_data),
        .cvp1_pwr_ack(cp1_pwr_ack),
        .cvp1_pwr_error(cp1_pwr_error),
        .cvp1_pwr_r_data(cp1_pwr_r_data),

        .cvp2_pwr_req(cp2_pwr_req),
        .cvp2_pwr_wr_rd(cp2_pwr_wr_rd),
        .cvp2_pwr_add(cp2_pwr_add),
        .cvp2_pwr_be(cp2_pwr_be),
        .cvp2_pwr_data(cp2_pwr_data),
        .cvp2_pwr_ack(cp2_pwr_ack),
        .cvp2_pwr_error(cp2_pwr_error),
        .cvp2_pwr_r_data(cp2_pwr_r_data)
    );



// NOT USED ON FPGA VERSION
/*
    //////////////////////////////////////////////////////////////////
    ///                                                            ///
    /// APB Slave 9:Process Monitor COntroller                     ///
    ///                                                            ///
    //////////////////////////////////////////////////////////////////
    C28SOI_PM_CONTROL_LR_ASYNC_master_controller 
    #(
        .k_count_total_sensor( NB_SENSORS ),
        .DR_LENGTH(DR_LENGTH),
        .REF_COUNTER_LENGTH(REF_COUNTER_LENGTH),
        .SENSOR_CTRL_LENGTH(SENSOR_CTRL_LENGTH),
        .SENSOR_STAT_LENGTH(SENSOR_STAT_LENGTH),
        .k_COUNTER_SIZE(k_COUNTER_SIZE),
        .IR_LENGTH(IR_LENGTH),
        .k_SENS_CTRL_ADDRESS(k_SENS_CTRL_ADDRESS),
        .k_REF_COUNTER_ADDRESS(k_REF_COUNTER_ADDRESS),
        .k_SENS_STAT_ADDRESS(k_SENS_STAT_ADDRESS),
        .k_APBIF_MODE(k_APBIF_MODE),
        .k_JTAGIF_MODE(k_JTAGIF_MODE),
        .k_DEBUG_MODE(k_DEBUG_MODE),
        .k_PARALLEL_MODE(k_PARALLEL_MODE),
        .IDCODE_LENGTH(IDCODE_LENGTH),
        .IDCODE_VALUE(IDCODE_VALUE),
        .k_APB_ADDRESS_LENGTH(k_APB_ADDRESS_LENGTH),
        .k_APB_DATA_LENGTH(k_APB_DATA_LENGTH),
        .SENS_RING_COUNT(SENS_RING_COUNT)
    )
    u_C28SOI_PM_CONTROL_LR_ASYNC_master_controller 
    (
        .clk                ( test_clk_i          ),             // Test clock.
        .rst_n              ( rst_ni              ),             // Test reset(active low)
        // TAP controller inputs / outputs 
        .tdi                ( 1'b0 ),            // Test data input. 
        .tdo                (      ),            // Test data output.
        .tms                ( 1'b0 ),            // Test mode selection. 
        .tdo_en_n           (      ),            // tdo enable output (active low)

        // APB interface inputs / outputs
        .pclk               ( clk_i               ),           // APB  clock
        .presetn            ( rst_ni              ),
        .paddr              ( {20'h00000,s_paddr} ),
        .pwdata             ( s_pwdata            ),
        .pwrite             ( s_pwrite            ),
        .psel               ( s_psel[9]           ),
        .penable            ( s_penable           ),
        .prdata             ( s_prdata[9]         ),
        .pready             ( s_pready[9]         ),
        .pslverr            ( s_pslverr[9]        ), 

        // Parallel Interface
        .ref_counter_i      ( '0                  ),
        .sensor_ctrl_i      ( '0                  ),
        .sensor_stat_o      (                     ),


        .mode               ( k_APBIF_MODE        ), // 2'b00 --> APB

        // Direct Interface
        .dataready          ( s_pmb_event         ), // output
        .aux                ( '0                  ), // External input.
        .dbg                (                     ), // Direct sensor output


        // I/O to PMB Logic Wrapper
        .serial_out         ( PMB_serial_out_i     ), // input
        .sensors_data       ( '0                   ), // input --> ONLY in debug mode
        .serial_in          ( PMB_serial_in_o      ), // output
        .shift_en           ( PMB_shift_en_o       ), // output
        .select_ctr         ( PMB_select_ctr_o     ), // output
        .pmbw_req           ( PMB_pmbw_req_o       ), // output 
        .pmbw_ack           ( PMB_pmbw_ack_i       ), // input 
  
        .tcr_muxclk_mode    ( test_mode_i        ), // Test mode for scan chain.
        .tcr_noinvert_clk   ( test_mode_i        ), // Test mode for scan chain.
        .tst_reset_mux0     ( test_mode_i        )  // Test mode for scan chain.
    );
*/

endmodule
