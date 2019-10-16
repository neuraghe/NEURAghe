`include "noc_parameters.v"

module axi_ni_resend_payload_register(clk, rst, data, response, message_is_locked, sample_payload, payload);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter AXIRDATAWD = 32;
    parameter ENDIANNESS = `LITTLE_ENDIAN;
    `include "axi_parameters.v"
    `include "ni_parameters.v"

    input clk;
    input rst;
    input [AXIRDATAWD - 1 : 0] data;
    input [`AXIRESPWD - 1 : 0] response;
    input message_is_locked;
    input sample_payload;
    output [RESP_PAYLOADLENGTH - 1 : 0] payload;
    reg [AXIRDATAWD - 1 : 0] reg_data;
    reg [`AXIRESPWD - 1 : 0] reg_resp;
    wire [AXIRDATAWD - 1 : 0] little_endian_data;

    always @(posedge clk `RESET_SENSITIVITY)
    begin: store_payload
        if (rst == `RESET_ACTIVE_VALUE)
        begin
            reg_data <= 'h0;
            reg_resp <= 'h0;
        end
        else
        begin
            if (sample_payload)
            begin
                reg_data <= little_endian_data;
                case (response)
                    `AXIRESP_OK:
                        if (message_is_locked)
                            reg_resp <= `PACKETRESPFAIL;
                        else
                            reg_resp <= `PACKETRESPDVA;
                    `AXIRESP_EXOKAY:
                        reg_resp <= `PACKETRESPDVA;
                    default:
                        reg_resp <= `PACKETRESPERR;
                endcase
            end
        end
    end

    generate
    if (RESP_PAYLOADLENGTH > MAX_RP_RESP_WD)
        assign payload[RESP_PAYLOADLENGTH - 1 : MAX_RP_RESP_WD] = 'h0;
    endgenerate
    assign payload[RP_RESP_BASE_DATA + `PACKETREADDATAWD - 1 : RP_RESP_BASE_DATA] = reg_data;
    assign payload[RP_RESP_BASE_RESP + `PACKETRESPONSEWD - 1 : RP_RESP_BASE_RESP] = reg_resp;

    genvar i;
    generate
        for (i = 0; i < (AXIRDATAWD / 8); i = i + 1)
        begin: generate_little_endian_data
            assign little_endian_data[i * 8 + 7 : i * 8] = (ENDIANNESS == `LITTLE_ENDIAN ? data[i * 8 + 7 : i * 8] : data[(AXIRDATAWD / 8 - 1 - i) * 8 + 7 : (AXIRDATAWD / 8 - 1 - i) * 8]);
        end
    endgenerate

endmodule

