`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif


module C28SOI_PM_LOGIC_LR_P0 ( LEAK_OUT, SPEEDOUT_NMOS, SPEEDOUT_PMOS, TQ, DIVLEAK0, DIVLEAK1, DIVSPEED0, DIVSPEED1, PD_L, PD_N, PD_P, RN, TE, TI, TM, TSTCLK);


output  LEAK_OUT, SPEEDOUT_NMOS, SPEEDOUT_PMOS, TQ;
input  DIVLEAK0, DIVLEAK1, DIVSPEED0, DIVSPEED1, PD_L, PD_N, PD_P, RN, TE, TI, TM, TSTCLK; 

reg vdd;
reg vdds;
reg gnd;
reg gnds;

initial 
begin 
gnd =1'b0 ;
vdd =1'b1 ;
gnds =1'b0 ;
vdds =1'b1 ;
end 

parameter PERIOD_SPEEDO = 50;  //Period in ns
parameter PERIOD_LEAKO = 50;  //Period in ns


 
`ifdef functional
    
        nor    U1 (gnd_final, gnd, gnds) ;
        and    U2 (vdd_final, vdd, vdds) ;

C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_CTRL I10 ( .TQ(TQ_nopwr), .DIVLEAK0(DIVLEAK0), .DIVLEAK1(DIVLEAK1), .RN(RN), .TE(TE), .TI(net032), .TM(TM), .TSTCLK(TSTCLK), .LEAK_OUT(LEAK_OUT_nopwr), .outLb(net1) ,.outLi(net2), .PD_L(PD_L) , .vdd_final(vdd_final), .gnd_final(gnd_final));
C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_CTRL I12 ( .OutNb(net042), .OutPb(net043), .TQ(net032), .DIVSPEED0(DIVSPEED0), .DIVSPEED1(DIVSPEED1), .OutNi(net41), .OutPi(net42), .RN(RN), .TE(TE), .TI(TI), .TM(TM), .TSTCLK(TSTCLK), .SPEEDOUT_NMOS(SPEEDOUT_NMOS_nopwr), .SPEEDOUT_PMOS(SPEEDOUT_PMOS_nopwr), .PD_N(PD_N), .PD_P(PD_P), .vdd_final(vdd_final), .gnd_final(gnd_final));
C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_MATRIX #( .PERIOD_SPEEDO(PERIOD_SPEEDO)) I11 ( .outN(net41), .outP(net42), .inN(net042), .inP(net043));
C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_MATRIX #( .PERIOD_LEAKO(PERIOD_LEAKO)) I9 (.outLb(net1) ,.outLi(net2));
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U6 (LEAK_OUT,LEAK_OUT_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U7 (SPEEDOUT_NMOS,SPEEDOUT_NMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U8 (SPEEDOUT_PMOS,SPEEDOUT_PMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U9 (TQ,TQ_nopwr,gnd_final,vdd_final);

`else
	reg  NOTIFIER;
	
        nor    U1 (gnd_final, gnd, gnds) ;
        and    U2 (vdd_final, vdd, vdds) ;
	
        C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_CTRL I10 ( .TQ(TQ_nopwr), .DIVLEAK0(dDIVLEAK0), .DIVLEAK1(dDIVLEAK1), .RN(dRN), .TE(dTE), .TI(net032), .TM(dTM), .TSTCLK(dTSTCLK), .LEAK_OUT(LEAK_OUT_nopwr), .outLb(net1) ,.outLi(net2), .PD_L(PD_L) , .vdd_final(vdd_final), .gnd_final(gnd_final));
        C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_CTRL I12 ( .OutNb(net042), .OutPb(net043), .TQ(net032), .DIVSPEED0(dDIVSPEED0), .DIVSPEED1(dDIVSPEED1), .OutNi(net41), .OutPi(net42), .RN(dRN), .TE(dTE), .TI(dTI), .TM(dTM), .TSTCLK(dTSTCLK), .SPEEDOUT_NMOS(SPEEDOUT_NMOS_nopwr), .SPEEDOUT_PMOS(SPEEDOUT_PMOS_nopwr), .PD_N(PD_N), .PD_P(PD_P), .vdd_final(vdd_final), .gnd_final(gnd_final));
	C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_MATRIX #( .PERIOD_SPEEDO(PERIOD_SPEEDO)) I11 ( .outN(net41), .outP(net42), .inN(net042), .inP(net043));
	C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_MATRIX #(.PERIOD_LEAKO(PERIOD_LEAKO)) I9 (.outLb(net1) ,.outLi(net2));
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U6 (LEAK_OUT,LEAK_OUT_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U7 (SPEEDOUT_NMOS,SPEEDOUT_NMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U8 (SPEEDOUT_PMOS,SPEEDOUT_PMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U9 (TQ,TQ_nopwr,gnd_final,vdd_final);
		and    X1 (AND_RNTETM, dRN, dTE, dTM) ;
		and    X2 (AND_RNTM, dRN, dTM);
		and    X3 (AND_TETITM, dTE, dTI, dTM); 
		and    X4 (AND_TETI, dTE, dTI);
        not    X5 (NOT_TE ,dTE) ; 
        and    X6 (AND_RNTENOT , NOT_TE ,dRN);         
                C28SOI_PM_SENSOR_GO1_LR_U_NOTI U3 ( TQ, TQ_nopwr, NOTIFIER);       
		
	specify
                
		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;
		
                (negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);
		if (RN && TE && TM) (posedge TSTCLK => (TQ +: net032)) = (tDELAY,tDELAY);


		$setuphold(posedge TSTCLK, posedge TI, tSETUP, tHOLD , NOTIFIER,, AND_RNTETM, dTSTCLK, dTI);
		$setuphold(posedge TSTCLK, negedge TI, tSETUP, tHOLD , NOTIFIER,, AND_RNTETM, dTSTCLK, dTI);

		$setuphold(posedge TSTCLK, posedge TE, tSETUP, tHOLD , NOTIFIER,, AND_RNTM, dTSTCLK, dTE);
		$setuphold(posedge TSTCLK, negedge TE, tSETUP, tHOLD , NOTIFIER,, AND_RNTM, dTSTCLK, dTE);

                $setuphold(posedge TSTCLK, posedge DIVLEAK0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK0);
		$setuphold(posedge TSTCLK, negedge DIVLEAK0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK0);
      																																																					 
                $setuphold(posedge TSTCLK, posedge DIVLEAK1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK1);
                $setuphold(posedge TSTCLK, negedge DIVLEAK1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK1);

                $setuphold(posedge TSTCLK, posedge DIVSPEED0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED0);
		$setuphold(posedge TSTCLK, negedge DIVSPEED0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED0);
      																																																					 
                $setuphold(posedge TSTCLK, posedge DIVSPEED1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED1);
                $setuphold(posedge TSTCLK, negedge DIVSPEED1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED1);

		$recrem(posedge TM, posedge TSTCLK, tSETUP, tHOLD , NOTIFIER,, dRN, dTM, dTSTCLK);
	        $recrem(negedge TM, negedge TSTCLK, tSETUP, tHOLD , NOTIFIER,, dRN, dTM, dTSTCLK);

		$recrem(posedge RN, posedge TSTCLK, tSETUP, tHOLD , NOTIFIER,, AND_TETITM, dRN, dTSTCLK);
		$recrem(posedge RN, posedge TM, tSETUP, tHOLD , NOTIFIER,, AND_TETI, dRN, dTM );

		$width(negedge TSTCLK &&& AND_RNTETM, tPULSE ,0, NOTIFIER);
		$width(posedge TSTCLK &&& AND_RNTETM, tPULSE ,0, NOTIFIER);
		$width(negedge RN, tPULSE ,0, NOTIFIER);
                    
	endspecify
`endif	    
endmodule
`undef st_delay_seq

`endcelldefine

`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif


module C28SOI_PM_LOGIC_LR_P4 ( LEAK_OUT, SPEEDOUT_NMOS, SPEEDOUT_PMOS, TQ, DIVLEAK0, DIVLEAK1, DIVSPEED0, DIVSPEED1, PD_L, PD_N, PD_P, RN, TE, TI, TM, TSTCLK);


output  LEAK_OUT, SPEEDOUT_NMOS, SPEEDOUT_PMOS, TQ;
input  DIVLEAK0, DIVLEAK1, DIVSPEED0, DIVSPEED1, PD_L, PD_N, PD_P, RN, TE, TI, TM, TSTCLK; 
reg vdd;
reg vdds;
reg gnd;
reg gnds;

initial 
begin 
gnd =1'b0 ;
vdd =1'b1 ;
gnds =1'b0 ;
vdds =1'b1 ;
end 

parameter PERIOD_SPEEDO = 50;  //Period in ns
parameter PERIOD_LEAKO = 50;  //Period in ns


 
`ifdef functional
    
        nor    U1 (gnd_final, gnd, gnds) ;
        and    U2 (vdd_final, vdd, vdds) ;

C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_CTRL I10 ( .TQ(TQ_nopwr), .DIVLEAK0(DIVLEAK0), .DIVLEAK1(DIVLEAK1), .RN(RN), .TE(TE), .TI(net032), .TM(TM), .TSTCLK(TSTCLK), .LEAK_OUT(LEAK_OUT_nopwr), .outLb(net1) ,.outLi(net2), .PD_L(PD_L) , .vdd_final(vdd_final), .gnd_final(gnd_final));
C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_CTRL I12 ( .OutNb(net042), .OutPb(net043), .TQ(net032), .DIVSPEED0(DIVSPEED0), .DIVSPEED1(DIVSPEED1), .OutNi(net41), .OutPi(net42), .RN(RN), .TE(TE), .TI(TI), .TM(TM), .TSTCLK(TSTCLK), .SPEEDOUT_NMOS(SPEEDOUT_NMOS_nopwr), .SPEEDOUT_PMOS(SPEEDOUT_PMOS_nopwr), .PD_N(PD_N), .PD_P(PD_P), .vdd_final(vdd_final), .gnd_final(gnd_final));
C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_MATRIX #( .PERIOD_SPEEDO(PERIOD_SPEEDO)) I11 ( .outN(net41), .outP(net42), .inN(net042), .inP(net043));
C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_MATRIX #( .PERIOD_LEAKO(PERIOD_LEAKO)) I9 (.outLb(net1) ,.outLi(net2));
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U6 (LEAK_OUT,LEAK_OUT_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U7 (SPEEDOUT_NMOS,SPEEDOUT_NMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U8 (SPEEDOUT_PMOS,SPEEDOUT_PMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U9 (TQ,TQ_nopwr,gnd_final,vdd_final);

`else

	reg  NOTIFIER;
	
        nor    U1 (gnd_final, gnd, gnds) ;
        and    U2 (vdd_final, vdd, vdds) ;
	 
        C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_CTRL I10 ( .TQ(TQ_nopwr), .DIVLEAK0(dDIVLEAK0), .DIVLEAK1(dDIVLEAK1), .RN(dRN), .TE(dTE), .TI(net032), .TM(dTM), .TSTCLK(dTSTCLK), .LEAK_OUT(LEAK_OUT_nopwr), .outLb(net1) ,.outLi(net2), .PD_L(PD_L) , .vdd_final(vdd_final), .gnd_final(gnd_final));
        C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_CTRL I12 ( .OutNb(net042), .OutPb(net043), .TQ(net032), .DIVSPEED0(dDIVSPEED0), .DIVSPEED1(dDIVSPEED1), .OutNi(net41), .OutPi(net42), .RN(dRN), .TE(dTE), .TI(dTI), .TM(dTM), .TSTCLK(dTSTCLK), .SPEEDOUT_NMOS(SPEEDOUT_NMOS_nopwr), .SPEEDOUT_PMOS(SPEEDOUT_PMOS_nopwr), .PD_N(PD_N), .PD_P(PD_P), .vdd_final(vdd_final), .gnd_final(gnd_final));
	C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_MATRIX #( .PERIOD_SPEEDO(PERIOD_SPEEDO)) I11 ( .outN(net41), .outP(net42), .inN(net042), .inP(net043));
	C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_MATRIX #(.PERIOD_LEAKO(PERIOD_LEAKO)) I9 (.outLb(net1) ,.outLi(net2));
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U6 (LEAK_OUT,LEAK_OUT_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U7 (SPEEDOUT_NMOS,SPEEDOUT_NMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U8 (SPEEDOUT_PMOS,SPEEDOUT_PMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U9 (TQ,TQ_nopwr,gnd_final,vdd_final);
		and    X1 (AND_RNTETM, dRN, dTE, dTM) ;
		and    X2 (AND_RNTM, dRN, dTM);
		and    X3 (AND_TETITM, dTE, dTI, dTM); 
		and    X4 (AND_TETI, dTE, dTI);
        not    X5 (NOT_TE ,dTE) ; 
        and    X6 (AND_RNTENOT , NOT_TE ,dRN);         
                C28SOI_PM_SENSOR_GO1_LR_U_NOTI U3 ( TQ, TQ_nopwr, NOTIFIER);       
		
	specify
                
		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;
		
                (negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);
		if (RN && TE && TM) (posedge TSTCLK => (TQ +: net032)) = (tDELAY,tDELAY);


		$setuphold(posedge TSTCLK, posedge TI, tSETUP, tHOLD , NOTIFIER,, AND_RNTETM, dTSTCLK, dTI);
		$setuphold(posedge TSTCLK, negedge TI, tSETUP, tHOLD , NOTIFIER,, AND_RNTETM, dTSTCLK, dTI);

		$setuphold(posedge TSTCLK, posedge TE, tSETUP, tHOLD , NOTIFIER,, AND_RNTM, dTSTCLK, dTE);
		$setuphold(posedge TSTCLK, negedge TE, tSETUP, tHOLD , NOTIFIER,, AND_RNTM, dTSTCLK, dTE);

                $setuphold(posedge TSTCLK, posedge DIVLEAK0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK0);
		$setuphold(posedge TSTCLK, negedge DIVLEAK0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK0);
      																																																					 
                $setuphold(posedge TSTCLK, posedge DIVLEAK1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK1);
                $setuphold(posedge TSTCLK, negedge DIVLEAK1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK1);

                $setuphold(posedge TSTCLK, posedge DIVSPEED0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED0);
		$setuphold(posedge TSTCLK, negedge DIVSPEED0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED0);
      																																																					 
                $setuphold(posedge TSTCLK, posedge DIVSPEED1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED1);
                $setuphold(posedge TSTCLK, negedge DIVSPEED1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED1);

		$recrem(posedge TM, posedge TSTCLK, tSETUP, tHOLD , NOTIFIER,, dRN, dTM, dTSTCLK);
	        $recrem(negedge TM, negedge TSTCLK, tSETUP, tHOLD , NOTIFIER,, dRN, dTM, dTSTCLK);

		$recrem(posedge RN, posedge TSTCLK, tSETUP, tHOLD , NOTIFIER,, AND_TETITM, dRN, dTSTCLK);
		$recrem(posedge RN, posedge TM, tSETUP, tHOLD , NOTIFIER,, AND_TETI, dRN, dTM );

		$width(negedge TSTCLK &&& AND_RNTETM, tPULSE ,0, NOTIFIER);
		$width(posedge TSTCLK &&& AND_RNTETM, tPULSE ,0, NOTIFIER);
		$width(negedge RN, tPULSE ,0, NOTIFIER);
                    
	endspecify
`endif	    
endmodule
`undef st_delay_seq

`endcelldefine



`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif


module C28SOI_PM_LOGIC_LR_P10 ( LEAK_OUT, SPEEDOUT_NMOS, SPEEDOUT_PMOS, TQ, DIVLEAK0, DIVLEAK1, DIVSPEED0, DIVSPEED1, PD_L, PD_N, PD_P, RN, TE, TI, TM, TSTCLK);


output  LEAK_OUT, SPEEDOUT_NMOS, SPEEDOUT_PMOS, TQ;
input  DIVLEAK0, DIVLEAK1, DIVSPEED0, DIVSPEED1, PD_L, PD_N, PD_P, RN, TE, TI, TM, TSTCLK; 
reg vdd;
reg vdds;
reg gnd;
reg gnds;

initial 
begin 
gnd =1'b0 ;
vdd =1'b1 ;
gnds =1'b0 ;
vdds =1'b1 ;
end 

parameter PERIOD_SPEEDO = 50;  //Period in ns
parameter PERIOD_LEAKO = 50;  //Period in ns


 
`ifdef functional
    
        nor    U1 (gnd_final, gnd, gnds) ;
        and    U2 (vdd_final, vdd, vdds) ;

C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_CTRL I10 ( .TQ(TQ_nopwr), .DIVLEAK0(DIVLEAK0), .DIVLEAK1(DIVLEAK1), .RN(RN), .TE(TE), .TI(net032), .TM(TM), .TSTCLK(TSTCLK), .LEAK_OUT(LEAK_OUT_nopwr), .outLb(net1) ,.outLi(net2), .PD_L(PD_L) , .vdd_final(vdd_final), .gnd_final(gnd_final));
C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_CTRL I12 ( .OutNb(net042), .OutPb(net043), .TQ(net032), .DIVSPEED0(DIVSPEED0), .DIVSPEED1(DIVSPEED1), .OutNi(net41), .OutPi(net42), .RN(RN), .TE(TE), .TI(TI), .TM(TM), .TSTCLK(TSTCLK), .SPEEDOUT_NMOS(SPEEDOUT_NMOS_nopwr), .SPEEDOUT_PMOS(SPEEDOUT_PMOS_nopwr), .PD_N(PD_N), .PD_P(PD_P), .vdd_final(vdd_final), .gnd_final(gnd_final));
C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_MATRIX #( .PERIOD_SPEEDO(PERIOD_SPEEDO)) I11 ( .outN(net41), .outP(net42), .inN(net042), .inP(net043));
C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_MATRIX #( .PERIOD_LEAKO(PERIOD_LEAKO)) I9 (.outLb(net1) ,.outLi(net2));
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U6 (LEAK_OUT,LEAK_OUT_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U7 (SPEEDOUT_NMOS,SPEEDOUT_NMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U8 (SPEEDOUT_PMOS,SPEEDOUT_PMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U9 (TQ,TQ_nopwr,gnd_final,vdd_final);

`else
	reg  NOTIFIER;
	
        nor    U1 (gnd_final, gnd, gnds) ;
        and    U2 (vdd_final, vdd, vdds) ;
	
        C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_CTRL I10 ( .TQ(TQ_nopwr), .DIVLEAK0(dDIVLEAK0), .DIVLEAK1(dDIVLEAK1), .RN(dRN), .TE(dTE), .TI(net032), .TM(dTM), .TSTCLK(dTSTCLK), .LEAK_OUT(LEAK_OUT_nopwr), .outLb(net1) ,.outLi(net2), .PD_L(PD_L) , .vdd_final(vdd_final), .gnd_final(gnd_final));
        C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_CTRL I12 ( .OutNb(net042), .OutPb(net043), .TQ(net032), .DIVSPEED0(dDIVSPEED0), .DIVSPEED1(dDIVSPEED1), .OutNi(net41), .OutPi(net42), .RN(dRN), .TE(dTE), .TI(dTI), .TM(dTM), .TSTCLK(dTSTCLK), .SPEEDOUT_NMOS(SPEEDOUT_NMOS_nopwr), .SPEEDOUT_PMOS(SPEEDOUT_PMOS_nopwr), .PD_N(PD_N), .PD_P(PD_P), .vdd_final(vdd_final), .gnd_final(gnd_final));
	C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_MATRIX #( .PERIOD_SPEEDO(PERIOD_SPEEDO)) I11 ( .outN(net41), .outP(net42), .inN(net042), .inP(net043));
	C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_MATRIX #(.PERIOD_LEAKO(PERIOD_LEAKO)) I9 (.outLb(net1) ,.outLi(net2));
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U6 (LEAK_OUT,LEAK_OUT_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U7 (SPEEDOUT_NMOS,SPEEDOUT_NMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U8 (SPEEDOUT_PMOS,SPEEDOUT_PMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U9 (TQ,TQ_nopwr,gnd_final,vdd_final);
		and    X1 (AND_RNTETM, dRN, dTE, dTM) ;
		and    X2 (AND_RNTM, dRN, dTM);
		and    X3 (AND_TETITM, dTE, dTI, dTM); 
		and    X4 (AND_TETI, dTE, dTI);
        not    X5 (NOT_TE ,dTE) ; 
        and    X6 (AND_RNTENOT , NOT_TE ,dRN);         
                C28SOI_PM_SENSOR_GO1_LR_U_NOTI U3 ( TQ, TQ_nopwr, NOTIFIER);       
		
	specify
                
		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;
		
                (negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);
		if (RN && TE && TM) (posedge TSTCLK => (TQ +: net032)) = (tDELAY,tDELAY);


		$setuphold(posedge TSTCLK, posedge TI, tSETUP, tHOLD , NOTIFIER,, AND_RNTETM, dTSTCLK, dTI);
		$setuphold(posedge TSTCLK, negedge TI, tSETUP, tHOLD , NOTIFIER,, AND_RNTETM, dTSTCLK, dTI);

		$setuphold(posedge TSTCLK, posedge TE, tSETUP, tHOLD , NOTIFIER,, AND_RNTM, dTSTCLK, dTE);
		$setuphold(posedge TSTCLK, negedge TE, tSETUP, tHOLD , NOTIFIER,, AND_RNTM, dTSTCLK, dTE);

                $setuphold(posedge TSTCLK, posedge DIVLEAK0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK0);
		$setuphold(posedge TSTCLK, negedge DIVLEAK0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK0);
      																																																					 
                $setuphold(posedge TSTCLK, posedge DIVLEAK1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK1);
                $setuphold(posedge TSTCLK, negedge DIVLEAK1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK1);

                $setuphold(posedge TSTCLK, posedge DIVSPEED0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED0);
		$setuphold(posedge TSTCLK, negedge DIVSPEED0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED0);
      																																																					 
                $setuphold(posedge TSTCLK, posedge DIVSPEED1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED1);
                $setuphold(posedge TSTCLK, negedge DIVSPEED1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED1);

		$recrem(posedge TM, posedge TSTCLK, tSETUP, tHOLD , NOTIFIER,, dRN, dTM, dTSTCLK);
	        $recrem(negedge TM, negedge TSTCLK, tSETUP, tHOLD , NOTIFIER,, dRN, dTM, dTSTCLK);

		$recrem(posedge RN, posedge TSTCLK, tSETUP, tHOLD , NOTIFIER,, AND_TETITM, dRN, dTSTCLK);
		$recrem(posedge RN, posedge TM, tSETUP, tHOLD , NOTIFIER,, AND_TETI, dRN, dTM );

		$width(negedge TSTCLK &&& AND_RNTETM, tPULSE ,0, NOTIFIER);
		$width(posedge TSTCLK &&& AND_RNTETM, tPULSE ,0, NOTIFIER);
		$width(negedge RN, tPULSE ,0, NOTIFIER);
                    
	endspecify
`endif	    
endmodule
`undef st_delay_seq

`endcelldefine


`celldefine

`ifdef ST_TIMESCALE
    `ST_TIMESCALE
`else
    `timescale 1ns/1ps
`endif

`ifdef ST_NODELAYMODE
`else
    `delay_mode_path
`endif

`ifdef ST_DELAY_SEQ
    `define st_delay_seq `ST_DELAY_SEQ
`else
    `define st_delay_seq 0.001
`endif


module C28SOI_PM_LOGIC_LR_P16 ( LEAK_OUT, SPEEDOUT_NMOS, SPEEDOUT_PMOS, TQ, DIVLEAK0, DIVLEAK1, DIVSPEED0, DIVSPEED1, PD_L, PD_N, PD_P, RN, TE, TI, TM, TSTCLK);


output  LEAK_OUT, SPEEDOUT_NMOS, SPEEDOUT_PMOS, TQ;
input  DIVLEAK0, DIVLEAK1, DIVSPEED0, DIVSPEED1, PD_L, PD_N, PD_P, RN, TE, TI, TM, TSTCLK; 
reg vdd;
reg vdds;
reg gnd;
reg gnds;

initial 
begin 
gnd =1'b0 ;
vdd =1'b1 ;
gnds =1'b0 ;
vdds =1'b1 ;
end 

parameter PERIOD_SPEEDO = 50;  //Period in ns
parameter PERIOD_LEAKO = 50;  //Period in ns


 
`ifdef functional
    
        nor    U1 (gnd_final, gnd, gnds) ;
        and    U2 (vdd_final, vdd, vdds) ;

C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_CTRL I10 ( .TQ(TQ_nopwr), .DIVLEAK0(DIVLEAK0), .DIVLEAK1(DIVLEAK1), .RN(RN), .TE(TE), .TI(net032), .TM(TM), .TSTCLK(TSTCLK), .LEAK_OUT(LEAK_OUT_nopwr), .outLb(net1) ,.outLi(net2), .PD_L(PD_L) , .vdd_final(vdd_final), .gnd_final(gnd_final));
C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_CTRL I12 ( .OutNb(net042), .OutPb(net043), .TQ(net032), .DIVSPEED0(DIVSPEED0), .DIVSPEED1(DIVSPEED1), .OutNi(net41), .OutPi(net42), .RN(RN), .TE(TE), .TI(TI), .TM(TM), .TSTCLK(TSTCLK), .SPEEDOUT_NMOS(SPEEDOUT_NMOS_nopwr), .SPEEDOUT_PMOS(SPEEDOUT_PMOS_nopwr), .PD_N(PD_N), .PD_P(PD_P), .vdd_final(vdd_final), .gnd_final(gnd_final));
C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_MATRIX #( .PERIOD_SPEEDO(PERIOD_SPEEDO)) I11 ( .outN(net41), .outP(net42), .inN(net042), .inP(net043));
C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_MATRIX #( .PERIOD_LEAKO(PERIOD_LEAKO)) I9 (.outLb(net1) ,.outLi(net2));
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U6 (LEAK_OUT,LEAK_OUT_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U7 (SPEEDOUT_NMOS,SPEEDOUT_NMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U8 (SPEEDOUT_PMOS,SPEEDOUT_PMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U9 (TQ,TQ_nopwr,gnd_final,vdd_final);

`else
	reg  NOTIFIER;
	
        nor    U1 (gnd_final, gnd, gnds) ;
        and    U2 (vdd_final, vdd, vdds) ;
	
        C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_CTRL I10 ( .TQ(TQ_nopwr), .DIVLEAK0(dDIVLEAK0), .DIVLEAK1(dDIVLEAK1), .RN(dRN), .TE(dTE), .TI(net032), .TM(dTM), .TSTCLK(dTSTCLK), .LEAK_OUT(LEAK_OUT_nopwr), .outLb(net1) ,.outLi(net2), .PD_L(PD_L) , .vdd_final(vdd_final), .gnd_final(gnd_final));
        C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_CTRL I12 ( .OutNb(net042), .OutPb(net043), .TQ(net032), .DIVSPEED0(dDIVSPEED0), .DIVSPEED1(dDIVSPEED1), .OutNi(net41), .OutPi(net42), .RN(dRN), .TE(dTE), .TI(dTI), .TM(dTM), .TSTCLK(dTSTCLK), .SPEEDOUT_NMOS(SPEEDOUT_NMOS_nopwr), .SPEEDOUT_PMOS(SPEEDOUT_PMOS_nopwr), .PD_N(PD_N), .PD_P(PD_P), .vdd_final(vdd_final), .gnd_final(gnd_final));
	C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_MATRIX #( .PERIOD_SPEEDO(PERIOD_SPEEDO)) I11 ( .outN(net41), .outP(net42), .inN(net042), .inP(net043));
	C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_MATRIX #(.PERIOD_LEAKO(PERIOD_LEAKO)) I9 (.outLb(net1) ,.outLi(net2));
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U6 (LEAK_OUT,LEAK_OUT_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U7 (SPEEDOUT_NMOS,SPEEDOUT_NMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U8 (SPEEDOUT_PMOS,SPEEDOUT_PMOS_nopwr,gnd_final,vdd_final);
        C28SOI_PM_SENSOR_GO1_LR_U_POWER U9 (TQ,TQ_nopwr,gnd_final,vdd_final);
		and    X1 (AND_RNTETM, dRN, dTE, dTM) ;
		and    X2 (AND_RNTM, dRN, dTM);
		and    X3 (AND_TETITM, dTE, dTI, dTM); 
		and    X4 (AND_TETI, dTE, dTI);
        not    X5 (NOT_TE ,dTE) ; 
        and    X6 (AND_RNTENOT , NOT_TE ,dRN);         
                C28SOI_PM_SENSOR_GO1_LR_U_NOTI U3 ( TQ, TQ_nopwr, NOTIFIER);       
		
	specify
                
		specparam tDELAY = `st_delay_seq ;
		specparam tSETUP = 0.0 ;
		specparam tHOLD  = 0.0 ;
		specparam tPULSE = 0.0 ;
		
                (negedge RN => (TQ +: 1'b0)) = (tDELAY,tDELAY);
		if (RN && TE && TM) (posedge TSTCLK => (TQ +: net032)) = (tDELAY,tDELAY);


		$setuphold(posedge TSTCLK, posedge TI, tSETUP, tHOLD , NOTIFIER,, AND_RNTETM, dTSTCLK, dTI);
		$setuphold(posedge TSTCLK, negedge TI, tSETUP, tHOLD , NOTIFIER,, AND_RNTETM, dTSTCLK, dTI);

		$setuphold(posedge TSTCLK, posedge TE, tSETUP, tHOLD , NOTIFIER,, AND_RNTM, dTSTCLK, dTE);
		$setuphold(posedge TSTCLK, negedge TE, tSETUP, tHOLD , NOTIFIER,, AND_RNTM, dTSTCLK, dTE);

                $setuphold(posedge TSTCLK, posedge DIVLEAK0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK0);
		$setuphold(posedge TSTCLK, negedge DIVLEAK0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK0);
      																																																					 
                $setuphold(posedge TSTCLK, posedge DIVLEAK1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK1);
                $setuphold(posedge TSTCLK, negedge DIVLEAK1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVLEAK1);

                $setuphold(posedge TSTCLK, posedge DIVSPEED0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED0);
		$setuphold(posedge TSTCLK, negedge DIVSPEED0, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED0);
      																																																					 
                $setuphold(posedge TSTCLK, posedge DIVSPEED1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED1);
                $setuphold(posedge TSTCLK, negedge DIVSPEED1, tSETUP, tHOLD , NOTIFIER,, AND_RNTENOT, dTSTCLK, dDIVSPEED1);

		$recrem(posedge TM, posedge TSTCLK, tSETUP, tHOLD , NOTIFIER,, dRN, dTM, dTSTCLK);
	        $recrem(negedge TM, negedge TSTCLK, tSETUP, tHOLD , NOTIFIER,, dRN, dTM, dTSTCLK);

		$recrem(posedge RN, posedge TSTCLK, tSETUP, tHOLD , NOTIFIER,, AND_TETITM, dRN, dTSTCLK);
		$recrem(posedge RN, posedge TM, tSETUP, tHOLD , NOTIFIER,, AND_TETI, dRN, dTM );

		$width(negedge TSTCLK &&& AND_RNTETM, tPULSE ,0, NOTIFIER);
		$width(posedge TSTCLK &&& AND_RNTETM, tPULSE ,0, NOTIFIER);
		$width(negedge RN, tPULSE ,0, NOTIFIER);
                    
	endspecify
`endif	    
endmodule
`undef st_delay_seq

`endcelldefine



module C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_CTRL ( LEAK_OUT, TQ,outLi,outLb , DIVLEAK0, DIVLEAK1, PD_L,RN, TE, TI, TM, TSTCLK,gnd_final,vdd_final );

output  LEAK_OUT, TQ, outLi;

input  DIVLEAK0, DIVLEAK1, PD_L, RN, TE, TI, TM, TSTCLK,outLb,gnd_final,vdd_final;

C28SOI_PM_SENSOR_GO1_LR_flipflopchain  I50 ( .Out(outLi), .SENSOR_OUT(LEAK_OUT), .TQ(TQ),
     .DIV0(DIVLEAK0), .DIV1(DIVLEAK1), .IN(outLb), .PD(PD_L),
     .RN(RN), .TE(TE), .TI(TI), .TM(TM), .TSTCLK(TSTCLK), .vdd_final(vdd_final), .gnd_final(gnd_final));

endmodule


module C28SOI_PM_SENSOR_GO1_LR_SDFPRQNT (QN, TQ, D, CP, RN, TI, TE, gnd_final,vdd_final);

        output QN;
        output TQ;
        input D;
        input CP;
        input RN;
        input TI;
        input TE;
        input gnd_final;
        input vdd_final;
        C28SOI_PM_SENSOR_GO1_LR_U_MUX2   U1 (INTERNAL1, D, TI, TE) ;
        C28SOI_PM_SENSOR_GO1_LR_U_FD_P_RN_POWER   U2 (IQ, INTERNAL1, CP, RN ,gnd_final,vdd_final) ;
        not   U3 (QN, IQ) ;      
		buf  U4 (TQ, IQ) ;

endmodule // C28SOI_PM_SENSOR_GO1_LR_SDFPRQNT


module C28SOI_PM_SENSOR_GO1_LR_MUX21 (Z, D0, D1, S0);

        output Z;
        input D0;
        input D1;
        input S0;

        C28SOI_PM_SENSOR_GO1_LR_U_MUX2   U1 (Z, D0, D1, S0) ;



endmodule // C28SOI_PM_SENSOR_GO1_LR_MUX21


module C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_CTRL ( OutNb, OutPb, SPEEDOUT_NMOS,
     SPEEDOUT_PMOS, TQ, DIVSPEED0, DIVSPEED1, OutNi, OutPi, PD_N, PD_P,
     RN, TE, TI, TM, TSTCLK,gnd_final,vdd_final );

output  OutNb, OutPb, SPEEDOUT_NMOS, SPEEDOUT_PMOS, TQ;

input  DIVSPEED0, DIVSPEED1, OutNi, OutPi, PD_N, PD_P, RN, TE, TI, TM,
     TSTCLK, gnd_final,vdd_final;

C28SOI_PM_SENSOR_GO1_LR_flipflopchain  I48 ( .Out(OutPb), .SENSOR_OUT(SPEEDOUT_PMOS),
     .TQ(net030), .DIV0(DIVSPEED0), .DIV1(DIVSPEED1), .IN(OutPi),
     .PD(PD_P), .RN(RN), .TE(TE), .TI(TI), .TM(TM), .TSTCLK(TSTCLK), .vdd_final(vdd_final), .gnd_final(gnd_final));
C28SOI_PM_SENSOR_GO1_LR_flipflopchain  I49 ( .Out(OutNb), .SENSOR_OUT(SPEEDOUT_NMOS), .TQ(TQ),
     .DIV0(DIVSPEED0), .DIV1(DIVSPEED1), .IN(OutNi), .PD(PD_N),
     .RN(RN), .TE(TE), .TI(net030), .TM(TM), .TSTCLK(TSTCLK), .vdd_final(vdd_final), .gnd_final(gnd_final));

endmodule


module C28SOI_PM_SENSOR_GO1_LR_flipflopchain ( Out, SENSOR_OUT, TQ, DIV0, DIV1, IN, PD, RN, TE, TI, TM, TSTCLK,gnd_final,vdd_final);

output  Out, SENSOR_OUT, TQ;

input  DIV0, DIV1, IN, PD, RN, TE, TI, TM, TSTCLK,gnd_final,vdd_final;

C28SOI_PM_SENSOR_GO1_LR_MUX21 I9 ( .D1(1'b0), .D0(IN), .Z(net16), .S0(TM));
C28SOI_PM_SENSOR_GO1_LR_MUX21 I6 ( .D1(TSTCLK), .D0(Out), .Z(net20), .S0(TM));
C28SOI_PM_SENSOR_GO1_LR_MUX21 I7 ( .D1(TSTCLK), .D0(DIVN2), .Z(net24), .S0(TM));
C28SOI_PM_SENSOR_GO1_LR_MUX21 I8 ( .D1(TSTCLK), .D0(DIVN4), .Z(net39), .S0(TM));
C28SOI_PM_SENSOR_GO1_LR_MUX41 I25 ( .D3(DIVN8), .D2(DIVN4), .D1(DIVN2), .D0(Out), .Z(SENSOR_OUT), .S1(DIV1), .S0(DIV0));
C28SOI_PM_SENSOR_GO1_LR_SDFPRQNT I44 ( .D(SENSOR_OUT), .QN(net31), .CP(TSTCLK),
     .RN(RN), .TE(TE), .TI(net43), .TQ(TQ), .vdd_final(vdd_final), .gnd_final(gnd_final));
C28SOI_PM_SENSOR_GO1_LR_SDFPRQNT I5 ( .D(DIVN8), .QN(DIVN8), .CP(net39), .RN(RN),
     .TE(TE), .TI(net50), .TQ(net43), .vdd_final(vdd_final), .gnd_final(gnd_final));
C28SOI_PM_SENSOR_GO1_LR_SDFPRQNT I4 ( .D(DIVN4), .QN(DIVN4), .CP(net24), .RN(RN),
     .TE(TE), .TI(net57), .TQ(net50), .vdd_final(vdd_final), .gnd_final(gnd_final));
C28SOI_PM_SENSOR_GO1_LR_SDFPRQNT I3 ( .D(DIVN2), .QN(DIVN2), .CP(net20), .RN(RN),
     .TE(TE), .TI(TI), .TQ(net57), .vdd_final(vdd_final), .gnd_final(gnd_final));
C28SOI_PM_SENSOR_GO1_LR_u_nor I2 ( Out, PD, net16);

endmodule


primitive C28SOI_PM_SENSOR_GO1_LR_u_nor (Z,A,B);
      output Z;
        input A,B ;
table
        // A  B : Z;
           1  ? : 0;
           ?  1 : 0;
           0  0 : 1;
           X  0 : 0;
           0  X : 0;

endtable
endprimitive



module C28SOI_PM_SENSOR_GO1_LR_SPEEDOMETER_MATRIX ( outN, outP, inN, inP );

output  outN, outP;

input  inN, inP;
parameter PERIOD_SPEEDO = 50;  //Period in ns

buf  #(PERIOD_SPEEDO/2) chain_P (outP, inP);
buf  #(PERIOD_SPEEDO/2) chain_N (outN, inN);

endmodule


module C28SOI_PM_SENSOR_GO1_LR_LEAKOMETER_MATRIX (outLi, outLb);

output outLb;
input outLi;
parameter PERIOD_LEAKO = 50;  //Period in ns

buf  #(PERIOD_LEAKO/2) chain_L (outLb, outLi);

endmodule



primitive C28SOI_PM_SENSOR_GO1_LR_U_MUX2 (Z, A, B, S);

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
primitive C28SOI_PM_SENSOR_GO1_LR_U_FD_P_RN_POWER (Q, D, CP, RN, GND_FINAL, VDD_FINAL);
        output Q;
        input  D, CP, RN, GND_FINAL, VDD_FINAL;
        reg    Q;

        table
        //D     CP      RN    GND_FINAL     VDD_FINAL   : Qn  : Qn+1
          ?     ?     0       1                 1       :  ?  :  0  ;    // Asynchronous clear

         1     (01)  1        1                 1       :  ?  :  1  ;    // Normal clocking
         0     (01)  1        1                 1       :  ?  :  0  ;

         *     b     ?        1                 1       :  ?  :  -  ;    // Ignore edges on data

         ?     (?0)  ?        1                 1       :  ?  :  -  ;    // Ignore falling edges on clock

         0     (1x)  ?        1                 1       :  0  :  0  ;
         1     (1x)  1        1                 1       :  1  :  1  ;

         ?     b     (?1)     1                 1       :  ?  :  -  ;    // Ignore rising edges on clear
         0     x     (?1)     1                 1       :  0  :  0  ;    // Ignore rising edges on clear

         0     (0x)  ?        1                 1       :  0  :  0  ;    // Cases reducing pessimism
         0     (x1)  ?        1                 1       :  0  :  0  ;
         1     (0x)  1        1                 1       :  1  :  1  ;
         1     (x1)  1        1                 1       :  1  :  1  ;

         0     (01)  x        1                 1       :  ?  :  0  ;
         ?     b     (?x)     1                 1       :  0  :  0  ;
         0     x     (?x)     1                 1       :  0  :  0  ;


        endtable

endprimitive


module C28SOI_PM_SENSOR_GO1_LR_MUX41 (Z, D0, D1, D2, D3, S0, S1);

        output Z;
        input D0;
        input D1;
        input D2;
        input D3;
        input S0;
        input S1;

        C28SOI_PM_SENSOR_GO1_LR_U_MUX2   U1 (INTERNAL1, D0, D1, S0) ;
        C28SOI_PM_SENSOR_GO1_LR_U_MUX2   U2 (INTERNAL2, D2, D3, S0) ;
        C28SOI_PM_SENSOR_GO1_LR_U_MUX2  U3 (Z, INTERNAL1, INTERNAL2, S1) ;



endmodule // C28SOI_PM_SENSOR_GO1_LR_MUX41


primitive C28SOI_PM_SENSOR_GO1_LR_U_POWER (Z, Z_NOPWR, GND_FINAL, VDD_FINAL);
        output Z;
        input  Z_NOPWR, GND_FINAL, VDD_FINAL;

        table
        //Z_NOPWR       GND_FINAL       VDD_FINAL        : Z
         0      1       1 :      0 ;
         1      1       1 :      1 ;
         X      1       1 :      X ;

        endtable

endprimitive

primitive C28SOI_PM_SENSOR_GO1_LR_U_NOTI (Qnew, Qold, NOTI_REG);

   output Qnew;
   input  Qold, NOTI_REG;
   reg Qnew ;
   table
                  //  Qold   NOTI_REG : Qnewtn : Qnewtn+1
                       (?0)      ?       :  ? : 0 ;
                       (?1)      ?       :  ? : 1 ;
                         ?       *       :  ? : x ;
  endtable
endprimitive


