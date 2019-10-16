`include "noc_parameters.v"

module ni_clock_synchro(clk, clkdiv, rst, enable, last_clock_beat);

    input clk;
    input [`COUNTERWD - 1 : 0] clkdiv;
    input rst;
    input enable;
    output last_clock_beat;
    reg last_clock_beat;
    reg [`COUNTERFLITWD - 1 : 0] clk_counter;

    always @(posedge clk `RESET_SENSITIVITY)
        begin: count_up_ahead
            if (rst == `RESET_ACTIVE_VALUE)
                clk_counter <= 0;
            else
            begin
                if (enable)
                begin
                    if (last_clock_beat)
                        clk_counter <= 0;
                    else
                        clk_counter <= clk_counter + 1;
                end
            end
        end

    always @(clk_counter or clkdiv)
        begin: is_last_clock_beat
            if (clk_counter == clkdiv - 1)
                last_clock_beat <= 1;
            else
                last_clock_beat <= 0;
        end

endmodule
