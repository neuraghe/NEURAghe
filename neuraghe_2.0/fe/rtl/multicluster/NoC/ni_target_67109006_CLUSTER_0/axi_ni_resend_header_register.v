`include "noc_parameters.v"

module axi_ni_resend_header_register(clk, rst, sample_header, packet_type_is_read, message_is_locked, id, message_source, locked, SOURCE, lut_address, lut_path, header);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    `include "ni_parameters.v"

    input clk;
    input rst;
    input sample_header;
    input packet_type_is_read;
    output reg message_is_locked;
    input [`PACKETTRANSIDWD - 1 : 0] id;
    input [`SOURCEWD - 1 : 0] message_source;
    input locked;
    input [`SOURCEWD - 1 : 0] SOURCE;
    output reg [`SOURCEWD - 1 : 0] lut_address;
    input [`ROUTEWD - 1 : 0] lut_path;
    output [RESP_HEADERLENGTH - 1 : 0] header;

    reg [RH_RESP_WD - 1 : 0] header_int;

    always @(posedge clk `RESET_SENSITIVITY)
        begin: store_header
            if (rst == `RESET_ACTIVE_VALUE)
            begin
                lut_address <= 'h0;
                message_is_locked <= 1'b0;
                header_int <= 'h0;
            end
            else
            begin
                if (sample_header)
                begin
                    lut_address <= message_source;
                    message_is_locked <= locked;
                    header_int[(RH_RESP_BASE_TYPE     + `PACKETRESPTYPEWD) - 1 : RH_RESP_BASE_TYPE] <= {locked, ~packet_type_is_read};
                    header_int[(RH_RESP_BASE_TRANS_ID + `PACKETTRANSIDWD)  - 1 : RH_RESP_BASE_TRANS_ID] <= id;
                end
            end
        end

    generate
    if (RESP_HEADERLENGTH > RH_RESP_WD + `SOURCEWD + `ROUTEWD)
        assign header[RESP_HEADERLENGTH - 1 : RH_RESP_WD + `SOURCEWD + `ROUTEWD] = 'h0;
    endgenerate
    assign header[RH_RESP_WD + `SOURCEWD + `ROUTEWD - 1 : `SOURCEWD + `ROUTEWD] = header_int;
    assign header[`SOURCEWD + `ROUTEWD - 1 : `ROUTEWD] = SOURCE;
`ifdef SWITCH_ROUTING_DESTID
    assign header[`ROUTEWD - 1 : 0] = message_source;
`else
    assign header[`ROUTEWD - 1 : 0] = lut_path;
`endif

endmodule

