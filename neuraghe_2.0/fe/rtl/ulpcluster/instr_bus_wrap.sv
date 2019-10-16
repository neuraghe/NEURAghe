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
`include "instr_bus_defines.sv"

module instr_bus_wrap
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
    
    AXI_BUS.Slave  instr_slave[NB_CORES-1:0],
    
    AXI_BUS.Master instr_master
    );
   
   localparam AXI_STRB_WIDTH = AXI_DATA_WIDTH/8;
   localparam NB_SLAVE       = NB_CORES;
   localparam NB_MASTER      = 1;
   localparam NB_REGION      = `NB_REGION;
   
   logic [NB_SLAVE-1:0][3:0]                   s_slave_aw_id;
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
   
   logic [NB_SLAVE-1:0][3:0]                   s_slave_ar_id;
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
   
   logic [NB_SLAVE-1:0][3:0]                   s_slave_b_id;
   logic [NB_SLAVE-1:0][1:0] 		       s_slave_b_resp;
   logic [NB_SLAVE-1:0] 		       s_slave_b_valid;
   logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]    s_slave_b_user;
   logic [NB_SLAVE-1:0] 		       s_slave_b_ready;
   
   logic [NB_SLAVE-1:0][3:0]                   s_slave_r_id;
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
   
   genvar 						    i;
   
   generate
      
      for (i=0; i<NB_CORES; i++)
	
	begin : INSTR_BUS_BIND
	   
	   assign s_slave_aw_id[i]        = instr_slave[i].aw_id[3:0];
	   assign s_slave_aw_addr[i]      = instr_slave[i].aw_addr;
	   assign s_slave_aw_len[i]       = instr_slave[i].aw_len;
	   assign s_slave_aw_size[i]      = instr_slave[i].aw_size;
	   assign s_slave_aw_burst[i]     = instr_slave[i].aw_burst;
	   assign s_slave_aw_lock[i]      = instr_slave[i].aw_lock;
	   assign s_slave_aw_cache[i]     = instr_slave[i].aw_cache;
	   assign s_slave_aw_prot[i]      = instr_slave[i].aw_prot;
	   assign s_slave_aw_region[i]    = instr_slave[i].aw_region;
	   assign s_slave_aw_user[i]      = instr_slave[i].aw_user;
	   assign s_slave_aw_qos[i]       = instr_slave[i].aw_qos;
	   assign s_slave_aw_valid[i]     = instr_slave[i].aw_valid;
	   assign instr_slave[i].aw_ready = s_slave_aw_ready[i];
	   
	   assign s_slave_ar_id[i]        = instr_slave[i].ar_id[3:0];
	   assign s_slave_ar_addr[i]      = instr_slave[i].ar_addr;
	   assign s_slave_ar_len[i]       = instr_slave[i].ar_len;
	   assign s_slave_ar_size[i]      = instr_slave[i].ar_size;
	   assign s_slave_ar_burst[i]     = instr_slave[i].ar_burst;
	   assign s_slave_ar_lock[i]      = instr_slave[i].ar_lock;
	   assign s_slave_ar_cache[i]     = instr_slave[i].ar_cache;
	   assign s_slave_ar_prot[i]      = instr_slave[i].ar_prot;
	   assign s_slave_ar_region[i]    = instr_slave[i].ar_region;
	   assign s_slave_ar_user[i]      = instr_slave[i].ar_user;
	   assign s_slave_ar_qos[i]       = instr_slave[i].ar_qos;
	   assign s_slave_ar_valid[i]     = instr_slave[i].ar_valid;
	   assign instr_slave[i].ar_ready = s_slave_ar_ready[i];
	   
	   assign s_slave_w_data[i]       = instr_slave[i].w_data;
	   assign s_slave_w_strb[i]       = instr_slave[i].w_strb;
	   assign s_slave_w_last[i]       = instr_slave[i].w_last;
	   assign s_slave_w_user[i]       = instr_slave[i].w_user;
	   assign s_slave_w_valid[i]      = instr_slave[i].w_valid;
	   assign instr_slave[i].w_ready  = s_slave_w_ready[i];
	   
	   assign instr_slave[i].b_id[3:0]= s_slave_b_id[i];
	   assign instr_slave[i].b_resp   = s_slave_b_resp[i];
	   assign instr_slave[i].b_valid  = s_slave_b_valid[i];
	   assign instr_slave[i].b_user   = s_slave_b_user[i];
	   assign s_slave_b_ready[i]      = instr_slave[i].b_ready;
	   
	   assign instr_slave[i].r_id[3:0]= s_slave_r_id[i];
	   assign instr_slave[i].r_data   = s_slave_r_data[i];
	   assign instr_slave[i].r_resp   = s_slave_r_resp[i];
	   assign instr_slave[i].r_last   = s_slave_r_last[i];
	   assign instr_slave[i].r_user   = s_slave_r_user[i];
	   assign instr_slave[i].r_valid  = s_slave_r_valid[i];
	   assign s_slave_r_ready[i]      = instr_slave[i].r_ready;
	   
	end
      
   endgenerate
   
   //********************************************************
   //**************** CLUSTER INSTRUCTION BUS ***************
   //********************************************************
   
   axi_node
     #(
       .AXI_ADDRESS_W(32),
       .AXI_DATA_W(64),
       .AXI_LITE_ADDRESS_W(32),
       .AXI_LITE_DATA_W(32),
       .N_INIT_PORT(1),
       .N_TARG_PORT(NB_CORES),
       .AXI_ID_IN(4),
       .AXI_USER_W(AXI_USER_WIDTH),
       .N_REGION(2)
       )
   instr_bus_i
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
      
      .init_awid_o(instr_master.aw_id[5:0]),
      .init_awaddr_o(instr_master.aw_addr),
      .init_awlen_o(instr_master.aw_len),
      .init_awsize_o(instr_master.aw_size),
      .init_awburst_o(instr_master.aw_burst),
      .init_awlock_o(instr_master.aw_lock),
      .init_awcache_o(instr_master.aw_cache),
      .init_awprot_o(instr_master.aw_prot),
      .init_awregion_o(instr_master.aw_region),
      .init_awuser_o(instr_master.aw_user),
      .init_awqos_o(instr_master.aw_qos),
      .init_awvalid_o(instr_master.aw_valid),
      .init_awready_i(instr_master.aw_ready),
      
      .init_wdata_o(instr_master.w_data),
      .init_wstrb_o(instr_master.w_strb),
      .init_wlast_o(instr_master.w_last),
      .init_wuser_o(instr_master.w_user),
      .init_wvalid_o(instr_master.w_valid),
      .init_wready_i(instr_master.w_ready),
      
      .init_bid_i(instr_master.b_id[5:0]),
      .init_bresp_i(instr_master.b_resp),
      .init_buser_i(instr_master.b_user),
      .init_bvalid_i(instr_master.b_valid),
      .init_bready_o(instr_master.b_ready),
      
      .init_arid_o(instr_master.ar_id[5:0]),
      .init_araddr_o(instr_master.ar_addr),
      .init_arlen_o(instr_master.ar_len),
      .init_arsize_o(instr_master.ar_size),
      .init_arburst_o(instr_master.ar_burst),
      .init_arlock_o(instr_master.ar_lock),
      .init_arcache_o(instr_master.ar_cache),
      .init_arprot_o(instr_master.ar_prot),
      .init_arregion_o(instr_master.ar_region),
      .init_aruser_o(instr_master.ar_user),
      .init_arqos_o(instr_master.ar_qos),
      .init_arvalid_o(instr_master.ar_valid),
      .init_arready_i(instr_master.ar_ready),
      
      .init_rid_i(instr_master.r_id[5:0]),
      .init_rdata_i(instr_master.r_data),
      .init_rresp_i(instr_master.r_resp),
      .init_rlast_i(instr_master.r_last),
      .init_ruser_i(instr_master.r_user),
      .init_rvalid_i(instr_master.r_valid),
      .init_rready_o(instr_master.r_ready),
      
      .s_axi_awaddr('0),
      .s_axi_awvalid('0),
      .s_axi_awready(),
      .s_axi_wdata('0),
      .s_axi_wstrb('0),
      .s_axi_wvalid('0),
      .s_axi_wready(),
      .s_axi_bresp(),
      .s_axi_bvalid(),
      .s_axi_bready('0),
      .s_axi_araddr('0),
      .s_axi_arvalid('0),
      .s_axi_arready(),
      .s_axi_rdata(),
      .s_axi_rresp(),
      .s_axi_rvalid(),
      .s_axi_rready('0),
      
      .init_START_ADDR_i(s_start_addr),
      .init_END_ADDR_i(s_end_addr),
      .init_valid_rule_i(s_valid_rule),
      .init_connectivity_map_i(s_connectivity_map)
      
      );
   
     // MASTER 0
     assign s_valid_rule[0][0] = 1;
     assign s_start_addr[0][0] = `MASTER_0_REGION_0_START_ADDR;
     assign s_end_addr  [0][0] = `MASTER_0_REGION_0_END_ADDR;
   
     assign s_valid_rule[1][0] = 1;
     assign s_start_addr[1][0] = `MASTER_0_REGION_1_START_ADDR;
     assign s_end_addr  [1][0] = `MASTER_0_REGION_1_END_ADDR; 
   
   assign s_connectivity_map = '1;
   
endmodule
