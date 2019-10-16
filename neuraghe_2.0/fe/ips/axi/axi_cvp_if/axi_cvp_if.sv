module axi_cvp_if #( 
      parameter AXI4_ADDRESS_WIDTH = 32,
      parameter AXI4_RDATA_WIDTH   = 32,
      parameter AXI4_WDATA_WIDTH   = 32,
      parameter AXI4_USER_WIDTH    = 4,
      parameter AXI4_ID_WIDTH      = 16
	) (
		input  logic                          s_axi_aclk,
		input  logic                          s_axi_aresetn,

		input  logic      [AXI4_ID_WIDTH-1:0] s_axi_awid,
		input  logic                          s_axi_awvalid,
		input  logic [AXI4_ADDRESS_WIDTH-1:0] s_axi_awaddr,
		input  logic    [AXI4_USER_WIDTH-1:0] s_axi_awuser,
		output logic                          s_axi_awready,

		input  logic                          s_axi_wvalid,
		input  logic   [AXI4_WDATA_WIDTH-1:0] s_axi_wdata,
		input  logic [AXI4_WDATA_WIDTH/8-1:0] s_axi_wstrb,
		input  logic                          s_axi_wlast,
		input  logic    [AXI4_USER_WIDTH-1:0] s_axi_wuser,
		output logic                          s_axi_wready,

		input  logic      [AXI4_ID_WIDTH-1:0] s_axi_arid,
		input  logic                          s_axi_arvalid,
		input  logic [AXI4_ADDRESS_WIDTH-1:0] s_axi_araddr,
		input  logic    [AXI4_USER_WIDTH-1:0] s_axi_aruser,
		output logic                          s_axi_arready,

		output logic                          s_axi_rvalid,
		output logic      [AXI4_ID_WIDTH-1:0] s_axi_rid,
		output logic   [AXI4_RDATA_WIDTH-1:0] s_axi_rdata,
		output logic                    [1:0] s_axi_rresp,
		output logic                          s_axi_rlast,
		output logic    [AXI4_USER_WIDTH-1:0] s_axi_ruser,
		input  logic                          s_axi_rready,

		output logic                          s_axi_bvalid,
		output logic      [AXI4_ID_WIDTH-1:0] s_axi_bid,
		output logic                    [1:0] s_axi_bresp,
		output logic    [AXI4_USER_WIDTH-1:0] s_axi_buser,
		input  logic                          s_axi_bready,
                                       
		output logic                          cvp1_pwr_req,
		output logic                          cvp1_pwr_wr_rd,
		output logic                   [28:0] cvp1_pwr_add,
		output logic                    [7:0] cvp1_pwr_be,
		output logic                   [63:0] cvp1_pwr_data,
		input  logic                          cvp1_pwr_ack,
		input  logic                          cvp1_pwr_error,
		input  logic                   [63:0] cvp1_pwr_r_data,
		output logic                          cvp2_pwr_req,
		output logic                          cvp2_pwr_wr_rd,
		output logic                   [28:0] cvp2_pwr_add,
		output logic                    [7:0] cvp2_pwr_be,
		output logic                   [63:0] cvp2_pwr_data,
		input  logic                          cvp2_pwr_ack,
		input  logic                          cvp2_pwr_error,
		input  logic                   [63:0] cvp2_pwr_r_data
		);

		logic                          awready;
		logic                          wready;
		logic                          arready;
		logic                          bvalid;
		logic                          rvalid;
	
		logic      [AXI4_ID_WIDTH-1:0] id;
		logic                    [9:0] addr;
		logic   [AXI4_WDATA_WIDTH-1:0] data;
		logic [AXI4_WDATA_WIDTH/8-1:0] wstrb;	
		logic                          cvp_select;

		logic                          cvp1_pwr_ack_sync0;
		logic                          cvp1_pwr_ack_sync;
		logic                          cvp2_pwr_ack_sync0;
		logic                          cvp2_pwr_ack_sync;
		
		logic                          sample_AR;
		logic                          sample_AW;
		logic                          sample_W;
		logic                          cvp1_req;
		logic                          cvp2_req;
		logic                          running_wr;
		logic                          running_rd;
		logic                          running_wr_next;
		logic                          running_rd_next;
		
		enum logic [2:0] { IDLE, WAITDATA, CVP1_PHASE1, CVP1_PHASE2, CVP2_PHASE1, CVP2_PHASE2} state,state_next;

		always @(posedge s_axi_aclk or negedge s_axi_aresetn)
		begin
			if (!s_axi_aresetn)
			begin
				cvp1_pwr_ack_sync0 = 1'b0;
				cvp1_pwr_ack_sync  = 1'b0;
				cvp2_pwr_ack_sync0 = 1'b0;
				cvp2_pwr_ack_sync  = 1'b0;
			end
			else
			begin
				cvp1_pwr_ack_sync0 = cvp1_pwr_ack;
				cvp1_pwr_ack_sync  = cvp1_pwr_ack_sync0;
				cvp2_pwr_ack_sync0 = cvp2_pwr_ack;
				cvp2_pwr_ack_sync  = cvp2_pwr_ack_sync0;
			end
		end

		always @(posedge s_axi_aclk or negedge s_axi_aresetn)
		begin
			if (!s_axi_aresetn)
			begin
				cvp_select = 1'b0;
				id         =  'h0;
				addr       =  'h0;
				data       =  'h0;
				wstrb      =  'h0;
				running_rd = 1'b0;
				running_wr = 1'b0;
				state      = IDLE;
			end
			else
			begin
				state      = state_next;
				running_rd = running_rd_next;
				running_wr = running_wr_next;
				if (sample_AR)
				begin
					id   = s_axi_arid;
					addr = s_axi_araddr[12:3];
					cvp_select = s_axi_araddr[13];
				end
				else if (sample_AW)
				begin
					id   = s_axi_awid;
					addr = s_axi_awaddr[12:3];
					cvp_select = s_axi_awaddr[13];
				end
				if (sample_W)
				begin
					data  = s_axi_wdata;
					wstrb = s_axi_wstrb;
				end
			end
		end
		
		always_comb
		begin
			state_next           = IDLE;
			sample_AR            = 1'b0;
			sample_AW            = 1'b0;
			sample_W             = 1'b0;
			arready              = 1'b0;
			awready              = 1'b0;
			wready               = 1'b0;
			rvalid               = 1'b0;
			bvalid               = 1'b0;
			cvp1_req             = 1'b0;
			cvp2_req             = 1'b0;
			running_rd_next      = running_rd;
			running_wr_next      = running_wr;
			case(state)
				IDLE:
				begin
					if (s_axi_arvalid | s_axi_awvalid)
					begin
						if (s_axi_awvalid)
						begin
							sample_AW = 1'b1;
							awready   = 1'b1;
							running_wr_next      = 1'b1;
							if (s_axi_wvalid)
							begin
								sample_W   = 1'b1;
								wready     = 1'b1;
								if (s_axi_awaddr[13])
								        state_next = CVP2_PHASE1;
								else
									state_next = CVP1_PHASE1;
							end
							else
								state_next = WAITDATA;
						end
						if (s_axi_arvalid)
						begin
							sample_AR = 1'b1;
							arready   = 1'b1;
							running_rd_next      = 1'b1;
							if (s_axi_araddr[13])
								state_next = CVP2_PHASE1;
							else
								state_next = CVP1_PHASE1;
						end
					end
					else
					begin
						state_next        = IDLE;
					end
				end
				WAITDATA:
				begin
					if (s_axi_wvalid)
					begin
						sample_W   = 1'b1;
						wready     = 1'b1;
						if(cvp_select)
							state_next = CVP2_PHASE1;
						else
						        state_next = CVP1_PHASE1;
					end
					else
					begin
						state_next = WAITDATA;
					end
				end
				CVP1_PHASE1:
				begin
					cvp1_req = 1'b1;
					if (cvp1_pwr_ack_sync)
					begin
						if ( (running_rd && s_axi_rready) || (running_wr && s_axi_bready) )
							state_next = CVP1_PHASE2;
						else
							state_next = CVP1_PHASE1;
						if (running_rd)
							rvalid = 1'b1;
						else
							bvalid = 1'b1;
					end
					else
					begin
						state_next = CVP1_PHASE1;
					end
				end
				CVP1_PHASE2:
				begin
					if (!cvp1_pwr_ack_sync)
						state_next = IDLE;
					else
						state_next = CVP1_PHASE2;
				end
				CVP2_PHASE1:
				begin
					cvp2_req = 1'b1;
					if (cvp2_pwr_ack_sync)
					begin
						if ( (running_rd && s_axi_rready) || (running_wr && s_axi_bready) )
							state_next = CVP2_PHASE2;
						else
							state_next = CVP2_PHASE1;
						if (running_rd)
							rvalid = 1'b1;
						else
							bvalid = 1'b1;
					end
					else
					begin
						state_next = CVP2_PHASE1;
					end
				end
				CVP2_PHASE2:
				begin
					if (!cvp2_pwr_ack_sync)
						state_next = IDLE;
					else
						state_next = CVP2_PHASE2;
				end
			endcase
		end

		assign cvp1_pwr_wr_rd = cvp1_req ? running_rd   : 'h0;
		assign cvp1_pwr_add   = cvp1_req ? {18'h0,addr} : 'h0;
		assign cvp1_pwr_be    = cvp1_req ? wstrb        : 'h0;
		assign cvp1_pwr_data  = cvp1_req ? data         : 'h0;
		assign cvp1_pwr_req   = cvp1_req;

		assign cvp2_pwr_wr_rd = cvp2_req ? running_rd   : 'h0;
		assign cvp2_pwr_add   = cvp2_req ? {18'h0,addr} : 'h0;
		assign cvp2_pwr_be    = cvp2_req ? wstrb        : 'h0;
		assign cvp2_pwr_data  = cvp2_req ? data         : 'h0;
		assign cvp2_pwr_req   = cvp2_req;

		assign s_axi_awready = awready;
		assign s_axi_wready  = wready;
		assign s_axi_arready = arready;

		assign s_axi_bvalid  = bvalid;
		assign s_axi_bresp   = 2'b00;
		assign s_axi_buser   =  'h0;
		assign s_axi_bid     = id;
		
		assign s_axi_rid     = id;
		assign s_axi_rresp   = 2'b00;
		assign s_axi_rvalid  = rvalid;
		assign s_axi_rdata   = (state == CVP2_PHASE1) ? cvp2_pwr_r_data : cvp1_pwr_r_data;
		assign s_axi_ruser   =  'h0;
		assign s_axi_rlast   = 1'b1;

endmodule
