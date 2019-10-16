module axi4_rrch_sender (axi4_aclk,
                         axi4_arstn,
                         trans_id,
                         trans_drop,
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

  input        [C_AXI_ID_WIDTH-1:0] trans_id;
  input                             trans_drop;

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

  wire                              trans_infifo;
  wire                              trans_done;
  wire                              trans_is_accept;
  wire                              trans_is_drop;
  wire                              fifo_not_full;
  wire         [C_AXI_ID_WIDTH-1:0] id_to_drop;

  reg                               dropping;

  axi_buffer_rab #(.DATA_WIDTH(C_AXI_ID_WIDTH)) u_transfifo(.clk(axi4_aclk), .rstn(axi4_arstn), 
                           .data_out(id_to_drop), .valid_out(trans_infifo), .ready_in(trans_done), 
                           .valid_in(trans_drop), .data_in(trans_id), .ready_out(fifo_not_full));


  assign trans_done =  dropping && s_axi4_rready;

  always @ (posedge axi4_aclk or negedge axi4_arstn)
  begin 
    if (axi4_arstn == 1'b0) begin
      dropping <= 1'b0;
    end else begin
      if (trans_infifo && ~dropping && ~m_axi4_rvalid)
        dropping <= 1'b1;
      else if (trans_done)
        dropping <= 1'b0;
    end
  end

  assign s_axi4_rdata  = m_axi4_rdata;
  assign s_axi4_rlast  = dropping ? 1'b1 : m_axi4_rlast;
  assign s_axi4_ruser  = dropping ? {C_AXI_USER_WIDTH{1'b0}} : m_axi4_ruser;

  assign s_axi4_rid    = dropping ? id_to_drop : m_axi4_rid;
  assign s_axi4_rresp  = dropping ? 2'b10 : m_axi4_rresp;

 assign s_axi4_rvalid = dropping | m_axi4_rvalid;
 assign m_axi4_rready = ~dropping & s_axi4_rready;

endmodule


