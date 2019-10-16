`include "ulpsoc_defines.sv"

module axi_boot_addr_tran_wrap
		#(
		parameter AXI_ADDR_WIDTH = 32,
		parameter AXI_DATA_WIDTH = 64,
		parameter AXI_USER_WIDTH = 6,
		parameter AXI_ID_WIDTH   = 6
		)
		(
		input logic	         clk_i,
		input logic	         rst_ni,
		
		input logic          addr_tran_en_i,
    
		AXI_BUS.Slave        axi_slave,
		AXI_BUS.Master       axi_master
		
		);
	
	assign axi_master.aw_valid	= axi_slave.aw_valid;
	assign axi_master.aw_addr	= axi_slave.aw_addr;
	assign axi_master.aw_prot	= axi_slave.aw_prot;
	assign axi_master.aw_region = axi_slave.aw_region;
	assign axi_master.aw_len	= axi_slave.aw_len;
	assign axi_master.aw_size	= axi_slave.aw_size;
	assign axi_master.aw_burst	= axi_slave.aw_burst;
	assign axi_master.aw_lock	= axi_slave.aw_lock;
	assign axi_master.aw_cache	= axi_slave.aw_cache;
	assign axi_master.aw_qos	= axi_slave.aw_qos;
	assign axi_master.aw_id	 	= axi_slave.aw_id;
	assign axi_master.aw_user	= axi_slave.aw_user;
	assign axi_slave.aw_ready	= axi_master.aw_ready;
       
	assign axi_master.ar_valid	= axi_slave.ar_valid;
	assign axi_master.ar_addr[23:0]	= axi_slave.ar_addr[23:0];
	assign axi_master.ar_prot	= axi_slave.ar_prot;
	assign axi_master.ar_region = axi_slave.ar_region;
	assign axi_master.ar_len	= axi_slave.ar_len;
	assign axi_master.ar_size	= axi_slave.ar_size;
	assign axi_master.ar_burst	= axi_slave.ar_burst;
	assign axi_master.ar_lock	= axi_slave.ar_lock;
	assign axi_master.ar_cache	= axi_slave.ar_cache;
	assign axi_master.ar_qos	= axi_slave.ar_qos;
	assign axi_master.ar_id	 	= axi_slave.ar_id;
	assign axi_master.ar_user	= axi_slave.ar_user;
	assign axi_slave.ar_ready	= axi_master.ar_ready;
             
	assign axi_master.w_valid	= axi_slave.w_valid;
	assign axi_master.w_data	= axi_slave.w_data;
	assign axi_master.w_strb	= axi_slave.w_strb;
	assign axi_master.w_user	= axi_slave.w_user;
	assign axi_master.w_last	= axi_slave.w_last;
	assign axi_slave.w_ready	= axi_master.w_ready;
             
	assign axi_slave.r_valid	= axi_master.r_valid;
	assign axi_slave.r_data	 	= axi_master.r_data;
	assign axi_slave.r_resp	 	= axi_master.r_resp;
	assign axi_slave.r_last	 	= axi_master.r_last;
	assign axi_slave.r_id		= axi_master.r_id;
	assign axi_slave.r_user	 	= axi_master.r_user;
	assign axi_master.r_ready	= axi_slave.r_ready;
             
	assign axi_slave.b_valid 	= axi_master.b_valid;
	assign axi_slave.b_resp	 	= axi_master.b_resp;
	assign axi_slave.b_id		= axi_master.b_id;
	assign axi_slave.b_user	 	= axi_master.b_user;
	assign axi_master.b_ready	= axi_slave.b_ready;
	
	always_comb
	begin
		axi_master.ar_addr[31:24] = axi_slave.ar_addr[31:24];
		if (addr_tran_en_i)
			if (axi_slave.ar_addr[31:24] == 8'h1C)
				axi_master.ar_addr[31:24] = 8'h1A;
	end

	
	
	
endmodule