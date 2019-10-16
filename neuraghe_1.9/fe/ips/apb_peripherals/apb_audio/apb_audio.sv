`define log2(VALUE) ((VALUE) < ( 1 ) ? 0 : (VALUE) < ( 2 ) ? 1 : (VALUE) < ( 4 ) ? 2 : (VALUE) < ( 8 ) ? 3 : (VALUE) < ( 16 )  ? 4 : (VALUE) < ( 32 )  ? 5 : (VALUE) < ( 64 )  ? 6 : (VALUE) < ( 128 ) ? 7 : (VALUE) < ( 256 ) ? 8 : (VALUE) < ( 512 ) ? 9 : (VALUE) < ( 1024 ) ? 10 : (VALUE) < ( 2048 ) ? 11 : (VALUE) < ( 4096 ) ? 12 : (VALUE) < ( 8192 ) ? 13 : (VALUE) < ( 16384 ) ? 14 : (VALUE) < ( 32768 ) ? 15 : (VALUE) < ( 65536 ) ? 16 : (VALUE) < ( 131072 ) ? 17 : (VALUE) < ( 262144 ) ? 18 : (VALUE) < ( 524288 ) ? 19 : (VALUE) < ( 1048576 ) ? 20 : (VALUE) < ( 1048576 * 2 ) ? 21 : (VALUE) < ( 1048576 * 4 ) ? 22 : (VALUE) < ( 1048576 * 8 ) ? 23 : (VALUE) < ( 1048576 * 16 ) ? 24 : 25)

`define REG_CMD         3'b000 //BASEADDR+0x00
`define REG_STATUS      3'b001 //BASEADDR+0x04
`define REG_INTSTATUS   3'b010 //BASEADDR+0x08
`define REG_CFG_CLK_DIV 3'b011 //BASEADDR+0x0C
`define REG_CFG_INTL    3'b100 //BASEADDR+0x10
`define REG_CFG_IP      3'b101 //BASEADDR+0x14
`define REG_FIFO        3'b110 //BASEADDR+0x18

module apb_audio 
#(
    parameter APB_ADDR_WIDTH = 12,  //APB slaves are 4KB by default
    parameter NUM_CHANNELS = 1,     //number of i2s channels
    parameter BUFFER_DEPTH = 8      //buffer depth in 32bit words for each channel
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

    input  logic                      ext_sck_i,
    input  logic                      ext_ws_i,
    input  logic   [NUM_CHANNELS-1:0] ext_sd_i,
    output logic                      ext_sck_o,
    output logic                      ext_ws_o,

    output logic                      int_o,
    output logic                      err_o
);

    logic        r_cfg_enable;
    logic        r_cfg_pdm_en;
    logic        r_cfg_pdm_ddr;
    logic        r_cfg_lsbfirst;
    logic        r_cfg_sample_word;
    logic [10:0] r_cfg_gen_clk_div;
    logic  [5:0] r_cfg_bits_word;
    logic [`log2(BUFFER_DEPTH*NUM_CHANNELS):0] r_cfg_fifo_level;
    logic [`log2(BUFFER_DEPTH*NUM_CHANNELS):0] r_cfg_fifo_cnt;
    logic [`log2(BUFFER_DEPTH*NUM_CHANNELS):0] r_cnt;
    logic        r_cfg_int_en;
    logic        r_cfg_int_cnt_en;

    logic        s_err_full;
    logic        r_err_full;
    logic        r_err_empty;
    logic        s_int;
    logic        s_rise_int;

    logic  [3:0] s_apb_addr;

    logic [31:0] s_apb_data;
    logic        s_apb_data_valid;
    logic [31:0] s_fifo_data;
    logic        s_fifo_data_valid;
    logic        s_fifo_data_ready;

    logic        s_is_read;

    logic        r_cfg_ws_fix;
    logic        r_cfg_ws_value;
    logic  [5:0] r_cfg_ws_time;

    logic        r_fifo_clr;

    logic [`log2(BUFFER_DEPTH*NUM_CHANNELS):0] s_fifo_elements;

    enum logic [2:0] { INT_ACTIVE, GEN_INT, INT_INACTIVE } r_state,s_state_next;

    assign s_apb_addr = PADDR[4:2];

    assign s_is_read =(PSEL && PENABLE && !PWRITE && (s_apb_addr == `REG_FIFO));

    assign s_rise_int = (s_fifo_elements >= r_cfg_fifo_level);

    assign s_err_full = s_fifo_data_valid & ~s_fifo_data_ready;


    always @ (posedge HCLK or negedge HRESETn) 
    begin
        if(~HRESETn) 
        begin
            r_state <= INT_ACTIVE;
        end
        else
        begin
            r_state <= s_state_next;
        end
    end

    always_comb
    begin
        s_state_next = r_state;
        s_int        = 1'b0;

        case(r_state)
        INT_ACTIVE:
        begin
            if (s_rise_int && r_cfg_int_en)
                s_state_next = GEN_INT;
        end

        GEN_INT:
        begin
            s_int = 1'b1;
            s_state_next = INT_INACTIVE;
        end

        INT_INACTIVE:
        begin
            if (r_cfg_int_cnt_en)
            begin
                if (PSEL && PENABLE && !PWRITE && (s_apb_addr == `REG_FIFO) && (r_cnt == r_cfg_fifo_cnt-1))
                    s_state_next = INT_ACTIVE;
                else
                    s_state_next = r_state;
            end
            else
            begin
                if (PSEL && PENABLE && !PWRITE && (s_apb_addr == `REG_INTSTATUS))
                    s_state_next = INT_ACTIVE;
                else
                    s_state_next = r_state;
            end
        end

        default : 
        begin
            s_state_next = r_state;
            s_int        = 1'b0;
        end
        endcase
    end


    always @ (posedge HCLK or negedge HRESETn) 
    begin
        if(~HRESETn) 
        begin
            r_cfg_enable      <= 1'b0;
            r_cfg_ws_fix      <= 1'b0;
            r_cfg_ws_value    <= 1'b0;
            r_cfg_ws_time     <=  'h0;
            r_cfg_pdm_en      <= 1'b0;
            r_cfg_pdm_ddr     <= 1'b0;
            r_cfg_lsbfirst    <= 1'b0;
            r_cfg_sample_word <= 1'b0;
            r_cfg_gen_clk_div <=  'h0;
            r_cfg_bits_word   <=  'h0;
            r_err_full        <= 1'b0; 
            r_err_empty       <= 1'b0; 
            r_cfg_fifo_level  <= NUM_CHANNELS;
            r_cfg_fifo_cnt    <=  'h0;
            r_cfg_int_en      <= 1'b0; 
            r_cfg_int_cnt_en  <= 1'b0; 
            r_fifo_clr        <= 1'b0; 
            r_cnt             <=  'h0;
        end
        else 
        begin
            if (PSEL && PENABLE && PWRITE)
            begin
                case (s_apb_addr)
                `REG_CMD:
                begin
                    r_cfg_enable      <= PWDATA[0];
                    r_fifo_clr        <= PWDATA[1];
                end

                `REG_CFG_INTL:
                begin
                    r_cfg_int_en      <= PWDATA[31];
                    r_cfg_int_cnt_en  <= PWDATA[30];
                    r_cfg_fifo_level  <= PWDATA[   `log2(BUFFER_DEPTH*NUM_CHANNELS): 0];
                    r_cfg_fifo_cnt    <= PWDATA[15+`log2(BUFFER_DEPTH*NUM_CHANNELS):16];
                    r_fifo_clr        <= 1'b0; 
                end

                `REG_CFG_IP:
                begin
                    r_cfg_gen_clk_div <= PWDATA[28:18];
                    r_cfg_bits_word   <= PWDATA[17:12];
                    r_cfg_ws_time     <= PWDATA[11:6];
                    r_cfg_ws_value    <= PWDATA[5];
                    r_cfg_ws_fix      <= PWDATA[4];
                    r_cfg_pdm_ddr     <= PWDATA[3];
                    r_cfg_pdm_en      <= PWDATA[2];
                    r_cfg_lsbfirst    <= PWDATA[1];
                    r_cfg_sample_word <= PWDATA[0];
                    r_fifo_clr        <= 1'b0; 
                end
                default:
                    r_fifo_clr        <= 1'b0; 
                endcase
            end
            else
                r_fifo_clr        <= 1'b0; 

            if (PSEL && PENABLE && !PWRITE)
            begin
                case (s_apb_addr)
                `REG_INTSTATUS: //clear err reg when reading err reg
                begin
                    r_err_empty <= 1'b0;
                    r_err_full  <= 1'b0;
                end
                `REG_FIFO:
                begin
                    if (!s_apb_data_valid) //if reading from fifo and data not ready rise an error
                        r_err_empty <= 1'b1;
                    if (r_cfg_int_cnt_en)
                    begin
                        if (r_cnt == r_cfg_fifo_cnt-1)
                            r_cnt <= 'h0;
                        else
                            r_cnt <= r_cnt + 1;
                    end
                    else
                        r_cnt <= 'h0;
                end
                default:
                begin
                    if (s_err_full) //if fifo full and data ready rise an error
                       r_err_full  <= 1'b1; 
                end
                endcase
            end
            else
            begin
                if (s_err_full) //if fifo full and data ready rise an error
                    r_err_full  <= 1'b1;
            end
        end 
    end //always

    always_comb
    begin
        case (s_apb_addr)
        `REG_CMD:
            PRDATA = {21'h0,r_cfg_enable};
        `REG_CFG_IP:
            PRDATA = {3'h0,r_cfg_gen_clk_div,r_cfg_bits_word,r_cfg_ws_time,r_cfg_ws_value,r_cfg_ws_fix,r_cfg_pdm_ddr,r_cfg_pdm_en,r_cfg_lsbfirst,r_cfg_sample_word};
        `REG_CFG_INTL:
        begin
            PRDATA = 'h0;
            PRDATA[`log2(BUFFER_DEPTH*NUM_CHANNELS): 0] = r_cfg_fifo_level;
            PRDATA[15+`log2(BUFFER_DEPTH*NUM_CHANNELS):16] = r_cfg_fifo_cnt;
            PRDATA[30] = r_cfg_int_cnt_en;
            PRDATA[31] = r_cfg_int_en;
        end
        `REG_INTSTATUS:
            PRDATA = {29'h0,r_err_full,r_err_empty,(r_state == INT_INACTIVE)};
        `REG_STATUS:
            PRDATA = s_fifo_elements;
        `REG_FIFO:
            PRDATA = s_apb_data;
        default:
            PRDATA = 'h0;
        endcase
    end

    i2s_rx 
    #(
        .NUM_CHANNELS(NUM_CHANNELS)
    )
    i_i2s_if
    (
        .clk_i(HCLK),
        .rstn_i(HRESETn),
        .ext_sck_i(ext_sck_i), 
        .ext_ws_i(ext_ws_i),
        .ext_sd_i(ext_sd_i),
        .ext_sck_o(ext_sck_o),
        .ext_ws_o(ext_ws_o),
        .fifo_data_o(s_fifo_data),
        .fifo_data_valid_o(s_fifo_data_valid),
        .fifo_data_ready_i(s_fifo_data_ready),
        .cfg_enable_i(r_cfg_enable),
        .cfg_pdm_en_i(r_cfg_pdm_en),
        .cfg_pdm_ddr_i(r_cfg_pdm_ddr),
        .cfg_lsbfirst_i(r_cfg_lsbfirst),
        .cfg_sample_word_i(r_cfg_sample_word),
        .cfg_gen_clk_div_i(r_cfg_gen_clk_div),
        .cfg_bits_word_i(r_cfg_bits_word),
        .cfg_ws_time_i(r_cfg_ws_time),
        .cfg_ws_value_i(r_cfg_ws_value),
        .cfg_ws_fix_i(r_cfg_ws_fix)
    );

    io_generic_fifo
    #(
        .DATA_WIDTH(32),
        .BUFFER_DEPTH(BUFFER_DEPTH*NUM_CHANNELS),
        .LOG_BUFFER_DEPTH(`log2(BUFFER_DEPTH*NUM_CHANNELS))
    )
    i_fifo
    (
        .clk_i(HCLK),
        .rstn_i(HRESETn),
        .clr_i(r_fifo_clr),
        .elements_o(s_fifo_elements),
        .data_o(s_apb_data),
        .valid_o(s_apb_data_valid),
        .ready_i(s_is_read),
        .valid_i(s_fifo_data_valid),
        .data_i(s_fifo_data),
        .ready_o(s_fifo_data_ready)
    );

    assign PREADY  = 1'b1;
    assign PSLVERR = 1'b0;

    assign int_o = s_int;
    assign err_o = r_err_full | r_err_empty;

endmodule

