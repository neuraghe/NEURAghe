module uC_to_prog
#(
   parameter DATA_WIDTH     = 32,
   parameter ADDR_WIDTH     = 32,
   parameter BE_WIDTH       = DATA_WIDTH/8,
   parameter BANK_SIZE_B    = 8192
  )
  (
   input logic                    clk_i,
   input logic                    rst_ni,
  
   input logic [DATA_WIDTH-1:0]   wdata,
   input logic [ADDR_WIDTH-1:0]   add,
   input logic  		              req,
   input logic  		              wen,
   input logic [BE_WIDTH-1:0] 	  be,
   
   output logic  		              gnt,
   output logic [DATA_WIDTH-1:0]  r_rdata,
   output logic  		              r_valid,
   //output load
   output logic [DATA_WIDTH-1:0]  wdata_to_load,
   output logic                   req_to_load,          
   output logic [ADDR_WIDTH-1:0]  add_to_load,           
   output logic                   wen_to_load,           
   output logic [BE_WIDTH-1:0]    be_to_load,             
        //input load
   input logic                    gnt_from_load,          
   input logic                    r_valid_from_load,  
   input logic  [DATA_WIDTH-1:0]  r_rdata_from_load,  
        //output store
   output logic [DATA_WIDTH-1:0] wdata_to_store,       
   output logic                  req_to_store,           
   output logic [ADDR_WIDTH-1:0] add_to_store,           
   output logic                  wen_to_store,           
   output logic [BE_WIDTH-1:0]   be_to_store,             
        //input store
   input logic                   gnt_from_store,          
   input logic                   r_valid_from_store,  
   input logic [DATA_WIDTH-1:0]  r_rdata_from_store  
  );
  
   logic [3:0] gnt_load_cnt;
   logic [3:0] gnt_store_cnt;
   logic clr,inc;
  
//  assign wdata_to_load = wdata;
//  assign req_to_load   = req;
//  assign add_to_load   = add;
//  assign wen_to_load   = wen;
//  assign be_to_load    = be;
//  
//  assign gnt      = gnt_from_load;
//  assign r_rdata  = r_rdata_from_load;
//  assign r_rvalid = r_valid_from_load;

//  assign wdata_to_store = wdata;
//  assign req_to_store   = req;
//  assign add_to_store   = add;
//  assign wen_to_store   = wen;
//  assign be_to_store    = be;
//  
//  assign gnt      = gnt_from_store;
//  assign r_rdata  = r_rdata_from_store;
//  assign r_rvalid = r_valid_from_store;
    
    
  enum logic [3:0] {IDLE_SEND, ALLOC_L, ALLOC_S, SEND_TO_LOAD, SEND_TO_STORE, BARRIER_LOAD, BARRIER_STORE, WAIT_VALID_LOAD, WAIT_VALID_STORE, FREE} CS_snd, NS_snd;
  
  always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          gnt_load_cnt <= 0;   
     end
     else if(inc && gnt_from_load == 1'b1) begin
          gnt_load_cnt <= gnt_load_cnt + 1;
     end
     else if (clr) begin
          gnt_load_cnt <= 0;            
     end
   end
   
   always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          gnt_store_cnt <= 0;   
     end
     else if(inc && gnt_from_store == 1'b1) begin
          gnt_store_cnt <= gnt_store_cnt + 1;
     end
     else if (clr) begin
          gnt_store_cnt <= 0;            
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
      NS_snd = BARRIER_STORE;
    end
    else if(add[7:0]==8'h14)begin
      NS_snd = BARRIER_LOAD;
    end
    else if(add[7:0]==8'h10)begin
      NS_snd = ALLOC_L;
    end
    else begin
      NS_snd = ALLOC_S;
    end
  end
  else if(req==1'b1 && wen==1'b0 && be==4'hf)begin
    if(wdata[19+3:16+3]==4'h7)begin
      NS_snd = SEND_TO_LOAD;
    end
    else if(wdata[19+3:16+3]==4'h6)begin
      NS_snd = SEND_TO_STORE;
    end    
    else begin
      NS_snd = FREE;
    end
  end
  else begin
    NS_snd = IDLE_SEND;
  end
  end
  
  ALLOC_L:
  begin
  if(req==1'b0)begin
    NS_snd = IDLE_SEND;
  end
  else begin
    NS_snd = ALLOC_L;
  end
  end
  
  ALLOC_S:
  begin
  if(req==1'b0)begin
    NS_snd = IDLE_SEND;
  end
  else begin
    NS_snd = ALLOC_S;
  end
  end
  
  SEND_TO_LOAD:
  begin
  if(req==1'b0 && gnt_load_cnt==8)begin
    NS_snd = IDLE_SEND;
  end
  else begin
    NS_snd = SEND_TO_LOAD;
  end
  end
  
  SEND_TO_STORE:
  begin
  if(req==1'b0 && gnt_store_cnt==8)begin
    NS_snd = IDLE_SEND;
  end
  else begin
    NS_snd = SEND_TO_STORE;
  end
  end
  
  BARRIER_LOAD:
  begin
  if(gnt_from_load/*req==1'b0 && r_valid_from_load==1'b1*/)begin
    NS_snd = WAIT_VALID_LOAD;//IDLE_SEND;
  end
  else begin
    NS_snd = BARRIER_LOAD;
  end
  end
  
  BARRIER_STORE:
  begin
  if(gnt_from_store/*req==1'b0 && r_valid_from_store==1'b1*/)begin
    NS_snd = WAIT_VALID_STORE;//IDLE_SEND;
  end
  else begin
    NS_snd = BARRIER_STORE;
  end
  end
  
  WAIT_VALID_LOAD:
  begin
    if(r_valid_from_load)begin
      NS_snd = IDLE_SEND;
    end
    else begin
      NS_snd = WAIT_VALID_LOAD;
    end
  end
  
  WAIT_VALID_STORE:
  begin
    if(r_valid_from_store)begin
      NS_snd = IDLE_SEND;
    end
    else begin
      NS_snd = WAIT_VALID_STORE;
    end
  end
  
  FREE:
  begin
    if(req==1'b0 && (r_valid_from_store==1'b1 || r_valid_from_load==1'b1))begin
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
    wdata_to_load = 0;
    req_to_load   = 1'b0;
    add_to_load   = 1'b0;
    wen_to_load   = 1'b1;
    be_to_load    = 0;
    
    clr = 1'b1;
    inc = 1'b0;

    wdata_to_store = 0;
    req_to_store   = 1'b0;
    add_to_store   = 1'b0;
    wen_to_store   = 1'b1;
    be_to_store    = 0;
  end
  
  ALLOC_L:
  begin
    wdata_to_load = wdata;
    req_to_load   = req;
    add_to_load   = add & 32'hffffff0f;
    wen_to_load   = wen;
    be_to_load    = be;
    
    clr = 1'b0;
    inc = 1'b0;

    wdata_to_store = 0;
    req_to_store   = 1'b0;
    add_to_store   = 1'b0;
    wen_to_store   = 1'b1;
    be_to_store    = 0;    
  end
  
  ALLOC_S:
  begin
    wdata_to_load = 0;
    req_to_load   = 1'b0;
    add_to_load   = 1'b0;
    wen_to_load   = 1'b1;
    be_to_load    = 0;
    
    clr = 1'b0;
    inc = 1'b0;

    wdata_to_store = wdata;
    req_to_store   = req;
    add_to_store   = add;
    wen_to_store   = wen;
    be_to_store    = be;    
  end
  
  SEND_TO_LOAD:
  begin
    wdata_to_load = wdata;
    req_to_load   = req;
    add_to_load   = add;
    wen_to_load   = wen;
    be_to_load    = be;
    
    clr = 1'b0;
    inc = 1'b1;
    
    wdata_to_store = 0;
    req_to_store   = 1'b0;
    add_to_store   = 1'b0;
    wen_to_store   = 1'b1;
    be_to_store    = 0;
  end
  
  SEND_TO_STORE:
  begin
    wdata_to_load = 0;
    req_to_load   = 1'b0;
    add_to_load   = 1'b0;
    wen_to_load   = 1'b1;
    be_to_load    = 0;
    
    clr = 1'b0;
    inc = 1'b1;
    
    wdata_to_store = wdata;
    req_to_store   = req;
    add_to_store   = add;
    wen_to_store   = wen;
    be_to_store    = be;
  end
  
  BARRIER_LOAD:
  begin
    wdata_to_load = wdata;
    req_to_load   = req;
    add_to_load   = add & 32'hffffff0f;
    wen_to_load   = wen;
    be_to_load    = be;
    
    clr = 1'b1;
    inc = 1'b0;
    
    wdata_to_store = 0;
    req_to_store   = 1'b0;
    add_to_store   = 1'b0;
    wen_to_store   = 1'b1;
    be_to_store    = 0;
  end
  
  BARRIER_STORE:
  begin
    wdata_to_load = 0;
    req_to_load   = 1'b0;
    add_to_load   = 1'b0;
    wen_to_load   = 1'b1;
    be_to_load    = 0;
    
    clr = 1'b1;
    inc = 1'b0;
    
    wdata_to_store = wdata;
    req_to_store   = req;
    add_to_store   = add;
    wen_to_store   = wen;
    be_to_store    = be;
  end
  
  WAIT_VALID_LOAD:
  begin
    wdata_to_load = wdata;
    req_to_load   = req;
    add_to_load   = add;
    wen_to_load   = wen;
    be_to_load    = be;
    
    clr = 1'b1;
    inc = 1'b0;
    
    wdata_to_store = 0;
    req_to_store   = 1'b0;
    add_to_store   = 1'b0;
    wen_to_store   = 1'b1;
    be_to_store    = 0;
  end
  
  WAIT_VALID_STORE:
  begin
    wdata_to_load = 0;
    req_to_load   = 1'b0;
    add_to_load   = 1'b0;
    wen_to_load   = 1'b1;
    be_to_load    = 0;
    
    clr = 1'b1;
    inc = 1'b0;
    
    wdata_to_store = wdata;
    req_to_store   = req;
    add_to_store   = add;
    wen_to_store   = wen;
    be_to_store    = be;
  end
  
  FREE:
  begin
    wdata_to_load = wdata;
    req_to_load   = req;
    add_to_load   = add;
    wen_to_load   = wen;
    be_to_load    = be;
    
    clr = 1'b0;
    inc = 1'b0;

    wdata_to_store = wdata;
    req_to_store   = req;
    add_to_store   = add;
    wen_to_store   = wen;
    be_to_store    = be;
  end
  
  default:
  begin
    wdata_to_load = 0;
    req_to_load   = 1'b0;
    add_to_load   = 1'b0;
    wen_to_load   = 1'b1;
    be_to_load    = 0;
    
    clr = 1'b1;
    inc = 1'b0;

    wdata_to_store = 0;
    req_to_store   = 1'b0;
    add_to_store   = 1'b0;
    wen_to_store   = 1'b1;
    be_to_store    = 0;
  end
  
  endcase
  end
    
    
    assign gnt      = gnt_from_load     | gnt_from_store;
//    assign r_valid  = r_valid_from_load | r_valid_from_store;
//    assign r_rdata  = r_rdata_from_load | r_rdata_from_store;
    
//    always_comb begin
//      if(gnt_from_load)begin
//        gnt = gnt_from_load;
//      end
//      else if (gnt_from_store)begin
//        gnt = gnt_from_store;
//      end
//    end
    
    always_comb begin
      if(r_valid_from_load)begin
        r_valid  = r_valid_from_load;
        r_rdata  = r_rdata_from_load;
      end
      else if (r_valid_from_store)begin
        r_valid  = r_valid_from_store;
        r_rdata  = r_rdata_from_store;
      end
      else begin
        r_valid  = 1'b0;
        r_rdata  = 32'h00000000;
      end
    end

  
  
  endmodule
  
