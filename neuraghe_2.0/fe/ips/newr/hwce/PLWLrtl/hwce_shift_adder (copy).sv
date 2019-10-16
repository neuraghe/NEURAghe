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
 * Engineer:       Gianfranco Deriu - gian.deriu@gmail.com                    *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           shift_adder.sv                                                *
 * Description:                                     *
 *                                                                            *
 ******************************************************************************/

`include "hwce_types.sv"

module hwce_shift_adder
#(
   parameter CONV_WIDTH      = 32, // 16
   parameter ACC_CONFIG      = 5,  //used only in accuracy input but not used
   parameter NPX             = 2,  // 2   // parameter indicating the overall number of pixels
   parameter NB_MULS         = 25, // 25  // number of multipliers per output pixel   
   parameter N_COL           = 2,
   parameter MUL_WIDTH       = 2*CONV_WIDTH+$clog2(NB_MULS),
   parameter SUM_WIDTH       = MUL_WIDTH +$clog2(N_COL+1),
   parameter QF              = 13,
   parameter PIPE_STAGES     = 1,
   parameter USE_ADDER_TREE  = 0
)
(  
   input  logic                                              clk,
   input  logic                                              rst_n,
   input  logic                                              ready_out,
   output logic                                              ready_in,
   input  logic signed            [NPX-1:0][CONV_WIDTH -1:0] y_in,
   input  logic                                              valid_y_in,
   input  logic signed [N_COL-1:0][NPX-1:0][MUL_WIDTH -1:0]  y_in_sop,
   input  logic        [N_COL-1:0]                           valid_y_in_sop,
   
   output logic signed            [NPX-1:0][CONV_WIDTH-1:0]  y_out, 
   output logic                                              valid_y_out,
   input  logic                   [15:0]                     constant_to_sum,
   input  logic                                              sum_over_constant,
   input logic                                               rectifier_activ
);

   

   logic signed [NPX-1:0][N_COL-1:0][SUM_WIDTH-1:0]                             y_in_reorg;

   logic signed [NPX-1:0]           [SUM_WIDTH-1:0]                             sum; 
   logic signed [NPX-1:0]           [SUM_WIDTH-1:0]                             sum_base; 
   
   
   logic signed [NPX-1:0]           [SUM_WIDTH-1:0]                             sum_shifted; // [1:0][32+5-1:0] 
   logic signed [NPX-1:0]           [CONV_WIDTH-1:0]                            sum_short;   // [1:0][16-1  :0]
   logic        [NPX-1:0]                                                       sum_saturate;
   
   logic signed [NPX-1:0]           [CONV_WIDTH-1:0]                            max;   // [1:0][16-1  :0]

   logic signed [SUM_WIDTH-1:0]                                                 constant_long;
   logic signed [NPX-1:0][SUM_WIDTH-1:0]                                        y_in_long;
   
   
   logic signed            [PIPE_STAGES - 1 : 0][NPX-1:0][CONV_WIDTH -1:0]      y_in_pipe;
   logic                   [PIPE_STAGES - 1 : 0]                                valid_y_in_pipe;
   logic signed [PIPE_STAGES - 1 : 0][N_COL-1:0][NPX-1:0][MUL_WIDTH -1:0]       y_in_sop_pipe;
   logic        [PIPE_STAGES - 1 : 0][N_COL-1:0]                                valid_y_in_sop_pipe;
   
   logic signed            [NPX-1:0][CONV_WIDTH -1:0]                           y_in_pipe_out;
   logic                                                                        valid_y_in_pipe_out;
   logic signed [N_COL-1:0][NPX-1:0][MUL_WIDTH -1:0]                            y_in_sop_pipe_out;
   logic        [N_COL-1:0]                                                     valid_y_in_sop_pipe_out;
   

   


   genvar i,j, add_i, add_j, reorg_i, reorg_j;
   integer l, m, ll;
   generate 
      
      if (PIPE_STAGES>0) begin
        always_ff @(posedge clk) begin
          if (rst_n == 0) begin            
            y_in_pipe           <= 0;
            valid_y_in_pipe     <= 0;
            y_in_sop_pipe       <= 0;
            valid_y_in_sop_pipe <= 0;
          end
          else begin      
                
            y_in_pipe           [PIPE_STAGES-1] <= y_in;
            valid_y_in_pipe     [PIPE_STAGES-1] <= valid_y_in;
            y_in_sop_pipe       [PIPE_STAGES-1] <= y_in_sop;
            valid_y_in_sop_pipe [PIPE_STAGES-1] <= valid_y_in_sop;
            
            for (l=0;l<PIPE_STAGES-1;l++) begin   : input_pipe    
              y_in_pipe           [l] <= y_in_pipe           [l+1];
              valid_y_in_pipe     [l] <= valid_y_in_pipe     [l+1];
              y_in_sop_pipe       [l] <= y_in_sop_pipe       [l+1];
              valid_y_in_sop_pipe [l] <= valid_y_in_sop_pipe [l+1]; 
            end
            
          end
        end
        
        assign y_in_pipe_out           = y_in_pipe           [0];
        assign valid_y_in_pipe_out     = valid_y_in_pipe     [0];
        assign y_in_sop_pipe_out       = y_in_sop_pipe       [0];
        assign valid_y_in_sop_pipe_out = valid_y_in_sop_pipe [0];
          
      end
        
        
      else begin //NO PIPE
        assign y_in_pipe_out           = y_in;
        assign valid_y_in_pipe_out     = valid_y_in;
        assign y_in_sop_pipe_out       = y_in_sop;
        assign valid_y_in_sop_pipe_out = valid_y_in_sop;
      end
      
      
      for(i=0; i<N_COL; i++) begin
        for(j=0; j<NPX; j++) begin
          assign y_in_reorg [j][i] = $signed(y_in_sop_pipe_out[i][j]);
        end
      end
      
      
      
      
      assign constant_long = $signed(constant_to_sum);

      for(j=0; j<NPX; j++) begin // j = 0 -> 1
      
        assign y_in_long[j] = $signed(y_in_pipe_out[j]);
        
        if (USE_ADDER_TREE) begin
          localparam ADDER_LAYERS     = $clog2(N_COL+1) + 1;
          localparam OPERANDS_PER_LAY = 2**($clog2(N_COL+1));
         
          // for each layer in the adder, add one bit to the result (many bits should get optimized away)
          localparam ADDER_WIDTH   = SUM_WIDTH;
          
          logic signed [NPX-1:0][N_COL+1-1:0][SUM_WIDTH-1:0]                           adder_in;
          logic signed [NPX-1:0][ADDER_LAYERS-1:0][OPERANDS_PER_LAY-1:0][ADDER_WIDTH-1:0] adder_bits;
        
          assign sum_base[j] = (sum_over_constant==1'b0) ? y_in_long[j] : constant_long;      
          assign adder_bits[j][ADDER_LAYERS-1][N_COL] = $signed(sum_base[j]<<< QF);
           
          for(add_j=0; add_j<N_COL; add_j++) begin
            assign adder_bits[j][ADDER_LAYERS-1][add_j] = $signed(y_in_reorg[j][add_j]);
          end   
           
          for(add_j=N_COL+1; add_j<OPERANDS_PER_LAY; add_j++) begin
            assign adder_bits[j][ADDER_LAYERS-1][add_j] = 0;
          end
              
          for(add_i=ADDER_LAYERS-2; add_i>=0; add_i--) begin
            for(add_j=0; add_j<`exp2(add_i); add_j++) begin
              assign adder_bits[j][add_i][add_j] = adder_bits[j][add_i+1][2*add_j] + adder_bits[j][add_i+1][2*add_j+1];
            end
          end
             
          assign sum[j]=adder_bits[j][0][0];     
        end
        else begin //NO ADDER TREE   

          assign sum_base[j] = (sum_over_constant==1'b0) ? y_in_long[j] : constant_long;
          always_comb begin     
        
            // This works with 4 columns only
            sum[j]= $signed(sum_base[j]<<< QF) +  $signed(y_in_reorg [j][0])+  
                                                  $signed(y_in_reorg [j][1])+  
                                                  $signed(y_in_reorg [j][2])+  
                                                  $signed(y_in_reorg [j][3]); 
          end

        end

        always_comb begin : saturation_logic
            
          sum_shifted[j] = $signed($signed(sum[j]) >>> QF);
          // saturation
            
          if (sum_shifted[j][SUM_WIDTH-1:CONV_WIDTH-1]=={(SUM_WIDTH-CONV_WIDTH+1){1'b0}} || 
              sum_shifted[j][SUM_WIDTH-1:CONV_WIDTH-1]=={(SUM_WIDTH-CONV_WIDTH+1){1'b1}})
              sum_saturate[j] = 1'b0;
          else
            sum_saturate[j] = 1'b1;
              
            //for(int i=0; i<SUM_WIDTH-CONV_WIDTH; i++)
            //   sum_saturate[j] = sum_saturate[j] ^ sum_shifted[j][CONV_WIDTH+i: ];
               
            if(sum_saturate[j]==1'b1)
               if(sum_shifted[j][SUM_WIDTH-1]==1'b1)                  
                  sum_short[j] = {1'b1, {(CONV_WIDTH-1){1'b0}}}; // saturation -
               else                  
                  sum_short[j] = {1'b0, {(CONV_WIDTH-1){1'b1}}}; // saturation +
            else               
               sum_short[j] = sum_shifted[j][CONV_WIDTH-1:0]; // no saturation
         end // saturation_logic            

        assign max[j] = (sum_short[j][CONV_WIDTH - 1] == 0 ) ? $signed(sum_short[j]) : 16'b0000000000000000; //RECTIFIER ACTIVATION FUNCTION

      end // pxc_gen

   endgenerate // data path
   
   
   assign y_out = (rectifier_activ) ? max : sum_short;
   assign valid_y_out = valid_y_in_pipe_out & &valid_y_in_sop_pipe_out;

endmodule
