`include "hwpe_sm_params.sv"
`include "hwpe_axi_params.sv"

module axi_hw_accel
#(
  // AXI-Stream interface params
  parameter STREAM_DATA_SIZE    = `STREAM_DATA_SIZE,
  parameter STREAM_BE_SIZE      = `STREAM_BE_SIZE,
  parameter STREAM_TID_SIZE     = `STREAM_TID_SIZE,
  parameter STREAM_TDEST_SIZE   = `STREAM_TDEST_SIZE,
  parameter STREAM_TUSER_SIZE   = `STREAM_TUSER_SIZE
)
(
  input  logic             clk,
  input  logic             rst_n,

  input  logic                         source_TVALID_i,
  output logic                         source_TREADY_o,
  input  logic [STREAM_DATA_SIZE-1:0]  source_TDATA_i,
  input  logic [STREAM_BE_SIZE  -1:0]  source_TSTRB_i,
  input  logic [STREAM_BE_SIZE  -1:0]  source_TKEEP_i,
  input  logic                         source_TLAST_i,
  input  logic [STREAM_TID_SIZE  -1:0] source_TID_i,
  input  logic [STREAM_TDEST_SIZE-1:0] source_TDEST_i,
  input  logic [STREAM_TUSER_SIZE-1:0] source_TUSER_i,


  output logic                         sink_TVALID_o,
  input  logic                         sink_TREADY_i,
  output logic [STREAM_DATA_SIZE-1:0]  sink_TDATA_o,
  output logic [STREAM_BE_SIZE  -1:0]  sink_TSTRB_o,
  output logic [STREAM_BE_SIZE  -1:0]  sink_TKEEP_o,
  output logic                         sink_TLAST_o,
  output logic [STREAM_TID_SIZE  -1:0] sink_TID_o,
  output logic [STREAM_TDEST_SIZE-1:0] sink_TDEST_o,
  output logic [STREAM_TUSER_SIZE-1:0] sink_TUSER_o
);

  logic                         source_TVALID_int;
  logic                         source_TREADY_int;
  logic [STREAM_DATA_SIZE-1:0]  source_TDATA_int;
  logic [STREAM_BE_SIZE-1:0]    source_TSTRB_int;
  logic [STREAM_BE_SIZE-1:0]    source_TKEEP_int;
  logic                         source_TLAST_int;
  logic [STREAM_TID_SIZE-1:0]   source_TID_int;
  logic [STREAM_TDEST_SIZE-1:0] source_TDEST_int;
  logic [STREAM_TUSER_SIZE-1:0] source_TUSER_int;

  logic [31:0]            Counter;

  always_ff @(posedge clk, negedge rst_n)
  begin
    if(rst_n == 1'b0)
      Counter <= '0;
    else if (source_TLAST_int & source_TVALID_int & source_TREADY_int)
      Counter <= '0;
    else if( source_TVALID_int & source_TREADY_int & ~source_TLAST_int)
      Counter <= Counter + source_TDATA_int;
  end

  hwpe_axi_fifo #(
    .DATA_WIDTH(STREAM_DATA_SIZE + STREAM_BE_SIZE  + STREAM_BE_SIZE + 1 + STREAM_TID_SIZE + STREAM_TDEST_SIZE + STREAM_TUSER_SIZE),
    .DATA_DEPTH(4)
  ) u_source_fifo (
    .clk(clk),
    .rst_n(rst_n),
    .data_in(    {source_TDATA_i, source_TSTRB_i, source_TKEEP_i, source_TLAST_i, source_TID_i, source_TDEST_i, source_TUSER_i }  ),
    .valid_in(    source_TVALID_i  ),
    .grant_out(   source_TREADY_o ),
    .data_out( {source_TDATA_int, source_TSTRB_int, source_TKEEP_int, source_TLAST_int, source_TID_int, source_TDEST_int,  source_TUSER_int } ),
    .valid_out( source_TVALID_int),
    .grant_in( source_TREADY_int )
  );

  hwpe_axi_fifo #(
    .DATA_WIDTH(STREAM_DATA_SIZE + STREAM_BE_SIZE  + STREAM_BE_SIZE + 1 + STREAM_TID_SIZE + STREAM_TDEST_SIZE + STREAM_TUSER_SIZE),
    .DATA_DEPTH(4)
  ) u_sink_fifo (
    .clk(clk),
    .rst_n(rst_n),
    .data_in(    { (Counter[STREAM_DATA_SIZE-1:0] + source_TDATA_int ),  source_TSTRB_int, source_TKEEP_int, source_TLAST_int, source_TID_int, source_TDEST_int, source_TUSER_int }  ),
    .valid_in(    source_TVALID_int  ),
    .grant_out(   source_TREADY_int ),
    .data_out( {sink_TDATA_o, sink_TSTRB_o, sink_TKEEP_o, sink_TLAST_o, sink_TID_o, sink_TDEST_o,  sink_TUSER_o } ),
    .valid_out( sink_TVALID_o),
    .grant_in( sink_TREADY_i )
  );

endmodule
