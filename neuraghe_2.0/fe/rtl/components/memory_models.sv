
module generic_memory
  #(
     parameter ADDR_WIDTH = 12
     )
   (
    input  logic 	          CLK,
    input  logic		  INITN,
    
    input  logic 		  CEN,
    input  logic [ADDR_WIDTH-1:0] A,
    input  logic 		  WEN,
    input  logic [31:0]           D,
    input  logic [3:0]	          BEN,
    
    output logic [31:0]	          Q
    );
   
   localparam 	NUM_WORDS = 2**ADDR_WIDTH;
   
   logic [31:0] 		  MEM [NUM_WORDS-1:0];
   logic [31:0] 		  M;
   genvar 			  i,j;
   
   generate
      for (i=0; i<4; i++)
	begin
	   for (j=0; j<8; j++)
	     begin
		assign M[i*8+j] = BEN[i];
	     end
	end
   endgenerate
   
   generate
      for (i=0; i < 32 ; i++) 
	begin
	   always @ (posedge CLK)
	     begin
		if ( INITN == 1'b1 )
		  begin 
		     if ( CEN == 1'b0 )
		       begin
			  if ( WEN == 1'b0 )
			    begin
			       if ( M[i] == 1'b0 )
				 begin
				    MEM[A][i] <= D[i];
				 end
			    end
			  else if(WEN == 1'b1) 
			    begin
			       Q[i] <= MEM[A][i];
			    end
		       end
		  end
	     end
	end
   endgenerate
   
endmodule
