/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           hwpe_axi_wrapper.sv                                        *
 * Description:    Top module of the AXI-Stream HWPE wrapper                  *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"
`include "hwpe_axi_params.sv"

module hwpe_axi_wrapper
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
  parameter N_GENERIC_REGS      = 0,
  parameter SOURCE_FIFO_DEPTH   = 2,
  parameter SINK_FIFO_DEPTH     = 2,
  parameter WORD_STRIDE         = 4
)
(
  input  logic                                                clk,
  input  logic                                                rst_n,

  // Cluster side - TCDM LINT protocol
  // Request side - INIT
  output logic [N_MASTER_PORT-1:0]                            tcdm_req_o,
  input  logic [N_MASTER_PORT-1:0]                            tcdm_gnt_i,
  output logic [N_MASTER_PORT-1:0] [CLUS_ADDR_WIDTH-1:0]      tcdm_add_o,
  output logic [N_MASTER_PORT-1:0]                            tcdm_type_o,
  output logic [N_MASTER_PORT-1:0] [CLUS_BE_WIDTH  -1:0]      tcdm_be_o,
  output logic [N_MASTER_PORT-1:0] [CLUS_DATA_WIDTH-1:0]      tcdm_data_o,
  // Response side  - INIT
  input  logic [N_MASTER_PORT-1:0] [CLUS_DATA_WIDTH-1:0]      tcdm_r_data_i,
  input  logic [N_MASTER_PORT-1:0]                            tcdm_r_valid_i,

  // Configuration Port - PERIPH INTC Protocol
  // Request side - TARGET
  input  logic                                                cfg_req_i,
  output logic                                                cfg_gnt_o,
  input  logic [CLUS_ADDR_WIDTH-1:0]                          cfg_add_i,
  input  logic                                                cfg_type_i,
  input  logic [CFG_BE_WIDTH   -1:0]                          cfg_be_i,
  input  logic [CFG_DATA_WIDTH -1:0]                          cfg_data_i,
  input  logic [CFG_ID_WIDTH   -1:0]                          cfg_ID_i,
  // Response side - TARGET
  output logic                                                cfg_r_valid_o,
  output logic [CFG_DATA_WIDTH -1:0]                          cfg_r_data_o,
  output logic [CFG_ID_WIDTH   -1:0]                          cfg_r_ID_o,

  // Event (low-priority interrupt) line
  output logic                                                evt_interrupt_o,

  // AXI-Stream HWPE side
  // Sink side - INIT
  input  logic [N_SINK_STREAMS-1:0]                           axi_sink_TVALID_i,
  output logic [N_SINK_STREAMS-1:0]                           axi_sink_TREADY_o,
  input  logic [N_SINK_STREAMS-1:0]   [STREAM_DATA_SIZE -1:0] axi_sink_TDATA_i,
  input  logic [N_SINK_STREAMS-1:0]   [STREAM_BE_SIZE   -1:0] axi_sink_TSTRB_i,
  input  logic [N_SINK_STREAMS-1:0]   [STREAM_BE_SIZE   -1:0] axi_sink_TKEEP_i,
  input  logic [N_SINK_STREAMS-1:0]                           axi_sink_TLAST_i,
  input  logic [N_SINK_STREAMS-1:0]   [STREAM_TID_SIZE  -1:0] axi_sink_TID_i,
  input  logic [N_SINK_STREAMS-1:0]   [STREAM_TDEST_SIZE-1:0] axi_sink_TDEST_i,
  input  logic [N_SINK_STREAMS-1:0]   [STREAM_TUSER_SIZE-1:0] axi_sink_TUSER_i,
  // Source side - INIT
  output logic [N_SOURCE_STREAMS-1:0]                         axi_source_TVALID_o,
  input  logic [N_SOURCE_STREAMS-1:0]                         axi_source_TREADY_i,
  output logic [N_SOURCE_STREAMS-1:0] [STREAM_DATA_SIZE -1:0] axi_source_TDATA_o,
  output logic [N_SOURCE_STREAMS-1:0] [STREAM_BE_SIZE   -1:0] axi_source_TSTRB_o,
  output logic [N_SOURCE_STREAMS-1:0] [STREAM_BE_SIZE   -1:0] axi_source_TKEEP_o,
  output logic [N_SOURCE_STREAMS-1:0]                         axi_source_TLAST_o,
  output logic [N_SOURCE_STREAMS-1:0] [STREAM_TID_SIZE  -1:0] axi_source_TID_o,
  output logic [N_SOURCE_STREAMS-1:0] [STREAM_TDEST_SIZE-1:0] axi_source_TDEST_o,
  output logic [N_SOURCE_STREAMS-1:0] [STREAM_TUSER_SIZE-1:0] axi_source_TUSER_o,

  output logic [N_GENERIC_REGS-1:0]  [`STRUCT_DATA_WIDTH-1:0] generic_params_o

);

  localparam N_STREAMS = N_SOURCE_STREAMS + N_SINK_STREAMS;

  regfile_t reg_file;
  logic is_working;
  logic enable;
  logic done_ctrl;
  logic req_start;
  logic ready_start [N_STREAMS-1:0];
  logic done_stream [N_STREAMS-1:0];

  logic [STREAM_TID_SIZE  -1:0]  cfg_TID;
  logic [STREAM_TDEST_SIZE-1:0]  cfg_TDEST;
  logic [STREAM_TUSER_SIZE-1:0]  cfg_TUSER;

  logic                          catc_start_int;   // FIXME unconnected

`ifndef AXI_OPTIONAL
  always_comb
  begin
    cfg_TID   <= 0;
    cfg_TDEST <= 0;
    cfg_TUSER <= 0;
  end
`endif
   
  assign cfg_gnt_o = 1'b1;
//cfg_req_i;

  stream_config_t stream_config [N_STREAMS-1:0];
  genvar i;
  generate
     for(i=0; i<N_STREAMS; i++) begin : stream_cfg_gen
        assign stream_config[i].base_addr   = reg_file.hwpe_params[i*4+0][31: 0];
	assign stream_config[i].trans_size  = reg_file.hwpe_params[i*4+1][31: 0];
	assign stream_config[i].line_stride = reg_file.hwpe_params[i*4+2][31:16];
	assign stream_config[i].line_length = reg_file.hwpe_params[i*4+2][15: 0];
	assign stream_config[i].feat_stride = reg_file.hwpe_params[i*4+3][31:16];
	assign stream_config[i].feat_length = reg_file.hwpe_params[i*4+3][15: 0];
     end
  endgenerate

   generate
      for (i=0; i<N_GENERIC_REGS; i++)
	begin
	   assign generic_params_o[i][31:0] = reg_file.generic_params[i][31:0];
	end
   endgenerate

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

  logic [N_STREAMS-1:0] done_stream_r;
  always_ff @(posedge clk or negedge rst_n)
  begin
    if (rst_n == 1'b0)
      done_stream_r <= 0;
    else begin
      for (int j=0; j<N_STREAMS; j++) begin
        if(done_ctrl == 1'b1)
          done_stream_r[j] <= 1'b0;
        else if(done_stream[j] == 1'b1) begin
          done_stream_r[j] <= 1'b1;
        end
      end
    end
  end

  assign done_ctrl = (&done_stream_r) & is_working;

  logic started;
  logic ready_tmp;
  always_ff @(posedge clk or negedge rst_n)
  begin
    if (rst_n==1'b0) begin
      req_start <= 1'b0;
      started   <= 1'b0;
    end
    else begin
      if ((is_working==1'b1) && (started==1'b0)) begin
        ready_tmp = 1'b1;
        for (int j=0; j<N_STREAMS; j++) begin
          ready_tmp = ready_tmp & ready_start[j];
        end
        if(ready_tmp == 1'b1) begin
          req_start <= 1'b1;
          started   <= 1'b1;
        end
        else begin
          req_start <= 1'b0;
          started   <= 1'b0;
        end
      end
      else if ((is_working==1'b1) && (started==1'b1)) begin
        req_start <= 1'b0;
        if(done_ctrl == 1'b1) begin
          started   <= 1'b0;
        end
        else begin
          started   <= 1'b1;
        end
      end
      else begin
        req_start <= 1'b0;
        started   <= 1'b0;
      end
    end
  end

  hwpe_sm_slave
    #(
      .N_CONTEXT      (N_CONTEXT     ),
      .CFG_ADDR_WIDTH (CFG_ADDR_WIDTH),
      .CFG_DATA_WIDTH (CFG_DATA_WIDTH),
      .CFG_BE_WIDTH   (CFG_BE_WIDTH  ),
      .CFG_ID_WIDTH   (CFG_ID_WIDTH  ),
      .N_IO_REGS      (N_STREAMS*4   ),
      .N_GENERIC_REGS (N_GENERIC_REGS)
      )
   u_slave
     (
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

  generate
    for(i=0; i<N_SINK_STREAMS; i++) begin : sink_gen
      hwpe_axi_sink
	#(
          .CLUS_ADDR_WIDTH   (CLUS_ADDR_WIDTH  ),
          .CLUS_DATA_WIDTH   (CLUS_DATA_WIDTH  ),
          .CLUS_BE_WIDTH     (CLUS_BE_WIDTH    ),
          .STREAM_DATA_SIZE  (STREAM_DATA_SIZE ),
          .STREAM_BE_SIZE    (STREAM_BE_SIZE   ),
          .STREAM_TID_SIZE   (STREAM_TID_SIZE  ),
          .STREAM_TDEST_SIZE (STREAM_TDEST_SIZE),
          .STREAM_TUSER_SIZE (STREAM_TUSER_SIZE),
	  .FIFO_DEPTH        (SINK_FIFO_DEPTH  ),
	  .WORD_STRIDE       (WORD_STRIDE      )
	  )
       u_sink
	 (
	  .clk                (clk                  ),
	  .rst_n              (rst_n                ),
	  .tcdm_req_o         (tcdm_req_o        [i]),
	  .tcdm_gnt_i         (tcdm_gnt_i        [i]),
	  .tcdm_add_o         (tcdm_add_o        [i]),
	  .tcdm_type_o        (tcdm_type_o       [i]),
	  .tcdm_be_o          (tcdm_be_o         [i]),
	  .tcdm_data_o        (tcdm_data_o       [i]),
	  .tcdm_r_data_i      (tcdm_r_data_i     [i]),
	  .tcdm_r_valid_i     (tcdm_r_valid_i    [i]),
	  .TVALID_i           (axi_sink_TVALID_i [i]),
	  .TREADY_o           (axi_sink_TREADY_o [i]),
	  .TDATA_i            (axi_sink_TDATA_i  [i]),
	  .TSTRB_i            (axi_sink_TSTRB_i  [i]),
	  .TKEEP_i            (axi_sink_TKEEP_i  [i]),
	  .TLAST_i            (axi_sink_TLAST_i  [i]),
	  .TID_i              (axi_sink_TID_i    [i]),
	  .TDEST_i            (axi_sink_TDEST_i  [i]),
	  .TUSER_i            (axi_sink_TUSER_i  [i]),
	  .stream_config_i    (stream_config     [i]),
	  .req_start_sink_i   (req_start            ),
	  .ready_start_sink_o (ready_start       [i]),
	  .done_sink_o        (done_stream       [i])
	  );
    end
     for(i=0; i<N_SOURCE_STREAMS; i++) begin : source_gen
	localparam k = i + N_SINK_STREAMS;
	hwpe_axi_source
	  #(
            .CLUS_ADDR_WIDTH   (CLUS_ADDR_WIDTH  ),
            .CLUS_DATA_WIDTH   (CLUS_DATA_WIDTH  ),
            .CLUS_BE_WIDTH     (CLUS_BE_WIDTH    ),
            .STREAM_DATA_SIZE  (STREAM_DATA_SIZE ),
            .STREAM_BE_SIZE    (STREAM_BE_SIZE   ),
            .STREAM_TID_SIZE   (STREAM_TID_SIZE  ),
            .STREAM_TDEST_SIZE (STREAM_TDEST_SIZE),
            .STREAM_TUSER_SIZE (STREAM_TUSER_SIZE),
      	    .FIFO_DEPTH        (SOURCE_FIFO_DEPTH),
	    .WORD_STRIDE       (WORD_STRIDE      )
	    )
	u_source
	  (
	   .clk                  (clk                    ),
	   .rst_n                (rst_n                  ),
	   .tcdm_req_o           (tcdm_req_o          [k]),
	   .tcdm_gnt_i           (tcdm_gnt_i          [k]),
	   .tcdm_add_o           (tcdm_add_o          [k]),
	   .tcdm_type_o          (tcdm_type_o         [k]),
	   .tcdm_be_o            (tcdm_be_o           [k]),
	   .tcdm_data_o          (tcdm_data_o         [k]),
	   .tcdm_r_data_i        (tcdm_r_data_i       [k]),
	   .tcdm_r_valid_i       (tcdm_r_valid_i      [k]),
	   .TVALID_o             (axi_source_TVALID_o [i]),
	   .TREADY_i             (axi_source_TREADY_i [i]),
	   .TDATA_o              (axi_source_TDATA_o  [i]),
	   .TSTRB_o              (axi_source_TSTRB_o  [i]),
	   .TKEEP_o              (axi_source_TKEEP_o  [i]),
	   .TLAST_o              (axi_source_TLAST_o  [i]),
	   .TID_o                (axi_source_TID_o    [i]),
	   .TDEST_o              (axi_source_TDEST_o  [i]),
	   .TUSER_o              (axi_source_TUSER_o  [i]),
	   .stream_config_i      (stream_config       [k]),
	   .cfg_TID_i            (cfg_TID                ),
	   .cfg_TDEST_i          (cfg_TDEST              ),
	   .cfg_TUSER_i          (cfg_TUSER              ),
	   .req_start_source_i   (req_start              ),
	   .ready_start_source_o (ready_start         [k]),
	   .done_source_o        (done_stream         [k])
	   );
     end
  endgenerate

endmodule
