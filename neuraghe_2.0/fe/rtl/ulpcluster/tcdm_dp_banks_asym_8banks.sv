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


`define XILINX_BRAM_BANK_INSTANCE_X \
tcdm_bank_i_x \
( \
  .clka  ( clk_a_i ), \
  .ena   ( ena_x   ), \
  .wea   ( wea_x   ), \
  .addra ( addra_x ), \
  .dina  ( wdataa_x ), \
  .clkb  ( clk_b_i ), \
  .enb   ( enb_x   ), \
  .addrb ( addrb_x ), \
  .doutb ( rdatab_x)  \
)

`define XILINX_BRAM_BANK_INSTANCE_Y \
tcdm_bank_i_y \
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

typedef struct packed {
   logic [15:0] wdata;
   logic [10:0] add;
   logic        req;
   logic [1:0]  wen;
   logic [1:0]  be;
} tcdm_port_a;

typedef struct packed {
   logic [10:0] add;
   logic [2:0]  bank;
   logic [13:0] add_all;
   logic        req;
   logic [15:0] rdata;
   logic [15:0] wdata;
} tcdm_port_b;

/*typedef struct packed {
   logic [63:0] wdata;
   logic [31:0] add;
   logic        req;
   logic        wen;
   logic [7:0]  be;
   logic [63:0] rdata;
} tcdm_port_y;*/

module tcdm_dp_banks_asym
#(
  parameter BANK_SIZE     = 256,   //- -> OVERRIDE
  parameter NB_BANKS      = 1,     // --> OVERRIDE //8
  parameter NPX           = 4,
  parameter DATA_WIDTH_A  = 64,
  parameter DATA_WIDTH_Ax = 16,
  parameter DATA_WIDTH_B  = 16*NPX, //32
  parameter DATA_WIDTH_Bx = 16,
  parameter NB_BANKS_DSP  = 8,
  parameter BANK_SIZE_DSP = 2048,
  parameter N_COL         = 12
)
(
  input  logic                  clk_a_i,
  input  logic                  clk_b_i,
  input  logic                  rst_ni,

  TCDM_BANK_MEM_BUS_64BIT.Slave   tcdm_slave  [NB_BANKS-1:0],
  //TCDM_BANK_MEM_BUS.Slave       tcdm_slave_b[NB_BANKS-1:0]
  TCDM_BANK_MEM_BUS_16.Slave      tcdm_slave_b[NB_BANKS*NPX-1:0]//[NPX-1:0]
);

  localparam BYTES_A  = DATA_WIDTH_A/8;
  localparam BYTES_Ax = DATA_WIDTH_Ax/8;
  
  localparam BYTES_B  = DATA_WIDTH_B/8;
  
  localparam BANK_SIZE_B  = BANK_SIZE * DATA_WIDTH_A/DATA_WIDTH_B;
  localparam BANK_SIZE_Bx = BANK_SIZE_DSP * DATA_WIDTH_Ax/DATA_WIDTH_Bx;
  
  tcdm_port_a  tcdm_slave_xa  [N_COL-1:0][NB_BANKS_DSP-1:0];
  tcdm_port_b  tcdm_slave_xb  [N_COL-1:0][NB_BANKS_DSP-1:0];
  tcdm_port_b  tcdm_slave_b_int   [NB_BANKS-1:0][NPX-1:0];
  
  //tcdm_port_y  slave_y_int   [NB_BANKS-1:0];
  
  logic [N_COL-1:0][NPX-1:0][$clog2(NB_BANKS_DSP)-1:0] index;
  logic [N_COL-1:0][NPX-1:0][$clog2(NB_BANKS_DSP)-1:0] index_del;
  
//  logic [NB_BANKS-1:0][DATA_WIDTH_B-1:0] tcdm_slave_rdatab64;
//  logic [NB_BANKS-1:0][DATA_WIDTH_B-1:0] tcdm_slave_wdatab64;
  
             
  genvar i,j,b;
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
      
      //only to read data buses during sim 
    /*  assign slave_y_int[i].req   = tcdm_slave[i].req;
        assign slave_y_int[i].wdata = tcdm_slave[i].wdata;
        assign slave_y_int[i].add   = tcdm_slave[i].add[$clog2(BANK_SIZE)-1:0];
        assign slave_y_int[i].wen   = tcdm_slave[i].wen;
        assign slave_y_int[i].rdata = tcdm_slave[i].rdata; */
       
       for(j=0; j<NPX; j++)begin                                                                             
          assign tcdm_slave_b_int[i][j].req     = tcdm_slave_b[i*NPX+j].req;
          assign tcdm_slave_b_int[i][j].add_all = tcdm_slave_b[i*NPX+j].add;
          assign tcdm_slave_b_int[i][j].add     = tcdm_slave_b[i*NPX+j].add[$clog2(BANK_SIZE_Bx*NB_BANKS_DSP)-1:$clog2(NB_BANKS_DSP)];
          assign tcdm_slave_b_int[i][j].bank    = tcdm_slave_b[i*NPX+j].add[$clog2(NB_BANKS_DSP)-1:0];
          assign tcdm_slave_b_int[i][j].rdata   = tcdm_slave_b[i*NPX+j].rdata;
          assign tcdm_slave_b_int[i][j].wdata   = tcdm_slave_b[i*NPX+j].wdata;
        end  
          
        
        if(i<N_COL) begin
        
        always_ff @(posedge clk_b_i or negedge rst_ni) begin
          if(~rst_ni)
            index_del[i] <= 0;
          else
            index_del[i] <= index[i];
        end
        for(j=0; j<NPX; j++)begin
          assign index[i][j] = tcdm_slave_b[i*NPX+j].add[$clog2(NB_BANKS_DSP)-1:0];
          assign tcdm_slave_b[i*NPX+j].rdata = tcdm_slave_xb[i][index_del[i][j]].rdata;
        end
        
          for(b=0; b<NB_BANKS_DSP; b++)begin
              logic                             ena_x;
              logic [DATA_WIDTH_Ax-1:0]         wdataa_x;
              logic [$clog2(BANK_SIZE_DSP)-1:0] addra_x;
              logic [(DATA_WIDTH_Ax/8)-1:0]     wea_x;
              
              logic                             en0;
              logic                             en1;

              logic                             enb_x;
              logic [$clog2(BANK_SIZE_Bx)-1:0]  addrb_x;
              logic [DATA_WIDTH_Bx-1:0]         rdatab_x;
              
              logic [$clog2(NPX)-1:0]           sel;
              logic                             en;
              
                            
              always_comb begin
                 //tcdm_slave_xa[i][b].req   = (tcdm_slave[i].add[0]) ? 1'b0 : tcdm_slave[i].req;
                 if(tcdm_slave[i].add[0] == 1'b0) begin
                  en0=1'b1;
                  en1=1'b0;
                 end
                 else begin
                  en0=1'b0;
                  en1=1'b1;
                 end
              end
                
                if(b<NB_BANKS_DSP/2) begin
                  assign tcdm_slave_xa[i][b].req   = tcdm_slave[i].req & en0;
                  assign tcdm_slave_xa[i][b].wdata = tcdm_slave[i].wdata[(b+1)*DATA_WIDTH_Ax-1:b*DATA_WIDTH_Ax];
                  assign tcdm_slave_xa[i][b].be    = tcdm_slave[i].be[(b*BYTES_Ax)+1:b*BYTES_Ax];
                end
                else begin
                  assign tcdm_slave_xa[i][b].req   = tcdm_slave[i].req & en1;
                  assign tcdm_slave_xa[i][b].wdata = tcdm_slave[i].wdata[((b-(NB_BANKS_DSP/2))+1)*DATA_WIDTH_Ax-1:(b-(NB_BANKS_DSP/2))*DATA_WIDTH_Ax];
                  assign tcdm_slave_xa[i][b].be    = tcdm_slave[i].be[((b-(NB_BANKS_DSP/2))*BYTES_Ax)+1:(b-(NB_BANKS_DSP/2))*BYTES_Ax];
                end            
                
                assign tcdm_slave_xa[i][b].add   = tcdm_slave[i].add[$clog2(BANK_SIZE)-1:1];
                assign tcdm_slave_xa[i][b].wen   = tcdm_slave[i].wen;
                   
                assign ena_x    = tcdm_slave_xa[i][b].req; 
                assign wdataa_x = tcdm_slave_xa[i][b].wdata; 
                assign addra_x  = tcdm_slave_xa[i][b].add;
                assign wea_x    = {(BYTES_Ax){tcdm_slave_xa[i][b].req}} & {(BYTES_Ax){~tcdm_slave_xa[i][b].wen}} & tcdm_slave_xa[i][b].be;
               
                always_comb begin
                en = 1'b0;
		            sel = {$clog2(NPX){1'bx}};
                for(int k=0; k<NPX; k++)begin
                    if(b == tcdm_slave_b_int[i][k].bank)begin
                      sel = k;
                      en  = 1'b1;
                    end
                end
                end
                
               assign tcdm_slave_xb[i][b].bank = tcdm_slave_b_int[i][sel].bank;
               
               assign tcdm_slave_xb[i][b].req = tcdm_slave_b_int[i][sel].req && en;
               assign tcdm_slave_xb[i][b].add = tcdm_slave_b_int[i][sel].add;
               
               assign tcdm_slave_xb[i][b].add_all = tcdm_slave_b_int[i][sel].add_all;
                
               assign enb_x    = tcdm_slave_xb[i][b].req;
               assign addrb_x  = tcdm_slave_xb[i][b].add;
               assign tcdm_slave_xb[i][b].rdata = rdatab_x;
               
              case(BANK_SIZE_DSP)
                1024:
                begin
                  xilinx_tcdm_bank_1024x16_16_Sdp  `XILINX_BRAM_BANK_INSTANCE_X;
                end
                2048:  
                begin      
                  xilinx_tcdm_bank_2048x16_16_Sdp  `XILINX_BRAM_BANK_INSTANCE_X;
                end
                default:
                begin
                end
              endcase
          end         
        end
        
        else begin          
          
          logic                         rsta;
          logic                         ena;
          logic [DATA_WIDTH_A-1:0]      wdataa;
          logic [$clog2(BANK_SIZE)-1:0] addra;
          logic [DATA_WIDTH_A/8-1:0]    wea;
          logic [DATA_WIDTH_A-1:0]      rdataa;
          
          logic                           enb;
          logic [DATA_WIDTH_B-1:0]        wdatab;
          logic [$clog2(BANK_SIZE_B)-1:0] addrb;
          logic [DATA_WIDTH_B/8-1:0]      web;
          
          logic [DATA_WIDTH_B-1:0]        rdatab;
          
            assign rsta   = ~rst_ni;
            assign ena    = tcdm_slave[i].req;
            assign wdataa = tcdm_slave[i].wdata;
            assign addra  = tcdm_slave[i].add[$clog2(BANK_SIZE)-1:0];
            assign wea    = {BYTES_A{tcdm_slave[i].req}} & {BYTES_A{~tcdm_slave[i].wen}} & tcdm_slave[i].be;
            assign tcdm_slave[i].rdata = rdataa;
            
            for(j=0; j<NPX; j++)begin   
              assign wdatab[((j+1)*DATA_WIDTH_Bx)-1 : j*DATA_WIDTH_Bx] = tcdm_slave_b[i*NPX+j].wdata; 
              assign tcdm_slave_b[i*NPX+j].rdata = rdatab[((j+1)*DATA_WIDTH_Bx)-1 : j*DATA_WIDTH_Bx];
            end
          
            assign enb    = tcdm_slave_b[i*NPX+0].req;
            assign addrb  = tcdm_slave_b[i*NPX+0].add[$clog2(BANK_SIZE_B)-1:0];
            assign web    = {BYTES_B{tcdm_slave_b[i*NPX+0].req}} & {BYTES_B{~tcdm_slave_b[i*NPX+0].wen}} & {DATA_WIDTH_B/DATA_WIDTH_Bx{tcdm_slave_b[i*NPX+0].be}};
          
          case(NPX)
            1:
            begin
              case(BANK_SIZE)
              2048:
              begin
                xilinx_tcdm_bank_2048x64_16_asym `XILINX_BRAM_BANK_INSTANCE_Y;
              end
              4096:
              begin
                xilinx_tcdm_bank_4096x64_16_asym `XILINX_BRAM_BANK_INSTANCE_Y;
              end
            endcase
            end
            4:
            begin
              case(BANK_SIZE)
              2048:
              begin
                xilinx_tcdm_bank_2048x64_64      `XILINX_BRAM_BANK_INSTANCE_Y;
              end
              4096:
              begin
                xilinx_tcdm_bank_4096x64_64      `XILINX_BRAM_BANK_INSTANCE_Y;
              end
              default:
              begin
              end
            endcase
            end
            default:
            begin
            end
          endcase
        end
        
        
        
//        case(BANK_SIZE)
//            128: 
//            begin : bank_128_gen
//              xilinx_tcdm_bank_128x32 `XILINX_BRAM_BANK_INSTANCE;
//            end

//            256: 
//            begin : bank_256_gen
//              xilinx_tcdm_bank_256x32 `XILINX_BRAM_BANK_INSTANCE;
//            end
//            
//            512:
//             begin : bank_512_gen
//              xilinx_tcdm_bank_512x32 `XILINX_BRAM_BANK_INSTANCE;
//            end
//            
//            1024: 
//            begin : bank_1024_gen
//              xilinx_tcdm_bank_1024x32 `XILINX_BRAM_BANK_INSTANCE;
//            end
//            
//            2048:
//            begin : bank_2048_gen
//              xilinx_tcdm_bank_2048x64_asym `XILINX_BRAM_BANK_INSTANCE;
//            end
//                        
//            4096: // Y banks size
////            begin : bank_4096_asym_gen
////              xilinx_tcdm_bank_4096x64_asym `XILINX_BRAM_BANK_INSTANCE;
////            end
//            begin : bank_4096_16_asym_gen
//              xilinx_tcdm_bank_2048x16_16_Sdp  `XILINX_BRAM_BANK_INSTANCE_X;
//              xilinx_tcdm_bank_4096x64_16_asym `XILINX_BRAM_BANK_INSTANCE_Y;
//            end

//            default 
//            begin : error
//            end
//        endcase // BANK_SIZE
    
  end // for Loop --> 0 to NB_BANKS-1

  endgenerate 
  

endmodule

