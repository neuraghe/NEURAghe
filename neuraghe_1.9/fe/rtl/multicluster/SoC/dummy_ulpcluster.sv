`include "ulpsoc_defines.sv"

module dummy_ulpcluster
#(
    // AXI PARAMETERS
    parameter AXI_ADDR_WIDTH        = 32,
    parameter AXI_DATA_WIDTH        = 64,
    parameter AXI_USER_WIDTH        = 6,
    parameter AXI_ID_WIDTH          = 10,
    parameter CLUSTER_ID            = 0
)
(
   input logic              clk_i,
   input logic              rst_ni,

   input logic [4:0]        cluster_id_i,

   input logic              fetch_en_i,
   output logic             eoc_o,

   AXI_BUS.Slave            data_slave,
   AXI_BUS.Master           instr_master,
   AXI_BUS.Master           data_master
);

  logic eoc_data, eoc_instr;
  UNICAD_MEM_BUS_64  cluster_mem_bus();

  assign tdo_o            = 1'b0;
  assign ext_events_ack_o = '0;
  assign eoc_o            = '0;
  assign busy_o           = '0;
  assign SO               = '0;




  TGEN_wrap 
  #( 
      .AXI4_ADDRESS_WIDTH ( AXI_ADDR_WIDTH ),
      .AXI4_RDATA_WIDTH   ( AXI_DATA_WIDTH ),
      .AXI4_WDATA_WIDTH   ( AXI_DATA_WIDTH ),
      .AXI4_ID_WIDTH      ( AXI_ID_WIDTH   ),
      .AXI4_USER_WIDTH    ( AXI_USER_WIDTH ),
      .SRC_ID             ( CLUSTER_ID     )
  ) 
  data_TGEN_i
  (
      .clk              ( clk_i       ),
      .rst_n            ( rst_ni      ),
      
      .axi_port_master  ( data_master ),
      
      .fetch_en_i       ( fetch_en_i  ),
      .eoc_o            ( eoc_data    ),
      .PASS_o           (             ),
      .FAIL_o           (             )
  );

  TGEN_wrap 
  #( 
      .AXI4_ADDRESS_WIDTH ( AXI_ADDR_WIDTH ),
      .AXI4_RDATA_WIDTH   ( AXI_DATA_WIDTH ),
      .AXI4_WDATA_WIDTH   ( AXI_DATA_WIDTH ),
      .AXI4_ID_WIDTH      ( AXI_ID_WIDTH   ),
      .AXI4_USER_WIDTH    ( AXI_USER_WIDTH ),
      .SRC_ID             ( CLUSTER_ID+10  )
  ) 
  instr_TGEN_i
  (
      .clk              ( clk_i        ),
      .rst_n            ( rst_ni       ),
      
      .axi_port_master  ( instr_master ),
      
      .fetch_en_i       ( fetch_en_i   ),
      .eoc_o            ( eoc_instr    ),
      .PASS_o           (              ),
      .FAIL_o           (              )
  );


    

    axi_mem_if_wrap
    #(
        .AXI_ADDRESS_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH),
        .MEM_ADDR_WIDTH(16),
        .BUFF_DEPTH_SLAVE(4)
    )
    cluster_mem_if_i
    (
        .clk_i(clk_i),
        .rst_ni(rst_ni),

        .axi_slave(data_slave),

        .mem_master(cluster_mem_bus)
    );


    l2_ram
    #(
        .MEM_ADDR_WIDTH ( 16 )
    )
    l2_ram_i
    (
        .clk_i          ( clk_i             ),
        .rst_ni         ( rst_ni            ),

        .init_ni        ( rst_ni            ),

        .test_mode_i    ( 1'b0              ),

        .mem_slave      ( cluster_mem_bus   ),

        // Read and Write margins
        .rm_l2_mem_i    ( '0                ),
        .wm_l2_mem_i    ( '0                ),
        .LS_l2_mem_i    ( 1'b1              ),
        .HS_l2_mem_i    ( 1'b0              ),
        .sleep_l2_mem_i ( 1'b0              )
    );


endmodule // dummy_ulpcluster