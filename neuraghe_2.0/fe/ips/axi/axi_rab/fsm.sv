 `timescale 1ns / 1ps
module fsm(
           
   input    logic             s_axi_aclk,
   input    logic             s_axi_aresetn,
   input    logic             port1_addr_valid,
   input    logic             port2_addr_valid,
   input    logic             port1_sent,
   input    logic             port2_sent,
   input    logic             select,        
   input    logic             no_hit,   
   input    logic             multiple_hit,
   input    logic             no_prot,
   input    logic    [31:0]   out_addr,   
   output   logic             port1_accept,
   output   logic             port1_drop,  
   output   logic             port2_accept, 
   output   logic             port2_drop,  
   output   logic    [31:0]   out_addr_reg,
   output   logic             int_miss,    
   output   logic             int_multi,  
   output   logic             int_prot     
    
);
   
 parameter IDLE  = 2'b00;
 parameter WAIT0 = 2'b01;
 parameter WAIT1 = 2'b10;
 parameter DONE  = 2'b11;
   
  //-------------Internal Variables---------------------------
   
  reg   [1:0]          state        ;// Seq part of the FSM
  reg   [1:0]          next_state   ;// combo part of FSM


   
  //----------Code startes Here------------------------
   
  always @ (state or port1_addr_valid or port2_addr_valid or port1_sent or port2_sent)
  begin : FSM_COMBO
   next_state = 2'b00;
   case(state)
     IDLE : if (port1_addr_valid || port2_addr_valid)
                next_state = WAIT0;
             else begin
                next_state = IDLE;
             end
     WAIT0 : next_state = WAIT1;
     WAIT1 : next_state = DONE;
     DONE : if (port1_sent || port2_sent)
              next_state = IDLE;
            else
              next_state = DONE;
     default : next_state = IDLE;
    endcase
  end

   
  //----------Seq Logic-----------------------------
 
 always @ (posedge s_axi_aclk or negedge s_axi_aresetn)
  begin : FSM_SEQ
    if (s_axi_aresetn == 1'b0) begin
      state <= #1 IDLE;
    end else begin
      state <= #1 next_state;
    end
  end

   
  //----------Output Logic-----------------------------
   
  always @ (posedge s_axi_aclk or negedge s_axi_aresetn)
  begin : OUTPUT_LOGIC
  if (s_axi_aresetn == 1'b0) begin
    port1_accept = 1'b0;
    port1_drop   = 1'b0;
    port2_accept = 1'b0;
    port2_drop   = 1'b0;
    out_addr_reg = 32'h0;
    int_miss     = 1'b0;
    int_multi    = 1'b0;
    int_prot     = 1'b0;
  end
  else begin
    case(state)
      IDLE : begin
               port1_accept = 1'b0;
               port1_drop   = 1'b0;
               port2_accept = 1'b0;
               port2_drop   = 1'b0;
             end
      WAIT0 : begin
               port1_accept = 1'b0;
               port1_drop   = 1'b0;
               port2_accept = 1'b0;
               port2_drop   = 1'b0;
             end
      WAIT1 : begin
               port1_accept = select & ~(no_hit | multiple_hit | ~no_prot);
               port1_drop   = select & (no_hit | multiple_hit | ~no_prot);
               port2_accept = ~select & ~(no_hit | multiple_hit | ~no_prot);
               port2_drop   = ~select & (no_hit | multiple_hit | ~no_prot);
               int_miss     = no_hit;
               int_multi    = multiple_hit;
               int_prot     = ~no_prot;
               out_addr_reg = out_addr;
             end
      DONE : begin
               port1_accept = 1'b0;
               port1_drop   = 1'b0;
               port2_accept = 1'b0;
               port2_drop   = 1'b0;
               int_miss     = 1'b0;
               int_multi    = 1'b0;
               int_prot     = 1'b0;
             end
      default : begin
               port1_accept = 1'b0;
               port1_drop   = 1'b0;
               port2_accept = 1'b0;
               port2_drop   = 1'b0;
             end
    endcase
  end
  end // End Of Block OUTPUT_LOGIC


endmodule
