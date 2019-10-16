module icache_bank
#(
   parameter FETCH_ADDR_WIDTH = 32,
   parameter FETCH_DATA_WIDTH = 32,

   parameter BANK_ID         = 0,
   parameter NB_BANKS        = 4,
   parameter NB_WAYS         = 4,

   parameter SCM_ADDR_WIDTH  = 16,
   parameter TAG_WIDTH       = 6,
   parameter DATA_WIDTH      = 128,

   parameter AXI_ID          = 4,
   parameter AXI_ADDR        = 32,
   parameter AXI_USER        = 6,
   parameter AXI_DATA        = 64
)
(
   input logic clk,
   input logic rst_n,

   input logic icache_flushing_i,

   // interface with processor
   input  logic                                fetch_req_i,
   input  logic [FETCH_ADDR_WIDTH-1:0]         fetch_addr_i,
   output logic                                fetch_gnt_o,
   output logic                                fetch_rvalid_o,
   output logic [FETCH_DATA_WIDTH-1:0]         fetch_rdata_o,


   // interface with READ PORT --> SCM DATA
   output logic [NB_BANKS-1:0]                              DATA_read_req_o,   
   output logic [SCM_ADDR_WIDTH-1:0]                        DATA_read_addr_o,
   input  logic [NB_BANKS-1:0][NB_WAYS-1:0][DATA_WIDTH-1:0] DATA_read_rdata_i,

   // interface with READ PORT --> SCM TAG
   output logic [NB_BANKS-1:0]                              TAG_read_req_o,   
   output logic [SCM_ADDR_WIDTH-1:0]                        TAG_read_addr_o,
   input  logic [NB_BANKS-1:0][NB_WAYS-1:0][TAG_WIDTH-1:0]  TAG_read_rdata_i,



   // interface with WRITE PORT --> SCM Unified PORT
   output logic                                SCM_write_req_o,   
   output logic [SCM_ADDR_WIDTH-1:0]           SCM_write_addr_o,
   output logic [$clog2(NB_BANKS)-1:0]         SCM_write_dest_o,
   output logic [TAG_WIDTH + DATA_WIDTH-1:0]   SCM_write_wdata_o, // VALID, TAG, CACHE_LINE
   output logic [NB_WAYS-1:0]                  SCM_write_way_o,   // VALID, TAG, CACHE_LINE
   input  logic                                SCM_write_gnt_i,


   //AXI read address bus -------------------------------------------
   output  logic [AXI_ID-1:0]             axi_master_arid_o,
   output  logic [AXI_ADDR-1:0]           axi_master_araddr_o,
   output  logic [ 7:0]                   axi_master_arlen_o,    //burst length - 1 to 16
   output  logic [ 2:0]                   axi_master_arsize_o,   //size of each transfer in burst
   output  logic [ 1:0]                   axi_master_arburst_o,  //for bursts>1, accept only incr burst=01
   output  logic                          axi_master_arlock_o,   //only normal access supported axs_awlock=00
   output  logic [ 3:0]                   axi_master_arcache_o, 
   output  logic [ 2:0]                   axi_master_arprot_o,
   output  logic [ 3:0]                   axi_master_arregion_o, //
   output  logic [ AXI_USER-1:0]          axi_master_aruser_o,   //
   output  logic [ 3:0]                   axi_master_arqos_o,    //  
   output  logic                          axi_master_arvalid_o,  //master addr valid
   input logic                            axi_master_arready_i,  //slave ready to accept
   // ---------------------------------------------------------------


   //AXI BACKWARD read data bus ----------------------------------------------
   input  logic [AXI_ID-1:0]              axi_master_rid_i,
   input  logic [AXI_DATA-1:0]            axi_master_rdata_i,
   input  logic [1:0]                     axi_master_rresp_i,
   input  logic                           axi_master_rlast_i,    //last transfer in burst
   input  logic [ AXI_USER-1:0]           axi_master_ruser_i,
   input  logic                           axi_master_rvalid_i,   //slave data valid
   output logic                           axi_master_rready_o    //master ready to accept
);
localparam CACHE_LINE = DATA_WIDTH/FETCH_DATA_WIDTH;
localparam SET_ID_LSB = $clog2(NB_BANKS)+$clog2(DATA_WIDTH)-3;
localparam SET_ID_MSB = SET_ID_LSB + SCM_ADDR_WIDTH - 1;
localparam TAG_LSB    = SET_ID_MSB + 1;
localparam TAG_MSB    = TAG_LSB + TAG_WIDTH - 2 ; //1 bit is count for valid
localparam OFFSET     = $clog2(DATA_WIDTH)-3;
localparam CACHE_LINE_WIDTH = $clog2(CACHE_LINE);

logic [FETCH_ADDR_WIDTH-1:0]    fetch_addr_Q;
logic                           fetch_req_Q;

logic                           save_fetch;
logic                           clear_pipe;
logic                           enable_pipe;

logic [FETCH_ADDR_WIDTH-1:0]    saved_address;
logic                           valid_saved_address;
logic                           clear_saved_address;

logic [$clog2(NB_BANKS)-1:0]    fetch_dest_Q;
logic [NB_WAYS-1:0][DATA_WIDTH-1:0]          DATA_read_rdata_int;
logic [NB_WAYS-1:0][CACHE_LINE-1:0][FETCH_DATA_WIDTH-1:0]          DATA_read_rdata_int_chunk;
logic [CACHE_LINE-1:0][FETCH_DATA_WIDTH-1:0]                       axi_master_rdata_chunk;

logic [NB_WAYS-1:0][TAG_WIDTH-1:0]           TAG_read_rdata_int;

logic [AXI_DATA-1:0]            axi_master_rdata_Q[2];
logic rdata_source;


logic [NB_WAYS-1:0] way_match;
logic [NB_WAYS-1:0] way_valid;
logic [NB_WAYS-1:0] way_match_bin;

logic [NB_WAYS-1:0] way_match_Q;
logic [NB_WAYS-1:0] way_valid_Q;

logic                update_lfsr;
logic [NB_WAYS-1:0]  random_way;
logic [NB_WAYS-1:0]  first_available_way;

logic [$clog2(CACHE_LINE)-1:0] fetch_rel_chunk;


enum logic [2:0] { INVALIDATE, OPERATIVE, SERVE_REFILL, COMPLETE_REFILL, DISPATCH_MISS, PREPARE_SCM_WRITE, WAIT_SCM_GRANT } CS, NS;

int unsigned i,j,index;

assign axi_master_rdata_chunk    = {axi_master_rdata_Q[1] , axi_master_rdata_Q[0]};
assign DATA_read_rdata_int_chunk =  DATA_read_rdata_int ;


always_ff @(posedge clk, negedge rst_n) 
begin
   if(~rst_n) 
   begin
       CS                 <= INVALIDATE;
       fetch_addr_Q       <= '0;
       fetch_req_Q        <= 1'b0;
       saved_address      <= '0;
       axi_master_rdata_Q[0] <= '0;
       axi_master_rdata_Q[1] <= '0;
       valid_saved_address   <= 1'b0;
       way_match_Q           <= '0;
       way_valid_Q           <= '0;
   end 
   else 
   begin
       CS <= NS;

       way_match_Q <= way_match;
       way_valid_Q <= way_valid;

       if( axi_master_rvalid_i & axi_master_rready_o)
       begin
         axi_master_rdata_Q[1] <= axi_master_rdata_i;
         axi_master_rdata_Q[0] <= axi_master_rdata_Q[1];
       end



       if(save_fetch)
       begin
            saved_address <= fetch_addr_i;
            valid_saved_address <= 1'b1;
       end
       else if(clear_saved_address)
            begin
               valid_saved_address <= 1'b0;
            end


       if(enable_pipe)
       begin
            fetch_req_Q    <= 1'b1;
            if(valid_saved_address)
            begin
               fetch_addr_Q   <= saved_address;
            end
            else
            begin
               fetch_addr_Q   <= fetch_addr_i;
            end
       end
       else  if(clear_pipe)
             begin
                  fetch_req_Q <= '0;
             end

   end
end

assign fetch_dest_Q    = fetch_addr_Q[$clog2(NB_BANKS)+OFFSET-1:OFFSET];
assign fetch_rel_chunk = fetch_addr_Q[OFFSET-1:2];

assign TAG_read_rdata_int  = TAG_read_rdata_i[fetch_dest_Q]  ;
assign DATA_read_rdata_int = DATA_read_rdata_i[fetch_dest_Q] ;





// --------------------- //
// TAG CHECK MULTI WAY   //
// --------------------- //
genvar k;
generate
   for(k=0; k<NB_WAYS; k++)
   begin
      assign way_match[k]  = ((TAG_read_rdata_int[k][TAG_WIDTH-1] == 1'b1) && (TAG_read_rdata_int[k][TAG_WIDTH-2:0] == fetch_addr_Q[TAG_MSB:TAG_LSB]));
      assign way_valid[k]  = (TAG_read_rdata_int[k][TAG_WIDTH-1] == 1'b1);
   end
endgenerate


always_comb
begin
   first_available_way = 0;

   for(index=0;index<NB_WAYS;index++)
   begin
      if(way_valid[index]==0)
         first_available_way=index;
   end
end

always_comb
begin

   axi_master_araddr_o[31:4] = fetch_addr_Q[31:4];
   axi_master_araddr_o[3:0]  = 4'b0000;
   axi_master_arid_o       = BANK_ID;
   axi_master_arlen_o      = 8'h01; //FIXME
   axi_master_arsize_o     = 3'b010;
   axi_master_arburst_o    = 2'b01;   // INCR
   axi_master_arlock_o     = 1'b0;
   axi_master_arcache_o    = '0;
   axi_master_arprot_o     = '0;
   axi_master_arregion_o   = '0;
   axi_master_aruser_o     = '0; 
   axi_master_arqos_o      = '0;  
   axi_master_arvalid_o    = 1'b0;

   axi_master_rready_o     = 1'b1;

   TAG_read_req_o          = '0;
   TAG_read_addr_o         = fetch_addr_i[SET_ID_MSB:SET_ID_LSB];

   DATA_read_req_o         = 1'b0;
   DATA_read_addr_o        = fetch_addr_i[SET_ID_MSB:SET_ID_LSB];

   SCM_write_req_o     =   1'b0;
   SCM_write_way_o     =   '0;
   SCM_write_dest_o    =   fetch_addr_Q[$clog2(NB_BANKS)+4-1:4];
   SCM_write_addr_o    =   fetch_addr_Q[SET_ID_MSB:SET_ID_LSB];
   SCM_write_wdata_o   =   { 1'b0, fetch_addr_Q[TAG_MSB:TAG_LSB], axi_master_rdata_Q[1] , axi_master_rdata_Q[0] };
   

   fetch_gnt_o             = 1'b0;
   fetch_rvalid_o          = 1'b0;
   fetch_rdata_o           = DATA_read_rdata_int_chunk[way_match_bin[$clog2(NB_WAYS)-1:0]][fetch_rel_chunk];
   save_fetch              = 1'b0;
   clear_saved_address     = 1'b0;
   enable_pipe             = 1'b0;
   clear_pipe              = 1'b0;
   update_lfsr             = 1'b0;
   NS                      = CS;


   case(CS)
      
      INVALIDATE: 
      begin
        if(icache_flushing_i)
        begin
          NS = INVALIDATE;
        end
        else
        begin
          NS = OPERATIVE;
        end
      end


      OPERATIVE: 
      begin
         fetch_gnt_o     = 1'b1;
         enable_pipe     = fetch_req_i;
         

         TAG_read_req_o[fetch_addr_i[$clog2(NB_BANKS)-1+4:4]]  = fetch_req_i;
         TAG_read_addr_o = fetch_addr_i[SET_ID_MSB:SET_ID_LSB];

         DATA_read_req_o[fetch_addr_i[$clog2(NB_BANKS)-1+4:4]]  = fetch_req_i;
         DATA_read_addr_o = fetch_addr_i[SET_ID_MSB:SET_ID_LSB];


         if(fetch_req_Q)
         begin
            if(|way_match)
            begin : HIT
               NS              = OPERATIVE;
               fetch_rvalid_o  = 1'b1;
            end
            else 
            begin : MISS
               NS           = SERVE_REFILL;
               save_fetch   = fetch_req_i;
            end
         end         
      end

      SERVE_REFILL: 
      begin
         axi_master_arvalid_o = 1'b1;
         if(axi_master_arready_i)
         begin
            NS = COMPLETE_REFILL;
         end
         else
         begin
            NS = SERVE_REFILL;
         end

      end


      COMPLETE_REFILL: 
      begin
         axi_master_rready_o = 1'b1;

         if(axi_master_rvalid_i & axi_master_rlast_i)
         begin      
            NS = DISPATCH_MISS;
            //read the tag to be sure that the cache line is not yet there
            TAG_read_req_o[fetch_addr_Q[$clog2(NB_BANKS)-1+OFFSET:OFFSET]]  = 1'b1;
            TAG_read_addr_o = fetch_addr_Q[SET_ID_MSB:SET_ID_LSB];
         end
         else
         begin
            NS = COMPLETE_REFILL;
         end
      end


      DISPATCH_MISS:
      begin
        fetch_rvalid_o = 1'b1;
        fetch_rdata_o  = axi_master_rdata_chunk[fetch_rel_chunk];
        NS = PREPARE_SCM_WRITE;

        // lets sample the tag check and tag valid
      end


      PREPARE_SCM_WRITE:
      begin
        SCM_write_req_o    = (|way_match_Q == 1'b0);
        SCM_write_dest_o   = fetch_addr_Q[$clog2(NB_BANKS)+OFFSET-1:OFFSET];
        SCM_write_addr_o   = fetch_addr_Q[SET_ID_MSB:SET_ID_LSB];

        if( &way_valid_Q )
        begin
            //pick a random way
            SCM_write_way_o = random_way;
            update_lfsr     = 1'b1;
        end
        else
        begin
            SCM_write_way_o = 1<<first_available_way;
        end





        
        SCM_write_wdata_o  = { 1'b1, fetch_addr_Q[TAG_MSB:TAG_LSB], axi_master_rdata_Q[1] , axi_master_rdata_Q[0] };


        if(SCM_write_req_o)
        begin
              if(SCM_write_gnt_i) 
              begin
                   NS = OPERATIVE;
                   if(valid_saved_address) // there was a pending instr that we saved during the MISS
                   begin
                         fetch_gnt_o = 1'b0;
                         enable_pipe = 1'b1;
                         DATA_read_req_o = valid_saved_address;

                         TAG_read_req_o[saved_address[$clog2(NB_BANKS)-1+OFFSET:OFFSET]]  = fetch_req_i;
                         TAG_read_addr_o = saved_address[SET_ID_MSB:SET_ID_LSB];

                         DATA_read_req_o[saved_address[$clog2(NB_BANKS)-1+OFFSET:OFFSET]]  = fetch_req_i;
                         DATA_read_addr_o = saved_address[SET_ID_MSB:SET_ID_LSB]; 
                   end
                   else
                   begin
                         fetch_gnt_o     = 1'b1;
                         enable_pipe     = fetch_req_i;

                         TAG_read_req_o[fetch_addr_i[$clog2(NB_BANKS)-1+OFFSET:OFFSET]]  = fetch_req_i;
                         TAG_read_addr_o = fetch_addr_i[SET_ID_MSB:SET_ID_LSB];

                         DATA_read_req_o[fetch_addr_i[$clog2(NB_BANKS)-1+OFFSET:OFFSET]]  = fetch_req_i;
                         DATA_read_addr_o = fetch_addr_i[SET_ID_MSB:SET_ID_LSB];

                         clear_pipe = ~fetch_req_i; // if there is no request, then clear the pipe
                   end
              end
              else
              begin
                NS = WAIT_SCM_GRANT;
              end
        end
        else
        begin
            NS = OPERATIVE;
            clear_pipe = 1'b1;
        end              

      end


      WAIT_SCM_GRANT:
      begin

        fetch_rvalid_o = 1'b0;

        SCM_write_req_o    = 1'b1;
        SCM_write_dest_o   = fetch_addr_Q[$clog2(NB_BANKS)+4-1:4];
        SCM_write_addr_o   = fetch_addr_Q[SET_ID_MSB:SET_ID_LSB];
        SCM_write_wdata_o  = { 1'b1, fetch_addr_Q[TAG_MSB:TAG_LSB], axi_master_rdata_Q[1] , axi_master_rdata_Q[0] };

        if(SCM_write_gnt_i)
        begin
             NS = OPERATIVE;
             if(valid_saved_address) // there was a pending instr that we saved during the MISS
             begin
                   fetch_gnt_o = 1'b0;
                   enable_pipe = 1'b1;
                   DATA_read_req_o = valid_saved_address;

                   TAG_read_req_o[saved_address[$clog2(NB_BANKS)-1+4:4]]  = fetch_req_i;
                   TAG_read_addr_o = saved_address[SET_ID_MSB:SET_ID_LSB];

                   DATA_read_req_o[saved_address[$clog2(NB_BANKS)-1+4:4]]  = fetch_req_i;
                   DATA_read_addr_o = saved_address[SET_ID_MSB:SET_ID_LSB]; 
             end
             else
             begin
                   fetch_gnt_o     = 1'b1;
                   enable_pipe     = fetch_req_i;

                   TAG_read_req_o[fetch_addr_i[$clog2(NB_BANKS)-1+4:4]]  = fetch_req_i;
                   TAG_read_addr_o = fetch_addr_i[SET_ID_MSB:SET_ID_LSB];

                   DATA_read_req_o[fetch_addr_i[$clog2(NB_BANKS)-1+4:4]]  = fetch_req_i;
                   DATA_read_addr_o = fetch_addr_i[SET_ID_MSB:SET_ID_LSB];

                   clear_pipe = ~fetch_req_i; // if there is no request, then clear the pipe
             end
        end
        else
        begin
          NS = WAIT_SCM_GRANT;
        end
      end

      default:
      begin
         NS = INVALIDATE;
      end



   endcase // CS
end






generic_LFSR_8bit
#(
    .OH_WIDTH(NB_WAYS),
    .SEED(0)
)
i_LFSR_Way_Repl
(
    .data_OH_o      ( random_way  ), 
    .data_BIN_o     (             ),
    .enable_i       ( update_lfsr ),      
    .clk            ( clk         ),           
    .rst_n          ( rst_n       )
);

onehot_to_bin #( .ONEHOT_WIDTH(NB_WAYS) ) WAY_MATCH_BIN (.onehot(way_match), .bin(way_match_bin[ $clog2(NB_WAYS)-1:0]) );
assign way_match_bin[NB_WAYS-1:$clog2(NB_WAYS)] = 0;
endmodule // icache_top
