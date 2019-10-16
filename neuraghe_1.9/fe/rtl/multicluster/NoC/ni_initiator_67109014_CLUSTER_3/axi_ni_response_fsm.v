`include "noc_parameters.v"

module axi_ni_response_fsm(clk, rst, response_awaited, full_header, full_payload, packet_finished, receiving_header, receiving_payload, processing_response, mask_response, clear_flit_count, transaction_complete, packet_type_is_read, received_id, BREADY, RREADY, RLAST, decr_outs_wr_cntr, decr_outs_rd_cntr);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter MAX_SUPPORTED_IDS = 16;
    `include "axi_parameters.v"
    `include "ni_parameters.v"

    input clk;
    input rst;
    input [MAX_SUPPORTED_IDS - 1 : 0] response_awaited;
    input full_header;
    input full_payload;
    input packet_finished;
    input packet_type_is_read;
    input [`PACKETTRANSIDWD - 1 : 0] received_id;
    input BREADY;
    input RREADY;
    output reg receiving_header;
    output reg receiving_payload;
    output reg processing_response;
    output reg mask_response;
    output reg clear_flit_count;
    output reg transaction_complete;
    output reg RLAST;
    output reg [MAX_SUPPORTED_IDS - 1 : 0] decr_outs_wr_cntr;
    output reg [MAX_SUPPORTED_IDS - 1 : 0] decr_outs_rd_cntr;

    localparam IDLE            = 3'b000;
    localparam FILL_HEADER     = 3'b001;
    localparam FILL_PAYLOAD    = 3'b010;
    localparam PAYLOAD_TX      = 3'b011;
    localparam LAST_PAYLOAD_TX = 3'b100;

    reg [2 : 0] CS;
    reg [2 : 0] NS;

    always@(posedge clk `RESET_SENSITIVITY)
    begin: update_state
        if (rst == `RESET_ACTIVE_VALUE)
            CS <= IDLE;
        else
            CS <= NS;
    end

    always @(CS or packet_finished or response_awaited or full_header or full_payload or BREADY or RREADY or packet_type_is_read)
    begin: generate_state
        case (CS) //synopsys parallel_case
            IDLE:
            begin
                if (response_awaited)
                    NS <= FILL_HEADER;
                else
                    NS <= IDLE;
            end
            FILL_HEADER:
            begin
                if (full_header)
                    NS <= FILL_PAYLOAD;
                else
                    NS <= FILL_HEADER;
            end
            FILL_PAYLOAD:
            begin
                if (packet_finished)
                    NS <= LAST_PAYLOAD_TX;
                else if (full_payload)
                    NS <= PAYLOAD_TX;
                else
                    NS <= FILL_PAYLOAD;
            end
            PAYLOAD_TX:
            begin
                if ((BREADY && !packet_type_is_read) || (RREADY && packet_type_is_read))
                    NS <= FILL_PAYLOAD;
                else    
                    NS <= PAYLOAD_TX;
            end
            LAST_PAYLOAD_TX:
            begin
                if ((BREADY && !packet_type_is_read) || (RREADY && packet_type_is_read))
                    NS <= IDLE;
                else
                    NS <= LAST_PAYLOAD_TX;
            end
            default:
                    NS <= IDLE;
        endcase
    end

    always @(CS, RREADY, BREADY, packet_type_is_read, received_id)
    begin: generate_output

        decr_outs_rd_cntr <= 0;
        decr_outs_wr_cntr <= 0;

        case (CS) //synopsys parallel_case
            IDLE:
            begin
                receiving_header <= 0;
                receiving_payload <= 0;
                processing_response <= 0;
                transaction_complete <= 0;
                mask_response <= 1;
                clear_flit_count <= 1;
                RLAST <= 0;
            end
            FILL_HEADER:
            begin
                receiving_header <= 1;
                receiving_payload <= 0;
                processing_response <= 1;
                transaction_complete <= 0;
                mask_response <= 1;
                clear_flit_count <= 0;
                RLAST <= 0;
            end
            FILL_PAYLOAD:
            begin
                receiving_header <= 0;
                receiving_payload <= 1;
                processing_response <= 1;
                transaction_complete <= 0;
                mask_response <= 1;
                clear_flit_count <= 0;
                RLAST <= 0;
            end
            PAYLOAD_TX:
            begin
                receiving_header <= 0;
                receiving_payload <= 0;
                processing_response <= 1;
                transaction_complete <= 0;
                // If this is a read, we must pass each response beat (piece of data) out.
                if (packet_type_is_read)
                    mask_response <= 0;
                // If this is a write, AXI requires only one response at the last beat.
                // Mask all other beats, but clear the flit count anyway.
                else
                    mask_response <= 1;
                clear_flit_count <= 1;
                RLAST <= 0;
            end
            LAST_PAYLOAD_TX:
            begin
                if (RREADY && packet_type_is_read)
                    decr_outs_rd_cntr[received_id] <= 1'b1;
                else if (BREADY && !packet_type_is_read)
                    decr_outs_wr_cntr[received_id] <= 1'b1;
                receiving_header <= 0;
                receiving_payload <= 0;
                processing_response <= 1;
                if ((RREADY && packet_type_is_read) || (BREADY && !packet_type_is_read))
                    transaction_complete <= 1;
                else
                    transaction_complete <= 0;
                mask_response <= 0;
                clear_flit_count <= 1;
                if (packet_type_is_read)
                    RLAST <= 1;
                else
                    RLAST <= 0;
                end
            default:
            begin
                receiving_header <= 0;
                receiving_payload <= 0;
                processing_response <= 0;
                transaction_complete <= 0;
                mask_response <= 1;
                clear_flit_count <= 1;
                RLAST <= 0;
            end
        endcase
    end

endmodule
