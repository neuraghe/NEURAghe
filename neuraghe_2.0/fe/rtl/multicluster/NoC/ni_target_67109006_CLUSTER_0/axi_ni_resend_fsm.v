`include "noc_parameters.v"

module axi_ni_resend_fsm (clk, rst, last_beat, tx_gone, br_rempty, rr_rempty, rdr_rempty, wrr_rempty, br_rinc, rr_rinc, rdr_rinc, wrr_rinc, is_payload, sample_header, sample_payload, send_message, flit_sequence, num_flit_to_transmit, curr_tid, packet_type_is_read);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter AXIRDATAWD = 32;
    parameter MAX_SUPPORTED_IDS = 16;
    `include "axi_parameters.v"
    `include "ni_parameters.v"

    input                                  clk;
    input                                  rst;
    input                                  last_beat;
    input                                  tx_gone;
    input [MAX_SUPPORTED_IDS - 1 : 0]      br_rempty;
    input [MAX_SUPPORTED_IDS - 1 : 0]      rr_rempty;
    input [MAX_SUPPORTED_IDS - 1 : 0]      rdr_rempty;
    input [MAX_SUPPORTED_IDS - 1 : 0]      wrr_rempty;
    output reg [MAX_SUPPORTED_IDS - 1 : 0] br_rinc;
    output reg [MAX_SUPPORTED_IDS - 1 : 0] rr_rinc;
    output reg [MAX_SUPPORTED_IDS - 1 : 0] rdr_rinc;
    output reg [MAX_SUPPORTED_IDS - 1 : 0] wrr_rinc;
    output reg                             is_payload;
    output reg                             sample_header;
    output reg                             sample_payload;
    output reg                             send_message;
    output reg [`FTYPEWD - 1 : 0]          flit_sequence;
    output reg [`COUNTERFLITWD - 1 : 0]    num_flit_to_transmit;
    output reg [`AXIIDWD - 1 : 0]          curr_tid;
    output reg                             packet_type_is_read;

    reg [2 : 0]                            CS;
    reg [2 : 0]                            NS;
    reg [`AXIIDWD - 1 : 0]                 curr_id_c;
    reg [`AXIIDWD - 1 : 0]                 curr_id;

    localparam IDLE                      = 3'b000;
    localparam WRITE_HEADER_TX           = 3'b001;
    localparam READ_HEADER_TX            = 3'b010;
    localparam READ_PAYLOAD_TX           = 3'b011;
    localparam READ_LAST_PAYLOAD_TX      = 3'b100;
    localparam READ_PAUSE_TX             = 3'b101;
    localparam WRITE_LAST_PAYLOAD_TX     = 3'b110;

    localparam NOP_ID                    = 3'b000;
    localparam READ_ID                   = 3'b001;
    localparam WRITE_ID                  = 3'b010;

    // ------------ Round robin algorithm for the next ID selection -------------
    function [`AXIIDWD + 2 : 0] next_id (input reg [MAX_SUPPORTED_IDS - 1 : 0] outs_rd_empty,
                                         input reg [MAX_SUPPORTED_IDS - 1 : 0] outs_wr_empty,
                                         input reg [MAX_SUPPORTED_IDS - 1 : 0] rr_rempty,
                                         input reg [MAX_SUPPORTED_IDS - 1 : 0] br_rempty);
    reg [`AXIIDWD : 0] n_id; // One bit more, to avoid overflows
    begin
        next_id = {NOP_ID, {`AXIIDWD{1'b0}}};

        // TODO biased towards low IDs
        // Scan all IDs and see for each one if a write, and then a read, can be found.
        // Break as soon as one is found, or at the end of the search. In case nothing is
        // found to send, return NOP_ID.
        for (n_id = 0; n_id < MAX_SUPPORTED_IDS && next_id == {NOP_ID, {`AXIIDWD{1'b0}}}; n_id = n_id + 1)
        begin
           if (!br_rempty[n_id])                            // next = WR
           begin    
              if (!outs_wr_empty[n_id])
                  next_id = {WRITE_ID, n_id[`AXIIDWD - 1 : 0]};
              else
                  $display("ERROR: %m: RESEND UNDERFLOW for WRITE ID = %d at time %t", n_id, $time);
           end
           else if (!rr_rempty[n_id])                       // next = RD
           begin 
              if (!outs_rd_empty[n_id])
                  next_id = {READ_ID, n_id[`AXIIDWD - 1 : 0]};
              else
                  $display("ERROR: %m: RESEND UNDERFLOW for READ ID = %d at time %t", n_id, $time);
           end
        end  // end for loop

`ifdef DEBUG
        $display("INFO: NIT_AXI ID ARBITER => Next ID selected = %h",next_id);
`endif  
    end 
    endfunction

    always @(posedge clk `RESET_SENSITIVITY)
    begin: update_state
        if (rst == `RESET_ACTIVE_VALUE)
            CS <= IDLE;
        else
            CS <= NS;
    end

    always @(CS or curr_tid or rdr_rempty or wrr_rempty or br_rempty or rr_rempty or last_beat or tx_gone)
    begin: generate_state
        reg [`AXIIDWD + 2 : 0] tmp_id;
        case (CS) //synopsys parallel_case
            IDLE:
            begin
                tmp_id = next_id(rdr_rempty, wrr_rempty, rr_rempty, br_rempty);
                if (tmp_id[`AXIIDWD + 2 : `AXIIDWD] == WRITE_ID)
                    NS <= WRITE_HEADER_TX;
                else if (tmp_id[`AXIIDWD + 2 : `AXIIDWD] == READ_ID)
                    NS <= READ_HEADER_TX;
                else
                    NS <= IDLE;
            end
            READ_HEADER_TX:
                if (tx_gone && !last_beat)
                    NS <= READ_PAYLOAD_TX;
                else if (tx_gone)
                    NS <= READ_LAST_PAYLOAD_TX;
                else
                    NS <= READ_HEADER_TX;
            READ_PAYLOAD_TX:
                if (tx_gone && !last_beat && !rr_rempty[curr_tid])          // burst
                   NS <= READ_PAYLOAD_TX;
                else if (tx_gone && last_beat && !rr_rempty[curr_tid])      // last beat
                   NS <= READ_LAST_PAYLOAD_TX;
                else if (tx_gone && rr_rempty[curr_tid])      // empty buffer
                   NS <= READ_PAUSE_TX;
                else
                   NS <= READ_PAYLOAD_TX;
            READ_PAUSE_TX:
                if (!rr_rempty[curr_tid] && !last_beat)
                    NS <= READ_PAYLOAD_TX;
                else if (!rr_rempty[curr_tid] && last_beat)
                    NS <= READ_LAST_PAYLOAD_TX;
                else
                    NS <= READ_PAUSE_TX;
            READ_LAST_PAYLOAD_TX:
                if (tx_gone)
                    NS <= IDLE;
                else
                    NS <= READ_LAST_PAYLOAD_TX;
            WRITE_HEADER_TX:
                if (tx_gone)
                    NS <= WRITE_LAST_PAYLOAD_TX;
                else
                    NS <= WRITE_HEADER_TX;
             WRITE_LAST_PAYLOAD_TX:
                if (tx_gone)
                    NS <= IDLE;
                else
                    NS <= WRITE_LAST_PAYLOAD_TX;
             default:
                    NS <= IDLE;
         endcase
    end

    always @(CS or rdr_rempty or wrr_rempty or br_rempty or rr_rempty or tx_gone or curr_id)
    begin: generate_output
        reg [`AXIIDWD + 2 : 0] tmp_id;
        br_rinc              <= 0;
        rr_rinc              <= 0;
        rdr_rinc             <= 0;
        wrr_rinc             <= 0;
        is_payload           <= 0;
        sample_header        <= 0;
        sample_payload       <= 0;
        send_message         <= 0;
        flit_sequence        <= `ENC_HEAD;
        num_flit_to_transmit <= 0;
        tmp_id                = 0;
        curr_tid             <= curr_id;

        case (CS)
            IDLE:
            begin
                tmp_id = next_id(rdr_rempty, wrr_rempty, rr_rempty, br_rempty);
                if (tmp_id[`AXIIDWD + 2 : `AXIIDWD] == WRITE_ID)
                begin
                    sample_header         <= 1;
                    packet_type_is_read   <= 0;
                    curr_tid              <= tmp_id[`AXIIDWD - 1 : 0];
                end
                else if (tmp_id[`AXIIDWD + 2 : `AXIIDWD] == READ_ID)
                begin
                    sample_header         <= 1;
                    packet_type_is_read   <= 1;
                    curr_tid              <= tmp_id[`AXIIDWD - 1 : 0];
                end
                else
                begin
                    sample_header         <= 0;
                    packet_type_is_read   <= 0;
                end
            end
            READ_HEADER_TX:
            begin
                send_message              <= 1;
                flit_sequence             <= `ENC_HEAD;
                num_flit_to_transmit      <= RESP_HEADERFLITS;
                if (tx_gone)
                begin
                    sample_payload        <= 1;
                    rr_rinc[curr_id]      <= 1;
                    rdr_rinc[curr_id]     <= 1;
                end
                packet_type_is_read       <= 1;
            end
            READ_PAYLOAD_TX:
            begin
                is_payload                <= 1;
                send_message              <= 1;
                flit_sequence             <= `ENC_PAYL;
                num_flit_to_transmit      <= READ_RESP_PAYLOADFLITS;
                if (tx_gone && !rr_rempty[curr_id])          // burst
                begin
                    rr_rinc[curr_id]      <= 1;
                    sample_payload        <= 1;
                end
                packet_type_is_read       <= 1;
            end
            READ_PAUSE_TX:
            begin
                is_payload                <= 1;
                flit_sequence             <= `ENC_PAYL;
                num_flit_to_transmit      <= READ_RESP_PAYLOADFLITS;
                if (!rr_rempty[curr_id])
                begin
                    rr_rinc[curr_id]      <= 1;
                    sample_payload        <= 1;
                end
                packet_type_is_read       <= 1;
            end
            READ_LAST_PAYLOAD_TX:
            begin
                is_payload                <= 1;
                send_message              <= 1;
                flit_sequence             <= `ENC_TAIL;
                num_flit_to_transmit      <= READ_RESP_PAYLOADFLITS;
                packet_type_is_read       <= 1;
            end
            WRITE_HEADER_TX:
            begin
                send_message              <= 1;
                flit_sequence             <= `ENC_HEAD;
                num_flit_to_transmit      <= RESP_HEADERFLITS;
                packet_type_is_read       <= 0;
                if (tx_gone)
                begin
                    sample_payload        <= 1;
                    br_rinc[curr_id]      <= 1;
                    wrr_rinc[curr_id]     <= 1;
                end
            end
            WRITE_LAST_PAYLOAD_TX:
            begin
                is_payload                <= 1;
                send_message              <= 1;
                flit_sequence             <= `ENC_TAIL;
                packet_type_is_read       <= 0;
                num_flit_to_transmit      <= WRITE_RESP_PAYLOADFLITS;
            end
            default:
            begin
                br_rinc                   <= 0;
                rr_rinc                   <= 0;
                is_payload                <= 0;
                sample_header             <= 0;
                sample_payload            <= 0;
                send_message              <= 0;
                flit_sequence             <= `ENC_HEAD;
                num_flit_to_transmit      <= 0;
                packet_type_is_read       <= 0;
                tmp_id                     = 0;
                curr_tid                  <= curr_id;
            end
        endcase
    end

    always @(posedge clk `RESET_SENSITIVITY)
    begin: fsm_outputs
        if (rst == `RESET_ACTIVE_VALUE)
            curr_id <= 'h0;
        else
            curr_id <= curr_tid;
    end

endmodule
