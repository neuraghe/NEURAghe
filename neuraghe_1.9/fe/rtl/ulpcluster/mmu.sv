////////////////////////////////////////////////////////////////////////////////
// Engineer   : Jeremy Constantin - jeremy.constantin@epfl.ch                 //
// Create Date: 2014-04-02                                                    //
// Design Name: ULPSoC                                                        // 
// Module Name: mmu                                                           //
//                                                                            //
// MMU for address translation of buses of type XBAR_TCDM_BUS                 //
////////////////////////////////////////////////////////////////////////////////

`include "ulpsoc_defines.sv"

module mmu 
  (
   input logic              clk_i,
   input logic              rst_ni,
   MMU_CONFIG_BUS.Slave     mmu_bus,
   input logic              tcdm_enable,
   XBAR_TCDM_BUS.Slave      xbar_tcdm_slave,
   XBAR_TCDM_BUS.Master     xbar_tcdm_master
   );
   
`ifdef MMU_IMPLEMENTED
   
   localparam GROUPS   = 4; // number of TCDM groups, regarding clock gating
   localparam BANKS    = `MMU_TCDM_BANKS;
   localparam BANKBITS = $clog2(BANKS);
   localparam AW       = 14; // effective address width (touched by MMU)
   // excludes last 2 bits (byte addressing part)
   
   /* parts of 32-bit address (for TCDM)
    ---------------------------------------------------------------------
    | 16b 0x1000 | 1b SRAM/SCM (0/1) | 10b row | 3b bank | 2b byte-addr |
    ---------------------------------------------------------------------
    max. word rows: 1024 (SRAM) / 256 (SCM), each with 8 banks
    */
   
   // total size of TCDM SRAM section: 2^n x BANKS x 32 bit
   // with n=10: 32 kB
   // total size of TCDM SCM section: 2^n x BANKS x 32 bit
   // with n=8: 8 kB
   
   // control signals
   logic [3:0] 		    s_sram_seqsec_size,
                            s_scm_seqsec_size,
                            s_size_idx;
   logic                    s_tcdm_group_disabled;
   logic 		    s_translate;
   logic [AW-BANKBITS-1:0]  s_space_addr;
   
   enum logic { SRAM, SCM } s_region;
   enum logic [1:0]  { FOUR, TWO, ONE }  s_sram_groups_on;
   
   // address signals
   logic [31:0] 	    s_addr_in, s_addr_out;
   logic [AW-1:0] 	    s_addr_eff, s_addr_mask, s_addr_trans, s_addr_final;
   
 `ifdef MMU_LOCAL_COPY_REGS
   // local copy registers
   logic [3:0] 		    s_sram_seqsec_size_r, s_scm_seqsec_size_r;
   logic                    s_tcdm_group_disabled_r;
   
   always_ff @(posedge clk_i, negedge rst_ni)
     begin
	if (!rst_ni) 
	begin
           s_sram_seqsec_size_r    <= 0;
           s_scm_seqsec_size_r     <= 0;
           s_tcdm_group_disabled_r <= 0;
	end 
	else 
	begin
           s_sram_seqsec_size_r    <= mmu_bus.mmu_sram_seqsec_size;
           s_scm_seqsec_size_r     <= mmu_bus.mmu_scm_seqsec_size;
           s_tcdm_group_disabled_r <= tcdm_enable
	end
     end

   assign s_sram_seqsec_size    = s_sram_seqsec_size_r;
   assign s_scm_seqsec_size     = s_scm_seqsec_size_r;
   assign s_tcdm_group_disabled = s_tcdm_group_disabled_r;	
 `else
   // no local copy registers
   assign s_sram_seqsec_size    = mmu_bus.mmu_sram_seqsec_size;
   assign s_scm_seqsec_size     = mmu_bus.mmu_scm_seqsec_size;
   assign s_tcdm_group_disabled = tcdm_enable;
 `endif

   // effective address used by MMU
   assign s_addr_eff = s_addr_in[AW+1:2];

   // decode clkgate / sram islands information into readable names
   assign s_sram_groups_on =  FOUR;

   // highest bit decides on sram or scm region
   assign s_region = (s_addr_eff[AW-1] == 1'b0) ? SRAM : SCM;
   // create bit vector using memory address, which indicates for each bit n,
   // if the memory address is outside (larger than) the region of size
   // 2^n x BANKS x 32 bit
   // for n=0 the value is always 1, which disables translation
   assign s_space_addr[0] = 1;
   // the highest bit could be derived from s_addr_eff[AW-1] (for the
   // SRAM section), which however is also the region selector
   // hence a fixed 0 is used to be able to use the same hardware
   // for both the SRAM and SCM regions at the same time
   
   assign s_space_addr[AW-BANKBITS-1] = 0;
   genvar i;
   generate
      for (i = AW-BANKBITS-2; i > 0; i = i-1) 
      begin : SPACE_ADDR_GEN
	 assign s_space_addr[i] =   s_space_addr[i+1]                | s_addr_eff[i+BANKBITS];
      end
   endgenerate
   
   // detect if we are inside the sequential section
   // of the selected region and activate translation accordingly
   assign s_size_idx = (s_region == SRAM) ?
                       s_sram_seqsec_size : s_scm_seqsec_size;
   assign s_translate = !s_space_addr[s_size_idx];
   
   // address translation, assigns s_addr_out
   always_comb
     begin : ADDRESS_TRANSLATION
	// and-mask for top bits of eff. addr that stay unchanged
	s_addr_mask = 2**AW - 2**(s_size_idx+BANKBITS);
	
	if (s_translate) 
	  begin
	     s_addr_trans = (s_addr_eff & s_addr_mask)
               | ( (((s_addr_eff >> s_size_idx) & (BANKS-1))
                    | (s_addr_eff << BANKBITS))
                   & ~s_addr_mask );
	  end 
	else 
	  begin
	     // keep address unchanged
	     s_addr_trans = s_addr_eff;
	  end
	
	// address space rearrangement to support hole free adress space
	// with disabled SRAM banks
	// NOTE: only working correctly if translation (for SRAM section) is disabled!
	if (s_region == SRAM) begin
	   case (s_sram_groups_on)
             ONE: begin
		s_addr_final = ((s_addr_trans << 2) & (2**AW - BANKS))
		  | s_addr_trans[0];
             end
             TWO: begin
		s_addr_final = ((s_addr_trans << 1) & (2**AW - BANKS))
                  | s_addr_trans[1:0];
             end
             default: begin // FOUR, all groups on
		s_addr_final = s_addr_trans;
             end
	   endcase
	end else begin
	   s_addr_final = s_addr_trans;
	end
	
	s_addr_out = {s_addr_in[31:AW+2], s_addr_final, s_addr_in[1:0]};
     end

   assign s_addr_in = xbar_tcdm_slave.add;
   assign xbar_tcdm_master.add = s_addr_out;

   // directly connect rest of bus
   assign xbar_tcdm_master.req    = xbar_tcdm_slave.req;
   assign xbar_tcdm_master.wen    = xbar_tcdm_slave.wen;
   assign xbar_tcdm_master.wdata  = xbar_tcdm_slave.wdata;
   assign xbar_tcdm_master.be     = xbar_tcdm_slave.be;
   assign xbar_tcdm_slave.gnt     = xbar_tcdm_master.gnt;
   assign xbar_tcdm_slave.r_rdata = xbar_tcdm_master.r_rdata;
   assign xbar_tcdm_slave.r_opc   = xbar_tcdm_master.r_opc;
   assign xbar_tcdm_slave.r_valid = xbar_tcdm_master.r_valid;  

`else
   // MMU not implemented

   // directly connect input bus to output bus
   assign xbar_tcdm_master.req    = xbar_tcdm_slave.req;
   assign xbar_tcdm_master.add    = xbar_tcdm_slave.add;
   assign xbar_tcdm_master.wen    = xbar_tcdm_slave.wen;
   assign xbar_tcdm_master.wdata  = xbar_tcdm_slave.wdata;
   assign xbar_tcdm_master.be     = xbar_tcdm_slave.be;
   assign xbar_tcdm_slave.gnt     = xbar_tcdm_master.gnt;
   assign xbar_tcdm_slave.r_rdata = xbar_tcdm_master.r_rdata;
   assign xbar_tcdm_slave.r_opc   = xbar_tcdm_master.r_opc;
   assign xbar_tcdm_slave.r_valid = xbar_tcdm_master.r_valid;

`endif
   
endmodule
