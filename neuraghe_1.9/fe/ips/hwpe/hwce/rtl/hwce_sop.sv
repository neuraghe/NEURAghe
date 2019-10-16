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
   parameter CONV_WIDTH      = 32, // 16
   parameter ACC_CONFIG      = 5,  // used only in accuracy input but not used
   parameter NPX             = 2,  // 2   // parameter indicating the overall number of pixels
   parameter TIME_MUXING     = 0,  // 0       // multiplex NPX in time (if 1) or compute them in parallel (if 0)
   parameter NB_MULS         = 27, // 27  // number of multipliers per output pixel
   
   parameter PRECOMPUTATION  = 1,   // 1
   parameter SUM_WIDHT       = 48, //MUL_WIDHT + $clog2(NB_MULS),
   parameter DSP_REGS        = 2,  // number of Xilinx DSP input regs
   parameter NB_TRELLIS      = 3,
   parameter MUL_PER_TREL    = 9, // $ceil(NB_MULS/NB_TRELLIS). VIVADO doesn't allow the use of $ceil
   parameter PIPE_STAGES_SOP = MUL_PER_TREL + DSP_REGS + 1 + 1 + 1  // ho spezzato il percorso critico tra uscita dai trellis e somme
)
(     
   input  logic                                                                    clk,
   input  logic                                                                    rst_n,
   input  logic                                                                    enable,   
   input  logic                                                                    valid_x_in,
   input  stream_flags_t                                                           flags_x_in, // to y_out_flags
   output logic                                                                    ready_x_in,   
   output logic                                                                    valid_y_out,
   output stream_flags_t                                                           flags_y_out, // from x_in flags delayed into a pipe
   input  logic                                                                    ready_y_out,   
   input  logic                                                                    clear,
   input  logic                                                                    signed_mul,
   input  logic signed [NPX-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][CONV_WIDTH-1:0] x_filter, //NOTE: pixels must be delayed before passed to sop.
   input  logic signed                               [NB_MULS-1:0][CONV_WIDTH-1:0] weight,
   input  logic                                                              [3:0] fsm_state,
   input  logic                                                                    precision8,
   output logic signed                                   [NPX-1:0][SUM_WIDHT -1:0] y_out
);
   
   localparam LAST_TRELL_MULS= NB_MULS - (NB_TRELLIS-1)*MUL_PER_TREL;
   localparam REG_A_D_WIDTH = 25;
   localparam REG_B_WIDTH   = 18;
   localparam PATH          = 2;
   localparam SOP_WIDTH     = 16;

   //logic                                                                       enable_int; 
       
   //logic signed [NPX-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][DSP_REGS -1:0][CONV_WIDTH-1:0] x_filter_pipe;
   //logic signed [NPX-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][DSP_REGS -1:0][CONV_WIDTH-1:0] weight_pipe;
   
   logic signed                [PATH-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][SOP_WIDTH-1:0]    x_filter_8;
   logic signed                [PATH-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][(CONV_WIDTH/2)-1:0] check_A;
   logic signed                [PATH-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][(CONV_WIDTH/2)-1:0] check_D;
   logic signed                [PATH-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][REG_A_D_WIDTH-1:0] x_A_25;
   logic signed                [PATH-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][REG_A_D_WIDTH-1:0] x_D_25;
   logic signed                [PATH-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][REG_B_WIDTH-1:0]   x_B_18;
   logic signed                [PATH-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][REG_A_D_WIDTH-1:0] A;
   logic signed                [PATH-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][REG_A_D_WIDTH-1:0] D;
   logic signed                [PATH-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][REG_B_WIDTH-1:0]   B;
   
   logic signed /*[NPX-1:0]*/[NB_TRELLIS-1:0][MUL_PER_TREL-1:0]               [CONV_WIDTH-1:0] weight_8;
   logic signed /*[NPX-1:0]*/[NB_TRELLIS-1:0][MUL_PER_TREL-1:0]               [CONV_WIDTH-1:0] weight_16;
   
   logic signed [PATH-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][SUM_WIDHT-1:0]                 sum;
   logic signed [PATH-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][SUM_WIDHT-1:0]                 p_in;

   logic                                          [PIPE_STAGES_SOP -1 : 0]                 valid_y_out_pipe;
   stream_flags_t                                 [PIPE_STAGES_SOP -1 : 0]                 flags_y_out_pipe;
   
   logic signed [PATH-1:0][NB_TRELLIS-1:0]                  [SUM_WIDHT-1:0]                 sum_partial;
   logic signed [PATH-1:0][NB_TRELLIS-1:0]                  [SUM_WIDHT-1:0]                 sum_partial_8;
   
   
   
   logic signed                                   [PATH-1:0][SUM_WIDHT -1:0]    y_out_add;
   logic signed                                   [PATH-1:0][SUM_WIDHT -1:0]    y_out_add_8;
   logic signed                                   [NPX-1:0][SUM_WIDHT -1:0]     y_out_add_last;
   logic signed                                   [NPX-1:0][SUM_WIDHT -1:0]     y_out_pipe;
   
   
  // assign enable_int = (enable == 1'b0) ? 1'b0 : (fsm_state==3'b001) ? 1'b1 : 
    //                                             (fsm_state==3'b011) ? 1'b1 : 
    //                                             (fsm_state==3'b010) ? 1'b1 : 
    //                                             (fsm_state==3'b110) ? 1'b1 : 1'b0;
  
   logic signed            [PATH-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][SOP_WIDTH-1:0] x_filter_rew;
   
   //logic signed                     [NB_TRELLIS-1:0][MUL_PER_TREL-1:0][CONV_WIDTH-1:0] weight_rew;

   
   assign weight_8   = weight;
   assign weight_16  = weight;
  
   
   assign x_filter_rew = x_filter;   //da controllare la sincro xke prima l'assegnamento avveniva dentro un always pos
 
   genvar t, jj, j, i, l, m;
   generate
   
     for(j=0; j<PATH; j++) begin : NPX_gen

       for(t=0; t<NB_TRELLIS; t++) begin : TRELLIS
       
         for(i=0; i<MUL_PER_TREL; i++) begin : MUL             
             
           if (t==NB_TRELLIS-1 && i>=LAST_TRELL_MULS)
            always_ff @(posedge clk) begin                    
              if (ready_y_out == 1'b1 && enable==1'b1) begin
                    sum[j][t][i] <= sum[j][t][i-1];
                end
              end
              
              if (t<NB_TRELLIS-1 || i<LAST_TRELL_MULS)  begin
              
               
                assign p_in[j][t][i] = (i==0) ? {SUM_WIDHT{1'b0}} : sum[j][t][i-1];
           
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
                    .a      ( A[j][t][i] ),
                    .d      ( D[j][t][i] ),
                    .b      ( B[j][t][i] ),
                    .p_in   ( p_in[j][t][i] ),
                    .p_out  ( sum[j][t][i] )
                 );
              end
                        
            
            
//           if(NPX==4) begin
//             assign x_filter_rew[j][t][i] = x_filter[j*2][t][i] + (x_filter[(j*2)+1][t][i] << 8);  //non serve se conv_width è fisso a 16
//           end   
//           else begin
//             assign x_filter_rew[j][t][i] = x_filter[j][t][i];
//          end    
          
           //assign x_filter_8[j][t][i] =  x_filter_rew[j][t][i];
           
                    
          
           assign check_D[j][t][i] = (x_filter_rew[j][t][i][(CONV_WIDTH/2)-1:0] == 8'b10000000) ? 8'b10000001 : x_filter_rew[j][t][i][(CONV_WIDTH/2)-1:0];
           assign check_A[j][t][i] = (x_filter_rew[j][t][i][SOP_WIDTH-1:(CONV_WIDTH/2)] == 8'b10000000) ? 8'b10000001 : x_filter_rew[j][t][i][SOP_WIDTH-1:(CONV_WIDTH/2)];
           
           assign x_D_25[j][t][i][CONV_WIDTH-1:0]    = (precision8) ? {{(CONV_WIDTH/2){check_D[j][t][i][(CONV_WIDTH/2)-1]}},check_D[j][t][i]} : x_filter_rew[j][t][i][CONV_WIDTH-1:0];
           assign x_D_25[j][t][i][REG_A_D_WIDTH-1:CONV_WIDTH] = {(REG_A_D_WIDTH-CONV_WIDTH){x_D_25[j][t][i][CONV_WIDTH-1]}};
           
           assign x_A_25[j][t][i][REG_A_D_WIDTH-1:17] = (precision8) ? check_A[j][t][i] : {(8){1'b0}};
           assign x_A_25[j][t][i][16:0]  = {(16+1){1'b0}};
           
           assign x_B_18[j][t][i][CONV_WIDTH-1:0] = (precision8) ? {{(CONV_WIDTH/2){weight_8 [t][i][(CONV_WIDTH/2)-1]}},weight_8 [t][i]} : weight_16 [t][i];
           assign x_B_18[j][t][i][REG_B_WIDTH-1:CONV_WIDTH] = {(REG_B_WIDTH-CONV_WIDTH){x_B_18[j][t][i][CONV_WIDTH-1]}};
           
           //contenuto dei DSP regs a seconda della precisione scelta
           assign A[j][t][i] = x_A_25[j][t][i] ;
           assign D[j][t][i] = x_D_25[j][t][i] ;
           assign B[j][t][i] = x_B_18[j][t][i] ;
           
                        
         end // genfor MUL_PER_TREL
         
         //traslo la somma dei risultati parziali in uscita da ogni trellis su 48 bit
         assign sum_partial_8[j][t][16:0] = sum[j][t][MUL_PER_TREL-1][16:0];
         assign sum_partial_8[j][t][23:17] = {(23-17+1){sum[j][t][MUL_PER_TREL-1][16]}};
         assign sum_partial_8[j][t][40:24] = sum[j][t][MUL_PER_TREL-1][33:17] /*+ sum[j][t][MUL_PER_TREL-1][16]*/;
         assign sum_partial_8[j][t][SUM_WIDHT-1:41] = {(SUM_WIDHT-41){sum[j][t][MUL_PER_TREL-1][33]}};
         
         always_ff @(posedge clk) begin
            sum_partial[j][t] <= (precision8) ? sum_partial_8[j][t] : sum[j][t][MUL_PER_TREL-1];
         end
         
       end   // genfor NB_TRELLIS
       
       (* use_dsp48 = "no" *) hwce_sop_add #(
             .NB_TRELLIS ( NB_TRELLIS       ),
             .SUM_WIDHT  ( SUM_WIDHT        )
          ) sop_add_i (     
             .in         ( sum_partial [j] ),
             .out        ( y_out_add   [j] )
          );
          
       //somma del bit di segno della parze LSB alla MSB
       assign y_out_add_8[j][23:0] = y_out_add[j][23:0];
       assign y_out_add_8[j][47:24] = y_out_add[j][47:24] + { {(23){1'b0}}, y_out_add[j][23] };
       
//       if(NPX==4)begin
//         assign y_out_add_last[j*2] =  $signed(y_out_add_8[j][23:0]);
//         assign y_out_add_last[(j*2)+1] = $signed(y_out_add_8[j][47:24]);
//       end
                                                                      //non serve più separare i pixel
       assign y_out_add_last[j] = (precision8) ? $signed(y_out_add_8[j]) : $signed(y_out_add[j]);

       //assign y_out_add_last[j] = $signed(y_out_add[j]);
               
     end // genfor PATH
     
   endgenerate
    
   always_ff @(posedge clk) begin
     if(rst_n == 1'b0)
     begin
       y_out_pipe <= 0;          
     end
     else
     begin
       y_out_pipe <= y_out_add_last;
     end
   end
    
   assign y_out = y_out_pipe;
        
     
     //control signals
    integer k;      
    always_ff @(posedge clk) begin
      if(rst_n == 1'b0) begin
        valid_y_out_pipe <= 0;
        flags_y_out_pipe <= 0;                 
      end
      else
        if (clear) begin
          valid_y_out_pipe <= 0;
          flags_y_out_pipe <= 0; 
        
        end
        else begin
          if (ready_y_out == 1'b1 && enable==1'b1) begin //FIXME or enable_int?
              
            valid_y_out_pipe [0] <= valid_x_in;
            flags_y_out_pipe [0] <= flags_x_in;


            for (k=0; k<PIPE_STAGES_SOP-1;k++) begin
              
              valid_y_out_pipe [k+1] <= valid_y_out_pipe[k];
              flags_y_out_pipe [k+1] <= flags_y_out_pipe[k];
            end
         end
       end
     end
           
     always_comb begin
       //if(enable_int==1'b1 && ready_y_out == 1'b1) begin
         valid_y_out = valid_y_out_pipe[PIPE_STAGES_SOP-1] & ~clear;
         flags_y_out = flags_y_out_pipe[PIPE_STAGES_SOP-1];
     //  end
     //  else begin
     //    valid_y_out = 0;
     //    flags_y_out = 0;
     //  end
     end   
         

   always_comb begin
      if ((fsm_state != 4'b0011) && (fsm_state[1:0] != 2'b10)) 
         ready_x_in = 1'b1;       
      else 
         ready_x_in = ready_y_out;
   end

endmodule
