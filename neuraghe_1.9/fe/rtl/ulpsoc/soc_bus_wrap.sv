////////////////////////////////////////////////////////////////////////////////
// Company:        Multitherman Laboratory @ DEIS - University of Bologna     //
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Davide Rossi - davide.rossi@unibo.it                       //
//                                                                            //
// Additional contributions by:                                               //
//                 Igor Loi        - igor.loi@unibo.it                        //
//                 Antonio Pullini - pullinia@iis.ee.ethz.ch                  //
//                 Francesco Conti - f.conti@unibo.it                         //
//                                                                            //
//                                                                            //
// Create Date:    13/02/2013                                                 //
// Design Name:    ULPSoC                                                     //
// Module Name:    instrbus_wrap                                              //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    cluster instruction bus wrapper                            //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - Cluster now uses 10bit for ID. SOC slaves need 12 bits     //
//                 Removed tabs, improved identations (23/02/2015)            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "soc_bus_defines.sv"

module soc_bus_wrap
#(
   parameter AXI_ADDR_WIDTH  = 32,
   parameter AXI_DATA_WIDTH  = 32,
   parameter AXI_ID_WIDTH    = 10,
   parameter AXI_USER_WIDTH  = 6
)
(
    input logic       clk_i,
    input logic       rst_ni,
    input logic       test_en_i,

    //TARGET   --> AXI ID = 10bit
  //  AXI_BUS.Slave    cluster_instr_slave,
    AXI_BUS.Slave    cluster_data_slave,
    AXI_BUS.Slave    soc_ps_slave,

    AXI_BUS.Master   core_dmem_master,
    AXI_BUS.Master   soc_ps_master,
    AXI_BUS.Master   soc_stdout_master,
    AXI_BUS.Master   core_imem_master,
    AXI_BUS.Master   periph_master,
    AXI_BUS.Master   wei_dma_master
);

   localparam AXI_STRB_WIDTH = AXI_DATA_WIDTH/8;
   localparam NB_MASTER      = `NB_MASTER;
   localparam NB_SLAVE       = `NB_SLAVE;
   localparam NB_REGION      = `NB_REGION;
   //AXI ID WIDTHs for master and slave IPS
   localparam AXI_ID_WIDTH_TARG =   6;
   
   
   localparam AXI_ID_WIDTH_INIT =   AXI_ID_WIDTH_TARG + $clog2(NB_SLAVE); // 8;

   //Signals to L2,STDOUT
   logic [NB_MASTER-1:0][AXI_ID_WIDTH_INIT-1:0]              s_master_aw_id;
   logic [NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0]                 s_master_aw_addr;
   logic [NB_MASTER-1:0][7:0]                                s_master_aw_len;
   logic [NB_MASTER-1:0][2:0]                                s_master_aw_size;
   logic [NB_MASTER-1:0][1:0]                                s_master_aw_burst;
   logic [NB_MASTER-1:0]                                     s_master_aw_lock;
   logic [NB_MASTER-1:0][3:0]                                s_master_aw_cache;
   logic [NB_MASTER-1:0][2:0]                                s_master_aw_prot;
   logic [NB_MASTER-1:0][3:0]                                s_master_aw_region;
   logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]                 s_master_aw_user;
   logic [NB_MASTER-1:0][3:0]                                s_master_aw_qos;
   logic [NB_MASTER-1:0]                                     s_master_aw_valid;
   logic [NB_MASTER-1:0]                                     s_master_aw_ready;

   logic [NB_MASTER-1:0][AXI_ID_WIDTH_INIT-1:0]              s_master_ar_id;
   logic [NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0]                 s_master_ar_addr;
   logic [NB_MASTER-1:0][7:0]                                s_master_ar_len;
   logic [NB_MASTER-1:0][2:0]                                s_master_ar_size;
   logic [NB_MASTER-1:0][1:0]                                s_master_ar_burst;
   logic [NB_MASTER-1:0]                                     s_master_ar_lock;
   logic [NB_MASTER-1:0][3:0]                                s_master_ar_cache;
   logic [NB_MASTER-1:0][2:0]                                s_master_ar_prot;
   logic [NB_MASTER-1:0][3:0]                                s_master_ar_region;
   logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]                 s_master_ar_user;
   logic [NB_MASTER-1:0][3:0]                                s_master_ar_qos;
   logic [NB_MASTER-1:0]                                     s_master_ar_valid;
   logic [NB_MASTER-1:0]                                     s_master_ar_ready;

   logic [NB_MASTER-1:0][AXI_DATA_WIDTH-1:0]                 s_master_w_data;
   logic [NB_MASTER-1:0][AXI_STRB_WIDTH-1:0]                 s_master_w_strb;
   logic [NB_MASTER-1:0]                                     s_master_w_last;
   logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]                 s_master_w_user;
   logic [NB_MASTER-1:0]                                     s_master_w_valid;
   logic [NB_MASTER-1:0]                                     s_master_w_ready;

   logic [NB_MASTER-1:0][AXI_ID_WIDTH_INIT-1:0]              s_master_b_id;
   logic [NB_MASTER-1:0][1:0]                                s_master_b_resp;
   logic [NB_MASTER-1:0]                                     s_master_b_valid;
   logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]                 s_master_b_user;
   logic [NB_MASTER-1:0]                                     s_master_b_ready;

   logic [NB_MASTER-1:0][AXI_ID_WIDTH_INIT-1:0]              s_master_r_id;
   logic [NB_MASTER-1:0][AXI_DATA_WIDTH-1:0]                 s_master_r_data;
   logic [NB_MASTER-1:0][1:0]                                s_master_r_resp;
   logic [NB_MASTER-1:0]                                     s_master_r_last;
   logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]                 s_master_r_user;
   logic [NB_MASTER-1:0]                                     s_master_r_valid;
   logic [NB_MASTER-1:0]                                     s_master_r_ready;

   //Signals from cluster instr bus and cluster data bus
   logic [NB_SLAVE-1:0][AXI_ID_WIDTH_TARG-1:0]               s_slave_aw_id;
   logic [NB_SLAVE-1:0][AXI_ADDR_WIDTH-1:0]                  s_slave_aw_addr;
   logic [NB_SLAVE-1:0][7:0]                                 s_slave_aw_len;
   logic [NB_SLAVE-1:0][2:0]                                 s_slave_aw_size;
   logic [NB_SLAVE-1:0][1:0]                                 s_slave_aw_burst;
   logic [NB_SLAVE-1:0]                                      s_slave_aw_lock;
   logic [NB_SLAVE-1:0][3:0]                                 s_slave_aw_cache;
   logic [NB_SLAVE-1:0][2:0]                                 s_slave_aw_prot;
   logic [NB_SLAVE-1:0][3:0]                                 s_slave_aw_region;
   logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]                  s_slave_aw_user;
   logic [NB_SLAVE-1:0][3:0]                                 s_slave_aw_qos;
   logic [NB_SLAVE-1:0]                                      s_slave_aw_valid;
   logic [NB_SLAVE-1:0]                                      s_slave_aw_ready;

   logic [NB_SLAVE-1:0][AXI_ID_WIDTH_TARG-1:0]               s_slave_ar_id;
   logic [NB_SLAVE-1:0][AXI_ADDR_WIDTH-1:0]                  s_slave_ar_addr;
   logic [NB_SLAVE-1:0][7:0]                                 s_slave_ar_len;
   logic [NB_SLAVE-1:0][2:0]                                 s_slave_ar_size;
   logic [NB_SLAVE-1:0][1:0]                                 s_slave_ar_burst;
   logic [NB_SLAVE-1:0]                                      s_slave_ar_lock;
   logic [NB_SLAVE-1:0][3:0]                                 s_slave_ar_cache;
   logic [NB_SLAVE-1:0][2:0]                                 s_slave_ar_prot;
   logic [NB_SLAVE-1:0][3:0]                                 s_slave_ar_region;
   logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]                  s_slave_ar_user;
   logic [NB_SLAVE-1:0][3:0]                                 s_slave_ar_qos;
   logic [NB_SLAVE-1:0]                                      s_slave_ar_valid;
   logic [NB_SLAVE-1:0]                                      s_slave_ar_ready;

   logic [NB_SLAVE-1:0][AXI_DATA_WIDTH-1:0]                  s_slave_w_data;
   logic [NB_SLAVE-1:0][AXI_STRB_WIDTH-1:0]                  s_slave_w_strb;
   logic [NB_SLAVE-1:0]                                      s_slave_w_last;
   logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]                  s_slave_w_user;
   logic [NB_SLAVE-1:0]                                      s_slave_w_valid;
   logic [NB_SLAVE-1:0]                                      s_slave_w_ready;

   logic [NB_SLAVE-1:0][AXI_ID_WIDTH_TARG-1:0]               s_slave_b_id;
   logic [NB_SLAVE-1:0][1:0]                                 s_slave_b_resp;
   logic [NB_SLAVE-1:0]                                      s_slave_b_valid;
   logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]                  s_slave_b_user;
   logic [NB_SLAVE-1:0]                                      s_slave_b_ready;

   logic [NB_SLAVE-1:0][AXI_ID_WIDTH_TARG-1:0]               s_slave_r_id;
   logic [NB_SLAVE-1:0][AXI_DATA_WIDTH-1:0]                  s_slave_r_data;
   logic [NB_SLAVE-1:0][1:0]                                 s_slave_r_resp;
   logic [NB_SLAVE-1:0]                                      s_slave_r_last;
   logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]                  s_slave_r_user;
   logic [NB_SLAVE-1:0]                                      s_slave_r_valid;
   logic [NB_SLAVE-1:0]                                      s_slave_r_ready;
   //Signals Used to configure the AXI node (SOC_BUS)
   logic [NB_REGION-1:0][NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0]  s_start_addr;
   logic [NB_REGION-1:0][NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0]  s_end_addr;
   logic [NB_REGION-1:0][NB_MASTER-1:0]                      s_valid_rule;
   logic [NB_SLAVE-1:0][NB_MASTER-1:0]                       s_connectivity_map;


   assign                     { wei_dma_master.aw_id[AXI_ID_WIDTH_INIT-1:0], periph_master.aw_id[AXI_ID_WIDTH_INIT-1:0],  soc_stdout_master.aw_id[AXI_ID_WIDTH_INIT-1:0], core_imem_master.aw_id[AXI_ID_WIDTH_INIT-1:0], soc_ps_master.aw_id[AXI_ID_WIDTH_INIT-1:0], core_dmem_master.aw_id[AXI_ID_WIDTH_INIT-1:0] }= s_master_aw_id;
   assign                     { wei_dma_master.aw_addr,   periph_master.aw_addr,    soc_stdout_master.aw_addr,   core_imem_master.aw_addr,    soc_ps_master.aw_addr,    core_dmem_master.aw_addr }   = s_master_aw_addr;
   assign                     { wei_dma_master.aw_len,    periph_master.aw_len,     soc_stdout_master.aw_len,    core_imem_master.aw_len,     soc_ps_master.aw_len,     core_dmem_master.aw_len }    = s_master_aw_len;
   assign                     { wei_dma_master.aw_size,   periph_master.aw_size,    soc_stdout_master.aw_size,   core_imem_master.aw_size,    soc_ps_master.aw_size,    core_dmem_master.aw_size }   = s_master_aw_size;
   assign                     { wei_dma_master.aw_burst,  periph_master.aw_burst,   soc_stdout_master.aw_burst,  core_imem_master.aw_burst,   soc_ps_master.aw_burst,   core_dmem_master.aw_burst }  = s_master_aw_burst;
   assign                     { wei_dma_master.aw_lock,   periph_master.aw_lock,    soc_stdout_master.aw_lock,   core_imem_master.aw_lock,    soc_ps_master.aw_lock,    core_dmem_master.aw_lock }   = s_master_aw_lock;
   assign                     { wei_dma_master.aw_cache,  periph_master.aw_cache,   soc_stdout_master.aw_cache,  core_imem_master.aw_cache,   soc_ps_master.aw_cache,   core_dmem_master.aw_cache }  = s_master_aw_cache;
   assign                     { wei_dma_master.aw_prot,   periph_master.aw_prot,    soc_stdout_master.aw_prot,   core_imem_master.aw_prot,    soc_ps_master.aw_prot,    core_dmem_master.aw_prot }   = s_master_aw_prot;
   assign                     { wei_dma_master.aw_region, periph_master.aw_region,  soc_stdout_master.aw_region, core_imem_master.aw_region,  soc_ps_master.aw_region,  core_dmem_master.aw_region } = s_master_aw_region;
   assign                     { wei_dma_master.aw_user,   periph_master.aw_user,    soc_stdout_master.aw_user,   core_imem_master.aw_user,    soc_ps_master.aw_user,    core_dmem_master.aw_user }   = s_master_aw_user;
   assign                     { wei_dma_master.aw_qos,    periph_master.aw_qos,     soc_stdout_master.aw_qos,    core_imem_master.aw_qos,     soc_ps_master.aw_qos,     core_dmem_master.aw_qos }    = s_master_aw_qos;
   assign                     { wei_dma_master.aw_valid,  periph_master.aw_valid,   soc_stdout_master.aw_valid,  core_imem_master.aw_valid,   soc_ps_master.aw_valid,   core_dmem_master.aw_valid }  = s_master_aw_valid;
   assign s_master_aw_ready = { wei_dma_master.aw_ready,  periph_master.aw_ready,   soc_stdout_master.aw_ready,  core_imem_master.aw_ready,   soc_ps_master.aw_ready,   core_dmem_master.aw_ready };

   assign                     { wei_dma_master.ar_id[AXI_ID_WIDTH_INIT-1:0],periph_master.ar_id[AXI_ID_WIDTH_INIT-1:0], soc_stdout_master.ar_id[AXI_ID_WIDTH_INIT-1:0],core_imem_master.ar_id[AXI_ID_WIDTH_INIT-1:0], soc_ps_master.ar_id[AXI_ID_WIDTH_INIT-1:0], core_dmem_master.ar_id[AXI_ID_WIDTH_INIT-1:0] }= s_master_ar_id;
   assign                     { wei_dma_master.ar_addr,   periph_master.ar_addr,    soc_stdout_master.ar_addr,   core_imem_master.ar_addr,    soc_ps_master.ar_addr,    core_dmem_master.ar_addr }   = s_master_ar_addr;
   assign                     { wei_dma_master.ar_len,    periph_master.ar_len,     soc_stdout_master.ar_len,    core_imem_master.ar_len,     soc_ps_master.ar_len,     core_dmem_master.ar_len }    = s_master_ar_len;
   assign                     { wei_dma_master.ar_size,   periph_master.ar_size,    soc_stdout_master.ar_size,   core_imem_master.ar_size,    soc_ps_master.ar_size,    core_dmem_master.ar_size }   = s_master_ar_size;
   assign                     { wei_dma_master.ar_burst,  periph_master.ar_burst,   soc_stdout_master.ar_burst,  core_imem_master.ar_burst,   soc_ps_master.ar_burst,   core_dmem_master.ar_burst }  = s_master_ar_burst;
   assign                     { wei_dma_master.ar_lock,   periph_master.ar_lock,    soc_stdout_master.ar_lock,   core_imem_master.ar_lock,    soc_ps_master.ar_lock,    core_dmem_master.ar_lock }   = s_master_ar_lock;
   assign                     { wei_dma_master.ar_cache,  periph_master.ar_cache,   soc_stdout_master.ar_cache,  core_imem_master.ar_cache,   soc_ps_master.ar_cache,   core_dmem_master.ar_cache }  = s_master_ar_cache;
   assign                     { wei_dma_master.ar_prot,   periph_master.ar_prot,    soc_stdout_master.ar_prot,   core_imem_master.ar_prot,    soc_ps_master.ar_prot,    core_dmem_master.ar_prot }   = s_master_ar_prot;
   assign                     { wei_dma_master.ar_region, periph_master.ar_region,  soc_stdout_master.ar_region, core_imem_master.ar_region,  soc_ps_master.ar_region,  core_dmem_master.ar_region } = s_master_ar_region;
   assign                     { wei_dma_master.ar_user,   periph_master.ar_user,    soc_stdout_master.ar_user,   core_imem_master.ar_user,    soc_ps_master.ar_user,    core_dmem_master.ar_user }   = s_master_ar_user;
   assign                     { wei_dma_master.ar_qos,    periph_master.ar_qos,     soc_stdout_master.ar_qos,    core_imem_master.ar_qos,     soc_ps_master.ar_qos,     core_dmem_master.ar_qos }    = s_master_ar_qos;
   assign                     { wei_dma_master.ar_valid,  periph_master.ar_valid,   soc_stdout_master.ar_valid,  core_imem_master.ar_valid,   soc_ps_master.ar_valid,   core_dmem_master.ar_valid }  = s_master_ar_valid;
   assign s_master_ar_ready = { wei_dma_master.ar_ready,  periph_master.ar_ready,   soc_stdout_master.ar_ready,  core_imem_master.ar_ready,   soc_ps_master.ar_ready,   core_dmem_master.ar_ready }; 

   assign                     { wei_dma_master.w_data,    periph_master.w_data,     soc_stdout_master.w_data,    core_imem_master.w_data,     soc_ps_master.w_data,     core_dmem_master.w_data }    = s_master_w_data;
   assign                     { wei_dma_master.w_strb,    periph_master.w_strb,     soc_stdout_master.w_strb,    core_imem_master.w_strb,     soc_ps_master.w_strb,     core_dmem_master.w_strb }    = s_master_w_strb;
   assign                     { wei_dma_master.w_last,    periph_master.w_last,     soc_stdout_master.w_last,    core_imem_master.w_last,     soc_ps_master.w_last,     core_dmem_master.w_last }    = s_master_w_last;
   assign                     { wei_dma_master.w_user,    periph_master.w_user,     soc_stdout_master.w_user,    core_imem_master.w_user,     soc_ps_master.w_user,     core_dmem_master.w_user }    = s_master_w_user;
   assign                     { wei_dma_master.w_valid,   periph_master.w_valid,    soc_stdout_master.w_valid,   core_imem_master.w_valid,    soc_ps_master.w_valid,    core_dmem_master.w_valid }   = s_master_w_valid;
   assign s_master_w_ready  = { wei_dma_master.w_ready,   periph_master.w_ready,    soc_stdout_master.w_ready,   core_imem_master.w_ready,    soc_ps_master.w_ready,    core_dmem_master.w_ready }; 

   assign s_master_b_id     = { wei_dma_master.b_id[AXI_ID_WIDTH_INIT-1:0], periph_master.b_id[AXI_ID_WIDTH_INIT-1:0],  soc_stdout_master.b_id[AXI_ID_WIDTH_INIT-1:0], core_imem_master.b_id[AXI_ID_WIDTH_INIT-1:0],  soc_ps_master.b_id[AXI_ID_WIDTH_INIT-1:0],  core_dmem_master.b_id[AXI_ID_WIDTH_INIT-1:0] };
   assign s_master_b_resp   = { wei_dma_master.b_resp,    periph_master.b_resp,     soc_stdout_master.b_resp,    core_imem_master.b_resp,     soc_ps_master.b_resp,     core_dmem_master.b_resp };
   assign s_master_b_valid  = { wei_dma_master.b_valid,   periph_master.b_valid,    soc_stdout_master.b_valid,   core_imem_master.b_valid,    soc_ps_master.b_valid,    core_dmem_master.b_valid };
   assign s_master_b_user   = { wei_dma_master.b_user,    periph_master.b_user,     soc_stdout_master.b_user,    core_imem_master.b_user,     soc_ps_master.b_user,     core_dmem_master.b_user };
   assign                     { wei_dma_master.b_ready,   periph_master.b_ready,    soc_stdout_master.b_ready,   core_imem_master.b_ready,    soc_ps_master.b_ready,    core_dmem_master.b_ready }   = s_master_b_ready;

   assign s_master_r_id     = { wei_dma_master.r_id[AXI_ID_WIDTH_INIT-1:0], periph_master.r_id[AXI_ID_WIDTH_INIT-1:0],  soc_stdout_master.r_id[AXI_ID_WIDTH_INIT-1:0], core_imem_master.r_id[AXI_ID_WIDTH_INIT-1:0],  soc_ps_master.r_id[AXI_ID_WIDTH_INIT-1:0],  core_dmem_master.r_id[AXI_ID_WIDTH_INIT-1:0] };
   assign s_master_r_data   = { wei_dma_master.r_data,    periph_master.r_data,     soc_stdout_master.r_data,    core_imem_master.r_data,     soc_ps_master.r_data,     core_dmem_master.r_data };
   assign s_master_r_resp   = { wei_dma_master.r_resp,    periph_master.r_resp,     soc_stdout_master.r_resp,    core_imem_master.r_resp,     soc_ps_master.r_resp,     core_dmem_master.r_resp };
   assign s_master_r_last   = { wei_dma_master.r_last,    periph_master.r_last,     soc_stdout_master.r_last,    core_imem_master.r_last,     soc_ps_master.r_last,     core_dmem_master.r_last };
   assign s_master_r_user   = { wei_dma_master.r_user,    periph_master.r_user,     soc_stdout_master.r_user,    core_imem_master.r_user,     soc_ps_master.r_user,     core_dmem_master.r_user };
   assign s_master_r_valid  = { wei_dma_master.r_valid,   periph_master.r_valid,    soc_stdout_master.r_valid,   core_imem_master.r_valid,    soc_ps_master.r_valid,    core_dmem_master.r_valid };
   assign                     { wei_dma_master.r_ready,   periph_master.r_ready,    soc_stdout_master.r_ready,   core_imem_master.r_ready,    soc_ps_master.r_ready,    core_dmem_master.r_ready }   = s_master_r_ready;
                                                                                                                                     

   // BINDING OF SLAVEET PORTS

   assign s_slave_aw_id     = { cluster_data_slave.aw_id[AXI_ID_WIDTH_TARG-1:0], soc_ps_slave.aw_id[AXI_ID_WIDTH_TARG-1:0] };
   assign s_slave_aw_addr   = { cluster_data_slave.aw_addr,   soc_ps_slave.aw_addr    };
   assign s_slave_aw_len    = { cluster_data_slave.aw_len,    soc_ps_slave.aw_len     };
   assign s_slave_aw_size   = { cluster_data_slave.aw_size,   soc_ps_slave.aw_size    };
   assign s_slave_aw_burst  = { cluster_data_slave.aw_burst,  soc_ps_slave.aw_burst   };
   assign s_slave_aw_lock   = { cluster_data_slave.aw_lock,   soc_ps_slave.aw_lock    };
   assign s_slave_aw_cache  = { cluster_data_slave.aw_cache,  soc_ps_slave.aw_cache   };
   assign s_slave_aw_prot   = { cluster_data_slave.aw_prot,   soc_ps_slave.aw_prot    };
   assign s_slave_aw_region = { cluster_data_slave.aw_region, soc_ps_slave.aw_region  };
   assign s_slave_aw_user   = { cluster_data_slave.aw_user,   soc_ps_slave.aw_user    };
   assign s_slave_aw_qos    = { cluster_data_slave.aw_qos,    soc_ps_slave.aw_qos     };
   assign s_slave_aw_valid  = { cluster_data_slave.aw_valid,  soc_ps_slave.aw_valid   };
   assign                     { cluster_data_slave.aw_ready,  soc_ps_slave.aw_ready   } =  s_slave_aw_ready;

   assign s_slave_ar_id     = { cluster_data_slave.ar_id[AXI_ID_WIDTH_TARG-1:0], soc_ps_slave.ar_id[AXI_ID_WIDTH_TARG-1:0] };
   assign s_slave_ar_addr   = { cluster_data_slave.ar_addr,   soc_ps_slave.ar_addr    };
   assign s_slave_ar_len    = { cluster_data_slave.ar_len,    soc_ps_slave.ar_len     };
   assign s_slave_ar_size   = { cluster_data_slave.ar_size,   soc_ps_slave.ar_size    };
   assign s_slave_ar_burst  = { cluster_data_slave.ar_burst,  soc_ps_slave.ar_burst   };
   assign s_slave_ar_lock   = { cluster_data_slave.ar_lock,   soc_ps_slave.ar_lock    };
   assign s_slave_ar_cache  = { cluster_data_slave.ar_cache,  soc_ps_slave.ar_cache   };
   assign s_slave_ar_prot   = { cluster_data_slave.ar_prot,   soc_ps_slave.ar_prot    };
   assign s_slave_ar_region = { cluster_data_slave.ar_region, soc_ps_slave.ar_region  };
   assign s_slave_ar_user   = { cluster_data_slave.ar_user,   soc_ps_slave.ar_region  };
   assign s_slave_ar_qos    = { cluster_data_slave.ar_qos,    soc_ps_slave.ar_qos     };
   assign s_slave_ar_valid  = { cluster_data_slave.ar_valid,  soc_ps_slave.ar_valid   };
   assign                     { cluster_data_slave.ar_ready,  soc_ps_slave.ar_ready   } = s_slave_ar_ready;

   assign s_slave_w_data    = { cluster_data_slave.w_data,    soc_ps_slave.w_data  };
   assign s_slave_w_strb    = { cluster_data_slave.w_strb,    soc_ps_slave.w_strb  };
   assign s_slave_w_last    = { cluster_data_slave.w_last,    soc_ps_slave.w_last  };
   assign s_slave_w_user    = { cluster_data_slave.w_user,    soc_ps_slave.w_user  };
   assign s_slave_w_valid   = { cluster_data_slave.w_valid,   soc_ps_slave.w_valid };
   assign                     { cluster_data_slave.w_ready,   soc_ps_slave.w_ready }  = s_slave_w_ready;

   assign                     { cluster_data_slave.b_id[AXI_ID_WIDTH_TARG-1:0], soc_ps_slave.b_id[AXI_ID_WIDTH_TARG-1:0] } = s_slave_b_id;
   assign                     { cluster_data_slave.b_resp,    soc_ps_slave.b_resp    } = s_slave_b_resp;
   assign                     { cluster_data_slave.b_valid,   soc_ps_slave.b_valid   } = s_slave_b_valid;
   assign                     { cluster_data_slave.b_user,    soc_ps_slave.b_user    } = s_slave_b_user;
   assign s_slave_b_ready   = { cluster_data_slave.b_ready,   soc_ps_slave.b_ready   };

   assign                     { cluster_data_slave.r_id[AXI_ID_WIDTH_TARG-1:0], soc_ps_slave.r_id[AXI_ID_WIDTH_TARG-1:0] } = s_slave_r_id;
   assign                     { cluster_data_slave.r_data,    soc_ps_slave.r_data    } = s_slave_r_data;
   assign                     { cluster_data_slave.r_resp,    soc_ps_slave.r_resp    } = s_slave_r_resp;
   assign                     { cluster_data_slave.r_last,    soc_ps_slave.r_last    } = s_slave_r_last;
   assign                     { cluster_data_slave.r_user,    soc_ps_slave.r_user    } = s_slave_r_user;
   assign                     { cluster_data_slave.r_valid,   soc_ps_slave.r_valid   } = s_slave_r_valid;
   assign s_slave_r_ready   = { cluster_data_slave.r_ready,   soc_ps_slave.r_ready   };


   //********************************************************
   //**************** SOC BUS *******************************
   //********************************************************
   axi_node
   #(
      .AXI_ADDRESS_W           ( AXI_ADDR_WIDTH     ),
      .AXI_DATA_W              ( AXI_DATA_WIDTH     ),
      .AXI_NUMBYTES            ( AXI_STRB_WIDTH     ),
      .AXI_ID_IN               ( AXI_ID_WIDTH_TARG  ),
      .AXI_USER_W              ( AXI_USER_WIDTH     ),

      .N_MASTER_PORT           ( NB_MASTER          ),
      .N_SLAVE_PORT            ( NB_SLAVE           ),
      .N_REGION                ( NB_REGION          ),
      .FIFO_DEPTH_DW           ( 2                  )
   )
   soc_bus_i
   (
      .clk                     ( clk_i              ),
      .rst_n                   ( rst_ni             ),
      .test_en_i               ( test_en_i          ),

      .slave_awid_i            ( s_slave_aw_id      ),
      .slave_awaddr_i          ( s_slave_aw_addr    ),
      .slave_awlen_i           ( s_slave_aw_len     ),
      .slave_awsize_i          ( s_slave_aw_size    ),
      .slave_awburst_i         ( s_slave_aw_burst   ),
      .slave_awlock_i          ( s_slave_aw_lock    ),
      .slave_awcache_i         ( s_slave_aw_cache   ),
      .slave_awprot_i          ( s_slave_aw_prot    ),
      .slave_awregion_i        ( s_slave_aw_region  ),
      .slave_awqos_i           ( s_slave_aw_qos     ),
      .slave_awuser_i          ( s_slave_aw_user    ),
      .slave_awvalid_i         ( s_slave_aw_valid   ),
      .slave_awready_o         ( s_slave_aw_ready   ),

      .slave_wdata_i           ( s_slave_w_data     ),
      .slave_wstrb_i           ( s_slave_w_strb     ),
      .slave_wlast_i           ( s_slave_w_last     ),
      .slave_wuser_i           ( s_slave_w_user     ),
      .slave_wvalid_i          ( s_slave_w_valid    ),
      .slave_wready_o          ( s_slave_w_ready    ),

      .slave_bid_o             ( s_slave_b_id       ),
      .slave_bresp_o           ( s_slave_b_resp     ),
      .slave_buser_o           ( s_slave_b_user     ),
      .slave_bvalid_o          ( s_slave_b_valid    ),
      .slave_bready_i          ( s_slave_b_ready    ),

      .slave_arid_i            ( s_slave_ar_id      ),
      .slave_araddr_i          ( s_slave_ar_addr    ),
      .slave_arlen_i           ( s_slave_ar_len     ),
      .slave_arsize_i          ( s_slave_ar_size    ),
      .slave_arburst_i         ( s_slave_ar_burst   ),
      .slave_arlock_i          ( s_slave_ar_lock    ),
      .slave_arcache_i         ( s_slave_ar_cache   ),
      .slave_arprot_i          ( s_slave_ar_prot    ),
      .slave_arregion_i        ( s_slave_ar_region  ),
      .slave_aruser_i          ( s_slave_ar_user    ),
      .slave_arqos_i           ( s_slave_ar_qos     ),
      .slave_arvalid_i         ( s_slave_ar_valid   ),
      .slave_arready_o         ( s_slave_ar_ready   ),

      .slave_rid_o             ( s_slave_r_id       ),
      .slave_rdata_o           ( s_slave_r_data     ),
      .slave_rresp_o           ( s_slave_r_resp     ),
      .slave_rlast_o           ( s_slave_r_last     ),
      .slave_ruser_o           ( s_slave_r_user     ),
      .slave_rvalid_o          ( s_slave_r_valid    ),
      .slave_rready_i          ( s_slave_r_ready    ),

      .master_awid_o           ( s_master_aw_id     ),
      .master_awaddr_o         ( s_master_aw_addr   ),
      .master_awlen_o          ( s_master_aw_len    ),
      .master_awsize_o         ( s_master_aw_size   ),
      .master_awburst_o        ( s_master_aw_burst  ),
      .master_awlock_o         ( s_master_aw_lock   ),
      .master_awcache_o        ( s_master_aw_cache  ),
      .master_awprot_o         ( s_master_aw_prot   ),
      .master_awregion_o       ( s_master_aw_region ),
      .master_awqos_o          ( s_master_aw_qos    ),
      .master_awuser_o         ( s_master_aw_user   ),
      .master_awvalid_o        ( s_master_aw_valid  ),
      .master_awready_i        ( s_master_aw_ready  ),

      .master_wdata_o          ( s_master_w_data    ),
      .master_wstrb_o          ( s_master_w_strb    ),
      .master_wlast_o          ( s_master_w_last    ),
      .master_wuser_o          ( s_master_w_user    ),
      .master_wvalid_o         ( s_master_w_valid   ),
      .master_wready_i         ( s_master_w_ready   ),

      .master_bid_i            ( s_master_b_id      ),
      .master_bresp_i          ( s_master_b_resp    ),
      .master_buser_i          ( s_master_b_user    ),
      .master_bvalid_i         ( s_master_b_valid   ),
      .master_bready_o         ( s_master_b_ready   ),

      .master_arid_o           ( s_master_ar_id     ),
      .master_araddr_o         ( s_master_ar_addr   ),
      .master_arlen_o          ( s_master_ar_len    ),
      .master_arsize_o         ( s_master_ar_size   ),
      .master_arburst_o        ( s_master_ar_burst  ),
      .master_arlock_o         ( s_master_ar_lock   ),
      .master_arcache_o        ( s_master_ar_cache  ),
      .master_arprot_o         ( s_master_ar_prot   ),
      .master_arregion_o       ( s_master_ar_region ),
      .master_aruser_o         ( s_master_ar_user   ),
      .master_arqos_o          ( s_master_ar_qos    ),
      .master_arvalid_o        ( s_master_ar_valid  ),
      .master_arready_i        ( s_master_ar_ready  ),

      .master_rid_i            ( s_master_r_id      ),
      .master_rdata_i          ( s_master_r_data    ),
      .master_rresp_i          ( s_master_r_resp    ),
      .master_rlast_i          ( s_master_r_last    ),
      .master_ruser_i          ( s_master_r_user    ),
      .master_rvalid_i         ( s_master_r_valid   ),
      .master_rready_o         ( s_master_r_ready   ),

      .cfg_START_ADDR_i        ( s_start_addr       ),
      .cfg_END_ADDR_i          ( s_end_addr         ),
      .cfg_valid_rule_i        ( s_valid_rule       ),
      .cfg_connectivity_map_i  ( s_connectivity_map )
   );

   assign s_start_addr[0][0] = `MASTER_0_START_ADDR;
   assign   s_end_addr[0][0] = `MASTER_0_END_ADDR;

   assign s_start_addr[0][1] = `MASTER_1_START_ADDR;
   assign   s_end_addr[0][1] = `MASTER_1_END_ADDR;

   assign s_start_addr[0][2] = `MASTER_2_START_ADDR;
   assign   s_end_addr[0][2] = `MASTER_2_END_ADDR;

   assign s_start_addr[0][3] = `MASTER_3_START_ADDR;
   assign   s_end_addr[0][3] = `MASTER_3_END_ADDR;

   assign s_start_addr[0][4] = `MASTER_4_START_ADDR;
   assign   s_end_addr[0][4] = `MASTER_4_END_ADDR;

   assign s_start_addr[0][5] = `MASTER_5_START_ADDR;
   assign   s_end_addr[0][5] = `MASTER_5_END_ADDR;



   assign s_valid_rule       = '1;

   assign s_connectivity_map = '1;

endmodule
