`define log2(VALUE) ( (VALUE) == ( 1 ) ? 0 : (VALUE) < ( 2 ) ? 1 : (VALUE) < ( 4 ) ? 2 : (VALUE)< (8) ? 3:(VALUE) < ( 16 )  ? 4 : (VALUE) < ( 32 )  ? 5 : (VALUE) < ( 64 )  ? 6 : (VALUE) < ( 128 ) ? 7 : (VALUE) < ( 256 ) ? 8 : (VALUE) < ( 512 ) ? 9 : (VALUE) < ( 1024 ) ? 10 : (VALUE) < ( 2048 ) ? 11: (VALUE) < ( 4096 ) ? 12 : (VALUE) < ( 8192 ) ? 13 : (VALUE) < ( 16384 ) ? 14 : (VALUE) < ( 32768 ) ? 15 : (VALUE) < ( 65536 ) ? 16 : (VALUE) < ( 131072 ) ? 17 : (VALUE) < ( 262144 ) ? 18 : (VALUE) < ( 524288 ) ? 19 :  (VALUE) < ( 1048576 ) ? 20 : -1)

module axi_regs_top_rab
  #( 
     parameter REG_ENTRIES         = 196,
     parameter C_AXICFG_DATA_WIDTH = 32,
     parameter AXI_ADDR_WIDTH      = 32, // needs to be equal to C_AXICFG_DATA_WIDTH
     parameter MHR_WIDTH           = 20, // needs to match FIFO width
     parameter MISS_ID_WIDTH       = 10  // <= FIFO_WIDTH
     )
   (
    // AXI Lite interface
    input   logic                                  s_axi_aclk,
    input   logic                                  s_axi_aresetn,
    input   logic [AXI_ADDR_WIDTH-1:0]             s_axi_awaddr,
    input   logic                                  s_axi_awvalid,
    output  logic                                  s_axi_awready,
    input   logic [C_AXICFG_DATA_WIDTH/8-1:0][7:0] s_axi_wdata,
    input   logic [C_AXICFG_DATA_WIDTH/8-1:0]      s_axi_wstrb,
    input   logic                                  s_axi_wvalid,
    output  logic                                  s_axi_wready,
    output  logic [1:0]                            s_axi_bresp,
    output  logic                                  s_axi_bvalid,
    input   logic                                  s_axi_bready,
    input   logic [AXI_ADDR_WIDTH-1:0]             s_axi_araddr,
    input   logic                                  s_axi_arvalid,
    output  logic                                  s_axi_arready,
    output  logic [C_AXICFG_DATA_WIDTH-1:0]        s_axi_rdata,
    output  logic [1:0]                            s_axi_rresp,
    output  logic                                  s_axi_rvalid,
    input   logic                                  s_axi_rready,
    
    // Slice configuration
    output  logic [REG_ENTRIES-1:0][AXI_ADDR_WIDTH-1:0] cfg_regs,
    
    // Miss handling
    input   logic [AXI_ADDR_WIDTH-1:0]             MissAddr_DI,
    input   logic [MISS_ID_WIDTH-1:0]              MissId_DI,
    input   logic                                  Miss_SI,
    output  logic                                  MhFifoFull_SO    
    );

   localparam ADDR_REG_MSB = `log2(REG_ENTRIES-1)+2-1;
   
   logic                                  awaddr_done_reg;
   logic                                  awaddr_done_reg_dly;
   logic                                  wdata_done_reg;
   logic                                  wdata_done_reg_dly;
   logic                                  wresp_done_reg;
   logic                                  wresp_running_reg;

   logic                                  araddr_done_reg;
   logic                                  rresp_done_reg;
   logic                                  rresp_running_reg;
   
   logic                                  awready;
   logic                                  wready;
   logic                                  bvalid;
   
   logic                                  arready;
   logic                                  rvalid;
   
   logic [AXI_ADDR_WIDTH-1:0]             waddr_reg;
   logic [C_AXICFG_DATA_WIDTH/8-1:0][7:0] wdata_reg;
   
   logic [AXI_ADDR_WIDTH/8-1:0]           wstrb_reg;

   logic [AXI_ADDR_WIDTH-1:0]             raddr_reg;
   logic [C_AXICFG_DATA_WIDTH-1:0]        data_out_reg;

   logic                                  write_en;

   logic [3:0][7:0]                       CONFIGURATION_REGISTERS [REG_ENTRIES];
   
   logic                                  wdata_done_rise;
   logic                                  awaddr_done_rise;

   genvar j;
         
   //********************************************************
   //****************** AXI Lite Interface ******************
   //********************************************************
   
   assign write_en = (wdata_done_rise & awaddr_done_reg) | (awaddr_done_rise & wdata_done_reg);
   assign wdata_done_rise = wdata_done_reg & ~wdata_done_reg_dly;
   assign awaddr_done_rise = awaddr_done_reg & ~awaddr_done_reg_dly;
   
   always @(posedge s_axi_aclk or negedge s_axi_aresetn)
     begin
        if (!s_axi_aresetn)
          begin
             wdata_done_reg_dly  <= 0;
             awaddr_done_reg_dly <= 0;
          end
        else
          begin
             wdata_done_reg_dly  <= wdata_done_reg;
             awaddr_done_reg_dly <= awaddr_done_reg;
          end
     end
   
   // WRITE ADDRESS CHANNEL logic
   always @(posedge s_axi_aclk or negedge s_axi_aresetn)
     begin
        if (!s_axi_aresetn)
          begin
             awaddr_done_reg <= 0;
             waddr_reg       <= 0;
             awready         <= 1;
          end
        else
          begin
             if (awready && s_axi_awvalid)
               begin
                  awready   <= 0;
                  awaddr_done_reg <= 1;
                  waddr_reg <= s_axi_awaddr;
               end
             else if (awaddr_done_reg && wresp_done_reg)
               begin
                  awready   <= 1;
                  awaddr_done_reg <= 0;
               end
          end
     end

   // WRITE DATA CHANNEL logic
   always @(posedge s_axi_aclk or negedge s_axi_aresetn)
     begin
        if (!s_axi_aresetn)
          begin
             wdata_done_reg <= 0;
             wready         <= 1;
             wdata_reg      <= '0;
             wstrb_reg      <= 0;
          end
        else
          begin
             if (wready && s_axi_wvalid)
               begin
                  wready   <= 0;
                  wdata_done_reg <= 1;
                  wdata_reg <= s_axi_wdata;
                  wstrb_reg <= s_axi_wstrb;
               end
             else if (wdata_done_reg && wresp_done_reg)
               begin
                  wready   <= 1;
                  wdata_done_reg <= 0;
               end
          end
     end

   // WRITE RESPONSE CHANNEL logic
   always @(posedge s_axi_aclk or negedge s_axi_aresetn)
     begin
        if (!s_axi_aresetn)
          begin
             bvalid            <= 0;
             wresp_done_reg    <= 0;
             wresp_running_reg <= 0;
          end
        else
          begin
             if (awaddr_done_reg && wdata_done_reg && !wresp_done_reg)
               begin
                  if (!wresp_running_reg)
                    begin
                       bvalid         <= 1;
                       wresp_running_reg <= 1;
                    end
                  else if (s_axi_bready)
                    begin
                       bvalid         <= 0;
                       wresp_done_reg <= 1;
                       wresp_running_reg <= 0;
                    end
               end
             else
               begin
                  bvalid         <= 0;
                  wresp_done_reg <= 0;
                  wresp_running_reg <= 0;
               end
          end
     end

   // READ ADDRESS CHANNEL logic
   always @(posedge s_axi_aclk or negedge s_axi_aresetn)
     begin
        if (!s_axi_aresetn)
          begin
             araddr_done_reg <= 0;
             arready         <= 1;
             raddr_reg       <= 0;
          end
        else
          begin
             if (arready && s_axi_arvalid)
               begin
                  arready   <= 0;
                  araddr_done_reg <= 1;
                  raddr_reg <= s_axi_araddr;
               end
             else if (araddr_done_reg && rresp_done_reg)
               begin
                  arready   <= 1;
                  araddr_done_reg <= 0;
               end
          end
     end

   // READ RESPONSE CHANNEL logic
   always @(posedge s_axi_aclk or negedge s_axi_aresetn)
     begin
        if (!s_axi_aresetn)
          begin
             rresp_done_reg    <= 0;
             rvalid            <= 0;
             rresp_running_reg <= 0;
          end
        else
          begin
             if (araddr_done_reg && !rresp_done_reg)
               begin
                  if (!rresp_running_reg)
                    begin
                       rvalid            <= 1;
                       rresp_running_reg <= 1;
                    end
                  else if (s_axi_rready)
                    begin
                       rvalid            <= 0;
                       rresp_done_reg    <= 1;
                       rresp_running_reg <= 0;
                    end
               end
             else
               begin
                  rvalid         <= 0;
                  rresp_done_reg <= 0;
                  rresp_running_reg <= 0;
               end
          end
     end
   
   // Configuration registers
   always @( posedge s_axi_aclk or negedge s_axi_aresetn )   
     begin
        var integer idx_regs, idx_byte;
        if ( s_axi_aresetn == 1'b0 )
          begin
             for (idx_regs = 0; idx_regs < REG_ENTRIES; idx_regs++)
               begin
                  CONFIGURATION_REGISTERS[idx_regs] <= '0;
               end
          end
        else if (write_en)
          begin
             for ( idx_byte = 0; idx_byte < C_AXICFG_DATA_WIDTH/8; idx_byte++ )
               if ( wstrb_reg[idx_byte])
                 CONFIGURATION_REGISTERS[waddr_reg[ADDR_REG_MSB:2]][idx_byte] <= wdata_reg[idx_byte];
          end
     end
   
   assign data_out_reg = CONFIGURATION_REGISTERS[raddr_reg[ADDR_REG_MSB:2]];

   generate
      for(j=0; j<REG_ENTRIES; j++)
        begin
           assign cfg_regs[j] = CONFIGURATION_REGISTERS[j];
        end
   endgenerate
   
   assign s_axi_awready = awready;
   assign s_axi_wready = wready;

   assign s_axi_bresp = 2'b00;
   assign s_axi_bvalid = bvalid;

   assign s_axi_arready = arready;
   assign s_axi_rresp = 2'b00;
   assign s_axi_rvalid = rvalid;
   //assign s_axi_rdata = data_out_reg;

   //assign AddrFifoDin_D = '0;
   //assign IdFifoDin_D   = '0;
   //assign AddrFifoWen_S = '0;
   //assign IdFifoWen_S   = '0;
   //assign AddrFifoRen_S = '0;
   //assign IdFifoRen_S   = '0;
   
   //********************************************************
   //****************** Miss Handling FIFOs *****************
   //********************************************************

   logic [MHR_WIDTH-1:0] AddrFifoDin_D;
   logic                 AddrFifoWen_S;
   logic                 AddrFifoRen_S;               
   logic [MHR_WIDTH-1:0] AddrFifoDout_D;
   logic                 AddrFifoFull_S;
   logic                 AddrFifoEmpty_S;
   
   logic [MHR_WIDTH-1:0] IdFifoDin_D;
   logic                 IdFifoWen_S;
   logic                 IdFifoRen_S;               
   logic [MHR_WIDTH-1:0] IdFifoDout_D;
   logic                 IdFifoFull_S;
   logic                 IdFifoEmpty_S;

   logic [C_AXICFG_DATA_WIDTH-1:0] wdata_reg_vec;
   
   assign MhFifoFull_SO = (AddrFifoWen_S & AddrFifoFull_S) | (IdFifoWen_S & IdFifoFull_S);
   
   generate
      for (j=0; j<C_AXICFG_DATA_WIDTH/8; j++)
        begin
           assign wdata_reg_vec[(j+1)*8-1:j*8] = wdata_reg[j];
        end
   endgenerate
   
   // write Address FIFO
   always_comb
     begin
        AddrFifoWen_S <= 1'b0;
        AddrFifoDin_D <= 'b0;
        if ( Miss_SI == 1'b1 ) // register a new miss
          begin
             AddrFifoWen_S <= 1'b1;
             AddrFifoDin_D <= MissAddr_DI[AXI_ADDR_WIDTH-1:AXI_ADDR_WIDTH-MHR_WIDTH];
          end
        else if ( (write_en == 1'b1) && (waddr_reg[ADDR_REG_MSB-1:0] == 'b0) ) // write request from AXI interface
          begin
             AddrFifoWen_S <= 1'b1;
             AddrFifoDin_D <= wdata_reg_vec[AXI_ADDR_WIDTH-1:AXI_ADDR_WIDTH-MHR_WIDTH];
          end
     end
   
   // write ID FIFO
   always_comb
     begin
        IdFifoWen_S <= 1'b0;
        IdFifoDin_D <= 'b0;
        if ( Miss_SI == 1'b1 ) // register a new miss
          begin
             IdFifoWen_S                   <= 1'b1;
             IdFifoDin_D[MISS_ID_WIDTH-1:0] <= MissId_DI;
          end
        else if ( (write_en == 1'b1) && (waddr_reg == 4'h4) ) // write request from AXI interface
          begin
             IdFifoWen_S <= 1'b1;
             IdFifoDin_D <= wdata_reg_vec[MHR_WIDTH-1:0];
          end
     end
   
   // AXI read data
   always_comb
     begin
        s_axi_rdata   <= data_out_reg; // read RAB config
        AddrFifoRen_S <= 1'b0;
        IdFifoRen_S   <= 1'b0;
        if ( rvalid == 1'b1 )
          begin
             // read Addr FIFO
             if ( raddr_reg[ADDR_REG_MSB-1:0] == 'b0 )
               begin
                  s_axi_rdata[C_AXICFG_DATA_WIDTH-1:C_AXICFG_DATA_WIDTH-MHR_WIDTH] <= AddrFifoDout_D;
                  s_axi_rdata[C_AXICFG_DATA_WIDTH-MHR_WIDTH-1:1]                   <= 'b0;
                  s_axi_rdata[0]                                                   <= AddrFifoEmpty_S;
                  if ( AddrFifoEmpty_S == 1'b0 )
                    AddrFifoRen_S <= 1'b1;
               end
             // read Id FIFO
             else if ( raddr_reg[ADDR_REG_MSB-1:0] == 'h4 )
               begin
                  s_axi_rdata[C_AXICFG_DATA_WIDTH-1]               <= IdFifoEmpty_S;
                  s_axi_rdata[C_AXICFG_DATA_WIDTH-2:MISS_ID_WIDTH] <= 'b0;
                  s_axi_rdata[MISS_ID_WIDTH-1:0]                   <= IdFifoDout_D;
                  if ( IdFifoEmpty_S == 1'b0 )
                    IdFifoRen_S <= 1'b1;                  
               end
          end // if ( rvalid == 1'b1 )
     end // always_comb begin
      
   xilinx_fifo_rab_mh xilinx_fifo_addr_i
     (
      .clk  (s_axi_aclk     ), 
      .rst  (~s_axi_aresetn ), 
      .din  (AddrFifoDin_D  ),
      .wr_en(AddrFifoWen_S & ~AddrFifoFull_S),
      .rd_en(AddrFifoRen_S  ),
      .dout (AddrFifoDout_D ),
      .full (AddrFifoFull_S ),
      .empty(AddrFifoEmpty_S)
      );
   
   xilinx_fifo_rab_mh xilinx_fifo_stat_i
     (
      .clk  (s_axi_aclk    ), 
      .rst  (~s_axi_aresetn), 
      .din  (IdFifoDin_D   ),
      .wr_en(IdFifoWen_S & ~IdFifoFull_S),
      .rd_en(IdFifoRen_S   ),
      .dout (IdFifoDout_D  ),
      .full (IdFifoFull_S  ),
      .empty(IdFifoEmpty_S )
      );
   
endmodule
