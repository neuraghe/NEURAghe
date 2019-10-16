module i2s_vip_channel#(
	parameter I2S_CHAN = 4'h1
) (
    input  logic rst,
    input  logic pdm_ddr,
    input  logic pdm_en,
    input  logic lsb_first,
    input  logic sck,
    input  logic ws,
    output logic data_o
);

localparam PACKET_SIZE  = 32;
localparam PACKET_LOG_2 = $clog2(PACKET_SIZE);
localparam ROW_SIZE     = 3;
localparam ROW_SIZE_PDM = 4;


int unsigned  index;


logic   [PACKET_SIZE-1:0] DATA_LEFT_STD;
logic   [PACKET_SIZE-1:0] DATA_RIGHT_STD;

logic   [PACKET_SIZE-1:0] DATA_PDM;

logic   [PACKET_SIZE-1:0] SHIFT_REG_STD;
logic   [PACKET_SIZE-1:0] SHIFT_REG_PDM;

logic	[PACKET_LOG_2-1:0]	BIT_POINTER;


logic	WSQ, WSQQ, WSP;

logic   [31:0] MASK;
logic   [ROW_SIZE:0]	    COUNTER_ROW_STD = 0;
logic   [ROW_SIZE_PDM-1:0]	COUNTER_ROW_PDM = 0;
logic   do_load = 1'b0;

logic   [31:0]	 MEM_L [2**ROW_SIZE];
logic   [31:0]	 MEM_R [2**ROW_SIZE];
logic   [31:0]	 MEM_PDM [2**ROW_SIZE_PDM];

assign MEM_L[0] = {I2S_CHAN[3:0],28'h000_0000};
assign MEM_R[0] = {I2S_CHAN[3:0],28'h111_1111};
assign MEM_L[1] = {I2S_CHAN[3:0],28'h222_2222};
assign MEM_R[1] = {I2S_CHAN[3:0],28'h333_3333};
assign MEM_L[2] = {I2S_CHAN[3:0],28'h444_4444};
assign MEM_R[2] = {I2S_CHAN[3:0],28'h555_5555};
assign MEM_L[3] = {I2S_CHAN[3:0],28'h666_6666};
assign MEM_R[3] = {I2S_CHAN[3:0],28'h777_7777};
assign MEM_L[4] = {I2S_CHAN[3:0],28'h888_8888};
assign MEM_R[4] = {I2S_CHAN[3:0],28'h999_9999};
assign MEM_L[5] = {I2S_CHAN[3:0],28'hAAA_AAAA};
assign MEM_R[5] = {I2S_CHAN[3:0],28'hBBB_BBBB};
assign MEM_L[6] = {I2S_CHAN[3:0],28'hCCC_CCCC};
assign MEM_R[6] = {I2S_CHAN[3:0],28'hDDD_DDDD};
assign MEM_L[7] = {I2S_CHAN[3:0],28'hEEE_EEEE};
assign MEM_R[7] = {I2S_CHAN[3:0],28'hFFF_FFFF};


assign MEM_PDM[0] = {I2S_CHAN[3:0],28'h000_0000};
assign MEM_PDM[1] = {I2S_CHAN[3:0],28'h111_1111};
assign MEM_PDM[2] = {I2S_CHAN[3:0],28'h222_2222};
assign MEM_PDM[3] = {I2S_CHAN[3:0],28'h333_3333};
assign MEM_PDM[4] = {I2S_CHAN[3:0],28'h444_4444};
assign MEM_PDM[5] = {I2S_CHAN[3:0],28'h555_5555};
assign MEM_PDM[6] = {I2S_CHAN[3:0],28'h666_6666};
assign MEM_PDM[7] = {I2S_CHAN[3:0],28'h777_7777};
assign MEM_PDM[8] = {I2S_CHAN[3:0],28'h888_8888};
assign MEM_PDM[9] = {I2S_CHAN[3:0],28'h999_9999};
assign MEM_PDM[10] = {I2S_CHAN[3:0],28'hAAA_AAAA};
assign MEM_PDM[11] = {I2S_CHAN[3:0],28'hBBB_BBBB};
assign MEM_PDM[12] = {I2S_CHAN[3:0],28'hCCC_CCCC};
assign MEM_PDM[13] = {I2S_CHAN[3:0],28'hDDD_DDDD};
assign MEM_PDM[14] = {I2S_CHAN[3:0],28'hEEE_EEEE};
assign MEM_PDM[15] = {I2S_CHAN[3:0],28'hFFF_FFFF};

genvar j;
generate
	if(PACKET_SIZE < 32)
	begin
		for (j = 0; j < 32; j++) 
		begin
			if(j < PACKET_SIZE)
				assign MASK[j] = 1'b1;
			else
				assign MASK[j] = 1'b0;
		end
	end
	else
	begin
			assign MASK  = 32'hFFFF_FFFF;
	end
endgenerate


assign DATA_RIGHT_STD = MEM_R[COUNTER_ROW_STD[ROW_SIZE:1]] & MASK;
assign DATA_LEFT_STD  = MEM_L[COUNTER_ROW_STD[ROW_SIZE:1]] & MASK;

assign DATA_PDM = MEM_PDM[COUNTER_ROW_PDM] & MASK;




//////////////////////////////////////////////////////
//           ONLY for STD I2S version               //
//////////////////////////////////////////////////////
always_ff @(posedge sck or posedge rst)
begin
	if( rst )
	begin
		COUNTER_ROW_STD    <= '0;
	end	
	else
	begin
		if(pdm_en == 1'b0)
		begin
			if(ws ^ WSQ)
			begin
				COUNTER_ROW_STD <= COUNTER_ROW_STD + 1'b1;
			end	
		end
		else
		begin
				COUNTER_ROW_STD <= '0;
		end


	end
end


always_ff @(posedge sck or posedge rst) 
begin : _COMPUTE_WSP_
	if( rst ) 
	begin 
		 WSQ  <= 0;
		 WSQQ <= 0;
	end 
	else 
	begin
		 WSQ  <= ws;
		 WSQQ <= WSQ;
	end
end
assign WSP = WSQ ^ WSQQ; // Strobe used to sample new input
//                       // data in the  SR

always_ff @(negedge sck or posedge rst) 
begin : _SHIFT_REG_STD_
	if( rst ) 
	begin : _RESET_SR_
		SHIFT_REG_STD <= ( WSQ == 1'b0 ) ? DATA_LEFT_STD : DATA_RIGHT_STD;;
	end 
	else 
	begin
		if(pdm_en == 1'b0)
		begin
				if(WSP)
				begin : _LOAD_SR_STD_
					SHIFT_REG_STD <= ( WSQ == 1'b0 ) ? DATA_LEFT_STD : DATA_RIGHT_STD;
				end
				else
				begin : _SHIFT_
					if(lsb_first)
					begin : _PUSH_LSB_FIRST_STD_
						SHIFT_REG_STD[PACKET_SIZE-2:0] <= SHIFT_REG_STD[PACKET_SIZE-1:1] ;
						SHIFT_REG_STD[PACKET_SIZE-1]   <= 0; // Fill with zeros
					end
					else
					begin : _PUSH_MSB_FIRST_STD_
		 				SHIFT_REG_STD[PACKET_SIZE-1:1] <= SHIFT_REG_STD[PACKET_SIZE-2:0] ;
						SHIFT_REG_STD[0]               <= 0;  // Fill with zeros
					end
				end

		end
		else
		begin
			SHIFT_REG_STD <= '0;
		end
	end
end
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////





//////////////////////////////////////////////////////
//           ONLY for PDM I2S version               //
//////////////////////////////////////////////////////
always_ff @(posedge sck or posedge rst) 
begin : _SW_SR_   
	if( rst ) 
	begin : _RESET_BIT_CNT_
		 BIT_POINTER  <= 0;
		 COUNTER_ROW_PDM <= '0;
	end 
	else 
	begin
			if(pdm_en)
			begin
					if(pdm_ddr)
					begin
							if(BIT_POINTER == PACKET_SIZE/2-1)
							begin :  _CLEAR_BIT_CNT_DDR_
									BIT_POINTER     <= '0;
							end
							else if(BIT_POINTER == PACKET_SIZE/2-2)
								 begin
								 		COUNTER_ROW_PDM <= COUNTER_ROW_PDM + 1'b1;
								 		BIT_POINTER  <= BIT_POINTER+1;
								 end
								 else
								 begin : _INCR_BIT_CNT_DDR_
								 		BIT_POINTER  <= BIT_POINTER+1;
								 end							
					end
					else
					begin
							if(BIT_POINTER == PACKET_SIZE-1)
							begin :  _CLEAR_BIT_CNT_
									BIT_POINTER     <= '0;
									COUNTER_ROW_PDM <= COUNTER_ROW_PDM + 1'b1;
							end
							else
							begin : _INCR_BIT_CNT_
								BIT_POINTER  <= BIT_POINTER+1;
							end	
					end


			end
			else
			begin
					BIT_POINTER     <= '0;
					COUNTER_ROW_PDM <= '0;
			end		
	end
end

always_ff @(posedge sck or posedge rst) 
begin : proc_do_load
	if(rst) 
	begin
		 do_load <= 0;
	end 
	else 
	begin
		if ( ((pdm_ddr == 1'b1) && (BIT_POINTER == (PACKET_SIZE/2-1))) || (((pdm_ddr == 1'b0) && (BIT_POINTER == (PACKET_SIZE-1) ))) )//On falling edge of the clock
		begin : _LOAD_SR_PDM_
					do_load <= 1'b1; 
		end
		else
		begin
					do_load <= 1'b0;
		end
	end
end



always_ff @(negedge sck, posedge sck,  posedge rst) // Sensitive on both clock edges 
begin : _SHIFT_REG_PDM_
	if( rst ) 
	begin : _RESET_SR_PDM_
			begin : _SDR_LOAD_
					SHIFT_REG_PDM[PACKET_SIZE-1:0]               <=  DATA_PDM;
			end
	end 
	else 
	begin
		
		if(do_load & ~sck)
		begin : _LOAD_PDM_
			SHIFT_REG_PDM   <=  DATA_PDM;
		end
		else
		begin : _SHIFT_PDM_
			if(pdm_ddr)
			begin : _PDM_DDR_
					if(lsb_first)
					begin : _PUSH_LSB_FIRST_
						SHIFT_REG_PDM[PACKET_SIZE-2:0] <= SHIFT_REG_PDM[PACKET_SIZE-1:1] ;
						SHIFT_REG_PDM[PACKET_SIZE-1]   <= 0; // Fill with zeros
					end
					else
					begin : _PUSH_MSB_FIRST_
		 				SHIFT_REG_PDM[PACKET_SIZE-1:1] <= SHIFT_REG_PDM[PACKET_SIZE-2:0] ;
						SHIFT_REG_PDM[0]               <= 0;  // Fill with zeros
					end
			end
			else
			begin : _PDM_SDR_
					if(sck == 1'b0 )
					begin
							if(lsb_first)
							begin : _PUSH_LSB_FIRST_
								SHIFT_REG_PDM[PACKET_SIZE-2:0] <= SHIFT_REG_PDM[PACKET_SIZE-1:1] ;
							end
							else
							begin : _PUSH_MSB_FIRST_
				 				SHIFT_REG_PDM[PACKET_SIZE-1:1] <= SHIFT_REG_PDM[PACKET_SIZE-2:0] ;
							end
					end
			end
		end
	end
end






always_comb 
begin : proc_data_o
	if(pdm_en)
	begin
		if(pdm_ddr)
			data_o = (lsb_first) ? SHIFT_REG_PDM[0] : SHIFT_REG_PDM[PACKET_SIZE-1];
		else
			data_o = (lsb_first) ? SHIFT_REG_PDM[0] : SHIFT_REG_PDM[PACKET_SIZE-1];
		end
	else
	begin
		data_o = (lsb_first) ? SHIFT_REG_STD[0] : SHIFT_REG_STD[PACKET_SIZE-1];
	end
end







endmodule // i2s_vip_new