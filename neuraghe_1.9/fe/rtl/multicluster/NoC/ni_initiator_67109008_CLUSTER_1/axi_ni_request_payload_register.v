`include "noc_parameters.v"

module axi_ni_request_payload_register(clk, rst, byte_enables, WDATA, sample_payload, payload);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter AXIWDATAWD = 32;
    parameter ENDIANNESS = `LITTLE_ENDIAN;
    `include "ni_parameters.v"

    input clk;
    input rst;
    input [`PACKETBYTEENABLEWD - 1 : 0] byte_enables;
    input [AXIWDATAWD - 1 : 0] WDATA;
    input sample_payload;
    output [REQ_PAYLOADLENGTH - 1 : 0] payload;
    reg [`PACKETBYTEENABLEWD - 1 : 0] reg_ben;
    reg [`PACKETWRITEDATAWD - 1 : 0] reg_data;
    wire [AXIWDATAWD - 1 : 0] little_endian_data;

    always @(posedge clk `RESET_SENSITIVITY)
    begin: store_payload
        if (rst == `RESET_ACTIVE_VALUE)
        begin
            reg_ben <= 'h0;
            reg_data <= 'h0;
        end
        else
        begin
            if (sample_payload)
            begin
                reg_ben <= byte_enables;
                reg_data <= little_endian_data;
            end
        end
    end

    generate
    if (REQ_PAYLOADLENGTH > MAX_RP_REQ_WD)
        assign payload[REQ_PAYLOADLENGTH - 1 : MAX_RP_REQ_WD] = 'h0;
    endgenerate
    assign payload[RP_REQ_BASE_BE   + `PACKETBYTEENABLEWD  - 1 : RP_REQ_BASE_BE] = reg_ben;
    assign payload[RP_REQ_BASE_DATA + `PACKETWRITEDATAWD   - 1 : RP_REQ_BASE_DATA] = reg_data;

    genvar i;
    generate
        for (i = 0; i < (AXIWDATAWD / 8); i = i + 1)
        begin: generate_little_endian_data
            assign little_endian_data[i * 8 + 7 : i * 8] = (ENDIANNESS == `LITTLE_ENDIAN ? WDATA[i * 8 + 7 : i * 8] : WDATA[(AXIWDATAWD / 8 - 1 - i) * 8 + 7 : (AXIWDATAWD / 8 - 1 - i) * 8]);
        end
    endgenerate

endmodule

