`include "ulpsoc_defines.sv"

module boot_rom
(
    input logic                clk_i,
    input logic                rst_ni,
    input logic                init_ni,

    UNICAD_MEM_BUS_64.Slave    mem_slave,

    input logic                test_mode_i
);

    logic rsta;
    assign rsta = ~rst_ni;
    logic ena;
    assign ena = ~mem_slave.csn;
    logic [7:0] wea;
    assign wea = 8'b0;
    logic [63:0] dina;
    assign dina = 64'b0;
    xilinx_rom_bank_1024x64 rom_mem_i (
       .clka  (clk_i),
       .rsta  (rsta),
       .ena   (ena),
       .wea   (wea),
       .addra (mem_slave.add[9:0]),
       .dina  (dina),
       .douta (mem_slave.rdata)
    );

endmodule
