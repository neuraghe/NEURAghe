/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           hwpe_sm_top.sv                                             *
 * Description:    Template top module for shared-memory HLS HWPEs            *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"

module hwpe_sm_top
#(
  // General params
  parameter BASE_ALIGNMENT_BIT  = 6,
  parameter N_MASTER_PORT       = 1,
  parameter N_ACCELERATOR_PORT  = 1,
  parameter N_CONTEXT           = 2,
  parameter CLK_DIVISION        = 0,
  // Cluster interface params
  parameter CLUS_ADDR_WIDTH      = 32,
  parameter CLUS_DATA_WIDTH      = 32,
  parameter CLUS_BE_WIDTH        = CLUS_DATA_WIDTH/8,
  // Config interface params
  parameter CFG_ADDR_WIDTH      = 11,
  parameter CFG_DATA_WIDTH      = 32,
  parameter CFG_BE_WIDTH        = CFG_DATA_WIDTH/8,
  parameter CFG_ID_WIDTH        = 16,
  // Register file params
  parameter N_IO_REGS           = 2,
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

  localparam CATC_ADDR_WIDTH = 32;
  localparam CATC_BE_WIDTH = 4;
  localparam CATC_DATA_WIDTH = 32;

  logic                                               catc_clk_div;
  logic                                               catc_start;
  logic                                               catc_done;
  logic                                               catc_en;
  logic [N_ACCELERATOR_PORT-1:0]                      catc_cs_n;
  logic [N_ACCELERATOR_PORT-1:0]                      catc_wait_n;
  logic [N_ACCELERATOR_PORT-1:0]                      catc_type;
  logic [N_ACCELERATOR_PORT-1:0][CATC_ADDR_WIDTH-1:0] catc_addr;
  logic [N_ACCELERATOR_PORT-1:0][CATC_BE_WIDTH-1:0]   catc_be;
  logic [N_ACCELERATOR_PORT-1:0][CATC_DATA_WIDTH-1:0] catc_wdata;
  logic [N_ACCELERATOR_PORT-1:0][CATC_DATA_WIDTH-1:0] catc_rdata;

  always_comb
  begin
    for(int i=0; i<N_ACCELERATOR_PORT; i++) begin
      catc_be[i] <= 4'hf;
    end
  end

  localparam [N_ACCELERATOR_PORT-1:0]                   [7:0] NS_INTERLEAVED     = `NS_INTERLEAVED;
  localparam [N_ACCELERATOR_PORT-1:0]                   [7:0] IDS_INTERLEAVED    = `IDS_INTERLEAVED;
  localparam                                            [7:0] PORT_SHARING_RATIO = `PORT_SHARING_RATIO;
  localparam [N_MASTER_PORT-1:0][PORT_SHARING_RATIO-1:0][7:0] IDS_PORTSHARED     = `IDS_PORTSHARED;

  hwpe_sm_wrapper #(
    .BASE_ALIGNMENT_BIT (BASE_ALIGNMENT_BIT),
    .N_MASTER_PORT      (N_MASTER_PORT     ),
    .N_ACCELERATOR_PORT (N_ACCELERATOR_PORT),
    .N_CONTEXT          (N_CONTEXT         ),
    .CLK_DIVISION       (CLK_DIVISION      ),
    .CLUS_ADDR_WIDTH    (CLUS_ADDR_WIDTH   ),
    .CLUS_DATA_WIDTH    (CLUS_DATA_WIDTH   ),
    .CLUS_BE_WIDTH      (CLUS_BE_WIDTH     ),
    .CFG_ADDR_WIDTH     (CFG_ADDR_WIDTH    ),
    .CFG_DATA_WIDTH     (CFG_DATA_WIDTH    ),
    .CFG_BE_WIDTH       (CFG_BE_WIDTH      ),
    .CFG_ID_WIDTH       (CFG_ID_WIDTH      ),
    .CATC_ADDR_WIDTH    (CATC_ADDR_WIDTH   ),
    .CATC_DATA_WIDTH    (CATC_DATA_WIDTH   ),
    .CATC_BE_WIDTH      (CATC_BE_WIDTH     ),
    .N_IO_REGS          (N_IO_REGS         ),
    .N_GENERIC_REGS     (N_GENERIC_REGS    ),
    .NS_INTERLEAVED     (NS_INTERLEAVED    ),
    .IDS_INTERLEAVED    (IDS_INTERLEAVED   ),
    .PORT_SHARING_RATIO (PORT_SHARING_RATIO),
    .IDS_PORTSHARED     (IDS_PORTSHARED    )
  ) sm_wrapper_i (
    .clk             (clk            ),
    .rst_n           (rst_n          ),
    .tcdm_req_o      (tcdm_req_o     ),
    .tcdm_gnt_i      (tcdm_gnt_i     ),
    .tcdm_add_o      (tcdm_add_o     ),
    .tcdm_type_o     (tcdm_type_o    ),
    .tcdm_be_o       (tcdm_be_o      ),
    .tcdm_data_o     (tcdm_data_o    ),
    .tcdm_r_data_i   (tcdm_r_data_i  ),
    .tcdm_r_valid_i  (tcdm_r_valid_i ),
    .cfg_req_i       (cfg_req_i      ),
    .cfg_gnt_o       (cfg_gnt_o      ),
    .cfg_add_i       (cfg_add_i      ),
    .cfg_type_i      (cfg_type_i     ),
    .cfg_be_i        (cfg_be_i       ),
    .cfg_data_i      (cfg_data_i     ),
    .cfg_ID_i        (cfg_ID_i       ),
    .cfg_r_valid_o   (cfg_r_valid_o  ),
    .cfg_r_data_o    (cfg_r_data_o   ),
    .cfg_r_ID_o      (cfg_r_ID_o     ),
    .evt_interrupt_o (evt_interrupt_o),
    .catc_clk_div    (catc_clk_div   ),
    .catc_start_o    (catc_start     ),
    .catc_done_i     (catc_done      ),
    .catc_en_o       (catc_en        ),
    .catc_cs_n_i     (catc_cs_n      ),
    .catc_wait_n_o   (catc_wait_n    ),
    .catc_type_i     (catc_type      ),
    .catc_addr_i     (catc_addr      ),
    .catc_be_i       (catc_be        ),
    .catc_wdata_i    (catc_wdata     ),
    .catc_rdata_o    (catc_rdata     )
  );

 `ifdef ACC_IDCT_1M
    idct_hwpu_1m catc_i (
      .clk             (catc_clk_div  ),
      .rst_n           (rst_n         ),
      .en              (catc_en       ),
      .start           (catc_start    ),
      .done            (catc_done     ),
      .rm_rsc_data_out (catc_wdata [0]),
      .rm_rsc_addr     (catc_addr  [0]),
      .rm_rsc_cs_n     (catc_cs_n  [0]),
      .rm_rsc_we       (catc_type  [0]),
      .rm_rsc_wait_n   (catc_wait_n[0]),
      .rm_rsc_data_in  (catc_rdata [0])
    );
  `elsif ACC_IDCT_4M
    idct_hwpu_4m catc_i (
      .clk                 (catc_clk_div   ),
      .rst_n               (rst_n          ),
      .en                  (catc_en        ),
      .start               (catc_start     ),
      .done                (catc_done      ),
      .rm_rsc_0_0_data_out (catc_wdata  [0]),
      .rm_rsc_0_0_addr     (catc_addr   [0]),
      .rm_rsc_0_0_cs_n     (catc_cs_n   [0]),
      .rm_rsc_0_0_we       (catc_type   [0]),
      .rm_rsc_0_0_wait_n   (catc_wait_n [0]),
      .rm_rsc_0_0_data_in  (catc_rdata  [0]),
      .rm_rsc_0_1_data_out (catc_wdata  [1]),
      .rm_rsc_0_1_addr     (catc_addr   [1]),
      .rm_rsc_0_1_cs_n     (catc_cs_n   [1]),
      .rm_rsc_0_1_we       (catc_type   [1]),
      .rm_rsc_0_1_wait_n   (catc_wait_n [1]),
      .rm_rsc_0_1_data_in  (catc_rdata  [1]),
      .rm_rsc_0_2_data_out (catc_wdata  [2]),
      .rm_rsc_0_2_addr     (catc_addr   [2]),
      .rm_rsc_0_2_cs_n     (catc_cs_n   [2]),
      .rm_rsc_0_2_we       (catc_type   [2]),
      .rm_rsc_0_2_wait_n   (catc_wait_n [2]),
      .rm_rsc_0_2_data_in  (catc_rdata  [2]),
      .rm_rsc_0_3_data_out (catc_wdata  [3]),
      .rm_rsc_0_3_addr     (catc_addr   [3]),
      .rm_rsc_0_3_cs_n     (catc_cs_n   [3]),
      .rm_rsc_0_3_we       (catc_type   [3]),
      .rm_rsc_0_3_wait_n   (catc_wait_n [3]),
      .rm_rsc_0_3_data_in  (catc_rdata  [3])
    );
  `endif

endmodule
