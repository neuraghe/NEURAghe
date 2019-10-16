module ID_Gen_16
#(
  parameter ID_WIDTH_IN   = 8,
  parameter ID_WIDTH_OUT  = 4
)
(

  input   logic					clk,
  input   logic					rst_n,
  
  

  input   logic					incr_i,
  output  logic					full_o,
  input   logic [ID_WIDTH_IN-1:0]		ID_i,
  output  logic [ID_WIDTH_OUT-1:0]		ID_o,
  

  
  input   logic					release_ID_i,
  input   logic [ID_WIDTH_OUT-1:0]		BID_i,
  output  logic [ID_WIDTH_IN-1:0]		BID_o,
  output  logic					empty_o
);

integer i;




logic [15:0]				VALID_TABLE;
logic [ID_WIDTH_IN-1:0]			ID_TABLE [15:0];

logic					valid_ID_o;
logic [3:0]				ID_int;

generate

  if(ID_WIDTH_OUT == 4)
	assign ID_o = ID_int;
  else
	assign ID_o = {{(ID_WIDTH_OUT-4){1'b0}},ID_int};
	
endgenerate

assign full_o  = ~valid_ID_o;
assign empty_o = ~(|VALID_TABLE);

assign BID_o = ID_TABLE[BID_i[3:0]];


always_ff @(posedge clk, negedge rst_n)
begin
  if(rst_n == 1'b0)
  begin
    for(i=0; i<16; i++)
    begin
      VALID_TABLE[i] <= 1'b0;
      ID_TABLE[i]    <= '0;
    end
  end
  else
    begin
    
	  if(release_ID_i)
	    VALID_TABLE[BID_i[3:0]] <= 1'b0;
	  else;
    
    
    
    

	  casex(VALID_TABLE)
	  
	  16'bxxxx_xxxx_xxxx_xxx0 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[0] <= 1'b1;
		      ID_TABLE[0]    <= ID_i;
		    end
	  end
	  
	  16'bxxxx_xxxx_xxxx_xx01 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[1]<= 1'b1;
		      ID_TABLE[1]    <= ID_i;
		    end
	  end	  
	  
	  16'bxxxx_xxxx_xxxx_x011 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[2]<= 1'b1;
		      ID_TABLE[2]    <= ID_i;
		    end
	  end	  
	  
	  16'bxxxx_xxxx_xxxx_0111 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[3] <= 1'b1;
		      ID_TABLE[3]    <= ID_i;
		    end
	  end
	  

	  16'bxxxx_xxxx_xxx0_1111 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[4] <= 1'b1;
		      ID_TABLE[4]    <= ID_i;
		    end
	  end
	  
	  16'bxxxx_xxxx_xx01_1111 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[5] <= 1'b1;
		      ID_TABLE[5]    <= ID_i;
		    end
	  end	  
	  
	  16'bxxxx_xxxx_x011_1111 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[6] <= 1'b1;
		      ID_TABLE[6]    <= ID_i;
		    end
	  end	  
	  
	  16'bxxxx_xxxx_0111_1111 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[7] <= 1'b1;
		      ID_TABLE[7]    <= ID_i;
		    end
	  end	  
	  

	  
	  16'bxxxx_xxx0_1111_1111 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[8] <= 1'b1;
		      ID_TABLE[8]    <= ID_i;
		    end
	  end
	  
	  16'bxxxx_xx01_1111_1111 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[9] <= 1'b1;
		      ID_TABLE[9]    <= ID_i;
		    end
	  end	  
	  
	  16'bxxxx_x011_1111_1111 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[10] <= 1'b1;
		      ID_TABLE[10]    <= ID_i;
		    end
	  end	  
	  
	  16'bxxxx_0111_1111_1111 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[11] <= 1'b1;
		      ID_TABLE[11]    <= ID_i;
		    end
	  end	  	  
	  
	  
	  16'bxxx0_1111_1111_1111 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[12] <= 1'b1;
		      ID_TABLE[12]    <= ID_i;
		    end
	  end
	  
	  16'bxx01_1111_1111_1111 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[13] <= 1'b1;
		      ID_TABLE[13]    <= ID_i;
		    end
	  end	  
	  
	  16'bx011_1111_1111_1111 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[14] <= 1'b1;
		      ID_TABLE[14]    <= ID_i;
		    end
	  end	  
	  
	  16'b0111_1111_1111_1111 : 
	  begin
		    if(incr_i)
		    begin
		      VALID_TABLE[15] <= 1'b1;
		      ID_TABLE[15]    <= ID_i;
		    end
	  end
	  
	  

	  endcase

    end
end


always_comb
begin
	  casex(VALID_TABLE)

	  
	  
	  16'bxxxx_xxxx_xxxx_xxx0 : 
	  begin
		    ID_int            = 0;
		    valid_ID_o        = 1'b1;
	  end
	  
	  16'bxxxx_xxxx_xxxx_xx01 : 
	  begin
		    ID_int            = 1;
		    valid_ID_o      = 1'b1;
	  end	  
	  
	  16'bxxxx_xxxx_xxxx_x011 : 
	  begin
		    ID_int            = 2;
		    valid_ID_o      = 1'b1;
	  end	  
	  
	  16'bxxxx_xxxx_xxxx_0111 : 
	  begin
		    ID_int            = 3;
		    valid_ID_o      = 1'b1;
	  end
	  

	  16'bxxxx_xxxx_xxx0_1111 : 
	  begin
		    ID_int            = 4;
		    valid_ID_o      = 1'b1;
	  end
	  
	  16'bxxxx_xxxx_xx01_1111 : 
	  begin
		    ID_int            = 5;
		    valid_ID_o      = 1'b1;
	  end	  
	  
	  16'bxxxx_xxxx_x011_1111 : 
	  begin
		    ID_int            = 6;
		    valid_ID_o      = 1'b1;
	  end	  
	  
	  16'bxxxx_xxxx_0111_1111 : 
	  begin
		    ID_int            = 7;
		    valid_ID_o      = 1'b1;
	  end	  
	  

	  
	  16'bxxxx_xxx0_1111_1111 : 
	  begin
		    ID_int            = 8;
		    valid_ID_o      = 1'b1;
	  end
	  
	  16'bxxxx_xx01_1111_1111 : 
	  begin
		    ID_int            = 9;
		    valid_ID_o      = 1'b1;
	  end	  
	  
	  16'bxxxx_x011_1111_1111 : 
	  begin
		    ID_int            = 10;
		    valid_ID_o      = 1'b1;
	  end	  
	  
	  16'bxxxx_0111_1111_1111 : 
	  begin
		    ID_int            = 11;
		    valid_ID_o      = 1'b1;
	  end	  	  
	  
	  
	  16'bxxx0_1111_1111_1111 : 
	  begin
		    ID_int            = 12;
		    valid_ID_o      = 1'b1;
	  end
	  
	  16'bxx01_1111_1111_1111 : 
	  begin
		    ID_int            = 13;
		    valid_ID_o      = 1'b1;
	  end	  
	  
	  16'bx011_1111_1111_1111 : 
	  begin
		    ID_int            = 14;
		    valid_ID_o      = 1'b1;
	  end	  
	  
	  16'b0111_1111_1111_1111 : 
	  begin
		    ID_int            = 15;
		    valid_ID_o      = 1'b1;
	  end
	  
	  
	  16'b1111_1111_1111_1111 : 
	  begin
		    ID_int            = 'X;
		    valid_ID_o      = 1'b0;
	  end

	  default : 
	  begin
		    ID_int            = 'X;
		    valid_ID_o      = 1'b0;
	  end
	  endcase
end




endmodule