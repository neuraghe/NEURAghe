`define REQ_SW_RST       1'b0
`define REQ_POWER_DOWN   1'b1

module power_manager
(
    input  logic        clk_i,
    input  logic        rstn_i,
    input  logic        power_down_req_i,
    input  logic        cluster_rst_req_i,
    input  logic        cluster_busy_i,
    input  logic        wakeup_event_i,
    input  logic        cfg_wakeup_polarity_i,
    input  logic  [9:0] cfg_busy_cycle_i,
    input  logic  [9:0] cfg_rst_cycle_i,
    output logic        power_down_o,
    output logic        clock_enable_o,
    output logic        cluster_rstn_o
);

    enum logic [1:0] { IDLE, WAIT_NO_BUSY, OFF, CLUSTER_RST } state, state_next;

    logic r_req_type, s_req_type_next;
    logic s_cnt_busy_clear;
    logic s_cnt_rst_clear;
    logic s_cnt_busy_event;
    logic s_cnt_rst_event;

    logic busy_sync;
    logic busy_sync0;
    logic s_wakeup_event_sync;
    logic s_wakeup_event_sync0;
    logic s_clk_off;

    logic s_wakeup_event;

    assign s_wakeup_event = cfg_wakeup_polarity_i ? wakeup_event_i : ~wakeup_event_i;

    counter busy_counter
    (
        .clk_i(clk_i),
        .rstn_i(rstn_i),
        .cfg_i(cfg_busy_cycle_i),
        .clear_i(s_cnt_busy_clear),
        .event_o(s_cnt_busy_event)
    );

    counter rst_counter
    (
        .clk_i(clk_i),
        .rstn_i(rstn_i),
        .cfg_i(cfg_rst_cycle_i),
        .clear_i(s_cnt_rst_clear),
        .event_o(s_cnt_rst_event)
    );

    always_ff @(posedge clk_i, negedge rstn_i)
    begin
        if(rstn_i == 1'b0)
        begin
            state      <= IDLE;
            r_req_type <= 1'b0;
        end
        else
        begin
            state      <= state_next;
            r_req_type <= s_req_type_next; 
        end
    end

    always_ff @(posedge clk_i, negedge rstn_i)
    begin
            if(rstn_i == 1'b0)
            begin
                busy_sync            <= 1'b1;
                busy_sync0           <= 1'b1;
                s_wakeup_event_sync  <= 1'b0;
                s_wakeup_event_sync0 <= 1'b0;
            end
            else
            begin
                busy_sync0           <= cluster_busy_i;
                busy_sync            <= busy_sync0;
                s_wakeup_event_sync0 <= s_wakeup_event;
                s_wakeup_event_sync  <= s_wakeup_event_sync0;
            end
    end

    always_comb
    begin
        state_next       = state;
        power_down_o     = 1'b0;
        cluster_rstn_o   = 1'b1;
        s_req_type_next  = r_req_type;
        s_cnt_busy_clear = 1'b1;
        s_cnt_rst_clear  = 1'b1;
        s_clk_off        = 1'b0;

        case(state)
        IDLE:
        begin
            if (power_down_req_i || cluster_rst_req_i)
                state_next = WAIT_NO_BUSY;

            if (power_down_req_i)
                s_req_type_next = `REQ_POWER_DOWN;
            else
                s_req_type_next = `REQ_SW_RST;
        end //~ IDLE

        WAIT_NO_BUSY: 
        begin
            if (!busy_sync)
                s_cnt_busy_clear = 1'b0;

            if (s_cnt_busy_event)
            begin
                if (r_req_type == `REQ_POWER_DOWN)
                    state_next = OFF;
                else
                    state_next = CLUSTER_RST;
            end
        end //~ WAIT_NO_BUSY

        OFF:
        begin
            cluster_rstn_o  = 1'b0;
            power_down_o = 1'b1;
            s_clk_off    = 1'b1;
            if (s_wakeup_event_sync)
                state_next = CLUSTER_RST;
        end //~ OFF

        CLUSTER_RST:
        begin
            cluster_rstn_o  = 1'b0;
            s_cnt_rst_clear = 1'b0;
            if (s_cnt_rst_event)
            begin
                state_next = IDLE;
            end
        end //~ CLUSTER_RST

        default : begin
            state_next       = state;
        end //~default
        endcase
    end // always_comb

    assign clock_enable_o = ~s_clk_off | s_wakeup_event;

endmodule

 
