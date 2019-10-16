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

//`include "hwce_types.sv"

module hwce_shift_adder
#(
   parameter CONV_WIDTH      = 32, // 16
   parameter NPX             = 4,  // 2   // parameter indicating the overall number of pixels
   parameter N_COL           = 2,
   parameter SUM_WIDTH       = 48,//MUL_WIDTH +$clog2(N_COL+1),
   parameter PIPE_STAGES     = 0, //defined here
   parameter USE_ADDER_TREE  = 0  //defined here
)
(  
   input  logic                                              clk,
   input  logic                                              rst_n,
   input  logic                                        [3:0] fsm_state,
   
   input  logic signed            [NPX-1:0][CONV_WIDTH -1:0] y_in,
   input  logic                                              valid_y_in,
   input  logic                                              valid_x_in_sop,
   input  logic signed [N_COL-1:0][NPX-1:0][SUM_WIDTH -1:0]  y_in_sop,
   input  logic                                              valid_y_in_sop,
   
   output logic signed            [NPX-1:0][CONV_WIDTH-1:0]  y_out, 
   output logic                                              valid_y_out,
   input  logic                   [CONV_WIDTH-1:0]           constant_to_sum,
   input  logic                                              sum_over_constant,
   input logic                                               rectifier_activ,
   input logic [3:0]                                         qf_i,
   input logic                                               precision8
);

   
   localparam QF_MAX = CONV_WIDTH;
   localparam QF_MIN = 0;
   localparam QF_STEP = 1;

   logic signed [NPX-1:0][N_COL-1:0][SUM_WIDTH-1:0]                             y_in_reorg;

   logic signed [NPX-1:0]           [SUM_WIDTH-1:0]                             sum;
   logic signed [NPX-1:0]           [SUM_WIDTH-1:0]                             sum_8;
   logic signed [NPX-1:0]           [SUM_WIDTH-1:0]                             sum_16;
   
   
   logic signed [NPX-1:0]           [SUM_WIDTH-1:0]                             sum_base_8;
   logic signed [NPX-1:0]           [SUM_WIDTH-1:0]                             sum_base_16;
   //logic signed [NPX-1:0]           [SUM_WIDTH-1:0]                             sum_base;
   
    
   logic signed [NPX-1:0]           [SUM_WIDTH-1:0]                             sum_shifted_8;
   logic signed [NPX-1:0]           [SUM_WIDTH-1:0]                             sum_shifted_16; // [1:0][32+5-1:0]
   logic signed [NPX-1:0]           [SUM_WIDTH-1:0]                             sum_partial_shifted_8;
   logic signed [NPX-1:0]           [SUM_WIDTH-1:0]                             sum_partial_shifted_16;
   logic signed [NPX-1:0]           [CONV_WIDTH-1:0]                            sum_short_8;
   logic signed [NPX-1:0]           [CONV_WIDTH-1:0]                            sum_short_16;
   logic signed [NPX-1:0]           [CONV_WIDTH-1:0]                            sum_out_short;
   logic        [NPX-1:0]           [1:0]                                       sum_saturate_8;
   logic        [NPX-1:0]                                                       sum_saturate_16;
   
   logic signed [NPX-1:0]           [CONV_WIDTH-1:0]                            max;   // [1:0][16-1  :0]
   logic signed [NPX-1:0]           [CONV_WIDTH-1:0]                            max_8;
   logic signed [NPX-1:0]           [CONV_WIDTH-1:0]                            max_16;

   logic signed [SUM_WIDTH-1:0]                                                 constant_long;
   logic signed [SUM_WIDTH-1:0]                                                 constant_long_8;
   logic signed [SUM_WIDTH-1:0]                                                 constant_long_16;
   logic signed [NPX-1:0][SUM_WIDTH-1:0]                                        y_in_long;
   logic signed [NPX-1:0][SUM_WIDTH-1:0]                                        y_in_long_8;
   logic signed [NPX-1:0][SUM_WIDTH-1:0]                                        y_in_long_16;
   
   
   logic signed [PIPE_STAGES - 1 : 0][NPX-1:0][CONV_WIDTH -1:0]                 y_in_pipe;
   logic        [PIPE_STAGES - 1 : 0]                                           valid_y_in_pipe;
   logic signed                      [NPX-1:0][CONV_WIDTH -1:0]                 y_in_pipe_out;
   logic                                                                        valid_y_in_pipe_out;
   logic signed [N_COL-1:0][NPX-1:0][SUM_WIDTH -1:0]                            y_in_sop_rew;
   logic                                                                        valid_y_in_sop_rew;
   logic                                                                        valid_x_in_sop_rew;
   
   logic signed            [NPX-1:0][SUM_WIDTH-1:0]                             add_kernel;
   logic signed            [NPX-1:0][SUM_WIDTH-1:0]                             add_of;
   
   logic inc_zero, inc_add;
   


   genvar i,j, add_i, add_j, reorg_i, reorg_j;
   integer l, m, ll;
   generate 
      
      assign y_in_sop_rew       = y_in_sop;
      //assign valid_y_in_sop_rew = valid_y_in_sop;
      //assign valid_x_in_sop_rew = valid_x_in_sop;
      
//      if (PIPE_STAGES > 0) begin
//        always_ff @(posedge clk) begin
//            if (rst_n == 0) begin            
//              y_in_pipe           <= 0;
//              valid_y_in_pipe     <= 0;
//            end
//            else begin   
//                y_in_pipe           [PIPE_STAGES-1] <= y_in;
//                valid_y_in_pipe     [PIPE_STAGES-1] <= valid_y_in;
//                
//                for (l=0;l<PIPE_STAGES-1;l++) begin    
//                  y_in_pipe           [l] <= y_in_pipe           [l+1];
//                  valid_y_in_pipe     [l] <= valid_y_in_pipe     [l+1];
//                end
//            
//            end
//         end
//         assign y_in_pipe_out           = y_in_pipe           [0];
//         assign valid_y_in_pipe_out     = valid_y_in_pipe     [0];
//       end
//       else begin
//         assign y_in_pipe_out           = y_in;
//         assign valid_y_in_pipe_out     = valid_y_in;
//       end

      assign y_in_pipe_out           = y_in;
      assign valid_y_in_pipe_out     = valid_y_in;
       
      
      for(j=0; j<NPX; j++)begin
       always_ff @(posedge clk) begin
            if(rst_n == 1'b0)begin
              add_kernel[j] <= {(SUM_WIDTH){1'b0}};
              valid_y_in_sop_rew <= 1'b0;
            end
            else if ((fsm_state == 4'b0011) || (fsm_state == 4'b0110) || (fsm_state == 4'b0010)) begin   //azzera se diverso da RUN o TERMINATE_PENDING
              add_kernel[j] <= add_of[j];
              valid_y_in_sop_rew <= valid_y_in_sop;
            end
            else begin
              add_kernel[j] <= {(SUM_WIDTH){1'b0}};
              valid_y_in_sop_rew <= 1'b0;
            end
         end
      end
     
      
      
      for(i=0; i<N_COL; i++) begin : y_in_sop_reorg
        for(j=0; j<NPX; j++) begin
          assign y_in_reorg [j][i] = $signed(y_in_sop_rew[i][j]);
        end
      end
      
  /*         
      assign constant_long_8[(SUM_WIDTH/2)-1:0]  = $signed(constant_to_sum[(CONV_WIDTH/2)-1:0]);
      assign constant_long_8[SUM_WIDTH-1:(SUM_WIDTH/2)]  = $signed(constant_to_sum[CONV_WIDTH-1:(CONV_WIDTH/2)]);
   */   
      assign constant_long_16 = $signed(constant_to_sum);

      for(j=0; j<NPX; j++) // j = 0 -> 1
      begin : NPX_path
 /*     
        assign y_in_long_8[j][(SUM_WIDTH/2)-1:0]         = $signed(y_in_pipe_out[j][(CONV_WIDTH/2)-1:0]);
        assign y_in_long_8[j][SUM_WIDTH-1:(SUM_WIDTH/2)] = $signed(y_in_pipe_out[j][CONV_WIDTH-1:(CONV_WIDTH/2)]);
 */       
        assign y_in_long_16[j] = $signed(y_in_pipe_out[j]);
        
        if (USE_ADDER_TREE) begin
//          localparam ADDER_LAYERS     = $clog2(N_COL+1) + 1;
//          localparam OPERANDS_PER_LAY = 2**($clog2(N_COL+1));
//         
//          // for each layer in the adder, add one bit to the result (many bits should get optimized away)
//          localparam ADDER_WIDTH   = SUM_WIDTH;
//          
//          logic signed [NPX-1:0][N_COL+1-1:0][SUM_WIDTH-1:0]                           adder_in;
//          logic signed [NPX-1:0][ADDER_LAYERS-1:0][OPERANDS_PER_LAY-1:0][ADDER_WIDTH-1:0] adder_bits;
//        
//          assign sum_base[j] = (sum_over_constant==1'b0) ? y_in_long[j] : constant_long;      
//          assign adder_bits[j][ADDER_LAYERS-1][N_COL] = $signed(sum_base[j]<<< qf_i);
//           
//          for(add_j=0; add_j<N_COL; add_j++) begin
//            assign adder_bits[j][ADDER_LAYERS-1][add_j] = $signed(y_in_reorg[j][add_j]);
//          end   
//           
//          for(add_j=N_COL+1; add_j<OPERANDS_PER_LAY; add_j++) begin
//            assign adder_bits[j][ADDER_LAYERS-1][add_j] = 0;
//          end
//              
//          for(add_i=ADDER_LAYERS-2; add_i>=0; add_i--) begin
//            for(add_j=0; add_j<`exp2(add_i); add_j++) begin
//              assign adder_bits[j][add_i][add_j] = adder_bits[j][add_i+1][2*add_j] + adder_bits[j][add_i+1][2*add_j+1];
//            end
//          end
//             
//          assign sum[j]=adder_bits[j][0][0];     
        end
        
        else
        begin : cascade_adder //NO ADDER TREE   
          
           

        //  assign sum_base[j] = (sum_over_constant==1'b0) ? y_in_long[j] : constant_long;
          
          //8 bit path
 /*         assign sum_base_8[j][(SUM_WIDTH/2)-1:0]         = (sum_over_constant==1'b0) ? $signed(y_in_long_8[j][(SUM_WIDTH/2)-1:0])         : constant_long_8;
          assign sum_base_8[j][SUM_WIDTH-1:(SUM_WIDTH/2)] = (sum_over_constant==1'b0) ? $signed(y_in_long_8[j][SUM_WIDTH-1:(SUM_WIDTH/2)]) : constant_long_8;
 */         
          //16 bit path
          assign sum_base_16[j] = (sum_over_constant==1'b0) ? $signed(y_in_long_16[j]) : constant_long_16;
          
          
          always_comb begin
              add_of[j] = '0;
              for(integer i=0; i<N_COL; i++) begin
                   add_of[j] += y_in_reorg[j][i];
              end
          end
          
           
        end //NO ADDER TREE    
                      

        integer q,m;
        
      /*  assign sum_8[j][(SUM_WIDTH/2)-1:0]         =  (valid_y_in_sop_rew) ? add_kernel[j][(SUM_WIDTH/2)-1:0]                                             : {(48){1'b0}};
        assign sum_8[j][SUM_WIDTH-1:(SUM_WIDTH/2)] =  (valid_y_in_sop_rew) ? add_kernel[j][SUM_WIDTH-1:(SUM_WIDTH/2)] + {{(23){1'b0}}, add_kernel[j][23]} : {(48){1'b0}};
	*/
        
        //assign sum_16[j] = (valid_y_in_sop_rew) ? add_kernel[j] : {(48){1'b0}};
        
        assign sum_16[j] = (valid_y_in_sop_rew) ? add_kernel[j] : {(48){1'b0}};
        
        //8 bit path
        /*always_comb
        begin : runtime_config_shift_8
          sum_partial_shifted_8[j][(SUM_WIDTH/2)-1:0]         = $signed($signed(sum_8[j][(SUM_WIDTH/2)-1:0]) >>> 0);
          sum_partial_shifted_8[j][SUM_WIDTH-1:(SUM_WIDTH/2)] = $signed($signed(sum_8[j][SUM_WIDTH-1:(SUM_WIDTH/2)]) >>> 0);
          
          for (q=QF_MIN;q<=QF_MAX; q = q + QF_STEP)
          begin : qf_cases_8
            if (qf_i==q) begin
              sum_partial_shifted_8[j][(SUM_WIDTH/2)-1:0]         = $signed($signed(sum_8[j][(SUM_WIDTH/2)-1:0]) >>> q);
              sum_partial_shifted_8[j][SUM_WIDTH-1:(SUM_WIDTH/2)] = $signed($signed(sum_8[j][SUM_WIDTH-1:(SUM_WIDTH/2)]) >>> q);
             end
          end
        end*/
        
        //16 bit path
        always_comb
        begin : runtime_config_shift_16
          sum_partial_shifted_16[j] = $signed($signed(sum_16[j]) >>> 0);
          
          for (m=QF_MIN;m<=QF_MAX; m = m + QF_STEP)
          begin : qf_cases_16
            if (qf_i==m) begin
              sum_partial_shifted_16[j] = $signed($signed(sum_16[j]) >>> m);
             end
          end
        end
        
        
       /* always_comb begin : saturation_logic_8
        
          sum_shifted_8[j][(SUM_WIDTH/2)-1:0]         = sum_base_8[j][(SUM_WIDTH/2)-1:0]         + sum_partial_shifted_8[j][(SUM_WIDTH/2)-1:0];
          sum_shifted_8[j][SUM_WIDTH-1:(SUM_WIDTH/2)] = sum_base_8[j][SUM_WIDTH-1:(SUM_WIDTH/2)] + sum_partial_shifted_8[j][SUM_WIDTH-1:(SUM_WIDTH/2)];
          
          // saturation
          
          if (sum_shifted_8[j][(SUM_WIDTH/2)-1:8-1]=={((SUM_WIDTH/2)-8+1){1'b0}} || 
              sum_shifted_8[j][(SUM_WIDTH/2)-1:8-1]=={((SUM_WIDTH/2)-8+1){1'b1}})
              sum_saturate_8[j][0] = 1'b0;
          else
            sum_saturate_8[j][0] = 1'b1;
          
          if (sum_shifted_8[j][SUM_WIDTH-1:(SUM_WIDTH/2)+8-1]=={((SUM_WIDTH/2)-8+1){1'b0}} || 
              sum_shifted_8[j][SUM_WIDTH-1:(SUM_WIDTH/2)+8-1]=={((SUM_WIDTH/2)-8+1){1'b1}})
              sum_saturate_8[j][1] = 1'b0;
          else
            sum_saturate_8[j][1] = 1'b1;
              
            //for(int i=0; i<SUM_WIDTH-CONV_WIDTH; i++)
            //   sum_saturate[j] = sum_saturate[j] ^ sum_shifted[j][CONV_WIDTH+i: ];
               
            if(sum_saturate_8[j][0]==1'b1)
               if(sum_shifted_8[j][(SUM_WIDTH/2)-1]==1'b1)
                  sum_short_8[j][(CONV_WIDTH/2)-1:0] = {1'b1, {(8-1){1'b0}}}; // saturation -
               else                  
                  sum_short_8[j][(CONV_WIDTH/2)-1:0] = {1'b0, {(8-1){1'b1}}}; // saturation +
            else               
               sum_short_8[j][(CONV_WIDTH/2)-1:0] = sum_shifted_8[j][(CONV_WIDTH/2)-1:0]; // no saturation
               
            if(sum_saturate_8[j][1]==1'b1)
               if(sum_shifted_8[j][SUM_WIDTH-1]==1'b1)
                  sum_short_8[j][CONV_WIDTH-1:(CONV_WIDTH/2)] = {1'b1, {(8-1){1'b0}}}; // saturation -
               else                  
                  sum_short_8[j][CONV_WIDTH-1:(CONV_WIDTH/2)] = {1'b0, {(8-1){1'b1}}}; // saturation +
            else               
               sum_short_8[j][CONV_WIDTH-1:(CONV_WIDTH/2)] = sum_shifted_8[j][(SUM_WIDTH/2)-1+(CONV_WIDTH/2):(SUM_WIDTH/2)]; // no saturation
               
        end // saturation_logic_8*/
        
        always_comb begin : saturation_logic_16
        
          sum_shifted_16[j] = sum_base_16[j] + sum_partial_shifted_16[j];
          
          // saturation
          
          if (sum_shifted_16[j][SUM_WIDTH-1:CONV_WIDTH-1]=={(SUM_WIDTH-CONV_WIDTH+1){1'b0}} || 
              sum_shifted_16[j][SUM_WIDTH-1:CONV_WIDTH-1]=={(SUM_WIDTH-CONV_WIDTH+1){1'b1}})
              sum_saturate_16[j] = 1'b0;
          else
            sum_saturate_16[j] = 1'b1;
              
            //for(int i=0; i<SUM_WIDTH-CONV_WIDTH; i++)
            //   sum_saturate[j] = sum_saturate[j] ^ sum_shifted[j][CONV_WIDTH+i: ];
               
            if(sum_saturate_16[j]==1'b1)
               if(sum_shifted_16[j][SUM_WIDTH-1]==1'b1)
                  sum_short_16[j] = {1'b1, {(CONV_WIDTH-1){1'b0}}}; // saturation -
               else                  
                  sum_short_16[j] = {1'b0, {(CONV_WIDTH-1){1'b1}}}; // saturation +
            else               
               sum_short_16[j] = sum_shifted_16[j][CONV_WIDTH-1:0]; // no saturation
               
        end // saturation_logic_16
        
      /*  assign max_8[j][CONV_WIDTH-1:(CONV_WIDTH/2)] = (sum_short_8[j][CONV_WIDTH-1] == 0 )     ? $signed(sum_short_8[j][CONV_WIDTH-1:(CONV_WIDTH/2)]) : {(8){1'b0}};
        assign max_8[j][(CONV_WIDTH/2)-1:0]          = (sum_short_8[j][(CONV_WIDTH/2)-1] == 0 ) ? $signed(sum_short_8[j][(CONV_WIDTH/2)-1:0])          : {(8){1'b0}};*/
           
        assign max_16[j][CONV_WIDTH-1:0] = (sum_short_16[j][CONV_WIDTH-1] == 0 ) ? $signed(sum_short_16[j][CONV_WIDTH-1:0]) : {(CONV_WIDTH){1'b0}}; //RECTIFIER ACTIVATION FUNCTION

      end // pxc_gen

   endgenerate // data path
   
   assign sum_out_short = (precision8) ? sum_short_8 : sum_short_16;
   assign max           = (precision8) ? max_8       : max_16;
   
   assign y_out = (rectifier_activ) ? max : sum_out_short;
   assign valid_y_out = valid_y_in_pipe_out & &valid_y_in_sop_rew;

endmodule
