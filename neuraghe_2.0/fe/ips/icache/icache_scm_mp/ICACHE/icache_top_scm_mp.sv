//`define TAG_WIDTH 7


module icache_top_scm_mp
#(
   parameter FETCH_ADDR_WIDTH = 32,
   parameter FETCH_DATA_WIDTH = 32,

   parameter NB_CORES         = 4,
   parameter NB_BANKS         = 4,
   parameter NB_WAYS          = 4,
   parameter CACHE_SIZE       = 4096, // in Byte
   parameter CACHE_LINE       = 4,    // in word of [FETCH_DATA_WIDTH]

   parameter AXI_ID           = 10,
   parameter AXI_ADDR         = 32,
   parameter AXI_USER         = 6,
   parameter AXI_DATA         = 64
)
(
   input logic                                           clk,
   input logic                                           rst_n,
   input logic                                           test_en_i,

   // interface with processors
   input  logic [NB_CORES-1:0]                           fetch_req_i,
   input  logic [NB_CORES-1:0][FETCH_ADDR_WIDTH-1:0]     fetch_addr_i,
   output logic [NB_CORES-1:0]                           fetch_gnt_o,

   output logic [NB_CORES-1:0]                           fetch_rvalid_o,
   output logic [NB_CORES-1:0][FETCH_DATA_WIDTH-1:0]     fetch_rdata_o,



   //AXI read address bus -------------------------------------------
   output  logic [AXI_ID-1:0]             axi_master_arid_o,
   output  logic [AXI_ADDR-1:0]           axi_master_araddr_o,
   output  logic [ 7:0]                   axi_master_arlen_o,    //burst length - 1 to 16
   output  logic [ 2:0]                   axi_master_arsize_o,   //size of each transfer in burst
   output  logic [ 1:0]                   axi_master_arburst_o,  //for bursts>1, accept only incr burst=01
   output  logic                          axi_master_arlock_o,   //only normal access supported axs_awlock=00
   output  logic [ 3:0]                   axi_master_arcache_o, 
   output  logic [ 2:0]                   axi_master_arprot_o,
   output  logic [ 3:0]                   axi_master_arregion_o, //
   output  logic [ AXI_USER-1:0]          axi_master_aruser_o,   //
   output  logic [ 3:0]                   axi_master_arqos_o,    //  
   output  logic                          axi_master_arvalid_o,  //master addr valid
   input logic                            axi_master_arready_i,  //slave ready to accept
   // ---------------------------------------------------------------


   //AXI BACKWARD read data bus ----------------------------------------------
   input   logic [AXI_ID-1:0]             axi_master_rid_i,
   input   logic [AXI_DATA-1:0]           axi_master_rdata_i,
   input   logic [1:0]                    axi_master_rresp_i,
   input   logic                          axi_master_rlast_i,    //last transfer in burst
   input   logic [AXI_USER-1:0]           axi_master_ruser_i,
   input   logic                          axi_master_rvalid_i,   //slave data valid
   output  logic                          axi_master_rready_o,    //master ready to accept

   // NOT USED ----------------------------------------------
   output logic [AXI_ID-1:0]             axi_master_awid_o,
   output logic [AXI_ADDR-1:0]           axi_master_awaddr_o,
   output logic [ 7:0]                   axi_master_awlen_o,
   output logic [ 2:0]                   axi_master_awsize_o,
   output logic [ 1:0]                   axi_master_awburst_o,
   output logic                          axi_master_awlock_o,
   output logic [ 3:0]                   axi_master_awcache_o,
   output logic [ 2:0]                   axi_master_awprot_o,
   output logic [ 3:0]                   axi_master_awregion_o,
   output logic [ AXI_USER-1:0]          axi_master_awuser_o,
   output logic [ 3:0]                   axi_master_awqos_o,
   output logic                          axi_master_awvalid_o,
   input  logic                          axi_master_awready_i,

   // NOT USED ----------------------------------------------
   output logic  [AXI_DATA-1:0]          axi_master_wdata_o,
   output logic  [AXI_DATA/8-1:0]        axi_master_wstrb_o,
   output logic                          axi_master_wlast_o,
   output logic  [ AXI_USER-1:0]         axi_master_wuser_o,
   output logic                          axi_master_wvalid_o,
   input  logic                          axi_master_wready_i,
   // ---------------------------------------------------------------

   // NOT USED ----------------------------------------------
   input  logic  [AXI_ID-1:0]            axi_master_bid_i,
   input  logic  [ 1:0]                  axi_master_bresp_i,
   input  logic  [ AXI_USER-1:0]         axi_master_buser_i,
   input  logic                          axi_master_bvalid_i,
   output logic                          axi_master_bready_o
   // ---------------------------------------------------------------
);
   localparam OFFSET             = $clog2(FETCH_DATA_WIDTH)-3;
   localparam BANK_SIZE          = CACHE_SIZE/NB_BANKS;
   localparam WAY_SIZE           = BANK_SIZE/NB_WAYS;
   localparam SCM_NUM_ROWS       = WAY_SIZE/(CACHE_LINE*FETCH_DATA_WIDTH/8);
   localparam SCM_ADDR_WIDTH     = $clog2(SCM_NUM_ROWS);
`ifdef REDUCED_TAG
   localparam TAG_WIDTH          = `TAG_WIDTH;
`else
   localparam TAG_WIDTH          = FETCH_ADDR_WIDTH - SCM_ADDR_WIDTH - $clog2(NB_BANKS) - $clog2(CACHE_LINE) - OFFSET + 1; //[Valid],[TAG]
`endif  
   localparam DATA_WIDTH         = CACHE_LINE*FETCH_DATA_WIDTH;

   localparam AXI_ID_INT         = $clog2(NB_BANKS);
   localparam AXI_ID_OUT         = AXI_ID_INT+$clog2(NB_BANKS);


   //AXI read address bus -------------------------------------------
   logic [NB_CORES-1:0] [AXI_ID_INT-1:0]         axi_master_arid_int;
   logic [NB_CORES-1:0] [AXI_ADDR-1:0]           axi_master_araddr_int;
   logic [NB_CORES-1:0] [ 7:0]                   axi_master_arlen_int;    //burst length - 1 to 16
   logic [NB_CORES-1:0] [ 2:0]                   axi_master_arsize_int;   //size of each transfer in burst
   logic [NB_CORES-1:0] [ 1:0]                   axi_master_arburst_int;  //for bursts>1; accept only incr burst=01
   logic [NB_CORES-1:0]                          axi_master_arlock_int;   //only normal access supported axs_awlock=00
   logic [NB_CORES-1:0] [ 3:0]                   axi_master_arcache_int; 
   logic [NB_CORES-1:0] [ 2:0]                   axi_master_arprot_int;
   logic [NB_CORES-1:0] [ 3:0]                   axi_master_arregion_int; //
   logic [NB_CORES-1:0] [ AXI_USER-1:0]          axi_master_aruser_int;   //
   logic [NB_CORES-1:0] [ 3:0]                   axi_master_arqos_int;    //  
   logic [NB_CORES-1:0]                          axi_master_arvalid_int;  //master addr valid
   logic [NB_CORES-1:0]                          axi_master_arready_int;  //slave ready to accept
   // ---------------------------------------------------------------


   //AXI BACKWARD read data bus ----------------------------------------------
   logic [NB_CORES-1:0][AXI_ID_INT-1:0]          axi_master_rid_int;
   logic [NB_CORES-1:0][AXI_DATA-1:0]            axi_master_rdata_int;
   logic [NB_CORES-1:0][1:0]                     axi_master_rresp_int;
   logic [NB_CORES-1:0]                          axi_master_rlast_int;    //last transfer in burst
   logic [NB_CORES-1:0][AXI_USER-1:0]            axi_master_ruser_int;
   logic [NB_CORES-1:0]                          axi_master_rvalid_int;   //slave data valid
   logic [NB_CORES-1:0]                          axi_master_rready_int;    //master ready to accept


   // interface with READ PORT --> SCM DATA
   logic [NB_CORES-1:0][NB_BANKS-1:0]                  DATA_read_req_int;   
   logic [NB_CORES-1:0][SCM_ADDR_WIDTH-1:0]            DATA_read_addr_int;
   logic [NB_BANKS-1:0][NB_WAYS-1:0][NB_CORES-1:0][DATA_WIDTH-1:0]  DATA_read_rdata_int;

   // interface with READ PORT --> SCM TAG
   logic [NB_CORES-1:0][NB_BANKS-1:0]                  TAG_read_req_int;   
   logic [NB_CORES-1:0][SCM_ADDR_WIDTH-1:0]            TAG_read_addr_int;
   logic [NB_BANKS-1:0][NB_WAYS-1:0][NB_CORES-1:0][TAG_WIDTH-1:0]   TAG_read_rdata_int;

   // interface with WRITE PORT --> SCM UNIFIED
   logic [NB_CORES-1:0]                                SCM_write_req_int;   
   logic [NB_CORES-1:0][SCM_ADDR_WIDTH-1:0]            SCM_write_addr_int;
   logic [NB_CORES-1:0][$clog2(NB_BANKS)-1:0]          SCM_write_dest_int;  
   logic [NB_CORES-1:0][TAG_WIDTH+DATA_WIDTH-1:0]      SCM_write_wdata_int;
   logic [NB_CORES-1:0][NB_WAYS-1:0]                   SCM_write_way_int;
   logic [NB_CORES-1:0]                                SCM_write_gnt_int;


   // interface between DATA interco and write port DATA RAM
   logic [NB_BANKS-1:0]                                SCM_write_req_IC;   
   logic [NB_BANKS-1:0] [SCM_ADDR_WIDTH-1:0]           SCM_write_addr_IC;
   logic [NB_BANKS-1:0] [TAG_WIDTH+DATA_WIDTH-1:0]     SCM_write_wdata_IC;
   logic [NB_BANKS-1:0] [NB_WAYS-1:0]                  SCM_write_way_IC;

   // interface between TAG interco and write port TAG RAM
   logic [NB_BANKS-1:0]                                TAG_write_req_IC;   
   logic [NB_BANKS-1:0] [SCM_ADDR_WIDTH-1:0]           TAG_write_addr_IC;
   logic [NB_BANKS-1:0] [TAG_WIDTH-1:0]                TAG_write_wdata_IC;

   // interface between DATA interco and write port DATA RAM
   logic [NB_BANKS-1:0]                                DATA_write_req_IC;   
   logic [NB_BANKS-1:0] [SCM_ADDR_WIDTH-1:0]           DATA_write_addr_IC;
   logic [NB_BANKS-1:0] [DATA_WIDTH-1:0]               DATA_write_wdata_IC;



   logic [NB_BANKS-1:0] [NB_CORES-1:0]                  TAG_ReadEnable;
   logic [NB_BANKS-1:0] [NB_CORES-1:0]                  DATA_ReadEnable;
   logic [NB_CORES-1:0] [NB_BANKS-1:0][NB_WAYS-1:0] [TAG_WIDTH-1:0]  TAG_ReadData;
   logic [NB_CORES-1:0] [NB_BANKS-1:0][NB_WAYS-1:0] [DATA_WIDTH-1:0] DATA_ReadData;


   logic [31:0]             axi_instr_bus_init_START_ADDR;
   logic [31:0]             axi_instr_bus_init_END_ADDR;
   logic                    axi_instr_bus_init_valid_rule;
   logic [NB_CORES-1:0]     axi_instr_bus_init_connectivity_map;


   // interface with CTRL WRITE PORT --> SCM DATA
   logic                                ctrl_SCM_write_req;   
   logic [$clog2(NB_BANKS)-1:0]         ctrl_SCM_write_dest;
   logic [SCM_ADDR_WIDTH-1:0]           ctrl_SCM_write_addr;
   logic [TAG_WIDTH+DATA_WIDTH-1:0]     ctrl_SCM_write_wdata;
   logic [NB_WAYS-1:0]                  ctrl_SCM_write_way;
   logic                                ctrl_SCM_write_gnt;

   logic                                icache_flushing;


   assign TAG_write_req_IC    = SCM_write_req_IC;
   assign TAG_write_addr_IC   = SCM_write_addr_IC;
   
   assign DATA_write_req_IC   = SCM_write_req_IC;
   assign DATA_write_addr_IC  = SCM_write_addr_IC;
   
   genvar i,j,k,z;
   
   generate
      for(z=0; z<NB_BANKS; z++)
      begin
         assign TAG_write_wdata_IC[z]  = SCM_write_wdata_IC[z][DATA_WIDTH+TAG_WIDTH-1:DATA_WIDTH];
         assign DATA_write_wdata_IC[z] = SCM_write_wdata_IC[z][DATA_WIDTH-1:0];
      end
   endgenerate




   init_icache
   #(
      .ADDR_WIDTH      ( SCM_ADDR_WIDTH   ),
      .TAG_WIDTH       ( TAG_WIDTH        ),
      .NB_BANKS        ( NB_BANKS         ),
      .DATA_WIDTH      ( DATA_WIDTH       )
   )
   init_cache_i
   (
      .clk                ( clk                    ),
      .rst_n              ( rst_n                  ),
      .flush_req_i        ( 1'b0                   ),
      .flushing_o         ( icache_flushing        ),

      .SCM_write_req_o   ( ctrl_SCM_write_req    ),   
      .SCM_write_addr_o  ( ctrl_SCM_write_addr   ),
      .SCM_write_dest_o  ( ctrl_SCM_write_dest   ),  
      .SCM_write_wdata_o ( ctrl_SCM_write_wdata  ),
      .SCM_write_way_o   ( ctrl_SCM_write_way    ),
      .SCM_write_gnt_i   ( ctrl_SCM_write_gnt    )
   );





   XBAR_SCM 
   #(
       .N_CH0           ( NB_CORES                                   ), //--> CH0
       .N_CH1           ( 1                                          ), //--> CH1
       .N_SLAVE         ( NB_BANKS                                   ),

       .DATA_WIDTH      ( TAG_WIDTH+DATA_WIDTH                       ),
       .ADDR_MEM_WIDTH  ( SCM_ADDR_WIDTH                             ),
       .N_WAYS          ( NB_WAYS                                    )
   )
   DATA_TAG_INTERCO
   (
       .data_req_i     ( {ctrl_SCM_write_req  , SCM_write_req_int   } ),
       .data_dest_i    ( {ctrl_SCM_write_dest , SCM_write_dest_int  } ),
       .data_add_i     ( {ctrl_SCM_write_addr , SCM_write_addr_int  } ),
       .data_wdata_i   ( {ctrl_SCM_write_wdata, SCM_write_wdata_int } ),
       .data_way_i     ( {ctrl_SCM_write_way  , SCM_write_way_int   } ),
       .data_gnt_o     ( {ctrl_SCM_write_gnt  , SCM_write_gnt_int   } ),

       .data_req_o     ( SCM_write_req_IC                             ),
       .data_add_o     ( SCM_write_addr_IC                            ),
       .data_wdata_o   ( SCM_write_wdata_IC                           ),
       .data_way_o     ( SCM_write_way_IC                             ),
       .data_gnt_i     ( '1                                           ),

       .clk            ( clk                                          ),
       .rst_n          ( rst_n                                        )
   );





generate
   for(i=0; i<NB_CORES; i++)
   begin : ICACHE_BANK
      icache_bank
      #(
         .FETCH_ADDR_WIDTH ( FETCH_ADDR_WIDTH  ),
         .FETCH_DATA_WIDTH ( FETCH_DATA_WIDTH  ),

         .BANK_ID          ( i                 ),
         .NB_BANKS         ( NB_BANKS          ),
         .NB_WAYS          ( NB_WAYS           ),

         .SCM_ADDR_WIDTH   ( SCM_ADDR_WIDTH    ),
         .TAG_WIDTH        ( TAG_WIDTH         ),
         .DATA_WIDTH       ( DATA_WIDTH        ),

         .AXI_ID           ( AXI_ID_INT        ),
         .AXI_ADDR         ( AXI_ADDR          ),
         .AXI_USER         ( AXI_USER          ),
         .AXI_DATA         ( AXI_DATA          )
      )
      icache_bank_i
      (
         .clk                     (clk                        ),
         .rst_n                   (rst_n                      ),

         .icache_flushing_i       (icache_flushing            ),

         // interface with processor
         .fetch_req_i             (fetch_req_i[i]             ),
         .fetch_addr_i            (fetch_addr_i[i]            ),
         .fetch_gnt_o             (fetch_gnt_o[i]             ),

         .fetch_rvalid_o          (fetch_rvalid_o[i]          ),
         .fetch_rdata_o           (fetch_rdata_o[i]           ),


         // interface with READ PORT --> SCM DATA
         .DATA_read_req_o         (DATA_read_req_int[i]       ),      
         .DATA_read_addr_o        (DATA_read_addr_int[i]      ),
         .DATA_read_rdata_i       (DATA_ReadData[i]           ),

         // interface with READ PORT --> SCM TAG
         .TAG_read_req_o          (TAG_read_req_int[i]        ),       
         .TAG_read_addr_o         (TAG_read_addr_int[i]       ),
         .TAG_read_rdata_i        (TAG_ReadData[i]            ),

         // interface with WRITE PORT --> SCM DATA
         .SCM_write_req_o        (SCM_write_req_int[i]      ),     
         .SCM_write_addr_o       (SCM_write_addr_int[i]     ),
         .SCM_write_dest_o       (SCM_write_dest_int[i]     ),
         .SCM_write_wdata_o      (SCM_write_wdata_int[i]    ),
         .SCM_write_way_o        (SCM_write_way_int[i]      ),
         .SCM_write_gnt_i        (SCM_write_gnt_int[i]      ),
       
        .axi_master_arid_o        (axi_master_arid_int[i]     ),
        .axi_master_araddr_o      (axi_master_araddr_int[i]   ),
        .axi_master_arlen_o       (axi_master_arlen_int[i]    ),   //burst length - 1 to 16
        .axi_master_arsize_o      (axi_master_arsize_int[i]   ),   //size of each transfer in burst
        .axi_master_arburst_o     (axi_master_arburst_int[i]  ),   //accept only incr burst=01
        .axi_master_arlock_o      (axi_master_arlock_int[i]   ),   //only normal access supported axs_awlock=00
        .axi_master_arcache_o     (axi_master_arcache_int[i]  ), 
        .axi_master_arprot_o      (axi_master_arprot_int[i]   ),
        .axi_master_arregion_o    (axi_master_arregion_int[i] ),   //
        .axi_master_aruser_o      (axi_master_aruser_int[i]   ),   //
        .axi_master_arqos_o       (axi_master_arqos_int[i]    ),   //  
        .axi_master_arvalid_o     (axi_master_arvalid_int[i]  ),   //master addr valid
        .axi_master_arready_i     (axi_master_arready_int[i]  ),   //slave ready to accept

        .axi_master_rid_i         (axi_master_rid_int[i]      ),
        .axi_master_rdata_i       (axi_master_rdata_int[i]    ),
        .axi_master_rresp_i       (axi_master_rresp_int[i]    ),
        .axi_master_rlast_i       (axi_master_rlast_int[i]    ),   //last transfer in burst
        .axi_master_ruser_i       (axi_master_ruser_int[i]    ),
        .axi_master_rvalid_i      (axi_master_rvalid_int[i]   ),   //slave data valid
        .axi_master_rready_o      (axi_master_rready_int[i]   )    //master ready to accept
      );
   end



   for(i=0;i<NB_BANKS;i++)
   begin
      for(j=0;j<NB_CORES;j++)
      begin
         assign TAG_ReadEnable[i][j] = TAG_read_req_int[j][i];
         assign DATA_ReadEnable[i][j] = DATA_read_req_int[j][i];
      end
   end



      for(i=0;i<NB_BANKS;i++)
      begin
         for(j=0;j<NB_WAYS;j++)
         begin
             for(k=0;k<NB_CORES;k++)
             begin
                assign TAG_ReadData[k][i][j] = TAG_read_rdata_int[i][j][k];
                assign DATA_ReadData[k][i][j] = DATA_read_rdata_int[i][j][k];
             end
         end

      end




   for(i=0; i<NB_BANKS; i++)
   begin : _TAG_BANKS_
      for(j=0; j<NB_WAYS; j++)
      begin : _TAG_WAY_
            register_file_1w_multi_port_read
            #(
                .ADDR_WIDTH    ( SCM_ADDR_WIDTH  ),
                .DATA_WIDTH    ( TAG_WIDTH       ),
                .N_READ        ( NB_CORES        ),
                .N_WRITE       ( 1               )
            )
            TAG_BANK
            (
                .clk         (clk),

                .ReadEnable  (TAG_ReadEnable[i]  ),
                .ReadAddr    (TAG_read_addr_int  ),
                .ReadData    (TAG_read_rdata_int[i][j] ),

                .WriteEnable (TAG_write_req_IC[i] & SCM_write_way_IC[i][j]   ),
                .WriteAddr   (TAG_write_addr_IC[i]                           ),
                .WriteData   (TAG_write_wdata_IC[i]                          )
            );
      end
   end



   for(i=0; i<NB_BANKS; i++)
   begin : _DATA_BANKS_
      for(j=0; j<NB_WAYS; j++)
      begin : _DATA_WAY_
            register_file_1w_multi_port_read
            #(
                .ADDR_WIDTH    ( SCM_ADDR_WIDTH ),
                .DATA_WIDTH    ( DATA_WIDTH      ),
                .N_READ        ( NB_CORES        ),
                .N_WRITE       ( 1               )
            )
            DATA_BANK
            (
                .clk         ( clk                    ),

                .ReadEnable  ( DATA_ReadEnable[i]     ),
                .ReadAddr    ( DATA_read_addr_int     ),
                .ReadData    ( DATA_read_rdata_int[i][j] ),

                .WriteEnable ( DATA_write_req_IC[i] & SCM_write_way_IC[i][j]  ),
                .WriteAddr   ( DATA_write_addr_IC[i]  ),
                .WriteData   ( DATA_write_wdata_IC[i] )
            );
      end
   end

endgenerate


/////////////////////////////////////////////////////////////////
//  █████╗ ██╗  ██╗██╗    ███╗   ██╗ ██████╗ ██████╗ ███████╗  //
// ██╔══██╗╚██╗██╔╝██║    ████╗  ██║██╔═══██╗██╔══██╗██╔════╝  //
// ███████║ ╚███╔╝ ██║    ██╔██╗ ██║██║   ██║██║  ██║█████╗    //
// ██╔══██║ ██╔██╗ ██║    ██║╚██╗██║██║   ██║██║  ██║██╔══╝    //
// ██║  ██║██╔╝ ██╗██║    ██║ ╚████║╚██████╔╝██████╔╝███████╗  //
// ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝    ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝  //
/////////////////////////////////////////////////////////////////
axi_node
#(

    .AXI_ADDRESS_W      ( AXI_ADDR       ),
    .AXI_DATA_W         ( AXI_DATA       ),
    .AXI_NUMBYTES       ( AXI_DATA/8     ),

    .AXI_USER_W         ( AXI_USER       ),
    .AXI_ID_IN          ( AXI_ID_INT     ),
    .AXI_ID_OUT         ( AXI_ID_OUT     ),

    .N_MASTER_PORT      ( 1              ),
    .N_SLAVE_PORT       ( NB_CORES       ),


    .FIFO_DEPTH_DW      ( 2              ),
    .N_REGION           ( 1              )
)
AXI_INTRUCTION_BUS
(
  .clk                  (  clk                    ),
  .rst_n                (  rst_n                  ),
  .test_en_i            (  test_en_i              ),

  // ---------------------------------------------------------------
  // AXI TARG Port Declarations -----------------------------------------
  // ---------------------------------------------------------------
  .slave_awid_i          ( '0  ),
  .slave_awaddr_i        ( '0  ),
  .slave_awlen_i         ( '0  ),
  .slave_awsize_i        ( '0  ),
  .slave_awburst_i       ( '0  ),
  .slave_awlock_i        ( '0  ),
  .slave_awcache_i       ( '0  ),
  .slave_awprot_i        ( '0  ),
  .slave_awregion_i      ( '0  ),
  .slave_awuser_i        ( '0  ),
  .slave_awqos_i         ( '0  ),
  .slave_awvalid_i       ( '0  ),
  .slave_awready_o       (     ),

  .slave_wdata_i         ( '0   ),
  .slave_wstrb_i         ( '0   ),
  .slave_wlast_i         ( '0   ),
  .slave_wuser_i         ( '0   ),
  .slave_wvalid_i        ( '0   ),
  .slave_wready_o        (      ),


  .slave_bid_o           (      ),
  .slave_bresp_o         (      ),
  .slave_bvalid_o        (      ),
  .slave_buser_o         (      ),
  .slave_bready_i        ( '0   ),


  .slave_arid_i          ( axi_master_arid_int      ),
  .slave_araddr_i        ( axi_master_araddr_int    ),
  .slave_arlen_i         ( axi_master_arlen_int     ),
  .slave_arsize_i        ( axi_master_arsize_int    ),
  .slave_arburst_i       ( axi_master_arburst_int   ),
  .slave_arlock_i        ( axi_master_arlock_int    ),
  .slave_arcache_i       ( axi_master_arcache_int   ),
  .slave_arprot_i        ( axi_master_arprot_int    ),
  .slave_arregion_i      ( axi_master_arregion_int  ),
  .slave_aruser_i        ( axi_master_aruser_int    ),
  .slave_arqos_i         ( axi_master_arqos_int     ),
  .slave_arvalid_i       ( axi_master_arvalid_int   ),
  .slave_arready_o       ( axi_master_arready_int   ),
  // -----------------------------------------------

  .slave_rid_o           ( axi_master_rid_int       ),
  .slave_rdata_o         ( axi_master_rdata_int     ),
  .slave_rresp_o         ( axi_master_rresp_int     ),
  .slave_rlast_o         ( axi_master_rlast_int     ),
  .slave_ruser_o         ( axi_master_ruser_int     ),
  .slave_rvalid_o        ( axi_master_rvalid_int    ),
  .slave_rready_i        ( axi_master_rready_int    ),
  // -----------------------------------------------

  // -----------------------------------------------
  // AXI INIT Port Declarations --------------------
  // -----------------------------------------------
  .master_awid_o          ( axi_master_awid_o[AXI_ID_OUT-1:0]     ),
  .master_awaddr_o        ( axi_master_awaddr_o               ),
  .master_awlen_o         ( axi_master_awlen_o                ),
  .master_awsize_o        ( axi_master_awsize_o               ),
  .master_awburst_o       ( axi_master_awburst_o              ),
  .master_awlock_o        ( axi_master_awlock_o               ),
  .master_awcache_o       ( axi_master_awcache_o              ),
  .master_awprot_o        ( axi_master_awprot_o               ),
  .master_awregion_o      ( axi_master_awregion_o             ),
  .master_awuser_o        ( axi_master_awuser_o               ),
  .master_awqos_o         ( axi_master_awqos_o                ),
  .master_awvalid_o       ( axi_master_awvalid_o              ),
  .master_awready_i       ( axi_master_awready_i              ),

  .master_wdata_o         ( axi_master_wdata_o                ),
  .master_wstrb_o         ( axi_master_wstrb_o                ),
  .master_wlast_o         ( axi_master_wlast_o                ),
  .master_wuser_o         ( axi_master_wuser_o                ),
  .master_wvalid_o        ( axi_master_wvalid_o               ),
  .master_wready_i        ( axi_master_wready_i               ),

  .master_bid_i           ( axi_master_bid_i[AXI_ID_OUT-1:0]      ),
  .master_bresp_i         ( axi_master_bresp_i                ),
  .master_buser_i         ( axi_master_buser_i                ),
  .master_bvalid_i        ( axi_master_bvalid_i               ),
  .master_bready_o        ( axi_master_bready_o               ),

  .master_arid_o          ( axi_master_arid_o[AXI_ID_OUT-1:0]     ),
  .master_araddr_o        ( axi_master_araddr_o               ),
  .master_arlen_o         ( axi_master_arlen_o                ),
  .master_arsize_o        ( axi_master_arsize_o               ),
  .master_arburst_o       ( axi_master_arburst_o              ),
  .master_arlock_o        ( axi_master_arlock_o               ),
  .master_arcache_o       ( axi_master_arcache_o              ),
  .master_arprot_o        ( axi_master_arprot_o               ),
  .master_arregion_o      ( axi_master_arregion_o             ),
  .master_aruser_o        ( axi_master_aruser_o               ),
  .master_arqos_o         ( axi_master_arqos_o                ),
  .master_arvalid_o       ( axi_master_arvalid_o              ),
  .master_arready_i       ( axi_master_arready_i              ),

  .master_rid_i           ( axi_master_rid_i[AXI_ID_OUT-1:0]      ),
  .master_rdata_i         ( axi_master_rdata_i                ),
  .master_rresp_i         ( axi_master_rresp_i                ),
  .master_rlast_i         ( axi_master_rlast_i                ),
  .master_ruser_i         ( axi_master_ruser_i                ),
  .master_rvalid_i        ( axi_master_rvalid_i               ),
  .master_rready_o        ( axi_master_rready_o               ),

  .cfg_START_ADDR_i       (axi_instr_bus_init_START_ADDR      ),
  .cfg_END_ADDR_i         (axi_instr_bus_init_END_ADDR        ),
  .cfg_valid_rule_i       (axi_instr_bus_init_valid_rule      ),
  .cfg_connectivity_map_i (axi_instr_bus_init_connectivity_map)

);

  assign     axi_master_awid_o[AXI_ID-1:AXI_ID_OUT] = '0;
  assign     axi_master_arid_o[AXI_ID-1:AXI_ID_OUT] = '0;

  assign axi_instr_bus_init_START_ADDR = 32'h00000000;
  assign axi_instr_bus_init_END_ADDR   = 32'hffffffff;
  assign axi_instr_bus_init_valid_rule = 1'b1;
  assign axi_instr_bus_init_connectivity_map = '1;

endmodule // icache_top_scm_mp
