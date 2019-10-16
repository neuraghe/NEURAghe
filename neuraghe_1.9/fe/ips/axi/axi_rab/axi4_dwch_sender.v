module axi4_dwch_sender (axi4_aclk,
                         axi4_arstn,
                         trans_accept,
                         trans_drop,
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

  input                             trans_accept;
  input                             trans_drop;

  input      [C_AXI_DATA_WIDTH-1:0] s_axi4_wdata;
  input             		        s_axi4_wvalid;
  output              		        s_axi4_wready;
  input    [C_AXI_DATA_WIDTH/8-1:0] s_axi4_wstrb;
  input                             s_axi4_wlast;
  input      [C_AXI_USER_WIDTH-1:0] s_axi4_wuser;
		     	 
  output     [C_AXI_DATA_WIDTH-1:0] m_axi4_wdata;
  output                            m_axi4_wvalid;
  input                             m_axi4_wready;
  output   [C_AXI_DATA_WIDTH/8-1:0] m_axi4_wstrb;
  output                            m_axi4_wlast;
  output     [C_AXI_USER_WIDTH-1:0] m_axi4_wuser;

  wire                              w_eot;
  reg                               waiting_wready;
  reg                               dropping_trans;

  wire                              trans_infifo;
  wire                              trans_done;
  wire                              trans_is_accept;
  wire                              trans_is_drop;
  wire                              fifo_not_full;
  wire                        [1:0] fifo_datain;
  wire                        [1:0] fifo_dataout;

  wire                              fifo_datain_valid;

  axi_buffer_rab #(.DATA_WIDTH(2)) u_transfifo(.clk(axi4_aclk), .rstn(axi4_arstn), 
                           .data_out(fifo_dataout), .valid_out(trans_infifo), .ready_in(trans_done), 
                           .valid_in(fifo_datain_valid), .data_in(fifo_datain), .ready_out(fifo_not_full));

  assign fifo_datain_valid = trans_accept | trans_drop;
  assign fifo_datain       = {trans_accept,trans_drop};

  assign trans_is_accept = trans_infifo & fifo_dataout[1];
  assign trans_is_drop   = trans_infifo & fifo_dataout[0];

  assign trans_done      = s_axi4_wvalid & s_axi4_wready & s_axi4_wlast;

  assign m_axi4_wlast  = !trans_is_accept ? 1'b0 : s_axi4_wlast;
  assign m_axi4_wdata  = !trans_is_accept ? {C_AXI_DATA_WIDTH{1'b0}} : s_axi4_wdata;
  assign m_axi4_wstrb  = !trans_is_accept ? {C_AXI_DATA_WIDTH/8{1'b0}} : s_axi4_wstrb;
  assign m_axi4_wuser  = !trans_is_accept ? {C_AXI_USER_WIDTH{1'b0}} : s_axi4_wuser;


 assign m_axi4_wvalid = s_axi4_wvalid & trans_is_accept;
 assign s_axi4_wready = (m_axi4_wready & trans_is_accept) | (trans_is_drop);

endmodule


