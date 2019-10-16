module one_dsp_MACC
#(
    parameter REG_A_D_WIDTH   = 25,
    parameter REG_B_WIDTH     = 18,
    parameter SUM_WIDTH       = 48
  )
  (
    input  logic                               clk,
    input  logic                               rst_n,
    input  logic                               enable,
    input  logic                               ready_y_out,
    input  logic signed    [REG_A_D_WIDTH-1:0] a,
    input  logic signed    [REG_A_D_WIDTH-1:0] d,
    input  logic signed    [REG_B_WIDTH-1:0]   b,
    input logic signed     [SUM_WIDTH -1:0]    p_in,
    output logic signed    [SUM_WIDTH -1:0]    p_out
  );
  
    logic signed    [REG_A_D_WIDTH-1:0] a_reg;
    logic signed    [REG_A_D_WIDTH-1:0] d_reg;
    logic signed    [REG_B_WIDTH-1:0] b_reg;
    logic signed    [REG_A_D_WIDTH-1:0] s_reg;
    logic signed    [SUM_WIDTH-1:0] m_reg;
    logic signed    [SUM_WIDTH-1:0] p_reg;
    
    generate
        always_ff @(posedge clk) begin
            if(rst_n == 1'b0) begin
                a_reg <= 0;
                d_reg <= 0;
                b_reg <= 0;
                s_reg <= 0;
                m_reg <= 0;
                p_reg <= 0;
            end
            else
              if(ready_y_out == 1'b1 && enable==1'b1) begin
                 a_reg <= a;
                 d_reg <= d;
                 b_reg <= b;
                 s_reg <= a_reg + d_reg;
                 m_reg <= s_reg * b_reg;
                 p_reg <= m_reg + p_in;
              end
          end
    endgenerate
   assign p_out = p_reg;
endmodule
