module ibus_lint_memory
#(
    parameter addr_width = 16,
    parameter INIT_MEM_FILE = "slm_files/l2_stim.slm"
)
(
    input  logic				clk,
    input  logic				rst_n,
    
    // Interface to Instruction Logaritmic interconnect
    input  logic				lint_req_i,
    output logic				lint_grant_o,
    input  logic [addr_width-1:0]		lint_addr_i,
    
    output logic [31:0]				lint_r_rdata_o,
    output logic				lint_r_valid_o
);

    localparam 				numwords = 2**addr_width;
    integer				i;
    logic [31:0] 			ARRAY [numwords];
    logic				r_valid;
    logic [31:0]			r_rdata;
    logic				lint_grant_int;
    
    
    

    assign lint_grant_o = 1'b1; //lint_grant_int & lint_req_i;

    always_ff @(posedge clk, negedge rst_n)
    begin
	if(rst_n == 1'b0)
	begin    
	  lint_grant_int <= 1'b0;
	end
	else
	begin
	  lint_grant_int <= $random() % 2;
	end
    end

    

   
    always_ff @(posedge clk, negedge rst_n)
    begin
      if(rst_n == 1'b0)
      begin
	r_valid <= 1'b0;
	r_rdata <= '0;
      end
      else
      begin
	if(lint_req_i & lint_grant_o)
	begin
	    r_valid <= 1'b1;
	    r_rdata <= ARRAY [lint_addr_i];
	end
 	else
 	begin
 	    r_valid <= 1'b0;
 	    //r_rdata <= 'X;
 	end
      end
    end

    assign lint_r_valid_o = r_valid;
    assign lint_r_rdata_o = r_rdata;

   
   //PIPE
//    always_ff @(posedge clk, negedge rst_n)
//    begin
//       if(rst_n == 1'b0)
//       begin
// 	lint_r_valid_o <= 1'b0;
// 	lint_r_rdata_o <= '0;
//       end   
//       else
//       begin
// 	lint_r_valid_o <= r_valid;
// 	lint_r_rdata_o <= r_rdata;
//       end
//    end


    initial
    begin
      
      for(i = 0; i< numwords; i++)
      begin
	ARRAY[i] = 0;
      end
      $readmemh(INIT_MEM_FILE, ARRAY);
    end

endmodule