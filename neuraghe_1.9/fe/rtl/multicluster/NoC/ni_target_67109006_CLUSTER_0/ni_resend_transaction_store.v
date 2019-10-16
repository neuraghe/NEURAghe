`include "noc_parameters.v"

module ni_resend_transaction_store(clk, rst, start_receive_response, new_packet_type_is_read, new_received_id, new_message_source, packet_type_is_read, received_id, message_source);

    input clk;
    input rst;
    input start_receive_response;
    input new_packet_type_is_read;
    input [`MAX_SUPPORTED_ID_WD - 1 : 0] new_received_id;
    input [`SOURCEWD - 1 : 0] new_message_source;
    output packet_type_is_read;
    output [`MAX_SUPPORTED_ID_WD - 1 : 0] received_id;
    output [`SOURCEWD - 1 : 0] message_source;
    reg reg_packet_type_is_read;
    reg [`MAX_SUPPORTED_ID_WD - 1 : 0] reg_received_id;
    reg [`SOURCEWD - 1 : 0] reg_message_source;

    always @(posedge clk `RESET_SENSITIVITY)
    begin: store_transaction_info
        if (rst == `RESET_ACTIVE_VALUE)
        begin
            reg_packet_type_is_read <= 1'b0;
            reg_received_id <= 'h0;
            reg_message_source <= 1'b0;
        end
        else
        begin
            if (start_receive_response)
            begin
                reg_packet_type_is_read <= new_packet_type_is_read;
                reg_received_id <= new_received_id;
                reg_message_source <= new_message_source;
            end
        end
    end

    // Make sure that the information is available combinationally since start_receive_response goes up,
    // and then through the transaction
    assign packet_type_is_read = (start_receive_response ? new_packet_type_is_read : reg_packet_type_is_read);
    assign received_id = (start_receive_response ? new_received_id : reg_received_id);
    assign message_source = (start_receive_response ? new_message_source : reg_message_source);

endmodule
