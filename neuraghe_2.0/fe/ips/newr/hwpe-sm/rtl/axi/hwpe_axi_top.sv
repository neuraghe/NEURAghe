/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           hwpe_axi_top.sv                                            *
 * Description:    Template top module for shared-memory AXI-Stream HWPEs     *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"
`include "hwpe_axi_params.sv"

// `define ACCELERATOR_NAME boh

module hwpe_axi_top
#(
  // General params
  parameter N_MASTER_PORT       = 2,
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
  // Register file params
  parameter N_SOURCE_STREAMS    = 1,
  parameter N_SINK_STREAMS      = 1,
  parameter N_GENERIC_REGS      = 0
)
(
  input  logic                                               clk,
  input  logic                                               rst_n,

  // Cluster side - TCDM LINT protocol
  // Request side - INIT
  output logic [N_MASTER_PORT-1:0]                           tcdm_req_o,
  input  logic [N_MASTER_PORT-1:0]                           tcdm_gnt_i,
  output logic [N_MASTER_PORT-1:0][CLUS_ADDR_WIDTH-1:0]      tcdm_add_o,
  output logic [N_MASTER_PORT-1:0]                           tcdm_type_o,
  output logic [N_MASTER_PORT-1:0][CLUS_BE_WIDTH-1:0]        tcdm_be_o,
  output logic [N_MASTER_PORT-1:0][CLUS_DATA_WIDTH-1:0]      tcdm_data_o,
  // Response side  - INIT
  input  logic [N_MASTER_PORT-1:0][CLUS_DATA_WIDTH-1:0]      tcdm_r_data_i,
  input  logic [N_MASTER_PORT-1:0]                           tcdm_r_valid_i,

  // Configuration Port - PERIPH INTC Protocol
  // Request side - TARGET
  input  logic                                               cfg_req_i,
  output logic                                               cfg_gnt_o,
  input  logic [CLUS_ADDR_WIDTH-1:0]                         cfg_add_i,
  input  logic                                               cfg_type_i,
  input  logic [CFG_BE_WIDTH-1:0]                            cfg_be_i,
  input  logic [CFG_DATA_WIDTH-1:0]                          cfg_data_i,
  input  logic [CFG_ID_WIDTH-1:0]                            cfg_ID_i,
  // Response side  - TARGET
  output logic                                               cfg_r_valid_o,
  output logic [CFG_DATA_WIDTH-1:0]                          cfg_r_data_o,
  output logic [CFG_ID_WIDTH-1:0]                            cfg_r_ID_o,

  // Event (low-priority interrupt) line
  output logic                                               evt_interrupt_o
);

  logic [N_SINK_STREAMS-1:0]                           axi_sink_TVALID;
  logic [N_SINK_STREAMS-1:0]                           axi_sink_TREADY;
  logic [N_SINK_STREAMS-1:0]   [STREAM_DATA_SIZE -1:0] axi_sink_TDATA;
  logic [N_SINK_STREAMS-1:0]   [STREAM_BE_SIZE   -1:0] axi_sink_TSTRB;
  logic [N_SINK_STREAMS-1:0]   [STREAM_BE_SIZE   -1:0] axi_sink_TKEEP;
  logic [N_SINK_STREAMS-1:0]                           axi_sink_TLAST;
  logic [N_SINK_STREAMS-1:0]   [STREAM_TID_SIZE  -1:0] axi_sink_TID;
  logic [N_SINK_STREAMS-1:0]   [STREAM_TDEST_SIZE-1:0] axi_sink_TDEST;
  logic [N_SINK_STREAMS-1:0]   [STREAM_TUSER_SIZE-1:0] axi_sink_TUSER;
  logic [N_SOURCE_STREAMS-1:0]                         axi_source_TVALID;
  logic [N_SOURCE_STREAMS-1:0]                         axi_source_TREADY;
  logic [N_SOURCE_STREAMS-1:0] [STREAM_DATA_SIZE -1:0] axi_source_TDATA;
  logic [N_SOURCE_STREAMS-1:0] [STREAM_BE_SIZE   -1:0] axi_source_TSTRB;
  logic [N_SOURCE_STREAMS-1:0] [STREAM_BE_SIZE   -1:0] axi_source_TKEEP;
  logic [N_SOURCE_STREAMS-1:0]                         axi_source_TLAST;
  logic [N_SOURCE_STREAMS-1:0] [STREAM_TID_SIZE  -1:0] axi_source_TID;
  logic [N_SOURCE_STREAMS-1:0] [STREAM_TDEST_SIZE-1:0] axi_source_TDEST;
  logic [N_SOURCE_STREAMS-1:0] [STREAM_TUSER_SIZE-1:0] axi_source_TUSER;

  hwpe_axi_wrapper #(
    .N_MASTER_PORT      (N_MASTER_PORT     ),
    .N_CONTEXT          (N_CONTEXT         ),
    .CLUS_ADDR_WIDTH    (CLUS_ADDR_WIDTH   ),
    .CLUS_DATA_WIDTH    (CLUS_DATA_WIDTH   ),
    .CLUS_BE_WIDTH      (CLUS_BE_WIDTH     ),
    .CFG_ADDR_WIDTH     (CFG_ADDR_WIDTH    ),
    .CFG_DATA_WIDTH     (CFG_DATA_WIDTH    ),
    .CFG_BE_WIDTH       (CFG_BE_WIDTH      ),
    .CFG_ID_WIDTH       (CFG_ID_WIDTH      ),
    .STREAM_DATA_SIZE   (STREAM_DATA_SIZE  ),
    .STREAM_BE_SIZE     (STREAM_BE_SIZE    ),
    .STREAM_TID_SIZE    (STREAM_TID_SIZE   ),
    .STREAM_TDEST_SIZE  (STREAM_TDEST_SIZE ),
    .STREAM_TUSER_SIZE  (STREAM_TUSER_SIZE ),
    .N_SOURCE_STREAMS   (N_SOURCE_STREAMS  ),
    .N_SINK_STREAMS     (N_SINK_STREAMS    ),
    .N_GENERIC_REGS     (N_GENERIC_REGS    )
  ) axi_wrapper_i (
    .clk                 (clk               ),
    .rst_n               (rst_n             ),
    .tcdm_req_o          (tcdm_req_o        ),
    .tcdm_gnt_i          (tcdm_gnt_i        ),
    .tcdm_add_o          (tcdm_add_o        ),
    .tcdm_type_o         (tcdm_type_o       ),
    .tcdm_be_o           (tcdm_be_o         ),
    .tcdm_data_o         (tcdm_data_o       ),
    .tcdm_r_data_i       (tcdm_r_data_i     ),
    .tcdm_r_valid_i      (tcdm_r_valid_i    ),
    .cfg_req_i           (cfg_req_i         ),
    .cfg_gnt_o           (cfg_gnt_o         ),
    .cfg_add_i           (cfg_add_i         ),
    .cfg_type_i          (cfg_type_i        ),
    .cfg_be_i            (cfg_be_i          ),
    .cfg_data_i          (cfg_data_i        ),
    .cfg_ID_i            (cfg_ID_i          ),
    .cfg_r_valid_o       (cfg_r_valid_o     ),
    .cfg_r_data_o        (cfg_r_data_o      ),
    .cfg_r_ID_o          (cfg_r_ID_o        ),
    .evt_interrupt_o     (evt_interrupt_o   ),
    .axi_sink_TVALID_i   (axi_sink_TVALID   ),
    .axi_sink_TREADY_o   (axi_sink_TREADY   ),
    .axi_sink_TDATA_i    (axi_sink_TDATA    ),
    .axi_sink_TSTRB_i    (axi_sink_TSTRB    ),
    .axi_sink_TKEEP_i    (axi_sink_TKEEP    ),
    .axi_sink_TLAST_i    (axi_sink_TLAST    ),
    .axi_sink_TID_i      (axi_sink_TID      ),
    .axi_sink_TDEST_i    (axi_sink_TDEST    ),
    .axi_sink_TUSER_i    (axi_sink_TUSER    ),
    .axi_source_TVALID_o (axi_source_TVALID ),
    .axi_source_TREADY_i (axi_source_TREADY ),
    .axi_source_TDATA_o  (axi_source_TDATA  ),
    .axi_source_TSTRB_o  (axi_source_TSTRB  ),
    .axi_source_TKEEP_o  (axi_source_TKEEP  ),
    .axi_source_TLAST_o  (axi_source_TLAST  ),
    .axi_source_TID_o    (axi_source_TID    ),
    .axi_source_TDEST_o  (axi_source_TDEST  ),
    .axi_source_TUSER_o  (axi_source_TUSER  )
  );

  axi_hw_accel #(
    .STREAM_DATA_SIZE  (STREAM_DATA_SIZE ),
    .STREAM_BE_SIZE    (STREAM_BE_SIZE   ),
    .STREAM_TID_SIZE   (STREAM_TID_SIZE  ),
    .STREAM_TDEST_SIZE (STREAM_TDEST_SIZE),
    .STREAM_TUSER_SIZE (STREAM_TUSER_SIZE)
  ) axi_hw_accel_i (
    .clk             (clk                  ),
    .rst_n           (rst_n                ),
    .source_TVALID_i (axi_source_TVALID [0]),
    .source_TREADY_o (axi_source_TREADY [0]),
    .source_TDATA_i  (axi_source_TDATA  [0]),
    .source_TSTRB_i  (axi_source_TSTRB  [0]),
    .source_TKEEP_i  (axi_source_TKEEP  [0]),
    .source_TLAST_i  (axi_source_TLAST  [0]),
    .source_TID_i    (axi_source_TID    [0]),
    .source_TDEST_i  (axi_source_TDEST  [0]),
    .source_TUSER_i  (axi_source_TUSER  [0]),
    .sink_TVALID_o   (axi_sink_TVALID   [0]),
    .sink_TREADY_i   (axi_sink_TREADY   [0]),
    .sink_TDATA_o    (axi_sink_TDATA    [0]),
    .sink_TSTRB_o    (axi_sink_TSTRB    [0]),
    .sink_TKEEP_o    (axi_sink_TKEEP    [0]),
    .sink_TLAST_o    (axi_sink_TLAST    [0]),
    .sink_TID_o      (axi_sink_TID      [0]),
    .sink_TDEST_o    (axi_sink_TDEST    [0]),
    .sink_TUSER_o    (axi_sink_TUSER    [0])
  );

endmodule
