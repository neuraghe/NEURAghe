module axi4_dwch_buffer (axi4_aclk,
                         axi4_arstn,
                         s_axi4_wdata,
                         s_axi4_wvalid,
                         s_axi4_wready,
                         s_axi4_wstrb,
                         s_axi4_wlast,
                         s_axi4_wuser,
                         m_axi4_wdata,
                         m_axi4_wvalid,
                         m_axi4_wready,
                         m_axi4_wstrb,
                         m_axi4_wlast,
                         m_axi4_wuser);

  parameter  C_AXI_DATA_WIDTH = 32;
  parameter  C_AXI_USER_WIDTH = 2;

  input                             axi4_aclk;
  input                             axi4_arstn;
  input      [C_AXI_DATA_WIDTH-1:0] s_axi4_wdata;
  input             		    s_axi4_wvalid;
  output              		    s_axi4_wready;
  input    [C_AXI_DATA_WIDTH/8-1:0] s_axi4_wstrb;
  input             		    s_axi4_wlast;
  input      [C_AXI_USER_WIDTH-1:0] s_axi4_wuser;
		     	 
  output     [C_AXI_DATA_WIDTH-1:0] m_axi4_wdata;
  output             		    m_axi4_wvalid;
  input              		    m_axi4_wready;
  output   [C_AXI_DATA_WIDTH/8-1:0] m_axi4_wstrb;
  output             		    m_axi4_wlast;
  output     [C_AXI_USER_WIDTH-1:0] m_axi4_wuser;

  wire        [C_AXI_DATA_WIDTH+C_AXI_USER_WIDTH+C_AXI_DATA_WIDTH/8:0] data_in;
  wire        [C_AXI_DATA_WIDTH+C_AXI_USER_WIDTH+C_AXI_DATA_WIDTH/8:0] data_out;

  assign data_in[0]                                                                                          = s_axi4_wlast;
  assign data_in[C_AXI_DATA_WIDTH:1]                                                                         = s_axi4_wdata;
  assign data_in[C_AXI_DATA_WIDTH+C_AXI_DATA_WIDTH/8:C_AXI_DATA_WIDTH+1]                                     = s_axi4_wstrb;
  assign data_in[C_AXI_DATA_WIDTH+C_AXI_USER_WIDTH+C_AXI_DATA_WIDTH/8:C_AXI_DATA_WIDTH+C_AXI_DATA_WIDTH/8+1] = s_axi4_wuser;

  assign m_axi4_wlast  = data_out[0];
  assign m_axi4_wdata  = data_out[C_AXI_DATA_WIDTH:1];
  assign m_axi4_wstrb  = data_out[C_AXI_DATA_WIDTH+C_AXI_DATA_WIDTH/8:C_AXI_DATA_WIDTH+1];
  assign m_axi4_wuser  = data_out[C_AXI_DATA_WIDTH+C_AXI_USER_WIDTH+C_AXI_DATA_WIDTH/8:C_AXI_DATA_WIDTH+C_AXI_DATA_WIDTH/8+1];

  axi_buffer_rab #(.DATA_WIDTH(C_AXI_DATA_WIDTH+C_AXI_USER_WIDTH+C_AXI_DATA_WIDTH/8+1)) u_buffer(.clk(axi4_aclk), 
                                                                            .rstn(axi4_arstn), 
                                                                            .valid_out(m_axi4_wvalid), 
                                                                            .data_out(data_out), 
                                                                            .ready_in(m_axi4_wready), 
                                                                            .valid_in(s_axi4_wvalid), 
                                                                            .data_in(data_in), 
                                                                            .ready_out(s_axi4_wready));

endmodule


