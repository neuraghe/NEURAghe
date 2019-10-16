`timescale 1ns/1ps

`celldefine
module AD42M2SA( CO, ICO, S, A, B, C, D, ICI);
input A, B, C, D, ICI;
output CO, ICO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AD42M2SA$func AD42M2SA_inst(.A(A),.B(B),.C(C),.CO(CO),.D(D),.ICI(ICI),.ICO(ICO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AD42M2SA$func AD42M2SA_inst(.A(A),.B(B),.C(C),.CO(CO),.D(D),.ICI(ICI),.ICO(ICO),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

        ifnone
	// arc posedge A --> (CO:A)
	 (posedge A => (CO:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (CO:A)
	 (negedge A => (CO:A)) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

        ifnone
	// arc posedge B --> (CO:B)
	 (posedge B => (CO:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (CO:B)
	 (negedge B => (CO:B)) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0 && ICI===1'b1)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1 && ICI===1'b0)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0 && ICI===1'b1)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1 && ICI===1'b0)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

        ifnone
	// arc posedge C --> (CO:C)
	 (posedge C => (CO:C)) = (1.0,1.0);

        ifnone
	// arc negedge C --> (CO:C)
	 (negedge C => (CO:C)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0 && ICI===1'b1)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1 && ICI===1'b0)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0 && ICI===1'b1)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1 && ICI===1'b0)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && ICI===1'b1)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && ICI===1'b0)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && ICI===1'b0)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && ICI===1'b1)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && ICI===1'b0)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && ICI===1'b1)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && ICI===1'b1)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && ICI===1'b0)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	ifnone
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	ifnone
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b0)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b1)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b0)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b1)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	ifnone
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b0)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b1)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b0)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b1)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	ifnone
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0 && ICI===1'b0)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0 && ICI===1'b1)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1 && ICI===1'b0)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1 && ICI===1'b1)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0 && ICI===1'b0)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0 && ICI===1'b1)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1 && ICI===1'b0)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1 && ICI===1'b1)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	ifnone
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b0 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

        ifnone
	// arc posedge C --> (S:C)
	 (posedge C => (S:C)) = (1.0,1.0);

        ifnone
	// arc negedge C --> (S:C)
	 (negedge C => (S:C)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

        ifnone
	// arc posedge D --> (S:D)
	 (posedge D => (S:D)) = (1.0,1.0);

        ifnone
	// arc negedge D --> (S:D)
	 (negedge D => (S:D)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

        ifnone
	// arc posedge ICI --> (S:ICI)
	 (posedge ICI => (S:ICI)) = (1.0,1.0);

        ifnone
	// arc negedge ICI --> (S:ICI)
	 (negedge ICI => (S:ICI)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AD42M4SA( CO, ICO, S, A, B, C, D, ICI);
input A, B, C, D, ICI;
output CO, ICO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AD42M4SA$func AD42M4SA_inst(.A(A),.B(B),.C(C),.CO(CO),.D(D),.ICI(ICI),.ICO(ICO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AD42M4SA$func AD42M4SA_inst(.A(A),.B(B),.C(C),.CO(CO),.D(D),.ICI(ICI),.ICO(ICO),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

        ifnone
	// arc posedge A --> (CO:A)
	 (posedge A => (CO:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (CO:A)
	 (negedge A => (CO:A)) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

        ifnone
	// arc posedge B --> (CO:B)
	 (posedge B => (CO:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (CO:B)
	 (negedge B => (CO:B)) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0 && ICI===1'b1)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1 && ICI===1'b0)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0 && ICI===1'b1)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1 && ICI===1'b0)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

        ifnone
	// arc posedge C --> (CO:C)
	 (posedge C => (CO:C)) = (1.0,1.0);

        ifnone
	// arc negedge C --> (CO:C)
	 (negedge C => (CO:C)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0 && ICI===1'b1)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1 && ICI===1'b0)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0 && ICI===1'b1)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1 && ICI===1'b0)
	// arc C --> CO
	 (C => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && ICI===1'b1)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && ICI===1'b0)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && ICI===1'b0)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && ICI===1'b1)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && ICI===1'b0)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && ICI===1'b1)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && ICI===1'b1)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && ICI===1'b0)
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	ifnone
	// arc D --> CO
	 (D => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0)
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	ifnone
	// arc ICI --> CO
	 (ICI => CO) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b0)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b1)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b0)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b1)
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	ifnone
	// arc A --> ICO
	 (A => ICO) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b0)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b1)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b0)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b1)
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	ifnone
	// arc B --> ICO
	 (B => ICO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0 && ICI===1'b0)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0 && ICI===1'b1)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1 && ICI===1'b0)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1 && ICI===1'b1)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0 && ICI===1'b0)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0 && ICI===1'b1)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1 && ICI===1'b0)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1 && ICI===1'b1)
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	ifnone
	// arc C --> ICO
	 (C => ICO) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b0 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0 && ICI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1 && ICI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0 && ICI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1 && ICI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

        ifnone
	// arc posedge C --> (S:C)
	 (posedge C => (S:C)) = (1.0,1.0);

        ifnone
	// arc negedge C --> (S:C)
	 (negedge C => (S:C)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0 && ICI===1'b0)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1 && ICI===1'b1)
	// arc C --> S
	 (C => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

        ifnone
	// arc posedge D --> (S:D)
	 (posedge D => (S:D)) = (1.0,1.0);

        ifnone
	// arc negedge D --> (S:D)
	 (negedge D => (S:D)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && ICI===1'b0)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && ICI===1'b1)
	// arc D --> S
	 (D => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

        ifnone
	// arc posedge ICI --> (S:ICI)
	 (posedge ICI => (S:ICI)) = (1.0,1.0);

        ifnone
	// arc negedge ICI --> (S:ICI)
	 (negedge ICI => (S:ICI)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b1)
	// arc ICI --> S
	 (ICI => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADCSCM2S( CO0, CO1, A, B, NCI0, NCI1);
input A, B, NCI0, NCI1;
output CO0, CO1;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADCSCM2S$func ADCSCM2S_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.NCI0(NCI0),.NCI1(NCI1));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADCSCM2S$func ADCSCM2S_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.NCI0(NCI0),.NCI1(NCI1));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	ifnone
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(A===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	ifnone
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI1===1'b0)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI1===1'b1)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI1===1'b0)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI1===1'b1)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	ifnone
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(B===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	ifnone
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(A===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	ifnone
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI0===1'b0)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI0===1'b1)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI0===1'b0)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI0===1'b1)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	ifnone
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADCSCM4S( CO0, CO1, A, B, NCI0, NCI1);
input A, B, NCI0, NCI1;
output CO0, CO1;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADCSCM4S$func ADCSCM4S_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.NCI0(NCI0),.NCI1(NCI1));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADCSCM4S$func ADCSCM4S_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.NCI0(NCI0),.NCI1(NCI1));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	ifnone
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(A===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	ifnone
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI1===1'b0)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI1===1'b1)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI1===1'b0)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI1===1'b1)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	ifnone
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(B===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	ifnone
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(A===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	ifnone
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI0===1'b0)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI0===1'b1)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI0===1'b0)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI0===1'b1)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	ifnone
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADCSIOM2S( CO0B, CO1B, A, B);
input A, B;
output CO0B, CO1B;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADCSIOM2S$func ADCSIOM2S_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADCSIOM2S$func ADCSIOM2S_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADCSIOM4S( CO0B, CO1B, A, B);
input A, B;
output CO0B, CO1B;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADCSIOM4S$func ADCSIOM4S_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADCSIOM4S$func ADCSIOM4S_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADCSOM2S( CO0B, CO1B, A, B, CI0, CI1);
input A, B, CI0, CI1;
output CO0B, CO1B;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADCSOM2S$func ADCSOM2S_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADCSOM2S$func ADCSOM2S_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CI0===1'b1 && CI1===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	ifnone
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	ifnone
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b0)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b1)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b0)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b1)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	ifnone
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	ifnone
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	ifnone
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b0)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b1)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b0)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b1)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	ifnone
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADCSOM4S( CO0B, CO1B, A, B, CI0, CI1);
input A, B, CI0, CI1;
output CO0B, CO1B;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADCSOM4S$func ADCSOM4S_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADCSOM4S$func ADCSOM4S_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CI0===1'b1 && CI1===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	ifnone
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	ifnone
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b0)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b1)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b0)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b1)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	ifnone
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	ifnone
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	ifnone
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b0)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b1)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b0)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b1)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	ifnone
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFCGCM2SA( CO, A, B, NCI);
input A, B, NCI;
output CO;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCGCM2SA$func ADFCGCM2SA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCGCM2SA$func ADFCGCM2SA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && NCI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && NCI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	ifnone
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(A===1'b0 && NCI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && NCI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	ifnone
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	ifnone
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFCGCM4SA( CO, A, B, NCI);
input A, B, NCI;
output CO;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCGCM4SA$func ADFCGCM4SA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCGCM4SA$func ADFCGCM4SA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && NCI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && NCI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	ifnone
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(A===1'b0 && NCI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && NCI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	ifnone
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	ifnone
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFCGOM2SA( COB, A, B, CI);
input A, B, CI;
output COB;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCGOM2SA$func ADFCGOM2SA_inst(.A(A),.B(B),.CI(CI),.COB(COB));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCGOM2SA$func ADFCGOM2SA_inst(.A(A),.B(B),.CI(CI),.COB(COB));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CI===1'b1)
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	ifnone
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> COB
	 (B => COB) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> COB
	 (B => COB) = (1.0,1.0);

	ifnone
	// arc B --> COB
	 (B => COB) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	ifnone
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFCGOM4SA( COB, A, B, CI);
input A, B, CI;
output COB;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCGOM4SA$func ADFCGOM4SA_inst(.A(A),.B(B),.CI(CI),.COB(COB));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCGOM4SA$func ADFCGOM4SA_inst(.A(A),.B(B),.CI(CI),.COB(COB));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CI===1'b1)
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	ifnone
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> COB
	 (B => COB) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> COB
	 (B => COB) = (1.0,1.0);

	ifnone
	// arc B --> COB
	 (B => COB) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	ifnone
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFCM2SA( CO, S, A, B, NCI);
input A, B, NCI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCM2SA$func ADFCM2SA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCM2SA$func ADFCM2SA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && NCI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && NCI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	ifnone
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(A===1'b0 && NCI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && NCI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	ifnone
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	ifnone
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	if(B===1'b0 && NCI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && NCI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && NCI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && NCI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && NCI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && NCI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && NCI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && NCI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0)
	// arc NCI --> S
	 (NCI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1)
	// arc NCI --> S
	 (NCI => S) = (1.0,1.0);

        ifnone
	// arc posedge NCI --> (S:NCI)
	 (posedge NCI => (S:NCI)) = (1.0,1.0);

        ifnone
	// arc negedge NCI --> (S:NCI)
	 (negedge NCI => (S:NCI)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc NCI --> S
	 (NCI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc NCI --> S
	 (NCI => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFCM4SA( CO, S, A, B, NCI);
input A, B, NCI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCM4SA$func ADFCM4SA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCM4SA$func ADFCM4SA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && NCI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && NCI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	ifnone
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(A===1'b0 && NCI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && NCI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	ifnone
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	ifnone
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	if(B===1'b0 && NCI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && NCI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && NCI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && NCI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && NCI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && NCI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && NCI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && NCI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0)
	// arc NCI --> S
	 (NCI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1)
	// arc NCI --> S
	 (NCI => S) = (1.0,1.0);

        ifnone
	// arc posedge NCI --> (S:NCI)
	 (posedge NCI => (S:NCI)) = (1.0,1.0);

        ifnone
	// arc negedge NCI --> (S:NCI)
	 (negedge NCI => (S:NCI)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc NCI --> S
	 (NCI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc NCI --> S
	 (NCI => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFCSCM2SA( CO0, CO1, S, A, B, CS, NCI0, NCI1);
input A, B, CS, NCI0, NCI1;
output CO0, CO1, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCSCM2SA$func ADFCSCM2SA_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.CS(CS),.NCI0(NCI0),.NCI1(NCI1),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCSCM2SA$func ADFCSCM2SA_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.CS(CS),.NCI0(NCI0),.NCI1(NCI1),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	ifnone
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	ifnone
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b0 && NCI1===1'b0)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b0 && NCI1===1'b1)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b1 && NCI1===1'b0)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b1 && NCI1===1'b1)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b0 && NCI1===1'b0)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b0 && NCI1===1'b1)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b1 && NCI1===1'b0)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b1 && NCI1===1'b1)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	ifnone
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	ifnone
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	ifnone
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b0 && NCI0===1'b0)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b0 && NCI0===1'b1)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b1 && NCI0===1'b0)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b1 && NCI0===1'b1)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b0 && NCI0===1'b0)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b0 && NCI0===1'b1)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b1 && NCI0===1'b0)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b1 && NCI0===1'b1)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	ifnone
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

        ifnone
	// arc posedge CS --> (S:CS)
	 (posedge CS => (S:CS)) = (1.0,1.0);

        ifnone
	// arc negedge CS --> (S:CS)
	 (negedge CS => (S:CS)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && NCI1===1'b0)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && NCI1===1'b1)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && NCI1===1'b0)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && NCI1===1'b1)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

        ifnone
	// arc posedge NCI0 --> (S:NCI0)
	 (posedge NCI0 => (S:NCI0)) = (1.0,1.0);

        ifnone
	// arc negedge NCI0 --> (S:NCI0)
	 (negedge NCI0 => (S:NCI0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI1===1'b0)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI1===1'b1)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI1===1'b0)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI1===1'b1)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && NCI0===1'b0)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && NCI0===1'b1)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && NCI0===1'b0)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && NCI0===1'b1)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

        ifnone
	// arc posedge NCI1 --> (S:NCI1)
	 (posedge NCI1 => (S:NCI1)) = (1.0,1.0);

        ifnone
	// arc negedge NCI1 --> (S:NCI1)
	 (negedge NCI1 => (S:NCI1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI0===1'b0)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI0===1'b1)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI0===1'b0)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI0===1'b1)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFCSCM4SA( CO0, CO1, S, A, B, CS, NCI0, NCI1);
input A, B, CS, NCI0, NCI1;
output CO0, CO1, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCSCM4SA$func ADFCSCM4SA_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.CS(CS),.NCI0(NCI0),.NCI1(NCI1),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCSCM4SA$func ADFCSCM4SA_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.CS(CS),.NCI0(NCI0),.NCI1(NCI1),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	ifnone
	// arc A --> CO0
	 (A => CO0) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	ifnone
	// arc B --> CO0
	 (B => CO0) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b0 && NCI1===1'b0)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b0 && NCI1===1'b1)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b1 && NCI1===1'b0)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b1 && NCI1===1'b1)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b0 && NCI1===1'b0)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b0 && NCI1===1'b1)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b1 && NCI1===1'b0)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b1 && NCI1===1'b1)
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	ifnone
	// arc NCI0 --> CO0
	 (NCI0 => CO0) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	ifnone
	// arc A --> CO1
	 (A => CO1) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	ifnone
	// arc B --> CO1
	 (B => CO1) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b0 && NCI0===1'b0)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b0 && NCI0===1'b1)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b1 && NCI0===1'b0)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CS===1'b1 && NCI0===1'b1)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b0 && NCI0===1'b0)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b0 && NCI0===1'b1)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b1 && NCI0===1'b0)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CS===1'b1 && NCI0===1'b1)
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	ifnone
	// arc NCI1 --> CO1
	 (NCI1 => CO1) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b0 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

        ifnone
	// arc posedge CS --> (S:CS)
	 (posedge CS => (S:CS)) = (1.0,1.0);

        ifnone
	// arc negedge CS --> (S:CS)
	 (negedge CS => (S:CS)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && NCI0===1'b1 && NCI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI0===1'b0 && NCI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI0===1'b0 && NCI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && NCI0===1'b1 && NCI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && NCI1===1'b0)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && NCI1===1'b1)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && NCI1===1'b0)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && NCI1===1'b1)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

        ifnone
	// arc posedge NCI0 --> (S:NCI0)
	 (posedge NCI0 => (S:NCI0)) = (1.0,1.0);

        ifnone
	// arc negedge NCI0 --> (S:NCI0)
	 (negedge NCI0 => (S:NCI0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI1===1'b0)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI1===1'b1)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI1===1'b0)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI1===1'b1)
	// arc NCI0 --> S
	 (NCI0 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && NCI0===1'b0)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && NCI0===1'b1)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && NCI0===1'b0)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && NCI0===1'b1)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

        ifnone
	// arc posedge NCI1 --> (S:NCI1)
	 (posedge NCI1 => (S:NCI1)) = (1.0,1.0);

        ifnone
	// arc negedge NCI1 --> (S:NCI1)
	 (negedge NCI1 => (S:NCI1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI0===1'b0)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && NCI0===1'b1)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI0===1'b0)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && NCI0===1'b1)
	// arc NCI1 --> S
	 (NCI1 => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFCSIOM2S( CO0B, CO1B, S, A, B, CS);
input A, B, CS;
output CO0B, CO1B, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCSIOM2S$func ADFCSIOM2S_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCSIOM2S$func ADFCSIOM2S_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(CS===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(CS===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	ifnone
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(CS===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(CS===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	ifnone
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(CS===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(CS===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	ifnone
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(CS===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(CS===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	ifnone
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

        ifnone
	// arc posedge CS --> (S:CS)
	 (posedge CS => (S:CS)) = (1.0,1.0);

        ifnone
	// arc negedge CS --> (S:CS)
	 (negedge CS => (S:CS)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFCSIOM4S( CO0B, CO1B, S, A, B, CS);
input A, B, CS;
output CO0B, CO1B, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCSIOM4S$func ADFCSIOM4S_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCSIOM4S$func ADFCSIOM4S_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(CS===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(CS===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	ifnone
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(CS===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(CS===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	ifnone
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(CS===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(CS===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	ifnone
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(CS===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(CS===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	ifnone
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(B===1'b0 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

        ifnone
	// arc posedge CS --> (S:CS)
	 (posedge CS => (S:CS)) = (1.0,1.0);

        ifnone
	// arc negedge CS --> (S:CS)
	 (negedge CS => (S:CS)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFCSOM2SA( CO0B, CO1B, S, A, B, CI0, CI1, CS);
input A, B, CI0, CI1, CS;
output CO0B, CO1B, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCSOM2SA$func ADFCSOM2SA_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCSOM2SA$func ADFCSOM2SA_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	ifnone
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	ifnone
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	ifnone
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	ifnone
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	ifnone
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b0 && CS===1'b0)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b0 && CS===1'b1)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b1 && CS===1'b0)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b1 && CS===1'b1)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b0 && CS===1'b0)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b0 && CS===1'b1)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b1 && CS===1'b0)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b1 && CS===1'b1)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	ifnone
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b0)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b1)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b0)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b1)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

        ifnone
	// arc posedge CI0 --> (S:CI0)
	 (posedge CI0 => (S:CI0)) = (1.0,1.0);

        ifnone
	// arc negedge CI0 --> (S:CI0)
	 (negedge CI0 => (S:CI0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && CI1===1'b0)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && CI1===1'b1)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && CI1===1'b0)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && CI1===1'b1)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b0)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b1)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b0)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b1)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

        ifnone
	// arc posedge CI1 --> (S:CI1)
	 (posedge CI1 => (S:CI1)) = (1.0,1.0);

        ifnone
	// arc negedge CI1 --> (S:CI1)
	 (negedge CI1 => (S:CI1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && CI0===1'b0)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && CI0===1'b1)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && CI0===1'b0)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && CI0===1'b1)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && CI0===1'b1 && CI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b0 && CI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b0 && CI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && CI0===1'b1 && CI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

        ifnone
	// arc posedge CS --> (S:CS)
	 (posedge CS => (S:CS)) = (1.0,1.0);

        ifnone
	// arc negedge CS --> (S:CS)
	 (negedge CS => (S:CS)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && CI0===1'b0 && CI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b1 && CI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b1 && CI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && CI0===1'b0 && CI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFCSOM4SA( CO0B, CO1B, S, A, B, CI0, CI1, CS);
input A, B, CI0, CI1, CS;
output CO0B, CO1B, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCSOM4SA$func ADFCSOM4SA_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCSOM4SA$func ADFCSOM4SA_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	ifnone
	// arc A --> CO0B
	 (A => CO0B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	ifnone
	// arc B --> CO0B
	 (B => CO0B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	ifnone
	// arc CI0 --> CO0B
	 (CI0 => CO0B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	ifnone
	// arc A --> CO1B
	 (A => CO1B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	ifnone
	// arc B --> CO1B
	 (B => CO1B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b0 && CS===1'b0)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b0 && CS===1'b1)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b1 && CS===1'b0)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b1 && CS===1'b1)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b0 && CS===1'b0)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b0 && CS===1'b1)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b1 && CS===1'b0)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b1 && CS===1'b1)
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	ifnone
	// arc CI1 --> CO1B
	 (CI1 => CO1B) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b0 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b0 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b0 && CI1===1'b1 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && CI0===1'b1 && CI1===1'b0 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b0 && CI1===1'b1 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b0 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b1 && CS===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI0===1'b1 && CI1===1'b1 && CS===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b0)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI1===1'b1)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b0)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI1===1'b1)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

        ifnone
	// arc posedge CI0 --> (S:CI0)
	 (posedge CI0 => (S:CI0)) = (1.0,1.0);

        ifnone
	// arc negedge CI0 --> (S:CI0)
	 (negedge CI0 => (S:CI0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && CI1===1'b0)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && CI1===1'b1)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && CI1===1'b0)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && CI1===1'b1)
	// arc CI0 --> S
	 (CI0 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b0)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b1)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b0)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b1)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

        ifnone
	// arc posedge CI1 --> (S:CI1)
	 (posedge CI1 => (S:CI1)) = (1.0,1.0);

        ifnone
	// arc negedge CI1 --> (S:CI1)
	 (negedge CI1 => (S:CI1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && CI0===1'b0)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && CI0===1'b1)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && CI0===1'b0)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && CI0===1'b1)
	// arc CI1 --> S
	 (CI1 => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && CI0===1'b1 && CI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b0 && CI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b0 && CI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && CI0===1'b1 && CI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

        ifnone
	// arc posedge CS --> (S:CS)
	 (posedge CS => (S:CS)) = (1.0,1.0);

        ifnone
	// arc negedge CS --> (S:CS)
	 (negedge CS => (S:CS)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && CI0===1'b0 && CI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && CI0===1'b1 && CI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && CI0===1'b1 && CI1===1'b0)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && CI0===1'b0 && CI1===1'b1)
	// arc CS --> S
	 (CS => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFM0SA( CO, S, A, B, CI);
input A, B, CI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFM0SA$func ADFM0SA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFM0SA$func ADFM0SA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	ifnone
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	ifnone
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> CO
	 (CI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> CO
	 (CI => CO) = (1.0,1.0);

	ifnone
	// arc CI --> CO
	 (CI => CO) = (1.0,1.0);

	if(B===1'b0 && CI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && CI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && CI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

        ifnone
	// arc posedge CI --> (S:CI)
	 (posedge CI => (S:CI)) = (1.0,1.0);

        ifnone
	// arc negedge CI --> (S:CI)
	 (negedge CI => (S:CI)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFM1SA( CO, S, A, B, CI);
input A, B, CI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFM1SA$func ADFM1SA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFM1SA$func ADFM1SA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	ifnone
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	ifnone
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> CO
	 (CI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> CO
	 (CI => CO) = (1.0,1.0);

	ifnone
	// arc CI --> CO
	 (CI => CO) = (1.0,1.0);

	if(B===1'b0 && CI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && CI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && CI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

        ifnone
	// arc posedge CI --> (S:CI)
	 (posedge CI => (S:CI)) = (1.0,1.0);

        ifnone
	// arc negedge CI --> (S:CI)
	 (negedge CI => (S:CI)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFM2SA( CO, S, A, B, CI);
input A, B, CI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFM2SA$func ADFM2SA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFM2SA$func ADFM2SA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	ifnone
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	ifnone
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> CO
	 (CI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> CO
	 (CI => CO) = (1.0,1.0);

	ifnone
	// arc CI --> CO
	 (CI => CO) = (1.0,1.0);

	if(B===1'b0 && CI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && CI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && CI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

        ifnone
	// arc posedge CI --> (S:CI)
	 (posedge CI => (S:CI)) = (1.0,1.0);

        ifnone
	// arc negedge CI --> (S:CI)
	 (negedge CI => (S:CI)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFM4SA( CO, S, A, B, CI);
input A, B, CI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFM4SA$func ADFM4SA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFM4SA$func ADFM4SA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CI===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	ifnone
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	ifnone
	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> CO
	 (CI => CO) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> CO
	 (CI => CO) = (1.0,1.0);

	ifnone
	// arc CI --> CO
	 (CI => CO) = (1.0,1.0);

	if(B===1'b0 && CI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && CI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && CI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

        ifnone
	// arc posedge CI --> (S:CI)
	 (posedge CI => (S:CI)) = (1.0,1.0);

        ifnone
	// arc negedge CI --> (S:CI)
	 (negedge CI => (S:CI)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFOM2SA( COB, S, A, B, CI);
input A, B, CI;
output COB, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFOM2SA$func ADFOM2SA_inst(.A(A),.B(B),.CI(CI),.COB(COB),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFOM2SA$func ADFOM2SA_inst(.A(A),.B(B),.CI(CI),.COB(COB),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CI===1'b1)
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	ifnone
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> COB
	 (B => COB) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> COB
	 (B => COB) = (1.0,1.0);

	ifnone
	// arc B --> COB
	 (B => COB) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	ifnone
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	if(B===1'b0 && CI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && CI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && CI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

        ifnone
	// arc posedge CI --> (S:CI)
	 (posedge CI => (S:CI)) = (1.0,1.0);

        ifnone
	// arc negedge CI --> (S:CI)
	 (negedge CI => (S:CI)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADFOM4SA( COB, S, A, B, CI);
input A, B, CI;
output COB, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFOM4SA$func ADFOM4SA_inst(.A(A),.B(B),.CI(CI),.COB(COB),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFOM4SA$func ADFOM4SA_inst(.A(A),.B(B),.CI(CI),.COB(COB),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && CI===1'b1)
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	ifnone
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> COB
	 (B => COB) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> COB
	 (B => COB) = (1.0,1.0);

	ifnone
	// arc B --> COB
	 (B => COB) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	ifnone
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	if(B===1'b0 && CI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(B===1'b0 && CI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(B===1'b1 && CI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(A===1'b0 && CI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

        ifnone
	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

        ifnone
	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

	if(A===1'b0 && CI===1'b0)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b1 && CI===1'b1)
	// arc B --> S
	 (B => S) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

        ifnone
	// arc posedge CI --> (S:CI)
	 (posedge CI => (S:CI)) = (1.0,1.0);

        ifnone
	// arc negedge CI --> (S:CI)
	 (negedge CI => (S:CI)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

	if(A===1'b1 && B===1'b1)
	// arc CI --> S
	 (CI => S) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADHCM2S( CO, S, A, NCI);
input A, NCI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHCM2S$func ADHCM2S_inst(.A(A),.CO(CO),.NCI(NCI),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHCM2S$func ADHCM2S_inst(.A(A),.CO(CO),.NCI(NCI),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	// arc posedge NCI --> (S:NCI)
	 (posedge NCI => (S:NCI)) = (1.0,1.0);

	// arc negedge NCI --> (S:NCI)
	 (negedge NCI => (S:NCI)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADHCM4S( CO, S, A, NCI);
input A, NCI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHCM4S$func ADHCM4S_inst(.A(A),.CO(CO),.NCI(NCI),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHCM4S$func ADHCM4S_inst(.A(A),.CO(CO),.NCI(NCI),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	// arc posedge NCI --> (S:NCI)
	 (posedge NCI => (S:NCI)) = (1.0,1.0);

	// arc negedge NCI --> (S:NCI)
	 (negedge NCI => (S:NCI)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADHCSCM2S( CO, S, A, CS, NCI);
input A, CS, NCI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHCSCM2S$func ADHCSCM2S_inst(.A(A),.CO(CO),.CS(CS),.NCI(NCI),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHCSCM2S$func ADHCSCM2S_inst(.A(A),.CO(CO),.CS(CS),.NCI(NCI),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(CS===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(CS===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	ifnone
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(CS===1'b0)
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	if(CS===1'b1)
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	ifnone
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(CS===1'b0 && NCI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(CS===1'b0 && NCI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(CS===1'b1 && NCI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge CS --> (S:CS)
	 (posedge CS => (S:CS)) = (1.0,1.0);

        ifnone
	// arc negedge CS --> (S:CS)
	 (negedge CS => (S:CS)) = (1.0,1.0);

        ifnone
	// arc posedge NCI --> (S:NCI)
	 (posedge NCI => (S:NCI)) = (1.0,1.0);

        ifnone
	// arc negedge NCI --> (S:NCI)
	 (negedge NCI => (S:NCI)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADHCSCM4S( CO, S, A, CS, NCI);
input A, CS, NCI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHCSCM4S$func ADHCSCM4S_inst(.A(A),.CO(CO),.CS(CS),.NCI(NCI),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHCSCM4S$func ADHCSCM4S_inst(.A(A),.CO(CO),.CS(CS),.NCI(NCI),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(CS===1'b0)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(CS===1'b1)
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	ifnone
	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	if(CS===1'b0)
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	if(CS===1'b1)
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

	ifnone
	// arc NCI --> CO
	 (NCI => CO) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(CS===1'b0 && NCI===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(CS===1'b0 && NCI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(CS===1'b1 && NCI===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge CS --> (S:CS)
	 (posedge CS => (S:CS)) = (1.0,1.0);

        ifnone
	// arc negedge CS --> (S:CS)
	 (negedge CS => (S:CS)) = (1.0,1.0);

        ifnone
	// arc posedge NCI --> (S:NCI)
	 (posedge NCI => (S:NCI)) = (1.0,1.0);

        ifnone
	// arc negedge NCI --> (S:NCI)
	 (negedge NCI => (S:NCI)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADHCSOM2S( COB, S, A, CI, CS);
input A, CI, CS;
output COB, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHCSOM2S$func ADHCSOM2S_inst(.A(A),.CI(CI),.COB(COB),.CS(CS),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHCSOM2S$func ADHCSOM2S_inst(.A(A),.CI(CI),.COB(COB),.CS(CS),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(CS===1'b0)
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	if(CS===1'b1)
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	ifnone
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	if(CS===1'b0)
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	if(CS===1'b1)
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	ifnone
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(CI===1'b0 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(CI===1'b0 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(CI===1'b1 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge CI --> (S:CI)
	 (posedge CI => (S:CI)) = (1.0,1.0);

        ifnone
	// arc negedge CI --> (S:CI)
	 (negedge CI => (S:CI)) = (1.0,1.0);

        ifnone
	// arc posedge CS --> (S:CS)
	 (posedge CS => (S:CS)) = (1.0,1.0);

        ifnone
	// arc negedge CS --> (S:CS)
	 (negedge CS => (S:CS)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADHCSOM4S( COB, S, A, CI, CS);
input A, CI, CS;
output COB, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHCSOM4S$func ADHCSOM4S_inst(.A(A),.CI(CI),.COB(COB),.CS(CS),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHCSOM4S$func ADHCSOM4S_inst(.A(A),.CI(CI),.COB(COB),.CS(CS),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(CS===1'b0)
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	if(CS===1'b1)
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	ifnone
	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	if(CS===1'b0)
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	if(CS===1'b1)
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	ifnone
	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

        ifnone
	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

        ifnone
	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	if(CI===1'b0 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(CI===1'b0 && CS===1'b1)
	// arc A --> S
	 (A => S) = (1.0,1.0);

	if(CI===1'b1 && CS===1'b0)
	// arc A --> S
	 (A => S) = (1.0,1.0);

        ifnone
	// arc posedge CI --> (S:CI)
	 (posedge CI => (S:CI)) = (1.0,1.0);

        ifnone
	// arc negedge CI --> (S:CI)
	 (negedge CI => (S:CI)) = (1.0,1.0);

        ifnone
	// arc posedge CS --> (S:CS)
	 (posedge CS => (S:CS)) = (1.0,1.0);

        ifnone
	// arc negedge CS --> (S:CS)
	 (negedge CS => (S:CS)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADHM1SA( CO, S, A, B);
input A, B;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHM1SA$func ADHM1SA_inst(.A(A),.B(B),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHM1SA$func ADHM1SA_inst(.A(A),.B(B),.CO(CO),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADHM2SA( CO, S, A, B);
input A, B;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHM2SA$func ADHM2SA_inst(.A(A),.B(B),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHM2SA$func ADHM2SA_inst(.A(A),.B(B),.CO(CO),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADHM4SA( CO, S, A, B);
input A, B;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHM4SA$func ADHM4SA_inst(.A(A),.B(B),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHM4SA$func ADHM4SA_inst(.A(A),.B(B),.CO(CO),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADHM8SA( CO, S, A, B);
input A, B;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHM8SA$func ADHM8SA_inst(.A(A),.B(B),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHM8SA$func ADHM8SA_inst(.A(A),.B(B),.CO(CO),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> CO
	 (A => CO) = (1.0,1.0);

	// arc B --> CO
	 (B => CO) = (1.0,1.0);

	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	// arc posedge B --> (S:B)
	 (posedge B => (S:B)) = (1.0,1.0);

	// arc negedge B --> (S:B)
	 (negedge B => (S:B)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADHOM2S( COB, S, A, CI);
input A, CI;
output COB, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHOM2S$func ADHOM2S_inst(.A(A),.CI(CI),.COB(COB),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHOM2S$func ADHOM2S_inst(.A(A),.CI(CI),.COB(COB),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	// arc posedge CI --> (S:CI)
	 (posedge CI => (S:CI)) = (1.0,1.0);

	// arc negedge CI --> (S:CI)
	 (negedge CI => (S:CI)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ADHOM4S( COB, S, A, CI);
input A, CI;
output COB, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHOM4S$func ADHOM4S_inst(.A(A),.CI(CI),.COB(COB),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHOM4S$func ADHOM4S_inst(.A(A),.CI(CI),.COB(COB),.S(S));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> COB
	 (A => COB) = (1.0,1.0);

	// arc CI --> COB
	 (CI => COB) = (1.0,1.0);

	// arc posedge A --> (S:A)
	 (posedge A => (S:A)) = (1.0,1.0);

	// arc negedge A --> (S:A)
	 (negedge A => (S:A)) = (1.0,1.0);

	// arc posedge CI --> (S:CI)
	 (posedge CI => (S:CI)) = (1.0,1.0);

	// arc negedge CI --> (S:CI)
	 (negedge CI => (S:CI)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN2M0S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M0S$func AN2M0S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M0S$func AN2M0S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN2M12SA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M12SA$func AN2M12SA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M12SA$func AN2M12SA_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN2M16SA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M16SA$func AN2M16SA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M16SA$func AN2M16SA_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN2M1S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M1S$func AN2M1S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M1S$func AN2M1S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN2M22SA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M22SA$func AN2M22SA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M22SA$func AN2M22SA_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN2M2S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M2S$func AN2M2S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M2S$func AN2M2S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN2M4S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M4S$func AN2M4S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M4S$func AN2M4S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN2M6S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M6S$func AN2M6S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M6S$func AN2M6S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN2M8S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M8S$func AN2M8S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M8S$func AN2M8S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN3M0S( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M0S$func AN3M0S_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M0S$func AN3M0S_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN3M12SA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M12SA$func AN3M12SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M12SA$func AN3M12SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN3M16SA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M16SA$func AN3M16SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M16SA$func AN3M16SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN3M1S( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M1S$func AN3M1S_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M1S$func AN3M1S_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN3M22SA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M22SA$func AN3M22SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M22SA$func AN3M22SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN3M2S( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M2S$func AN3M2S_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M2S$func AN3M2S_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN3M4S( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M4S$func AN3M4S_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M4S$func AN3M4S_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN3M6S( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M6S$func AN3M6S_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M6S$func AN3M6S_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN3M8S( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M8S$func AN3M8S_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M8S$func AN3M8S_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN4M0S( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M0S$func AN4M0S_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M0S$func AN4M0S_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	// arc D --> Z
	 (D => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN4M12SA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M12SA$func AN4M12SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M12SA$func AN4M12SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	// arc D --> Z
	 (D => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN4M16SA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M16SA$func AN4M16SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M16SA$func AN4M16SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	// arc D --> Z
	 (D => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN4M1S( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M1S$func AN4M1S_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M1S$func AN4M1S_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	// arc D --> Z
	 (D => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN4M2S( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M2S$func AN4M2S_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M2S$func AN4M2S_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	// arc D --> Z
	 (D => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN4M4SA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M4SA$func AN4M4SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M4SA$func AN4M4SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	// arc D --> Z
	 (D => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN4M6S( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M6S$func AN4M6S_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M6S$func AN4M6S_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	// arc D --> Z
	 (D => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AN4M8SA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M8SA$func AN4M8SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M8SA$func AN4M8SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	// arc D --> Z
	 (D => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module ANTS( A);
input A;

endmodule
`endcelldefine
`celldefine
module AO211M1SA( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO211M1SA$func AO211M1SA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO211M1SA$func AO211M1SA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO211M2SA( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO211M2SA$func AO211M2SA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO211M2SA$func AO211M2SA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO211M4SA( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO211M4SA$func AO211M4SA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO211M4SA$func AO211M4SA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO211M8SA( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO211M8SA$func AO211M8SA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO211M8SA$func AO211M8SA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO21M0SA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M0SA$func AO21M0SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M0SA$func AO21M0SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO21M12SA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M12SA$func AO21M12SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M12SA$func AO21M12SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO21M1SA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M1SA$func AO21M1SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M1SA$func AO21M1SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO21M2SA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M2SA$func AO21M2SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M2SA$func AO21M2SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO21M4SA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M4SA$func AO21M4SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M4SA$func AO21M4SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO21M6SA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M6SA$func AO21M6SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M6SA$func AO21M6SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO21M8SA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M8SA$func AO21M8SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M8SA$func AO21M8SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO221M1SA( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO221M1SA$func AO221M1SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO221M1SA$func AO221M1SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO221M2SA( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO221M2SA$func AO221M2SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO221M2SA$func AO221M2SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO221M4SA( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO221M4SA$func AO221M4SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO221M4SA$func AO221M4SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO221M8SA( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO221M8SA$func AO221M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO221M8SA$func AO221M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO222M1SA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO222M1SA$func AO222M1SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO222M1SA$func AO222M1SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	ifnone
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	ifnone
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO222M2SA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO222M2SA$func AO222M2SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO222M2SA$func AO222M2SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	ifnone
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	ifnone
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO222M4SA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO222M4SA$func AO222M4SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO222M4SA$func AO222M4SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	ifnone
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	ifnone
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO222M8SA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO222M8SA$func AO222M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO222M8SA$func AO222M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	ifnone
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	ifnone
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22B10M0S( Z, A1, B1, B2, NA2);
input A1, B1, B2, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B10M0S$func AO22B10M0S_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B10M0S$func AO22B10M0S_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22B10M1S( Z, A1, B1, B2, NA2);
input A1, B1, B2, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B10M1S$func AO22B10M1S_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B10M1S$func AO22B10M1S_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22B10M2S( Z, A1, B1, B2, NA2);
input A1, B1, B2, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B10M2S$func AO22B10M2S_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B10M2S$func AO22B10M2S_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22B10M4S( Z, A1, B1, B2, NA2);
input A1, B1, B2, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B10M4S$func AO22B10M4S_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B10M4S$func AO22B10M4S_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22B10M8SA( Z, A1, B1, B2, NA2);
input A1, B1, B2, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B10M8SA$func AO22B10M8SA_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B10M8SA$func AO22B10M8SA_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22B11M0S( Z, A1, B1, NA2, NB2);
input A1, B1, NA2, NB2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B11M0S$func AO22B11M0S_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B11M0S$func AO22B11M0S_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && NB2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && NB2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && NB2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	ifnone
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22B11M1S( Z, A1, B1, NA2, NB2);
input A1, B1, NA2, NB2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B11M1S$func AO22B11M1S_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B11M1S$func AO22B11M1S_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && NB2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && NB2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && NB2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	ifnone
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22B11M2S( Z, A1, B1, NA2, NB2);
input A1, B1, NA2, NB2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B11M2S$func AO22B11M2S_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B11M2S$func AO22B11M2S_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && NB2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && NB2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && NB2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	ifnone
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22B11M4S( Z, A1, B1, NA2, NB2);
input A1, B1, NA2, NB2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B11M4S$func AO22B11M4S_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B11M4S$func AO22B11M4S_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && NB2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && NB2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && NB2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	ifnone
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22B11M8SA( Z, A1, B1, NA2, NB2);
input A1, B1, NA2, NB2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B11M8SA$func AO22B11M8SA_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B11M8SA$func AO22B11M8SA_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && NB2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && NB2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && NB2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && NB2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

	ifnone
	// arc NB2 --> Z
	 (NB2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22M0SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M0SA$func AO22M0SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M0SA$func AO22M0SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22M12SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M12SA$func AO22M12SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M12SA$func AO22M12SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22M1SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M1SA$func AO22M1SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M1SA$func AO22M1SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22M2S( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M2S$func AO22M2S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M2S$func AO22M2S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22M4SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M4SA$func AO22M4SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M4SA$func AO22M4SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22M6SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M6SA$func AO22M6SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M6SA$func AO22M6SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO22M8SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M8SA$func AO22M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M8SA$func AO22M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO31M1SA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO31M1SA$func AO31M1SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO31M1SA$func AO31M1SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO31M2SA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO31M2SA$func AO31M2SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO31M2SA$func AO31M2SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO31M4SA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO31M4SA$func AO31M4SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO31M4SA$func AO31M4SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO31M8SA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO31M8SA$func AO31M8SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO31M8SA$func AO31M8SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO32M1SA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO32M1SA$func AO32M1SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO32M1SA$func AO32M1SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO32M2SA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO32M2SA$func AO32M2SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO32M2SA$func AO32M2SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO32M4SA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO32M4SA$func AO32M4SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO32M4SA$func AO32M4SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO32M8SA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO32M8SA$func AO32M8SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO32M8SA$func AO32M8SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO33M1SA( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO33M1SA$func AO33M1SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO33M1SA$func AO33M1SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	ifnone
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO33M2SA( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO33M2SA$func AO33M2SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO33M2SA$func AO33M2SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	ifnone
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO33M4SA( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO33M4SA$func AO33M4SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO33M4SA$func AO33M4SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	ifnone
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AO33M8SA( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO33M8SA$func AO33M8SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO33M8SA$func AO33M8SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	ifnone
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI211M0S( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI211M0S$func AOI211M0S_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI211M0S$func AOI211M0S_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI211M1S( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI211M1S$func AOI211M1S_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI211M1S$func AOI211M1S_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI211M2S( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI211M2S$func AOI211M2S_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI211M2S$func AOI211M2S_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI211M4S( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI211M4S$func AOI211M4S_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI211M4S$func AOI211M4S_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI211M6SA( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI211M6SA$func AOI211M6SA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI211M6SA$func AOI211M6SA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI211M8SA( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI211M8SA$func AOI211M8SA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI211M8SA$func AOI211M8SA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B01M0S( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M0S$func AOI21B01M0S_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M0S$func AOI21B01M0S_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	ifnone
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B01M12SA( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M12SA$func AOI21B01M12SA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M12SA$func AOI21B01M12SA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	ifnone
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B01M16SA( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M16SA$func AOI21B01M16SA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M16SA$func AOI21B01M16SA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	ifnone
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B01M1S( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M1S$func AOI21B01M1S_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M1S$func AOI21B01M1S_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	ifnone
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B01M2S( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M2S$func AOI21B01M2S_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M2S$func AOI21B01M2S_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	ifnone
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B01M4S( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M4S$func AOI21B01M4S_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M4S$func AOI21B01M4S_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	ifnone
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B01M6SA( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M6SA$func AOI21B01M6SA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M6SA$func AOI21B01M6SA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	ifnone
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B01M8SA( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M8SA$func AOI21B01M8SA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M8SA$func AOI21B01M8SA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

	ifnone
	// arc NB --> Z
	 (NB => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B10M0S( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M0S$func AOI21B10M0S_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M0S$func AOI21B10M0S_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B10M12SA( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M12SA$func AOI21B10M12SA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M12SA$func AOI21B10M12SA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B10M16SA( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M16SA$func AOI21B10M16SA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M16SA$func AOI21B10M16SA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B10M1S( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M1S$func AOI21B10M1S_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M1S$func AOI21B10M1S_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B10M2S( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M2S$func AOI21B10M2S_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M2S$func AOI21B10M2S_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B10M4S( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M4S$func AOI21B10M4S_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M4S$func AOI21B10M4S_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B10M6SA( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M6SA$func AOI21B10M6SA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M6SA$func AOI21B10M6SA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B10M8SA( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M8SA$func AOI21B10M8SA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M8SA$func AOI21B10M8SA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B20M0S( Z, B, NA1, NA2);
input B, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B20M0S$func AOI21B20M0S_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B20M0S$func AOI21B20M0S_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(NA1===1'b0 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B20M1S( Z, B, NA1, NA2);
input B, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B20M1S$func AOI21B20M1S_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B20M1S$func AOI21B20M1S_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(NA1===1'b0 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B20M2S( Z, B, NA1, NA2);
input B, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B20M2S$func AOI21B20M2S_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B20M2S$func AOI21B20M2S_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(NA1===1'b0 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B20M4S( Z, B, NA1, NA2);
input B, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B20M4S$func AOI21B20M4S_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B20M4S$func AOI21B20M4S_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(NA1===1'b0 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21B20M8SA( Z, B, NA1, NA2);
input B, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B20M8SA$func AOI21B20M8SA_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B20M8SA$func AOI21B20M8SA_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(NA1===1'b0 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21M0S( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M0S$func AOI21M0S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M0S$func AOI21M0S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21M12SA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M12SA$func AOI21M12SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M12SA$func AOI21M12SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21M16SA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M16SA$func AOI21M16SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M16SA$func AOI21M16SA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21M1S( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M1S$func AOI21M1S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M1S$func AOI21M1S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21M2S( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M2S$func AOI21M2S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M2S$func AOI21M2S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21M3S( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M3S$func AOI21M3S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M3S$func AOI21M3S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21M4S( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M4S$func AOI21M4S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M4S$func AOI21M4S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21M6S( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M6S$func AOI21M6S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M6S$func AOI21M6S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI21M8S( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M8S$func AOI21M8S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M8S$func AOI21M8S_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI221M0S( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI221M0S$func AOI221M0S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI221M0S$func AOI221M0S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI221M1S( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI221M1S$func AOI221M1S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI221M1S$func AOI221M1S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI221M2S( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI221M2S$func AOI221M2S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI221M2S$func AOI221M2S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI221M4S( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI221M4S$func AOI221M4S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI221M4S$func AOI221M4S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI221M6SA( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI221M6SA$func AOI221M6SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI221M6SA$func AOI221M6SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI221M8SA( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI221M8SA$func AOI221M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI221M8SA$func AOI221M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI222M0SA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI222M0SA$func AOI222M0SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI222M0SA$func AOI222M0SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	ifnone
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	ifnone
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI222M1SA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI222M1SA$func AOI222M1SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI222M1SA$func AOI222M1SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	ifnone
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	ifnone
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI222M2S( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI222M2S$func AOI222M2S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI222M2S$func AOI222M2S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	ifnone
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	ifnone
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI222M4S( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI222M4S$func AOI222M4S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI222M4S$func AOI222M4S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	ifnone
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	ifnone
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI222M6SA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI222M6SA$func AOI222M6SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI222M6SA$func AOI222M6SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	ifnone
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	ifnone
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI222M8SA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI222M8SA$func AOI222M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI222M8SA$func AOI222M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b0 && C2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && C1===1'b1 && C2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	ifnone
	// arc C1 --> Z
	 (C1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b0 && B2===1'b1)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && B1===1'b1 && B2===1'b0)
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

	ifnone
	// arc C2 --> Z
	 (C2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI22B20M0S( Z, B1, B2, NA1, NA2);
input B1, B2, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22B20M0S$func AOI22B20M0S_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22B20M0S$func AOI22B20M0S_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(NA1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b0 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	ifnone
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI22B20M1S( Z, B1, B2, NA1, NA2);
input B1, B2, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22B20M1S$func AOI22B20M1S_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22B20M1S$func AOI22B20M1S_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(NA1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b0 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	ifnone
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI22B20M2S( Z, B1, B2, NA1, NA2);
input B1, B2, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22B20M2S$func AOI22B20M2S_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22B20M2S$func AOI22B20M2S_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(NA1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b0 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	ifnone
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI22B20M4S( Z, B1, B2, NA1, NA2);
input B1, B2, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22B20M4S$func AOI22B20M4S_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22B20M4S$func AOI22B20M4S_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(NA1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b0 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	ifnone
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI22B20M8SA( Z, B1, B2, NA1, NA2);
input B1, B2, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22B20M8SA$func AOI22B20M8SA_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22B20M8SA$func AOI22B20M8SA_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(NA1===1'b0 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(NA1===1'b0 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(NA1===1'b1 && NA2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	ifnone
	// arc NA1 --> Z
	 (NA1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

	ifnone
	// arc NA2 --> Z
	 (NA2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI22M0S( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M0S$func AOI22M0S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M0S$func AOI22M0S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI22M12SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M12SA$func AOI22M12SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M12SA$func AOI22M12SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI22M16SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M16SA$func AOI22M16SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M16SA$func AOI22M16SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI22M1S( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M1S$func AOI22M1S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M1S$func AOI22M1S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI22M2S( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M2S$func AOI22M2S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M2S$func AOI22M2S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI22M4S( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M4S$func AOI22M4S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M4S$func AOI22M4S_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI22M6SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M6SA$func AOI22M6SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M6SA$func AOI22M6SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI22M8SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M8SA$func AOI22M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M8SA$func AOI22M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI31M0S( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M0S$func AOI31M0S_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M0S$func AOI31M0S_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI31M12SA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M12SA$func AOI31M12SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M12SA$func AOI31M12SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI31M1S( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M1S$func AOI31M1S_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M1S$func AOI31M1S_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI31M2S( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M2S$func AOI31M2S_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M2S$func AOI31M2S_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI31M4S( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M4S$func AOI31M4S_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M4S$func AOI31M4S_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI31M6SA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M6SA$func AOI31M6SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M6SA$func AOI31M6SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI31M8SA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M8SA$func AOI31M8SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M8SA$func AOI31M8SA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI32M0S( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M0S$func AOI32M0S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M0S$func AOI32M0S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI32M12SA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M12SA$func AOI32M12SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M12SA$func AOI32M12SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI32M1S( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M1S$func AOI32M1S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M1S$func AOI32M1S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI32M2S( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M2S$func AOI32M2S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M2S$func AOI32M2S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI32M4S( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M4S$func AOI32M4S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M4S$func AOI32M4S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI32M6SA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M6SA$func AOI32M6SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M6SA$func AOI32M6SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI32M8SA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M8SA$func AOI32M8SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M8SA$func AOI32M8SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI33M0S( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI33M0S$func AOI33M0S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI33M0S$func AOI33M0S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	ifnone
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI33M1S( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI33M1S$func AOI33M1S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI33M1S$func AOI33M1S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	ifnone
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI33M2S( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI33M2S$func AOI33M2S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI33M2S$func AOI33M2S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	ifnone
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI33M4S( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI33M4S$func AOI33M4S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI33M4S$func AOI33M4S_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	ifnone
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module AOI33M8SA( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI33M8SA$func AOI33M8SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI33M8SA$func AOI33M8SA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0 && B3===1'b1)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1 && B3===1'b0)
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	ifnone
	// arc A3 --> Z
	 (A3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0 && A3===1'b1)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1 && A3===1'b0)
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

	ifnone
	// arc B3 --> Z
	 (B3 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BEM2SA( OA1, OA2, Z, M0, M1, M2);
input M0, M1, M2;
output OA1, OA2, Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEM2SA$func BEM2SA_inst(.M0(M0),.M1(M1),.M2(M2),.OA1(OA1),.OA2(OA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEM2SA$func BEM2SA_inst(.M0(M0),.M1(M1),.M2(M2),.OA1(OA1),.OA2(OA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc M0 --> OA1
	 (M0 => OA1) = (1.0,1.0);

	// arc M1 --> OA1
	 (M1 => OA1) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0)
	// arc M2 --> OA1
	 (M2 => OA1) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1)
	// arc M2 --> OA1
	 (M2 => OA1) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0)
	// arc M2 --> OA1
	 (M2 => OA1) = (1.0,1.0);

	ifnone
	// arc M2 --> OA1
	 (M2 => OA1) = (1.0,1.0);

	// arc M0 --> OA2
	 (M0 => OA2) = (1.0,1.0);

	// arc M1 --> OA2
	 (M1 => OA2) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1)
	// arc M2 --> OA2
	 (M2 => OA2) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0)
	// arc M2 --> OA2
	 (M2 => OA2) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1)
	// arc M2 --> OA2
	 (M2 => OA2) = (1.0,1.0);

	ifnone
	// arc M2 --> OA2
	 (M2 => OA2) = (1.0,1.0);

	if(M2===1'b0)
	// arc posedge M0 --> (Z:M0)
	 (posedge M0 => (Z:M0)) = (1.0,1.0);

	if(M2===1'b0)
	// arc negedge M0 --> (Z:M0)
	 (negedge M0 => (Z:M0)) = (1.0,1.0);

	if(M2===1'b1)
	// arc posedge M0 --> (Z:M0)
	 (posedge M0 => (Z:M0)) = (1.0,1.0);

	if(M2===1'b1)
	// arc negedge M0 --> (Z:M0)
	 (negedge M0 => (Z:M0)) = (1.0,1.0);

        ifnone
	// arc posedge M0 --> (Z:M0)
	 (posedge M0 => (Z:M0)) = (1.0,1.0);

        ifnone
	// arc negedge M0 --> (Z:M0)
	 (negedge M0 => (Z:M0)) = (1.0,1.0);

	if(M2===1'b0)
	// arc posedge M1 --> (Z:M1)
	 (posedge M1 => (Z:M1)) = (1.0,1.0);

	if(M2===1'b0)
	// arc negedge M1 --> (Z:M1)
	 (negedge M1 => (Z:M1)) = (1.0,1.0);

	if(M2===1'b1)
	// arc posedge M1 --> (Z:M1)
	 (posedge M1 => (Z:M1)) = (1.0,1.0);

	if(M2===1'b1)
	// arc negedge M1 --> (Z:M1)
	 (negedge M1 => (Z:M1)) = (1.0,1.0);

        ifnone
	// arc posedge M1 --> (Z:M1)
	 (posedge M1 => (Z:M1)) = (1.0,1.0);

        ifnone
	// arc negedge M1 --> (Z:M1)
	 (negedge M1 => (Z:M1)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BEM4SA( OA1, OA2, Z, M0, M1, M2);
input M0, M1, M2;
output OA1, OA2, Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEM4SA$func BEM4SA_inst(.M0(M0),.M1(M1),.M2(M2),.OA1(OA1),.OA2(OA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEM4SA$func BEM4SA_inst(.M0(M0),.M1(M1),.M2(M2),.OA1(OA1),.OA2(OA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc M0 --> OA1
	 (M0 => OA1) = (1.0,1.0);

	// arc M1 --> OA1
	 (M1 => OA1) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0)
	// arc M2 --> OA1
	 (M2 => OA1) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1)
	// arc M2 --> OA1
	 (M2 => OA1) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0)
	// arc M2 --> OA1
	 (M2 => OA1) = (1.0,1.0);

	ifnone
	// arc M2 --> OA1
	 (M2 => OA1) = (1.0,1.0);

	// arc M0 --> OA2
	 (M0 => OA2) = (1.0,1.0);

	// arc M1 --> OA2
	 (M1 => OA2) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1)
	// arc M2 --> OA2
	 (M2 => OA2) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0)
	// arc M2 --> OA2
	 (M2 => OA2) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1)
	// arc M2 --> OA2
	 (M2 => OA2) = (1.0,1.0);

	ifnone
	// arc M2 --> OA2
	 (M2 => OA2) = (1.0,1.0);

	if(M2===1'b0)
	// arc posedge M0 --> (Z:M0)
	 (posedge M0 => (Z:M0)) = (1.0,1.0);

	if(M2===1'b0)
	// arc negedge M0 --> (Z:M0)
	 (negedge M0 => (Z:M0)) = (1.0,1.0);

	if(M2===1'b1)
	// arc posedge M0 --> (Z:M0)
	 (posedge M0 => (Z:M0)) = (1.0,1.0);

	if(M2===1'b1)
	// arc negedge M0 --> (Z:M0)
	 (negedge M0 => (Z:M0)) = (1.0,1.0);

        ifnone
	// arc posedge M0 --> (Z:M0)
	 (posedge M0 => (Z:M0)) = (1.0,1.0);

        ifnone
	// arc negedge M0 --> (Z:M0)
	 (negedge M0 => (Z:M0)) = (1.0,1.0);

	if(M2===1'b0)
	// arc posedge M1 --> (Z:M1)
	 (posedge M1 => (Z:M1)) = (1.0,1.0);

	if(M2===1'b0)
	// arc negedge M1 --> (Z:M1)
	 (negedge M1 => (Z:M1)) = (1.0,1.0);

	if(M2===1'b1)
	// arc posedge M1 --> (Z:M1)
	 (posedge M1 => (Z:M1)) = (1.0,1.0);

	if(M2===1'b1)
	// arc negedge M1 --> (Z:M1)
	 (negedge M1 => (Z:M1)) = (1.0,1.0);

        ifnone
	// arc posedge M1 --> (Z:M1)
	 (posedge M1 => (Z:M1)) = (1.0,1.0);

        ifnone
	// arc negedge M1 --> (Z:M1)
	 (negedge M1 => (Z:M1)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BEM8SA( OA1, OA2, Z, M0, M1, M2);
input M0, M1, M2;
output OA1, OA2, Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEM8SA$func BEM8SA_inst(.M0(M0),.M1(M1),.M2(M2),.OA1(OA1),.OA2(OA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEM8SA$func BEM8SA_inst(.M0(M0),.M1(M1),.M2(M2),.OA1(OA1),.OA2(OA2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc M0 --> OA1
	 (M0 => OA1) = (1.0,1.0);

	// arc M1 --> OA1
	 (M1 => OA1) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0)
	// arc M2 --> OA1
	 (M2 => OA1) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1)
	// arc M2 --> OA1
	 (M2 => OA1) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0)
	// arc M2 --> OA1
	 (M2 => OA1) = (1.0,1.0);

	ifnone
	// arc M2 --> OA1
	 (M2 => OA1) = (1.0,1.0);

	// arc M0 --> OA2
	 (M0 => OA2) = (1.0,1.0);

	// arc M1 --> OA2
	 (M1 => OA2) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1)
	// arc M2 --> OA2
	 (M2 => OA2) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0)
	// arc M2 --> OA2
	 (M2 => OA2) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1)
	// arc M2 --> OA2
	 (M2 => OA2) = (1.0,1.0);

	ifnone
	// arc M2 --> OA2
	 (M2 => OA2) = (1.0,1.0);

	if(M2===1'b0)
	// arc posedge M0 --> (Z:M0)
	 (posedge M0 => (Z:M0)) = (1.0,1.0);

	if(M2===1'b0)
	// arc negedge M0 --> (Z:M0)
	 (negedge M0 => (Z:M0)) = (1.0,1.0);

	if(M2===1'b1)
	// arc posedge M0 --> (Z:M0)
	 (posedge M0 => (Z:M0)) = (1.0,1.0);

	if(M2===1'b1)
	// arc negedge M0 --> (Z:M0)
	 (negedge M0 => (Z:M0)) = (1.0,1.0);

        ifnone
	// arc posedge M0 --> (Z:M0)
	 (posedge M0 => (Z:M0)) = (1.0,1.0);

        ifnone
	// arc negedge M0 --> (Z:M0)
	 (negedge M0 => (Z:M0)) = (1.0,1.0);

	if(M2===1'b0)
	// arc posedge M1 --> (Z:M1)
	 (posedge M1 => (Z:M1)) = (1.0,1.0);

	if(M2===1'b0)
	// arc negedge M1 --> (Z:M1)
	 (negedge M1 => (Z:M1)) = (1.0,1.0);

	if(M2===1'b1)
	// arc posedge M1 --> (Z:M1)
	 (posedge M1 => (Z:M1)) = (1.0,1.0);

	if(M2===1'b1)
	// arc negedge M1 --> (Z:M1)
	 (negedge M1 => (Z:M1)) = (1.0,1.0);

        ifnone
	// arc posedge M1 --> (Z:M1)
	 (posedge M1 => (Z:M1)) = (1.0,1.0);

        ifnone
	// arc negedge M1 --> (Z:M1)
	 (negedge M1 => (Z:M1)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BEMXBM2S( PB, M0, M1, OA1, OA2, Z);
input M0, M1, OA1, OA2, Z;
output PB;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEMXBM2S$func BEMXBM2S_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.PB(PB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEMXBM2S$func BEMXBM2S_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.PB(PB),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(M1===1'b0)
	// arc posedge M0 --> (PB:M0)
	 (posedge M0 => (PB:M0)) = (1.0,1.0);

	if(M1===1'b0)
	// arc negedge M0 --> (PB:M0)
	 (negedge M0 => (PB:M0)) = (1.0,1.0);

	if(M1===1'b1)
	// arc posedge M0 --> (PB:M0)
	 (posedge M0 => (PB:M0)) = (1.0,1.0);

	if(M1===1'b1)
	// arc negedge M0 --> (PB:M0)
	 (negedge M0 => (PB:M0)) = (1.0,1.0);

        ifnone
	// arc posedge M0 --> (PB:M0)
	 (posedge M0 => (PB:M0)) = (1.0,1.0);

        ifnone
	// arc negedge M0 --> (PB:M0)
	 (negedge M0 => (PB:M0)) = (1.0,1.0);

	if(M0===1'b0)
	// arc posedge M1 --> (PB:M1)
	 (posedge M1 => (PB:M1)) = (1.0,1.0);

	if(M0===1'b0)
	// arc negedge M1 --> (PB:M1)
	 (negedge M1 => (PB:M1)) = (1.0,1.0);

	if(M0===1'b1)
	// arc posedge M1 --> (PB:M1)
	 (posedge M1 => (PB:M1)) = (1.0,1.0);

	if(M0===1'b1)
	// arc negedge M1 --> (PB:M1)
	 (negedge M1 => (PB:M1)) = (1.0,1.0);

        ifnone
	// arc posedge M1 --> (PB:M1)
	 (posedge M1 => (PB:M1)) = (1.0,1.0);

        ifnone
	// arc negedge M1 --> (PB:M1)
	 (negedge M1 => (PB:M1)) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA2===1'b0 && Z===1'b0)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA2===1'b1 && Z===1'b0)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA2===1'b0 && Z===1'b1)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA2===1'b1 && Z===1'b1)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b0 && Z===1'b0)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b0 && Z===1'b1)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b1 && Z===1'b0)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b1 && Z===1'b1)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	ifnone
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b0 && Z===1'b0)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b0 && Z===1'b1)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b1 && Z===1'b0)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b1 && Z===1'b1)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b0 && Z===1'b1)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b1 && Z===1'b1)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b0 && Z===1'b0)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b1 && Z===1'b0)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	ifnone
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b1 && OA2===1'b0)
	// arc Z --> PB
	 (Z => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b0 && OA2===1'b1)
	// arc Z --> PB
	 (Z => PB) = (1.0,1.0);

        ifnone
	// arc posedge Z --> (PB:Z)
	 (posedge Z => (PB:Z)) = (1.0,1.0);

        ifnone
	// arc negedge Z --> (PB:Z)
	 (negedge Z => (PB:Z)) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b0 && OA2===1'b1)
	// arc Z --> PB
	 (Z => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b1 && OA2===1'b0)
	// arc Z --> PB
	 (Z => PB) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BEMXBM4S( PB, M0, M1, OA1, OA2, Z);
input M0, M1, OA1, OA2, Z;
output PB;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEMXBM4S$func BEMXBM4S_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.PB(PB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEMXBM4S$func BEMXBM4S_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.PB(PB),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(M1===1'b0)
	// arc posedge M0 --> (PB:M0)
	 (posedge M0 => (PB:M0)) = (1.0,1.0);

	if(M1===1'b0)
	// arc negedge M0 --> (PB:M0)
	 (negedge M0 => (PB:M0)) = (1.0,1.0);

	if(M1===1'b1)
	// arc posedge M0 --> (PB:M0)
	 (posedge M0 => (PB:M0)) = (1.0,1.0);

	if(M1===1'b1)
	// arc negedge M0 --> (PB:M0)
	 (negedge M0 => (PB:M0)) = (1.0,1.0);

        ifnone
	// arc posedge M0 --> (PB:M0)
	 (posedge M0 => (PB:M0)) = (1.0,1.0);

        ifnone
	// arc negedge M0 --> (PB:M0)
	 (negedge M0 => (PB:M0)) = (1.0,1.0);

	if(M0===1'b0)
	// arc posedge M1 --> (PB:M1)
	 (posedge M1 => (PB:M1)) = (1.0,1.0);

	if(M0===1'b0)
	// arc negedge M1 --> (PB:M1)
	 (negedge M1 => (PB:M1)) = (1.0,1.0);

	if(M0===1'b1)
	// arc posedge M1 --> (PB:M1)
	 (posedge M1 => (PB:M1)) = (1.0,1.0);

	if(M0===1'b1)
	// arc negedge M1 --> (PB:M1)
	 (negedge M1 => (PB:M1)) = (1.0,1.0);

        ifnone
	// arc posedge M1 --> (PB:M1)
	 (posedge M1 => (PB:M1)) = (1.0,1.0);

        ifnone
	// arc negedge M1 --> (PB:M1)
	 (negedge M1 => (PB:M1)) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA2===1'b0 && Z===1'b0)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA2===1'b1 && Z===1'b0)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA2===1'b0 && Z===1'b1)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA2===1'b1 && Z===1'b1)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b0 && Z===1'b0)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b0 && Z===1'b1)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b1 && Z===1'b0)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b1 && Z===1'b1)
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	ifnone
	// arc OA1 --> PB
	 (OA1 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b0 && Z===1'b0)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b0 && Z===1'b1)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b1 && Z===1'b0)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b1 && Z===1'b1)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b0 && Z===1'b1)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b1 && Z===1'b1)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b0 && Z===1'b0)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b1 && Z===1'b0)
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	ifnone
	// arc OA2 --> PB
	 (OA2 => PB) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b1 && OA2===1'b0)
	// arc Z --> PB
	 (Z => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b0 && OA2===1'b1)
	// arc Z --> PB
	 (Z => PB) = (1.0,1.0);

        ifnone
	// arc posedge Z --> (PB:Z)
	 (posedge Z => (PB:Z)) = (1.0,1.0);

        ifnone
	// arc negedge Z --> (PB:Z)
	 (negedge Z => (PB:Z)) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b0 && OA2===1'b1)
	// arc Z --> PB
	 (Z => PB) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b1 && OA2===1'b0)
	// arc Z --> PB
	 (Z => PB) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BEMXM2SA( P, M0, M1, OA1, OA2, Z);
input M0, M1, OA1, OA2, Z;
output P;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEMXM2SA$func BEMXM2SA_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.P(P),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEMXM2SA$func BEMXM2SA_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.P(P),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(M1===1'b0)
	// arc posedge M0 --> (P:M0)
	 (posedge M0 => (P:M0)) = (1.0,1.0);

	if(M1===1'b0)
	// arc negedge M0 --> (P:M0)
	 (negedge M0 => (P:M0)) = (1.0,1.0);

	if(M1===1'b1)
	// arc posedge M0 --> (P:M0)
	 (posedge M0 => (P:M0)) = (1.0,1.0);

	if(M1===1'b1)
	// arc negedge M0 --> (P:M0)
	 (negedge M0 => (P:M0)) = (1.0,1.0);

        ifnone
	// arc posedge M0 --> (P:M0)
	 (posedge M0 => (P:M0)) = (1.0,1.0);

        ifnone
	// arc negedge M0 --> (P:M0)
	 (negedge M0 => (P:M0)) = (1.0,1.0);

	if(M0===1'b0)
	// arc posedge M1 --> (P:M1)
	 (posedge M1 => (P:M1)) = (1.0,1.0);

	if(M0===1'b0)
	// arc negedge M1 --> (P:M1)
	 (negedge M1 => (P:M1)) = (1.0,1.0);

	if(M0===1'b1)
	// arc posedge M1 --> (P:M1)
	 (posedge M1 => (P:M1)) = (1.0,1.0);

	if(M0===1'b1)
	// arc negedge M1 --> (P:M1)
	 (negedge M1 => (P:M1)) = (1.0,1.0);

        ifnone
	// arc posedge M1 --> (P:M1)
	 (posedge M1 => (P:M1)) = (1.0,1.0);

        ifnone
	// arc negedge M1 --> (P:M1)
	 (negedge M1 => (P:M1)) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA2===1'b0 && Z===1'b0)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA2===1'b1 && Z===1'b0)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA2===1'b0 && Z===1'b1)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA2===1'b1 && Z===1'b1)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b0 && Z===1'b0)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b0 && Z===1'b1)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b1 && Z===1'b0)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b1 && Z===1'b1)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	ifnone
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b0 && Z===1'b0)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b0 && Z===1'b1)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b1 && Z===1'b0)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b1 && Z===1'b1)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b0 && Z===1'b1)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b1 && Z===1'b1)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b0 && Z===1'b0)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b1 && Z===1'b0)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	ifnone
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b0 && OA2===1'b1)
	// arc Z --> P
	 (Z => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b1 && OA2===1'b0)
	// arc Z --> P
	 (Z => P) = (1.0,1.0);

        ifnone
	// arc posedge Z --> (P:Z)
	 (posedge Z => (P:Z)) = (1.0,1.0);

        ifnone
	// arc negedge Z --> (P:Z)
	 (negedge Z => (P:Z)) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b1 && OA2===1'b0)
	// arc Z --> P
	 (Z => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b0 && OA2===1'b1)
	// arc Z --> P
	 (Z => P) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BEMXM4SA( P, M0, M1, OA1, OA2, Z);
input M0, M1, OA1, OA2, Z;
output P;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEMXM4SA$func BEMXM4SA_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.P(P),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEMXM4SA$func BEMXM4SA_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.P(P),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(M1===1'b0)
	// arc posedge M0 --> (P:M0)
	 (posedge M0 => (P:M0)) = (1.0,1.0);

	if(M1===1'b0)
	// arc negedge M0 --> (P:M0)
	 (negedge M0 => (P:M0)) = (1.0,1.0);

	if(M1===1'b1)
	// arc posedge M0 --> (P:M0)
	 (posedge M0 => (P:M0)) = (1.0,1.0);

	if(M1===1'b1)
	// arc negedge M0 --> (P:M0)
	 (negedge M0 => (P:M0)) = (1.0,1.0);

        ifnone
	// arc posedge M0 --> (P:M0)
	 (posedge M0 => (P:M0)) = (1.0,1.0);

        ifnone
	// arc negedge M0 --> (P:M0)
	 (negedge M0 => (P:M0)) = (1.0,1.0);

	if(M0===1'b0)
	// arc posedge M1 --> (P:M1)
	 (posedge M1 => (P:M1)) = (1.0,1.0);

	if(M0===1'b0)
	// arc negedge M1 --> (P:M1)
	 (negedge M1 => (P:M1)) = (1.0,1.0);

	if(M0===1'b1)
	// arc posedge M1 --> (P:M1)
	 (posedge M1 => (P:M1)) = (1.0,1.0);

	if(M0===1'b1)
	// arc negedge M1 --> (P:M1)
	 (negedge M1 => (P:M1)) = (1.0,1.0);

        ifnone
	// arc posedge M1 --> (P:M1)
	 (posedge M1 => (P:M1)) = (1.0,1.0);

        ifnone
	// arc negedge M1 --> (P:M1)
	 (negedge M1 => (P:M1)) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA2===1'b0 && Z===1'b0)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA2===1'b1 && Z===1'b0)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA2===1'b0 && Z===1'b1)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA2===1'b1 && Z===1'b1)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b0 && Z===1'b0)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b0 && Z===1'b1)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b1 && Z===1'b0)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b1 && Z===1'b1)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	ifnone
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b0 && Z===1'b0)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b0 && Z===1'b1)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b1 && Z===1'b0)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b1 && Z===1'b1)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b0 && Z===1'b1)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b1 && Z===1'b1)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b0 && Z===1'b0)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b1 && Z===1'b0)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	ifnone
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b0 && OA2===1'b1)
	// arc Z --> P
	 (Z => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b1 && OA2===1'b0)
	// arc Z --> P
	 (Z => P) = (1.0,1.0);

        ifnone
	// arc posedge Z --> (P:Z)
	 (posedge Z => (P:Z)) = (1.0,1.0);

        ifnone
	// arc negedge Z --> (P:Z)
	 (negedge Z => (P:Z)) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b1 && OA2===1'b0)
	// arc Z --> P
	 (Z => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b0 && OA2===1'b1)
	// arc Z --> P
	 (Z => P) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BEMXM8SA( P, M0, M1, OA1, OA2, Z);
input M0, M1, OA1, OA2, Z;
output P;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEMXM8SA$func BEMXM8SA_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.P(P),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEMXM8SA$func BEMXM8SA_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.P(P),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(M1===1'b0)
	// arc posedge M0 --> (P:M0)
	 (posedge M0 => (P:M0)) = (1.0,1.0);

	if(M1===1'b0)
	// arc negedge M0 --> (P:M0)
	 (negedge M0 => (P:M0)) = (1.0,1.0);

	if(M1===1'b1)
	// arc posedge M0 --> (P:M0)
	 (posedge M0 => (P:M0)) = (1.0,1.0);

	if(M1===1'b1)
	// arc negedge M0 --> (P:M0)
	 (negedge M0 => (P:M0)) = (1.0,1.0);

        ifnone
	// arc posedge M0 --> (P:M0)
	 (posedge M0 => (P:M0)) = (1.0,1.0);

        ifnone
	// arc negedge M0 --> (P:M0)
	 (negedge M0 => (P:M0)) = (1.0,1.0);

	if(M0===1'b0)
	// arc posedge M1 --> (P:M1)
	 (posedge M1 => (P:M1)) = (1.0,1.0);

	if(M0===1'b0)
	// arc negedge M1 --> (P:M1)
	 (negedge M1 => (P:M1)) = (1.0,1.0);

	if(M0===1'b1)
	// arc posedge M1 --> (P:M1)
	 (posedge M1 => (P:M1)) = (1.0,1.0);

	if(M0===1'b1)
	// arc negedge M1 --> (P:M1)
	 (negedge M1 => (P:M1)) = (1.0,1.0);

        ifnone
	// arc posedge M1 --> (P:M1)
	 (posedge M1 => (P:M1)) = (1.0,1.0);

        ifnone
	// arc negedge M1 --> (P:M1)
	 (negedge M1 => (P:M1)) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA2===1'b0 && Z===1'b0)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA2===1'b1 && Z===1'b0)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA2===1'b0 && Z===1'b1)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA2===1'b1 && Z===1'b1)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b0 && Z===1'b0)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b0 && Z===1'b1)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b1 && Z===1'b0)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b1 && OA2===1'b1 && Z===1'b1)
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	ifnone
	// arc OA1 --> P
	 (OA1 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b0 && Z===1'b0)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b0 && Z===1'b1)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b1 && Z===1'b0)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b0 && OA1===1'b1 && Z===1'b1)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b0 && Z===1'b1)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b1 && Z===1'b1)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b0 && Z===1'b0)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b1 && Z===1'b0)
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	ifnone
	// arc OA2 --> P
	 (OA2 => P) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b0 && OA2===1'b1)
	// arc Z --> P
	 (Z => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b1 && OA2===1'b0)
	// arc Z --> P
	 (Z => P) = (1.0,1.0);

        ifnone
	// arc posedge Z --> (P:Z)
	 (posedge Z => (P:Z)) = (1.0,1.0);

        ifnone
	// arc negedge Z --> (P:Z)
	 (negedge Z => (P:Z)) = (1.0,1.0);

	if(M0===1'b0 && M1===1'b1 && OA1===1'b1 && OA2===1'b0)
	// arc Z --> P
	 (Z => P) = (1.0,1.0);

	if(M0===1'b1 && M1===1'b0 && OA1===1'b0 && OA2===1'b1)
	// arc Z --> P
	 (Z => P) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BHDM1S( Z);
inout Z;

    // Busholder.
  wire io_wire;

  buf(weak0,weak1) SMC_I0(Z, io_wire);
  buf              SMC_I1(io_wire, Z);
 
endmodule
`endcelldefine
`celldefine
module BUFM10S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM10S$func BUFM10S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM10S$func BUFM10S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM12S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM12S$func BUFM12S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM12S$func BUFM12S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM14S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM14S$func BUFM14S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM14S$func BUFM14S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM16S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM16S$func BUFM16S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM16S$func BUFM16S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM18S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM18S$func BUFM18S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM18S$func BUFM18S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM20S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM20S$func BUFM20S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM20S$func BUFM20S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM22SA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM22SA$func BUFM22SA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM22SA$func BUFM22SA_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM24S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM24S$func BUFM24S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM24S$func BUFM24S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM26SA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM26SA$func BUFM26SA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM26SA$func BUFM26SA_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM2S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM2S$func BUFM2S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM2S$func BUFM2S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM32SA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM32SA$func BUFM32SA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM32SA$func BUFM32SA_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM3S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM3S$func BUFM3S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM3S$func BUFM3S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM40SA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM40SA$func BUFM40SA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM40SA$func BUFM40SA_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM48SA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM48SA$func BUFM48SA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM48SA$func BUFM48SA_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM4S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM4S$func BUFM4S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM4S$func BUFM4S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM5S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM5S$func BUFM5S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM5S$func BUFM5S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM6S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM6S$func BUFM6S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM6S$func BUFM6S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFM8S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM8S$func BUFM8S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM8S$func BUFM8S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM0S( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM0S$func BUFTM0S_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM0S$func BUFTM0S_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM12S( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM12S$func BUFTM12S_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM12S$func BUFTM12S_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM16S( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM16S$func BUFTM16S_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM16S$func BUFTM16S_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM1S( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM1S$func BUFTM1S_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM1S$func BUFTM1S_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM20S( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM20S$func BUFTM20S_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM20S$func BUFTM20S_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM22SA( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM22SA$func BUFTM22SA_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM22SA$func BUFTM22SA_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM24SA( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM24SA$func BUFTM24SA_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM24SA$func BUFTM24SA_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM2S( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM2S$func BUFTM2S_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM2S$func BUFTM2S_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM32SA( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM32SA$func BUFTM32SA_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM32SA$func BUFTM32SA_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM3S( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM3S$func BUFTM3S_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM3S$func BUFTM3S_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM40SA( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM40SA$func BUFTM40SA_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM40SA$func BUFTM40SA_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM48SA( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM48SA$func BUFTM48SA_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM48SA$func BUFTM48SA_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM4S( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM4S$func BUFTM4S_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM4S$func BUFTM4S_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM6S( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM6S$func BUFTM6S_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM6S$func BUFTM6S_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module BUFTM8S( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM8S$func BUFTM8S_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM8S$func BUFTM8S_inst(.A(A),.E(E),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc E --> Z
	 (E => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKAN2M12S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M12S$func CKAN2M12S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M12S$func CKAN2M12S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKAN2M16SA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M16SA$func CKAN2M16SA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M16SA$func CKAN2M16SA_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKAN2M2S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M2S$func CKAN2M2S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M2S$func CKAN2M2S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKAN2M3S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M3S$func CKAN2M3S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M3S$func CKAN2M3S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKAN2M4S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M4S$func CKAN2M4S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M4S$func CKAN2M4S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKAN2M6S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M6S$func CKAN2M6S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M6S$func CKAN2M6S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKAN2M8SA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M8SA$func CKAN2M8SA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M8SA$func CKAN2M8SA_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM12S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM12S$func CKBUFM12S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM12S$func CKBUFM12S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM16S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM16S$func CKBUFM16S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM16S$func CKBUFM16S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM1S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM1S$func CKBUFM1S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM1S$func CKBUFM1S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM20S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM20S$func CKBUFM20S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM20S$func CKBUFM20S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM22SA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM22SA$func CKBUFM22SA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM22SA$func CKBUFM22SA_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM24S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM24S$func CKBUFM24S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM24S$func CKBUFM24S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM26SA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM26SA$func CKBUFM26SA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM26SA$func CKBUFM26SA_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM2S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM2S$func CKBUFM2S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM2S$func CKBUFM2S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM32S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM32S$func CKBUFM32S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM32S$func CKBUFM32S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM3S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM3S$func CKBUFM3S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM3S$func CKBUFM3S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM40S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM40S$func CKBUFM40S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM40S$func CKBUFM40S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM48S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM48S$func CKBUFM48S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM48S$func CKBUFM48S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM4S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM4S$func CKBUFM4S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM4S$func CKBUFM4S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM6S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM6S$func CKBUFM6S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM6S$func CKBUFM6S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKBUFM8S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM8S$func CKBUFM8S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM8S$func CKBUFM8S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM12S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM12S$func CKINVM12S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM12S$func CKINVM12S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM16S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM16S$func CKINVM16S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM16S$func CKINVM16S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM1S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM1S$func CKINVM1S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM1S$func CKINVM1S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM20S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM20S$func CKINVM20S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM20S$func CKINVM20S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM22SA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM22SA$func CKINVM22SA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM22SA$func CKINVM22SA_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM24S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM24S$func CKINVM24S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM24S$func CKINVM24S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM26SA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM26SA$func CKINVM26SA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM26SA$func CKINVM26SA_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM2S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM2S$func CKINVM2S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM2S$func CKINVM2S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM32S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM32S$func CKINVM32S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM32S$func CKINVM32S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM3S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM3S$func CKINVM3S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM3S$func CKINVM3S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM40S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM40S$func CKINVM40S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM40S$func CKINVM40S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM48S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM48S$func CKINVM48S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM48S$func CKINVM48S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM4S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM4S$func CKINVM4S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM4S$func CKINVM4S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM6S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM6S$func CKINVM6S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM6S$func CKINVM6S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKINVM8S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM8S$func CKINVM8S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM8S$func CKINVM8S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKMUX2M12S( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M12S$func CKMUX2M12S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M12S$func CKMUX2M12S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKMUX2M16SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M16SA$func CKMUX2M16SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M16SA$func CKMUX2M16SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKMUX2M2S( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M2S$func CKMUX2M2S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M2S$func CKMUX2M2S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKMUX2M3S( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M3S$func CKMUX2M3S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M3S$func CKMUX2M3S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKMUX2M4S( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M4S$func CKMUX2M4S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M4S$func CKMUX2M4S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKMUX2M6S( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M6S$func CKMUX2M6S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M6S$func CKMUX2M6S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKMUX2M8S( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M8S$func CKMUX2M8S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M8S$func CKMUX2M8S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKND2M12S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKND2M12S$func CKND2M12S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKND2M12S$func CKND2M12S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKND2M16SA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKND2M16SA$func CKND2M16SA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKND2M16SA$func CKND2M16SA_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKND2M2S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKND2M2S$func CKND2M2S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKND2M2S$func CKND2M2S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKND2M4S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKND2M4S$func CKND2M4S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKND2M4S$func CKND2M4S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKND2M6SA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKND2M6SA$func CKND2M6SA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKND2M6SA$func CKND2M6SA_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKND2M8S( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKND2M8S$func CKND2M8S_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKND2M8S$func CKND2M8S_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	// arc B --> Z
	 (B => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKXOR2M12SA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKXOR2M12SA$func CKXOR2M12SA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKXOR2M12SA$func CKXOR2M12SA_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc posedge A --> (Z:A)
	 (posedge A => (Z:A)) = (1.0,1.0);

	// arc negedge A --> (Z:A)
	 (negedge A => (Z:A)) = (1.0,1.0);

	// arc posedge B --> (Z:B)
	 (posedge B => (Z:B)) = (1.0,1.0);

	// arc negedge B --> (Z:B)
	 (negedge B => (Z:B)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKXOR2M1SA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKXOR2M1SA$func CKXOR2M1SA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKXOR2M1SA$func CKXOR2M1SA_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc posedge A --> (Z:A)
	 (posedge A => (Z:A)) = (1.0,1.0);

	// arc negedge A --> (Z:A)
	 (negedge A => (Z:A)) = (1.0,1.0);

	// arc posedge B --> (Z:B)
	 (posedge B => (Z:B)) = (1.0,1.0);

	// arc negedge B --> (Z:B)
	 (negedge B => (Z:B)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKXOR2M2SA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKXOR2M2SA$func CKXOR2M2SA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKXOR2M2SA$func CKXOR2M2SA_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc posedge A --> (Z:A)
	 (posedge A => (Z:A)) = (1.0,1.0);

	// arc negedge A --> (Z:A)
	 (negedge A => (Z:A)) = (1.0,1.0);

	// arc posedge B --> (Z:B)
	 (posedge B => (Z:B)) = (1.0,1.0);

	// arc negedge B --> (Z:B)
	 (negedge B => (Z:B)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKXOR2M4SA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKXOR2M4SA$func CKXOR2M4SA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKXOR2M4SA$func CKXOR2M4SA_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc posedge A --> (Z:A)
	 (posedge A => (Z:A)) = (1.0,1.0);

	// arc negedge A --> (Z:A)
	 (negedge A => (Z:A)) = (1.0,1.0);

	// arc posedge B --> (Z:B)
	 (posedge B => (Z:B)) = (1.0,1.0);

	// arc negedge B --> (Z:B)
	 (negedge B => (Z:B)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module CKXOR2M8SA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKXOR2M8SA$func CKXOR2M8SA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKXOR2M8SA$func CKXOR2M8SA_inst(.A(A),.B(B),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc posedge A --> (Z:A)
	 (posedge A => (Z:A)) = (1.0,1.0);

	// arc negedge A --> (Z:A)
	 (negedge A => (Z:A)) = (1.0,1.0);

	// arc posedge B --> (Z:B)
	 (posedge B => (Z:B)) = (1.0,1.0);

	// arc negedge B --> (Z:B)
	 (negedge B => (Z:B)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DEL1M1S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL1M1S$func DEL1M1S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL1M1S$func DEL1M1S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DEL1M4S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL1M4S$func DEL1M4S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL1M4S$func DEL1M4S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DEL2M1S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL2M1S$func DEL2M1S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL2M1S$func DEL2M1S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DEL2M4S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL2M4S$func DEL2M4S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL2M4S$func DEL2M4S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DEL3M1S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL3M1S$func DEL3M1S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL3M1S$func DEL3M1S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DEL3M4S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL3M4S$func DEL3M4S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL3M4S$func DEL3M4S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DEL4M1S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL4M1S$func DEL4M1S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL4M1S$func DEL4M1S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DEL4M4S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL4M4S$func DEL4M4S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL4M4S$func DEL4M4S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFAQM1SA( Q, A, B, CK);
input A, B, CK;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire A$delay ;
	wire B$delay ;
	wire CK$delay ;

	DFAQM1SA$func DFAQM1SA_inst(.A(A$delay),.B(B$delay),.CK(CK$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFAQM1SA$func DFAQM1SA_inst(.A(A),.B(B),.CK(CK),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : A))  = (1.0,1.0);

	// setuphold A- CK-LH
	$setuphold(posedge CK,negedge A,1.0,1.0,notifier,,,CK$delay,A$delay);

	// setuphold A- CK-LH
	$setuphold(posedge CK,posedge A,1.0,1.0,notifier,,,CK$delay,A$delay);

	// setuphold B- CK-LH
	$setuphold(posedge CK,negedge B,1.0,1.0,notifier,,,CK$delay,B$delay);

	// setuphold B- CK-LH
	$setuphold(posedge CK,posedge B,1.0,1.0,notifier,,,CK$delay,B$delay);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFAQM2SA( Q, A, B, CK);
input A, B, CK;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire A$delay ;
	wire B$delay ;
	wire CK$delay ;

	DFAQM2SA$func DFAQM2SA_inst(.A(A$delay),.B(B$delay),.CK(CK$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFAQM2SA$func DFAQM2SA_inst(.A(A),.B(B),.CK(CK),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : A))  = (1.0,1.0);

	// setuphold A- CK-LH
	$setuphold(posedge CK,negedge A,1.0,1.0,notifier,,,CK$delay,A$delay);

	// setuphold A- CK-LH
	$setuphold(posedge CK,posedge A,1.0,1.0,notifier,,,CK$delay,A$delay);

	// setuphold B- CK-LH
	$setuphold(posedge CK,negedge B,1.0,1.0,notifier,,,CK$delay,B$delay);

	// setuphold B- CK-LH
	$setuphold(posedge CK,posedge B,1.0,1.0,notifier,,,CK$delay,B$delay);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFAQM4SA( Q, A, B, CK);
input A, B, CK;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire A$delay ;
	wire B$delay ;
	wire CK$delay ;

	DFAQM4SA$func DFAQM4SA_inst(.A(A$delay),.B(B$delay),.CK(CK$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFAQM4SA$func DFAQM4SA_inst(.A(A),.B(B),.CK(CK),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : A))  = (1.0,1.0);

	// setuphold A- CK-LH
	$setuphold(posedge CK,negedge A,1.0,1.0,notifier,,,CK$delay,A$delay);

	// setuphold A- CK-LH
	$setuphold(posedge CK,posedge A,1.0,1.0,notifier,,,CK$delay,A$delay);

	// setuphold B- CK-LH
	$setuphold(posedge CK,negedge B,1.0,1.0,notifier,,,CK$delay,B$delay);

	// setuphold B- CK-LH
	$setuphold(posedge CK,posedge B,1.0,1.0,notifier,,,CK$delay,B$delay);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFAQM6SA( Q, A, B, CK);
input A, B, CK;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire A$delay ;
	wire B$delay ;
	wire CK$delay ;

	DFAQM6SA$func DFAQM6SA_inst(.A(A$delay),.B(B$delay),.CK(CK$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFAQM6SA$func DFAQM6SA_inst(.A(A),.B(B),.CK(CK),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : A))  = (1.0,1.0);

	// setuphold A- CK-LH
	$setuphold(posedge CK,negedge A,1.0,1.0,notifier,,,CK$delay,A$delay);

	// setuphold A- CK-LH
	$setuphold(posedge CK,posedge A,1.0,1.0,notifier,,,CK$delay,A$delay);

	// setuphold B- CK-LH
	$setuphold(posedge CK,negedge B,1.0,1.0,notifier,,,CK$delay,B$delay);

	// setuphold B- CK-LH
	$setuphold(posedge CK,posedge B,1.0,1.0,notifier,,,CK$delay,B$delay);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFAQM8SA( Q, A, B, CK);
input A, B, CK;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire A$delay ;
	wire B$delay ;
	wire CK$delay ;

	DFAQM8SA$func DFAQM8SA_inst(.A(A$delay),.B(B$delay),.CK(CK$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFAQM8SA$func DFAQM8SA_inst(.A(A),.B(B),.CK(CK),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : A))  = (1.0,1.0);

	// setuphold A- CK-LH
	$setuphold(posedge CK,negedge A,1.0,1.0,notifier,,,CK$delay,A$delay);

	// setuphold A- CK-LH
	$setuphold(posedge CK,posedge A,1.0,1.0,notifier,,,CK$delay,A$delay);

	// setuphold B- CK-LH
	$setuphold(posedge CK,negedge B,1.0,1.0,notifier,,,CK$delay,B$delay);

	// setuphold B- CK-LH
	$setuphold(posedge CK,posedge B,1.0,1.0,notifier,,,CK$delay,B$delay);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCM1SA( Q, QB, CKB, D);
input CKB, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCM1SA$func DFCM1SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCM1SA$func DFCM1SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,negedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,posedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCM2SA( Q, QB, CKB, D);
input CKB, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCM2SA$func DFCM2SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCM2SA$func DFCM2SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,negedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,posedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCM4SA( Q, QB, CKB, D);
input CKB, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCM4SA$func DFCM4SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCM4SA$func DFCM4SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,negedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,posedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCM8SA( Q, QB, CKB, D);
input CKB, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCM8SA$func DFCM8SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCM8SA$func DFCM8SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,negedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,posedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQM1SA( Q, CKB, D);
input CKB, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCQM1SA$func DFCQM1SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQM1SA$func DFCQM1SA_inst(.CKB(CKB),.D(D),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,negedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,posedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQM2SA( Q, CKB, D);
input CKB, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCQM2SA$func DFCQM2SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQM2SA$func DFCQM2SA_inst(.CKB(CKB),.D(D),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,negedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,posedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQM4SA( Q, CKB, D);
input CKB, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCQM4SA$func DFCQM4SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQM4SA$func DFCQM4SA_inst(.CKB(CKB),.D(D),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,negedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,posedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQM8SA( Q, CKB, D);
input CKB, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCQM8SA$func DFCQM8SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQM8SA$func DFCQM8SA_inst(.CKB(CKB),.D(D),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,negedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB,posedge D,1.0,1.0,notifier,,,CKB$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQRM1SA( Q, CKB, D, RB);
input CKB, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCQRM1SA$func DFCQRM1SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRM1SA$func DFCQRM1SA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB,negedge CKB,1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQRM2SA( Q, CKB, D, RB);
input CKB, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCQRM2SA$func DFCQRM2SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRM2SA$func DFCQRM2SA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB,negedge CKB,1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQRM4SA( Q, CKB, D, RB);
input CKB, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCQRM4SA$func DFCQRM4SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRM4SA$func DFCQRM4SA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB,negedge CKB,1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQRM8SA( Q, CKB, D, RB);
input CKB, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCQRM8SA$func DFCQRM8SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRM8SA$func DFCQRM8SA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB,negedge CKB,1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQRSM1SA( Q, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCQRSM1SA$func DFCQRSM1SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRSM1SA$func DFCQRSM1SA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge CKB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CKB-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge CKB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CKB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQRSM2SA( Q, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCQRSM2SA$func DFCQRSM2SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRSM2SA$func DFCQRSM2SA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge CKB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CKB-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge CKB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CKB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQRSM4SA( Q, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCQRSM4SA$func DFCQRSM4SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRSM4SA$func DFCQRSM4SA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge CKB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CKB-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge CKB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CKB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQRSM8SA( Q, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCQRSM8SA$func DFCQRSM8SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRSM8SA$func DFCQRSM8SA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge CKB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CKB-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge CKB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CKB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQSM1SA( Q, CKB, D, SB);
input CKB, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCQSM1SA$func DFCQSM1SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQSM1SA$func DFCQSM1SA_inst(.CKB(CKB),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem SB-CKB-negedge
	$recrem(posedge SB,negedge CKB,1.0,1.0,notifier,,,SB$delay,CKB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQSM2SA( Q, CKB, D, SB);
input CKB, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCQSM2SA$func DFCQSM2SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQSM2SA$func DFCQSM2SA_inst(.CKB(CKB),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem SB-CKB-negedge
	$recrem(posedge SB,negedge CKB,1.0,1.0,notifier,,,SB$delay,CKB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQSM4SA( Q, CKB, D, SB);
input CKB, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCQSM4SA$func DFCQSM4SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQSM4SA$func DFCQSM4SA_inst(.CKB(CKB),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem SB-CKB-negedge
	$recrem(posedge SB,negedge CKB,1.0,1.0,notifier,,,SB$delay,CKB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCQSM8SA( Q, CKB, D, SB);
input CKB, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCQSM8SA$func DFCQSM8SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQSM8SA$func DFCQSM8SA_inst(.CKB(CKB),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem SB-CKB-negedge
	$recrem(posedge SB,negedge CKB,1.0,1.0,notifier,,,SB$delay,CKB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCRM1SA( Q, QB, CKB, D, RB);
input CKB, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCRM1SA$func DFCRM1SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRM1SA$func DFCRM1SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB,negedge CKB,1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCRM2SA( Q, QB, CKB, D, RB);
input CKB, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCRM2SA$func DFCRM2SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRM2SA$func DFCRM2SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB,negedge CKB,1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCRM4SA( Q, QB, CKB, D, RB);
input CKB, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCRM4SA$func DFCRM4SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRM4SA$func DFCRM4SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB,negedge CKB,1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCRM8SA( Q, QB, CKB, D, RB);
input CKB, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCRM8SA$func DFCRM8SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRM8SA$func DFCRM8SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB,negedge CKB,1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCRSM1SA( Q, QB, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCRSM1SA$func DFCRSM1SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRSM1SA$func DFCRSM1SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge CKB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CKB-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge CKB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CKB$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB,posedge RB,1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB,posedge SB,1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCRSM2SA( Q, QB, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCRSM2SA$func DFCRSM2SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRSM2SA$func DFCRSM2SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge CKB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CKB-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge CKB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CKB$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB,posedge RB,1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB,posedge SB,1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCRSM4SA( Q, QB, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCRSM4SA$func DFCRSM4SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRSM4SA$func DFCRSM4SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge CKB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CKB-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge CKB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CKB$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB,posedge RB,1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB,posedge SB,1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCRSM8SA( Q, QB, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCRSM8SA$func DFCRSM8SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRSM8SA$func DFCRSM8SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem RB-CKB-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge CKB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CKB$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CKB-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge CKB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CKB$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB,posedge RB,1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB,posedge SB,1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCSM1SA( Q, QB, CKB, D, SB);
input CKB, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCSM1SA$func DFCSM1SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCSM1SA$func DFCSM1SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem SB-CKB-negedge
	$recrem(posedge SB,negedge CKB,1.0,1.0,notifier,,,SB$delay,CKB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCSM2SA( Q, QB, CKB, D, SB);
input CKB, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCSM2SA$func DFCSM2SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCSM2SA$func DFCSM2SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem SB-CKB-negedge
	$recrem(posedge SB,negedge CKB,1.0,1.0,notifier,,,SB$delay,CKB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCSM4SA( Q, QB, CKB, D, SB);
input CKB, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCSM4SA$func DFCSM4SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCSM4SA$func DFCSM4SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem SB-CKB-negedge
	$recrem(posedge SB,negedge CKB,1.0,1.0,notifier,,,SB$delay,CKB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFCSM8SA( Q, QB, CKB, D, SB);
input CKB, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCSM8SA$func DFCSM8SA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCSM8SA$func DFCSM8SA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CKB --> Q
	(negedge CKB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CKB --> QB
	(negedge CKB => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CKB,1.0,0,notifier);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// setuphold D- CKB-HL
	$setuphold(negedge CKB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CKB$delay,D$delay);

	// recrem SB-CKB-negedge
	$recrem(posedge SB,negedge CKB,1.0,1.0,notifier,,,SB$delay,CKB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEM1SA( Q, QB, CK, D, E);
input CK, D, E;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEM1SA$func DFEM1SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEM1SA$func DFEM1SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		negedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		posedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEM2SA( Q, QB, CK, D, E);
input CK, D, E;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEM2SA$func DFEM2SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEM2SA$func DFEM2SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		negedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		posedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEM4SA( Q, QB, CK, D, E);
input CK, D, E;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEM4SA$func DFEM4SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEM4SA$func DFEM4SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		negedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		posedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEM8SA( Q, QB, CK, D, E);
input CK, D, E;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEM8SA$func DFEM8SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEM8SA$func DFEM8SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		negedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		posedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQBM1SA( QB, CK, D, E);
input CK, D, E;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQBM1SA$func DFEQBM1SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQBM1SA$func DFEQBM1SA_inst(.CK(CK),.D(D),.E(E),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		negedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		posedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQBM2SA( QB, CK, D, E);
input CK, D, E;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQBM2SA$func DFEQBM2SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQBM2SA$func DFEQBM2SA_inst(.CK(CK),.D(D),.E(E),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		negedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		posedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQBM4SA( QB, CK, D, E);
input CK, D, E;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQBM4SA$func DFEQBM4SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQBM4SA$func DFEQBM4SA_inst(.CK(CK),.D(D),.E(E),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		negedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		posedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQBM8SA( QB, CK, D, E);
input CK, D, E;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQBM8SA$func DFEQBM8SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQBM8SA$func DFEQBM8SA_inst(.CK(CK),.D(D),.E(E),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		negedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		posedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQM0SA( Q, CK, D, E);
input CK, D, E;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQM0SA$func DFEQM0SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQM0SA$func DFEQM0SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		negedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		posedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQM1SA( Q, CK, D, E);
input CK, D, E;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQM1SA$func DFEQM1SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQM1SA$func DFEQM1SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		negedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		posedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQM2SA( Q, CK, D, E);
input CK, D, E;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQM2SA$func DFEQM2SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQM2SA$func DFEQM2SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		negedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		posedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQM4SA( Q, CK, D, E);
input CK, D, E;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQM4SA$func DFEQM4SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQM4SA$func DFEQM4SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		negedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		posedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQM8SA( Q, CK, D, E);
input CK, D, E;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQM8SA$func DFEQM8SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQM8SA$func DFEQM8SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		negedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E === 1'b1),
		posedge D &&& (ENABLE_E === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQRM1SA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQRM1SA$func DFEQRM1SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);


   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQRM1SA$func DFEQRM1SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQRM2SA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQRM2SA$func DFEQRM2SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);


   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQRM2SA$func DFEQRM2SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQRM4SA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQRM4SA$func DFEQRM4SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);


   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQRM4SA$func DFEQRM4SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQRM8SA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQRM8SA$func DFEQRM8SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);


   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQRM8SA$func DFEQRM8SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQZRM1SA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQZRM1SA$func DFEQZRM1SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQZRM1SA$func DFEQZRM1SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQZRM2SA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQZRM2SA$func DFEQZRM2SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQZRM2SA$func DFEQZRM2SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQZRM4SA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQZRM4SA$func DFEQZRM4SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQZRM4SA$func DFEQZRM4SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEQZRM8SA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQZRM8SA$func DFEQZRM8SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQZRM8SA$func DFEQZRM8SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFERM1SA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFERM1SA$func DFERM1SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);



   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFERM1SA$func DFERM1SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFERM2SA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFERM2SA$func DFERM2SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);



   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFERM2SA$func DFERM2SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFERM4SA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFERM4SA$func DFERM4SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);



   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFERM4SA$func DFERM4SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFERM8SA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFERM8SA$func DFERM8SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);



   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFERM8SA$func DFERM8SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEZRM1SA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEZRM1SA$func DFEZRM1SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEZRM1SA$func DFEZRM1SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEZRM2SA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEZRM2SA$func DFEZRM2SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEZRM2SA$func DFEZRM2SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEZRM4SA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEZRM4SA$func DFEZRM4SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEZRM4SA$func DFEZRM4SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFEZRM8SA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEZRM8SA$func DFEZRM8SA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEZRM8SA$func DFEZRM8SA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		negedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_E_AND_RB === 1'b1),
		posedge D &&& (ENABLE_E_AND_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge E &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFM1SA( Q, QB, CK, D);
input CK, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFM1SA$func DFM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFM1SA$func DFM1SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK,negedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK,posedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFM2SA( Q, QB, CK, D);
input CK, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFM2SA$func DFM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFM2SA$func DFM2SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK,negedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK,posedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFM4SA( Q, QB, CK, D);
input CK, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFM4SA$func DFM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFM4SA$func DFM4SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK,negedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK,posedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFM8SA( Q, QB, CK, D);
input CK, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFM8SA$func DFM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFM8SA$func DFM8SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK,negedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK,posedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFMM1SA( Q, QB, CK, D1, D2, S);
input CK, D1, D2, S;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMM1SA$func DFMM1SA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.QB(QB),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMM1SA$func DFMM1SA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.QB(QB),.S(S),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D1))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D1))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		negedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		posedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		negedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		posedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,negedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,posedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFMM2SA( Q, QB, CK, D1, D2, S);
input CK, D1, D2, S;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMM2SA$func DFMM2SA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.QB(QB),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMM2SA$func DFMM2SA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.QB(QB),.S(S),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D1))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D1))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		negedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		posedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		negedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		posedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,negedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,posedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFMM4SA( Q, QB, CK, D1, D2, S);
input CK, D1, D2, S;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMM4SA$func DFMM4SA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.QB(QB),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMM4SA$func DFMM4SA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.QB(QB),.S(S),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D1))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D1))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		negedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		posedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		negedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		posedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,negedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,posedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFMM8SA( Q, QB, CK, D1, D2, S);
input CK, D1, D2, S;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMM8SA$func DFMM8SA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.QB(QB),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMM8SA$func DFMM8SA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.QB(QB),.S(S),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D1))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D1))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		negedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		posedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		negedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		posedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,negedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,posedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFMQM1SA( Q, CK, D1, D2, S);
input CK, D1, D2, S;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMQM1SA$func DFMQM1SA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMQM1SA$func DFMQM1SA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.S(S),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D1))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		negedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		posedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		negedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		posedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,negedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,posedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFMQM2SA( Q, CK, D1, D2, S);
input CK, D1, D2, S;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMQM2SA$func DFMQM2SA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMQM2SA$func DFMQM2SA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.S(S),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D1))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		negedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		posedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		negedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		posedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,negedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,posedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFMQM4SA( Q, CK, D1, D2, S);
input CK, D1, D2, S;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMQM4SA$func DFMQM4SA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMQM4SA$func DFMQM4SA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.S(S),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D1))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		negedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		posedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		negedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		posedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,negedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,posedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFMQM8SA( Q, CK, D1, D2, S);
input CK, D1, D2, S;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMQM8SA$func DFMQM8SA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMQM8SA$func DFMQM8SA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.S(S),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D1))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		negedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D1- CK-LH
	$setuphold(posedge CK &&& (ENABLE_S === 1'b1),
		posedge D1 &&& (ENABLE_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D1$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		negedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold D2- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_S === 1'b1),
		posedge D2 &&& (ENABLE_NOT_S === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D2$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,negedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

	// setuphold S- CK-LH
	$setuphold(posedge CK,posedge S,1.0,1.0,notifier,,,CK$delay,S$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQBM1SA( QB, CK, D);
input CK, D;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQBM1SA$func DFQBM1SA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBM1SA$func DFQBM1SA_inst(.CK(CK),.D(D),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK,negedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK,posedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQBM2SA( QB, CK, D);
input CK, D;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQBM2SA$func DFQBM2SA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBM2SA$func DFQBM2SA_inst(.CK(CK),.D(D),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK,negedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK,posedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQBM4SA( QB, CK, D);
input CK, D;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQBM4SA$func DFQBM4SA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBM4SA$func DFQBM4SA_inst(.CK(CK),.D(D),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK,negedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK,posedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQBM8SA( QB, CK, D);
input CK, D;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQBM8SA$func DFQBM8SA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBM8SA$func DFQBM8SA_inst(.CK(CK),.D(D),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK,negedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK,posedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQBRM1SA( QB, CK, D, RB);
input CK, D, RB;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQBRM1SA$func DFQBRM1SA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBRM1SA$func DFQBRM1SA_inst(.CK(CK),.D(D),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQBRM2SA( QB, CK, D, RB);
input CK, D, RB;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQBRM2SA$func DFQBRM2SA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBRM2SA$func DFQBRM2SA_inst(.CK(CK),.D(D),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQBRM4SA( QB, CK, D, RB);
input CK, D, RB;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQBRM4SA$func DFQBRM4SA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBRM4SA$func DFQBRM4SA_inst(.CK(CK),.D(D),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQBRM8SA( QB, CK, D, RB);
input CK, D, RB;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQBRM8SA$func DFQBRM8SA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBRM8SA$func DFQBRM8SA_inst(.CK(CK),.D(D),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQM1SA( Q, CK, D);
input CK, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQM1SA$func DFQM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQM1SA$func DFQM1SA_inst(.CK(CK),.D(D),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK,negedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK,posedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQM2SA( Q, CK, D);
input CK, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQM2SA$func DFQM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQM2SA$func DFQM2SA_inst(.CK(CK),.D(D),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK,negedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK,posedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQM4SA( Q, CK, D);
input CK, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQM4SA$func DFQM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQM4SA$func DFQM4SA_inst(.CK(CK),.D(D),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK,negedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK,posedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQM8SA( Q, CK, D);
input CK, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQM8SA$func DFQM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQM8SA$func DFQM8SA_inst(.CK(CK),.D(D),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK,negedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK,posedge D,1.0,1.0,notifier,,,CK$delay,D$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQRM1SA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQRM1SA$func DFQRM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRM1SA$func DFQRM1SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQRM2SA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQRM2SA$func DFQRM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRM2SA$func DFQRM2SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQRM4SA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQRM4SA$func DFQRM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRM4SA$func DFQRM4SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQRM8SA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQRM8SA$func DFQRM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRM8SA$func DFQRM8SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQRSM1SA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQRSM1SA$func DFQRSM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRSM1SA$func DFQRSM1SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge CK &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CK-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge CK &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CK$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQRSM2SA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQRSM2SA$func DFQRSM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRSM2SA$func DFQRSM2SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge CK &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CK-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge CK &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CK$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQRSM4SA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQRSM4SA$func DFQRSM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRSM4SA$func DFQRSM4SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge CK &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CK-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge CK &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CK$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQRSM8SA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQRSM8SA$func DFQRSM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRSM8SA$func DFQRSM8SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge CK &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CK-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge CK &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CK$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQSM1SA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQSM1SA$func DFQSM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQSM1SA$func DFQSM1SA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem SB-CK-posedge
	$recrem(posedge SB,posedge CK,1.0,1.0,notifier,,,SB$delay,CK$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQSM2SA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQSM2SA$func DFQSM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQSM2SA$func DFQSM2SA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem SB-CK-posedge
	$recrem(posedge SB,posedge CK,1.0,1.0,notifier,,,SB$delay,CK$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQSM4SA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQSM4SA$func DFQSM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQSM4SA$func DFQSM4SA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem SB-CK-posedge
	$recrem(posedge SB,posedge CK,1.0,1.0,notifier,,,SB$delay,CK$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQSM8SA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQSM8SA$func DFQSM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQSM8SA$func DFQSM8SA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem SB-CK-posedge
	$recrem(posedge SB,posedge CK,1.0,1.0,notifier,,,SB$delay,CK$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQZRM1SA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQZRM1SA$func DFQZRM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRM1SA$func DFQZRM1SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        negedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        posedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQZRM2SA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQZRM2SA$func DFQZRM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRM2SA$func DFQZRM2SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        negedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        posedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQZRM4SA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQZRM4SA$func DFQZRM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRM4SA$func DFQZRM4SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        negedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        posedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQZRM8SA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQZRM8SA$func DFQZRM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRM8SA$func DFQZRM8SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        negedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        posedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQZRSM1SA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQZRSM1SA$func DFQZRSM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);



  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRSM1SA$func DFQZRSM1SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQZRSM2SA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQZRSM2SA$func DFQZRSM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);



  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRSM2SA$func DFQZRSM2SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQZRSM4SA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQZRSM4SA$func DFQZRSM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);



  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRSM4SA$func DFQZRSM4SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQZRSM8SA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQZRSM8SA$func DFQZRSM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);



  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRSM8SA$func DFQZRSM8SA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQZSM1SA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQZSM1SA$func DFQZSM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));
  	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZSM1SA$func DFQZSM1SA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        negedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        posedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,negedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,posedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQZSM2SA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQZSM2SA$func DFQZSM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));
  	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZSM2SA$func DFQZSM2SA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        negedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        posedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,negedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,posedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQZSM4SA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQZSM4SA$func DFQZSM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));
  	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZSM4SA$func DFQZSM4SA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        negedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        posedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,negedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,posedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFQZSM8SA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQZSM8SA$func DFQZSM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));
  	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZSM8SA$func DFQZSM8SA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        negedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        posedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,negedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,posedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFRM1SA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFRM1SA$func DFRM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRM1SA$func DFRM1SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFRM2SA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFRM2SA$func DFRM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRM2SA$func DFRM2SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFRM4SA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFRM4SA$func DFRM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRM4SA$func DFRM4SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFRM8SA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFRM8SA$func DFRM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRM8SA$func DFRM8SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB,posedge CK,1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFRSM1SA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFRSM1SA$func DFRSM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRSM1SA$func DFRSM1SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge CK &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CK-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge CK &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CK$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB,posedge RB,1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB,posedge SB,1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFRSM2SA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFRSM2SA$func DFRSM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRSM2SA$func DFRSM2SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge CK &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CK-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge CK &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CK$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB,posedge RB,1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB,posedge SB,1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFRSM4SA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFRSM4SA$func DFRSM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRSM4SA$func DFRSM4SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge CK &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CK-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge CK &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CK$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB,posedge RB,1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB,posedge SB,1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFRSM8SA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFRSM8SA$func DFRSM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRSM8SA$func DFRSM8SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem RB-CK-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge CK &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,CK$delay);

	$width(negedge RB,1.0,0,notifier);

	// setup RB-LH SB-LH
	$setup(posedge RB,posedge SB,1.0,notifier);

	// hold RB-LH SB-LH
	$hold(posedge SB,posedge RB,1.0,notifier);

	// recrem SB-CK-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge CK &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,CK$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB,posedge RB,1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB,posedge SB,1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFSM1SA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFSM1SA$func DFSM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFSM1SA$func DFSM1SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem SB-CK-posedge
	$recrem(posedge SB,posedge CK,1.0,1.0,notifier,,,SB$delay,CK$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFSM2SA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFSM2SA$func DFSM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFSM2SA$func DFSM2SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem SB-CK-posedge
	$recrem(posedge SB,posedge CK,1.0,1.0,notifier,,,SB$delay,CK$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFSM4SA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFSM4SA$func DFSM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFSM4SA$func DFSM4SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem SB-CK-posedge
	$recrem(posedge SB,posedge CK,1.0,1.0,notifier,,,SB$delay,CK$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFSM8SA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFSM8SA$func DFSM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFSM8SA$func DFSM8SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// recrem SB-CK-posedge
	$recrem(posedge SB,posedge CK,1.0,1.0,notifier,,,SB$delay,CK$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFZRM1SA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFZRM1SA$func DFZRM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRM1SA$func DFZRM1SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        negedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        posedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFZRM2SA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFZRM2SA$func DFZRM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRM2SA$func DFZRM2SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        negedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        posedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFZRM4SA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFZRM4SA$func DFZRM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRM4SA$func DFZRM4SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        negedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        posedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFZRM8SA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFZRM8SA$func DFZRM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRM8SA$func DFZRM8SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        negedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
        posedge D &&& (ENABLE_RB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFZRSM1SA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFZRSM1SA$func DFZRSM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRSM1SA$func DFZRSM1SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFZRSM2SA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFZRSM2SA$func DFZRSM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRSM2SA$func DFZRSM2SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFZRSM4SA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFZRSM4SA$func DFZRSM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRSM4SA$func DFZRSM4SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFZRSM8SA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFZRSM8SA$func DFZRSM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRSM8SA$func DFZRSM8SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,negedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold RB- CK-LH
	$setuphold(posedge CK,posedge RB,1.0,1.0,notifier,,,CK$delay,RB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		negedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK &&& (ENABLE_RB === 1'b1),
		posedge SB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFZSM1SA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFZSM1SA$func DFZSM1SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZSM1SA$func DFZSM1SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        negedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        posedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,negedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,posedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFZSM2SA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFZSM2SA$func DFZSM2SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZSM2SA$func DFZSM2SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        negedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        posedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,negedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,posedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFZSM4SA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFZSM4SA$func DFZSM4SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZSM4SA$func DFZSM4SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        negedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        posedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,negedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,posedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module DFZSM8SA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFZSM8SA$func DFZSM8SA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZSM8SA$func DFZSM8SA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc CK --> Q
	(posedge CK => (Q : D))  = (1.0,1.0);

	// arc CK --> QB
	(posedge CK => (QB : D))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	$width(posedge CK,1.0,0,notifier);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        negedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold D- CK-LH
	$setuphold(posedge CK &&& (ENABLE_SB === 1'b1),
        posedge D &&& (ENABLE_SB === 1'b1),1.0,1.0,notifier,,,CK$delay,D$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,negedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

	// setuphold SB- CK-LH
	$setuphold(posedge CK,posedge SB,1.0,1.0,notifier,,,CK$delay,SB$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM0S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM0S$func INVM0S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM0S$func INVM0S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM10S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM10S$func INVM10S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM10S$func INVM10S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM12S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM12S$func INVM12S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM12S$func INVM12S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM14S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM14S$func INVM14S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM14S$func INVM14S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM16S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM16S$func INVM16S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM16S$func INVM16S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM18S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM18S$func INVM18S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM18S$func INVM18S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM1S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM1S$func INVM1S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM1S$func INVM1S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM20S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM20S$func INVM20S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM20S$func INVM20S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM22SA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM22SA$func INVM22SA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM22SA$func INVM22SA_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM24S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM24S$func INVM24S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM24S$func INVM24S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM26SA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM26SA$func INVM26SA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM26SA$func INVM26SA_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM2S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM2S$func INVM2S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM2S$func INVM2S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM32S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM32S$func INVM32S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM32S$func INVM32S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM3S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM3S$func INVM3S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM3S$func INVM3S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM40S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM40S$func INVM40S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM40S$func INVM40S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM48S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM48S$func INVM48S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM48S$func INVM48S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM4S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM4S$func INVM4S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM4S$func INVM4S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM5S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM5S$func INVM5S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM5S$func INVM5S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM6S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM6S$func INVM6S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM6S$func INVM6S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module INVM8S( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM8S$func INVM8S_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM8S$func INVM8S_inst(.A(A),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc A --> Z
	 (A => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACM1SA( Q, QB, D, GB);
input D, GB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACM1SA$func LACM1SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACM1SA$func LACM1SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB,negedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB,posedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACM2SA( Q, QB, D, GB);
input D, GB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACM2SA$func LACM2SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACM2SA$func LACM2SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB,negedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB,posedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACM4SA( Q, QB, D, GB);
input D, GB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACM4SA$func LACM4SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACM4SA$func LACM4SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB,negedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB,posedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACM8SA( Q, QB, D, GB);
input D, GB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACM8SA$func LACM8SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACM8SA$func LACM8SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB,negedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB,posedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQM1SA( Q, D, GB);
input D, GB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACQM1SA$func LACQM1SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQM1SA$func LACQM1SA_inst(.D(D),.GB(GB),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB,negedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB,posedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQM2SA( Q, D, GB);
input D, GB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACQM2SA$func LACQM2SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQM2SA$func LACQM2SA_inst(.D(D),.GB(GB),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB,negedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB,posedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQM4SA( Q, D, GB);
input D, GB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACQM4SA$func LACQM4SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQM4SA$func LACQM4SA_inst(.D(D),.GB(GB),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB,negedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB,posedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQM8SA( Q, D, GB);
input D, GB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACQM8SA$func LACQM8SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQM8SA$func LACQM8SA_inst(.D(D),.GB(GB),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB,negedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB,posedge D,1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQRM1SA( Q, D, GB, RB);
input D, GB, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACQRM1SA$func LACQRM1SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRM1SA$func LACQRM1SA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB,posedge GB,1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQRM2SA( Q, D, GB, RB);
input D, GB, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACQRM2SA$func LACQRM2SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRM2SA$func LACQRM2SA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB,posedge GB,1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQRM4SA( Q, D, GB, RB);
input D, GB, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACQRM4SA$func LACQRM4SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRM4SA$func LACQRM4SA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB,posedge GB,1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQRM8SA( Q, D, GB, RB);
input D, GB, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACQRM8SA$func LACQRM8SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRM8SA$func LACQRM8SA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB,posedge GB,1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQRSM1SA( Q, D, GB, RB, SB);
input D, GB, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACQRSM1SA$func LACQRSM1SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRSM1SA$func LACQRSM1SA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge GB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge GB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,GB$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_GB === 1'b1),
		posedge RB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_GB === 1'b1),
		posedge SB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQRSM2SA( Q, D, GB, RB, SB);
input D, GB, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACQRSM2SA$func LACQRSM2SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRSM2SA$func LACQRSM2SA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge GB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge GB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,GB$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_GB === 1'b1),
		posedge RB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_GB === 1'b1),
		posedge SB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQRSM4SA( Q, D, GB, RB, SB);
input D, GB, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACQRSM4SA$func LACQRSM4SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRSM4SA$func LACQRSM4SA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge GB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge GB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,GB$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_GB === 1'b1),
		posedge RB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_GB === 1'b1),
		posedge SB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQRSM8SA( Q, D, GB, RB, SB);
input D, GB, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACQRSM8SA$func LACQRSM8SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRSM8SA$func LACQRSM8SA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge GB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge GB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,GB$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_GB === 1'b1),
		posedge RB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_GB === 1'b1),
		posedge SB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQSM1SA( Q, D, GB, SB);
input D, GB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACQSM1SA$func LACQSM1SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQSM1SA$func LACQSM1SA_inst(.D(D),.GB(GB),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB,posedge GB,1.0,1.0,notifier,,,SB$delay,GB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQSM2SA( Q, D, GB, SB);
input D, GB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACQSM2SA$func LACQSM2SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQSM2SA$func LACQSM2SA_inst(.D(D),.GB(GB),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB,posedge GB,1.0,1.0,notifier,,,SB$delay,GB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQSM4SA( Q, D, GB, SB);
input D, GB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACQSM4SA$func LACQSM4SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQSM4SA$func LACQSM4SA_inst(.D(D),.GB(GB),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB,posedge GB,1.0,1.0,notifier,,,SB$delay,GB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACQSM8SA( Q, D, GB, SB);
input D, GB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACQSM8SA$func LACQSM8SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQSM8SA$func LACQSM8SA_inst(.D(D),.GB(GB),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB,posedge GB,1.0,1.0,notifier,,,SB$delay,GB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACRM1SA( Q, QB, D, GB, RB);
input D, GB, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACRM1SA$func LACRM1SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRM1SA$func LACRM1SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB,posedge GB,1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACRM2SA( Q, QB, D, GB, RB);
input D, GB, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACRM2SA$func LACRM2SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRM2SA$func LACRM2SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB,posedge GB,1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACRM4SA( Q, QB, D, GB, RB);
input D, GB, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACRM4SA$func LACRM4SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRM4SA$func LACRM4SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB,posedge GB,1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACRM8SA( Q, QB, D, GB, RB);
input D, GB, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACRM8SA$func LACRM8SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRM8SA$func LACRM8SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB,posedge GB,1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACRSM1SA( Q, QB, D, GB, RB, SB);
input D, GB, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACRSM1SA$func LACRSM1SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRSM1SA$func LACRSM1SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge GB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge GB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,GB$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_GB === 1'b1),
		posedge RB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_GB === 1'b1),
		posedge SB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACRSM2SA( Q, QB, D, GB, RB, SB);
input D, GB, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACRSM2SA$func LACRSM2SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRSM2SA$func LACRSM2SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge GB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge GB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,GB$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_GB === 1'b1),
		posedge RB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_GB === 1'b1),
		posedge SB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACRSM4SA( Q, QB, D, GB, RB, SB);
input D, GB, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACRSM4SA$func LACRSM4SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRSM4SA$func LACRSM4SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge GB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge GB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,GB$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_GB === 1'b1),
		posedge RB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_GB === 1'b1),
		posedge SB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACRSM8SA( Q, QB, D, GB, RB, SB);
input D, GB, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACRSM8SA$func LACRSM8SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRSM8SA$func LACRSM8SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem RB-GB-posedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		posedge GB &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,GB$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		posedge GB &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,GB$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_GB === 1'b1),
		posedge RB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_GB === 1'b1),
		posedge SB &&& (ENABLE_GB === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACSM1SA( Q, QB, D, GB, SB);
input D, GB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACSM1SA$func LACSM1SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACSM1SA$func LACSM1SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB,posedge GB,1.0,1.0,notifier,,,SB$delay,GB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACSM2SA( Q, QB, D, GB, SB);
input D, GB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACSM2SA$func LACSM2SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACSM2SA$func LACSM2SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB,posedge GB,1.0,1.0,notifier,,,SB$delay,GB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACSM4SA( Q, QB, D, GB, SB);
input D, GB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACSM4SA$func LACSM4SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACSM4SA$func LACSM4SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB,posedge GB,1.0,1.0,notifier,,,SB$delay,GB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LACSM8SA( Q, QB, D, GB, SB);
input D, GB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACSM8SA$func LACSM8SA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACSM8SA$func LACSM8SA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc GB --> Q
	(negedge GB => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc GB --> QB
	(negedge GB => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	// setuphold D- GB-LH
	$setuphold(posedge GB &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,GB$delay,D$delay);

	$width(negedge GB,1.0,0,notifier);

	// recrem SB-GB-posedge
	$recrem(posedge SB,posedge GB,1.0,1.0,notifier,,,SB$delay,GB$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCECSM12SA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM12SA$func LAGCECSM12SA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM12SA$func LAGCECSM12SA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	ifnone
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CKB --> GCK
	 (posedge CKB => (GCK : E))  = (1.0,1.0);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCECSM16SA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM16SA$func LAGCECSM16SA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM16SA$func LAGCECSM16SA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	ifnone
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CKB --> GCK
	 (posedge CKB => (GCK : E))  = (1.0,1.0);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCECSM24SA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM24SA$func LAGCECSM24SA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM24SA$func LAGCECSM24SA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	ifnone
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CKB --> GCK
	  (posedge CKB => (GCK : E))  = (1.0,1.0);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCECSM2SA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM2SA$func LAGCECSM2SA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM2SA$func LAGCECSM2SA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	ifnone
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CKB --> GCK
	 (posedge CKB => (GCK : E))  = (1.0,1.0);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCECSM32SA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM32SA$func LAGCECSM32SA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM32SA$func LAGCECSM32SA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	ifnone
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CKB --> GCK
	 (posedge CKB => (GCK : E))  = (1.0,1.0);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCECSM40SA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM40SA$func LAGCECSM40SA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM40SA$func LAGCECSM40SA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	ifnone
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CKB --> GCK
	 (posedge CKB => (GCK : E))  = (1.0,1.0);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCECSM48SA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM48SA$func LAGCECSM48SA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM48SA$func LAGCECSM48SA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	ifnone
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CKB --> GCK
	 (posedge CKB => (GCK : E))  = (1.0,1.0);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCECSM4SA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM4SA$func LAGCECSM4SA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM4SA$func LAGCECSM4SA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	ifnone
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CKB --> GCK
	 (posedge CKB => (GCK : E))  = (1.0,1.0);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCECSM6SA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM6SA$func LAGCECSM6SA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM6SA$func LAGCECSM6SA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	ifnone
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CKB --> GCK
	 (posedge CKB => (GCK : E))  = (1.0,1.0);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCECSM8SA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM8SA$func LAGCECSM8SA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM8SA$func LAGCECSM8SA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	ifnone
	// arc CKB --> GCK
	 (CKB => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CKB --> GCK
	 (posedge CKB => (GCK : E))  = (1.0,1.0);

	$width(posedge CKB,1.0,0,notifier);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold E- CKB-HL
	$setuphold(negedge CKB,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CKB$delay,E$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

	// setuphold SE- CKB-HL
	$setuphold(negedge CKB,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CKB$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEM12S( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM12S$func LAGCEM12S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM12S$func LAGCEM12S_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b1)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEM16S( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM16S$func LAGCEM16S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM16S$func LAGCEM16S_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b1)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEM20S( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM20S$func LAGCEM20S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM20S$func LAGCEM20S_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b1)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEM2S( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM2S$func LAGCEM2S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM2S$func LAGCEM2S_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b1)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEM3S( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM3S$func LAGCEM3S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM3S$func LAGCEM3S_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b1)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEM4S( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM4S$func LAGCEM4S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM4S$func LAGCEM4S_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b1)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEM6S( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM6S$func LAGCEM6S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM6S$func LAGCEM6S_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b1)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEM8S( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM8S$func LAGCEM8S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM8S$func LAGCEM8S_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b1)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPM12S( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM12S$func LAGCEPM12S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM12S$func LAGCEPM12S_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		negedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		posedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPM16S( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM16S$func LAGCEPM16S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM16S$func LAGCEPM16S_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		negedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		posedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPM20S( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM20S$func LAGCEPM20S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM20S$func LAGCEPM20S_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		negedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		posedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPM2S( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM2S$func LAGCEPM2S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM2S$func LAGCEPM2S_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		negedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		posedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPM3S( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM3S$func LAGCEPM3S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM3S$func LAGCEPM3S_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		negedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		posedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPM4S( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM4S$func LAGCEPM4S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM4S$func LAGCEPM4S_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		negedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		posedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPM6S( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM6S$func LAGCEPM6S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM6S$func LAGCEPM6S_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		negedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		posedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPM8S( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM8S$func LAGCEPM8S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM8S$func LAGCEPM8S_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		negedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK &&& (ENABLE_NOT_SE === 1'b1),
		posedge E &&& (ENABLE_NOT_SE === 1'b1),
		1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPOM12S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM12S$func LAGCEPOM12S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM12S$func LAGCEPOM12S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	// arc CK --> OBS
	(negedge CK => (OBS : E))  = (1.0,1.0);

	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPOM16S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM16S$func LAGCEPOM16S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM16S$func LAGCEPOM16S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	// arc CK --> OBS
	(negedge CK => (OBS : E))  = (1.0,1.0);

	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPOM20S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM20S$func LAGCEPOM20S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM20S$func LAGCEPOM20S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	// arc CK --> OBS
	(negedge CK => (OBS : E))  = (1.0,1.0);

	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPOM2S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM2S$func LAGCEPOM2S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM2S$func LAGCEPOM2S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	// arc CK --> OBS
	(negedge CK => (OBS : E))  = (1.0,1.0);

	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPOM3S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM3S$func LAGCEPOM3S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM3S$func LAGCEPOM3S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	// arc CK --> OBS
	(negedge CK => (OBS : E))  = (1.0,1.0);

	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPOM4S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM4S$func LAGCEPOM4S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM4S$func LAGCEPOM4S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	// arc CK --> OBS
	(negedge CK => (OBS : E))  = (1.0,1.0);

	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPOM6S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM6S$func LAGCEPOM6S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM6S$func LAGCEPOM6S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	// arc CK --> OBS
	(negedge CK => (OBS : E))  = (1.0,1.0);

	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCEPOM8S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM8S$func LAGCEPOM8S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM8S$func LAGCEPOM8S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	(negedge CK => (GCK : E))  = (1.0,1.0);

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	(CK => GCK)  = (1.0,1.0);

	if(E===1'b0)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	if(E===1'b1)
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	ifnone
	// arc SE --> GCK
	 (SE => GCK) = (1.0,1.0);

	// arc CK --> OBS
	(negedge CK => (OBS : E))  = (1.0,1.0);

	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E,1.0,1.0,notifier,,,CK$delay,E$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESM12SA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM12SA$func LAGCESM12SA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM12SA$func LAGCESM12SA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESM16SA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM16SA$func LAGCESM16SA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM16SA$func LAGCESM16SA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESM24SA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM24SA$func LAGCESM24SA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM24SA$func LAGCESM24SA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESM2SA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM2SA$func LAGCESM2SA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM2SA$func LAGCESM2SA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESM32SA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM32SA$func LAGCESM32SA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM32SA$func LAGCESM32SA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESM40SA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM40SA$func LAGCESM40SA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM40SA$func LAGCESM40SA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESM48SA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM48SA$func LAGCESM48SA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM48SA$func LAGCESM48SA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESM4SA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM4SA$func LAGCESM4SA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM4SA$func LAGCESM4SA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESM6SA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM6SA$func LAGCESM6SA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM6SA$func LAGCESM6SA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESM8SA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM8SA$func LAGCESM8SA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM8SA$func LAGCESM8SA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESOM12S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM12S$func LAGCESOM12S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM12S$func LAGCESOM12S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	if(CK===1'b0 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b0 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	ifnone
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESOM16S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM16S$func LAGCESOM16S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM16S$func LAGCESOM16S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	if(CK===1'b0 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b0 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	ifnone
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESOM20S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM20S$func LAGCESOM20S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM20S$func LAGCESOM20S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	if(CK===1'b0 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b0 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	ifnone
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESOM2S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM2S$func LAGCESOM2S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM2S$func LAGCESOM2S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	if(CK===1'b0 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b0 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	ifnone
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESOM3S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM3S$func LAGCESOM3S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM3S$func LAGCESOM3S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	if(CK===1'b0 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b0 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	ifnone
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESOM4S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM4S$func LAGCESOM4S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM4S$func LAGCESOM4S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	if(CK===1'b0 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b0 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	ifnone
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESOM6S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM6S$func LAGCESOM6S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM6S$func LAGCESOM6S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	if(CK===1'b0 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b0 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	ifnone
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAGCESOM8S( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM8S$func LAGCESOM8S_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM8S$func LAGCESOM8S_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(E===1'b0 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b0)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b1 && SE===1'b1)
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	ifnone
	// arc CK --> GCK
	 (CK => GCK) = (1.0,1.0);

	if(E===1'b0 && SE===1'b0)
	// arc CK --> GCK
	 (negedge CK => (GCK : E))  = (1.0,1.0);

	if(CK===1'b0 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b0 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b0)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	if(CK===1'b1 && SE===1'b1)
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	ifnone
	// arc E --> OBS
	 (E => OBS) = (1.0,1.0);

	$width(negedge CK,1.0,0,notifier);

	// setuphold E- CK-LH
	$setuphold(posedge CK,negedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold E- CK-LH
	$setuphold(posedge CK,posedge E &&& (SE === 1'b0),1.0,1.0,notifier,,,CK$delay,E$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,negedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

	// setuphold SE- CK-LH
	$setuphold(posedge CK,posedge SE &&& (E === 1'b0),1.0,1.0,notifier,,,CK$delay,SE$delay);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAM1SA( Q, QB, D, G);
input D, G;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAM1SA$func LAM1SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAM1SA$func LAM1SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G,negedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G,posedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAM2SA( Q, QB, D, G);
input D, G;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAM2SA$func LAM2SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAM2SA$func LAM2SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G,negedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G,posedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAM4SA( Q, QB, D, G);
input D, G;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAM4SA$func LAM4SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAM4SA$func LAM4SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G,negedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G,posedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAM8SA( Q, QB, D, G);
input D, G;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAM8SA$func LAM8SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAM8SA$func LAM8SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G,negedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G,posedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQM1SA( Q, D, G);
input D, G;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAQM1SA$func LAQM1SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQM1SA$func LAQM1SA_inst(.D(D),.G(G),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G,negedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G,posedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQM2SA( Q, D, G);
input D, G;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAQM2SA$func LAQM2SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQM2SA$func LAQM2SA_inst(.D(D),.G(G),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G,negedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G,posedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQM4SA( Q, D, G);
input D, G;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAQM4SA$func LAQM4SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQM4SA$func LAQM4SA_inst(.D(D),.G(G),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G,negedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G,posedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQM8SA( Q, D, G);
input D, G;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAQM8SA$func LAQM8SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQM8SA$func LAQM8SA_inst(.D(D),.G(G),.Q(Q),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G,negedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G,posedge D,1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQRM1SA( Q, D, G, RB);
input D, G, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LAQRM1SA$func LAQRM1SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRM1SA$func LAQRM1SA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB,negedge G,1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQRM2SA( Q, D, G, RB);
input D, G, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LAQRM2SA$func LAQRM2SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRM2SA$func LAQRM2SA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB,negedge G,1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQRM4SA( Q, D, G, RB);
input D, G, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LAQRM4SA$func LAQRM4SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRM4SA$func LAQRM4SA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB,negedge G,1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQRM8SA( Q, D, G, RB);
input D, G, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LAQRM8SA$func LAQRM8SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRM8SA$func LAQRM8SA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB,negedge G,1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQRSM1SA( Q, D, G, RB, SB);
input D, G, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LAQRSM1SA$func LAQRSM1SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRSM1SA$func LAQRSM1SA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge G &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge G &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,G$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_NOT_G === 1'b1),
		posedge RB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_NOT_G === 1'b1),
		posedge SB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQRSM2SA( Q, D, G, RB, SB);
input D, G, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LAQRSM2SA$func LAQRSM2SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRSM2SA$func LAQRSM2SA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge G &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge G &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,G$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_NOT_G === 1'b1),
		posedge RB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_NOT_G === 1'b1),
		posedge SB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQRSM4SA( Q, D, G, RB, SB);
input D, G, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LAQRSM4SA$func LAQRSM4SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRSM4SA$func LAQRSM4SA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge G &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge G &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,G$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_NOT_G === 1'b1),
		posedge RB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_NOT_G === 1'b1),
		posedge SB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQRSM8SA( Q, D, G, RB, SB);
input D, G, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LAQRSM8SA$func LAQRSM8SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRSM8SA$func LAQRSM8SA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge G &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge G &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,G$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_NOT_G === 1'b1),
		posedge RB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_NOT_G === 1'b1),
		posedge SB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQSM1SA( Q, D, G, SB);
input D, G, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LAQSM1SA$func LAQSM1SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQSM1SA$func LAQSM1SA_inst(.D(D),.G(G),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB,negedge G,1.0,1.0,notifier,,,SB$delay,G$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQSM2SA( Q, D, G, SB);
input D, G, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LAQSM2SA$func LAQSM2SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQSM2SA$func LAQSM2SA_inst(.D(D),.G(G),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB,negedge G,1.0,1.0,notifier,,,SB$delay,G$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQSM4SA( Q, D, G, SB);
input D, G, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LAQSM4SA$func LAQSM4SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQSM4SA$func LAQSM4SA_inst(.D(D),.G(G),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB,negedge G,1.0,1.0,notifier,,,SB$delay,G$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LAQSM8SA( Q, D, G, SB);
input D, G, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LAQSM8SA$func LAQSM8SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQSM8SA$func LAQSM8SA_inst(.D(D),.G(G),.Q(Q),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB,negedge G,1.0,1.0,notifier,,,SB$delay,G$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LARM1SA( Q, QB, D, G, RB);
input D, G, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LARM1SA$func LARM1SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARM1SA$func LARM1SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB,negedge G,1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LARM2SA( Q, QB, D, G, RB);
input D, G, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LARM2SA$func LARM2SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARM2SA$func LARM2SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB,negedge G,1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LARM4SA( Q, QB, D, G, RB);
input D, G, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LARM4SA$func LARM4SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARM4SA$func LARM4SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB,negedge G,1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LARM8SA( Q, QB, D, G, RB);
input D, G, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LARM8SA$func LARM8SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARM8SA$func LARM8SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		negedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB === 1'b1),
		posedge D &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB,negedge G,1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LARSM1SA( Q, QB, D, G, RB, SB);
input D, G, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LARSM1SA$func LARSM1SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARSM1SA$func LARSM1SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge G &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge G &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,G$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_NOT_G === 1'b1),
		posedge RB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_NOT_G === 1'b1),
		posedge SB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LARSM2SA( Q, QB, D, G, RB, SB);
input D, G, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LARSM2SA$func LARSM2SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARSM2SA$func LARSM2SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge G &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge G &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,G$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_NOT_G === 1'b1),
		posedge RB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_NOT_G === 1'b1),
		posedge SB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LARSM4SA( Q, QB, D, G, RB, SB);
input D, G, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LARSM4SA$func LARSM4SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARSM4SA$func LARSM4SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge G &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge G &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,G$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_NOT_G === 1'b1),
		posedge RB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_NOT_G === 1'b1),
		posedge SB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LARSM8SA( Q, QB, D, G, RB, SB);
input D, G, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LARSM8SA$func LARSM8SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARSM8SA$func LARSM8SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc RB --> Q
	(RB => Q)  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// arc RB --> QB
	(RB => QB)  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		negedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_RB_AND_SB === 1'b1),
		posedge D &&& (ENABLE_RB_AND_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem RB-G-negedge
	$recrem(posedge RB &&& (ENABLE_SB === 1'b1),
		negedge G &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,RB$delay,G$delay);

	$width(negedge RB,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB &&& (ENABLE_RB === 1'b1),
		negedge G &&& (ENABLE_RB === 1'b1),
		1.0,1.0,notifier,,,SB$delay,G$delay);

	// setup SB-LH RB-LH
	$setup(posedge SB &&& (ENABLE_NOT_G === 1'b1),
		posedge RB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	// hold SB-LH RB-LH
	$hold(posedge RB &&& (ENABLE_NOT_G === 1'b1),
		posedge SB &&& (ENABLE_NOT_G === 1'b1),1.0,notifier);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LASM1SA( Q, QB, D, G, SB);
input D, G, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LASM1SA$func LASM1SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LASM1SA$func LASM1SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB,negedge G,1.0,1.0,notifier,,,SB$delay,G$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LASM2SA( Q, QB, D, G, SB);
input D, G, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LASM2SA$func LASM2SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LASM2SA$func LASM2SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB,negedge G,1.0,1.0,notifier,,,SB$delay,G$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LASM4SA( Q, QB, D, G, SB);
input D, G, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LASM4SA$func LASM4SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LASM4SA$func LASM4SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB,negedge G,1.0,1.0,notifier,,,SB$delay,G$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module LASM8SA( Q, QB, D, G, SB);
input D, G, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LASM8SA$func LASM8SA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LASM8SA$func LASM8SA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	// arc D --> Q
	 (D => Q) = (1.0,1.0);

	// arc G --> Q
	(posedge G => (Q : D))  = (1.0,1.0);

	// arc SB --> Q
	(SB => Q)  = (1.0,1.0);

	// arc D --> QB
	 (D => QB) = (1.0,1.0);

	// arc G --> QB
	(posedge G => (QB : D))  = (1.0,1.0);

	// arc SB --> QB
	(SB => QB)  = (1.0,1.0);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		negedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	// setuphold D- G-HL
	$setuphold(negedge G &&& (ENABLE_SB === 1'b1),
		posedge D &&& (ENABLE_SB === 1'b1),
		1.0,1.0,notifier,,,G$delay,D$delay);

	$width(posedge G,1.0,0,notifier);

	// recrem SB-G-negedge
	$recrem(posedge SB,negedge G,1.0,1.0,notifier,,,SB$delay,G$delay);

	$width(negedge SB,1.0,0,notifier);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAO222M1SA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAO222M1SA$func MAO222M1SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAO222M1SA$func MAO222M1SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAO222M2SA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAO222M2SA$func MAO222M2SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAO222M2SA$func MAO222M2SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAO222M4SA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAO222M4SA$func MAO222M4SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAO222M4SA$func MAO222M4SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAO222M8SA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAO222M8SA$func MAO222M8SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAO222M8SA$func MAO222M8SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAOI2223M1SA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI2223M1SA$func MAOI2223M1SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI2223M1SA$func MAOI2223M1SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAOI2223M2SA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI2223M2SA$func MAOI2223M2SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI2223M2SA$func MAOI2223M2SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAOI2223M4SA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI2223M4SA$func MAOI2223M4SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI2223M4SA$func MAOI2223M4SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAOI2223M8SA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI2223M8SA$func MAOI2223M8SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI2223M8SA$func MAOI2223M8SA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAOI222M1SA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI222M1SA$func MAOI222M1SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI222M1SA$func MAOI222M1SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAOI222M2SA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI222M2SA$func MAOI222M2SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI222M2SA$func MAOI222M2SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAOI222M4SA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI222M4SA$func MAOI222M4SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI222M4SA$func MAOI222M4SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAOI222M8SA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI222M8SA$func MAOI222M8SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI222M8SA$func MAOI222M8SA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAOI22M1SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI22M1SA$func MAOI22M1SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI22M1SA$func MAOI22M1SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAOI22M2SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI22M2SA$func MAOI22M2SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI22M2SA$func MAOI22M2SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAOI22M4SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI22M4SA$func MAOI22M4SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI22M4SA$func MAOI22M4SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MAOI22M8SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI22M8SA$func MAOI22M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI22M8SA$func MAOI22M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MOAI22M1SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MOAI22M1SA$func MOAI22M1SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MOAI22M1SA$func MOAI22M1SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MOAI22M2SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MOAI22M2SA$func MOAI22M2SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MOAI22M2SA$func MOAI22M2SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MOAI22M4SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MOAI22M4SA$func MOAI22M4SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MOAI22M4SA$func MOAI22M4SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MOAI22M8SA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MOAI22M8SA$func MOAI22M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MOAI22M8SA$func MOAI22M8SA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B1===1'b0 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	ifnone
	// arc A1 --> Z
	 (A1 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b0 && B2===1'b1)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(B1===1'b1 && B2===1'b0)
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	ifnone
	// arc A2 --> Z
	 (A2 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1)
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	ifnone
	// arc B1 --> Z
	 (B1 => Z) = (1.0,1.0);

	if(A1===1'b0 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b0)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	if(A1===1'b1 && A2===1'b1)
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

	ifnone
	// arc B2 --> Z
	 (B2 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX2M0SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M0SA$func MUX2M0SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M0SA$func MUX2M0SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

        ifnone
	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

        ifnone
	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX2M12SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M12SA$func MUX2M12SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M12SA$func MUX2M12SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

        ifnone
	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

        ifnone
	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX2M1SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M1SA$func MUX2M1SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M1SA$func MUX2M1SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

        ifnone
	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

        ifnone
	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX2M2SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M2SA$func MUX2M2SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M2SA$func MUX2M2SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

        ifnone
	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

        ifnone
	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX2M3SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M3SA$func MUX2M3SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M3SA$func MUX2M3SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

        ifnone
	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

        ifnone
	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX2M4SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M4SA$func MUX2M4SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M4SA$func MUX2M4SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

        ifnone
	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

        ifnone
	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX2M6S( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M6S$func MUX2M6S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M6S$func MUX2M6S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

        ifnone
	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

        ifnone
	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX2M8S( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M8S$func MUX2M8S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M8S$func MUX2M8S_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX3M0SA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX3M0SA$func MUX3M0SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX3M0SA$func MUX3M0SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(C===1'b0)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b0)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX3M1SA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX3M1SA$func MUX3M1SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX3M1SA$func MUX3M1SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(C===1'b0)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b0)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX3M2SA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX3M2SA$func MUX3M2SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX3M2SA$func MUX3M2SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(C===1'b0)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b0)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX3M4SA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX3M4SA$func MUX3M4SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX3M4SA$func MUX3M4SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(C===1'b0)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b0)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX3M8SA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX3M8SA$func MUX3M8SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX3M8SA$func MUX3M8SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(C===1'b0)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b0)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX4M0SA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX4M0SA$func MUX4M0SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX4M0SA$func MUX4M0SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX4M1SA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX4M1SA$func MUX4M1SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX4M1SA$func MUX4M1SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX4M2SA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX4M2SA$func MUX4M2SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX4M2SA$func MUX4M2SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX4M4S( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX4M4S$func MUX4M4S_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX4M4S$func MUX4M4S_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MUX4M8SA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX4M8SA$func MUX4M8SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX4M8SA$func MUX4M8SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB2M0SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M0SA$func MXB2M0SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M0SA$func MXB2M0SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB2M1SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M1SA$func MXB2M1SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M1SA$func MXB2M1SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB2M2SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M2SA$func MXB2M2SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M2SA$func MXB2M2SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB2M3SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M3SA$func MXB2M3SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M3SA$func MXB2M3SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB2M4SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M4SA$func MXB2M4SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M4SA$func MXB2M4SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB2M6SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M6SA$func MXB2M6SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M6SA$func MXB2M6SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB2M8SA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M8SA$func MXB2M8SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M8SA$func MXB2M8SA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	// arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	// arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB3M0SA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB3M0SA$func MXB3M0SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB3M0SA$func MXB3M0SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(C===1'b0)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b0)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB3M1SA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB3M1SA$func MXB3M1SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB3M1SA$func MXB3M1SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(C===1'b0)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b0)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB3M2SA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB3M2SA$func MXB3M2SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB3M2SA$func MXB3M2SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(C===1'b0)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b0)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB3M4SA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB3M4SA$func MXB3M4SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB3M4SA$func MXB3M4SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(C===1'b0)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b0)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB3M8SA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB3M8SA$func MXB3M8SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB3M8SA$func MXB3M8SA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(C===1'b0)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b0)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

	if(C===1'b1)
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB4M0SA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB4M0SA$func MXB4M0SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB4M0SA$func MXB4M0SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB4M1SA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB4M1SA$func MXB4M1SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB4M1SA$func MXB4M1SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB4M2SA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB4M2SA$func MXB4M2SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB4M2SA$func MXB4M2SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB4M4SA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB4M4SA$func MXB4M4SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB4M4SA$func MXB4M4SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB4M6SA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB4M6SA$func MXB4M6SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB4M6SA$func MXB4M6SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

   endspecify

   `endif 

endmodule
`endcelldefine
`celldefine
module MXB4M8SA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB4M8SA$func MXB4M8SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB4M8SA$func MXB4M8SA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 


   `ifdef FUNCTIONAL // functional  //

   `else


// specify block begins 

   specify

	if(B===1'b0 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b0 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b0 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b0)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(B===1'b1 && C===1'b1 && D===1'b1)
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	ifnone
	// arc A --> Z
	 (A => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b0 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b0)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b1 && C===1'b1 && D===1'b1)
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	ifnone
	// arc B --> Z
	 (B => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b0)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && D===1'b1)
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	ifnone
	// arc C --> Z
	 (C => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1)
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	ifnone
	// arc D --> Z
	 (D => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b0 && D===1'b1 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S0 --> (Z:S0)
	 (posedge S0 => (Z:S0)) = (1.0,1.0);

        ifnone
	// arc negedge S0 --> (Z:S0)
	 (negedge S0 => (Z:S0)) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S1===1'b0)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b1 && C===1'b1 && D===1'b0 && S1===1'b1)
	// arc S0 --> Z
	 (S0 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b1 && S0===1'b0)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b0 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b1 && B===1'b0 && C===1'b1 && D===1'b1 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

        ifnone
	// arc posedge S1 --> (Z:S1)
	 (posedge S1 => (Z:S1)) = (1.0,1.0);

        ifnone
	// arc negedge S1 --> (Z:S1)
	 (negedge S1 => (Z:S1)) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b0 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	if(A===1'b0 && B===1'b1 && C===1'b1 && D===1'b0 && S0===1'b1)
	// arc S1 --> Z
	 (S1 => Z) = (1.0,1.0);

	// arc S1 --> Z



