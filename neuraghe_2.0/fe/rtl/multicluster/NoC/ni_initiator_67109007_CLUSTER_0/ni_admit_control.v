`include "noc_parameters.v"

module ni_admit_control(clk, rst, valid, flit, clear_flit_count, receiving_header, receiving_payload, packet_type_is_read, header_flits, read_payload_flits, write_payload_flits, full_header, full_payload, flit_count, stall, sample_header, sample_payload, packet_finished);

    parameter FLIT_WIDTH = 32;

    input clk;
    input rst;
    input valid;
    input [FLIT_WIDTH - 1 : 0] flit;
    input clear_flit_count;
    input receiving_header;
    input receiving_payload;
    input packet_type_is_read;
    input [`COUNTERFLITWD - 1 : 0] header_flits;
    input [`COUNTERFLITWD - 1 : 0] read_payload_flits;
    input [`COUNTERFLITWD - 1 : 0] write_payload_flits;
    output full_header;
    reg full_header;
    output full_payload;
    reg full_payload;
    output [`COUNTERFLITWD - 1 : 0] flit_count;
    reg [`COUNTERFLITWD - 1 : 0] flit_count;
    output stall;
    output sample_header;
    output sample_payload;
    output packet_finished;
    reg packet_finished;

    always @(posedge clk `RESET_SENSITIVITY)
    begin: count_flits
        if (rst == `RESET_ACTIVE_VALUE)
        begin
            flit_count <= 0;
            full_header <= 0;
            full_payload <= 0;
        end
        else
        begin
            if (clear_flit_count && (packet_finished || full_payload))
            begin
                flit_count <= 0;
                full_header <= 0;
                full_payload <= 0;
            end
            else
            begin
                if (valid)
                begin
                    if (
                         (
                           sample_payload &&
                           !(
                              (flit_count == read_payload_flits && packet_type_is_read) ||
                              (flit_count == write_payload_flits && !packet_type_is_read)
                            )
                         ) ||
                         (sample_header && flit_count != header_flits)
                       )
                        flit_count <= flit_count + 1;
                    else
                        flit_count <= 0;

                    if (receiving_header && flit_count == header_flits)
                        full_header <= 1;

                    if (
                        (receiving_payload && flit_count == read_payload_flits && packet_type_is_read) ||
                        (receiving_payload && flit_count == write_payload_flits && !packet_type_is_read)
                       )
                        full_payload <= 1;
                end
            end
        end
    end

    assign stall = (receiving_header && full_header) || (receiving_payload && full_payload) || (!receiving_header && !receiving_payload);
    assign sample_header = receiving_header && !full_header && valid;
    assign sample_payload = receiving_payload && !full_payload && valid;

    always @(posedge clk `RESET_SENSITIVITY)
    begin: generate_packet_finished
        if (rst == `RESET_ACTIVE_VALUE)
            packet_finished <= 0;
        else
        begin
            if (sample_header || sample_payload)
            begin
                if ((flit[`FTYPEWD - 1 : 0] == `ENC_TAIL) || (flit[`FTYPEWD - 1 : 0] == `ENC_SING))
                    packet_finished <= 1;
                else
                    packet_finished <= 0;
            end
        end
    end

endmodule
