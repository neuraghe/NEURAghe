/******************************************************************************
 *                                                                            *
 *                 Integrated Systems Laboratory @ ETH Zurich                 *
 *                      Gloriastrasse 35 8092 Zurich                          *
 *                                  Zurich                                    *
 *                                                                            *
 * Engineer:       Michael Gautschi - gautschi@iis.ethz.ch                    *
 *                 Francesco Conti  - f.conti@unibo.it                        *
 *                                                                            *
 * Project:        PULP3                                                      *
 * File:           hwce_wrap.sv                                               *
 * Description:    instantiates the hwce top unit and establishes all         *
 *                 connections to the bus                                     *
 *                                                                            *
 ******************************************************************************/

`include "ulpsoc_defines.sv"

module hwce_wrap
#(
   parameter N_MASTER_PORT = 3,
   parameter ID_WIDTH      = 8,
   parameter N_ROW         = 2,
   parameter N_COL         = 2,
   parameter BANK_SIZE     = 4096,
   parameter WEI_MEM_BANK_SIZE = 1024,
   parameter NPF           = 2, // number of 3x3 parallel filters
   parameter CONV_WIDTH    = 16
   
)
(
   input  logic              clk_i,
   input  logic              clk_fast_i,
   input  logic              clk_wmem_i,
   input  logic              rst_n,
   input  logic              test_mode,
  
   // Request side - INIT
   XBAR_TCDM_BUS.Master      hwacc_xbar_master[N_MASTER_PORT-1:0],
   XBAR_PERIPH_BUS.Slave     hwacc_cfg_slave,
   XBAR_TCDM_BUS_64BIT.Slave weights_mem_bus [1-1:0],
   
   // Event (low-priority interrupt) line
   output logic              evt_interrupt_o
);

   logic [N_MASTER_PORT-1:0]          tcdm_req;
   logic [N_MASTER_PORT-1:0]          tcdm_gnt;
   logic [N_MASTER_PORT-1:0] [32-1:0] tcdm_add;
   logic [N_MASTER_PORT-1:0]          tcdm_type;
   logic [N_MASTER_PORT-1:0] [4 -1:0] tcdm_be;
   logic [N_MASTER_PORT-1:0] [32-1:0] tcdm_wdata;
   // Response side  - INIT
   logic [N_MASTER_PORT-1:0] [32-1:0] tcdm_r_rdata;
   logic [N_MASTER_PORT-1:0]          tcdm_r_valid;
   
   
   
   logic                              cfg_req_int;
   logic                              cfg_gnt_int;
   logic [32-1:0]                     cfg_add_int;
   logic                              cfg_type_int;
   logic [4-1:0]                      cfg_be_int;
   logic [32-1:0]                     cfg_data_int;
   logic [ID_WIDTH-1:0]               cfg_ID_int;
  
   logic                              cfg_r_valid_int;
   logic [32-1:0]                     cfg_r_data_int;
   logic [ID_WIDTH-1:0]               cfg_r_ID_int;
   
      
   
   hwce_periph_adapt #(
      .CLUS_ADDR_WIDTH  ( 32       ),
      .CFG_ADDR_WIDTH   ( 11       ),
      .CFG_DATA_WIDTH   ( 32       ),
      .CFG_BE_WIDTH     ( 4        ),
      .CFG_ID_WIDTH     ( ID_WIDTH )
   
   ) peripheral_wrap (
   
      .clk_i            ( clk_i                   ),
      .clk_fast_i       ( clk_fast_i              ),
      .rst_n            ( rst_n                   ),
      
      .cfg_add_is       ( hwacc_cfg_slave.add     ),
      .cfg_be_is        ( hwacc_cfg_slave.be      ),
      .cfg_data_is      ( hwacc_cfg_slave.wdata   ),
      .cfg_gnt_os       ( hwacc_cfg_slave.gnt     ),
      .cfg_type_is      ( ~hwacc_cfg_slave.wen    ),
      .cfg_req_is       ( hwacc_cfg_slave.req     ),
      .cfg_ID_is        ( hwacc_cfg_slave.id      ),
      .cfg_r_data_os    ( hwacc_cfg_slave.r_rdata ),
      .cfg_r_valid_os   ( hwacc_cfg_slave.r_valid ),
      .cfg_r_ID_os      ( hwacc_cfg_slave.r_id    ),
      
      
      .cfg_add_om       ( cfg_add_int     ),
      .cfg_be_om        ( cfg_be_int      ),
      .cfg_data_om      ( cfg_data_int   ),
      .cfg_gnt_im       ( cfg_gnt_int     ),
      .cfg_type_om      ( cfg_type_int    ),
      .cfg_req_om       ( cfg_req_int     ),
      .cfg_ID_om        ( cfg_ID_int      ),
      .cfg_r_data_im    ( cfg_r_data_int ),
      .cfg_r_valid_im   ( cfg_r_valid_int ),
      .cfg_r_ID_im      ( cfg_r_ID_int    )
   
   );

   hwce_top #(
      .N_MASTER_PORT       ( N_MASTER_PORT     ),
      .N_CONTEXT           ( 2                 ),
      .CLUS_ADDR_WIDTH     ( 32                ),
      .CLUS_DATA_WIDTH     ( 32                ),
      .CLUS_BE_WIDTH       ( 4                 ),
      .CFG_ADDR_WIDTH      ( 11                ),
      .CFG_DATA_WIDTH      ( 32                ),
      .CFG_BE_WIDTH        ( 4                 ),
      .CFG_ID_WIDTH        ( ID_WIDTH          ),
      .N_SOURCE_STREAMS    ( NPF*N_COL + N_ROW ),
      .N_SINK_STREAMS      ( N_ROW             ),
      .N_GENERIC_REGS      ( 4                 ), // max is 4
      .STREAM_DATA_SIZE    ( 32                ),
      .STREAM_BE_SIZE      ( 4                 ),
      .STREAM_TID_SIZE     ( 1                 ),
      .STREAM_TDEST_SIZE   ( 1                 ),
      .STREAM_TUSER_SIZE   ( 4                 ),
      .FILTER_SIZE         ( 3                 ),
      .LINEBUFFER_WIDTH    ( 256               ),
      .QF                  ( 11                ),
      .LATCH_REGFILE       ( 0                 ),
      .LATCH_FIFO          ( 0                 ),
      .N_ROW               ( N_ROW             ), //legal values 2 or 4
      .N_COL               ( N_COL             ), //legal values 2 or 4
      .BANK_SIZE           ( BANK_SIZE         ),
      .WEI_MEM_BANK_SIZE   ( WEI_MEM_BANK_SIZE ),
      .CONV_WIDTH          ( CONV_WIDTH        ), //legal values 16 or 8
      .NPF                 ( NPF               )
   ) hwce_top_i (
      .clk_i               ( clk_i             ),
      .clk_fast_i          ( clk_fast_i        ),
      .clk_wmem_i          ( clk_wmem_i        ),
      .rst_n               ( rst_n             ),
      .test_mode           ( test_mode         ),
      .tcdm_add_o          ( tcdm_add          ),
      .tcdm_be_o           ( tcdm_be           ),
      .tcdm_data_o         ( tcdm_wdata        ),
      .tcdm_gnt_i          ( tcdm_gnt          ),
      .tcdm_type_o         ( tcdm_type         ),
      .tcdm_req_o          ( tcdm_req          ),
      .tcdm_r_data_i       ( tcdm_r_rdata      ),
      .tcdm_r_valid_i      ( tcdm_r_valid      ),
      .dma_mem_bus         ( weights_mem_bus   ),
      .cfg_add_i           ( cfg_add_int       ),
      .cfg_be_i            ( cfg_be_int        ),
      .cfg_data_i          ( cfg_data_int      ),
      .cfg_gnt_o           ( cfg_gnt_int       ),
      .cfg_type_i          ( cfg_type_int      ),
      .cfg_req_i           ( cfg_req_int       ),
      .cfg_ID_i            ( cfg_ID_int        ),
      .cfg_r_data_o        ( cfg_r_data_int    ),
      .cfg_r_valid_o       ( cfg_r_valid_int   ),
      .cfg_r_ID_o          ( cfg_r_ID_int      ),
      .evt_interrupt_o     ( evt_interrupt_o   )
   );

   genvar i;
   generate
      for (i=0;i<N_MASTER_PORT;i++) begin : hwacc_binding
         assign hwacc_xbar_master[i].req    = tcdm_req[i];
         assign tcdm_gnt[i]                 = hwacc_xbar_master[i].gnt;
         assign hwacc_xbar_master[i].add    = tcdm_add[i];
         assign hwacc_xbar_master[i].wen    = ~tcdm_type[i];
         assign hwacc_xbar_master[i].wdata  = tcdm_wdata[i];
         assign hwacc_xbar_master[i].be     = tcdm_be[i];
         // response channel
         assign tcdm_r_rdata[i]             = hwacc_xbar_master[i].r_rdata;
         assign tcdm_r_valid[i]             = hwacc_xbar_master[i].r_valid;
      end
   endgenerate

endmodule
