`include "noc_parameters.v"

module axi_ni_response_header_register(clk, rst, flit, sample_header, flit_count, message_source, packet_type_is_read, message_is_locked, received_id);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    `include "ni_parameters.v"

    input clk;
    input rst;
    input [FLIT_WIDTH - 1 : 0] flit;
    input sample_header;
    input [`COUNTERFLITWD - 1 : 0] flit_count;
    output [`SOURCEWD - 1 : 0] message_source;
    output packet_type_is_read;
    output message_is_locked;
    output [`PACKETTRANSIDWD  - 1 : 0] received_id;
    reg [RESP_HEADERLENGTH - 1 : 0] header;

    integer loop1;
    integer loop2;

    always @(posedge clk `RESET_SENSITIVITY)
    begin: store_header
        if (rst == `RESET_ACTIVE_VALUE)
            header <= 0;
        else
            for (loop1 = 0; loop1 < RESP_HEADERFLITS; loop1 = loop1 + 1)
                if (sample_header && ($unsigned(loop1) == flit_count))
                    for (loop2 = 0; loop2 < BASE_WIDTH; loop2 = loop2 + 1)
                        header[BASE_WIDTH * loop1 + loop2] <= flit[`FTYPEWD + loop2];
    end

    assign message_source = header[`SOURCEWD + `ROUTEWD - 1 : `ROUTEWD];
    assign packet_type_is_read = (header[RH_RESP_BASE_TYPE + `PACKETRESPTYPEWD + `SOURCEWD + `ROUTEWD - 1 : RH_RESP_BASE_TYPE + `SOURCEWD + `ROUTEWD] == `PACKETRESPTYPEREAD) || (header[RH_RESP_BASE_TYPE + `PACKETRESPTYPEWD + `SOURCEWD + `ROUTEWD - 1 : RH_RESP_BASE_TYPE + `SOURCEWD + `ROUTEWD] == `PACKETRESPTYPEEXREAD);
    assign message_is_locked = (header[RH_RESP_BASE_TYPE + `PACKETRESPTYPEWD + `SOURCEWD + `ROUTEWD - 1 : RH_RESP_BASE_TYPE + `SOURCEWD + `ROUTEWD] == `PACKETRESPTYPEEXREAD) || (header[RH_RESP_BASE_TYPE + `PACKETRESPTYPEWD + `SOURCEWD + `ROUTEWD - 1 : RH_RESP_BASE_TYPE + `SOURCEWD + `ROUTEWD] == `PACKETRESPTYPEEXWRITE);
    assign received_id = header[RH_RESP_BASE_TRANS_ID + `PACKETTRANSIDWD + `SOURCEWD + `ROUTEWD - 1 : RH_RESP_BASE_TRANS_ID + `SOURCEWD + `ROUTEWD];

endmodule
