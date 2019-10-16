`define PS2PULP_FETCHEN        0
`define PS2PULP_MCUHOST        2
`define PS2PULP_STDOUT_FLUSHED 3
`define PS2PULP_TRACE_FLUSHED  4
`define PS2PULP_TRACE_ACTIVE   5
`define PS2PULP_FAULTEN        29
`define PS2PULP_CLKEN          30
`define PS2PULP_RSTN           31
`define PULP2PS_EOC            0
`define PULP2PS_RET_LO         1
`define PULP2PS_RET_HI         2
`define PULP2PS_STDOUT_WAIT    3
`define PULP2PS_TRACE_WAIT     4

module pulpemu_top(
  clk_ref,
  clk_ref_fast,
  rst_ni,
  fetch_en_i,
  PULP_SPI_clk,
  PULP_SPI_cs,
  PULP_SPI_mode_1,
  PULP_SPI_mode_0,
  PULP_SPI_sdo,
  PULP_SPI_sdi,
  PULP_SPI_fetch_en,
  PULP_SPI_eoc
);

  input         clk_ref;
  input         clk_ref_fast;
  input         rst_ni;
  input         fetch_en_i;
  
  input         PULP_SPI_clk;    
  input         PULP_SPI_cs;     
  output        PULP_SPI_mode_1; 
  output        PULP_SPI_mode_0; 
  output        PULP_SPI_sdo;    
  input         PULP_SPI_sdi;    
  input         PULP_SPI_fetch_en;
  output        PULP_SPI_eoc; 
  
//  wire         PULP_SPI_clk;    
//  wire         PULP_SPI_cs;     
//  wire        PULP_SPI_mode_1; 
//  wire        PULP_SPI_mode_0; 
//  wire        PULP_SPI_sdo;    
//  wire         PULP_SPI_sdi;    
//  wire        PULP_SPI_eoc; 

  parameter NB_CORES = 4;

  wire [14:0] BRAM_PORTA_addr;
  wire        BRAM_PORTA_clk;
  wire [63:0] BRAM_PORTA_din;
  wire [63:0] BRAM_PORTA_dout;
  wire        BRAM_PORTA_en;
  wire        BRAM_PORTA_rst;
  wire [7:0]  BRAM_PORTA_we;
  wire        FCLK_CLK0;
  wire        FCLK_RESET0_N;
  wire        FCLK_RESET1_N;   
  wire [31:0] pulp2ps_gpio;
  wire [31:0] ps2pulp_gpio;
  wire        ps7_clk;
  wire        ps7_rst_n;
  wire        ps7_rst_pulp_n;
  wire        ps7_rst_clking_n;

`ifdef PULP_FAULTY_CLUSTER
  // fault injector config APB if
  wire        fg_clk;
  wire        fg_rst_n;
  wire        fg_glob_enable;
  wire [31:0] fg_cfg_PADDR;
  wire [31:0] fg_cfg_PWDATA;
  wire        fg_cfg_PWRITE;
  wire        fg_cfg_PSEL;
  wire        fg_cfg_PENABLE;
  wire [31:0] fg_cfg_PRDATA;
  wire        fg_cfg_PREADY;
  wire        fg_cfg_PSLVERR;
`endif

  wire        ref_clk_i;               // input
  wire        test_clk_i;              // input
  wire        mode_select_i;           // input
  wire        rst_ni;                  // input
  wire        clk_o;                   // output
  wire        test_mode_i;             // input
  wire        fetch_en_i;              // input
  wire        eoc_o;                   // output
  wire [1:0]  return_o;                // output
  wire        spi_slave_clk;
  wire        spi_slave_csn;
  wire [1:0]  spi_slave_mode;
  wire        spi_slave_sdo0;
  wire        spi_slave_sdo1;
  wire        spi_slave_sdo2;
  wire        spi_slave_sdo3;
  wire        spi_slave_sdi0;
  wire        spi_slave_sdi1;
  wire        spi_slave_sdi2;
  wire        spi_slave_sdi3;
  
  logic       spi_slave_clk_r; 
  logic       spi_slave_cs_r;  
  logic       spi_slave_sdi0_r;
  logic       PULP_SPI_sdo_r;
  logic       PULP_SPI_mode_1_r;
  logic       PULP_SPI_mode_0_r;


  // clock generator signals
  logic       s_rstn_sync;
  logic       s_initn_sync;
  logic       s_rstn_cluster_sync;
  logic       s_rstn_cluster_sync_soc;
  logic       s_clk_soc;
  logic       s_clk_cluster;
  logic       s_clk_soc_nongated;
  logic       s_clk_cluster_nongated;
  logic       mmcm_locked;

  // reference clock & clock manager reset 
  assign ref_clk_i          = clk_ref;

  // stdout & trace management - when buffers are filling, PULP
  // cluster is stopped using clock gating
  logic pulp_global_enable;
  logic stdout_wait;
  logic trace_wait;
  logic stdout_flushed;
  logic trace_flushed;
  logic trace_active;
  logic cg_clken;

  assign stdout_flushed = ps2pulp_gpio[`PS2PULP_STDOUT_FLUSHED];
  assign trace_flushed  = ps2pulp_gpio[`PS2PULP_TRACE_FLUSHED];

  assign cg_clken   = ps2pulp_gpio[`PS2PULP_CLKEN];

  always_ff @(posedge s_clk_soc_nongated or negedge ps7_rst_pulp_n)
  begin
    if (ps7_rst_pulp_n == 1'b0)
      pulp_global_enable = 1'b0;
    else begin
      if (stdout_wait == 1'b1)
        pulp_global_enable = 1'b0;
      else if (trace_wait & trace_active == 1'b1)
        pulp_global_enable = 1'b0;
      else 
        pulp_global_enable = mmcm_locked & cg_clken;
    end
  end

  assign test_clk_i    = 0;
  assign mode_select_i = 0;
  assign test_mode_i   = 1'b0;
  
  logic PULP_SPI_eoc_r;

  assign PULP_SPI_eoc = PULP_SPI_eoc_r;

  logic [31:0] pulp2ps_gpio_r;
  always_ff @(posedge s_clk_soc_nongated or negedge ps7_rst_pulp_n)
  begin
    if(ps7_rst_pulp_n == 1'b0)
      pulp2ps_gpio_r = 32'b0;
    else begin
      pulp2ps_gpio_r[`PULP2PS_TRACE_WAIT]             = trace_wait;
      pulp2ps_gpio_r[`PULP2PS_STDOUT_WAIT]            = stdout_wait;
      pulp2ps_gpio_r[`PULP2PS_EOC]                    = eoc_o;
      pulp2ps_gpio_r[`PULP2PS_RET_HI:`PULP2PS_RET_LO] = return_o;
    end
  end
  assign pulp2ps_gpio = pulp2ps_gpio_r;

  always_ff @(posedge ps7_clk or negedge ps7_rst_pulp_n)
  begin
    if(ps7_rst_pulp_n == 1'b0)
      PULP_SPI_eoc_r = 1'b0;
    else
      PULP_SPI_eoc_r = eoc_o;
  end
  

  // spi slave - connected to I/O pins
  assign spi_slave_sdi0 = spi_slave_sdi0_r;
  assign spi_slave_sdi1 = 0;
  assign spi_slave_sdi2 = 0;
  assign spi_slave_sdi3 = 0;
  assign spi_slave_clk  = spi_slave_clk_r;
  assign spi_slave_csn  = spi_slave_cs_r;
  assign PULP_SPI_sdo   = PULP_SPI_sdo_r;
  assign PULP_SPI_mode_1 = PULP_SPI_mode_1_r;
  assign PULP_SPI_mode_0 = PULP_SPI_mode_0_r;

  always_ff @(posedge ps7_clk or negedge ps7_rst_clking_n)
  begin
    if(ps7_rst_clking_n==1'b0) begin
      spi_slave_clk_r   = 1'b1;
      spi_slave_sdi0_r  = 1'b0;
      PULP_SPI_sdo_r    = 1'b0;
      PULP_SPI_mode_1_r = 1'b0;
      PULP_SPI_mode_0_r = 1'b0;
    end
    else begin
      spi_slave_clk_r   = PULP_SPI_clk;
      spi_slave_sdi0_r  = PULP_SPI_sdi;
      PULP_SPI_sdo_r    = spi_slave_sdo0;
      PULP_SPI_mode_1_r = spi_slave_mode[1];
      PULP_SPI_mode_0_r = spi_slave_mode[0];
    end
  end
  
  assign PULP_SPI_clk = 0;
  assign PULP_SPI_sdi = 0;
 
  
  // SPI CS debouncing
  // chip select is sampled in first cycle in 1->0 transition
  // but in 64th cycle in 0->1 transition, to avoid spurious reset
  logic [5:0] spi_cs_counter;
  always_ff @(posedge ps7_clk or negedge ps7_rst_clking_n)
  begin
    if(ps7_rst_clking_n==1'b0) begin
      spi_slave_cs_r = 1'b1;
      spi_cs_counter = 6'd0;
    end
    else begin
      // chip select sampled immediately in 1->0 transition
      if((spi_slave_cs_r == 1'b1) && (PULP_SPI_cs == 1'b0))
        spi_slave_cs_r = 1'b0;
      // chip select sampled only after 64 consecutive
      // cycles in 0->1 transition, to avoid spurious reset
      // in SPI rx registers
      else if(spi_slave_cs_r == 1'b0) begin
        if(PULP_SPI_cs == 1'b0) begin
          spi_slave_cs_r = 1'b0;
          spi_cs_counter = 6'd0;
        end
        else if(spi_cs_counter[5] == 1'b0) begin
          spi_slave_cs_r = 1'b0;
          spi_cs_counter = spi_cs_counter + 6'd1;
        end
        else begin
          spi_slave_cs_r = 1'b1;
          spi_cs_counter = 6'd0;
        end
      end
    end
  end

  // gpio in - constant for now
  assign gpio_in = 0;



  assign s_rstn_sync = rst_ni;
  assign s_initn_sync = rst_ni;
  assign s_rstn_cluster_sync = rst_ni;
  assign s_rstn_cluster_sync_soc = rst_ni;

  assign s_clk_cluster = ref_clk_i;
  assign s_clk_soc = ref_clk_i;
  assign s_clk_soc_nongated = ref_clk_i;
  assign s_clk_cluster_nongated = ref_clk_i;

  // PULP SoC
  ulpsoc ulpsoc_i (
    .ref_clk_i               (s_clk_soc_nongated     ), // from clk_rst_gen
    .test_clk_i              (s_clk_soc_nongated     ), // from clk_rst_gen
    .rst_ni                  (rst_ni                 ), // **************************************** from ps7
    .test_mode_i             (test_mode_i            ), //0
    .mode_select_i           (mode_select_i          ), //0
    .fetch_en_i              (fetch_en_i             ), // generated by power manager or ps7. It must be asserted when ulpsoc is ready to start
    .eoc_o                   (eoc_o                  ), // to ps7. It is used by the TB
    .return_o                (return_o               ), // **************************************** to ps7 GPIO

    .rstn_sync_i             ( s_rstn_sync             ), 
    .initn_sync_i            ( s_initn_sync            ), 
    .rstn_cluster_sync_i     ( s_rstn_cluster_sync     ), 
    .rstn_cluster_sync_soc_i ( s_rstn_cluster_sync_soc ), 
    .clk_soc_i               ( s_clk_soc_nongated      ), 
    .clk_cluster_i           ( s_clk_cluster           ), 
    .clk_cluster_fast_i           ( clk_ref_fast           )  ,
    
    
    
      .data_slave_aw_addr (   ),
    .data_slave_aw_prot (   ),
    .data_slave_aw_region (   ),
    .data_slave_aw_len (   ),
    .data_slave_aw_size (   ),
    .data_slave_aw_burst (   ),
    .data_slave_aw_cache (   ),
    .data_slave_aw_qos (   ),
    .data_slave_aw_id (   ),
    .data_slave_aw_user (   ),
    .data_slave_aw_writetoken (   ),
    .data_slave_aw_readpointer (   ),
    .data_slave_ar_addr (   ),
    .data_slave_ar_prot (   ),
    .data_slave_ar_region (   ),
    .data_slave_ar_len (   ),
    .data_slave_ar_size (   ),
    .data_slave_ar_burst (   ),
    .data_slave_ar_cache (   ),
    .data_slave_ar_qos (   ),
    .data_slave_ar_id (   ),
    .data_slave_ar_user (   ),
    .data_slave_ar_writetoken (   ),
    .data_slave_ar_readpointer (   ),
    .data_slave_w_data (   ),
    .data_slave_w_strb (   ),
    .data_slave_w_user (   ),
    .data_slave_w_writetoken (   ),
    .data_slave_w_readpointer (   ),
    .data_slave_r_data (   ),
    .data_slave_r_resp (   ),
    .data_slave_r_id (   ),
    .data_slave_r_user (   ),
    .data_slave_r_writetoken (   ),
    .data_slave_r_readpointer (   ),
    .data_slave_b_resp (   ),
    .data_slave_b_id (   ),
    .data_slave_b_user (   ),
    .data_slave_b_writetoken (   ),
    .data_slave_b_readpointer (   ),
    
    .instr_master_aw_addr (   ),
    .instr_master_aw_prot (   ),
    .instr_master_aw_region (   ),
    .instr_master_aw_len (   ),
    .instr_master_aw_size (   ),
    .instr_master_aw_burst (   ),
    .instr_master_aw_cache (   ),
    .instr_master_aw_qos (   ),
    .instr_master_aw_id (   ),
    .instr_master_aw_user (   ),
    .instr_master_aw_writetoken (   ),
    .instr_master_aw_readpointer (   ),
    .instr_master_ar_addr (   ),
    .instr_master_ar_prot (   ),
    .instr_master_ar_region (   ),
    .instr_master_ar_len (   ),
    .instr_master_ar_size (   ),
    .instr_master_ar_burst (   ),
    .instr_master_ar_cache (   ),
    .instr_master_ar_qos (   ),
    .instr_master_ar_id (   ),
    .instr_master_ar_user (   ),
    .instr_master_ar_writetoken (   ),
    .instr_master_ar_readpointer (   ),
    .instr_master_w_data (   ),
    .instr_master_w_strb (   ),
    .instr_master_w_user (   ),
    .instr_master_w_writetoken (   ),
    .instr_master_w_readpointer (   ),
    .instr_master_r_data (   ),
    .instr_master_r_resp (   ),
    .instr_master_r_id (   ),
    .instr_master_r_user (   ),
    .instr_master_r_writetoken (   ),
    .instr_master_r_readpointer (   ),
    .instr_master_b_resp (   ),
    .instr_master_b_id (   ),
    .instr_master_b_user (   ),
    .instr_master_b_writetoken (   ),
    .instr_master_b_readpointer (   ),
    
    .data_master_aw_addr (   ),
    .data_master_aw_prot (   ),
    .data_master_aw_region (   ),
    .data_master_aw_len (   ),
    .data_master_aw_size (   ),
    .data_master_aw_burst (   ),
    .data_master_aw_cache (   ),
    .data_master_aw_qos (   ),
    .data_master_aw_id (   ),
    .data_master_aw_user (   ),
    .data_master_aw_writetoken (   ),
    .data_master_aw_readpointer (   ),
    .data_master_ar_addr (   ),
    .data_master_ar_prot (   ),
    .data_master_ar_region (   ),
    .data_master_ar_len (   ),
    .data_master_ar_size (   ),
    .data_master_ar_burst (   ),
    .data_master_ar_cache (   ),
    .data_master_ar_qos (   ),
    .data_master_ar_id (   ),
    .data_master_ar_user (   ),
    .data_master_ar_writetoken (   ),
    .data_master_ar_readpointer (   ),
    .data_master_w_data (   ),
    .data_master_w_strb (   ),
    .data_master_w_user (   ),
    .data_master_w_writetoken (   ),
    .data_master_w_readpointer (   ),
    .data_master_r_data (   ),
    .data_master_r_resp (   ),
    .data_master_r_id (   ),
    .data_master_r_user (   ),
    .data_master_r_writetoken (   ),
    .data_master_r_readpointer (   ),
    .data_master_b_resp (   ),
    .data_master_b_id (   ),
    .data_master_b_user (   ),
    .data_master_b_writetoken (   ),
    .data_master_b_readpointer (   ),
    
    .data_slave_aw_lock (   ),
    .data_slave_ar_lock (   ),
    .data_slave_w_last (   ),
    .data_slave_r_last (   ),
    
    .instr_master_aw_lock (   ),
    .instr_master_ar_lock (   ),
    .instr_master_w_last (   ),
    .instr_master_r_last (   ),
    
    .data_master_aw_lock (   ),
    .data_master_ar_lock (   ),
    .data_master_w_last (   ),
    .data_master_r_last
    
    
    
    
  );

endmodule
