
module spi_slave (
        input  logic rstn,
		input  logic SSPI_SIO0_PAD,
		input  logic SSPI_SIO1_PAD,
		input  logic SSPI_SIO2_PAD,
		input  logic SSPI_SIO3_PAD,
		input  logic SSPI_CSN_PAD,
		input  logic SSPI_SCK_PAD
	);
	
    logic [7:0] rx_array [4095:0];

    logic sample_lsb;

    logic [11:0] array_index;

    logic [3:0] tmp_data;

    always @(posedge SSPI_SCK_PAD or negedge rstn)
    begin
        if (rstn == 0)
        begin
            sample_lsb  = 1'b0;
            array_index =  'h0;
        end
        else
        begin
          if(SSPI_CSN_PAD == 0)
          begin
            if (sample_lsb)
            begin
                rx_array[array_index] = {tmp_data,SSPI_SIO3_PAD,SSPI_SIO2_PAD,SSPI_SIO1_PAD,SSPI_SIO0_PAD};
                sample_lsb = 1'b0;
                array_index = array_index + 1;
            end
            else
            begin
                tmp_data = {SSPI_SIO3_PAD,SSPI_SIO2_PAD,SSPI_SIO1_PAD,SSPI_SIO0_PAD};
                sample_lsb = 1'b1;
            end
          end
        end
    end
		
endmodule
