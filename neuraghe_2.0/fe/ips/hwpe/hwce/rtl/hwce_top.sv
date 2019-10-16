/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                 Gianfranco Deriu - gian.deriu@gmail.com                    *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           hwce_top.sv                                                *
 * Description:    HWCE top module                                            *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"
`include "hwpe_axi_params.sv"
`include "hwce_types.sv"

//`define POOLING //attivazione pooling
`define PIPE    //attivazione pipe
//combo funzionanti:
//pooling+pipe
//pipe
//niente

/* HWCE ports organization

 0 1 2 3  4 5 6 7  8 9 10 11 12 13 14 15 16 17 18 19
|<----->||<----->||<------------------------------->|
  y_out     y_in                  x
 0 1 2 3||0 1 2 3  4 5  6  7  8  9 10 11 12 13 14 15
  sinks                     sources    
  
*/


module hwce_top
#(
  // General params
  parameter N_MASTER_PORT       = 3,
  parameter N_CONTEXT           = 2,
  // Cluster interface params
  parameter CLUS_ADDR_WIDTH      = 32,
  parameter CLUS_DATA_WIDTH      = 32,
  parameter CLUS_BE_WIDTH        = CLUS_DATA_WIDTH/8,
  parameter BANK_SIZE            = 4096,
  parameter NB_BANKS_DSP         = 8,
  parameter BANK_SIZE_DSP_B      = 2048,
  parameter WEI_MEM_BANK_SIZE    = 512, //1024,
  parameter WEI_MEM_BANK_SIZE_16BIT = 2048,
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
  // Linear convolution mode support
  parameter LINEAR_SUPPORTED    = 1,
  // Register file params
  parameter N_SOURCE_STREAMS    = 2,
  parameter N_SINK_STREAMS      = 1,
  parameter N_GENERIC_REGS      = 0,
  // Approximation params
  parameter FILTER_SIZE         = 5,
  parameter LINEBUFFER_WIDTH    = 32,
  parameter QF                  = 13,
  parameter ACC_CONFIG          = 5,
  
  // Latch-based implementation
  parameter LATCH_REGFILE       = 0, 
  parameter LATCH_LINEBUFFER    = 1, // deprecated, unconnected
  parameter LATCH_FIFO          = 0,
  
  // Pipelining
  parameter PIPE_STAGES_SOP     = 1,
  
  parameter NPX                 = 4,
  parameter N_ROW               = 2,
  parameter N_COL               = 2,
  parameter N_ACCELERATOR_PORT  = 8,
  parameter NPF                 = 3, // number of parallel filters
  parameter CONV_WIDTH          = 16
)
(
  input  logic                                          clk_i,
  input  logic                                          clk_fast_i,
  input  logic                                          clk_wmem_i,
  input  logic                                          rst_n,
  input  logic                                          test_mode,

  // Cluster side - TCDM LINT protocol
  // Request side - INIT
  output logic [N_MASTER_PORT-1:0][NPX-1:0]                      tcdm_req_o,
  input  logic [N_MASTER_PORT-1:0][NPX-1:0]                      tcdm_gnt_i,
  output logic [N_MASTER_PORT-1:0][NPX-1:0][CLUS_ADDR_WIDTH-1:0] tcdm_add_o,
  output logic [N_MASTER_PORT-1:0][NPX-1:0]                      tcdm_type_o,
  output logic [N_MASTER_PORT-1:0][NPX-1:0][CLUS_BE_WIDTH-1:0]   tcdm_be_o,
  output logic [N_MASTER_PORT-1:0][NPX-1:0][CLUS_DATA_WIDTH-1:0] tcdm_data_o,
  // Response side  - INIT
  input  logic [N_MASTER_PORT-1:0][NPX-1:0][CLUS_DATA_WIDTH-1:0] tcdm_r_data_i,
  input  logic [N_MASTER_PORT-1:0][NPX-1:0]                      tcdm_r_valid_i,


  XBAR_TCDM_BUS_64BIT.Slave                             dma_mem_bus [2-1:0],


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

  localparam WL_ADDR_WIDTH = 32;
  localparam WL_BE_WIDTH = 4;
  localparam WL_DATA_WIDTH = 32;
  
  localparam WL_PORTS = N_ROW * N_COL;

  logic [3:0]                        wl_start_delayed;
  logic                              wl_start_engine;
  logic                              wl_start_weight;
  logic                              wl_done;
  logic                              wl_en;
  logic [N_ACCELERATOR_PORT-1:0]                      wl_tcdm_req;
  logic [N_ACCELERATOR_PORT-1:0]                      wl_tcdm_wait_n;
  logic [N_ACCELERATOR_PORT-1:0]                      wl_tcdm_type;
  logic [N_ACCELERATOR_PORT-1:0][WL_ADDR_WIDTH-1:0] wl_tcdm_addr;
  logic [N_ACCELERATOR_PORT-1:0][WL_BE_WIDTH-1:0]   wl_tcdm_be;
  logic [N_ACCELERATOR_PORT-1:0][WL_DATA_WIDTH-1:0] wl_tcdm_wdata;
  logic [N_ACCELERATOR_PORT-1:0][WL_DATA_WIDTH-1:0] wl_tcdm_rdata;

  logic [15:0]                       weight_size;
  logic [15:0]                       weight_mask;
  logic [N_ROW-1:0][N_COL-1:0][FILTER_SIZE*FILTER_SIZE * NPF-1:0][CONV_WIDTH-1:0]            weights;
  logic [3:0]                        qf;
  logic                              precision8;
  logic                              signed_mul;
  logic [15:0]                       nfeat;
  logic                              linear_conv;
  stream_config_t [N_ROW*2+NPF*N_COL-1:0]              stream_config;
  stream_flags_t  [N_ROW*2+NPF*N_COL-1:0]              stream_flags;

  logic [3:0]                        engine_state;
  logic                              engine_start;

  logic                              hwce_working;

  engine_params_t engine_params;

  logic                                                axi_clear;
  logic                                                axi_done_preload;
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
  logic [N_SOURCE_STREAMS-1:0][NPX-1:0][STREAM_DATA_SIZE -1:0] axi_source_TDATA;
  logic [N_SOURCE_STREAMS-1:0] [STREAM_BE_SIZE   -1:0] axi_source_TSTRB;
  logic [N_SOURCE_STREAMS-1:0] [STREAM_BE_SIZE   -1:0] axi_source_TKEEP;
  logic [N_SOURCE_STREAMS-1:0]                         axi_source_TLAST;
  logic [N_SOURCE_STREAMS-1:0] [STREAM_TID_SIZE  -1:0] axi_source_TID;
  logic [N_SOURCE_STREAMS-1:0] [STREAM_TDEST_SIZE-1:0] axi_source_TDEST;
  logic [N_SOURCE_STREAMS-1:0] [STREAM_TUSER_SIZE-1:0] axi_source_TUSER;
  
  logic [WL_PORTS-1:0][STREAM_DATA_SIZE -1:0]          axi_source_WDATA;
  
  logic [15:0]                                         linebuf_length;


  
  logic                           sum_over_constant;
  logic                           rectifier_activ;
  logic [N_ROW-1:0][CONV_WIDTH-1:0]               bias;
  logic [8-1:0]            ws_size_B;

///////////////////////////////////////POOLING///////////////////////////////////////////////////////////

  logic                                              done_preload;
  logic[1:0]                                         method_pooling;
  logic[15:0]                                        half_image_width_o;
  logic[15:0]                                        feat_height;
  
  logic[1:0]                                             pooling_HW;
  
  logic [N_ROW-1:0]                                        axi_sink_p_TVALID; 
  logic [N_ROW-1:0]                                        axi_sink_p_TREADY;
  logic [N_ROW-1:0][NPX-1:0][CLUS_DATA_WIDTH-1:0]                  axi_sink_p_TDATA;
  logic [N_ROW-1:0] [STREAM_BE_SIZE   -1:0]                axi_sink_p_TSTRB;              
  logic [N_ROW-1:0] [STREAM_BE_SIZE   -1:0]                axi_sink_p_TKEEP;
  
  logic [N_ROW-1:0]                                        axi_sink_pi_TVALID; 
  logic [N_ROW-1:0]                                        axi_sink_pi_TREADY;
  logic [N_ROW-1:0][NPX-1:0][CLUS_DATA_WIDTH-1:0]                  axi_sink_pi_TDATA;
  logic [N_ROW-1:0] [STREAM_BE_SIZE   -1:0]                axi_sink_pi_TSTRB;              
  logic [N_ROW-1:0] [STREAM_BE_SIZE   -1:0]                axi_sink_pi_TKEEP;
  
  logic [N_ROW-1:0]                                        axi_sink_pii_TVALID; 
  logic [N_ROW-1:0]                                        axi_sink_pii_TREADY;
  logic [N_ROW-1:0] [CLUS_DATA_WIDTH-1:0]                  axi_sink_pii_TDATA;
  logic [N_ROW-1:0] [STREAM_BE_SIZE   -1:0]                axi_sink_pii_TSTRB;              
  logic [N_ROW-1:0] [STREAM_BE_SIZE   -1:0]                axi_sink_pii_TKEEP;
  
  logic [N_ROW-1:0]                                        axi_sink_piii_TVALID; 
  logic [N_ROW-1:0]                                        axi_sink_piii_TREADY;
  logic [N_ROW-1:0] [CLUS_DATA_WIDTH-1:0]                  axi_sink_piii_TDATA;
  logic [N_ROW-1:0] [STREAM_BE_SIZE   -1:0]                axi_sink_piii_TSTRB;              
  logic [N_ROW-1:0] [STREAM_BE_SIZE   -1:0]                axi_sink_piii_TKEEP;
  
  assign done_preload = axi_done_preload;
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  
  logic                                             wei_mem_req;
  logic                       [CLUS_ADDR_WIDTH-1:0] wei_mem_add;  
  logic         [WL_PORTS-1:0][CLUS_DATA_WIDTH-1:0] wei_mem_r_data;


//  logic [7:0] n_og_int;
  logic [2:0] zero_padding_int;

  logic [31:0] wl_base_addr;
  
 

  assign engine_params.linebuf_length    = linebuf_length;
  assign engine_params.qf                = qf; // unused
  assign engine_params.signed_mul        = signed_mul;
  assign engine_params.nfeat             = nfeat;//not used
  assign engine_params.stream_config     = stream_config;
  //assign engine_params.stream_flags      = stream_flags;
  assign engine_params.linear_conv       = linear_conv;
  
 
  //assign axi_source_TUSER[1] = stream_flags[2]; // x_in
  // hijacking y_in TUSER side-stream for the y_out flags!
  //assign axi_source_TUSER[0] = stream_flags[0]; // y_in
  

  genvar i;
  
   generate
    for (i=0;i<NPF*N_COL;i++)      // i = 0 -> 3*4-1
      begin
        assign axi_source_TUSER[N_ROW+i] = stream_flags[2*N_ROW+i]; // x_in        
      end
      
    for (i=0;i<N_ROW;i++)      // i = 0 -> 3
      begin
        // hijacking y_in TUSER side-stream for the y_out flags!
        assign axi_source_TUSER[i] = stream_flags[i]; // y_in      
      end
   endgenerate
   
  generate
    for(i=0; i<N_ACCELERATOR_PORT; i++) begin : wl_tcdm_be_gen
      assign wl_tcdm_be[i] = 4'hf;
    end
  endgenerate

//  always_ff @(posedge clk_fast_i or negedge rst_n)
//  begin
//    if(rst_n == 1'b0) begin
//      wl_start_delayed <= 4'b0;
//      wl_start_weight  <= 1'b0;
//    end
//    else begin
//      wl_start_delayed[0] <= wl_start_engine;
//      wl_start_delayed[1] <= wl_start_delayed[0];
//      wl_start_delayed[2] <= wl_start_delayed[1];
//      wl_start_weight     <= wl_start_delayed[2];
//    end
//  end

assign wl_start_weight = wl_start_engine;



  hwce_wrapper #(
    .N_MASTER_PORT      ( N_MASTER_PORT    ),
    .N_CONTEXT          ( N_CONTEXT        ),
    .FILTER_SIZE        ( FILTER_SIZE      ),
    .CLUS_ADDR_WIDTH    ( CLUS_ADDR_WIDTH  ),
    .CLUS_DATA_WIDTH    ( CLUS_DATA_WIDTH  ),
    .CLUS_BE_WIDTH      ( CLUS_BE_WIDTH    ),
    .CFG_ADDR_WIDTH     ( CFG_ADDR_WIDTH   ),
    .CFG_DATA_WIDTH     ( CFG_DATA_WIDTH   ),
    .CFG_BE_WIDTH       ( CFG_BE_WIDTH     ),
    .CFG_ID_WIDTH       ( CFG_ID_WIDTH     ),
    .STREAM_DATA_SIZE   ( STREAM_DATA_SIZE ),
    .STREAM_BE_SIZE     ( STREAM_BE_SIZE   ),
    .STREAM_TID_SIZE    ( STREAM_TID_SIZE  ),
    .STREAM_TDEST_SIZE  ( STREAM_TDEST_SIZE),
    .STREAM_TUSER_SIZE  ( STREAM_TUSER_SIZE),
    .N_SOURCE_STREAMS   ( N_SOURCE_STREAMS ),
    .N_SINK_STREAMS     ( N_SINK_STREAMS   ),
    .N_GENERIC_REGS     ( N_GENERIC_REGS   ),
    .LATCH_REGFILE      ( LATCH_REGFILE    ),
    .LATCH_FIFO         ( LATCH_FIFO       ),
    .LINEAR_SUPPORTED   ( LINEAR_SUPPORTED ),
    .N_ACCELERATOR_PORT ( N_ACCELERATOR_PORT ),
    .NPX                ( NPX              ),
    .N_ROW              ( N_ROW            ),
    .N_COL              ( N_COL            ),
    .BANK_SIZE          ( BANK_SIZE         ),
    .NB_BANKS_DSP        ( NB_BANKS_DSP      ),
    .BANK_SIZE_DSP_B     ( BANK_SIZE_DSP_B   ),
    .WEI_MEM_BANK_SIZE  ( WEI_MEM_BANK_SIZE ),
    .WEI_MEM_BANK_SIZE_16BIT  ( WEI_MEM_BANK_SIZE_16BIT ),
    .WL_PORTS           ( WL_PORTS          ),
    .NPF                ( NPF           ),
    .CONV_WIDTH         ( CONV_WIDTH        )
  ) wrapper_i (
    .clk                 (clk_i              ),
    .clk_gated           (clk_fast_i        ),
    .rst_n               (rst_n            ),
    .tcdm_req_o          (tcdm_req_o       ),
    .tcdm_gnt_i          (tcdm_gnt_i       ),
    .tcdm_add_o          (tcdm_add_o       ),
    .tcdm_type_o         (tcdm_type_o      ),
    .tcdm_be_o           (tcdm_be_o        ),
    .tcdm_data_o         (tcdm_data_o      ),
    .tcdm_r_data_i       (tcdm_r_data_i    ),
    .tcdm_r_valid_i      (tcdm_r_valid_i   ),
    .wei_mem_req         (wei_mem_req      ),
    .wei_mem_add         (wei_mem_add      ), 
    .wei_mem_r_data      (wei_mem_r_data   ),
    .cfg_req_i           (cfg_req_i        ),
    .cfg_gnt_o           (cfg_gnt_o        ),
    .cfg_add_i           (cfg_add_i        ),
    .cfg_type_i          (cfg_type_i       ),
    .cfg_be_i            (cfg_be_i         ),
    .cfg_data_i          (cfg_data_i       ),
    .cfg_ID_i            (cfg_ID_i         ),
    .cfg_r_valid_o       (cfg_r_valid_o    ),
    .cfg_r_data_o        (cfg_r_data_o     ),
    .cfg_r_ID_o          (cfg_r_ID_o       ),
    .evt_interrupt_o     (evt_interrupt_o  ),
    `ifdef PIPE  
      `ifdef POOLING
      .axi_sink_TVALID_i   (axi_sink_piii_TVALID  ),
      .axi_sink_TREADY_o   (axi_sink_piii_TREADY  ),
      .axi_sink_TDATA_i    (axi_sink_piii_TDATA   ),
      .axi_sink_TSTRB_i    (axi_sink_piii_TSTRB   ),
      .axi_sink_TKEEP_i    (axi_sink_piii_TKEEP   ),
      `else
      .axi_sink_TVALID_i   (axi_sink_pi_TVALID  ),
      .axi_sink_TREADY_o   (axi_sink_pi_TREADY  ),
      .axi_sink_TDATA_i    (axi_sink_pi_TDATA   ),
      .axi_sink_TSTRB_i    (axi_sink_pi_TSTRB   ),
      .axi_sink_TKEEP_i    (axi_sink_pi_TKEEP   ),
      `endif
    `else 
    .axi_sink_TVALID_i   (axi_sink_TVALID  ),
    .axi_sink_TREADY_o   (axi_sink_TREADY  ),
    .axi_sink_TDATA_i    (axi_sink_TDATA   ),
    .axi_sink_TSTRB_i    ( axi_sink_TSTRB   ),
    .axi_sink_TKEEP_i    ( axi_sink_TKEEP   ),
    `endif 
    
    .axi_sink_TLAST_i    ( '0   ),
    .axi_sink_TID_i      ( '0    ),
    .axi_sink_TDEST_i    ( '0    ),
    .axi_sink_TUSER_i    ( '0    ),
    
    .axi_source_TVALID_o ( axi_source_TVALID),
    .axi_source_TREADY_i ( axi_source_TREADY),
    .axi_source_TDATA_o  ( axi_source_TDATA ),
    .axi_source_WDATA_o  ( axi_source_WDATA ),
    .ws_size_B           ( ws_size_B          ),
    .finish_wrapper      ( finish_wrapper),
    .axi_clear_o         ( axi_clear        ),//unused
    .axi_done_preload_i  ( axi_done_preload ),
    .wl_done_i           ( wl_done        ),
    
    .wl_en_o             ( wl_en          ),//unused
    .wl_tcdm_req_i       ( ~wl_tcdm_req        ),//unused
    .wl_tcdm_wait_n_o    ( ),//wl_tcdm_wait_n      ),//unused
    .wl_type_i           ( 8'b0             ),//unused
    .wl_tcdm_addr_i      ( wl_tcdm_addr        ),//unused
    .wl_tcdm_be_i        ( wl_tcdm_be          ),//unused
    .wl_tcdm_wdata_i     ( wl_tcdm_wdata       ),//unused
    .wl_tcdm_rdata_o     ( wl_tcdm_rdata       ),//unused
    
    .weight_size_o       ( weight_size      ),
    .weight_mask_o       ( weight_mask      ), //unused
    .wl_base_addr_o      ( wl_base_addr      ),
    .linebuf_length_o    ( linebuf_length   ),
    .stream_config_o     ( stream_config    ),
    .stream_flags_o      ( stream_flags     ),
    .qf_o                ( qf               ),
    .signed_mul_o        ( signed_mul       ),
    .nfeat_o             ( nfeat            ),//not used
    .linear_conv_o       ( linear_conv      ),
    .hwce_working_o      ( hwce_working     ),
    .engine_state_i      ( engine_state     ),
    .engine_start_o      ( engine_start     ),    
    .pooling_HW          ( pooling_HW         ),
    .method_pooling      ( method_pooling     ),
    .half_image_width_o  ( half_image_width_o ),
    .feat_height         ( feat_height        ),
    .sum_over_constant   ( sum_over_constant  ),
    .rectifier_activ,
    .zero_padding_o      ( zero_padding_int   ),
    .precision8_o        ( precision8         )
  );
  
  assign wl_tcdm_wdata = 0;
  
  //WORKAROUND TO RESOLVE A MALFUNCTION WITH ARRAYS RANGE i.e array[2:2]
  
  logic [NPF*N_COL-1:0]                         axi_x_in_TVALID;
  logic [NPF*N_COL-1:0]                         axi_x_in_TREADY;
  logic [NPF*N_COL-1:0][NPX-1:0][STREAM_DATA_SIZE -1:0] axi_x_in_TDATA;
  logic [NPF*N_COL-1:0] [STREAM_BE_SIZE   -1:0] axi_x_in_TSTRB;
  logic [NPF*N_COL-1:0] [STREAM_BE_SIZE   -1:0] axi_x_in_TKEEP;
  logic [NPF*N_COL-1:0]                         axi_x_in_TLAST;
  logic [NPF*N_COL-1:0] [STREAM_TID_SIZE  -1:0] axi_x_in_TID;
  logic [NPF*N_COL-1:0] [STREAM_TDEST_SIZE-1:0] axi_x_in_TDEST;
  logic [NPF*N_COL-1:0] [STREAM_TUSER_SIZE-1:0] axi_x_in_TUSER;
  
  logic [WL_PORTS-1:0][STREAM_DATA_SIZE -1:0]   axi_w_in_WDATA;
  
  
  logic [N_ROW-1:0]                         axi_y_in_TVALID;
  logic [N_ROW-1:0]                         axi_y_in_TREADY;
  logic [N_ROW-1:0][NPX-1:0][STREAM_DATA_SIZE -1:0] axi_y_in_TDATA;
  logic [N_ROW-1:0] [STREAM_BE_SIZE   -1:0] axi_y_in_TSTRB;
  logic [N_ROW-1:0] [STREAM_BE_SIZE   -1:0] axi_y_in_TKEEP;
  logic [N_ROW-1:0]                         axi_y_in_TLAST;
  logic [N_ROW-1:0] [STREAM_TID_SIZE  -1:0] axi_y_in_TID;
  logic [N_ROW-1:0] [STREAM_TDEST_SIZE-1:0] axi_y_in_TDEST;
  logic [N_ROW-1:0] [STREAM_TUSER_SIZE-1:0] axi_y_in_TUSER;
  
  generate
    for (i=0;i<NPF*N_COL;i++)
      always_comb
      begin
        axi_x_in_TVALID  [i]       = axi_source_TVALID [N_ROW+i];
        axi_source_TREADY[N_ROW+i] = axi_x_in_TREADY   [i];
        axi_x_in_TDATA   [i]       = axi_source_TDATA  [N_ROW+i];
        axi_x_in_TSTRB   [i]       = axi_source_TSTRB  [N_ROW+i];
        axi_x_in_TKEEP   [i]       = axi_source_TKEEP  [N_ROW+i];
        axi_x_in_TLAST   [i]       = axi_source_TLAST  [N_ROW+i];
        axi_x_in_TID     [i]       = axi_source_TID    [N_ROW+i];
        axi_x_in_TDEST   [i]       = axi_source_TDEST  [N_ROW+i];
        axi_x_in_TUSER   [i]       = axi_source_TUSER  [N_ROW+i];
      end 
      
    for (i=0;i<N_ROW;i++)
      always_comb
      begin
        axi_y_in_TVALID   [i] = axi_source_TVALID [i];
        axi_source_TREADY [i] = axi_y_in_TREADY   [i];
        axi_y_in_TDATA    [i] = axi_source_TDATA  [i];
        axi_y_in_TSTRB    [i] = axi_source_TSTRB  [i];
        axi_y_in_TKEEP    [i] = axi_source_TKEEP  [i];
        axi_y_in_TLAST    [i] = axi_source_TLAST  [i];
        axi_y_in_TID      [i] = axi_source_TID    [i];
        axi_y_in_TDEST    [i] = axi_source_TDEST  [i];
        axi_y_in_TUSER    [i] = axi_source_TUSER  [i];
      end
    
  endgenerate
  
  assign axi_w_in_WDATA = axi_source_WDATA;
  
  ///////////////////////////////////////////////POOLING///////////////////////////////////////////////

 
 
 //pipe stage
 `ifdef PIPE 
 
 
 
 
/* logic [1:0][15:0]feat_height_pooling;
 always_comb begin
    case (pooling_HW)
    2'b01:  begin
            feat_height_pooling[0]=feat_height<<1;
            feat_height_pooling[1]=feat_height;
            end
    2'b11:  begin
            feat_height_pooling[0]=feat_height<<2;
            feat_height_pooling[1]=feat_height<<1;
            end    
    default:begin
            feat_height_pooling[0]=feat_height;
            feat_height_pooling[1]=feat_height;
            end
    endcase
 end
*/

logic [15:0] feat_height_reg;
logic block;
//registro per altezza dell'immagine
always_ff @(posedge clk_fast_i) 
   begin
      if (rst_n==1'b0)begin
        feat_height_reg<=0;    
        block<=0;
      end
      else begin
        if(done_preload==1 && block==0)begin
          feat_height_reg<= feat_height << (pooling_HW[0]+pooling_HW[1]);
          block<=1;
        end
        if(done_preload==0)begin
          block<=0;
        end
      /*
        if(done_preload==1 && pooling_HW == 0 && block==0)begin
          feat_height_reg<=feat_height;
          block<=1;
        end
        if(finish_wrapper==1)begin
          block<=0;
        end*/
        //if(done_preload==1 && pooling_HW == 1 && block==1)begin
        //  block<=0;
        //end
      end
  end



  generate
  
  for(i=0;i<N_ROW;i++) begin: pipe_pooling_gen
        
        pipe_pooling
        #(
        .AXI_WIDTH          (CLUS_DATA_WIDTH),
        .NPX                (NPX)
        )
        pipe_pooling_i
        (
        .clk	                         (clk_i), 		
        .clk_gated                     (clk_fast_i),
        .rst_n                         (rst_n),
        .clear                         (1'b0),
        
        .half_image_width_i            (half_image_width_o),
        .done_preload                  (done_preload),
        .feat_height                   (feat_height_reg), 
        
        
        //protocol engine side
        .y_out_TVALID_i                 (axi_sink_p_TVALID  [i]), 
        .y_out_TREADY_o                 (axi_sink_p_TREADY  [i]),
        .y_out_TDATA_i                  (axi_sink_p_TDATA   [i]),
        .y_out_TSTRB_i                  (axi_sink_p_TSTRB   [i]),
        .y_out_TKEEP_i                  (axi_sink_p_TKEEP   [i]),
        
        //protocol wrapper side
        .axi_sink_TVALID_o               (axi_sink_pi_TVALID  [i]),    
        .axi_sink_TREADY_i               (axi_sink_pi_TREADY  [i]),
        .axi_sink_TDATA_o                (axi_sink_pi_TDATA   [i]),
        .axi_sink_TSTRB_o                (axi_sink_pi_TSTRB   [i]),
        .axi_sink_TKEEP_o                (axi_sink_pi_TKEEP   [i])
        
        );   
      
    end
  
`ifdef POOLING  
    for(i=0;i<N_ROW;i++) begin: pooling_gen
        
        pooling_layer
        #(
        .LINEBUFFER_WIDTH   (LINEBUFFER_WIDTH),
        .AXI_WIDTH          (CLUS_ADDR_WIDTH)
        )
        pooling_layer_i
        (
        .clk_i	                     (clk_fast_i), 		
        .rst_n                         (rst_n),
        .clear                         (1'b0),
        
        .half_image_width_i            (half_image_width_o),
        .done_preload                  (done_preload),
        .pooling_HW                    (pooling_HW[0]),
        .method_pooling                (method_pooling),
        .feat_height                   (feat_height_reg), //(feat_height_pooling[0]),
        
        
        //protocol engine side
        .y_out_TVALID_i                 (axi_sink_pi_TVALID  [i]), 
        .y_out_TREADY_o                 (axi_sink_pi_TREADY  [i]),
        .y_out_TDATA_i                  (axi_sink_pi_TDATA   [i]),
        .y_out_TSTRB_i                  (axi_sink_pi_TSTRB   [i]),
        .y_out_TKEEP_i                  (axi_sink_pi_TKEEP   [i]),
        
        //protocol wrapper side
        .axi_sink_TVALID_o               (axi_sink_pii_TVALID  [i]),    
        .axi_sink_TREADY_i               (axi_sink_pii_TREADY  [i]),
        .axi_sink_TDATA_o                (axi_sink_pii_TDATA   [i]),
        .axi_sink_TSTRB_o                (axi_sink_pii_TSTRB   [i]),
        .axi_sink_TKEEP_o                (axi_sink_pii_TKEEP   [i])
        
        );   
      
    end
      
`ifdef POOLING4x4 
    for(i=0;i<N_ROW;i++) begin: pooling_gen_2       
        pooling_layer
        #(
        .LINEBUFFER_WIDTH   ( LINEBUFFER_WIDTH ),
        .AXI_WIDTH          ( CLUS_ADDR_WIDTH  ),
        .FILTER_SIZE        ( FILTER_SIZE      )
        )
        pooling_layer_i
        (
        .clk	                     (clk_fast_i), 		
        .rst_n                         (rst_n),
        .clear                         (1'b0),
        
        .half_image_width_i            ((half_image_width_o>>pooling_HW[0])+((half_image_width_o&16'b1)&&pooling_HW[0])), //shifta se il blocco precedente ha effettuato il pooling
        .done_preload                  (done_preload),
        .pooling_HW                    (pooling_HW[1]),
        .method_pooling                (method_pooling),
        .filter_size                   (weight_size [2:0]), //unused
        .feat_height                   (feat_height_reg>>pooling_HW[0]), //(feat_height_pooling[1]),
        
        
        //protocol engine side
        .y_out_TVALID_i                 (axi_sink_pii_TVALID  [i]), 
        .y_out_TREADY_o                 (axi_sink_pii_TREADY  [i]),
        .y_out_TDATA_i                  (axi_sink_pii_TDATA   [i]),
        .y_out_TSTRB_i                  (axi_sink_pii_TSTRB   [i]),
        .y_out_TKEEP_i                  (axi_sink_pii_TKEEP   [i]),
                                                                          
        //protocol wrapper side
        .axi_sink_TVALID_o               (axi_sink_piii_TVALID  [i]),    
        .axi_sink_TREADY_i               (axi_sink_piii_TREADY  [i]),
        .axi_sink_TDATA_o                (axi_sink_piii_TDATA   [i]),
        .axi_sink_TSTRB_o                (axi_sink_piii_TSTRB   [i]),
        .axi_sink_TKEEP_o                (axi_sink_piii_TKEEP   [i])
        
        );   
      
    end
`else // only 2x2 POOLING
       assign axi_sink_piii_TVALID   = axi_sink_pii_TVALID ;
       assign axi_sink_pii_TREADY    = axi_sink_piii_TREADY;
       assign axi_sink_piii_TDATA    = axi_sink_pii_TDATA  ;
       assign axi_sink_piii_TSTRB    = axi_sink_pii_TSTRB  ;
       assign axi_sink_piii_TKEEP    = axi_sink_pii_TKEEP  ;
`endif
`endif
  endgenerate
  
  
`endif
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
  
  //end workarond

  hwce_engine #(
    .AXI_WIDTH        (16               ), //32
    .CONV_WIDTH       (CONV_WIDTH       ),
//    .PIPE_STAGES_SOP  (PIPE_STAGES_SOP  ),
    .FILTER_SIZE      (FILTER_SIZE      ),
    .LINEBUFFER_WIDTH (LINEBUFFER_WIDTH ),
    .QF               ( QF              ),
    .ACC_CONFIG       (ACC_CONFIG       ),
    .TID_SIZE         (STREAM_TID_SIZE  ),
    .TDEST_SIZE       (STREAM_TDEST_SIZE),
    .TUSER_SIZE       (STREAM_TUSER_SIZE),
    .LINEAR_SUPPORTED (LINEAR_SUPPORTED ),
    .NPX              (NPX              ),
    .N_ROW            (N_ROW            ),
    .N_COL            (N_COL            ),
    .WL_PORTS         ( WL_PORTS        ),
    .NPF              ( NPF             )
  ) engine_i (
    .clk            (clk_fast_i            ),
    .rst_n          (rst_n                ),
    .weight         (weights ),
    .clear          (1'b0            ),
    .done_preload   (axi_done_preload     ),
    .engine_params  (engine_params        ),
    .weight_start   (wl_start_engine    ),
    .weight_done    (wl_done            ),
    .engine_state   (engine_state         ),
    .engine_start   (engine_start         ),
`ifdef PIPE   
    .y_out_TVALID_o (axi_sink_p_TVALID   ),
    .y_out_TREADY_i (axi_sink_p_TREADY   ),
    .y_out_TDATA_o  (axi_sink_p_TDATA    ),
    .y_out_TSTRB_o  (axi_sink_p_TSTRB    ),
    .y_out_TKEEP_o  (axi_sink_p_TKEEP    ),
`else    
    .y_out_TVALID_o (axi_sink_TVALID   ),
    .y_out_TREADY_i (axi_sink_TREADY   ),
    .y_out_TDATA_o  (axi_sink_TDATA    ),
    .y_out_TSTRB_o  (axi_sink_TSTRB    ),
    .y_out_TKEEP_o  (axi_sink_TKEEP    ),    
`endif    
    .y_out_TLAST_o  (axi_sink_TLAST    ),
    .y_out_TID_o    (axi_sink_TID      ),
    .y_out_TDEST_o  (axi_sink_TDEST    ),
    .y_out_TUSER_o  (axi_sink_TUSER    ),
    
    .x_in_TVALID_i  (axi_x_in_TVALID ),
    .x_in_TREADY_o  (axi_x_in_TREADY ),
    .x_in_TDATA_i   (axi_x_in_TDATA  ),
    .x_in_TSTRB_i   (axi_x_in_TSTRB  ),
    .x_in_TKEEP_i   (axi_x_in_TKEEP  ),
    .x_in_TLAST_i   (axi_x_in_TLAST  ),
    .x_in_TID_i     (axi_x_in_TID    ),
    .x_in_TDEST_i   (axi_x_in_TDEST  ),
    .x_in_TUSER_i   ( axi_x_in_TUSER  ),
    
    .w_in_WDATA_i   (axi_w_in_WDATA  ),
    
    .y_in_TVALID_i  ( axi_y_in_TVALID ),
    .y_in_TREADY_o  ( axi_y_in_TREADY ),
    .y_in_TDATA_i   ( axi_y_in_TDATA  ),
    .y_in_TSTRB_i   ( axi_y_in_TSTRB  ),
    .y_in_TKEEP_i   ( axi_y_in_TKEEP  ),
    .y_in_TLAST_i   ( axi_y_in_TLAST  ),
    .y_in_TID_i     ( axi_y_in_TID    ),
    .y_in_TDEST_i   ( axi_y_in_TDEST  ),
    .y_in_TUSER_i   ( axi_y_in_TUSER  ),
    //.filter_size    ( weight_size [3:0] ),  
    .sum_over_constant,
    .rectifier_activ,
    .bias,
    .zero_padding_i ( zero_padding_int ),
    .precision8     ( precision8       )
  );
 
 
 /*
 
██╗    ██╗███████╗██╗ ██████╗ ██╗  ██╗████████╗██╗      ██████╗  █████╗ ██████╗ ███████╗██████╗ 
██║    ██║██╔════╝██║██╔════╝ ██║  ██║╚══██╔══╝██║     ██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
██║ █╗ ██║█████╗  ██║██║  ███╗███████║   ██║   ██║     ██║   ██║███████║██║  ██║█████╗  ██████╔╝
██║███╗██║██╔══╝  ██║██║   ██║██╔══██║   ██║   ██║     ██║   ██║██╔══██║██║  ██║██╔══╝  ██╔══██╗
╚███╔███╔╝███████╗██║╚██████╔╝██║  ██║   ██║   ███████╗╚██████╔╝██║  ██║██████╔╝███████╗██║  ██║
 ╚══╝╚══╝ ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝                                                                                              
 */
 
 XBAR_TCDM_BUS_64BIT       wl_mem_bus[WL_PORTS - 1:0]();
 
 WEIGHT_BANK_MEM_BUS_16BIT w_mem_bus[WL_PORTS - 1:0]();
 
// genvar w;
//  generate
//    for(w=0; w <WL_PORTS; w++)
//    begin
//      assign w_mem_bus[w].req   = wei_mem_req;
//      assign w_mem_bus[w].add   = wei_mem_add;
//      assign wei_mem_r_data[w][CONV_WIDTH-1:0] = w_mem_bus[w].rdata;
//    end
//  endgenerate
 
//  hwce_weight_loader #(
//    .FS                 ( FILTER_SIZE     ),
//    .WL_PORTS           ( WL_PORTS        ),
//    .CONV_WIDTH         ( CONV_WIDTH      ),
//    .N_ROW              ( N_ROW           ),
//    .N_COL              ( N_COL           )
//  )  weight_loader_i    (
//    .clk                ( clk_fast_i      ),
//    .rst_n              ( rst_n           ),
//    .start_i            ( wl_start_weight ),
//    .done_o             ( wl_done         ),
//    .wl_base_addr_i     ( wl_base_addr    ),
//    .weights_o          ( weights         ),  
//    .wl_mem_bus         ( wl_mem_bus      ),      
//    .bias
//  );    
  
  
  hwce_weight_loader #(
    .WL_PORTS           ( WL_PORTS        ),
    .CONV_WIDTH         ( CONV_WIDTH      ),
    .N_ROW              ( N_ROW           ),
    .N_COL              ( N_COL           )
  )  weight_loader_i    (
    .clk                ( clk_fast_i      ),
    .rst_n              ( rst_n           ),
    .start_i            ( wl_start_weight ),
    .done_o             ( wl_done         ),
    .bl_base_addr_i     ( wl_base_addr    ),
    .wei_mem_req        ( wei_mem_req     ),
    .wei_mem_add        ( wei_mem_add     ),
    .wei_mem_r_data     ( wei_mem_r_data  ),  
    .bias_pos           ( stream_config[2*N_ROW].fs_params[15:0] ),
    .w_mem_bus          ( w_mem_bus       ),      
    .bias
  ); 
  
  
  weights_mem_dp_wrap
  #(
    .BANK_SIZE    ( WEI_MEM_BANK_SIZE     ),
    .BANK_SIZE_B  (WEI_MEM_BANK_SIZE_16BIT),
    .NB_BANKS     ( WL_PORTS              )        
  )
  weights_mem_dp_wrap_i
  (
    .clk_a_i      ( clk_fast_i   ),
    .clk_b_i      ( clk_wmem_i  ),
    .rst_ni       ( rst_n       ),

    .dma_port     ( dma_mem_bus ),
    .wl_port      ( wl_mem_bus  ),
    .w_mem_bus    ( w_mem_bus   )
  );

endmodule
