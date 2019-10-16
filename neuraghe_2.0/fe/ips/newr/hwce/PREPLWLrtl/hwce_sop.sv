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
   parameter MUL_WIDHT       = 2*CONV_WIDTH,
   parameter SUM_WIDHT       = MUL_WIDHT + $clog2(NB_MULS),
   parameter DSP_REGS        = 2,  // number of Xilinx DSP input regs
   parameter NB_TRELLIS      = 3,
   parameter MUL_PER_TREL    = 9, // $ceil(NB_MULS/NB_TRELLIS). VIVADO doesn't allow the use of $ceil
   parameter PIPE_STAGES_SOP = MUL_PER_TREL + DSP_REGS+1  // 0
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
   input  logic                                                              [2:0] fsm_state,
   output logic signed                                   [NPX-1:0][SUM_WIDHT -1:0] y_out
);
   
   localparam LAST_TRELL_MULS= NB_MULS - (NB_TRELLIS-1)*MUL_PER_TREL;

   //logic                                                                       enable_int; 
       
   logic signed [NPX-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][DSP_REGS -1:0][CONV_WIDTH-1:0] x_filter_pipe;
   logic signed [NPX-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][DSP_REGS -1:0][CONV_WIDTH-1:0] weight_pipe;
   
   logic signed [NPX-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][SUM_WIDHT-1:0]                 sum;
   logic signed [NPX-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][SUM_WIDHT-1:0]                 mul;
   logic                                          [PIPE_STAGES_SOP -1 : 0]                 valid_y_out_pipe;
   stream_flags_t                                 [PIPE_STAGES_SOP -1 : 0]                 flags_y_out_pipe;
   
   logic signed [NPX-1:0][NB_TRELLIS-1:0]                  [SUM_WIDHT-1:0]                 sum_partial;
   
   
   
   
  // assign enable_int = (enable == 1'b0) ? 1'b0 : (fsm_state==3'b001) ? 1'b1 : 
    //                                             (fsm_state==3'b011) ? 1'b1 : 
    //                                             (fsm_state==3'b010) ? 1'b1 : 
    //                                             (fsm_state==3'b110) ? 1'b1 : 1'b0;
  
   logic signed            [NPX-1:0][NB_TRELLIS-1:0][MUL_PER_TREL-1:0][CONV_WIDTH-1:0] x_filter_rewiring;
   logic signed                     [NB_TRELLIS-1:0][MUL_PER_TREL-1:0][CONV_WIDTH-1:0] weight_rewiring;

   

   assign weight_rewiring   = weight;
   assign x_filter_rewiring = x_filter;

   genvar t, jj, j, i, l, m ;
   generate
     for(j=0; j<NPX; j++) begin : NPX_gen
     
       
       for(t=0; t<NB_TRELLIS; t++) begin : TRELLIS
         for(i=0; i<MUL_PER_TREL; i++) begin : MUL
           always_ff @(posedge clk) begin              
             
             if (ready_y_out == 1'b1 && enable==1'b1) begin
               if (t==NB_TRELLIS-1 && i>=LAST_TRELL_MULS)
                   sum[j][t][i] <= sum[j][t][i-1];
                   
                   
               if (t<NB_TRELLIS-1 || i<LAST_TRELL_MULS)  begin
                 
                 mul[j][t][i] <= $signed(x_filter_pipe[j][t][i][0]) * $signed(weight_pipe[j][t][i][0]);
                
              // mul[j][t][i] <= (($signed(x_filter_pipe[j][t][i][0]) * $signed(weight_pipe[j][t][i][0]))>>8)<<8;
                 
            //   mul[j][t][i] <= x_filter_pipe[j][t][i][0] * weight_rewiring[t][i];
               
                 if (i==0)
                   sum[j][t][i] <= {SUM_WIDHT{1'b0}} + mul[j][t][i];
                 else
                   sum[j][t][i] <=    sum[j][t][i-1] + mul[j][t][i];
               end
                                     
             end // if (ready_y_out == 1'b1 && enable==1'b1) begin
           end //ff
           
           always_ff @(posedge clk) begin
             if (ready_y_out == 1'b1 && enable==1'b1) begin
               x_filter_pipe[j][t][i][DSP_REGS-1] <= x_filter_rewiring[j][t][i];
               weight_pipe  [j][t][i][DSP_REGS-1] <= weight_rewiring     [t][i];
               
             end // if (ready_y_out == 1'b1 && enable==1'b1) begin
           end
           
           for (l=DSP_REGS-1; l>0;l--)
             always_ff @(posedge clk)
               if (ready_y_out == 1'b1 && enable==1'b1) 
                  x_filter_pipe[j][t][i][l-1] <= x_filter_pipe[j][t][i][l];
                        
                     
            for (m=DSP_REGS-1; m>0;m--) 
              always_ff @(posedge clk)
                if (ready_y_out == 1'b1 && enable==1'b1) 
                  weight_pipe  [j][t][i][m-1] <= weight_pipe  [j][t][i][m];
             
                        
         end // genfor MUL_PER_TREL
         
         assign sum_partial[j][t] = sum[j][t][MUL_PER_TREL-1];
         
       end   // genfor NB_TRELLIS
       
       (* use_dsp48 = "no" *) hwce_sop_add #(
             .NB_TRELLIS ( NB_TRELLIS       ),
             .SUM_WIDHT  ( SUM_WIDHT        )
          ) sop_add_i (     
             .in         ( sum_partial [j] ),
             .out        ( y_out       [j] )
          );
                
     end // genfor NPX
     
   endgenerate
   
        
     
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
      if ((fsm_state != 3'b011) && (fsm_state[1:0] != 2'b10)) 
         ready_x_in = 1'b1;       
      else 
         ready_x_in = ready_y_out;
   end

endmodule
