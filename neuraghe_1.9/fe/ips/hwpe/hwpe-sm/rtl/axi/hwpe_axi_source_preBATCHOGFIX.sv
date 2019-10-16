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
    output logic                       tcdm_req_o,
    input  logic                       tcdm_gnt_i,
    output logic [CLUS_ADDR_WIDTH-1:0] tcdm_add_o,
    output logic                       tcdm_type_o,
    output logic [CLUS_BE_WIDTH-1:0]   tcdm_be_o,
    output logic [CLUS_DATA_WIDTH-1:0] tcdm_data_o,
    input  logic [CLUS_DATA_WIDTH-1:0] tcdm_r_data_i,
    input  logic                       tcdm_r_valid_i,

    // AXI HWPE side
    output logic                         TVALID_o,
    input  logic                         TREADY_i,
    output logic [STREAM_DATA_SIZE -1:0] TDATA_o,
    output logic [STREAM_BE_SIZE   -1:0] TSTRB_o,
    output logic [STREAM_BE_SIZE   -1:0] TKEEP_o,
    output logic                         TLAST_o,
    output logic [STREAM_TID_SIZE  -1:0] TID_o,
    output logic [STREAM_TDEST_SIZE-1:0] TDEST_o,
    output logic [STREAM_TUSER_SIZE-1:0] TUSER_o,

    // From CFG regs
    input  stream_config_t               stream_config_i,
    output stream_flags_t                stream_flags_o,
    input  logic [STREAM_TID_SIZE  -1:0] cfg_TID_i,
    input  logic [STREAM_TDEST_SIZE-1:0] cfg_TDEST_i,
    input  logic [STREAM_TUSER_SIZE-1:0] cfg_TUSER_i,

    // Control signals
    output logic                         fifo_gnt_o,
    input  logic                         req_start_source_i,
    output logic                         ready_start_source_o,
    output logic                         done_source_o
);

  enum logic [1:0]  {IDLE, SOURCE, DONE}      cs, ns;

  logic  FIFO_GNT_out;
  logic done_source_int;
  logic address_gen_en;

  logic [STREAM_BE_SIZE   -1:0]      TSTRB_int;
  logic [STREAM_BE_SIZE   -1:0]      TKEEP_int;
  logic                              TLAST_int;
  logic [STREAM_TID_SIZE  -1:0]      TID_int;
  logic [STREAM_TDEST_SIZE-1:0]      TDEST_int;
  logic [STREAM_TUSER_SIZE-1:0]      TUSER_int;
  stream_flags_t               stream_flags_int;

  logic [STREAM_BE_SIZE   -1:0]      TSTRB_queue;
  logic [STREAM_BE_SIZE   -1:0]      TKEEP_queue;
  logic                              TLAST_queue;
  logic [STREAM_TID_SIZE  -1:0]      TID_queue;
  logic [STREAM_TDEST_SIZE-1:0]      TDEST_queue;
  logic [STREAM_TUSER_SIZE-1:0]      TUSER_queue;
  stream_flags_t               stream_flags_queue;

  // Internally Sampled
  logic [STREAM_TID_SIZE  -1:0]      TID_s;
  logic [STREAM_TDEST_SIZE-1:0]      TDEST_s;
  logic [STREAM_TUSER_SIZE-1:0]      TUSER_s;

  logic [CLUS_ADDR_WIDTH-1:0] gen_addr;
  logic in_progress;

  assign fifo_gnt_o = FIFO_GNT_out;

  // Context FIFO Used to store CONTEXT that will be executed in the sink and source engines
  hwpe_axi_fifo_earlystall #(
    .DATA_WIDTH(CLUS_DATA_WIDTH + STREAM_BE_SIZE + STREAM_BE_SIZE + 1 + STREAM_TID_SIZE + STREAM_TDEST_SIZE + STREAM_TUSER_SIZE + 4 ),
    .DATA_DEPTH(2),
    .LATCH_FIFO(LATCH_FIFO)
  ) source_fifo_i (
    .clk(clk),
    .rst_n(rst_n),

    // DATA_IN is wide port made of the concatenation of the following signals
    .data_in(   {tcdm_r_data_i, TSTRB_queue, TKEEP_queue, TLAST_queue, TID_queue, TDEST_queue, TUSER_queue, stream_flags_queue} ),
    .valid_in(   tcdm_r_valid_i  ),
    .grant_out(  FIFO_GNT_out  ),

    // DATA_OUT is wide port made of the concatenation of the following signals
    .data_out({TDATA_o, TSTRB_o, TKEEP_o, TLAST_o, TID_o, TDEST_o, TUSER_o, stream_flags_o}),
    .valid_out(TVALID_o),
    .grant_in(TREADY_i)
  );

  logic address_gen_inc;
  // always_comb
  //   address_gen_inc <= 1'b1;

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
    .stream_flags_o    (stream_flags_int)
  );

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
      done_source_o <= 1'b0;
    else
      done_source_o <= done_source_int;
  end

  always_comb
  begin : fsm_comb
    tcdm_req_o  = 1'b0;
    tcdm_type_o = `LOAD;
    tcdm_add_o  = '0;
    tcdm_data_o = '0;
    tcdm_be_o   = '0;
    ready_start_source_o = 1'b0;
    done_source_int = 1'b0;
    TSTRB_int  = '0;
    TKEEP_int  = '0;
    TLAST_int  = 1'b0;
    TID_int    = TID_s;
    TDEST_int  = TDEST_s;
    TUSER_int  = TUSER_s;
    ns         = cs;
    address_gen_inc = 1'b0;
    address_gen_en = 1'b0;
    case(cs)
      IDLE: begin
        ready_start_source_o = 1'b1;
        if(req_start_source_i) begin
          ns = SOURCE;
          address_gen_en = 1'b1;
        end
        else begin
          ns = IDLE;
          address_gen_en = 1'b0;
        end
        address_gen_inc = 1'b0;
      end //~IDLE
      SOURCE: begin
        if(FIFO_GNT_out) begin
          tcdm_req_o  = 1'b1;
          if(tcdm_gnt_i)
            address_gen_inc = 1'b1;
          else
            address_gen_inc = 1'b0;
        end
        else begin
          tcdm_req_o  = 1'b0;
          address_gen_inc = 1'b0;
        end
        tcdm_add_o  = gen_addr;
        tcdm_type_o = `LOAD;
        if(in_progress == 1'b1)
          TLAST_int = 1'b0;
        else
          TLAST_int = 1'b1;
        TSTRB_int = '1;
        TKEEP_int = '1;
        if(tcdm_gnt_i) begin
          if(in_progress == 1'b1) begin
            ns = SOURCE;
            address_gen_en = 1'b1;
          end
          else begin
            done_source_int = 1'b1;
            ns            = IDLE;
            address_gen_en = 1'b0;
          end
        end
        else begin
          ns = SOURCE;
          address_gen_en = 1'b1;
        end
      end//~SOURCE
      default: begin
        ns = IDLE;
        address_gen_en = 1'b0;
      end
    endcase
  end

  always_ff @(posedge clk, negedge rst_n)
  begin : sampling_inputs_seq
    if(rst_n == 1'b0) begin
      TID_s   <= '0;
      TDEST_s <= '0;
      TUSER_s <= '0;
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
      TSTRB_queue <= '0;
      TKEEP_queue <= '0;
      TLAST_queue <= 1'b0;
      TID_queue   <= '0;
      TDEST_queue <= '0;
      TUSER_queue <= '0;
      stream_flags_queue <= 0;
    end
    else begin
      TSTRB_queue <= TSTRB_int;
      TKEEP_queue <= TKEEP_int;
      TLAST_queue <= TLAST_int;
      TID_queue   <= TID_int;
      TDEST_queue <= TDEST_int;
      TUSER_queue <= TUSER_int;
      stream_flags_queue <= stream_flags_int;
    end
  end

endmodule
