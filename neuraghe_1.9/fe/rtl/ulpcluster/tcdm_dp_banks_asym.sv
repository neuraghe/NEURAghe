////////////////////////////////////////////////////////////////////////////////
// Company:         ERC Multitherman Lab @ DEI - University of Bologna        //
//                    Viale Pepoli 3/2 - 40136                                //
//                    Bologna - fax 0512093759                                //
//                                                                            //
// Engineer:       Francesco Conti - f.conti@unibo.it                         //
//                                                                            //
// Additional contributions by:                                               //
//                  Igor Loi - igor.loi@unibo.it                              //
//                                                                            //
// Create Date:    20/08/2015                                                 //
// Design Name:    ULPSoC                                                     //
// Module Name:    tcdm_banks_wrap                                            //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Generic TCDM banks wrapper                                 //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - (Igor) --> removed not supported francesco style hacks,    //
//                            improved the code, added param check            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////



`define XILINX_BRAM_BANK_INSTANCE \
tcdm_bank_i \
( \
  .clka  ( clk_a_i ), \
  .rsta  ( rsta  ), \
  .ena   ( ena   ), \
  .wea   ( wea   ), \
  .addra ( addra ), \
  .dina  ( wdataa ), \
  .douta ( rdataa ), \
  .clkb  ( clk_b_i ), \
  .enb   ( enb   ), \
  .web   ( web   ), \
  .addrb ( addrb ), \
  .dinb  ( wdatab ), \
  .doutb ( rdatab )  \
)


module tcdm_dp_banks_asym
#(
  parameter BANK_SIZE    = 256,   //- -> OVERRIDE
  parameter NB_BANKS     = 1,     // --> OVERRIDE //8
  parameter DATA_WIDTH_A = 64,
  parameter DATA_WIDTH_B = 32
)
(
  input  logic                  clk_a_i,
  input  logic                  clk_b_i,
  input  logic                  rst_ni,

  TCDM_BANK_MEM_BUS_64BIT.Slave tcdm_slave  [NB_BANKS-1:0],
  TCDM_BANK_MEM_BUS.Slave       tcdm_slave_b[NB_BANKS-1:0]
);

  localparam BYTES_A = DATA_WIDTH_A/8;
  localparam BYTES_B = DATA_WIDTH_B/8;
  localparam BANK_SIZE_B = BANK_SIZE * DATA_WIDTH_A/DATA_WIDTH_B;

                         
  genvar i;
  generate
    for(i=0; i<NB_BANKS; i++)   
    begin : bram_bank_gen
     
      /////////////////////////////////////////////////////////////////////////////////////////
      // ██╗  ██╗██╗██╗     ██╗███╗   ██╗██╗  ██╗        ██████╗ ██████╗  █████╗ ███╗   ███╗ //
      // ╚██╗██╔╝██║██║     ██║████╗  ██║╚██╗██╔╝        ██╔══██╗██╔══██╗██╔══██╗████╗ ████║ //
      //  ╚███╔╝ ██║██║     ██║██╔██╗ ██║ ╚███╔╝         ██████╔╝██████╔╝███████║██╔████╔██║ //
      //  ██╔██╗ ██║██║     ██║██║╚██╗██║ ██╔██╗         ██╔══██╗██╔══██╗██╔══██║██║╚██╔╝██║ //
      // ██╔╝ ██╗██║███████╗██║██║ ╚████║██╔╝ ██╗███████╗██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║ //
      // ╚═╝  ╚═╝╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ //
      /////////////////////////////////////////////////////////////////////////////////////////                                                                                   
    
        logic                         rsta;
        logic                         ena;
        logic [DATA_WIDTH_A-1:0]        wdataa;
        logic [$clog2(BANK_SIZE)-1:0] addra;
        logic [DATA_WIDTH_A/8-1:0]    wea;
        logic [DATA_WIDTH_A-1:0]        rdataa;
        
        
        // logic                        rstb; // there is not a reset signal for the b port
        logic                           enb;
        logic [DATA_WIDTH_B-1:0]          wdatab;
        logic [$clog2(BANK_SIZE_B)-1:0] addrb;
        logic [DATA_WIDTH_B/8-1:0]      web;
        logic [DATA_WIDTH_B-1:0]          rdatab;

        assign rsta   = ~rst_ni;
        assign ena    = tcdm_slave[i].req;
        assign wdataa = tcdm_slave[i].wdata;
        assign addra  = tcdm_slave[i].add[$clog2(BANK_SIZE)-1:0];
        assign wea    = {BYTES_A{tcdm_slave[i].req}} & {BYTES_A{~tcdm_slave[i].wen}} & tcdm_slave[i].be;
        assign tcdm_slave[i].rdata = rdataa;
        
        
        assign enb    = tcdm_slave_b[i].req;
        assign wdatab = tcdm_slave_b[i].wdata;
        assign addrb  = tcdm_slave_b[i].add[$clog2(BANK_SIZE_B)-1:0];
        assign web    = {BYTES_B{tcdm_slave_b[i].req}} & {BYTES_B{~tcdm_slave_b[i].wen}} & tcdm_slave_b[i].be;
        assign tcdm_slave_b[i].rdata = rdatab;

        case(BANK_SIZE)
            128: 
            begin : bank_128_gen
              xilinx_tcdm_bank_128x32 `XILINX_BRAM_BANK_INSTANCE;
            end

            256: 
            begin : bank_256_gen
              xilinx_tcdm_bank_256x32 `XILINX_BRAM_BANK_INSTANCE;
            end
            
            512:
             begin : bank_512_gen
              xilinx_tcdm_bank_512x32 `XILINX_BRAM_BANK_INSTANCE;
            end
            
            1024: 
            begin : bank_1024_gen
              xilinx_tcdm_bank_1024x32 `XILINX_BRAM_BANK_INSTANCE;
            end
            
            2048:
            begin : bank_2048_gen
              xilinx_tcdm_bank_2048x64_asym `XILINX_BRAM_BANK_INSTANCE;
            end
                        
            4096:
            begin : bank_4096_asym_gen
              xilinx_tcdm_bank_4096x64_asym `XILINX_BRAM_BANK_INSTANCE;
            end

            default 
            begin : error
            end
        endcase // BANK_SIZE
    
  end // for Loop --> 0 to NB_BANKS-1

  endgenerate 
  

endmodule

