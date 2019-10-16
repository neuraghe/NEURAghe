/******************************************************************************
 *                                                                            *
 *                     Università degli Studi di Cagliari                     *
 *             Dipartimento di Ingegneria Elettrica ed Elettroni              *
 *                                                                            *
 * Engineer:       Stefano Corda - stefanocorda1993@gmail.com                 *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           pooling_layer.sv                                           *
 * Description:    Pooling layer                                              * 
 ******************************************************************************/


`include "hwce_types.sv"
`include "hwpe_sm_params.sv"



module pooling_layer
#(
  parameter LINEBUFFER_WIDTH    = 128,  
  parameter WIDTH_POOLING_BLOCK = 2'b10,
  parameter AXI_WIDTH           = 32,
  parameter CONV_WIDTH          = AXI_WIDTH/2,
  parameter PIPE_OUT            = 2,
  parameter CNTR_SIG_PIPE       = 0
)
(
  input  logic 		 clk_i,
  input  logic     rst_n,
  input  logic           clear,

  input logic                                                done_preload, //starts the fsm
  
  
  // POOLING CONFIGURATION

  input logic [15:0]                                         half_image_width_i, //half width of input feature
  input logic                                                pooling_HW, //1 quando abbiamo dati validi, 0 quando abbiamo dati parziali
  input logic[1:0]                                           method_pooling,
  input logic [15:0]                                         feat_height,
  
  
  
  
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
   output  logic  [AXI_WIDTH/8   -1:0]                        axi_sink_TSTRB_o,              // NOT USED
   output  logic  [AXI_WIDTH/8   -1:0]                        axi_sink_TKEEP_o/*
   output  logic                                              axi_sink_TLAST_i,
   output  logic  [STREAM_TID_SIZE  -1:0]                     axi_sink_TID_i,
   output  logic  [STREAM_TDEST_SIZE-1:0]                     axi_sink_TDEST_i,
   output  logic  [STREAM_TUSER_SIZE-1:0]                     axi_sink_TUSER_i,*/
 
  
);
   logic                                                axi_sink_TVALID_int;
     logic  [AXI_WIDTH -1:0]                            axi_sink_TDATA_int;
     logic  [AXI_WIDTH/8   -1:0]                        axi_sink_TSTRB_int;              
     logic  [AXI_WIDTH/8   -1:0]                        axi_sink_TKEEP_int;

     (* srl_style = "register" *) logic  [PIPE_OUT-1:0]                                           axi_sink_TVALID_pipe;
     (* srl_style = "register" *) logic  [PIPE_OUT-1:0][AXI_WIDTH -1:0]                            axi_sink_TDATA_pipe;
     (* srl_style = "register" *) logic  [PIPE_OUT-1:0][AXI_WIDTH/8   -1:0]                        axi_sink_TSTRB_pipe;              
     (* srl_style = "register" *) logic  [PIPE_OUT-1:0][AXI_WIDTH/8   -1:0]                        axi_sink_TKEEP_pipe;
  
      
        
fsm_state_t_pooling                                          fsm_state;
logic [15:0]                                                 cnt_width_image;
logic [5:0]                                                  cnt_width_pooling_block;
logic [15:0]                                                 half_image_width; //metà larghezza dell'OF in uscita dal wrapper

logic [CONV_WIDTH-1:0]                                       accumulate_first_pixel;
logic [CONV_WIDTH-1:0]                                       accumulate_second_pixel; 

//register for input
logic [AXI_WIDTH  -1:0]                                      data_idle;
logic                                                        flag;

//temp variables   (usate per fare i confronti e quindi trovare il massimo)
logic signed [CONV_WIDTH-1:0]                                 temp;
logic signed [CONV_WIDTH-1:0]                                 temp1;
logic signed [CONV_WIDTH-1+2:0]                        temp_sign;
logic signed [CONV_WIDTH-1+2:0]                        temp_sign1;

logic                                                  req;
logic [AXI_WIDTH  -1:0]                                data;

 logic [CONV_WIDTH-1+2:0]/*[CONV_WIDTH-1:0]*/                                                     acc_data_o; 
 logic [CONV_WIDTH-1+2:0]/*[CONV_WIDTH-1:0]*/                                                     data_in; 
 logic                                                                      write;


logic feat_finish;
logic[15:0] cnt_feat_height;

logic[31:0] last_odd_row_data;


  logic [15:0]                                         half_image_width_int;
   logic                                                pooling_HW_int;
   logic[1:0]                                           method_pooling_int;
   logic [15:0]                                         feat_height_int;



  int p;
generate
begin
  if (PIPE_OUT>0)
  begin
    always_ff @(posedge clk_i) 
      begin
        if (rst_n==1'b0)
        begin
          axi_sink_TVALID_pipe <= '0;
          axi_sink_TDATA_pipe <= '0;
          axi_sink_TSTRB_pipe <= '0;              
          axi_sink_TKEEP_pipe <= '0;
      
        end
        else
        begin
          if (axi_sink_TREADY_i==1'b1)
          begin
            axi_sink_TVALID_pipe[0] <= axi_sink_TVALID_int;
            axi_sink_TDATA_pipe[0] <= axi_sink_TDATA_int;
            axi_sink_TSTRB_pipe[0] <= axi_sink_TSTRB_int;              
            axi_sink_TKEEP_pipe[0] <= axi_sink_TKEEP_int;   
            
            for (p=1; p<PIPE_OUT; p++)
            begin
              axi_sink_TVALID_pipe[p] <= axi_sink_TVALID_pipe[p-1];
              axi_sink_TDATA_pipe [p] <= axi_sink_TDATA_pipe[p-1];
              axi_sink_TSTRB_pipe [p] <= axi_sink_TSTRB_pipe[p-1];              
              axi_sink_TKEEP_pipe [p] <= axi_sink_TKEEP_pipe[p-1]; 
            end                              
               
          end
        end
      end
      assign axi_sink_TVALID_o = axi_sink_TVALID_pipe[PIPE_OUT-1];
      assign axi_sink_TDATA_o = axi_sink_TDATA_pipe[PIPE_OUT-1];
      assign axi_sink_TSTRB_o = axi_sink_TSTRB_pipe[PIPE_OUT-1];              
      assign axi_sink_TKEEP_o = axi_sink_TKEEP_pipe[PIPE_OUT-1];
      
  end
  else
  begin
    assign axi_sink_TVALID_o = axi_sink_TVALID_int;
    assign axi_sink_TDATA_o = axi_sink_TDATA_int;
    assign axi_sink_TSTRB_o = axi_sink_TSTRB_int;              
    assign axi_sink_TKEEP_o = axi_sink_TKEEP_int;
  end
end
endgenerate  





generate
  if (CNTR_SIG_PIPE==1)
  begin
    always_ff @(posedge clk_i) 
      begin
        if (rst_n==1'b0)
          begin        
             half_image_width_int <= 0;
             pooling_HW_int       <= 0;
             method_pooling_int   <= 0;
             feat_height_int      <= 0;
          end
        else
          begin
             half_image_width_int <= half_image_width_i;
             pooling_HW_int       <= pooling_HW;
             method_pooling_int   <= method_pooling;
             feat_height_int      <= feat_height;
          end
      end
  end
  else
  begin
    assign half_image_width_int = half_image_width_i;
    assign pooling_HW_int       = pooling_HW;
    assign method_pooling_int   = method_pooling;
    assign feat_height_int      = feat_height;
  end
endgenerate

assign req  = y_out_TVALID_i;
assign data = y_out_TDATA_i;

//half width of output feature from wrapper  (IW-FS+1)/2
assign half_image_width = half_image_width_int ; 






//shift register per memorizzare le righe dispari

pooling_data_shift_register
      #(
      .LINEBUFFER_WIDTH   (LINEBUFFER_WIDTH),
      .CONV_WIDTH     (18)  //(17) //(16) 17 è il fix 
      )
      pooling_data_shift_register_i
      (
      .clk_i		             (clk_i),
      .rst_n                         (rst_n),
      
      .data                          (data_in),
      .half_image_width              (half_image_width),
      .write                         (write),
      
      .current_data                  (acc_data_o)    
      );

//fsm
always_ff @(posedge clk_i) 
   begin
      if (rst_n==1'b0)
      begin
         fsm_state               <= IDLE;
         accumulate_first_pixel  <= '0;
         cnt_width_image         <= '0;
         cnt_width_pooling_block <= '0;
         data_idle               <= '0;
         flag                    <= '0;
         feat_finish             <= '0;
         cnt_feat_height         <= '0;
         last_odd_row_data       <= '0;
      end
      else
      begin
         case(fsm_state)
            REG_IDLE: //stato simile a quello di pipe_pooling: se il pooling è disattivato si memorizza il dato in un registro e viene mandato in uscita al successivo colpo di clock
                begin
                if(req==1)begin
                  if(flag==1)begin
                    if(axi_sink_TREADY_i==1)begin
                      data_idle       <= y_out_TDATA_i;
                      flag            <= 1;
                      cnt_width_image <= cnt_width_image+1;
                    end
                  end
                  else begin
                    data_idle         <= y_out_TDATA_i;
                    flag              <= 1;
                    cnt_width_image   <= cnt_width_image+1;
                  end
                end
                else begin
                  if(flag==1)begin
                    if(axi_sink_TREADY_i==1)begin
                      flag            <= '0;
                    end
                  end              
                end
                
                
                if(cnt_width_image==half_image_width-1 && req==1)begin
                  cnt_width_image <= '0;
                  cnt_feat_height <= cnt_feat_height + 1;
                end
                
                if(cnt_feat_height==feat_height_int-1 && cnt_width_image==half_image_width-1 && req==1)begin
                  feat_finish <= 1;
                end
                
                if(feat_finish==1 && axi_sink_TREADY_i==1)begin
                  fsm_state       <= IDLE;
                  cnt_width_image <= '0;
                  flag            <= '0;   
                  cnt_feat_height <= '0;
                end
                
                /*
                if(feat_update==1)begin
                  fsm_state<=IDLE;
                  counter<=0;
                  counter_valid<=0;
                  counter_cycle<=0;
                  cnt_width_image<=0;
                  flag<=0;   
                  cnt_feat_height<=0;
                  wait_feat_update<=0;            
                end    */           
                end
            IDLE: // stato di attesa dove si aspetta il done_preload=1 dall'engine per andare in attesa di dati, due possibilità in base al fatto se il pooling è attivo o meno
                begin
                cnt_width_pooling_block <= 0;
                cnt_width_image<=0;
                flag<=0;
                cnt_feat_height<=0;
                if(done_preload==0)begin
                  feat_finish<=0;
                end
                if(done_preload==1'b1 && pooling_HW_int==1'b1)begin
                    fsm_state <= ACC_ODD;
                end
                else begin
                    fsm_state <= IDLE;
                    cnt_width_image <= 15'b000000000000000;
                    cnt_width_pooling_block <= 5'b0000;
                end
                if(done_preload==1'b1 && pooling_HW_int==1'b0 && feat_finish==1'b0)begin
                    fsm_state <= REG_IDLE;
                    flag<=0;
                end
               end
                
                          
            ACC_ODD: //vengono memorizzati i pixel delle righe dispari
                begin
                if(cnt_width_image==half_image_width-1 && req==1)begin // aggiungere req==1
                    cnt_feat_height<=cnt_feat_height+1;
                end
                if(done_preload == 1'b0)begin
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
                            //fsm_state <= ACC_EVEN;
                            if(cnt_feat_height==feat_height_int-1)begin
                              fsm_state <= ACC_ODD;
                              feat_finish<=1; // per scartare le righe dispari che sono anche le ultime da processare (immagine non multipla di 2)
                            end
                            else begin
                              fsm_state <= ACC_EVEN;
                            end
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
                if(feat_finish==1)begin //serve quando ho righe dispari o colonne dispari
                  fsm_state<=IDLE;
                  cnt_width_pooling_block <= 0;
                  cnt_width_image<=0;
                  flag<=0;   
                  cnt_feat_height<=0;
                end
                end
            ACC_EVEN://vengono accumulati i pixel della riga pari necessari per mandare in output un pixel (ping-pong con lo stato Produce)
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
                    accumulate_second_pixel<=temp1;//viene memorizzato il secondo pixel in un registro
                    fsm_state<=PRODUCE;
                    if(cnt_feat_height==feat_height_int-2 && cnt_width_image==half_image_width-1)begin                
                      last_odd_row_data <= {temp1,accumulate_first_pixel};
                    end
                end
                else if (req==1 && cnt_width_pooling_block<WIDTH_POOLING_BLOCK-1)begin
                    accumulate_first_pixel <= temp1; // memorizzo il primo dei due pixel che inserisco nella word da 32 bit (16bit = 1 pixel)
                    if(cnt_width_image == half_image_width-1 )begin
                        accumulate_second_pixel<=0;  
                        fsm_state<=PRODUCE;  //se è l'ultima colonna scarto e vado direttamente in ACC_ODD   
                        cnt_width_image<=cnt_width_image+1;
                        //fsm_state<=ACC_ODD;
                        //cnt_width_image <= 0;
                        //cnt_width_pooling_block <= 0;
                    end
                    
                end
                if(cnt_width_image==half_image_width-1 && req==1)begin 
                    cnt_feat_height<=cnt_feat_height+1;
                end 
                if(cnt_feat_height==feat_height_int-1 && cnt_width_image==half_image_width-1 && req==1)begin
                  feat_finish<=1;
                end
                end
            PRODUCE://produce i dati ma può anche memorizzare se gli arrivano dei dati in contemporanea (ping pong con stato precedente)
            begin   
                if(cnt_width_image==half_image_width-1  && req==1)begin
                    cnt_feat_height<=cnt_feat_height+1;
                end             
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
                                 fsm_state<=PRODUCE;  //se è l'ultima colonna scarto e vado direttamente in ACC_ODD  
                                 cnt_width_image <= cnt_width_image+1; 
                                 //fsm_state<=ACC_ODD;
                                 //cnt_width_image <= 0;
                                 //cnt_width_pooling_block <= 0;
                           end
                        end
                        else begin
                          cnt_width_pooling_block <= 0;
                        end
                    end
                end
                
                if(cnt_feat_height==feat_height_int-1 && cnt_width_image==half_image_width-1 && req==1)begin // se finisco l'immagine feat_finish va a 1
                  feat_finish <= 1;
                end
                
                if(feat_finish==1 && axi_sink_TREADY_i==1)begin// se ho finito di processare tutto vado in IDLE
                  fsm_state               <= IDLE;
                  cnt_width_pooling_block <= 0;
                  cnt_width_image         <= 0;
                  flag                    <= 0;   
                  cnt_feat_height         <= 0;
                end
                
                /*
                if(feat_update==1)begin
                    fsm_state<=IDLE;
                    cnt_width_image <=0 ;
                    cnt_width_pooling_block <= 0;
                end */
            end
            default:
                begin
                fsm_state               <= IDLE;
                cnt_width_image         <= 0;
                cnt_width_pooling_block <= 0;
                end
        endcase
      end
   end  
   
   
  
  
  
   
   
   always_comb
   begin    
      y_out_TREADY_o    = 0;
      axi_sink_TVALID_int = 0;
      axi_sink_TDATA_int  = 0;
      axi_sink_TSTRB_int  = 0;
      axi_sink_TKEEP_int  = 0;
      temp              = 0;
      temp1             = 0;
      temp_sign         = 0;
      temp_sign1        = 0;
      data_in           = 0;
      write             = 0;
      case(fsm_state)
      REG_IDLE:
      /*
      begin
        y_out_TREADY_o=axi_sink_TREADY_i;
        axi_sink_TVALID_int=y_out_TVALID_i;
        axi_sink_TDATA_int=y_out_TDATA_i;
        axi_sink_TSTRB_int=y_out_TSTRB_i;
        axi_sink_TKEEP_int=y_out_TKEEP_i;
      end
      */
      
      begin//gestione del protocollo di comunicazione quando il pooling è disattivato e vogliamo memorizzare i dati per spezzare i percorsi critici
      if(flag==1)begin
          if(axi_sink_TREADY_i==1)begin
            if(feat_finish==1)begin
              y_out_TREADY_o = 0;
            end
            else begin
              y_out_TREADY_o = 1;
            end 
          end
          else begin
            if(feat_finish==1)begin
              y_out_TREADY_o = 0;
            end
            else begin
              y_out_TREADY_o = 1;
            end 
          end
          axi_sink_TVALID_int = 1;
          axi_sink_TDATA_int  = data_idle; 
          axi_sink_TSTRB_int  = 4'hf;
          axi_sink_TKEEP_int  = 4'hf; 
        end
        else begin
          if(feat_finish==1)begin
            y_out_TREADY_o  = 0;
          end
          else begin
            y_out_TREADY_o  = 1;
          end          
          axi_sink_TVALID_int = 0;
          axi_sink_TDATA_int  = 0; 
          axi_sink_TSTRB_int  = 0;
          axi_sink_TKEEP_int  = 0; 
        end
      end
      
      IDLE: //tutto a zero in IDLE
      begin   
        data_in           = '0;
        write             = '0;
        y_out_TREADY_o    = '0;
        axi_sink_TVALID_int = '0;
        axi_sink_TDATA_int  = '0; 
        axi_sink_TSTRB_int  = '0;
        axi_sink_TKEEP_int  = '0; 
        
           
      
      end      
      ACC_ODD://viene gestito il protocollo di comunicazione di questo stato e vengono fatti i calcoli di pooling in variabili temporanee (poi memorizzate nello shift register)
              //con locazioni da 16 bit (prima viene fatto il calcolo)
      begin
        case(method_pooling_int)
          2'b00:
          begin
            data_in    = ($signed(data[AXI_WIDTH-1:CONV_WIDTH])>$signed(data[CONV_WIDTH-1:0]))?$signed(data[AXI_WIDTH-1:CONV_WIDTH]):$signed(data[CONV_WIDTH-1:0]);
          end
          2'b01:
          begin
            temp_sign  = $signed(data[AXI_WIDTH-1:CONV_WIDTH]);
            temp_sign1 = $signed(data[CONV_WIDTH-1:0]);
            data_in    = $signed(temp_sign) + $signed(temp_sign1);
          end
          2'b10:
          begin
            data_in    = data[CONV_WIDTH-1+2:0];//[AXI_WIDTH-1:CONV_WIDTH];         
          end
          default:
          begin
            data_in    = ($signed(data[AXI_WIDTH-1:CONV_WIDTH])>$signed(data[CONV_WIDTH-1:0]))?$signed(data[AXI_WIDTH-1:CONV_WIDTH]):$signed(data[CONV_WIDTH-1:0]);//caso default max
          end
        endcase
        write          = req;//segnale attivato per scrivere il dato nello shift_register
        y_out_TREADY_o = 1;
        if(cnt_width_image==half_image_width-1 && cnt_feat_height==feat_height_int-1 && req==1)begin
          axi_sink_TVALID_int = 1;
          axi_sink_TDATA_int  = last_odd_row_data;
        end
        else begin
          axi_sink_TVALID_int = '0;
          axi_sink_TDATA_int  = '0;
        end      
      end   
      ACC_EVEN: //simile ad ACC_ODD ma per righe pari (memorizzo in un registro e non in uno shift register perchè poi i dati possono essere man mano mandati in uscita)
      begin
        data_in           = '0;
        write             = req;
        y_out_TREADY_o    = 1;        
        axi_sink_TVALID_int = '0;
        axi_sink_TDATA_int  = '0;
        if(req==1 && cnt_width_pooling_block==WIDTH_POOLING_BLOCK-1)begin
          case(method_pooling_int)
            2'b00:
            begin
              temp  = ($signed(data[AXI_WIDTH-1:CONV_WIDTH]) > $signed(data[CONV_WIDTH-1:0])) ? $signed(data[AXI_WIDTH-1:CONV_WIDTH]) : $signed(data[CONV_WIDTH-1:0]);
              temp1 = ($signed(temp) > $signed(acc_data_o[CONV_WIDTH-1:0]))                   ? $signed(temp)                         : $signed(acc_data_o[CONV_WIDTH-1:0]);
            end
            2'b01:
            begin
              temp_sign  = $signed(data[AXI_WIDTH-1:CONV_WIDTH]) + $signed(data[CONV_WIDTH-1:0]) + $signed(acc_data_o);
              temp_sign1 = temp_sign >>> 2;
              //temp=$signed(temp_sign[CONV_WIDTH-1+2:0+2]) + $signed(temp_sign1[CONV_WIDTH-1+2:0+2]);
              temp1      = $signed(temp_sign1[CONV_WIDTH-1:0]);
            end
            2'b10:
            begin
              temp1     = acc_data_o[CONV_WIDTH-1:0];
            end
            default: 
            begin
              temp  = ($signed(data[AXI_WIDTH-1:CONV_WIDTH]) > $signed(data[CONV_WIDTH-1:0])) ? $signed(data[AXI_WIDTH-1:CONV_WIDTH]) : $signed(data[CONV_WIDTH-1:0]);
              temp1 = ($signed(temp) > $signed(acc_data_o[CONV_WIDTH-1:0]))                   ? $signed(temp)                         : $signed(acc_data_o[CONV_WIDTH-1:0]);    
            end
          endcase
        end
        else if (req==1 && cnt_width_pooling_block<WIDTH_POOLING_BLOCK-1)begin
          case(method_pooling_int)
            2'b00:
            begin
              temp  = ($signed(data[AXI_WIDTH-1:CONV_WIDTH])>$signed(data[CONV_WIDTH-1:0]))?$signed(data[AXI_WIDTH-1:CONV_WIDTH]):$signed(data[CONV_WIDTH-1:0]);
              temp1 = ($signed(temp)>$signed(acc_data_o[CONV_WIDTH-1:0]))?$signed(temp):$signed(acc_data_o[CONV_WIDTH-1:0]);
            end
            2'b01:
            begin
              temp_sign  = $signed(data[AXI_WIDTH-1:CONV_WIDTH]) + $signed(data[CONV_WIDTH-1:0]) + $signed(acc_data_o);
              temp_sign1 = temp_sign >>> 1;
              temp1      = temp_sign1[CONV_WIDTH-1:0];
            end
            2'b10:
            begin
              temp1      = acc_data_o[CONV_WIDTH-1:0];
            end
            default:
            begin
              temp       = ($signed(data[AXI_WIDTH-1:CONV_WIDTH]) > $signed(data[CONV_WIDTH-1:0])) ? $signed(data[AXI_WIDTH-1:CONV_WIDTH]) : $signed(data[CONV_WIDTH-1:0]);
              temp1      = ($signed(temp) > $signed(acc_data_o[CONV_WIDTH-1:0]))                   ? $signed(temp)                         : $signed(acc_data_o[CONV_WIDTH-1:0]);
            end
          endcase             
        end
       
      end
      PRODUCE://gestione protocollo in fase di produzione (e di accumulazione pari-pingpong)
      begin            
            data_in=0;
            write=0;
            if(cnt_width_image==half_image_width)begin
              case(method_pooling_int)
                2'b00:
                begin
                  data_in = ($signed(data[AXI_WIDTH-1:CONV_WIDTH]) > $signed(data[CONV_WIDTH-1:0])) ? $signed(data[AXI_WIDTH-1:CONV_WIDTH]) : $signed(data[CONV_WIDTH-1:0]);
                end
                2'b01:
                begin
                  temp_sign  = $signed(data[AXI_WIDTH-1:CONV_WIDTH]);
                  temp_sign1 = $signed(data[CONV_WIDTH-1:0]);
                  data_in    = $signed(temp_sign) + $signed(temp_sign1);
                end
                2'b10:
                begin
                  data_in = data[CONV_WIDTH-1:0];//[AXI_WIDTH-1:CONV_WIDTH]; 
                end
                default:
                begin
                  data_in = ($signed(data[AXI_WIDTH-1:CONV_WIDTH]) > $signed(data[CONV_WIDTH-1:0])) ? $signed(data[AXI_WIDTH-1:CONV_WIDTH]) : $signed(data[CONV_WIDTH-1:0]);
                end
              endcase
              
                write=req;
                if(feat_finish==1)begin //perchè potrebbe essere l'ultimo
                  y_out_TREADY_o = 0;
                end
                else begin
                  y_out_TREADY_o = 1;
                end 
                axi_sink_TDATA_int = 0; 
            end
            else begin
                if(axi_sink_TREADY_i==1)begin
                  write          = req;
                  y_out_TREADY_o = 1;
                  if(req==1)begin
                    case(method_pooling_int)
                      2'b00:
                      begin
                        temp  = ($signed(data[AXI_WIDTH-1:CONV_WIDTH]) > $signed(data[CONV_WIDTH-1:0])) ? $signed(data[AXI_WIDTH-1:CONV_WIDTH]) : $signed(data[CONV_WIDTH-1:0]);
                        temp1 = ($signed(temp) > $signed(acc_data_o[CONV_WIDTH-1:0]))                   ? $signed(temp)                         : $signed(acc_data_o[CONV_WIDTH-1:0]);
                      end
                      2'b01:
                      begin
                        temp_sign  = $signed(data[AXI_WIDTH-1:CONV_WIDTH]) + $signed(data[CONV_WIDTH-1:0]) + $signed(acc_data_o);
                        temp_sign1 = temp_sign >>> 2;
                        temp1      = temp_sign1[CONV_WIDTH-1:0];
                      end
                      2'b10:
                      begin
                        temp1      = acc_data_o[CONV_WIDTH-1:0];
                      end
                      default:
                      begin
                        temp       = ($signed(data[AXI_WIDTH-1:CONV_WIDTH]) > $signed(data[CONV_WIDTH-1:0])) ? $signed(data[AXI_WIDTH-1:CONV_WIDTH]) : $signed(data[CONV_WIDTH-1:0]);
                        temp1      = ($signed(temp) > $signed(acc_data_o[CONV_WIDTH-1:0]))                   ? $signed(temp)                         : $signed(acc_data_o[CONV_WIDTH-1:0]);
                      end
                    endcase
                  end     
                end
                else begin
                  y_out_TREADY_o = 0;
                end
            end
            if(cnt_feat_height==feat_height_int-2 && cnt_width_image==half_image_width-1)begin
              axi_sink_TVALID_int = 0;
            end
            else begin
              axi_sink_TVALID_int = 1;
            end
            axi_sink_TDATA_int = {accumulate_second_pixel,accumulate_first_pixel};//concatenazione dell'uscita
            axi_sink_TSTRB_int = 4'hf;
            axi_sink_TKEEP_int = 4'hf;
      end
      default:
      begin
        data_in           = '0;
        write             = '0;
        y_out_TREADY_o    = '0;
        axi_sink_TVALID_int = '0;
        axi_sink_TDATA_int  = '0;
        axi_sink_TSTRB_int  = '0;
        axi_sink_TKEEP_int  = '0;
      end
   endcase
   end
   
   



endmodule
