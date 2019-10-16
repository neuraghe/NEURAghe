`include "noc_parameters.v"

module axi_ni_receive_fsm(clk, rst, full_header, full_payload, packet_finished, packet_type_is_read, AWREADY, WREADY, ARREADY, WLAST, received_id, wrr_wfull, rdr_wfull, wrr_winc, rdr_winc, receiving_header, receiving_payload, mask_aw_command, mask_ar_command, mask_wd_command, transaction_complete, clear_flit_count);

    parameter MAX_SUPPORTED_IDS = 16;
    `include "axi_parameters.v"

    input                        clk;
    input                        rst;
    input                        full_header;
    input                        full_payload;
    input                        packet_finished;
    input                        packet_type_is_read;
    input                        AWREADY;
    input                        WREADY;
    input                        ARREADY;
    input [`AXIIDWD - 1 : 0]     received_id;
    input [MAX_SUPPORTED_IDS - 1 : 0]      wrr_wfull;
    input [MAX_SUPPORTED_IDS - 1 : 0]      rdr_wfull;
    output reg [MAX_SUPPORTED_IDS - 1 : 0] wrr_winc;
    output reg [MAX_SUPPORTED_IDS - 1 : 0] rdr_winc;
    output reg                   receiving_header;
    output reg                   receiving_payload;
    output reg                   mask_aw_command;
    output reg                   mask_ar_command;
    output reg                   mask_wd_command;
    output reg                   transaction_complete;
    output reg                   clear_flit_count;
    output reg                   WLAST;

    `define IDLE            3'b000
    `define WR_REQUEST      3'b001
    `define RD_REQUEST      3'b010
    `define FILL_PAYLOAD    3'b011
    `define PAYLOAD_TX      3'b100
    `define LAST_PAYLOAD_TX 3'b101

    reg [2:0]             CS;
    reg [2:0]             NS;

    always @(posedge clk `RESET_SENSITIVITY)
    begin: update_state
        if (rst == `RESET_ACTIVE_VALUE)
            CS <= `IDLE;
        else
            CS <= NS;
    end

    always @(CS or packet_finished or full_header or full_payload or AWREADY or WREADY or ARREADY or packet_type_is_read or rdr_wfull or wrr_wfull or received_id)
    begin: generate_state
       case (CS) //synopsys parallel_case
          `IDLE:
              if (full_header && packet_type_is_read && !rdr_wfull[received_id])
                  NS <= `RD_REQUEST;
              else if (full_header && !packet_type_is_read && !wrr_wfull[received_id])
                  NS <= `WR_REQUEST;
              else
                  NS <= `IDLE;
          `WR_REQUEST:
              if (AWREADY && packet_finished && full_payload)
                  NS <= `LAST_PAYLOAD_TX;
              else if (AWREADY && full_payload)
                  NS <= `PAYLOAD_TX;
              else if (AWREADY)
                  NS <= `FILL_PAYLOAD;
              else
                  NS <= `WR_REQUEST;
          `RD_REQUEST:
              if (ARREADY)
                  NS <= `IDLE;
              else
                  NS <= `RD_REQUEST;
          `FILL_PAYLOAD:
              if (packet_finished && full_payload)
                  NS <= `LAST_PAYLOAD_TX;
              else if (full_payload)
                  NS <= `PAYLOAD_TX;
              else
                  NS <= `FILL_PAYLOAD;
          `PAYLOAD_TX:
              if (WREADY)
                  NS <= `FILL_PAYLOAD;
              else
                  NS <= `PAYLOAD_TX;
          `LAST_PAYLOAD_TX:
              if (WREADY)
                  NS <= `IDLE;
              else
                  NS <= `LAST_PAYLOAD_TX;
          default:
              NS <= `IDLE;
       endcase
    end
    
    always @(CS or WREADY or full_header or packet_type_is_read or received_id or rdr_wfull or wrr_wfull)
    begin: generate_output
        case (CS) //synopsys parallel_case
           `IDLE:
           begin
              receiving_header     <= 1;
              receiving_payload    <= 0;
              mask_aw_command      <= 1; 
              mask_ar_command      <= 1;  
              mask_wd_command      <= 1;
              transaction_complete <= 0;
              clear_flit_count     <= 0;
              WLAST                <= 0;
              if (full_header && packet_type_is_read && !rdr_wfull[received_id])
              begin
                  rdr_winc         <= (1 << received_id);
                  wrr_winc         <= 0;
              end
              else if (full_header && packet_type_is_read && rdr_wfull[received_id])
              begin
                  $display("ERROR: %m: RECEIVE OVERFLOW for outstanding READ ID = %d at time %t\n", received_id, $time);
                  rdr_winc         <= 0;
                  wrr_winc         <= 0;
              end
              else if (full_header && !packet_type_is_read && !wrr_wfull[received_id])
              begin
                  rdr_winc         <= 0;
                  wrr_winc         <= (1 << received_id);
              end
              else if (full_header && !packet_type_is_read && wrr_wfull[received_id])
              begin
                  $display("ERROR: %m: RECEIVE OVERFLOW for outstanding WRITE ID = %d at time %t\n", received_id, $time);
                  rdr_winc         <= 0;
                  wrr_winc         <= 0;
              end
              else
              begin
                  rdr_winc         <= 0;
                  wrr_winc         <= 0;
              end
           end
           `WR_REQUEST:
           begin
              receiving_header     <= 0;
              receiving_payload    <= 0;
              mask_aw_command      <= 0; 
              mask_ar_command      <= 1;  
              mask_wd_command      <= 1;
              transaction_complete <= 0;
              clear_flit_count     <= 1;
              WLAST                <= 0;
              rdr_winc             <= 0;
              wrr_winc             <= 0;
           end
           `RD_REQUEST:
           begin
              receiving_header     <= 0;
              receiving_payload    <= 0;
              mask_aw_command      <= 1; 
              mask_ar_command      <= 0;  
              mask_wd_command      <= 1;
              transaction_complete <= 0;
              clear_flit_count     <= 1;
              WLAST                <= 0;
              rdr_winc             <= 0;
              wrr_winc             <= 0;
           end
           `FILL_PAYLOAD:
           begin 
              receiving_header     <= 0;
              receiving_payload    <= 1;
              mask_aw_command      <= 1; 
              mask_ar_command      <= 1;  
              mask_wd_command      <= 1;
              transaction_complete <= 0;
              clear_flit_count     <= 0;
              WLAST                <= 0;
              rdr_winc             <= 0;
              wrr_winc             <= 0;
           end
           `PAYLOAD_TX:
           begin 
              receiving_header     <= 0;
              receiving_payload    <= 1;
              mask_aw_command      <= 1; 
              mask_ar_command      <= 1;  
              mask_wd_command      <= 0;
              transaction_complete <= 0;
              if (WREADY)
                  clear_flit_count <= 1;
              else
                  clear_flit_count <= 0;
              WLAST                <= 0;
              rdr_winc             <= 0;
              wrr_winc             <= 0;
           end
           `LAST_PAYLOAD_TX:
           begin 
              receiving_header     <= 0;
              receiving_payload    <= 0;
              mask_aw_command      <= 1; 
              mask_ar_command      <= 1;  
              mask_wd_command      <= 0;
              transaction_complete <= 1;
              if (WREADY)
                  clear_flit_count <= 1;
              else
                  clear_flit_count <= 0;
              WLAST                <= 1;
              rdr_winc             <= 0;
              wrr_winc             <= 0;
           end
           default:
           begin
              receiving_header     <= 1;
              receiving_payload    <= 0;
              mask_aw_command      <= 1;
              mask_ar_command      <= 1; 
              mask_wd_command      <= 1;
              transaction_complete <= 0;
              clear_flit_count     <= 1;
              WLAST                <= 0;
              rdr_winc             <= 0;
              wrr_winc             <= 0;
           end
        endcase
    end

endmodule
