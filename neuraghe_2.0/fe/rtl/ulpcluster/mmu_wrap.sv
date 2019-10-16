`include "ulpsoc_defines.sv"

module mmu_wrap
#(
    parameter NB_CORES       = 1,
    parameter NB_DMAS        = 1
)
(
    input logic              clk_i,
    input logic              rst_ni,
    
    input logic              tcdm_enable,
    
    MMU_CONFIG_BUS.Slave     mmu_slave,
    
    XBAR_TCDM_BUS.Slave      core_xbar_slave[NB_CORES-1:0],
    
    XBAR_TCDM_BUS.Slave      dma_xbar_slave[NB_DMAS-1:0],
    
    XBAR_TCDM_BUS.Slave      ext_xbar_slave[NB_DMAS-1:0],
    
    XBAR_TCDM_BUS.Master     core_xbar_master[NB_CORES-1:0],
    
    XBAR_TCDM_BUS.Master     dma_xbar_master[NB_DMAS-1:0],
    
    XBAR_TCDM_BUS.Master     ext_xbar_master[NB_DMAS-1:0]
);
   
   localparam NB_MMUS = NB_CORES + 2*NB_DMAS;
   
   XBAR_TCDM_BUS
     s_mmu_in_xbar_tcdm_bus[NB_MMUS-1:0](),
     s_mmu_out_xbar_tcdm_bus[NB_MMUS-1:0]();

   genvar 		     i;
   
   //********************************************************
   //***************** MMUs *********************************
   //********************************************************
   
   // aggregating different arrays of interfaces not easily possible?!
   // connect MMU input and output bus arrays manually
   generate
      for (i=0;i<NB_MMUS;i++)
	begin : MMU_BUS
	   if (i < NB_CORES) 
	     begin : CORE
		// input bus going to MMU
		assign s_mmu_in_xbar_tcdm_bus[i].req                = core_xbar_slave[i].req;
		assign s_mmu_in_xbar_tcdm_bus[i].add                = core_xbar_slave[i].add;
		assign s_mmu_in_xbar_tcdm_bus[i].wen                = core_xbar_slave[i].wen;
		assign s_mmu_in_xbar_tcdm_bus[i].wdata              = core_xbar_slave[i].wdata;
		assign s_mmu_in_xbar_tcdm_bus[i].be                 = core_xbar_slave[i].be;
		assign core_xbar_slave[i].gnt                       = s_mmu_in_xbar_tcdm_bus[i].gnt;
		assign core_xbar_slave[i].r_rdata                   = s_mmu_in_xbar_tcdm_bus[i].r_rdata;
		assign core_xbar_slave[i].r_opc                     = s_mmu_in_xbar_tcdm_bus[i].r_opc;
		assign core_xbar_slave[i].r_valid                   = s_mmu_in_xbar_tcdm_bus[i].r_valid;
		// translated output bus from MMU
		assign core_xbar_master[i].req                      = s_mmu_out_xbar_tcdm_bus[i].req;
		assign core_xbar_master[i].add                      = s_mmu_out_xbar_tcdm_bus[i].add;
		assign core_xbar_master[i].wen                      = s_mmu_out_xbar_tcdm_bus[i].wen;
		assign core_xbar_master[i].wdata                    = s_mmu_out_xbar_tcdm_bus[i].wdata;
		assign core_xbar_master[i].be                       = s_mmu_out_xbar_tcdm_bus[i].be;
		assign s_mmu_out_xbar_tcdm_bus[i].gnt               = core_xbar_master[i].gnt;
		assign s_mmu_out_xbar_tcdm_bus[i].r_rdata           = core_xbar_master[i].r_rdata;
		assign s_mmu_out_xbar_tcdm_bus[i].r_opc             = core_xbar_master[i].r_opc;
		assign s_mmu_out_xbar_tcdm_bus[i].r_valid           = core_xbar_master[i].r_valid;	
	     end 
	   else if (i < NB_CORES + NB_DMAS) 
	     begin : DMA
		// input bus going to MMU
		assign s_mmu_in_xbar_tcdm_bus[i].req                = dma_xbar_slave[i-NB_CORES].req;
		assign s_mmu_in_xbar_tcdm_bus[i].add                = dma_xbar_slave[i-NB_CORES].add;
		assign s_mmu_in_xbar_tcdm_bus[i].wen                = dma_xbar_slave[i-NB_CORES].wen;
		assign s_mmu_in_xbar_tcdm_bus[i].wdata              = dma_xbar_slave[i-NB_CORES].wdata;
		assign s_mmu_in_xbar_tcdm_bus[i].be                 = dma_xbar_slave[i-NB_CORES].be;
		assign dma_xbar_slave[i-NB_CORES].gnt               = s_mmu_in_xbar_tcdm_bus[i].gnt;
		assign dma_xbar_slave[i-NB_CORES].r_rdata           = s_mmu_in_xbar_tcdm_bus[i].r_rdata;
		assign dma_xbar_slave[i-NB_CORES].r_opc             = s_mmu_in_xbar_tcdm_bus[i].r_opc;
		assign dma_xbar_slave[i-NB_CORES].r_valid           = s_mmu_in_xbar_tcdm_bus[i].r_valid;
		// translated output bus from MMU
		assign dma_xbar_master[i-NB_CORES].req              = s_mmu_out_xbar_tcdm_bus[i].req;
		assign dma_xbar_master[i-NB_CORES].add              = s_mmu_out_xbar_tcdm_bus[i].add;
		assign dma_xbar_master[i-NB_CORES].wen              = s_mmu_out_xbar_tcdm_bus[i].wen;
		assign dma_xbar_master[i-NB_CORES].wdata            = s_mmu_out_xbar_tcdm_bus[i].wdata;
		assign dma_xbar_master[i-NB_CORES].be               = s_mmu_out_xbar_tcdm_bus[i].be;
		assign s_mmu_out_xbar_tcdm_bus[i].gnt               = dma_xbar_master[i-NB_CORES].gnt;
		assign s_mmu_out_xbar_tcdm_bus[i].r_rdata           = dma_xbar_master[i-NB_CORES].r_rdata;
		assign s_mmu_out_xbar_tcdm_bus[i].r_opc             = dma_xbar_master[i-NB_CORES].r_opc;
		assign s_mmu_out_xbar_tcdm_bus[i].r_valid           = dma_xbar_master[i-NB_CORES].r_valid;	
	     end 
	   else 
	     begin : EXT
		// input bus going to MMU
		assign s_mmu_in_xbar_tcdm_bus[i].req                = ext_xbar_slave[i-(NB_CORES+NB_DMAS)].req;
		assign s_mmu_in_xbar_tcdm_bus[i].add                = ext_xbar_slave[i-(NB_CORES+NB_DMAS)].add;
		assign s_mmu_in_xbar_tcdm_bus[i].wen                = ext_xbar_slave[i-(NB_CORES+NB_DMAS)].wen;
		assign s_mmu_in_xbar_tcdm_bus[i].wdata              = ext_xbar_slave[i-(NB_CORES+NB_DMAS)].wdata;
		assign s_mmu_in_xbar_tcdm_bus[i].be                 = ext_xbar_slave[i-(NB_CORES+NB_DMAS)].be;
		assign ext_xbar_slave[i-(NB_CORES+NB_DMAS)].gnt     = s_mmu_in_xbar_tcdm_bus[i].gnt;
		assign ext_xbar_slave[i-(NB_CORES+NB_DMAS)].r_rdata = s_mmu_in_xbar_tcdm_bus[i].r_rdata;
		assign ext_xbar_slave[i-(NB_CORES+NB_DMAS)].r_opc   = s_mmu_in_xbar_tcdm_bus[i].r_opc;
		assign ext_xbar_slave[i-(NB_CORES+NB_DMAS)].r_valid = s_mmu_in_xbar_tcdm_bus[i].r_valid;
		// translated output bus from MMU
		assign ext_xbar_master[i-(NB_CORES+NB_DMAS)].req    = s_mmu_out_xbar_tcdm_bus[i].req;
		assign ext_xbar_master[i-(NB_CORES+NB_DMAS)].add    = s_mmu_out_xbar_tcdm_bus[i].add;
		assign ext_xbar_master[i-(NB_CORES+NB_DMAS)].wen    = s_mmu_out_xbar_tcdm_bus[i].wen;
		assign ext_xbar_master[i-(NB_CORES+NB_DMAS)].wdata  = s_mmu_out_xbar_tcdm_bus[i].wdata;
		assign ext_xbar_master[i-(NB_CORES+NB_DMAS)].be     = s_mmu_out_xbar_tcdm_bus[i].be;
		assign s_mmu_out_xbar_tcdm_bus[i].gnt               = ext_xbar_master[i-(NB_CORES+NB_DMAS)].gnt;
		assign s_mmu_out_xbar_tcdm_bus[i].r_rdata           = ext_xbar_master[i-(NB_CORES+NB_DMAS)].r_rdata;
		assign s_mmu_out_xbar_tcdm_bus[i].r_opc             = ext_xbar_master[i-(NB_CORES+NB_DMAS)].r_opc;
		assign s_mmu_out_xbar_tcdm_bus[i].r_valid           = ext_xbar_master[i-(NB_CORES+NB_DMAS)].r_valid;
	   end
	end
   endgenerate
   
   generate
      for (i=0;i<NB_MMUS;i++)
	begin : MMU
	   
	   mmu mmu_i
	   (

	      .clk_i(clk_i),
	      .rst_ni(rst_ni),

	      .mmu_bus(mmu_slave),
	      .tcdm_enable(tcdm_enable),

	      .xbar_tcdm_slave(s_mmu_in_xbar_tcdm_bus[i]),
	      .xbar_tcdm_master(s_mmu_out_xbar_tcdm_bus[i])

	   );
	   
	end
   endgenerate   
   
endmodule
