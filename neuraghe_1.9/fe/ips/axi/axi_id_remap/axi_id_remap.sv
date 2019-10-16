module axi_id_remap
#(

    parameter  AXI_ADDRESS_W  = 32,
    parameter  AXI_DATA_W     = 64,
    parameter  AXI_NUMBYTES   = AXI_DATA_W/8,
    parameter  AXI_USER_W     = 6,

    parameter  AXI_ID_IN      = 8, 
    parameter  AXI_ID_OUT     = 4,
    parameter  ID_SLOT        = 16
)
(
  input logic                                                clk,
  input logic                                                rst_n,
  // ---------------------------------------------------------------
  // AXI TARG Port Declarations -----------------------------------------
  // ---------------------------------------------------------------
  //AXI write address bus -------------- // USED// -------------- 
  input  logic [AXI_ID_IN-1:0]                               targ_awid_i,        //
  input  logic [AXI_ADDRESS_W-1:0]                           targ_awaddr_i,        //
  input  logic [ 7:0]                                        targ_awlen_i,           //burst length is 1 + (0 - 15)
  input  logic [ 2:0]                                        targ_awsize_i,          //size of each transfer in burst
  input  logic [ 1:0]                                        targ_awburst_i,         //for bursts>1, accept only incr burst=01
  input  logic                                               targ_awlock_i,          //only normal access supported axs_awlock=00
  input  logic [ 3:0]                                        targ_awcache_i,         //
  input  logic [ 2:0]                                        targ_awprot_i,        //
  input  logic [ 3:0]                                        targ_awregion_i,        //
  input  logic [ AXI_USER_W-1:0]                             targ_awuser_i,        //
  input  logic [ 3:0]                                        targ_awqos_i,        //  
  input  logic                                               targ_awvalid_i,         //master addr valid
  output logic                                               targ_awready_o,         //slave ready to accept
  // ---------------------------------------------------------------

  //AXI write data bus -------------- // USED// -------------- 
  input  logic [AXI_DATA_W-1:0]                              targ_wdata_i,
  input  logic [AXI_NUMBYTES-1:0]                            targ_wstrb_i,   //1 strobe per byte
  input  logic                                               targ_wlast_i,   //last transfer in burst
  input  logic [AXI_USER_W-1:0]                              targ_wuser_i,   // User sideband signal
  input  logic                                               targ_wvalid_i,  //master data valid
  output logic                                               targ_wready_o,  //slave ready to accept
  // ---------------------------------------------------------------

  //AXI write response bus -------------- // USED// -------------- 
  output  logic   [AXI_ID_IN-1:0]                            targ_bid_o,
  output  logic   [ 1:0]                                     targ_bresp_o,
  output  logic                                              targ_bvalid_o,
  output  logic   [AXI_USER_W-1:0]                           targ_buser_o,   // User sideband signal
  input   logic                                              targ_bready_i,
  // ---------------------------------------------------------------

  //AXI read address bus -------------------------------------------
  input  logic [AXI_ID_IN-1:0]                               targ_arid_i,
  input  logic [AXI_ADDRESS_W-1:0]                           targ_araddr_i,
  input  logic [ 7:0]                                        targ_arlen_i,   //burst length - 1 to 16
  input  logic [ 2:0]                                        targ_arsize_i,  //size of each transfer in burst
  input  logic [ 1:0]                                        targ_arburst_i, //for bursts>1, accept only incr burst=01
  input  logic                                               targ_arlock_i,  //only normal access supported axs_awlock=00
  input  logic [ 3:0]                                        targ_arcache_i, 
  input  logic [ 2:0]                                        targ_arprot_i,
  input  logic [ 3:0]                                        targ_arregion_i,        //
  input  logic [ AXI_USER_W-1:0]                             targ_aruser_i,        //
  input  logic [ 3:0]                                        targ_arqos_i,        //  
  input  logic                                               targ_arvalid_i, //master addr valid
  output logic                                               targ_arready_o, //slave ready to accept
  // ---------------------------------------------------------------
  
  
  //AXI read data bus ----------------------------------------------
  output logic [AXI_ID_IN-1:0]                               targ_rid_o,
  output logic [AXI_DATA_W-1:0]                              targ_rdata_o,
  output logic [ 1:0]                                        targ_rresp_o,
  output logic                                               targ_rlast_o,   //last transfer in burst
  output logic [AXI_USER_W-1:0]                              targ_ruser_o,   //last transfer in burst
  output logic                                               targ_rvalid_o,  //slave data valid
  input  logic                                               targ_rready_i,   //master ready to accept
  // ---------------------------------------------------------------
  
  
  
  
  
  // ---------------------------------------------------------------
  // AXI INIT Port Declarations -----------------------------------------
  // ---------------------------------------------------------------
  //AXI write address bus -------------- // // -------------- 
  output logic [AXI_ID_OUT-1:0]                              init_awid_o,        //
  output logic [AXI_ADDRESS_W-1:0]                           init_awaddr_o,        //
  output logic [ 7:0]                                        init_awlen_o,           //burst length is 1 + (0 - 15)
  output logic [ 2:0]                                        init_awsize_o,          //size of each transfer in burst
  output logic [ 1:0]                                        init_awburst_o,         //for bursts>1, accept only incr burst=01
  output logic                                               init_awlock_o,          //only normal access supported axs_awlock=00
  output logic [ 3:0]                                        init_awcache_o,         //
  output logic [ 2:0]                                        init_awprot_o,        //
  output logic [ 3:0]                                        init_awregion_o,        //
  output logic [ AXI_USER_W-1:0]                             init_awuser_o,        //
  output logic [ 3:0]                                        init_awqos_o,        //  
  output logic                                               init_awvalid_o,         //master addr valid
  input  logic                                               init_awready_i,         //slave ready to accept
  // ---------------------------------------------------------------
  
  //AXI write data bus -------------- // // -------------- 
  output logic  [AXI_DATA_W-1:0]                        init_wdata_o,
  output logic  [AXI_NUMBYTES-1:0]                        init_wstrb_o,   //1 strobe per byte
  output logic                                                 init_wlast_o,   //last transfer in burst
  output logic  [ AXI_USER_W-1:0]                        init_wuser_o,   //user sideband signals
  output logic                                                 init_wvalid_o,  //master data valid
  input  logic                                                 init_wready_i,  //slave ready to accept
  // ---------------------------------------------------------------
  
  //AXI BACKWARD write response bus -------------- // // -------------- 
  input  logic  [AXI_ID_OUT-1:0]                        init_bid_i,
  input  logic  [ 1:0]                                        init_bresp_i,
  input  logic  [ AXI_USER_W-1:0]                        init_buser_i,
  input  logic                                                 init_bvalid_i,
  output logic                                                 init_bready_o,
  // ---------------------------------------------------------------
  
  
  
  //AXI read address bus -------------------------------------------
  output  logic [AXI_ID_OUT-1:0]                        init_arid_o,
  output  logic [AXI_ADDRESS_W-1:0]                        init_araddr_o,
  output  logic [ 7:0]                                        init_arlen_o,   //burst length - 1 to 16
  output  logic [ 2:0]                                        init_arsize_o,  //size of each transfer in burst
  output  logic [ 1:0]                                        init_arburst_o, //for bursts>1, accept only incr burst=01
  output  logic                                         init_arlock_o,  //only normal access supported axs_awlock=00
  output  logic [ 3:0]                                        init_arcache_o, 
  output  logic [ 2:0]                                        init_arprot_o,
  output  logic [ 3:0]                                        init_arregion_o,        //
  output  logic [ AXI_USER_W-1:0]                        init_aruser_o,        //
  output  logic [ 3:0]                                        init_arqos_o,        //  
  output  logic                                         init_arvalid_o, //master addr valid
  input   logic                                         init_arready_i, //slave ready to accept
  // ---------------------------------------------------------------
  
  
  //AXI BACKWARD read data bus ----------------------------------------------
  input  logic [AXI_ID_OUT-1:0]                                init_rid_i,
  input  logic [AXI_DATA_W-1:0]                                init_rdata_i,
  input  logic [ 1:0]                                       init_rresp_i,
  input  logic                                              init_rlast_i,   //last transfer in burst
  input  logic [ AXI_USER_W-1:0]                        init_ruser_i,
  input  logic                                             init_rvalid_i,  //slave data valid
  output logic                                            init_rready_o   //master ready to accept
  // ---------------------------------------------------------------
);

  logic full_ID_AW_BW;
  logic empty_ID_AW_BW;
  logic full_ID_AR_BR;
  logic empty_ID_AR_BR;

  // Address Write channel
  assign init_awaddr_o       = targ_awaddr_i;
  assign init_awlen_o        = targ_awlen_i;
  assign init_awsize_o       = targ_awsize_i;
  assign init_awburst_o      = targ_awburst_i;
  assign init_awlock_o       = targ_awlock_i;
  assign init_awcache_o      = targ_awcache_i;
  assign init_awprot_o       = targ_awprot_i;
  assign init_awregion_o     = targ_awregion_i;
  assign init_awuser_o       = targ_awuser_i;
  assign init_awqos_o        = targ_awqos_i;
        


  // Address Read channel
  assign init_araddr_o      = targ_araddr_i;
  assign init_arlen_o       = targ_arlen_i;
  assign init_arsize_o      = targ_arsize_i;
  assign init_arburst_o     = targ_arburst_i;
  assign init_arlock_o      = targ_arlock_i;
  assign init_arcache_o     = targ_arcache_i;
  assign init_arprot_o      = targ_arprot_i;
  assign init_arregion_o    = targ_arregion_i;
  assign init_aruser_o      = targ_aruser_i;
  assign init_arqos_o       = targ_arqos_i;

  
  
  
  // Data Write Channel
  assign init_wdata_o              =  targ_wdata_i;
  assign init_wstrb_o              =  targ_wstrb_i;
  assign init_wlast_o              =  targ_wlast_i;
  assign init_wuser_o              =  targ_wuser_i;
  assign init_wvalid_o             =  targ_wvalid_i;
  assign targ_wready_o             =  init_wready_i; 
  
  
  
  
  // Backward Read Channel 
  assign targ_rdata_o = init_rdata_i;
  assign targ_rresp_o = init_rresp_i;
  assign targ_rlast_o = init_rlast_i;
  assign targ_ruser_o = init_ruser_i;

  
  
  
  // Backward Write Channel 
  assign targ_bresp_o  =  init_bresp_i;
  assign targ_buser_o  =  init_buser_i;

  
  



assign targ_awready_o = init_awready_i & ~full_ID_AW_BW;
assign init_awvalid_o = targ_awvalid_i & ~full_ID_AW_BW;
assign targ_bvalid_o  = init_bvalid_i & ~empty_ID_AW_BW;
assign init_bready_o  = targ_bready_i & ~empty_ID_AW_BW;


assign targ_arready_o = init_arready_i & ~full_ID_AR_BR;
assign init_arvalid_o = targ_arvalid_i & ~full_ID_AR_BR;
assign targ_rvalid_o  = init_rvalid_i & ~empty_ID_AR_BR;
assign init_rready_o  = targ_rready_i & ~empty_ID_AR_BR;


generate
    case(ID_SLOT)
    4:
    begin
        ID_Gen_4
        #(
          .ID_WIDTH_IN(AXI_ID_IN),
          .ID_WIDTH_OUT(AXI_ID_OUT)
        )
        AW_BW_REMAP
        (

          .clk(clk),
          .rst_n(rst_n),

          .incr_i( targ_awvalid_i & ~full_ID_AW_BW & init_awready_i  ),
          .full_o(full_ID_AW_BW),
          .ID_i(targ_awid_i),
          .ID_o(init_awid_o),

          .release_ID_i(init_bvalid_i & targ_bready_i & ~empty_ID_AW_BW),
          .BID_i(init_bid_i),
          .BID_o(targ_bid_o),
          .empty_o(empty_ID_AW_BW)
        );

        ID_Gen_4
        #(
          .ID_WIDTH_IN(AXI_ID_IN),
          .ID_WIDTH_OUT(AXI_ID_OUT)
        )
        AR_BR_REMAP
        (

          .clk(clk),
          .rst_n(rst_n),

          .incr_i( targ_arvalid_i & ~full_ID_AR_BR & init_arready_i  ),
          .full_o(full_ID_AR_BR),
          .ID_i(targ_arid_i),
          .ID_o(init_arid_o),

          .release_ID_i(init_rvalid_i & targ_rready_i & init_rlast_i & ~empty_ID_AR_BR),
          .BID_i(init_rid_i),
          .BID_o(targ_rid_o),
          .empty_o(empty_ID_AR_BR)
        );
    end

    64:
    begin
        ID_Gen_64
        #(
          .ID_WIDTH_IN(AXI_ID_IN),
          .ID_WIDTH_OUT(AXI_ID_OUT)
        )
        AW_BW_REMAP
        (

          .clk(clk),
          .rst_n(rst_n),

          .incr_i( targ_awvalid_i & ~full_ID_AW_BW & init_awready_i  ),
          .full_o(full_ID_AW_BW),
          .ID_i(targ_awid_i),
          .ID_o(init_awid_o),

          .release_ID_i(init_bvalid_i & targ_bready_i & ~empty_ID_AW_BW),
          .BID_i(init_bid_i),
          .BID_o(targ_bid_o),
          .empty_o(empty_ID_AW_BW)
        );

        ID_Gen_64
        #(
          .ID_WIDTH_IN(AXI_ID_IN),
          .ID_WIDTH_OUT(AXI_ID_OUT)
        )
        AR_BR_REMAP
        (

          .clk(clk),
          .rst_n(rst_n),

          .incr_i( targ_arvalid_i & ~full_ID_AR_BR & init_arready_i  ),
          .full_o(full_ID_AR_BR),
          .ID_i(targ_arid_i),
          .ID_o(init_arid_o),

          .release_ID_i(init_rvalid_i & targ_rready_i & init_rlast_i & ~empty_ID_AR_BR),
          .BID_i(init_rid_i),
          .BID_o(targ_rid_o),
          .empty_o(empty_ID_AR_BR)
        );
    end
      
    default:
    begin
        ID_Gen_16
        #(
          .ID_WIDTH_IN(AXI_ID_IN),
          .ID_WIDTH_OUT(AXI_ID_OUT)
        )
        AW_BW_REMAP
        (

          .clk(clk),
          .rst_n(rst_n),
          
          .incr_i( targ_awvalid_i & ~full_ID_AW_BW & init_awready_i  ),
          .full_o(full_ID_AW_BW),
          .ID_i(targ_awid_i),
          .ID_o(init_awid_o),
          
          .release_ID_i(init_bvalid_i & targ_bready_i & ~empty_ID_AW_BW),
          .BID_i(init_bid_i),
          .BID_o(targ_bid_o),
          .empty_o(empty_ID_AW_BW)
        );
        
        ID_Gen_16
        #(
          .ID_WIDTH_IN(AXI_ID_IN),
          .ID_WIDTH_OUT(AXI_ID_OUT)
        )
        AR_BR_REMAP
        (

          .clk(clk),
          .rst_n(rst_n),
          
          .incr_i( targ_arvalid_i & ~full_ID_AR_BR & init_arready_i  ),
          .full_o(full_ID_AR_BR),
          .ID_i(targ_arid_i),
          .ID_o(init_arid_o),
          
          .release_ID_i(init_rvalid_i & targ_rready_i & init_rlast_i & ~empty_ID_AR_BR),
          .BID_i(init_rid_i),
          .BID_o(targ_rid_o),
          .empty_o(empty_ID_AR_BR)
        );
    end
    endcase
endgenerate

endmodule