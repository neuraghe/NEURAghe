`include "noc_parameters.v"

module axi_ni_request_header_register(clk, rst, aprotection, burst_length, burst_sequence, burst_increment, burst_precise, byte_enables, command, address, id, acache, alock, sample_header, SOURCE, lut_address, lut_path, header);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter ADDRESSMAPWD = 8;
    `include "axi_parameters.v"
    `include "ni_parameters.v"

    input clk;
    input rst;
    input [`AXIPROTWD - 1 : 0] aprotection;
    input [`PACKETBURSTLENGTHWD - 1 : 0] burst_length;
    input [`PACKETBURSTSEQWD - 1 : 0] burst_sequence;
    input [`PACKETBURSTINCRWD - 1 : 0] burst_increment;
    input burst_precise;
    input [`PACKETBYTEENABLEWD - 1 : 0] byte_enables;
    input [`PACKETCOMMANDWD - 1 : 0] command;
    input [`PACKETADDRESSWD - 1 : 0] address;
    input [`AXIIDWD - 1 : 0] id;
    input [`AXICACHEWD - 1 : 0] acache;
    input [`AXILOCKWD - 1 : 0] alock;
    input sample_header;
    input [`SOURCEWD - 1 : 0] SOURCE;
    input [`ROUTEWD - 1 : 0] lut_path;
    output [ADDRESSMAPWD - 1 : 0] lut_address;
    output [REQ_HEADERLENGTH - 1 : 0] header;

    reg [RH_REQ_WD - 1 : 0] header_int;

    always @(posedge clk `RESET_SENSITIVITY)
        begin: store_header
            if (rst == `RESET_ACTIVE_VALUE)
                header_int <= 0;
            else
            begin
                if (sample_header)
                begin
                    header_int[(RH_REQ_BASE_ATTRIBUTES + `PACKETATTRIBUTEWD)    - 1 : RH_REQ_BASE_ATTRIBUTES] <= {alock, acache, aprotection};
                    header_int[(RH_REQ_BASE_BLEN       + `PACKETBURSTLENGTHWD)  - 1 : RH_REQ_BASE_BLEN] <= burst_length;
                    header_int[(RH_REQ_BASE_BSEQ       + `PACKETBURSTSEQWD)     - 1 : RH_REQ_BASE_BSEQ] <= burst_sequence;
                    header_int[(RH_REQ_BASE_BINCR      + `PACKETBURSTINCRWD)    - 1 : RH_REQ_BASE_BINCR] <= burst_increment;
                    header_int[(RH_REQ_BASE_BP         + `PACKETBURSTPRECISEWD) - 1 : RH_REQ_BASE_BP] <= burst_precise;
                    header_int[(RH_REQ_BASE_BE         + `PACKETBYTEENABLEWD)   - 1 : RH_REQ_BASE_BE] <= byte_enables;
                    header_int[(RH_REQ_BASE_CMD        + `PACKETCOMMANDWD)      - 1 : RH_REQ_BASE_CMD] <= command;
                    header_int[(RH_REQ_BASE_TRANS_ID   + `PACKETTRANSIDWD)      - 1 : RH_REQ_BASE_TRANS_ID] <= 'h0 | id;
                    header_int[(RH_REQ_BASE_ADDR       + `PACKETADDRESSWD)      - 1 : RH_REQ_BASE_ADDR] <= address;
                end
            end
        end

    generate
    if (REQ_HEADERLENGTH > RH_REQ_WD + `SOURCEWD + `ROUTEWD)
        assign header[REQ_HEADERLENGTH - 1 : RH_REQ_WD + `SOURCEWD + `ROUTEWD] = 'h0;
    endgenerate
    assign header[RH_REQ_WD + `SOURCEWD + `ROUTEWD - 1 : `SOURCEWD + `ROUTEWD] = header_int;
    assign header[`SOURCEWD + `ROUTEWD - 1 : `ROUTEWD] = SOURCE;
`ifdef SWITCH_ROUTING_DESTID
    assign header[`ROUTEWD - 1 : 0] = header_int[RH_REQ_BASE_ADDR + `PACKETADDRESSWD - 1 : RH_REQ_BASE_ADDR + `PACKETADDRESSWD - `ROUTEWD];
`else
    assign header[`ROUTEWD - 1 : 0] = lut_path;
`endif
    assign lut_address = header_int[RH_REQ_BASE_ADDR + `PACKETADDRESSWD - 1 : RH_REQ_BASE_ADDR + `PACKETADDRESSWD - ADDRESSMAPWD];

endmodule
