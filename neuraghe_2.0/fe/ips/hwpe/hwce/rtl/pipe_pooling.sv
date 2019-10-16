/******************************************************************************
 *                                                                            *
 *                     Università degli Studi di Cagliari                     *
 *             Dipartimento di Ingegneria Elettrica ed Elettroni              *
 *                                                                            *
 * Engineer:       Stefano Corda - stefanocorda1993@gmail.com                 *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           pipe_pooling.sv                                            *
 * Description:    Pipeline stage before Pooling layer                        * 
 ******************************************************************************/
 
`include "hwce_types.sv"
`include "hwpe_sm_params.sv"
 
 
 module pipe_pooling
#(
  parameter AXI_WIDTH        = 32,
  parameter NPX              = 4
)
(
  input  logic 		       clk,
  input  logic           clk_gated, 
  input  logic           rst_n,
  input  logic           clear,


  input logic [15:0]                                         half_image_width_i, //half width of input feature
  input logic                                                done_preload, //starts the fsm
  input logic [15:0]                                         feat_height,
  ////////////AXI PROTOCOL/////////////////
  //ENGINE SIDE
  input  logic                                               y_out_TVALID_i,
  output logic                                               y_out_TREADY_o,
  input  logic [NPX-1:0][AXI_WIDTH  -1:0]                            y_out_TDATA_i,
  input  logic  [AXI_WIDTH/8-1:0]                            y_out_TSTRB_i,              // NOT USED
  input  logic  [AXI_WIDTH/8-1:0]                            y_out_TKEEP_i,/*
  input  logic                                               y_out_TLAST _i,
  input  logic  [TID_SIZE  -1:0]                             y_out_TID _i,
  input  logic  [TDEST_SIZE-1:0]                             y_out_TDEST _i,
  input  logic  [TUSER_SIZE-1:0]                             y_out_TUSER _i,*/
     
   
  //WRAPPER SIDE
  output  logic                                              axi_sink_TVALID_o,
  input   logic                                              axi_sink_TREADY_i,
  output  logic  [NPX-1:0][AXI_WIDTH -1:0]                            axi_sink_TDATA_o,
  output  logic  [AXI_WIDTH/8   -1:0]                        axi_sink_TSTRB_o,              // NOT USED
  output  logic  [AXI_WIDTH/8   -1:0]                        axi_sink_TKEEP_o/*
  output  logic                                              axi_sink_TLAST_i,
  output  logic  [STREAM_TID_SIZE  -1:0]                     axi_sink_TID_i,
  output  logic  [STREAM_TDEST_SIZE-1:0]                     axi_sink_TDEST_i,
  output  logic  [STREAM_TUSER_SIZE-1:0]                     axi_sink_TUSER_i,*/
 
  
);

fsm_pipe_pooling                                             fsm_state;
logic [15:0]                                                 cnt_width_image;

//register for input
logic [NPX-1:0][AXI_WIDTH-1:0]                                        data_idle;
logic                                                        flag;
logic                                                        feat_finish;
logic[15:0]                                                  cnt_feat_height;


//fsm
always_ff@(posedge clk_gated)
  begin
    if (rst_n==1'b0)begin
         fsm_state <= IDLE_P;
         cnt_width_image<=0;
         data_idle<=0;
         flag<=0;
         feat_finish<=0;
         cnt_feat_height<=0;
         end
    else begin
         case(fsm_state)
          IDLE_P:   begin //si aspetta che l'engine abbia dati-> done_preload=1
                    cnt_width_image<=0;
                    data_idle<=0;
                    flag<=0;
                    cnt_feat_height<=0;
                    if(done_preload==0)begin
                      feat_finish<=0;
                    end
                    if(done_preload==1'b1 && feat_finish==1'b0)begin
                      fsm_state<=RUN_P;
                    end
                    else begin
                      fsm_state<=IDLE_P;
                    end
                    end
          RUN_P:    begin //viene memorizzata la word in un registro a 32 bit e al colpo di clock successivo viene mandata in uscita se viene ricevuto un ready
                          //non si caricano altri dati (quindi si invierà un ready=0) se il dato non è mandato in uscita
                          //si conoscono le dimensioni delle immagini in modo da evitare problemi di blocco di HWCE.
                    if(y_out_TVALID_i==1)begin
                      if(flag==1)begin
                        if(axi_sink_TREADY_i==1)begin
                          data_idle<=y_out_TDATA_i;
                          flag<=1;
                          cnt_width_image<=cnt_width_image + NPX;
                        end
                      end
                      else begin
                        data_idle<=y_out_TDATA_i;
                        flag<=1;
                        cnt_width_image<=cnt_width_image + NPX;
                      end 
                    end
                    else begin
                      if(flag==1)begin
                        if(axi_sink_TREADY_i==1)begin
                          flag<=0;
                        end
                      end
                    end
                    
                    if(cnt_width_image==half_image_width_i - NPX && y_out_TVALID_i==1)begin
                      cnt_width_image<=0;
                      cnt_feat_height<=cnt_feat_height + 1;
                    end
                    
                    if(cnt_width_image==half_image_width_i - NPX && cnt_feat_height==feat_height-1 && y_out_TVALID_i==1)begin
                      feat_finish<=1;
                    end
                    
                    if(feat_finish==1 && axi_sink_TREADY_i==1)begin
                      fsm_state<=IDLE_P;
                      cnt_width_image<=0;
                      flag<=0;
                      cnt_feat_height<=0;
                      data_idle<=0;
                    end
                    
                    end
                  
           default: begin
                    fsm_state <= IDLE_P;
                    cnt_width_image<=0;
                    data_idle<=0;
                    flag<=0;
                    feat_finish<=0;
                    cnt_feat_height<=0;
                    end 
          endcase
          
      end
  end
  
  /*
  always_comb
  begin
    y_out_TREADY_o=axi_sink_TREADY_i;
    axi_sink_TVALID_o=y_out_TVALID_i;
    axi_sink_TDATA_o=y_out_TDATA_i;
    axi_sink_TSTRB_o=y_out_TSTRB_i;
    axi_sink_TKEEP_o=y_out_TKEEP_i;
  
  end
  */
  
  
  always_comb
  begin
    //uscite per non avere latch
    y_out_TREADY_o=0;
    axi_sink_TVALID_o=0;
    axi_sink_TDATA_o=0;
    axi_sink_TSTRB_o=0;
    axi_sink_TKEEP_o=0;
    case(fsm_state)
     IDLE_P:   begin //le uscite sono a 0 perchè non dobbiamo processare dati
               y_out_TREADY_o=0;
               axi_sink_TVALID_o=0;
               axi_sink_TDATA_o=0;
               axi_sink_TSTRB_o=0;
               axi_sink_TKEEP_o=0;
               end
     RUN_P:    begin //gestione del protocollo di comunicazione in modo da bloccare la comunicazione se il dato non è stato mandato in uscita
               if(flag==1)begin
                if(axi_sink_TREADY_i==1)begin
                  if(feat_finish==1)begin
                    y_out_TREADY_o=0;
                  end
                  else begin
                    y_out_TREADY_o=1;
                  end
                end
                else begin
                  if(feat_finish==1)begin
                    y_out_TREADY_o=0;
                  end
                  else begin
                    y_out_TREADY_o=1;
                  end
                end
                axi_sink_TVALID_o=1;
                axi_sink_TDATA_o=data_idle; 
                axi_sink_TSTRB_o=4'hf;
                axi_sink_TKEEP_o=4'hf;
               end
               else begin
                 if(feat_finish==1)begin
                    y_out_TREADY_o=0;
                 end
                 else begin
                    y_out_TREADY_o=1;
                 end
                 axi_sink_TVALID_o=0;
                 axi_sink_TDATA_o=0; 
                 axi_sink_TSTRB_o=0;
                 axi_sink_TKEEP_o=0;
               end
               end
      default: begin
               y_out_TREADY_o=0;
               axi_sink_TVALID_o=0;
               axi_sink_TDATA_o=0;
               axi_sink_TSTRB_o=0;
               axi_sink_TKEEP_o=0;
               end  
      endcase
  end
  

 endmodule
 
 
 
 
