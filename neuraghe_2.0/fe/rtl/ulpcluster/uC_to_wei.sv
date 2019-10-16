`include "ulpsoc_defines.sv"

module uC_to_wei
#(
   parameter DATA_WIDTH     = 32,
   parameter ADDR_WIDTH     = 32,
   parameter BE_WIDTH       = DATA_WIDTH/8,
   parameter WEI_BANKS_STRIDE = 1024
  )
  (
   input logic                    clk_i,
   input logic                    rst_ni,
  
   input logic [DATA_WIDTH-1:0]   wdata,
   input logic [ADDR_WIDTH-1:0]   add,
   input logic  		              req,
   input logic  		              wen,
   input logic [BE_WIDTH-1:0] 	  be,
   
   output logic                   gnt_from_dma_o,          
   output logic                   r_valid_from_dma_o,  
   output logic [DATA_WIDTH-1:0]  r_rdata_from_dma_o,
   

   output logic [DATA_WIDTH-1:0]  wdata_to_dma,
   output logic                   req_to_dma,          
   output logic [ADDR_WIDTH-1:0]  add_to_dma,           
   output logic                   wen_to_dma,           
   output logic [BE_WIDTH-1:0]    be_to_dma,             

   input logic                    gnt_from_dma_i,          
   input logic                    r_valid_from_dma_i,  
   input logic  [DATA_WIDTH-1:0]  r_rdata_from_dma_i
  );
  
   logic [3:0] gnt_dma_cnt;
   logic clr, inc, mem;
   logic [18:0] tot_tx_reg;
  
    
    
  enum logic [3:0] {IDLE_SEND, ALLOC, SEND_TO_WEI, BARRIER, WAIT_VALID, FREE} CS_snd, NS_snd;
  
  always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          gnt_dma_cnt <= 0;   
     end
     else if(inc && gnt_from_dma_i == 1'b1) begin
          gnt_dma_cnt <= gnt_dma_cnt + 1;
     end
     else if (clr) begin
          gnt_dma_cnt <= 0;            
     end
   end

  always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          tot_tx_reg <= 0;   
     end
     else if(mem == 1'b1) begin
          tot_tx_reg <= wdata[18:0];
     end
     else if (clr) begin
          tot_tx_reg <= 0;            
     end
   end
   

//update state
  always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
    if (rst_ni==1'b0) begin
      CS_snd <= IDLE_SEND;
    end
    else begin
      CS_snd <= NS_snd;
    end
  end
  
  always_comb begin
  
  case(CS_snd)
  
  IDLE_SEND:
  begin
  if(req==1'b1 && wen==1'b1)begin
    if(add[7:0]==8'h04)begin
      NS_snd = BARRIER;
    end
    else begin
      NS_snd = ALLOC;
    end
  end
  else if(req==1'b1 && wen==1'b0 && be==4'hf)begin
    if(wdata[19+3:16+3]==4'h7)begin
      NS_snd = SEND_TO_WEI;
    end   
    else begin
      NS_snd = FREE;
    end
  end
  else begin
    NS_snd = IDLE_SEND;
  end
  end
  
  ALLOC:
  begin
  if(req==1'b0)begin
    NS_snd = IDLE_SEND;
  end
  else begin
    NS_snd = ALLOC;
  end
  end

  
  SEND_TO_WEI:
  begin
  if(req==1'b0 && gnt_dma_cnt==5)begin
    NS_snd = IDLE_SEND;
  end
  else begin
    NS_snd = SEND_TO_WEI;
  end
  end
  
  
  BARRIER:
  begin
  if(gnt_from_dma_i)begin
    NS_snd = WAIT_VALID;//IDLE_SEND;
  end
  else begin
    NS_snd = BARRIER;
  end
  end
  
  
  WAIT_VALID:
  begin
    if(r_valid_from_dma_i)begin
      NS_snd = IDLE_SEND;
    end
    else begin
      NS_snd = WAIT_VALID;
    end
  end
  
  
  FREE:
  begin
    if(req==1'b0 && r_valid_from_dma_i==1'b1)begin
      NS_snd = IDLE_SEND;
    end
    else begin
      NS_snd = FREE;
    end
  end
  
  default:
  begin
    NS_snd = IDLE_SEND;
  end
  
  endcase
  end
  
  
  always_comb begin
  
  case(CS_snd)
  
  IDLE_SEND:
  begin
    wdata_to_dma = 0;
    req_to_dma   = 1'b0;
    add_to_dma   = 1'b0;
    wen_to_dma   = 1'b1;
    be_to_dma    = 0;
    
    clr = 1'b1;
    inc = 1'b0;
    mem = 1'b0;
  end
  
  ALLOC:
  begin
    wdata_to_dma = wdata;
    req_to_dma   = req;
    add_to_dma   = add;
    wen_to_dma   = wen;
    be_to_dma    = be;
    
    clr = 1'b0;
    inc = 1'b0; 
    mem = 1'b0;
  end
  
  SEND_TO_WEI:
  begin
    
    if(gnt_dma_cnt==0)begin  
      wdata_to_dma = {wdata[31:19], wdata[18:0] >>> 1};  
      mem = 1'b1;
    end
    else if(gnt_dma_cnt==1)begin 
      wdata_to_dma = wdata + WEI_BANKS_STRIDE;
      mem = 1'b0;
    end
    else if(gnt_dma_cnt==2)begin
    `ifdef SIM
      wdata_to_dma = {wdata[31:19], wdata[18:0] >>> 1};
    `else
      wdata_to_dma = (WEI_BANKS_STRIDE != 0) ? (wdata + (tot_tx_reg >>> 1)) : wdata;
    `endif
      mem = 1'b0;
    end
    else begin
      wdata_to_dma = wdata;
      mem = 1'b0;
    end
    
    clr = 1'b0;
    inc = 1'b1;
    
    req_to_dma   = req;
    add_to_dma   = add;
    wen_to_dma   = wen;
    be_to_dma    = be;
  end
  
  
  BARRIER:
  begin
    wdata_to_dma = wdata;
    req_to_dma   = req;
    add_to_dma   = add;
    wen_to_dma   = wen;
    be_to_dma    = be;
    
    clr = 1'b1;
    inc = 1'b0;
    mem = 1'b0;
  end
  
  
  WAIT_VALID:
  begin
    wdata_to_dma = wdata;
    req_to_dma   = req;
    add_to_dma   = add;
    wen_to_dma   = wen;
    be_to_dma    = be;
    
    clr = 1'b1;
    inc = 1'b0;
    mem = 1'b0;
  end
  
  
  FREE:
  begin
    wdata_to_dma = wdata;
    req_to_dma   = req;
    add_to_dma   = add;
    wen_to_dma   = wen;
    be_to_dma    = be;
    
    clr = 1'b1;
    inc = 1'b0;
    mem = 1'b0;
  end
  
  default:
  begin
    wdata_to_dma = 0;
    req_to_dma   = 1'b0;
    add_to_dma   = 1'b0;
    wen_to_dma   = 1'b1;
    be_to_dma    = 0;
    
    clr = 1'b1;
    inc = 1'b0;
    mem = 1'b0;
  end
  
  endcase
  end
    
    
    assign gnt_from_dma_o      = gnt_from_dma_i;
    assign r_valid_from_dma_o  = r_valid_from_dma_i;  
    assign r_rdata_from_dma_o  = r_rdata_from_dma_i;
  
  
  endmodule
  
