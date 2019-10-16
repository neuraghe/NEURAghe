`include "macro.v"

module LFSR_L2_Way_Repl
#(
    parameter NUM_WAYS = 4,
    parameter LOG_NUM_WAYS = `log2(NUM_WAYS-1),
    parameter SEED = 8'b00000000
) 
(
    output logic [NUM_WAYS-1:0] 	refill_way_OH, 	// One hot encoding
    output logic [LOG_NUM_WAYS-1:0] 	refill_way_BIN, // Binary encoding
    input  logic 			enable_i,	//
    input  logic			clk,		//
    input  logic			rst_n		//
);
    
logic [7:0] 			out;
logic           		linear_feedback;
logic [LOG_NUM_WAYS-1:0]		temp_ref_way;


//-------------Code Starts Here-------
assign linear_feedback = !(out[7] ^ out[3] ^ out[2] ^ out[1]); // TAPS for XOR feedback

assign refill_way_BIN = temp_ref_way;

always @(posedge clk, negedge rst_n)
begin
    if (rst_n == 1'b0)
    begin
      out <= SEED ;
    end 
    else if (enable_i) 
	 begin
	    out <= {out[6],out[5],out[4],out[3],out[2],out[1],out[0], linear_feedback};
	 end 

end

generate

if(NUM_WAYS == 2)
    assign temp_ref_way = out[1];
else
    assign temp_ref_way = out[LOG_NUM_WAYS:1];
endgenerate

// Bin to One Hot Encoder
always_comb
begin
  refill_way_OH = '0;
  refill_way_OH[temp_ref_way] = 1'b1;
end




endmodule