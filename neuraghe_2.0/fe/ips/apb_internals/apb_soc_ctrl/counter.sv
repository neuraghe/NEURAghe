module counter(
    input  logic        clk_i,
    input  logic        rstn_i,
    input  logic  [9:0] cfg_i,
    input  logic        clear_i,
    output logic        event_o
);

    logic [9:0] r_counter;

    assign event_o = (r_counter == 10'h0);

	always_ff @(posedge clk_i, negedge rstn_i)
	begin
		if(rstn_i == 1'b0)
		begin
            r_counter <= 10'hF;
		end
		else
		begin
            if(clear_i)
                r_counter <= cfg_i;
            else if (r_counter == 10'h0)
                r_counter <= cfg_i;
            else
                r_counter <= r_counter - 1;
		end
	end



endmodule    
