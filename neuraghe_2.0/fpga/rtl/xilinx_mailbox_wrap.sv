module xilinx_mailbox_wrap
  #(
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_ID_WIDTH   = 10,
    parameter AXI_USER_WIDTH = 6
    )
   (
    input  logic  Clk_CI,
    input  logic  Rst_RBI,
    
    AXI_BUS.Slave Interface0_Axi,
    AXI_BUS.Slave Interface1_Axi,

    output logic  Interrupt_0,
    output logic  Interrupt_1
    );

   localparam AXI_STRB_WIDTH = AXI_DATA_WIDTH/8;

   logic [AXI_ID_WIDTH-1:0] Interface0_aw_id_DP;
   logic [AXI_ID_WIDTH-1:0] Interface0_ar_id_DP;
   logic [AXI_ID_WIDTH-1:0] Interface1_aw_id_DP;
   logic [AXI_ID_WIDTH-1:0] Interface1_ar_id_DP;
   
   /*
    * Outputs not set by AXI4-Lite interface
    */
   assign Interface0_Axi.b_user = 'b0;
   assign Interface1_Axi.b_user = 'b0;
   
   assign Interface0_Axi.r_user = 'b0;
   assign Interface1_Axi.r_user = 'b0;
   
   assign Interface0_Axi.r_last = (Interface0_Axi.r_valid == 1'b1) ? 1'b1 : 1'b0;
   assign Interface1_Axi.r_last = (Interface1_Axi.r_valid == 1'b1) ? 1'b1 : 1'b0;
  
   /*
    *  ID reflection logic
    */
   assign Interface0_Axi.b_id = (Interface0_Axi.b_valid == 1'b1) ? Interface0_aw_id_DP : 'b0;
   assign Interface1_Axi.b_id = (Interface1_Axi.b_valid == 1'b1) ? Interface1_aw_id_DP : 'b0;
   assign Interface0_Axi.r_id = (Interface0_Axi.r_valid == 1'b1) ? Interface0_ar_id_DP : 'b0;
   assign Interface1_Axi.r_id = (Interface1_Axi.r_valid == 1'b1) ? Interface1_ar_id_DP : 'b0;   
   
   // Registers to buffer the IDs
   always_ff @(posedge Clk_CI, negedge Rst_RBI)
     begin
	if (Rst_RBI == 1'b0)
	  begin
	     Interface0_aw_id_DP <= 'b0;
	     Interface1_aw_id_DP <= 'b0;
	     Interface0_ar_id_DP <= 'b0;
	     Interface1_ar_id_DP <= 'b0;
	  end
	else
	  begin
	     // aw & b channels
	     if (Interface0_Axi.aw_valid == 1'b1)
	       Interface0_aw_id_DP <= Interface0_Axi.aw_id;
	     if (Interface1_Axi.aw_valid == 1'b1)
	       Interface1_aw_id_DP <= Interface1_Axi.aw_id;
	     // ar & r channels
	     if (Interface0_Axi.ar_valid == 1'b1)
	       Interface0_ar_id_DP <= Interface0_Axi.ar_id;
	     if (Interface1_Axi.ar_valid == 1'b1)
	       Interface1_ar_id_DP <= Interface1_Axi.ar_id;
	  end
     end

   /*
    *  Registering of aw channel for compatibility with Xilinx AXI4-Lite slaves:
    * 
    *  Xilinx AXI4-Lite slaves want the aw and w channel signals simultaneously!
    */
   logic [AXI_ADDR_WIDTH-1:0] Interface0_aw_addr_DP ;
   logic                      Interface0_aw_valid   ;
   logic                      Interface0_aw_valid_en;
   logic                      Interface0_aw_valid_DP;
   logic                      Interface0_aw_valid_DN;
   logic                      Interface0_aw_ready   ; // not used
   logic                      Interface0_w_valid    ;
   logic [AXI_ADDR_WIDTH-1:0] Interface1_aw_addr_DP ;
   logic                      Interface1_aw_valid   ;
   logic                      Interface1_aw_valid_en;
   logic                      Interface1_aw_valid_DP;
   logic                      Interface1_aw_valid_DN;
   logic                      Interface1_aw_ready   ; // not used
   logic                      Interface1_w_valid    ;
 
   // Set aw_valid to register
   assign Interface0_aw_valid_DN = Interface0_Axi.aw_valid & !Interface0_Axi.w_ready;
   assign Interface1_aw_valid_DN = Interface1_Axi.aw_valid & !Interface1_Axi.w_ready;

   // Set enable signal for aw_valid register
   assign Interface0_aw_valid_en = Interface0_Axi.aw_valid | Interface0_Axi.w_ready;
   assign Interface1_aw_valid_en = Interface1_Axi.aw_valid | Interface1_Axi.w_ready;
      
   // Registered aw_valid to slave (simultaneously with w_valid)
   assign Interface0_aw_valid = Interface0_aw_valid_DP & Interface0_Axi.w_valid;
   assign Interface1_aw_valid = Interface1_aw_valid_DP & Interface1_Axi.w_valid;

   // Fake aw_ready to master
   assign Interface0_Axi.aw_ready = Interface0_aw_valid_DP & Interface0_Axi.aw_valid;
   assign Interface1_Axi.aw_ready = Interface1_aw_valid_DP & Interface1_Axi.aw_valid;

   // Safe w_valid to slave
   assign Interface0_w_valid = Interface0_Axi.w_valid & Interface0_aw_valid_DP;
   assign Interface1_w_valid = Interface1_Axi.w_valid & Interface1_aw_valid_DP;
      
   // Registers to buffer aw_valid and aw_addr
   always_ff @(posedge Clk_CI, negedge Rst_RBI)
     begin
	if (Rst_RBI == 1'b0)
	  begin
	     Interface0_aw_addr_DP  <=  'b0;
	     Interface0_aw_valid_DP <= 1'b0;
	     Interface1_aw_addr_DP  <=  'b0;
	     Interface1_aw_valid_DP <= 1'b0;
	  end
	else
	  begin
	     // aw_addr
	     if (Interface0_Axi.aw_valid == 1'b1)
		  Interface0_aw_addr_DP  <= Interface0_Axi.aw_addr;
	     if (Interface1_Axi.aw_valid == 1'b1)
		  Interface1_aw_addr_DP  <= Interface1_Axi.aw_addr;
	     // aw_valid
	     if (Interface0_aw_valid_en == 1'b1)
		  Interface0_aw_valid_DP <= Interface0_aw_valid_DN;  
	     if (Interface1_aw_valid_en == 1'b1)
	       Interface1_aw_valid_DP <= Interface1_aw_valid_DN;  
	  end
     end
		 
   /*
    *  Data width conversion
    */
   logic [31:0] Interface0_w_data_D;    
   logic  [3:0] Interface0_w_strb_D;
   logic [31:0] Interface0_r_data_D;
   logic [31:0] Interface1_w_data_D;    
   logic  [3:0] Interface1_w_strb_D;
   logic [31:0] Interface1_r_data_D;
   
   generate
      if (AXI_DATA_WIDTH == 64)
	begin
	   logic Interface0_aw_addr2_DP;
	   logic Interface1_aw_addr2_DP;
	   logic Interface0_ar_addr2_DP;
	   logic Interface1_ar_addr2_DP;

	   // Registers to buffer the relevant address bit
	   always_ff @(posedge Clk_CI, negedge Rst_RBI)
	     begin
		if (Rst_RBI == 1'b0)
		  begin
		     Interface0_aw_addr2_DP <= 1'b0;
		     Interface1_aw_addr2_DP <= 1'b0;
		     Interface0_ar_addr2_DP <= 1'b0;
		     Interface1_ar_addr2_DP <= 1'b0;	
		  end
		else
		  begin
		     // aw channels
		     if (Interface0_Axi.aw_valid == 1'b1)
		       Interface0_aw_addr2_DP <= Interface0_Axi.aw_addr[2];
		     if (Interface1_Axi.aw_valid == 1'b1)
		       Interface1_aw_addr2_DP <= Interface1_Axi.aw_addr[2];
		     // ar channels
		     if (Interface0_Axi.ar_valid == 1'b1)
		       Interface0_ar_addr2_DP <= Interface0_Axi.ar_addr[2];
		     if (Interface1_Axi.ar_valid == 1'b1)
	               Interface1_ar_addr2_DP <= Interface1_Axi.ar_addr[2];
		  end
	     end

	   // Width conversion logic
	   // w channels
	   always_comb
	     begin
		if (Interface0_aw_addr2_DP == 1'b1)
		  begin
		     Interface0_w_data_D = Interface0_Axi.w_data[63:32];
		     Interface0_w_strb_D = Interface0_Axi.w_strb[7:4];  
		  end
		else
		  begin
		     Interface0_w_data_D = Interface0_Axi.w_data[31:0];
		     Interface0_w_strb_D = Interface0_Axi.w_strb[3:0];  
		  end
	     end 
	   always_comb
	     begin
		if (Interface1_aw_addr2_DP == 1'b1)
		  begin
		     Interface1_w_data_D = Interface1_Axi.w_data[63:32];
		     Interface1_w_strb_D = Interface1_Axi.w_strb[7:4];  
		  end
		else
		  begin
		     Interface1_w_data_D = Interface1_Axi.w_data[31:0];
		     Interface1_w_strb_D = Interface1_Axi.w_strb[3:0];  
		  end
	     end 

	   // r channels
	   always_comb
	     begin
		if (Interface0_ar_addr2_DP == 1'b1)
		  begin
		     Interface0_Axi.r_data[63:32] = Interface0_r_data_D;
		     Interface0_Axi.r_data[31:0]  = 32'h00000000;
		  end
		else
		  begin
		     Interface0_Axi.r_data[63:32] = 32'h00000000;
		     Interface0_Axi.r_data[31:0]  = Interface0_r_data_D;
		  end
	     end
	   always_comb
	     begin
		if (Interface1_ar_addr2_DP == 1'b1)
		  begin
		     Interface1_Axi.r_data[63:32] = Interface1_r_data_D;
		     Interface1_Axi.r_data[31:0]  = 32'h00000000;
		  end
		else
		  begin
		     Interface1_Axi.r_data[63:32] = 32'h00000000;
		     Interface1_Axi.r_data[31:0]  = Interface1_r_data_D;
		  end
	     end 
	end
      else // AXI_DATA_WIDTH == 32
	begin
	   always_comb
	     begin
		// Write
		Interface0_w_data_D = Interface0_Axi.w_data;
		Interface0_w_strb_D = Interface0_Axi.w_strb;
		Interface1_w_data_D = Interface1_Axi.w_data;
		Interface1_w_strb_D = Interface1_Axi.w_strb;  
		// Read
		Interface0_Axi.r_data = Interface0_r_data_D;
		Interface1_Axi.r_data = Interface1_r_data_D;
	     end
	end
   endgenerate
   
   xilinx_mailbox xilinx_mailbox_i
     (
      .S0_AXI_ACLK    (Clk_CI                    ),
      .S0_AXI_ARESETN (Rst_RBI                   ),
      .S0_AXI_AWADDR  (Interface0_aw_addr_DP     ),
      .S0_AXI_AWVALID (Interface0_aw_valid       ),
      .S0_AXI_AWREADY (Interface0_aw_ready       ),
      .S0_AXI_WDATA   (Interface0_w_data_D       ),
      .S0_AXI_WSTRB   (Interface0_w_strb_D       ),
      .S0_AXI_WVALID  (Interface0_w_valid        ),
      .S0_AXI_WREADY  (Interface0_Axi.w_ready    ),
      .S0_AXI_BRESP   (Interface0_Axi.b_resp     ),
      .S0_AXI_BVALID  (Interface0_Axi.b_valid    ),
      .S0_AXI_BREADY  (Interface0_Axi.b_ready    ),
      .S0_AXI_ARADDR  (Interface0_Axi.ar_addr    ),
      .S0_AXI_ARVALID (Interface0_Axi.ar_valid   ),
      .S0_AXI_ARREADY (Interface0_Axi.ar_ready   ),
      .S0_AXI_RDATA   (Interface0_r_data_D       ),
      .S0_AXI_RRESP   (Interface0_Axi.r_resp     ),
      .S0_AXI_RVALID  (Interface0_Axi.r_valid    ),
      .S0_AXI_RREADY  (Interface0_Axi.r_ready    ),       

      .S1_AXI_ACLK    (Clk_CI                    ),
      .S1_AXI_ARESETN (Rst_RBI                   ),
      .S1_AXI_AWADDR  (Interface1_aw_addr_DP     ),
      .S1_AXI_AWVALID (Interface1_aw_valid       ),
      .S1_AXI_AWREADY (Interface1_aw_ready       ),
      .S1_AXI_WDATA   (Interface1_w_data_D       ),
      .S1_AXI_WSTRB   (Interface1_w_strb_D       ),
      .S1_AXI_WVALID  (Interface1_w_valid        ),
      .S1_AXI_WREADY  (Interface1_Axi.w_ready    ),
      .S1_AXI_BRESP   (Interface1_Axi.b_resp     ),
      .S1_AXI_BVALID  (Interface1_Axi.b_valid    ),
      .S1_AXI_BREADY  (Interface1_Axi.b_ready    ),
      .S1_AXI_ARADDR  (Interface1_Axi.ar_addr    ),
      .S1_AXI_ARVALID (Interface1_Axi.ar_valid   ),
      .S1_AXI_ARREADY (Interface1_Axi.ar_ready   ),
      .S1_AXI_RDATA   (Interface1_r_data_D       ),
      .S1_AXI_RRESP   (Interface1_Axi.r_resp     ),
      .S1_AXI_RVALID  (Interface1_Axi.r_valid    ),
      .S1_AXI_RREADY  (Interface1_Axi.r_ready    ),
      
      .Interrupt_0    (Interrupt_0               ),
      .Interrupt_1    (Interrupt_1               )
      );

endmodule