module axi4_rrch_buffer (axi4_aclk,
                         axi4_arstn,
                         s_axi4_rid,
                         s_axi4_rdata,
                         s_axi4_rlast,
                         s_axi4_rresp,
                         s_axi4_rvalid,
                         s_axi4_ruser,
                         s_axi4_rready,
                         m_axi4_rid,
                         m_axi4_rdata,
                         m_axi4_rlast,
                         m_axi4_rresp,
                         m_axi4_rvalid,
                         m_axi4_ruser,
                         m_axi4_rready);

  parameter  C_AXI_DATA_WIDTH = 32;
  parameter  C_AXI_ID_WIDTH = 4;
  parameter  C_AXI_USER_WIDTH = 4;

  input                             axi4_aclk;
  input                             axi4_arstn;
  output       [C_AXI_ID_WIDTH-1:0] s_axi4_rid;
  output                      [1:0] s_axi4_rresp;
  output     [C_AXI_DATA_WIDTH-1:0] s_axi4_rdata;
  output                            s_axi4_rlast;
  output             		    s_axi4_rvalid;
  output     [C_AXI_USER_WIDTH-1:0] s_axi4_ruser;
  input              		    s_axi4_rready;

  input        [C_AXI_ID_WIDTH-1:0] m_axi4_rid;
  input                       [1:0] m_axi4_rresp;
  input      [C_AXI_DATA_WIDTH-1:0] m_axi4_rdata;
  input                             m_axi4_rlast;
  input             		    m_axi4_rvalid;
  input      [C_AXI_USER_WIDTH-1:0] m_axi4_ruser;
  output              		    m_axi4_rready;

  wire        [C_AXI_DATA_WIDTH+C_AXI_ID_WIDTH+C_AXI_USER_WIDTH+3:0] data_in;
  wire        [C_AXI_DATA_WIDTH+C_AXI_ID_WIDTH+C_AXI_USER_WIDTH+3:0] data_out;

  assign data_in[1:0]                = m_axi4_rresp;
  assign data_in[2]                  = m_axi4_rlast;
  assign data_in[C_AXI_ID_WIDTH+2:3] = m_axi4_rid;
  assign data_in[C_AXI_DATA_WIDTH+C_AXI_ID_WIDTH+3:C_AXI_ID_WIDTH+3] = m_axi4_rdata;
  assign data_in[C_AXI_DATA_WIDTH+C_AXI_ID_WIDTH+C_AXI_USER_WIDTH+3:C_AXI_DATA_WIDTH+C_AXI_ID_WIDTH+4] = m_axi4_ruser;

  assign s_axi4_rresp  = data_out[1:0];
  assign s_axi4_rlast  = data_out[2];
  assign s_axi4_rid    = data_out[C_AXI_ID_WIDTH+2:3];
  assign s_axi4_rdata  = data_out[C_AXI_DATA_WIDTH+C_AXI_ID_WIDTH+3:C_AXI_ID_WIDTH+3];
  assign s_axi4_ruser  = data_out[C_AXI_DATA_WIDTH+C_AXI_ID_WIDTH+C_AXI_USER_WIDTH+3:C_AXI_DATA_WIDTH+C_AXI_ID_WIDTH+4];

  axi_buffer_rab #(.DATA_WIDTH(C_AXI_DATA_WIDTH+C_AXI_ID_WIDTH+C_AXI_USER_WIDTH+4)) u_buffer(.clk(axi4_aclk), 
                                                        .rstn(axi4_arstn), 
                                                        .valid_out(s_axi4_rvalid), 
                                                        .data_out(data_out), 
                                                        .ready_in(s_axi4_rready), 
                                                        .valid_in(m_axi4_rvalid), 
                                                        .data_in(data_in), 
                                                        .ready_out(m_axi4_rready));

endmodule


