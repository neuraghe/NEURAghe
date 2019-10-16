/****************************************************************************
 * i2s_rx.sv
 ****************************************************************************/

/**
 * Module: i2s_rx
 * 
 * TODO: Add module documentation
 */
`define log2(VALUE) ((VALUE) < ( 1 ) ? 0 : (VALUE) < ( 2 ) ? 1 : (VALUE) < ( 4 ) ? 2 : (VALUE) < ( 8 ) ? 3 : (VALUE) < ( 16 )  ? 4 : (VALUE) < ( 32 )  ? 5 : (VALUE) < ( 64 )  ? 6 : (VALUE) < ( 128 ) ? 7 : (VALUE) < ( 256 ) ? 8 : (VALUE) < ( 512 ) ? 9 : (VALUE) < ( 1024 ) ? 10 : (VALUE) < ( 2048 ) ? 11 : (VALUE) < ( 4096 ) ? 12 : (VALUE) < ( 8192 ) ? 13 : (VALUE) < ( 16384 ) ? 14 : (VALUE) < ( 32768 ) ? 15 : (VALUE) < ( 65536 ) ? 16 : (VALUE) < ( 131072 ) ? 17 : (VALUE) < ( 262144 ) ? 18 : (VALUE) < ( 524288 ) ? 19 : (VALUE) < ( 1048576 ) ? 20 : (VALUE) < ( 1048576 * 2 ) ? 21 : (VALUE) < ( 1048576 * 4 ) ? 22 : (VALUE) < ( 1048576 * 8 ) ? 23 : (VALUE) < ( 1048576 * 16 ) ? 24 : 25)

module i2s_rx 
#(
    parameter NUM_CHANNELS = 1  //number of i2s channels
)
(
    input  logic                    clk_i,
    input  logic                    rstn_i,
    input  logic                    ext_sck_i,
    input  logic                    ext_ws_i,
    input  logic [NUM_CHANNELS-1:0] ext_sd_i,
    output logic                    ext_sck_o,
    output logic                    ext_ws_o,
    output logic             [31:0] fifo_data_o,
    output logic                    fifo_data_valid_o,
    input  logic                    fifo_data_ready_i,
    input  logic                    cfg_enable_i,
    input  logic                    cfg_pdm_en_i,
    input  logic                    cfg_pdm_ddr_i,
    input  logic                    cfg_lsbfirst_i,
    input  logic                    cfg_sample_word_i,
    input  logic                    cfg_gen_clk_en_i,
    input  logic             [10:0] cfg_gen_clk_div_i,
    input  logic              [5:0] cfg_bits_word_i,
    input  logic              [5:0] cfg_ws_time_i,
    input  logic                    cfg_ws_value_i,
    input  logic                    cfg_ws_fix_i
);

    genvar i;

    logic s_en_clkgen;
    logic s_fall;
    logic s_rise;
    logic s_shift;
    logic s_shift_fifow;
    logic [NUM_CHANNELS-1:0] [31:0] s_data;
    logic running;
    logic [`log2(NUM_CHANNELS)-1:0] chan_count;
    logic s_dataready;
    logic s_32bitsready;
    logic s_wordready;

    logic [5:0] s_bitcount;
    logic [5:0] s_bitcountword;
    logic [5:0] s_bitcountreg;

    //if 32bit at the time are written to fifo use the fifow_counter
    assign s_shift_fifow = (cfg_pdm_en_i || !cfg_sample_word_i) ? s_shift : 1'b0;
    assign s_dataready   = (cfg_pdm_en_i || !cfg_sample_word_i) ? s_32bitsready : s_wordready;
    assign s_bitcount    = (cfg_pdm_en_i || !cfg_sample_word_i) ? s_bitcountword : s_bitcountreg;

    io_clk_gen
        #(.COUNTER_WIDTH(11)
    ) 
    i_clk_gen
    (
        .clk_i(clk_i),
        .rstn_i(rstn_i),
        .en_i(cfg_enable_i),
        .clk_div_i(cfg_gen_clk_div_i),
        .clk_o(ext_sck_o),
        .fall_o(s_fall),
        .rise_o(s_rise)
    );

    //counts how many bits in the current word are sampled
    io_event_counter 
        #(.COUNTER_WIDTH(6)
    ) 
    i_bit_counter 
    (
        .clk_i(clk_i),
        .rstn_i(rstn_i),
        .event_i(s_shift),
        .counter_rst_i(~cfg_enable_i),
        .counter_target_i(cfg_bits_word_i),
        .counter_value_o(s_bitcountreg),
        .counter_trig_o(s_wordready)
    );

    //counts up to 32 bits rx when each word is not sent to fifo
    io_event_counter 
        #(.COUNTER_WIDTH(6)
    ) 
    i_fifow_counter 
    (
        .clk_i(clk_i),
        .rstn_i(rstn_i),
        .event_i(s_shift_fifow),
        .counter_rst_i(~cfg_enable_i),
        .counter_target_i(6'd32),
        .counter_value_o(s_bitcountword),
        .counter_trig_o(s_32bitsready)
    );

    generate
        for ( i = 0; i < NUM_CHANNELS; i++ ) 
        begin
            io_shiftreg 
                #(.DATA_WIDTH(32)
            ) 
            i_shiftreg 
            (
                .clk_i(clk_i),
                .rstn_i(rstn_i),
                .data_i(32'h0),
                .data_o(s_data[i]),
                .serial_i(ext_sd_i[i]),
                .serial_o(),
                .load_i(~cfg_enable_i),
                .shift_i(s_shift),
                .lsbfirst_i(cfg_lsbfirst_i)
            );
        end
    endgenerate

    always_comb
    begin
        if (cfg_pdm_en_i && cfg_pdm_ddr_i)
            s_shift = s_fall | s_rise; //if pdm ddr enabled sample data at each edge
        else
            s_shift = s_rise; 
    end

    always_comb
    begin
        fifo_data_o = 32'hDEADBEEF;
        for (int j=0;j<NUM_CHANNELS;j=j+1)
        begin
            if (chan_count == j)
              fifo_data_o = s_data[j];
        end
    end

    //Dump Shift Regs to FIFO
    always_ff  @(posedge clk_i, negedge rstn_i)
    begin
        if (rstn_i == 1'b0)
        begin
            running    <= 1'b0;
            chan_count <=  '0;
        end
        else
        begin
            if (s_dataready) //when data available start sending it to FIFO
                running <= 1'b1;
            else
            begin
                if (chan_count == (NUM_CHANNELS-1)) //stop when datas of all channels have been sent
                    running <= 1'b0;
            end

            if (running)
            begin
//                if(fifo_data_ready_i) //a channel is done when received a ready from fifo
//                begin
                    if (chan_count == (NUM_CHANNELS-1))
                        chan_count <= '0;
                    else
                        chan_count <= chan_count + 1;
//                end
            end
        end
    end

    //Generate WS signal
    always_ff  @(posedge clk_i, negedge rstn_i)
    begin
        if (rstn_i == 1'b0)
            ext_ws_o   <= 1'b0;
        else
        begin
            if (cfg_enable_i)
            begin
                if (cfg_ws_fix_i) //if WS fix then assign proper value
                    ext_ws_o   <= cfg_ws_value_i;
                else
                    if ((s_bitcount == cfg_ws_time_i) && s_fall)
                        ext_ws_o   <= ~ext_ws_o;
            end
            else
                ext_ws_o   <= 1'b0;
        end 
    end

    assign fifo_data_valid_o = running;

endmodule

