//`timescale 1ns/1ps
`include "ulpsoc_defines.sv"
`include "tb_jtag_pkg.sv"

`define SPI_STD     2'b00
`define SPI_QUAD_TX 2'b01
`define SPI_QUAD_RX 2'b10

`define SPI_SEMIPERIOD      50000    //10Mhz SPI CLK
//`define REF_CLK_SEMIPERIOD  15259000 //32.768 Hz REF CLK
`define REF_CLK_SEMIPERIOD  12500  //40MHz REF CLK
`define TST_CLK_SEMIPERIOD  100000 // 5MHz REF CLK

`define DELAY_BETWEEN_SPI   100000

`define RND_SEED 12345678
`define L2_SIZE  32768
`define SCAN_NUM 12
`define LOOP_NUM 300

//`define TEST_CLK_DIV 1


module tb;

  parameter  LOAD_L2       = "PRELOAD";   // valid values are "SPI", "JTAG", "STANDALONE" "PRELOAD", "" (no load of L2)
  parameter  FLASH_PROGRAM = 0;       // if you like to use the flash programming mode
  parameter  ENABLE_VPI    = 0;
  parameter  BAUDRATE      = 218150;
//  parameter  BAUDRATE      = 115200;
  parameter  INTERNAL_EOC  = "FALSE";
  parameter  ENABLE_BBGENBP = "TRUE";
  parameter  EXEC_TEST     = ""; //available tests are
                                 //1-CLK_BYPASS
                                 //2-HOST
                                 //3-DEBUG
                                 //4-MEMTEST 


  localparam NB_CORES = 4;

  logic                 s_rst_n;
  logic                 s_clk_ref;

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

 logic                 s_clk_test;
  wire [`SCAN_NUM-1:0] w_si;
  wire [`SCAN_NUM-1:0] w_so;
 logic                 s_rstn_pattern;
 logic                 s_se;
 wire                  w_se;
 logic [`SCAN_NUM-1:0] s_si;

  wire                 s_eoc;
  wire                 wire_rst_n;
  wire                 wire_clk_ref;
  wire                 wire_clk_ref_1;
  wire                 wire_mode_select;

  wire                 s_i2s_rstn;
  wire                 s_i2s_lsb_first;

  wire                 s_i2s_pdm_ddr;
  wire                 s_i2s_pdm_en;
  wire                 s_i2s_sck;
  wire                 s_i2s_ws;
  wire           [7:0] s_i2s_data;

  pullup sda_pullup_i (s_i2c_sda);
  pullup scl_pullup_i (s_i2c_scl);

    AXI_BUS
    #(
        .AXI_ADDR_WIDTH(32),
        .AXI_DATA_WIDTH(64),
        .AXI_ID_WIDTH(10),
        .AXI_USER_WIDTH(6)
    )
    s_printf_bus();

  wire                w_trstn ;
  wire                w_tck   ;
  wire                w_tdi   ;
  wire                w_tms   ;
  wire                w_tdo;

  logic                s_trstn;
  logic                s_tck  ;
  logic                s_tdi  ;
  logic                s_tms  ;
  logic                s_tdo;
  logic                s_mode_select;

  logic [255:0][63:0]  jtag_data;
  logic  [31:0]        jtag_addr;
  integer              jtag_burst_len;
  logic                s_cluster_check;

`include "tb_spi_pkg.sv"

  assign w_rst_n    = s_rst_n;
  assign w_ref_clk  = s_clk_ref;
  assign w_test_clk = s_clk_test;

assign w_trstn = s_trstn;
assign w_tck   = s_tck  ;
assign w_tdi   = s_tdi  ;
assign w_tms   = s_tms  ;
assign s_tdo = w_tdo;
assign wire_mode_select = s_mode_select;

assign w_si = s_si;
assign w_se = s_se;




        pulp_chip i_dut
        (
            .pad_sspi_sio0     ( w_si[0]    ),
            .pad_sspi_sio1     ( w_si[1]    ),
            .pad_sspi_sio2     ( w_si[2]    ),
            .pad_sspi_sio3     ( w_si[3]    ),
            .pad_sspi_csn      ( w_si[4]    ),
            .pad_sspi_sck      ( w_test_clk ),
            .pad_mspi_sio0     ( w_si[5]    ),
            .pad_mspi_sio1     ( w_si[6]    ),
            .pad_mspi_sio2     ( w_si[7]    ),
            .pad_mspi_sio3     ( w_si[8]    ),
            .pad_mspi_csn      ( w_si[9]    ),
            .pad_mspi_sck      ( w_si[10]   ),
            .pad_uart_tx       ( w_si[11]   ),
            .pad_uart_rx       ( w_so[0]    ),
            .pad_i2c_sda       ( w_so[1]    ),
            .pad_i2c_scl       ( w_so[2]    ),
            .pad_audio_i2s_ws  ( w_so[3]    ),
            .pad_audio_i2s_sck ( w_so[4]    ),
            .pad_audio_i2s_sdi0( w_so[5]    ),
            .pad_audio_i2s_sdi1( w_so[6]    ),
            .pad_cam_i2s_sck   ( w_so[7]    ),
            .pad_cam_i2s_ws    ( w_so[8]    ),
            .pad_cam_i2s_sdi0  ( w_so[9]    ),
            .pad_cam_i2s_sdi1  ( w_so[10]   ),
            .pad_power_down    ( w_so[11]   ),
            .pad_jtag_tdi      ( w_tdi      ),
            .pad_jtag_tdo      ( w_tdo      ),
            .pad_jtag_tms      ( w_tms      ),
            .pad_jtag_trst     ( w_trstn    ),
            .pad_jtag_tck      ( w_tck      ),
            .pad_reset_n       ( w_rst_n    ),
            .pad_ref_clk       ( w_ref_clk  ),
            .pad_test_clk      ( w_test_clk ),
            .pad_out_clk       ( w_clk_out  ),
            .pad_mode_select   ( w_se       )
        );

        pattern_check pattern_check_i
        (
            .cluster_check_i(s_cluster_check),
            .clk_i(s_clk_test),
            .rstn_i(s_rstn_pattern),
            .scan_i(w_so),
            .scan_ok_o(s_check_ok)
        );

        initial
        begin
                s_clk_ref = 1'b1;
                forever s_clk_ref = #(`REF_CLK_SEMIPERIOD) ~s_clk_ref;
        end

        initial
          begin
                s_trstn<= 1'b0;
                s_tck  <= 1'b0;
                s_tdi  <= 1'b0;
                s_tms  <= 1'b0;
                s_rst_n   <= 1'b0;
                s_rstn_pattern <= 1'b0;
                s_se <= 1'b0;
                s_clk_test <= 1'b0;
                s_cluster_check <= 1'b0;
                $display("Asserting hard reset");
                #50000000; // 1mS reset pulse

                s_rst_n <= 1'b1;
                s_rstn_pattern <= 1'b1;

                $display("Releasing hard reset");
                #200000000; // 1mS delay

                jtag_reset();
                jtag_softreset();
                #5000;
                test_mode_if.init();
                test_mode_if.set_confreg(22'h000001);
                s_cluster_check <= 1'b0;

                s_rst_n   <= 1'b0;
                s_rstn_pattern <= 1'b0;
                $display("Asserting hard reset");
                #50000000; // 1mS reset pulse

                s_rst_n <= 1'b1;
                s_rstn_pattern <= 1'b1;

                $display("Releasing hard reset");
                #50000000; // 1mS delay


                #5000;

                s_se <= 1'b1;

                inject_pattern(60);

                s_se <= 1'b0;

                if(!s_check_ok)
                begin
                  $display("ERROR: soc scans are not functional");
                  $finish;
                end
                else
                begin
                  $display("SOC scans are OK");
                end


                $display("Checking CLUSTER scans");
                test_mode_if.init();
                test_mode_if.set_confreg(22'h200001);
                s_cluster_check <= 1'b1;

                s_rst_n   <= 1'b0;
                s_rstn_pattern <= 1'b0;
                $display("Asserting hard reset");
                #50000000; // 1mS reset pulse

                s_rst_n <= 1'b1;
                s_rstn_pattern <= 1'b1;

                $display("Releasing hard reset");
                #50000000; // 1mS delay

                #5000;

                s_se <= 1'b1;

                inject_pattern(110);

                s_se <= 1'b0;

                if(!s_check_ok)
                begin
                  $display("ERROR: cluster scans are not functional");
                  $finish;
                end
                else
                begin
                  $display("SOC and CLUSTER scans are OK");
                  $finish;
                end
    end


endmodule

task inject_pattern(input integer loop);
  integer i;
  integer l,j;
  logic [31:0] scan_value [`SCAN_NUM-1:0];
  for (i=0;i<`SCAN_NUM;i++)
    scan_value[i] <= {16'hDEAD,i[15:0]};
  for (l=0;l<loop;l++)
  begin
    for (i=0;i<32;i++)
    begin
      tb.s_clk_test <= 1'b0;
      #`TST_CLK_SEMIPERIOD;
      tb.s_clk_test <= 1'b1;
      #`TST_CLK_SEMIPERIOD;
      for (j=0;j<`SCAN_NUM;j++)
        tb.s_si[j] <= scan_value[j][i];
      tb.s_clk_test <= 1'b0;
    end
  end
endtask

module pattern_check
(
  input  logic                 cluster_check_i,
  input  logic                 clk_i,
  input  logic                 rstn_i,
  input  logic [`SCAN_NUM-1:0] scan_i,
  output logic                 scan_ok_o
);

  logic [31:0] expected_val [`SCAN_NUM-1:0];
  logic [31:0] real_val [`SCAN_NUM-1:0];
  logic [`SCAN_NUM-1:0] result;
  integer i,j;

  initial
  begin
      for (i=0;i<`SCAN_NUM;i++)
        expected_val[i]={16'hDEAD,i[15:0]};
  end

  always_ff @(posedge clk_i or negedge rstn_i) 
  begin 
    if(~rstn_i) 
    begin
      result <= 'h0;
      for (i=0;i<`SCAN_NUM;i++)
        real_val[i] <= 'h0;
    end 
    else 
    begin
      for (i=0;i<`SCAN_NUM;i++)
      begin
        real_val[i] <= {scan_i[i],real_val[i][31:1]};
        if ((real_val[i] == expected_val[i]) || (real_val[i] == ~expected_val[i]))
          result[i]=1'b1;
      end
      if (cluster_check_i)
        result[0]=1'b1;
    end
  end

  assign scan_ok_o = &result;

  endmodule
