module ID_Gen_64
#(
  parameter ID_WIDTH_IN   = 8,
  parameter ID_WIDTH_OUT  = 6
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




logic [63:0]				VALID_TABLE;
logic [ID_WIDTH_IN-1:0]			ID_TABLE [63:0];

logic					valid_ID_o;
logic [5:0]				ID_int;

generate

  if(ID_WIDTH_OUT == 6)
	assign ID_o = ID_int;
  else
	assign ID_o = {{(ID_WIDTH_OUT-6){1'b0}},ID_int};
	
endgenerate

assign full_o  = ~valid_ID_o;
assign empty_o = ~(|VALID_TABLE);

assign BID_o = ID_TABLE[BID_i[5:0]];


always_ff @(posedge clk, negedge rst_n)
begin
  if(rst_n == 1'b0)
  begin
    for(i=0; i<64; i++)
    begin
      VALID_TABLE[i] <= 1'b0;
      ID_TABLE[i]    <= '0;
    end
  end
  else
    begin
    
	  if(release_ID_i)
	    VALID_TABLE[BID_i[5:0]] <= 1'b0;
	  else;
    
    
    
    

	  casex(VALID_TABLE)
	  
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[0] <= 1'b1;
		      ID_TABLE[0]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[1] <= 1'b1;
		      ID_TABLE[1]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[2] <= 1'b1;
		      ID_TABLE[2]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[3] <= 1'b1;
		      ID_TABLE[3]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[4] <= 1'b1;
		      ID_TABLE[4]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[5] <= 1'b1;
		      ID_TABLE[5]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[6] <= 1'b1;
		      ID_TABLE[6]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[7] <= 1'b1;
		      ID_TABLE[7]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[8] <= 1'b1;
		      ID_TABLE[8]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[9] <= 1'b1;
		      ID_TABLE[9]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[10] <= 1'b1;
		      ID_TABLE[10]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[11] <= 1'b1;
		      ID_TABLE[11]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[12] <= 1'b1;
		      ID_TABLE[12]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[13] <= 1'b1;
		      ID_TABLE[13]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[14] <= 1'b1;
		      ID_TABLE[14]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[15] <= 1'b1;
		      ID_TABLE[15]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[16] <= 1'b1;
		      ID_TABLE[16]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[17] <= 1'b1;
		      ID_TABLE[17]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[18] <= 1'b1;
		      ID_TABLE[18]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[19] <= 1'b1;
		      ID_TABLE[19]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[20] <= 1'b1;
		      ID_TABLE[20]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[21] <= 1'b1;
		      ID_TABLE[21]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[22] <= 1'b1;
		      ID_TABLE[22]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[23] <= 1'b1;
		      ID_TABLE[23]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[24] <= 1'b1;
		      ID_TABLE[24]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[25] <= 1'b1;
		      ID_TABLE[25]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[26] <= 1'b1;
		      ID_TABLE[26]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[27] <= 1'b1;
		      ID_TABLE[27]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[28] <= 1'b1;
		      ID_TABLE[28]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[29] <= 1'b1;
		      ID_TABLE[29]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[30] <= 1'b1;
		      ID_TABLE[30]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[31] <= 1'b1;
		      ID_TABLE[31]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[32] <= 1'b1;
		      ID_TABLE[32]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[33] <= 1'b1;
		      ID_TABLE[33]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[34] <= 1'b1;
		      ID_TABLE[34]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[35] <= 1'b1;
		      ID_TABLE[35]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[36] <= 1'b1;
		      ID_TABLE[36]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[37] <= 1'b1;
		      ID_TABLE[37]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[38] <= 1'b1;
		      ID_TABLE[38]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[39] <= 1'b1;
		      ID_TABLE[39]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[40] <= 1'b1;
		      ID_TABLE[40]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[41] <= 1'b1;
		      ID_TABLE[41]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[42] <= 1'b1;
		      ID_TABLE[42]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxxx01111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[43] <= 1'b1;
		      ID_TABLE[43]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxxx011111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[44] <= 1'b1;
		      ID_TABLE[44]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxxx0111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[45] <= 1'b1;
		      ID_TABLE[45]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxxx01111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[46] <= 1'b1;
		      ID_TABLE[46]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxxx011111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[47] <= 1'b1;
		      ID_TABLE[47]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxxx0111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[48] <= 1'b1;
		      ID_TABLE[48]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxxx01111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[49] <= 1'b1;
		      ID_TABLE[49]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxxx011111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[50] <= 1'b1;
		      ID_TABLE[50]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxxx0111111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[51] <= 1'b1;
		      ID_TABLE[51]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxxx01111111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[52] <= 1'b1;
		      ID_TABLE[52]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxxx011111111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[53] <= 1'b1;
		      ID_TABLE[53]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxxx0111111111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[54] <= 1'b1;
		      ID_TABLE[54]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxxx01111111111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[55] <= 1'b1;
		      ID_TABLE[55]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxxx011111111111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[56] <= 1'b1;
		      ID_TABLE[56]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxxx0111111111111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[57] <= 1'b1;
		      ID_TABLE[57]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxxx01111111111111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[58] <= 1'b1;
		      ID_TABLE[58]    <= ID_i; 
		  end                       
		end
					      
		64'bxxxx011111111111111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[59] <= 1'b1;
		      ID_TABLE[59]    <= ID_i; 
		  end                       
		end
					      
		64'bxxx0111111111111111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[60] <= 1'b1;
		      ID_TABLE[60]    <= ID_i; 
		  end                       
		end
					      
		64'bxx01111111111111111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[61] <= 1'b1;
		      ID_TABLE[61]    <= ID_i; 
		  end                       
		end
					      
		64'bx011111111111111111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[62] <= 1'b1;
		      ID_TABLE[62]    <= ID_i; 
		  end                       
		end
					      
		64'b0111111111111111111111111111111111111111111111111111111111111111 :
		begin
		  if(incr_i)
		  begin
		      VALID_TABLE[63] <= 1'b1;
		      ID_TABLE[63]    <= ID_i; 
		  end                       
		end
	  
	  

	  endcase

    end
end


always_comb
begin
	  casex(VALID_TABLE)
	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0 :
	      begin
		ID_int        = 0;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01 :
	      begin
		ID_int        = 1;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011 :
	      begin
		ID_int        = 2;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111 :
	      begin
		ID_int        = 3;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111 :
	      begin
		ID_int        = 4;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111 :
	      begin
		ID_int        = 5;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111 :
	      begin
		ID_int        = 6;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111 :
	      begin
		ID_int        = 7;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111 :
	      begin
		ID_int        = 8;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111 :
	      begin
		ID_int        = 9;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111 :
	      begin
		ID_int        = 10;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111 :
	      begin
		ID_int        = 11;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111 :
	      begin
		ID_int        = 12;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111 :
	      begin
		ID_int        = 13;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111 :
	      begin
		ID_int        = 14;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111 :
	      begin
		ID_int        = 15;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111 :
	      begin
		ID_int        = 16;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111 :
	      begin
		ID_int        = 17;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111 :
	      begin
		ID_int        = 18;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111 :
	      begin
		ID_int        = 19;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111 :
	      begin
		ID_int        = 20;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111 :
	      begin
		ID_int        = 21;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111 :
	      begin
		ID_int        = 22;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111 :
	      begin
		ID_int        = 23;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111 :
	      begin
		ID_int        = 24;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111111 :
	      begin
		ID_int        = 25;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111111 :
	      begin
		ID_int        = 26;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111111 :
	      begin
		ID_int        = 27;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111111111 :
	      begin
		ID_int        = 28;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111111111 :
	      begin
		ID_int        = 29;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111111111 :
	      begin
		ID_int        = 30;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111111111111 :
	      begin
		ID_int        = 31;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111111111111 :
	      begin
		ID_int        = 32;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111111111111 :
	      begin
		ID_int        = 33;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111111111111111 :
	      begin
		ID_int        = 34;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111111111111111 :
	      begin
		ID_int        = 35;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111111111111111 :
	      begin
		ID_int        = 36;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111111111111111111 :
	      begin
		ID_int        = 37;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111111111111111111 :
	      begin
		ID_int        = 38;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111111111111111111 :
	      begin
		ID_int        = 39;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxxx01111111111111111111111111111111111111111 :
	      begin
		ID_int        = 40;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxxx011111111111111111111111111111111111111111 :
	      begin
		ID_int        = 41;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxxx0111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 42;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxxx01111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 43;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxxx011111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 44;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxxx0111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 45;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxxx01111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 46;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxxx011111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 47;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxxx0111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 48;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxxx01111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 49;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxxx011111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 50;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxxx0111111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 51;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxxx01111111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 52;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxxx011111111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 53;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxxx0111111111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 54;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxxx01111111111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 55;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxxx011111111111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 56;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxxx0111111111111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 57;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxxx01111111111111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 58;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxxx011111111111111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 59;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxxx0111111111111111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 60;
		valid_ID_o    = 1'b1; 
	      end

	      64'bxx01111111111111111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 61;
		valid_ID_o    = 1'b1; 
	      end

	      64'bx011111111111111111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 62;
		valid_ID_o    = 1'b1; 
	      end

	      64'b0111111111111111111111111111111111111111111111111111111111111111 :
	      begin
		ID_int        = 63;
		valid_ID_o    = 1'b1; 
	      end

	  
	      64'b1111111111111111111111111111111111111111111111111111111111111111 :
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