/******************************************************************************                            
 *                                                                                   *
 *          EOLAB @ DIEE - Università degli studi di Cagliari                        *
 *                      Via marengo 2 - 09123                                        *
 *                              Cagliari                                             *
 *                                                                                   *
 *                                                                                   *
 * Engineer:       Gianfranco Deriu - gian.deriu@gmail.com                           *
 *                                                                                   *
 * Project:        NEURAGHE - Convolutional Neural Network Accelerator from Sardinia *
 * File:           ram_preloader.sv                                                       *
 * Description:    blocking preloader for L2 ram                                     *
 *                                                                                   *
 *************************************************************************************/
 module ram_preloader
#(
    parameter ADDR_WIDTH     = 12,
    parameter PER_ID_WIDTH   = 1,
    parameter PER_ADDR_WIDTH = 32,
    parameter BASE_ADDR      = 32'h1C000000
)
(
      input  logic                      rst_ni,       
      input  logic                      clk_i,         
      input  logic                      en_i,         
      output logic                      done_o,
      
      
      
      // PERIPHERAL INTERCONNECT SLAVE
    //***************************************
    //REQUEST CHANNEL
    output  logic                      per_slave_req_o,
    output  logic [PER_ADDR_WIDTH-1:0] per_slave_add_o,
    output  logic                      per_slave_wen_o,
    output  logic [31:0]               per_slave_wdata_o,
    output  logic [3:0]                per_slave_be_o,
    output  logic [PER_ID_WIDTH-1:0]   per_slave_id_o,
    input logic                        per_slave_gnt_i,
    
    //RESPONSE CHANNEL
    input logic                      per_slave_r_valid_i,
    input logic                      per_slave_r_opc_i,
    input logic [PER_ID_WIDTH-1:0]   per_slave_r_id_i,
    input logic [31:0]               per_slave_r_rdata_i
      
      
      
);
enum logic [1:0] {IDLE, REQ, WAIT, DONE} fsm_state;

localparam             WORDS = 2**ADDR_WIDTH;

logic [31:0]           mem[WORDS-1:0];
logic [ADDR_WIDTH -1 + 1:0] cont;
integer MAX_WORDS=WORDS;
integer n=0;

initial
begin
  $readmemh("slm_files/l2_stim.slm", mem );
  while (^mem[WORDS-1-n]===1'bX)
  begin
    n=n+1;
  end
  MAX_WORDS = WORDS-n;
  $display("Number of instructions: %d\n", MAX_WORDS);
end


always @(posedge clk_i)
begin
  if(rst_ni == 1'b0)
  begin
    fsm_state <= IDLE;    
    cont      <= 0;
  end
  else
  begin
    
    case(fsm_state)
      IDLE:
        begin
          if (en_i==1'b1)
          begin
            fsm_state <= REQ;
            cont      <= 0;
          end
        end
      REQ:
        begin
          if (en_i==1'b1)
          begin
            if (per_slave_gnt_i==1'b1)
              begin
                fsm_state <= WAIT;
                cont      <= cont + 1;
              end
            
          end
          else
          begin
            fsm_state <= IDLE;
          end
        end
      WAIT:
        begin
          if (en_i==1'b1)
          begin
            if (per_slave_r_valid_i==1'b1)
              if (cont < MAX_WORDS)
                fsm_state <= REQ;
              else
                fsm_state <= DONE;
            else
              fsm_state <= WAIT;
            
          end
        end
      DONE:
        begin
          if (en_i==1'b0)
            fsm_state <= IDLE;
          else
            fsm_state <= DONE;            
          
        end
      default:
        begin
          fsm_state <= IDLE;
          cont      <= 0;
        end
    endcase
    
    
  end
    
    
end


always_comb
begin

  per_slave_add_o   = BASE_ADDR + cont*4;
  per_slave_wen_o   = 1'b0;
  per_slave_be_o    = 4'b1111;
  per_slave_wdata_o = mem[cont];
  per_slave_id_o    = 0;
  
  case(fsm_state)
      IDLE:
        begin
          per_slave_req_o = 1'b0;
          done_o = 1'b0;
        end
      REQ:
        begin
          per_slave_req_o = 1'b1;
          done_o = 1'b0;
        end
      WAIT:
        begin
         per_slave_req_o = 1'b0;
         done_o = 1'b0;
        end
      DONE:
        begin
         done_o = 1'b1;
        end
      default:
        begin
          per_slave_req_o = 1'b0;
          done_o = 1'b0;
        end
    endcase



end



endmodule
