/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           hwce_top.sv                                                *
 * Description:    HWCE top module                                            *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"
`include "hwpe_axi_params.sv"
`include "hwce_types.sv"

module hwce_top_wrap
#(
  // General params
  parameter N_MASTER_PORT       = 3,
  parameter N_CONTEXT           = 2,
  // Cluster interface params
  parameter CLUS_ADDR_WIDTH      = 32,
  parameter CLUS_DATA_WIDTH      = 32,
  parameter CLUS_BE_WIDTH        = CLUS_DATA_WIDTH/8,
  // Config interface params
  parameter CFG_ADDR_WIDTH      = 11,
  parameter CFG_DATA_WIDTH      = 32,
  parameter CFG_BE_WIDTH        = CFG_DATA_WIDTH/8,
  parameter CFG_ID_WIDTH        = 16,
  // AXI-Stream interface params
  parameter STREAM_DATA_SIZE    = `STREAM_DATA_SIZE,
  parameter STREAM_BE_SIZE      = `STREAM_BE_SIZE,
  parameter STREAM_TID_SIZE     = `STREAM_TID_SIZE,
  parameter STREAM_TDEST_SIZE   = `STREAM_TDEST_SIZE,
  parameter STREAM_TUSER_SIZE   = `STREAM_TUSER_SIZE,
  // Time multiplexing of multipliers
  parameter TIME_MUXING         = 1,
  // Linear convolution mode support
  parameter LINEAR_SUPPORTED    = 1,
  // Register file params
  parameter N_SOURCE_STREAMS    = 2,
  parameter N_SINK_STREAMS      = 1,
  parameter N_GENERIC_REGS      = 0,
  // Approximation params
  parameter FILTER_SIZE         = 5,
  parameter LINEBUFFER_WIDTH    = 32,
  parameter DEFAULT_QF          = 13,
  parameter APPROXIMATION       = 0,
  // Linebuffer implementation (0 is shift-reg, 1 is FIFO)
  parameter LINEBUFFER_KIND     = 0,
  // Latch-based implementation
  parameter LATCH_REGFILE       = 1,
  parameter LATCH_LINEBUFFER    = 1,
  parameter LATCH_FIFO          = 0,
  // Pipelining
  parameter PIPE_STAGES_SOP     = 0
)
(
  input  logic                                          clk,
  input  logic                                          rst_n,
  input  logic                                          test_mode,

  // Cluster side - TCDM LINT protocol
  // Request side - INIT
  output logic [N_MASTER_PORT-1:0]                      tcdm_req_o,
  input  logic [N_MASTER_PORT-1:0]                      tcdm_gnt_i,
  output logic [N_MASTER_PORT*CLUS_ADDR_WIDTH-1:0]      tcdm_add_o,
  output logic [N_MASTER_PORT-1:0]                      tcdm_type_o,
  output logic [N_MASTER_PORT*CLUS_BE_WIDTH-1:0]        tcdm_be_o,
  output logic [N_MASTER_PORT*CLUS_DATA_WIDTH-1:0]      tcdm_data_o,
  // Response side  - INIT
  input  logic [N_MASTER_PORT*CLUS_DATA_WIDTH-1:0]      tcdm_r_data_i,
  input  logic [N_MASTER_PORT-1:0]                      tcdm_r_valid_i,

  // Configuration Port - PERIPH INTC Protocol
  // Request side - TARGET
  input  logic                                          cfg_req_i,
  output logic                                          cfg_gnt_o,
  input  logic [CLUS_ADDR_WIDTH-1:0]                    cfg_add_i,
  input  logic                                          cfg_type_i,
  input  logic [CFG_BE_WIDTH-1:0]                       cfg_be_i,
  input  logic [CFG_DATA_WIDTH-1:0]                     cfg_data_i,
  input  logic [CFG_ID_WIDTH-1:0]                       cfg_ID_i,
  // Response side  - TARGET
  output logic                                          cfg_r_valid_o,
  output logic [CFG_DATA_WIDTH-1:0]                     cfg_r_data_o,
  output logic [CFG_ID_WIDTH-1:0]                       cfg_r_ID_o,

  // Event (low-priority interrupt) line
  output logic                                          evt_interrupt_o

`ifdef HWCE_POWER_ESTIMATION
  ,
  output logic phase_compute,
  output logic phase_preload,
  output logic phase_weightload,
  output logic phase_idle
`endif

);

  hwce_top #(
    .N_MASTER_PORT     (N_MASTER_PORT    ), 
    .N_CONTEXT         (N_CONTEXT        ), 
    .CLUS_ADDR_WIDTH   (CLUS_ADDR_WIDTH  ), 
    .CLUS_DATA_WIDTH   (CLUS_DATA_WIDTH  ), 
    .CLUS_BE_WIDTH     (CLUS_BE_WIDTH    ), 
    .CFG_ADDR_WIDTH    (CFG_ADDR_WIDTH   ), 
    .CFG_DATA_WIDTH    (CFG_DATA_WIDTH   ), 
    .CFG_BE_WIDTH      (CFG_BE_WIDTH     ), 
    .CFG_ID_WIDTH      (CFG_ID_WIDTH     ), 
    .STREAM_DATA_SIZE  (STREAM_DATA_SIZE ), 
    .STREAM_BE_SIZE    (STREAM_BE_SIZE   ), 
    .STREAM_TID_SIZE   (STREAM_TID_SIZE  ), 
    .STREAM_TDEST_SIZE (STREAM_TDEST_SIZE), 
    .STREAM_TUSER_SIZE (STREAM_TUSER_SIZE), 
    .N_SOURCE_STREAMS  (N_SOURCE_STREAMS ), 
    .N_SINK_STREAMS    (N_SINK_STREAMS   ), 
    .N_GENERIC_REGS    (N_GENERIC_REGS   ), 
    .FILTER_SIZE       (FILTER_SIZE      ), 
    .LINEBUFFER_WIDTH  (LINEBUFFER_WIDTH ), 
    .DEFAULT_QF        (DEFAULT_QF       ), 
    .LINEBUFFER_KIND   (LINEBUFFER_KIND  ), 
    .LATCH_REGFILE     (LATCH_REGFILE    ), 
    .LATCH_LINEBUFFER  (LATCH_LINEBUFFER ), 
    .LATCH_FIFO        (LATCH_FIFO       ), 
    .PIPE_STAGES_SOP   (PIPE_STAGES_SOP  ),
    .TIME_MUXING       (TIME_MUXING      ),
    .LINEAR_SUPPORTED  (LINEAR_SUPPORTED ) 
  ) hwce_top_i
  (
    .clk,
    .rst_n,
    .test_mode,
    .tcdm_req_o,
    .tcdm_gnt_i,
    .tcdm_add_o,
    .tcdm_type_o,
    .tcdm_be_o,
    .tcdm_data_o,
    .tcdm_r_data_i,
    .tcdm_r_valid_i,
    .cfg_req_i,
    .cfg_gnt_o,
    .cfg_add_i,
    .cfg_type_i,
    .cfg_be_i,
    .cfg_data_i,
    .cfg_ID_i,
    .cfg_r_valid_o,
    .cfg_r_data_o,
    .cfg_r_ID_o,
    .evt_interrupt_o
`ifdef HWCE_POWER_ESTIMATION
    ,
    .phase_compute,
    .phase_preload,
    .phase_weightload,
    .phase_idle
`endif
  );

endmodule

