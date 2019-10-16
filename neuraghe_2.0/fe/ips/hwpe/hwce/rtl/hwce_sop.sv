/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 *          EOLAB @ DIEE - Università degli studi di Cagliari                 *
 *                      Via marengo 2 - 09123                                 *
 *                              Cagliari                                      *
 *                                                                            *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                 Gianfranco Deriu - gian.deriu@gmail.com                    *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           hwce_sop.sv                                                *
 * Description:    HWCE sum-of-products block                                 *
 *                                                                            *
 ******************************************************************************/

`include "hwce_types.sv"

module hwce_sop
#(
   parameter CONV_WIDTH      = 16, // 16
   parameter NPX             = 4,  // 2   // parameter indicating the overall number of pixels
 
   parameter SUM_WIDHT       = 48, //MUL_WIDHT + $clog2(NB_MULS),
   parameter DSP_REGS        = 2,  // number of Xilinx DSP input regs
   parameter PIPE_STAGES_SOP = DSP_REGS + 1 + 1
)
(     
   input  logic                                   clk,
   input  logic                                   rst_n,
   input  logic                                   enable,  
   
   input  stream_flags_t                          x_in_flags,
   input  logic                                   valid_x_in,
   //input logic                                    y_out_TREADY_i,   
/*output*/input logic                                   valid_y_out,
//   output logic                                   valid_x_in_out,
   input  logic                                   ready_y_out,   
   input  logic                                   clear,
   input  logic                             [7:0] fs_w,
   input  logic                             [7:0] fs_h,
   input  logic signed  [NPX-1:0][CONV_WIDTH-1:0] x_in,
   input  logic signed           [CONV_WIDTH-1:0] w_in,
   input  logic         [NPX-1:0]                 fsm_state,
   input  logic                                   precision8,
   output logic signed  [NPX-1:0][SUM_WIDHT -1:0] y_out
);
    
   localparam REG_A_D_WIDTH = 25;
   localparam REG_B_WIDTH   = 18;
   
   logic signed          [NPX-1:0][SUM_WIDHT-1:0] mul;
   logic signed          [NPX-1:0][SUM_WIDHT-1:0] mul_rew;
   //logic signed          [NPX-1:0][SUM_WIDHT-1:0] add;
   
   logic signed     [NPX-1:0][(CONV_WIDTH/2)-1:0] check_A;
   logic signed     [NPX-1:0][(CONV_WIDTH/2)-1:0] check_D;
   logic signed      [NPX-1:0][REG_A_D_WIDTH-1:0] x_A_25;
   logic signed      [NPX-1:0][REG_A_D_WIDTH-1:0] x_D_25;
   logic signed      [NPX-1:0][REG_B_WIDTH-1:0]   x_B_18;
   logic signed      [NPX-1:0][REG_A_D_WIDTH-1:0] A;
   logic signed      [NPX-1:0][REG_A_D_WIDTH-1:0] D;
   logic signed      [NPX-1:0][REG_B_WIDTH-1:0]   B;
    
   logic signed        [NPX-1:0][CONV_WIDTH-1:0]  x_in_rew;
   logic signed                 [CONV_WIDTH-1:0]  w_in_rew;
   
   logic signed [2-1:0][NPX-1:0][CONV_WIDTH-1:0] x_in_byte;
   
   logic             [PIPE_STAGES_SOP-1:0] valid_y_out_pipe;
   logic             [PIPE_STAGES_SOP-1:0] valid_x_in_pipe;
//   
   logic                               [7:0]  cnt_fs_w;
   logic                               [7:0]  cnt_fs_h;
 
   assign x_in_rew = x_in;
   assign w_in_rew = w_in;
   
   
   //contenuto dei DSP regs a seconda della precisione scelta
   assign A = (valid_x_in) ? x_A_25 : {(NPX*REG_A_D_WIDTH){1'b0}};
   assign D = (valid_x_in) ? x_D_25 : {(NPX*REG_A_D_WIDTH){1'b0}};
   assign B = (valid_x_in) ? x_B_18 : {(NPX*REG_B_WIDTH)  {1'b0}};
   
   
   
   genvar n;
   generate 
   
   for(n=0; n<NPX; n++) begin
          
     one_dsp_MACC #(
        .REG_A_D_WIDTH( REG_A_D_WIDTH ),
        .REG_B_WIDTH  ( REG_B_WIDTH ),
        .SUM_WIDTH    ( SUM_WIDHT )
        )  
        dsp_i(
        .clk    ( clk ),
        .rst_n  ( rst_n),
        .enable ( enable),
        .ready_y_out ( ready_y_out ),
        .zero   (valid_y_out),
        .a      ( A[n] ),
        .d      ( D[n] ),
        .b      ( B[n] ),
        .p_in   ( 48'h000000000000 ),
        .p_out  ( mul[n] )
     );
                        
     
    assign mul_rew[n] = /*(precision8) ? {{(8){mul[n][39]}},mul[n][39:24],{(8){mul[n][15]}},mul[n][15:0]} :*/ mul[n];  //to be parametrized
       
    
    
    assign y_out[n] = mul_rew[n];
        
    
   /* assign check_D[n] = (x_in_rew[n][(CONV_WIDTH/2)-1:0]          == 8'b10000000) ? 8'b10000001 : x_in_rew[n][(CONV_WIDTH/2)-1:0];
    assign check_A[n] = (x_in_rew[n][CONV_WIDTH-1:(CONV_WIDTH/2)] == 8'b10000000) ? 8'b10000001 : x_in_rew[n][CONV_WIDTH-1:(CONV_WIDTH/2)];*/
     
    assign x_D_25[n][CONV_WIDTH-1:0]             = /*(precision8) ? {{(CONV_WIDTH/2){check_D[n][(CONV_WIDTH/2)-1]}},check_D[n]} :*/x_in_rew[n][CONV_WIDTH-1:0];
    assign x_D_25[n][REG_A_D_WIDTH-1:CONV_WIDTH] = {(REG_A_D_WIDTH-CONV_WIDTH){x_D_25[n][CONV_WIDTH-1]}};
     
    assign x_A_25[n][REG_A_D_WIDTH-1:17] = /*(precision8) ? check_A[n] :*/ {(8){1'b0}};
    assign x_A_25[n][16:0]  = {(16+1){1'b0}};
     
    assign x_B_18[n][CONV_WIDTH-1:0]            = /*(precision8) ? {{(CONV_WIDTH/2){w_in_rew[(CONV_WIDTH/2)-1]}},w_in_rew} :*/ w_in_rew;
    assign x_B_18[n][REG_B_WIDTH-1:CONV_WIDTH] = {(REG_B_WIDTH-CONV_WIDTH){x_B_18[n][CONV_WIDTH-1]}};
    
    end //for n
    endgenerate
    

/*    
    always_ff @(posedge clk or negedge rst_n) begin
      if(rst_n == 1'b0) begin
        cnt_fs_w <= {(8){1'b0}};
        cnt_fs_h <= {(8){1'b0}};
      end
      else if(clear || ready_y_out == 1'b0 || (cnt_fs_w == fs_w - 1 && cnt_fs_h == fs_h - 1)) begin
        cnt_fs_w <= {(8){1'b0}};
        cnt_fs_h <= {(8){1'b0}};
      end
      else begin
        if(cnt_fs_w < fs_w - 1) begin
          cnt_fs_w <= cnt_fs_w + valid_x_in_pipe[0];
          cnt_fs_h <= cnt_fs_h;
        end
        else if(cnt_fs_h < fs_h - 1) begin
          cnt_fs_w <= {(4){1'b0}};
          cnt_fs_h <= cnt_fs_h + valid_x_in_pipe[0];
        end
        else begin
          cnt_fs_w <= cnt_fs_w;
          cnt_fs_h <= cnt_fs_h;
        end
      end
    end
    
    assign valid_y_out = (cnt_fs_w == fs_w - 1 && cnt_fs_h == fs_h - 1 && valid_x_in_pipe[0]) ? 1'b1 : 1'b0;
    
    assign valid_x_in_out = valid_x_in_pipe[0];
    

     
    //input signals pipe
    
    integer k;      
    always_ff @(posedge clk) begin
      if(rst_n == 1'b0) begin
        valid_x_in_pipe <= 0;                
      end
      else if (clear || ready_y_out == 1'b0) begin
          valid_x_in_pipe <= 0;
      end
      else begin
          
          valid_x_in_pipe[PIPE_STAGES_SOP -1] <= valid_x_in;
          
          for (k=PIPE_STAGES_SOP-1; k>0; k--) begin
          
            valid_x_in_pipe [k-1] <= valid_x_in_pipe[k];
            
          end
      end
    end
*/ 
             
         

  /* always_comb begin
      if ((fsm_state != 4'b0011) && (fsm_state[1:0] != 2'b10)) 
         ready_x_in = 1'b1;       
      else 
         ready_x_in = ready_y_out;
   end*/

endmodule
