////////////////////////////////////////////////////////////////////////////////
// Company:        Multitherman Laboratory @ DEIS - University of Bologna     //
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Davide Rossi - davide.rossi@unibo.it                       //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    13/02/2013                                                 // 
// Design Name:    memwrap32_028                                              // 
// Module Names:   - st_ic_ram_2048x32                                        //
//                 - st_ic_tag_512x20                                         //
//                 - st_tcdm_bank_2048x32                                     //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Wrappers for ULPSoC memories                               //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "ulpsoc_defines.sv"




//********************************************************
//************* L2 RAM MEMORY WRAPPER ********************
//********************************************************


module st_l2_mem_8192x64
#(
    parameter FLIPWELL = 0,
    parameter RM_SIZE  = 4,
    parameter WM_SIZE  = 4
)
(
    input logic           CLK,
    input logic           RSTN,
    input logic           INITN,

    input logic           CEN,
    input logic           WEN,
    input logic [12:0]    A,
    input logic [63:0]    D,
    input logic [7:0]     BE,
    output logic [63:0]   Q,
    input logic [WM_SIZE-1:0]     WM,
    input logic [RM_SIZE-1:0]     RM,

    input logic           TM,

    input logic           LS,
    input logic           HS,
    input logic           STDBY
);

   logic [3:0]            s_cen;
   logic [3:0]            s_wen;
   logic [1:0]            s_addr_sync; //4 way --> 2 bit
   logic [63:0]           s_wmn;
   logic [3:0][63:0]      s_q;
   genvar                 i,j;

   // GENERATION OF WRITE MASK
   generate
      for (i=0; i<8; i++)
        begin
           for (j=0; j<8; j++)
             begin
                assign s_wmn[i*8+j] = ~BE[i];
             end
        end
   endgenerate

   // GENERATION OF CEN
   always_comb
     begin
        s_cen = 4'b1111;

        if (CEN == 1'b0)
          case (A[12:11])
            2'b00:
              s_cen[0] = 1'b0;
            2'b01:
              s_cen[1] = 1'b0;
            2'b10:
              s_cen[2] = 1'b0;
            2'b11:
              s_cen[3] = 1'b0;

          endcase
     end

   // GENERATION OF WEN
   always_comb
     begin
        s_wen = 4'b1111;
        if (WEN == 1'b0)
          case (A[12:11])
            2'b00:
              s_wen[0] = 1'b0;
            2'b01:
              s_wen[1] = 1'b0;
            2'b10:
              s_wen[2] = 1'b0;
            2'b11:
              s_wen[3] = 1'b0;
          endcase
     end

   //REGISTER FOR ADDRESS DELAY
   always_ff @ (posedge CLK, negedge RSTN)
     begin
        if (RSTN == 1'b0)
          s_addr_sync <= 2'b00;
        else
          s_addr_sync <= A[12:11];
     end


   // OUTPUT MUX
   always_comb
     begin
        case (s_addr_sync)
          2'b00:
            begin
               Q[31:0] = s_q[0][31:0];
               Q[63:32] = s_q[0][63:32];
            end
          2'b01:
            begin
               Q[31:0] = s_q[1][31:0];
               Q[63:32] = s_q[1][63:32];
            end
          2'b10:
            begin
               Q[31:0] = s_q[2][31:0];
               Q[63:32] = s_q[2][63:32];
            end
          2'b11:
            begin
               Q[31:0] = s_q[3][31:0];
               Q[63:32] = s_q[3][63:32];
            end
        endcase
     end

   // MEMORY CUTS
   generate
      for (i=0; i<4; i++)
      begin: cut
          //ST_SPHD_LOVOLT_2048x32m8_bTl cut_lo
          ST_SPHD_LOVOLT_2048x32m8_bTMl cut_lo
          (
              .A       ( A[10:0]      ),
              .ATP     ( TM           ),
              .CK      ( CLK          ),
              .CSN     ( s_cen[i]     ),
              .D       ( D[31:0]      ),
              .HS      ( HS           ),
              .IG      ( STDBY        ),
              .INITN   ( INITN        ),
              .LS      ( LS           ),
              .M       ( s_wmn[31:0]  ),
              .Q       ( s_q[i][31:0] ),
              .SCTRLI  ( '0           ),
              .SCTRLO  (              ),
              .SDLI    ( '0           ),
              .SDLO    (              ),
              .SDRI    ( '0           ),
              .SDRO    (              ),
              .SE      ( '0           ),
              .SMLI    ( '0           ),
              .SMLO    (              ),
              .SMRI    ( '0           ),
              .SMRO    (              ),
              .STDBY   ( STDBY        ),
              .TA      ( '0           ),
              .TBIST   ( '0           ),
              .TBYPASS ( '0           ),
              .TCSN    ( '0           ),
              .TED     ( '0           ),
              .TEM     ( '0           ),
              .TOD     ( '0           ),
              .TOM     ( '0           ),
              .TWEN    ( '0           ),
              .WEN     ( s_wen[i]     ),
              .RM      ( RM           ),
              .WM      ( WM           )
          );



          //ST_SPHD_LOVOLT_2048x32m8_bTl cut_hi
          ST_SPHD_LOVOLT_2048x32m8_bTMl cut_hi
          (
              .A       ( A[10:0]      ),
              .ATP     ( TM           ),
              .CK      ( CLK          ),
              .CSN     ( s_cen[i]     ),
              .D       ( D[63:32]     ),
              .HS      ( HS           ),
              .IG      ( STDBY        ),
              .INITN   ( INITN        ),
              .LS      ( LS           ),
              .M       ( s_wmn[63:32] ),
              .Q       ( s_q[i][63:32]),
              .SCTRLI  ( '0           ),
              .SCTRLO  (              ),
              .SDLI    ( '0           ),
              .SDLO    (              ),
              .SDRI    ( '0           ),
              .SDRO    (              ),
              .SE      ( '0           ),
              .SMLI    ( '0           ),
              .SMLO    (              ),
              .SMRI    ( '0           ),
              .SMRO    (              ),
              .STDBY   ( STDBY        ),
              .TA      ( '0           ),
              .TBIST   ( '0           ),
              .TBYPASS ( '0           ),
              .TCSN    ( '0           ),
              .TED     ( '0           ),
              .TEM     ( '0           ),
              .TOD     ( '0           ),
              .TOM     ( '0           ),
              .TWEN    ( '0           ),
              .WEN     ( s_wen[i]     ),
              .RM      ( RM           ),
              .WM      ( WM           )
          );
      end
   endgenerate

endmodule





//********************************************************
//************* L2 RAM MEMORY WRAPPER ********************
//********************************************************

module st_l2_mem_4096x64
#(
    parameter FLIPWELL = 0
)
(
   input logic 	       CLK,
   input logic 	       RSTN,
   input logic 	       INITN,
   
   input logic 	       CEN,
   input logic 	       WEN,
   input logic [11:0]  A,
   input logic [63:0]  D,
   input logic [7:0]   BE,
   output logic [63:0] Q,
   input logic [1:0]   WM,
   input logic [2:0]   RM,
   
   input logic	       TM
   
   );
   
   logic [1:0] 	       s_cen;
   logic [1:0] 	       s_wen;
   logic 	       s_addr_sync;
   logic [63:0]        s_wmn;
   logic [1:0][63:0]   s_q;
   genvar 	       i,j;
   
   // GENERATION OF WRITE MASK
   generate
      for (i=0; i<8; i++)
	begin
	   for (j=0; j<8; j++)
	     begin
		assign s_wmn[i*8+j] = ~BE[i];
	     end
	end
   endgenerate
   
   // GENERATION OF CEN
   always_comb
     begin
	s_cen = 2'b11;
	if (CEN == 1'b0)
	  case (A[11])
	    1'b0:
	      s_cen[0] = 1'b0;
	    1'b1:
	      s_cen[1] = 1'b0;	    
	  endcase
     end
   
   // GENERATION OF WEN
   always_comb
     begin
	s_wen = 2'b11;
	if (WEN == 1'b0)
	  case (A[11])
	    1'b0:
	      s_wen[0] = 1'b0;
	    1'b1:
	      s_wen[1] = 1'b0;
	  endcase
     end
   
   
   //REGISTER FOR ADDRESS DELAY
   always_ff @ (posedge CLK, negedge RSTN)
     begin
	if (RSTN == 1'b0)
	  s_addr_sync <= 1'b0;
	else
	  s_addr_sync <= A[11];
     end

   
   // OUTPUT MUX
   always_comb
     begin
	case (s_addr_sync)
	  1'b0:
	    begin
	       Q[31:0] = s_q[0][31:0];
	       Q[63:32] = s_q[0][63:32];
	    end
	  1'b1:
	    begin
	       Q[31:0] = s_q[1][31:0];
	       Q[63:32] = s_q[1][63:32];
	    end
	  
	endcase
	
     end
   
   // MEMORY CUTS
   generate
      
      if ( FLIPWELL ==  0 )

	begin : rvt
	   
	   for (i=0; i<2; i++)
	      
	     begin: cut
		
		ST_SPHD_LOLEAK_2048x32m8_bTl cut_lo
		  (
		   .SCTRLO(),
		   .SE(1'b0),
		   .SCTRLI(1'b0),
		   .CK(CLK),
		   .CSN(s_cen[i]),
		   .INITN(INITN),
		   .IG(1'b0),
		   .ATP(TM),
		   .A(A[10:0]),
		   .Q(s_q[i][31:0]),
		   .TA(11'd0),
		   .TBIST(1'b0),
		   .TCSN(1'b0),
		   .STDBY(1'b0),
		   .SDLO(),
		   .SDRO(),
		   .SMLO(),
		   .SMRO(),
		   .D(D[31:0]),
		   .M(s_wmn[31:0]),
		   .WEN(s_wen[i]),
		   .SDLI(1'b0),
		   .SDRI(1'b0),
		   .SMLI(1'b0),
		   .SMRI(1'b0),
		   .TWEN(1'b0),
		   .TED(1'b0),
		   .TOD(1'b0),
		   .TEM(1'b0),
		   .TOM(1'b0),
		   .TBYPASS(1'b0),
		   .SLEEP(1'b0),
		   .WM(WM),
		   .RM(RM)
		   );
		
		ST_SPHD_LOLEAK_2048x32m8_bTl cut_hi
		  (
		   .SCTRLO(),
		   .SE(1'b0),
		   .SCTRLI(1'b0),
		   .CK(CLK),
		   .CSN(s_cen[i]),
		   .INITN(INITN),
		   .IG(1'b0),
		   .ATP(TM),
		   .A(A[10:0]),
		   .Q(s_q[i][63:32]),
		   .TA(11'd0),
		   .TBIST(1'b0),
		   .TCSN(1'b0),
		   .STDBY(1'b0),
		   .SDLO(),
		   .SDRO(),
		   .SMLO(),
		   .SMRO(),
		   .D(D[63:32]),
		   .M(s_wmn[63:32]),
		   .WEN(s_wen[i]),
		   .SDLI(1'b0),
		   .SDRI(1'b0), 
		   .SMLI(1'b0),
		   .SMRI(1'b0),
		   .TWEN(1'b0),
		   .TED(1'b0),
		   .TOD(1'b0),
		   .TEM(1'b0),
		   .TOM(1'b0),
		   .TBYPASS(1'b0),
		   .SLEEP(1'b0),
		   .WM(WM),
		   .RM(RM)
		   );
	     end
	end
      else
	begin : lvt
	   for (i=0; i<2; i++)
	      
	     begin : cut
		
		ST_SPL1CACHE_HIPERF_2048x32m4_baTMol cut_lo
		  (
		   .A(A[10:0]),
		   .ATP(TM),
		   .CK(CLK),
		   .CSN(s_cen[i]),
		   .D(D[31:0]),
		   .HS('0),
		   .IG('0),
		   .INITN(INITN),
		   .LS('0),
		   .M(s_wmn[31:0]), 
		   .Q(s_q[i][31:0]),
		   .RM(RM),
		   .SCTRLI('0),
		   .SCTRLO(),
		   .SDLI('0),
		   .SDLO(),
		   .SDRI('0),
		   .SDRO(),
		   .SE('0),
		   .SLEEP('0),
		   .SMLI('0),
		   .SMLO(),
		   .SMRI('0),
		   .SMRO(),
		   .STDBY('0),
		   .TA('0),
		   .TBIST('0),
		   .TCSN('0), 
		   .TED('0),
		   .TEM('0),
		   .TOD('0),
		   .TOM('0),
		   .TWEN('0),
		   .WEN(s_wen[i]),
		   .WM(WM)
		   );
		
		ST_SPL1CACHE_HIPERF_2048x32m4_baTMol cut_hi
		  (
		   .A(A[10:0]),
		   .ATP(TM),
		   .CK(CLK),
		   .CSN(s_cen[i]),
		   .D(D[63:32]),
		   .HS('0),
		   .IG('0),
		   .INITN(INITN),
		   .LS('0),
		   .M(s_wmn[63:32]), 
		   .Q(s_q[i][63:32]),
		   .RM(RM),
		   .SCTRLI('0),
		   .SCTRLO(),
		   .SDLI('0),
		   .SDLO(),
		   .SDRI('0),
		   .SDRO(),
		   .SE('0),
		   .SLEEP('0),
		   .SMLI('0),
		   .SMLO(),
		   .SMRI('0),
		   .SMRO(),
		   .STDBY('0),
		   .TA('0),
		   .TBIST('0),
		   .TCSN('0), 
		   .TED('0),
		   .TEM('0),
		   .TOD('0),
		   .TOM('0),
		   .TWEN('0),
		   .WEN(s_wen[i]),
		   .WM(WM)
		   );
		
	     end
	   
	end
      
   endgenerate
   
endmodule

//********************************************************
//************* IC RAM MEMORY WRAPPER ********************
//********************************************************

module ic_ram_128x32
   (
    input  logic        clk_i,
    
    input  logic        re_ni,
    input  logic        we_ni,
    input  logic [3:0]  be_ni,
    
    input  logic [6:0]  add_i,
    
    input  logic [31:0] wdata_i,
    output logic [31:0] rdata_o
    
    );
   
`ifdef SCM_IMPLEMENTED
   
   latchram_WORDS128_WS32
   scm_i
     (
      .ClkxCI(clk_i),
      
      .RExSBI(re_ni),
      .RAddrxDI(add_i),
      .RDataxDO(rdata_o),
      
      //-- Write port
      .WExSBI(we_ni),
      .BExSBI(be_ni),
      .WAddrxDI(add_i),
      .WDataxDI(wdata_i)
      );
   
`else // FUNCTIONAL MODEL TO SPEEDUP SIMULATION
   
   generic_memory
     #(
       .ADDR_WIDTH(7)
       )
   scm_i
     (
      .CLK(clk_i),
      .INITN(1'b1),
      
      .CEN(re_ni & we_ni),
      .A(add_i),
      .WEN(we_ni),
      .D(wdata_i),
      .BEN(be_ni),
      
      .Q(rdata_o)
      );
   
`endif
   
endmodule

//********************************************************
//************* IC TAG MEMORY WRAPPER ********************
//********************************************************

module st_ic_tag_32x24
  #(
    parameter FLIPWELL = 0
    )
   (
    input  logic        CLK,
    input  logic        INITN,
    
    input  logic        CEN,
    input  logic        WEN,
    input  logic [4:0]  A,
    input  logic [23:0] D,
    input  logic [3:0]  BEN,
    output logic [23:0] Q,
   
   input logic	       TM
    );
   
   // MEMORY CUTS
   generate
      
      if ( FLIPWELL ==  0 )
	
	begin : rvt
	   
	   ST_SPREG_LOLEAK_32x24m2_Tl cut
	     (
	      .CK(CLK),
	      .CSN(CEN),
	      .INITN(INITN),
	      .A(A),
	      .Q(Q),
	      .D(D),
	      .WEN(WEN),
	      .TA(5'd0),
	      .TBIST(1'b0),
	      .TCSN(1'b0),
	      .STDBY(1'b0),
	      .IG(1'b0),
	      .ATP(TM),
	      .SE(1'b0),
	      .SCTRLI(1'b0),
	      .SCTRLO(),
	      .SDLI(1'b0),
	      .SDRI(1'b0), 
	      .TWEN(1'b0),
	      .TED(1'b0),
	      .TOD(1'b0), 
	      .SDLO(),
	      .SDRO(),
	      .TBYPASS(1'b0),
	      .SLEEP(1'b0),
	      .WM('0),
	      .RM('0)
	      );
	   
	end
      
      else
	
	begin
	   
	   ST_SPL1CACHE_HIPERF_32x24m2_baTMol cut
	     (
	      .A(A),
	      .ATP(TM),
	      .CK(CLK),
	      .CSN(CEN),
	      .D(D),
	      .HS('0),
	      .IG('0),
	      .INITN(INITN),
	      .LS('0),
	      .M('0), 
	      .Q(Q),
	      .RM('0),
	      .SCTRLI('0),
	      .SCTRLO(),
	      .SDLI('0),
	      .SDLO(),
	      .SDRI('0),
	      .SDRO(),
	      .SE('0),
	      .SLEEP('0),
	      .SMLI('0),
	      .SMLO(),
	      .SMRI('0),
	      .SMRO(),
	      .STDBY('0),
	      .TA('0),
	      .TBIST('0),
	      .TCSN('0),
	      .TED('0),
	      .TEM('0),
	      .TOD('0),
	      .TOM('0),
	      .TWEN('0),
	      .WEN(WEN),
	      .WM('0)
	      );
	   
	end
      
   endgenerate
   
endmodule

//********************************************************
//********** TCDM MEMORY BANK WRAPPER ********************
//********************************************************

module st_tcdm_bank_2048x32
#(
    parameter                 RM_SIZE = 3,
    parameter                 WM_SIZE = 3
)
(
    input logic               CLK,
    input logic               RSTN,
    input logic               INITN,
    input logic               STDBY,

    input logic               CSN,
    input logic               WEN,
    input logic  [31:0]       WMN,
    input logic  [RM_SIZE-1:0] RM,
    input logic  [WM_SIZE-1:0] WM,
    input logic               HS, // high Speed
    input logic               LS, // low Speed
    input logic  [10:0]       A,
    input logic  [31:0]       D,
    output logic [31:0]       Q,

    input logic               TM
);

    logic [1:0]               local_csn;
    logic [1:0]               destination_Q;
    logic [1:0][31:0]         read_data;

    always_ff @(posedge CLK)
    begin
        destination_Q <= A[10];
    end
    assign Q = (destination_Q) ? read_data[1] : read_data[0];

    assign local_csn[0] = (A[10]==1'b0) ? CSN : 1'b1;
    assign local_csn[1] = (A[10]==1'b1) ? CSN : 1'b1;


    //ST_SPHD_LOVOLT_1024x32m4_bTl  cut0
    ST_SPHD_LOVOLT_1024x32m4_bTMl cut0
    (
        .A       ( A[9:0]  ),
        .ATP     ( TM     ),
        .CK      ( CLK    ),
        .CSN     ( local_csn[0]    ),
        .D       ( D      ),
        .HS      ( HS     ),
        .IG      ( STDBY  ),
        .INITN   ( INITN  ),
        .LS      ( LS     ),
        .M       ( WMN    ),
        .Q       ( read_data[0]      ),
        .SCTRLI  ( '0     ),
        .SCTRLO  (        ),
        .SDLI    ( '0     ),
        .SDLO    (        ),
        .SDRI    ( '0     ),
        .SDRO    (        ),
        .SE      ( '0     ),
        .SMLI    ( '0     ),
        .SMLO    (        ),
        .SMRI    ( '0     ),
        .SMRO    (        ),
        .STDBY   ( STDBY  ),
        .TA      ( '0     ),
        .TBIST   ( '0     ),
        .TBYPASS ( '0     ),
        .TCSN    ( '0     ),
        .TED     ( '0     ),
        .TEM     ( '0     ),
        .TOD     ( '0     ),
        .TOM     ( '0     ),
        .TWEN    ( '0     ),
        .WEN     ( WEN    ),
        .RM      ( RM     ),
        .WM      ( WM     )
    );

    //ST_SPHD_LOVOLT_1024x32m4_bTl cut1
    ST_SPHD_LOVOLT_1024x32m4_bTMl  cut1
    (
        .A       ( A[9:0]  ),
        .ATP     ( TM     ),
        .CK      ( CLK    ),
        .CSN     ( local_csn[1]    ),
        .D       ( D      ),
        .HS      ( HS     ),
        .IG      ( STDBY  ),
        .INITN   ( INITN  ),
        .LS      ( LS     ),
        .M       ( WMN    ),
        .Q       ( read_data[1]      ),
        .SCTRLI  ( '0     ),
        .SCTRLO  (        ),
        .SDLI    ( '0     ),
        .SDLO    (        ),
        .SDRI    ( '0     ),
        .SDRO    (        ),
        .SE      ( '0     ),
        .SMLI    ( '0     ),
        .SMLO    (        ),
        .SMRI    ( '0     ),
        .SMRO    (        ),
        .STDBY   ( STDBY  ),
        .TA      ( '0     ),
        .TBIST   ( '0     ),
        .TBYPASS ( '0     ),
        .TCSN    ( '0     ),
        .TED     ( '0     ),
        .TEM     ( '0     ),
        .TOD     ( '0     ),
        .TOM     ( '0     ),
        .TWEN    ( '0     ),
        .WEN     ( WEN    ),
        .RM      ( RM     ),
        .WM      ( WM     )
    );
endmodule






module st_tcdm_bank_1024x32
#(
    parameter                 RM_SIZE = 3,
    parameter                 WM_SIZE = 3
)
(
    input logic                CLK,
    input logic                RSTN,
    input logic                INITN,
    input logic                STDBY,

    input logic                CSN,
    input logic                WEN,
    input logic  [31:0]        WMN,
    input logic  [RM_SIZE-1:0] RM,
    input logic  [WM_SIZE-1:0] WM,
    input logic                HS, // high Speed
    input logic                LS, // low Speed
    input logic  [9:0]         A,
    input logic  [31:0]        D,
    output logic [31:0]        Q,

    input logic                TM
);


    ST_SPHD_LOVOLT_1024x32m4_bTMl cut
    (
        .A       ( A      ),
        .ATP     ( TM     ),
        .CK      ( CLK    ),
        .CSN     ( CSN    ),
        .D       ( D      ),
        .HS      ( HS     ),
        .IG      ( STDBY  ),
        .INITN   ( INITN  ),
        .LS      ( LS     ),
        .M       ( WMN    ),
        .Q       ( Q      ),
        .SCTRLI  ( '0     ),
        .SCTRLO  (        ),
        .SDLI    ( '0     ),
        .SDLO    (        ),
        .SDRI    ( '0     ),
        .SDRO    (        ),
        .SE      ( '0     ),
        .SMLI    ( '0     ),
        .SMLO    (        ),
        .SMRI    ( '0     ),
        .SMRO    (        ),
        .STDBY   ( STDBY  ),
        .TA      ( '0     ),
        .TBIST   ( '0     ),
        .TBYPASS ( '0     ),
        .TCSN    ( '0     ),
        .TED     ( '0     ),
        .TEM     ( '0     ),
        .TOD     ( '0     ),
        .TOM     ( '0     ),
        .TWEN    ( '0     ),
        .WEN     ( WEN    ),
        .RM      ( RM     ),
        .WM      ( WM     )
    );



/*
   ST_SPL1CACHE_HIPERF_1024x32m4_baTMol cut
     (
      .A(A),
      .ATP(TM),
      .CK(CLK),
      .CSN(CSN),
      .D(D),
      .HS('0),
      .IG(STDBY),
      .INITN(INITN),
      .LS('0),
      .M(WMN),
      .Q(Q),
      .RM(RM),
      .SCTRLI('0),
      .SCTRLO(),
      .SDLI('0),
      .SDLO(),
      .SDRI('0),
      .SDRO(),
      .SE('0),
      .SLEEP('0),
      .SMLI('0),
      .SMLO(),
      .SMRI('0),
      .SMRO(),
      .STDBY(STDBY),
      .TA('0),
      .TBIST('0),
      .TCSN('0),
      .TED('0),
      .TEM('0),
      .TOD('0),
      .TOM('0),
      .TWEN('0),
      .WEN(WEN),
      .WM(WM)
      );*/

endmodule

module scm_tcdm_bank_256x32
(
   input  logic        clk_i,
   input  logic        rst_ni,

   input  logic        re_ni,
   input  logic        we_ni,
   input  logic [3:0]  be_ni,

   input  logic [7:0]  add_i,

   input  logic [31:0] wdata_i,
   output logic [31:0] rdata_o
);

   logic               rdata_DEST;

   logic [1:0] 	       re_n_int;
   logic [1:0] 	       we_n_int;
   logic [1:0][31:0]   rdata_int;

   always_ff @(posedge clk_i, negedge rst_ni)
     begin
	if(rst_ni == 1'b0)
	  begin
	     rdata_DEST <= 1'b0;
	  end
	else
	  begin
	     rdata_DEST <= add_i[7];
	  end
     end
   
   assign rdata_o = (rdata_DEST) ? rdata_int[1] : rdata_int[0];
   
   always_comb
     begin
	if(add_i[7])
	  begin
	     re_n_int[0] = 1'b1;
	     re_n_int[1] = re_ni;
	  end
	else
	  begin
	     re_n_int[0] = re_ni;
	     re_n_int[1] = 1'b1;
	  end
     end
   
   always_comb
     begin
	if(add_i[7])
	  begin
	     we_n_int[0] = 1'b1;
	     we_n_int[1] = we_ni;
	  end
	else
	  begin
	     we_n_int[0] = we_ni;
	     we_n_int[1] = 1'b1;
	  end
     end
   
`ifdef SCM_IMPLEMENTED
   
  register_file_1r_1w_be
  #(
      .ADDR_WIDTH ( 7  ),
      .DATA_WIDTH ( 32 )
  )
  scm_0_i
  (
      .clk          ( clk_i        ),
      
      // Read port
      .ReadEnable   ( ~re_n_int[0] ),
      .ReadAddr     ( add_i[6:0]   ),
      .ReadData     ( rdata_int[0] ),
      
      // Write port
      .WriteEnable  ( ~we_n_int[0] ),
      .WriteAddr    (  add_i[6:0]  ),
      .WriteData    (  wdata_i     ),
      .WriteBE      ( ~be_ni       )
  );  
  
  register_file_1r_1w_be
  #(
      .ADDR_WIDTH ( 7  ),
      .DATA_WIDTH ( 32 )
  )
  scm_1_i
  (
      .clk          ( clk_i        ),
      
      // Read port
      .ReadEnable   ( ~re_n_int[1] ),
      .ReadAddr     ( add_i[6:0]   ),
      .ReadData     ( rdata_int[1] ),
      
      // Write port
      .WriteEnable  ( ~we_n_int[1] ),
      .WriteAddr    (  add_i[6:0]  ),
      .WriteData    (  wdata_i     ),
      .WriteBE      ( ~be_ni       )
  );
   
`else // FUNCTIONAL MODEL TO SPEEDUP SIMULATION
   
   generic_memory
     #(
       .ADDR_WIDTH(7)
       )
   scm_i_0
     (
      .CLK(clk_i),
      .INITN(1'b1),
      
      .CEN(re_n_int[0] & we_n_int[0]),
      .A(add_i[6:0]),
      .WEN(we_n_int[0]),
      .D(wdata_i),
      .BEN(be_ni),
      
      .Q(rdata_int[0])
      );
   
   generic_memory
     #(
       .ADDR_WIDTH(7)
       )
   scm_i_1
     (
      .CLK(clk_i),
      .INITN(1'b1),
      
      .CEN(re_n_int[1] & we_n_int[1]),
      .A(add_i[6:0]),
      .WEN(we_n_int[1]),
      .D(wdata_i),
      .BEN(be_ni),
      
      .Q(rdata_int[1])
      );
   
`endif
   
endmodule // scm_tcdm_bank_256x32




module scm_tcdm_bank_128x32
(
    input  logic        clk_i,

    input  logic        re_ni,
    input  logic        we_ni,
    input  logic [3:0]  be_ni,

    input  logic [6:0]  add_i,

    input  logic [31:0] wdata_i,
    output logic [31:0] rdata_o
);

`ifdef SCM_IMPLEMENTED



  register_file_1r_1w_be
  #(
      .ADDR_WIDTH ( 7  ),
      .DATA_WIDTH ( 32 )
  )
  scm_i
  (
      .clk          ( clk_i        ),

      // Read port
      .ReadEnable   ( ~re_ni       ),
      .ReadAddr     ( add_i[6:0]   ),
      .ReadData     ( rdata_o      ),

      // Write port
      .WriteEnable  ( ~we_ni       ),
      .WriteAddr    (  add_i[6:0]  ),
      .WriteData    (  wdata_i     ),
      .WriteBE      ( ~be_ni       )
  );  


//     latchram_WORDS128_WS32 scm_i
//     (
//         .ClkxCI(clk_i),
//         // Read port
//         .RExSBI(re_ni),
//         .RAddrxDI(add_i),
//         .RDataxDO(rdata_o),
// 
//         // Write port
//         .WExSBI(we_ni),
//         .BExSBI(be_ni),
//         .WAddrxDI(add_i),
//         .WDataxDI(wdata_i)
//     );

`else // FUNCTIONAL MODEL TO SPEEDUP SIMULATION

   generic_memory
   #(
       .ADDR_WIDTH(7)
   )
   scm_i
   (
      .CLK(clk_i),
      .INITN(1'b1),

      .CEN(re_ni & we_ni),
      .A(add_i),
      .WEN(we_ni),
      .D(wdata_i),
      .BEN(be_ni),

      .Q(rdata_o)
   );
`endif
endmodule // scm_tcdm_bank_128x32



module st_tcdm_bank_512x32
  (
   
   input  logic        CLK,
   input  logic        RSTN,
   input  logic        INITN,
   
   input  logic        CSN,
   input  logic        WEN,
   input  logic [31:0] WMN,
   input  logic [2:0]  RM,
   input  logic [1:0]  WM,
   input  logic [8:0]  A,
   input  logic [31:0] D,
   output logic [31:0] Q,
   
   input logic	       TM
   
   );
   
   ST_SPL1CACHE_HIPERF_512x32m4_baTMol cut
     (
      .A(A),
      .ATP(TM),
      .CK(CLK),
      .CSN(CSN),
      .D(D),
      .HS('0),
      .IG('0),
      .INITN(INITN),
      .LS('0),
      .M(WMN),
      .Q(Q),
      .RM(RM),
      .SCTRLI('0),
      .SCTRLO(),
      .SDLI('0),
      .SDLO(),
      .SDRI('0),
      .SDRO(),
      .SE('0),
      .SLEEP('0),
      .SMLI('0),
      .SMLO(),
      .SMRI('0),
      .SMRO(),
      .STDBY('0),
      .TA('0),
      .TBIST('0),
      .TCSN('0),
      .TED('0),
      .TEM('0),
      .TOD('0),
      .TOM('0),
      .TWEN('0),
      .WEN(WEN),
      .WM(WM)
      );
   
endmodule

module st_rom_bank_512x64
  (
   
   input  logic        CLK,
   input  logic        RSTN,
   input  logic        INITN,
   
   input  logic        CSN,
   input  logic        WEN,
   input  logic [8:0]  A,
   output logic [63:0] Q,
   
   input logic	       TM
   
   );
   
   ST_ROM_LOLEAK_512x32m32B2_TMl rom_cut_msb_i
     (
      .A(A),
      .ATP(TM),
      .CK(CLK),
      .CSN(CSN),
      .IG('0),
      .INITN(INITN),
      .Q(Q[63:32]),
      .SCTRLI('0),
      .SCTRLO(),
      .SE('0),
      .STDBY('0),
      .TA('0),
      .TBIST('0),
      .TCSN('0)
      );
   
   ST_ROM_LOLEAK_512x32m32B2_TMl rom_cut_lsb_i
     (
      .A(A),
      .ATP(TM),
      .CK(CLK),
      .CSN(CSN),
      .IG('0),
      .INITN(INITN),
      .Q(Q[31:0]),
      .SCTRLI('0),
      .SCTRLO(),
      .SE('0),
      .STDBY('0),
      .TA('0),
      .TBIST('0),
      .TCSN('0)
      );
   
endmodule

module st_rom_bank_1024x64
(
    input  logic        CLK,
    input  logic        RSTN,
    input  logic        INITN,

    input  logic        CSN,
    input  logic        WEN,
    input  logic [9:0]  A,
    output logic [63:0] Q,

    input logic	       TM
);

    ST_ROM_LOLEAK_1024x64m16B2_TMl
    #(
        .InitFileName("./boot/boot_code.cde")
    )
    rom_cut_i
    (
        .A      ( A      ),
        .ATP    ( TM     ),
        .CK     ( CLK    ),
        .CSN    ( CSN    ),
        .IG     ( '0     ),
        .INITN  ( INITN  ),
        .Q      ( Q      ),
        .SCTRLI ( '0     ),
        .SCTRLO (        ),
        .SE     ( '0     ),
        .STDBY  ( '0     ),
        .TA     ( '0     ),
        .TBIST  ( '0     ),
        .TCSN   ( '0     ),
        .RM     ( 3'b0   ),
        .LS     ( 1'b0   )
    );

endmodule
