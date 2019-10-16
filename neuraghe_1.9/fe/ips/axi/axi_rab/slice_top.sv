 
module slice_top
  
 #(  parameter RAB_ENTRIES = 16,  // slice per una porta
     parameter REG_ENTRIES = 4*RAB_ENTRIES)
   
  ( input   logic     [REG_ENTRIES-1:0] [31:0]  int_cfg_regs,
    input   logic                           int_rw,
    input   logic                   [31:0]  int_addr_min,
    input   logic                   [31:0]  int_addr_max,
    output  logic        [RAB_ENTRIES-1:0]  prot,
    output  logic        [RAB_ENTRIES-1:0]  hit,
    output  logic                           multiple_hit, 
    output  logic                   [31:0]  out_addr);

   
   logic 				    first_hit;
   genvar 				    i;
   integer 				    j;
   logic [32*RAB_ENTRIES-1:0] 		    slice_out_addr;

   logic second_hit;
   integer k;  
   
 generate
   for (i=0;i<RAB_ENTRIES;i=i+1)
   begin
     rab_slice u_slice(.cfg_min(   int_cfg_regs[4*i]),
                       .cfg_max(   int_cfg_regs[4*i+1]),
                       .cfg_offset(int_cfg_regs[4*i+2]),
                       .cfg_wen(   int_cfg_regs[4*i+3][2]),
                       .cfg_ren(   int_cfg_regs[4*i+3][1]),
                       .cfg_en(    int_cfg_regs[4*i+3][0]),
                       .in_trans_type(int_rw),
                       .in_addr_min(int_addr_min),
                       .in_addr_max(int_addr_max),
                       .out_addr(slice_out_addr[32*i+31:32*i]),
                       .out_prot(prot[i]),
                       .out_hit(hit[i]));
   end
  endgenerate

   always_comb
     begin
	first_hit = 0;
	second_hit = 0;
	k = 0;
	multiple_hit = 0;
	out_addr = 32'hDEADBEEF;
	for (j = 0; j < RAB_ENTRIES; j++)
	  begin
	     if (hit[j] == 1'b1)
	       begin
		  if (first_hit)
		    begin
		       second_hit=1'b1;
		       //if (slice_out_addr[32*k +: 32] != slice_out_addr[32*j +: 32])
		       // begin
		       //    multiple_hit = 1'b1;
		       //    out_addr = 32'hDEADBEEF;
		       // end
		    end
		  else if (second_hit)
		    begin
		       multiple_hit = 1'b1;
		       out_addr = 32'hDEADBEEF;
		    end
		  else
		    begin
		       first_hit=1'b1;
		       k = j;
		       out_addr = slice_out_addr[32*j +: 32];
		    end
	       end
	  end
     end
   
endmodule
