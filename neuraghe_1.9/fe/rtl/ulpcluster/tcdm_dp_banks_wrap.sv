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


`define ST28FDSOI_SRAM_BANK_INSTANCE \
tcdm_bank_i \
( \
  .CLK   ( clk_a_i       ), \
  .RSTN  ( rst_ni      ), \
  .INITN ( init_ni     ), \
  .STDBY ( stdby_i     ), \
  .CSN   ( csn         ), \
  .WMN   ( wmn         ), \
  .WEN   ( wen         ), \
  .LS    ( LS_i        ), \
  .HS    ( HS_i        ), \
  .RM    ( rm_i        ), \
  .WM    ( wm_i        ), \
  .A     ( add         ), \
  .D     ( wdata       ), \
  .Q     ( rdata       ), \
  .TM    ( test_mode_i )  \
)

`define SCM_BANK_INSTANCE \
tcdm_bank_i \
( \
  .clk_i   ( clk_a_i  ), \
  .rst_ni  ( rst_ni ), \
  .re_ni   ( ren    ), \
  .we_ni   ( wen    ), \
  .be_ni   ( ben    ), \
  .add_i   ( add    ), \
  .wdata_i ( wdata  ), \
  .rdata_o ( rdata  )  \
)

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


module tcdm_dp_banks_wrap
#(
  parameter BANK_SIZE = 256,   //- -> OVERRIDE
  parameter BANK_TYPE = "SCM", // --> OVERRIDE
  parameter NB_BANKS  = 1,     // --> OVERRIDE //8
  parameter RM_SIZE   = 3,     // only for SRAM
  parameter WM_SIZE   = 3      // only for SRAM
)
(
  input  logic               clk_a_i,
  input  logic               clk_b_i,
  input  logic               rst_ni,
  input  logic               init_ni,
  input  logic               stdby_i,
  input  logic               test_mode_i,

  // speed control for SRAMs
  input  logic [RM_SIZE-1:0] rm_i,
  input  logic [WM_SIZE-1:0] wm_i,
  input  logic               HS_i,
  input  logic               LS_i,

  TCDM_BANK_MEM_BUS.Slave    tcdm_slave[NB_BANKS-1:0],
  TCDM_BANK_MEM_BUS.Slave    tcdm_slave_b[NB_BANKS-1:0]
);

  

                         
  genvar i;
  generate
    for(i=0; i<NB_BANKS; i++) begin : banks_gen

      case(BANK_TYPE)

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // ███████╗████████╗██████╗  █████╗ ███████╗██████╗ ███████╗ ██████╗ ██╗        ███████╗██████╗  █████╗ ███╗   ███╗ //
      // ██╔════╝╚══██╔══╝╚════██╗██╔══██╗██╔════╝██╔══██╗██╔════╝██╔═══██╗██║        ██╔════╝██╔══██╗██╔══██╗████╗ ████║ //
      // ███████╗   ██║    █████╔╝╚█████╔╝█████╗  ██║  ██║███████╗██║   ██║██║        ███████╗██████╔╝███████║██╔████╔██║ //
      // ╚════██║   ██║   ██╔═══╝ ██╔══██╗██╔══╝  ██║  ██║╚════██║██║   ██║██║        ╚════██║██╔══██╗██╔══██║██║╚██╔╝██║ //
      // ███████║   ██║   ███████╗╚█████╔╝██║     ██████╔╝███████║╚██████╔╝██║███████╗███████║██║  ██║██║  ██║██║ ╚═╝ ██║ //
      // ╚══════╝   ╚═╝   ╚══════╝ ╚════╝ ╚═╝     ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ //
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      "ST28FDSOI_SRAM":
      begin : sram_bank_gen
        
        logic [31:0]                  wdata;
        logic [$clog2(BANK_SIZE)-1:0] add;
        logic                         csn;
        logic                         wen;
        logic  [3:0]                  ben;
        logic [31:0]                  wmn;
        logic [31:0]                  rdata;

        assign wdata = tcdm_slave[i].wdata;
        assign add   = tcdm_slave[i].add[$clog2(BANK_SIZE)-1:0];
        assign csn   = ~tcdm_slave[i].req;
        assign wen   = tcdm_slave[i].wen;
        assign ben   = ~tcdm_slave[i].be;
        assign wmn   = { {8{ben[3]}}, {8{ben[2]}}, {8{ben[1]}}, {8{ben[0]}} };
        assign tcdm_slave[i].rdata = rdata;

        case(BANK_SIZE)
            512: 
            begin : bank_512_gen
              st_tcdm_bank_512x32  #(.RM_SIZE(RM_SIZE), .WM_SIZE(WM_SIZE)) `ST28FDSOI_SRAM_BANK_INSTANCE;
            end

            1024:
            begin : bank_1024_gen
              st_tcdm_bank_1024x32 #(.RM_SIZE(RM_SIZE), .WM_SIZE(WM_SIZE)) `ST28FDSOI_SRAM_BANK_INSTANCE;
            end

            2048:
            begin : bank_2048_gen
              st_tcdm_bank_2048x32 #(.RM_SIZE(RM_SIZE), .WM_SIZE(WM_SIZE)) `ST28FDSOI_SRAM_BANK_INSTANCE;
            end

            default:
              begin : error_gen
              end
        endcase // BANK_SIZE

      end // ~ST28FDSOI_SRAM

      

      /////////////////////////////////
      // ███████╗ ██████╗███╗   ███╗ //
      // ██╔════╝██╔════╝████╗ ████║ //
      // ███████╗██║     ██╔████╔██║ //
      // ╚════██║██║     ██║╚██╔╝██║ //
      // ███████║╚██████╗██║ ╚═╝ ██║ //
      // ╚══════╝ ╚═════╝╚═╝     ╚═╝ //
      ///////////////////////////////// 
      "SCM" :
      begin : scm_bank_gen

        logic [31:0]                  wdata;
        logic [$clog2(BANK_SIZE)-1:0] add;
        logic                         wen;
        logic                         ren;
        logic [3:0]                   ben;
        logic [31:0]                  rdata;

        assign wdata = tcdm_slave[i].wdata;
        assign add   = tcdm_slave[i].add[$clog2(BANK_SIZE)-1:0];
        assign wen   = ~(tcdm_slave[i].req & ~tcdm_slave[i].wen);
        assign ren   = ~(tcdm_slave[i].req & tcdm_slave[i].wen);
        assign ben   = ~tcdm_slave[i].be;
        assign tcdm_slave[i].rdata = rdata;

        case(BANK_SIZE)
            128:
            begin : bank_128_gen
              scm_tcdm_bank_128x32 `SCM_BANK_INSTANCE;
            end

            256:
            begin : bank_256_gen
              scm_tcdm_bank_256x32 `SCM_BANK_INSTANCE;
            end

            default:
              begin : error_gen
              end
          endcase // BANK_SIZE

      end // ~SCM


      /////////////////////////////////////////////////////////////////////////////////////////
      // ██╗  ██╗██╗██╗     ██╗███╗   ██╗██╗  ██╗        ██████╗ ██████╗  █████╗ ███╗   ███╗ //
      // ╚██╗██╔╝██║██║     ██║████╗  ██║╚██╗██╔╝        ██╔══██╗██╔══██╗██╔══██╗████╗ ████║ //
      //  ╚███╔╝ ██║██║     ██║██╔██╗ ██║ ╚███╔╝         ██████╔╝██████╔╝███████║██╔████╔██║ //
      //  ██╔██╗ ██║██║     ██║██║╚██╗██║ ██╔██╗         ██╔══██╗██╔══██╗██╔══██║██║╚██╔╝██║ //
      // ██╔╝ ██╗██║███████╗██║██║ ╚████║██╔╝ ██╗███████╗██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║ //
      // ╚═╝  ╚═╝╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ //
      /////////////////////////////////////////////////////////////////////////////////////////                                                                                   
      "XILINX_BRAM":
      begin : bram_bank_gen
        logic                         rsta;
        logic                         ena;
        logic [31:0]                  wdataa;
        logic [$clog2(BANK_SIZE)-1:0] addra;
        logic  [3:0]                  wea;
        logic [31:0]                  rdataa;
        
        
        // logic                         rstb; // there is not a reset signal for the b port
        logic                         enb;
        logic [31:0]                  wdatab;
        logic [$clog2(BANK_SIZE)-1:0] addrb;
        logic  [3:0]                  web;
        logic [31:0]                  rdatab;

        assign rsta  = ~rst_ni;
        assign ena   = tcdm_slave[i].req;
        assign wdataa = tcdm_slave[i].wdata;
        assign addra   = tcdm_slave[i].add[$clog2(BANK_SIZE)-1:0];
        assign wea   = {4{tcdm_slave[i].req}} & {4{~tcdm_slave[i].wen}} & tcdm_slave[i].be;
        assign tcdm_slave[i].rdata = rdataa;
        
        
        assign enb   = tcdm_slave_b[i].req;
        assign wdatab = tcdm_slave_b[i].wdata;
        assign addrb   = tcdm_slave_b[i].add[$clog2(BANK_SIZE)-1:0];
        assign web   = {4{tcdm_slave_b[i].req}} & {4{~tcdm_slave_b[i].wen}} & tcdm_slave_b[i].be;
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
              xilinx_tcdm_bank_2048x32 `XILINX_BRAM_BANK_INSTANCE;
            end
            
            4096:
            begin : bank_4096_gen
              xilinx_tcdm_bank_4096x32 `XILINX_BRAM_BANK_INSTANCE;
            end
            
            8192:
            begin : bank_8192_gen
              xilinx_tcdm_bank_8192x32 `XILINX_BRAM_BANK_INSTANCE;
            end

            default 
            begin : error_gen
            end
        endcase // BANK_SIZE

      end //~ XILINX_BRAM

      default: 
        begin : error_gen
        end // NO legal BANK_TYPE specified
        
    endcase // ~BANK_TYPE
  end // for Loop --> 0 to NB_BANKS-1

  endgenerate 
  



  /////////////////////////////////////////////////////////////////////////////////////////////
  // ██████╗  █████╗ ██████╗  █████╗ ███╗   ███╗     ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗ //
  // ██╔══██╗██╔══██╗██╔══██╗██╔══██╗████╗ ████║    ██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝ //
  // ██████╔╝███████║██████╔╝███████║██╔████╔██║    ██║     ███████║█████╗  ██║     █████╔╝  //
  // ██╔═══╝ ██╔══██║██╔══██╗██╔══██║██║╚██╔╝██║    ██║     ██╔══██║██╔══╝  ██║     ██╔═██╗  //
  // ██║     ██║  ██║██║  ██║██║  ██║██║ ╚═╝ ██║    ╚██████╗██║  ██║███████╗╚██████╗██║  ██╗ //
  // ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝ //
  /////////////////////////////////////////////////////////////////////////////////////////////
  //synopsys translate_off
  initial
  begin
    if( ~((BANK_TYPE != "SCM") || (BANK_TYPE != "ST28FDSOI_SRAM") || (BANK_TYPE != "XILINX_BRAM")))
            $error("Unsupported BANK_TYPE --> %s.", BANK_TYPE);

    
    if(BANK_TYPE == "SCM")
        if(( BANK_SIZE == 128)  || (BANK_SIZE == 256) )
            $display("Found a SCM bank with legal size [%d]", BANK_SIZE);
        else
            $error("Unsupported SCM bank size %d.", BANK_SIZE);


    if(BANK_TYPE == "ST28FDSOI_SRAM") 
        if(( BANK_SIZE == 512)  || (BANK_SIZE == 1024) || (BANK_SIZE == 2048) )
            $display("Found a ST28FDSOI_SRAM bank with legal size [%d]", BANK_SIZE);
        else
            $error("Unsupported ST28FDSOI_SRAM bank size %d.", BANK_SIZE);


    if(BANK_TYPE == "XILINX_BRAM") 
        if(( BANK_SIZE == 128)  || (BANK_SIZE == 256) || ( BANK_SIZE == 512)  || (BANK_SIZE == 1024) || (BANK_SIZE == 2048) || (BANK_SIZE == 4096) || (BANK_SIZE == 8192))
            $display("Found a XILINX_BRAM bank with legal size [%d]", BANK_SIZE);
        else
            $error("Unsupported XILINX_BRAM bank size %d.", BANK_SIZE);

  end
  //synopsys translate_on


endmodule

