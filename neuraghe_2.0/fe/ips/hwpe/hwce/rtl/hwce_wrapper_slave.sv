/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           hwce_wrapper_slave.sv                                      *
 * Description:    HWCE slave module (wraps hwpe_sm_slave)                    *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"
`include "hwpe_axi_params.sv"

(* use_dsp48 = "no" *) module hwce_wrapper_slave
#(
  parameter N_CONTEXT      = 2,
  parameter CFG_ADDR_WIDTH = 11,
  parameter CFG_DATA_WIDTH = 32,
  parameter CFG_BE_WIDTH   = CFG_DATA_WIDTH/8,
  parameter CFG_ID_WIDTH   = 16,
  parameter N_IO_REGS      = `N_MAX_IO_REGS, // Defined in hwpe_sm_params!
  parameter N_GENERIC_REGS = 0, //defined in hwce_wrap 4
  parameter LATCH_REGFILE  = 0,
  parameter N_STREAMS      = 3,
  parameter BANK_SIZE      = 4096,
  parameter NB_BANKS_DSP      = 8,
  parameter BANK_SIZE_DSP_B   = 2048,
  parameter WEI_MEM_BANK_SIZE      = 512,
  parameter WEI_MEM_BANK_SIZE_16BIT      = 2048,
  parameter N_ROW          = 4,
  parameter N_COL          = 4,
  parameter NPF            = 3,
  parameter CONV_WIDTH     =16
)
(
  input  logic                           clk,
  input  logic                           clk_gated,
  input  logic                           rst_n,

  // Peripheral interconnect side
  input  logic                           data_req_i,
  input  logic[CFG_ADDR_WIDTH-1:0]       data_add_i,
  input  logic                           data_type_i,
  input  logic[CFG_DATA_WIDTH-1:0]       data_wdata_i,
  input  logic[CFG_ID_WIDTH-1:0]         data_ID_i,
  output logic[CFG_DATA_WIDTH-1:0]       data_r_rdata_o,
  output logic                           sum_over_constant,
  output logic                           rectifier_activ,
  
  ////////////POOLING/////////////////////////////////////////////
  output logic[1:0]                      pooling_HW,
  output logic[1:0]                      method_pooling,
  output logic[15:0]                half_image_width_o,
  output logic[15:0]                feat_height,
  ///////////////////////////////////////////////////////////////

  input  logic                           done,

  // Register file
  output regfile_t                       reg_file,       // unused
  output [31:0]                          wl_base_addr_o, 
  output stream_config_t [N_STREAMS-1:0] stream_config,
  output logic [15:0]                    weight_size_o,
  output logic [15:0]                    weight_mask_o,
  output logic [ 3:0]                    qf_o,
  output logic                           signed_mul_o,
  output logic [15:0]                    nfeat_o,//not used
  output logic                           linear_conv_o,
  output logic [15:0]                    linebuf_length_o,

  // Event line
  output logic                           evt_interrupt_o,

  // Working signal
  output logic                           is_working,

  // Enable signal
  output logic                           enable,
  input  logic [1:0]                     change_feat_i,
 // input  logic [1:0] [7:0]               n_og_i,
  output logic  [2:0]                    zero_padding_o,
  output logic                           precision8_o,
  
  output logic  [7:0]                    ws_size_B
);
  
  hwpe_sm_slave #(
    .N_CONTEXT       ( N_CONTEXT       ),
    .CFG_ADDR_WIDTH  ( CFG_ADDR_WIDTH  ),
    .CFG_DATA_WIDTH  ( CFG_DATA_WIDTH  ),
    .CFG_BE_WIDTH    ( CFG_BE_WIDTH    ),
    .CFG_ID_WIDTH    ( CFG_ID_WIDTH    ),
    .N_IO_REGS       ( N_IO_REGS       ),
    .N_GENERIC_REGS  ( N_GENERIC_REGS  ),
    .LATCH_REGFILE   ( LATCH_REGFILE   )
  ) slave_i (
    .clk             ( clk             ),
    .clk_gated       ( clk_gated       ),
    .rst_n           ( rst_n           ),
    .data_req_i      ( data_req_i      ),
    .data_add_i      ( data_add_i      ),
    .data_type_i     ( data_type_i     ),
    .data_wdata_i    ( data_wdata_i    ),
    .data_ID_i       ( data_ID_i       ),
    .data_r_rdata_o  ( data_r_rdata_o  ),
    .done            ( done            ),
    .start_cs        ( start_cs        ),
    .reg_file        ( reg_file        ),
    .evt_interrupt_o ( evt_interrupt_o ),
    .is_working      ( is_working      ),
    .enable          ( enable          )
  );


  genvar i, j;
  /*
  generate
    for(i=0; i<3; i++) begin : stream_cfg_gen      
      if (i==2)     
        for(j=0; j<12; j++) begin
           assign stream_config[j+i*4].base_addr   = reg_file.hwpe_params[(i*4)+0][31: 0] + BANK_SIZE*4*j;
           assign stream_config[j+i*4].trans_size  = reg_file.hwpe_params[(i*4)+1][31: 0];
           assign stream_config[j+i*4].line_stride = reg_file.hwpe_params[(i*4)+2][31:16];
           assign stream_config[j+i*4].line_length = reg_file.hwpe_params[(i*4)+2][15: 0];
           assign stream_config[j+i*4].feat_stride = reg_file.hwpe_params[(i*4)+3][31:16];
           assign stream_config[j+i*4].feat_length = reg_file.hwpe_params[(i*4)+3][15: 0];  
        end
      else
        for(j=0; j<4; j++) begin
           assign stream_config[j+i*4].base_addr   = reg_file.hwpe_params[(i*4)+0][31: 0] + BANK_SIZE*4*j;
           assign stream_config[j+i*4].trans_size  = reg_file.hwpe_params[(i*4)+1][31: 0];
           assign stream_config[j+i*4].line_stride = reg_file.hwpe_params[(i*4)+2][31:16];
           assign stream_config[j+i*4].line_length = reg_file.hwpe_params[(i*4)+2][15: 0];
           assign stream_config[j+i*4].feat_stride = reg_file.hwpe_params[(i*4)+3][31:16];
           assign stream_config[j+i*4].feat_length = reg_file.hwpe_params[(i*4)+3][15: 0];   
        end
    end
  endgenerate
  */
  
  parameter        BANKS_Y    = 2*N_ROW;//20;
  parameter [31:0] GR_OFFSET  = N_ROW*BANK_SIZE*4;
  parameter [31:0] MEM_OFFSET = GR_OFFSET*(BANKS_Y/N_ROW - 1); 
  parameter        MSB_B      = 2 + $clog2(BANK_SIZE) + $clog2(N_ROW) + $clog2(BANKS_Y/N_ROW)-1;
  parameter        LSB_B      = 2 + $clog2(BANK_SIZE) + $clog2(N_ROW);
  parameter        LAST_GROUP = BANK_SIZE*4*N_ROW*(BANKS_Y/N_ROW -1);
  
  logic [31:0] base_addr_yout;
  logic [31:0] base_addr_yin;
  logic [31:0] y_out_addr;
  logic [31:0] y_in_addr;
  
  
  logic [15:0]  last_addr;
  logic [15:0]  slot_size;
  
  logic  input_buffer;
  
  logic [31:0] weight_offset;
  logic  end_row_yout;
  logic  end_row_yin;
  
  logic  end_col_yout;
  logic  end_col_yin;
  
  logic [31:0] part_base_addr;
  
  //logic [7:0]  ws_size_B;
    
  
  assign end_row_yout = y_out_addr[MSB_B:LSB_B] == LAST_GROUP[MSB_B:LSB_B];
  assign end_row_yin  =  y_in_addr[MSB_B:LSB_B] == LAST_GROUP[MSB_B:LSB_B];
  
  
  assign end_col_yout =  y_out_addr[$clog2(BANK_SIZE*4)-1:0] == last_addr[$clog2(BANK_SIZE*4)-1:0];
  assign end_col_yin  =  y_in_addr [$clog2(BANK_SIZE*4)-1:0] == last_addr[$clog2(BANK_SIZE*4)-1:0];
  
  always_ff @(posedge clk_gated) 
   begin
      if (rst_n==1'b0)begin
        y_out_addr<=0;
        y_in_addr <=0;
      end
      else
      begin
        
        if (start_cs)
        begin
          y_out_addr <= base_addr_yout;
          y_in_addr  <= base_addr_yin;
          //weights_addr<={3'b00,reg_file.hwpe_params[PARAMS_STREAM][31:3]};
          weight_offset<=0;
        end
        if(change_feat_i[0])begin // yout
        
         weight_offset<=weight_offset  + ws_size_B; //(32/8)*(CONV_WIDTH/8); // 32/8 xke 8 byte in 64 bit, dipende da word_num e weight_loader
         
         if (end_row_yout)
         begin
           
           if(end_col_yout)
           begin
             y_out_addr <= part_base_addr; // end of row, end of col
           end
           else
           begin
             y_out_addr <= y_out_addr - MEM_OFFSET + slot_size; // end of row, not end of col
           end
         end
         else
         begin
           y_out_addr <= y_out_addr + GR_OFFSET; // not end of row, not end of col
         end
        end
        
        if(change_feat_i[1])begin // yout
         
         if (end_row_yin)
         begin
           if(end_col_yin)
           begin
             y_in_addr <= part_base_addr; // end of row, end of col
           end
           else
           begin
             y_in_addr <= y_in_addr - MEM_OFFSET + slot_size; // end of row, not end of col
           end
         end
         else
         begin
           y_in_addr <= y_in_addr + GR_OFFSET; // not end of row, not end of col
         end
        end
        
      end      
   end 
  
  
  localparam PARAMS_STREAM = N_IO_REGS - 5; //113;//N_STREAMS-4;
  
  
  generate
    for(j=0; j<N_ROW; j++) begin : y_out_config
       assign stream_config[j+0].trans_size  = reg_file.hwpe_params[0+0][31: 0];
       
       assign stream_config[j+0].line_stride = reg_file.hwpe_params[0+1][31:16];
       assign stream_config[j+0].line_length = reg_file.hwpe_params[0+1][15: 0];
       
       assign stream_config[j+0].feat_stride = reg_file.hwpe_params[0+2][31:16];
       assign stream_config[j+0].feat_length = reg_file.hwpe_params[0+2][15: 0];
       
       assign stream_config[j+0].base_addr   = y_out_addr + BANK_SIZE*4*j; 
       
       assign stream_config[j+0].weight_sizes = reg_file.hwpe_params[PARAMS_STREAM + 1][31:16];
       
       assign stream_config[j+0].dil_strides = 0;
       
      // assign stream_config[j+0].base_addr   = y_out_addr; //reg_file.hwpe_params[12+ 2*n_og_i[0]][31: 0] + BANK_SIZE*4*j;   
    end
    assign base_addr_yout = reg_file.hwpe_params[0+3][31: 0];
  
    for(j=0; j<N_ROW; j++) begin : y_in_config
       assign stream_config[j+N_ROW].trans_size  = reg_file.hwpe_params[4+0][31: 0];
       
       assign stream_config[j+N_ROW].line_stride = reg_file.hwpe_params[4+1][31:16];
       assign stream_config[j+N_ROW].line_length = reg_file.hwpe_params[4+1][15: 0];
       
       assign stream_config[j+N_ROW].feat_stride = reg_file.hwpe_params[4+2][31:16];
       assign stream_config[j+N_ROW].feat_length = reg_file.hwpe_params[4+2][15: 0];  
        
       assign stream_config[j+N_ROW].base_addr   = y_in_addr + BANK_SIZE*4*j;
       
       assign stream_config[j+N_ROW].weight_sizes = reg_file.hwpe_params[PARAMS_STREAM + 1][31:16];
       
       assign stream_config[j+N_ROW].dil_strides = 0;
       
       //assign stream_config[j+4].base_addr   = y_in_addr; //reg_file.hwpe_params[12+ 2*n_og_i[1] +1][31: 0] + BANK_SIZE*4*j;
       
    end
    assign base_addr_yin = reg_file.hwpe_params[4+3][31:0];
  
    for(j=0; j<NPF*N_COL; j++) begin : x_in_config
       assign stream_config[j+2*N_ROW].trans_size  = reg_file.hwpe_params[8+0][31: 0];
       
       assign stream_config[j+2*N_ROW].line_stride = reg_file.hwpe_params[8+1][31:16];
       assign stream_config[j+2*N_ROW].line_length = reg_file.hwpe_params[8+1][15: 0];
       
       assign stream_config[j+2*N_ROW].feat_stride = reg_file.hwpe_params[8+2][31:16];
       assign stream_config[j+2*N_ROW].feat_length = reg_file.hwpe_params[8+2][15: 0];  
       
       assign stream_config[j+2*N_ROW].weight_sizes = reg_file.hwpe_params[PARAMS_STREAM + 1][31:16];
       
       assign stream_config[j+2*N_ROW].fs_params   = reg_file.hwpe_params[8+3];
       
       assign stream_config[j+2*N_ROW].dil_strides = reg_file.hwpe_params[8+4];
       
       
    //   assign stream_config[j+2*N_ROW].base_addr   = reg_file.hwpe_params[8+3][31: 0] + BANK_SIZE*4*j;
       
       assign stream_config[j+2*N_ROW].base_addr   =  (input_buffer) ? NB_BANKS_DSP*BANK_SIZE_DSP_B/2 + NB_BANKS_DSP*BANK_SIZE_DSP_B*j : NB_BANKS_DSP*BANK_SIZE_DSP_B*j;
                                                                       //BANK_SIZE*4/2 + BANK_SIZE*4*j : BANK_SIZE*4*j;

    end
  endgenerate
  
  
  assign feat_height = stream_config[0].feat_length;
  
  assign ws_size_B       = stream_config[2*N_ROW].fs_params[31:24];   
  //assign ws_size         = ws_size_B >>> 1;         // if conv_width==16 
/*
  for(i=0; i<4; i++)begin
      assign half_image_width_o[i]=stream_config[i].line_length;
   end   
*/

  

    

// assign wl_base_addr_o                =       weights_addr;// reg_file.hwpe_params[PARAMS_STREAM] + weight_offset; //weights
 
  //assign wl_base_addr_o                =        {3'b000,reg_file.hwpe_params[PARAMS_STREAM][31:3]} + weight_offset; //weights
 
  assign wl_base_addr_o                =        (input_buffer) ? (WEI_MEM_BANK_SIZE_16BIT/2)*2 + weight_offset : weight_offset; //weights  /2 to select ping or pong, *2 to turn size in byte
  
  
  
 
  assign weight_size_o                 =        reg_file.hwpe_params[PARAMS_STREAM + 1][31:16];
  assign weight_mask_o                 =        reg_file.hwpe_params[PARAMS_STREAM + 1][15: 0];
  
  assign signed_mul_o                  =       0;
 
 
  assign linebuf_length_o              =  {4'b0,reg_file.hwpe_params[PARAMS_STREAM + 2][11: 0]};
  //bit 12 is available
  assign rectifier_activ               =        reg_file.hwpe_params[PARAMS_STREAM + 2][13];
  assign sum_over_constant             =        reg_file.hwpe_params[PARAMS_STREAM + 2][14];    
  assign input_buffer                  =        reg_file.hwpe_params[PARAMS_STREAM + 2][15];  // input buffer can be 0 (ping) or 1 (pong)
  assign zero_padding_o                =        reg_file.hwpe_params[PARAMS_STREAM + 2][20:18]; 
  assign nfeat_o                       =        reg_file.hwpe_params[PARAMS_STREAM + 2][31:25];//not used
  //pooling setup
  assign pooling_HW                    =        reg_file.hwpe_params[PARAMS_STREAM + 2][22:21];
  assign method_pooling                =        reg_file.hwpe_params[PARAMS_STREAM + 2][24:23];
  assign precision8_o                  =        reg_file.hwpe_params[PARAMS_STREAM + 2][26];
  assign qf_o                          =        reg_file.hwpe_params[PARAMS_STREAM + 2][31:28];;  
  
  
  assign linear_conv_o                 =  1'b0;
  
  assign slot_size      = reg_file.hwpe_params[PARAMS_STREAM + 3][15:0];
  assign last_addr      = reg_file.hwpe_params[PARAMS_STREAM + 3][31:16];
  
  assign part_base_addr = reg_file.hwpe_params[PARAMS_STREAM + 4][31:0];
   
  //registro per la larghezza dell'immagine
  always_ff @(posedge clk_gated) 
   begin
      if (rst_n==1'b0)begin
        half_image_width_o<=0;
      end
      else begin
        if(data_req_i)begin
            if((zero_padding_o & 1'b1)==0)begin
              half_image_width_o=linebuf_length_o /*- (weight_size_o-1)*/;
            end
            else begin
              half_image_width_o=linebuf_length_o;
            end
        end
      end      
   end
  
  /*
  if(zero_padding_o==0)begin
      half_image_width_o=linebuf_length_o-((weight_size_o-1)>>1);
  end
  else begin
      half_image_width_o=linebuf_length_o;
  end
  end
  */
  
  

endmodule
