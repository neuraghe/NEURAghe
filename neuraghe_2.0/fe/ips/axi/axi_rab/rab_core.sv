`define log2(VALUE) ( (VALUE) == ( 1 ) ? 0 : (VALUE) < ( 2 ) ? 1 : (VALUE) < ( 4 ) ? 2 : (VALUE)< (8) ? 3:(VALUE) < ( 16 )  ? 4 : (VALUE) < ( 32 )  ? 5 : (VALUE) < ( 64 )  ? 6 : (VALUE) < ( 128 ) ? 7 : (VALUE) < ( 256 ) ? 8 : (VALUE) < ( 512 ) ? 9 : (VALUE) < ( 1024 ) ? 10 : (VALUE) < ( 2048 ) ? 11: (VALUE) < ( 4096 ) ? 12 : (VALUE) < ( 8192 ) ? 13 : (VALUE) < ( 16384 ) ? 14 : (VALUE) < ( 32768 ) ? 15 : (VALUE) < ( 65536 ) ? 16 : (VALUE) < ( 131072 ) ? 17 : (VALUE) < ( 262144 ) ? 18 : (VALUE) < ( 524288 ) ? 19 :  (VALUE) < ( 1048576 ) ? 20 : -1)

module rab_core
  #(
    parameter RAB_ENTRIES      = 16,
    parameter C_AXI_DATA_WIDTH = 32,
    parameter C_AXI_ID_WIDTH   = 8,
    parameter N_PORTS          = 3
    )
   (
    input    logic                            s_axi_aclk,
    input    logic                            s_axi_aresetn,

    input    logic                    [31:0]  s_axi_awaddr,
    input    logic                            s_axi_awvalid,
    output   logic                            s_axi_awready,

    input    logic    [C_AXI_DATA_WIDTH-1:0]  s_axi_wdata,
    input    logic  [C_AXI_DATA_WIDTH/8-1:0]  s_axi_wstrb,
    input    logic                            s_axi_wvalid,
    output   logic                            s_axi_wready,

    input    logic                    [31:0]  s_axi_araddr,
    input    logic                            s_axi_arvalid,
    output   logic                            s_axi_arready,

    input    logic                            s_axi_rready,
    output   logic    [C_AXI_DATA_WIDTH-1:0]  s_axi_rdata,
    output   logic                     [1:0]  s_axi_rresp,
    output   logic                            s_axi_rvalid,

    output   logic                     [1:0]  s_axi_bresp,
    output   logic                            s_axi_bvalid,
    input    logic                            s_axi_bready,

    output   logic    [N_PORTS-1:0]  int_miss,
    output   logic    [N_PORTS-1:0]  int_prot,
    output   logic    [N_PORTS-1:0]  int_multi,
    output   logic                   int_mhr_full, 

    input    logic    [N_PORTS-1:0]               [31:0]  port1_addr,
    input    logic    [N_PORTS-1:0] [C_AXI_ID_WIDTH-1:0]  port1_id,
    input    logic    [N_PORTS-1:0]                [7:0]  port1_len,
    input    logic    [N_PORTS-1:0]                [2:0]  port1_size,
    input    logic    [N_PORTS-1:0]                       port1_addr_valid,
    input    logic    [N_PORTS-1:0]                       port1_type,
    input    logic    [N_PORTS-1:0]                       port1_sent,
    output   logic    [N_PORTS-1:0]               [31:0]  port1_out_addr,
    output   logic    [N_PORTS-1:0]                       port1_accept,
    output   logic    [N_PORTS-1:0]                       port1_drop,

    input    logic    [N_PORTS-1:0]               [31:0]  port2_addr,
    input    logic    [N_PORTS-1:0] [C_AXI_ID_WIDTH-1:0]  port2_id,
    input    logic    [N_PORTS-1:0]                [7:0]  port2_len,
    input    logic    [N_PORTS-1:0]                [2:0]  port2_size,
    input    logic    [N_PORTS-1:0]                       port2_addr_valid,
    input    logic    [N_PORTS-1:0]                       port2_type,
    input    logic    [N_PORTS-1:0]                       port2_sent,
    output   logic    [N_PORTS-1:0]               [31:0]  port2_out_addr,
    output   logic    [N_PORTS-1:0]                       port2_accept,
    output   logic    [N_PORTS-1:0]                       port2_drop
    );
   
   localparam  REG_ENTRIES = 4*RAB_ENTRIES*N_PORTS + 4;

   logic [N_PORTS-1:0]                  [15:0] p1_burst_size;
   logic [N_PORTS-1:0]                  [15:0] p2_burst_size;

   logic [N_PORTS-1:0]                  [31:0] p1_max_addr;
   logic [N_PORTS-1:0]                  [31:0] p2_max_addr;
   
   logic [N_PORTS-1:0]                         int_rw;   
   logic [N_PORTS-1:0]                  [31:0] int_addr_min;
   logic [N_PORTS-1:0]                  [31:0] int_addr_max;
   logic [N_PORTS-1:0]    [C_AXI_ID_WIDTH-1:0] int_id; 
   
   logic [N_PORTS-1:0]                         no_hit; //   mi interessa solo sapere se c'e` stato hit,
   logic [N_PORTS-1:0]                         no_prot;//    vedi lunghezze diverse con hit e prot 

   logic [N_PORTS-1:0]       [RAB_ENTRIES-1:0] hit;
   logic [N_PORTS-1:0]       [RAB_ENTRIES-1:0] prot;
   
   logic [N_PORTS-1:0]                     [31:0] out_addr;
   logic [N_PORTS-1:0]                     [31:0] out_addr_reg; 
   logic [REG_ENTRIES-1:0]                 [31:0] int_cfg_regs; 
   logic [N_PORTS-1:0] [4*RAB_ENTRIES-1:0] [31:0] int_cfg_regs_slices; 

   logic [N_PORTS-1:0]                            select;
   reg [N_PORTS-1:0]                              curr_priority;

   reg [N_PORTS-1:0]                              multiple_hit;

   genvar                                         z;
   
   localparam  REGS_SLICE = 4 * 32; // stesso numero di reg da considerare come offset iniziale (top level) per la config
   localparam  REGS_CH    = REGS_SLICE * RAB_ENTRIES; // reg per ogni porta
   localparam  PORT_ID_WIDTH = (N_PORTS < 3) ? 1 : `log2(N_PORTS-1);
   
   //-----------------------------------------------------------------------------------
   
   always_comb
     begin
        var integer idx;
        for (idx=0; idx<N_PORTS; idx++) begin

           // select = 0 -> port1 active
           // select = 1 -> port2 active
           select[idx] = (curr_priority[idx] & port1_addr_valid[idx]) | ~port2_addr_valid[idx];
           
           p1_burst_size[idx] = (port1_len[idx] + 1) << port1_size[idx];
           p2_burst_size[idx] = (port2_len[idx] + 1) << port2_size[idx];

           p1_max_addr[idx] = port1_addr[idx] + p1_burst_size[idx] - 1;
           p2_max_addr[idx] = port2_addr[idx] + p2_burst_size[idx] - 1;

           int_addr_min[idx] = select[idx] ? port1_addr[idx]  : port2_addr[idx];
           int_addr_max[idx] = select[idx] ? p1_max_addr[idx] : p2_max_addr[idx];
           int_rw[idx]       = select[idx] ? port1_type[idx]  : port2_type[idx];
           int_id[idx]       = select[idx] ? port1_id[idx]    : port2_id[idx];
           
           no_hit [idx]      = ~| hit [idx];
           no_prot[idx]      = ~| prot[idx];

           port1_out_addr[idx] = out_addr_reg[idx];
           port2_out_addr[idx] = out_addr_reg[idx];
        end
     end   

   always_comb
     begin
        var integer idx_port, idx_slice;
        for ( idx_port = 0; idx_port < N_PORTS; idx_port++ ) begin
           for ( idx_slice = 0; idx_slice < 4*RAB_ENTRIES; idx_slice++ ) begin
              int_cfg_regs_slices[idx_port][idx_slice] =  int_cfg_regs[4+4*RAB_ENTRIES*idx_port+idx_slice]; 
           end
        end   
     end
   
   always @(posedge s_axi_aclk or negedge s_axi_aresetn)
     begin
        var integer idx;
        if (s_axi_aresetn == 1'b0)
          curr_priority = 'h0;
        else
          begin
             for (idx=0; idx<N_PORTS; idx++) begin
                if (port1_accept[idx] || port1_drop[idx])
                  curr_priority[idx] = 1'b1;
                else if (port2_accept[idx] || port2_drop[idx])
                  curr_priority[idx] = 1'b0;
             end
          end
     end
   
   //--------------------  REG_TOP  ------------------------------- 

   // find port that misses
   logic [PORT_ID_WIDTH-1:0] PortIdx_D; // index of the first missing port
   var integer               idx_miss;
   always_comb
     begin
        PortIdx_D = 'b0; 
        for (idx_miss = 0; idx_miss < N_PORTS; idx_miss++)
          begin
             if (int_miss[idx_miss] == 1'b1)
               begin
                  PortIdx_D = idx_miss;
                  break;
               end
          end
     end // always_comb begin
   
   axi_regs_top_rab
     #(
       .REG_ENTRIES(REG_ENTRIES),
       .MISS_ID_WIDTH(PORT_ID_WIDTH+C_AXI_ID_WIDTH)
       ) 
   u_axi_regs
     (
      .s_axi_aclk(s_axi_aclk),
      .s_axi_aresetn(s_axi_aresetn),
      .s_axi_awaddr(s_axi_awaddr),
      .s_axi_awvalid(s_axi_awvalid),
      .s_axi_wdata(s_axi_wdata),
      .s_axi_wstrb(s_axi_wstrb),
      .s_axi_wvalid(s_axi_wvalid),
      .s_axi_bready(s_axi_bready),
      .s_axi_araddr(s_axi_araddr),
      .s_axi_arvalid(s_axi_arvalid),
      .s_axi_rready(s_axi_rready),
      .s_axi_arready(s_axi_arready),
      .s_axi_rdata(s_axi_rdata),
      .s_axi_rresp(s_axi_rresp),
      .s_axi_rvalid(s_axi_rvalid),
      .s_axi_wready(s_axi_wready),
      .s_axi_bresp(s_axi_bresp),
      .s_axi_bvalid(s_axi_bvalid),
      .s_axi_awready(s_axi_awready),
      .cfg_regs(int_cfg_regs),
      .MissAddr_DI(int_addr_min[PortIdx_D]),
      .MissId_DI({PortIdx_D,int_id[PortIdx_D]}),
      .Miss_SI(int_miss[PortIdx_D]),
      .MhFifoFull_SO(int_mhr_full)
      );

   //--------------------  SLICE_TOP ------------------------------- 

   generate
      for (z = 0; z < N_PORTS; z++)
        begin
           slice_top 
             #(
               .RAB_ENTRIES(RAB_ENTRIES)
               )
           u_slice_top
             (
              .int_cfg_regs(int_cfg_regs_slices[z]),
              .int_rw(int_rw[z]),
              .int_addr_min(int_addr_min[z]),
              .int_addr_max(int_addr_max[z]),
              .out_addr(out_addr[z]),
              .multiple_hit(multiple_hit[z]),      
              .prot(prot[z]),
              .hit(hit[z])
              );
        end
   endgenerate
   
   //------------------   FSM   --------------------------------
   
   generate
      for (z = 0; z < N_PORTS; z++)
        begin
           fsm u_fsm
             (
              .s_axi_aclk (s_axi_aclk),
              .s_axi_aresetn (s_axi_aresetn),
              .port1_addr_valid (port1_addr_valid[z]),
              .port2_addr_valid (port2_addr_valid[z]),
              .port1_sent (port1_sent[z]),
              .port2_sent (port2_sent[z]),
              .select (select[z]),        
              .no_hit (no_hit[z]),   
              .multiple_hit (multiple_hit[z]),
              .no_prot (no_prot[z]),
              .out_addr (out_addr[z]),   
              .port1_accept (port1_accept[z]),
              .port1_drop  (port1_drop[z]),  
              .port2_accept (port2_accept[z]), 
              .port2_drop (port2_drop[z]),  
              .out_addr_reg  (out_addr_reg[z]),
              .int_miss (int_miss[z]),    
              .int_multi (int_multi[z]),  
              .int_prot (int_prot[z])
              );
        end
   endgenerate

endmodule



