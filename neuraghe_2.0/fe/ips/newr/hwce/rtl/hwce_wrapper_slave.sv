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
  parameter BANK_SIZE      = 4096
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
  output regfile_t                       reg_file_contr, // unused
  output stream_config_t [N_STREAMS-1:0] stream_config,
  output logic [15:0]                    weight_size_o,
  output logic [15:0]                    weight_mask_o,
  output logic [ 5:0]                    qf_o, //unused
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
  input  logic [1:0] [7:0]               n_og_i,
  output logic  [2:0]                    zero_padding_o
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
  
  logic [7:0]  u1;
  logic [7:0]  v1;
  logic [7:0]  u2;
  logic [7:0]  v2;
  logic [7:0]  lut_addr_yin;
  logic [7:0]  lut_addr_yout;
  logic [31:0] base_addr_yout;
  logic [31:0] base_addr_yin;
  logic [31:0] y_out_addr;
  logic [31:0] y_in_addr;
  
  logic [7:0]  ys;
  logic [7:0]  y_seq;
  logic [15:0]  slot_size;
  
  /*
  
  python script to generate the LUT for div and % 5
  n=50
  print "8'd%d: {u2,v2,u1,v1}={8'd%d,8'd%d,8'd%d,8'd%d};"%(i,(N-1)%5,int((N-1)/5),0%5,int(0/5))
  for i in range (1,N-1):
     print "8'd%d: {u2,v2,u1,v1}={8'd%d,8'd%d,8'd%d,8'd%d};"%(i,(i-1)%5,int((i-1)/5),i%5,int(i/5))
  print "8'd%d: {u2,v2,u1,v1}={8'd%d,8'd%d,8'd%d,8'd%d};"%(i,(0)%5,int((0)/5),(N-1)%5,int((N-1)/5))
  
  */
  
  
  always_comb
  begin
    case (lut_addr_yout)
      8'd0: {u1,v1}={8'd0,8'd0};
      8'd1: {u1,v1}={8'd1,8'd0};
      8'd2: {u1,v1}={8'd2,8'd0};
      8'd3: {u1,v1}={8'd3,8'd0};
      8'd4: {u1,v1}={8'd4,8'd0};
      8'd5: {u1,v1}={8'd0,8'd1};
      8'd6: {u1,v1}={8'd1,8'd1};
      8'd7: {u1,v1}={8'd2,8'd1};
      8'd8: {u1,v1}={8'd3,8'd1};
      8'd9: {u1,v1}={8'd4,8'd1};
      8'd10: {u1,v1}={8'd0,8'd2};
      8'd11: {u1,v1}={8'd1,8'd2};
      8'd12: {u1,v1}={8'd2,8'd2};
      8'd13: {u1,v1}={8'd3,8'd2};
      8'd14: {u1,v1}={8'd4,8'd2};
      8'd15: {u1,v1}={8'd0,8'd3};
      8'd16: {u1,v1}={8'd1,8'd3};
      8'd17: {u1,v1}={8'd2,8'd3};
      8'd18: {u1,v1}={8'd3,8'd3};
      8'd19: {u1,v1}={8'd4,8'd3};
      8'd20: {u1,v1}={8'd0,8'd4};
      8'd21: {u1,v1}={8'd1,8'd4};
      8'd22: {u1,v1}={8'd2,8'd4};
      8'd23: {u1,v1}={8'd3,8'd4};
      8'd24: {u1,v1}={8'd4,8'd4};
      8'd25: {u1,v1}={8'd0,8'd5};
      8'd26: {u1,v1}={8'd1,8'd5};
      8'd27: {u1,v1}={8'd2,8'd5};
      8'd28: {u1,v1}={8'd3,8'd5};
      8'd29: {u1,v1}={8'd4,8'd5};
      8'd30: {u1,v1}={8'd0,8'd6};
      8'd31: {u1,v1}={8'd1,8'd6};
      8'd32: {u1,v1}={8'd2,8'd6};
      8'd33: {u1,v1}={8'd3,8'd6};
      8'd34: {u1,v1}={8'd4,8'd6};
      8'd35: {u1,v1}={8'd0,8'd7};
      8'd36: {u1,v1}={8'd1,8'd7};
      8'd37: {u1,v1}={8'd2,8'd7};
      8'd38: {u1,v1}={8'd3,8'd7};
      8'd39: {u1,v1}={8'd4,8'd7};
      8'd40: {u1,v1}={8'd0,8'd8};
      8'd41: {u1,v1}={8'd1,8'd8};
      8'd42: {u1,v1}={8'd2,8'd8};
      8'd43: {u1,v1}={8'd3,8'd8};
      8'd44: {u1,v1}={8'd4,8'd8};
      8'd45: {u1,v1}={8'd0,8'd9};
      8'd46: {u1,v1}={8'd1,8'd9};
      8'd47: {u1,v1}={8'd2,8'd9};
      8'd48: {u1,v1}={8'd3,8'd9};
      8'd49: {u1,v1}={8'd4,8'd9};
      default: {u1,v1}={8'd0,8'd0};
    endcase
  
  
  
  
    case (lut_addr_yin)
  
      8'd0: {u2,v2}={8'd0,8'd0};
      8'd1: {u2,v2}={8'd1,8'd0};
      8'd2: {u2,v2}={8'd2,8'd0};
      8'd3: {u2,v2}={8'd3,8'd0};
      8'd4: {u2,v2}={8'd4,8'd0};
      8'd5: {u2,v2}={8'd0,8'd1};
      8'd6: {u2,v2}={8'd1,8'd1};
      8'd7: {u2,v2}={8'd2,8'd1};
      8'd8: {u2,v2}={8'd3,8'd1};
      8'd9: {u2,v2}={8'd4,8'd1};
      8'd10: {u2,v2}={8'd0,8'd2};
      8'd11: {u2,v2}={8'd1,8'd2};
      8'd12: {u2,v2}={8'd2,8'd2};
      8'd13: {u2,v2}={8'd3,8'd2};
      8'd14: {u2,v2}={8'd4,8'd2};
      8'd15: {u2,v2}={8'd0,8'd3};
      8'd16: {u2,v2}={8'd1,8'd3};
      8'd17: {u2,v2}={8'd2,8'd3};
      8'd18: {u2,v2}={8'd3,8'd3};
      8'd19: {u2,v2}={8'd4,8'd3};
      8'd20: {u2,v2}={8'd0,8'd4};
      8'd21: {u2,v2}={8'd1,8'd4};
      8'd22: {u2,v2}={8'd2,8'd4};
      8'd23: {u2,v2}={8'd3,8'd4};
      8'd24: {u2,v2}={8'd4,8'd4};
      8'd25: {u2,v2}={8'd0,8'd5};
      8'd26: {u2,v2}={8'd1,8'd5};
      8'd27: {u2,v2}={8'd2,8'd5};
      8'd28: {u2,v2}={8'd3,8'd5};
      8'd29: {u2,v2}={8'd4,8'd5};
      8'd30: {u2,v2}={8'd0,8'd6};
      8'd31: {u2,v2}={8'd1,8'd6};
      8'd32: {u2,v2}={8'd2,8'd6};
      8'd33: {u2,v2}={8'd3,8'd6};
      8'd34: {u2,v2}={8'd4,8'd6};
      8'd35: {u2,v2}={8'd0,8'd7};
      8'd36: {u2,v2}={8'd1,8'd7};
      8'd37: {u2,v2}={8'd2,8'd7};
      8'd38: {u2,v2}={8'd3,8'd7};
      8'd39: {u2,v2}={8'd4,8'd7};
      8'd40: {u2,v2}={8'd0,8'd8};
      8'd41: {u2,v2}={8'd1,8'd8};
      8'd42: {u2,v2}={8'd2,8'd8};
      8'd43: {u2,v2}={8'd3,8'd8};
      8'd44: {u2,v2}={8'd4,8'd8};
      8'd45: {u2,v2}={8'd0,8'd9};
      8'd46: {u2,v2}={8'd1,8'd9};
      8'd47: {u2,v2}={8'd2,8'd9};
      8'd48: {u2,v2}={8'd3,8'd9};
      8'd49: {u2,v2}={8'd4,8'd9};
      default: {u2,v2}={8'd0,8'd0};
    endcase
  
  end
  
  
  assign lut_addr_yin  = (y_seq+n_og_i[0]     >= ys) ? y_seq+n_og_i[0]-ys     : y_seq+n_og_i[0]     ;
  assign lut_addr_yout = (y_seq+n_og_i[0] + 1 >= ys) ? y_seq+n_og_i[0]-ys + 1 : y_seq+n_og_i[0] + 1 ;
  
  assign y_out_addr = base_addr_yout + u1 * 32'h20000 + v1*slot_size;
  assign y_in_addr  = base_addr_yin  + u2 * 32'h20000 + v2*slot_size;
  
  
  generate
    for(j=0; j<4; j++) begin : y_out_config
       assign stream_config[j+0].trans_size  = reg_file.hwpe_params[0+0][31: 0];
       
       assign stream_config[j+0].line_stride = reg_file.hwpe_params[0+1][31:16];
       assign stream_config[j+0].line_length = reg_file.hwpe_params[0+1][15: 0];
       
       assign stream_config[j+0].feat_stride = reg_file.hwpe_params[0+2][31:16];
       assign stream_config[j+0].feat_length = reg_file.hwpe_params[0+2][15: 0];
       
       assign stream_config[j+0].base_addr   = y_out_addr + BANK_SIZE*4*j; 
       
      // assign stream_config[j+0].base_addr   = y_out_addr; //reg_file.hwpe_params[12+ 2*n_og_i[0]][31: 0] + BANK_SIZE*4*j;   
    end
    assign base_addr_yout = reg_file.hwpe_params[0+3][31: 0];
  
    for(j=0; j<4; j++) begin : y_in_config
       assign stream_config[j+4].trans_size  = reg_file.hwpe_params[4+0][31: 0];
       
       assign stream_config[j+4].line_stride = reg_file.hwpe_params[4+1][31:16];
       assign stream_config[j+4].line_length = reg_file.hwpe_params[4+1][15: 0];
       
       assign stream_config[j+4].feat_stride = reg_file.hwpe_params[4+2][31:16];
       assign stream_config[j+4].feat_length = reg_file.hwpe_params[4+2][15: 0];  
        
       assign stream_config[j+4].base_addr   = y_in_addr + BANK_SIZE*4*j;
       
       //assign stream_config[j+4].base_addr   = y_in_addr; //reg_file.hwpe_params[12+ 2*n_og_i[1] +1][31: 0] + BANK_SIZE*4*j;
       
    end
    assign base_addr_yin = reg_file.hwpe_params[4+3][31:0];
  
    for(j=0; j<12; j++) begin : x_in_config
       assign stream_config[j+8].trans_size  = reg_file.hwpe_params[8+0][31: 0];
       
       assign stream_config[j+8].line_stride = reg_file.hwpe_params[8+1][31:16];
       assign stream_config[j+8].line_length = reg_file.hwpe_params[8+1][15: 0];
       
       assign stream_config[j+8].feat_stride = reg_file.hwpe_params[8+2][31:16];
       assign stream_config[j+8].feat_length = reg_file.hwpe_params[8+2][15: 0];  
       
       assign stream_config[j+8].base_addr   = reg_file.hwpe_params[8+3][31: 0] + BANK_SIZE*4*j;
    end
  endgenerate
  
  
  assign feat_height = reg_file.hwpe_params[0+2][15: 0];
  
  
  
/*
  for(i=0; i<4; i++)begin
      assign half_image_width_o[i]=stream_config[i].line_length;
   end   
*/

  localparam PARAMS_STREAM = N_IO_REGS - 5; //113;//N_STREAMS-4;

    

 
  assign reg_file_contr.hwpe_params[0] =        reg_file.hwpe_params[PARAMS_STREAM] + n_og_i[0]*28*2*2; //weights
  
 
  assign weight_size_o                 =        reg_file.hwpe_params[PARAMS_STREAM + 1][31:16];
  assign weight_mask_o                 =        reg_file.hwpe_params[PARAMS_STREAM + 1][15: 0];
  
 
 
 
  assign linebuf_length_o              =  {4'b0,reg_file.hwpe_params[PARAMS_STREAM + 2][11: 0]};
  //bit 12 is available
  assign rectifier_activ               =        reg_file.hwpe_params[PARAMS_STREAM + 2][13];
  assign sum_over_constant             =        reg_file.hwpe_params[PARAMS_STREAM + 2][14];    
  assign signed_mul_o                  =       ~reg_file.hwpe_params[PARAMS_STREAM + 2][15];  
  assign zero_padding_o                =        reg_file.hwpe_params[PARAMS_STREAM + 2][20:18]; 
  assign nfeat_o                       =        reg_file.hwpe_params[PARAMS_STREAM + 2][31:23];//not used
  //pooling setup
  assign pooling_HW                    =        reg_file.hwpe_params[PARAMS_STREAM + 2][17:16];
  assign method_pooling                =        reg_file.hwpe_params[PARAMS_STREAM + 2][22:21];
  
  assign linear_conv_o                 =  1'b0;  
  
  assign slot_size = reg_file.hwpe_params[PARAMS_STREAM + 3][15:0];
  assign ys        = reg_file.hwpe_params[PARAMS_STREAM + 3][23:16];
  assign y_seq     = reg_file.hwpe_params[PARAMS_STREAM + 3][31:24];
  
  //assign base_addr = reg_file.hwpe_params[PARAMS_STREAM + 4][31:0];
   
  //registro per la larghezza dell'immagine
  always_ff @(posedge clk_gated) 
   begin
      if (rst_n==1'b0)begin
        half_image_width_o<=0;
      end
      else begin
        if(data_req_i)begin
            if(zero_padding_o==0)begin
              half_image_width_o=linebuf_length_o-((weight_size_o-1)>>1);
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
