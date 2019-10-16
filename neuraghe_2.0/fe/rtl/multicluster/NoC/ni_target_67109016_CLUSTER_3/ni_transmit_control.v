`include "noc_parameters.v"

module ni_transmit_control(clk, rst, send_message, num_flit_to_transmit, stall, last_clock_beat, valid, tx_gone, flit_counter);

    input clk;
    input rst;
    input send_message;
    input [`COUNTERFLITWD - 1 : 0] num_flit_to_transmit;
    input stall;
    input last_clock_beat;
    output valid;
    reg valid;
    output tx_gone;
    output [`COUNTERFLITWD - 1 : 0] flit_counter;
    reg [`COUNTERFLITWD - 1 : 0] flit_counter;
    reg reg_tx_gone;

    always @(send_message or flit_counter or num_flit_to_transmit or stall or reg_tx_gone)
        begin: raise_request
            if (flit_counter < num_flit_to_transmit && send_message && !stall && !reg_tx_gone)
                valid <= 1;
            else
                valid <= 0;
        end

    assign tx_gone = reg_tx_gone || valid && (flit_counter == num_flit_to_transmit - 1);

    always @(posedge clk `RESET_SENSITIVITY)
        begin: remember_tx_gone
            if (rst == `RESET_ACTIVE_VALUE)
                reg_tx_gone <= 0;
            else
            begin
                if (last_clock_beat)
                    reg_tx_gone <= 0;
                else
                    reg_tx_gone <= tx_gone;
            end
        end

    always @(posedge clk `RESET_SENSITIVITY)
        begin: count_flits
            if (rst == `RESET_ACTIVE_VALUE)
                flit_counter <= 0;
            else
            begin
                if (tx_gone && last_clock_beat)
                    flit_counter <= 0;
                else
                begin
                    if ((flit_counter != num_flit_to_transmit - 1) && valid)
                        flit_counter <= flit_counter + 1;
                end
            end
        end

endmodule
