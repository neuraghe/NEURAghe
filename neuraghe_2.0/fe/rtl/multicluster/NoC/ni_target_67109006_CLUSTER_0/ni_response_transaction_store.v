`include "noc_parameters.v"

`ifdef WITH_REDUNDANCY_SUPPORT
  module ni_response_transaction_store(clk, rst, transaction_complete, response_awaited, wait_read_response, processing_response, transaction_target, message_source, full_response, packet_type_is_read, replaced_target, replacement_target);
`else
  module ni_response_transaction_store(clk, rst, transaction_complete, response_awaited, wait_read_response, processing_response, transaction_target, message_source, full_response, packet_type_is_read);
`endif

   input clk;
   input rst;
   input transaction_complete;
   input response_awaited;
   input wait_read_response;
   input processing_response;
   input [`SOURCEWD - 1 : 0] transaction_target;
   input [`SOURCEWD - 1 : 0] message_source;
   output full_response;
   reg full_response;
   output packet_type_is_read;
   reg packet_type_is_read;
   reg [`SOURCEWD : 0] reg_transaction_target;

`ifdef WITH_REDUNDANCY_SUPPORT
   input [`SOURCEWD - 1 : 0] replaced_target;
   input [`SOURCEWD - 1 : 0] replacement_target;
`endif

	always @(posedge clk `RESET_SENSITIVITY)
	begin: store_transaction_info
		if (rst == `RESET_ACTIVE_VALUE)
		begin
`ifdef WITH_REDUNDANCY_SUPPORT
			replaced_target <= 'h0;
			replacement_target <= 'h0;
`endif
			// The value "1 << SOURCEWD" (a "1" followed by SOURCEWD "0"s) cannot be
			// matched by any value coming from ni_request, and is therefore a safe initialization value
			reg_transaction_target <= (1 << `SOURCEWD);
			packet_type_is_read <= 1'b0;
			full_response <= 1'b0;
		end
		else
		begin
			if (!processing_response && response_awaited)
			begin
				reg_transaction_target <= {1'b0, transaction_target};
				packet_type_is_read <= wait_read_response;
				full_response <= 1'b1;
			end
			else
			begin
				if (transaction_complete)
				begin
					if (reg_transaction_target[`SOURCEWD - 1 : 0] == message_source)
					begin
						reg_transaction_target <= (1 << `SOURCEWD);
						packet_type_is_read <= 1'b0;
						full_response <= 1'b0;
					end
					else
					begin
`ifdef WITH_REDUNDANCY_SUPPORT
						replaced_target <= reg_transaction_target[`SOURCEWD - 1 : 0];
						replacement_target <= message_source;
						reg_transaction_target <= (1 << `SOURCEWD);
						packet_type_is_read <= 1'b0;
						full_response <= 1'b0;
`else
						reg_transaction_target <= 'h0;
						packet_type_is_read <= 1'b0;
						full_response <= 1'b1;
`endif
					end
				end
			end
		end
	end
endmodule
