/****************************************************************************
 * io_generic_counter.sv
 ****************************************************************************/

/**
 * Module: io_generic_counter
 * 
 * TODO: Add module documentation
 */
module io_event_counter
#(
    parameter COUNTER_WIDTH = 6
)
(
    input  logic clk_i,
    input  logic rstn_i,
    input  logic event_i,
    input  logic counter_rst_i,
    input  logic [COUNTER_WIDTH-1:0] counter_target_i,
    output logic [COUNTER_WIDTH-1:0] counter_value_o,
    output logic counter_trig_o
);
    logic [COUNTER_WIDTH-1:0] counter;
    logic [COUNTER_WIDTH-1:0] counter_next;

    logic                   trigger;
    logic                   trigger_old;

    always_comb
    begin
        if (counter_rst_i)
            counter_next = 'h0;
        else if (event_i)
        begin
            if (counter == counter_target_i)
                counter_next = 'h1;
            else
                counter_next = counter + 1;
        end
        else
            counter_next = counter;
    end

    always_comb
    begin
        if (counter == counter_target_i)
            trigger = 1'b1;
        else
            trigger = 1'b0;
    end

    always_ff @(posedge clk_i, negedge rstn_i)
    begin
        if (rstn_i == 1'b0)
        begin
            trigger_old <= 1'b0;
            counter     <= 'h0;
        end
        else
        begin
            trigger_old <= trigger;
            counter     <= counter_next;
        end
    end

    assign counter_value_o = counter;

    assign counter_trig_o = ~trigger_old & trigger;

endmodule