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
// Module Name:    instrbus_wrap                                              //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    cluster instruction bus wrapper                            //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "ulpsoc_defines.sv"
`include "soc_bus_fpga_defines.sv"

module soc_bus_fpga_wrap
		#(
		parameter NB_CORES=4,
		parameter AXI_ADDR_WIDTH=32,
		parameter AXI_DATA_WIDTH=32,
		parameter AXI_ID_WIDTH=6,
		parameter AXI_USER_WIDTH=6
		)
		(
		input logic    clk_i,
		input logic	   rst_ni,
    
		//TARGET
		AXI_BUS.Slave  cluster_instr_slave,
    
		AXI_BUS.Slave  cluster_data_slave,
    
		AXI_BUS.Slave  soc_ext_slave,
    
		AXI_BUS.Slave  soc_rab_slave,
    
		//MASTERIATOR
		AXI_BUS.Master cluster_data_master,
    
		AXI_BUS.Master soc_l2_master,
    
		AXI_BUS.Master soc_ext_master,
    
		AXI_BUS.Master soc_rab_master
    
		);
   
	localparam AXI_STRB_WIDTH = AXI_DATA_WIDTH/8;
	localparam NB_MASTER      = `NB_MASTER;
	localparam NB_SLAVE       = `NB_SLAVE;
	localparam NB_REGION      = `NB_REGION;

	logic [NB_MASTER-1:0][7:0]                  s_master_aw_id;
	logic [NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0]   s_master_aw_addr;
	logic [NB_MASTER-1:0][7:0] 		       s_master_aw_len;
	logic [NB_MASTER-1:0][2:0] 		       s_master_aw_size;
	logic [NB_MASTER-1:0][1:0] 		       s_master_aw_burst;
	logic [NB_MASTER-1:0] 		       s_master_aw_lock;
	logic [NB_MASTER-1:0][3:0] 		       s_master_aw_cache;
	logic [NB_MASTER-1:0][2:0] 		       s_master_aw_prot;
	logic [NB_MASTER-1:0][3:0] 		       s_master_aw_region;
	logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]   s_master_aw_user;
	logic [NB_MASTER-1:0][3:0] 		       s_master_aw_qos;
	logic [NB_MASTER-1:0] 		       s_master_aw_valid;
	logic [NB_MASTER-1:0] 		       s_master_aw_ready;
   
	logic [NB_MASTER-1:0][7:0]                  s_master_ar_id;
	logic [NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0]   s_master_ar_addr;
	logic [NB_MASTER-1:0][7:0] 		       s_master_ar_len;
	logic [NB_MASTER-1:0][2:0] 		       s_master_ar_size;
	logic [NB_MASTER-1:0][1:0] 		       s_master_ar_burst;
	logic [NB_MASTER-1:0] 		       s_master_ar_lock;
	logic [NB_MASTER-1:0][3:0] 		       s_master_ar_cache;
	logic [NB_MASTER-1:0][2:0] 		       s_master_ar_prot;
	logic [NB_MASTER-1:0][3:0] 		       s_master_ar_region;
	logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]   s_master_ar_user;
	logic [NB_MASTER-1:0][3:0] 		       s_master_ar_qos;
	logic [NB_MASTER-1:0] 		       s_master_ar_valid;
	logic [NB_MASTER-1:0] 		       s_master_ar_ready;
   
	logic [NB_MASTER-1:0][AXI_DATA_WIDTH-1:0]   s_master_w_data;
	logic [NB_MASTER-1:0][AXI_STRB_WIDTH-1:0]   s_master_w_strb;
	logic [NB_MASTER-1:0] 		       s_master_w_last;
	logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]   s_master_w_user;
	logic [NB_MASTER-1:0] 		       s_master_w_valid;
	logic [NB_MASTER-1:0] 		       s_master_w_ready;
   
	logic [NB_MASTER-1:0][7:0]                  s_master_b_id;
	logic [NB_MASTER-1:0][1:0] 		       s_master_b_resp;
	logic [NB_MASTER-1:0] 		       s_master_b_valid;
	logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]   s_master_b_user;
	logic [NB_MASTER-1:0] 		       s_master_b_ready;
   
	logic [NB_MASTER-1:0][7:0]                  s_master_r_id;
	logic [NB_MASTER-1:0][AXI_DATA_WIDTH-1:0]   s_master_r_data;
	logic [NB_MASTER-1:0][1:0] 		       s_master_r_resp;
	logic [NB_MASTER-1:0] 		       s_master_r_last;
	logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]   s_master_r_user;
	logic [NB_MASTER-1:0] 		       s_master_r_valid;
	logic [NB_MASTER-1:0] 		       s_master_r_ready;
   
	logic [NB_SLAVE-1:0][5:0]                   s_slave_aw_id;
	logic [NB_SLAVE-1:0][AXI_ADDR_WIDTH-1:0]    s_slave_aw_addr;
	logic [NB_SLAVE-1:0][7:0] 		       s_slave_aw_len;
	logic [NB_SLAVE-1:0][2:0] 		       s_slave_aw_size;
	logic [NB_SLAVE-1:0][1:0] 		       s_slave_aw_burst;
	logic [NB_SLAVE-1:0] 		       s_slave_aw_lock;
	logic [NB_SLAVE-1:0][3:0] 		       s_slave_aw_cache;
	logic [NB_SLAVE-1:0][2:0] 		       s_slave_aw_prot;
	logic [NB_SLAVE-1:0][3:0] 		       s_slave_aw_region;
	logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]    s_slave_aw_user;
	logic [NB_SLAVE-1:0][3:0] 		       s_slave_aw_qos;
	logic [NB_SLAVE-1:0] 		       s_slave_aw_valid;
	logic [NB_SLAVE-1:0] 		       s_slave_aw_ready;
   
	logic [NB_SLAVE-1:0][5:0]                   s_slave_ar_id;
	logic [NB_SLAVE-1:0][AXI_ADDR_WIDTH-1:0]    s_slave_ar_addr;
	logic [NB_SLAVE-1:0][7:0] 		       s_slave_ar_len;
	logic [NB_SLAVE-1:0][2:0] 		       s_slave_ar_size;
	logic [NB_SLAVE-1:0][1:0] 		       s_slave_ar_burst;
	logic [NB_SLAVE-1:0] 		       s_slave_ar_lock;
	logic [NB_SLAVE-1:0][3:0] 		       s_slave_ar_cache;
	logic [NB_SLAVE-1:0][2:0] 		       s_slave_ar_prot;
	logic [NB_SLAVE-1:0][3:0] 		       s_slave_ar_region;
	logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]    s_slave_ar_user;
	logic [NB_SLAVE-1:0][3:0] 		       s_slave_ar_qos;
	logic [NB_SLAVE-1:0] 		       s_slave_ar_valid;
	logic [NB_SLAVE-1:0] 		       s_slave_ar_ready;
   
	logic [NB_SLAVE-1:0][AXI_DATA_WIDTH-1:0]    s_slave_w_data;
	logic [NB_SLAVE-1:0][AXI_STRB_WIDTH-1:0]    s_slave_w_strb;
	logic [NB_SLAVE-1:0] 		       s_slave_w_last;
	logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]    s_slave_w_user;
	logic [NB_SLAVE-1:0] 		       s_slave_w_valid;
	logic [NB_SLAVE-1:0] 		       s_slave_w_ready;
   
	logic [NB_SLAVE-1:0][5:0]                   s_slave_b_id;
	logic [NB_SLAVE-1:0][1:0] 		       s_slave_b_resp;
	logic [NB_SLAVE-1:0] 		       s_slave_b_valid;
	logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]    s_slave_b_user;
	logic [NB_SLAVE-1:0] 		       s_slave_b_ready;
   
	logic [NB_SLAVE-1:0][5:0]                   s_slave_r_id;
	logic [NB_SLAVE-1:0][AXI_DATA_WIDTH-1:0]    s_slave_r_data;
	logic [NB_SLAVE-1:0][1:0] 		       s_slave_r_resp;
	logic [NB_SLAVE-1:0] 		       s_slave_r_last;
	logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]    s_slave_r_user;
	logic [NB_SLAVE-1:0] 		       s_slave_r_valid;
	logic [NB_SLAVE-1:0] 		       s_slave_r_ready;

	logic [NB_REGION-1:0][NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0] s_start_addr;
	logic [NB_REGION-1:0][NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0] s_end_addr;
	logic [NB_REGION-1:0][NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0] s_valid_rule;
	logic [NB_SLAVE-1:0][NB_MASTER-1:0] 			    s_connectivity_map;
      
	assign                     { soc_ext_master.aw_id[7:0],soc_l2_master.aw_id[7:0],soc_rab_master.aw_id[7:0],cluster_data_master.aw_id[7:0] }= s_master_aw_id;
	assign                     { soc_ext_master.aw_addr,   soc_l2_master.aw_addr,   soc_rab_master.aw_addr,   cluster_data_master.aw_addr }   = s_master_aw_addr;
	assign                     { soc_ext_master.aw_len,    soc_l2_master.aw_len,    soc_rab_master.aw_len,    cluster_data_master.aw_len }    = s_master_aw_len;
	assign                     { soc_ext_master.aw_size,   soc_l2_master.aw_size,   soc_rab_master.aw_size,   cluster_data_master.aw_size }   = s_master_aw_size;
	assign                     { soc_ext_master.aw_burst,  soc_l2_master.aw_burst,  soc_rab_master.aw_burst,  cluster_data_master.aw_burst }  = s_master_aw_burst;
	assign                     { soc_ext_master.aw_lock,   soc_l2_master.aw_lock,   soc_rab_master.aw_lock,   cluster_data_master.aw_lock }   = s_master_aw_lock;
	assign                     { soc_ext_master.aw_cache,  soc_l2_master.aw_cache,  soc_rab_master.aw_cache,  cluster_data_master.aw_cache }  = s_master_aw_cache;
	assign                     { soc_ext_master.aw_prot,   soc_l2_master.aw_prot,   soc_rab_master.aw_prot,   cluster_data_master.aw_prot }   = s_master_aw_prot;
	assign                     { soc_ext_master.aw_region, soc_l2_master.aw_region, soc_rab_master.aw_region, cluster_data_master.aw_region } = s_master_aw_region;
	assign                     { soc_ext_master.aw_user,   soc_l2_master.aw_user,   soc_rab_master.aw_user,   cluster_data_master.aw_user }   = s_master_aw_user;
	assign                     { soc_ext_master.aw_qos,    soc_l2_master.aw_qos,    soc_rab_master.aw_qos,    cluster_data_master.aw_qos }    = s_master_aw_qos;
	assign                     { soc_ext_master.aw_valid,  soc_l2_master.aw_valid,  soc_rab_master.aw_valid,  cluster_data_master.aw_valid }  = s_master_aw_valid;
	assign s_master_aw_ready = { soc_ext_master.aw_ready,  soc_l2_master.aw_ready,  soc_rab_master.aw_ready,  cluster_data_master.aw_ready };
                                                                                                           
	assign                     { soc_ext_master.ar_id[7:0],soc_l2_master.ar_id[7:0],soc_rab_master.ar_id[7:0],cluster_data_master.ar_id[7:0] }= s_master_ar_id;
	assign                     { soc_ext_master.ar_addr,   soc_l2_master.ar_addr,   soc_rab_master.ar_addr,   cluster_data_master.ar_addr }   = s_master_ar_addr;
	assign                     { soc_ext_master.ar_len,    soc_l2_master.ar_len,    soc_rab_master.ar_len,    cluster_data_master.ar_len }    = s_master_ar_len;
	assign                     { soc_ext_master.ar_size,   soc_l2_master.ar_size,   soc_rab_master.ar_size,   cluster_data_master.ar_size }   = s_master_ar_size;
	assign                     { soc_ext_master.ar_burst,  soc_l2_master.ar_burst,  soc_rab_master.ar_burst,  cluster_data_master.ar_burst }  = s_master_ar_burst;
	assign                     { soc_ext_master.ar_lock,   soc_l2_master.ar_lock,   soc_rab_master.ar_lock,   cluster_data_master.ar_lock }   = s_master_ar_lock;
	assign                     { soc_ext_master.ar_cache,  soc_l2_master.ar_cache,  soc_rab_master.ar_cache,  cluster_data_master.ar_cache }  = s_master_ar_cache;
	assign                     { soc_ext_master.ar_prot,   soc_l2_master.ar_prot,   soc_rab_master.ar_prot,   cluster_data_master.ar_prot }   = s_master_ar_prot;
	assign                     { soc_ext_master.ar_region, soc_l2_master.ar_region, soc_rab_master.ar_region, cluster_data_master.ar_region } = s_master_ar_region;
	assign                     { soc_ext_master.ar_user,   soc_l2_master.ar_user,   soc_rab_master.ar_user,   cluster_data_master.ar_user }   = s_master_ar_user;
	assign                     { soc_ext_master.ar_qos,    soc_l2_master.ar_qos,    soc_rab_master.ar_qos,    cluster_data_master.ar_qos }    = s_master_ar_qos;
	assign                     { soc_ext_master.ar_valid,  soc_l2_master.ar_valid,  soc_rab_master.ar_valid,  cluster_data_master.ar_valid }  = s_master_ar_valid;
	assign s_master_ar_ready = { soc_ext_master.ar_ready,  soc_l2_master.ar_ready,  soc_rab_master.ar_ready,  cluster_data_master.ar_ready };
                                                                                                           
	assign                     { soc_ext_master.w_data,    soc_l2_master.w_data,    soc_rab_master.w_data,    cluster_data_master.w_data }    = s_master_w_data;
	assign                     { soc_ext_master.w_strb,    soc_l2_master.w_strb,    soc_rab_master.w_strb,    cluster_data_master.w_strb }    = s_master_w_strb;
	assign                     { soc_ext_master.w_last,    soc_l2_master.w_last,    soc_rab_master.w_last,    cluster_data_master.w_last }    = s_master_w_last;
	assign                     { soc_ext_master.w_user,    soc_l2_master.w_user,    soc_rab_master.w_user,    cluster_data_master.w_user }    = s_master_w_user;
	assign                     { soc_ext_master.w_valid,   soc_l2_master.w_valid,   soc_rab_master.w_valid,   cluster_data_master.w_valid }   = s_master_w_valid;
	assign s_master_w_ready  = { soc_ext_master.w_ready,   soc_l2_master.w_ready,   soc_rab_master.w_ready,   cluster_data_master.w_ready };
                                                                                                           
	assign s_master_b_id     = { soc_ext_master.b_id[7:0], soc_l2_master.b_id[7:0], soc_rab_master.b_id[7:0], cluster_data_master.b_id[7:0] };
	assign s_master_b_resp   = { soc_ext_master.b_resp,    soc_l2_master.b_resp,    soc_rab_master.b_resp,    cluster_data_master.b_resp };
	assign s_master_b_valid  = { soc_ext_master.b_valid,   soc_l2_master.b_valid,   soc_rab_master.b_valid,   cluster_data_master.b_valid };
	assign s_master_b_user   = { soc_ext_master.b_user,    soc_l2_master.b_user,    soc_rab_master.b_user,    cluster_data_master.b_user };
	assign                     { soc_ext_master.b_ready,   soc_l2_master.b_ready,   soc_rab_master.b_ready,   cluster_data_master.b_ready }   = s_master_b_ready;
                                                                                                           
	assign s_master_r_id     = { soc_ext_master.r_id[7:0], soc_l2_master.r_id[7:0], soc_rab_master.r_id[7:0], cluster_data_master.r_id[7:0] };
	assign s_master_r_data   = { soc_ext_master.r_data,    soc_l2_master.r_data,    soc_rab_master.r_data,    cluster_data_master.r_data };
	assign s_master_r_resp   = { soc_ext_master.r_resp,    soc_l2_master.r_resp,    soc_rab_master.r_resp,    cluster_data_master.r_resp };
	assign s_master_r_last   = { soc_ext_master.r_last,    soc_l2_master.r_last,    soc_rab_master.r_last,    cluster_data_master.r_last };
	assign s_master_r_user   = { soc_ext_master.r_user,    soc_l2_master.r_user,    soc_rab_master.r_user,    cluster_data_master.r_user };
	assign s_master_r_valid  = { soc_ext_master.r_valid,   soc_l2_master.r_valid,   soc_rab_master.r_valid,   cluster_data_master.r_valid };
	assign                     { soc_ext_master.r_ready,   soc_l2_master.r_ready,   soc_rab_master.r_ready,   cluster_data_master.r_ready }   = s_master_r_ready;
   
		// BINDING OF SLAVEET PORTS
	assign s_slave_aw_id     = { cluster_instr_slave.aw_id[5:0],cluster_data_slave.aw_id[5:0],soc_rab_slave.aw_id[5:0],soc_ext_slave.aw_id[5:0] };
	assign s_slave_aw_addr   = { cluster_instr_slave.aw_addr,   cluster_data_slave.aw_addr,   soc_rab_slave.aw_addr,   soc_ext_slave.aw_addr };
	assign s_slave_aw_len    = { cluster_instr_slave.aw_len,    cluster_data_slave.aw_len,    soc_rab_slave.aw_len,    soc_ext_slave.aw_len };
	assign s_slave_aw_size   = { cluster_instr_slave.aw_size,   cluster_data_slave.aw_size,   soc_rab_slave.aw_size,   soc_ext_slave.aw_size };
	assign s_slave_aw_burst  = { cluster_instr_slave.aw_burst,  cluster_data_slave.aw_burst,  soc_rab_slave.aw_burst,  soc_ext_slave.aw_burst };
	assign s_slave_aw_lock   = { cluster_instr_slave.aw_lock,   cluster_data_slave.aw_lock,   soc_rab_slave.aw_lock,   soc_ext_slave.aw_lock };
	assign s_slave_aw_cache  = { cluster_instr_slave.aw_cache,  cluster_data_slave.aw_cache,  soc_rab_slave.aw_cache,  soc_ext_slave.aw_cache };
	assign s_slave_aw_prot   = { cluster_instr_slave.aw_prot,   cluster_data_slave.aw_prot,   soc_rab_slave.aw_prot,   soc_ext_slave.aw_prot };
	assign s_slave_aw_region = { cluster_instr_slave.aw_region, cluster_data_slave.aw_region, soc_rab_slave.aw_region, soc_ext_slave.aw_region };
	assign s_slave_aw_user   = { cluster_instr_slave.aw_user,   cluster_data_slave.aw_user,   soc_rab_slave.aw_user,   soc_ext_slave.aw_user };
	assign s_slave_aw_qos    = { cluster_instr_slave.aw_qos,    cluster_data_slave.aw_qos,    soc_rab_slave.aw_qos,    soc_ext_slave.aw_qos };
	assign s_slave_aw_valid  = { cluster_instr_slave.aw_valid,  cluster_data_slave.aw_valid,  soc_rab_slave.aw_valid,  soc_ext_slave.aw_valid };
	assign                     { cluster_instr_slave.aw_ready,  cluster_data_slave.aw_ready,  soc_rab_slave.aw_ready,  soc_ext_slave.aw_ready } =  s_slave_aw_ready;
                                                                                                                
	assign s_slave_ar_id     = { cluster_instr_slave.ar_id[5:0],cluster_data_slave.ar_id[5:0],soc_rab_slave.ar_id[5:0],soc_ext_slave.ar_id[5:0] };
	assign s_slave_ar_addr   = { cluster_instr_slave.ar_addr,   cluster_data_slave.ar_addr,   soc_rab_slave.ar_addr,   soc_ext_slave.ar_addr };
	assign s_slave_ar_len    = { cluster_instr_slave.ar_len,    cluster_data_slave.ar_len,    soc_rab_slave.ar_len,    soc_ext_slave.ar_len };
	assign s_slave_ar_size   = { cluster_instr_slave.ar_size,   cluster_data_slave.ar_size,   soc_rab_slave.ar_size,   soc_ext_slave.ar_size };
	assign s_slave_ar_burst  = { cluster_instr_slave.ar_burst,  cluster_data_slave.ar_burst,  soc_rab_slave.ar_burst,  soc_ext_slave.ar_burst };
	assign s_slave_ar_lock   = { cluster_instr_slave.ar_lock,   cluster_data_slave.ar_lock,   soc_rab_slave.ar_lock,   soc_ext_slave.ar_lock };
	assign s_slave_ar_cache  = { cluster_instr_slave.ar_cache,  cluster_data_slave.ar_cache,  soc_rab_slave.ar_cache,  soc_ext_slave.ar_cache };
	assign s_slave_ar_prot   = { cluster_instr_slave.ar_prot,   cluster_data_slave.ar_prot,   soc_rab_slave.ar_prot,   soc_ext_slave.ar_prot };
	assign s_slave_ar_region = { cluster_instr_slave.ar_region, cluster_data_slave.ar_region, soc_rab_slave.ar_region, soc_ext_slave.ar_region };
	assign s_slave_ar_user   = { cluster_instr_slave.ar_user,   cluster_data_slave.ar_user,   soc_rab_slave.ar_user,   soc_ext_slave.ar_region };
	assign s_slave_ar_qos    = { cluster_instr_slave.ar_qos,    cluster_data_slave.ar_qos,    soc_rab_slave.ar_qos,    soc_ext_slave.ar_qos };
	assign s_slave_ar_valid  = { cluster_instr_slave.ar_valid,  cluster_data_slave.ar_valid,  soc_rab_slave.ar_valid,  soc_ext_slave.ar_valid };
	assign                     { cluster_instr_slave.ar_ready,  cluster_data_slave.ar_ready,  soc_rab_slave.ar_ready,  soc_ext_slave.ar_ready } = s_slave_ar_ready;
                                                                                                                
	assign s_slave_w_data    = { cluster_instr_slave.w_data,    cluster_data_slave.w_data,    soc_rab_slave.w_data,    soc_ext_slave.w_data };
	assign s_slave_w_strb    = { cluster_instr_slave.w_strb,    cluster_data_slave.w_strb,    soc_rab_slave.w_strb,    soc_ext_slave.w_strb };
	assign s_slave_w_last    = { cluster_instr_slave.w_last,    cluster_data_slave.w_last,    soc_rab_slave.w_last,    soc_ext_slave.w_last };
	assign s_slave_w_user    = { cluster_instr_slave.w_user,    cluster_data_slave.w_user,    soc_rab_slave.w_user,    soc_ext_slave.w_user };
	assign s_slave_w_valid   = { cluster_instr_slave.w_valid,   cluster_data_slave.w_valid,   soc_rab_slave.w_valid,   soc_ext_slave.w_valid };
	assign                     { cluster_instr_slave.w_ready,   cluster_data_slave.w_ready,   soc_rab_slave.w_ready,   soc_ext_slave.w_ready }  = s_slave_w_ready;
                                                                                                                
	assign                     { cluster_instr_slave.b_id[5:0], cluster_data_slave.b_id[5:0], soc_rab_slave.b_id[5:0], soc_ext_slave.b_id[5:0] }= s_slave_b_id;
	assign                     { cluster_instr_slave.b_resp,    cluster_data_slave.b_resp,    soc_rab_slave.b_resp,    soc_ext_slave.b_resp }   = s_slave_b_resp;
	assign                     { cluster_instr_slave.b_valid,   cluster_data_slave.b_valid,   soc_rab_slave.b_valid,   soc_ext_slave.b_valid }  = s_slave_b_valid;
	assign                     { cluster_instr_slave.b_user,    cluster_data_slave.b_user,    soc_rab_slave.b_user,    soc_ext_slave.b_user }   = s_slave_b_user;
	assign s_slave_b_ready   = { cluster_instr_slave.b_ready,   cluster_data_slave.b_ready,   soc_rab_slave.b_ready,   soc_ext_slave.b_ready };
                                                                                                                
	assign                     { cluster_instr_slave.r_id[5:0], cluster_data_slave.r_id[5:0], soc_rab_slave.r_id[5:0], soc_ext_slave.r_id[5:0] }= s_slave_r_id;
	assign                     { cluster_instr_slave.r_data,    cluster_data_slave.r_data,    soc_rab_slave.r_data,    soc_ext_slave.r_data }   = s_slave_r_data;
	assign                     { cluster_instr_slave.r_resp,    cluster_data_slave.r_resp,    soc_rab_slave.r_resp,    soc_ext_slave.r_resp }   = s_slave_r_resp;
	assign                     { cluster_instr_slave.r_last,    cluster_data_slave.r_last,    soc_rab_slave.r_last,    soc_ext_slave.r_last }   = s_slave_r_last;
	assign                     { cluster_instr_slave.r_user,    cluster_data_slave.r_user,    soc_rab_slave.r_user,    soc_ext_slave.r_user }   = s_slave_r_user;
	assign                     { cluster_instr_slave.r_valid,   cluster_data_slave.r_valid,   soc_rab_slave.r_valid,   soc_ext_slave.r_valid }  = s_slave_r_valid;
	assign s_slave_r_ready   = { cluster_instr_slave.r_ready,   cluster_data_slave.r_ready,   soc_rab_slave.r_ready,   soc_ext_slave.r_ready };
   
		//********************************************************
		//**************** SOC BUS *******************************
		//********************************************************
   
	axi_node
		#(
			.AXI_ADDRESS_W(32),
			.AXI_DATA_W(64),
			.AXI_LITE_ADDRESS_W(32),
			.AXI_LITE_DATA_W(32),
			.N_INIT_PORT(NB_MASTER),
			.N_TARG_PORT(NB_SLAVE),
			.AXI_ID_IN(6),
			.AXI_USER_W(AXI_USER_WIDTH),
			.N_REGION(NB_REGION)
			)
		soc_bus_i
		(
			.clk(clk_i),
			.rst_n(rst_ni),
      
			.targ_awid_i(s_slave_aw_id),
			.targ_awaddr_i(s_slave_aw_addr),
			.targ_awlen_i(s_slave_aw_len),
			.targ_awsize_i(s_slave_aw_size),
			.targ_awburst_i(s_slave_aw_burst),
			.targ_awlock_i(s_slave_aw_lock),
			.targ_awcache_i(s_slave_aw_cache),
			.targ_awprot_i(s_slave_aw_prot),
			.targ_awregion_i(s_slave_aw_region),
			.targ_awqos_i(s_slave_aw_qos),
			.targ_awuser_i(s_slave_aw_user),
			.targ_awvalid_i(s_slave_aw_valid),
			.targ_awready_o(s_slave_aw_ready),
      
			.targ_wdata_i(s_slave_w_data),
			.targ_wstrb_i(s_slave_w_strb),
			.targ_wlast_i(s_slave_w_last),
			.targ_wuser_i(s_slave_w_user),
			.targ_wvalid_i(s_slave_w_valid),
			.targ_wready_o(s_slave_w_ready),
      
			.targ_bid_o(s_slave_b_id),
			.targ_bresp_o(s_slave_b_resp),
			.targ_buser_o(s_slave_b_user),
			.targ_bvalid_o(s_slave_b_valid),
			.targ_bready_i(s_slave_b_ready),
      
			.targ_arid_i(s_slave_ar_id),
			.targ_araddr_i(s_slave_ar_addr),
			.targ_arlen_i(s_slave_ar_len),
			.targ_arsize_i(s_slave_ar_size),
			.targ_arburst_i(s_slave_ar_burst),
			.targ_arlock_i(s_slave_ar_lock),
			.targ_arcache_i(s_slave_ar_cache),
			.targ_arprot_i(s_slave_ar_prot),
			.targ_arregion_i(s_slave_ar_region),
			.targ_aruser_i(s_slave_ar_user),
			.targ_arqos_i(s_slave_ar_qos),
			.targ_arvalid_i(s_slave_ar_valid),
			.targ_arready_o(s_slave_ar_ready),
      
			.targ_rid_o(s_slave_r_id),
			.targ_rdata_o(s_slave_r_data),
			.targ_rresp_o(s_slave_r_resp),
			.targ_rlast_o(s_slave_r_last),
			.targ_ruser_o(s_slave_r_user),
			.targ_rvalid_o(s_slave_r_valid),
			.targ_rready_i(s_slave_r_ready),
      
			.init_awid_o(s_master_aw_id),
			.init_awaddr_o(s_master_aw_addr),
			.init_awlen_o(s_master_aw_len),
			.init_awsize_o(s_master_aw_size),
			.init_awburst_o(s_master_aw_burst),
			.init_awlock_o(s_master_aw_lock),
			.init_awcache_o(s_master_aw_cache),
			.init_awprot_o(s_master_aw_prot),
			.init_awregion_o(s_master_aw_region),
			.init_awqos_o(s_master_aw_qos),
			.init_awuser_o(s_master_aw_user),
			.init_awvalid_o(s_master_aw_valid),
			.init_awready_i(s_master_aw_ready),
      
			.init_wdata_o(s_master_w_data),
			.init_wstrb_o(s_master_w_strb),
			.init_wlast_o(s_master_w_last),
			.init_wuser_o(s_master_w_user),
			.init_wvalid_o(s_master_w_valid),
			.init_wready_i(s_master_w_ready),
      
			.init_bid_i(s_master_b_id),
			.init_bresp_i(s_master_b_resp),
			.init_buser_i(s_master_b_user),
			.init_bvalid_i(s_master_b_valid),
			.init_bready_o(s_master_b_ready),
      
			.init_arid_o(s_master_ar_id),
			.init_araddr_o(s_master_ar_addr),
			.init_arlen_o(s_master_ar_len),
			.init_arsize_o(s_master_ar_size),
			.init_arburst_o(s_master_ar_burst),
			.init_arlock_o(s_master_ar_lock),
			.init_arcache_o(s_master_ar_cache),
			.init_arprot_o(s_master_ar_prot),
			.init_arregion_o(s_master_ar_region),
			.init_aruser_o(s_master_ar_user),
			.init_arqos_o(s_master_ar_qos),
			.init_arvalid_o(s_master_ar_valid),
			.init_arready_i(s_master_ar_ready),
      
			.init_rid_i(s_master_r_id),
			.init_rdata_i(s_master_r_data),
			.init_rresp_i(s_master_r_resp),
			.init_rlast_i(s_master_r_last),
			.init_ruser_i(s_master_r_user),
			.init_rvalid_i(s_master_r_valid),
			.init_rready_o(s_master_r_ready),
      
			.s_axi_awaddr('0),
			.s_axi_awvalid('0),
			.s_axi_awready(),
			.s_axi_wdata('0),
			.s_axi_wstrb('0),
			.s_axi_wvalid('0),
			.s_axi_wready(),
			.s_axi_bresp(),
			.s_axi_bvalid(),
			.s_axi_bready('1),
			.s_axi_araddr('0),
			.s_axi_arvalid('0),
			.s_axi_arready(),
			.s_axi_rdata(),
			.s_axi_rresp(),
			.s_axi_rvalid(),
			.s_axi_rready('1),
      
			.init_START_ADDR_i(s_start_addr),
			.init_END_ADDR_i(s_end_addr),
			.init_valid_rule_i(s_valid_rule),
			.init_connectivity_map_i(s_connectivity_map)
            
			);
   
	assign s_start_addr[0][0] = `MASTER_0_START_ADDR;
	assign s_end_addr[0][0]   = `MASTER_0_END_ADDR;
   
	assign s_start_addr[0][1] = `MASTER_1_START_ADDR;
	assign s_end_addr[0][1]   = `MASTER_1_END_ADDR;
   
	assign s_start_addr[0][2] = `MASTER_2_START_ADDR;
	assign s_end_addr[0][2]   = `MASTER_2_END_ADDR;
   
	assign s_start_addr[0][3] = `MASTER_3_START_ADDR;
	assign s_end_addr[0][3]   = `MASTER_3_END_ADDR;
   
	assign s_valid_rule       = '1;
   
	assign s_connectivity_map = '1;
   
endmodule
