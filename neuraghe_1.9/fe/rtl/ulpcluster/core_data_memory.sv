module core_data_memory

    #(parameter BANK_SIZE = 8192, // xilinx_tcdm_bank_8192x32
    parameter NB_BANKS  = 1,
    parameter MEM_ADDR_WIDTH = 1,
    parameter ADDR_WIDTH = $clog2(BANK_SIZE*4)
    )
 
    (input logic                   clk_i,
    input logic                    rst_ni,
    XBAR_TCDM_BUS.Slave            core_slave,
    XBAR_TCDM_BUS.Slave            ext_slave
    );       

    logic                         rsta;
    logic                         ena;
    logic [31:0]                  wdataa;
    logic [ADDR_WIDTH-2-1:0]      addra;
    logic  [3:0]                  wea;
    logic [31:0]                  rdataa;
    logic reqa_del; 
    
    logic                         enb;
    logic [31:0]                  wdatab;
    logic [ADDR_WIDTH-2-1:0]      addrb;
    logic  [3:0]                  web;
    logic [31:0]                  rdatab;
    logic reqb_del; 
    
    // BRAM single port
    xilinx_tcdm_bank_8192x32

    mem_i  
    (
    .clka     ( clk_i                     ),
    .rsta     ( rsta                      ),
    .ena      ( ena                       ),
    .wea      ( wea                       ),
    .addra    ( addra                       ),
    .dina     ( wdataa                     ),
    .douta    ( rdataa                     ),
    
    .clkb     ( clk_i                     ),
    .enb      ( enb                       ),
    .web      ( web                       ),
    .addrb    ( addrb                     ),
    .dinb     ( wdatab                     ),
    .doutb    ( rdatab                     )
    );
    
    always_ff@(posedge clk_i)
      if (rst_ni == 1'b0)
        reqa_del <= 1'b0;
      else
        reqa_del <= ext_slave.req;
            
    // XBAR - BRAM conversion
    assign rsta  = ~rst_ni;
    assign ena   = ext_slave.req;
    assign wdataa = ext_slave.wdata;
    assign addra   = ext_slave.add[ADDR_WIDTH-1 : 2];
    assign wea   = {4{ext_slave.req}} & {4{~ext_slave.wen}} & ext_slave.be;
    assign ext_slave.r_rdata = rdataa;
    assign ext_slave.gnt = 1'b1;
    assign ext_slave.r_valid = reqa_del;

    assign ext_slave.r_opc = '0;
    
    
    
    
    
    always_ff@(posedge clk_i)
      if (rst_ni == 1'b0) 
        reqb_del <= 1'b0;
      else
        reqb_del <= core_slave.req;
            
    // XBAR - BRAM conversion
    
    assign enb     = core_slave.req;
    assign wdatab  = core_slave.wdata;
    assign addrb   = core_slave.add[ADDR_WIDTH-1 : 2];
    assign web     = {4{core_slave.req}} & {4{~core_slave.wen}} & core_slave.be;
    assign core_slave.r_rdata = rdatab;
    assign core_slave.gnt     = 1'b1;
    assign core_slave.r_valid = reqb_del;

    assign core_slave.r_opc = '0;
    
endmodule
