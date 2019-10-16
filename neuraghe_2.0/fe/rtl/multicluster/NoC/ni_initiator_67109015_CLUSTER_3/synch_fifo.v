`include "noc_parameters.v"

module synch_fifo (winc, wclk, wrst, rinc, rclk, rrst, wdata, num_stored_words, wfull, rempty, rdata);

parameter DSIZE = 8;
parameter ASIZE = 4;
localparam FIFO_WORDS_NUM = 2**ASIZE;
localparam FIFO_PTR_SIZE = ASIZE+1;

integer k;

input winc;
input wclk;
input wrst;
input rinc;
input rclk;
input rrst;
input [DSIZE-1:0] wdata;
output [ASIZE:0] num_stored_words;
output wfull;
output rempty;
output [DSIZE-1:0] rdata;
reg [DSIZE-1:0] rdata;

reg [FIFO_WORDS_NUM-1:0] split_wr_en_n; // write enable per mem_elem
reg [ASIZE:0] wptr;
reg [ASIZE:0] rptr;
reg [ASIZE:0] nx_rptr;
wire [DSIZE-1:0] all_mem_elem_rdata [FIFO_WORDS_NUM-1:0]; // bidi bus of all data read 
wire wr_en_n;
wire [ASIZE:0] two_compl_rptr;

assign rempty = (wptr == rptr);
assign wfull = (wptr[ASIZE-1:0] == rptr[ASIZE-1:0]) && (wptr[ASIZE] != rptr[ASIZE]);
assign wr_en_n = !(winc & ! wfull);
assign two_compl_rptr = ~rptr+1;
assign num_stored_words = wptr + two_compl_rptr;

// instantiate the memory elements
genvar i;
generate
  for (i=0; i<FIFO_WORDS_NUM; i=i+1)
    begin: mem
      mem_elem #(DSIZE) i_me
 	 (.clk(wclk),
	 .rst(wrst),
	 .wr_en_n(split_wr_en_n[i]),	  // write enable
	 .wdata(wdata), 		  // write data
	 .rdata(all_mem_elem_rdata[i]));  // read data
    end
endgenerate

// write address decode (combinatorial)
always @(wr_en_n or wptr) begin  
  // default assignement
  for (k = 0; k < FIFO_WORDS_NUM; k = k + 1) begin
    split_wr_en_n[k] <= 1'b1;
  end
  // write selection (mem_elem)
  if (wr_en_n == 1'b0) begin
    split_wr_en_n[wptr[ASIZE-1:0]] <= 1'b0;
  end 
end

// fifo write pointer
always @(posedge wclk or `RESET_SENSITIVE_EDGE wrst) begin
  if (wrst == `RESET_ACTIVE_VALUE) begin
    wptr <= {FIFO_PTR_SIZE{1'b0}};  
  end else if (winc && !wfull) begin  
    wptr <= wptr + 1;
  end	 
end 

// nx_rptr
always @(rinc or rempty or rptr) begin   
  if (rinc && !rempty) begin  
    nx_rptr <= rptr + 1;
  end else begin
    nx_rptr <= rptr;
  end	 
end 

// fifo read pointer
always @(posedge rclk or `RESET_SENSITIVE_EDGE rrst) begin
  if (rrst == `RESET_ACTIVE_VALUE) begin
    rptr <= {FIFO_PTR_SIZE{1'b0}};  
  end else if (rinc && !rempty) begin  
    rptr <= nx_rptr;
  end	 
end 

// read data
always @(posedge rclk or `RESET_SENSITIVE_EDGE rrst) begin
  if (rrst == `RESET_ACTIVE_VALUE) begin
    rdata <= {DSIZE{1'b0}};  
  end else begin  
    rdata <= all_mem_elem_rdata[nx_rptr[ASIZE-1:0]];
  end	 
end 

endmodule

