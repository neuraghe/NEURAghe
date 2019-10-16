module axi4_awch_buffer (axi4_aclk,
                         axi4_arstn,
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

  wire        [C_AXI_USER_WIDTH+C_AXI_ID_WIDTH+60:0] data_in;
  wire        [C_AXI_USER_WIDTH+C_AXI_ID_WIDTH+60:0] data_out;

  assign data_in[3:0]                    = s_axi4_awcache;
  assign data_in[6:4]                    = s_axi4_awprot;
  assign data_in[7]                      = s_axi4_awlock;
  assign data_in[9:8]                    = s_axi4_awburst;
  assign data_in[12:10]                  = s_axi4_awsize;
  assign data_in[20:13]                  = s_axi4_awlen;
  assign data_in[52:21]                  = s_axi4_awaddr;
  assign data_in[56:53]                  = s_axi4_awregion;
  assign data_in[60:57]                  = s_axi4_awqos;
  assign data_in[60+C_AXI_ID_WIDTH:61]   = s_axi4_awid;
  assign data_in[60+C_AXI_ID_WIDTH+C_AXI_USER_WIDTH:61+C_AXI_ID_WIDTH]   = s_axi4_awuser;

  assign m_axi4_awcache = data_out[3:0];
  assign m_axi4_awprot  = data_out[6:4];
  assign m_axi4_awlock  = data_out[7];
  assign m_axi4_awburst = data_out[9:8];
  assign m_axi4_awsize  = data_out[12:10];
  assign m_axi4_awlen   = data_out[20:13];
  assign m_axi4_awaddr  = data_out[52:21];
  assign m_axi4_awregion  = data_out[56:53];
  assign m_axi4_awqos   = data_out[60:57];
  assign m_axi4_awid    = data_out[60+C_AXI_ID_WIDTH:61];
  assign m_axi4_awuser  = data_out[60+C_AXI_ID_WIDTH+C_AXI_USER_WIDTH:61+C_AXI_ID_WIDTH];

  axi_buffer_rab #(.DATA_WIDTH(C_AXI_ID_WIDTH+C_AXI_USER_WIDTH+61)) u_buffer(.clk(axi4_aclk), 
                                                        .rstn(axi4_arstn), 
                                                        .valid_out(m_axi4_awvalid), 
                                                        .data_out(data_out), 
                                                        .ready_in(m_axi4_awready), 
                                                        .valid_in(s_axi4_awvalid), 
                                                        .data_in(data_in), 
                                                        .ready_out(s_axi4_awready));

endmodule


