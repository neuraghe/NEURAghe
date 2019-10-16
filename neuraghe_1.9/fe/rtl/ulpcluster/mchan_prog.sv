module mchan_prog
  #(
     parameter NB_CORES       = 4,  //not used
     parameter DATA_WIDTH     = 32,
     parameter ADDR_WIDTH     = 32,
     parameter BE_WIDTH       = DATA_WIDTH/8,
     parameter BANK_SIZE_B    = 8192
   )
   (
   
    input logic                      clk_i,
    input logic                      rst_ni,
    
    input logic [DATA_WIDTH-1:0] wdata,
    input logic [ADDR_WIDTH-1:0] add,
    input logic  		             req,
    input logic  		             wen,
    input logic [BE_WIDTH-1:0] 	 be,
    
    input logic  		             gnt_from_mchan,
    input logic [DATA_WIDTH-1:0] r_rdata_from_mchan,
    input logic  		             r_valid_from_mchan,
    
    output logic [DATA_WIDTH-1:0] wdata_to_mchan,
    output logic [ADDR_WIDTH-1:0] add_to_mchan,
    output logic  		            req_to_mchan,
    output logic  		            wen_to_mchan,
    output logic [BE_WIDTH-1:0] 	be_to_mchan,
    
    output logic  		            gnt,
    output logic [DATA_WIDTH-1:0] r_rdata,
    output logic  		            r_valid
    
   );
   
   logic [(DATA_WIDTH/2)-1:0] param_mem;
   logic [(DATA_WIDTH/2)-1:0] max_prog_size;
   logic [(DATA_WIDTH/2)-1:0] last_prog_size;
   logic [DATA_WIDTH-1:0]     tcdm_add_mem;
   logic [DATA_WIDTH-1:0]     tcdm_add;
   logic [DATA_WIDTH-1:0]     ext_add_mem;
   logic [DATA_WIDTH-1:0]     ext_add;
   logic [DATA_WIDTH-1:0]     ext_stride;
   logic [DATA_WIDTH-1:0]     tcdm_stride;
   logic [(DATA_WIDTH/2)-1:0] bank_slot_size_y;
   logic [(DATA_WIDTH/2)-1:0] num_tr_in_batch;
   logic [(DATA_WIDTH/2)-1:0] num_batch_stores;
   logic [DATA_WIDTH-1:0]     ofxbatch_size;
   
   logic[DATA_WIDTH-1:0] add_mem;
   
   logic [DATA_WIDTH-1:0] wdata_to_mchan_rew;
   logic [ADDR_WIDTH-1:0] add_to_mchan_rew;
   logic  		            req_to_mchan_rew;
   logic  		            wen_to_mchan_rew;
   logic [BE_WIDTH-1:0] 	be_to_mchan_rew;
   
   logic  		             gnt_from_mchan_rew;
   logic [DATA_WIDTH-1:0]  r_rdata_from_mchan_rew;
   logic  		             r_valid_from_mchan_rew;
   
   logic [4:0]  en_mem;
   logic [5:0]  cnt_batch, cnt_in_batch;
   logic [3:0]  cnt_par;
   logic        inc_par, inc_batch, inc_in_batch, clr_par, clr_batch, clr_in_batch, agg_tcdm, agg_ext;
   
   //localparam BYTE_PER_BANK = BANK_SIZE_32BIT * 4;
   
   /*modulo trasparente*/
//   assign wdata_to_mchan = wdata;
//   assign add_to_mchan   = add;
//   assign req_to_mchan   = req;
//   assign wen_to_mchan   = wen;
//   assign be_to_mchan    = be;
//   
//   assign gnt     = gnt_from_mchan;
//   assign r_rdata = r_rdata_from_mchan;
//   assign r_valid = r_valid_from_mchan;
   /* */
   
   
  enum logic [4:0] {IDLE, PASS_THROUGH, WAIT_VALID, 
                      READ_PARAM,
                      R_VALID,
                      WAIT_PARAM, 
                      SEND_PARAM, SEND_TCDM_ADDR, SEND_EXT_ADDR, SEND_EXT_STRIDE, SEND_TCDM_STRIDE,
                      WAIT,
                      SEND_LAST} CS, NS;

   assign wdata_to_mchan = wdata_to_mchan_rew;
   assign add_to_mchan   = add_to_mchan_rew;
   assign req_to_mchan   = req_to_mchan_rew;
   assign wen_to_mchan   = wen_to_mchan_rew;
   assign be_to_mchan    = be_to_mchan_rew;
   
   assign gnt     = gnt_from_mchan_rew;
   assign r_rdata = r_rdata_from_mchan_rew;
   assign r_valid = r_valid_from_mchan_rew;
   
   //update state
    always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
      if (rst_ni==1'b0) begin
        CS <= IDLE;
      end
      else begin
        CS <= NS;
      end
    end
    
   //reg to store parameters: total_transf_size | bits to dma
    always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
      if (rst_ni==1'b0) begin
           param_mem <= 0;   
           max_prog_size <= 0;
      end
      else if(en_mem==4'h1) begin
          param_mem       <= wdata[DATA_WIDTH-1 : (DATA_WIDTH/2)];
          max_prog_size   <= wdata[(DATA_WIDTH/2)-1:0];
      end
    end
    
   //reg to store tcdm address
   always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          tcdm_add_mem <= 0;   
     end
     else if(en_mem==4'h2) begin
          tcdm_add_mem <= wdata;
     end
     else if(agg_tcdm==1'b1 && gnt_from_mchan == 1'b1)begin
          tcdm_add_mem <= wdata_to_mchan_rew;
     end
     else if(clr_in_batch)begin
          tcdm_add_mem <= tcdm_add;
     end
   end
   
   //reg to store tcdm address
   always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          tcdm_add <= 0;   
     end
     else if(en_mem==4'h2) begin
          tcdm_add <= wdata;
     end
     else if(agg_tcdm==1'b1 && gnt_from_mchan == 1'b1)begin
           tcdm_add <= tcdm_add + bank_slot_size_y;
      end
   end
    
   //reg to store ddr address
   always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          ext_add_mem <= 0;   
     end
     else if(en_mem==4'h3) begin
          ext_add_mem <= wdata;
     end
     else if(agg_ext==1'b1 && gnt_from_mchan == 1'b1)begin
           ext_add_mem <= wdata_to_mchan_rew;
     end
     else if(clr_in_batch)begin
           ext_add_mem <= ext_add/*_mem*/ + ofxbatch_size;//ext_add;
     end 
   end
   
   always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          ext_add <= 0;   
     end
     else if(en_mem==4'h3) begin
          ext_add <= wdata;
     end
//     else if(agg_ext==1'b1 && gnt_from_mchan == 1'b1)begin
//          ext_add <= ext_add + (max_prog_size << 3);
//     end
      
     else if(clr_in_batch)begin
          ext_add <= ext_add + ofxbatch_size; 
     end
   end
   
   //reg to store ddr stride | single_transfer_size
   always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
      if (rst_ni==1'b0) begin
           ext_stride <= 0;   
      end
      else if(en_mem==4'h4) begin
           ext_stride <= wdata;
      end
    end
    
    //reg to store tcdm stride | single_transfer_size
    always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
      if (rst_ni==1'b0) begin
           tcdm_stride <= 0;   
      end
      else if(en_mem==4'h5) begin
           tcdm_stride <= wdata;
      end
    end
    
    //reg to store bank_slot_size_y | num_tr_in_batch
    always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
      if (rst_ni==1'b0) begin
           bank_slot_size_y <= 0; 
           num_tr_in_batch       <= 0;  
      end
      else if(en_mem==4'h6) begin
          bank_slot_size_y <= wdata[(DATA_WIDTH/2)-1:0];
          num_tr_in_batch  <= wdata[DATA_WIDTH-1 : (DATA_WIDTH/2)];
      end
    end
    
    //reg to store size of batch | num_batch_stores
    always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
      if (rst_ni==1'b0) begin
           last_prog_size    <= 0;  
           num_batch_stores <= 0; 
      end
      else if(en_mem==4'h7) begin
          last_prog_size   <= wdata[(DATA_WIDTH/2)-1:0];
          num_batch_stores <= wdata[DATA_WIDTH-1 : (DATA_WIDTH/2)];
      end
    end
    
     //reg to store size of batch | num_batch_stores
    always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
      if (rst_ni==1'b0) begin
           ofxbatch_size    <= 0;
      end
      else if(en_mem==4'h8) begin
          ofxbatch_size   <= wdata[DATA_WIDTH-1:0];
      end
    end
    
   //reg to dma cmd queue
   always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          add_mem <= 0;   
     end
     else if(en_mem==4'h1) begin
          add_mem <= add;
     end
   end
   
      
  always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          cnt_batch <= 0;   
     end
     else if(inc_batch && gnt_from_mchan == 1'b1) begin
          cnt_batch <= cnt_batch + 1;
     end
     else if (clr_batch) begin
          cnt_batch <= 0;            
     end
   end
   
   always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          cnt_in_batch <= 0;   
     end
     else if(inc_in_batch && gnt_from_mchan == 1'b1) begin
          cnt_in_batch <= cnt_in_batch + 1;
     end
     else if (clr_in_batch) begin
          cnt_in_batch <= 0;            
     end
   end
   
   always_ff @(posedge clk_i /*or negedge rst_ni*/) begin
     if (rst_ni==1'b0) begin
          cnt_par <= 0;   
     end
     else if(inc_par) begin
          cnt_par <= cnt_par + 1'b1;
     end
     else if (clr_par) begin
          cnt_par <= 0;            
     end
   end
    
  
  //next state
    always_comb begin
      
      case(CS) 
      
      IDLE:
      begin
        if(req==1'b1 && wen==1'b0 && (wdata[19:16]==4'h6 || wdata[19:16]==4'h7) && be==4'hf) begin
          NS = READ_PARAM;
        end
        else if(req == 1'b1) begin
          NS = PASS_THROUGH;
        end
        else begin
          NS = IDLE;
        end
      end
      
//      PASS_THROUGH:
//      begin
//        if(req == 1'b0 && r_valid_from_mchan == 1'b1) begin
//          NS = IDLE;
//        end
//        else begin
//          NS = PASS_THROUGH;
//        end
//      end

      PASS_THROUGH:
      begin
        if(gnt_from_mchan) begin
          NS = WAIT_VALID;
        end
        else begin
          NS = PASS_THROUGH;
        end
      end
      
      WAIT_VALID:
      begin
        if(r_valid_from_mchan)begin
          NS = IDLE;
        end
        else begin
          NS = WAIT_VALID;
        end
      end
      
      READ_PARAM:
      begin
        NS = R_VALID; 
      end
      
      R_VALID:
      begin
         NS = WAIT_PARAM;
      end
      
      WAIT_PARAM:
      begin
        if(cnt_par == 8) begin
          NS = (num_batch_stores == 1) ? SEND_LAST : SEND_PARAM;
        end
        else if(req==1'b1 && wen==1'b0 && be==4'hf) begin
          NS = READ_PARAM;
        end
        else begin
          NS = WAIT_PARAM;
        end
      end
      
      SEND_PARAM:
      begin
        if(gnt_from_mchan == 1'b1) begin
          NS = SEND_TCDM_ADDR;
        end
       else begin
          NS = SEND_PARAM;
       end
      end
      
      SEND_TCDM_ADDR:
      begin
        if(gnt_from_mchan == 1'b1) begin
          NS = SEND_EXT_ADDR; 
        end
        else begin
          NS = SEND_TCDM_ADDR;
        end
      end
      
      SEND_EXT_ADDR:
      begin
        if(gnt_from_mchan == 1'b1) begin
          NS = SEND_EXT_STRIDE;
        end
        else begin
          NS = SEND_EXT_ADDR;
        end
      end
      
      SEND_EXT_STRIDE:
      begin
        if(gnt_from_mchan == 1'b1) begin
          NS = SEND_TCDM_STRIDE;
        end
        else begin
          NS = SEND_EXT_STRIDE;
        end
      end
      
      SEND_TCDM_STRIDE:
      begin
        if(gnt_from_mchan == 1'b1) begin
          NS = WAIT;
        end
        else begin
          NS = SEND_TCDM_STRIDE;
        end
      end
      
      WAIT:
      begin
        if(cnt_batch == num_batch_stores)begin
          NS = IDLE;
        end
        else if(cnt_batch == num_batch_stores - 1)begin
          NS = SEND_LAST;
        end
        else begin
          NS = SEND_PARAM;
        end
      end
      
      SEND_LAST:
      begin
        if(gnt_from_mchan == 1'b1) begin
          NS = SEND_TCDM_ADDR;
        end
        else begin
          NS = SEND_LAST;
        end
      end
      
      default:
      begin
        NS = IDLE;
      end
      
      endcase
    
    end //always_comb
    
    
    
    //signals
    always_comb begin
      
      case(CS) 
      
      IDLE:
      begin
        req_to_mchan_rew   = 1'b0;
        wdata_to_mchan_rew = wdata;
        add_to_mchan_rew   = add;
        wen_to_mchan_rew   = 1'b1;
        be_to_mchan_rew    = 4'h0;
        
        gnt_from_mchan_rew = 1'b0;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
        r_valid_from_mchan_rew = 1'b0;
        
        inc_par = 1'b0;
        inc_batch = 1'b0;
        inc_in_batch = 1'b0;
        
        en_mem = 3'b000;
        clr_par = 1'b1;
        clr_batch = 1'b1;
        clr_in_batch = 1'b1;
        agg_tcdm = 1'b0;
        agg_ext = 1'b0;
      end
      
      PASS_THROUGH:
      begin
        req_to_mchan_rew   = req;
        wdata_to_mchan_rew = wdata;
        add_to_mchan_rew   = add;
        wen_to_mchan_rew   = wen;
        be_to_mchan_rew    = be;
        
        gnt_from_mchan_rew = gnt_from_mchan;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
        r_valid_from_mchan_rew = r_valid_from_mchan;
        
        inc_par = 1'b0;
        inc_batch = 1'b0;
        inc_in_batch = 1'b0;
        
        en_mem = 3'b000;
        clr_par = 1'b1;
        clr_batch = 1'b1;
        clr_in_batch = 1'b1;
        agg_tcdm = 1'b0;
        agg_ext = 1'b0;
      end
      
      WAIT_VALID:
      begin
        req_to_mchan_rew   = req;
        wdata_to_mchan_rew = wdata;
        add_to_mchan_rew   = add;
        wen_to_mchan_rew   = wen;
        be_to_mchan_rew    = be;
        
        gnt_from_mchan_rew = gnt_from_mchan;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
        r_valid_from_mchan_rew = r_valid_from_mchan;
        
        inc_par = 1'b0;
        inc_batch = 1'b0;
        inc_in_batch = 1'b0;
        
        en_mem = 3'b000;
        clr_par = 1'b1;
        clr_batch = 1'b1;
        clr_in_batch = 1'b1;
        agg_tcdm = 1'b0;
        agg_ext = 1'b0;
      end
      
      READ_PARAM:
      begin       
        req_to_mchan_rew   = 1'b0;
        wdata_to_mchan_rew = wdata;
        add_to_mchan_rew   = add;
        wen_to_mchan_rew   = 1'b0;
        be_to_mchan_rew = 4'h0;
        
        gnt_from_mchan_rew = 1'b1;
        r_valid_from_mchan_rew = 1'b0;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
        
        inc_par = 1'b1;
        inc_batch = 1'b0;
        inc_in_batch = 1'b0;
        
        en_mem = cnt_par + 1'b1;
        clr_par = 1'b0;
        clr_batch = 1'b1;
        clr_in_batch = 1'b0;
        agg_tcdm = 1'b0;
        agg_ext = 1'b0;
      end
      
      R_VALID:
      begin
        req_to_mchan_rew   = 1'b0;
        wdata_to_mchan_rew = wdata;
        add_to_mchan_rew   = add;
        wen_to_mchan_rew   = 1'b0;
        be_to_mchan_rew = 4'h0;
        
        gnt_from_mchan_rew = 1'b0;
        r_valid_from_mchan_rew = 1'b1;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
        
        inc_par = 1'b0;
        inc_batch = 1'b0;
        inc_in_batch = 1'b0;
        
        en_mem = 3'b0;
        clr_par = 1'b0;
        clr_batch = 1'b1;
        clr_in_batch = 1'b0;
        agg_tcdm = 1'b0;
        agg_ext = 1'b0;
      end
      
      WAIT_PARAM:
      begin
        req_to_mchan_rew   = 1'b0;
        wdata_to_mchan_rew = wdata;
        add_to_mchan_rew   = add;
        wen_to_mchan_rew   = 1'b0;
        be_to_mchan_rew = 4'h0;
        
        gnt_from_mchan_rew = 1'b0;
        r_valid_from_mchan_rew = 1'b0;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
        
        inc_par = 1'b0;
        inc_batch = 1'b0;
        inc_in_batch = 1'b0;
        
        en_mem = 3'b0;
        clr_par = 1'b0;
        clr_batch = 1'b1;
        clr_in_batch = 1'b0;
        agg_tcdm = 1'b0;
        agg_ext = 1'b0;
      end
      
      SEND_PARAM:
      begin
        req_to_mchan_rew   = 1'b1;
        add_to_mchan_rew   = add_mem;
        wen_to_mchan_rew   = 1'b0;
        be_to_mchan_rew    = 4'hf;
        wdata_to_mchan_rew[DATA_WIDTH-1 : (DATA_WIDTH/2)] = param_mem;
        wdata_to_mchan_rew[(DATA_WIDTH/2)-1 : 0]          = max_prog_size;
        
        gnt_from_mchan_rew = 1'b0;
        r_valid_from_mchan_rew = 1'b0;;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
         
        inc_par = 1'b0;
        inc_batch = 1'b0;
        inc_in_batch = 1'b0;
        
        en_mem = 3'b000;
        clr_par = 1'b1;
        clr_batch = 1'b0;
        clr_in_batch = 1'b0;
        agg_tcdm = 1'b0;
        agg_ext = 1'b0;
      end
      
      SEND_TCDM_ADDR:
      begin
        req_to_mchan_rew   = 1'b1; 
        wen_to_mchan_rew   = 1'b0;
        be_to_mchan_rew    = 4'hf;
        add_to_mchan_rew   = add_mem;
        wdata_to_mchan_rew = (cnt_in_batch==1'b0) ? tcdm_add_mem : tcdm_add_mem + ext_stride[(DATA_WIDTH/2)-1-1 : 0];
        
        gnt_from_mchan_rew = 1'b0;
        r_valid_from_mchan_rew = 1'b0;;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
        
        inc_par = 1'b0;
        inc_batch = 1'b0;
        inc_in_batch = 1'b0;
        
        en_mem = 3'b000;
        clr_par = 1'b1;
        clr_batch = 1'b0;
        clr_in_batch = 1'b0;
        agg_tcdm = 1'b1;
        agg_ext = 1'b0;
      end
      
      SEND_EXT_ADDR:
      begin
        req_to_mchan_rew   = 1'b1; 
        wen_to_mchan_rew   = 1'b0;
        be_to_mchan_rew    = 4'hf;
        add_to_mchan_rew   = add_mem;
        wdata_to_mchan_rew = (cnt_in_batch==1'b0) ? ext_add_mem : ext_add_mem + ext_stride[(DATA_WIDTH/2)-1-1 : 0];
        
        gnt_from_mchan_rew = 1'b0;
        r_valid_from_mchan_rew = 1'b0;;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
        
        inc_par = 1'b0;
        inc_batch = 1'b0;
        inc_in_batch = 1'b0;
        
        en_mem = 3'b000;
        clr_par = 1'b1;
        clr_batch = 1'b0;
        clr_in_batch = 1'b0;
        agg_tcdm = 1'b0;
        agg_ext = 1'b1;
      end
      
      SEND_EXT_STRIDE:
      begin
        req_to_mchan_rew   = 1'b1; 
        wen_to_mchan_rew   = 1'b0;
        be_to_mchan_rew    = 4'hf;
        add_to_mchan_rew   = add_mem;
        wdata_to_mchan_rew = ext_stride;
        
        gnt_from_mchan_rew = 1'b0;
        r_valid_from_mchan_rew = 1'b0;;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
        
        inc_par = 1'b0;
        inc_batch = 1'b0;
        inc_in_batch = 1'b0;
        
        en_mem = 3'b000;
        clr_par = 1'b1;
        clr_batch = 1'b0;
        clr_in_batch = 1'b0;
        agg_tcdm = 1'b0;
        agg_ext = 1'b0;
      end
      
      SEND_TCDM_STRIDE:
      begin
        req_to_mchan_rew   = 1'b1; 
        wen_to_mchan_rew   = 1'b0;
        be_to_mchan_rew    = 4'hf;
        add_to_mchan_rew   = add_mem;
        wdata_to_mchan_rew = tcdm_stride;
        
        gnt_from_mchan_rew = 1'b0;
        r_valid_from_mchan_rew = 1'b0;;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
        
        inc_par = 1'b0;
        inc_batch = (cnt_in_batch == num_tr_in_batch - 1) ? 1'b1 : 1'b0;
        inc_in_batch = 1'b1;
        
        en_mem = 3'b000;
        clr_par = 1'b1;
        clr_batch = 1'b0;
        clr_in_batch = 1'b0;
        agg_tcdm = 1'b0;
        agg_ext = 1'b0;
      end
      
      WAIT:
      begin
        req_to_mchan_rew   = 1'b0;
        wdata_to_mchan_rew = wdata;
        add_to_mchan_rew   = add;
        wen_to_mchan_rew   = 1'b0;
        be_to_mchan_rew    = 4'h0;
        
        gnt_from_mchan_rew = 1'b0;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
        r_valid_from_mchan_rew = 1'b0;;
        
        inc_par = 1'b0;
        inc_batch = 1'b0;
        inc_in_batch = 1'b0;
        
        en_mem = 3'b000;
        clr_par = 1'b1;
        clr_batch = 1'b0;
        clr_in_batch = (cnt_in_batch == num_tr_in_batch) ? 1'b1 : 1'b0;
        agg_tcdm = 1'b0;
        agg_ext = 1'b0;
      end
      
      SEND_LAST:
      begin
        req_to_mchan_rew   = 1'b1;
        add_to_mchan_rew   = add_mem;
        wen_to_mchan_rew   = 1'b0;
        be_to_mchan_rew    = 4'hf;
        wdata_to_mchan_rew[DATA_WIDTH-1 : (DATA_WIDTH/2)] = param_mem;
        wdata_to_mchan_rew[(DATA_WIDTH/2)-1 : 0]          = last_prog_size;
        
        gnt_from_mchan_rew = 1'b0;
        r_valid_from_mchan_rew = 1'b0;;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
         
        inc_par = 1'b0;
        inc_batch = 1'b0;
        inc_in_batch = 1'b0;
        
        en_mem = 3'b000;
        clr_par = 1'b1;
        clr_batch = 1'b0;
        clr_in_batch = 1'b0;
        agg_tcdm = 1'b0;
        agg_ext = 1'b0;
      end
      
      default:
      begin
        req_to_mchan_rew   = 1'b0;
        wdata_to_mchan_rew = wdata;
        add_to_mchan_rew   = add;
        wen_to_mchan_rew   = 1'b1;
        be_to_mchan_rew    = 4'h0;
        
        gnt_from_mchan_rew = 1'b0;
        r_rdata_from_mchan_rew = r_rdata_from_mchan;
        r_valid_from_mchan_rew = 1'b0;;
        
        inc_par = 1'b0;
        inc_batch = 1'b0;
        inc_in_batch = 1'b0;
        
        en_mem = 3'b000;
        clr_par = 1'b0;
        clr_batch = 1'b0;
        clr_in_batch = 1'b0;
        agg_tcdm = 1'b0;
        agg_ext = 1'b0;
      end
      
      endcase
    
    end //always_comb*/
   
endmodule
