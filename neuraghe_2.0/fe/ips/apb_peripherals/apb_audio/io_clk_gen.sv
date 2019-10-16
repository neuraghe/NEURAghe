/****************************************************************************
 * io_clk_gen.sv
 ****************************************************************************/

/**
 * Module: io_clk_gen
 * 
 * TODO: Add module documentation
 */
module io_clk_gen 
#(
    parameter COUNTER_WIDTH = 11
)
(
    input  logic                        clk_i,
    input  logic                        rstn_i,
    input  logic                        en_i,
    input  logic [COUNTER_WIDTH-1:0]    clk_div_i,
    output logic                        clk_o,
    output logic                        fall_o,
    output logic                        rise_o
);

   logic [COUNTER_WIDTH-1:0] counter;
   logic [COUNTER_WIDTH-1:0] counter_next;

   logic       clk_o_next;
   logic       running;

   always_comb
   begin
           rise_o = 1'b0;
           fall_o = 1'b0;

           if (counter == clk_div_i)
           begin
               counter_next = 0;
               clk_o_next = ~clk_o;
               if(clk_o == 1'b0)
                   rise_o = running;
               else
                   fall_o = running;
           end
           else
           begin
                   counter_next = counter + 1;
                   clk_o_next = clk_o;
           end
   end

   always_ff @(posedge clk_i, negedge rstn_i)
   begin
   if (rstn_i == 1'b0)
       begin
           clk_o        <= 1'b0;
           counter      <= 'h0;
           running      <= 1'b0;
       end
       else
       begin
           if ( !((clk_o==1'b0)&&(~en_i)) )
           begin
               running  <= 1'b1;
               clk_o    <= clk_o_next;
               counter  <= counter_next;
           end
           else
               running <= 1'b0;
       end
    end

endmodule