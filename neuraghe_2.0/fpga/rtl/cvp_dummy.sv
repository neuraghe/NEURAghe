// dummy CVP module for FPGA emulator

module cvp
  #(
    parameter ADDRESS_SIZE     = 10, // Number of bits used on the address
    parameter NUM_FREQ_MODES_0 = 4   // Number of frequency_modes on clock_generator. Maximum 8
  )
  (
    // reset and clock for the CVP synchronous domain
    input  logic rst_async_n,
    input  logic clk_cvp,
    input  logic clk_ref,
    // signals to the core
    output logic clk_fll_0,
    input  logic power_on,
    // CVP interface
    input  logic        pwr_req,
    input  logic [63:0] pwr_w_data,
    input  logic [31:3] pwr_addr,
    input  logic [ 7:0] pwr_be,
    input  logic        pwr_wr_rd,
    output logic        pwr_ack,
    output logic [63:0] pwr_r_data,
    output logic        pwr_error,
    // DEBUG obervation interface
    output logic core_rst_n,
    output logic core_power_on,
    // TEST part
    input  logic test_mode,
    input  logic test_se,
    input  logic test_si,
    output logic test_so
  );

  localparam SIZE = 1024;

  // logic [SIZE-1:0][63:0] mem;
  logic [63:0] mem;

  logic [63:0] wdata_be;

  genvar i;
  generate
    for(i=0;i<8;i++) begin
      always_comb
      begin
        wdata_be[(i+1)*8-1:i*8] <= (pwr_be[i]==1'b1) ? pwr_w_data[(i+1)*8-1:i*8] : 8'b0;
      end
    end
  endgenerate

  assign clk_fll_0 = clk_ref;

  assign pwr_error = 1'b0;

  always_ff @(posedge clk_cvp or negedge rst_async_n)
  begin
    if (rst_async_n==1'b0)
      mem <= 0;
    else begin
      if(pwr_req & pwr_wr_rd) begin
        // mem[pwr_addr[ADDRESS_SIZE+3-1:3]] <= wdata_be;
        mem <= wdata_be;
        pwr_r_data <= wdata_be;
        pwr_ack <= 1'b1;
      end
      else if(pwr_req & ~pwr_wr_rd) begin
        // pwr_r_data <= mem[pwr_addr[ADDRESS_SIZE+3-1:3]];
        pwr_r_data <= mem;
        pwr_ack <= 1'b1;
      end
      else begin
        pwr_r_data <= 0;
        pwr_ack <= 1'b0;
      end
    end
  end

endmodule