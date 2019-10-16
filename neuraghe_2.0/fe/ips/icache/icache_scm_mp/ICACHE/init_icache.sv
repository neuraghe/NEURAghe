module init_icache
#(
   parameter ADDR_WIDTH      = 6,
   parameter TAG_WIDTH       = 8,
   parameter NB_BANKS        = 4,
   parameter DATA_WIDTH      = 128,
   parameter NB_WAYS         = 4
)
(
   input  logic clk,
   input  logic rst_n,
   input  logic flush_req_i,
   output logic flushing_o,

   // interface with WRITE PORT --> SCM DATA
   output logic                            SCM_write_req_o,   
   output logic [ADDR_WIDTH-1:0]           SCM_write_addr_o,
   output logic [$clog2(NB_BANKS)-1:0]     SCM_write_dest_o,  
   output logic [TAG_WIDTH+DATA_WIDTH-1:0] SCM_write_wdata_o,
   output logic [NB_WAYS-1:0]              SCM_write_way_o,
   input  logic                            SCM_write_gnt_i
);


   enum logic [1:0] { INVALIDATE, FLUSHED } CS, NS;
   logic [$clog2(NB_BANKS)+ADDR_WIDTH-1:0] counter_CS, counter_NS;


   always_ff @(posedge clk or negedge rst_n) 
   begin : SEQ_LOGIC
      if(~rst_n) 
      begin
          CS <= INVALIDATE;
          counter_CS <= '0;
      end 
      else 
      begin
          CS <= NS;
          counter_CS <= counter_NS;
      end
   end


   always_comb 
   begin : COMB_LOGIC
      flushing_o          = 1'b0;
      SCM_write_req_o    = 1'b0;
      SCM_write_way_o    = '1;
      SCM_write_addr_o   = counter_CS[ADDR_WIDTH-1:0];
      SCM_write_dest_o   = counter_CS[$clog2(NB_BANKS)+ADDR_WIDTH-1:ADDR_WIDTH];
      SCM_write_wdata_o  = '0;
      counter_NS = counter_CS;
      
      case(CS)

         INVALIDATE:
         begin
            flushing_o      = 1'b1;
            SCM_write_req_o = 1'b1;

            if(counter_CS < NB_BANKS * (2**ADDR_WIDTH) -1 )
            begin
               NS = INVALIDATE;
               counter_NS = counter_CS + 1'b1;
            end
            else
            begin
               NS = FLUSHED;
               counter_NS = '0;
            end
         end

         FLUSHED: 
         begin
            flushing_o = 1'b0;
            SCM_write_req_o = 1'b0;

            if(flush_req_i)
               NS = INVALIDATE;
            else
               NS = FLUSHED;
         end

         default:
         begin
            NS = INVALIDATE;
            counter_NS = counter_CS;
         end

      endcase
   end

endmodule // init_icache