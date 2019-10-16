/******************************************************************************
 *                                                                            *
 *                     Università degli Studi di Cagliari                     *
 *             Dipartimento di Ingegneria Elettrica ed Elettroni              *
 *                                                                            *
 * Engineer:       Stefano Corda - stefanocorda1993@gmail.com                 *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           pooling_layer.sv                                           *
 * Description:    Pooling layer after a convolutional job                    *
 *                 Now only 2x2 block, Need comunication beetween wrapper     *
 *                 and xbar, Need parametric programming                      * 
 ******************************************************************************/


`include "hwce_types.sv"
`include "hwpe_sm_params.sv"



module pooling_layer
#(
  parameter LINEBUFFER_WIDTH = 120,
  
  parameter WIDTH_POOLING_BLOCK =2'b10,
  parameter FILTER_SIZE =5,
  parameter METHOD=1'b1,
  
  /////////////AXI WIDTH////////////////
  parameter AXI_WIDTH        = 32,
  /////////////////////////////////////
  parameter CONV_WIDTH = AXI_WIDTH/2
)
(
  input  logic 		 clk,
  input  logic           clk_gated, 
  input  logic           rst_n,
  input  logic           clear,


  input logic [15:0]                                         half_image_width_i, //half width of input feature
  input logic                                                done_preload, //starts the fsm
  input logic                                                pooling_HW, //1 quando abbiamo dati validi, 0 quando abbiamo dati parziali
  input logic                                                method_pooling,
  input logic[2:0]                                           filter_size,
    
   ////////////AXI PROTOCOL/////////////////
   //ENGINE SIDE
   input  logic                                               y_out_TVALID_i,
   output logic                                               y_out_TREADY_o,
   input  logic  [AXI_WIDTH  -1:0]                            y_out_TDATA_i,
   input  logic  [AXI_WIDTH/8-1:0]                            y_out_TSTRB_i,              // NOT USED
   input  logic  [AXI_WIDTH/8-1:0]                            y_out_TKEEP_i,/*
   input  logic                                               y_out_TLAST _i,
   input  logic  [TID_SIZE  -1:0]                             y_out_TID _i,
   input  logic  [TDEST_SIZE-1:0]                             y_out_TDEST _i,
   input  logic  [TUSER_SIZE-1:0]                             y_out_TUSER _i,*/
     
   
   //WRAPPER SIDE
   output  logic                                              axi_sink_TVALID_o,
   input   logic                                              axi_sink_TREADY_i,
   output  logic  [AXI_WIDTH -1:0]                            axi_sink_TDATA_o,
   output  logic  [AXI_WIDTH/8   -1:0]                     axi_sink_TSTRB_o,              // NOT USED
   output  logic  [AXI_WIDTH/8   -1:0]                     axi_sink_TKEEP_o/*
   output  logic                                              axi_sink_TLAST_i,
   output  logic  [STREAM_TID_SIZE  -1:0]                     axi_sink_TID_i,
   output  logic  [STREAM_TDEST_SIZE-1:0]                     axi_sink_TDEST_i,
   output  logic  [STREAM_TUSER_SIZE-1:0]                     axi_sink_TUSER_i,*/
 
  
);
        
fsm_state_t_pooling                                          fsm_state;
logic [15:0]                                                 cnt_width_image;
logic [5:0]                                                  cnt_width_pooling_block;
logic [15:0]                                                 half_image_width; //metà larghezza dell'OF in uscita dal wrapper

logic [CONV_WIDTH-1:0]                                       accumulate_first_pixel;
logic [CONV_WIDTH-1:0]                                       accumulate_second_pixel; 

//register for input
logic                                                        valid_idle;
logic                                                        ready_idle;
logic [AXI_WIDTH  -1:0]                                      data_idle;
logic                                                        flag;

//temp variables   (usate per fare i confronti e quindi trovare il massimo)
logic [CONV_WIDTH-1:0]                                 temp;
logic [CONV_WIDTH-1:0]                                 temp1;
logic signed [CONV_WIDTH-1+2:0]                        temp_avg;
logic signed [CONV_WIDTH-1+2:0]                        temp_avg1;

logic                                                  req;
logic [AXI_WIDTH  -1:0]                                data;

 logic [CONV_WIDTH-1:0]                                                     acc_data_o; 
 logic [CONV_WIDTH-1:0]                                                     data_in; 
 logic                                                                      write;


assign req = y_out_TVALID_i;
assign data = y_out_TDATA_i;

//half width of output feature from wrapper  (IW-FS+1)/2
assign half_image_width = half_image_width_i ; 






//shift register

pooling_data_shift_register
      #(
      .LINEBUFFER_WIDTH   (LINEBUFFER_WIDTH),
      .CONV_WIDTH      (16)
      )
      pooling_data_shift_register_i
      (
      .clk		             (clk),
      .clk_gated                     (clk_gated),
      .rst_n                         (rst_n),
      
      .data                          (data_in),
      .half_image_width              (half_image_width),
      .write                         (write),
      
      .current_data                  (acc_data_o)    
      );

//fsm
always_ff @(posedge clk_gated) 
   begin
      if (rst_n==1'b0)begin
         fsm_state <= IDLE;
         accumulate_first_pixel<=0;
         cnt_width_image<=0;
         cnt_width_pooling_block<=0;
         valid_idle<=0;
         ready_idle<=0;
         data_idle<=0;
         flag<=0;
         end
      else begin
         case(fsm_state)
            REG_IDLE:
                begin
                if(axi_sink_TREADY_i==1)begin
                    if(flag==1)begin
                        if(req==1)begin
                            fsm_state <=REG_IDLE;
                            valid_idle <= y_out_TVALID_i;
                            ready_idle <= axi_sink_TREADY_i;
                            data_idle <= y_out_TDATA_i;
                            flag<=1;
                        end
                        else begin
                            fsm_state <= REG_IDLE;
                            flag<=0;
                        end
                    end
                    else begin
                        if(req==1)begin
                            fsm_state <=REG_IDLE;
                            valid_idle <= y_out_TVALID_i;
                            ready_idle <= axi_sink_TREADY_i;
                            data_idle <= y_out_TDATA_i;
                            flag<=1;  
                        end
                        else begin
                            fsm_state <= REG_IDLE;
                            flag<=0;
                        end
                    end                
                end
                else begin
                    if(flag==1)begin
                        if(req==1)begin
                            fsm_state<=REG_IDLE;
                        end
                        else begin
                            fsm_state<=REG_IDLE;
                        end
                    end
                    else begin
                        if(req==1)begin
                            fsm_state <=REG_IDLE;
                            valid_idle <= y_out_TVALID_i;
                            ready_idle <= axi_sink_TREADY_i;
                            data_idle <= y_out_TDATA_i;
                            flag<=1;
                        end
                        else begin
                            fsm_state<=REG_IDLE;
                            flag<=0;
                        end
                    end
                end 
                if(done_preload==1'b0)begin
                  fsm_state<=IDLE;
                end               
                end
                    
            IDLE: // in this state we wait for a start signal for pooling
                begin
                if(done_preload==1'b1 && pooling_HW==1'b1)begin
                    fsm_state <= ACC_ODD;
                end
                else begin
                    fsm_state <= IDLE;
                    cnt_width_image <= 15'b000000000000000;
                    cnt_width_pooling_block <= 5'b0000;
                end
                if(done_preload==1'b1 && pooling_HW==1'b0)begin
                    fsm_state <= IDLE;
                    flag<=0;
                end
               end
                
                          
            ACC_ODD: //bisogna valutare il caso di blocchi più grandi di 2x2: accumulare più righe di dati
                        //questo stato si occupa di accumulare la prima riga lunga un linebuffer di pixel
                begin
                if(done_preload == 1'b0 && cnt_width_image==1'b0)begin
                    fsm_state <= IDLE;
                    cnt_width_image <=0 ;
                    cnt_width_pooling_block <= 0;
                end
                else begin
                    if(cnt_width_image < half_image_width)begin
                      fsm_state <= ACC_ODD;
                      if(req==1)begin
                        cnt_width_image <= cnt_width_image + 1;
                        if(cnt_width_image==half_image_width-1)begin
                            fsm_state <= ACC_EVEN;
                            cnt_width_image <= 0;
                            cnt_width_pooling_block <= 0;
                        end
                      end
                    end
                    else begin
                        fsm_state <= ACC_EVEN;
                        cnt_width_image <= 0;
                        cnt_width_pooling_block <= 0;
                    end                  
                end
                
                end
            ACC_EVEN://in questo stato vengono prodotti gli output desiderati quando si hanno pixel a sufficienza (mandiamo in output 32bit-> 2pixel)
                begin
                if(cnt_width_image < half_image_width)begin
                    if(req==1)begin
                        cnt_width_pooling_block <= cnt_width_pooling_block +1;
                        cnt_width_image <= cnt_width_image + 1; 
                        if(cnt_width_pooling_block < WIDTH_POOLING_BLOCK-1)begin
                            fsm_state <= ACC_EVEN;                            
                        end
                        else begin
                            fsm_state <= PRODUCE;
                            //cnt_width_pooling_block <= 5'b0000;
                        end/*
                        if(cnt_width_image==half_image_width-1)begin
                            fsm_state <= ACC_ODD;
                            cnt_width_image <= 15'b000000000000000;
                            cnt_width_pooling_block <= 5'b0000;
                        end*/
                    end   
                end/*
                else begin
                    fsm_state <= ACC_ODD;
                    cnt_width_image <= 15'b000000000000000;
                    cnt_width_pooling_block <= 5'b0000;
                end*/
                if(req==1 && cnt_width_pooling_block==WIDTH_POOLING_BLOCK-1)begin
                    accumulate_second_pixel<=temp1;
                    fsm_state<=PRODUCE;
                end
                else if (req==1 && cnt_width_pooling_block<WIDTH_POOLING_BLOCK-1)begin
                    accumulate_first_pixel <= temp1; // memorizzo il primo dei due pixel che inserisco nella word da 32 bit (16bit = 1 pixel)
                    if(cnt_width_image == half_image_width-1 )begin
                        accumulate_second_pixel<=0;  
                        fsm_state<=PRODUCE;           
                    end
                    
                end
                end
            PRODUCE:
            begin
                if(axi_sink_TREADY_i==0)begin
                    fsm_state<=PRODUCE;      
                end
                else begin
                    if(cnt_width_image==half_image_width)begin //qui non c'è il meno uno perchè il contatore è stato aggiornato // 
                        fsm_state<=ACC_ODD;
                        if(req==1)begin
                            cnt_width_image <= 1;
                            cnt_width_pooling_block <= 0;
                        end
                        else begin                        
                            cnt_width_image <= 0;
                            cnt_width_pooling_block <= 0;
                        end
                    end
                    else begin
                        fsm_state<=ACC_EVEN;
                        if(req==1)begin
                           cnt_width_pooling_block<=1;
                           accumulate_first_pixel <= temp1; // memorizzo il primo dei due pixel che inserisco nella word da 32 bit (16bit = 1 pixel)
                           cnt_width_image<=cnt_width_image+1;
                           if(cnt_width_image == half_image_width-1 )begin
                               accumulate_second_pixel<=0;  
                               fsm_state<=PRODUCE;           
                           end
                        end
                        else begin
                          cnt_width_pooling_block <= 0;
                        end
                    end
                end
            end
            default:
                begin
                fsm_state<= IDLE;
                cnt_width_image <= 0;
                cnt_width_pooling_block <= 0;
                end
        endcase
      end
   end  
   
   
  
   
   
   always_comb
   begin    
      y_out_TREADY_o=0;
      axi_sink_TVALID_o=0;
      axi_sink_TDATA_o=0;
      axi_sink_TSTRB_o=0;
      axi_sink_TKEEP_o=0;
      temp=0;
      temp1=0;
      temp_avg=0;
      temp_avg1=0;
      data_in=0;
      write=0;
      case(fsm_state)
      REG_IDLE:
      begin
         if(axi_sink_TREADY_i==1)begin
            if(flag==1)begin
                if(req==1)begin
                    y_out_TREADY_o=ready_idle;
                    axi_sink_TVALID_o=valid_idle;
                    axi_sink_TDATA_o=data_idle;
                    axi_sink_TSTRB_o=4'hf;
                    axi_sink_TKEEP_o=4'hf;
                end
                else begin
                   y_out_TREADY_o=ready_idle;
                   axi_sink_TVALID_o=valid_idle;
                   axi_sink_TDATA_o=data_idle;
                   axi_sink_TSTRB_o=4'hf;
                   axi_sink_TKEEP_o=4'hf; 
                end
            end
            else begin
                if(req==1)begin
                   y_out_TREADY_o=1;
                   axi_sink_TVALID_o=0;
                   axi_sink_TDATA_o=0;
                end
                else begin
                   y_out_TREADY_o=1;
                   axi_sink_TVALID_o=0;
                   axi_sink_TDATA_o=0;
                end
            end
         end
         else begin
            if(flag==1)begin
                if(req==1)begin
                    y_out_TREADY_o=0;
                    axi_sink_TVALID_o=0;
                    axi_sink_TDATA_o=0;
                end 
                else begin
                    y_out_TREADY_o=0;
                    axi_sink_TVALID_o=0;
                    axi_sink_TDATA_o=0;
                end
            end
            else begin
                if(req==1)begin
                    y_out_TREADY_o=1;
                    axi_sink_TVALID_o=0;
                    axi_sink_TDATA_o=0;
                end
                else begin
                   y_out_TREADY_o=1;
                   axi_sink_TVALID_o=0;
                   axi_sink_TDATA_o=0;
                end
            end         
         end
      end
      IDLE:
      begin   
        data_in=0;
        write=0;
        y_out_TREADY_o=1;
        axi_sink_TVALID_o=0;
        axi_sink_TDATA_o=0;    
      end      
      ACC_ODD:
      begin
        if(method_pooling==1'b0)begin
          data_in=(data[AXI_WIDTH-1:CONV_WIDTH]>data[CONV_WIDTH-1:0])?data[AXI_WIDTH-1:CONV_WIDTH]:data[CONV_WIDTH-1:0];
        end
        else begin
          temp_avg=$signed(data[AXI_WIDTH-1:CONV_WIDTH]);
          temp_avg1=$signed(data[CONV_WIDTH-1:0]);
          data_in=$signed(temp_avg[CONV_WIDTH-1+2:0+2]) + $signed(temp_avg1[CONV_WIDTH-1+2:0+2]);
        end
        write=req;
        y_out_TREADY_o=1;
        axi_sink_TVALID_o=0;
        axi_sink_TDATA_o=0;      
      end   
      ACC_EVEN:
      begin
        data_in=0;
        write=req;
        y_out_TREADY_o=1;
        axi_sink_TVALID_o=0;
        axi_sink_TDATA_o=0; 
        if(req==1 && cnt_width_pooling_block==WIDTH_POOLING_BLOCK-1)begin
            if(method_pooling==1'b0)begin
              temp = (data[AXI_WIDTH-1:CONV_WIDTH]>data[CONV_WIDTH-1:0])?data[AXI_WIDTH-1:CONV_WIDTH]:data[CONV_WIDTH-1:0];
              temp1=(temp>acc_data_o)?temp:acc_data_o;
            end
            else begin
             temp_avg=$signed(data[AXI_WIDTH-1:CONV_WIDTH]);
             temp_avg1=$signed(data[CONV_WIDTH-1:0]);
             temp=$signed(temp_avg[CONV_WIDTH-1+2:0+2]) + $signed(temp_avg1[CONV_WIDTH-1+2:0+2]);
             temp1=$signed(acc_data_o) + $signed(temp);
            end 
        end
        else if (req==1 && cnt_width_pooling_block<WIDTH_POOLING_BLOCK-1)begin
            if(method_pooling==1'b0)begin
            temp = (data[AXI_WIDTH-1:CONV_WIDTH]>data[CONV_WIDTH-1:0])?data[AXI_WIDTH-1:CONV_WIDTH]:data[CONV_WIDTH-1:0];
            temp1=(temp>acc_data_o)?temp:acc_data_o;
            end
            else begin
            temp_avg=$signed(data[AXI_WIDTH-1:CONV_WIDTH]);
            temp_avg1=$signed(data[CONV_WIDTH-1:0]);
            temp=$signed(temp_avg[CONV_WIDTH-1+2:0+2]) + $signed(temp_avg1[CONV_WIDTH-1+2:0+2]);
            temp1=$signed(acc_data_o) + $signed(temp);
            end              
        end
       
      end
      PRODUCE:
      begin            
            data_in=0;
            write=0;
            if(cnt_width_image==half_image_width)begin
                if(method_pooling==1'b0)begin
                    data_in=(data[AXI_WIDTH-1:CONV_WIDTH]>data[CONV_WIDTH-1:0])?data[AXI_WIDTH-1:CONV_WIDTH]:data[CONV_WIDTH-1:0];
                end
                else begin
                    temp_avg=$signed(data[AXI_WIDTH-1:CONV_WIDTH]);
                    temp_avg1=$signed(data[CONV_WIDTH-1:0]);
                    data_in=$signed(temp_avg[CONV_WIDTH-1+2:0+2]) + $signed(temp_avg1[CONV_WIDTH-1+2:0+2]);
                end
                write=req;
                y_out_TREADY_o=1;
                axi_sink_TVALID_o=0;
                axi_sink_TDATA_o=0; 
            end
            else begin
                if(axi_sink_TREADY_i==1)begin
                  write=req;
                  y_out_TREADY_o=1;
                  if(req==1)begin
                    if(method_pooling==1'b0)begin
                      temp = (data[AXI_WIDTH-1:CONV_WIDTH]>data[CONV_WIDTH-1:0])?data[AXI_WIDTH-1:CONV_WIDTH]:data[CONV_WIDTH-1:0];
                      temp1=(temp>acc_data_o)?temp:acc_data_o;
                    end
                    else begin
                      temp_avg=$signed(data[AXI_WIDTH-1:CONV_WIDTH]);
                      temp_avg1=$signed(data[CONV_WIDTH-1:0]);
                      temp=$signed(temp_avg[CONV_WIDTH-1+2:0+2]) + $signed(temp_avg1[CONV_WIDTH-1+2:0+2]);
                      temp1=$signed(acc_data_o) + $signed(temp);
                    end 
                  end     
                end
                else begin
                  y_out_TREADY_o=0;
                end
            end
            axi_sink_TVALID_o=1;
            axi_sink_TDATA_o= accumulate_first_pixel + (accumulate_second_pixel << CONV_WIDTH);
            axi_sink_TSTRB_o=4'hf;
            axi_sink_TKEEP_o=4'hf;
      end
      default:
      begin
        data_in=0;
        write=0;
        y_out_TREADY_o=0;
        axi_sink_TVALID_o=0;
        axi_sink_TDATA_o=0;
        axi_sink_TSTRB_o=0;
        axi_sink_TKEEP_o=0;
      end
   endcase
   end
   
   



endmodule
