`include "noc_parameters.v"

module ni_request_header_shifter(header, flit_counter, is_payload, header_chunk);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    `include "ni_parameters.v"

    input [REQ_HEADERLENGTH - 1 : 0] header;
    input [`COUNTERFLITWD - 1 : 0] flit_counter;
    input is_payload;
    reg [BASE_WIDTH - 1 : 0] flit_array [REQ_HEADERFLITS - 1 : 0];
    reg [BASE_WIDTH - 1 : 0] flit_temp;
    output [BASE_WIDTH - 1 : 0] header_chunk;
    reg [BASE_WIDTH - 1 : 0] header_chunk;

    integer loop1;
    integer loop2;

    always @(flit_counter or is_payload or header)
        begin: select_chunk
           for (loop1 = 0; loop1 < REQ_HEADERFLITS; loop1 = loop1 + 1)
           begin
               for (loop2 = 0; loop2 < BASE_WIDTH; loop2 = loop2 + 1)
                 flit_temp[loop2] = header[BASE_WIDTH * loop1 + loop2];
               flit_array[loop1] = flit_temp;
           end

           if (!is_payload)
               header_chunk <= flit_array[flit_counter];
           else
               header_chunk <= 0;
        end

endmodule
