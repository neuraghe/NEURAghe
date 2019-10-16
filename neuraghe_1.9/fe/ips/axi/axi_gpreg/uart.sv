module uart (
		input  logic        clk,
		input  logic        rstn,
		output logic        tx,
		input  logic        rx,
		output logic [31:0]	status,
		input  logic [15:0]	div,
		input  logic        parity_check,
		input  logic  [3:0]	btr,
		input  logic        rxstart,
		input  logic        rxstop,
		input  logic  [7:0] datatx,
		input  logic        datatx_valid,
		output logic [31:0]	datarx,
		output logic        datarx_valid,
		input  logic        datarx_ready
		);
	
	logic  [7:0] s_data_tx;
	logic        s_data_tx_valid;
	logic        s_data_tx_ready;
	
	logic        s_tx_busy;
	logic  [5:0] s_tx_fifo_size;
	
	uart_fifo tx_fifo(
			.clk_i(clk),
			.rst_ni(rstn),
			.clr_i(1'b0),
			.elements_o(s_tx_fifo_size),
			.data_o(s_data_tx),
			.valid_o(s_data_tx_valid),
			.ready_i(s_data_tx_ready),
			.data_i(datatx),
			.valid_i(datatx_valid),
			.ready_o()
			);

	uart_tx i_uart_tx(
			.clk(clk),
			.rstn(rstn),
			.tx(tx),
			.tx_busy(s_tx_busy),
			.parity_check(parity_check),
			.div(div),
			.datatx(s_data_tx),
			.datatx_valid(s_data_tx_valid),
			.datatx_ready(s_data_tx_ready)
			);
	
	assign status = {s_tx_fifo_size,s_tx_busy};
	
endmodule
		
		
		
		