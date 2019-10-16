`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_unit
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32DG_LLUDC_SDFPQX3_CP_R_Q_R 0.1
`define C12T32DG_LLUDC_SDFPQX3_CP_R_Q_F 0.1
`define C12T32DG_LLUDC_SDFPQX3_TI_CP_HOLD_posedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPQX3_TI_CP_HOLD_negedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPQX3_TI_CP_SETUP_posedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPQX3_TI_CP_SETUP_negedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPQX3_TE_CP_HOLD_posedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPQX3_TE_CP_HOLD_negedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPQX3_TE_CP_SETUP_posedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPQX3_TE_CP_SETUP_negedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPQX3_D_CP_HOLD_posedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPQX3_D_CP_HOLD_negedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPQX3_D_CP_SETUP_posedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPQX3_D_CP_SETUP_negedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPQX3_CP_PWL_state_4 0.1
`define C12T32DG_LLUDC_SDFPQX3_CP_PWL_state_3 0.1
`define C12T32DG_LLUDC_SDFPQX3_CP_PWH_state_2 0.1
`define C12T32DG_LLUDC_SDFPQX3_CP_PWH_state_1 0.1

module C12T32DG_LLUDC_SDFPQX3 (Q, D, CP, TI, TE);

	output Q;
	input D;
	input CP;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (TEX, dTE) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T32DG_LLUDC_SDFPQX3_CP_R_Q_R,`C12T32DG_LLUDC_SDFPQX3_CP_R_Q_F);

		$setuphold(posedge CP, posedge D, `C12T32DG_LLUDC_SDFPQX3_D_CP_SETUP_posedge_posedge, `C12T32DG_LLUDC_SDFPQX3_D_CP_HOLD_posedge_posedge , NOTIFIER,, TEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T32DG_LLUDC_SDFPQX3_D_CP_SETUP_negedge_posedge, `C12T32DG_LLUDC_SDFPQX3_D_CP_HOLD_negedge_posedge , NOTIFIER,, TEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T32DG_LLUDC_SDFPQX3_TE_CP_SETUP_posedge_posedge, `C12T32DG_LLUDC_SDFPQX3_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXTIAND_DTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T32DG_LLUDC_SDFPQX3_TE_CP_SETUP_negedge_posedge, `C12T32DG_LLUDC_SDFPQX3_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXTIAND_DTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T32DG_LLUDC_SDFPQX3_TI_CP_SETUP_posedge_posedge, `C12T32DG_LLUDC_SDFPQX3_TI_CP_HOLD_posedge_posedge , NOTIFIER,, dTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T32DG_LLUDC_SDFPQX3_TI_CP_SETUP_negedge_posedge, `C12T32DG_LLUDC_SDFPQX3_TI_CP_HOLD_negedge_posedge , NOTIFIER,, dTE, dCP, dTI);
		$width(negedge CP &&& TE, `C12T32DG_LLUDC_SDFPQX3_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T32DG_LLUDC_SDFPQX3_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& TE, `C12T32DG_LLUDC_SDFPQX3_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& TEX, `C12T32DG_LLUDC_SDFPQX3_CP_PWH_state_1 ,0, NOTIFIER);


	endspecify

`endif

endmodule // C12T32DG_LLUDC_SDFPQX3


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_unit
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32DG_LLUDC_SDFPRQX3_CP_R_Q_R 0.1
`define C12T32DG_LLUDC_SDFPRQX3_CP_R_Q_F 0.1
`define C12T32DG_LLUDC_SDFPRQX3_TI_CP_HOLD_posedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPRQX3_TI_CP_HOLD_negedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPRQX3_TI_CP_SETUP_posedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPRQX3_TI_CP_SETUP_negedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPRQX3_TE_CP_HOLD_posedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPRQX3_TE_CP_HOLD_negedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPRQX3_TE_CP_SETUP_posedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPRQX3_TE_CP_SETUP_negedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPRQX3_D_CP_HOLD_posedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPRQX3_D_CP_HOLD_negedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPRQX3_D_CP_SETUP_posedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPRQX3_D_CP_SETUP_negedge_posedge 0.1
`define C12T32DG_LLUDC_SDFPRQX3_CP_PWL_state_4 0.1
`define C12T32DG_LLUDC_SDFPRQX3_CP_PWL_state_3 0.1
`define C12T32DG_LLUDC_SDFPRQX3_CP_PWH_state_2 0.1
`define C12T32DG_LLUDC_SDFPRQX3_CP_PWH_state_1 0.1

module C12T32DG_LLUDC_SDFPRQX3 (Q, D, CP, TI, TE);

	output Q;
	input D;
	input CP;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (TEX, dTE) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T32DG_LLUDC_SDFPRQX3_CP_R_Q_R,`C12T32DG_LLUDC_SDFPRQX3_CP_R_Q_F);

		$setuphold(posedge CP, posedge D, `C12T32DG_LLUDC_SDFPRQX3_D_CP_SETUP_posedge_posedge, `C12T32DG_LLUDC_SDFPRQX3_D_CP_HOLD_posedge_posedge , NOTIFIER,, TEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T32DG_LLUDC_SDFPRQX3_D_CP_SETUP_negedge_posedge, `C12T32DG_LLUDC_SDFPRQX3_D_CP_HOLD_negedge_posedge , NOTIFIER,, TEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T32DG_LLUDC_SDFPRQX3_TE_CP_SETUP_posedge_posedge, `C12T32DG_LLUDC_SDFPRQX3_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXTIAND_DTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T32DG_LLUDC_SDFPRQX3_TE_CP_SETUP_negedge_posedge, `C12T32DG_LLUDC_SDFPRQX3_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXTIAND_DTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T32DG_LLUDC_SDFPRQX3_TI_CP_SETUP_posedge_posedge, `C12T32DG_LLUDC_SDFPRQX3_TI_CP_HOLD_posedge_posedge , NOTIFIER,, dTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T32DG_LLUDC_SDFPRQX3_TI_CP_SETUP_negedge_posedge, `C12T32DG_LLUDC_SDFPRQX3_TI_CP_HOLD_negedge_posedge , NOTIFIER,, dTE, dCP, dTI);
		$width(negedge CP &&& TE, `C12T32DG_LLUDC_SDFPRQX3_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T32DG_LLUDC_SDFPRQX3_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& TE, `C12T32DG_LLUDC_SDFPRQX3_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& TEX, `C12T32DG_LLUDC_SDFPRQX3_CP_PWH_state_1 ,0, NOTIFIER);


	endspecify

`endif

endmodule // C12T32DG_LLUDC_SDFPRQX3


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_unit
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLUHP_SDFPQCX8_CP_R_Q_R 0.1
`define C12T32_LLUHP_SDFPQCX8_CP_R_Q_F 0.1
`define C12T32_LLUHP_SDFPQCX8_TI_CP_HOLD_posedge_posedge 0.1
`define C12T32_LLUHP_SDFPQCX8_TI_CP_HOLD_negedge_posedge 0.1
`define C12T32_LLUHP_SDFPQCX8_TI_CP_SETUP_posedge_posedge 0.1
`define C12T32_LLUHP_SDFPQCX8_TI_CP_SETUP_negedge_posedge 0.1
`define C12T32_LLUHP_SDFPQCX8_TE_CP_HOLD_posedge_posedge 0.1
`define C12T32_LLUHP_SDFPQCX8_TE_CP_HOLD_negedge_posedge 0.1
`define C12T32_LLUHP_SDFPQCX8_TE_CP_SETUP_posedge_posedge 0.1
`define C12T32_LLUHP_SDFPQCX8_TE_CP_SETUP_negedge_posedge 0.1
`define C12T32_LLUHP_SDFPQCX8_D_CP_HOLD_posedge_posedge 0.1
`define C12T32_LLUHP_SDFPQCX8_D_CP_HOLD_negedge_posedge 0.1
`define C12T32_LLUHP_SDFPQCX8_D_CP_SETUP_posedge_posedge 0.1
`define C12T32_LLUHP_SDFPQCX8_D_CP_SETUP_negedge_posedge 0.1
`define C12T32_LLUHP_SDFPQCX8_CP_PWL_state_4 0.1
`define C12T32_LLUHP_SDFPQCX8_CP_PWL_state_3 0.1
`define C12T32_LLUHP_SDFPQCX8_CP_PWH_state_2 0.1
`define C12T32_LLUHP_SDFPQCX8_CP_PWH_state_1 0.1

module C12T32_LLUHP_SDFPQCX8 (Q, D, CP, TI, TE);

	output Q;
	input D;
	input CP;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	U_FD_P_NOTI   U2 (IQ, INTERNAL1, CP , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	U_FD_P_NOTI   U2 (IQ, INTERNAL1, dCP , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (DX, dD) ;
	and    X2 (AND_DXTI, DX, dTI) ;
	not    X3 (TIX, dTI) ;
	and    X4 (AND_DTIX, dD, TIX) ;
	or    X5 (OR_AND_DXTIAND_DTIX, AND_DXTI, AND_DTIX) ;
	not    X6 (TEX, dTE) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T32_LLUHP_SDFPQCX8_CP_R_Q_R,`C12T32_LLUHP_SDFPQCX8_CP_R_Q_F);

		$setuphold(posedge CP, posedge D, `C12T32_LLUHP_SDFPQCX8_D_CP_SETUP_posedge_posedge, `C12T32_LLUHP_SDFPQCX8_D_CP_HOLD_posedge_posedge , NOTIFIER,, TEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T32_LLUHP_SDFPQCX8_D_CP_SETUP_negedge_posedge, `C12T32_LLUHP_SDFPQCX8_D_CP_HOLD_negedge_posedge , NOTIFIER,, TEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T32_LLUHP_SDFPQCX8_TE_CP_SETUP_posedge_posedge, `C12T32_LLUHP_SDFPQCX8_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXTIAND_DTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T32_LLUHP_SDFPQCX8_TE_CP_SETUP_negedge_posedge, `C12T32_LLUHP_SDFPQCX8_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXTIAND_DTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T32_LLUHP_SDFPQCX8_TI_CP_SETUP_posedge_posedge, `C12T32_LLUHP_SDFPQCX8_TI_CP_HOLD_posedge_posedge , NOTIFIER,, dTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T32_LLUHP_SDFPQCX8_TI_CP_SETUP_negedge_posedge, `C12T32_LLUHP_SDFPQCX8_TI_CP_HOLD_negedge_posedge , NOTIFIER,, dTE, dCP, dTI);
		$width(negedge CP &&& TE, `C12T32_LLUHP_SDFPQCX8_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& TEX, `C12T32_LLUHP_SDFPQCX8_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& TE, `C12T32_LLUHP_SDFPQCX8_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& TEX, `C12T32_LLUHP_SDFPQCX8_CP_PWH_state_1 ,0, NOTIFIER);


	endspecify

`endif

endmodule // C12T32_LLUHP_SDFPQCX8


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_unit
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLU_SDFPRQX8_CP_R_Q_R 0.1
`define C12T32_LLU_SDFPRQX8_CP_R_Q_F 0.1
`define C12T32_LLU_SDFPRQX8_RN_F_Q_F 0.1
`define C12T32_LLU_SDFPRQX8_TI_CP_HOLD_posedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_TI_CP_HOLD_negedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_TI_CP_SETUP_posedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_TI_CP_SETUP_negedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_TE_CP_HOLD_posedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_TE_CP_HOLD_negedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_TE_CP_SETUP_posedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_TE_CP_SETUP_negedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_D_CP_HOLD_posedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_D_CP_HOLD_negedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_D_CP_SETUP_posedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_D_CP_SETUP_negedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_RN_CP_REC_posedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_RN_CP_REM_posedge_posedge 0.1
`define C12T32_LLU_SDFPRQX8_RN_PWL 0.1
`define C12T32_LLU_SDFPRQX8_CP_PWL_state_4 0.1
`define C12T32_LLU_SDFPRQX8_CP_PWL_state_3 0.1
`define C12T32_LLU_SDFPRQX8_CP_PWH_state_2 0.1
`define C12T32_LLU_SDFPRQX8_CP_PWH_state_1 0.1

module C12T32_LLU_SDFPRQX8 (Q, D, CP, RN, TI, TE);

	output Q;
	input D;
	input CP;
	input RN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, CP, RN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	U_FD_P_RN_NOTI   U2 (IQ, INTERNAL1, dCP, dRN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (TEX, dTE) ;
	and    X2 (AND_DTEX, dD, TEX) ;
	and    X3 (AND_TETI, dTE, dTI) ;
	or    X4 (OR_AND_DTEXAND_TETI, AND_DTEX, AND_TETI) ;
	and    X5 (AND_RNTE, dRN, dTE) ;
	not    X6 (DX, dD) ;
	and    X7 (AND_DXRNTI, DX, dRN, dTI) ;
	not    X8 (TIX, dTI) ;
	and    X9 (AND_DRNTIX, dD, dRN, TIX) ;
	or    X10 (OR_AND_DXRNTIAND_DRNTIX, AND_DXRNTI, AND_DRNTIX) ;
	and    X11 (AND_RNTEX, dRN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T32_LLU_SDFPRQX8_CP_R_Q_R,`C12T32_LLU_SDFPRQX8_CP_R_Q_F);
		 (negedge RN => (Q +: 1'b0)) = (`C12T32_LLU_SDFPRQX8_RN_F_Q_F,`C12T32_LLU_SDFPRQX8_RN_F_Q_F);

		$setuphold(posedge CP, posedge D, `C12T32_LLU_SDFPRQX8_D_CP_SETUP_posedge_posedge, `C12T32_LLU_SDFPRQX8_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T32_LLU_SDFPRQX8_D_CP_SETUP_negedge_posedge, `C12T32_LLU_SDFPRQX8_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T32_LLU_SDFPRQX8_TE_CP_SETUP_posedge_posedge, `C12T32_LLU_SDFPRQX8_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T32_LLU_SDFPRQX8_TE_CP_SETUP_negedge_posedge, `C12T32_LLU_SDFPRQX8_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXRNTIAND_DRNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T32_LLU_SDFPRQX8_TI_CP_SETUP_posedge_posedge, `C12T32_LLU_SDFPRQX8_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T32_LLU_SDFPRQX8_TI_CP_SETUP_negedge_posedge, `C12T32_LLU_SDFPRQX8_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_RNTE, dCP, dTI);
		$recrem(posedge RN, posedge CP, `C12T32_LLU_SDFPRQX8_RN_CP_REC_posedge_posedge, `C12T32_LLU_SDFPRQX8_RN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DTEXAND_TETI, dRN, dCP);
		$width(negedge RN, `C12T32_LLU_SDFPRQX8_RN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTE, `C12T32_LLU_SDFPRQX8_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_RNTEX, `C12T32_LLU_SDFPRQX8_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTE, `C12T32_LLU_SDFPRQX8_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_RNTEX, `C12T32_LLU_SDFPRQX8_CP_PWH_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T32_LLU_SDFPRQX8


`endcelldefine
`celldefine
`ifdef functional
   `timescale 1ns / 1ns
   `delay_mode_unit
`else
   `timescale 1ns / 1ps
   `delay_mode_path
`endif

`define C12T32_LLU_SDFPSQX8_CP_R_Q_R 0.1
`define C12T32_LLU_SDFPSQX8_CP_R_Q_F 0.1
`define C12T32_LLU_SDFPSQX8_SN_F_Q_R 0.1
`define C12T32_LLU_SDFPSQX8_TI_CP_HOLD_posedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_TI_CP_HOLD_negedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_TI_CP_SETUP_posedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_TI_CP_SETUP_negedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_TE_CP_HOLD_posedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_TE_CP_HOLD_negedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_TE_CP_SETUP_posedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_TE_CP_SETUP_negedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_D_CP_HOLD_posedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_D_CP_HOLD_negedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_D_CP_SETUP_posedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_D_CP_SETUP_negedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_SN_CP_REC_posedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_SN_CP_REM_posedge_posedge 0.1
`define C12T32_LLU_SDFPSQX8_SN_PWL 0.1
`define C12T32_LLU_SDFPSQX8_CP_PWL_state_4 0.1
`define C12T32_LLU_SDFPSQX8_CP_PWL_state_3 0.1
`define C12T32_LLU_SDFPSQX8_CP_PWH_state_2 0.1
`define C12T32_LLU_SDFPSQX8_CP_PWH_state_1 0.1


module C12T32_LLU_SDFPSQX8 (Q, D, CP, SN, TI, TE);

	output Q;
	input D;
	input CP;
	input SN;
	input TI;
	input TE;

`ifdef functional
	reg  NOTIFIER;
	U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
	U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, CP, SN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

`else
	reg  NOTIFIER;
	U_MUX2   U1 (INTERNAL1, dD, dTI, dTE) ;
	U_FD_P_SN_NOTI   U2 (IQ, INTERNAL1, dCP, dSN , NOTIFIER) ;
	buf   #1 U3 (Q, IQ) ;

	not    X1 (DX, dD) ;
	not    X2 (TEX, dTE) ;
	and    X3 (AND_DXTEX, DX, TEX) ;
	not    X4 (TIX, dTI) ;
	and    X5 (AND_TETIX, dTE, TIX) ;
	or    X6 (OR_AND_DXTEXAND_TETIX, AND_DXTEX, AND_TETIX) ;
	and    X7 (AND_SNTE, dSN, dTE) ;
	and    X8 (AND_DXSNTI, DX, dSN, dTI) ;
	and    X9 (AND_DSNTIX, dD, dSN, TIX) ;
	or    X10 (OR_AND_DXSNTIAND_DSNTIX, AND_DXSNTI, AND_DSNTIX) ;
	and    X11 (AND_SNTEX, dSN, TEX) ;

	specify

		 (posedge CP => (Q +: INTERNAL1)) = (`C12T32_LLU_SDFPSQX8_CP_R_Q_R,`C12T32_LLU_SDFPSQX8_CP_R_Q_F);
		 (negedge SN => (Q +: 1'b1)) = (`C12T32_LLU_SDFPSQX8_SN_F_Q_R,`C12T32_LLU_SDFPSQX8_SN_F_Q_R);

		$setuphold(posedge CP, posedge D, `C12T32_LLU_SDFPSQX8_D_CP_SETUP_posedge_posedge, `C12T32_LLU_SDFPSQX8_D_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, negedge D, `C12T32_LLU_SDFPSQX8_D_CP_SETUP_negedge_posedge, `C12T32_LLU_SDFPSQX8_D_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTEX, dCP, dD);
		$setuphold(posedge CP, posedge TE, `C12T32_LLU_SDFPSQX8_TE_CP_SETUP_posedge_posedge, `C12T32_LLU_SDFPSQX8_TE_CP_HOLD_posedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, negedge TE, `C12T32_LLU_SDFPSQX8_TE_CP_SETUP_negedge_posedge, `C12T32_LLU_SDFPSQX8_TE_CP_HOLD_negedge_posedge , NOTIFIER,, OR_AND_DXSNTIAND_DSNTIX, dCP, dTE);
		$setuphold(posedge CP, posedge TI, `C12T32_LLU_SDFPSQX8_TI_CP_SETUP_posedge_posedge, `C12T32_LLU_SDFPSQX8_TI_CP_HOLD_posedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$setuphold(posedge CP, negedge TI, `C12T32_LLU_SDFPSQX8_TI_CP_SETUP_negedge_posedge, `C12T32_LLU_SDFPSQX8_TI_CP_HOLD_negedge_posedge , NOTIFIER,, AND_SNTE, dCP, dTI);
		$recrem(posedge SN, posedge CP, `C12T32_LLU_SDFPSQX8_SN_CP_REC_posedge_posedge, `C12T32_LLU_SDFPSQX8_SN_CP_REM_posedge_posedge , NOTIFIER,, OR_AND_DXTEXAND_TETIX, dSN, dCP);
		$width(negedge SN, `C12T32_LLU_SDFPSQX8_SN_PWL ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTE, `C12T32_LLU_SDFPSQX8_CP_PWL_state_4 ,0, NOTIFIER);
		$width(negedge CP &&& AND_SNTEX, `C12T32_LLU_SDFPSQX8_CP_PWL_state_3 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTE, `C12T32_LLU_SDFPSQX8_CP_PWH_state_2 ,0, NOTIFIER);
		$width(posedge CP &&& AND_SNTEX, `C12T32_LLU_SDFPSQX8_CP_PWH_state_1 ,0, NOTIFIER);

	endspecify

`endif

endmodule // C12T32_LLU_SDFPSQX8


`endcelldefine

primitive U_FD_P (Q, D, CP);
        output Q;
        input  D, CP;
        reg    Q;

        table
        //D     CP     : Q : Qn+1
         0      (01)   : ? :  0 ;
         1      (01)   : ? :  1 ;
         *      B      : ? :  - ;
         ?      (?0)   : ? :  - ;
         0      (1X)   : 0 :  0 ;
         1      (1X)   : 1 :  1 ;
         0      (0X)   : 0 :  0 ;
         0      (X1)   : 0 :  0 ;
         1      (0X)   : 1 :  1 ;
         1      (X1)   : 1 :  1 ;


        endtable

endprimitive
primitive U_MUX2 (Z, A, B, S);

   output Z;
   input  A, B, S;

   table

      // A  B  S  :  Z

         0  ?  0  :  0  ;
         1  ?  0  :  1  ;

         ?  0  1  :  0  ;
         ?  1  1  :  1  ;

      // Cases reducing pessimism

         0  0  x  :  0  ;
         1  1  x  :  1  ;

   endtable


endprimitive
primitive U_FD_P_NOTI (Q, D, CP, NOTI_REG);

   output Q;
   input  D,		// data
          CP,		// clock
          NOTI_REG;
   reg    Q;

   table

      // D     CP    NOTI_REG    : Qtn : Qtn+1

         0     (01)  ?           :  ?  :  0  ;		// Normal clocking
         1     (01)  ?           :  ?  :  1  ;

         *     b     ?           :  ?  :  -  ;		// Ignore edges on data

         ?     (?0)  ?           :  ?  :  -  ;		// Ignore falling edges on clock

         0     (1x)  ?           :  0  :  0  ;		// Cases reducing pessimism
         1     (1x)  ?           :  1  :  1  ;
         0     (0x)  ?           :  0  :  0  ;
         0     (x1)  ?           :  0  :  0  ;
         1     (0x)  ?           :  1  :  1  ;
         1     (x1)  ?           :  1  :  1  ;

         ?     ?     *           :  ?  :  x  ;		// X for timing violations

   endtable

endprimitive
primitive U_FD_P_NOTI_POWER (Q, D, CP, GND_FINAL, VDD_FINAL, NOTI_REG);
        output Q;
        input  D, CP, GND_FINAL, VDD_FINAL, NOTI_REG;
        reg    Q;

        table
        //D     CP      GND_FINAL       VDD_FINAL       NOTI_REG         : Q
         0      (01)    1       1       ? :      ? :     0 ;
         1      (01)    1       1       ? :      ? :     1 ;
         *      B       1       1       ? :      ? :     - ;
         ?      (?0)    1       1       ? :      ? :     - ;
         0      (1X)    1       1       ? :      0 :     0 ;
         1      (1X)    1       1       ? :      1 :     1 ;
         0      (0X)    1       1       ? :      0 :     0 ;
         0      (X1)    1       1       ? :      0 :     0 ;
         1      (0X)    1       1       ? :      1 :     1 ;
         1      (X1)    1       1       ? :      1 :     1 ;
         ?      ?       1       1       * :      ? :     X ;

        endtable

endprimitive

primitive U_FD_P (Q, D, CP);
        output Q;
        input  D, CP;
        reg    Q;

        table
        //D     CP     : Q : Qn+1
         0      (01)   : ? :  0 ;
         1      (01)   : ? :  1 ;
         *      B      : ? :  - ;
         ?      (?0)   : ? :  - ;
         0      (1X)   : 0 :  0 ;
         1      (1X)   : 1 :  1 ;
         0      (0X)   : 0 :  0 ;
         0      (X1)   : 0 :  0 ;
         1      (0X)   : 1 :  1 ;
         1      (X1)   : 1 :  1 ;


        endtable

endprimitive
primitive U_MUX2 (Z, A, B, S);

   output Z;
   input  A, B, S;

   table

      // A  B  S  :  Z

         0  ?  0  :  0  ;
         1  ?  0  :  1  ;

         ?  0  1  :  0  ;
         ?  1  1  :  1  ;

      // Cases reducing pessimism

         0  0  x  :  0  ;
         1  1  x  :  1  ;

   endtable


endprimitive
primitive U_FD_P_NOTI (Q, D, CP, NOTI_REG);

   output Q;
   input  D,		// data
          CP,		// clock
          NOTI_REG;
   reg    Q;

   table

      // D     CP    NOTI_REG    : Qtn : Qtn+1

         0     (01)  ?           :  ?  :  0  ;		// Normal clocking
         1     (01)  ?           :  ?  :  1  ;

         *     b     ?           :  ?  :  -  ;		// Ignore edges on data

         ?     (?0)  ?           :  ?  :  -  ;		// Ignore falling edges on clock

         0     (1x)  ?           :  0  :  0  ;		// Cases reducing pessimism
         1     (1x)  ?           :  1  :  1  ;
         0     (0x)  ?           :  0  :  0  ;
         0     (x1)  ?           :  0  :  0  ;
         1     (0x)  ?           :  1  :  1  ;
         1     (x1)  ?           :  1  :  1  ;

         ?     ?     *           :  ?  :  x  ;		// X for timing violations

   endtable

endprimitive
primitive U_FD_P_NOTI_POWER (Q, D, CP, GND_FINAL, VDD_FINAL, NOTI_REG);
        output Q;
        input  D, CP, GND_FINAL, VDD_FINAL, NOTI_REG;
        reg    Q;

        table
        //D     CP      GND_FINAL       VDD_FINAL       NOTI_REG         : Q
         0      (01)    1       1       ? :      ? :     0 ;
         1      (01)    1       1       ? :      ? :     1 ;
         *      B       1       1       ? :      ? :     - ;
         ?      (?0)    1       1       ? :      ? :     - ;
         0      (1X)    1       1       ? :      0 :     0 ;
         1      (1X)    1       1       ? :      1 :     1 ;
         0      (0X)    1       1       ? :      0 :     0 ;
         0      (X1)    1       1       ? :      0 :     0 ;
         1      (0X)    1       1       ? :      1 :     1 ;
         1      (X1)    1       1       ? :      1 :     1 ;
         ?      ?       1       1       * :      ? :     X ;

        endtable

endprimitive

primitive U_FD_P (Q, D, CP);
        output Q;
        input  D, CP;
        reg    Q;

        table
        //D     CP     : Q : Qn+1
         0      (01)   : ? :  0 ;
         1      (01)   : ? :  1 ;
         *      B      : ? :  - ;
         ?      (?0)   : ? :  - ;
         0      (1X)   : 0 :  0 ;
         1      (1X)   : 1 :  1 ;
         0      (0X)   : 0 :  0 ;
         0      (X1)   : 0 :  0 ;
         1      (0X)   : 1 :  1 ;
         1      (X1)   : 1 :  1 ;


        endtable

endprimitive
primitive U_MUX2 (Z, A, B, S);

   output Z;
   input  A, B, S;

   table

      // A  B  S  :  Z

         0  ?  0  :  0  ;
         1  ?  0  :  1  ;

         ?  0  1  :  0  ;
         ?  1  1  :  1  ;

      // Cases reducing pessimism

         0  0  x  :  0  ;
         1  1  x  :  1  ;

   endtable


endprimitive
primitive U_FD_P_NOTI (Q, D, CP, NOTI_REG);

   output Q;
   input  D,		// data
          CP,		// clock
          NOTI_REG;
   reg    Q;

   table

      // D     CP    NOTI_REG    : Qtn : Qtn+1

         0     (01)  ?           :  ?  :  0  ;		// Normal clocking
         1     (01)  ?           :  ?  :  1  ;

         *     b     ?           :  ?  :  -  ;		// Ignore edges on data

         ?     (?0)  ?           :  ?  :  -  ;		// Ignore falling edges on clock

         0     (1x)  ?           :  0  :  0  ;		// Cases reducing pessimism
         1     (1x)  ?           :  1  :  1  ;
         0     (0x)  ?           :  0  :  0  ;
         0     (x1)  ?           :  0  :  0  ;
         1     (0x)  ?           :  1  :  1  ;
         1     (x1)  ?           :  1  :  1  ;

         ?     ?     *           :  ?  :  x  ;		// X for timing violations

   endtable

endprimitive
primitive U_FD_P_NOTI_POWER (Q, D, CP, GND_FINAL, VDD_FINAL, NOTI_REG);
        output Q;
        input  D, CP, GND_FINAL, VDD_FINAL, NOTI_REG;
        reg    Q;

        table
        //D     CP      GND_FINAL       VDD_FINAL       NOTI_REG         : Q
         0      (01)    1       1       ? :      ? :     0 ;
         1      (01)    1       1       ? :      ? :     1 ;
         *      B       1       1       ? :      ? :     - ;
         ?      (?0)    1       1       ? :      ? :     - ;
         0      (1X)    1       1       ? :      0 :     0 ;
         1      (1X)    1       1       ? :      1 :     1 ;
         0      (0X)    1       1       ? :      0 :     0 ;
         0      (X1)    1       1       ? :      0 :     0 ;
         1      (0X)    1       1       ? :      1 :     1 ;
         1      (X1)    1       1       ? :      1 :     1 ;
         ?      ?       1       1       * :      ? :     X ;

        endtable

endprimitive

primitive U_FD_P_RN (Q, D, CP, RN);
        output Q;
        input  D, CP, RN;
        reg    Q;

        table
        //D     CP      RN    : Qn  : Qn+1
         ?      ?       0     :   ? :  0 ;
         *      ?       0     :   ? :  0 ;
         ?      *       0     :   ? :  0 ;
         1      (01)    1     :   ? :  1 ;
         0      (01)    1     :   ? :  0 ;
         *      B       1     :   ? :  - ;
         ?      (?0)    1     :   ? :  - ;
         0      (1X)    ?     :   0 :  0 ;
         1      (1X)    1     :   1 :  1 ;
         ?      B       (?1)  :   ? :  - ;
         0      X       (?1)  :   0 :  0 ;
         0      (0X)    ?     :   0 :  0 ;
         0      (X1)    ?     :   0 :  0 ;
         1      (0X)    1     :   1 :  1 ;
         1      (X1)    1     :   1 :  1 ;
         0      (01)    X     :   ? :  0 ;
         ?      B       (?X)  :   0 :  0 ;
         0      X       (?X)  :   0 :  0 ;
    

        endtable

endprimitive
primitive U_MUX2 (Z, A, B, S);

   output Z;
   input  A, B, S;

   table

      // A  B  S  :  Z

         0  ?  0  :  0  ;
         1  ?  0  :  1  ;

         ?  0  1  :  0  ;
         ?  1  1  :  1  ;

      // Cases reducing pessimism

         0  0  x  :  0  ;
         1  1  x  :  1  ;

   endtable


endprimitive
primitive U_FD_P_RN_NOTI (Q, D, CP, RN, NOTI_REG);

   output Q;
   input  D,		// data
          CP,		// clock
          RN,		// clear active low
          NOTI_REG;
   reg    Q;

   table
 
      // D     CP    RN    NOTI_REG    : Qtn : Qtn+1

         ?     ?     0     ?           :  ?  :  0  ;	// Asynchronous clear

         1     (01)  1     ?           :  ?  :  1  ;	// Normal clocking
         0     (01)  1     ?           :  ?  :  0  ;

         *     b     ?     ?           :  ?  :  -  ;	// Ignore edges on data

         ?     (?0)  ?     ?           :  ?  :  -  ;	// Ignore falling edges on clock

         0     (1x)  ?     ?           :  0  :  0  ;
         1     (1x)  1     ?           :  1  :  1  ;

         ?     b     (?1)  ?           :  ?  :  -  ;	// Ignore rising edges on clear
         0     x     (?1)  ?           :  0  :  0  ;	// Ignore rising edges on clear

         0     (0x)  ?     ?           :  0  :  0  ;	// Cases reducing pessimism
         0     (x1)  ?     ?           :  0  :  0  ;
         1     (0x)  1     ?           :  1  :  1  ;
         1     (x1)  1     ?           :  1  :  1  ;

         0     (01)  x     ?           :  ?  :  0  ;
         ?     b     (?x)  ?           :  0  :  0  ;
         0     x     (?x)  ?           :  0  :  0  ;

         ?     ?     ?     *           :  ?  :  x  ;	// X for timing violations

   endtable

endprimitive
primitive U_FD_P_RN_NOTI_POWER (Q, D, CP, RN, GND_FINAL, VDD_FINAL, NOTI_REG);
        output Q;
        input  D, CP, RN, GND_FINAL, VDD_FINAL, NOTI_REG;
        reg    Q;

        table
        //D     CP      RN      GND_FINAL       VDD_FINAL       NOTI_REG         : Q
         ?      ?       0       1       1       ? :      ? :     0 ;
         1      (01)    1       1       1       ? :      ? :     1 ;
         0      (01)    1       1       1       ? :      ? :     0 ;
         *      B       ?       1       1       ? :      ? :     - ;
         ?      (?0)    ?       1       1       ? :      ? :     - ;
         0      (1X)    ?       1       1       ? :      0 :     0 ;
         1      (1X)    1       1       1       ? :      1 :     1 ;
         ?      B       (?1)    1       1       ? :      ? :     - ;
         0      X       (?1)    1       1       ? :      0 :     0 ;
         0      (0X)    ?       1       1       ? :      0 :     0 ;
         0      (X1)    ?       1       1       ? :      0 :     0 ;
         1      (0X)    1       1       1       ? :      1 :     1 ;
         1      (X1)    1       1       1       ? :      1 :     1 ;
         0      (01)    X       1       1       ? :      ? :     0 ;
         ?      B       (?X)    1       1       ? :      0 :     0 ;
         0      X       (?X)    1       1       ? :      0 :     0 ;
         ?      ?       ?       1       1       * :      ? :     X ;

        endtable

endprimitive

primitive U_FD_P_SN (Q, D, CP, SN);
        output Q;
        input  D, CP, SN;
        reg    Q;

        table
        //D     CP      SN      : Qn: Qn+1
         ?      ?       0       : ? : 1 ;
         *      ?       0       : ? : 1 ;
         ?      *       0       : ? : 1 ;
         1      (01)    1       : ? : 1 ;
         0      (01)    1       : ? : 0 ;
         *      B       1       : ? : - ;
         ?      (?0)    1       : ? : - ;
         0      (1X)    1       : 0 : 0 ;
         1      (1X)    1       : 1 : 1 ;
         ?       B     (?1)     : ? : - ;
         0      x      (?1)     : 0 : 0 ;
         0      (0X)    1       : 0 : 0 ;
         0      (X1)    1       : 0 : 0 ;
         1      (0X)    1       : 1 : 1 ;
         1      (X1)    1       : 1 : 1 ;
         1      (01)    X       : ? : 1 ;
         1      (0x)    X       : 1 : 1 ;
         ?      B       (?X)    : 1 : 1 ;
         1      X       (?X)    : 1 : 1 ;


        endtable

endprimitive
primitive U_MUX2 (Z, A, B, S);

   output Z;
   input  A, B, S;

   table

      // A  B  S  :  Z

         0  ?  0  :  0  ;
         1  ?  0  :  1  ;

         ?  0  1  :  0  ;
         ?  1  1  :  1  ;

      // Cases reducing pessimism

         0  0  x  :  0  ;
         1  1  x  :  1  ;

   endtable


endprimitive
primitive U_FD_P_SN_NOTI (Q, D, CP, SN, NOTI_REG);

   output Q;
   input  D,		// data
          CP,		// clock
          SN,		// preset active low
          NOTI_REG;
   reg    Q;

   table
 
      // D     CP    SN    NOTI_REG    : Qtn : Qtn+1

         ?     ?     0     ?           :  ?  :  1  ;	// Asynchronous preset

         1     (01)  1     ?           :  ?  :  1  ;	// Normal clocking
         0     (01)  1     ?           :  ?  :  0  ;

         *     b     ?     ?           :  ?  :  -  ;	// Ignore edges on data

         ?     (?0)  ?     ?           :  ?  :  -  ;	// Ignore falling edges on clock

         0     (1x)  1     ?           :  0  :  0  ;
         1     (1x)  ?     ?           :  1  :  1  ;

         ?     b     (?1)  ?           :  ?  :  -  ;	// Ignore rising edges on set
         1     x     (?1)  ?           :  1  :  1  ;	// Ignore rising edges on set

         0     (0x)  1     ?           :  0  :  0  ;	// Cases reducing pessimism
         0     (x1)  1     ?           :  0  :  0  ;
         1     (0x)  ?     ?           :  1  :  1  ;
         1     (x1)  ?     ?           :  1  :  1  ;

         1     (01)  x     ?           :  ?  :  1  ;
         ?     b     (?x)  ?           :  1  :  1  ;
         1     x     (?x)  ?           :  1  :  1  ;

         ?     ?     ?     *           :  ?  :  x  ;	// X for timing violations

   endtable

endprimitive
primitive U_FD_P_SN_NOTI_POWER (Q, D, CP, SN, GND_FINAL, VDD_FINAL, NOTI_REG);
        output Q;
        input  D, CP, SN, GND_FINAL, VDD_FINAL, NOTI_REG;
        reg    Q;

        table   
        //D     CP      SN      GND_FINAL       VDD_FINAL       NOTI_REG         : Q
         ?      ?       0       1       1       ? :      ? :     1 ;
         1      (01)    1       1       1       ? :      ? :     1 ;
         0      (01)    1       1       1       ? :      ? :     0 ;
         *      B       ?       1       1       ? :      ? :     - ;
         ?      (?0)    ?       1       1       ? :      ? :     - ;
         0      (1X)    1       1       1       ? :      0 :     0 ;
         1      (1X)    ?       1       1       ? :      1 :     1 ;
         ?      B       (?1)    1       1       ? :      ? :     - ;
         1      X       (?1)    1       1       ? :      1 :     1 ;
         0      (0X)    1       1       1       ? :      0 :     0 ;
         0      (X1)    1       1       1       ? :      0 :     0 ;
         1      (0X)    ?       1       1       ? :      1 :     1 ;
         1      (X1)    ?       1       1       ? :      1 :     1 ;
         1      (01)    X       1       1       ? :      ? :     1 ;
         ?      B       (?X)    1       1       ? :      1 :     1 ;
         1      X       (?X)    1       1       ? :      1 :     1 ;
         ?      ?       ?       1       1       * :      ? :     X ;

        endtable

endprimitive



