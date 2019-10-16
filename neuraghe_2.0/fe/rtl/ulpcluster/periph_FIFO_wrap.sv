module periph_FIFO_wrap
#(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32,
    parameter BYTE_ENABLE_BIT = DATA_WIDTH/8
)
(
    input  logic			 clk_i,
    input  logic			 rst_ni,

    XBAR_PERIPH_BUS.Master  		 periph_data_master,
    XBAR_PERIPH_BUS.Slave  		 periph_data_slave
);

periph_FIFO
#(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .BYTE_ENABLE_BIT(DATA_WIDTH/8)
)
periph_FIFO_i
(
    .clk_i          ( clk_i  ),
    .rst_ni         ( rst_ni ),

    //Input SIde REQ
    .data_req_i     ( periph_data_slave.req   ),
    .data_add_i     ( periph_data_slave.add   ),
    .data_type_i    ( periph_data_slave.we    ),
    .data_wdata_i   ( periph_data_slave.wdata ),
    .data_be_i      ( periph_data_slave.be    ),
    .data_gnt_o     ( periph_data_slave.gnt   ),

    //Output side REQ
    .data_req_o     ( periph_data_master.req  ),
    .data_add_o     ( periph_data_master.add  ),
    .data_type_o    ( periph_data_master.we   ),
    .data_wdata_o   ( periph_data_master.wdata),
    .data_be_o      ( periph_data_master.be   ),
    .data_gnt_i     ( periph_data_master.gnt  ),

    //Input Side RESP
    .data_r_valid_i ( periph_data_master.r_valid ),
    .data_r_opc_i   ( periph_data_master.r_opc   ),
    .data_r_rdata_i ( periph_data_master.r_rdata ),
    
    //Output Side RESP
    .data_r_valid_o ( periph_data_slave.r_valid  ),
    .data_r_opc_o   ( periph_data_slave.r_opc    ),
    .data_r_rdata_o ( periph_data_slave.r_rdata  )
);                  
                    
endmodule