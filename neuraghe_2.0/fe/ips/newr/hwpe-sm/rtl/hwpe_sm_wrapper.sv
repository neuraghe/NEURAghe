/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           hwpe_sm_wrapper.sv                                         *
 * Description:    Top module of the HWPE wrapper for HLS HWPEs               *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"

module hwpe_sm_wrapper
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
  // CatC interface params
  parameter CATC_ADDR_WIDTH     = 32,
  parameter CATC_DATA_WIDTH     = 32,
  parameter CATC_BE_WIDTH       = CATC_DATA_WIDTH/8,
  // Register file params
  parameter N_IO_REGS           = 2,
  parameter N_GENERIC_REGS      = 0,
  // Controller params
  parameter [N_ACCELERATOR_PORT-1:0]                   [7:0] NS_INTERLEAVED      = '{1},
  parameter [N_ACCELERATOR_PORT-1:0]                   [7:0] IDS_INTERLEAVED     = '{-1},
  parameter                                            [7:0] PORT_SHARING_RATIO  = 1,
  parameter [N_MASTER_PORT-1:0][PORT_SHARING_RATIO-1:0][7:0] IDS_PORTSHARED      = '{'{0}}
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
  output logic                                               evt_interrupt_o,

  // Catapult-C Side
  // Accelerator clock (from clock divider)
  output logic                                               catc_clk_div,
  // Accelerator control flow
  output logic                                               catc_start_o,
  input  logic                                               catc_done_i,
  output logic                                               catc_en_o,

  // Catapult C Port - CATC Protocol
  // Request side - INIT
  input  logic [N_ACCELERATOR_PORT-1:0]                      catc_cs_n_i,
  output logic [N_ACCELERATOR_PORT-1:0]                      catc_wait_n_o,
  input  logic [N_ACCELERATOR_PORT-1:0]                      catc_type_i,
  input  logic [N_ACCELERATOR_PORT-1:0][CATC_ADDR_WIDTH-1:0] catc_addr_i,
  input  logic [N_ACCELERATOR_PORT-1:0][CATC_BE_WIDTH-1:0]   catc_be_i,
  input  logic [N_ACCELERATOR_PORT-1:0][CATC_DATA_WIDTH-1:0] catc_wdata_i,
  output logic [N_ACCELERATOR_PORT-1:0][CATC_DATA_WIDTH-1:0] catc_rdata_o
);

  regfile_t reg_file;
  logic is_working;
  logic enable;
  logic done_ctrl;

  logic [N_MASTER_PORT-1:0][15:0] stall_counter;
  logic [N_MASTER_PORT-1:0][15:0] req_counter;
  logic [N_MASTER_PORT-1:0][15:0] cycle_counter;

  logic                           catc_start_int;
  logic                           catc_en_int;

  always_ff @(posedge clk or negedge rst_n)
  begin
    if (rst_n == 0) begin
      cfg_r_ID_o    <= 0;
      cfg_r_valid_o <= 0;
    end
    else begin
      if (cfg_req_i == 1) begin
        cfg_r_ID_o    <= cfg_ID_i;
        cfg_r_valid_o <= 1;
      end
      else begin
        cfg_r_valid_o <= 0;
      end
    end
  end

  hwpe_sm_slave #(
    .N_CONTEXT      (N_CONTEXT     ),
    .CFG_ADDR_WIDTH (CFG_ADDR_WIDTH),
    .CFG_DATA_WIDTH (CFG_DATA_WIDTH),
    .CFG_BE_WIDTH   (CFG_BE_WIDTH  ),
    .CFG_ID_WIDTH   (CFG_ID_WIDTH  ),
    .N_IO_REGS      (N_IO_REGS     ),
    .N_GENERIC_REGS (N_GENERIC_REGS)
  )
  slave_i (
    .clk             (clk              ),
    .rst_n           (rst_n            ),
    .data_req_i      (cfg_req_i        ),
    .data_add_i      (cfg_add_i[CFG_ADDR_WIDTH+2-1:2]),
    .data_type_i     (cfg_type_i       ),
    .data_wdata_i    (cfg_data_i       ),
    .data_ID_i       (cfg_ID_i         ),
    .data_r_rdata_o  (cfg_r_data_o     ),
    .done            (done_ctrl        ),
    .start_cs        (catc_start_int   ),
    .reg_file        (reg_file         ),
    .evt_interrupt_o (evt_interrupt_o  ),
    .is_working      (is_working       ),
    .enable          (enable           )
  );

   assign cfg_gnt_o = cfg_req_i;

  hwpe_sm_controller #(
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
    // Controller params
    .NS_INTERLEAVED     (NS_INTERLEAVED    ),
    .IDS_INTERLEAVED    (IDS_INTERLEAVED   ),
    .PORT_SHARING_RATIO (PORT_SHARING_RATIO),
    .IDS_PORTSHARED     (IDS_PORTSHARED    )
  ) controller_i (
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    .tcdm_req_o     (tcdm_req_o    ),
    .tcdm_gnt_i     (tcdm_gnt_i    ),
    .tcdm_add_o     (tcdm_add_o    ),
    .tcdm_type_o    (tcdm_type_o   ),
    .tcdm_be_o      (tcdm_be_o     ),
    .tcdm_data_o    (tcdm_data_o   ),
    .tcdm_r_data_i  (tcdm_r_data_i ),
    .tcdm_r_valid_i (tcdm_r_valid_i),
    .catc_en_o      (catc_en_int   ),
    .catc_done_i    (catc_done_i   ),
    .catc_cs_n_i    (catc_cs_n_i   ),
    .catc_wait_n_o  (catc_wait_n_o ),
    .catc_type_i    (catc_type_i   ),
    .catc_addr_i    (catc_addr_i   ),
    .catc_be_i      (catc_be_i     ),
    .catc_wdata_i   (catc_wdata_i  ),
    .catc_rdata_o   (catc_rdata_o  ),
    .reg_file       (reg_file      ),
    .is_working     (is_working    ),
    .done_ctrl      (done_ctrl     )
  );

  always_ff @(posedge clk or negedge rst_n)
  begin
    if(rst_n==1'b0) begin
      for(int i=0; i<N_MASTER_PORT; i++) begin
        stall_counter[i] <= 0;
        cycle_counter[i] <= 0;
        req_counter  [i] <= 0;
      end
    end
    else begin
      for(int i=0; i<N_MASTER_PORT; i++) begin
        if((tcdm_req_o[i]==1'b1) && (tcdm_gnt_i[i]==1'b0))
          stall_counter[i] <= stall_counter[i] + 1;
        if(is_working==1'b1)
          cycle_counter[i] <= cycle_counter[i] + 1;
        if(tcdm_req_o[i]==1'b1)
          req_counter[i] <= req_counter[i] + 1;
      end
    end
  end

  // generate
  //   // if (CLK_DIVISION==0) begin
      always_comb begin
  //       catc_wdata_int <= catc_wdata_i;
  //       catc_be_int    <= catc_be_i;
  //       catc_add_int   <= catc_addr_i;
  //       catc_cs_n_int  <= catc_cs_n_i;
  //       catc_type_int  <= catc_type_i;
  //       catc_wait_n_o  <= catc_wait_n_int;
        catc_en_o      <= catc_en_int & catc_wait_n_o;
        catc_start_o   <= catc_start_int;
  //       catc_done_int  <= catc_done_i;
  //       catc_rdata_o   <= catc_rdata_int;
        catc_clk_div   <= clk;
      end
  //   // end
  //   // else begin
  //   // TODO: convert from VHDL the following clk division code
  //   // end
  // endgenerate

endmodule
