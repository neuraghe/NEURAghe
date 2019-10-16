//SOFT RING
`ifdef functional
  `timescale 1ns / 100ps
  `delay_mode_distributed
`else
`endif


module C28SOI_PM_LOGICCPR_SOFTRC_LR_P0 (PDRCOut, PD_RC);

parameter PERIOD_LR_RC = 50;  //Period in ns

output PDRCOut;
input  PD_RC;
wire   [8:1] dly_in;
wire  rc_osc_i;
wire  dly_out;


C12T28SOI_LR_OR2X8_P0 U_OR (.Z(rc_osc_i), .A(PD_RC), .B(dly_out));
C12T28SOI_LR_BFX8_P0  U_BUF (.Z(PDRCOut), .A(rc_osc_i));

`ifdef functional
buf #(PERIOD_LR_RC*0.5) (rc_osc_i_del,rc_osc_i);
C28SOI_PM_LOGICCPR_SOFTRC_LR_P0_chain U0   ( .dly_in(rc_osc_i_del), .dly_outn(dly_in[1]) );
`else
C28SOI_PM_LOGICCPR_SOFTRC_LR_P0_chain U0   ( .dly_in(rc_osc_i), .dly_outn(dly_in[1]) );
`endif


C28SOI_PM_LOGICCPR_SOFTRC_LR_P0_chain U1   ( .dly_in(dly_in[1]), .dly_outn(dly_in[2]) );
C28SOI_PM_LOGICCPR_SOFTRC_LR_P0_chain U2   ( .dly_in(dly_in[2]), .dly_outn(dly_in[3]) );
C28SOI_PM_LOGICCPR_SOFTRC_LR_P0_chain U3   ( .dly_in(dly_in[3]), .dly_outn(dly_in[4]) );
C28SOI_PM_LOGICCPR_SOFTRC_LR_P0_chain U4   ( .dly_in(dly_in[4]), .dly_outn(dly_in[5]) );
C28SOI_PM_LOGICCPR_SOFTRC_LR_P0_chain U5   ( .dly_in(dly_in[5]), .dly_outn(dly_in[6]) );
C28SOI_PM_LOGICCPR_SOFTRC_LR_P0_chain U6   ( .dly_in(dly_in[6]), .dly_outn(dly_in[7]) );
C28SOI_PM_LOGICCPR_SOFTRC_LR_P0_chain U7   ( .dly_in(dly_in[7]), .dly_outn(dly_in[8]) );
C28SOI_PM_LOGICCPR_SOFTRC_LR_P0_chain U8   ( .dly_in(dly_in[8]), .dly_outn(dly_out) );

endmodule



module C28SOI_PM_LOGICCPR_SOFTRC_LR_P0_chain (dly_outn, dly_in);

output dly_outn;
input dly_in;
wire internal1,internal2,internal3,internal4,internal5;

C12T28SOI_LR_IVX8_P0 U1 (.Z(internal1), .A(dly_in));
C12T28SOI_LR_NOR2X7_P0 U2 (.Z(internal2), .A(internal1), .B(1'b0));
C12T28SOI_LR_AOI222X13_P0 U3 (.Z(internal3),.A(internal2), .B(1'b1), .C(1'b1), .D(1'b0), .E(1'b1), .F(1'b0));
C12T28SOI_LR_NAND2X13_P0 U4 (.Z(internal4),.B(internal3),.A(1'b1));
C12T28SOI_LR_FA1X8_P0 U5 ( .S0(),.CO(internal5), .A0(1'b0), .B0(1'b1) ,.CI(internal4) );
C12T28SOI_LR_IVX8_P0 U6 (.Z(dly_outn), .A(internal5));

endmodule
