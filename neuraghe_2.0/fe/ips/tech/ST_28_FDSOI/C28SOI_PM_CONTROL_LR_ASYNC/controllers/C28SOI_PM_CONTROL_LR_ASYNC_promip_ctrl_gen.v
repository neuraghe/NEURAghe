// --=========================================================================--
//   Copyright (C) 2007 STMicroelectronics - All rights reserved
//
//                              COMPANY RESTRICTED
//
// No part of this document can be copied, or reproduced, or translated, or
// stored on electronic storage without the written agreement of 
// STMicroelectronics.
// -----------------------------------------------------------------------------
// File Name       : C28SOI_PM_CONTROL_LR_ASYNC_promip_ctrl_gen.v
// Netlist version : 3.1
// Done by         : AB
// Modified        : 04th May 09
// -----------------------------------------------------------------------------
// Purpose         : clock selector
// --=========================================================================--

module C28SOI_PM_CONTROL_LR_ASYNC_promip_ctrl_gen (
 tck,
 pclk,
 mode,
 clk_out,
 tck_out,
 pclk_out,
 trst_n,
 presetn,
 reset_out,
 trst_n_out,
 presetn_out,
 apb_enable,
// tst_gated_clk1, // clock gating cell test/scan enable
 tcr_muxclk_mode,
 tst_reset_mux0, 
 debug_enable,
 parallel_enable,
 jtag_enable
 );

   /*----------------------
     Parameters declaration
     ----------------------*/
     // Operating modes
     parameter k_APBIF_MODE  = 2'b00;
     parameter k_JTAGIF_MODE = 2'b01;
     parameter k_DEBUG_MODE  = 2'b10;
     parameter k_PARALLEL_MODE  = 2'b11;

input tck;
input pclk;
input [1:0] mode;
input trst_n;
input presetn;

output clk_out;
output tck_out;
output pclk_out;

output reset_out;
output trst_n_out;
output presetn_out;

output apb_enable;
//input tst_gated_clk1; // clock gating cell test/scan enable
input tcr_muxclk_mode;
input tst_reset_mux0;
output debug_enable;
output parallel_enable;
output jtag_enable;
//ST
//reg reset_out;
//reg trst_n_out;
//reg presetn_out;
wire reset_out;
wire trst_n_out;
wire presetn_out;
   
reg apb_enable;
reg jtag_enable;
reg debug_enable;
reg parallel_enable;

wire i_clk;
wire i_rst; //ST
wire i_trstn; //ST
wire i_presetn;//ST
wire w_tck;
wire w_pclk;
  
wire i_apb_mode;

C28SOI_PM_CONTROL_LR_ASYNC_clock_gating_cell u_C28SOI_PM_CONTROL_LR_ASYNC_tck_gen  (.CP(tck), .E(jtag_enable), .Q(w_tck));
C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock u_ck_tck_test (.D0(w_tck), .D1(pclk), .sel(tcr_muxclk_mode), .z(tck_out));
C28SOI_PM_CONTROL_LR_ASYNC_clock_gating_cell u_C28SOI_PM_CONTROL_LR_ASYNC_pclk_gen (.CP(pclk), .E(apb_enable), .Q(w_pclk));
C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock u_ck_pclk_test (.D0(w_pclk), .D1(pclk), .sel(tcr_muxclk_mode), .z(pclk_out));

C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_reset  u_trst_sel1(.D0(1'b0), .D1(trst_n), .sel(jtag_enable), .z(i_trstn)); 
C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_reset  u_trst_sel0(.D0(i_trstn), .D1(trst_n), .sel(tst_reset_mux0), .z(trst_n_out)); 

C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_reset  u_preset_sel1(.D0(1'b0), .D1(presetn), .sel(apb_enable), .z(i_presetn));    
C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_reset  u_preset_sel0(.D0(i_presetn), .D1(presetn), .sel(tst_reset_mux0), .z(presetn_out)); 

   

assign i_apb_mode = ~(mode[0] | mode[1]);

C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock u_ck_sel0 (.D0(tck), .D1(pclk), .sel(i_apb_mode), .z(i_clk));
C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock u_ck_sel1 (.D0(i_clk), .D1(pclk), .sel(tcr_muxclk_mode), .z(clk_out));


C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_reset u_rst_sel1(.D0(trst_n), .D1(presetn), .sel(i_apb_mode), .z(i_rst));  
C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_reset u_rst_sel0(.D0(i_rst), .D1(presetn), .sel(tst_reset_mux0), .z(reset_out));  


   
always @(mode) begin
   apb_enable = 1'b0;
   jtag_enable = 1'b0;
   debug_enable = 1'b0;
   parallel_enable = 1'b0;
   if (mode == k_APBIF_MODE) begin
      apb_enable = 1'b1;
   end   
   else if(mode == k_DEBUG_MODE) begin
      //jtag_enable = 1'b1;
      parallel_enable = 1'b1;
      debug_enable = 1'b1;
   end   
   else if(mode == k_PARALLEL_MODE) begin
      parallel_enable = 1'b1;
   end
   else begin
      jtag_enable = 1'b1;
   end   
end

endmodule

