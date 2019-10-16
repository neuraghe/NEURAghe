module axi4_awch_sender (axi4_aclk,
                         axi4_arstn,
                         trans_accept,
                         trans_drop,
                         trans_sent,
                         s_axi4_awid,
                         s_axi4_awaddr,
                         s_axi4_awvalid,
                         s_axi4_awready,
                         s_axi4_awlen,
                         s_axi4_awsize,
                         s_axi4_awburst,
                         s_axi4_awlock,
                         s_axi4_awprot,
                         s_axi4_awcache,
                         s_axi4_awregion,
                         s_axi4_awqos,
                         s_axi4_awuser,
                         m_axi4_awid,
                         m_axi4_awaddr,
                         m_axi4_awvalid,
                         m_axi4_awready,
                         m_axi4_awlen,
                         m_axi4_awsize,
                         m_axi4_awburst,
                         m_axi4_awlock,
                         m_axi4_awprot,
                         m_axi4_awcache,
                         m_axi4_awregion,
                         m_axi4_awqos,
                         m_axi4_awuser);

  parameter  C_AXI_ID_WIDTH = 4;
  parameter  C_AXI_USER_WIDTH = 4;
   
  input                             axi4_aclk;
  input                             axi4_arstn;
  input                             trans_accept;
  input                             trans_drop;
  output                            trans_sent;

  input        [C_AXI_ID_WIDTH-1:0] s_axi4_awid;
  input                      [31:0] s_axi4_awaddr;
  input             		    s_axi4_awvalid;
  output              		    s_axi4_awready;
  input             	      [7:0] s_axi4_awlen;
  input             	      [2:0] s_axi4_awsize;
  input                       [1:0] s_axi4_awburst;
  input                             s_axi4_awlock;
  input             	      [2:0] s_axi4_awprot;
  input             	      [3:0] s_axi4_awcache;
  input             	      [3:0] s_axi4_awregion;
  input             	      [3:0] s_axi4_awqos;
  input      [C_AXI_USER_WIDTH-1:0] s_axi4_awuser;

  output       [C_AXI_ID_WIDTH-1:0] m_axi4_awid;
  output                     [31:0] m_axi4_awaddr;
  output             		    m_axi4_awvalid;
  input              		    m_axi4_awready;
  output             	      [7:0] m_axi4_awlen;
  output             	      [2:0] m_axi4_awsize;
  output                      [1:0] m_axi4_awburst;
  output                            m_axi4_awlock;
  output             	      [2:0] m_axi4_awprot;
  output             	      [3:0] m_axi4_awcache;
  output             	      [3:0] m_axi4_awregion;
  output             	      [3:0] m_axi4_awqos;
  output     [C_AXI_USER_WIDTH-1:0] m_axi4_awuser;

  wire                              aw_sent;
  reg                               waiting_awready;

  assign aw_sent = s_axi4_awvalid & s_axi4_awready;

  assign m_axi4_awuser  = s_axi4_awuser;
  assign m_axi4_awcache = s_axi4_awcache;
  assign m_axi4_awregion = s_axi4_awregion;
  assign m_axi4_awqos   = s_axi4_awqos;
  assign m_axi4_awprot  = s_axi4_awprot;
  assign m_axi4_awlock  = s_axi4_awlock;
  assign m_axi4_awburst = s_axi4_awburst;
  assign m_axi4_awsize  = s_axi4_awsize;
  assign m_axi4_awlen   = s_axi4_awlen;
  assign m_axi4_awaddr  = s_axi4_awaddr;
  assign m_axi4_awid    = s_axi4_awid;

  always @(posedge axi4_aclk or negedge axi4_arstn)
    begin: buffers_sequential
      if (axi4_arstn == 1'b0)
        waiting_awready = 1'b0;
      else if (aw_sent)
        waiting_awready = 1'b0;
      else if (trans_accept)
        waiting_awready = 1'b1;
    end

 assign m_axi4_awvalid = s_axi4_awvalid & (trans_accept | waiting_awready);
  // if 1: valid aw transaction at input & slave asserts awready & either transaction is accepted or we were waiting for awready
  //    2: valid aw transaction at input & transaction is dropped
  assign s_axi4_awready = (m_axi4_awvalid & m_axi4_awready) | (s_axi4_awvalid & trans_drop);

  assign trans_sent = aw_sent;

endmodule


