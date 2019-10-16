`include "noc_parameters.v"

module axi_ni_response_payload_register(clk, rst, flit, sample_payload, flit_count, received_response, received_data);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter ENDIANNESS = `LITTLE_ENDIAN;
    `include "ni_parameters.v"

    input clk;
    input rst;
    input [FLIT_WIDTH - 1 : 0] flit;
    input sample_payload;
    input [`COUNTERFLITWD - 1 : 0] flit_count;
    output [`PACKETRESPONSEWD - 1 : 0] received_response;
    output [`PACKETREADDATAWD - 1 : 0] received_data;
    reg [RESP_PAYLOADLENGTH - 1 : 0] payload;
    wire [`PACKETREADDATAWD - 1 : 0] packet_data;

    integer loop1;
    integer loop2;

    always @(posedge clk `RESET_SENSITIVITY)
    begin: store_payload
        if (rst == `RESET_ACTIVE_VALUE)
            payload <= 0;
        else
            for (loop1 = 0; loop1 < MAX_RESP_PAYLOADFLITS; loop1 = loop1 + 1)
                if (sample_payload && ($unsigned(loop1) == flit_count))
                    for (loop2 = 0; loop2 < BASE_WIDTH; loop2 = loop2 + 1)
                        payload[BASE_WIDTH * loop1 + loop2] <= flit[`FTYPEWD + loop2];
    end

    assign received_response = payload[RP_RESP_BASE_RESP + `PACKETRESPONSEWD - 1 : RP_RESP_BASE_RESP];
    assign packet_data = payload[RP_RESP_BASE_DATA + `PACKETREADDATAWD - 1 : RP_RESP_BASE_DATA];

    genvar i;
    generate
        for (i = 0; i < (`PACKETREADDATAWD / 8); i = i + 1)
        begin: generate_received_data
            assign received_data[i * 8 + 7 : i * 8] = (ENDIANNESS == `LITTLE_ENDIAN ? packet_data[i * 8 + 7 : i * 8] : packet_data[(`PACKETREADDATAWD / 8 - 1 - i) * 8 + 7 : (`PACKETREADDATAWD / 8 - 1 - i) * 8]);
        end
    endgenerate

endmodule

