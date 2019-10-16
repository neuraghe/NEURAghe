
module sram_1p_sr_sw
#(
    parameter ADDR_WIDTH = 12,
    parameter DATA_WIDTH = 64,
    parameter BE_WIDTH   = DATA_WIDTH/8
)
(
    input  logic                   clk,
    input  logic                   rst_n,

    input  logic                      CEN,
    input  logic [ADDR_WIDTH-1:0]     A,
    input  logic                      WEN,
    input  logic [BE_WIDTH-1:0][7:0]  D,
    input  logic [BE_WIDTH-1:0]       BEN,

    output logic [DATA_WIDTH-1:0]     Q
);
   
   localparam   NUM_WORDS = 2**ADDR_WIDTH;
   
   logic [BE_WIDTH-1:0][7:0]           MEM [NUM_WORDS];


   initial
   begin
        for(int k=0; k<NUM_WORDS; k++)
        begin
            MEM[k][3:0]  <= 32'h1C000000+2*k*4;
            MEM[k][7:4] <= 32'h1C000000+(2*k+1)*4;
        end
   end


   always_ff @(posedge clk or negedge rst_n) 
   begin
       if(~rst_n) 
       begin
            //for(int i=0; i<NUM_WORDS; i++)
              //  MEM[i] <= '0;
       end 
       else 
       begin
            if(CEN == 1'b0)
            begin
                if(WEN == 1'b0)
                begin
                    for(int j=0; j<BE_WIDTH; j++)
                    begin
                        if(BEN[j] == 1'b0)
                            MEM[A][j] <= D[j];
                    end
                    Q <= 'X;
                end
                else
                begin
                    Q <= MEM[A];
                end
            end
            else
                Q <= 'X;
       end
   end





   
endmodule // sram_1p_sr_sw