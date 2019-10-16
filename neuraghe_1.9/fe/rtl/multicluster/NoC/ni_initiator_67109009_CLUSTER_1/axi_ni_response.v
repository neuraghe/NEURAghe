`include "noc_parameters.v"

module axi_ni_response(noc_clk, core_clk, rst, flit, valid, response_awaited, wait_read_response, transaction_target, stall, full_response, decr_outs_wr_cntr, decr_outs_rd_cntr, BID, BRESP, BVALID, BREADY, RID, RDATA, RRESP, RLAST, RVALID, RREADY);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter MAX_SUPPORTED_IDS = 16;
    parameter AXIRDATAWD = 32;
    parameter ENDIANNESS = `LITTLE_ENDIAN;
    `include "axi_parameters.v"
    `include "ni_parameters.v"

    input noc_clk;
    input core_clk;
    input rst;
    input [FLIT_WIDTH - 1 : 0] flit;
    input valid;
    input [MAX_SUPPORTED_IDS - 1 : 0] response_awaited;
    input wait_read_response;
    input [`SOURCEWD - 1 : 0] transaction_target;
    output stall;
    output full_response;
    output [MAX_SUPPORTED_IDS - 1 : 0] decr_outs_wr_cntr;
    output [MAX_SUPPORTED_IDS - 1 : 0] decr_outs_rd_cntr;
    output [`AXIIDWD - 1 : 0] BID;
    output [`AXIRESPWD - 1 : 0] BRESP;
    output BVALID;
    input BREADY;
    output [`AXIIDWD - 1 : 0] RID;
    output [AXIRDATAWD - 1 : 0] RDATA;
    output [`AXIRESPWD - 1 : 0] RRESP;
    output RLAST;
    output RVALID;
    input RREADY;
    wire mask_response;
    wire [`PACKETRESPONSEWD - 1 : 0] received_response;
    wire [`PACKETREADDATAWD - 1 : 0] received_data;
    wire [`PACKETTRANSIDWD - 1 : 0] received_id;
    wire sample_payload;
    wire [`COUNTERFLITWD - 1 : 0] flit_count;
    wire processing_response;
    wire [`SOURCEWD - 1 : 0] message_source;
    wire packet_type_is_read;
    wire message_is_locked;
    wire full_header;
    wire full_payload;
    wire packet_finished;
    wire receiving_header;
    wire receiving_payload;
    wire clear_flit_count;
    wire sample_header;
    wire [`COUNTERFLITWD - 1 : 0] header_flits;
    wire [`COUNTERFLITWD - 1 : 0] read_payload_flits;
    wire [`COUNTERFLITWD - 1 : 0] write_payload_flits;
    wire transaction_complete;

    axi_ni_response_pinout_mask #(.FLIT_WIDTH(FLIT_WIDTH), .AXIRDATAWD(AXIRDATAWD)) pinout_mask(.mask_response(mask_response), .received_response(received_response), .received_data(received_data), .packet_type_is_read(packet_type_is_read), .message_is_locked(message_is_locked), .received_id(received_id), .RID(RID), .RDATA(RDATA), .RRESP(RRESP), .RVALID(RVALID), .BID(BID), .BRESP(BRESP), .BVALID(BVALID));

    axi_ni_response_payload_register #(.FLIT_WIDTH(FLIT_WIDTH), .ENDIANNESS(ENDIANNESS)) payload_register(.clk(noc_clk), .rst(rst), .flit(flit), .sample_payload(sample_payload), .flit_count(flit_count), .received_response(received_response), .received_data(received_data));

//    ni_response_transaction_store transaction_store(.clk(core_clk), .rst(rst), .transaction_complete(transaction_complete), .response_awaited(response_awaited), .wait_read_response(wait_read_response), .processing_response(processing_response), .transaction_target(transaction_target), .message_source(message_source), .full_response(full_response), .packet_type_is_read(packet_type_is_read));

    axi_ni_response_fsm #(.FLIT_WIDTH(FLIT_WIDTH), .MAX_SUPPORTED_IDS(MAX_SUPPORTED_IDS)) fsm(.clk(core_clk), .rst(rst), .response_awaited(response_awaited), .full_header(full_header), .full_payload(full_payload), .packet_finished(packet_finished), .receiving_header(receiving_header), .receiving_payload(receiving_payload), .processing_response(processing_response), .mask_response(mask_response), .clear_flit_count(clear_flit_count), .transaction_complete(transaction_complete), .packet_type_is_read(packet_type_is_read), .received_id(received_id), .BREADY(BREADY), .RREADY(RREADY), .RLAST(RLAST), .decr_outs_wr_cntr(decr_outs_wr_cntr), .decr_outs_rd_cntr(decr_outs_rd_cntr));

    axi_ni_response_header_register #(.FLIT_WIDTH(FLIT_WIDTH)) header_register(.clk(noc_clk), .rst(rst), .flit(flit), .sample_header(sample_header), .flit_count(flit_count), .message_source(message_source), .packet_type_is_read(packet_type_is_read), .message_is_locked(message_is_locked), .received_id(received_id));

    ni_admit_control #(.FLIT_WIDTH(FLIT_WIDTH)) admit_control(.clk(noc_clk), .rst(rst), .valid(valid), .flit(flit), .clear_flit_count(clear_flit_count), .receiving_header(receiving_header), .receiving_payload(receiving_payload), .packet_type_is_read(packet_type_is_read), .header_flits(header_flits), .read_payload_flits(read_payload_flits), .write_payload_flits(write_payload_flits), .full_header(full_header), .full_payload(full_payload), .flit_count(flit_count), .stall(stall), .sample_header(sample_header), .sample_payload(sample_payload), .packet_finished(packet_finished));

    assign write_payload_flits = WRITE_RESP_PAYLOADFLITS - 1;
    assign read_payload_flits = READ_RESP_PAYLOADFLITS - 1;
    assign header_flits = RESP_HEADERFLITS - 1;

endmodule
