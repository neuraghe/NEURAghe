/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Igor Loi - igor.loi@unibo.it                               *
 *                 Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           hwpe_axi_sink.sv                                           *
 * Description:    Sink module for the AXI-Stream HWPE wrapper                *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"
`include "hwpe_axi_params.sv"

module hwpe_axi_sink
#(
  // Cluster interface params
  parameter CLUS_ADDR_WIDTH   = 32,
  parameter CLUS_DATA_WIDTH   = 32,
  parameter CLUS_BE_WIDTH     = CLUS_DATA_WIDTH/8,
  // Stream interface params
  parameter STREAM_DATA_SIZE  = `STREAM_DATA_SIZE,
  parameter STREAM_BE_SIZE    = `STREAM_BE_SIZE,
  parameter STREAM_TID_SIZE   = `STREAM_TID_SIZE,
  parameter STREAM_TDEST_SIZE = `STREAM_TDEST_SIZE,
  parameter STREAM_TUSER_SIZE = `STREAM_TUSER_SIZE,
  // Sink params
  parameter FIFO_DEPTH        = 16,
  parameter WORD_STRIDE       = 4,
  // Latch-based implementation
  parameter LATCH_FIFO        = 0
)
(
  input logic clk,
  input logic rst_n,

  // LINT side
  output logic                       tcdm_req_o,
  input  logic                       tcdm_gnt_i,
  output logic [CLUS_ADDR_WIDTH-1:0] tcdm_add_o,
  output logic                       tcdm_type_o,
  output logic [CLUS_BE_WIDTH-1:0]   tcdm_be_o,
  output logic [CLUS_DATA_WIDTH-1:0] tcdm_data_o,
  input  logic [CLUS_DATA_WIDTH-1:0] tcdm_r_data_i,
  input  logic                       tcdm_r_valid_i,

  // AXI HWPE side
  input  logic                         TVALID_i,
  output logic                         TREADY_o,
  input  logic [STREAM_DATA_SIZE -1:0] TDATA_i,
  input  logic [STREAM_BE_SIZE   -1:0] TSTRB_i,
  input  logic [STREAM_BE_SIZE   -1:0] TKEEP_i,
  input  logic                         TLAST_i,
  input  logic [STREAM_TID_SIZE  -1:0] TID_i,
  input  logic [STREAM_TDEST_SIZE-1:0] TDEST_i,
  input  logic [STREAM_TUSER_SIZE-1:0] TUSER_i,

  // From CFG regs
  input  stream_config_t               stream_config_i,
  output stream_flags_t                stream_flags_o,

  // Control signals
  input  logic                         req_start_sink_i,
  output logic                         ready_start_sink_o,
  output logic                         done_sink_o,
  output  logic  [7:0]                 n_og_o
);

  enum logic [1:0]  {IDLE, SINK, DONE}      cs, ns;

  logic                       tcdm_req_int;
  logic [CLUS_ADDR_WIDTH-1:0] tcdm_add_int;
  logic                       tcdm_type_int;
  logic [CLUS_BE_WIDTH-1:0]   tcdm_be_int;
  logic [CLUS_DATA_WIDTH-1:0] tcdm_data_int;

  logic [CLUS_ADDR_WIDTH-1:0] gen_addr;
  logic in_progress;

  logic FIFO_GNT_push;
  logic address_gen_en;
  logic done_sink_int;
/*
  hwpe_axi_fifo #(
    .DATA_WIDTH(CLUS_DATA_WIDTH + CLUS_BE_WIDTH  + 1 + CLUS_ADDR_WIDTH),
    .DATA_DEPTH(FIFO_DEPTH),
    .LATCH_FIFO(LATCH_FIFO)
  ) sink_fifo_i (
    .clk      (clk),
    .rst_n    (rst_n),

    .data_in  (  {tcdm_data_int, tcdm_be_int, tcdm_type_int, tcdm_add_int}),
    .valid_in (   tcdm_req_int  ),
    .grant_out(  FIFO_GNT_push ),

    .data_out ( {tcdm_data_o, tcdm_be_o, tcdm_type_o, tcdm_add_o} ),
    .valid_out( tcdm_req_o ),
    .grant_in (  tcdm_gnt_i)
  );
  */
  assign tcdm_req_o = tcdm_req_int;
  assign {tcdm_data_o, tcdm_be_o, tcdm_type_o, tcdm_add_o} = {tcdm_data_int, tcdm_be_int, tcdm_type_int, tcdm_add_int};
  assign FIFO_GNT_push = (tcdm_req_o == 1'b1) ? tcdm_gnt_i : 1'b1;
  
  

  logic address_gen_inc;
  assign address_gen_inc = TVALID_i & FIFO_GNT_push;

  hwpe_axi_addressgen #(
    .WORD_STRIDE (WORD_STRIDE)
  ) addressgen_i (
    .clk               (clk            ),
    .rst_n             (rst_n          ),
    .en                (address_gen_en ),
    .address_gen_inc_i (address_gen_inc),
    .stream_config_i   (stream_config_i),
    .gen_addr_o        (gen_addr       ),
    .in_progress_o     (in_progress    ),
    .stream_flags_o    (stream_flags_o ),
    .n_og_o            (n_og_o          )
  );

  always_ff @(posedge clk, negedge rst_n)
  begin : fsm_seq
    if(rst_n == 1'b0) begin
      cs <= IDLE;
    end
    else begin
      cs <= ns;
    end
  end

  always_ff @(posedge clk or negedge rst_n)
  begin : done_sink_ff
    if(rst_n == 1'b0)
      done_sink_o <= 1'b0;
    else
      done_sink_o <= done_sink_int;
  end

  always_comb
  begin : fsm_comb
    tcdm_req_int       = 1'b0;
    tcdm_type_int      = `LOAD;
    tcdm_add_int       = '0;
    tcdm_data_int      = '0;
    tcdm_be_int        = '0;
    done_sink_int      = 1'b0;
    ready_start_sink_o = 1'b0;
    TREADY_o           = 1'b0;
    address_gen_en     = 1'b0;
    case(cs)
      IDLE : begin
        ready_start_sink_o = 1'b1;
        if(req_start_sink_i) begin
          ns = SINK;
          address_gen_en = 1'b1;
        end
        else begin
          ns = IDLE;
          address_gen_en = 1'b0;
        end
      end
      SINK : begin
        if(FIFO_GNT_push)
          TREADY_o  = 1'b1;
        else
          TREADY_o  = 1'b0;
        tcdm_req_int  = TVALID_i;
        tcdm_data_int = TDATA_i;
        tcdm_be_int   = {4{TKEEP_i & TSTRB_i}};
        tcdm_add_int  = gen_addr;
        tcdm_type_int = TVALID_i ? `STORE : `LOAD;
        if(address_gen_inc == 1'b1) begin
          if(in_progress == 1'b1) begin
            ns = SINK;
            address_gen_en = 1'b1;
          end
          else begin
            ns = IDLE;
            done_sink_int = 1'b1;
            address_gen_en = 1'b0;
          end
        end
        else begin
          ns = SINK;
          address_gen_en = 1'b1;
        end
      end
      default : begin
        ns = IDLE;
        address_gen_en = 1'b0;
      end
    endcase
  end

endmodule
