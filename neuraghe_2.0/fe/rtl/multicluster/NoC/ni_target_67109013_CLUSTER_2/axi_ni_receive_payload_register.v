`include "noc_parameters.v"

module axi_ni_receive_payload_register(clk, rst, flit, sample_payload, flit_count, received_byte_enables_payload, received_data);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter ENDIANNESS = `LITTLE_ENDIAN;
    `include "ni_parameters.v"

    input clk;
    input rst;
    input [FLIT_WIDTH - 1 : 0] flit;
    input sample_payload;
    input [`COUNTERFLITWD - 1 : 0] flit_count;
    output [`PACKETBYTEENABLEWD - 1 : 0] received_byte_enables_payload;
    output [`PACKETWRITEDATAWD - 1 : 0] received_data;
    reg [REQ_PAYLOADLENGTH - 1 : 0] payload;
    wire [`PACKETWRITEDATAWD - 1 : 0] packet_data;

    integer loop1;
    integer loop2;

    always @(posedge clk `RESET_SENSITIVITY)
        begin: store_payload
            if (rst == `RESET_ACTIVE_VALUE)
                payload <= 0;
            else
                for (loop1 = 0; loop1 < MAX_REQ_PAYLOADFLITS; loop1 = loop1 + 1)
                    if (sample_payload && ($unsigned(loop1) == flit_count))
                        for (loop2 = 0; loop2 < BASE_WIDTH; loop2 = loop2 + 1)
                            payload[BASE_WIDTH * loop1 + loop2] <= flit[`FTYPEWD + loop2];
        end

    assign received_byte_enables_payload = payload[RP_REQ_BASE_BE   + `PACKETBYTEENABLEWD  - 1 : RP_REQ_BASE_BE];
    assign packet_data                   = payload[RP_REQ_BASE_DATA + `PACKETWRITEDATAWD   - 1 : RP_REQ_BASE_DATA];

    genvar i;
    generate
        for (i = 0; i < (`PACKETWRITEDATAWD / 8); i = i + 1)
        begin: generate_received_data
            assign received_data[i * 8 + 7 : i * 8] = (ENDIANNESS == `LITTLE_ENDIAN ? packet_data[i * 8 + 7 : i * 8] : packet_data[(`PACKETWRITEDATAWD / 8 - 1 - i) * 8 + 7 : (`PACKETWRITEDATAWD / 8 - 1 - i) * 8]);
        end
    endgenerate

endmodule

