`include "ulpsoc_defines.sv"

module fetch_buffer_32
#(
    parameter                                                   NUM_WORDS = 1  // do not edit
)
(
    input logic                                                 clk,
    input logic                                                 rst_n,

    input  logic                                                instr_req_i,
    input  logic [31:0]                                         instr_add_i,
    output logic                                                instr_gnt_o, 

    output logic                                                instr_r_valid_o,
    output logic [31:0]                                         instr_r_rdata_o,


    output logic                                                instr_req_o,
    output logic [31:0]                                         instr_add_o,
    input  logic                                                instr_gnt_i,

    input  logic                                                instr_r_valid_i,
    input  logic [31:0]                                         instr_r_rdata_i
);

    enum logic [1:0] {INVALID_TAG, WAIT_RVALID, FETCH_HIT, VALID_TAG } CS, NS;

    logic                                                       sample_addr;
    logic                                                       sample_data;
    logic                                                       fetch_hit;
    logic                                                       local_fetch;

    logic [31:2]                                                tag_array;
    logic [NUM_WORDS-1:0][31:0]                                 data_array;


    always_ff @(posedge clk, negedge rst_n)
    begin
      if(rst_n == 1'b0)
      begin
            tag_array       <=    '0;
            data_array      <=    '0;
            CS              <=    INVALID_TAG;
            local_fetch     <=    1'b0;
      end
      else
      begin
            if(sample_data)
              data_array <= instr_r_rdata_i;
              
            if(sample_addr)
            begin
              tag_array    <= instr_add_i[31:2];
            end
            
            //Used to get data from internal buffer or from the icache
            if(instr_req_i & instr_gnt_o)
            begin
              local_fetch  <= fetch_hit;
            end
            
            CS <= NS;
        
      end
    end
    
    
    assign fetch_hit = (instr_add_i[31:2] == tag_array) ? 1'b1 : 1'b0;
    
    always_comb
    begin
    
      instr_req_o      = 1'b0;
      instr_add_o      = {instr_add_i[31:3],3'b000};
      
      instr_gnt_o      = 1'b0;
      instr_r_valid_o  = 1'b0;
      instr_r_rdata_o  = '0;
      
      sample_addr      = 1'b0;
      sample_data      = 1'b0;
      
      case (CS)
        
      
        INVALID_TAG : 
        begin
            instr_req_o      = instr_req_i;
            instr_gnt_o      = instr_gnt_i;
            
            if(instr_req_i & instr_gnt_i)
            begin
              sample_addr = 1'b1;
              NS = WAIT_RVALID;
            end
            else
            begin
              sample_addr = 1'b0;
              NS = INVALID_TAG;
            end
        end //~INVALID
        
        
        
        WAIT_RVALID: 
        begin
          // We are waiting response from the cache
          instr_r_valid_o = instr_r_valid_i;
          instr_r_rdata_o = instr_r_rdata_i; 
          
          //if we get a valid response, then we can serve the incoming fetch
          if(instr_r_valid_i)
          begin
                
                //got valid response, the store it in the dataram
                sample_data  = 1'b1;
                
                //we have a valid request --> serve next transaction
                if(instr_req_i)
                begin
                        // fetch falls in the same cache line --> hit
                        if(fetch_hit)
                        begin
                          instr_gnt_o  = 1'b1;
                          NS           = FETCH_HIT;
                        end
                        else //if(fetch_miss)
                        begin
                          
                          instr_gnt_o  = instr_gnt_i; 
                          instr_req_o  = instr_req_i;
                          
                          if(instr_req_i & instr_gnt_i)
                          begin
                            sample_addr = 1'b1;
                            NS = WAIT_RVALID;
                          end
                          else
                          begin
                            sample_addr = 1'b0;
                            NS = VALID_TAG; 
                          end
                          
                          
                        end
                  
                end
                else // there is no request: GO to IDLE in the VALID_TAG state, waiting for next fetch
                begin
                        NS = VALID_TAG;
                        instr_gnt_o  = 1'b0; 
                        instr_req_o  = 1'b0;
                end
          end
          else //No instr_r_valid_i response: Stay in this state
          begin
            sample_data  = 1'b0;
            NS           = WAIT_RVALID;
            instr_gnt_o  = 1'b0; 
            instr_req_o  = 1'b0;
          end

        end



        
        FETCH_HIT : 
        begin
          instr_r_valid_o = 1'b1;
          instr_r_rdata_o = data_array;
          
          if(instr_req_i)
          begin
                  if(fetch_hit)
                  begin
                    instr_gnt_o  = 1'b1;
                    instr_req_o  = 1'b0;
                    NS           = FETCH_HIT;
                  end
                  else
                  begin
                    
                    instr_gnt_o  = instr_gnt_i; 
                    instr_req_o  = instr_req_i;
                    
                    if(instr_req_i & instr_gnt_i)
                    begin
                      sample_addr = 1'b1;
                      NS = WAIT_RVALID;
                    end
                    else
                    begin
                      sample_addr = 1'b0;
                      NS = VALID_TAG;
                    end
                    
                  end
            
          end
          else // there is no request
          begin
                  NS = VALID_TAG;
          end
          
        end





        VALID_TAG: 
        begin
          instr_r_valid_o = 1'b0;
          instr_r_rdata_o = '0; 
          

                
          //serve next transaction
          if(instr_req_i)
          begin
                  if(fetch_hit)
                  begin
                    instr_gnt_o  = 1'b1;
                    NS           = FETCH_HIT;
                  end
                  else
                  begin
                    
                    instr_gnt_o  = instr_gnt_i; 
                    instr_req_o  = instr_req_i;
                    
                    if(instr_req_i & instr_gnt_i)
                    begin
                      sample_addr = 1'b1;
                      NS =  WAIT_RVALID;
                    end
                    else
                    begin
                      sample_addr = 1'b0;
                      NS = VALID_TAG;
                    end
                    
                  end
            
          end
          else // there is no request
          begin
              NS = VALID_TAG;
          end
            


        end
        
        
        
        
        default: 
        begin
            NS = INVALID_TAG;
        end
        
      endcase
    end
    


endmodule