`ifndef HWPE_AXI_PARAMS
`define HWPE_AXI_PARAMS

`ifndef    log2
    `define log2(VALUE) ( (VALUE) == ( 1 ) ? 0 : (VALUE) < ( 2 ) ? 1 : (VALUE) < ( 4 ) ? 2 : (VALUE)< (8) ? 3:(VALUE) < ( 16 )  ? 4 : (VALUE) < ( 32 )  ? 5 : (VALUE) < ( 64 )  ? 6 : (VALUE) < ( 128 ) ? 7 : (VALUE) < ( 256 ) ? 8 : (VALUE) < ( 512 ) ? 9 : (VALUE) < ( 1024 ) ? 10 : (VALUE) < ( 2048 ) ? 11: (VALUE) < ( 4096 ) ? 12 : (VALUE) < ( 8192 ) ? 13 : (VALUE) < ( 16384 ) ? 14 : (VALUE) < ( 32768 ) ? 15 : (VALUE) < ( 65536 ) ? 16 : (VALUE) < ( 131072 ) ? 17 : (VALUE) < ( 262144 ) ? 18 : (VALUE) < ( 524288 ) ? 19 :  (VALUE) < ( 1048576 ) ? 20 : -1)
`endif

`define INT_DIV(A,B) ((A - (int' (A/B))* B > 0) ? int' (A/B) +1  : int' (A/B))

// sets clock phase for latch-based implementation
`define LATCH_CLK_PHASE 1'b0

`define   STREAM_DATA_SIZE           32
`define   STREAM_BE_SIZE             (`STREAM_DATA_SIZE/8)
`define   STREAM_TID_SIZE            1
`define   STREAM_TDEST_SIZE          1
`define   STREAM_TUSER_SIZE          4
`define   STREAM_COUNTER_BITS 16

// Master Port Count Per Sink and  Source
`define   N_MASTER_PORT_PER_SINK     1
`define   N_MASTER_PORT_PER_SOURCE   1
`define   N_SINK_PORT                1
`define   N_SOURCE_PORT              1

// `ifndef      LOAD
  `define LOAD  1'b0
// `endif

// `ifndef      STORE
  `define STORE 1'b1
// `endif

`define PACKET_CNT_MAX_WIDTH   10

typedef struct packed {
 logic [31:0] base_addr;
 logic [31:0] trans_size;
 logic [15:0] line_stride;
 logic [15:0] line_length;
 logic [15:0] feat_stride;
 logic [15:0] feat_length;
} stream_config_t;

typedef struct packed {
 logic word_update;
 logic line_update;
 logic feat_update;
 logic in_progress;
} stream_flags_t;

`endif
