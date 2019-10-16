`include "ulpsoc_defines.sv"

module axi_rab_wrap
  #(
    NUM_SLICES      = 16,
    AXI_DATA_WIDTH  = 64,
    AXI_ID_WIDTH    = 8,
    AXI_USER_WIDTH  = 6,
    N_PORTS         = 3
    )
   (
    input  logic        clk_i,
    input  logic        rst_ni,
    
    AXI_BUS.Master rab_to_socbus,

    AXI_BUS.Slave  socbus_to_rab,

    AXI_BUS.Master rab_master,

    AXI_BUS.Slave  rab_slave,

    AXI_LITE.Slave  rab_lite,

    output logic intr_miss_o , 
    output logic intr_multi_o,
    output logic intr_prot_o,
    output logic intr_mhr_full_o
    );
   
   //---------------------------  ****************   ----------------------------------

   logic [N_PORTS-1:0]     [AXI_ID_WIDTH-1:0] s_axi_awid;
   logic [N_PORTS-1:0]                 [31:0] s_axi_awaddr;
   logic [N_PORTS-1:0] 	                      s_axi_awvalid;
   logic [N_PORTS-1:0] 	                      s_axi_awready;
   logic [N_PORTS-1:0]     	        [7:0] s_axi_awlen;
   logic [N_PORTS-1:0]                  [2:0] s_axi_awsize;
   logic [N_PORTS-1:0]                  [1:0] s_axi_awburst;
   logic [N_PORTS-1:0] 		              s_axi_awlock;
   logic [N_PORTS-1:0]  	        [2:0] s_axi_awprot;
   logic [N_PORTS-1:0]    	        [3:0] s_axi_awcache;
   logic [N_PORTS-1:0]    	        [3:0] s_axi_awregion;
   logic [N_PORTS-1:0]   	        [3:0] s_axi_awqos;
   logic [N_PORTS-1:0]   [AXI_USER_WIDTH-1:0] s_axi_awuser;
		       
   logic [N_PORTS-1:0]   [AXI_DATA_WIDTH-1:0] s_axi_wdata;
   logic [N_PORTS-1:0]                        s_axi_wvalid;
   logic [N_PORTS-1:0]                        s_axi_wready;
   logic [N_PORTS-1:0] [AXI_DATA_WIDTH/8-1:0] s_axi_wstrb;
   logic [N_PORTS-1:0]                        s_axi_wlast;
   logic [N_PORTS-1:0]   [AXI_USER_WIDTH-1:0] s_axi_wuser;
		       
   logic [N_PORTS-1:0]     [AXI_ID_WIDTH-1:0] s_axi_bid;
   logic [N_PORTS-1:0]                  [1:0] s_axi_bresp;
   logic [N_PORTS-1:0]                        s_axi_bvalid;
   logic [N_PORTS-1:0]   [AXI_USER_WIDTH-1:0] s_axi_buser;
   logic [N_PORTS-1:0]                        s_axi_bready;
		       
   logic [N_PORTS-1:0]     [AXI_ID_WIDTH-1:0] s_axi_arid;
   logic [N_PORTS-1:0]                 [31:0] s_axi_araddr;
   logic [N_PORTS-1:0]                        s_axi_arvalid;
   logic [N_PORTS-1:0]                        s_axi_arready;
   logic [N_PORTS-1:0]                  [7:0] s_axi_arlen;
   logic [N_PORTS-1:0]                  [2:0] s_axi_arsize;
   logic [N_PORTS-1:0]                  [1:0] s_axi_arburst;
   logic [N_PORTS-1:0]                        s_axi_arlock;
   logic [N_PORTS-1:0]       	        [2:0] s_axi_arprot;
   logic [N_PORTS-1:0]       	        [3:0] s_axi_arcache;
   logic [N_PORTS-1:0]   [AXI_USER_WIDTH-1:0] s_axi_aruser;
		       
   logic [N_PORTS-1:0]     [AXI_ID_WIDTH-1:0] s_axi_rid;
   logic [N_PORTS-1:0]   [AXI_DATA_WIDTH-1:0] s_axi_rdata;
   logic [N_PORTS-1:0]                  [1:0] s_axi_rresp;
   logic [N_PORTS-1:0]                        s_axi_rvalid;
   logic [N_PORTS-1:0]                        s_axi_rready;
   logic [N_PORTS-1:0]                        s_axi_rlast;
   logic [N_PORTS-1:0]   [AXI_USER_WIDTH-1:0] s_axi_ruser;
		       
   logic [N_PORTS-1:0]     [AXI_ID_WIDTH-1:0] m_axi_awid;
   logic [N_PORTS-1:0]                 [31:0] m_axi_awaddr;
   logic [N_PORTS-1:0]                        m_axi_awvalid;
   logic [N_PORTS-1:0]                        m_axi_awready;
   logic [N_PORTS-1:0]                  [7:0] m_axi_awlen;
   logic [N_PORTS-1:0]                  [2:0] m_axi_awsize;
   logic [N_PORTS-1:0]                  [1:0] m_axi_awburst;
   logic [N_PORTS-1:0]                        m_axi_awlock;
   logic [N_PORTS-1:0]                  [2:0] m_axi_awprot;
   logic [N_PORTS-1:0]                  [3:0] m_axi_awcache;
   logic [N_PORTS-1:0]                  [3:0] m_axi_awregion;
   logic [N_PORTS-1:0]                  [3:0] m_axi_awqos;
   logic [N_PORTS-1:0]   [AXI_USER_WIDTH-1:0] m_axi_awuser;
		       
   logic [N_PORTS-1:0]   [AXI_DATA_WIDTH-1:0] m_axi_wdata;
   logic [N_PORTS-1:0]                        m_axi_wvalid;
   logic [N_PORTS-1:0]                        m_axi_wready;
   logic [N_PORTS-1:0] [AXI_DATA_WIDTH/8-1:0] m_axi_wstrb;
   logic [N_PORTS-1:0]                        m_axi_wlast;
   logic [N_PORTS-1:0]   [AXI_USER_WIDTH-1:0] m_axi_wuser;
		       
   logic [N_PORTS-1:0]     [AXI_ID_WIDTH-1:0] m_axi_bid;
   logic [N_PORTS-1:0]                  [1:0] m_axi_bresp;
   logic [N_PORTS-1:0]                        m_axi_bvalid;
   logic [N_PORTS-1:0]   [AXI_USER_WIDTH-1:0] m_axi_buser;
   logic [N_PORTS-1:0]                        m_axi_bready;
		       
   logic [N_PORTS-1:0]     [AXI_ID_WIDTH-1:0] m_axi_arid;
   logic [N_PORTS-1:0]                 [31:0] m_axi_araddr;
   logic [N_PORTS-1:0]                        m_axi_arvalid;
   logic [N_PORTS-1:0]                        m_axi_arready;
   logic [N_PORTS-1:0]                  [7:0] m_axi_arlen;
   logic [N_PORTS-1:0]                  [2:0] m_axi_arsize;
   logic [N_PORTS-1:0]                  [1:0] m_axi_arburst;
   logic [N_PORTS-1:0]                        m_axi_arlock;
   logic [N_PORTS-1:0]                  [2:0] m_axi_arprot;
   logic [N_PORTS-1:0]                  [3:0] m_axi_arcache;
   logic [N_PORTS-1:0]   [AXI_USER_WIDTH-1:0] m_axi_aruser;
		       
   logic [N_PORTS-1:0]     [AXI_ID_WIDTH-1:0] m_axi_rid;
   logic [N_PORTS-1:0]   [AXI_DATA_WIDTH-1:0] m_axi_rdata;
   logic [N_PORTS-1:0]                  [1:0] m_axi_rresp;
   logic [N_PORTS-1:0]                        m_axi_rvalid;
   logic [N_PORTS-1:0]                        m_axi_rready;
   logic [N_PORTS-1:0]                        m_axi_rlast;
   logic [N_PORTS-1:0]   [AXI_USER_WIDTH-1:0] m_axi_ruser;

   logic [N_PORTS-1:0] 			      intr_rab_miss;
   logic [N_PORTS-1:0]            intr_rab_multi;
   logic [N_PORTS-1:0] 			      intr_rab_prot;
   logic                          intr_mhr_full;
   
   
   //---------------------------  ****************   ----------------------------------

   assign  s_axi_awid = {socbus_to_rab.aw_id,    rab_slave.aw_id};
   assign  s_axi_awaddr = {socbus_to_rab.aw_addr,  rab_slave.aw_addr};
   assign  s_axi_awvalid = {socbus_to_rab.aw_valid, rab_slave.aw_valid};
   assign   {socbus_to_rab.aw_ready, rab_slave.aw_ready} = s_axi_awready ;
   assign  s_axi_awlen = {socbus_to_rab.aw_len,rab_slave.aw_len};
   assign  s_axi_awsize = {socbus_to_rab.aw_size,rab_slave.aw_size};
   assign  s_axi_awburst = {socbus_to_rab.aw_burst,rab_slave.aw_burst};
   assign  s_axi_awlock = {socbus_to_rab.aw_lock,rab_slave.aw_lock};
   assign  s_axi_awprot = {socbus_to_rab.aw_prot,rab_slave.aw_prot};
   assign  s_axi_awcache = {socbus_to_rab.aw_cache,rab_slave.aw_cache};
   assign  s_axi_awregion = {socbus_to_rab.aw_region,rab_slave.aw_region};
   assign  s_axi_awqos = {socbus_to_rab.aw_qos,rab_slave.aw_qos};
   assign  s_axi_awuser = {socbus_to_rab.aw_user,rab_slave.aw_user};

   assign  s_axi_wdata = {socbus_to_rab.w_data,rab_slave.w_data};
   assign  s_axi_wvalid = {socbus_to_rab.w_valid,rab_slave.w_valid};
   assign  {socbus_to_rab.w_ready,rab_slave.w_ready} = s_axi_wready ;
   assign  s_axi_wstrb = {socbus_to_rab.w_strb,rab_slave.w_strb};
   assign  s_axi_wlast = {socbus_to_rab.w_last,rab_slave.w_last};
   assign  s_axi_wuser = {socbus_to_rab.w_user,rab_slave.w_user};

   assign   {socbus_to_rab.b_id,rab_slave.b_id} = s_axi_bid ;
   assign   {socbus_to_rab.b_resp,rab_slave.b_resp} = s_axi_bresp;
   assign   {socbus_to_rab.b_valid,rab_slave.b_valid} = s_axi_bvalid ;
   assign   {socbus_to_rab.b_user,rab_slave.b_user} = s_axi_buser;
   assign  s_axi_bready = {socbus_to_rab.b_ready,rab_slave.b_ready};

   assign  s_axi_arid = {socbus_to_rab.ar_id,rab_slave.ar_id};
   assign  s_axi_araddr = {socbus_to_rab.ar_addr,rab_slave.ar_addr};
   assign  s_axi_arvalid = {socbus_to_rab.ar_valid,rab_slave.ar_valid};
   assign   {socbus_to_rab.ar_ready,rab_slave.ar_ready} = s_axi_arready ;
   assign  s_axi_arlen = {socbus_to_rab.ar_len,rab_slave.ar_len};
   assign  s_axi_arsize = {socbus_to_rab.ar_size,rab_slave.ar_size};
   assign  s_axi_arburst = {socbus_to_rab.ar_burst,rab_slave.ar_burst};
   assign  s_axi_arlock = {socbus_to_rab.ar_lock,rab_slave.ar_lock};
   assign  s_axi_arprot = {socbus_to_rab.ar_prot,rab_slave.ar_prot};
   assign  s_axi_arcache = {socbus_to_rab.ar_cache,rab_slave.ar_cache};
   assign  s_axi_aruser = {socbus_to_rab.ar_user,rab_slave.ar_user};

   assign   {socbus_to_rab.r_id,rab_slave.r_id} = s_axi_rid;
   assign   {socbus_to_rab.r_data,rab_slave.r_data} = s_axi_rdata;
   assign   {socbus_to_rab.r_resp,rab_slave.r_resp} = s_axi_rresp;
   assign   {socbus_to_rab.r_valid,rab_slave.r_valid} = s_axi_rvalid;
   assign  s_axi_rready = {socbus_to_rab.r_ready,rab_slave.r_ready};
   assign   {socbus_to_rab.r_last,rab_slave.r_last} = s_axi_rlast;
   assign   {socbus_to_rab.r_user,rab_slave.r_user} = s_axi_ruser;

   //-------------------------------------------------------------------------------------------------------

   assign   {rab_master.aw_id,rab_to_socbus.aw_id} = m_axi_awid ;
   assign   {rab_master.aw_addr,rab_to_socbus.aw_addr} = m_axi_awaddr;
   assign   {rab_master.aw_valid,rab_to_socbus.aw_valid} = m_axi_awvalid;
   assign  m_axi_awready = {rab_master.aw_ready,rab_to_socbus.aw_ready};
   assign   {rab_master.aw_len,rab_to_socbus.aw_len} = m_axi_awlen;
   assign   {rab_master.aw_size,rab_to_socbus.aw_size} = m_axi_awsize ;
   assign   {rab_master.aw_burst,rab_to_socbus.aw_burst} = m_axi_awburst ;
   assign   {rab_master.aw_lock,rab_to_socbus.aw_lock} = m_axi_awlock;
   assign   {rab_master.aw_prot,rab_to_socbus.aw_prot} = m_axi_awprot ;
   assign   {rab_master.aw_cache,rab_to_socbus.aw_cache} =  m_axi_awcache;
   assign   {rab_master.aw_region,rab_to_socbus.aw_region} = m_axi_awregion;
   assign   {rab_master.aw_qos,rab_to_socbus.aw_qos} =  m_axi_awqos;
   assign   {rab_master.aw_user,rab_to_socbus.aw_user} =  m_axi_awuser;

   assign   {rab_master.w_data,rab_to_socbus.w_data} = m_axi_wdata;
   assign   {rab_master.w_valid,rab_to_socbus.w_valid} = m_axi_wvalid;
   assign  m_axi_wready = {rab_master.w_ready,rab_to_socbus.w_ready};
   assign   {rab_master.w_strb,rab_to_socbus.w_strb} = m_axi_wstrb;
   assign  {rab_master.w_last,rab_to_socbus.w_last} = m_axi_wlast;
   assign  {rab_master.w_user,rab_to_socbus.w_user} = m_axi_wuser;

   assign  m_axi_bid = {rab_master.b_id,rab_to_socbus.b_id};
   assign  m_axi_bresp = {rab_master.b_resp,rab_to_socbus.b_resp};
   assign  m_axi_bvalid = {rab_master.b_valid,rab_to_socbus.b_valid};
   assign  m_axi_buser = {rab_master.b_user,rab_to_socbus.b_user};
   assign   {rab_master.b_ready,rab_to_socbus.b_ready} = m_axi_bready;

   assign   {rab_master.ar_id,rab_to_socbus.ar_id} = m_axi_arid;
   assign   {rab_master.ar_addr,rab_to_socbus.ar_addr} = m_axi_araddr ;
   assign   {rab_master.ar_valid,rab_to_socbus.ar_valid} = m_axi_arvalid;
   assign  m_axi_arready = {rab_master.ar_ready,rab_to_socbus.ar_ready};
   assign  {rab_master.ar_len,rab_to_socbus.ar_len} =  m_axi_arlen;
   assign   {rab_master.ar_size,rab_to_socbus.ar_size} = m_axi_arsize ;
   assign                  {rab_master.ar_burst,rab_to_socbus.ar_burst}= m_axi_arburst ;
   assign                  {rab_master.ar_lock,rab_to_socbus.ar_lock} =  m_axi_arlock;
   assign                  {rab_master.ar_prot,rab_to_socbus.ar_prot} = m_axi_arprot;
   assign                  {rab_master.ar_cache,rab_to_socbus.ar_cache} = m_axi_arcache;
   assign                  {rab_master.ar_user,rab_to_socbus.ar_user} = m_axi_aruser;

   assign  m_axi_rid = {rab_master.r_id,rab_to_socbus.r_id};
   assign  m_axi_rdata = {rab_master.r_data,rab_to_socbus.r_data};
   assign  m_axi_rresp = {rab_master.r_resp,rab_to_socbus.r_resp};
   assign  m_axi_rvalid = {rab_master.r_valid,rab_to_socbus.r_valid};
   assign                {rab_master.r_ready,rab_to_socbus.r_ready} = m_axi_rready;
   assign  m_axi_rlast = {rab_master.r_last,rab_to_socbus.r_last};
   assign  m_axi_ruser = {rab_master.r_user,rab_to_socbus.r_user};

   assign intr_miss_o     = | intr_rab_miss;
   assign intr_multi_o    = | intr_rab_multi;
   assign intr_prot_o     = | intr_rab_prot;
   assign intr_mhr_full_o = intr_mhr_full;
   
   //------------------------------   AXI_RAB   ---------------------------------------

   axi_rab_top  
     #(
		   .NUM_SLICES       (NUM_SLICES),
       .C_AXI_DATA_WIDTH (AXI_DATA_WIDTH),
       .C_AXI_ID_WIDTH   (AXI_ID_WIDTH),
       .C_AXI_USER_WIDTH (AXI_USER_WIDTH),
       .N_PORTS          (N_PORTS)
		   )
   axi_rab_top_i
     (
      .axi4_aclk       (clk_i),
      .axi4_arstn      (rst_ni),
      .axi4lite_aclk   (clk_i),
      .axi4lite_arstn  (rst_ni),

      .s_axi4_awid     (s_axi_awid),
      .s_axi4_awaddr   (s_axi_awaddr),
      .s_axi4_awvalid  (s_axi_awvalid),
      .s_axi4_awready  (s_axi_awready),
      .s_axi4_awlen    (s_axi_awlen),
      .s_axi4_awsize   (s_axi_awsize),
      .s_axi4_awburst  (s_axi_awburst),
      .s_axi4_awlock   (s_axi_awlock),
      .s_axi4_awprot   (s_axi_awprot),
      .s_axi4_awcache  (s_axi_awcache),
      .s_axi4_awregion (s_axi_awregion),
      .s_axi4_awqos    (s_axi_awqos),
      .s_axi4_awuser   (s_axi_awuser),

      .s_axi4_wdata  (s_axi_wdata),
      .s_axi4_wvalid (s_axi_wvalid),
      .s_axi4_wready (s_axi_wready),
      .s_axi4_wstrb  (s_axi_wstrb),
      .s_axi4_wlast  (s_axi_wlast),
      .s_axi4_wuser  (s_axi_wuser),

      .s_axi4_bid    (s_axi_bid),
      .s_axi4_bresp  (s_axi_bresp),
      .s_axi4_bvalid (s_axi_bvalid),
      .s_axi4_buser  (s_axi_buser),
      .s_axi4_bready (s_axi_bready),

      .s_axi4_arid    (s_axi_arid),
      .s_axi4_araddr  (s_axi_araddr),
      .s_axi4_arvalid (s_axi_arvalid),
      .s_axi4_arready (s_axi_arready),
      .s_axi4_arlen   (s_axi_arlen),
      .s_axi4_arsize  (s_axi_arsize),
      .s_axi4_arburst (s_axi_arburst),
      .s_axi4_arlock  (s_axi_arlock),
      .s_axi4_arprot  (s_axi_arprot),
      .s_axi4_arcache (s_axi_arcache),
      .s_axi4_aruser  (s_axi_aruser),

      .s_axi4_rid    (s_axi_rid),
      .s_axi4_rdata  (s_axi_rdata),
      .s_axi4_rresp  (s_axi_rresp),
      .s_axi4_rvalid (s_axi_rvalid),
      .s_axi4_rready (s_axi_rready),
      .s_axi4_rlast  (s_axi_rlast),
      .s_axi4_ruser  (s_axi_ruser),

      .m_axi4_awid    (m_axi_awid),
      .m_axi4_awaddr  (m_axi_awaddr),
      .m_axi4_awvalid (m_axi_awvalid),
      .m_axi4_awready (m_axi_awready),
      .m_axi4_awlen   (m_axi_awlen),
      .m_axi4_awsize  (m_axi_awsize),
      .m_axi4_awburst (m_axi_awburst),
      .m_axi4_awlock  (m_axi_awlock),
      .m_axi4_awprot  (m_axi_awprot),
      .m_axi4_awcache (m_axi_awcache),
      .m_axi4_awregion(m_axi_awregion),
      .m_axi4_awqos   (m_axi_awqos),
      .m_axi4_awuser  (m_axi_awuser),

      .m_axi4_wdata  (m_axi_wdata),
      .m_axi4_wvalid (m_axi_wvalid),
      .m_axi4_wready (m_axi_wready),
      .m_axi4_wstrb  (m_axi_wstrb),
      .m_axi4_wlast  (m_axi_wlast),
      .m_axi4_wuser  (m_axi_wuser),

      .m_axi4_bid    (m_axi_bid),
      .m_axi4_bresp  (m_axi_bresp),
      .m_axi4_bvalid (m_axi_bvalid),
      .m_axi4_buser  (m_axi_buser),
      .m_axi4_bready (m_axi_bready),

      .m_axi4_arid    (m_axi_arid),
      .m_axi4_araddr  (m_axi_araddr),
      .m_axi4_arvalid (m_axi_arvalid),
      .m_axi4_arready (m_axi_arready),
      .m_axi4_arlen   (m_axi_arlen),
      .m_axi4_arsize  (m_axi_arsize),
      .m_axi4_arburst (m_axi_arburst),
      .m_axi4_arlock  (m_axi_arlock),
      .m_axi4_arprot  (m_axi_arprot),
      .m_axi4_arcache (m_axi_arcache),
      .m_axi4_aruser  (m_axi_aruser),

      .m_axi4_rid    (m_axi_rid),
      .m_axi4_rdata  (m_axi_rdata),
      .m_axi4_rresp  (m_axi_rresp),
      .m_axi4_rvalid (m_axi_rvalid),
      .m_axi4_rready (m_axi_rready),
      .m_axi4_rlast  (m_axi_rlast),
      .m_axi4_ruser  (m_axi_ruser),

      .s_axi4lite_awaddr  (rab_lite.aw_addr),
      .s_axi4lite_awvalid (rab_lite.aw_valid),
      .s_axi4lite_awready (rab_lite.aw_ready),

      .s_axi4lite_wdata  (rab_lite.w_data),
      .s_axi4lite_wvalid (rab_lite.w_valid),
      .s_axi4lite_wready (rab_lite.w_ready),
      .s_axi4lite_wstrb  (rab_lite.w_strb),

      .s_axi4lite_bresp  (rab_lite.b_resp),
      .s_axi4lite_bvalid (rab_lite.b_valid),
      .s_axi4lite_bready (rab_lite.b_ready),

      .s_axi4lite_araddr  (rab_lite.ar_addr),
      .s_axi4lite_arvalid (rab_lite.ar_valid),
      .s_axi4lite_arready (rab_lite.ar_ready),

      .s_axi4lite_rdata  (rab_lite.r_data),
      .s_axi4lite_rresp  (rab_lite.r_resp),
      .s_axi4lite_rvalid (rab_lite.r_valid),
      .s_axi4lite_rready (rab_lite.r_ready),

      .int_miss    (intr_rab_miss ),
      .int_multi   (intr_rab_multi),
      .int_prot    (intr_rab_prot ),
      .int_mhr_full(intr_mhr_full )
      );
endmodule