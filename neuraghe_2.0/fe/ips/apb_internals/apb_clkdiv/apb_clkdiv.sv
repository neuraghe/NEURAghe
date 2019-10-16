`define REG_CLKDIV0     1'b0 //BASEADDR+0x00
`define REG_CLKDIV1     1'b1 //BASEADDR+0x04

module apb_clkdiv 
#(
    parameter APB_ADDR_WIDTH = 12  //APB slaves are 4KB by default
)
(
    input  logic                      HCLK,
    input  logic                      HRESETn,
    input  logic [APB_ADDR_WIDTH-1:0] PADDR,
    input  logic               [31:0] PWDATA,
    input  logic                      PWRITE,
    input  logic                      PSEL,
    input  logic                      PENABLE,
    output logic               [31:0] PRDATA,
    output logic                      PREADY,
    output logic                      PSLVERR,

    output logic                [7:0] clk_div0,
    output logic                      clk_div0_valid,
    output logic                [7:0] clk_div1,
    output logic                      clk_div1_valid
);

    logic [7:0] r_clkdiv0;
    logic [7:0] r_clkdiv1;

    logic       s_apb_addr;

    assign s_apb_addr = PADDR[2];

    always @ (posedge HCLK or negedge HRESETn) 
    begin
        if(~HRESETn)
        begin
            r_clkdiv0      <= 'h0;
            r_clkdiv1      <= 'h0;
            clk_div0_valid <= 1'b0;
            clk_div1_valid <= 1'b0;
        end
        else 
        begin
            clk_div0_valid    <= 1'b0;
            clk_div1_valid    <= 1'b0;
            if (PSEL && PENABLE && PWRITE)
            begin
                case (s_apb_addr)
                `REG_CLKDIV0:
                begin
                    r_clkdiv0      <= PWDATA[7:0];
                    clk_div0_valid <= 1'b1;
                end
                `REG_CLKDIV1:
                begin
                    r_clkdiv1      <= PWDATA[7:0];
                    clk_div1_valid <= 1'b1;
                end
                endcase
            end
        end
    end //always

    always_comb
    begin
        case (s_apb_addr)
        `REG_CLKDIV0:
            PRDATA = {24'h00_0000,r_clkdiv0};
        `REG_CLKDIV1:
            PRDATA = {24'h00_0000,r_clkdiv1};
        endcase
    end

    assign clk_div0 = r_clkdiv0;
    assign clk_div1 = r_clkdiv1;

    assign PREADY  = 1'b1;
    assign PSLVERR = 1'b0;

endmodule