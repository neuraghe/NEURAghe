////////////////////////////////////////////////////////////////////////////////
// Company:        ETH ZURICH                                                 //
//                                                                            //
// Engineer:       Michael Gautschi - gautschi@iis.ee.ethz.ch                 //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    18/02/2015                                                 // 
// Design Name:    Mia Wallace L2 Memory                                      // 
// Module Name:    l2_ram_32768x64 = 256 kB                                   //
// Project Name:   Mia Wallace                                                //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Wrapper for the L2 memory                                  //
//                 The 256 kB L2 memory is composed of:                       //
//                 - 4 banks a 64 kB (8192x64)                                //
//                 - each bank consist of 2 cuts a 32 kB (8192x8x4)           //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module l2_ram_32768x64
(
    input  logic                CLK,
    input  logic                RSTN,
    input  logic                INITN,

    input  logic                DVSE,
    input  logic [2:0]          DVS,

    input  logic                CEN,
    input  logic                WEN,
    input  logic [14:0]         A,
    input  logic [63:0]         D,
    input  logic [7:0]          BE,
    output logic [63:0]         Q,

    input logic                 TM
);

   genvar                     i,j;
   logic [1:0]                s_addr_sync; //4 way --> 2 bit
   logic [3:0][7:0]           web;
   logic [3:0]                csb;
   logic [3:0][63:0]          data_q;
   logic [3:0]                sel_bank;

   // Select correct bank
   always_comb
   begin : SEL_BANK
        sel_bank = 4'b0;
        case (A[14:13])
          2'b00:
            sel_bank = 4'b0001;
          2'b01:
            sel_bank = 4'b0010;
          2'b10:
            sel_bank = 4'b0100;
          2'b11:
            sel_bank = 4'b1000;
        endcase
   end



   generate

      // CSB and CEN both active low
      for (i=0; i<4; i++) // over all banks
      begin : CSB_BIND
        assign csb[i] = ~sel_bank[i] || CEN;
      end

      // WEN active low, BE active high
      // write when web=0. this is the case when WEN=0 and BE=1
      for (j=0; j<8; j++) // over all bytes
      begin :  WEN_BYTE
        for (i=0; i<4; i++) // over all banks 
        begin : WEN_BANK
            assign web[i][j] = ~sel_bank[i] || WEN || ~BE[j];
        end
      end

   endgenerate

   //********************************************************
   //******************** OUTPUT MUX ************************
   //********************************************************  

   always_comb
     begin : Q_BIND
        case (s_addr_sync)
          2'b00:
            begin
               Q[31:0] = data_q[0][31:0];
               Q[63:32] = data_q[0][63:32];
            end
          2'b01:
            begin
               Q[31:0] = data_q[1][31:0];
               Q[63:32] = data_q[1][63:32];
            end
          2'b10:
            begin
               Q[31:0] = data_q[2][31:0];
               Q[63:32] = data_q[2][63:32];
            end
          2'b11:
            begin
               Q[31:0] = data_q[3][31:0];
               Q[63:32] = data_q[3][63:32];
            end
        endcase

     end


   //********************************************************
   //****************** L2 MEMORY BANKS *********************
   //********************************************************
   generate

      for (i=0; i<4; i++)
      begin : cut

            SHKA65_8192X8X4CM16 cut_lo
            (
              .DO(data_q[i][31:0]),
              .CK(CLK),
              .A(A[12:0]),
              .DI(D[31:0]),
              .WEB(web[i][3:0]),
              .DVSE(DVSE),
              .DVS(DVS),
              .CSB(csb[i])
            );

            SHKA65_8192X8X4CM16 cut_hi
            (
              .DO(data_q[i][63:32]),
              .CK(CLK),
              .A(A[12:0]),
              .DI(D[63:32]),
              .WEB(web[i][7:4]),
              .DVSE(DVSE),
              .DVS(DVS),
              .CSB(csb[i])
            );
      end

   endgenerate
   //REGISTER FOR ADDRESS DELAY
   always_ff @ (posedge CLK, negedge RSTN)
   begin : SYNC_ADDR
        if (RSTN == 1'b0)
          s_addr_sync <= 2'b00;
        else
          s_addr_sync <= A[14:13];
   end

endmodule
