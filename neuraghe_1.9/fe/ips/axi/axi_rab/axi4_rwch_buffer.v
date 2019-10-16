module axi4_rwch_buffer (axi4_aclk,
                         axi4_arstn,
                         s_axi4_bid,
                         s_axi4_bresp,
                         s_axi4_bvalid,
                         s_axi4_buser,
                         s_axi4_bready,
                         m_axi4_bid,
                         m_axi4_bresp,
                         m_axi4_bvalid,
                         m_axi4_buser,
                         m_axi4_bready);

  parameter  C_AXI_ID_WIDTH = 4;
  parameter  C_AXI_USER_WIDTH = 4;

  input                             axi4_aclk;
  input                             axi4_arstn;
  output       [C_AXI_ID_WIDTH-1:0] s_axi4_bid;
  output                      [1:0] s_axi4_bresp;
  output             		    s_axi4_bvalid;
  output     [C_AXI_USER_WIDTH-1:0] s_axi4_buser;
  input              		    s_axi4_bready;

  input        [C_AXI_ID_WIDTH-1:0] m_axi4_bid;
  input                       [1:0] m_axi4_bresp;
  input             		    m_axi4_bvalid;
  input      [C_AXI_USER_WIDTH-1:0] m_axi4_buser;
  output              		    m_axi4_bready;

  wire        [C_AXI_ID_WIDTH+C_AXI_USER_WIDTH+1:0] data_in;
  wire        [C_AXI_ID_WIDTH+C_AXI_USER_WIDTH+1:0] data_out;

  assign data_in[1:0]                = m_axi4_bresp;
  assign data_in[C_AXI_ID_WIDTH+1:2] = m_axi4_bid;
  assign data_in[C_AXI_ID_WIDTH+C_AXI_USER_WIDTH+1:C_AXI_ID_WIDTH+2] = m_axi4_buser;

  assign s_axi4_buser  = data_out[C_AXI_ID_WIDTH+C_AXI_USER_WIDTH+1:C_AXI_ID_WIDTH+2];
  assign s_axi4_bid    = data_out[C_AXI_ID_WIDTH+1:2];
  assign s_axi4_bresp  = data_out[1:0];

  axi_buffer_rab #(.DATA_WIDTH(C_AXI_ID_WIDTH+C_AXI_USER_WIDTH+2)) u_buffer(.clk(axi4_aclk), 
                                                        .rstn(axi4_arstn), 
                                                        .valid_out(s_axi4_bvalid), 
                                                        .data_out(data_out), 
                                                        .ready_in(s_axi4_bready), 
                                                        .valid_in(m_axi4_bvalid), 
                                                        .data_in(data_in), 
                                                        .ready_out(m_axi4_bready));

endmodule


