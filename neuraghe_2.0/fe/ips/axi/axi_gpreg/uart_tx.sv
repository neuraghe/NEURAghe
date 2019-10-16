module uart_tx (
		input  logic            clk,
		input  logic            rstn,
		output logic            tx,
		output logic            tx_busy,
		input  logic [15:0]     div,
		input  logic            parity_check,
		input  logic [7:0]      datatx,
		input  logic            datatx_valid,
		output logic            datatx_ready
		);
	
	enum logic [2:0] {IDLE,WAIT_FIFO,START_BIT,DATA,PARITY,STOP_BITS} CS,NS;
	
	logic [7:0] s_datatx;
	logic [7:0] reg_data;
	logic [7:0] reg_data_next;

	logic [7:0] reg_bit_count;
	logic [7:0] reg_bit_count_next;
	
	logic       parity_bit;
	logic       parity_bit_next;
	
	logic       sampleData;
	
	logic [15:0] baud_cnt;
	logic       baudgen_en;
	logic       bit_done;
	
  assign s_datatx = datatx;
	
	always_comb
	begin
		NS = CS;
		tx = 1'b1;
		sampleData = 1'b0;
		reg_bit_count_next  = reg_bit_count;
		reg_data_next = {reg_data[6:0],1'b1};
		datatx_ready = 1'b0;
		baudgen_en = 1'b0;
		tx_busy = 1'b1;
		parity_bit_next = parity_bit;
		case(CS)
			IDLE:
      begin
				tx_busy = 1'b0;

				if (datatx_valid)
				begin
					NS = START_BIT;
					sampleData = 1'b1;
					reg_data_next = s_datatx;
				end
      end

			WAIT_FIFO:
      begin
				if (datatx_valid)
        begin
				  sampleData = 1'b1;
				  reg_data_next = s_datatx;
			    NS = START_BIT;
        end
        else
        begin
					NS = IDLE;
        end
      end
				
			START_BIT:
			begin
				tx = 1'b0;
				parity_bit_next = 1'b0;
				baudgen_en = 1'b1;
				if (bit_done)
					NS = DATA;
			end

			DATA:
			begin
				tx = reg_data[7];
				baudgen_en = 1'b1;
				parity_bit_next = parity_bit ^ reg_data[7];
				if (bit_done)
				begin
					if (reg_bit_count == 3'h7)
					begin
						reg_bit_count_next = 'h0;
						if (parity_check)
						begin
							NS = PARITY;
						end
						else
						begin
							NS = STOP_BITS;
						end
					end
					else
					begin
						reg_bit_count_next = reg_bit_count + 1;
						sampleData = 1'b1;
					end
				end
			end

			PARITY:
			begin
				tx = parity_bit;
				baudgen_en = 1'b1;
				if (bit_done)
					NS = STOP_BITS;
			end

			STOP_BITS:
			begin
				tx = 1'b1;
				baudgen_en = 1'b1;
				if (bit_done)
				begin
				  datatx_ready = 1'b1;
					NS = WAIT_FIFO;
				end
			end
		endcase		
	end
	
	always_ff @(posedge clk or negedge rstn)
	begin
		if (rstn == 1'b0)
		begin
			CS             <= IDLE;
			reg_data       <= 8'hFF;
			reg_bit_count  <=  'h0;
			parity_bit     <= 1'b0;
		end
		else
		begin
      if(bit_done)
      begin
			  parity_bit <= parity_bit_next;
      end

			if(sampleData)
			begin
				reg_data <= reg_data_next;
			end

			reg_bit_count  <= reg_bit_count_next;
			CS <= NS;
		end
	end

	always_ff @(posedge clk or negedge rstn)
	begin
		if (rstn == 1'b0)
		begin
			baud_cnt = 'h0;
			bit_done = 1'b0;
		end
		else
		begin
			if(baudgen_en)
			begin
				if(baud_cnt == div)
				begin
					baud_cnt = 'h0;
					bit_done = 1'b1;
				end
				else
				begin
					baud_cnt = baud_cnt + 1;
					bit_done = 1'b0;
				end
			end
			else
			begin
				baud_cnt = 'h0;
				bit_done = 1'b0;
			end
		end
	end
	
endmodule