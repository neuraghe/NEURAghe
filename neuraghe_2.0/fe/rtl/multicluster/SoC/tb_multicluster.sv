`timescale 1ns/1ps
`define CLK_PERIOD 1.0

module tb_multicluster ();

    parameter AXI_ADDR_WIDTH        = 32;
    parameter AXI_DATA_WIDTH        = 64;
    parameter AXI_USER_WIDTH        = 6 ;
    parameter AXI_ID_WIDTH          = 4 ;

    logic clk;
    logic rst_n;

    logic [3:0] eoc, fetch_en;


    AXI_BUS
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH)
    )
    data_slave_EXT();


    initial
    begin
        rst_n = 1'b1;
        clk = 0;
        fetch_en = 4'b0000;

        @(negedge clk);
        @(negedge clk);
        rst_n = 1'b0;
        @(negedge clk);
        @(negedge clk);
        rst_n = 1'b1;
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        fetch_en = 4'b0001;

    end

    always 
    begin
        #(`CLK_PERIOD) clk = ~clk;
    end





    // dummy Bind
    assign data_slave_EXT.aw_id      = '0;
    assign data_slave_EXT.aw_addr    = '0;
    assign data_slave_EXT.aw_len     = '0;
    assign data_slave_EXT.aw_size    = '0;
    assign data_slave_EXT.aw_burst   = '0;
    assign data_slave_EXT.aw_lock    = '0;
    assign data_slave_EXT.aw_cache   = '0;
    assign data_slave_EXT.aw_prot    = '0;
    assign data_slave_EXT.aw_valid   = '0;
   
    assign data_slave_EXT.w_data     = '0;
    assign data_slave_EXT.w_strb     = '0;
    assign data_slave_EXT.w_last     = '0;
    assign data_slave_EXT.w_valid    = '0;
    
    assign data_slave_EXT.ar_id      = '0;
    assign data_slave_EXT.ar_addr    = '0;
    assign data_slave_EXT.ar_len     = '0;
    assign data_slave_EXT.ar_size    = '0;
    assign data_slave_EXT.ar_burst   = '0;
    assign data_slave_EXT.ar_lock    = '0;
    assign data_slave_EXT.ar_cache   = '0;
    assign data_slave_EXT.ar_prot    = '0;
    assign data_slave_EXT.ar_valid   = '0;
    

    assign data_slave_EXT.r_ready    = '0;

    assign data_slave_EXT.b_ready    = '0;




    soc_top 
    #(
        .AXI_ADDR_WIDTH        (  AXI_ADDR_WIDTH  ),
        .AXI_DATA_WIDTH        (  AXI_DATA_WIDTH  ),
        .AXI_USER_WIDTH        (  AXI_USER_WIDTH  ),
        .AXI_ID_WIDTH          (  AXI_ID_WIDTH    )
    )
    dut_i
    (
        .clk                   ( clk            ),
        .rst_n                 ( rst_n          ),
        .data_slave_EXT        ( data_slave_EXT ),
        .eoc_o                 ( eoc            ),
        .fetch_en_i            ( fetch_en       )
    );






endmodule // tb_multicluster