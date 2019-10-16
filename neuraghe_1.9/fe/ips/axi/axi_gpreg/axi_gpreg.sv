`define log2(VALUE) ((VALUE) < ( 1 ) ? 0 : (VALUE) < ( 2 ) ? 1 : (VALUE) < ( 4 ) ? 2 : (VALUE) < ( 8 ) ? 3 : (VALUE) < ( 16 )  ? 4 : (VALUE) < ( 32 )  ? 5 : (VALUE) < ( 64 )  ? 6 : (VALUE) < ( 128 ) ? 7 : (VALUE) < ( 256 ) ? 8 : (VALUE) < ( 512 ) ? 9 : (VALUE) < ( 1024 ) ? 10 : (VALUE) < ( 2048 ) ? 11 : (VALUE) < ( 4096 ) ? 12 : (VALUE) < ( 8192 ) ? 13 : (VALUE) < ( 16384 ) ? 14 : (VALUE) < ( 32768 ) ? 15 : (VALUE) < ( 65536 ) ? 16 : (VALUE) < ( 131072 ) ? 17 : (VALUE) < ( 262144 ) ? 18 : (VALUE) < ( 524288 ) ? 19 : (VALUE) < ( 1048576 ) ? 20 : (VALUE) < ( 1048576 * 2 ) ? 21 : (VALUE) < ( 1048576 * 4 ) ? 22 : (VALUE) < ( 1048576 * 8 ) ? 23 : (VALUE) < ( 1048576 * 16 ) ? 24 : 25)
`define OKAY   2'b00
`define EXOKAY 2'b01
`define SLVERR 2'b10
`define DECERR 2'b11

`define REG_PADFUN0     6'b000000 //BASEADDR
`define REG_PADFUN1     6'b000001 //BASEADDR+0x08
`define REG_PADDIR      6'b000010 //BASEADDR+0x10
`define REG_PADRD       6'b000011 //BASEADDR+0x18
`define REG_PADWR       6'b000100 //BASEADDR+0x20
`define REG_RWM_TCDM    6'b000101 //BASEADDR+0x28
`define REG_CLKD0       6'b000110 //BASEADDR+0x30
`define REG_CLKD1       6'b000111 //BASEADDR+0x38
`define REG_UART_STATUS 6'b001000 //BASEADDR+0x40
`define REG_UART_CMD    6'b001001 //BASEADDR+0x48
`define REG_UART_CFG    6'b001010 //BASEADDR+0x50

module axi_gpreg #( 
		parameter AXI4_ADDRESS_WIDTH = 32,
		parameter AXI4_RDATA_WIDTH   = 64,
		parameter AXI4_WDATA_WIDTH   = 64,
		parameter AXI4_USER_WIDTH    = 4,
		parameter AXI4_ID_WIDTH      = 16
		) (
		input  logic                          s_axi_aclk,
		input  logic                          s_axi_aresetn,

		input  logic                          s_axi_awvalid,
		input  logic      [AXI4_ID_WIDTH-1:0] s_axi_awid,
		input  logic                    [7:0] s_axi_awlen,
		input  logic [AXI4_ADDRESS_WIDTH-1:0] s_axi_awaddr,
		input  logic    [AXI4_USER_WIDTH-1:0] s_axi_awuser,
		output logic                          s_axi_awready,
    
		input  logic                          s_axi_wvalid,
		input  logic   [AXI4_WDATA_WIDTH-1:0] s_axi_wdata,
		input  logic   [AXI4_WDATA_WIDTH/8-1:0] s_axi_wstrb,
		input  logic                          s_axi_wlast,
		input  logic    [AXI4_USER_WIDTH-1:0] s_axi_wuser,
		output logic                          s_axi_wready,
  
		output logic                          s_axi_bvalid,
		output logic      [AXI4_ID_WIDTH-1:0] s_axi_bid,
		output logic                    [1:0] s_axi_bresp,
		output logic    [AXI4_USER_WIDTH-1:0] s_axi_buser,
		input  logic                          s_axi_bready,
    
		input  logic                          s_axi_arvalid,
		input  logic      [AXI4_ID_WIDTH-1:0] s_axi_arid,
		input  logic                    [7:0] s_axi_arlen,
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
		
		input  logic                   [31:0] gpio_in,
		output logic                   [31:0] gpio_out,
		output logic                   [31:0] gpio_dir,
		output logic                   [63:0] gpio_mux,
		
		output logic                          uart_tx,
		input  logic                          uart_rx,
		
		output logic  [7:0]       clk_div0,
		output logic              clk_div0_valid,
		output logic  [7:0]       clk_div1,
		output logic              clk_div1_valid,
		
		output logic  [1:0]       wm_tcdm,
		output logic  [1:0]       rm_tcdm
		);

	localparam WR_ADDR_CMP = `log2(AXI4_WDATA_WIDTH/8)-1;
	localparam RD_ADDR_CMP = `log2(AXI4_RDATA_WIDTH/8)-1;
  
	logic                 [5:0] wr_addr;
	logic                 [5:0] rd_addr;
	
	logic                [31:0] reg_gpio_in;
	logic                [31:0] reg_gpio_in_sync;
	logic                [31:0] reg_gpio_out;
	logic                [31:0] reg_gpio_dir;
	logic                [31:0] reg_gpio_fun0;
	logic                [31:0] reg_gpio_fun1;

	logic                 [7:0] reg_clk_div0;
	logic                       reg_clk_div0_valid;
	logic                 [7:0] reg_clk_div1;
	logic                       reg_clk_div1_valid;
	
	logic                [15:0] reg_uart_div;
	logic                       reg_uart_pcheck;
	logic                 [3:0] reg_uart_btr;
	
	logic                       reg_uart_startrx;
	logic                       reg_uart_stoprx;

    logic                [31:0] s_uart_status;
    logic                 [7:0] s_uart_tx_fifo;
    logic                       s_uart_tx_fifo_valid;
    logic                       s_uart_tx_fifo_full;
    logic                [31:0] s_uart_rx_fifo;
    logic                       s_uart_rx_fifo_valid;
    logic                       s_uart_rx_fifo_ready;
    
    logic                 [1:0] reg_wm_tcdm;
    logic                 [1:0] reg_rm_tcdm;

	logic					    read_req;
	logic                 [5:0] read_address;
	logic 				        sample_AR;
	logic                 [5:0] ARADDR_Q;
	logic                 [7:0] ARLEN_Q;
	logic					    decr_ARLEN;
	logic                 [7:0] CountBurstCS;
	logic                 [7:0] CountBurstNS;
	logic   [AXI4_ID_WIDTH-1:0] ARID_Q;
	logic [AXI4_USER_WIDTH-1:0] ARUSER_Q;
    
    
	logic					    write_req;
	logic                 [5:0] write_address;
	logic 				        sample_AW;
	logic                 [5:0]	AWADDR_Q;
	logic                 [7:0]	AWLEN_Q;
	logic					    decr_AWLEN;
	logic                 [7:0]	CountBurst_AW_CS;
	logic                 [7:0]	CountBurst_AW_NS;    
	logic   [AXI4_ID_WIDTH-1:0] AWID_Q;
	logic [AXI4_USER_WIDTH-1:0] AWUSER_Q;
    
	enum logic [2:0] { IDLE, SINGLE, BURST, WAIT_WDATA_BURST, WAIT_WDATA_SINGLE, BURST_RESP } AR_CS, AR_NS, AW_CS, AW_NS;

	uart i_uart(
			.clk(s_axi_aclk),
			.rstn(s_axi_aresetn),
			.tx(uart_tx),
			.rx(uart_rx),
			.status(s_uart_status),
			.div(reg_uart_div),
			.btr(reg_uart_btr),
			.parity_check(reg_uart_pcheck),
			.rxstart(reg_uart_startrx),
			.rxstop(reg_uart_stoprx),
			.datatx(s_uart_tx_fifo),
			.datatx_valid(s_uart_tx_fifo_valid),
			.datarx(s_uart_rx_fifo),
			.datarx_valid(s_uart_rx_fifo_valid),
			.datarx_ready(s_uart_rx_fifo_ready)
			);
	
	assign wr_addr = s_axi_awaddr[WR_ADDR_CMP+5:WR_ADDR_CMP];
	assign rd_addr = s_axi_araddr[RD_ADDR_CMP+5:RD_ADDR_CMP];


		//read fsm
	always_ff @(posedge s_axi_aclk, negedge s_axi_aresetn)
	begin
		if(s_axi_aresetn == 1'b0)
		begin
			AR_CS        <= IDLE;
			ARADDR_Q     <= '0;
			CountBurstCS <= '0;
			ARID_Q       <= '0; 
			ARUSER_Q     <= '0;
		end
		else
		begin
			AR_CS <= AR_NS;
			CountBurstCS <= CountBurstNS;
	  
			if(sample_AR)
				ARLEN_Q  <=  s_axi_arlen;
			else
			if(decr_ARLEN)
				ARLEN_Q  <=  ARLEN_Q -1'b1;
		
			if(sample_AR)
			begin
				ARID_Q   <=  s_axi_arid; 
				ARADDR_Q <=  read_address;
				ARUSER_Q <=  s_axi_aruser;
			end
		end
	end

	always_comb 
	begin
		s_axi_arready  = 1'b0;
		read_address   = '0;
		read_req       = 1'b0;
		sample_AR      = 1'b0;
		decr_ARLEN     = 1'b0;
		CountBurstNS   = CountBurstCS;
		s_axi_rvalid         = 1'b0;
		s_axi_rresp          = `OKAY;
		s_axi_ruser          = '0;
		s_axi_rlast          = 1'b0;
		s_axi_rid            = '0;
		AR_NS = AR_CS;
      
		case(AR_CS)
			IDLE: 
			begin
				s_axi_arready        = 1'b1;
				if(s_axi_arvalid)
				begin
					sample_AR      = 1'b1;
					read_req       = 1'b1;
					read_address   = rd_addr;
					if(s_axi_arlen == 0)
					begin
						AR_NS = SINGLE;
						CountBurstNS   = '0;
					end
					else
					begin
						AR_NS = BURST;
						CountBurstNS   = CountBurstCS + 1'b1;
					end
				end
				else
				begin
					AR_NS = IDLE;
					CountBurstNS   = '0;
				end
			end //~ IDLE

			SINGLE: 
			begin
				
				s_axi_rresp  = `OKAY;
				s_axi_rid    = ARID_Q;
				s_axi_ruser  = ARUSER_Q;
				s_axi_rlast  = 1'b1;
				s_axi_rvalid = 1'b1;
				read_address  =  ARADDR_Q;
					// we have a valid response here, waiting to be delivered
				if(s_axi_rready)
				begin		
					s_axi_arready = 1'b1;
					if(s_axi_arvalid)
					begin
						sample_AR      = 1'b1;
						read_req       = 1'b1;
						read_address   =  rd_addr;
		    
						if(s_axi_arlen == 0)
						begin
							AR_NS          = SINGLE;
							CountBurstNS   = '0;
						end
						else
						begin
							AR_NS          = BURST;
							CountBurstNS   = CountBurstCS + 1'b1;
						end
					end
					else
					begin
						AR_NS = IDLE;
						CountBurstNS   = '0;
					end
				end
				else // NOt ready: stay here untile RR RADY is OK
				begin
					AR_NS          = SINGLE;
					read_req       = 1'b1;
					read_address   =  ARADDR_Q;
					CountBurstNS   = '0;
				end
	  
			end //~ SINGLE

			BURST: 
			begin
				s_axi_rresp  = `OKAY;
				s_axi_rid    = ARID_Q;
				s_axi_ruser  = ARUSER_Q;

					s_axi_rvalid = 1'b1;
				
					read_address  =  ARADDR_Q;
				if(s_axi_rready)
				begin
					if(ARLEN_Q > 0)
					begin
						AR_NS         = BURST;
						read_req      = 1'b1; // read the previous address
						decr_ARLEN    = 1'b1;
						read_address  =  ARADDR_Q + CountBurstCS ;
						s_axi_rlast         = 1'b0;
						s_axi_arready       = 1'b0;
					end
					else //BURST_LAST
					begin
						s_axi_rlast         = 1'b1;
						s_axi_arready       = 1'b1;
						// Check if there are any pending request
						if(s_axi_arvalid)
						begin
							sample_AR      = 1'b1;
							read_req       = 1'b1;
							read_address   = rd_addr;
				    
							if(s_axi_arlen == 0)
							begin
								AR_NS = SINGLE;
								CountBurstNS   = 0;
							end
							else
							begin
								AR_NS = BURST;
								CountBurstNS   = 1;
							end
						end
						else
						begin
							AR_NS = IDLE;
							CountBurstNS   = 0;
						end

					end		
				end
				else
				begin
					AR_NS          = BURST;
					read_req     = 1'b1; // read the previous address
					decr_ARLEN   = 1'b0;
					read_address =  ARADDR_Q + CountBurstCS;
					s_axi_arready      = 1'b0;
				end
	  
			end //~ BURST
			default : begin
	  
			end //~default
		endcase
	end

	//Write FSM
	always_ff @(posedge s_axi_aclk, negedge s_axi_aresetn)
	begin
		if(s_axi_aresetn == 1'b0)
		begin
			AW_CS            <= IDLE;
			AWADDR_Q         <= '0;
			CountBurst_AW_CS <= '0;
			AWID_Q           <= '0;
			AWUSER_Q         <= '0;
		end
		else
		begin
			AW_CS <= AW_NS;
			CountBurst_AW_CS <= CountBurst_AW_NS;
			if(sample_AW)
			begin
				AWLEN_Q  <=  s_axi_awlen;
				AWADDR_Q <=  write_address;
				AWID_Q   <=  s_axi_awid; 
				AWUSER_Q <=  s_axi_awuser;
			end
			else
			if(decr_AWLEN)
			begin
				AWLEN_Q  <=  AWLEN_Q -1'b1;
			end
		end
	end

	always_comb 
	begin
		s_axi_awready        = 1'b0;
		s_axi_wready         = 1'b0;
		write_address  = '0;
		write_req       = 1'b0;
		sample_AW      = 1'b0;
		decr_AWLEN     = 1'b0;
		CountBurst_AW_NS   = CountBurst_AW_CS;
		s_axi_bid   = '0;
		s_axi_bresp = `OKAY;
		s_axi_buser = '0;  
		s_axi_bvalid = 1'b0;
		AW_NS = AW_CS;
            
		case(AW_CS)
			IDLE: 
			begin
				s_axi_awready        = 1'b1;
	    
				if(s_axi_awvalid)
				begin
					sample_AW       = 1'b1;
					write_address   =  wr_addr;
		    
					if(s_axi_wvalid)
					begin
							s_axi_wready    = 1'b1;
							write_req       = 1'b1;
							if(s_axi_awlen == 0)
							begin
								AW_NS = SINGLE;
								CountBurst_AW_NS   = 0;
							end
							else
							begin
								AW_NS = BURST;
								CountBurst_AW_NS   = 1;
							end
					end
					else // GOT ADDRESS WRITE, not DATA
					begin
						s_axi_wready    = 1'b1;
						write_req       = 1'b0;
			
						if(s_axi_awlen == 0)
						begin
							AW_NS             =  WAIT_WDATA_SINGLE;
							CountBurst_AW_NS  = 0;
						end
						else
						begin
							AW_NS =  WAIT_WDATA_BURST;
							CountBurst_AW_NS    = 0;
						end
					end
				end
				else
				begin
					s_axi_wready         = 1'b1;
					AW_NS              = IDLE;
					CountBurst_AW_NS   = '0;
				end
	  
			end //~ IDLE
	  
	
			WAIT_WDATA_BURST : 
			begin
				s_axi_awready        = 1'b0;
	      
				if(s_axi_wvalid)
				begin
						s_axi_wready     = 1'b1;
						write_req        = 1'b1;
						write_address    = AWADDR_Q;
						AW_NS            = BURST;
						CountBurst_AW_NS = 1;
						decr_AWLEN       = 1'b1;
				end
				else
				begin
					s_axi_wready         = 1'b1;
					write_req              =  1'b0;
					AW_NS                  = WAIT_WDATA_BURST; // wait for data
					CountBurst_AW_NS       = '0;
				end
	    
			end //~WAIT_WDATA_BURST

			WAIT_WDATA_SINGLE : 
			begin
				s_axi_awready        = 1'b0;
				CountBurst_AW_NS = '0;
	      
				if(s_axi_wvalid)
				begin
						s_axi_wready         = 1'b1;
						write_req        = 1'b1;
						write_address    = AWADDR_Q;
						AW_NS            = SINGLE;
				end
				else
				begin
					s_axi_wready         = 1'b1;
					write_req        = 1'b0;
					AW_NS = WAIT_WDATA_SINGLE; // wait for data
				end
			end

			SINGLE: begin
				s_axi_bid    = AWID_Q;
				s_axi_bresp  = `OKAY;
				s_axi_buser  = AWUSER_Q;
				s_axi_bvalid = 1'b1;
	    
				// we have a valid response here, waiting to be delivered
				if(s_axi_bready)
				begin
					s_axi_awready = 1'b1;
					if(s_axi_awvalid)
					begin
						sample_AW       =   1'b1;
						write_req       =   1'b1;
						write_address   =   wr_addr;
		    
						if(s_axi_awlen == 0)
						begin
							AW_NS          = SINGLE;
							CountBurst_AW_NS   = '0;
						end
						else
						begin
							AW_NS          = BURST;
							CountBurst_AW_NS   = CountBurst_AW_CS + 1'b1;
						end
					end
					else
					begin
						AW_NS = IDLE;
						CountBurst_AW_NS   = '0;
					end	      
				end
				else // NOt ready: stay here untile RR RADY is OK
				begin
					AW_NS            = SINGLE;
					CountBurst_AW_NS = '0;
					s_axi_awready          = 1'b0;
				end
	  
			end //~ SINGLE

			BURST: 
			begin
	  
				CountBurst_AW_NS = CountBurst_AW_CS;
				s_axi_awready        = 1'b0;

				//write_address  =  AWADDR_Q + CountBurst_AW_CS ;	
				write_address  =  AWADDR_Q;	//TODO check burst type

				if(s_axi_wvalid)
				begin
						s_axi_wready = 1'b1;
						write_req      = 1'b1; // read the previous address
						decr_AWLEN     = 1'b1;
						CountBurst_AW_NS   = CountBurst_AW_CS + 1'b1;
				end
				else
				begin
					s_axi_wready = 1'b1;
					write_req      = 1'b0; // read the previous address
					decr_AWLEN     = 1'b0;
		    	
				end
				if(AWLEN_Q > 0)
				begin
					AW_NS          = BURST;
					// 		AWREADY        = 1'b0;
				end
				else
				begin
					AW_NS          = BURST_RESP;
					// 		AWREADY        = 1'b1;
				end
			end //~ BURST
	  
	  
			BURST_RESP :
			begin
				s_axi_bvalid  = 1'b1;
				s_axi_bid     = AWID_Q;
				s_axi_bresp   = `OKAY;
				s_axi_buser   = AWUSER_Q;
				if(s_axi_bready)
				begin
					s_axi_awready = 1'b1;
					// Check if there are any pending request
					if(s_axi_awvalid)
					begin
						sample_AW = 1'b1;					
						if(s_axi_wvalid)
						begin
								s_axi_wready = 1'b1;
								write_req       = 1'b1;
								write_address   = wr_addr;
								if(s_axi_awlen == 0)
								begin
									AW_NS            = SINGLE;
									CountBurst_AW_NS = 0;
								end
								else
								begin
									AW_NS = BURST;
									CountBurst_AW_NS   = 1;
								end
						end
						else // GOT ADDRESS WRITE, not DATA
						begin
							s_axi_wready = 1'b1;
							write_req       = 1'b0;
							write_address   = '0;
					    
							if(s_axi_awlen == 0)
							begin
								AW_NS             =  WAIT_WDATA_SINGLE;
								CountBurst_AW_NS  = 0;
							end
							else
							begin
								AW_NS            = WAIT_WDATA_BURST;
								CountBurst_AW_NS = 0;
							end
						end
					end
					else
					begin
						s_axi_wready = 1'b1;
						AW_NS            = IDLE;
						CountBurst_AW_NS = '0;
					end
				end
				else //~BREADY
				begin
					AW_NS         = BURST_RESP;
					s_axi_awready = 1'b0;
					s_axi_wready = 1'b0;
				end
			end
		endcase
	end  
	
	always @( posedge s_axi_aclk or negedge s_axi_aresetn )
	begin
		if ( s_axi_aresetn == 1'b0 )
		begin
			reg_gpio_fun0      =  'h0;
			reg_gpio_fun1      =  'h0;
			reg_gpio_dir	   =  'h0;
			reg_gpio_out       =  'h0;
			reg_clk_div0       =  'h0;
			reg_clk_div0_valid = 1'b0;
			reg_clk_div1       =  'h0;
			reg_clk_div1_valid = 1'b0;
			reg_uart_div       =  'h0;
			reg_uart_btr       =  'h0;
			reg_uart_pcheck    =  'h0;
			reg_uart_startrx   = 1'b0;
			reg_uart_stoprx    = 1'b0;
			reg_wm_tcdm        = 2'h0;
			reg_rm_tcdm        = 2'h0;
		end
		else if (write_req)
		begin
			reg_clk_div0_valid = 1'b0;
			reg_clk_div1_valid = 1'b0;
			reg_uart_startrx = 1'b0;
			reg_uart_stoprx = 1'b0;
			case(write_address)
				`REG_PADFUN0:
					for ( int byte_index = 0; byte_index < 4; byte_index = byte_index+1 )
						if ( s_axi_wstrb[byte_index] == 1 )
							reg_gpio_fun0[byte_index*8 +: 8] = s_axi_wdata[(byte_index*8) +: 8];
				`REG_PADFUN1:
					for ( int byte_index = 0; byte_index < 4; byte_index = byte_index+1 )
						if ( s_axi_wstrb[byte_index] == 1 )
							reg_gpio_fun1[byte_index*8 +: 8] = s_axi_wdata[(byte_index*8) +: 8];
				`REG_PADDIR:
					for ( int byte_index = 0; byte_index < 4; byte_index = byte_index+1 )
						if ( s_axi_wstrb[byte_index] == 1 )
							reg_gpio_dir[byte_index*8 +: 8] = s_axi_wdata[(byte_index*8) +: 8];
				`REG_PADWR:
					for ( int byte_index = 0; byte_index < 4; byte_index = byte_index+1 )
						if ( s_axi_wstrb[byte_index] == 1 )
							reg_gpio_out[byte_index*8 +: 8] = s_axi_wdata[(byte_index*8) +: 8];
				`REG_CLKD0:
					if ( s_axi_wstrb[0] == 1 )
					begin
						reg_clk_div0 = s_axi_wdata[7:0];
						reg_clk_div0_valid = 1'b1;
					end
				`REG_CLKD1:
					if ( s_axi_wstrb[0] == 1 )
					begin
						reg_clk_div1 = s_axi_wdata[7:0];
						reg_clk_div1_valid = 1'b1;
					end
				`REG_UART_CFG:
				begin
					if ( s_axi_wstrb[0] == 1 )
						reg_uart_div[7:0] = s_axi_wdata[7:0];
					if ( s_axi_wstrb[1] == 1 )
						reg_uart_div[15:8] = s_axi_wdata[15:8];
					if ( s_axi_wstrb[2] == 1 )
					begin
						reg_uart_btr = s_axi_wdata[23:20];
					end
					if ( s_axi_wstrb[3] == 1 )
					begin
						reg_uart_pcheck = s_axi_wdata[24];
					end
				end
				`REG_UART_CMD:
				begin
					if ( s_axi_wstrb[0] == 1 )
					begin
						reg_uart_startrx = s_axi_wdata[1];
						reg_uart_stoprx = s_axi_wdata[3];
					end
				end
				`REG_RWM_TCDM:
				begin
					if ( s_axi_wstrb[0] == 1 )
					begin
						reg_wm_tcdm = s_axi_wdata[1:0];
						reg_rm_tcdm = s_axi_wdata[5:4];
					end
				end				
			endcase
		end
		else
		begin
			reg_clk_div0_valid = 1'b0;
			reg_clk_div1_valid = 1'b0;
			reg_uart_startrx = 1'b0;
			reg_uart_stoprx = 1'b0;
		end
	end // SLAVE_REG_WRITE_PROC


	// implement slave model register read mux
	always_comb
	begin
		s_axi_rdata = {32'h0,s_uart_rx_fifo};
		case(read_address)
			`REG_PADFUN0:
				s_axi_rdata[31:0] = reg_gpio_fun0;
			`REG_PADFUN1:
				s_axi_rdata[31:0] = reg_gpio_fun1;
			`REG_PADDIR:
				s_axi_rdata[31:0] = reg_gpio_dir;
			`REG_PADRD:
				s_axi_rdata[31:0] = reg_gpio_in_sync;
			`REG_PADWR:
				s_axi_rdata[31:0] = reg_gpio_out;
			`REG_CLKD0:
				s_axi_rdata       = {56'h0,reg_clk_div0};
			`REG_CLKD1:
				s_axi_rdata       = {56'h0,reg_clk_div1};
			`REG_UART_STATUS:
				s_axi_rdata[31:0] = s_uart_status;
			`REG_UART_CFG:
				s_axi_rdata[31:0] = {7'h0,reg_uart_pcheck,reg_uart_btr,4'h0,reg_uart_div};
			`REG_RWM_TCDM:
				s_axi_rdata       = {58'h0,reg_rm_tcdm,2'b00,reg_wm_tcdm};
		endcase
	end // SLAVE_REG_READ_PROC

	always_ff @(posedge s_axi_aclk, negedge s_axi_aresetn)
	begin
		if(s_axi_aresetn == 1'b0)
		begin
			reg_gpio_in      = 'h0;
			reg_gpio_in_sync = 'h0;
		end
		else
		begin
			reg_gpio_in      = gpio_in;
			reg_gpio_in_sync = reg_gpio_in;
		end
	end
	
	assign wm_tcdm = reg_wm_tcdm;
	assign rm_tcdm = reg_rm_tcdm;

	assign gpio_out = reg_gpio_out;
	assign gpio_dir = reg_gpio_dir;
	assign gpio_mux = {reg_gpio_fun1,reg_gpio_fun0};
	
	assign clk_div0       = reg_clk_div0;
	assign clk_div0_valid = reg_clk_div0_valid;
	assign clk_div1       = reg_clk_div1;
	assign clk_div1_valid = reg_clk_div1_valid;
	
	assign s_uart_tx_fifo       = s_axi_wdata[7:0];
	assign s_uart_tx_fifo_valid = write_req & (write_address[4] == 1'b1);
	assign s_uart_rx_fifo_ready = ((rd_addr[5] == 1'b1) && ((AR_CS == SINGLE) || (AR_CS == BURST))) & s_axi_rready;
	
endmodule
