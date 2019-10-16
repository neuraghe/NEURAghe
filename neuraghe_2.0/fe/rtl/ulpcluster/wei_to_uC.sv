module wei_to_uC
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
   
   output logic                   gnt_to_uC,          
   output logic                   r_valid_to_uC,  
   output logic [DATA_WIDTH-1:0]  r_rdata_to_uC,
   

   output logic [DATA_WIDTH-1:0]  wdata_to_dma0,
   output logic                   req_to_dma0,          
   output logic [ADDR_WIDTH-1:0]  add_to_dma0,           
   output logic                   wen_to_dma0,           
   output logic [BE_WIDTH-1:0]    be_to_dma0,  
   
   input logic                    gnt_from_dma0,          
   input logic                    r_valid_from_dma0,  
   input logic  [DATA_WIDTH-1:0]  r_rdata_from_dma0,   
   
   output logic [DATA_WIDTH-1:0]  wdata_to_dma1,
   output logic                   req_to_dma1,          
   output logic [ADDR_WIDTH-1:0]  add_to_dma1,           
   output logic                   wen_to_dma1,           
   output logic [BE_WIDTH-1:0]    be_to_dma1,        
   
   input logic                    gnt_from_dma1,          
   input logic                    r_valid_from_dma1,  
   input logic  [DATA_WIDTH-1:0]  r_rdata_from_dma1
  );
  
  logic gnt_from_dma0_reg, gnt_from_dma1_reg, r_valid_from_dma0_reg, r_valid_from_dma1_reg, clr_gnt0, clr_gnt1, clr_v0, clr_v1;
  logic [DATA_WIDTH-1:0] r_rdata_from_dma0_reg, r_rdata_from_dma1_reg;
  
  always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          gnt_from_dma0_reg <= 0;   
     end
     else if(gnt_from_dma0 == 1'b1) begin
          gnt_from_dma0_reg <= gnt_from_dma0;
     end
     else if (clr_gnt0) begin
          gnt_from_dma0_reg <= 0;      
     end
   end
   
   always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          gnt_from_dma1_reg     <= 0; 
     end
     else if(gnt_from_dma1 == 1'b1) begin
          gnt_from_dma1_reg     <= gnt_from_dma1;
     end
     else if (clr_gnt1) begin
          gnt_from_dma1_reg     <= 0;  
     end
   end
   
   always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          r_valid_from_dma0_reg <= 0;  
          r_rdata_from_dma0_reg <= 0; 
     end
     else if(r_valid_from_dma0 == 1'b1) begin
          r_valid_from_dma0_reg <= r_valid_from_dma0;
          r_rdata_from_dma0_reg <= r_rdata_from_dma0;
     end
     else if (clr_v0) begin
          r_valid_from_dma0_reg <= 0;   
          r_rdata_from_dma0_reg <= 0;   
     end
   end
   
  always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
   if (rst_ni==1'b0) begin
        r_valid_from_dma1_reg <= 0; 
        r_rdata_from_dma1_reg <= 0;  
   end
   else if(r_valid_from_dma1 == 1'b1) begin
        r_valid_from_dma1_reg <= r_valid_from_dma1;
        r_rdata_from_dma1_reg <= r_rdata_from_dma1;
   end
   else if (clr_v1) begin
        r_valid_from_dma1_reg <= 0; 
        r_rdata_from_dma1_reg <= 0;     
   end
 end
 
 always_comb begin
   if(gnt_from_dma0_reg==1'b1 && gnt_from_dma1_reg==1'b1)begin
    gnt_to_uC     = 1'b1;
    clr_gnt0      = 1'b1;
    clr_gnt1      = 1'b1;
   end
   else begin
    gnt_to_uC     = 1'b0;
    clr_gnt0      = 1'b0;
    clr_gnt1      = 1'b0;
   end
   
   if(r_valid_from_dma0_reg==1'b1 && r_valid_from_dma1_reg==1'b1)begin
    r_valid_to_uC = 1'b1;
    r_rdata_to_uC = r_rdata_from_dma0_reg | r_rdata_from_dma1_reg;
    clr_v0        = 1'b1;
    clr_v1        = 1'b1;
   end
   else begin
    r_valid_to_uC = 1'b0;
    r_rdata_to_uC = 1'b0;
    clr_v0        = 1'b0;
    clr_v1        = 1'b0;
   end
   
 end
 
 enum logic [1:0] {IDLE0, SEND0, VALID0, WAIT0} CS_0, NS_0;
 enum logic [1:0] {IDLE1, SEND1, VALID1, WAIT1} CS_1, NS_1;
 
 //update state
  always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
    if (rst_ni==1'b0) begin
      CS_0 <= IDLE0;
    end
    else begin
      CS_0 <= NS_0;
    end
  end
  
  always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
    if (rst_ni==1'b0) begin
      CS_1 <= IDLE1;
    end
    else begin
      CS_1 <= NS_1;
    end
  end
 
//fsm dma0 

  always_comb begin
  
  case(CS_0)
  
  IDLE0:
  begin
    if(req)begin
      NS_0 = SEND0;
    end
    else begin
      NS_0 = IDLE0;
    end
  end
  
  SEND0:
  begin
    if(gnt_from_dma0)begin
      NS_0 = VALID0;
    end
    else begin
      NS_0 = SEND0;
    end
  end
  
  VALID0:
  begin
    if(r_valid_from_dma0)begin
      NS_0 = WAIT0;
    end
    else begin
      NS_0 = VALID0;
    end
  end
  
  WAIT0:
  begin
    if(r_valid_to_uC)begin
      NS_0 = IDLE0;
    end
    else begin
      NS_0 = WAIT0;
    end
  end
  
  default:
  begin
    NS_0 = IDLE0;
  end
  
  endcase
  end
    
  always_comb begin
  
  case(CS_0)
  
  IDLE0:
  begin
   wdata_to_dma0 = '0;
   add_to_dma0   = '0;
   req_to_dma0   =  0;
   wen_to_dma0   =  1'b1;
   be_to_dma0    = '0;
  end
  
  SEND0:
  begin
   wdata_to_dma0 = wdata;
   add_to_dma0   = add;
   req_to_dma0   = req;
   wen_to_dma0   = wen;
   be_to_dma0    = be;
  end
  
  VALID0:
  begin
   wdata_to_dma0 = '0;
   add_to_dma0   = '0;
   req_to_dma0   =  0;
   wen_to_dma0   =  1'b1;
   be_to_dma0    = '0;
  end
  
  WAIT0:
  begin
   wdata_to_dma0 = '0;
   add_to_dma0   = '0;
   req_to_dma0   =  0;
   wen_to_dma0   =  1'b1;
   be_to_dma0    = '0;
  end
  
  default:
  begin
   wdata_to_dma0 = '0;
   add_to_dma0   = '0;
   req_to_dma0   =  0;
   wen_to_dma0   =  1'b1;
   be_to_dma0    = '0;
  end
  
  endcase
  end
  
  //fsm dma1
  
  always_comb begin
  
  case(CS_1)
  
  IDLE1:
  begin
    if(req)begin
      NS_1 = SEND1;
    end
    else begin
      NS_1 = IDLE1;
    end
  end
  
  SEND1:
  begin
    if(gnt_from_dma1)begin
      NS_1 = VALID1;
    end
    else begin
      NS_1 = SEND1;
    end
  end
  
  VALID1:
  begin
    if(r_valid_from_dma1)begin
      NS_1 = WAIT1;
    end
    else begin
      NS_1 = VALID1;
    end
  end
  
  WAIT1:
  begin
    if(r_valid_to_uC)begin
      NS_1 = IDLE1;
    end
    else begin
      NS_1 = WAIT1;
    end
  end
  
  default:
  begin
    NS_1 = IDLE1;
  end
  
  endcase
  end
  
  
  always_comb begin
  
  case(CS_1)
  
  IDLE1:
  begin
   wdata_to_dma1 = '0;
   add_to_dma1   = '0;
   req_to_dma1   =  0;
   wen_to_dma1   =  1'b1;
   be_to_dma1    = '0;
  end
  
  SEND1:
  begin
   wdata_to_dma1 = wdata;
   add_to_dma1   = add;
   req_to_dma1   = req;
   wen_to_dma1   = wen;
   be_to_dma1    = be;
  end
  
  VALID1:
  begin
   wdata_to_dma1 = '0;
   add_to_dma1   = '0;
   req_to_dma1   =  0;
   wen_to_dma1   =  1'b1;
   be_to_dma1    = '0;
  end
  
  WAIT1:
  begin
   wdata_to_dma1 = '0;
   add_to_dma1   = '0;
   req_to_dma1   =  0;
   wen_to_dma1   =  1'b1;
   be_to_dma1    = '0;
  end
  
  default:
  begin
   wdata_to_dma1 = '0;
   add_to_dma1   = '0;
   req_to_dma1   =  0;
   wen_to_dma1   =  1'b1;
   be_to_dma1    = '0;
  end
  
  endcase
  end
  
  endmodule
 
