/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 * Engineer:        Gianfranco Deriu - gian.deriu@gmail.com                   *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           hwce_periph_adapt.sv                                       *
 * Description:    Performs clock pairing between peripheral bus and HWCE          *
 *                                                                            *
 ******************************************************************************/

module hwce_periph_adapt
#(
  parameter CLUS_ADDR_WIDTH      = 32,
  // Config interface params
  parameter CFG_ADDR_WIDTH      = 11,
  parameter CFG_DATA_WIDTH      = 32,
  parameter CFG_BE_WIDTH        = CFG_DATA_WIDTH/8,
  parameter CFG_ID_WIDTH        = 16
)
(
  input  logic                                          clk_i,
  input  logic                                          clk_fast_i,
  input  logic                                          rst_n,

  // SLAVE
  // Request side - TARGET
  input  logic                                          cfg_req_is,
  output logic                                          cfg_gnt_os,
  input  logic [CLUS_ADDR_WIDTH-1:0]                    cfg_add_is,
  input  logic                                          cfg_type_is,
  input  logic [CFG_BE_WIDTH-1:0]                       cfg_be_is,
  input  logic [CFG_DATA_WIDTH-1:0]                     cfg_data_is,
  input  logic [CFG_ID_WIDTH-1:0]                       cfg_ID_is,
  // Response side  - TARGET
  output logic                                          cfg_r_valid_os,
  output logic [CFG_DATA_WIDTH-1:0]                     cfg_r_data_os,
  output logic [CFG_ID_WIDTH-1:0]                       cfg_r_ID_os,



  // MASTER
  // Request side - TARGET
  output  logic                                          cfg_req_om,
  input   logic                                          cfg_gnt_im,
  output  logic [CLUS_ADDR_WIDTH-1:0]                    cfg_add_om,
  output  logic                                          cfg_type_om,
  output  logic [CFG_BE_WIDTH-1:0]                       cfg_be_om,
  output  logic [CFG_DATA_WIDTH-1:0]                     cfg_data_om,
  output  logic [CFG_ID_WIDTH-1:0]                       cfg_ID_om,
  // Response side  - TARGET
  input logic                                          cfg_r_valid_im,
  input logic [CFG_DATA_WIDTH-1:0]                     cfg_r_data_im,
  input logic [CFG_ID_WIDTH-1:0]                       cfg_r_ID_im

);

  typedef enum logic [1:0] {IDLE_FAST, CMD_FAST, WAIT_VALID, SEND_RESP} fsm_fast_t;
  typedef enum logic [1:0] {IDLE_SLOW, CMD_ACCEPTED, RESP_RECEIVED}     fsm_slow_t;

  fsm_fast_t fsm_fast;
  fsm_slow_t fsm_slow; 

  logic start_fast;
  logic reset_fast;
  logic resp_slow;
  

  logic [CFG_DATA_WIDTH-1:0]  cfg_r_data_reg;
  logic [CFG_ID_WIDTH-1:0]    cfg_r_ID_reg;
  
  
  logic [CLUS_ADDR_WIDTH-1:0] cfg_add_reg;
  logic                       cfg_type_reg;
  logic [CFG_BE_WIDTH-1:0]    cfg_be_reg;
  logic [CFG_DATA_WIDTH-1:0]  cfg_data_reg;
  logic [CFG_ID_WIDTH-1:0]    cfg_ID_reg;


//************************** FAST ***********************************

  always_ff @(posedge clk_fast_i) begin
    if (rst_n==1'b0) begin
      fsm_fast    <= IDLE_FAST;
    end
    else begin
       case (fsm_fast)
         IDLE_FAST: begin
           if (start_fast==1'b1) begin
             fsm_fast <= CMD_FAST;
           end
           else begin
             fsm_fast <= IDLE_FAST;
           end
         end
         
         CMD_FAST: begin
         if (cfg_gnt_im == 1'b1)
           if (cfg_type_is==1'b1)
           begin
              if(cfg_r_valid_im == 1'b0) begin
                    fsm_fast <= WAIT_VALID;
                    end
              else if (cfg_r_valid_im == 1'b1) begin
                    fsm_fast <= SEND_RESP;
                    end
           end
           else 
           begin
                fsm_fast <= SEND_RESP;
           end
         else
            fsm_fast <= CMD_FAST;
         begin
         
         end
      
         end
         WAIT_VALID: begin
           if (cfg_r_valid_im == 1'b1) begin
             fsm_fast <= SEND_RESP;
           end
           else begin
             fsm_fast <= WAIT_VALID;
           end
         end
         
         SEND_RESP: begin
          if (reset_fast == 1'b1) begin
             fsm_fast <= IDLE_FAST;
           end
           else begin
             fsm_fast <= SEND_RESP;
           end
         end
         
         default: begin
           fsm_fast <= IDLE_FAST;
         end
       endcase
    end
  end

  always_comb begin //************** FAST
    case(fsm_fast)
      IDLE_FAST: begin
        cfg_req_om = 1'b0;
        resp_slow  = 1'b0; 
      end
      
      CMD_FAST: begin
        cfg_req_om = 1'b1; 
        resp_slow  = 1'b0;        
      end
      
      WAIT_VALID: begin
        cfg_req_om = 1'b0;
        resp_slow  = 1'b0; 
      end
      
      SEND_RESP: begin
        cfg_req_om = 1'b0;
        resp_slow  = 1'b1; 
      end
      
      default: begin
        cfg_req_om = 1'b0;
        resp_slow  = 1'b0; 
      end
    endcase
  end


  always_ff @(posedge clk_fast_i) begin
    if (cfg_r_valid_im == 1'b1) begin
      cfg_r_data_reg <= cfg_r_data_im;
      cfg_r_ID_reg   <= cfg_r_ID_im;
    end
  end

  assign cfg_r_data_os = cfg_r_data_reg;
  assign cfg_r_ID_os   = cfg_r_ID_reg;


  assign cfg_add_om    = cfg_add_reg;
  assign cfg_type_om   = cfg_type_reg;
  assign cfg_be_om     = cfg_be_reg;
  assign cfg_data_om   = cfg_data_reg;
  assign cfg_ID_om     = cfg_ID_reg;

//************************** SLOW ***********************************


  always_ff @(posedge clk_i) begin
    if (rst_n==1'b0) begin
       fsm_slow    <= IDLE_SLOW;
    end
    else begin
       case (fsm_slow)
         IDLE_SLOW: begin
           if (cfg_req_is==1'b1) begin
              fsm_slow <= CMD_ACCEPTED;
           end
           else begin
              fsm_slow <= IDLE_SLOW;
           end          
         end
         
         CMD_ACCEPTED: begin
          if (resp_slow==1'b1) begin
              fsm_slow <= RESP_RECEIVED;
           end
         end
         
         RESP_RECEIVED: begin
           fsm_slow <= IDLE_SLOW;           
         end
         
         default: begin
           fsm_slow <= IDLE_SLOW;
         end
       endcase
    end
  end

  always_comb begin //**************** SLOW
    case(fsm_slow)
      IDLE_SLOW: begin
        cfg_gnt_os     = 1'b0;
        cfg_r_valid_os = 1'b0;
        reset_fast     = 1'b1;
        start_fast     = 1'b0;   
      end
      CMD_ACCEPTED: begin
        cfg_gnt_os     = 1'b0;
        cfg_r_valid_os = 1'b0;
        reset_fast     = 1'b0;
        start_fast     = 1'b1; 
      end
      RESP_RECEIVED: begin
        cfg_gnt_os     = 1'b1;
        cfg_r_valid_os = 1'b1;
        reset_fast     = 1'b0;
        start_fast     = 1'b0;
      end
      default: begin
        cfg_gnt_os     = 1'b0;
        cfg_r_valid_os = 1'b0;
        reset_fast     = 1'b0;
        start_fast     = 1'b0;        
      end
    endcase
  end

  always_ff @(posedge clk_i) begin
    if (fsm_slow == IDLE_SLOW && cfg_req_is==1'b1) begin
    
      cfg_add_reg  <= cfg_add_is;
      cfg_type_reg <= cfg_type_is;
      cfg_be_reg   <= cfg_be_is;
      cfg_data_reg <= cfg_data_is;
      cfg_ID_reg   <= cfg_ID_is;
    
    end
  end


endmodule
