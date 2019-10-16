module axi4_arch_sender (axi4_aclk,
                         axi4_arstn,
                         trans_accept,
                         trans_drop,
                         trans_sent,
                         s_axi4_arid,
                         s_axi4_araddr,
                         s_axi4_arvalid,
                         s_axi4_arready,
                         s_axi4_arlen,
                         s_axi4_arsize,
                         s_axi4_arburst,
                         s_axi4_arlock,
                         s_axi4_arprot,
                         s_axi4_arcache,
                         s_axi4_aruser,
                         m_axi4_arid,
                         m_axi4_araddr,
                         m_axi4_arvalid,
                         m_axi4_arready,
                         m_axi4_arlen,
                         m_axi4_arsize,
                         m_axi4_arburst,
                         m_axi4_arlock,
                         m_axi4_arprot,
                         m_axi4_arcache,
                         m_axi4_aruser);

  parameter  C_AXI_ID_WIDTH = 4;
  parameter C_AXI_USER_WIDTH = 4;

  input                             axi4_aclk;
  input                             axi4_arstn;
  input                             trans_accept;
  input                             trans_drop;
  output                            trans_sent;

  input        [C_AXI_ID_WIDTH-1:0] s_axi4_arid;
  input                      [31:0] s_axi4_araddr;
  input             		    s_axi4_arvalid;
  output              		    s_axi4_arready;
  input             	      [7:0] s_axi4_arlen;
  input             	      [2:0] s_axi4_arsize;
  input                       [1:0] s_axi4_arburst;
  input                             s_axi4_arlock;
  input             	      [2:0] s_axi4_arprot;
  input             	      [3:0] s_axi4_arcache;
  input      [C_AXI_USER_WIDTH-1:0] s_axi4_aruser;

  output       [C_AXI_ID_WIDTH-1:0] m_axi4_arid;
  output                     [31:0] m_axi4_araddr;
  output             		    m_axi4_arvalid;
  input              		    m_axi4_arready;
  output             	      [7:0] m_axi4_arlen;
  output             	      [2:0] m_axi4_arsize;
  output                      [1:0] m_axi4_arburst;
  output                            m_axi4_arlock;
  output             	      [2:0] m_axi4_arprot;
  output             	      [3:0] m_axi4_arcache;
  output     [C_AXI_USER_WIDTH-1:0] m_axi4_aruser;

  wire                              ar_sent;
  reg                               waiting_arready;

  assign ar_sent = s_axi4_arvalid & s_axi4_arready;

  assign m_axi4_aruser  = s_axi4_aruser;
  assign m_axi4_arcache = s_axi4_arcache;
  assign m_axi4_arprot  = s_axi4_arprot;
  assign m_axi4_arlock  = s_axi4_arlock;
  assign m_axi4_arburst = s_axi4_arburst;
  assign m_axi4_arsize  = s_axi4_arsize;
  assign m_axi4_arlen   = s_axi4_arlen;
  assign m_axi4_araddr  = s_axi4_araddr;
  assign m_axi4_arid    = s_axi4_arid;

  always @(posedge axi4_aclk or negedge axi4_arstn)
    begin: buffers_sequential
      if (axi4_arstn == 1'b0)
        waiting_arready = 1'b0;
      else if (ar_sent)
        waiting_arready = 1'b0;
      else if (trans_accept)
        waiting_arready = 1'b1;
    end

 assign m_axi4_arvalid = s_axi4_arvalid & (trans_accept | waiting_arready);
  // if 1: valid ar transaction at input & slave asserts arready & either transaction is accepted or we were waiting for arready
  //    2: valid ar transaction at input & transaction is dropped
  assign s_axi4_arready = (m_axi4_arvalid & m_axi4_arready) | (s_axi4_arvalid & trans_drop);

  assign trans_sent = ar_sent;

endmodule


