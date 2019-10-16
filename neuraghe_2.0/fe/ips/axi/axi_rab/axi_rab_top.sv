module axi_rab_top   
  #(
    parameter NUM_SLICES          = 16,
    parameter C_AXI_DATA_WIDTH    = 64,
    parameter C_AXICFG_DATA_WIDTH = 32,
    parameter C_AXI_ID_WIDTH      = 8,
    parameter C_AXI_USER_WIDTH    = 6,
    parameter N_PORTS             = 3
    )
   (
    input   logic axi4_aclk,
    input   logic axi4_arstn,
    input   logic axi4lite_aclk,
    input   logic axi4lite_arstn,

    input   logic    [N_PORTS-1:0]     [C_AXI_ID_WIDTH-1:0] s_axi4_awid,
    input   logic    [N_PORTS-1:0]                   [31:0] s_axi4_awaddr,
    input   logic    [N_PORTS-1:0]                          s_axi4_awvalid,
    output  logic    [N_PORTS-1:0]        	            s_axi4_awready,
    input   logic    [N_PORTS-1:0]       	     [7:0]  s_axi4_awlen,
    input   logic    [N_PORTS-1:0]                   [2:0]  s_axi4_awsize,
    input   logic    [N_PORTS-1:0]                   [1:0]  s_axi4_awburst,
    input   logic    [N_PORTS-1:0]                          s_axi4_awlock,
    input   logic    [N_PORTS-1:0]      	     [2:0]  s_axi4_awprot,
    input   logic    [N_PORTS-1:0]      	     [3:0]  s_axi4_awcache,
    input   logic    [N_PORTS-1:0]      	     [3:0]  s_axi4_awregion,
    input   logic    [N_PORTS-1:0]     	             [3:0]  s_axi4_awqos,
    input   logic    [N_PORTS-1:0]   [C_AXI_USER_WIDTH-1:0] s_axi4_awuser,

    input   logic    [N_PORTS-1:0]   [C_AXI_DATA_WIDTH-1:0] s_axi4_wdata,
    input   logic    [N_PORTS-1:0] 	                    s_axi4_wvalid,
    output  logic    [N_PORTS-1:0]  	                    s_axi4_wready,
    input   logic    [N_PORTS-1:0] [C_AXI_DATA_WIDTH/8-1:0] s_axi4_wstrb,
    input   logic    [N_PORTS-1:0]                          s_axi4_wlast,
    input   logic    [N_PORTS-1:0]   [C_AXI_USER_WIDTH-1:0] s_axi4_wuser,

    output  logic    [N_PORTS-1:0]     [C_AXI_ID_WIDTH-1:0] s_axi4_bid,
    output  logic    [N_PORTS-1:0]                    [1:0] s_axi4_bresp,
    output  logic    [N_PORTS-1:0]                          s_axi4_bvalid,
    output  logic    [N_PORTS-1:0]   [C_AXI_USER_WIDTH-1:0] s_axi4_buser,
    input   logic    [N_PORTS-1:0]                          s_axi4_bready,

    input   logic    [N_PORTS-1:0]     [C_AXI_ID_WIDTH-1:0] s_axi4_arid,
    input   logic    [N_PORTS-1:0]                   [31:0] s_axi4_araddr,
    input   logic    [N_PORTS-1:0]          	            s_axi4_arvalid,
    output  logic    [N_PORTS-1:0]                          s_axi4_arready,
    input   logic    [N_PORTS-1:0]          	     [7:0]  s_axi4_arlen,
    input   logic    [N_PORTS-1:0]          	     [2:0]  s_axi4_arsize,
    input   logic    [N_PORTS-1:0]                   [1:0]  s_axi4_arburst,
    input   logic    [N_PORTS-1:0]                          s_axi4_arlock,
    input   logic    [N_PORTS-1:0]         	     [2:0]  s_axi4_arprot,
    input   logic    [N_PORTS-1:0]                   [3:0]  s_axi4_arcache,
    input   logic    [N_PORTS-1:0]  [C_AXI_USER_WIDTH-1:0]  s_axi4_aruser,

    output  logic    [N_PORTS-1:0]     [C_AXI_ID_WIDTH-1:0] s_axi4_rid,
    output  logic    [N_PORTS-1:0]   [C_AXI_DATA_WIDTH-1:0] s_axi4_rdata,
    output  logic    [N_PORTS-1:0]                    [1:0] s_axi4_rresp,
    output  logic    [N_PORTS-1:0]                          s_axi4_rvalid,
    input   logic    [N_PORTS-1:0]                          s_axi4_rready,
    output  logic    [N_PORTS-1:0]                          s_axi4_rlast,
    output  logic    [N_PORTS-1:0]   [C_AXI_USER_WIDTH-1:0] s_axi4_ruser,

    output  logic    [N_PORTS-1:0]     [C_AXI_ID_WIDTH-1:0] m_axi4_awid,
    output  logic    [N_PORTS-1:0]                   [31:0] m_axi4_awaddr,
    output  logic    [N_PORTS-1:0]           	            m_axi4_awvalid,
    input   logic    [N_PORTS-1:0]           	            m_axi4_awready,
    output  logic    [N_PORTS-1:0]          	     [7:0]  m_axi4_awlen,
    output  logic    [N_PORTS-1:0]           	     [2:0]  m_axi4_awsize,
    output  logic    [N_PORTS-1:0]                   [1:0]  m_axi4_awburst,
    output  logic    [N_PORTS-1:0]                          m_axi4_awlock,
    output  logic    [N_PORTS-1:0]           	     [2:0]  m_axi4_awprot,
    output  logic    [N_PORTS-1:0]           	     [3:0]  m_axi4_awcache,
    output  logic    [N_PORTS-1:0]           	     [3:0]  m_axi4_awregion,
    output  logic    [N_PORTS-1:0]           	     [3:0]  m_axi4_awqos,
    output  logic    [N_PORTS-1:0]  [C_AXI_USER_WIDTH-1:0]  m_axi4_awuser,

    output  logic    [N_PORTS-1:0]   [C_AXI_DATA_WIDTH-1:0] m_axi4_wdata,
    output  logic    [N_PORTS-1:0]                          m_axi4_wvalid,
    input   logic    [N_PORTS-1:0]                          m_axi4_wready,
    output  logic    [N_PORTS-1:0] [C_AXI_DATA_WIDTH/8-1:0] m_axi4_wstrb,
    output  logic    [N_PORTS-1:0]                          m_axi4_wlast,
    output  logic    [N_PORTS-1:0]   [C_AXI_USER_WIDTH-1:0] m_axi4_wuser,

    input   logic    [N_PORTS-1:0]     [C_AXI_ID_WIDTH-1:0] m_axi4_bid,
    input   logic    [N_PORTS-1:0]                    [1:0] m_axi4_bresp,
    input   logic    [N_PORTS-1:0]                          m_axi4_bvalid,
    input   logic    [N_PORTS-1:0]   [C_AXI_USER_WIDTH-1:0] m_axi4_buser,
    output  logic    [N_PORTS-1:0]                          m_axi4_bready,

    output  logic    [N_PORTS-1:0]     [C_AXI_ID_WIDTH-1:0] m_axi4_arid,
    output  logic    [N_PORTS-1:0]                   [31:0] m_axi4_araddr,
    output  logic    [N_PORTS-1:0]                          m_axi4_arvalid,
    input   logic    [N_PORTS-1:0]           	            m_axi4_arready,
    output  logic    [N_PORTS-1:0]          	     [7:0]  m_axi4_arlen,
    output  logic    [N_PORTS-1:0]           	     [2:0]  m_axi4_arsize,
    output  logic    [N_PORTS-1:0]                   [1:0]  m_axi4_arburst,
    output  logic    [N_PORTS-1:0]                          m_axi4_arlock,
    output  logic    [N_PORTS-1:0]           	     [2:0]  m_axi4_arprot,
    output  logic    [N_PORTS-1:0]           	     [3:0]  m_axi4_arcache,
    output  logic    [N_PORTS-1:0]   [C_AXI_USER_WIDTH-1:0] m_axi4_aruser,

    input   logic    [N_PORTS-1:0]     [C_AXI_ID_WIDTH-1:0] m_axi4_rid,
    input   logic    [N_PORTS-1:0]   [C_AXI_DATA_WIDTH-1:0] m_axi4_rdata,
    input   logic    [N_PORTS-1:0]                    [1:0] m_axi4_rresp,
    input   logic    [N_PORTS-1:0]           	            m_axi4_rvalid,
    output  logic    [N_PORTS-1:0]           	            m_axi4_rready,
    input   logic    [N_PORTS-1:0]          	            m_axi4_rlast,
    input   logic    [N_PORTS-1:0]   [C_AXI_USER_WIDTH-1:0] m_axi4_ruser,

    input    logic                      [31:0] s_axi4lite_awaddr,
    input    logic                             s_axi4lite_awvalid,
    output   logic                             s_axi4lite_awready,

    input    logic   [C_AXICFG_DATA_WIDTH-1:0] s_axi4lite_wdata,
    input    logic           	               s_axi4lite_wvalid,
    output   logic             	               s_axi4lite_wready,
    input    logic [C_AXICFG_DATA_WIDTH/8-1:0] s_axi4lite_wstrb,

    output   logic                       [1:0] s_axi4lite_bresp,
    output   logic                             s_axi4lite_bvalid,
    input    logic                             s_axi4lite_bready,

    input    logic                      [31:0] s_axi4lite_araddr,
    input    logic           	               s_axi4lite_arvalid,
    output   logic             	               s_axi4lite_arready,

    output   logic   [C_AXICFG_DATA_WIDTH-1:0] s_axi4lite_rdata,
    output   logic                       [1:0] s_axi4lite_rresp,
    output   logic                             s_axi4lite_rvalid,
    input    logic                             s_axi4lite_rready,

    output   logic [N_PORTS-1:0] int_miss,
    output   logic [N_PORTS-1:0] int_multi,
    output   logic [N_PORTS-1:0] int_prot,
    output   logic               int_mhr_full
    );
   
   wire [N_PORTS-1:0]      [C_AXI_ID_WIDTH-1:0] int_awid;
   wire [N_PORTS-1:0]                    [31:0] int_awaddr;
   wire [N_PORTS-1:0] 				int_awvalid;
   wire [N_PORTS-1:0] 				int_awready;
   wire [N_PORTS-1:0]        	          [7:0] int_awlen;
   wire [N_PORTS-1:0]                     [2:0] int_awsize;
   wire [N_PORTS-1:0]                     [1:0] int_awburst;
   wire [N_PORTS-1:0] 		                int_awlock;
   wire [N_PORTS-1:0]                     [2:0] int_awprot;
   wire [N_PORTS-1:0]                     [3:0] int_awcache;
   wire [N_PORTS-1:0]                     [3:0] int_awregion;
   wire [N_PORTS-1:0]                     [3:0] int_awqos;
   wire [N_PORTS-1:0]    [C_AXI_USER_WIDTH-1:0] int_awuser;

   wire [N_PORTS-1:0]    [C_AXI_DATA_WIDTH-1:0] int_wdata;
   wire [N_PORTS-1:0] 	            	        int_wvalid;
   wire [N_PORTS-1:0] 			        int_wready;
   wire [N_PORTS-1:0]  [C_AXI_DATA_WIDTH/8-1:0] int_wstrb;
   wire [N_PORTS-1:0] 				int_wlast;
   wire [N_PORTS-1:0]    [C_AXI_USER_WIDTH-1:0] int_wuser;

   wire [N_PORTS-1:0]      [C_AXI_ID_WIDTH-1:0] int_bid;
   wire [N_PORTS-1:0]                     [1:0] int_bresp;
   wire [N_PORTS-1:0]                           int_bvalid;
   wire [N_PORTS-1:0]    [C_AXI_USER_WIDTH-1:0] int_buser;
   wire [N_PORTS-1:0] 	                        int_bready;

   wire [N_PORTS-1:0]      [C_AXI_ID_WIDTH-1:0] int_arid;
   wire [N_PORTS-1:0]                    [31:0] int_araddr;
   wire [N_PORTS-1:0]          		        int_arvalid;
   wire [N_PORTS-1:0] 			        int_arready;
   wire [N_PORTS-1:0]        	          [7:0] int_arlen;
   wire [N_PORTS-1:0]        	          [2:0] int_arsize;
   wire [N_PORTS-1:0]                     [1:0] int_arburst;
   wire [N_PORTS-1:0] 		                int_arlock;
   wire [N_PORTS-1:0]        	          [2:0] int_arprot;
   wire [N_PORTS-1:0]        	          [3:0] int_arcache;
   wire [N_PORTS-1:0]    [C_AXI_USER_WIDTH-1:0] int_aruser;

   wire [N_PORTS-1:0]      [C_AXI_ID_WIDTH-1:0] int_rid;
   wire [N_PORTS-1:0]                     [1:0] int_rresp;
   wire [N_PORTS-1:0]    [C_AXI_DATA_WIDTH-1:0] int_rdata;
   wire [N_PORTS-1:0] 	                        int_rlast;
   wire [N_PORTS-1:0]    [C_AXI_USER_WIDTH-1:0] int_ruser;
   wire [N_PORTS-1:0]                           int_rvalid;
   wire [N_PORTS-1:0] 			        int_rready;

   wire [N_PORTS-1:0]                    [31:0] int_wtrans_addr;
   wire [N_PORTS-1:0] 			        int_wtrans_accept;
   wire [N_PORTS-1:0] 			        int_wtrans_drop;
   wire [N_PORTS-1:0] 			        int_wtrans_sent;

   wire [N_PORTS-1:0]                    [31:0] int_rtrans_addr;
   wire [N_PORTS-1:0] 			        int_rtrans_accept;
   wire [N_PORTS-1:0] 			        int_rtrans_drop;
   wire [N_PORTS-1:0] 			        int_rtrans_sent;

   genvar 					i;

generate for (i = 0; i < N_PORTS; i++) begin

  axi4_awch_buffer #(C_AXI_ID_WIDTH,C_AXI_USER_WIDTH) u_awinbuffer(
                            .axi4_aclk(axi4_aclk),
                            .axi4_arstn(axi4_arstn),
                            .s_axi4_awid(s_axi4_awid [i]),
                            .s_axi4_awaddr(s_axi4_awaddr [i]),
                            .s_axi4_awvalid(s_axi4_awvalid [i]),
                            .s_axi4_awready(s_axi4_awready [i]),
                            .s_axi4_awlen(s_axi4_awlen [i]),
                            .s_axi4_awsize(s_axi4_awsize [i]),
                            .s_axi4_awburst(s_axi4_awburst [i]),
                            .s_axi4_awlock(s_axi4_awlock [i]),
                            .s_axi4_awprot(s_axi4_awprot [i]),
                            .s_axi4_awcache(s_axi4_awcache [i]),
                            .s_axi4_awregion(s_axi4_awregion [i]),
                            .s_axi4_awqos(s_axi4_awqos [i]),
                            .s_axi4_awuser(s_axi4_awuser [i]),
                            .m_axi4_awid(int_awid [i]),
                            .m_axi4_awaddr(int_awaddr [i]),
                            .m_axi4_awvalid(int_awvalid [i]),
                            .m_axi4_awready(int_awready [i]),
                            .m_axi4_awlen(int_awlen [i]),
                            .m_axi4_awsize(int_awsize [i]),
                            .m_axi4_awburst(int_awburst [i]),
                            .m_axi4_awlock(int_awlock [i]),
                            .m_axi4_awprot(int_awprot [i]),
                            .m_axi4_awcache(int_awcache [i]),
                            .m_axi4_awregion(int_awregion [i]),
                            .m_axi4_awqos(int_awqos [i]),
                            .m_axi4_awuser(int_awuser [i]));

  axi4_awch_sender #(C_AXI_ID_WIDTH,C_AXI_USER_WIDTH) u_awsender(
			                      .axi4_aclk(axi4_aclk),
                            .axi4_arstn(axi4_arstn),
                            .trans_accept(int_wtrans_accept[i]),
                            .trans_drop(int_wtrans_drop[i]),
                            .trans_sent(int_wtrans_sent[i]),
                            .s_axi4_awid(int_awid[i]),
                            .s_axi4_awaddr(int_wtrans_addr[i]), //gets the modified address
                            .s_axi4_awvalid(int_awvalid[i]),
                            .s_axi4_awready(int_awready[i]),
                            .s_axi4_awlen(int_awlen[i]),
                            .s_axi4_awsize(int_awsize[i]),
                            .s_axi4_awburst(int_awburst[i]),
                            .s_axi4_awlock(int_awlock[i]),
                            .s_axi4_awprot(int_awprot[i]),
                            .s_axi4_awcache(int_awcache[i]),
                            .s_axi4_awregion(int_awregion[i]),
                            .s_axi4_awqos(int_awqos[i]),
                            .s_axi4_awuser(int_awuser[i]),
                            .m_axi4_awid(m_axi4_awid[i]),
                            .m_axi4_awaddr(m_axi4_awaddr[i]),
                            .m_axi4_awvalid(m_axi4_awvalid[i]),
                            .m_axi4_awready(m_axi4_awready[i]),
                            .m_axi4_awlen(m_axi4_awlen[i]),
                            .m_axi4_awsize(m_axi4_awsize[i]),
                            .m_axi4_awburst(m_axi4_awburst[i]),
                            .m_axi4_awlock(m_axi4_awlock[i]),
                            .m_axi4_awprot(m_axi4_awprot[i]),
                            .m_axi4_awcache(m_axi4_awcache[i]),
                            .m_axi4_awregion(m_axi4_awregion[i]),
                            .m_axi4_awqos(m_axi4_awqos[i]),
                            .m_axi4_awuser(m_axi4_awuser[i]));

axi4_dwch_buffer #(C_AXI_DATA_WIDTH,C_AXI_USER_WIDTH) u_dwinbuffer(
                            .axi4_aclk(axi4_aclk),
                            .axi4_arstn(axi4_arstn),
                            .s_axi4_wdata(s_axi4_wdata [i]),
                            .s_axi4_wvalid(s_axi4_wvalid [i]),
                            .s_axi4_wready(s_axi4_wready [i]),
                            .s_axi4_wstrb(s_axi4_wstrb [i]),
                            .s_axi4_wlast(s_axi4_wlast [i]),
                            .s_axi4_wuser(s_axi4_wuser [i]),
                            .m_axi4_wdata(int_wdata [i]),
                            .m_axi4_wvalid(int_wvalid [i]),
                            .m_axi4_wready(int_wready [i]),
                            .m_axi4_wstrb(int_wstrb [i]),
                            .m_axi4_wlast(int_wlast [i]),
                            .m_axi4_wuser(int_wuser [i]));

axi4_dwch_sender #(C_AXI_DATA_WIDTH,C_AXI_USER_WIDTH) u_dwsender(
                            .axi4_aclk(axi4_aclk),
                            .axi4_arstn(axi4_arstn),
                            .trans_accept(int_wtrans_accept[i]),
                            .trans_drop(int_wtrans_drop[i]),
                            .s_axi4_wdata(int_wdata[i]),
                            .s_axi4_wvalid(int_wvalid[i]),
                            .s_axi4_wready(int_wready[i]),
                            .s_axi4_wstrb(int_wstrb[i]),
                            .s_axi4_wlast(int_wlast[i]),
                            .s_axi4_wuser(int_wuser[i]),
                            .m_axi4_wdata(m_axi4_wdata[i]),
                            .m_axi4_wvalid(m_axi4_wvalid[i]),
                            .m_axi4_wready(m_axi4_wready[i]),
                            .m_axi4_wstrb(m_axi4_wstrb[i]),
                            .m_axi4_wlast(m_axi4_wlast[i]),
                            .m_axi4_wuser(m_axi4_wuser[i]));


axi4_rwch_buffer #(C_AXI_ID_WIDTH,C_AXI_USER_WIDTH) u_rwchbuffer(
                            .axi4_aclk(axi4_aclk),
                            .axi4_arstn(axi4_arstn),
                            .s_axi4_bid(int_bid [i]),
                            .s_axi4_bresp(int_bresp [i]),
                            .s_axi4_bvalid(int_bvalid [i]),
                            .s_axi4_buser(int_buser [i]),
                            .s_axi4_bready(int_bready [i]),
                            .m_axi4_bid(m_axi4_bid [i]),
                            .m_axi4_bresp(m_axi4_bresp [i]),
                            .m_axi4_bvalid(m_axi4_bvalid [i]),
                            .m_axi4_buser(m_axi4_buser [i]),
                            .m_axi4_bready(m_axi4_bready [i]));

axi4_rwch_sender #(C_AXI_ID_WIDTH,C_AXI_USER_WIDTH) u_rwchsender(
                            .axi4_aclk(axi4_aclk),
                            .axi4_arstn(axi4_arstn),
                            .trans_id(int_awid[i]),
                            .trans_drop(int_wtrans_drop[i]),
                            .s_axi4_wvalid(int_wvalid[i]),
                            .s_axi4_wlast(int_wlast[i]),
                            .s_axi4_wready(int_wready[i]),
                            .s_axi4_bid(s_axi4_bid[i]),
                            .s_axi4_bresp(s_axi4_bresp[i]),
                            .s_axi4_bvalid(s_axi4_bvalid[i]),
                            .s_axi4_buser(s_axi4_buser[i]),
                            .s_axi4_bready(s_axi4_bready[i]),
                            .m_axi4_bid(int_bid[i]),
                            .m_axi4_bresp(int_bresp[i]),
                            .m_axi4_bvalid(int_bvalid[i]),
                            .m_axi4_buser(int_buser[i]),
                            .m_axi4_bready(int_bready[i]));

 axi4_arch_buffer #(C_AXI_ID_WIDTH,C_AXI_USER_WIDTH) u_arinbuffer(
                            .axi4_aclk(axi4_aclk),
                            .axi4_arstn(axi4_arstn),
                            .s_axi4_arid(s_axi4_arid [i]),
                            .s_axi4_araddr(s_axi4_araddr [i]),
                            .s_axi4_arvalid(s_axi4_arvalid [i]),
                            .s_axi4_arready(s_axi4_arready [i]),
                            .s_axi4_arlen(s_axi4_arlen [i]),
                            .s_axi4_arsize(s_axi4_arsize [i]),
                            .s_axi4_arburst(s_axi4_arburst [i]),
                            .s_axi4_arlock(s_axi4_arlock [i]),
                            .s_axi4_arprot(s_axi4_arprot [i]),
                            .s_axi4_arcache(s_axi4_arcache [i]),
                            .s_axi4_aruser(s_axi4_aruser [i]),
                            .m_axi4_arid(int_arid [i]),
                            .m_axi4_araddr(int_araddr [i]),
                            .m_axi4_arvalid(int_arvalid [i]),
                            .m_axi4_arready(int_arready [i]),
                            .m_axi4_arlen(int_arlen [i]),
                            .m_axi4_arsize(int_arsize [i]),
                            .m_axi4_arburst(int_arburst [i]),
                            .m_axi4_arlock(int_arlock [i]),
                            .m_axi4_arprot(int_arprot [i]),
                            .m_axi4_arcache(int_arcache [i]),
                            .m_axi4_aruser(int_aruser [i]));

  axi4_arch_sender #(C_AXI_ID_WIDTH,C_AXI_USER_WIDTH) u_arsender(
			                      .axi4_aclk(axi4_aclk),
                            .axi4_arstn(axi4_arstn),
                            .trans_accept(int_rtrans_accept[i]),
                            .trans_drop(int_rtrans_drop[i]),
                            .trans_sent(int_rtrans_sent[i]),
                            .s_axi4_arid(int_arid[i]),
                            .s_axi4_araddr(int_rtrans_addr[i]), //gets the modified address
                            .s_axi4_arvalid(int_arvalid[i]),
                            .s_axi4_arready(int_arready[i]),
                            .s_axi4_arlen(int_arlen[i]),
                            .s_axi4_arsize(int_arsize[i]),
                            .s_axi4_arburst(int_arburst[i]),
                            .s_axi4_arlock(int_arlock[i]),
                            .s_axi4_arprot(int_arprot[i]),
                            .s_axi4_arcache(int_arcache[i]),
                            .s_axi4_aruser(int_aruser[i]),
                            .m_axi4_arid(m_axi4_arid[i]),
                            .m_axi4_araddr(m_axi4_araddr[i]),
                            .m_axi4_arvalid(m_axi4_arvalid[i]),
                            .m_axi4_arready(m_axi4_arready[i]),
                            .m_axi4_arlen(m_axi4_arlen[i]),
                            .m_axi4_arsize(m_axi4_arsize[i]),
                            .m_axi4_arburst(m_axi4_arburst[i]),
                            .m_axi4_arlock(m_axi4_arlock[i]),
                            .m_axi4_arprot(m_axi4_arprot[i]),
                            .m_axi4_arcache(m_axi4_arcache[i]),
                            .m_axi4_aruser(m_axi4_aruser[i]));

axi4_rrch_buffer #(C_AXI_DATA_WIDTH,C_AXI_ID_WIDTH,C_AXI_USER_WIDTH) u_rrchbuffer(
                            .axi4_aclk(axi4_aclk),
                            .axi4_arstn(axi4_arstn),
                            .s_axi4_rid(int_rid [i]),
                            .s_axi4_rresp(int_rresp [i]),
                            .s_axi4_rdata(int_rdata [i]),
                            .s_axi4_rlast(int_rlast [i]),
                            .s_axi4_rvalid(int_rvalid [i]),
                            .s_axi4_ruser(int_ruser [i]),
                            .s_axi4_rready(int_rready [i]),
                            .m_axi4_rid(m_axi4_rid [i]),
                            .m_axi4_rresp(m_axi4_rresp [i]),
                            .m_axi4_rdata(m_axi4_rdata [i]),
                            .m_axi4_rlast(m_axi4_rlast [i]),
                            .m_axi4_rvalid(m_axi4_rvalid [i]),
                            .m_axi4_ruser(m_axi4_ruser [i]),
                            .m_axi4_rready(m_axi4_rready [i]));

axi4_rrch_sender #(C_AXI_DATA_WIDTH,C_AXI_ID_WIDTH,C_AXI_USER_WIDTH) u_rrchsender(
                            .axi4_aclk(axi4_aclk),
                            .axi4_arstn(axi4_arstn),
                            .trans_id(int_arid[i]),
                            .trans_drop(int_rtrans_drop[i]),
                            .s_axi4_rid(s_axi4_rid[i]),
                            .s_axi4_rresp(s_axi4_rresp[i]),
                            .s_axi4_rdata(s_axi4_rdata[i]),
                            .s_axi4_rlast(s_axi4_rlast[i]),
                            .s_axi4_rvalid(s_axi4_rvalid[i]),
                            .s_axi4_ruser(s_axi4_ruser[i]),
                            .s_axi4_rready(s_axi4_rready[i]),
                            .m_axi4_rid(int_rid[i]),
                            .m_axi4_rresp(int_rresp[i]),
                            .m_axi4_rdata(int_rdata[i]),
                            .m_axi4_rlast(int_rlast[i]),
                            .m_axi4_rvalid(int_rvalid[i]),
                            .m_axi4_ruser(int_ruser[i]),
                            .m_axi4_rready(int_rready[i]));
    
    end
endgenerate

   rab_core
     #(
       .RAB_ENTRIES(NUM_SLICES),
       .C_AXI_DATA_WIDTH(32),
       .C_AXI_ID_WIDTH(C_AXI_ID_WIDTH),
       .N_PORTS(N_PORTS)
       ) 
   u_rab_core
     (
		  .s_axi_aclk(axi4lite_aclk),
		  .s_axi_aresetn(axi4lite_arstn),
		  .s_axi_awaddr(s_axi4lite_awaddr),
		  .s_axi_awvalid(s_axi4lite_awvalid),
		  .s_axi_awready(s_axi4lite_awready),
		  .s_axi_wdata(s_axi4lite_wdata),
		  .s_axi_wstrb(s_axi4lite_wstrb),
		  .s_axi_wvalid(s_axi4lite_wvalid),
		  .s_axi_wready(s_axi4lite_wready),
		  .s_axi_bresp(s_axi4lite_bresp),
		  .s_axi_bvalid(s_axi4lite_bvalid),
		  .s_axi_bready(s_axi4lite_bready),
		  .s_axi_araddr(s_axi4lite_araddr),
		  .s_axi_arvalid(s_axi4lite_arvalid),
		  .s_axi_arready(s_axi4lite_arready),
		  .s_axi_rready(s_axi4lite_rready),
		  .s_axi_rdata(s_axi4lite_rdata),
		  .s_axi_rresp(s_axi4lite_rresp),
		  .s_axi_rvalid(s_axi4lite_rvalid),
		  .int_miss(int_miss),
		  .int_multi(int_multi),
		  .int_prot(int_prot),
		  .int_mhr_full(int_mhr_full),
		  .port1_addr(int_awaddr),
		  .port1_id(int_awid),                                                                                
		  .port1_len(int_awlen),
		  .port1_size(int_awsize),
		  .port1_addr_valid(int_awvalid),
		  .port1_type('1),
		  .port1_sent(int_wtrans_sent),
		  .port1_out_addr(int_wtrans_addr),
		  .port1_accept(int_wtrans_accept),
		  .port1_drop(int_wtrans_drop),
		  .port2_addr(int_araddr),
		  .port2_id(int_arid),                                                                                      
		  .port2_len(int_arlen),
		  .port2_size(int_arsize),
		  .port2_addr_valid(int_arvalid),
		  .port2_type('0),
		  .port2_sent(int_rtrans_sent),
		  .port2_out_addr(int_rtrans_addr),
		  .port2_accept(int_rtrans_accept),
		  .port2_drop(int_rtrans_drop)
      );

endmodule

