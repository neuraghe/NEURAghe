module i2s_vip #(
	parameter I2S_CHAN = 4'h1
) (

   input   logic        A0,                             // chip select bit
   input   logic        A1,                             // chip select bit
   inout   wire         SDA,                            // serial data I/O
   input   wire         SCL,                            // serial data clock
   input   logic        sck,
   input   logic        ws,
   output  logic        data_o
);

i2s_vip_channel #(
	.I2S_CHAN(I2S_CHAN)
) i2s_vip_channel_i (
    .rst(s_i2s_rst),
	.pdm_ddr(s_pdm_ddr),
	.pdm_en(s_pdm_en),
	.lsb_first(s_lsb_first),
    .sck(sck),
    .ws(ws),
    .data_o(data_o)
);

i2c_if i2c_if_i (
	.A0(A0),
	.A1(A1),
	.A2(1'b1),
	.WP(1'b0),
	.SDA(SDA),
	.SCL(SCL),
	.RESET(1'b0),
	.pdm_ddr(s_pdm_ddr),
	.pdm_en(s_pdm_en),
	.lsb_first(s_lsb_first),
	.i2s_rst(s_i2s_rst)
);

endmodule 