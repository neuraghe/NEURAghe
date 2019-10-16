`define REG_PADFUN0     5'b00000 //BASEADDR+0x00
`define REG_PADFUN1     5'b00001 //BASEADDR+0x04
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
`define REG_PADCFG7     5'b01110 //BASEADDR+0x38
`define REG_PADCFG8     5'b01111 //BASEADDR+0x3C
`define REG_PWRCMD      5'b10000 //BASEADDR+0x40
`define REG_PWRCFG      5'b10001 //BASEADDR+0x44
`define REG_PWRREG      5'b10010 //BASEADDR+0x48

module apb_soc_ctrl
#(
    parameter APB_ADDR_WIDTH = 12,  //APB slaves are 4KB by default
    parameter N_CLUSTERS = 1,       //N_CLUSTERS
    parameter N_CORES = 4           //N_CORES
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

    output logic                      margin_l2_mem_en,
    output logic                [2:0] margin_l2_mem,

    output logic                      clock_enable,
    output logic                      cluster_sw_rstn,
    output logic                      cluster_sd_ready,
    input  logic                      cluster_busy,
    input  logic                      cluster_wakeup_event,

    output logic                [7:0] clk_div0,
    output logic                      clk_div0_valid,
    output logic                [7:0] clk_div1,
    output logic                      clk_div1_valid,

    output logic         [32:0] [5:0] pad_cfg,
    output logic               [32:0] pad_mux
);

    logic  [7:0] r_clkdiv0;
    logic  [7:0] r_clkdiv1;
    logic [31:0] r_pwr_reg;
    logic [31:0] r_pad_fun0;
    logic [31:0] r_pad_fun1;
    logic        r_margin_l2_mem_en;
    logic [2:0]  r_margin_l2_mem;

    logic  [4:0] s_apb_addr;

    logic [15:0] n_cores;
    logic [15:0] n_clusters;

    logic        r_wakeup_pol;
    logic  [9:0] r_busy_wait;
    logic  [9:0] r_rst_wait;

    logic         r_power_down_req;
    logic         r_cluster_rst_req;

    power_manager power_manager_i
    (
        .clk_i(HCLK),
        .rstn_i(HRESETn),
        .power_down_req_i(r_power_down_req),
        .cluster_rst_req_i(r_cluster_rst_req),
        .cluster_busy_i(cluster_busy),
        .wakeup_event_i(cluster_wakeup_event),
        .cfg_wakeup_polarity_i(r_wakeup_pol),
        .cfg_busy_cycle_i(r_busy_wait),
        .cfg_rst_cycle_i(r_rst_wait),
        .power_down_o(cluster_sd_ready),
        .cluster_rstn_o(cluster_sw_rstn),
        .clock_enable_o(clock_enable)
    );


    assign s_apb_addr = PADDR[6:2];

    always_ff @ (posedge HCLK, negedge HRESETn) 
    begin
        if(~HRESETn)
        begin
            r_power_down_req    = 1'b0;
            r_cluster_rst_req   = 1'b0;
            r_clkdiv0          <=  '0;
            r_clkdiv1          <=  '0;
            clk_div0_valid      = 1'b0;
            clk_div1_valid      = 1'b0;
            r_pad_fun0         <=  '0;
            r_pad_fun1         <=  '0;
            r_margin_l2_mem_en <= 1'b0;
            r_margin_l2_mem    <=  '0;
            r_pwr_reg          <=  '0;
            pad_cfg[0]         <= 6'b000111; //pad sspi_sio0
            pad_cfg[1]         <= 6'b000111; //pad sspi_sio1
            pad_cfg[2]         <= 6'b000111; //pad sspi_sio2
            pad_cfg[3]         <= 6'b000111; //pad sspi_sio3
            pad_cfg[4]         <= 6'b000000; //pad sspi_csn
            pad_cfg[5]         <= 6'b000000; //pad sspi_sck
            pad_cfg[6]         <= 6'b000111; //pad mspi_sio0
            pad_cfg[7]         <= 6'b000111; //pad mspi_sio1
            pad_cfg[8]         <= 6'b000111; //pad mspi_sio2
            pad_cfg[9]         <= 6'b000111; //pad mspi_sio3
            pad_cfg[10]        <= 6'b000111; //pad mspi_csn
            pad_cfg[11]        <= 6'b000111; //pad mspi_sck
            pad_cfg[12]        <= 6'b000111; //pad uart_tx
            pad_cfg[13]        <= 6'b000000; //pad uart_rx
            pad_cfg[14]        <= 6'b000111; //pad uart_cts
            pad_cfg[15]        <= 6'b000000; //pad uart_rts
            pad_cfg[16]        <= 6'b000111; //pad i2c_sda
            pad_cfg[17]        <= 6'b000111; //pad i2c_scl
            pad_cfg[18]        <= 6'b000111; //pad audio_i2s_ws
            pad_cfg[19]        <= 6'b000111; //pad audio_i2s_sck
            pad_cfg[20]        <= 6'b000000; //pad audio_i2s_sdi0
            pad_cfg[21]        <= 6'b000000; //pad audio_i2s_sdi1
            pad_cfg[22]        <= 6'b000000; //pad audio_i2s_sdi2
            pad_cfg[23]        <= 6'b000000; //pad audio_i2s_sdi3
            pad_cfg[24]        <= 6'b000000; //pad audio_i2s_sdi4
            pad_cfg[25]        <= 6'b000000; //pad audio_i2s_sdi5
            pad_cfg[26]        <= 6'b000000; //pad audio_i2s_sdi6
            pad_cfg[27]        <= 6'b000000; //pad audio_i2s_sdi7
            pad_cfg[28]        <= 6'b000111; //pad cam_i2s_sck
            pad_cfg[29]        <= 6'b000111; //pad cam_i2s_ws
            pad_cfg[30]        <= 6'b000000; //pad cam_i2s_sdi0
            pad_cfg[31]        <= 6'b000000; //pad cam_i2s_sdi1
            pad_cfg[32]        <= 6'b000000; //pad power_down
            r_busy_wait        <= 10'hF;
            r_rst_wait         <= 10'hF;
            r_wakeup_pol       <= 1'b1;
        end
        else
        begin
            clk_div0_valid     = 1'b0;
            clk_div1_valid     = 1'b0;
            r_power_down_req   = 1'b0;
            r_cluster_rst_req  = 1'b0;

            if (PSEL && PENABLE && PWRITE)
            begin
                case (s_apb_addr)
                `REG_PADFUN0:
                    r_pad_fun0 <= PWDATA;
                `REG_PADFUN1:
                    r_pad_fun1 <= PWDATA;
                `REG_CLKDIV0:
                begin
                    r_clkdiv0      <= PWDATA[7:0];
                    clk_div0_valid  = 1'b1;
                end
                `REG_CLKDIV1:
                begin
                    r_clkdiv1      <= PWDATA[7:0];
                    clk_div1_valid  = 1'b1;
                end
                `REG_MMARGIN:
                begin
                    r_margin_l2_mem_en <= PWDATA[0];
                    r_margin_l2_mem    <= PWDATA[3:1];
                end
                `REG_PADCFG0:
                begin
                    pad_cfg[0]         <= PWDATA[4:0];   //pad sspi_sio0
                    pad_cfg[1]         <= PWDATA[12:8];  //pad sspi_sio1
                    pad_cfg[2]         <= PWDATA[20:16]; //pad sspi_sio2
                    pad_cfg[3]         <= PWDATA[28:24]; //pad sspi_sio3
                end
                `REG_PADCFG1:
                begin
                    pad_cfg[4]         <= PWDATA[4:0];   //pad sspi_csn
                    pad_cfg[5]         <= PWDATA[12:8];  //pad sspi_sck
                    pad_cfg[6]         <= PWDATA[20:16]; //pad mspi_sio0
                    pad_cfg[7]         <= PWDATA[28:24]; //pad mspi_sio1
                end
                `REG_PADCFG2:
                begin
                    pad_cfg[8]         <= PWDATA[4:0];   //pad mspi_sio2
                    pad_cfg[9]         <= PWDATA[12:8];  //pad mspi_sio3
                    pad_cfg[10]        <= PWDATA[20:16]; //pad mspi_csn
                    pad_cfg[11]        <= PWDATA[28:24]; //pad mspi_sck
                end
                `REG_PADCFG3:
                begin
                    pad_cfg[12]        <= PWDATA[4:0];   //pad uart_tx
                    pad_cfg[13]        <= PWDATA[12:8];  //pad uart_rx
                    pad_cfg[14]        <= PWDATA[20:16]; //pad uart_cts
                    pad_cfg[15]        <= PWDATA[28:24]; //pad uart_rts
                end
                `REG_PADCFG4:
                begin
                    pad_cfg[16]        <= PWDATA[4:0];   //pad i2c_sda
                    pad_cfg[17]        <= PWDATA[12:8];  //pad i2c_scl
                    pad_cfg[18]        <= PWDATA[20:16]; //pad audio_i2s_ws
                    pad_cfg[19]        <= PWDATA[28:24]; //pad audio_i2s_sck
                end
                `REG_PADCFG5:
                begin
                    pad_cfg[20]        <= PWDATA[4:0];   //pad audio_i2s_sdi0
                    pad_cfg[21]        <= PWDATA[12:8];  //pad audio_i2s_sdi1
                    pad_cfg[22]        <= PWDATA[20:16]; //pad audio_i2s_sdi2
                    pad_cfg[23]        <= PWDATA[28:24]; //pad audio_i2s_sdi3
                end
                `REG_PADCFG6:
                begin
                    pad_cfg[24]        <= PWDATA[4:0];   //pad audio_i2s_sdi4
                    pad_cfg[25]        <= PWDATA[12:8];  //pad audio_i2s_sdi5
                    pad_cfg[26]        <= PWDATA[20:16]; //pad audio_i2s_sdi6
                    pad_cfg[27]        <= PWDATA[28:24]; //pad audio_i2s_sdi7
                end
                `REG_PADCFG7:
                begin
                    pad_cfg[28]        <= PWDATA[4:0];   //pad cam_i2s_sck
                    pad_cfg[29]        <= PWDATA[12:8];  //pad cam_i2s_ws
                    pad_cfg[30]        <= PWDATA[20:16]; //pad cam_i2s_sdi0
                    pad_cfg[31]        <= PWDATA[28:24]; //pad cam_i2s_sdi1
                end
                `REG_PADCFG8:
                begin
                    pad_cfg[32]        <= PWDATA[4:0];   //pad power_down
                end
                `REG_PWRCMD:
                begin
                    r_power_down_req    = PWDATA[0];
                    r_cluster_rst_req   = PWDATA[1];
                end
                `REG_PWRCFG:
                begin
                    r_wakeup_pol       <= PWDATA[31];
                    r_busy_wait        <= PWDATA[9:0];
                    r_rst_wait         <= PWDATA[25:16];
                end
                `REG_PWRREG:
                begin
                    r_pwr_reg          <= PWDATA;
                end
                endcase
            end
        end
    end //always

    always_comb
    begin
        case (s_apb_addr)
        `REG_PADFUN0:
            PRDATA = r_pad_fun0;
        `REG_PADFUN1:
            PRDATA = {31'h0,r_pad_fun1[0]};
        `REG_CLKDIV0:
            PRDATA = {24'h0,r_clkdiv0};
        `REG_CLKDIV1:
            PRDATA = {24'h0,r_clkdiv1};
        `REG_INFO:
            PRDATA = {n_cores,n_clusters};
        `REG_MMARGIN:
            PRDATA = {28'h0,r_margin_l2_mem,r_margin_l2_mem_en};
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
            PRDATA = {2'b00,pad_cfg[27],2'b00,pad_cfg[26],2'b00,pad_cfg[25],2'b00,pad_cfg[24]};
        `REG_PADCFG7:
            PRDATA = {2'b00,pad_cfg[31],2'b00,pad_cfg[30],2'b00,pad_cfg[29],2'b00,pad_cfg[28]};
        `REG_PADCFG8:
            PRDATA = {24'h0,2'b00,pad_cfg[32]};
        `REG_PWRCFG:
            PRDATA = {r_wakeup_pol,5'h0,r_rst_wait,6'h0,r_busy_wait};
        `REG_PWRREG:
            PRDATA = r_pwr_reg;
        default:
            PRDATA = 'h0;
        endcase
    end

    assign margin_l2_mem_en = r_margin_l2_mem_en;
    assign margin_l2_mem    = r_margin_l2_mem;

    assign clk_div0 = r_clkdiv0;
    assign clk_div1 = r_clkdiv1;

    assign pad_mux = {r_pad_fun1[0],r_pad_fun0};

    assign n_cores    = N_CORES;
    assign n_clusters = N_CLUSTERS;

    assign PREADY  = 1'b1;
    assign PSLVERR = 1'b0;

endmodule

