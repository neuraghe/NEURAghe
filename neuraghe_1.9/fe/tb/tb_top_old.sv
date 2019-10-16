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
  
`define DELAY_BETWEEN_SPI   100000

`define RND_SEED 12345678
`define L2_SIZE  32768

//`define TEST_CLK_DIV 1

module tb;

  parameter  LOAD_L2       = "PRELOAD_XILINX";   // valid values are "SPI", "JTAG", "STANDALONE" "PRELOAD", "" (no load of L2) "PRELOAD_XILINX";
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
  parameter  DUMP_VCD      = 0;

  localparam NB_CORES = `NB_CORES;

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


  assign wire_rst_n   = s_rst_n;
  assign wire_clk_ref = s_clk_ref;
  assign wire_clk_ref_fast = s_clk_ref_fast;
  assign wire_clk_ref_1 = 1'b0;
  
  

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
   
  //-------------------------------------------------------------------------------------------------------//
  // End Tracing
  //-------------------------------------------------------------------------------------------------------//

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
     logic [5:0]  stdout_master_aw_id;
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
     logic [5:0]  stdout_master_ar_id;     
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
     logic [5:0]  stdout_master_r_id;
     logic [5:0]  stdout_master_r_user;
      
     logic        stdout_master_b_valid;
     logic        stdout_master_b_ready;     
     logic [1:0]  stdout_master_b_resp;
     logic [5:0]  stdout_master_b_id;
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
     logic [5:0]  to_ps_bus_aw_id;
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
     logic [5:0]  to_ps_bus_ar_id;     
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
     logic [5:0]  to_ps_bus_r_id;
     logic [5:0]  to_ps_bus_r_user;
      
     logic        to_ps_bus_b_valid;
     logic        to_ps_bus_b_ready;     
     logic [1:0]  to_ps_bus_b_resp;
     logic [5:0]  to_ps_bus_b_id;
     logic [5:0]  to_ps_bus_b_user;



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
     logic [5:0]  dma2ddr_bus_aw_id;
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
     logic [5:0]  dma2ddr_bus_ar_id;     
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
     logic [5:0]  dma2ddr_bus_r_id;
     logic [5:0]  dma2ddr_bus_r_user;
      
     logic        dma2ddr_bus_b_valid;
     logic        dma2ddr_bus_b_ready;     
     logic [1:0]  dma2ddr_bus_b_resp;
     logic [5:0]  dma2ddr_bus_b_id;
     logic [5:0]  dma2ddr_bus_b_user;
       
   ulpsoc i_dut
        (
            .test_mode_i        ( 1'b0      ),
            .mode_select_i      ( 1'b0   ),
            .fetch_en_i         ( fetch_enable        ),
            .eoc_o              (       ),
            .rstn_sync_i        ( wire_rst_n ),
            .clk_soc_i          ( wire_clk_ref      ),
            .clk_cluster_fast_i ( wire_clk_ref_fast ),
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
            .dma2ddr_bus_r_ready
            
        );
        
        
        
        
        xilinx_axi_mem_32768x64 
        DDR
         (
          .s_aclk    ( i_dut.s_clk_soc),
          .s_aresetn ( i_dut.s_rstn_sync            ),
          
          .s_axi_awid    ( to_ps_bus_aw_id ),
          .s_axi_awaddr  ( to_ps_bus_aw_addr ),
          .s_axi_awlen   ( to_ps_bus_aw_len ),
          .s_axi_awsize  ( to_ps_bus_aw_size ),
          .s_axi_awburst ( to_ps_bus_aw_burst ),
          .s_axi_awvalid ( to_ps_bus_aw_valid ),
          .s_axi_awready ( to_ps_bus_aw_ready ),
          
          .s_axi_wdata ( to_ps_bus_w_data ),
          .s_axi_wstrb ( to_ps_bus_w_strb ),
          .s_axi_wlast ( to_ps_bus_w_last ),
          .s_axi_wvalid ( to_ps_bus_w_valid ),
          .s_axi_wready ( to_ps_bus_w_ready ),
          
          .s_axi_bid ( to_ps_bus_b_id ),
          .s_axi_bresp ( to_ps_bus_b_resp ),
          .s_axi_bvalid ( to_ps_bus_b_valid ),
          .s_axi_bready ( to_ps_bus_b_ready ),
          
          .s_axi_arid ( to_ps_bus_ar_id ),
          .s_axi_araddr ( to_ps_bus_ar_addr ),
          .s_axi_arlen ( to_ps_bus_ar_len ),
          .s_axi_arsize ( to_ps_bus_ar_size ),
          .s_axi_arburst ( to_ps_bus_ar_burst ),
          .s_axi_arvalid ( to_ps_bus_ar_valid ),
          .s_axi_arready ( to_ps_bus_ar_ready ),
        
          .s_axi_rid ( to_ps_bus_r_id ),
          .s_axi_rdata ( to_ps_bus_r_data ),
          .s_axi_rresp ( to_ps_bus_r_resp ),
          .s_axi_rlast ( to_ps_bus_r_last ),
          .s_axi_rvalid ( to_ps_bus_r_valid ),
          .s_axi_rready ( to_ps_bus_r_ready )
          
          );        
        
        
        xilinx_axi_mem_32768x64 
        DDR_for_dma_test
         (
          .s_aclk    ( i_dut.s_clk_soc),
          .s_aresetn ( i_dut.s_rstn_sync            ),
          
          .s_axi_awid    ( dma2ddr_bus_aw_id ),
          .s_axi_awaddr  ( dma2ddr_bus_aw_addr ),
          .s_axi_awlen   ( dma2ddr_bus_aw_len ),
          .s_axi_awsize  ( dma2ddr_bus_aw_size ),
          .s_axi_awburst ( dma2ddr_bus_aw_burst ),
          .s_axi_awvalid ( dma2ddr_bus_aw_valid ),
          .s_axi_awready ( dma2ddr_bus_aw_ready ),
          
          .s_axi_wdata ( dma2ddr_bus_w_data ),
          .s_axi_wstrb ( dma2ddr_bus_w_strb ),
          .s_axi_wlast ( dma2ddr_bus_w_last ),
          .s_axi_wvalid ( dma2ddr_bus_w_valid ),
          .s_axi_wready ( dma2ddr_bus_w_ready ),
          
          .s_axi_bid ( dma2ddr_bus_b_id ),
          .s_axi_bresp ( dma2ddr_bus_b_resp ),
          .s_axi_bvalid ( dma2ddr_bus_b_valid ),
          .s_axi_bready ( dma2ddr_bus_b_ready ),
          
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
       .AXI4_ID_WIDTH(6),
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


        initial
          begin  
          
               if(LOAD_L2 == "PRELOAD") begin
               
                      // preload memories ST libraries
                     /* $display("Preloading L2 memory. STlibrary");
                      $readmemh("slm_files/l2_ram_cut0_lo.slm", tb.i_dut.l2_ram_i.l2_mem_i.cut[0].cut_lo.Mem);
                      $readmemh("slm_files/l2_ram_cut0_hi.slm", tb.i_dut.l2_ram_i.l2_mem_i.cut[0].cut_hi.Mem);
                      $readmemh("slm_files/l2_ram_cut1_lo.slm", tb.i_dut.l2_ram_i.l2_mem_i.cut[1].cut_lo.Mem);
                      $readmemh("slm_files/l2_ram_cut1_hi.slm", tb.i_dut.l2_ram_i.l2_mem_i.cut[1].cut_hi.Mem);
                      $readmemh("slm_files/l2_ram_cut2_lo.slm", tb.i_dut.l2_ram_i.l2_mem_i.cut[2].cut_lo.Mem);
                      $readmemh("slm_files/l2_ram_cut2_hi.slm", tb.i_dut.l2_ram_i.l2_mem_i.cut[2].cut_hi.Mem);
                      $readmemh("slm_files/l2_ram_cut3_lo.slm", tb.i_dut.l2_ram_i.l2_mem_i.cut[3].cut_lo.Mem);
                      $readmemh("slm_files/l2_ram_cut3_hi.slm", tb.i_dut.l2_ram_i.l2_mem_i.cut[3].cut_hi.Mem);
              */
                     
                end
                else
                  if (LOAD_L2 == "PRELOAD_XILINX") begin
                  
                    // preload memories ST libraries
                    $display("Preloading L2 memory. XILINX BRAM");
                    
                    readmem_128x4_ramloops(); 
                    // this function depends on L2 size. Xilinx BRAMS are formed by a number of 4096 1B-words ramloop modules. 
                    //You can create this function using the python scritpt in the tb folder
                    // s19toslm script must be coerent whit L2 size
                        
                  
                  end
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

                $readmemh("./vectors/stim.txt", stimuli);  // read in the stimuli vectors  == address_value
               // $readmemh("./vectors/exp.txt", expected);  // read in the expected vectors == address_value

                if(EXEC_TEST == "SPISLAVE")
                  $readmemh("./data_tx.txt", data_tx); // read in values to be transmitted to cluster

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


                $display("[SPI] Enabling QPI mode");
                //Sets QPI mode
                spi_write_reg(0,8'h1,8'h1);

                padmode_spi_master = `SPI_QUAD_TX;

                if (EXEC_TEST == "MEMTEST")
                begin
                  $display("[MEMTEST] Loading L2 in QPI mode with random numbers");
                  spi_csn  = 1'b0;
                  #100  spi_send_cmd_addr(1,8'h2,32'h1C000000);
                  spi_data = {$random(`RND_SEED),$random()};
                  for (int i=0;i<`L2_SIZE/8;i++)
                  begin
                  end
                end

                if(LOAD_L2 == "SPI")
                    spi_load_L2();
                else if(LOAD_L2 == "JTAG")
                    jtag_load_L2();

                $display("[SPI] Mapping eoc on cam_i2s_sdi1 pin");
                spi_write_word(1,32'h1A104000,32'h00800000);

                spi_write_word(1,32'h1A101000,32'h00400000);
                spi_write_word(1,32'h1A101008,32'h00000000);


                $display("[SPI] Setting out clock divider to 0");
                spi_write_word(1,32'h1A10404C,32'h00000000);

                if (LOAD_L2 != "STANDALONE")
                begin
                    $display("[SPI] Triggering fetch enable");
                    
                    temp_fetch_enable = 2**NB_CORES-1;

                    spi_write_word(1,32'h10200008,temp_fetch_enable);
                end

                uart_rx_en <= 1'b1; // enable uart rx in testbench

                if(EXEC_TEST == "SPISLAVE")
                  spidb_test();
                                
                #1000
                fetch_enable <= 1'b1;

                //WAITS for EOC
                $display("Waiting for eoc");
                if (INTERNAL_EOC == "TRUE")
                  wait(tb.i_dut.cluster_i.eoc_o);
                else
                  if(!s_eoc)
                    wait(s_eoc); //waits for eoc
                uart_rx_en = 1'b0; // disable uart rx in testbench


                spi_get_results();

                //Clears QPI mode
                spi_write_reg(1,8'h1,8'h0);

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

    // ***************************************** TASKS *****************************************************//

    task spidb_test();

      // Initialize
      data_in_0  = 32'h1c00c000;
      data_in_1  = 32'h1c00c400;
      data_out_0 = 32'h1c004000;
      data_out_1 = 32'h1c004400;

      current_in  = data_in_0;
      current_out = data_out_0;

      // Deinitialize interrupts
      // s_host_interrupt     = 1'b0;
      // s_pulp_interrupt_ack = 1'b0;
      // #1000;

     // Reset checksums
      checksum[0] = 0;
      checksum[1] = 0;
      checksum[2] = 0;
      checksum[3] = 0;

      // Checksum validation
      for(int k=0; k<4; k++) begin
        for(int j=0; j<CHUNK_SIZE/4; j++) begin
          checksum[k] = checksum[k] + data_tx[j+k*(CHUNK_SIZE/4)][ 7: 0];
          checksum[k] = checksum[k] + data_tx[j+k*(CHUNK_SIZE/4)][15: 8];
          checksum[k] = checksum[k] + data_tx[j+k*(CHUNK_SIZE/4)][23:16];
          checksum[k] = checksum[k] + data_tx[j+k*(CHUNK_SIZE/4)][31:24];
        end // for j
      end // for k

      // Print checksums
      $display("%.2f: CHECKSUM: %d %d %d %d", $time, checksum[0], checksum[1], checksum[2], checksum[3]);
      #1000;

      // Reset checksums
      checksum[0] = 0;
      checksum[1] = 0;
      checksum[2] = 0;
      checksum[3] = 0;

      // Wait INIT event from PULP
      $display("%.2f: Waiting for INIT interrupt from PULP...", $time);
      spidb_wait_pulp_event();
      $display("%.2f: Received INIT interrupt from PULP.", $time);

      // Write L2_buffer_0
      spi_send_data_chunk(data_out_0, CHUNK_SIZE);
      $display("%.2f: Sent data chunk 0", $time);

      // Send event to PULP
      spidb_send_host_event();
      $display("%.2f: Sent initial host event", $time);

      // Main loop
      for(int i=0; i<NUM_ITER+2; i++) begin

        // Wait event from PULP
        if(i>0) begin
          $display("%.2f: Waiting for %dth interrupt from PULP", $time, i);
          spidb_wait_pulp_event();
          $display("%.2f: Received %dth interrupt from PULP", $time, i);
        end

        // Write to L2
        if(i<(NUM_ITER-1)) begin
          // Switch double buffering L2 pointer
          if(current_out == data_out_0)
            current_out = data_out_1;
          else
            current_out = data_out_0;
          // Actual writing
          spi_send_data_chunk(current_out, CHUNK_SIZE);
          $display("%.2f: Sent data chunk %d", $time, i+1);
        end

        // Read from L2
        if(i>2) begin
          spi_read_ndword(1, 8'hB, current_in, 8'h20, CHUNK_SIZE);
          $display("Received data cunk %d", i-3);
          // Checksum validation
          for(int k=0; k<4; k++) begin
            for(int j=0; j<CHUNK_SIZE/4; j++) begin
              checksum[k] = checksum[k] + data_rx[j+k*(CHUNK_SIZE/4)][ 7: 0];
              checksum[k] = checksum[k] + data_rx[j+k*(CHUNK_SIZE/4)][15: 8];
              checksum[k] = checksum[k] + data_rx[j+k*(CHUNK_SIZE/4)][23:16];
              checksum[k] = checksum[k] + data_rx[j+k*(CHUNK_SIZE/4)][31:24];

              // if(i==3 && k==2) begin
              //   $display("%d %d %d %d",data_rx[j+k*(CHUNK_SIZE/4)][7:0],data_rx[j+k*(CHUNK_SIZE/4)][15:8],data_rx[j+k*(CHUNK_SIZE/4)][23:16],data_rx[j+k*(CHUNK_SIZE/4)][31:24]);
              // end

            end // for j
          end // for k
          // Switch double buffering L2 pointer
          if(current_in == data_in_0)
            current_in = data_in_1;
          else
            current_in = data_in_0;
        end

        // Send event to PULP
        spidb_send_host_event();
        $display("%.2f: Sent %dth host event", $time, i);
      end // for i

      // Wait event from PULP
      $display("%.2f: Wait LAST interrupt from PULP", $time);
      spidb_wait_pulp_event();
      $display("%.2f: Received LAST interrupt from PULP", $time);
      spi_read_ndword(1, 8'hB, current_in, 8'h20, CHUNK_SIZE);
      $display("%.2f: Received LAST data chunk", $time);

      // Checksum validation
      for(int k=0; k<4; k++) begin
        for(int j=0; j<CHUNK_SIZE/4; j++) begin
          checksum[k] = checksum[k] + data_rx[j+k*(CHUNK_SIZE/4)][ 7: 0];
          checksum[k] = checksum[k] + data_rx[j+k*(CHUNK_SIZE/4)][15: 8];
          checksum[k] = checksum[k] + data_rx[j+k*(CHUNK_SIZE/4)][23:16];
          checksum[k] = checksum[k] + data_rx[j+k*(CHUNK_SIZE/4)][31:24];
        end // for j
      end // for k

      // Print checksums
      $display("%.2f: CHECKSUM: %d %d %d %d", $time, checksum[0], checksum[1], checksum[2], checksum[3]);

    endtask

    task spidb_send_host_event();
              s_host_interrupt = 1'b1;
      #100000 s_host_interrupt = 1'b0;
    endtask

    task spidb_wait_pulp_event();
      wait(r_pulp_interrupt);
      #1000 s_pulp_interrupt_ack = 1'b1;
      #10   s_pulp_interrupt_ack = 1'b0;
    endtask

    // import "DPI-C" task c_load_image(
    //   input  string dir,
    //   input  int    len,
    //   output int    image[len]
    // );

    // import "DPI-C" task c_compute_checksum(
    //   input

  // Tasks to be moved in tb_spi_pkg

  task spi_send_data_chunk;
          input   [31:0] addr;
          input   integer num;
          integer num;
          int num_stim_tx;
          logic more_stim_tx;
                begin
                  num_stim_tx  =    0;
                  more_stim_tx = 1'b1;

                  spi_addr        = addr; // assign address

                  $display("Writing to address %h",spi_addr);
                  spi_csn  = 1'b0;
                  #100  spi_send_cmd_addr(1,8'h2,spi_addr);

                  while (more_stim_tx)                        // loop until we have no more stimuli)
                  begin
                          spi_data        = data_tx[num_stim_tx];  // assign data
                          spi_send_data(1,spi_data);

                          num_stim_tx     = num_stim_tx + 1;             // increment stimuli
                          if (num_stim_tx >= num) // make sure we have more stimuli
                                  more_stim_tx = 0;                    // if not set variable to 0, will prevent additional stimuli to be applied
                  end                                   // end while loop
                  #100 spi_csn  = 1'b1;
                  #`DELAY_BETWEEN_SPI;
                end
    endtask
  task spi_read_ndword;
          input          use_qspi;
          input    [7:0] command;
          input   [31:0] addr;
          input    [7:0] dummy_cycles;
          input  integer num_words;
          begin
                  padmode_spi_master = use_qspi ? `SPI_QUAD_TX : `SPI_STD;
                  spi_sck = 0;
                  #`SPI_SEMIPERIOD spi_sck = 0;
                  #`SPI_SEMIPERIOD spi_sck = 0;
                  spi_csn = 0;
                  #`SPI_SEMIPERIOD spi_sck = 0;
                  #`SPI_SEMIPERIOD spi_sck = 0;
                  if (use_qspi)
                  begin
                          for (int i = 2; i > 0; i--)
                          begin
                                  spi_sdo3 = command[4*i-1];
                                  spi_sdo2 = command[4*i-2];
                                  spi_sdo1 = command[4*i-3];
                                  spi_sdo0 = command[4*i-4];
                                  #`SPI_SEMIPERIOD spi_sck = 1;
                                  #`SPI_SEMIPERIOD spi_sck = 0;
                          end
                  end
                  else
                  begin
                          for (int i = 7; i >= 0; i--)
                          begin
                                  spi_sdo0 = command[i];
                                  #`SPI_SEMIPERIOD spi_sck = 1;
                                  #`SPI_SEMIPERIOD spi_sck = 0;
                          end
                  end
                  if (use_qspi)
                  begin
                          for (int i = 8; i > 0; i--)
                          begin
                                  spi_sdo3 = addr[4*i-1];
                                  spi_sdo2 = addr[4*i-2];
                                  spi_sdo1 = addr[4*i-3];
                                  spi_sdo0 = addr[4*i-4];
                                  #`SPI_SEMIPERIOD spi_sck = 1;
                                  #`SPI_SEMIPERIOD spi_sck = 0;
                          end
                  end
                  else
                  begin
                          for (int i = 31; i >= 0; i--)
                          begin
                                  spi_sdo0 = addr[i];
                                  #`SPI_SEMIPERIOD spi_sck = 1;
                                  #`SPI_SEMIPERIOD spi_sck = 0;
                          end
                  end
                  padmode_spi_master = use_qspi ? `SPI_QUAD_RX : `SPI_STD;
                  for (int i = 32; i >= 0; i--)
                  begin
                          #`SPI_SEMIPERIOD spi_sck = 1;
                          #`SPI_SEMIPERIOD spi_sck = 0;
                  end
                  if (use_qspi)
                  begin
                          for (int n = 0; n < num_words; n++)
                          begin
                          for (int i = 8; i > 0; i--)
                          begin
                                  #`SPI_SEMIPERIOD spi_sck = 1;
                                  data_rx[n][4*i-1] = spi_sdi3 ;
                                  data_rx[n][4*i-2] = spi_sdi2 ;
                                  data_rx[n][4*i-3] = spi_sdi1 ;
                                  data_rx[n][4*i-4] = spi_sdi0 ;
                                  #`SPI_SEMIPERIOD spi_sck = 0;
                          end
                          end
                  end
                  else
                  begin
                          for (int n = 0; n < num_words; n++)
                          begin
                          for (int i = 31; i >= 0; i--)
                          begin
                                  #`SPI_SEMIPERIOD spi_sck = 1;
                                  data_rx[n][i] = spi_sdi0 ;
                                  #`SPI_SEMIPERIOD spi_sck = 0;
                          end
                          end
                  end
                  #`SPI_SEMIPERIOD spi_sck = 0;
                  #`SPI_SEMIPERIOD spi_sck = 0;
                  spi_csn   = 1;
                  #`SPI_SEMIPERIOD spi_sck = 0;
                  #`SPI_SEMIPERIOD spi_sck = 0;
                  padmode_spi_master = use_qspi ? `SPI_QUAD_TX : `SPI_STD;
          end
  endtask

  generate if (DUMP_VCD != 0)
  begin : VCD_DUMP_GEN
    integer dump_counter = 0;

    always @(posedge wire_clk_out)
    begin
      if (dump_counter != 0)
        dump_counter++;

        // wait for a few cycles to get to the real testcode
      if (dump_counter == 10) begin
        $display($time, " VCD dump on");
        $dumpon;
      end

      if (dump_counter == DUMP_VCD) begin
        $display($time, " VCD dump off");
        $dumpoff;
        $stop;
      end
    end

    always @(s_trigger)
    begin
      // start dumping when GPIO pin gets high
      if (s_trigger == 1'b1 && dump_counter == 0) begin
        dump_counter = 1;
      end

      // stop dumping when GPIO pin is low again
      if (s_trigger == 1'b0 && dump_counter != 0) begin
        $display($time, " VCD dump off");
        $dumpoff;
        $stop;
      end
    end
  end
  endgenerate

`include "readmem_128x4_ramloops.sv"

//`include "tb_mem_pkg.sv"
endmodule
