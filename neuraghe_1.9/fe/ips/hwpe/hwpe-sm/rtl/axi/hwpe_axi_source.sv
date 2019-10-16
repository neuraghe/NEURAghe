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
 * File:           hwpe_axi_source.sv                                         *
 * Description:    Source module for the AXI-Stream HWPE wrapper              *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"
`include "hwpe_axi_params.sv"

module hwpe_axi_source
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
  parameter N_SOURCE_STREAMS = 1,
  // Source params
  parameter FIFO_DEPTH        = 16,
  parameter WORD_STRIDE       = 4,
  // Latch-based implementation
  parameter LATCH_FIFO        = 0
)
(
    input logic clk,
    input logic rst_n,

    // LINT side
    output logic [N_SOURCE_STREAMS-1:0]                      tcdm_req_o,
    input  logic [N_SOURCE_STREAMS-1:0]                      tcdm_gnt_i,
    output logic [N_SOURCE_STREAMS-1:0][CLUS_ADDR_WIDTH-1:0] tcdm_add_o,
    output logic [N_SOURCE_STREAMS-1:0]                      tcdm_type_o,
    output logic [N_SOURCE_STREAMS-1:0][CLUS_BE_WIDTH-1:0]   tcdm_be_o,
    output logic [N_SOURCE_STREAMS-1:0][CLUS_DATA_WIDTH-1:0] tcdm_data_o,
    input  logic [N_SOURCE_STREAMS-1:0][CLUS_DATA_WIDTH-1:0] tcdm_r_data_i,
    input  logic [N_SOURCE_STREAMS-1:0]                      tcdm_r_valid_i,

    // AXI HWPE side
    output logic [N_SOURCE_STREAMS-1:0]                        TVALID_o,
    input  logic [N_SOURCE_STREAMS-1:0]                        TREADY_i,
    output logic [N_SOURCE_STREAMS-1:0][STREAM_DATA_SIZE -1:0] TDATA_o,
    output logic [N_SOURCE_STREAMS-1:0][STREAM_BE_SIZE   -1:0] TSTRB_o,
    output logic [N_SOURCE_STREAMS-1:0][STREAM_BE_SIZE   -1:0] TKEEP_o,
    output logic [N_SOURCE_STREAMS-1:0]                        TLAST_o,
    output logic [N_SOURCE_STREAMS-1:0][STREAM_TID_SIZE  -1:0] TID_o,
    output logic [N_SOURCE_STREAMS-1:0][STREAM_TDEST_SIZE-1:0] TDEST_o,
    output logic [N_SOURCE_STREAMS-1:0][STREAM_TUSER_SIZE-1:0] TUSER_o,

    // From CFG regs
    input  stream_config_t[N_SOURCE_STREAMS-1:0]               stream_config_i,
    output stream_flags_t[N_SOURCE_STREAMS-1:0]                stream_flags_o,
    input  logic [STREAM_TID_SIZE  -1:0] cfg_TID_i,
    input  logic [STREAM_TDEST_SIZE-1:0] cfg_TDEST_i,
    input  logic [STREAM_TUSER_SIZE-1:0] cfg_TUSER_i,

    // Control signals
    output logic [N_SOURCE_STREAMS-1:0]                        fifo_gnt_o,
    input  logic [N_SOURCE_STREAMS-1:0]                        req_start_source_i,
    output logic [N_SOURCE_STREAMS-1:0]                        ready_start_source_o,
    output logic [N_SOURCE_STREAMS-1:0]                        done_source_o,
    output  logic                          change_feat_o,
    output  logic                [7:0]                 n_og_o
);

  enum logic [1:0]  {IDLE, SOURCE, DONE}      cs, ns;

  logic  [N_SOURCE_STREAMS-1:0]FIFO_GNT_out;
  logic  [N_SOURCE_STREAMS-1:0]done_source_int;
  logic  [N_SOURCE_STREAMS-1:0]address_gen_en;

  logic [N_SOURCE_STREAMS-1:0][STREAM_BE_SIZE   -1:0]      TSTRB_int;
  logic [N_SOURCE_STREAMS-1:0][STREAM_BE_SIZE   -1:0]      TKEEP_int;
  logic [N_SOURCE_STREAMS-1:0]                             TLAST_int;
  logic [N_SOURCE_STREAMS-1:0][STREAM_TID_SIZE  -1:0]      TID_int;
  logic [N_SOURCE_STREAMS-1:0][STREAM_TDEST_SIZE-1:0]      TDEST_int;
  logic [N_SOURCE_STREAMS-1:0][STREAM_TUSER_SIZE-1:0]      TUSER_int;
  stream_flags_t              stream_flags_int;

  logic [N_SOURCE_STREAMS-1:0][STREAM_BE_SIZE   -1:0]      TSTRB_queue;
  logic [N_SOURCE_STREAMS-1:0][STREAM_BE_SIZE   -1:0]      TKEEP_queue;
  logic [N_SOURCE_STREAMS-1:0]                             TLAST_queue;
  logic [N_SOURCE_STREAMS-1:0][STREAM_TID_SIZE  -1:0]      TID_queue;
  logic [N_SOURCE_STREAMS-1:0][STREAM_TDEST_SIZE-1:0]      TDEST_queue;
  logic [N_SOURCE_STREAMS-1:0][STREAM_TUSER_SIZE-1:0]      TUSER_queue;
  stream_flags_t[N_SOURCE_STREAMS-1:0]               stream_flags_queue;

  // Internally Sampled
  logic [N_SOURCE_STREAMS-1:0][STREAM_TID_SIZE  -1:0]      TID_s;
  logic [N_SOURCE_STREAMS-1:0][STREAM_TDEST_SIZE-1:0]      TDEST_s;
  logic [N_SOURCE_STREAMS-1:0][STREAM_TUSER_SIZE-1:0]      TUSER_s;

  logic [N_SOURCE_STREAMS-1:0][CLUS_ADDR_WIDTH-1:0] gen_addr;
  logic [N_SOURCE_STREAMS-1:0]in_progress;


 // logic                [7:0]                 n_og_int;
  logic change_feat_int;
  

  assign fifo_gnt_o = FIFO_GNT_out;
  
  genvar i;
  
  
  

  // Context FIFO Used to store CONTEXT that will be executed in the sink and source engines
  
 hwpe_axi_fifo_earlystall #(
    .DATA_WIDTH(CLUS_DATA_WIDTH + STREAM_BE_SIZE + STREAM_BE_SIZE + 1 + STREAM_TID_SIZE + STREAM_TDEST_SIZE + STREAM_TUSER_SIZE + 4 ),
    .DATA_DEPTH(2),
    .LATCH_FIFO(LATCH_FIFO)
  ) source_fifo_i (
    .clk(clk),
    .rst_n(rst_n),

    // DATA_IN is wide port made of the concatenation of the following signals
    .data_in(   {tcdm_r_data_i[0], TSTRB_queue[0], TKEEP_queue[0], TLAST_queue[0], TID_queue[0], TDEST_queue[0], TUSER_queue[0], stream_flags_queue[0]} ),
    .valid_in(   tcdm_r_valid_i[0]  ),
    .grant_out(  FIFO_GNT_out[0]  ),

    // DATA_OUT is wide port made of the concatenation of the following signals
    .data_out({TDATA_o[0], TSTRB_o[0], TKEEP_o[0], TLAST_o[0], TID_o[0], TDEST_o[0], TUSER_o[0], stream_flags_o[0]}),
    .valid_out(TVALID_o[0]),
    .grant_in(TREADY_i[0])
  );
 
  generate
  for(i=1; i<N_SOURCE_STREAMS; i++)begin : source_fifo_gen
  hwpe_axi_fifo_earlystall #(
    .DATA_WIDTH(CLUS_DATA_WIDTH + STREAM_BE_SIZE + STREAM_BE_SIZE + 1 + STREAM_TID_SIZE + STREAM_TDEST_SIZE + STREAM_TUSER_SIZE + 4),
    .DATA_DEPTH(2),
    .LATCH_FIFO(LATCH_FIFO)
  ) source_fifo_i (
    .clk(clk),
    .rst_n(rst_n),

    // DATA_IN is wide port made of the concatenation of the following signals
    .data_in(   {tcdm_r_data_i[i], TSTRB_queue[i], TKEEP_queue[i], TLAST_queue[i], TID_queue[i], TDEST_queue[i], TUSER_queue[i], stream_flags_queue[i]} ),
    .valid_in(   tcdm_r_valid_i[i]  ),
    .grant_out(  FIFO_GNT_out[i]  ),

    // DATA_OUT is wide port made of the concatenation of the following signals
    .data_out({TDATA_o[i], TSTRB_o[i], TKEEP_o[i], TLAST_o[i], TID_o[i], TDEST_o[i], TUSER_o[i], stream_flags_o[i]}),
    .valid_out(TVALID_o[i]),
    .grant_in(TREADY_i[i])
  );
  end
  endgenerate

  logic [N_SOURCE_STREAMS-1:0] address_gen_inc;
  
  hwpe_axi_addressgen_sink #(
    .WORD_STRIDE       ( WORD_STRIDE      ),
    .N_SINK_STREAMS    ( N_SOURCE_STREAMS )
  ) addressgen_sink_i  (
    .clk               ( clk              ),
    .rst_n             ( rst_n            ),
    .en                ( address_gen_en   ),
    .address_gen_inc_i ( address_gen_inc  ),
    .stream_config_i   ( stream_config_i  ),
    .gen_addr_o        ( gen_addr         ),
    .in_progress_o     ( in_progress_o    ),
    .stream_flags_o_p  ( stream_flags_int ),
    .change_feat  ( change_feat_o )//,
    //.n_og_o            ( n_og_int         )
  );
  
  assign in_progress = {N_SOURCE_STREAMS{in_progress_o}};
  
  // always_comb
  //   address_gen_inc <= 1'b1;
/*
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
    .stream_flags_o    (stream_flags_int),
    .n_og_o            (n_og_o          )
  );
*/
  always_ff @(posedge clk, negedge rst_n)
  begin : fsm_seq
    if(rst_n == 1'b0) begin
      cs            <= IDLE;
    end
    else begin
      cs             <= ns;
    end
  end

  always_ff @(posedge clk or negedge rst_n)
  begin : done_source_ff
    if(rst_n == 1'b0)
      done_source_o <= {N_SOURCE_STREAMS{1'b0}};
    else
      done_source_o <= done_source_int;
  end

  always_comb
  begin : fsm_comb
    tcdm_req_o  = {N_SOURCE_STREAMS{1'b0}};
    tcdm_type_o = {N_SOURCE_STREAMS{`LOAD}};
    tcdm_add_o  = {N_SOURCE_STREAMS{'0}};
    tcdm_data_o = {N_SOURCE_STREAMS{'0}};
    tcdm_be_o   = {N_SOURCE_STREAMS{'0}};
    ready_start_source_o = {N_SOURCE_STREAMS{1'b0}};
    done_source_int = {N_SOURCE_STREAMS{1'b0}};
    TSTRB_int  = {N_SOURCE_STREAMS{'0}};
    TKEEP_int  = {N_SOURCE_STREAMS{'0}};
    TLAST_int  = {N_SOURCE_STREAMS{1'b0}};
    TID_int    = TID_s;
    TDEST_int  = TDEST_s;
    TUSER_int  = TUSER_s;
    ns         = cs;
    address_gen_inc = {N_SOURCE_STREAMS{1'b0}};
    address_gen_en = {N_SOURCE_STREAMS{1'b0}};
    case(cs)
      IDLE: begin
        ready_start_source_o = {N_SOURCE_STREAMS{1'b1}};
        if(&req_start_source_i) begin
          ns = SOURCE;
          address_gen_en = {N_SOURCE_STREAMS{1'b1}};
        end
        else begin
          ns = IDLE;
          address_gen_en = {N_SOURCE_STREAMS{1'b0}};
        end
        address_gen_inc = {N_SOURCE_STREAMS{1'b0}};
      end //~IDLE
      SOURCE: begin
        if(&FIFO_GNT_out) begin
          tcdm_req_o  = {N_SOURCE_STREAMS{1'b1}};
          if(&tcdm_gnt_i)
            address_gen_inc = {N_SOURCE_STREAMS{1'b1}};
          else
            address_gen_inc = {N_SOURCE_STREAMS{1'b0}};
        end
        else begin
          tcdm_req_o  = {N_SOURCE_STREAMS{1'b0}};
          address_gen_inc = {N_SOURCE_STREAMS{1'b0}};
        end
        tcdm_add_o  = gen_addr;
        tcdm_type_o = {N_SOURCE_STREAMS{`LOAD}};
        if(in_progress == {N_SOURCE_STREAMS{1'b1}})
          TLAST_int = {N_SOURCE_STREAMS{1'b0}};
        else
          TLAST_int = {N_SOURCE_STREAMS{1'b1}};
        TSTRB_int = {N_SOURCE_STREAMS{'1}};
        TKEEP_int = {N_SOURCE_STREAMS{'1}};
        if(&tcdm_gnt_i) begin
          if(in_progress == {N_SOURCE_STREAMS{1'b1}}) begin
            ns = SOURCE;
            address_gen_en = {N_SOURCE_STREAMS{1'b1}};
          end
          else begin
            done_source_int = {N_SOURCE_STREAMS{1'b1}};
            ns            = IDLE;
            address_gen_en = {N_SOURCE_STREAMS{1'b0}};
          end
        end
        else begin
          ns = SOURCE;
          address_gen_en = {N_SOURCE_STREAMS{1'b1}};
        end
      end//~SOURCE
      default: begin
        ns = IDLE;
        address_gen_en = {N_SOURCE_STREAMS{1'b0}};
      end
    endcase
  end

  always_ff @(posedge clk, negedge rst_n)
  begin : sampling_inputs_seq
    if(rst_n == 1'b0) begin
      TID_s   <= {N_SOURCE_STREAMS{'0}};
      TDEST_s <= {N_SOURCE_STREAMS{'0}};
      TUSER_s <= {N_SOURCE_STREAMS{'0}};
    end
    else begin
      TID_s   <= cfg_TID_i;
      TDEST_s <= cfg_TDEST_i;
      TUSER_s <= cfg_TUSER_i;
    end
  end

  always_ff @(posedge clk, negedge rst_n)
  begin : sampling_internal_signals_seq
    if(rst_n == 1'b0) begin
      TSTRB_queue <= {N_SOURCE_STREAMS{'0}};
      TKEEP_queue <= {N_SOURCE_STREAMS{'0}};
      TLAST_queue <= {N_SOURCE_STREAMS{1'b0}};
      TID_queue   <= {N_SOURCE_STREAMS{'0}};
      TDEST_queue <= {N_SOURCE_STREAMS{'0}};
      TUSER_queue <= {N_SOURCE_STREAMS{'0}};
      stream_flags_queue <= {N_SOURCE_STREAMS{0}};
    end
    else begin
      TSTRB_queue <= {N_SOURCE_STREAMS{TSTRB_int}};
      TKEEP_queue <= {N_SOURCE_STREAMS{TKEEP_int}};
      TLAST_queue <= {N_SOURCE_STREAMS{TLAST_int}};
      TID_queue   <= {N_SOURCE_STREAMS{TID_int}};
      TDEST_queue <= {N_SOURCE_STREAMS{TDEST_int}};
      TUSER_queue <= {N_SOURCE_STREAMS{TUSER_int}};
      stream_flags_queue <= {N_SOURCE_STREAMS{stream_flags_int}};
    end
  end

endmodule
