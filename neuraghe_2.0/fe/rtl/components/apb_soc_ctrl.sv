`define REG_PADFUN0     5'b00000 //BASEADDR+0x00
//`define REG_PADFUN1     5'b00001 //BASEADDR+0x04
`define REG_CLKDIV0     5'b00010 //BASEADDR+0x08
`define REG_CLKDIV1     5'b00011 //BASEADDR+0x0C
`define REG_INFO        5'b00100 //BASEADDR+0x10
`define REG_INFOEXTD    5'b00101 //BASEADDR+0x14
`define REG_MMARGIN     5'b00110 //BASEADDR+0x18
`define REG_PADCFG0     5'b00111 //BASEADDR+0x1C
`define REG_PADCFG1     5'b01000 //BASEADDR+0x20
`define REG_PADCFG2     5'b01001 //BASEADDR+0x24
`define REG_PADCFG3     5'b01010 //BASEADDR+0x28
`define REG_PADCFG4     5'b01011 //BASEADDR+0x2C
`define REG_PADCFG5     5'b01100 //BASEADDR+0x30
`define REG_PADCFG6     5'b01101 //BASEADDR+0x34
//`define REG_PADCFG7     5'b01110 //BASEADDR+0x38
//`define REG_PADCFG8     5'b01111 //BASEADDR+0x3C
`define REG_PWRCMD      5'b10000 //BASEADDR+0x40
`define REG_PWRCFG      5'b10001 //BASEADDR+0x44
`define REG_PWRREG      5'b10010 //BASEADDR+0x48
`define REG_CLKDIV2     5'b10011 //BASEADDR+0x4C
`define REG_CLKDIV3     5'b10100 //BASEADDR+0x50
`define REG_HS_LS_L2    5'b10101 //BASEADDR+0x54
`define REG_L2_SLEEP    5'b10110 //BASEADDR+0x58
`define REG_CLKDIV4     5'b10111 //BASEADDR+0x5C

module apb_soc_ctrl 
#(
    parameter APB_ADDR_WIDTH = 12,  //APB slaves are 4KB by default
    parameter NB_CLUSTERS     = 1,   //N_CLUSTERS
    parameter NB_CORES        = 4,   //N_CORES
    parameter RM_SIZE        = 4,
    parameter WM_SIZE        = 4
) 
(
    input  logic                      HCLK,
    input  logic                      HRESETn,
    input  logic [APB_ADDR_WIDTH-1:0] PADDR,
    input  logic               [31:0] PWDATA,
    input  logic                      PWRITE,
    input  logic                      PSEL,
    input  logic                      PENABLE,
    output logic               [31:0] PRDATA,
    output logic                      PREADY,
    output logic                      PSLVERR,

    output logic        [RM_SIZE-1:0] rm_l2_mem_o,
    output logic        [WM_SIZE-1:0] wm_l2_mem_o,
    output logic                      HS_l2_mem_o,
    output logic                      LS_l2_mem_o,
    output logic                      sleep_l2_mem_o,

    output logic                      pm_power_down_req_o,
    output logic                      pm_cluster_rst_req_o,
    output logic                      pm_wakeup_polarity_o,
    output logic                [4:0] pm_wakeup_select_o,
    output logic                [7:0] pm_busy_cycle_o,
    output logic                [7:0] pm_rst_cycle_o,
    output logic                      pm_valid_o,
    input  logic                      pm_ack_i,

    output logic                      pm_BBGEN_req_o,
    output logic [1:0]                pm_BBGEN_dat_o,
    output logic [2:0]                pm_BBGEN_sel_o,

    output logic                [7:0] clk_div0_data_o,
    output logic                      clk_div0_valid_o,
    input  logic                      clk_div0_ack_i,
    output logic                [7:0] clk_div1_data_o,
    output logic                      clk_div1_valid_o,
    input  logic                      clk_div1_ack_i,
    output logic                [7:0] clk_div2_data_o,
    output logic                      clk_div2_valid_o,
    input  logic                      clk_div2_ack_i,
    output logic                [7:0] clk_div3_data_o,
    output logic                      clk_div3_valid_o,
    input  logic                      clk_div3_ack_i,
    output logic                [7:0] clk_div4_data_o,
    output logic                      clk_div4_valid_o,
    input  logic                      clk_div4_ack_i,

    output logic         [24:0] [5:0] pad_cfg,
    output logic               [24:0] pad_mux
);

    logic [7:0]                        r_clkdiv0;
    logic [7:0]                        r_clkdiv1;
    logic [7:0]                        r_clkdiv2;
    logic [7:0]                        r_clkdiv3;
    logic [7:0]                        r_clkdiv4;

    logic                              r_clk_div0_valid;
    logic                              r_clk_div1_valid;
    logic                              r_clk_div2_valid;
    logic                              r_clk_div3_valid;
    logic                              r_clk_div4_valid;

    logic [31:0]                       r_pwr_reg;
    logic [31:0]                       r_pad_fun0;
    logic [31:0]                       r_pad_fun1;

    logic [WM_SIZE-1:0]                r_wm_l2_mem;
    logic [RM_SIZE-1:0]                r_rm_l2_mem;
    logic                              r_LS_l2_mem;
    logic                              r_HS_l2_mem;
    logic                              r_sleep_l2_mem;

    logic [4:0]                        s_apb_addr;

    logic [15:0]                       n_cores;
    logic [15:0]                       n_clusters;

    logic                              r_wakeup_pol;
    logic [7:0]                        r_busy_wait;
    logic [7:0]                        r_rst_wait;
    logic [4:0]                        r_wakeup_select;


    logic                              r_power_down_req;
    logic                              r_cluster_rst_req;

    logic                              r_BBGEN_req;
    logic [1:0]                        r_BBGEN_dat;
    logic [2:0]                        r_BBGEN_sel;




    logic                              r_pm_valid;

    edge_propagator_tx i_edgeprop_pm 
    (
      .clk_i(HCLK),
      .rstn_i(HRESETn),
      .valid_i(r_pm_valid),
      .ack_i(pm_ack_i),
      .valid_o(pm_valid_o)
    );

    edge_propagator_tx i_edgeprop_0 
    (
      .clk_i(HCLK),
      .rstn_i(HRESETn),
      .valid_i(r_clk_div0_valid),
      .ack_i(clk_div0_ack_i),
      .valid_o(clk_div0_valid_o)
    );

    edge_propagator_tx i_edgeprop_1
    (
      .clk_i(HCLK),
      .rstn_i(HRESETn),
      .valid_i(r_clk_div1_valid),
      .ack_i(clk_div1_ack_i),
      .valid_o(clk_div1_valid_o)
    );

    edge_propagator_tx i_edgeprop_2
    (
      .clk_i(HCLK),
      .rstn_i(HRESETn),
      .valid_i(r_clk_div2_valid),
      .ack_i(clk_div2_ack_i),
      .valid_o(clk_div2_valid_o)
    );

    edge_propagator_tx i_edgeprop_3
    (
      .clk_i(HCLK),
      .rstn_i(HRESETn),
      .valid_i(r_clk_div3_valid),
      .ack_i(clk_div3_ack_i),
      .valid_o(clk_div3_valid_o)
    );

    edge_propagator_tx i_edgeprop_4
    (
      .clk_i(HCLK),
      .rstn_i(HRESETn),
      .valid_i(r_clk_div4_valid),
      .ack_i(clk_div4_ack_i),
      .valid_o(clk_div4_valid_o)
    );

   assign s_apb_addr = PADDR[6:2];

   always @ (posedge HCLK or negedge HRESETn) 
   begin
        if(~HRESETn) 
          begin
             r_power_down_req   = 1'b0;
             r_cluster_rst_req  = 1'b0;

             r_BBGEN_req        = 1'b0;
             r_BBGEN_sel        = 2'b00;
             r_BBGEN_dat        = 2'b00;

             r_clkdiv0          =  'h0;
             r_clkdiv1          =  'h0;
             r_clkdiv2          = 8'h0A;
             r_clkdiv3          = 8'h00; // BBGEN_100M CLOCK DIVIDER: //FIXME ANTONIO
             r_clkdiv4          = 8'h00; // BBGEN_100M CLOCK DIVIDER: //FIXME ANTONIO

             r_clk_div0_valid     = 1'b0;
             r_clk_div1_valid     = 1'b0;
             r_clk_div2_valid     = 1'b0;
             r_clk_div3_valid     = 1'b0;
             r_clk_div4_valid     = 1'b0;

             r_pad_fun0         =  'h0;
             r_pad_fun1         =  'h0;

             r_pm_valid         =  'h0;

             r_rm_l2_mem        = {RM_SIZE{1'b0}};
             r_wm_l2_mem        = {WM_SIZE{1'b0}};
             r_HS_l2_mem        = 1'b0;
             r_LS_l2_mem        = 1'b1;
             r_sleep_l2_mem     = 1'b0;


             r_pwr_reg          =  'h0;
             pad_cfg[0]         = 6'b111111; //pad sspi_sio0
             pad_cfg[1]         = 6'b111111; //pad sspi_sio1
             pad_cfg[2]         = 6'b111111; //pad sspi_sio2
             pad_cfg[3]         = 6'b111111; //pad sspi_sio3
             pad_cfg[4]         = 6'b111111; //pad sspi_csn
             pad_cfg[5]         = 6'b111111; //pad sspi_sck
             pad_cfg[6]         = 6'b111111; //pad mspi_sio0
             pad_cfg[7]         = 6'b111111; //pad mspi_sio1
             pad_cfg[8]         = 6'b111111; //pad mspi_sio2
             pad_cfg[9]         = 6'b111111; //pad mspi_sio3
             pad_cfg[10]        = 6'b111111; //pad mspi_csn
             pad_cfg[11]        = 6'b111111; //pad mspi_sck
             pad_cfg[12]        = 6'b111111; //pad uart_tx
             pad_cfg[13]        = 6'b111111; //pad uart_rx
             pad_cfg[14]        = 6'b111111; //pad i2c_sda
             pad_cfg[15]        = 6'b111111; //pad i2c_scl
             pad_cfg[16]        = 6'b111111; //pad audio_i2s_ws
             pad_cfg[17]        = 6'b111111; //pad audio_i2s_sck
             pad_cfg[18]        = 6'b111111; //pad audio_i2s_sdi0
             pad_cfg[19]        = 6'b111111; //pad audio_i2s_sdi1
             pad_cfg[20]        = 6'b111111; //pad cam_i2s_sck
             pad_cfg[21]        = 6'b111111; //pad cam_i2s_ws
             pad_cfg[22]        = 6'b111111; //pad cam_i2s_sdi0
             pad_cfg[23]        = 6'b111111; //pad cam_i2s_sdi1
             pad_cfg[24]        = 6'b111111; //pad power_down
             r_busy_wait        =   'hF;
             r_rst_wait         =   'hF;
             r_wakeup_pol       =  1'b1;
             r_wakeup_select    =   'h0;
          end
        else 
          begin
             r_clk_div0_valid = 1'b0;
             r_clk_div1_valid = 1'b0;
             r_clk_div2_valid = 1'b0;
             r_clk_div3_valid = 1'b0;
             r_clk_div4_valid = 1'b0;

             r_pm_valid       = 1'b0;
             if (PSEL && PENABLE && PWRITE)
               begin
                  case (s_apb_addr)
                    `REG_PADFUN0:
                      r_pad_fun0 = PWDATA;
                    `REG_CLKDIV0:
                      begin
                         r_clkdiv0      = PWDATA[7:0];
                         r_clk_div0_valid = 1'b1;
                      end
                    `REG_CLKDIV1:
                      begin
                         r_clkdiv1      = PWDATA[7:0];
                         r_clk_div1_valid = 1'b1;
                      end
                    `REG_CLKDIV2:
                      begin
                         r_clkdiv2      = PWDATA[7:0];
                         r_clk_div2_valid = 1'b1;
                      end

                    `REG_CLKDIV3:
                      begin
                         r_clkdiv3      = PWDATA[7:0];
                         r_clk_div3_valid = 1'b1;
                      end

                    `REG_CLKDIV4:
                      begin
                         r_clkdiv4      = PWDATA[7:0];
                         r_clk_div4_valid = 1'b1;
                      end

                    `REG_MMARGIN:
                      begin
                        //r_margin_l2_mem_en = PWDATA[0];
                        r_rm_l2_mem        = PWDATA[RM_SIZE-1:0];
                        r_wm_l2_mem        = PWDATA[WM_SIZE+RM_SIZE-1:RM_SIZE];
                      end

                    `REG_HS_LS_L2 :
                      begin
                          r_HS_l2_mem      = PWDATA[0];
                          r_LS_l2_mem      = PWDATA[1];
                      end

                    `REG_L2_SLEEP :
                      begin
                          r_sleep_l2_mem   = PWDATA[0];
                      end

                    `REG_PADCFG0:
                      begin
                         pad_cfg[0]         = PWDATA[4:0];   //pad sspi_sio0
                         pad_cfg[1]         = PWDATA[12:8];  //pad sspi_sio1
                         pad_cfg[2]         = PWDATA[20:16]; //pad sspi_sio2
                         pad_cfg[3]         = PWDATA[28:24]; //pad sspi_sio3
                      end
                    `REG_PADCFG1:
                      begin
                         pad_cfg[4]         = PWDATA[4:0];   //pad sspi_csn
                         pad_cfg[5]         = PWDATA[12:8];  //pad sspi_sck
                         pad_cfg[6]         = PWDATA[20:16]; //pad mspi_sio0
                         pad_cfg[7]         = PWDATA[28:24]; //pad mspi_sio1
                      end
                    `REG_PADCFG2:
                      begin
                         pad_cfg[8]         = PWDATA[4:0];   //pad mspi_sio2
                         pad_cfg[9]         = PWDATA[12:8];  //pad mspi_sio3
                         pad_cfg[10]        = PWDATA[20:16]; //pad mspi_csn
                         pad_cfg[11]        = PWDATA[28:24]; //pad mspi_sck
                      end
                    `REG_PADCFG3:
                      begin
                         pad_cfg[12]        = PWDATA[4:0];   //pad uart_tx
                         pad_cfg[13]        = PWDATA[12:8];  //pad uart_rx
                         pad_cfg[14]        = PWDATA[20:16]; //pad i2c_sda
                         pad_cfg[15]        = PWDATA[28:24]; //pad i2c_scl
                      end
                    `REG_PADCFG4:
                      begin
                         pad_cfg[16]        = PWDATA[4:0];   //pad audio_i2s_ws
                         pad_cfg[17]        = PWDATA[12:8];  //pad audio_i2s_sck
                         pad_cfg[18]        = PWDATA[20:16]; //pad audio_i2s_sdi0
                         pad_cfg[19]        = PWDATA[28:24]; //pad audio_i2s_sdi1
                      end
                    `REG_PADCFG5:
                      begin
                         pad_cfg[20]        = PWDATA[4:0];   //pad cam_i2s_sck
                         pad_cfg[21]        = PWDATA[12:8];  //pad cam_i2s_ws
                         pad_cfg[22]        = PWDATA[20:16]; //pad cam_i2s_sdi0
                         pad_cfg[23]        = PWDATA[28:24]; //pad cam_i2s_sdi1
                      end
                    `REG_PADCFG6:
                      begin
                         pad_cfg[24]        = PWDATA[4:0];   //pad power_down
                      end
                    `REG_PWRCMD:
                      begin
                      end
                    `REG_PWRCFG:
                      begin
                         r_pm_valid         = 1'b1;
                         r_power_down_req   = PWDATA[0];
                         r_cluster_rst_req  = PWDATA[1];
                         r_wakeup_pol       = PWDATA[4];
                         r_BBGEN_req        = PWDATA[5];
                         r_BBGEN_dat        = PWDATA[7:6];
                         r_wakeup_select    = PWDATA[12: 8];
                         r_BBGEN_sel        = PWDATA[15:13];
                         r_busy_wait        = PWDATA[23:16];
                         r_rst_wait         = PWDATA[31:24];
                      end
                    `REG_PWRREG:
                      begin
                         r_pwr_reg        = PWDATA;
                      end
                  endcase
               end
          end
     end
     
    assign pm_power_down_req_o  = r_power_down_req;
    assign pm_cluster_rst_req_o = r_cluster_rst_req;
    assign pm_wakeup_polarity_o = r_wakeup_pol;
    assign pm_wakeup_select_o   = r_wakeup_select;
    assign pm_busy_cycle_o      = r_busy_wait;
    assign pm_rst_cycle_o       = r_rst_wait;

    assign pm_BBGEN_req_o       = r_BBGEN_req;
    assign pm_BBGEN_dat_o       = r_BBGEN_dat;
    assign pm_BBGEN_sel_o       = r_BBGEN_sel;

   always_comb
     begin
        case (s_apb_addr)
          `REG_PADFUN0:
            PRDATA = r_pad_fun0;
          `REG_CLKDIV0:
            PRDATA = {24'h0,r_clkdiv0};
          `REG_CLKDIV1:
            PRDATA = {24'h0,r_clkdiv1};
          `REG_CLKDIV2:
            PRDATA = {24'h0,r_clkdiv2};
          `REG_INFO:
            PRDATA = {n_cores,n_clusters};
          `REG_MMARGIN:
            PRDATA = {{(32-WM_SIZE-RM_SIZE) {1'b0}}, r_wm_l2_mem, r_rm_l2_mem};
          `REG_HS_LS_L2 :
            begin
               PRDATA[0] = r_HS_l2_mem;
               PRDATA[1] = r_LS_l2_mem;
               PRDATA[31:2] = '0;
            end
          `REG_L2_SLEEP :
            begin
                PRDATA[0]    = r_sleep_l2_mem;
                PRDATA[31:1] = '0;
            end
          `REG_PADCFG0:
            PRDATA = {2'b00,pad_cfg[3],2'b00,pad_cfg[2],2'b00,pad_cfg[1],2'b00,pad_cfg[0]};
          `REG_PADCFG1:
            PRDATA = {2'b00,pad_cfg[7],2'b00,pad_cfg[6],2'b00,pad_cfg[5],2'b00,pad_cfg[4]};
          `REG_PADCFG2:
            PRDATA = {2'b00,pad_cfg[11],2'b00,pad_cfg[10],2'b00,pad_cfg[9],2'b00,pad_cfg[8]};
          `REG_PADCFG3:
            PRDATA = {2'b00,pad_cfg[15],2'b00,pad_cfg[14],2'b00,pad_cfg[13],2'b00,pad_cfg[12]};
          `REG_PADCFG4:
            PRDATA = {2'b00,pad_cfg[19],2'b00,pad_cfg[18],2'b00,pad_cfg[17],2'b00,pad_cfg[16]};
          `REG_PADCFG5:
            PRDATA = {2'b00,pad_cfg[23],2'b00,pad_cfg[22],2'b00,pad_cfg[21],2'b00,pad_cfg[20]};
          `REG_PADCFG6:
            PRDATA = {24'h0,2'b00,pad_cfg[32]};
          `REG_PWRCFG:
            PRDATA = { r_rst_wait, r_busy_wait, r_BBGEN_sel, r_wakeup_select, r_BBGEN_dat, r_BBGEN_req, r_wakeup_pol, 2'b00, r_cluster_rst_req, r_power_down_req};
          `REG_PWRREG:
            PRDATA = r_pwr_reg;
          default:
            PRDATA = 'h0;
        endcase
     end

    assign rm_l2_mem_o    = r_rm_l2_mem;
    assign wm_l2_mem_o    = r_wm_l2_mem;
    assign HS_l2_mem_o    = r_HS_l2_mem;
    assign LS_l2_mem_o    = r_LS_l2_mem;
    assign sleep_l2_mem_o = r_sleep_l2_mem;


    assign clk_div0_data_o = r_clkdiv0;
    assign clk_div1_data_o = r_clkdiv1;
    assign clk_div2_data_o = r_clkdiv2;
    assign clk_div3_data_o = r_clkdiv3;
    assign clk_div4_data_o = r_clkdiv4;

    assign pad_mux = r_pad_fun0[24:0];

    assign n_cores    = NB_CORES;
    assign n_clusters = NB_CLUSTERS;

    assign PREADY  = 1'b1;
    assign PSLVERR = 1'b0;

endmodule
