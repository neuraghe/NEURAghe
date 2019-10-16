//`timescale 1ns/1ps
`include "ulpsoc_defines.sv"
`include "tb_jtag_pkg.sv"

`define JTAG_DPI     1'b1

`define SPI_STD     2'b00
`define SPI_QUAD_TX 2'b01
`define SPI_QUAD_RX 2'b10

`define SPI_SEMIPERIOD      50000    //10Mhz SPI CLK
//`define REF_CLK_SEMIPERIOD  15259000 //32.768 Hz REF CLK
`define REF_CLK_SEMIPERIOD  12500 //40MHz REF CLK
//`define REF_CLK_SEMIPERIOD  500 //100MHz REF CLK

`define FAST_CLOCK 1 // 1->yes, 0->no

`define BRAM_RAMLOOP(I) \
(tb.i_dut.cluster_i.tcdm_sram_island.banks_gen[0].bram_bank_gen.bank_4096_gen.tcdm_bank_i.U0.inst_blk_mem_gen.\gnativebmg.native_blk_mem_gen .\valid.cstr .\ramloop[ ``I``\].ram.r .\prim_noinit.ram .\DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram .genblk1.INT_RAMB_TDP.mem)


`define VIVADO_16_2_OR_LOWER

`ifdef VIVADO_16_2_OR_LOWER
  `define L2_BRAM_RAMLOOP(I) \
  (tb.i_dut.l2_ram_i.genblk2.l2_mem_i.U0.inst_blk_mem_gen.\gnativebmg.native_blk_mem_gen .\valid.cstr .\ramloop[ ``I``\].ram.r .\prim_noinit.ram .\DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram .genblk1.INT_RAMB_TDP.mem)
`else
  `define L2_BRAM_RAMLOOP(I) \
  (tb.i_dut.l2_ram_i.genblk2.l2_mem_i.U0.inst_blk_mem_gen.\gnbram.gnativebmg.native_blk_mem_gen .\valid.cstr .\ramloop[ ``I``\].ram.r .\prim_noinit.ram .\DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram .genblk1.INT_RAMB_TDP.mem)
`endif
  
  `define DDR_W0_BRAM_RAMLOOP(I) (tb.DDR0_for_wei_test.U0.inst_blk_mem_gen.\gaxibmg.axi_blk_mem_gen .\valid.cstr .\ramloop[ ``I``\].ram.r .\prim_noinit.ram .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram .genblk1.INT_RAMB_TDP.mem)
  `define DDR_W1_BRAM_RAMLOOP(I) (tb.DDR1_for_wei_test.U0.inst_blk_mem_gen.\gaxibmg.axi_blk_mem_gen .\valid.cstr .\ramloop[ ``I``\].ram.r .\prim_noinit.ram .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram .genblk1.INT_RAMB_TDP.mem)
  `define DDR_X_BRAM_RAMLOOP(I) (tb.DDR_for_dma_test.U0.inst_blk_mem_gen.\gaxibmg.axi_blk_mem_gen .\valid.cstr .\ramloop[ ``I``\].ram.r .\prim_noinit.ram .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram .genblk1.INT_RAMB_TDP.mem)




  
`define DELAY_BETWEEN_SPI   100000

`define RND_SEED 12345678
`define L2_SIZE  32768

//`define TEST_CLK_DIV 1

module tb;

  parameter  LOAD_L2       = "ARM_SIM_PRELOAD";   // valid values are "SPI", "JTAG", "STANDALONE" "PRELOAD", "" (no load of L2) "PRELOAD_XILINX";
  parameter  FLASH_PROGRAM = 0;       // if you like to use the flash programming mode
  parameter  ENABLE_DPI    = 0;
  parameter  BAUDRATE      = 467702;
  parameter  INTERNAL_EOC  = "TRUE";
  parameter  ENABLE_BBGENBP = "TRUE";
  parameter  EXEC_TEST     = ""; //available tests are
                                 //1-CLK_BYPASS
                                 //2-HOST
                                 //3-DEBUG
                                 //4-MEMTEST
                                 // SPISLAVE
 

  localparam NB_CORES = `NB_CORES;
  
  localparam CONV_WIDTH  = 16; //legal values 16 or 8

  logic                 s_rst_n;
  logic                 s_clk_ref;
  logic                 s_clk_ref_fast;

  tri                   sspi_sio0;
  tri                   sspi_sio1;
  tri                   sspi_sio2;
  tri                   sspi_sio3;
  tri                   sspi_csn;
  tri                   sspi_sck;

  tri                   spi_master_sdio0;
  tri                   spi_master_sdio1;
  tri                   spi_master_sdio2;
  tri                   spi_master_sdio3;
  tri                   spi_master_csn0;
  tri                   spi_master_csn1;
  tri                   spi_master_csn3;
  tri                   spi_master_sck;

  tri                   s_i2c_scl;
  tri                   s_i2c_sda;

  logic [1:0]           padmode_spi_master;
  logic                 spi_csn;
  logic                 spi_sck;
  logic                 spi_sdi0;
  logic                 spi_sdi1;
  logic                 spi_sdi2;
  logic                 spi_sdi3;
  logic                 spi_sdo0;
  logic                 spi_sdo1;
  logic                 spi_sdo2;
  logic                 spi_sdo3;

  logic                 s_dbg_wen;
  logic [0:0]           s_dbg_csn;
  logic                 s_dbg_req;
  logic [31:0]          s_dbg_add;
  logic [7:0]           s_dbg_be;
  logic [63:0]          s_dbg_wdata;
  logic [63:0]          s_dbg_rdata;

  logic [63:0]          data_rd;

  tri                   uart_rx;
  logic                 uart_rx_en;

  logic [95:0]          stimuli  [10000:0];                // array for the stimulus vectors
  logic [95:0]          expected [10000:0];                // array for the expected vectors
  int                   num_stim,num_exp,num_cycles,num_err = 0;   // counters for statistics

  logic                 more_stim = 1;

  logic [63:0]          spi_data;
  logic [31:0]          spi_addr;
  logic [31:0]          spi_addr_old;

  logic r_power_up;
  wire w_power_up;
  wire w_power_down;

  wire                 s_eoc;
  wire                 s_trigger; // this signal is used to turn vcd dumps on and off
  wire                 wire_rst_n;
  wire                 wire_clk_ref;
  wire                 wire_clk_ref_fast;
  wire                 wire_clk_dma_wei;
  wire                 wire_clk_ref_1;
  wire                 wire_mode_select;
  logic                 fetch_enable;

  wire                 s_i2s_sck;
  wire                 s_i2s_ws;
  wire           [7:0] s_i2s_data;

  pullup sda_pullup_i (s_i2c_sda);
  pullup scl_pullup_i (s_i2c_scl);

  wire                w_trstn ;
  wire                w_tck   ;
  wire                w_tdi   ;
  wire                w_tms   ;
  wire                w_tdo;

  logic               jtag_mux = 1'b0;

  logic               s_vpi_trstn;
  logic               s_vpi_tck;
  logic               s_vpi_tdi;
  logic               s_vpi_tms;

  logic               s_trstn;
  logic               s_tck  ;
  logic               s_tdi  ;
  logic               s_tms  ;
  logic               s_tdo;
  logic               s_mode_select;

  logic [255:0][63:0]  jtag_data;
  logic  [31:0]        jtag_addr;
  integer              jtag_burst_len;

  wire w_host_interrupt;
  wire w_pulp_interrupt;

  wire s_i2s_data_0_pad;
  wire s_i2s_data_1_pad;



  int unsigned  temp_fetch_enable;


  assign wire_rst_n        = s_rst_n;
  assign wire_clk_ref      = s_clk_ref;
  assign wire_clk_ref_fast = s_clk_ref_fast;
  assign wire_clk_dma_wei  = s_clk_ref_fast;
  assign wire_clk_ref_1    = 1'b0;
  
  /*

`include "tb_spi_pkg.sv"
  // JTAG signals
  assign w_trstn = (jtag_mux == `JTAG_DPI) ? s_vpi_trstn : s_trstn;
  assign w_tck   = (jtag_mux == `JTAG_DPI) ? s_vpi_tck   : s_tck;
  assign w_tdi   = (jtag_mux == `JTAG_DPI) ? s_vpi_tdi   : s_tdi;
  assign w_tms   = (jtag_mux == `JTAG_DPI) ? s_vpi_tms   : s_tms;
  assign s_tdo = w_tdo;
  assign wire_mode_select = s_mode_select;


  generate if(ENABLE_DPI == 1)
  begin
    // JTAG VERIFICATION IP
    jtag_dpi
    #(
      .TIMEOUT_COUNT ( 6'h2 )
      )
    i_jtag
    (
      .clk_i    ( wire_clk_ref          ),
      .enable_i ( jtag_mux == `JTAG_DPI ),

      .tms_o    ( s_vpi_tms    ),
      .tck_o    ( s_vpi_tck    ),
      .trst_o   ( s_vpi_trstn  ),
      .tdi_o    ( s_vpi_tdi    ),
      .tdo_i    ( s_tdo        )
     );
  end
  endgenerate


  //-------------------------------------------------------------------------------------------------------//
  //TRACING
  //-------------------------------------------------------------------------------------------------------//
  genvar                i;
  integer               IOFILE[NB_CORES];
  string                FILENAME[NB_CORES];
  string                FILE_ID;
  int unsigned          index, j;

  logic                 is_Read[NB_CORES];

  initial
  begin
      for(index = 0; index < NB_CORES; index++)
      begin : _CREATE_IO_FILES_
          FILE_ID.itoa(index);
          FILENAME[index] = { "CORE_", FILE_ID, ".txt" };
          IOFILE[index]   = $fopen(FILENAME[index],"w");
          is_Read[index]  = 0;
      end
   end
   */
  //-------------------------------------------------------------------------------------------------------//
  // End Tracing
  //-------------------------------------------------------------------------------------------------------//
/*
   spi_master_padframe i_padframe
   (
     .padmode_spi_master(padmode_spi_master),
     .spi_master_csn (spi_csn),
     .spi_master_sck (spi_sck),
     .spi_master_sdi0(spi_sdi0),
     .spi_master_sdi1(spi_sdi1),
     .spi_master_sdi2(spi_sdi2),
     .spi_master_sdi3(spi_sdi3),
     .spi_master_sdo0(spi_sdo0),
     .spi_master_sdo1(spi_sdo1),
     .spi_master_sdo2(spi_sdo2),
     .spi_master_sdo3(spi_sdo3),

     .MSPI_SIO0_PAD(MSPI_SIO0_PAD),
     .MSPI_SIO1_PAD(MSPI_SIO1_PAD),
     .MSPI_SIO2_PAD(MSPI_SIO2_PAD),
     .MSPI_SIO3_PAD(MSPI_SIO3_PAD),
     .MSPI_CSN_PAD(MSPI_CSN_PAD),
     .MSPI_SCK_PAD(MSPI_SCK_PAD)
   );
   

   // spansion spi flash
   s25fs256s 
   #(
     .mem_file_name("slm_files/flash_stim.slm")
   ) 
   i_spi_flash_csn0
   (
     .SI(spi_master_sdio0),
     .SO(spi_master_sdio1),
     .SCK(spi_master_sck),
     .CSNeg(spi_master_csn0),
     .WPNeg(spi_master_sdio2),
     .RESETNeg(spi_master_sdio3)
   );

    M24FC1025 i_i2c_mem_0 (
            .A0(1'b0),
            .A1(1'b0),
            .A2(1'b1),
            .WP(1'b0),
            .SDA(s_i2c_sda),
            .SCL(s_i2c_scl),
            .RESET(1'b0));

    M24FC1025 i_i2c_mem_1 (
            .A0(1'b1),
            .A1(1'b0),
            .A2(1'b1),
            .WP(1'b0),
            .SDA(s_i2c_sda),
            .SCL(s_i2c_scl),
            .RESET(1'b0));

    i2s_vip #(.I2S_CHAN(0)) i_i2s_vip_ch0 (
            .A0(1'b0),
            .A1(1'b1),
            .SDA(s_i2c_sda),
            .SCL(s_i2c_scl),
            .sck(s_i2s_sck),
            .ws(s_i2s_ws),
            .data_o(s_i2s_data[0])
        );

    i2s_vip #(.I2S_CHAN(1)) i_i2s_vip_ch1 (
            .A0(1'b1),
            .A1(1'b1),
            .SDA(s_i2c_sda),
            .SCL(s_i2c_scl),
            .sck(s_i2s_sck),
            .ws(s_i2s_ws),
            .data_o(s_i2s_data[1])
        );

*/

     logic        stdout_master_aw_valid;
     logic        stdout_master_aw_lock;
     logic        stdout_master_aw_ready;     
     logic [31:0] stdout_master_aw_addr;
     logic [2:0]  stdout_master_aw_prot;
     logic [3:0]  stdout_master_aw_region;
     logic [7:0]  stdout_master_aw_len;
     logic [2:0]  stdout_master_aw_size;
     logic [1:0]  stdout_master_aw_burst;
     logic [3:0]  stdout_master_aw_cache;
     logic [3:0]  stdout_master_aw_qos;
     logic [3:0]  stdout_master_aw_id;
     logic [5:0]  stdout_master_aw_user;
      
     logic        stdout_master_ar_valid;
     logic        stdout_master_ar_lock;
     logic [31:0] stdout_master_ar_addr;
     logic [2:0]  stdout_master_ar_prot;
     logic [3:0]  stdout_master_ar_region;
     logic [7:0]  stdout_master_ar_len;
     logic [2:0]  stdout_master_ar_size;
     logic [1:0]  stdout_master_ar_burst;
     logic [3:0]  stdout_master_ar_cache;
     logic [3:0]  stdout_master_ar_qos;
     logic [3:0]  stdout_master_ar_id;     
     logic        stdout_master_ar_ready;
     logic [5:0]  stdout_master_ar_user;
      
     logic        stdout_master_w_valid;
     logic        stdout_master_w_last;
     logic        stdout_master_w_ready;
     logic [63:0] stdout_master_w_data;
     logic [7:0]  stdout_master_w_strb;
     logic [5:0]  stdout_master_w_user;
      
     logic        stdout_master_r_valid;
     logic        stdout_master_r_last;
     logic        stdout_master_r_ready;
     logic [63:0] stdout_master_r_data;
     logic [1:0]  stdout_master_r_resp;
     logic [3:0]  stdout_master_r_id;
     logic [5:0]  stdout_master_r_user;
      
     logic        stdout_master_b_valid;
     logic        stdout_master_b_ready;     
     logic [1:0]  stdout_master_b_resp;
     logic [3:0]  stdout_master_b_id;
     logic [5:0]  stdout_master_b_user;

     logic        to_ps_bus_aw_valid;
     logic        to_ps_bus_aw_lock;
     logic        to_ps_bus_aw_ready;     
     logic [31:0] to_ps_bus_aw_addr;
     logic [2:0]  to_ps_bus_aw_prot;
     logic [3:0]  to_ps_bus_aw_region;
     logic [7:0]  to_ps_bus_aw_len;
     logic [2:0]  to_ps_bus_aw_size;
     logic [1:0]  to_ps_bus_aw_burst;
     logic [3:0]  to_ps_bus_aw_cache;
     logic [3:0]  to_ps_bus_aw_qos;
     logic [3:0]  to_ps_bus_aw_id;
     logic [5:0]  to_ps_bus_aw_user;
      
     logic        to_ps_bus_ar_valid;
     logic        to_ps_bus_ar_lock;
     logic [31:0] to_ps_bus_ar_addr;
     logic [2:0]  to_ps_bus_ar_prot;
     logic [3:0]  to_ps_bus_ar_region;
     logic [7:0]  to_ps_bus_ar_len;
     logic [2:0]  to_ps_bus_ar_size;
     logic [1:0]  to_ps_bus_ar_burst;
     logic [3:0]  to_ps_bus_ar_cache;
     logic [3:0]  to_ps_bus_ar_qos;
     logic [3:0]  to_ps_bus_ar_id;     
     logic        to_ps_bus_ar_ready;
     logic [5:0]  to_ps_bus_ar_user;
      
     logic        to_ps_bus_w_valid;
     logic        to_ps_bus_w_last;
     logic        to_ps_bus_w_ready;
     logic [63:0] to_ps_bus_w_data;
     logic [7:0]  to_ps_bus_w_strb;
     logic [5:0]  to_ps_bus_w_user;
      
     logic        to_ps_bus_r_valid;
     logic        to_ps_bus_r_last;
     logic        to_ps_bus_r_ready;
     logic [63:0] to_ps_bus_r_data;
     logic [1:0]  to_ps_bus_r_resp;
     logic [3:0]  to_ps_bus_r_id;
     logic [5:0]  to_ps_bus_r_user;
      
     logic        to_ps_bus_b_valid;
     logic        to_ps_bus_b_ready;     
     logic [1:0]  to_ps_bus_b_resp;
     logic [3:0]  to_ps_bus_b_id;
     logic [5:0]  to_ps_bus_b_user;




     logic        from_ps_bus_aw_valid;
     logic        from_ps_bus_aw_lock;
     logic        from_ps_bus_aw_ready;     
     logic [31:0] from_ps_bus_aw_addr;
     logic [2:0]  from_ps_bus_aw_prot;
     logic [3:0]  from_ps_bus_aw_region;
     logic [7:0]  from_ps_bus_aw_len;
     logic [2:0]  from_ps_bus_aw_size;
     logic [1:0]  from_ps_bus_aw_burst;
     logic [3:0]  from_ps_bus_aw_cache;
     logic [3:0]  from_ps_bus_aw_qos;
     logic [9:0]  from_ps_bus_aw_id;
     logic [5:0]  from_ps_bus_aw_user;
      
     logic        from_ps_bus_ar_valid;
     logic        from_ps_bus_ar_lock;
     logic [31:0] from_ps_bus_ar_addr;
     logic [2:0]  from_ps_bus_ar_prot;
     logic [3:0]  from_ps_bus_ar_region;
     logic [7:0]  from_ps_bus_ar_len;
     logic [2:0]  from_ps_bus_ar_size;
     logic [1:0]  from_ps_bus_ar_burst;
     logic [3:0]  from_ps_bus_ar_cache;
     logic [3:0]  from_ps_bus_ar_qos;
     logic [9:0]  from_ps_bus_ar_id;     
     logic        from_ps_bus_ar_ready;
     logic [5:0]  from_ps_bus_ar_user;
      
     logic        from_ps_bus_w_valid;
     logic        from_ps_bus_w_last;
     logic        from_ps_bus_w_ready;
     logic [63:0] from_ps_bus_w_data;
     logic [7:0]  from_ps_bus_w_strb;
     logic [5:0]  from_ps_bus_w_user;
      
     logic        from_ps_bus_r_valid;
     logic        from_ps_bus_r_last;
     logic        from_ps_bus_r_ready;
     logic [63:0] from_ps_bus_r_data;
     logic [1:0]  from_ps_bus_r_resp;
     logic [9:0]  from_ps_bus_r_id;
     logic [5:0]  from_ps_bus_r_user;
      
     logic        from_ps_bus_b_valid;
     logic        from_ps_bus_b_ready;     
     logic [1:0]  from_ps_bus_b_resp;
     logic [9:0]  from_ps_bus_b_id;
     logic [5:0]  from_ps_bus_b_user;



     logic        dma2ddr_bus_aw_valid;
     logic        dma2ddr_bus_aw_lock;
     logic        dma2ddr_bus_aw_ready;     
     logic [31:0] dma2ddr_bus_aw_addr;
     logic [2:0]  dma2ddr_bus_aw_prot;
     logic [3:0]  dma2ddr_bus_aw_region;
     logic [7:0]  dma2ddr_bus_aw_len;
     logic [2:0]  dma2ddr_bus_aw_size;
     logic [1:0]  dma2ddr_bus_aw_burst;
     logic [3:0]  dma2ddr_bus_aw_cache;
     logic [3:0]  dma2ddr_bus_aw_qos;
     logic [3:0]  dma2ddr_bus_aw_id;
     logic [5:0]  dma2ddr_bus_aw_user;
      
     logic        dma2ddr_bus_ar_valid;
     logic        dma2ddr_bus_ar_lock;
     logic [31:0] dma2ddr_bus_ar_addr;
     logic [2:0]  dma2ddr_bus_ar_prot;
     logic [3:0]  dma2ddr_bus_ar_region;
     logic [7:0]  dma2ddr_bus_ar_len;
     logic [2:0]  dma2ddr_bus_ar_size;
     logic [1:0]  dma2ddr_bus_ar_burst;
     logic [3:0]  dma2ddr_bus_ar_cache;
     logic [3:0]  dma2ddr_bus_ar_qos;
     logic [3:0]  dma2ddr_bus_ar_id;     
     logic        dma2ddr_bus_ar_ready;
     logic [5:0]  dma2ddr_bus_ar_user;
      
     logic        dma2ddr_bus_w_valid;
     logic        dma2ddr_bus_w_last;
     logic        dma2ddr_bus_w_ready;
     logic [63:0] dma2ddr_bus_w_data;
     logic [7:0]  dma2ddr_bus_w_strb;
     logic [5:0]  dma2ddr_bus_w_user;
      
     logic        dma2ddr_bus_r_valid;
     logic        dma2ddr_bus_r_last;
     logic        dma2ddr_bus_r_ready;
     logic [63:0] dma2ddr_bus_r_data;
     logic [1:0]  dma2ddr_bus_r_resp;
     logic [3:0]  dma2ddr_bus_r_id;
     logic [5:0]  dma2ddr_bus_r_user;
      
     logic        dma2ddr_bus_b_valid;
     logic        dma2ddr_bus_b_ready;     
     logic [1:0]  dma2ddr_bus_b_resp;
     logic [3:0]  dma2ddr_bus_b_id;
     logic [5:0]  dma2ddr_bus_b_user;
     
     //DDR0 wei
     
     logic        wei2ddr0_bus_aw_valid;
     logic        wei2ddr0_bus_aw_lock;
     logic        wei2ddr0_bus_aw_ready;     
     logic [31:0] wei2ddr0_bus_aw_addr;
     logic [2:0]  wei2ddr0_bus_aw_prot;
     logic [3:0]  wei2ddr0_bus_aw_region;
     logic [7:0]  wei2ddr0_bus_aw_len;
     logic [2:0]  wei2ddr0_bus_aw_size;
     logic [1:0]  wei2ddr0_bus_aw_burst;
     logic [3:0]  wei2ddr0_bus_aw_cache;
     logic [3:0]  wei2ddr0_bus_aw_qos;
     logic [3:0]  wei2ddr0_bus_aw_id;
     logic [5:0]  wei2ddr0_bus_aw_user;
      
     logic        wei2ddr0_bus_ar_valid;
     logic        wei2ddr0_bus_ar_lock;
     logic [31:0] wei2ddr0_bus_ar_addr;
     logic [2:0]  wei2ddr0_bus_ar_prot;
     logic [3:0]  wei2ddr0_bus_ar_region;
     logic [7:0]  wei2ddr0_bus_ar_len;
     logic [2:0]  wei2ddr0_bus_ar_size;
     logic [1:0]  wei2ddr0_bus_ar_burst;
     logic [3:0]  wei2ddr0_bus_ar_cache;
     logic [3:0]  wei2ddr0_bus_ar_qos;
     logic [3:0]  wei2ddr0_bus_ar_id;     
     logic        wei2ddr0_bus_ar_ready;
     logic [5:0]  wei2ddr0_bus_ar_user;
      
     logic        wei2ddr0_bus_w_valid;
     logic        wei2ddr0_bus_w_last;
     logic        wei2ddr0_bus_w_ready;
     logic [63:0] wei2ddr0_bus_w_data;
     logic [7:0]  wei2ddr0_bus_w_strb;
     logic [5:0]  wei2ddr0_bus_w_user;
      
     logic        wei2ddr0_bus_r_valid;
     logic        wei2ddr0_bus_r_last;
     logic        wei2ddr0_bus_r_ready;
     logic [63:0] wei2ddr0_bus_r_data;
     logic [1:0]  wei2ddr0_bus_r_resp;
     logic [3:0]  wei2ddr0_bus_r_id;
     logic [5:0]  wei2ddr0_bus_r_user;
      
     logic        wei2ddr0_bus_b_valid;
     logic        wei2ddr0_bus_b_ready;     
     logic [1:0]  wei2ddr0_bus_b_resp;
     logic [3:0]  wei2ddr0_bus_b_id;
     logic [5:0]  wei2ddr0_bus_b_user;
     
     //DDR1 wei
     
     logic        wei2ddr1_bus_aw_valid;
     logic        wei2ddr1_bus_aw_lock;
     logic        wei2ddr1_bus_aw_ready;     
     logic [31:0] wei2ddr1_bus_aw_addr;
     logic [2:0]  wei2ddr1_bus_aw_prot;
     logic [3:0]  wei2ddr1_bus_aw_region;
     logic [7:0]  wei2ddr1_bus_aw_len;
     logic [2:0]  wei2ddr1_bus_aw_size;
     logic [1:0]  wei2ddr1_bus_aw_burst;
     logic [3:0]  wei2ddr1_bus_aw_cache;
     logic [3:0]  wei2ddr1_bus_aw_qos;
     logic [3:0]  wei2ddr1_bus_aw_id;
     logic [5:0]  wei2ddr1_bus_aw_user;
      
     logic        wei2ddr1_bus_ar_valid;
     logic        wei2ddr1_bus_ar_lock;
     logic [31:0] wei2ddr1_bus_ar_addr;
     logic [2:0]  wei2ddr1_bus_ar_prot;
     logic [3:0]  wei2ddr1_bus_ar_region;
     logic [7:0]  wei2ddr1_bus_ar_len;
     logic [2:0]  wei2ddr1_bus_ar_size;
     logic [1:0]  wei2ddr1_bus_ar_burst;
     logic [3:0]  wei2ddr1_bus_ar_cache;
     logic [3:0]  wei2ddr1_bus_ar_qos;
     logic [3:0]  wei2ddr1_bus_ar_id;     
     logic        wei2ddr1_bus_ar_ready;
     logic [5:0]  wei2ddr1_bus_ar_user;
      
     logic        wei2ddr1_bus_w_valid;
     logic        wei2ddr1_bus_w_last;
     logic        wei2ddr1_bus_w_ready;
     logic [63:0] wei2ddr1_bus_w_data;
     logic [7:0]  wei2ddr1_bus_w_strb;
     logic [5:0]  wei2ddr1_bus_w_user;
      
     logic        wei2ddr1_bus_r_valid;
     logic        wei2ddr1_bus_r_last;
     logic        wei2ddr1_bus_r_ready;
     logic [63:0] wei2ddr1_bus_r_data;
     logic [1:0]  wei2ddr1_bus_r_resp;
     logic [3:0]  wei2ddr1_bus_r_id;
     logic [5:0]  wei2ddr1_bus_r_user;
      
     logic        wei2ddr1_bus_b_valid;
     logic        wei2ddr1_bus_b_ready;     
     logic [1:0]  wei2ddr1_bus_b_resp;
     logic [3:0]  wei2ddr1_bus_b_id;
     logic [5:0]  wei2ddr1_bus_b_user;
   /*
   
██╗   ██╗██╗     ██████╗ ███████╗ ██████╗  ██████╗
██║   ██║██║     ██╔══██╗██╔════╝██╔═══██╗██╔════╝
██║   ██║██║     ██████╔╝███████╗██║   ██║██║     
██║   ██║██║     ██╔═══╝ ╚════██║██║   ██║██║     
╚██████╔╝███████╗██║     ███████║╚██████╔╝╚██████╗
 ╚═════╝ ╚══════╝╚═╝     ╚══════╝ ╚═════╝  ╚═════╝
                                                  
   */
   
   
       
   ulpsoc i_dut
        (
            .test_mode_i        ( 1'b0      ),
            .mode_select_i      ( 1'b0   ),
            .fetch_en_i         ( fetch_enable        ),
            .eoc_o              (       ),
            .rstn_sync_i        ( wire_rst_n ),
            .clk_soc_i          ( wire_clk_ref      ),
            .clk_cluster_fast_i ( wire_clk_ref_fast ),
            .clk_wmem_i         ( wire_clk_dma_wei  ),
            .return_o           (        ),
            
            .stdout_master_aw_ready ,
            .stdout_master_aw_valid ,
            .stdout_master_aw_lock,   
            .stdout_master_aw_addr,
            .stdout_master_aw_prot,
            .stdout_master_aw_region,
            .stdout_master_aw_len,
            .stdout_master_aw_size,
            .stdout_master_aw_burst,
            .stdout_master_aw_cache,
            .stdout_master_aw_qos,
            .stdout_master_aw_id,
            .stdout_master_aw_user,
     
            .stdout_master_ar_ready,
            .stdout_master_ar_valid,
            .stdout_master_ar_lock,
            .stdout_master_ar_addr,
            .stdout_master_ar_prot,
            .stdout_master_ar_region,
            .stdout_master_ar_len,
            .stdout_master_ar_size,
            .stdout_master_ar_burst,
            .stdout_master_ar_cache,
            .stdout_master_ar_qos,
            .stdout_master_ar_id,     
            .stdout_master_ar_user,
            
            .stdout_master_w_ready,
            .stdout_master_w_valid,
            .stdout_master_w_last,
            .stdout_master_w_data,
            .stdout_master_w_strb,
            .stdout_master_w_user,
     
            .stdout_master_b_id,
            .stdout_master_b_resp,
            .stdout_master_b_valid,
            .stdout_master_b_user,
            .stdout_master_b_ready, 

            .stdout_master_r_id,
            .stdout_master_r_data,
            .stdout_master_r_resp,
            .stdout_master_r_last,
            .stdout_master_r_user,
            .stdout_master_r_valid,
            .stdout_master_r_ready,
            
            // ##############################
            
            .to_ps_bus_aw_ready ,
            .to_ps_bus_aw_valid ,
            .to_ps_bus_aw_lock,   
            .to_ps_bus_aw_addr,
            .to_ps_bus_aw_prot,
            .to_ps_bus_aw_region,
            .to_ps_bus_aw_len,
            .to_ps_bus_aw_size,
            .to_ps_bus_aw_burst,
            .to_ps_bus_aw_cache,
            .to_ps_bus_aw_qos,
            .to_ps_bus_aw_id,
            .to_ps_bus_aw_user,
     
            .to_ps_bus_ar_ready,
            .to_ps_bus_ar_valid,
            .to_ps_bus_ar_lock,
            .to_ps_bus_ar_addr,
            .to_ps_bus_ar_prot,
            .to_ps_bus_ar_region,
            .to_ps_bus_ar_len,
            .to_ps_bus_ar_size,
            .to_ps_bus_ar_burst,
            .to_ps_bus_ar_cache,
            .to_ps_bus_ar_qos,
            .to_ps_bus_ar_id,     
            .to_ps_bus_ar_user,
            
            .to_ps_bus_w_ready,
            .to_ps_bus_w_valid,
            .to_ps_bus_w_last,
            .to_ps_bus_w_data,
            .to_ps_bus_w_strb,
            .to_ps_bus_w_user,
     
            .to_ps_bus_b_id,
            .to_ps_bus_b_resp,
            .to_ps_bus_b_valid,
            .to_ps_bus_b_user,
            .to_ps_bus_b_ready, 

            .to_ps_bus_r_id,
            .to_ps_bus_r_data,
            .to_ps_bus_r_resp,
            .to_ps_bus_r_last,
            .to_ps_bus_r_user,
            .to_ps_bus_r_valid,
            .to_ps_bus_r_ready,
            
            // ##############################
            
            .from_ps_bus_aw_ready ,
            .from_ps_bus_aw_valid ,
            .from_ps_bus_aw_lock,   
            .from_ps_bus_aw_addr,
            .from_ps_bus_aw_prot,
            .from_ps_bus_aw_region,
            .from_ps_bus_aw_len,
            .from_ps_bus_aw_size,
            .from_ps_bus_aw_burst,
            .from_ps_bus_aw_cache,
            .from_ps_bus_aw_qos,
            .from_ps_bus_aw_id,
            .from_ps_bus_aw_user,
     
            .from_ps_bus_ar_ready,
            .from_ps_bus_ar_valid,
            .from_ps_bus_ar_lock,
            .from_ps_bus_ar_addr,
            .from_ps_bus_ar_prot,
            .from_ps_bus_ar_region,
            .from_ps_bus_ar_len,
            .from_ps_bus_ar_size,
            .from_ps_bus_ar_burst,
            .from_ps_bus_ar_cache,
            .from_ps_bus_ar_qos,
            .from_ps_bus_ar_id,     
            .from_ps_bus_ar_user,
            
            .from_ps_bus_w_ready,
            .from_ps_bus_w_valid,
            .from_ps_bus_w_last,
            .from_ps_bus_w_data,
            .from_ps_bus_w_strb,
            .from_ps_bus_w_user,
     
            .from_ps_bus_b_id,
            .from_ps_bus_b_resp,
            .from_ps_bus_b_valid,
            .from_ps_bus_b_user,
            .from_ps_bus_b_ready, 

            .from_ps_bus_r_id,
            .from_ps_bus_r_data,
            .from_ps_bus_r_resp,
            .from_ps_bus_r_last,
            .from_ps_bus_r_user,
            .from_ps_bus_r_valid,
            .from_ps_bus_r_ready,
            
            
            
            // ##############################
            
            .dma2ddr_bus_aw_ready ,
            .dma2ddr_bus_aw_valid ,
            .dma2ddr_bus_aw_lock,   
            .dma2ddr_bus_aw_addr,
            .dma2ddr_bus_aw_prot,
            .dma2ddr_bus_aw_region,
            .dma2ddr_bus_aw_len,
            .dma2ddr_bus_aw_size,
            .dma2ddr_bus_aw_burst,
            .dma2ddr_bus_aw_cache,
            .dma2ddr_bus_aw_qos,
            .dma2ddr_bus_aw_id,
            .dma2ddr_bus_aw_user,
     
            .dma2ddr_bus_ar_ready,
            .dma2ddr_bus_ar_valid,
            .dma2ddr_bus_ar_lock,
            .dma2ddr_bus_ar_addr,
            .dma2ddr_bus_ar_prot,
            .dma2ddr_bus_ar_region,
            .dma2ddr_bus_ar_len,
            .dma2ddr_bus_ar_size,
            .dma2ddr_bus_ar_burst,
            .dma2ddr_bus_ar_cache,
            .dma2ddr_bus_ar_qos,
            .dma2ddr_bus_ar_id,     
            .dma2ddr_bus_ar_user,
            
            .dma2ddr_bus_w_ready,
            .dma2ddr_bus_w_valid,
            .dma2ddr_bus_w_last,
            .dma2ddr_bus_w_data,
            .dma2ddr_bus_w_strb,
            .dma2ddr_bus_w_user,
     
            .dma2ddr_bus_b_id,
            .dma2ddr_bus_b_resp,
            .dma2ddr_bus_b_valid,
            .dma2ddr_bus_b_user,
            .dma2ddr_bus_b_ready, 

            .dma2ddr_bus_r_id,
            .dma2ddr_bus_r_data,
            .dma2ddr_bus_r_resp,
            .dma2ddr_bus_r_last,
            .dma2ddr_bus_r_user,
            .dma2ddr_bus_r_valid,
            .dma2ddr_bus_r_ready,
            
            // ########### DDR0 ###################
            
            .wei2ddr0_bus_aw_ready ,
            .wei2ddr0_bus_aw_valid ,
            .wei2ddr0_bus_aw_lock,   
            .wei2ddr0_bus_aw_addr,
            .wei2ddr0_bus_aw_prot,
            .wei2ddr0_bus_aw_region,
            .wei2ddr0_bus_aw_len,
            .wei2ddr0_bus_aw_size,
            .wei2ddr0_bus_aw_burst,
            .wei2ddr0_bus_aw_cache,
            .wei2ddr0_bus_aw_qos,
            .wei2ddr0_bus_aw_id,
            .wei2ddr0_bus_aw_user,
     
            .wei2ddr0_bus_ar_ready,
            .wei2ddr0_bus_ar_valid,
            .wei2ddr0_bus_ar_lock,
            .wei2ddr0_bus_ar_addr,
            .wei2ddr0_bus_ar_prot,
            .wei2ddr0_bus_ar_region,
            .wei2ddr0_bus_ar_len,
            .wei2ddr0_bus_ar_size,
            .wei2ddr0_bus_ar_burst,
            .wei2ddr0_bus_ar_cache,
            .wei2ddr0_bus_ar_qos,
            .wei2ddr0_bus_ar_id,     
            .wei2ddr0_bus_ar_user,
            
            .wei2ddr0_bus_w_ready,
            .wei2ddr0_bus_w_valid,
            .wei2ddr0_bus_w_last,
            .wei2ddr0_bus_w_data,
            .wei2ddr0_bus_w_strb,
            .wei2ddr0_bus_w_user,
     
            .wei2ddr0_bus_b_id,
            .wei2ddr0_bus_b_resp,
            .wei2ddr0_bus_b_valid,
            .wei2ddr0_bus_b_user,
            .wei2ddr0_bus_b_ready, 

            .wei2ddr0_bus_r_id,
            .wei2ddr0_bus_r_data,
            .wei2ddr0_bus_r_resp,
            .wei2ddr0_bus_r_last,
            .wei2ddr0_bus_r_user,
            .wei2ddr0_bus_r_valid,
            .wei2ddr0_bus_r_ready,
            
            // ########### DDR1 ###################
            
            .wei2ddr1_bus_aw_ready ,
            .wei2ddr1_bus_aw_valid ,
            .wei2ddr1_bus_aw_lock,   
            .wei2ddr1_bus_aw_addr,
            .wei2ddr1_bus_aw_prot,
            .wei2ddr1_bus_aw_region,
            .wei2ddr1_bus_aw_len,
            .wei2ddr1_bus_aw_size,
            .wei2ddr1_bus_aw_burst,
            .wei2ddr1_bus_aw_cache,
            .wei2ddr1_bus_aw_qos,
            .wei2ddr1_bus_aw_id,
            .wei2ddr1_bus_aw_user,
     
            .wei2ddr1_bus_ar_ready,
            .wei2ddr1_bus_ar_valid,
            .wei2ddr1_bus_ar_lock,
            .wei2ddr1_bus_ar_addr,
            .wei2ddr1_bus_ar_prot,
            .wei2ddr1_bus_ar_region,
            .wei2ddr1_bus_ar_len,
            .wei2ddr1_bus_ar_size,
            .wei2ddr1_bus_ar_burst,
            .wei2ddr1_bus_ar_cache,
            .wei2ddr1_bus_ar_qos,
            .wei2ddr1_bus_ar_id,     
            .wei2ddr1_bus_ar_user,
            
            .wei2ddr1_bus_w_ready,
            .wei2ddr1_bus_w_valid,
            .wei2ddr1_bus_w_last,
            .wei2ddr1_bus_w_data,
            .wei2ddr1_bus_w_strb,
            .wei2ddr1_bus_w_user,
     
            .wei2ddr1_bus_b_id,
            .wei2ddr1_bus_b_resp,
            .wei2ddr1_bus_b_valid,
            .wei2ddr1_bus_b_user,
            .wei2ddr1_bus_b_ready, 

            .wei2ddr1_bus_r_id,
            .wei2ddr1_bus_r_data,
            .wei2ddr1_bus_r_resp,
            .wei2ddr1_bus_r_last,
            .wei2ddr1_bus_r_user,
            .wei2ddr1_bus_r_valid,
            .wei2ddr1_bus_r_ready
            
        );
        
/*

██████╗ ██████╗ ██████╗     ███████╗███╗   ███╗██╗   ██╗██╗     
██╔══██╗██╔══██╗██╔══██╗    ██╔════╝████╗ ████║██║   ██║██║     
██║  ██║██║  ██║██████╔╝    █████╗  ██╔████╔██║██║   ██║██║     
██║  ██║██║  ██║██╔══██╗    ██╔══╝  ██║╚██╔╝██║██║   ██║██║     
██████╔╝██████╔╝██║  ██║    ███████╗██║ ╚═╝ ██║╚██████╔╝███████╗
╚═════╝ ╚═════╝ ╚═╝  ╚═╝    ╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝
                                                                
*/        
        
        
        xilinx_axi_mem_32768x64 
        DDR
         (
          .s_aclk        ( i_dut.s_clk_soc    ),
          .s_aresetn     ( i_dut.s_rstn_sync  ),
          
          .s_axi_awid    ( to_ps_bus_aw_id    ),
          .s_axi_awaddr  ( to_ps_bus_aw_addr  ),
          .s_axi_awlen   ( to_ps_bus_aw_len   ),
          .s_axi_awsize  ( to_ps_bus_aw_size  ),
          .s_axi_awburst ( to_ps_bus_aw_burst ),
          .s_axi_awvalid ( to_ps_bus_aw_valid ),
          .s_axi_awready ( to_ps_bus_aw_ready ),
          
          .s_axi_wdata   ( to_ps_bus_w_data   ),
          .s_axi_wstrb   ( to_ps_bus_w_strb   ),
          .s_axi_wlast   ( to_ps_bus_w_last   ),
          .s_axi_wvalid  ( to_ps_bus_w_valid  ),
          .s_axi_wready  ( to_ps_bus_w_ready  ),
          
          .s_axi_bid     ( to_ps_bus_b_id     ),
          .s_axi_bresp   ( to_ps_bus_b_resp   ),
          .s_axi_bvalid  ( to_ps_bus_b_valid  ),
          .s_axi_bready  ( to_ps_bus_b_ready  ),
          
          .s_axi_arid    ( to_ps_bus_ar_id    ),
          .s_axi_araddr  ( to_ps_bus_ar_addr  ),
          .s_axi_arlen   ( to_ps_bus_ar_len   ),
          .s_axi_arsize  ( to_ps_bus_ar_size  ),
          .s_axi_arburst ( to_ps_bus_ar_burst ),
          .s_axi_arvalid ( to_ps_bus_ar_valid ),
          .s_axi_arready ( to_ps_bus_ar_ready ),
        
          .s_axi_rid     ( to_ps_bus_r_id     ),
          .s_axi_rdata   ( to_ps_bus_r_data   ),
          .s_axi_rresp   ( to_ps_bus_r_resp   ),
          .s_axi_rlast   ( to_ps_bus_r_last   ),
          .s_axi_rvalid  ( to_ps_bus_r_valid  ),
          .s_axi_rready  ( to_ps_bus_r_ready  )
          
          );        
        
        
        
        
        
        
        
        xilinx_axi_mem_131072x64 
        DDR_for_dma_test
         (
          .s_aclk    ( i_dut.s_clk_soc),
          .s_aresetn ( i_dut.s_rstn_sync            ),
          
          .s_axi_awid    ( '0 ),
          .s_axi_awaddr  ( '0 ),
          .s_axi_awlen   ( '0 ),
          .s_axi_awsize  ( '0 ),
          .s_axi_awburst ( '0 ),
          .s_axi_awvalid ( '0 ),
          .s_axi_awready (    ),
          
          .s_axi_wdata  ( '0 ),
          .s_axi_wstrb  ( '0 ),
          .s_axi_wlast  ( '0 ),
          .s_axi_wvalid ( '0 ),
          .s_axi_wready (    ),
          
          .s_axi_bid    (    ),
          .s_axi_bresp  (    ),
          .s_axi_bvalid (    ),
          .s_axi_bready ( '0 ),
          
          .s_axi_arid ( dma2ddr_bus_ar_id ),
          .s_axi_araddr ( dma2ddr_bus_ar_addr ),
          .s_axi_arlen ( dma2ddr_bus_ar_len ),
          .s_axi_arsize ( dma2ddr_bus_ar_size ),
          .s_axi_arburst ( dma2ddr_bus_ar_burst ),
          .s_axi_arvalid ( dma2ddr_bus_ar_valid ),
          .s_axi_arready ( dma2ddr_bus_ar_ready ),
        
          .s_axi_rid ( dma2ddr_bus_r_id ),
          .s_axi_rdata ( dma2ddr_bus_r_data ),
          .s_axi_rresp ( dma2ddr_bus_r_resp ),
          .s_axi_rlast ( dma2ddr_bus_r_last ),
          .s_axi_rvalid ( dma2ddr_bus_r_valid ),
          .s_axi_rready ( dma2ddr_bus_r_ready )
          
          );  
         
         
         
         
          //write channe goes to axi2mem

logic [3:0]                mem2file_req_int;
logic [3:0][31:0]          mem2file_add_int;
logic [3:0]                mem2file_type_int;
logic [3:0][3:0]           mem2file_be_int;
logic [3:0][31:0]          mem2file_data_int;
logic [3:0]                mem2file_gnt_int;
    
   
logic [3:0]                mem2file_r_valid_int;
logic [3:0][31:0]          mem2file_r_data_int;

axi2mem
  #(
    
    .AXI_ID_WIDTH  ( 4)
    )
    axi2mem_write_to_file
   (
    .clk_i ( i_dut.s_clk_soc),
    .rst_ni( i_dut.s_rstn_sync            ),
    
    // AXI4 SLAVE
    //***************************************
    // WRITE ADDRESS CHANNEL
    .axi_slave_aw_valid_i  ( dma2ddr_bus_aw_valid ),
    .axi_slave_aw_addr_i   ( dma2ddr_bus_aw_addr ),
    .axi_slave_aw_prot_i   ( '0 ),
    .axi_slave_aw_region_i ( '0 ),
    .axi_slave_aw_len_i    ( dma2ddr_bus_aw_len ),
    .axi_slave_aw_size_i   ( dma2ddr_bus_aw_size ),
    .axi_slave_aw_burst_i  ( dma2ddr_bus_aw_burst ),
    .axi_slave_aw_lock_i   ( '0 ),
    .axi_slave_aw_cache_i  ( '0 ),
    .axi_slave_aw_qos_i    ( '0 ),
    .axi_slave_aw_id_i     ( dma2ddr_bus_aw_id ),
    .axi_slave_aw_user_i   ( '0 ),
    .axi_slave_aw_ready_o  ( dma2ddr_bus_aw_ready ),
    
    // READ ADDRESS CHANNEL
    .axi_slave_ar_valid_i  ( '0 ),
    .axi_slave_ar_addr_i   ( '0 ),
    .axi_slave_ar_prot_i   ( '0 ),
    .axi_slave_ar_region_i ( '0 ),
    .axi_slave_ar_len_i    ( '0 ),
    .axi_slave_ar_size_i   ( '0 ),
    .axi_slave_ar_burst_i  ( '0 ),
    .axi_slave_ar_lock_i   ( '0 ),
    .axi_slave_ar_cache_i  ( '0 ),
    .axi_slave_ar_qos_i    ( '0 ),
    .axi_slave_ar_id_i     ( '0 ),
    .axi_slave_ar_user_i   ( '0 ),
    .axi_slave_ar_ready_o  (    ),
    
    // WRITE DATA CHANNEL
    .axi_slave_w_valid_i   ( dma2ddr_bus_w_valid ),
    .axi_slave_w_data_i    ( dma2ddr_bus_w_data ),
    .axi_slave_w_strb_i    ( dma2ddr_bus_w_strb ),
    .axi_slave_w_user_i    ( '0 ),
    .axi_slave_w_last_i    ( dma2ddr_bus_w_last ),
    .axi_slave_w_ready_o   ( dma2ddr_bus_w_ready ),
    
    // READ DATA CHANNEL
    .axi_slave_r_valid_o   (    ),
    .axi_slave_r_data_o    (    ),
    .axi_slave_r_resp_o    (    ),
    .axi_slave_r_last_o    (    ),
    .axi_slave_r_id_o      (    ),
    .axi_slave_r_user_o    (    ),
    .axi_slave_r_ready_i   ( '0 ),
    
    // WRITE RESPONSE CHANNEL
    .axi_slave_b_valid_o   ( dma2ddr_bus_b_valid ),
    .axi_slave_b_resp_o    ( dma2ddr_bus_b_resp ),
    .axi_slave_b_id_o      ( dma2ddr_bus_b_id ),
    .axi_slave_b_user_o    (    ),
    .axi_slave_b_ready_i   ( dma2ddr_bus_b_ready ),
    
    // TCDM MASTER
    //***************************************
    // REQUEST CHANNEL
    .tcdm_master_req_o     ( mem2file_req_int     ),
    .tcdm_master_add_o     ( mem2file_add_int     ),
    .tcdm_master_type_o    ( mem2file_type_int    ),
    .tcdm_master_be_o      ( mem2file_be_int      ),
    .tcdm_master_data_o    ( mem2file_data_int    ),
    .tcdm_master_gnt_i     ( mem2file_gnt_int     ),
    
    // RESPONSE CHANNEL
    .tcdm_master_r_valid_i ( mem2file_r_valid_int ),
    .tcdm_master_r_data_i  ( mem2file_r_data_int  ),

    // BUSY SIGNAL
    .busy_o()
    );
     localparam MEM_SIZE = 131072*2*2*2;
     localparam ADD_WIDTH= $clog2(MEM_SIZE);
     
   // logic [64-1:0]to_file_mem_64[32768-1  :0] ;    
    logic [16-1:0]to_file_mem[MEM_SIZE-1:0];  
     
    assign  mem2file_gnt_int     = 4'b1100;  
    assign  mem2file_r_data_int  =  {4{32'hDEADBEEF}};     
    
    integer j;
    always_ff @(posedge i_dut.s_clk_soc)
    begin
      if (!wire_rst_n)
      begin
        for (j=0; j < MEM_SIZE; j=j+1) begin
            to_file_mem[j] <= 32'b0; //reset array
        end
      end
      else 
      begin
        if (mem2file_req_int[2])
        begin
          to_file_mem[mem2file_add_int[2][ADD_WIDTH-1:1]]   <= mem2file_data_int[2][15:0];
          to_file_mem[mem2file_add_int[2][ADD_WIDTH-1:1]+1] <= mem2file_data_int[2][31:16];
          to_file_mem[mem2file_add_int[3][ADD_WIDTH-1:1]]   <= mem2file_data_int[3][15:0];
          to_file_mem[mem2file_add_int[3][ADD_WIDTH-1:1]+1] <= mem2file_data_int[3][31:16];
        end
        mem2file_r_valid_int <= mem2file_req_int;
      end
    end      
            
          
        
        
        
        
          
            
          
          
          
          
          
          
          
        
         xilinx_axi_mem_32768x64 
        DDR0_for_wei_test
         (
          .s_aclk    ( wire_clk_dma_wei),
          .s_aresetn ( i_dut.s_rstn_sync            ),
          
          .s_axi_awid    ( wei2ddr0_bus_aw_id ),
          .s_axi_awaddr  ( wei2ddr0_bus_aw_addr ),
          .s_axi_awlen   ( wei2ddr0_bus_aw_len ),
          .s_axi_awsize  ( wei2ddr0_bus_aw_size ),
          .s_axi_awburst ( wei2ddr0_bus_aw_burst ),
          .s_axi_awvalid ( wei2ddr0_bus_aw_valid ),
          .s_axi_awready ( wei2ddr0_bus_aw_ready ),
          
          .s_axi_wdata ( wei2ddr0_bus_w_data ),
          .s_axi_wstrb ( wei2ddr0_bus_w_strb ),
          .s_axi_wlast ( wei2ddr0_bus_w_last ),
          .s_axi_wvalid ( wei2ddr0_bus_w_valid ),
          .s_axi_wready ( wei2ddr0_bus_w_ready ),
          
          .s_axi_bid ( wei2ddr0_bus_b_id ),
          .s_axi_bresp ( wei2ddr0_bus_b_resp ),
          .s_axi_bvalid ( wei2ddr0_bus_b_valid ),
          .s_axi_bready ( wei2ddr0_bus_b_ready ),
          
          .s_axi_arid ( wei2ddr0_bus_ar_id ),
          .s_axi_araddr ( wei2ddr0_bus_ar_addr ),
          .s_axi_arlen ( wei2ddr0_bus_ar_len ),
          .s_axi_arsize ( wei2ddr0_bus_ar_size ),
          .s_axi_arburst ( wei2ddr0_bus_ar_burst ),
          .s_axi_arvalid ( wei2ddr0_bus_ar_valid ),
          .s_axi_arready ( wei2ddr0_bus_ar_ready ),
        
          .s_axi_rid ( wei2ddr0_bus_r_id ),
          .s_axi_rdata ( wei2ddr0_bus_r_data ),
          .s_axi_rresp ( wei2ddr0_bus_r_resp ),
          .s_axi_rlast ( wei2ddr0_bus_r_last ),
          .s_axi_rvalid ( wei2ddr0_bus_r_valid ),
          .s_axi_rready ( wei2ddr0_bus_r_ready )
          
          );  
          
          
          xilinx_axi_mem_32768x64 
        DDR1_for_wei_test
         (
          .s_aclk    ( wire_clk_dma_wei),
          .s_aresetn ( i_dut.s_rstn_sync            ),
          
          .s_axi_awid    ( wei2ddr1_bus_aw_id ),
          .s_axi_awaddr  ( wei2ddr1_bus_aw_addr ),
          .s_axi_awlen   ( wei2ddr1_bus_aw_len ),
          .s_axi_awsize  ( wei2ddr1_bus_aw_size ),
          .s_axi_awburst ( wei2ddr1_bus_aw_burst ),
          .s_axi_awvalid ( wei2ddr1_bus_aw_valid ),
          .s_axi_awready ( wei2ddr1_bus_aw_ready ),
          
          .s_axi_wdata ( wei2ddr1_bus_w_data ),
          .s_axi_wstrb ( wei2ddr1_bus_w_strb ),
          .s_axi_wlast ( wei2ddr1_bus_w_last ),
          .s_axi_wvalid ( wei2ddr1_bus_w_valid ),
          .s_axi_wready ( wei2ddr1_bus_w_ready ),
          
          .s_axi_bid ( wei2ddr1_bus_b_id ),
          .s_axi_bresp ( wei2ddr1_bus_b_resp ),
          .s_axi_bvalid ( wei2ddr1_bus_b_valid ),
          .s_axi_bready ( wei2ddr1_bus_b_ready ),
          
          .s_axi_arid ( wei2ddr1_bus_ar_id ),
          .s_axi_araddr ( wei2ddr1_bus_ar_addr ),
          .s_axi_arlen ( wei2ddr1_bus_ar_len ),
          .s_axi_arsize ( wei2ddr1_bus_ar_size ),
          .s_axi_arburst ( wei2ddr1_bus_ar_burst ),
          .s_axi_arvalid ( wei2ddr1_bus_ar_valid ),
          .s_axi_arready ( wei2ddr1_bus_ar_ready ),
        
          .s_axi_rid ( wei2ddr1_bus_r_id ),
          .s_axi_rdata ( wei2ddr1_bus_r_data ),
          .s_axi_rresp ( wei2ddr1_bus_r_resp ),
          .s_axi_rlast ( wei2ddr1_bus_r_last ),
          .s_axi_rvalid ( wei2ddr1_bus_r_valid ),
          .s_axi_rready ( wei2ddr1_bus_r_ready )
          
          );
        
        logic [3:0]clk_cnt;
        logic div_clk_out;
        
        always_ff @(posedge i_dut.s_clk_soc or negedge wire_rst_n)
          begin
          if (!wire_rst_n)
            begin
              div_clk_out <= 0;
              clk_cnt <= 0;
            end
          else
            if (clk_cnt < 11)
              clk_cnt <= clk_cnt + 1;
            else
              begin
                clk_cnt <= 0;
                div_clk_out <= ~div_clk_out;
              end
          end
          
       assign wire_clk_out = i_dut.s_clk_soc;//div_clk_out; 


        uart_tb_rx
        #(
              .BAUD_RATE(BAUDRATE),
              .PARITY_EN(0)
        )
        rx_mod_i
        (
            .rx(uart_rx),
            .rx_en(uart_rx_en),
            .word_done()
        );

`ifndef USE_TOP_NETLIST

  


   axi_mem_if
   #(
       .AXI4_ADDRESS_WIDTH(32),
       .AXI4_RDATA_WIDTH(64),
       .AXI4_WDATA_WIDTH(64),
       .AXI4_ID_WIDTH(4),
       .AXI4_USER_WIDTH(6),
       .MEM_ADDR_WIDTH(32),
       .BUFF_DEPTH_SLAVE(4)
   )
   axi_mem_if_i
   (
       .ACLK      ( i_dut.s_clk_soc              ),
       .ARESETn   ( i_dut.s_rstn_sync            ),

       .AWVALID_i ( stdout_master_aw_valid  ),
       .AWADDR_i  ( stdout_master_aw_addr   ),
       .AWPROT_i  ( stdout_master_aw_prot   ),
       .AWREGION_i( stdout_master_aw_region ),
       .AWLEN_i   ( stdout_master_aw_len    ),
       .AWSIZE_i  ( stdout_master_aw_size   ),
       .AWBURST_i ( stdout_master_aw_burst  ),
       .AWLOCK_i  ( stdout_master_aw_lock   ),
       .AWCACHE_i ( stdout_master_aw_cache  ),
       .AWQOS_i   ( stdout_master_aw_qos    ),
       .AWID_i    ( stdout_master_aw_id     ),
       .AWUSER_i  ( stdout_master_aw_user   ),
       .AWREADY_o ( stdout_master_aw_ready  ),

       .ARVALID_i ( stdout_master_ar_valid  ),
       .ARADDR_i  ( stdout_master_ar_addr   ),
       .ARPROT_i  ( stdout_master_ar_prot   ),
       .ARREGION_i( stdout_master_ar_region ),
       .ARLEN_i   ( stdout_master_ar_len    ),
       .ARSIZE_i  ( stdout_master_ar_size   ),
       .ARBURST_i ( stdout_master_ar_burst  ),
       .ARLOCK_i  ( stdout_master_ar_lock   ),
       .ARCACHE_i ( stdout_master_ar_cache  ),
       .ARQOS_i   ( stdout_master_ar_qos    ),
       .ARID_i    ( stdout_master_ar_id     ),
       .ARUSER_i  ( stdout_master_ar_user   ),
       .ARREADY_o ( stdout_master_ar_ready  ),

       .RVALID_o  ( stdout_master_r_valid   ),
       .RDATA_o   ( stdout_master_r_data    ),
       .RRESP_o   ( stdout_master_r_resp    ),
       .RLAST_o   ( stdout_master_r_last    ),
       .RID_o     ( stdout_master_r_id      ),
       .RUSER_o   ( stdout_master_r_user    ),
       .RREADY_i  ( stdout_master_r_ready   ),

       .WVALID_i  ( stdout_master_w_valid   ),
       .WDATA_i   ( stdout_master_w_data    ),
       .WSTRB_i   ( stdout_master_w_strb    ),
       .WLAST_i   ( stdout_master_w_last    ),
       .WUSER_i   ( stdout_master_w_user    ),
       .WREADY_o  ( stdout_master_w_ready   ),

       .BVALID_o  ( stdout_master_b_valid   ),
       .BRESP_o   ( stdout_master_b_resp    ),
       .BID_o     ( stdout_master_b_id      ),
       .BUSER_o   ( stdout_master_b_user    ),
       .BREADY_i  ( stdout_master_b_ready   ),

       .CEN       ( s_dbg_csn              ),
       .WEN       ( s_dbg_wen              ),
       .A         ( s_dbg_add              ),
       .D         ( s_dbg_wdata            ),
       .BE        ( s_dbg_be               ),
       .Q         ( s_dbg_rdata            )
    );
    
    
    

FS_HANDLER
#(
      .ADDR_WIDTH ( 32       ),
      .DATA_WIDTH ( 64       ),
      .NB_CORES   ( NB_CORES )
)
FILESYSTEM_BLOCK
(
       .clk    ( wire_clk_out ),
       .rst_n  ( wire_rst_n ),

       .CSN    ( s_dbg_csn   ),
       .WEN    ( s_dbg_wen   ),
       .ADDR   ( {s_dbg_add[28:0],3'b000}  ),
       .WDATA  ( s_dbg_wdata ),
       .BE     ( s_dbg_be    ),
       .RDATA  ( s_dbg_rdata )
);
`endif

        generate
          if(EXEC_TEST == "SPISLAVE") begin
            assign w_pulp_interrupt = s_i2s_data_0_pad;
            assign s_i2s_data_1_pad = w_host_interrupt;
          end
          else begin
            assign s_i2s_data_0_pad = s_i2s_data[0];
            assign s_i2s_data_1_pad = s_i2s_data[1];
          end
        endgenerate

        initial
        begin
                s_clk_ref = 1'b1;
                forever s_clk_ref = #(`REF_CLK_SEMIPERIOD) ~s_clk_ref;
        end

        initial
        begin
                s_clk_ref_fast = 1'b1;
                forever s_clk_ref_fast = #(`REF_CLK_SEMIPERIOD/(2/(2-`FAST_CLOCK))) ~s_clk_ref_fast;
                //forever s_clk_ref_fast = #(`REF_CLK_SEMIPERIOD/(4)) ~s_clk_ref_fast;
        end



  // PERIPHERAL INTERCONNECT SLAVE
    //***************************************
    //REQUEST CHANNEL
      logic                      per_slave_req;
      logic [32-1:0] per_slave_add;
      logic                      per_slave_wen;
      logic [31:0]               per_slave_wdata;
      logic [3:0]                per_slave_be;
      logic [6-1:0]   per_slave_id;
     logic                      per_slave_gnt;
    
    //RESPONSE CHANNEL
     logic                      per_slave_r_valid;
     logic                      per_slave_r_opc;
     logic [6-1:0]   per_slave_r_id;
     logic [31:0]               per_slave_r_rdata;




/*

██████╗ ██████╗ ███████╗██╗      ██████╗  █████╗ ██████╗ ███████╗██████╗ 
██╔══██╗██╔══██╗██╔════╝██║     ██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
██████╔╝██████╔╝█████╗  ██║     ██║   ██║███████║██║  ██║█████╗  ██████╔╝
██╔═══╝ ██╔══██╗██╔══╝  ██║     ██║   ██║██╔══██║██║  ██║██╔══╝  ██╔══██╗
██║     ██║  ██║███████╗███████╗╚██████╔╝██║  ██║██████╔╝███████╗██║  ██║
╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝
                                                                         
*/




logic preloader_enable;
logic preloader_done;

ram_preloader
#(
      .ADDR_WIDTH        ( 14                ),
      .PER_ID_WIDTH      ( 6                 )
)
ram_preloader_i
(
    .clk_i               ( wire_clk_ref      ),
    .rst_ni              ( wire_rst_n        ), 
    .en_i                ( preloader_enable  ),
    .done_o              ( preloader_done    ),
       
    .per_slave_req_o     ( per_slave_req     ),
    .per_slave_add_o     ( per_slave_add     ),
    .per_slave_wen_o     ( per_slave_wen     ),
    .per_slave_wdata_o   ( per_slave_wdata   ),
    .per_slave_be_o      ( per_slave_be      ),
    .per_slave_id_o      ( per_slave_id      ),
    .per_slave_gnt_i     ( per_slave_gnt     ),
    
    .per_slave_r_valid_i ( per_slave_r_valid ),
    .per_slave_r_opc_i   ( per_slave_r_opc   ),
    .per_slave_r_id_i    ( per_slave_r_id    ),
    .per_slave_r_rdata_i ( per_slave_r_rdata )
       
       
);


per2axi
   #(
       .NB_CORES           ( 1        ),
       .PER_ADDR_WIDTH     ( 32  ),
       .PER_ID_WIDTH       ( 6    ),
       .AXI_ADDR_WIDTH     ( 32  ),
       .AXI_DATA_WIDTH     ( 64  ),
       .AXI_USER_WIDTH     ( 6  ),
       .AXI_ID_WIDTH       ( 6    )
   )
   per2axi_i
   (
      .clk_i                  ( wire_clk_ref                               ),
      .rst_ni                 ( wire_rst_n                              ),

      .per_slave_req_i        ( per_slave_req                   ),
      .per_slave_add_i        ( per_slave_add                    ),
      .per_slave_we_i         ( per_slave_wen                    ),
      .per_slave_wdata_i      ( per_slave_wdata                  ),
      .per_slave_be_i         ( per_slave_be                     ),
      .per_slave_id_i         ( per_slave_id   ),
      .per_slave_gnt_o        ( per_slave_gnt                    ),

      .per_slave_r_valid_o    ( per_slave_r_valid                ),
      .per_slave_r_opc_o      ( per_slave_r_opc                  ),
      .per_slave_r_id_o       ( per_slave_r_id ),
      .per_slave_r_rdata_o    ( per_slave_r_rdata                ),

      .axi_master_aw_valid_o  ( from_ps_bus_aw_valid  ),
      .axi_master_aw_addr_o   ( from_ps_bus_aw_addr   ),
      .axi_master_aw_prot_o   ( from_ps_bus_aw_prot   ),
      .axi_master_aw_region_o ( from_ps_bus_aw_region ),
      .axi_master_aw_len_o    ( from_ps_bus_aw_len    ),
      .axi_master_aw_size_o   ( from_ps_bus_aw_size   ),
      .axi_master_aw_burst_o  ( from_ps_bus_aw_burst  ),
      .axi_master_aw_lock_o   ( from_ps_bus_aw_lock   ),
      .axi_master_aw_cache_o  ( from_ps_bus_aw_cache  ),
      .axi_master_aw_qos_o    ( from_ps_bus_aw_qos    ),
      .axi_master_aw_id_o     ( from_ps_bus_aw_id[6-1:0]),
      .axi_master_aw_user_o   ( from_ps_bus_aw_user   ),
      .axi_master_aw_ready_i  ( from_ps_bus_aw_ready  ),

      .axi_master_ar_valid_o  ( from_ps_bus_ar_valid  ),
      .axi_master_ar_addr_o   ( from_ps_bus_ar_addr   ),
      .axi_master_ar_prot_o   ( from_ps_bus_ar_prot   ),
      .axi_master_ar_region_o ( from_ps_bus_ar_region ),
      .axi_master_ar_len_o    ( from_ps_bus_ar_len    ),
      .axi_master_ar_size_o   ( from_ps_bus_ar_size   ),
      .axi_master_ar_burst_o  ( from_ps_bus_ar_burst  ),
      .axi_master_ar_lock_o   ( from_ps_bus_ar_lock   ),
      .axi_master_ar_cache_o  ( from_ps_bus_ar_cache  ),
      .axi_master_ar_qos_o    ( from_ps_bus_ar_qos    ),
      .axi_master_ar_id_o     ( from_ps_bus_ar_id[6-1:0]),
      .axi_master_ar_user_o   ( from_ps_bus_ar_user   ),
      .axi_master_ar_ready_i  ( from_ps_bus_ar_ready  ),

      .axi_master_w_valid_o   ( from_ps_bus_w_valid   ),
      .axi_master_w_data_o    ( from_ps_bus_w_data    ),
      .axi_master_w_strb_o    ( from_ps_bus_w_strb    ),
      .axi_master_w_user_o    ( from_ps_bus_w_user    ),
      .axi_master_w_last_o    ( from_ps_bus_w_last    ),
      .axi_master_w_ready_i   ( from_ps_bus_w_ready   ),

      .axi_master_r_valid_i   ( from_ps_bus_r_valid   ),
      .axi_master_r_data_i    ( from_ps_bus_r_data    ),
      .axi_master_r_resp_i    ( from_ps_bus_r_resp    ),
      .axi_master_r_last_i    ( from_ps_bus_r_last    ),
      .axi_master_r_id_i      ( from_ps_bus_r_id[6-1:0] ),
      .axi_master_r_user_i    ( from_ps_bus_r_user    ),
      .axi_master_r_ready_o   ( from_ps_bus_r_ready   ),

      .axi_master_b_valid_i   ( from_ps_bus_b_valid   ),
      .axi_master_b_resp_i    ( from_ps_bus_b_resp    ),
      .axi_master_b_id_i      ( from_ps_bus_b_id[6-1:0] ),
      .axi_master_b_user_i    ( from_ps_bus_b_user    ),
      .axi_master_b_ready_o   ( from_ps_bus_b_ready   ),

      .busy_o                 (                )
   );



 

integer f,i;







        initial
          begin                         
                  
                    
                s_trstn<= 1'b0;
                s_tck  <= 1'b0;
                s_tdi  <= 1'b0;
                s_tms  <= 1'b0;
                s_rst_n   <= 1'b0;
                uart_rx_en <= 1'b0;
                
                fetch_enable <= 1'b0;
                
                if (LOAD_L2 == "STANDALONE")
                  s_mode_select <= 1'b1;
                else
                  s_mode_select <= 1'b0;

               // $readmemh("./vectors/stim.txt", stimuli);  // read in the stimuli vectors  == address_value
               // $readmemh("./vectors/exp.txt", expected);  // read in the expected vectors == address_value

              
                padmode_spi_master = `SPI_STD;
                spi_csn  = 1'b1;
                spi_sck  = 1'b0;
                spi_sdo0 = 1'b0;
                spi_sdo1 = 1'b0;
                spi_sdo2 = 1'b0;
                spi_sdo3 = 1'b0;

                $display("Asserting hard reset_TB");
                #50000000; // 1mS reset pulse

                s_rst_n <= 1'b1;

                $display("Releasing hard reset");
                #50000000; // 1mS delay
            
            /*
            
██████╗ ██████╗ ███████╗██╗      ██████╗  █████╗ ██████╗ ██╗███╗   ██╗ ██████╗ 
██╔══██╗██╔══██╗██╔════╝██║     ██╔═══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ 
██████╔╝██████╔╝█████╗  ██║     ██║   ██║███████║██║  ██║██║██╔██╗ ██║██║  ███╗
██╔═══╝ ██╔══██╗██╔══╝  ██║     ██║   ██║██╔══██║██║  ██║██║██║╚██╗██║██║   ██║
██║     ██║  ██║███████╗███████╗╚██████╔╝██║  ██║██████╔╝██║██║ ╚████║╚██████╔╝
╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ 
                                                                               
            */    
                
                
                if (LOAD_L2 == "ARM_SIM_PRELOAD")
                  begin
                      
                      ddr_w0_readmem_8x8_ramloops();
                      ddr_w1_readmem_8x8_ramloops();
                      ddr_x_readmem_32x8_ramloops();
                      
                      $display("Preloading L2 memory from ps_to_pulp bus. XILINX BRAM");
                      preloader_enable = 1'b1;
                      wait(preloader_done);
                      
                      preloader_enable = 1'b0;
                      $stop;
                    end
                               
                
                fetch_enable <= 1'b0;
                
                #1000
                fetch_enable <= 1'b1;
                #3000
                fetch_enable <= 1'b0;
 
                jtag_reset();
                jtag_softreset();
     
                #5000;
                test_mode_if.init();
     
                if (ENABLE_BBGENBP == "TRUE")
                begin
                      #100000000; // 0.1mS delay
                      $display("[BBGEN BYPASS] Enabling BBGEN bypass and clock out");
                      test_mode_if.set_confreg(21'h1B0800); //sets clock out enable  bit11
                                                            //sets bbgen bypass to 1 bit16
                                                            //sets bbgen soc[0] to 0 bit17
                                                            //sets bbgen soc[1] to 1 bit18
                                                            //sets bbgen clu[0] to 1 bit19
                                                            //sets bbgen clu[0] to 1 bit20
                      s_rst_n   <= 1'b0;
                      $display("[BBGEN BYPASS] Re-Asserting hard reset");
                      #50000000; // 0.05mS reset pulse
                      s_rst_n <= 1'b1;
                      $display("[BBGEN BYPASS] Re-Releasing hard reset");
                      

                end
                else
                begin
                      $display("Enabling clock out via jtag");
                      test_mode_if.set_confreg(21'h800);
                end

                if (ENABLE_DPI == 1)
                begin
                  jtag_mux = `JTAG_DPI;
                end

                #50000000; // 1mS delay
                #50000000; // 1mS delay


                #5000;


              //  $display("[SPI] Enabling QPI mode");
                //Sets QPI mode
                //spi_write_reg(0,8'h1,8'h1);

             //   padmode_spi_master = `SPI_QUAD_TX;
                              

               // $display("[SPI] Mapping eoc on cam_i2s_sdi1 pin");
               // spi_write_word(1,32'h1A104000,32'h00800000);

               // spi_write_word(1,32'h1A101000,32'h00400000);
               // spi_write_word(1,32'h1A101008,32'h00000000);


          //      $display("[SPI] Setting out clock divider to 0");
              //  spi_write_word(1,32'h1A10404C,32'h00000000);

            //    if (LOAD_L2 != "STANDALONE")
            //    begin
           //         $display("[SPI] Triggering fetch enable");
                    
           //         temp_fetch_enable = 2**NB_CORES-1;

         //           spi_write_word(1,32'h10200008,temp_fetch_enable);
           //     end

                uart_rx_en <= 1'b1; // enable uart rx in testbench

                                
                #1000
                fetch_enable <= 1'b1;

                //WAITS for EOC
                $display("Waiting for eoc");
                if (INTERNAL_EOC == "TRUE")
                  wait(tb.i_dut.eoc_o);
                else
                  if(!s_eoc)
                    wait(s_eoc); //waits for eoc
                uart_rx_en = 1'b0; // disable uart rx in testbench


       //         spi_get_results();

                //Clears QPI mode
      //          spi_write_reg(1,8'h1,8'h0);



         //WRITE the mem of outputs to a file
         
       
       
       $display("Writing output to file...");
       f = $fopen("../../ddr_emulation/y_hw.txt","w");
       
       if(CONV_WIDTH == 8)begin
         for (i = 0; i<MEM_SIZE; i=i+1) begin
           $fwrite(f,"%0d\n",   $signed(to_file_mem[i][7:0]));
           $fwrite(f,"%0d\n",   $signed(to_file_mem[i][15:8]));
         end
       end
       else begin
         for (i = 0; i<MEM_SIZE; i=i+1) begin
           $fwrite(f,"%0d\n",   $signed(to_file_mem[i][15:0]));
         end
       end

       $fclose(f);




     //   $writememh("../../ddr_emulation/y_hw.txt", to_file_mem);



        $finish;
    end

    // Adapted from Daniele Palossi's tb_top_host_spi.sv for Mia Wallace... thanks Daniele :)

    localparam CHUNK_SIZE = 256;
    localparam NUM_ITER = 4;

    int data_in_0  = 32'h1c00c000;
    int data_in_1  = 32'h1c00c400;
    int data_out_0 = 32'h1c004000;
    int data_out_1 = 32'h1c004400;
    int current_in  = data_in_0;
    int current_out = data_out_0;
    int checksum[4];

    logic s_pulp_interrupt;
    logic s_host_interrupt;
    logic r_pulp_interrupt;
    logic s_pulp_interrupt_ack;

    logic [31:0] data_rx [CHUNK_SIZE-1:0];
    logic [31:0] data_tx [CHUNK_SIZE-1:0];

    assign w_host_interrupt = s_host_interrupt;
    assign s_pulp_interrupt = w_pulp_interrupt;

    always@(negedge s_rst_n or posedge s_pulp_interrupt or posedge s_pulp_interrupt_ack)
    begin
      if(s_rst_n == 1'b0)
        r_pulp_interrupt <= 1'b0;
      else if(s_pulp_interrupt_ack == 1'b1)
        r_pulp_interrupt <= 1'b0;
      else
        r_pulp_interrupt <= 1'b1;
    end


`include "ddr_w0_readmem_8x8_ramloops.sv"
`include "ddr_w1_readmem_8x8_ramloops.sv"
`include "ddr_x_readmem_32x8_ramloops.sv"

//`include "tb_mem_pkg.sv"
endmodule
