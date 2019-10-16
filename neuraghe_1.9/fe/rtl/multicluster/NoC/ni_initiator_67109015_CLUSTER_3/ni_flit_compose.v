`include "noc_parameters.v"

module ni_flit_compose(flit_type, is_payload, header_chunk, payload_chunk, flit);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;

    input [`FTYPEWD - 1 : 0] flit_type;
    input is_payload;
    input [BASE_WIDTH - 1 : 0] header_chunk;
    input [BASE_WIDTH - 1 : 0] payload_chunk;
    output [FLIT_WIDTH - 1 : 0] flit;
    reg [FLIT_WIDTH - 1 : 0] flit;

    always @(is_payload or header_chunk or payload_chunk or flit_type)
        begin: compose_flit
            if (is_payload)
                flit[FLIT_WIDTH - 1 : `FTYPEWD] <= payload_chunk;
            else
                flit[FLIT_WIDTH - 1 : `FTYPEWD] <= header_chunk;
            flit[`FTYPEWD - 1 : 0] <= flit_type;
        end
endmodule
