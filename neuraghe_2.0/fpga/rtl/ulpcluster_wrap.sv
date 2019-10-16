////////////////////////////////////////////////////////////////////////////////
// Company:        Multitherman Laboratory @ DEIS - University of Bologna     //
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Davide Rossi - davide.rossi@unibo.it                       //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    13/02/2013                                                 //
// Design Name:    ULPSoC                                                     //
// Module Name:    ulpcluster_top                                             //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    SystemVerilog wrapper for the ulpcluster netlist           //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "ulpsoc_defines.sv"

module ulpcluster_wrap
  #(
    // "fake" params - here just to provide the right interface!
    //CLUSTER PARAMETERS
    parameter NB_CORES              = 4,
    parameter NB_HWACC_PORTS        = 4,
    parameter NB_DMAS               = 4,
    parameter NB_MPERIPHS           = 1,
    parameter NB_TCDM_BANKS         = 8,
    parameter NB_SPERIPHS           = 8,
    parameter FLIPWELL              = 0,

    //ICACHE PARAMETERS
    parameter SET_ASSOCIATIVE       = 4, 
    parameter NB_CACHE_BANKS        = 4,
    parameter CACHE_LINE            = 1,
    parameter CACHE_SIZE            = 4096,
    parameter ICACHE_DATA_WIDTH     = 128,
    parameter L0_BUFFER_FEATURE     = "ENABLED",
    parameter MULTICAST_FEATURE     = "DISABLED",
    parameter SHARED_ICACHE         = "ENABLED",
    parameter DIRECT_MAPPED_FEATURE = "DISABLED",

    //CORE PARAMETERS
    parameter ROM_BOOT_ADDR         = 32'h1A000000,
    parameter BOOT_ADDR             = 32'h1C000000,

    // AXI PARAMETERS
    parameter AXI_ADDR_WIDTH        = 32,
    parameter AXI_DATA_WIDTH        = 64,
    parameter AXI_USER_WIDTH        = 6,
    parameter AXI_ID_WIDTH          = 10,

    //CLUSTER MAIN PARAMETERS
    parameter DATA_WIDTH            = 32,
    parameter ADDR_WIDTH            = 32,
    parameter BE_WIDTH              = DATA_WIDTH/8,

    //MCHAN PARAMETERS
    parameter TCDM_ADD_WIDTH        = 13, // Total bit used to address the whole TCDM minus 3 bits (because uses 64bit data aka 2 tcdm ports)

    //TCDM PARAMETERS
    parameter TEST_SET_BIT          = 20, // bits used to indicate a test and set opration during a load in TCDM
    parameter ADDR_MEM_WIDTH        = 11, // total bits used to address a BANKin TCDM (SCM+SRAM): --> FIXME  = TCDM_ADD_WIDTH - 2 
    parameter ADDR_SRAM_WIDTH       = 10, // bits used to address a single bank in SRAM TCDM
    parameter ADDR_SCM_WIDTH        = 8,  // bits used to address a single bank in SCM TCDM

    //PERIPH PARAMETERS
    parameter LOG_CLUSTER           = 5,  // NOT USED RIGTH NOW
    parameter PE_ROUTING_LSB        = 10, //LSB used as routing BIT in periph interco
    parameter PE_ROUTING_MSB        = 13  //MSB used as routing BIT in periph interco
  )
  (

    input logic              clk_i,
    input logic              clk_fast_i,
    input logic              rst_ni,

    input  logic             tck_i,
    input  logic             tms_i,
    input  logic             trstn_i,
    input  logic             tdi_i,
    output logic             tdo_o,

`ifdef REMAP_ADDRESS
    input logic [3:0]        base_addr_i,
`endif

    input logic              test_mode_i,

    input logic              en_sa_boot_i,

    input logic [4:0]        cluster_id_i,

    input logic              fetch_en_i,
    input  logic [7:0]       ext_events_val_i,
    output logic [7:0]       ext_events_ack_o,
    output logic             eoc_o,
    output logic             busy_o,
    output logic [1:0]       return_o,

    AXI_BUS_ASYNC.Slave      data_slave,

    AXI_BUS_ASYNC.Master     instr_master,

    AXI_BUS_ASYNC.Master     data_master,

`ifdef PULP_FAULTY_CLUSTER
    input logic              fg_clk,
    input logic              fg_rst_n,
    input logic              fg_glob_enable,
    fg_apb.target            fg_cfg_if,
`endif

    input  logic [3:0]       SI,
    input  logic             SE,
    output logic [3:0]       SO

`ifdef TRACE_EXECUTION
   ,
   output logic [NB_CORES*64-1:0] instr_trace_cycles_o,
   output logic [NB_CORES*32-1:0] instr_trace_instr_o,
   output logic [NB_CORES*32-1:0] instr_trace_pc_o,
   output logic [NB_CORES-1:0]    instr_trace_valid_o
`endif

  );

  logic                     data_slave_aw_lock;                    // input
  logic                     data_slave_ar_lock;                    // input
  logic                     data_slave_w_last;                     // input
  logic                     data_slave_r_last;                     // output
  logic                     instr_master_aw_lock;                  // output
  logic                     instr_master_ar_lock;                  // output
  logic                     instr_master_w_last;                   // output
  logic                     instr_master_r_last;                   // input
  logic                     data_master_aw_lock;                   // output
  logic                     data_master_ar_lock;                   // output
  logic                     data_master_w_last;                    // output
  logic                     data_master_r_last;                    // input
  logic [31:0]              data_slave_aw_addr;                    // input
  logic [2:0]               data_slave_aw_prot;                    // input
  logic [3:0]               data_slave_aw_region;                  // input
  logic [7:0]               data_slave_aw_len;                     // input
  logic [2:0]               data_slave_aw_size;                    // input
  logic [1:0]               data_slave_aw_burst;                   // input
  logic [3:0]               data_slave_aw_cache;                   // input
  logic [3:0]               data_slave_aw_qos;                     // input
  logic [5:0]               data_slave_aw_id;                      // input
  logic [5:0]               data_slave_aw_user;                    // input
  logic [7:0]               data_slave_aw_writetoken;              // input
  logic [7:0]               data_slave_aw_readpointer;             // output
  logic [31:0]              data_slave_ar_addr;                    // input
  logic [2:0]               data_slave_ar_prot;                    // input
  logic [3:0]               data_slave_ar_region;                  // input
  logic [7:0]               data_slave_ar_len;                     // input
  logic [2:0]               data_slave_ar_size;                    // input
  logic [1:0]               data_slave_ar_burst;                   // input
  logic [3:0]               data_slave_ar_cache;                   // input
  logic [3:0]               data_slave_ar_qos;                     // input
  logic [5:0]               data_slave_ar_id;                      // input
  logic [5:0]               data_slave_ar_user;                    // input
  logic [7:0]               data_slave_ar_writetoken;              // input
  logic [7:0]               data_slave_ar_readpointer;             // output
  logic [63:0]              data_slave_w_data;                     // input
  logic [7:0]               data_slave_w_strb;                     // input
  logic [5:0]               data_slave_w_user;                     // input
  logic [7:0]               data_slave_w_writetoken;               // input
  logic [7:0]               data_slave_w_readpointer;              // output
  logic [63:0]              data_slave_r_data;                     // output
  logic [1:0]               data_slave_r_resp;                     // output
  logic [5:0]               data_slave_r_id;                       // output
  logic [5:0]               data_slave_r_user;                     // output
  logic [7:0]               data_slave_r_writetoken;               // output
  logic [7:0]               data_slave_r_readpointer;              // input
  logic [1:0]               data_slave_b_resp;                     // output
  logic [5:0]               data_slave_b_id;                       // output
  logic [5:0]               data_slave_b_user;                     // output
  logic [7:0]               data_slave_b_writetoken;               // output
  logic [7:0]               data_slave_b_readpointer;              // input
  logic [31:0]              instr_master_aw_addr;                  // output
  logic [2:0]               instr_master_aw_prot;                  // output
  logic [3:0]               instr_master_aw_region;                // output
  logic [7:0]               instr_master_aw_len;                   // output
  logic [2:0]               instr_master_aw_size;                  // output
  logic [1:0]               instr_master_aw_burst;                 // output
  logic [3:0]               instr_master_aw_cache;                 // output
  logic [3:0]               instr_master_aw_qos;                   // output
  logic [5:0]               instr_master_aw_id;                    // output
  logic [5:0]               instr_master_aw_user;                  // output
  logic [7:0]               instr_master_aw_writetoken;            // output
  logic [7:0]               instr_master_aw_readpointer;           // input
  logic [31:0]              instr_master_ar_addr;                  // output
  logic [2:0]               instr_master_ar_prot;                  // output
  logic [3:0]               instr_master_ar_region;                // output
  logic [7:0]               instr_master_ar_len;                   // output
  logic [2:0]               instr_master_ar_size;                  // output
  logic [1:0]               instr_master_ar_burst;                 // output
  logic [3:0]               instr_master_ar_cache;                 // output
  logic [3:0]               instr_master_ar_qos;                   // output
  logic [5:0]               instr_master_ar_id;                    // output
  logic [5:0]               instr_master_ar_user;                  // output
  logic [7:0]               instr_master_ar_writetoken;            // output
  logic [7:0]               instr_master_ar_readpointer;           // input
  logic [63:0]              instr_master_w_data;                   // output
  logic [7:0]               instr_master_w_strb;                   // output
  logic [5:0]               instr_master_w_user;                   // output
  logic [7:0]               instr_master_w_writetoken;             // output
  logic [7:0]               instr_master_w_readpointer;            // input
  logic [63:0]              instr_master_r_data;                   // input
  logic [1:0]               instr_master_r_resp;                   // input
  logic [5:0]               instr_master_r_id;                     // input
  logic [5:0]               instr_master_r_user;                   // input
  logic [7:0]               instr_master_r_writetoken;             // input
  logic [7:0]               instr_master_r_readpointer;            // output
  logic [1:0]               instr_master_b_resp;                   // input
  logic [5:0]               instr_master_b_id;                     // input
  logic [5:0]               instr_master_b_user;                   // input
  logic [7:0]               instr_master_b_writetoken;             // input
  logic [7:0]               instr_master_b_readpointer;            // output
  logic [31:0]              data_master_aw_addr;                   // output
  logic [2:0]               data_master_aw_prot;                   // output
  logic [3:0]               data_master_aw_region;                 // output
  logic [7:0]               data_master_aw_len;                    // output
  logic [2:0]               data_master_aw_size;                   // output
  logic [1:0]               data_master_aw_burst;                  // output
  logic [3:0]               data_master_aw_cache;                  // output
  logic [3:0]               data_master_aw_qos;                    // output
  logic [5:0]               data_master_aw_id;                     // output
  logic [5:0]               data_master_aw_user;                   // output
  logic [7:0]               data_master_aw_writetoken;             // output
  logic [7:0]               data_master_aw_readpointer;            // input
  logic [31:0]              data_master_ar_addr;                   // output
  logic [2:0]               data_master_ar_prot;                   // output
  logic [3:0]               data_master_ar_region;                 // output
  logic [7:0]               data_master_ar_len;                    // output
  logic [2:0]               data_master_ar_size;                   // output
  logic [1:0]               data_master_ar_burst;                  // output
  logic [3:0]               data_master_ar_cache;                  // output
  logic [3:0]               data_master_ar_qos;                    // output
  logic [5:0]               data_master_ar_id;                     // output
  logic [5:0]               data_master_ar_user;                   // output
  logic [7:0]               data_master_ar_writetoken;             // output
  logic [7:0]               data_master_ar_readpointer;            // input
  logic [63:0]              data_master_w_data;                    // output
  logic [7:0]               data_master_w_strb;                    // output
  logic [5:0]               data_master_w_user;                    // output
  logic [7:0]               data_master_w_writetoken;              // output
  logic [7:0]               data_master_w_readpointer;             // input
  logic [63:0]              data_master_r_data;                    // input
  logic [1:0]               data_master_r_resp;                    // input
  logic [5:0]               data_master_r_id;                      // input
  logic [5:0]               data_master_r_user;                    // input
  logic [7:0]               data_master_r_writetoken;              // input
  logic [7:0]               data_master_r_readpointer;             // output
  logic [1:0]               data_master_b_resp;                    // input
  logic [5:0]               data_master_b_id;                      // input
  logic [5:0]               data_master_b_user;                    // input
  logic [7:0]               data_master_b_writetoken;              // input
  logic [7:0]               data_master_b_readpointer;             // output

  always_comb
  begin : data_slave_if
    data_slave_aw_lock        <= data_slave.aw_lock;          // input
    data_slave_ar_lock        <= data_slave.ar_lock;          // input
    data_slave_w_last         <= data_slave.w_last;           // input
    data_slave.r_last         <= data_slave_r_last;           // output
    data_slave_aw_addr        <= data_slave.aw_addr;          // input
    data_slave_aw_prot        <= data_slave.aw_prot;          // input
    data_slave_aw_region      <= data_slave.aw_region;        // input
    data_slave_aw_len         <= data_slave.aw_len;           // input
    data_slave_aw_size        <= data_slave.aw_size;          // input
    data_slave_aw_burst       <= data_slave.aw_burst;         // input
    data_slave_aw_cache       <= data_slave.aw_cache;         // input
    data_slave_aw_qos         <= data_slave.aw_qos;           // input
    data_slave_aw_id          <= data_slave.aw_id;            // input
    data_slave_aw_user        <= data_slave.aw_user;          // input
    data_slave_aw_writetoken  <= data_slave.aw_writetoken;    // input
    data_slave.aw_readpointer <= data_slave_aw_readpointer;   // output
    data_slave_ar_addr        <= data_slave.ar_addr;          // input
    data_slave_ar_prot        <= data_slave.ar_prot;          // input
    data_slave_ar_region      <= data_slave.ar_region;        // input
    data_slave_ar_len         <= data_slave.ar_len;           // input
    data_slave_ar_size        <= data_slave.ar_size;          // input
    data_slave_ar_burst       <= data_slave.ar_burst;         // input
    data_slave_ar_cache       <= data_slave.ar_cache;         // input
    data_slave_ar_qos         <= data_slave.ar_qos;           // input
    data_slave_ar_id          <= data_slave.ar_id;            // input
    data_slave_ar_user        <= data_slave.ar_user;          // input
    data_slave_ar_writetoken  <= data_slave.ar_writetoken;    // input
    data_slave.ar_readpointer <= data_slave_ar_readpointer;   // output
    data_slave_w_data         <= data_slave.w_data;           // input
    data_slave_w_strb         <= data_slave.w_strb;           // input
    data_slave_w_user         <= data_slave.w_user;           // input
    data_slave_w_writetoken   <= data_slave.w_writetoken;     // input
    data_slave.w_readpointer  <= data_slave_w_readpointer;    // output
    data_slave.r_data         <= data_slave_r_data;           // output
    data_slave.r_resp         <= data_slave_r_resp;           // output
    data_slave.r_id           <= data_slave_r_id;             // output
    data_slave.r_user         <= data_slave_r_user;           // output
    data_slave.r_writetoken   <= data_slave_r_writetoken;     // output
    data_slave_r_readpointer  <= data_slave.r_readpointer;    // input
    data_slave.b_resp         <= data_slave_b_resp;           // output
    data_slave.b_id           <= data_slave_b_id;             // output
    data_slave.b_user         <= data_slave_b_user;           // output
    data_slave.b_writetoken   <= data_slave_b_writetoken;     // output
    data_slave_b_readpointer  <= data_slave.b_readpointer;    // input
  end

  always_comb
  begin : data_master_if
    data_master.aw_lock        <= data_master_aw_lock;          // output
    data_master.ar_lock        <= data_master_ar_lock;          // output
    data_master.w_last         <= data_master_w_last;           // output
    data_master_r_last         <= data_master.r_last;           // input
    data_master.aw_addr        <= data_master_aw_addr;          // output
    data_master.aw_prot        <= data_master_aw_prot;          // output
    data_master.aw_region      <= data_master_aw_region;        // output
    data_master.aw_len         <= data_master_aw_len;           // output
    data_master.aw_size        <= data_master_aw_size;          // output
    data_master.aw_burst       <= data_master_aw_burst;         // output
    data_master.aw_cache       <= data_master_aw_cache;         // output
    data_master.aw_qos         <= data_master_aw_qos;           // output
    data_master.aw_id          <= data_master_aw_id;            // output
    data_master.aw_user        <= data_master_aw_user;          // output
    data_master.aw_writetoken  <= data_master_aw_writetoken;    // output
    data_master_aw_readpointer <= data_master.aw_readpointer;   // input
    data_master.ar_addr        <= data_master_ar_addr;          // output
    data_master.ar_prot        <= data_master_ar_prot;          // output
    data_master.ar_region      <= data_master_ar_region;        // output
    data_master.ar_len         <= data_master_ar_len;           // output
    data_master.ar_size        <= data_master_ar_size;          // output
    data_master.ar_burst       <= data_master_ar_burst;         // output
    data_master.ar_cache       <= data_master_ar_cache;         // output
    data_master.ar_qos         <= data_master_ar_qos;           // output
    data_master.ar_id          <= data_master_ar_id;            // output
    data_master.ar_user        <= data_master_ar_user;          // output
    data_master.ar_writetoken  <= data_master_ar_writetoken;    // output
    data_master_ar_readpointer <= data_master.ar_readpointer;   // input
    data_master.w_data         <= data_master_w_data;           // output
    data_master.w_strb         <= data_master_w_strb;           // output
    data_master.w_user         <= data_master_w_user;           // output
    data_master.w_writetoken   <= data_master_w_writetoken;     // output
    data_master_w_readpointer  <= data_master.w_readpointer;    // input
    data_master_r_data         <= data_master.r_data;           // input
    data_master_r_resp         <= data_master.r_resp;           // input
    data_master_r_id           <= data_master.r_id;             // input
    data_master_r_user         <= data_master.r_user;           // input
    data_master_r_writetoken   <= data_master.r_writetoken;     // input
    data_master.r_readpointer  <= data_master_r_readpointer;    // output
    data_master_b_resp         <= data_master.b_resp;           // input
    data_master_b_id           <= data_master.b_id;             // input
    data_master_b_user         <= data_master.b_user;           // input
    data_master_b_writetoken   <= data_master.b_writetoken;     // input
    data_master.b_readpointer  <= data_master_b_readpointer;    // output
  end

  always_comb
  begin : instr_master_if
    instr_master.aw_lock        <= instr_master_aw_lock;          // output
    instr_master.ar_lock        <= instr_master_ar_lock;          // output
    instr_master.w_last         <= instr_master_w_last;           // output
    instr_master_r_last         <= instr_master.r_last;           // input
    instr_master.aw_addr        <= instr_master_aw_addr;          // output
    instr_master.aw_prot        <= instr_master_aw_prot;          // output
    instr_master.aw_region      <= instr_master_aw_region;        // output
    instr_master.aw_len         <= instr_master_aw_len;           // output
    instr_master.aw_size        <= instr_master_aw_size;          // output
    instr_master.aw_burst       <= instr_master_aw_burst;         // output
    instr_master.aw_cache       <= instr_master_aw_cache;         // output
    instr_master.aw_qos         <= instr_master_aw_qos;           // output
    instr_master.aw_id          <= instr_master_aw_id;            // output
    instr_master.aw_user        <= instr_master_aw_user;          // output
    instr_master.aw_writetoken  <= instr_master_aw_writetoken;    // output
    instr_master_aw_readpointer <= instr_master.aw_readpointer;   // input
    instr_master.ar_addr        <= instr_master_ar_addr;          // output
    instr_master.ar_prot        <= instr_master_ar_prot;          // output
    instr_master.ar_region      <= instr_master_ar_region;        // output
    instr_master.ar_len         <= instr_master_ar_len;           // output
    instr_master.ar_size        <= instr_master_ar_size;          // output
    instr_master.ar_burst       <= instr_master_ar_burst;         // output
    instr_master.ar_cache       <= instr_master_ar_cache;         // output
    instr_master.ar_qos         <= instr_master_ar_qos;           // output
    instr_master.ar_id          <= instr_master_ar_id;            // output
    instr_master.ar_user        <= instr_master_ar_user;          // output
    instr_master.ar_writetoken  <= instr_master_ar_writetoken;    // output
    instr_master_ar_readpointer <= instr_master.ar_readpointer;   // input
    instr_master.w_data         <= instr_master_w_data;           // output
    instr_master.w_strb         <= instr_master_w_strb;           // output
    instr_master.w_user         <= instr_master_w_user;           // output
    instr_master.w_writetoken   <= instr_master_w_writetoken;     // output
    instr_master_w_readpointer  <= instr_master.w_readpointer;    // input
    instr_master_r_data         <= instr_master.r_data;           // input
    instr_master_r_resp         <= instr_master.r_resp;           // input
    instr_master_r_id           <= instr_master.r_id;             // input
    instr_master_r_user         <= instr_master.r_user;           // input
    instr_master_r_writetoken   <= instr_master.r_writetoken;     // input
    instr_master.r_readpointer  <= instr_master_r_readpointer;    // output
    instr_master_b_resp         <= instr_master.b_resp;           // input
    instr_master_b_id           <= instr_master.b_id;             // input
    instr_master_b_user         <= instr_master.b_user;           // input
    instr_master_b_writetoken   <= instr_master.b_writetoken;     // input
    instr_master.b_readpointer  <= instr_master_b_readpointer;    // output
  end

`ifndef PULP_FAULTY_CLUSTER
  ulpcluster ulpcluster_i (
`else
  ulpcluster_faulty_wrap ulpcluster_i (
`endif
    .tck_i,
    .tms_i,
    .trstn_i,
    .tdi_i,
    .tdo_o,
`ifdef REMAP_ADDRESS
    .base_addr_i,
`endif
    .cluster_id_i,
    .en_sa_boot_i,
    .data_slave_aw_addr,
    .data_slave_aw_prot,
    .data_slave_aw_region,
    .data_slave_aw_len,
    .data_slave_aw_size,
    .data_slave_aw_burst,
    .data_slave_aw_cache,
    .data_slave_aw_qos,
    .data_slave_aw_id,
    .data_slave_aw_user,
    .data_slave_aw_writetoken,
    .data_slave_aw_readpointer,
    .data_slave_ar_addr,
    .data_slave_ar_prot,
    .data_slave_ar_region,
    .data_slave_ar_len,
    .data_slave_ar_size,
    .data_slave_ar_burst,
    .data_slave_ar_cache,
    .data_slave_ar_qos,
    .data_slave_ar_id,
    .data_slave_ar_user,
    .data_slave_ar_writetoken,
    .data_slave_ar_readpointer,
    .data_slave_w_data,
    .data_slave_w_strb,
    .data_slave_w_user,
    .data_slave_w_writetoken,
    .data_slave_w_readpointer,
    .data_slave_r_data,
    .data_slave_r_resp,
    .data_slave_r_id,
    .data_slave_r_user,
    .data_slave_r_writetoken,
    .data_slave_r_readpointer,
    .data_slave_b_resp,
    .data_slave_b_id,
    .data_slave_b_user,
    .data_slave_b_writetoken,
    .data_slave_b_readpointer,
    .instr_master_aw_addr,
    .instr_master_aw_prot,
    .instr_master_aw_region,
    .instr_master_aw_len,
    .instr_master_aw_size,
    .instr_master_aw_burst,
    .instr_master_aw_cache,
    .instr_master_aw_qos,
    .instr_master_aw_id,
    .instr_master_aw_user,
    .instr_master_aw_writetoken,
    .instr_master_aw_readpointer,
    .instr_master_ar_addr,
    .instr_master_ar_prot,
    .instr_master_ar_region,
    .instr_master_ar_len,
    .instr_master_ar_size,
    .instr_master_ar_burst,
    .instr_master_ar_cache,
    .instr_master_ar_qos,
    .instr_master_ar_id,
    .instr_master_ar_user,
    .instr_master_ar_writetoken,
    .instr_master_ar_readpointer,
    .instr_master_w_data,
    .instr_master_w_strb,
    .instr_master_w_user,
    .instr_master_w_writetoken,
    .instr_master_w_readpointer,
    .instr_master_r_data,
    .instr_master_r_resp,
    .instr_master_r_id,
    .instr_master_r_user,
    .instr_master_r_writetoken,
    .instr_master_r_readpointer,
    .instr_master_b_resp,
    .instr_master_b_id,
    .instr_master_b_user,
    .instr_master_b_writetoken,
    .instr_master_b_readpointer,
    .data_master_aw_addr,
    .data_master_aw_prot,
    .data_master_aw_region,
    .data_master_aw_len,
    .data_master_aw_size,
    .data_master_aw_burst,
    .data_master_aw_cache,
    .data_master_aw_qos,
    .data_master_aw_id,
    .data_master_aw_user,
    .data_master_aw_writetoken,
    .data_master_aw_readpointer,
    .data_master_ar_addr,
    .data_master_ar_prot,
    .data_master_ar_region,
    .data_master_ar_len,
    .data_master_ar_size,
    .data_master_ar_burst,
    .data_master_ar_cache,
    .data_master_ar_qos,
    .data_master_ar_id,
    .data_master_ar_user,
    .data_master_ar_writetoken,
    .data_master_ar_readpointer,
    .data_master_w_data,
    .data_master_w_strb,
    .data_master_w_user,
    .data_master_w_writetoken,
    .data_master_w_readpointer,
    .data_master_r_data,
    .data_master_r_resp,
    .data_master_r_id,
    .data_master_r_user,
    .data_master_r_writetoken,
    .data_master_r_readpointer,
    .data_master_b_resp,
    .data_master_b_id,
    .data_master_b_user,
    .data_master_b_writetoken,
    .data_master_b_readpointer,
    .clk_i,
    .clk_fast_i,
    .rst_ni,
    .test_mode_i,
    .fetch_en_i,
    .ext_events_val_i,
    .ext_events_ack_o,
    .eoc_o,
    .busy_o,
    .return_o,
    .data_slave_aw_lock,
    .data_slave_ar_lock,
    .data_slave_w_last,
    .data_slave_r_last,
    .instr_master_aw_lock,
    .instr_master_ar_lock,
    .instr_master_w_last,
    .instr_master_r_last,
    .data_master_aw_lock,
    .data_master_ar_lock,
    .data_master_w_last,
    .data_master_r_last,
    .SI,
    .SE,
    .SO
`ifdef PULP_FAULTY_CLUSTER
    ,
    .fg_clk,
    .fg_rst_n,
    .fg_glob_enable,
    .fg_cfg_if
`endif
`ifdef TRACE_EXECUTION
    ,
    .instr_trace_cycles_o,
    .instr_trace_instr_o,
    .instr_trace_pc_o,
    .instr_trace_valid_o
`endif
  );

endmodule
