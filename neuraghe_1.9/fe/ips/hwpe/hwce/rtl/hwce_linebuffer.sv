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
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           hwce_linebuffer.sv                                         *
 * Description:    HWCE line buffer                                           *
 *                                                                            *
 ******************************************************************************/

`include "hwce_types.sv"

module hwce_linebuffer
#(
   parameter NPX              = 1,
   parameter AXI_WIDTH        = 32,
   parameter CONV_WIDTH       = 32,
   parameter FS               = 5,
   parameter LINEBUFFER_WIDTH = 32,
   parameter LINEAR_SUPPORTED = 1,
   parameter INPUT_FIFO       = 1,
   parameter OUTPUT_FIFO      = 0
)
(
   input  logic                                   clk,
   input  logic                                   rst_n,
   input  logic                                   enable,
   
   input  logic                                   valid_in,
   input  stream_flags_t                          flags_in,
   output logic                                   ready_in,
   input  logic           [3-1:0][AXI_WIDTH -1:0] x_in,
   
   output logic                                   valid_out,
   output stream_flags_t                          flags_out,
   input  logic                                   ready_out,
   output logic [NPX-1:0][27-1:0][CONV_WIDTH-1:0] x_filter,
   
   input  logic [3:0]                             fsm_state,
   input  engine_params_t                         engine_params,
   input  logic [2:0]                             filter_size,
   input  logic [2:0]                             zero_padding_i, // {no_bottom, no_top, zp}
   input  logic                                   precision8
);

 
   localparam LINE_REG_LEN = 3; // three words, 6 pixels
   localparam NPX_8 = 4;
   localparam NPX_16 = 2;


 //  logic                         ex_valid_ready;
 //  logic [2:0]                   ex_fsm_state;

   logic                         valid_in_fifo;
   logic                         ready_in_fifo;
   stream_flags_t                flags_input_fifo;
   logic [3-1:0][AXI_WIDTH -1:0] x_in_fifo;

   (* srl_style = "srl" *) logic [3*3-1:0] [LINEBUFFER_WIDTH-LINE_REG_LEN-1:0][AXI_WIDTH-1:0]  line_srl;
   
                           logic [3*3-1:0] [LINE_REG_LEN-1:0]                 [AXI_WIDTH-1:0]  line_reg;
                           
                           //logic [3*3-1:0] [NPX*LINE_REG_LEN-1:0]         [CONV_WIDTH-1:0] line_reg_rew;           
                           
                           
                           logic [3  -1:0]                                    [AXI_WIDTH -1:0] line_input;
     
   logic           [3-1:0][AXI_WIDTH -1:0] x_in_mir;
   
   //for 8 bit path (da parametrizzare)
   logic [3*3-1:0] [NPX_8*LINE_REG_LEN-1:0]  [8-1:0] line_reg_rew_8;
   
   logic [NPX_8-1:0]    [27-1:0]    [8-1:0] x_filter_rew_pre_8;
   logic [NPX_8-1:0]    [27-1:0]    [8-1:0] x_filter_rew_post_8;
   
   logic [NPX_8-1:0][27-1:0][8-1:0] x_filter_pre_zp_8;
   logic [NPX_8-1:0][27-1:0][8-1:0] x_filter_post_zp_8;
   logic [NPX_8*27-1:0 ]    [8-1:0] x_filter_pre_zp_rew_8;
   logic [NPX_8*27-1:0 ]    [8-1:0] x_filter_post_zp_rew_8;

   logic [NPX_8-1:0][3-1:0][3-1:0][3-1:0][8-1:0] x_filter_3x3_8;
   logic [NPX_8-1:0][3-1:0][3-1:0][3-1:0][8-1:0] x_filter_3x3_nozp_8;
   logic [NPX_8-1:0][3-1:0][3-1:0][3-1:0][8-1:0] x_filter_3x3_zp_8;

   logic [NPX_8-1:0]       [5-1:0][5-1:0][8-1:0] x_filter_5x5_8;
   
   //for 16 bit path
   logic [3*3-1:0] [NPX_16*LINE_REG_LEN-1:0]         [CONV_WIDTH-1:0] line_reg_rew_16;
   
   logic [NPX_16-1:0]    [27-1:0]    [CONV_WIDTH-1:0] x_filter_rew_pre_16;
   logic [NPX_16-1:0]    [27-1:0]    [CONV_WIDTH-1:0] x_filter_rew_post_16;
   
   logic [NPX_16-1:0][27-1:0][CONV_WIDTH-1:0] x_filter_pre_zp_16;
   logic [NPX_16-1:0][27-1:0][CONV_WIDTH-1:0] x_filter_post_zp_16;
   logic [NPX_16*27-1:0 ]    [CONV_WIDTH-1:0] x_filter_pre_zp_rew_16;
   logic [NPX_16*27-1:0 ]    [CONV_WIDTH-1:0] x_filter_post_zp_rew_16;

   logic [NPX_16-1:0][3-1:0][3-1:0][3-1:0][CONV_WIDTH-1:0] x_filter_3x3_16;
   logic [NPX_16-1:0][3-1:0][3-1:0][3-1:0][CONV_WIDTH-1:0] x_filter_3x3_nozp_16;
   logic [NPX_16-1:0][3-1:0][3-1:0][3-1:0][CONV_WIDTH-1:0] x_filter_3x3_zp_16;

   logic [NPX_16-1:0]       [5-1:0][5-1:0][CONV_WIDTH-1:0] x_filter_5x5_16;
   
   logic [NPX-1:0][27-1:0][CONV_WIDTH-1:0] x_filter_8;
   logic [NPX-1:0][27-1:0][CONV_WIDTH-1:0] x_filter_16;
   
   genvar n,w;

    for(n=0; n<NPX_16; n++) begin
      for(w=0; w<27; w++) begin
        assign x_filter_8[n][w] = (zero_padding_i[0]) ? {x_filter_post_zp_8[(n*2)+1][w] , x_filter_post_zp_8[n*2][w] } : 
                                                   {x_filter_pre_zp_8 [(n*2)+1][w] , x_filter_pre_zp_8 [n*2][w] };
      end
    end

    assign x_filter_16 = (zero_padding_i[0])? x_filter_post_zp_16 : x_filter_pre_zp_16;
   
   
   assign x_filter = (precision8) ? x_filter_8 : x_filter_16;
   
   logic [1:0] fsm_state_int;
   assign fsm_state_int = fsm_state[1:0];

   
   logic [$clog2(LINEBUFFER_WIDTH) - 1 :0]                bypass;
   logic                                                  linear_conv;
   logic [15 : 0] line_length;
   logic [15 : 0] feat_length;
  
   assign line_length  = engine_params.stream_config[8].line_length;
   assign feat_length  = engine_params.stream_config[8].feat_length;
  
   assign bypass       = engine_params.linebuf_length[$clog2(LINEBUFFER_WIDTH) - 1 :0];
   assign linear_conv  = engine_params.linear_conv;
   
   
   logic [16-1:0] word_counter;
   logic [16-1:0] line_counter;

   generate
      if(INPUT_FIFO==1) begin : input_fifo_gen   
         hwpe_axi_fifo #(
           .DATA_WIDTH (3*AXI_WIDTH+4),
           .DATA_DEPTH (2          ),
           .LATCH_FIFO (0          )
         ) input_fifo_i (
           .clk       (clk                             ),
           .rst_n     (rst_n                           ),
           .data_in   ({x_in,         flags_in        }),
           .valid_in  (valid_in                        ),
           .grant_out (ready_in                        ),
           .data_out  ({x_in_fifo, flags_input_fifo}),
           .valid_out (valid_in_fifo                ),
           .grant_in  (ready_in_fifo                )
         );
      end
      else begin : no_input_fifo_gen
         assign x_in_fifo = x_in;
         assign flags_input_fifo = flags_in;
         assign valid_in_fifo = valid_in;
         assign ready_in = ready_in_fifo;
      end
   endgenerate

  logic line_update_del;
  logic feat_update_del;
  
  logic [LINEBUFFER_WIDTH-1 : 0] line_update_srl;
  
    
  logic [(NPX_8*27) - 1 : 0] mask_8;
  logic [(NPX_16*27) - 1 : 0] mask_16;
  
  logic w0;
  logic wmax;
  logic l0;
  logic lmax;
  logic l1;
  logic lmaxm1;
  logic fs3;
  
  
  
  // line_update_srl is used to generate a line_update signal for the last line of the image in 5x5 zp windows.
  integer p;
  always_ff @(posedge clk)
  begin
    if ((valid_in_fifo && ready_out) == 1'b1)
      for (p=0;p<LINEBUFFER_WIDTH-1;p++) // check this
      begin : line_srl_update
        
        line_update_srl [p+1] <= line_update_srl [p];
        line_update_srl [0]   <= feat_update_del;
      end
    
  end
  
  
  
  always_ff @(posedge clk)
  begin
    if(rst_n==1'b0)
    begin
      line_update_del<=1'b0;
      feat_update_del<=1'b0;    
    end
    else
    begin
       if((ready_in_fifo==1'b1) && (valid_in_fifo==1'b1)) begin
          line_update_del<=flags_at_ready.line_update;
          feat_update_del<=flags_at_ready.feat_update;
       end
    end
  end

  always_ff @(posedge clk)
  begin
    if(rst_n==1'b0)
    begin
      word_counter<=1'b0;
      line_counter<=1'b0;
    end
    else
    begin
      if ((fsm_state_int==2'b11) || (fsm_state_int==2'b10)) // RUN, CHANGE_FEAT or TERM PENDING
      begin
        if((valid_in_fifo && ready_out) == 1'b1)
        begin
          if(line_update_del == 1'b1 || line_update_srl[line_length-1]==1'b1 && lmaxm1)
          begin
            //if(feat_update_del == 1'b1)
            //begin
              //line_counter <= 1'b0;
              //word_counter <= 1'b0;
            //end
            //else
            //begin
              line_counter <= line_counter + 1'b1;
              word_counter <= 1'b0;
            //end
          end
          else
          begin
            line_counter <= line_counter;
            word_counter <= word_counter + 1'b1;
          end
          
        end
      end
      else
      begin
        line_counter <= 1'b0;
        word_counter <= 1'b0;        
      end
    end
  end


  
  genvar i, j, k, q, m;
  generate
    for (q=0; q<3*3;q++)
    begin    
      always_ff @(posedge clk)
      begin
        if((valid_in_fifo & ready_in_fifo) == 1'b1)
        begin
         
           for (p=0;p<LINEBUFFER_WIDTH-LINE_REG_LEN-1;p++)
           begin : line_srl_update
             line_srl [q][p+1] <= line_srl [q][p];
           end
             line_srl [q][0]   <= line_reg [q][LINE_REG_LEN-1];  // check this
           
           for (p=0;p<LINE_REG_LEN-1;p++)
           begin : line_reg_update
             line_reg [q][p+1] <= line_reg [q][p];
           end     
                  
           if (q==0) 
             line_reg [q][0]   <= line_input[0];               
           else if (q==3) 
             line_reg [q][0]   <= line_input[1];               
           else if (q==6) 
             line_reg [q][0]   <= line_input[2];               
           else
            begin
            if(bypass-1 < LINE_REG_LEN)
              line_reg [q][0]   <= line_reg [q-1][bypass-1];
            else
              line_reg [q][0]   <= line_srl[q-1][bypass-LINE_REG_LEN-1];  
            end                
                    
         end      
       end
    end  
  endgenerate  
  
  
  generate      
    for (i=0; i<3*3;i++)
    begin
      assign line_reg_rew_8[i]        = line_reg [i];
      assign line_reg_rew_16[i]       = line_reg [i];
    end
  
  endgenerate
  
  generate
  for(m=0; m<NPX; m++)begin
       assign x_in_mir [0][CONV_WIDTH-1 + m*CONV_WIDTH : m*CONV_WIDTH]   = {x_in_fifo[0][(CONV_WIDTH/2)-1 + m*CONV_WIDTH : m*CONV_WIDTH],x_in_fifo[0][CONV_WIDTH-1 + m*CONV_WIDTH : (CONV_WIDTH/2) + m*CONV_WIDTH]};       
       assign x_in_mir [1][CONV_WIDTH-1 + m*CONV_WIDTH : m*CONV_WIDTH]   = {x_in_fifo[1][(CONV_WIDTH/2)-1 + m*CONV_WIDTH : m*CONV_WIDTH],x_in_fifo[1][CONV_WIDTH-1 + m*CONV_WIDTH : (CONV_WIDTH/2) + m*CONV_WIDTH]};       
       assign x_in_mir [2][CONV_WIDTH-1 + m*CONV_WIDTH : m*CONV_WIDTH]   = {x_in_fifo[2][(CONV_WIDTH/2)-1 + m*CONV_WIDTH : m*CONV_WIDTH],x_in_fifo[2][CONV_WIDTH-1 + m*CONV_WIDTH : (CONV_WIDTH/2) + m*CONV_WIDTH]};
  end
  endgenerate
  
  always_comb
  begin : filter_size_mux  
    
    if (filter_size==3)
    begin  
      line_input[0] = (precision8) ? x_in_mir [0] : x_in_fifo[0]; // feature 0
      line_input[1] = (precision8) ? x_in_mir [1] : x_in_fifo[1]; // feature 1  
      line_input[2] = (precision8) ? x_in_mir [2] : x_in_fifo[2]; // feature 2
    end
    else
    begin
      line_input[0] = (precision8) ? x_in_mir [0] : x_in_fifo[0]; // feature 0
      line_input[1] = (bypass-1 < LINE_REG_LEN) ? line_reg [2][bypass-1] : line_srl[2][bypass-LINE_REG_LEN-1];
      line_input[2] = 0;      
    end
  end
  
  
  
  
  assign w0     = (word_counter == 16'h00)              ? 1'b1 : 1'b0;
  assign wmax   = (word_counter == line_length-16'h01)  ? 1'b1 : 1'b0;
 
  assign fs3    = (filter_size  == 2'h3)                ? 1'b1 : 1'b0;
  
  
  
  // {no_bottom, no_top, zp} -> top tile 3'b101; mid tile 3'b111; bot tile 3'b011; only one tile 3'b001
  // if zero padding is disabled for top there is not top line nor first line, all are middle lines.
  // if zero padding is disabled for bottop there is not bottom line nor above bottom line, all are middle lines.
 
  always_comb 
  begin 
    casez (zero_padding_i)
      3'bzz0 : // no zp
      begin
        l0     = 1'b0;
        l1     = 1'b0;
        
        lmaxm1 = 1'b0;
        lmax   = 1'b0; 
      end
      3'b001 : // zp, only one tile
      begin
        l0     = (line_counter == 16'h00              )  ? 1'b1 : 1'b0;
        l1     = ((line_counter == 16'h01)            )  ? 1'b1 : 1'b0;
        
        lmaxm1 = ((line_counter == feat_length-16'h02))  ? 1'b1 : 1'b0;
        lmax   = ((line_counter == feat_length-16'h01))  ? 1'b1 : 1'b0; 
        
      end
      3'b011 : // bot tile 
      begin
        l0     = 1'b0;
        l1     = 1'b0;
        if (fs3) begin
          lmaxm1 = ((line_counter == feat_length-16'h02-16'h01))  ? 1'b1 : 1'b0;
          lmax   = ((line_counter == feat_length-16'h01-16'h01))  ? 1'b1 : 1'b0; 
        end
        else
        begin
          lmaxm1 = ((line_counter == feat_length-16'h02-16'h02))  ? 1'b1 : 1'b0;
          lmax   = ((line_counter == feat_length-16'h01-16'h02))  ? 1'b1 : 1'b0; 
        end
        
      end
      3'b101 : // top tile
      begin
        l0     = (line_counter == 16'h00              )  ? 1'b1 : 1'b0;
        l1     = ((line_counter == 16'h01)            )  ? 1'b1 : 1'b0;
        
        lmaxm1 = 1'b0;        
        lmax   = 1'b0; 
        
      end
      3'b111 : // mid tile
      begin
        l0     = 1'b0;
        l1     = 1'b0;
        
        lmaxm1 = 1'b0;
        lmax   = 1'b0; 
        
      end
      
      default: 
      begin
        l0     = 1'b0;
        l1     = 1'b0;
        
        lmaxm1 = 1'b0;
        lmax   = 1'b0; 
        
      end
    endcase
  end

 
  /*
  assign l0     = (line_counter == 16'h00               && ~zero_padding_i[1])  ? 1'b1 : 1'b0;
  assign lmax   = ((line_counter == feat_length-16'h01) && ~zero_padding_i[2])  ? 1'b1 : 1'b0; 
  
  assign l1     = ((line_counter == 16'h01)             && ~zero_padding_i[1])  ? 1'b1 : 1'b0;
  assign lmaxm1 = ((line_counter == feat_length-16'h02) && ~zero_padding_i[2])  ? 1'b1 : 1'b0;
  */
  
  /*
  3x3 mask for the upper left corner. Because windows are reversed in x and y axes first pixel is in the bottom right corner
        
           1 1 0    1 1 0    1 1 0
  win 0    1 1 0    1 1 0    1 1 0
           0 0 0    0 0 0    0 0 0
           
           1 1 1    1 1 1    1 1 1
  win 1    1 1 1    1 1 1    1 1 1
           0 0 0    0 0 0    0 0 0
           
                54 weigths
           
           
           
           
  5x5 mask for the upper left corner.  
  
           1 1 1 0 0 
           1 1 1 0 0
  win 0    1 1 1 0 0   
           0 0 0 0 0
           0 0 0 0 0    0 0
           
           1 1 1 1 0
           1 1 1 1 0
  win 1    1 1 1 1 0
           0 0 0 0 0
           0 0 0 0 0    0 0
           
           50 weigths, 4 are always zero to reach the total amount of 54.
  */
  
  
  
  //9 + 15 masks. 9 for 3x3 filters and 15 for 5x5 filters .
  // each mask has 54 binary weigths
  generate
  
  always_comb 
  begin : mask_8_LUT
    casez ({fs3,  w0,wmax,  l0,lmax,  l1,lmaxm1})
      //3x3 mask_8s                  win 1 ,            win 0
      //                         {53,52,51,50,..........,3,2,1,0}
      7'b1_10_10_zz : mask_8 = {{3{9'b000111111}},{3{9'b000111111}},{3{9'b000111111}},{3{9'b000011011}}}; // upper-left corner
      7'b1_00_10_zz : mask_8 = {{3{9'b000111111}},{3{9'b000111111}},{3{9'b000111111}},{3{9'b000111111}}}; // top
      7'b1_01_10_zz : mask_8 = {{3{9'b000110110}},{3{9'b000111111}},{3{9'b000111111}},{3{9'b000111111}}}; // upper-right corner
      
      7'b1_10_00_zz : mask_8 = {{3{9'b111111111}},{3{9'b111111111}},{3{9'b111111111}},{3{9'b011011011}}}; // left
      7'b1_00_00_zz : mask_8 = {{3{9'b111111111}},{3{9'b111111111}},{3{9'b111111111}},{3{9'b111111111}}}; // center
      7'b1_01_00_zz : mask_8 = {{3{9'b110110110}},{3{9'b111111111}},{3{9'b111111111}},{3{9'b111111111}}}; // right
      
      7'b1_10_01_zz : mask_8 = {{3{9'b111111000}},{3{9'b111111000}},{3{9'b111111000}},{3{9'b011011000}}}; // bottom-left corner
      7'b1_00_01_zz : mask_8 = {{3{9'b111111000}},{3{9'b111111000}},{3{9'b111111000}},{3{9'b111111000}}}; // bottom
      7'b1_01_01_zz : mask_8 = {{3{9'b110110000}},{3{9'b111111000}},{3{9'b111111000}},{3{9'b111111000}}}; // bottom-right corner
      
      // 5x5 mask_8s
      7'b0_10_10_00 : mask_8 = 108'b000000000000111111111111111_000000000000111111111111111_000000000000011110111101111_000000000000001110011100111; // upper-left corner
      7'b0_00_10_00 : mask_8 = 108'b000000000000111111111111111_000000000000111111111111111_000000000000111111111111111_000000000000111111111111111; // top
      7'b0_01_10_00 : mask_8 = 108'b000000000000111001110011100_000000000000111101111011110_000000000000111111111111111_000000000000111111111111111; // upper-right corner
                                 
      7'b0_10_00_10 : mask_8 = 108'b000000011111111111111111111_000000011111111111111111111_000000001111011110111101111_000000000111001110011100111; // upper-left corner, one line below
      7'b0_00_00_10 : mask_8 = 108'b000000011111111111111111111_000000011111111111111111111_000000011111111111111111111_000000011111111111111111111; // top, one line below
      7'b0_01_00_10 : mask_8 = 108'b000000011100111001110011100_000000011110111101111011110_000000011111111111111111111_000000011111111111111111111; // upper-right corner, one line below
      
      7'b0_10_00_00 : mask_8 = 108'b001111111111111111111111111_001111111111111111111111111_000111101111011110111101111_000011100111001110011100111; // left
      7'b0_00_00_00 : mask_8 = 108'b001111111111111111111111111_001111111111111111111111111_001111111111111111111111111_001111111111111111111111111; // center
      7'b0_01_00_00 : mask_8 = 108'b001110011100111001110011100_001111011110111101111011110_001111111111111111111111111_001111111111111111111111111; // right
      
      7'b0_10_00_01 : mask_8 = 108'b001111111111111111111100000_001111111111111111111100000_000111101111011110111100000_000011100111001110011100000; // bottom-left corner, one line above
      7'b0_00_00_01 : mask_8 = 108'b001111111111111111111100000_001111111111111111111100000_001111111111111111111100000_001111111111111111111100000; // bottom, one line above
      7'b0_01_00_01 : mask_8 = 108'b001110011100111001110000000_001111011110111101111000000_001111111111111111111100000_001111111111111111111100000; // bottom-right corner, one line above
      
      7'b0_10_01_00 : mask_8 = 108'b001111111111111110000000000_001111111111111110000000000_000111101111011110000000000_000011100111001110000000000; // bottom-left corner
      7'b0_00_01_00 : mask_8 = 108'b001111111111111110000000000_001111111111111110000000000_001111111111111110000000000_001111111111111110000000000; // bottom
      7'b0_01_01_00 : mask_8 = 108'b001110011100111000000000000_001111011110111100000000000_001111111111111110000000000_001111111111111110000000000; // bottom-right corner
      
      default       : mask_8 = 108'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    endcase
    end
  
  
  always_comb 
  begin : mask_16_LUT
    casez ({fs3,  w0,wmax,  l0,lmax,  l1,lmaxm1})
      //3x3 mask_16s                  win 1 ,            win 0
      //                         {53,52,51,50,..........,3,2,1,0}
      7'b1_10_10_zz : mask_16 = {{3{9'b000111111}},{3{9'b000011011}}}; // upper-left corner
      7'b1_00_10_zz : mask_16 = {{3{9'b000111111}},{3{9'b000111111}}}; // top
      7'b1_01_10_zz : mask_16 = {{3{9'b000110110}},{3{9'b000111111}}}; // upper-right corner
      
      7'b1_10_00_zz : mask_16 = {{3{9'b111111111}},{3{9'b011011011}}}; // left
      7'b1_00_00_zz : mask_16 = {{3{9'b111111111}},{3{9'b111111111}}}; // center
      7'b1_01_00_zz : mask_16 = {{3{9'b110110110}},{3{9'b111111111}}}; // right
      
      7'b1_10_01_zz : mask_16 = {{3{9'b111111000}},{3{9'b011011000}}}; // bottom-left corner
      7'b1_00_01_zz : mask_16 = {{3{9'b111111000}},{3{9'b111111000}}}; // bottom
      7'b1_01_01_zz : mask_16 = {{3{9'b110110000}},{3{9'b111111000}}}; // bottom-right corner
      
      // 5x5 mask_16s
      7'b0_10_10_00 : mask_16 = 54'b000000000000011110111101111_000000000000001110011100111; // upper-left corner
      7'b0_00_10_00 : mask_16 = 54'b000000000000111111111111111_000000000000111111111111111; // top
      7'b0_01_10_00 : mask_16 = 54'b000000000000111001110011100_000000000000111101111011110; // upper-right corner
                                 
      7'b0_10_00_10 : mask_16 = 54'b000000001111011110111101111_000000000111001110011100111; // upper-left corner, one line below
      7'b0_00_00_10 : mask_16 = 54'b000000011111111111111111111_000000011111111111111111111; // top, one line below
      7'b0_01_00_10 : mask_16 = 54'b000000011100111001110011100_000000011110111101111011110; // upper-right corner, one line below
      
      7'b0_10_00_00 : mask_16 = 54'b000111101111011110111101111_000011100111001110011100111; // left
      7'b0_00_00_00 : mask_16 = 54'b001111111111111111111111111_001111111111111111111111111; // center
      7'b0_01_00_00 : mask_16 = 54'b001110011100111001110011100_001111011110111101111011110; // right
      
      7'b0_10_00_01 : mask_16 = 54'b000111101111011110111100000_000011100111001110011100000; // bottom-left corner, one line above
      7'b0_00_00_01 : mask_16 = 54'b001111111111111111111100000_001111111111111111111100000; // bottom, one line above
      7'b0_01_00_01 : mask_16 = 54'b001110011100111001110000000_001111011110111101111000000; // bottom-right corner, one line above
      
      7'b0_10_01_00 : mask_16 = 54'b000111101111011110000000000_000011100111001110000000000; // bottom-left corner
      7'b0_00_01_00 : mask_16 = 54'b001111111111111110000000000_001111111111111110000000000; // bottom
      7'b0_01_01_00 : mask_16 = 54'b001110011100111000000000000_001111011110111100000000000; // bottom-right corner
      
      default       : mask_16 = 54'b000000000000000000000000000000000000000000000000000000;
    endcase
  end
  
  endgenerate

  localparam REW_IDX = NPX*LINE_REG_LEN - NPX;
  
  
  //8 bit path
  
  generate
    for (i=0; i<NPX_8; i++) begin // win
      for (j=0; j<3; j++) begin // filter
        for (k=0; k<3;k++) begin //line 
                   
          assign x_filter_3x3_nozp_8 [i][j][k]= line_reg_rew_8[j*3+k] [NPX_8*LINE_REG_LEN - NPX_8 - i -1     : NPX_8*LINE_REG_LEN - NPX_8 - 2 - i -1]; /*[5-i+3 -1   : 5-i];*/
          assign x_filter_3x3_zp_8   [i][j][k]= line_reg_rew_8[j*3+k] [1 + NPX_8*LINE_REG_LEN - NPX_8 - i -1 : 1 + NPX_8*LINE_REG_LEN - NPX_8 - 2 - i -1]; /*[5-i+1+3 -1 : 5-i+1];*/
          
        end  
      end
    end
  endgenerate

  generate
    for (i=0; i<NPX_8; i++) begin // win
      for (k=0; k<5;k++) begin //line 
       
        assign x_filter_5x5_8 [i][k]= line_reg_rew_8[k] [NPX_8*LINE_REG_LEN - NPX_8 +2 -i -1 : NPX_8*LINE_REG_LEN - NPX_8 +2 -4 -i-1]; /*[5-i+5 -1 : 5-i];*/
       
      end 
    end    
  endgenerate
  
  assign x_filter_3x3_8 = (zero_padding_i[0]) ? x_filter_3x3_zp_8 : x_filter_3x3_nozp_8;
  
   generate
    for (i=0; i<NPX_8; i++) begin
      assign x_filter_pre_zp_8[i] = (filter_size==3'h3)? x_filter_3x3_8[i] : {16'h0000,x_filter_5x5_8[i]};
    end      
  endgenerate
  
  assign x_filter_pre_zp_rew_8 = x_filter_pre_zp_8;
  
  generate
    for (i=0; i<NPX_8*27; i++)
      assign x_filter_post_zp_rew_8[i] = (mask_8 [i]) ? x_filter_pre_zp_rew_8[i] : 1'b0;
  endgenerate
  
  assign x_filter_post_zp_8 = x_filter_post_zp_rew_8;
  
  
  //16 bit path
  
  generate
    for (i=0; i<NPX_16; i++) begin // win
      for (j=0; j<3; j++) begin // filter
        for (k=0; k<3;k++) begin //line 
                   
          assign x_filter_3x3_nozp_16 [i][j][k]= line_reg_rew_16[j*3+k] [NPX_16*LINE_REG_LEN - NPX_16 - i -1     : NPX_16*LINE_REG_LEN - NPX_16 - 2 - i -1]; /*[5-i+3 -1   : 5-i];*/
          assign x_filter_3x3_zp_16   [i][j][k]= line_reg_rew_16[j*3+k] [1 + NPX_16*LINE_REG_LEN - NPX_16 - i -1 : 1 + NPX_16*LINE_REG_LEN - NPX_16 - 2 - i -1]; /*[5-i+1+3 -1 : 5-i+1];*/
          
        end  
      end
    end
  endgenerate

  generate
    for (i=0; i<NPX_16; i++) begin // win
      for (k=0; k<5;k++) begin //line 
       
        assign x_filter_5x5_16 [i][k]= line_reg_rew_16[k] [NPX_16*LINE_REG_LEN - NPX_16 +2 -i -1 : NPX_16*LINE_REG_LEN - NPX_16 +2 -4 -i-1]; /*[5-i+5 -1 : 5-i];*/
       
      end 
    end    
  endgenerate
  
  assign x_filter_3x3_16 = (zero_padding_i[0]) ? x_filter_3x3_zp_16 : x_filter_3x3_nozp_16;
  
  generate
    for (i=0; i<NPX_16; i++) begin
      assign x_filter_pre_zp_16[i] = (filter_size==3'h3)? x_filter_3x3_16[i] : {32'h00000000,x_filter_5x5_16[i]};
    end      
  endgenerate
  
  assign x_filter_pre_zp_rew_16 = x_filter_pre_zp_16;
  
  generate
    for (i=0; i<NPX_16*27; i++)
      assign x_filter_post_zp_rew_16[i] = (mask_16 [i]) ? x_filter_pre_zp_rew_16[i] : 1'b0;
  endgenerate
  
  assign x_filter_post_zp_16 = x_filter_post_zp_rew_16;
  
   stream_flags_t   flags_out_prefifo;
   stream_flags_t   flags_at_ready;

   logic [6 - 1 :0] line_update_shiftreg;
   logic            to_remove;
   
    assign flags_out_prefifo = flags_at_ready;


   always_ff @(posedge clk or negedge rst_n)
   begin
      if(rst_n==1'b0) begin
         flags_at_ready <= 0;
      end
      else if((ready_in_fifo==1'b1) && (valid_in_fifo==1'b1)) begin
         flags_at_ready <= flags_input_fifo;
      end
   end
   
   
   
   logic            valid_at_ready;


         assign ready_in_fifo = ((fsm_state==4'b0001) || (fsm_state==4'b0001)) ? 1'b1 : ready_out | to_remove;
         assign valid_out        = ((fsm_state_int==2'b11) || (fsm_state_int==2'b10)) ? (valid_in_fifo & ~to_remove) : 1'b0; // RUN, CHANGE_FEAT or TERM PENDING
         
        // assign x_filter = x_filter_prefifo;
         assign flags_out = flags_out_prefifo;

         always_ff @(posedge clk or negedge rst_n)
         begin
            if(rst_n == 1'b0) begin
               for (int k=0; k<6; k++)
                  line_update_shiftreg[k] <= 1'b0;
            end
            else if((ready_in_fifo == 1'b1) && (valid_in_fifo == 1'b1)) begin
               line_update_shiftreg[0] <= flags_out_prefifo.line_update;
               for (int k=1; k<6; k++)
                  line_update_shiftreg[k] <= line_update_shiftreg[k-1];
            end
         end
         
         always_comb begin
           case (filter_size)
             3'd5: to_remove = (line_update_shiftreg[1] | line_update_shiftreg[0])&(~zero_padding_i[0]); //FIXME controllare
             3'd3: to_remove =  line_update_shiftreg[0]                           &(~zero_padding_i[0]);
             3'd1: to_remove = 1'b0;
             default: to_remove = line_update_shiftreg[1] | line_update_shiftreg[0];
           endcase
         end
  /*       
      end
   endgenerate
  */ 

endmodule
