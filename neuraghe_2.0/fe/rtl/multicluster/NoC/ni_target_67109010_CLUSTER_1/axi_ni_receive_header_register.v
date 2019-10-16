`include "noc_parameters.v"

module axi_ni_receive_header_register(clk, rst, flit, sample_header, flit_count, packet_type_is_read, message_source, received_attributes, received_burst_length, received_burst_sequence, received_burst_increment, received_burst_precise, received_byte_enables_header, received_address, received_id);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    `include "axi_parameters.v"
    `include "ni_parameters.v"

    input clk;
    input rst;
    input [FLIT_WIDTH - 1 : 0] flit;
    input sample_header;
    input [`COUNTERFLITWD - 1 : 0] flit_count;
    output packet_type_is_read;
    output [`SOURCEWD - 1 : 0] message_source;
    output [`PACKETATTRIBUTEWD - 1 : 0] received_attributes;
    output [`PACKETBURSTLENGTHWD - 1 : 0] received_burst_length;
    output [`PACKETBURSTSEQWD - 1 : 0] received_burst_sequence;
    output [`PACKETBURSTINCRWD - 1 : 0] received_burst_increment;
    output [`PACKETBURSTPRECISEWD - 1 : 0] received_burst_precise;
    output [`PACKETBYTEENABLEWD - 1 : 0] received_byte_enables_header;
    output [`PACKETADDRESSWD - 1 : 0] received_address;
    output [`PACKETTRANSIDWD - 1 : 0] received_id;
    reg [REQ_HEADERLENGTH - 1 : 0] header;

    integer loop1;
    integer loop2;

    always @(posedge clk `RESET_SENSITIVITY)
    begin: store_header
        if (rst == `RESET_ACTIVE_VALUE)
            header <= 0;
        else
            for (loop1 = 0; loop1 < REQ_HEADERFLITS; loop1 = loop1 + 1)
                if (sample_header && ($unsigned(loop1) == flit_count))
                    for (loop2 = 0; loop2 < BASE_WIDTH; loop2 = loop2 + 1)
                        header[BASE_WIDTH * loop1 + loop2] <= flit[`FTYPEWD + loop2];
    end

    assign received_attributes          = header[RH_REQ_BASE_ATTRIBUTES + `PACKETATTRIBUTEWD    + `SOURCEWD + `ROUTEWD - 1 : RH_REQ_BASE_ATTRIBUTES + `SOURCEWD + `ROUTEWD];
    assign received_burst_length        = header[RH_REQ_BASE_BLEN       + `PACKETBURSTLENGTHWD  + `SOURCEWD + `ROUTEWD - 1 : RH_REQ_BASE_BLEN       + `SOURCEWD + `ROUTEWD];
    assign received_burst_sequence      = header[RH_REQ_BASE_BSEQ       + `PACKETBURSTSEQWD     + `SOURCEWD + `ROUTEWD - 1 : RH_REQ_BASE_BSEQ       + `SOURCEWD + `ROUTEWD];
    assign received_burst_increment     = header[RH_REQ_BASE_BINCR      + `PACKETBURSTINCRWD    + `SOURCEWD + `ROUTEWD - 1 : RH_REQ_BASE_BINCR      + `SOURCEWD + `ROUTEWD];
    assign received_burst_precise       = header[RH_REQ_BASE_BP         + `PACKETBURSTPRECISEWD + `SOURCEWD + `ROUTEWD - 1 : RH_REQ_BASE_BP         + `SOURCEWD + `ROUTEWD];
    assign received_byte_enables_header = header[RH_REQ_BASE_BE         + `PACKETBYTEENABLEWD   + `SOURCEWD + `ROUTEWD - 1 : RH_REQ_BASE_BE         + `SOURCEWD + `ROUTEWD];
    assign received_id                  = header[RH_REQ_BASE_TRANS_ID   + `PACKETTRANSIDWD      + `SOURCEWD + `ROUTEWD - 1 : RH_REQ_BASE_TRANS_ID   + `SOURCEWD + `ROUTEWD];
    assign received_address             = header[RH_REQ_BASE_ADDR       + `PACKETADDRESSWD      + `SOURCEWD + `ROUTEWD - 1 : RH_REQ_BASE_ADDR       + `SOURCEWD + `ROUTEWD];
    assign message_source               = header[                                                 `SOURCEWD + `ROUTEWD - 1 : `ROUTEWD];

    assign packet_type_is_read = (header[RH_REQ_BASE_CMD + `PACKETCOMMANDWD + `SOURCEWD + `ROUTEWD - 1 : RH_REQ_BASE_CMD + `SOURCEWD + `ROUTEWD] == `PACKETCMDREAD);

endmodule

