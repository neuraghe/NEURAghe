`timescale 1ns/1ps

`celldefine
module AD42M2WA( CO, ICO, S, A, B, C, D, ICI);
input A, B, C, D, ICI;
output CO, ICO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AD42M2WA$func AD42M2WA_inst(.A(A),.B(B),.C(C),.CO(CO),.D(D),.ICI(ICI),.ICO(ICO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AD42M2WA$func AD42M2WA_inst(.A(A),.B(B),.C(C),.CO(CO),.D(D),.ICI(ICI),.ICO(ICO),.S(S));

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
module AD42M4WA( CO, ICO, S, A, B, C, D, ICI);
input A, B, C, D, ICI;
output CO, ICO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AD42M4WA$func AD42M4WA_inst(.A(A),.B(B),.C(C),.CO(CO),.D(D),.ICI(ICI),.ICO(ICO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AD42M4WA$func AD42M4WA_inst(.A(A),.B(B),.C(C),.CO(CO),.D(D),.ICI(ICI),.ICO(ICO),.S(S));

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
module ADCSCM2W( CO0, CO1, A, B, NCI0, NCI1);
input A, B, NCI0, NCI1;
output CO0, CO1;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADCSCM2W$func ADCSCM2W_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.NCI0(NCI0),.NCI1(NCI1));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADCSCM2W$func ADCSCM2W_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.NCI0(NCI0),.NCI1(NCI1));

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
module ADCSCM4W( CO0, CO1, A, B, NCI0, NCI1);
input A, B, NCI0, NCI1;
output CO0, CO1;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADCSCM4W$func ADCSCM4W_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.NCI0(NCI0),.NCI1(NCI1));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADCSCM4W$func ADCSCM4W_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.NCI0(NCI0),.NCI1(NCI1));

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
module ADCSIOM2W( CO0B, CO1B, A, B);
input A, B;
output CO0B, CO1B;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADCSIOM2W$func ADCSIOM2W_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADCSIOM2W$func ADCSIOM2W_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B));

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
module ADCSIOM4W( CO0B, CO1B, A, B);
input A, B;
output CO0B, CO1B;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADCSIOM4W$func ADCSIOM4W_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADCSIOM4W$func ADCSIOM4W_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B));

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
module ADCSOM2W( CO0B, CO1B, A, B, CI0, CI1);
input A, B, CI0, CI1;
output CO0B, CO1B;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADCSOM2W$func ADCSOM2W_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADCSOM2W$func ADCSOM2W_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B));

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
module ADCSOM4W( CO0B, CO1B, A, B, CI0, CI1);
input A, B, CI0, CI1;
output CO0B, CO1B;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADCSOM4W$func ADCSOM4W_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADCSOM4W$func ADCSOM4W_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B));

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
module ADFCGCM2WA( CO, A, B, NCI);
input A, B, NCI;
output CO;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCGCM2WA$func ADFCGCM2WA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCGCM2WA$func ADFCGCM2WA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI));

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
module ADFCGCM4WA( CO, A, B, NCI);
input A, B, NCI;
output CO;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCGCM4WA$func ADFCGCM4WA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCGCM4WA$func ADFCGCM4WA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI));

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
module ADFCGOM2WA( COB, A, B, CI);
input A, B, CI;
output COB;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCGOM2WA$func ADFCGOM2WA_inst(.A(A),.B(B),.CI(CI),.COB(COB));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCGOM2WA$func ADFCGOM2WA_inst(.A(A),.B(B),.CI(CI),.COB(COB));

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
module ADFCGOM4WA( COB, A, B, CI);
input A, B, CI;
output COB;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCGOM4WA$func ADFCGOM4WA_inst(.A(A),.B(B),.CI(CI),.COB(COB));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCGOM4WA$func ADFCGOM4WA_inst(.A(A),.B(B),.CI(CI),.COB(COB));

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
module ADFCM2WA( CO, S, A, B, NCI);
input A, B, NCI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCM2WA$func ADFCM2WA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCM2WA$func ADFCM2WA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI),.S(S));

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
module ADFCM4WA( CO, S, A, B, NCI);
input A, B, NCI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCM4WA$func ADFCM4WA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCM4WA$func ADFCM4WA_inst(.A(A),.B(B),.CO(CO),.NCI(NCI),.S(S));

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
module ADFCSCM2WA( CO0, CO1, S, A, B, CS, NCI0, NCI1);
input A, B, CS, NCI0, NCI1;
output CO0, CO1, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCSCM2WA$func ADFCSCM2WA_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.CS(CS),.NCI0(NCI0),.NCI1(NCI1),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCSCM2WA$func ADFCSCM2WA_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.CS(CS),.NCI0(NCI0),.NCI1(NCI1),.S(S));

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
module ADFCSCM4WA( CO0, CO1, S, A, B, CS, NCI0, NCI1);
input A, B, CS, NCI0, NCI1;
output CO0, CO1, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCSCM4WA$func ADFCSCM4WA_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.CS(CS),.NCI0(NCI0),.NCI1(NCI1),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCSCM4WA$func ADFCSCM4WA_inst(.A(A),.B(B),.CO0(CO0),.CO1(CO1),.CS(CS),.NCI0(NCI0),.NCI1(NCI1),.S(S));

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
module ADFCSIOM2W( CO0B, CO1B, S, A, B, CS);
input A, B, CS;
output CO0B, CO1B, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCSIOM2W$func ADFCSIOM2W_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCSIOM2W$func ADFCSIOM2W_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

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
module ADFCSIOM4W( CO0B, CO1B, S, A, B, CS);
input A, B, CS;
output CO0B, CO1B, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCSIOM4W$func ADFCSIOM4W_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCSIOM4W$func ADFCSIOM4W_inst(.A(A),.B(B),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

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
module ADFCSOM2WA( CO0B, CO1B, S, A, B, CI0, CI1, CS);
input A, B, CI0, CI1, CS;
output CO0B, CO1B, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCSOM2WA$func ADFCSOM2WA_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCSOM2WA$func ADFCSOM2WA_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

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
module ADFCSOM4WA( CO0B, CO1B, S, A, B, CI0, CI1, CS);
input A, B, CI0, CI1, CS;
output CO0B, CO1B, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFCSOM4WA$func ADFCSOM4WA_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFCSOM4WA$func ADFCSOM4WA_inst(.A(A),.B(B),.CI0(CI0),.CI1(CI1),.CO0B(CO0B),.CO1B(CO1B),.CS(CS),.S(S));

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
module ADFM0WA( CO, S, A, B, CI);
input A, B, CI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFM0WA$func ADFM0WA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFM0WA$func ADFM0WA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

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
module ADFM1WA( CO, S, A, B, CI);
input A, B, CI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFM1WA$func ADFM1WA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFM1WA$func ADFM1WA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

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
module ADFM2WA( CO, S, A, B, CI);
input A, B, CI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFM2WA$func ADFM2WA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFM2WA$func ADFM2WA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

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
module ADFM4WA( CO, S, A, B, CI);
input A, B, CI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFM4WA$func ADFM4WA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFM4WA$func ADFM4WA_inst(.A(A),.B(B),.CI(CI),.CO(CO),.S(S));

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
module ADFOM2WA( COB, S, A, B, CI);
input A, B, CI;
output COB, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFOM2WA$func ADFOM2WA_inst(.A(A),.B(B),.CI(CI),.COB(COB),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFOM2WA$func ADFOM2WA_inst(.A(A),.B(B),.CI(CI),.COB(COB),.S(S));

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
module ADFOM4WA( COB, S, A, B, CI);
input A, B, CI;
output COB, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADFOM4WA$func ADFOM4WA_inst(.A(A),.B(B),.CI(CI),.COB(COB),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADFOM4WA$func ADFOM4WA_inst(.A(A),.B(B),.CI(CI),.COB(COB),.S(S));

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
module ADHCM2W( CO, S, A, NCI);
input A, NCI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHCM2W$func ADHCM2W_inst(.A(A),.CO(CO),.NCI(NCI),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHCM2W$func ADHCM2W_inst(.A(A),.CO(CO),.NCI(NCI),.S(S));

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
module ADHCM4W( CO, S, A, NCI);
input A, NCI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHCM4W$func ADHCM4W_inst(.A(A),.CO(CO),.NCI(NCI),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHCM4W$func ADHCM4W_inst(.A(A),.CO(CO),.NCI(NCI),.S(S));

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
module ADHCSCM2W( CO, S, A, CS, NCI);
input A, CS, NCI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHCSCM2W$func ADHCSCM2W_inst(.A(A),.CO(CO),.CS(CS),.NCI(NCI),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHCSCM2W$func ADHCSCM2W_inst(.A(A),.CO(CO),.CS(CS),.NCI(NCI),.S(S));

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
module ADHCSCM4W( CO, S, A, CS, NCI);
input A, CS, NCI;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHCSCM4W$func ADHCSCM4W_inst(.A(A),.CO(CO),.CS(CS),.NCI(NCI),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHCSCM4W$func ADHCSCM4W_inst(.A(A),.CO(CO),.CS(CS),.NCI(NCI),.S(S));

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
module ADHCSOM2W( COB, S, A, CI, CS);
input A, CI, CS;
output COB, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHCSOM2W$func ADHCSOM2W_inst(.A(A),.CI(CI),.COB(COB),.CS(CS),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHCSOM2W$func ADHCSOM2W_inst(.A(A),.CI(CI),.COB(COB),.CS(CS),.S(S));

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
module ADHCSOM4W( COB, S, A, CI, CS);
input A, CI, CS;
output COB, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHCSOM4W$func ADHCSOM4W_inst(.A(A),.CI(CI),.COB(COB),.CS(CS),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHCSOM4W$func ADHCSOM4W_inst(.A(A),.CI(CI),.COB(COB),.CS(CS),.S(S));

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
module ADHM1WA( CO, S, A, B);
input A, B;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHM1WA$func ADHM1WA_inst(.A(A),.B(B),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHM1WA$func ADHM1WA_inst(.A(A),.B(B),.CO(CO),.S(S));

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
module ADHM2WA( CO, S, A, B);
input A, B;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHM2WA$func ADHM2WA_inst(.A(A),.B(B),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHM2WA$func ADHM2WA_inst(.A(A),.B(B),.CO(CO),.S(S));

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
module ADHM4WA( CO, S, A, B);
input A, B;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHM4WA$func ADHM4WA_inst(.A(A),.B(B),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHM4WA$func ADHM4WA_inst(.A(A),.B(B),.CO(CO),.S(S));

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
module ADHM8WA( CO, S, A, B);
input A, B;
output CO, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHM8WA$func ADHM8WA_inst(.A(A),.B(B),.CO(CO),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHM8WA$func ADHM8WA_inst(.A(A),.B(B),.CO(CO),.S(S));

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
module ADHOM2W( COB, S, A, CI);
input A, CI;
output COB, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHOM2W$func ADHOM2W_inst(.A(A),.CI(CI),.COB(COB),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHOM2W$func ADHOM2W_inst(.A(A),.CI(CI),.COB(COB),.S(S));

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
module ADHOM4W( COB, S, A, CI);
input A, CI;
output COB, S;

   `ifdef FUNCTIONAL  //  functional //

   `else


	ADHOM4W$func ADHOM4W_inst(.A(A),.CI(CI),.COB(COB),.S(S));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	ADHOM4W$func ADHOM4W_inst(.A(A),.CI(CI),.COB(COB),.S(S));

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
module AN2M0W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M0W$func AN2M0W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M0W$func AN2M0W_inst(.A(A),.B(B),.Z(Z));

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
module AN2M12WA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M12WA$func AN2M12WA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M12WA$func AN2M12WA_inst(.A(A),.B(B),.Z(Z));

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
module AN2M16WA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M16WA$func AN2M16WA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M16WA$func AN2M16WA_inst(.A(A),.B(B),.Z(Z));

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
module AN2M1W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M1W$func AN2M1W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M1W$func AN2M1W_inst(.A(A),.B(B),.Z(Z));

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
module AN2M22WA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M22WA$func AN2M22WA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M22WA$func AN2M22WA_inst(.A(A),.B(B),.Z(Z));

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
module AN2M2W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M2W$func AN2M2W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M2W$func AN2M2W_inst(.A(A),.B(B),.Z(Z));

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
module AN2M4W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M4W$func AN2M4W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M4W$func AN2M4W_inst(.A(A),.B(B),.Z(Z));

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
module AN2M6W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M6W$func AN2M6W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M6W$func AN2M6W_inst(.A(A),.B(B),.Z(Z));

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
module AN2M8W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN2M8W$func AN2M8W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN2M8W$func AN2M8W_inst(.A(A),.B(B),.Z(Z));

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
module AN3M0W( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M0W$func AN3M0W_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M0W$func AN3M0W_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module AN3M12WA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M12WA$func AN3M12WA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M12WA$func AN3M12WA_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module AN3M16WA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M16WA$func AN3M16WA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M16WA$func AN3M16WA_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module AN3M1W( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M1W$func AN3M1W_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M1W$func AN3M1W_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module AN3M22WA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M22WA$func AN3M22WA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M22WA$func AN3M22WA_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module AN3M2W( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M2W$func AN3M2W_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M2W$func AN3M2W_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module AN3M4W( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M4W$func AN3M4W_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M4W$func AN3M4W_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module AN3M6W( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M6W$func AN3M6W_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M6W$func AN3M6W_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module AN3M8W( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN3M8W$func AN3M8W_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN3M8W$func AN3M8W_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module AN4M0W( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M0W$func AN4M0W_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M0W$func AN4M0W_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

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
module AN4M12WA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M12WA$func AN4M12WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M12WA$func AN4M12WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

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
module AN4M16WA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M16WA$func AN4M16WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M16WA$func AN4M16WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

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
module AN4M1W( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M1W$func AN4M1W_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M1W$func AN4M1W_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

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
module AN4M2W( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M2W$func AN4M2W_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M2W$func AN4M2W_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

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
module AN4M4WA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M4WA$func AN4M4WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M4WA$func AN4M4WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

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
module AN4M6W( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M6W$func AN4M6W_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M6W$func AN4M6W_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

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
module AN4M8WA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AN4M8WA$func AN4M8WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AN4M8WA$func AN4M8WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

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
module ANTW( A);
input A;

endmodule
`endcelldefine
`celldefine
module AO211M1WA( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO211M1WA$func AO211M1WA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO211M1WA$func AO211M1WA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

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
module AO211M2WA( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO211M2WA$func AO211M2WA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO211M2WA$func AO211M2WA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

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
module AO211M4WA( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO211M4WA$func AO211M4WA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO211M4WA$func AO211M4WA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

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
module AO211M8WA( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO211M8WA$func AO211M8WA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO211M8WA$func AO211M8WA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

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
module AO21M0WA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M0WA$func AO21M0WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M0WA$func AO21M0WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AO21M12WA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M12WA$func AO21M12WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M12WA$func AO21M12WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AO21M1WA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M1WA$func AO21M1WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M1WA$func AO21M1WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AO21M2WA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M2WA$func AO21M2WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M2WA$func AO21M2WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AO21M4WA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M4WA$func AO21M4WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M4WA$func AO21M4WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AO21M6WA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M6WA$func AO21M6WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M6WA$func AO21M6WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AO21M8WA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO21M8WA$func AO21M8WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO21M8WA$func AO21M8WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AO221M1WA( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO221M1WA$func AO221M1WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO221M1WA$func AO221M1WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

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
module AO221M2WA( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO221M2WA$func AO221M2WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO221M2WA$func AO221M2WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

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
module AO221M4WA( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO221M4WA$func AO221M4WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO221M4WA$func AO221M4WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

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
module AO221M8WA( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO221M8WA$func AO221M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO221M8WA$func AO221M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

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
module AO222M1WA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO222M1WA$func AO222M1WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO222M1WA$func AO222M1WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

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
module AO222M2WA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO222M2WA$func AO222M2WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO222M2WA$func AO222M2WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

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
module AO222M4WA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO222M4WA$func AO222M4WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO222M4WA$func AO222M4WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

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
module AO222M8WA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO222M8WA$func AO222M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO222M8WA$func AO222M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

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
module AO22B10M0W( Z, A1, B1, B2, NA2);
input A1, B1, B2, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B10M0W$func AO22B10M0W_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B10M0W$func AO22B10M0W_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

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
module AO22B10M1W( Z, A1, B1, B2, NA2);
input A1, B1, B2, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B10M1W$func AO22B10M1W_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B10M1W$func AO22B10M1W_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

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
module AO22B10M2W( Z, A1, B1, B2, NA2);
input A1, B1, B2, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B10M2W$func AO22B10M2W_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B10M2W$func AO22B10M2W_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

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
module AO22B10M4W( Z, A1, B1, B2, NA2);
input A1, B1, B2, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B10M4W$func AO22B10M4W_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B10M4W$func AO22B10M4W_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

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
module AO22B10M8WA( Z, A1, B1, B2, NA2);
input A1, B1, B2, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B10M8WA$func AO22B10M8WA_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B10M8WA$func AO22B10M8WA_inst(.A1(A1),.B1(B1),.B2(B2),.NA2(NA2),.Z(Z));

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
module AO22B11M0W( Z, A1, B1, NA2, NB2);
input A1, B1, NA2, NB2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B11M0W$func AO22B11M0W_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B11M0W$func AO22B11M0W_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

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
module AO22B11M1W( Z, A1, B1, NA2, NB2);
input A1, B1, NA2, NB2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B11M1W$func AO22B11M1W_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B11M1W$func AO22B11M1W_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

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
module AO22B11M2W( Z, A1, B1, NA2, NB2);
input A1, B1, NA2, NB2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B11M2W$func AO22B11M2W_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B11M2W$func AO22B11M2W_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

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
module AO22B11M4W( Z, A1, B1, NA2, NB2);
input A1, B1, NA2, NB2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B11M4W$func AO22B11M4W_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B11M4W$func AO22B11M4W_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

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
module AO22B11M8WA( Z, A1, B1, NA2, NB2);
input A1, B1, NA2, NB2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22B11M8WA$func AO22B11M8WA_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22B11M8WA$func AO22B11M8WA_inst(.A1(A1),.B1(B1),.NA2(NA2),.NB2(NB2),.Z(Z));

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
module AO22M0WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M0WA$func AO22M0WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M0WA$func AO22M0WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AO22M12WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M12WA$func AO22M12WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M12WA$func AO22M12WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AO22M1WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M1WA$func AO22M1WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M1WA$func AO22M1WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AO22M2W( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M2W$func AO22M2W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M2W$func AO22M2W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AO22M4WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M4WA$func AO22M4WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M4WA$func AO22M4WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AO22M6WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M6WA$func AO22M6WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M6WA$func AO22M6WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AO22M8WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO22M8WA$func AO22M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO22M8WA$func AO22M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AO31M1WA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO31M1WA$func AO31M1WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO31M1WA$func AO31M1WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

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
module AO31M2WA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO31M2WA$func AO31M2WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO31M2WA$func AO31M2WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

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
module AO31M4WA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO31M4WA$func AO31M4WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO31M4WA$func AO31M4WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

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
module AO31M8WA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO31M8WA$func AO31M8WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO31M8WA$func AO31M8WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

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
module AO32M1WA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO32M1WA$func AO32M1WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO32M1WA$func AO32M1WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

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
module AO32M2WA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO32M2WA$func AO32M2WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO32M2WA$func AO32M2WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

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
module AO32M4WA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO32M4WA$func AO32M4WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO32M4WA$func AO32M4WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

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
module AO32M8WA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO32M8WA$func AO32M8WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO32M8WA$func AO32M8WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

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
module AO33M1WA( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO33M1WA$func AO33M1WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO33M1WA$func AO33M1WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

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
module AO33M2WA( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO33M2WA$func AO33M2WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO33M2WA$func AO33M2WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

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
module AO33M4WA( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO33M4WA$func AO33M4WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO33M4WA$func AO33M4WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

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
module AO33M8WA( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AO33M8WA$func AO33M8WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AO33M8WA$func AO33M8WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

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
module AOI211M0W( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI211M0W$func AOI211M0W_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI211M0W$func AOI211M0W_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

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
module AOI211M1W( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI211M1W$func AOI211M1W_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI211M1W$func AOI211M1W_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

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
module AOI211M2W( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI211M2W$func AOI211M2W_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI211M2W$func AOI211M2W_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

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
module AOI211M4W( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI211M4W$func AOI211M4W_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI211M4W$func AOI211M4W_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

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
module AOI211M6WA( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI211M6WA$func AOI211M6WA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI211M6WA$func AOI211M6WA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

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
module AOI211M8WA( Z, A1, A2, B, C);
input A1, A2, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI211M8WA$func AOI211M8WA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI211M8WA$func AOI211M8WA_inst(.A1(A1),.A2(A2),.B(B),.C(C),.Z(Z));

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
module AOI21B01M0W( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M0W$func AOI21B01M0W_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M0W$func AOI21B01M0W_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

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
module AOI21B01M12WA( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M12WA$func AOI21B01M12WA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M12WA$func AOI21B01M12WA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

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
module AOI21B01M16WA( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M16WA$func AOI21B01M16WA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M16WA$func AOI21B01M16WA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

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
module AOI21B01M1W( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M1W$func AOI21B01M1W_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M1W$func AOI21B01M1W_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

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
module AOI21B01M2W( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M2W$func AOI21B01M2W_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M2W$func AOI21B01M2W_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

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
module AOI21B01M4W( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M4W$func AOI21B01M4W_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M4W$func AOI21B01M4W_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

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
module AOI21B01M6WA( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M6WA$func AOI21B01M6WA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M6WA$func AOI21B01M6WA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

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
module AOI21B01M8WA( Z, A1, A2, NB);
input A1, A2, NB;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B01M8WA$func AOI21B01M8WA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B01M8WA$func AOI21B01M8WA_inst(.A1(A1),.A2(A2),.NB(NB),.Z(Z));

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
module AOI21B10M0W( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M0W$func AOI21B10M0W_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M0W$func AOI21B10M0W_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

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
module AOI21B10M12WA( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M12WA$func AOI21B10M12WA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M12WA$func AOI21B10M12WA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

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
module AOI21B10M16WA( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M16WA$func AOI21B10M16WA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M16WA$func AOI21B10M16WA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

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
module AOI21B10M1W( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M1W$func AOI21B10M1W_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M1W$func AOI21B10M1W_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

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
module AOI21B10M2W( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M2W$func AOI21B10M2W_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M2W$func AOI21B10M2W_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

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
module AOI21B10M4W( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M4W$func AOI21B10M4W_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M4W$func AOI21B10M4W_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

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
module AOI21B10M6WA( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M6WA$func AOI21B10M6WA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M6WA$func AOI21B10M6WA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

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
module AOI21B10M8WA( Z, A1, B, NA2);
input A1, B, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B10M8WA$func AOI21B10M8WA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B10M8WA$func AOI21B10M8WA_inst(.A1(A1),.B(B),.NA2(NA2),.Z(Z));

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
module AOI21B20M0W( Z, B, NA1, NA2);
input B, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B20M0W$func AOI21B20M0W_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B20M0W$func AOI21B20M0W_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

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
module AOI21B20M1W( Z, B, NA1, NA2);
input B, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B20M1W$func AOI21B20M1W_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B20M1W$func AOI21B20M1W_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

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
module AOI21B20M2W( Z, B, NA1, NA2);
input B, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B20M2W$func AOI21B20M2W_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B20M2W$func AOI21B20M2W_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

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
module AOI21B20M4W( Z, B, NA1, NA2);
input B, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B20M4W$func AOI21B20M4W_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B20M4W$func AOI21B20M4W_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

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
module AOI21B20M8WA( Z, B, NA1, NA2);
input B, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21B20M8WA$func AOI21B20M8WA_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21B20M8WA$func AOI21B20M8WA_inst(.B(B),.NA1(NA1),.NA2(NA2),.Z(Z));

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
module AOI21M0W( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M0W$func AOI21M0W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M0W$func AOI21M0W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AOI21M12WA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M12WA$func AOI21M12WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M12WA$func AOI21M12WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AOI21M16WA( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M16WA$func AOI21M16WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M16WA$func AOI21M16WA_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AOI21M1W( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M1W$func AOI21M1W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M1W$func AOI21M1W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AOI21M2W( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M2W$func AOI21M2W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M2W$func AOI21M2W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AOI21M3W( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M3W$func AOI21M3W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M3W$func AOI21M3W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AOI21M4W( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M4W$func AOI21M4W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M4W$func AOI21M4W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AOI21M6W( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M6W$func AOI21M6W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M6W$func AOI21M6W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AOI21M8W( Z, A1, A2, B);
input A1, A2, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI21M8W$func AOI21M8W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI21M8W$func AOI21M8W_inst(.A1(A1),.A2(A2),.B(B),.Z(Z));

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
module AOI221M0W( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI221M0W$func AOI221M0W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI221M0W$func AOI221M0W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

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
module AOI221M1W( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI221M1W$func AOI221M1W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI221M1W$func AOI221M1W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

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
module AOI221M2W( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI221M2W$func AOI221M2W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI221M2W$func AOI221M2W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

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
module AOI221M4W( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI221M4W$func AOI221M4W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI221M4W$func AOI221M4W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

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
module AOI221M6WA( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI221M6WA$func AOI221M6WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI221M6WA$func AOI221M6WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

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
module AOI221M8WA( Z, A1, A2, B1, B2, C);
input A1, A2, B1, B2, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI221M8WA$func AOI221M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI221M8WA$func AOI221M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C(C),.Z(Z));

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
module AOI222M0WA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI222M0WA$func AOI222M0WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI222M0WA$func AOI222M0WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

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
module AOI222M1WA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI222M1WA$func AOI222M1WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI222M1WA$func AOI222M1WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

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
module AOI222M2W( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI222M2W$func AOI222M2W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI222M2W$func AOI222M2W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

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
module AOI222M4W( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI222M4W$func AOI222M4W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI222M4W$func AOI222M4W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

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
module AOI222M6WA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI222M6WA$func AOI222M6WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI222M6WA$func AOI222M6WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

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
module AOI222M8WA( Z, A1, A2, B1, B2, C1, C2);
input A1, A2, B1, B2, C1, C2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI222M8WA$func AOI222M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI222M8WA$func AOI222M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.C1(C1),.C2(C2),.Z(Z));

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
module AOI22B20M0W( Z, B1, B2, NA1, NA2);
input B1, B2, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22B20M0W$func AOI22B20M0W_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22B20M0W$func AOI22B20M0W_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

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
module AOI22B20M1W( Z, B1, B2, NA1, NA2);
input B1, B2, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22B20M1W$func AOI22B20M1W_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22B20M1W$func AOI22B20M1W_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

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
module AOI22B20M2W( Z, B1, B2, NA1, NA2);
input B1, B2, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22B20M2W$func AOI22B20M2W_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22B20M2W$func AOI22B20M2W_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

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
module AOI22B20M4W( Z, B1, B2, NA1, NA2);
input B1, B2, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22B20M4W$func AOI22B20M4W_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22B20M4W$func AOI22B20M4W_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

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
module AOI22B20M8WA( Z, B1, B2, NA1, NA2);
input B1, B2, NA1, NA2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22B20M8WA$func AOI22B20M8WA_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22B20M8WA$func AOI22B20M8WA_inst(.B1(B1),.B2(B2),.NA1(NA1),.NA2(NA2),.Z(Z));

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
module AOI22M0W( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M0W$func AOI22M0W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M0W$func AOI22M0W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AOI22M12WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M12WA$func AOI22M12WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M12WA$func AOI22M12WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AOI22M16WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M16WA$func AOI22M16WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M16WA$func AOI22M16WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AOI22M1W( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M1W$func AOI22M1W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M1W$func AOI22M1W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AOI22M2W( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M2W$func AOI22M2W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M2W$func AOI22M2W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AOI22M4W( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M4W$func AOI22M4W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M4W$func AOI22M4W_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AOI22M6WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M6WA$func AOI22M6WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M6WA$func AOI22M6WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AOI22M8WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI22M8WA$func AOI22M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI22M8WA$func AOI22M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module AOI31M0W( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M0W$func AOI31M0W_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M0W$func AOI31M0W_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

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
module AOI31M12WA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M12WA$func AOI31M12WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M12WA$func AOI31M12WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

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
module AOI31M1W( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M1W$func AOI31M1W_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M1W$func AOI31M1W_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

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
module AOI31M2W( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M2W$func AOI31M2W_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M2W$func AOI31M2W_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

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
module AOI31M4W( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M4W$func AOI31M4W_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M4W$func AOI31M4W_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

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
module AOI31M6WA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M6WA$func AOI31M6WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M6WA$func AOI31M6WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

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
module AOI31M8WA( Z, A1, A2, A3, B);
input A1, A2, A3, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI31M8WA$func AOI31M8WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI31M8WA$func AOI31M8WA_inst(.A1(A1),.A2(A2),.A3(A3),.B(B),.Z(Z));

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
module AOI32M0W( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M0W$func AOI32M0W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M0W$func AOI32M0W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

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
module AOI32M12WA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M12WA$func AOI32M12WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M12WA$func AOI32M12WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

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
module AOI32M1W( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M1W$func AOI32M1W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M1W$func AOI32M1W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

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
module AOI32M2W( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M2W$func AOI32M2W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M2W$func AOI32M2W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

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
module AOI32M4W( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M4W$func AOI32M4W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M4W$func AOI32M4W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

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
module AOI32M6WA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M6WA$func AOI32M6WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M6WA$func AOI32M6WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

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
module AOI32M8WA( Z, A1, A2, A3, B1, B2);
input A1, A2, A3, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI32M8WA$func AOI32M8WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI32M8WA$func AOI32M8WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.Z(Z));

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
module AOI33M0W( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI33M0W$func AOI33M0W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI33M0W$func AOI33M0W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

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
module AOI33M1W( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI33M1W$func AOI33M1W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI33M1W$func AOI33M1W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

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
module AOI33M2W( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI33M2W$func AOI33M2W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI33M2W$func AOI33M2W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

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
module AOI33M4W( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI33M4W$func AOI33M4W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI33M4W$func AOI33M4W_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

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
module AOI33M8WA( Z, A1, A2, A3, B1, B2, B3);
input A1, A2, A3, B1, B2, B3;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	AOI33M8WA$func AOI33M8WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	AOI33M8WA$func AOI33M8WA_inst(.A1(A1),.A2(A2),.A3(A3),.B1(B1),.B2(B2),.B3(B3),.Z(Z));

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
module BEM2WA( OA1, OA2, Z, M0, M1, M2);
input M0, M1, M2;
output OA1, OA2, Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEM2WA$func BEM2WA_inst(.M0(M0),.M1(M1),.M2(M2),.OA1(OA1),.OA2(OA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEM2WA$func BEM2WA_inst(.M0(M0),.M1(M1),.M2(M2),.OA1(OA1),.OA2(OA2),.Z(Z));

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
module BEM4WA( OA1, OA2, Z, M0, M1, M2);
input M0, M1, M2;
output OA1, OA2, Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEM4WA$func BEM4WA_inst(.M0(M0),.M1(M1),.M2(M2),.OA1(OA1),.OA2(OA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEM4WA$func BEM4WA_inst(.M0(M0),.M1(M1),.M2(M2),.OA1(OA1),.OA2(OA2),.Z(Z));

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
module BEM8WA( OA1, OA2, Z, M0, M1, M2);
input M0, M1, M2;
output OA1, OA2, Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEM8WA$func BEM8WA_inst(.M0(M0),.M1(M1),.M2(M2),.OA1(OA1),.OA2(OA2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEM8WA$func BEM8WA_inst(.M0(M0),.M1(M1),.M2(M2),.OA1(OA1),.OA2(OA2),.Z(Z));

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
module BEMXBM2W( PB, M0, M1, OA1, OA2, Z);
input M0, M1, OA1, OA2, Z;
output PB;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEMXBM2W$func BEMXBM2W_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.PB(PB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEMXBM2W$func BEMXBM2W_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.PB(PB),.Z(Z));

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
module BEMXBM4W( PB, M0, M1, OA1, OA2, Z);
input M0, M1, OA1, OA2, Z;
output PB;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEMXBM4W$func BEMXBM4W_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.PB(PB),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEMXBM4W$func BEMXBM4W_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.PB(PB),.Z(Z));

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
module BEMXM2WA( P, M0, M1, OA1, OA2, Z);
input M0, M1, OA1, OA2, Z;
output P;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEMXM2WA$func BEMXM2WA_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.P(P),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEMXM2WA$func BEMXM2WA_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.P(P),.Z(Z));

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
module BEMXM4WA( P, M0, M1, OA1, OA2, Z);
input M0, M1, OA1, OA2, Z;
output P;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEMXM4WA$func BEMXM4WA_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.P(P),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEMXM4WA$func BEMXM4WA_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.P(P),.Z(Z));

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
module BEMXM8WA( P, M0, M1, OA1, OA2, Z);
input M0, M1, OA1, OA2, Z;
output P;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BEMXM8WA$func BEMXM8WA_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.P(P),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BEMXM8WA$func BEMXM8WA_inst(.M0(M0),.M1(M1),.OA1(OA1),.OA2(OA2),.P(P),.Z(Z));

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
module BHDM1W( Z);
inout Z;

    // Busholder.
  wire io_wire;

  buf(weak0,weak1) SMC_I0(Z, io_wire);
  buf              SMC_I1(io_wire, Z);
 
endmodule
`endcelldefine
`celldefine
module BUFM10W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM10W$func BUFM10W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM10W$func BUFM10W_inst(.A(A),.Z(Z));

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
module BUFM12W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM12W$func BUFM12W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM12W$func BUFM12W_inst(.A(A),.Z(Z));

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
module BUFM14W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM14W$func BUFM14W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM14W$func BUFM14W_inst(.A(A),.Z(Z));

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
module BUFM16W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM16W$func BUFM16W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM16W$func BUFM16W_inst(.A(A),.Z(Z));

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
module BUFM18W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM18W$func BUFM18W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM18W$func BUFM18W_inst(.A(A),.Z(Z));

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
module BUFM20W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM20W$func BUFM20W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM20W$func BUFM20W_inst(.A(A),.Z(Z));

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
module BUFM22WA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM22WA$func BUFM22WA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM22WA$func BUFM22WA_inst(.A(A),.Z(Z));

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
module BUFM24W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM24W$func BUFM24W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM24W$func BUFM24W_inst(.A(A),.Z(Z));

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
module BUFM26WA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM26WA$func BUFM26WA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM26WA$func BUFM26WA_inst(.A(A),.Z(Z));

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
module BUFM2W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM2W$func BUFM2W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM2W$func BUFM2W_inst(.A(A),.Z(Z));

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
module BUFM32WA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM32WA$func BUFM32WA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM32WA$func BUFM32WA_inst(.A(A),.Z(Z));

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
module BUFM3W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM3W$func BUFM3W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM3W$func BUFM3W_inst(.A(A),.Z(Z));

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
module BUFM40WA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM40WA$func BUFM40WA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM40WA$func BUFM40WA_inst(.A(A),.Z(Z));

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
module BUFM48WA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM48WA$func BUFM48WA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM48WA$func BUFM48WA_inst(.A(A),.Z(Z));

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
module BUFM4W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM4W$func BUFM4W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM4W$func BUFM4W_inst(.A(A),.Z(Z));

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
module BUFM5W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM5W$func BUFM5W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM5W$func BUFM5W_inst(.A(A),.Z(Z));

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
module BUFM6W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM6W$func BUFM6W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM6W$func BUFM6W_inst(.A(A),.Z(Z));

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
module BUFM8W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFM8W$func BUFM8W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFM8W$func BUFM8W_inst(.A(A),.Z(Z));

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
module BUFTM0W( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM0W$func BUFTM0W_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM0W$func BUFTM0W_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM12W( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM12W$func BUFTM12W_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM12W$func BUFTM12W_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM16W( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM16W$func BUFTM16W_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM16W$func BUFTM16W_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM1W( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM1W$func BUFTM1W_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM1W$func BUFTM1W_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM20W( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM20W$func BUFTM20W_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM20W$func BUFTM20W_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM22WA( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM22WA$func BUFTM22WA_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM22WA$func BUFTM22WA_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM24WA( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM24WA$func BUFTM24WA_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM24WA$func BUFTM24WA_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM2W( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM2W$func BUFTM2W_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM2W$func BUFTM2W_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM32WA( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM32WA$func BUFTM32WA_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM32WA$func BUFTM32WA_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM3W( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM3W$func BUFTM3W_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM3W$func BUFTM3W_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM40WA( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM40WA$func BUFTM40WA_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM40WA$func BUFTM40WA_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM48WA( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM48WA$func BUFTM48WA_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM48WA$func BUFTM48WA_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM4W( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM4W$func BUFTM4W_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM4W$func BUFTM4W_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM6W( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM6W$func BUFTM6W_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM6W$func BUFTM6W_inst(.A(A),.E(E),.Z(Z));

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
module BUFTM8W( Z, A, E);
input A, E;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	BUFTM8W$func BUFTM8W_inst(.A(A),.E(E),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	BUFTM8W$func BUFTM8W_inst(.A(A),.E(E),.Z(Z));

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
module CKAN2M12W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M12W$func CKAN2M12W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M12W$func CKAN2M12W_inst(.A(A),.B(B),.Z(Z));

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
module CKAN2M16WA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M16WA$func CKAN2M16WA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M16WA$func CKAN2M16WA_inst(.A(A),.B(B),.Z(Z));

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
module CKAN2M2W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M2W$func CKAN2M2W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M2W$func CKAN2M2W_inst(.A(A),.B(B),.Z(Z));

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
module CKAN2M3W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M3W$func CKAN2M3W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M3W$func CKAN2M3W_inst(.A(A),.B(B),.Z(Z));

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
module CKAN2M4W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M4W$func CKAN2M4W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M4W$func CKAN2M4W_inst(.A(A),.B(B),.Z(Z));

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
module CKAN2M6W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M6W$func CKAN2M6W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M6W$func CKAN2M6W_inst(.A(A),.B(B),.Z(Z));

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
module CKAN2M8WA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKAN2M8WA$func CKAN2M8WA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKAN2M8WA$func CKAN2M8WA_inst(.A(A),.B(B),.Z(Z));

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
module CKBUFM12W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM12W$func CKBUFM12W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM12W$func CKBUFM12W_inst(.A(A),.Z(Z));

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
module CKBUFM16W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM16W$func CKBUFM16W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM16W$func CKBUFM16W_inst(.A(A),.Z(Z));

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
module CKBUFM1W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM1W$func CKBUFM1W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM1W$func CKBUFM1W_inst(.A(A),.Z(Z));

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
module CKBUFM20W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM20W$func CKBUFM20W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM20W$func CKBUFM20W_inst(.A(A),.Z(Z));

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
module CKBUFM22WA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM22WA$func CKBUFM22WA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM22WA$func CKBUFM22WA_inst(.A(A),.Z(Z));

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
module CKBUFM24W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM24W$func CKBUFM24W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM24W$func CKBUFM24W_inst(.A(A),.Z(Z));

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
module CKBUFM26WA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM26WA$func CKBUFM26WA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM26WA$func CKBUFM26WA_inst(.A(A),.Z(Z));

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
module CKBUFM2W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM2W$func CKBUFM2W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM2W$func CKBUFM2W_inst(.A(A),.Z(Z));

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
module CKBUFM32W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM32W$func CKBUFM32W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM32W$func CKBUFM32W_inst(.A(A),.Z(Z));

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
module CKBUFM3W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM3W$func CKBUFM3W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM3W$func CKBUFM3W_inst(.A(A),.Z(Z));

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
module CKBUFM40W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM40W$func CKBUFM40W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM40W$func CKBUFM40W_inst(.A(A),.Z(Z));

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
module CKBUFM48W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM48W$func CKBUFM48W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM48W$func CKBUFM48W_inst(.A(A),.Z(Z));

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
module CKBUFM4W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM4W$func CKBUFM4W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM4W$func CKBUFM4W_inst(.A(A),.Z(Z));

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
module CKBUFM6W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM6W$func CKBUFM6W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM6W$func CKBUFM6W_inst(.A(A),.Z(Z));

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
module CKBUFM8W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKBUFM8W$func CKBUFM8W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKBUFM8W$func CKBUFM8W_inst(.A(A),.Z(Z));

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
module CKINVM12W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM12W$func CKINVM12W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM12W$func CKINVM12W_inst(.A(A),.Z(Z));

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
module CKINVM16W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM16W$func CKINVM16W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM16W$func CKINVM16W_inst(.A(A),.Z(Z));

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
module CKINVM1W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM1W$func CKINVM1W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM1W$func CKINVM1W_inst(.A(A),.Z(Z));

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
module CKINVM20W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM20W$func CKINVM20W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM20W$func CKINVM20W_inst(.A(A),.Z(Z));

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
module CKINVM22WA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM22WA$func CKINVM22WA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM22WA$func CKINVM22WA_inst(.A(A),.Z(Z));

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
module CKINVM24W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM24W$func CKINVM24W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM24W$func CKINVM24W_inst(.A(A),.Z(Z));

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
module CKINVM26WA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM26WA$func CKINVM26WA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM26WA$func CKINVM26WA_inst(.A(A),.Z(Z));

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
module CKINVM2W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM2W$func CKINVM2W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM2W$func CKINVM2W_inst(.A(A),.Z(Z));

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
module CKINVM32W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM32W$func CKINVM32W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM32W$func CKINVM32W_inst(.A(A),.Z(Z));

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
module CKINVM3W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM3W$func CKINVM3W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM3W$func CKINVM3W_inst(.A(A),.Z(Z));

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
module CKINVM40W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM40W$func CKINVM40W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM40W$func CKINVM40W_inst(.A(A),.Z(Z));

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
module CKINVM48W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM48W$func CKINVM48W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM48W$func CKINVM48W_inst(.A(A),.Z(Z));

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
module CKINVM4W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM4W$func CKINVM4W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM4W$func CKINVM4W_inst(.A(A),.Z(Z));

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
module CKINVM6W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM6W$func CKINVM6W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM6W$func CKINVM6W_inst(.A(A),.Z(Z));

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
module CKINVM8W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKINVM8W$func CKINVM8W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKINVM8W$func CKINVM8W_inst(.A(A),.Z(Z));

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
module CKMUX2M12W( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M12W$func CKMUX2M12W_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M12W$func CKMUX2M12W_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module CKMUX2M16WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M16WA$func CKMUX2M16WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M16WA$func CKMUX2M16WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module CKMUX2M2W( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M2W$func CKMUX2M2W_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M2W$func CKMUX2M2W_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module CKMUX2M3W( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M3W$func CKMUX2M3W_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M3W$func CKMUX2M3W_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module CKMUX2M4W( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M4W$func CKMUX2M4W_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M4W$func CKMUX2M4W_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module CKMUX2M6W( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M6W$func CKMUX2M6W_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M6W$func CKMUX2M6W_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module CKMUX2M8W( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKMUX2M8W$func CKMUX2M8W_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKMUX2M8W$func CKMUX2M8W_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module CKND2M12W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKND2M12W$func CKND2M12W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKND2M12W$func CKND2M12W_inst(.A(A),.B(B),.Z(Z));

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
module CKND2M16WA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKND2M16WA$func CKND2M16WA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKND2M16WA$func CKND2M16WA_inst(.A(A),.B(B),.Z(Z));

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
module CKND2M2W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKND2M2W$func CKND2M2W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKND2M2W$func CKND2M2W_inst(.A(A),.B(B),.Z(Z));

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
module CKND2M4W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKND2M4W$func CKND2M4W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKND2M4W$func CKND2M4W_inst(.A(A),.B(B),.Z(Z));

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
module CKND2M6WA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKND2M6WA$func CKND2M6WA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKND2M6WA$func CKND2M6WA_inst(.A(A),.B(B),.Z(Z));

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
module CKND2M8W( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKND2M8W$func CKND2M8W_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKND2M8W$func CKND2M8W_inst(.A(A),.B(B),.Z(Z));

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
module CKXOR2M12WA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKXOR2M12WA$func CKXOR2M12WA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKXOR2M12WA$func CKXOR2M12WA_inst(.A(A),.B(B),.Z(Z));

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
module CKXOR2M1WA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKXOR2M1WA$func CKXOR2M1WA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKXOR2M1WA$func CKXOR2M1WA_inst(.A(A),.B(B),.Z(Z));

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
module CKXOR2M2WA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKXOR2M2WA$func CKXOR2M2WA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKXOR2M2WA$func CKXOR2M2WA_inst(.A(A),.B(B),.Z(Z));

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
module CKXOR2M4WA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKXOR2M4WA$func CKXOR2M4WA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKXOR2M4WA$func CKXOR2M4WA_inst(.A(A),.B(B),.Z(Z));

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
module CKXOR2M8WA( Z, A, B);
input A, B;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	CKXOR2M8WA$func CKXOR2M8WA_inst(.A(A),.B(B),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	CKXOR2M8WA$func CKXOR2M8WA_inst(.A(A),.B(B),.Z(Z));

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
module DEL1M1W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL1M1W$func DEL1M1W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL1M1W$func DEL1M1W_inst(.A(A),.Z(Z));

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
module DEL1M4W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL1M4W$func DEL1M4W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL1M4W$func DEL1M4W_inst(.A(A),.Z(Z));

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
module DEL2M1W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL2M1W$func DEL2M1W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL2M1W$func DEL2M1W_inst(.A(A),.Z(Z));

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
module DEL2M4W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL2M4W$func DEL2M4W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL2M4W$func DEL2M4W_inst(.A(A),.Z(Z));

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
module DEL3M1W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL3M1W$func DEL3M1W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL3M1W$func DEL3M1W_inst(.A(A),.Z(Z));

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
module DEL3M4W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL3M4W$func DEL3M4W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL3M4W$func DEL3M4W_inst(.A(A),.Z(Z));

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
module DEL4M1W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL4M1W$func DEL4M1W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL4M1W$func DEL4M1W_inst(.A(A),.Z(Z));

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
module DEL4M4W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	DEL4M4W$func DEL4M4W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DEL4M4W$func DEL4M4W_inst(.A(A),.Z(Z));

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
module DFAQM1WA( Q, A, B, CK);
input A, B, CK;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire A$delay ;
	wire B$delay ;
	wire CK$delay ;

	DFAQM1WA$func DFAQM1WA_inst(.A(A$delay),.B(B$delay),.CK(CK$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFAQM1WA$func DFAQM1WA_inst(.A(A),.B(B),.CK(CK),.Q(Q),.notifier(notifier));

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
module DFAQM2WA( Q, A, B, CK);
input A, B, CK;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire A$delay ;
	wire B$delay ;
	wire CK$delay ;

	DFAQM2WA$func DFAQM2WA_inst(.A(A$delay),.B(B$delay),.CK(CK$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFAQM2WA$func DFAQM2WA_inst(.A(A),.B(B),.CK(CK),.Q(Q),.notifier(notifier));

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
module DFAQM4WA( Q, A, B, CK);
input A, B, CK;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire A$delay ;
	wire B$delay ;
	wire CK$delay ;

	DFAQM4WA$func DFAQM4WA_inst(.A(A$delay),.B(B$delay),.CK(CK$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFAQM4WA$func DFAQM4WA_inst(.A(A),.B(B),.CK(CK),.Q(Q),.notifier(notifier));

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
module DFAQM6WA( Q, A, B, CK);
input A, B, CK;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire A$delay ;
	wire B$delay ;
	wire CK$delay ;

	DFAQM6WA$func DFAQM6WA_inst(.A(A$delay),.B(B$delay),.CK(CK$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFAQM6WA$func DFAQM6WA_inst(.A(A),.B(B),.CK(CK),.Q(Q),.notifier(notifier));

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
module DFAQM8WA( Q, A, B, CK);
input A, B, CK;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire A$delay ;
	wire B$delay ;
	wire CK$delay ;

	DFAQM8WA$func DFAQM8WA_inst(.A(A$delay),.B(B$delay),.CK(CK$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFAQM8WA$func DFAQM8WA_inst(.A(A),.B(B),.CK(CK),.Q(Q),.notifier(notifier));

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
module DFCM1WA( Q, QB, CKB, D);
input CKB, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCM1WA$func DFCM1WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCM1WA$func DFCM1WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

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
module DFCM2WA( Q, QB, CKB, D);
input CKB, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCM2WA$func DFCM2WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCM2WA$func DFCM2WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

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
module DFCM4WA( Q, QB, CKB, D);
input CKB, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCM4WA$func DFCM4WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCM4WA$func DFCM4WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

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
module DFCM8WA( Q, QB, CKB, D);
input CKB, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCM8WA$func DFCM8WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCM8WA$func DFCM8WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

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
module DFCQM1WA( Q, CKB, D);
input CKB, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCQM1WA$func DFCQM1WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQM1WA$func DFCQM1WA_inst(.CKB(CKB),.D(D),.Q(Q),.notifier(notifier));

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
module DFCQM2WA( Q, CKB, D);
input CKB, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCQM2WA$func DFCQM2WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQM2WA$func DFCQM2WA_inst(.CKB(CKB),.D(D),.Q(Q),.notifier(notifier));

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
module DFCQM4WA( Q, CKB, D);
input CKB, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCQM4WA$func DFCQM4WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQM4WA$func DFCQM4WA_inst(.CKB(CKB),.D(D),.Q(Q),.notifier(notifier));

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
module DFCQM8WA( Q, CKB, D);
input CKB, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;

	DFCQM8WA$func DFCQM8WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQM8WA$func DFCQM8WA_inst(.CKB(CKB),.D(D),.Q(Q),.notifier(notifier));

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
module DFCQRM1WA( Q, CKB, D, RB);
input CKB, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCQRM1WA$func DFCQRM1WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRM1WA$func DFCQRM1WA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFCQRM2WA( Q, CKB, D, RB);
input CKB, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCQRM2WA$func DFCQRM2WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRM2WA$func DFCQRM2WA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFCQRM4WA( Q, CKB, D, RB);
input CKB, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCQRM4WA$func DFCQRM4WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRM4WA$func DFCQRM4WA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFCQRM8WA( Q, CKB, D, RB);
input CKB, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCQRM8WA$func DFCQRM8WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRM8WA$func DFCQRM8WA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFCQRSM1WA( Q, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCQRSM1WA$func DFCQRSM1WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRSM1WA$func DFCQRSM1WA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFCQRSM2WA( Q, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCQRSM2WA$func DFCQRSM2WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRSM2WA$func DFCQRSM2WA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFCQRSM4WA( Q, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCQRSM4WA$func DFCQRSM4WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRSM4WA$func DFCQRSM4WA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFCQRSM8WA( Q, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCQRSM8WA$func DFCQRSM8WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQRSM8WA$func DFCQRSM8WA_inst(.CKB(CKB),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFCQSM1WA( Q, CKB, D, SB);
input CKB, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCQSM1WA$func DFCQSM1WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQSM1WA$func DFCQSM1WA_inst(.CKB(CKB),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

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
module DFCQSM2WA( Q, CKB, D, SB);
input CKB, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCQSM2WA$func DFCQSM2WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQSM2WA$func DFCQSM2WA_inst(.CKB(CKB),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

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
module DFCQSM4WA( Q, CKB, D, SB);
input CKB, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCQSM4WA$func DFCQSM4WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQSM4WA$func DFCQSM4WA_inst(.CKB(CKB),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

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
module DFCQSM8WA( Q, CKB, D, SB);
input CKB, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCQSM8WA$func DFCQSM8WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCQSM8WA$func DFCQSM8WA_inst(.CKB(CKB),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

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
module DFCRM1WA( Q, QB, CKB, D, RB);
input CKB, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCRM1WA$func DFCRM1WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRM1WA$func DFCRM1WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFCRM2WA( Q, QB, CKB, D, RB);
input CKB, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCRM2WA$func DFCRM2WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRM2WA$func DFCRM2WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFCRM4WA( Q, QB, CKB, D, RB);
input CKB, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCRM4WA$func DFCRM4WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRM4WA$func DFCRM4WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFCRM8WA( Q, QB, CKB, D, RB);
input CKB, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFCRM8WA$func DFCRM8WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRM8WA$func DFCRM8WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFCRSM1WA( Q, QB, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCRSM1WA$func DFCRSM1WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRSM1WA$func DFCRSM1WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFCRSM2WA( Q, QB, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCRSM2WA$func DFCRSM2WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRSM2WA$func DFCRSM2WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFCRSM4WA( Q, QB, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCRSM4WA$func DFCRSM4WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRSM4WA$func DFCRSM4WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFCRSM8WA( Q, QB, CKB, D, RB, SB);
input CKB, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFCRSM8WA$func DFCRSM8WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCRSM8WA$func DFCRSM8WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFCSM1WA( Q, QB, CKB, D, SB);
input CKB, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCSM1WA$func DFCSM1WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCSM1WA$func DFCSM1WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module DFCSM2WA( Q, QB, CKB, D, SB);
input CKB, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCSM2WA$func DFCSM2WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCSM2WA$func DFCSM2WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module DFCSM4WA( Q, QB, CKB, D, SB);
input CKB, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCSM4WA$func DFCSM4WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCSM4WA$func DFCSM4WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module DFCSM8WA( Q, QB, CKB, D, SB);
input CKB, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFCSM8WA$func DFCSM8WA_inst(.CKB(CKB$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFCSM8WA$func DFCSM8WA_inst(.CKB(CKB),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module DFEM1WA( Q, QB, CK, D, E);
input CK, D, E;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEM1WA$func DFEM1WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEM1WA$func DFEM1WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.notifier(notifier));

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
module DFEM2WA( Q, QB, CK, D, E);
input CK, D, E;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEM2WA$func DFEM2WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEM2WA$func DFEM2WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.notifier(notifier));

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
module DFEM4WA( Q, QB, CK, D, E);
input CK, D, E;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEM4WA$func DFEM4WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEM4WA$func DFEM4WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.notifier(notifier));

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
module DFEM8WA( Q, QB, CK, D, E);
input CK, D, E;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEM8WA$func DFEM8WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEM8WA$func DFEM8WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.notifier(notifier));

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
module DFEQBM1WA( QB, CK, D, E);
input CK, D, E;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQBM1WA$func DFEQBM1WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQBM1WA$func DFEQBM1WA_inst(.CK(CK),.D(D),.E(E),.QB(QB),.notifier(notifier));

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
module DFEQBM2WA( QB, CK, D, E);
input CK, D, E;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQBM2WA$func DFEQBM2WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQBM2WA$func DFEQBM2WA_inst(.CK(CK),.D(D),.E(E),.QB(QB),.notifier(notifier));

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
module DFEQBM4WA( QB, CK, D, E);
input CK, D, E;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQBM4WA$func DFEQBM4WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQBM4WA$func DFEQBM4WA_inst(.CK(CK),.D(D),.E(E),.QB(QB),.notifier(notifier));

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
module DFEQBM8WA( QB, CK, D, E);
input CK, D, E;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQBM8WA$func DFEQBM8WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.QB(QB),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQBM8WA$func DFEQBM8WA_inst(.CK(CK),.D(D),.E(E),.QB(QB),.notifier(notifier));

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
module DFEQM0WA( Q, CK, D, E);
input CK, D, E;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQM0WA$func DFEQM0WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQM0WA$func DFEQM0WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.notifier(notifier));

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
module DFEQM1WA( Q, CK, D, E);
input CK, D, E;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQM1WA$func DFEQM1WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQM1WA$func DFEQM1WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.notifier(notifier));

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
module DFEQM2WA( Q, CK, D, E);
input CK, D, E;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQM2WA$func DFEQM2WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQM2WA$func DFEQM2WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.notifier(notifier));

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
module DFEQM4WA( Q, CK, D, E);
input CK, D, E;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQM4WA$func DFEQM4WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQM4WA$func DFEQM4WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.notifier(notifier));

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
module DFEQM8WA( Q, CK, D, E);
input CK, D, E;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;

	DFEQM8WA$func DFEQM8WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.notifier(notifier));


	buf MGM_G0(ENABLE_E ,E$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQM8WA$func DFEQM8WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.notifier(notifier));

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
module DFEQRM1WA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQRM1WA$func DFEQRM1WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);


   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQRM1WA$func DFEQRM1WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFEQRM2WA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQRM2WA$func DFEQRM2WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);


   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQRM2WA$func DFEQRM2WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFEQRM4WA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQRM4WA$func DFEQRM4WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);


   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQRM4WA$func DFEQRM4WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFEQRM8WA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQRM8WA$func DFEQRM8WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);


   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQRM8WA$func DFEQRM8WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFEQZRM1WA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQZRM1WA$func DFEQZRM1WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQZRM1WA$func DFEQZRM1WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFEQZRM2WA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQZRM2WA$func DFEQZRM2WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQZRM2WA$func DFEQZRM2WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFEQZRM4WA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQZRM4WA$func DFEQZRM4WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQZRM4WA$func DFEQZRM4WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFEQZRM8WA( Q, CK, D, E, RB);
input CK, D, E, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEQZRM8WA$func DFEQZRM8WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEQZRM8WA$func DFEQZRM8WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFERM1WA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFERM1WA$func DFERM1WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);



   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFERM1WA$func DFERM1WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFERM2WA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFERM2WA$func DFERM2WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);



   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFERM2WA$func DFERM2WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFERM4WA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFERM4WA$func DFERM4WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);



   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFERM4WA$func DFERM4WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFERM8WA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFERM8WA$func DFERM8WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);



   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFERM8WA$func DFERM8WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFEZRM1WA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEZRM1WA$func DFEZRM1WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEZRM1WA$func DFEZRM1WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFEZRM2WA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEZRM2WA$func DFEZRM2WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEZRM2WA$func DFEZRM2WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFEZRM4WA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEZRM4WA$func DFEZRM4WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEZRM4WA$func DFEZRM4WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFEZRM8WA( Q, QB, CK, D, E, RB);
input CK, D, E, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire E$delay ;
	wire RB$delay ;

	DFEZRM8WA$func DFEZRM8WA_inst(.CK(CK$delay),.D(D$delay),.E(E$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_E_AND_RB ,RB$delay,E$delay);


	buf MGM_G1(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFEZRM8WA$func DFEZRM8WA_inst(.CK(CK),.D(D),.E(E),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFM1WA( Q, QB, CK, D);
input CK, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFM1WA$func DFM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFM1WA$func DFM1WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

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
module DFM2WA( Q, QB, CK, D);
input CK, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFM2WA$func DFM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFM2WA$func DFM2WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

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
module DFM4WA( Q, QB, CK, D);
input CK, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFM4WA$func DFM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFM4WA$func DFM4WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

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
module DFM8WA( Q, QB, CK, D);
input CK, D;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFM8WA$func DFM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFM8WA$func DFM8WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.notifier(notifier));

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
module DFMM1WA( Q, QB, CK, D1, D2, S);
input CK, D1, D2, S;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMM1WA$func DFMM1WA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.QB(QB),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMM1WA$func DFMM1WA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.QB(QB),.S(S),.notifier(notifier));

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
module DFMM2WA( Q, QB, CK, D1, D2, S);
input CK, D1, D2, S;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMM2WA$func DFMM2WA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.QB(QB),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMM2WA$func DFMM2WA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.QB(QB),.S(S),.notifier(notifier));

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
module DFMM4WA( Q, QB, CK, D1, D2, S);
input CK, D1, D2, S;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMM4WA$func DFMM4WA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.QB(QB),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMM4WA$func DFMM4WA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.QB(QB),.S(S),.notifier(notifier));

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
module DFMM8WA( Q, QB, CK, D1, D2, S);
input CK, D1, D2, S;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMM8WA$func DFMM8WA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.QB(QB),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMM8WA$func DFMM8WA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.QB(QB),.S(S),.notifier(notifier));

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
module DFMQM1WA( Q, CK, D1, D2, S);
input CK, D1, D2, S;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMQM1WA$func DFMQM1WA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMQM1WA$func DFMQM1WA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.S(S),.notifier(notifier));

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
module DFMQM2WA( Q, CK, D1, D2, S);
input CK, D1, D2, S;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMQM2WA$func DFMQM2WA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMQM2WA$func DFMQM2WA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.S(S),.notifier(notifier));

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
module DFMQM4WA( Q, CK, D1, D2, S);
input CK, D1, D2, S;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMQM4WA$func DFMQM4WA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMQM4WA$func DFMQM4WA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.S(S),.notifier(notifier));

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
module DFMQM8WA( Q, CK, D1, D2, S);
input CK, D1, D2, S;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D1$delay ;
	wire D2$delay ;
	wire S$delay ;

	DFMQM8WA$func DFMQM8WA_inst(.CK(CK$delay),.D1(D1$delay),.D2(D2$delay),.Q(Q),.S(S$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_S ,S$delay);


	not MGM_G1(ENABLE_NOT_S ,S$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFMQM8WA$func DFMQM8WA_inst(.CK(CK),.D1(D1),.D2(D2),.Q(Q),.S(S),.notifier(notifier));

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
module DFQBM1WA( QB, CK, D);
input CK, D;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQBM1WA$func DFQBM1WA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBM1WA$func DFQBM1WA_inst(.CK(CK),.D(D),.QB(QB),.notifier(notifier));

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
module DFQBM2WA( QB, CK, D);
input CK, D;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQBM2WA$func DFQBM2WA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBM2WA$func DFQBM2WA_inst(.CK(CK),.D(D),.QB(QB),.notifier(notifier));

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
module DFQBM4WA( QB, CK, D);
input CK, D;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQBM4WA$func DFQBM4WA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBM4WA$func DFQBM4WA_inst(.CK(CK),.D(D),.QB(QB),.notifier(notifier));

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
module DFQBM8WA( QB, CK, D);
input CK, D;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQBM8WA$func DFQBM8WA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBM8WA$func DFQBM8WA_inst(.CK(CK),.D(D),.QB(QB),.notifier(notifier));

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
module DFQBRM1WA( QB, CK, D, RB);
input CK, D, RB;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQBRM1WA$func DFQBRM1WA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBRM1WA$func DFQBRM1WA_inst(.CK(CK),.D(D),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFQBRM2WA( QB, CK, D, RB);
input CK, D, RB;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQBRM2WA$func DFQBRM2WA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBRM2WA$func DFQBRM2WA_inst(.CK(CK),.D(D),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFQBRM4WA( QB, CK, D, RB);
input CK, D, RB;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQBRM4WA$func DFQBRM4WA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBRM4WA$func DFQBRM4WA_inst(.CK(CK),.D(D),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFQBRM8WA( QB, CK, D, RB);
input CK, D, RB;
output QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQBRM8WA$func DFQBRM8WA_inst(.CK(CK$delay),.D(D$delay),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQBRM8WA$func DFQBRM8WA_inst(.CK(CK),.D(D),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFQM1WA( Q, CK, D);
input CK, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQM1WA$func DFQM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQM1WA$func DFQM1WA_inst(.CK(CK),.D(D),.Q(Q),.notifier(notifier));

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
module DFQM2WA( Q, CK, D);
input CK, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQM2WA$func DFQM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQM2WA$func DFQM2WA_inst(.CK(CK),.D(D),.Q(Q),.notifier(notifier));

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
module DFQM4WA( Q, CK, D);
input CK, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQM4WA$func DFQM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQM4WA$func DFQM4WA_inst(.CK(CK),.D(D),.Q(Q),.notifier(notifier));

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
module DFQM8WA( Q, CK, D);
input CK, D;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;

	DFQM8WA$func DFQM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQM8WA$func DFQM8WA_inst(.CK(CK),.D(D),.Q(Q),.notifier(notifier));

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
module DFQRM1WA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQRM1WA$func DFQRM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRM1WA$func DFQRM1WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFQRM2WA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQRM2WA$func DFQRM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRM2WA$func DFQRM2WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFQRM4WA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQRM4WA$func DFQRM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRM4WA$func DFQRM4WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFQRM8WA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQRM8WA$func DFQRM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRM8WA$func DFQRM8WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFQRSM1WA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQRSM1WA$func DFQRSM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRSM1WA$func DFQRSM1WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFQRSM2WA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQRSM2WA$func DFQRSM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRSM2WA$func DFQRSM2WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFQRSM4WA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQRSM4WA$func DFQRSM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRSM4WA$func DFQRSM4WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFQRSM8WA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQRSM8WA$func DFQRSM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQRSM8WA$func DFQRSM8WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFQSM1WA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQSM1WA$func DFQSM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQSM1WA$func DFQSM1WA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

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
module DFQSM2WA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQSM2WA$func DFQSM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQSM2WA$func DFQSM2WA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

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
module DFQSM4WA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQSM4WA$func DFQSM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQSM4WA$func DFQSM4WA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

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
module DFQSM8WA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQSM8WA$func DFQSM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQSM8WA$func DFQSM8WA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

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
module DFQZRM1WA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQZRM1WA$func DFQZRM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRM1WA$func DFQZRM1WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFQZRM2WA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQZRM2WA$func DFQZRM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRM2WA$func DFQZRM2WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFQZRM4WA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQZRM4WA$func DFQZRM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRM4WA$func DFQZRM4WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFQZRM8WA( Q, CK, D, RB);
input CK, D, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFQZRM8WA$func DFQZRM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRM8WA$func DFQZRM8WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.notifier(notifier));

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
module DFQZRSM1WA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQZRSM1WA$func DFQZRSM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);



  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRSM1WA$func DFQZRSM1WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFQZRSM2WA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQZRSM2WA$func DFQZRSM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);



  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRSM2WA$func DFQZRSM2WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFQZRSM4WA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQZRSM4WA$func DFQZRSM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);



  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRSM4WA$func DFQZRSM4WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFQZRSM8WA( Q, CK, D, RB, SB);
input CK, D, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFQZRSM8WA$func DFQZRSM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);



  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZRSM8WA$func DFQZRSM8WA_inst(.CK(CK),.D(D),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFQZSM1WA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQZSM1WA$func DFQZSM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));
  	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZSM1WA$func DFQZSM1WA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

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
module DFQZSM2WA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQZSM2WA$func DFQZSM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));
  	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZSM2WA$func DFQZSM2WA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

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
module DFQZSM4WA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQZSM4WA$func DFQZSM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));
  	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZSM4WA$func DFQZSM4WA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

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
module DFQZSM8WA( Q, CK, D, SB);
input CK, D, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFQZSM8WA$func DFQZSM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));
  	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFQZSM8WA$func DFQZSM8WA_inst(.CK(CK),.D(D),.Q(Q),.SB(SB),.notifier(notifier));

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
module DFRM1WA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFRM1WA$func DFRM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRM1WA$func DFRM1WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFRM2WA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFRM2WA$func DFRM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRM2WA$func DFRM2WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFRM4WA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFRM4WA$func DFRM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRM4WA$func DFRM4WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFRM8WA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFRM8WA$func DFRM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRM8WA$func DFRM8WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFRSM1WA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFRSM1WA$func DFRSM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRSM1WA$func DFRSM1WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFRSM2WA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFRSM2WA$func DFRSM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRSM2WA$func DFRSM2WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFRSM4WA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFRSM4WA$func DFRSM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRSM4WA$func DFRSM4WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFRSM8WA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFRSM8WA$func DFRSM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFRSM8WA$func DFRSM8WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFSM1WA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFSM1WA$func DFSM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFSM1WA$func DFSM1WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module DFSM2WA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFSM2WA$func DFSM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFSM2WA$func DFSM2WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module DFSM4WA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFSM4WA$func DFSM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFSM4WA$func DFSM4WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module DFSM8WA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFSM8WA$func DFSM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFSM8WA$func DFSM8WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module DFZRM1WA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFZRM1WA$func DFZRM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRM1WA$func DFZRM1WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFZRM2WA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFZRM2WA$func DFZRM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRM2WA$func DFZRM2WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFZRM4WA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFZRM4WA$func DFZRM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRM4WA$func DFZRM4WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFZRM8WA( Q, QB, CK, D, RB);
input CK, D, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;

	DFZRM8WA$func DFZRM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRM8WA$func DFZRM8WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module DFZRSM1WA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFZRSM1WA$func DFZRSM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRSM1WA$func DFZRSM1WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFZRSM2WA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFZRSM2WA$func DFZRSM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRSM2WA$func DFZRSM2WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFZRSM4WA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFZRSM4WA$func DFZRSM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRSM4WA$func DFZRSM4WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFZRSM8WA( Q, QB, CK, D, RB, SB);
input CK, D, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire RB$delay ;
	wire SB$delay ;

	DFZRSM8WA$func DFZRSM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


  	buf MGM_G2(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZRSM8WA$func DFZRSM8WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module DFZSM1WA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFZSM1WA$func DFZSM1WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZSM1WA$func DFZSM1WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module DFZSM2WA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFZSM2WA$func DFZSM2WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZSM2WA$func DFZSM2WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module DFZSM4WA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFZSM4WA$func DFZSM4WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZSM4WA$func DFZSM4WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module DFZSM8WA( Q, QB, CK, D, SB);
input CK, D, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire D$delay ;
	wire SB$delay ;

	DFZSM8WA$func DFZSM8WA_inst(.CK(CK$delay),.D(D$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));
  buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	DFZSM8WA$func DFZSM8WA_inst(.CK(CK),.D(D),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module INVM0W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM0W$func INVM0W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM0W$func INVM0W_inst(.A(A),.Z(Z));

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
module INVM10W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM10W$func INVM10W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM10W$func INVM10W_inst(.A(A),.Z(Z));

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
module INVM12W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM12W$func INVM12W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM12W$func INVM12W_inst(.A(A),.Z(Z));

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
module INVM14W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM14W$func INVM14W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM14W$func INVM14W_inst(.A(A),.Z(Z));

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
module INVM16W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM16W$func INVM16W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM16W$func INVM16W_inst(.A(A),.Z(Z));

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
module INVM18W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM18W$func INVM18W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM18W$func INVM18W_inst(.A(A),.Z(Z));

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
module INVM1W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM1W$func INVM1W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM1W$func INVM1W_inst(.A(A),.Z(Z));

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
module INVM20W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM20W$func INVM20W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM20W$func INVM20W_inst(.A(A),.Z(Z));

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
module INVM22WA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM22WA$func INVM22WA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM22WA$func INVM22WA_inst(.A(A),.Z(Z));

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
module INVM24W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM24W$func INVM24W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM24W$func INVM24W_inst(.A(A),.Z(Z));

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
module INVM26WA( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM26WA$func INVM26WA_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM26WA$func INVM26WA_inst(.A(A),.Z(Z));

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
module INVM2W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM2W$func INVM2W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM2W$func INVM2W_inst(.A(A),.Z(Z));

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
module INVM32W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM32W$func INVM32W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM32W$func INVM32W_inst(.A(A),.Z(Z));

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
module INVM3W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM3W$func INVM3W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM3W$func INVM3W_inst(.A(A),.Z(Z));

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
module INVM40W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM40W$func INVM40W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM40W$func INVM40W_inst(.A(A),.Z(Z));

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
module INVM48W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM48W$func INVM48W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM48W$func INVM48W_inst(.A(A),.Z(Z));

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
module INVM4W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM4W$func INVM4W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM4W$func INVM4W_inst(.A(A),.Z(Z));

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
module INVM5W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM5W$func INVM5W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM5W$func INVM5W_inst(.A(A),.Z(Z));

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
module INVM6W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM6W$func INVM6W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM6W$func INVM6W_inst(.A(A),.Z(Z));

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
module INVM8W( Z, A);
input A;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	INVM8W$func INVM8W_inst(.A(A),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	INVM8W$func INVM8W_inst(.A(A),.Z(Z));

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
module LACM1WA( Q, QB, D, GB);
input D, GB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACM1WA$func LACM1WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACM1WA$func LACM1WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.notifier(notifier));

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
module LACM2WA( Q, QB, D, GB);
input D, GB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACM2WA$func LACM2WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACM2WA$func LACM2WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.notifier(notifier));

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
module LACM4WA( Q, QB, D, GB);
input D, GB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACM4WA$func LACM4WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACM4WA$func LACM4WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.notifier(notifier));

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
module LACM8WA( Q, QB, D, GB);
input D, GB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACM8WA$func LACM8WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACM8WA$func LACM8WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.notifier(notifier));

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
module LACQM1WA( Q, D, GB);
input D, GB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACQM1WA$func LACQM1WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQM1WA$func LACQM1WA_inst(.D(D),.GB(GB),.Q(Q),.notifier(notifier));

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
module LACQM2WA( Q, D, GB);
input D, GB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACQM2WA$func LACQM2WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQM2WA$func LACQM2WA_inst(.D(D),.GB(GB),.Q(Q),.notifier(notifier));

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
module LACQM4WA( Q, D, GB);
input D, GB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACQM4WA$func LACQM4WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQM4WA$func LACQM4WA_inst(.D(D),.GB(GB),.Q(Q),.notifier(notifier));

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
module LACQM8WA( Q, D, GB);
input D, GB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;

	LACQM8WA$func LACQM8WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQM8WA$func LACQM8WA_inst(.D(D),.GB(GB),.Q(Q),.notifier(notifier));

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
module LACQRM1WA( Q, D, GB, RB);
input D, GB, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACQRM1WA$func LACQRM1WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRM1WA$func LACQRM1WA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.notifier(notifier));

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
module LACQRM2WA( Q, D, GB, RB);
input D, GB, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACQRM2WA$func LACQRM2WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRM2WA$func LACQRM2WA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.notifier(notifier));

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
module LACQRM4WA( Q, D, GB, RB);
input D, GB, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACQRM4WA$func LACQRM4WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRM4WA$func LACQRM4WA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.notifier(notifier));

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
module LACQRM8WA( Q, D, GB, RB);
input D, GB, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACQRM8WA$func LACQRM8WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRM8WA$func LACQRM8WA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.notifier(notifier));

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
module LACQRSM1WA( Q, D, GB, RB, SB);
input D, GB, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACQRSM1WA$func LACQRSM1WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRSM1WA$func LACQRSM1WA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module LACQRSM2WA( Q, D, GB, RB, SB);
input D, GB, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACQRSM2WA$func LACQRSM2WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRSM2WA$func LACQRSM2WA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module LACQRSM4WA( Q, D, GB, RB, SB);
input D, GB, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACQRSM4WA$func LACQRSM4WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRSM4WA$func LACQRSM4WA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module LACQRSM8WA( Q, D, GB, RB, SB);
input D, GB, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACQRSM8WA$func LACQRSM8WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQRSM8WA$func LACQRSM8WA_inst(.D(D),.GB(GB),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module LACQSM1WA( Q, D, GB, SB);
input D, GB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACQSM1WA$func LACQSM1WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQSM1WA$func LACQSM1WA_inst(.D(D),.GB(GB),.Q(Q),.SB(SB),.notifier(notifier));

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
module LACQSM2WA( Q, D, GB, SB);
input D, GB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACQSM2WA$func LACQSM2WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQSM2WA$func LACQSM2WA_inst(.D(D),.GB(GB),.Q(Q),.SB(SB),.notifier(notifier));

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
module LACQSM4WA( Q, D, GB, SB);
input D, GB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACQSM4WA$func LACQSM4WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQSM4WA$func LACQSM4WA_inst(.D(D),.GB(GB),.Q(Q),.SB(SB),.notifier(notifier));

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
module LACQSM8WA( Q, D, GB, SB);
input D, GB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACQSM8WA$func LACQSM8WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACQSM8WA$func LACQSM8WA_inst(.D(D),.GB(GB),.Q(Q),.SB(SB),.notifier(notifier));

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
module LACRM1WA( Q, QB, D, GB, RB);
input D, GB, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACRM1WA$func LACRM1WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRM1WA$func LACRM1WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module LACRM2WA( Q, QB, D, GB, RB);
input D, GB, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACRM2WA$func LACRM2WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRM2WA$func LACRM2WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module LACRM4WA( Q, QB, D, GB, RB);
input D, GB, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACRM4WA$func LACRM4WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRM4WA$func LACRM4WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module LACRM8WA( Q, QB, D, GB, RB);
input D, GB, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;

	LACRM8WA$func LACRM8WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRM8WA$func LACRM8WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module LACRSM1WA( Q, QB, D, GB, RB, SB);
input D, GB, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACRSM1WA$func LACRSM1WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRSM1WA$func LACRSM1WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module LACRSM2WA( Q, QB, D, GB, RB, SB);
input D, GB, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACRSM2WA$func LACRSM2WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRSM2WA$func LACRSM2WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module LACRSM4WA( Q, QB, D, GB, RB, SB);
input D, GB, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACRSM4WA$func LACRSM4WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRSM4WA$func LACRSM4WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module LACRSM8WA( Q, QB, D, GB, RB, SB);
input D, GB, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LACRSM8WA$func LACRSM8WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	buf MGM_G3(ENABLE_GB ,GB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACRSM8WA$func LACRSM8WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module LACSM1WA( Q, QB, D, GB, SB);
input D, GB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACSM1WA$func LACSM1WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACSM1WA$func LACSM1WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module LACSM2WA( Q, QB, D, GB, SB);
input D, GB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACSM2WA$func LACSM2WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACSM2WA$func LACSM2WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module LACSM4WA( Q, QB, D, GB, SB);
input D, GB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACSM4WA$func LACSM4WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACSM4WA$func LACSM4WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module LACSM8WA( Q, QB, D, GB, SB);
input D, GB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire GB$delay ;
	wire SB$delay ;

	LACSM8WA$func LACSM8WA_inst(.D(D$delay),.GB(GB$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LACSM8WA$func LACSM8WA_inst(.D(D),.GB(GB),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module LAGCECSM12WA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM12WA$func LAGCECSM12WA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM12WA$func LAGCECSM12WA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCECSM16WA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM16WA$func LAGCECSM16WA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM16WA$func LAGCECSM16WA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCECSM24WA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM24WA$func LAGCECSM24WA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM24WA$func LAGCECSM24WA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCECSM2WA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM2WA$func LAGCECSM2WA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM2WA$func LAGCECSM2WA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCECSM32WA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM32WA$func LAGCECSM32WA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM32WA$func LAGCECSM32WA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCECSM40WA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM40WA$func LAGCECSM40WA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM40WA$func LAGCECSM40WA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCECSM48WA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM48WA$func LAGCECSM48WA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM48WA$func LAGCECSM48WA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCECSM4WA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM4WA$func LAGCECSM4WA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM4WA$func LAGCECSM4WA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCECSM6WA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM6WA$func LAGCECSM6WA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM6WA$func LAGCECSM6WA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCECSM8WA( GCK, CKB, E, SE);
input CKB, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CKB$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCECSM8WA$func LAGCECSM8WA_inst(.CKB(CKB$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCECSM8WA$func LAGCECSM8WA_inst(.CKB(CKB),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCEM12W( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM12W$func LAGCEM12W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM12W$func LAGCEM12W_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

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
module LAGCEM16W( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM16W$func LAGCEM16W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM16W$func LAGCEM16W_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

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
module LAGCEM20W( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM20W$func LAGCEM20W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM20W$func LAGCEM20W_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

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
module LAGCEM2W( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM2W$func LAGCEM2W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM2W$func LAGCEM2W_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

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
module LAGCEM3W( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM3W$func LAGCEM3W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM3W$func LAGCEM3W_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

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
module LAGCEM4W( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM4W$func LAGCEM4W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM4W$func LAGCEM4W_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

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
module LAGCEM6W( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM6W$func LAGCEM6W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM6W$func LAGCEM6W_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

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
module LAGCEM8W( GCK, CK, E);
input CK, E;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEM8W$func LAGCEM8W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEM8W$func LAGCEM8W_inst(.CK(CK),.E(E),.GCK(GCK),.notifier(notifier));

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
module LAGCEPM12W( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM12W$func LAGCEPM12W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM12W$func LAGCEPM12W_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCEPM16W( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM16W$func LAGCEPM16W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM16W$func LAGCEPM16W_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCEPM20W( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM20W$func LAGCEPM20W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM20W$func LAGCEPM20W_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCEPM2W( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM2W$func LAGCEPM2W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM2W$func LAGCEPM2W_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCEPM3W( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM3W$func LAGCEPM3W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM3W$func LAGCEPM3W_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCEPM4W( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM4W$func LAGCEPM4W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM4W$func LAGCEPM4W_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCEPM6W( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM6W$func LAGCEPM6W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM6W$func LAGCEPM6W_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCEPM8W( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPM8W$func LAGCEPM8W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE),.notifier(notifier));


	not MGM_G0(ENABLE_NOT_SE ,SE);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPM8W$func LAGCEPM8W_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCEPOM12W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM12W$func LAGCEPOM12W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM12W$func LAGCEPOM12W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCEPOM16W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM16W$func LAGCEPOM16W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM16W$func LAGCEPOM16W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCEPOM20W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM20W$func LAGCEPOM20W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM20W$func LAGCEPOM20W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCEPOM2W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM2W$func LAGCEPOM2W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM2W$func LAGCEPOM2W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCEPOM3W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM3W$func LAGCEPOM3W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM3W$func LAGCEPOM3W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCEPOM4W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM4W$func LAGCEPOM4W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM4W$func LAGCEPOM4W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCEPOM6W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM6W$func LAGCEPOM6W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM6W$func LAGCEPOM6W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCEPOM8W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;

	LAGCEPOM8W$func LAGCEPOM8W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCEPOM8W$func LAGCEPOM8W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCESM12WA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM12WA$func LAGCESM12WA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM12WA$func LAGCESM12WA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCESM16WA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM16WA$func LAGCESM16WA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM16WA$func LAGCESM16WA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCESM24WA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM24WA$func LAGCESM24WA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM24WA$func LAGCESM24WA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCESM2WA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM2WA$func LAGCESM2WA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM2WA$func LAGCESM2WA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCESM32WA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM32WA$func LAGCESM32WA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM32WA$func LAGCESM32WA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCESM40WA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM40WA$func LAGCESM40WA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM40WA$func LAGCESM40WA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCESM48WA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM48WA$func LAGCESM48WA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM48WA$func LAGCESM48WA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCESM4WA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM4WA$func LAGCESM4WA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM4WA$func LAGCESM4WA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCESM6WA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM6WA$func LAGCESM6WA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM6WA$func LAGCESM6WA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCESM8WA( GCK, CK, E, SE);
input CK, E, SE;
output GCK;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESM8WA$func LAGCESM8WA_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESM8WA$func LAGCESM8WA_inst(.CK(CK),.E(E),.GCK(GCK),.SE(SE),.notifier(notifier));

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
module LAGCESOM12W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM12W$func LAGCESOM12W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM12W$func LAGCESOM12W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCESOM16W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM16W$func LAGCESOM16W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM16W$func LAGCESOM16W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCESOM20W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM20W$func LAGCESOM20W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM20W$func LAGCESOM20W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCESOM2W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM2W$func LAGCESOM2W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM2W$func LAGCESOM2W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCESOM3W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM3W$func LAGCESOM3W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM3W$func LAGCESOM3W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCESOM4W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM4W$func LAGCESOM4W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM4W$func LAGCESOM4W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCESOM6W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM6W$func LAGCESOM6W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM6W$func LAGCESOM6W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAGCESOM8W( GCK, OBS, CK, E, SE);
input CK, E, SE;
output GCK, OBS;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire CK$delay ;
	wire E$delay ;
	wire SE$delay ;

	LAGCESOM8W$func LAGCESOM8W_inst(.CK(CK$delay),.E(E$delay),.GCK(GCK),.OBS(OBS),.SE(SE$delay),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAGCESOM8W$func LAGCESOM8W_inst(.CK(CK),.E(E),.GCK(GCK),.OBS(OBS),.SE(SE),.notifier(notifier));

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
module LAM1WA( Q, QB, D, G);
input D, G;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAM1WA$func LAM1WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAM1WA$func LAM1WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.notifier(notifier));

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
module LAM2WA( Q, QB, D, G);
input D, G;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAM2WA$func LAM2WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAM2WA$func LAM2WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.notifier(notifier));

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
module LAM4WA( Q, QB, D, G);
input D, G;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAM4WA$func LAM4WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAM4WA$func LAM4WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.notifier(notifier));

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
module LAM8WA( Q, QB, D, G);
input D, G;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAM8WA$func LAM8WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAM8WA$func LAM8WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.notifier(notifier));

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
module LAQM1WA( Q, D, G);
input D, G;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAQM1WA$func LAQM1WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQM1WA$func LAQM1WA_inst(.D(D),.G(G),.Q(Q),.notifier(notifier));

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
module LAQM2WA( Q, D, G);
input D, G;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAQM2WA$func LAQM2WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQM2WA$func LAQM2WA_inst(.D(D),.G(G),.Q(Q),.notifier(notifier));

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
module LAQM4WA( Q, D, G);
input D, G;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAQM4WA$func LAQM4WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQM4WA$func LAQM4WA_inst(.D(D),.G(G),.Q(Q),.notifier(notifier));

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
module LAQM8WA( Q, D, G);
input D, G;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;

	LAQM8WA$func LAQM8WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.notifier(notifier));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQM8WA$func LAQM8WA_inst(.D(D),.G(G),.Q(Q),.notifier(notifier));

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
module LAQRM1WA( Q, D, G, RB);
input D, G, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LAQRM1WA$func LAQRM1WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRM1WA$func LAQRM1WA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.notifier(notifier));

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
module LAQRM2WA( Q, D, G, RB);
input D, G, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LAQRM2WA$func LAQRM2WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRM2WA$func LAQRM2WA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.notifier(notifier));

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
module LAQRM4WA( Q, D, G, RB);
input D, G, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LAQRM4WA$func LAQRM4WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRM4WA$func LAQRM4WA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.notifier(notifier));

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
module LAQRM8WA( Q, D, G, RB);
input D, G, RB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LAQRM8WA$func LAQRM8WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRM8WA$func LAQRM8WA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.notifier(notifier));

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
module LAQRSM1WA( Q, D, G, RB, SB);
input D, G, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LAQRSM1WA$func LAQRSM1WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRSM1WA$func LAQRSM1WA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module LAQRSM2WA( Q, D, G, RB, SB);
input D, G, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LAQRSM2WA$func LAQRSM2WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRSM2WA$func LAQRSM2WA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module LAQRSM4WA( Q, D, G, RB, SB);
input D, G, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LAQRSM4WA$func LAQRSM4WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRSM4WA$func LAQRSM4WA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module LAQRSM8WA( Q, D, G, RB, SB);
input D, G, RB, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LAQRSM8WA$func LAQRSM8WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQRSM8WA$func LAQRSM8WA_inst(.D(D),.G(G),.Q(Q),.RB(RB),.SB(SB),.notifier(notifier));

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
module LAQSM1WA( Q, D, G, SB);
input D, G, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LAQSM1WA$func LAQSM1WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQSM1WA$func LAQSM1WA_inst(.D(D),.G(G),.Q(Q),.SB(SB),.notifier(notifier));

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
module LAQSM2WA( Q, D, G, SB);
input D, G, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LAQSM2WA$func LAQSM2WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQSM2WA$func LAQSM2WA_inst(.D(D),.G(G),.Q(Q),.SB(SB),.notifier(notifier));

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
module LAQSM4WA( Q, D, G, SB);
input D, G, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LAQSM4WA$func LAQSM4WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQSM4WA$func LAQSM4WA_inst(.D(D),.G(G),.Q(Q),.SB(SB),.notifier(notifier));

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
module LAQSM8WA( Q, D, G, SB);
input D, G, SB;
output Q;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LAQSM8WA$func LAQSM8WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LAQSM8WA$func LAQSM8WA_inst(.D(D),.G(G),.Q(Q),.SB(SB),.notifier(notifier));

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
module LARM1WA( Q, QB, D, G, RB);
input D, G, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LARM1WA$func LARM1WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARM1WA$func LARM1WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module LARM2WA( Q, QB, D, G, RB);
input D, G, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LARM2WA$func LARM2WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARM2WA$func LARM2WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module LARM4WA( Q, QB, D, G, RB);
input D, G, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LARM4WA$func LARM4WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARM4WA$func LARM4WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module LARM8WA( Q, QB, D, G, RB);
input D, G, RB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;

	LARM8WA$func LARM8WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_RB ,RB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARM8WA$func LARM8WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.notifier(notifier));

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
module LARSM1WA( Q, QB, D, G, RB, SB);
input D, G, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LARSM1WA$func LARSM1WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARSM1WA$func LARSM1WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module LARSM2WA( Q, QB, D, G, RB, SB);
input D, G, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LARSM2WA$func LARSM2WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARSM2WA$func LARSM2WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module LARSM4WA( Q, QB, D, G, RB, SB);
input D, G, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LARSM4WA$func LARSM4WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARSM4WA$func LARSM4WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module LARSM8WA( Q, QB, D, G, RB, SB);
input D, G, RB, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire RB$delay ;
	wire SB$delay ;

	LARSM8WA$func LARSM8WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.RB(RB$delay),.SB(SB$delay),.notifier(notifier));


	and MGM_G0(ENABLE_RB_AND_SB ,SB$delay,RB$delay);


	buf MGM_G1(ENABLE_SB ,SB$delay);


	buf MGM_G2(ENABLE_RB ,RB$delay);


	not MGM_G3(ENABLE_NOT_G ,G$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LARSM8WA$func LARSM8WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.RB(RB),.SB(SB),.notifier(notifier));

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
module LASM1WA( Q, QB, D, G, SB);
input D, G, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LASM1WA$func LASM1WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LASM1WA$func LASM1WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module LASM2WA( Q, QB, D, G, SB);
input D, G, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LASM2WA$func LASM2WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LASM2WA$func LASM2WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module LASM4WA( Q, QB, D, G, SB);
input D, G, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LASM4WA$func LASM4WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LASM4WA$func LASM4WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module LASM8WA( Q, QB, D, G, SB);
input D, G, SB;
output Q, QB;
reg notifier;

   `ifdef FUNCTIONAL  //  functional //

   `else

	wire D$delay ;
	wire G$delay ;
	wire SB$delay ;

	LASM8WA$func LASM8WA_inst(.D(D$delay),.G(G$delay),.Q(Q),.QB(QB),.SB(SB$delay),.notifier(notifier));


	buf MGM_G0(ENABLE_SB ,SB$delay);

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	LASM8WA$func LASM8WA_inst(.D(D),.G(G),.Q(Q),.QB(QB),.SB(SB),.notifier(notifier));

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
module MAO222M1WA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAO222M1WA$func MAO222M1WA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAO222M1WA$func MAO222M1WA_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module MAO222M2WA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAO222M2WA$func MAO222M2WA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAO222M2WA$func MAO222M2WA_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module MAO222M4WA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAO222M4WA$func MAO222M4WA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAO222M4WA$func MAO222M4WA_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module MAO222M8WA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAO222M8WA$func MAO222M8WA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAO222M8WA$func MAO222M8WA_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module MAOI2223M1WA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI2223M1WA$func MAOI2223M1WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI2223M1WA$func MAOI2223M1WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

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
module MAOI2223M2WA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI2223M2WA$func MAOI2223M2WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI2223M2WA$func MAOI2223M2WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

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
module MAOI2223M4WA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI2223M4WA$func MAOI2223M4WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI2223M4WA$func MAOI2223M4WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

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
module MAOI2223M8WA( Z, A, B, C, D);
input A, B, C, D;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI2223M8WA$func MAOI2223M8WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI2223M8WA$func MAOI2223M8WA_inst(.A(A),.B(B),.C(C),.D(D),.Z(Z));

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
module MAOI222M1WA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI222M1WA$func MAOI222M1WA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI222M1WA$func MAOI222M1WA_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module MAOI222M2WA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI222M2WA$func MAOI222M2WA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI222M2WA$func MAOI222M2WA_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module MAOI222M4WA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI222M4WA$func MAOI222M4WA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI222M4WA$func MAOI222M4WA_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module MAOI222M8WA( Z, A, B, C);
input A, B, C;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI222M8WA$func MAOI222M8WA_inst(.A(A),.B(B),.C(C),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI222M8WA$func MAOI222M8WA_inst(.A(A),.B(B),.C(C),.Z(Z));

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
module MAOI22M1WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI22M1WA$func MAOI22M1WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI22M1WA$func MAOI22M1WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module MAOI22M2WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI22M2WA$func MAOI22M2WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI22M2WA$func MAOI22M2WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module MAOI22M4WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI22M4WA$func MAOI22M4WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI22M4WA$func MAOI22M4WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module MAOI22M8WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MAOI22M8WA$func MAOI22M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MAOI22M8WA$func MAOI22M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module MOAI22M1WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MOAI22M1WA$func MOAI22M1WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MOAI22M1WA$func MOAI22M1WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module MOAI22M2WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MOAI22M2WA$func MOAI22M2WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MOAI22M2WA$func MOAI22M2WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module MOAI22M4WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MOAI22M4WA$func MOAI22M4WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MOAI22M4WA$func MOAI22M4WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module MOAI22M8WA( Z, A1, A2, B1, B2);
input A1, A2, B1, B2;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MOAI22M8WA$func MOAI22M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MOAI22M8WA$func MOAI22M8WA_inst(.A1(A1),.A2(A2),.B1(B1),.B2(B2),.Z(Z));

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
module MUX2M0WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M0WA$func MUX2M0WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M0WA$func MUX2M0WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MUX2M12WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M12WA$func MUX2M12WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M12WA$func MUX2M12WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MUX2M1WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M1WA$func MUX2M1WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M1WA$func MUX2M1WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MUX2M2WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M2WA$func MUX2M2WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M2WA$func MUX2M2WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MUX2M3WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M3WA$func MUX2M3WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M3WA$func MUX2M3WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MUX2M4WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M4WA$func MUX2M4WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M4WA$func MUX2M4WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MUX2M6W( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M6W$func MUX2M6W_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M6W$func MUX2M6W_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MUX2M8W( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX2M8W$func MUX2M8W_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX2M8W$func MUX2M8W_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MUX3M0WA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX3M0WA$func MUX3M0WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX3M0WA$func MUX3M0WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

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
module MUX3M1WA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX3M1WA$func MUX3M1WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX3M1WA$func MUX3M1WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

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
module MUX3M2WA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX3M2WA$func MUX3M2WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX3M2WA$func MUX3M2WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

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
module MUX3M4WA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX3M4WA$func MUX3M4WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX3M4WA$func MUX3M4WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

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
module MUX3M8WA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX3M8WA$func MUX3M8WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX3M8WA$func MUX3M8WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

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
module MUX4M0WA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX4M0WA$func MUX4M0WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX4M0WA$func MUX4M0WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

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
module MUX4M1WA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX4M1WA$func MUX4M1WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX4M1WA$func MUX4M1WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

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
module MUX4M2WA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX4M2WA$func MUX4M2WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX4M2WA$func MUX4M2WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

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
module MUX4M4W( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX4M4W$func MUX4M4W_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX4M4W$func MUX4M4W_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

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
module MUX4M8WA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MUX4M8WA$func MUX4M8WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MUX4M8WA$func MUX4M8WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

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
module MXB2M0WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M0WA$func MXB2M0WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M0WA$func MXB2M0WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MXB2M1WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M1WA$func MXB2M1WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M1WA$func MXB2M1WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MXB2M2WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M2WA$func MXB2M2WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M2WA$func MXB2M2WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MXB2M3WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M3WA$func MXB2M3WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M3WA$func MXB2M3WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MXB2M4WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M4WA$func MXB2M4WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M4WA$func MXB2M4WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MXB2M6WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M6WA$func MXB2M6WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M6WA$func MXB2M6WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MXB2M8WA( Z, A, B, S);
input A, B, S;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB2M8WA$func MXB2M8WA_inst(.A(A),.B(B),.S(S),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB2M8WA$func MXB2M8WA_inst(.A(A),.B(B),.S(S),.Z(Z));

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
module MXB3M0WA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB3M0WA$func MXB3M0WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB3M0WA$func MXB3M0WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

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
module MXB3M1WA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB3M1WA$func MXB3M1WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB3M1WA$func MXB3M1WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

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
module MXB3M2WA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB3M2WA$func MXB3M2WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB3M2WA$func MXB3M2WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

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
module MXB3M4WA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB3M4WA$func MXB3M4WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB3M4WA$func MXB3M4WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

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
module MXB3M8WA( Z, A, B, C, S0, S1);
input A, B, C, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB3M8WA$func MXB3M8WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB3M8WA$func MXB3M8WA_inst(.A(A),.B(B),.C(C),.S0(S0),.S1(S1),.Z(Z));

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
module MXB4M0WA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB4M0WA$func MXB4M0WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB4M0WA$func MXB4M0WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

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
module MXB4M1WA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB4M1WA$func MXB4M1WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB4M1WA$func MXB4M1WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

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
module MXB4M2WA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB4M2WA$func MXB4M2WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB4M2WA$func MXB4M2WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

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
module MXB4M4WA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB4M4WA$func MXB4M4WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB4M4WA$func MXB4M4WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

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
module MXB4M6WA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB4M6WA$func MXB4M6WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB4M6WA$func MXB4M6WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

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
module MXB4M8WA( Z, A, B, C, D, S0, S1);
input A, B, C, D, S0, S1;
output Z;

   `ifdef FUNCTIONAL  //  functional //

   `else


	MXB4M8WA$func MXB4M8WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

   `endif 



   `ifdef FUNCTIONAL  //  functional //

	MXB4M8WA$func MXB4M8WA_inst(.A(A),.B(B),.C(C),.D(D),.S0(S0),.S1(S1),.Z(Z));

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



