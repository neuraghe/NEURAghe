`include "noc_parameters.v"

module axi_ni_resend(core_clk, noc_clk, Clock_div, rst, new_packet_type_is_read, new_message_source, new_message_is_locked, wrr_winc, rdr_winc, wrr_wfull, rdr_wfull, stall, start_receive_response, valid, flit, enable_new_request, SOURCE, lut_address, lut_path, BID, BRESP, BVALID, BREADY, RID, RDATA, RRESP, RLAST, RVALID, RREADY);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter AXIRDATAWD = 32;
    parameter ENDIANNESS = `LITTLE_ENDIAN;
    parameter MAX_SUPPORTED_IDS = 16;
    parameter ID_MAP = 16'b1111111111111111;
    parameter LOG_BR_FIFO_DEPTH = 2;
    parameter LOG_RR_FIFO_DEPTH = 2;
    parameter LOG_MAX_OUTSTANDING_WRITES_PER_ID = 4;
    parameter LOG_MAX_OUTSTANDING_READS_PER_ID = 0;
    `include "axi_parameters.v"
    `include "ni_parameters.v"

    input core_clk;
    input noc_clk;
    input [`COUNTERWD - 1 : 0] Clock_div;
    input rst;
    input new_packet_type_is_read;
    input [`SOURCEWD - 1 : 0] new_message_source;
    input new_message_is_locked;
    input [MAX_SUPPORTED_IDS - 1 : 0] wrr_winc;
    input [MAX_SUPPORTED_IDS - 1 : 0] rdr_winc;
    output [MAX_SUPPORTED_IDS - 1 : 0] wrr_wfull;
    output [MAX_SUPPORTED_IDS - 1 : 0] rdr_wfull;
    input stall;
    input start_receive_response;
    output valid;
    output [FLIT_WIDTH - 1 : 0] flit;
    output enable_new_request;
    input [`SOURCEWD - 1 : 0] SOURCE;
    output [`SOURCEWD - 1 : 0] lut_address;
    input [`ROUTEWD - 1 : 0] lut_path;
    input [`AXIIDWD - 1 : 0] BID;
    input [`AXIRESPWD - 1 : 0] BRESP;
    input BVALID;
    output BREADY;
    input [`AXIIDWD - 1 : 0] RID;
    input [AXIRDATAWD - 1 : 0] RDATA;
    input [`AXIRESPWD - 1 : 0] RRESP;
    input RLAST;
    input RVALID;
    output RREADY;
    wire send_message;
    wire [`COUNTERFLITWD - 1 : 0] num_flit_to_transmit;
    wire last_clock_beat;
    wire tx_gone;
    wire [`COUNTERFLITWD - 1 : 0] flit_counter;
    wire packet_type_is_read;
    wire message_is_locked;
    wire [RESP_PAYLOADLENGTH - 1 : 0] payload;
    wire is_payload;
    wire [BASE_WIDTH - 1 : 0] payload_chunk;
    wire sample_payload;
    wire [RESP_HEADERLENGTH - 1 : 0] header;
    wire [BASE_WIDTH - 1 : 0] header_chunk;
    wire sample_header;
    wire [`FTYPEWD - 1 : 0] flit_sequence;
    wire [`FTYPEWD - 1 : 0] flit_type;

    wire [MAX_SUPPORTED_IDS - 1 : 0]      br_rempty;
    wire [MAX_SUPPORTED_IDS - 1 : 0]      br_wfull;
    wire [MAX_SUPPORTED_IDS - 1 : 0]      br_winc;
    wire [MAX_SUPPORTED_IDS - 1 : 0]      br_rinc;
    wire [`AXIRESPWD - 1 : 0]             br_rdata[MAX_SUPPORTED_IDS - 1 : 0];

    wire [MAX_SUPPORTED_IDS - 1 : 0]      rr_rempty;
    wire [MAX_SUPPORTED_IDS - 1 : 0]      rr_wfull;
    wire [MAX_SUPPORTED_IDS - 1 : 0]      rr_winc;
    wire [MAX_SUPPORTED_IDS - 1 : 0]      rr_rinc;
    wire [1 + `AXIRESPWD + AXIRDATAWD - 1 : 0] rr_rdata[MAX_SUPPORTED_IDS - 1 : 0];

    wire [MAX_SUPPORTED_IDS - 1 : 0]      wrr_rempty;
    wire [MAX_SUPPORTED_IDS - 1 : 0]      wrr_rinc;
    wire [`SOURCEWD : 0]                  wrr_rdata[MAX_SUPPORTED_IDS - 1 : 0];

    wire [MAX_SUPPORTED_IDS - 1 : 0]      rdr_rempty;
    wire [MAX_SUPPORTED_IDS - 1 : 0]      rdr_rinc;
    wire [`SOURCEWD : 0]                  rdr_rdata[MAX_SUPPORTED_IDS - 1 : 0];

    wire [`AXIIDWD - 1 : 0] atid;

    wire [`AXIRESPWD - 1 : 0] response;
    wire [AXIRDATAWD - 1 : 0] data;
    wire last_beat;
    wire [`SOURCEWD - 1 : 0] message_source;
    wire locked;
    assign response = (packet_type_is_read == 1'b0 ? br_rdata[atid][`AXIRESPWD - 1 : 0] : rr_rdata[atid][AXIRDATAWD + `AXIRESPWD - 1 : AXIRDATAWD]);
    assign data = rr_rdata[atid][AXIRDATAWD - 1 : 0];
    assign message_source = (packet_type_is_read == 1'b0 ? wrr_rdata[atid][`SOURCEWD - 1 : 0] : rdr_rdata[atid][`SOURCEWD - 1 : 0]);
    assign locked = (packet_type_is_read == 1'b0 ? wrr_rdata[atid][`SOURCEWD] : rdr_rdata[atid][`SOURCEWD]);
    assign last_beat =  rr_rdata[atid][AXIRDATAWD + `AXIRESPWD + `AXILASTWD - 1 : AXIRDATAWD + `AXIRESPWD];

    // Flow control: Write Response Channel, Read Response Channel
    assign BREADY = !br_wfull[BID];
    assign RREADY = !rr_wfull[RID];
    // Buffer control: Write Response Channel, Read Response Channel
    assign br_winc = 'h0 | ((BVALID && BREADY) ? (1 << BID) : 'h0);
    assign rr_winc = 'h0 | ((RVALID && RREADY) ? (1 << RID) : 'h0);

    // Actual buffer instantiation
    genvar i;
    generate
        for (i = 0; i < MAX_SUPPORTED_IDS; i = i + 1)
        begin: buffers
            if ((1 << i) & (ID_MAP))
            begin
                 synch_fifo #(.DSIZE(`AXIRESPWD), .ASIZE(LOG_BR_FIFO_DEPTH)) u_br_synch_fifo (.wrst(rst), .rrst(rst), .wclk(core_clk), .rclk(noc_clk), .winc(br_winc[i]), .rinc(br_rinc[i]), .wdata(BRESP), .num_stored_words(), .wfull(br_wfull[i]), .rempty(br_rempty[i]), .rdata(br_rdata[i]));
                 synch_fifo #(.DSIZE(1 + `AXIRESPWD + AXIRDATAWD), .ASIZE(LOG_RR_FIFO_DEPTH)) u_rr_synch_fifo (.wrst(rst), .rrst(rst), .wclk(core_clk), .rclk(noc_clk), .winc(rr_winc[i]), .rinc(rr_rinc[i]), .wdata({RLAST, RRESP, RDATA}), .num_stored_words(), .wfull(rr_wfull[i]), .rempty(rr_rempty[i]), .rdata(rr_rdata[i]));
                 synch_fifo #(.DSIZE(`SOURCEWD + 1), .ASIZE(LOG_MAX_OUTSTANDING_WRITES_PER_ID)) u_wrr_synch_fifo (.wrst(rst), .rrst(rst), .wclk(noc_clk), .rclk(noc_clk), .winc(wrr_winc[i]), .rinc(wrr_rinc[i]), .wdata({new_message_is_locked, new_message_source}), .num_stored_words(), .wfull(wrr_wfull[i]), .rempty(wrr_rempty[i]), .rdata(wrr_rdata[i]));
                 synch_fifo #(.DSIZE(`SOURCEWD + 1), .ASIZE(4)) u_rdr_synch_fifo (.wrst(rst), .rrst(rst), .wclk(noc_clk), .rclk(noc_clk), .winc(rdr_winc[i]), .rinc(rdr_rinc[i]), .wdata({new_message_is_locked, new_message_source}), .num_stored_words(), .wfull(rdr_wfull[i]), .rempty(rdr_rempty[i]), .rdata(rdr_rdata[i])); // TODO should be just LOG_MAX_OUTSTANDING_READS_PER_ID, but if 0 it seems to hang, and if low, it can still overflow!
            end
            else
            begin
                assign br_wfull[i]  = 1'b0;
                assign br_rempty[i] = 1'b1;
                assign br_rdata[i]  = 0;

                assign rr_wfull[i]  = 1'b0;
                assign rr_rempty[i] = 1'b1;
                assign rr_rdata[i]  = 0;

                assign wrr_wfull[i]  = 1'b0;
                assign wrr_rempty[i] = 1'b1;
                assign wrr_rdata[i]  = 0;

                assign rdr_wfull[i]  = 1'b0;
                assign rdr_rempty[i] = 1'b1;
                assign rdr_rdata[i]  = 0;
            end
        end
    endgenerate

    ni_transmit_control transmit_control(.clk(noc_clk), .rst(rst), .send_message(send_message), .num_flit_to_transmit(num_flit_to_transmit), .stall(stall), .last_clock_beat(last_clock_beat), .valid(valid), .tx_gone(tx_gone), .flit_counter(flit_counter));

    ni_resend_payload_shifter #(.FLIT_WIDTH(FLIT_WIDTH)) payload_shifter(.payload(payload), .flit_counter(flit_counter), .is_payload(is_payload), .payload_chunk(payload_chunk));

    axi_ni_resend_payload_register #(.FLIT_WIDTH(FLIT_WIDTH), .AXIRDATAWD(AXIRDATAWD), .ENDIANNESS(ENDIANNESS)) payload_register(.clk(core_clk), .rst(rst), .data(data), .response(response), .message_is_locked(message_is_locked), .sample_payload(sample_payload), .payload(payload));

    ni_resend_header_shifter #(.FLIT_WIDTH(FLIT_WIDTH)) header_shifter(.header(header), .flit_counter(flit_counter), .is_payload(is_payload), .header_chunk(header_chunk));

    axi_ni_resend_header_register #(.FLIT_WIDTH(FLIT_WIDTH)) header_register(.clk(core_clk), .rst(rst), .sample_header(sample_header), .packet_type_is_read(packet_type_is_read), .message_is_locked(message_is_locked), .id(atid), .message_source(message_source), .locked(locked), .SOURCE(SOURCE), .lut_address(lut_address), .lut_path(lut_path), .header(header));

    axi_ni_resend_fsm #(.FLIT_WIDTH(FLIT_WIDTH), .AXIRDATAWD(AXIRDATAWD), .MAX_SUPPORTED_IDS(MAX_SUPPORTED_IDS)) fsm(.clk(core_clk), .rst(rst), .last_beat(last_beat), .tx_gone(tx_gone), .br_rempty(br_rempty), .rr_rempty(rr_rempty), .rdr_rempty(rdr_rempty), .wrr_rempty(wrr_rempty), .br_rinc(br_rinc), .rr_rinc(rr_rinc), .rdr_rinc(rdr_rinc), .wrr_rinc(wrr_rinc), .is_payload(is_payload), .sample_header(sample_header), .sample_payload(sample_payload), .send_message(send_message), .flit_sequence(flit_sequence), .num_flit_to_transmit(num_flit_to_transmit), .curr_tid(atid), .packet_type_is_read(packet_type_is_read));

    ni_flit_type flit_type_unit(.flit_sequence(flit_sequence), .flit_counter(flit_counter), .num_flit_to_transmit(num_flit_to_transmit), .flit_type(flit_type));

    ni_flit_compose #(.FLIT_WIDTH(FLIT_WIDTH)) flit_compose(.flit_type(flit_type), .is_payload(is_payload), .header_chunk(header_chunk), .payload_chunk(payload_chunk), .flit(flit));

    ni_clock_synchro clock_synchro(.clk(noc_clk), .clkdiv(Clock_div), .rst(rst), .enable(send_message), .last_clock_beat(last_clock_beat));

endmodule
