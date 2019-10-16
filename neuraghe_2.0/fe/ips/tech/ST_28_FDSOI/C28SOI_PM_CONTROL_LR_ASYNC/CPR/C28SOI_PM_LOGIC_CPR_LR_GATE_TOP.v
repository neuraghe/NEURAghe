module C28SOI_PM_LOGIC_CPR_LR_GATE_TOP ( LOGICCPR_1,LOGICCPR_2,LOGICCPR_3,LOGICCPR_4,PD_1,PD_2,PD_3,PD_4,RN,DIVSPEED0,DIVSPEED1,DIVRC0,DIVRC1,trans_clk,tcr_muxclk_mode);

output LOGICCPR_1, LOGICCPR_2, LOGICCPR_3, LOGICCPR_4;
input PD_1,PD_2,PD_3,PD_4, RN, DIVSPEED0, DIVSPEED1, DIVRC0, DIVRC1,trans_clk,tcr_muxclk_mode;

parameter PERIOD_LR_1 = 50;  //Period in ns
parameter PERIOD_LR_2 = 50;  //Period in ns
parameter PERIOD_LR_3 = 50;  //Period in ns
parameter PERIOD_LR_4 = 50;  //Period in ns

reg LOGICCPR_1_i, LOGICCPR_2_i, LOGICCPR_3_i, LOGICCPR_4_i;

wire [1:0]divrc;
wire [1:0]divspeed;

wire cpr_osc1_i;
wire cpr_osc2_i;
wire cpr_osc3_i;
wire cpr_osc4_i;

wire cpr_osc1_i_after_mux;
wire cpr_osc2_i_after_mux;
wire cpr_osc3_i_after_mux;
wire cpr_osc4_i_after_mux;


reg [1:0]cnt_1;
reg [1:0]cnt_2;
reg [1:0]cnt_3;
reg [1:0]cnt_4;

C28SOI_PM_LOGICCPR_LR_P0   #(.PERIOD_SPEEDO(PERIOD_LR_1))  u_cpr_1 (.PD0Out(cpr_osc1_i), .PDLPB0(PD_1));
C28SOI_PM_LOGICCPR_LR_P4   #(.PERIOD_SPEEDO(PERIOD_LR_2))  u_cpr_2 (.PD4Out(cpr_osc2_i), .PDLPB4(PD_2));
C28SOI_PM_LOGICCPR_LR_P10  #(.PERIOD_SPEEDO(PERIOD_LR_3))  u_cpr_3 (.PD10Out(cpr_osc3_i),.PDLPB10(PD_3));


// Use behavorial model of C28SOI_PM_LOGICCPR_SOFTRC_LR_P0  for simulation and  netlist for synthesis
C28SOI_PM_LOGICCPR_SOFTRC_LR_P0 #(.PERIOD_LR_RC(PERIOD_LR_4))  u_cpr_4 (.PDRCOut(cpr_osc4_i), .PD_RC(PD_4));

assign divspeed[1:0] = {DIVSPEED1,DIVSPEED0}; 
assign divrc[1:0] = {DIVRC1,DIVRC0}; 

C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock 
      u_cpr_ring1_clk_mux (
        .D0(cpr_osc1_i),
        .D1(trans_clk),
        .sel(tcr_muxclk_mode),
        .z(cpr_osc1_i_after_mux));


C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock 
      u_cpr_ring2_clk_mux (
        .D0(cpr_osc2_i),
        .D1(trans_clk),
        .sel(tcr_muxclk_mode),
        .z(cpr_osc2_i_after_mux));

C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock 
      u_cpr_ring3_clk_mux (
        .D0(cpr_osc3_i),
        .D1(trans_clk),
        .sel(tcr_muxclk_mode),
        .z(cpr_osc3_i_after_mux));

C28SOI_PM_CONTROL_LR_ASYNC_mux2v1ninv_clock 
      u_cpr_ring4_clk_mux (
        .D0(cpr_osc4_i),
        .D1(trans_clk),
        .sel(tcr_muxclk_mode),
        .z(cpr_osc4_i_after_mux));


//-----------------------------------
//-- output divider for cpr_osc1 --
//-----------------------------------

always @(posedge cpr_osc1_i_after_mux or negedge RN) begin
 if (RN == 1'b0)  begin
                        LOGICCPR_1_i  <= 1'b0;
                        cnt_1 <= 2'b00;
                  end   
 else     begin
                 if (cnt_1 == divspeed) begin
                      LOGICCPR_1_i <= ~LOGICCPR_1_i;
                      cnt_1 <= 2'b00;
                      end
                 else
                      cnt_1 <= cnt_1 + 2'b01;
          end      
end


//-----------------------------------
//-- output divider for cpr_osc2 --
//-----------------------------------
always @(posedge cpr_osc2_i_after_mux or negedge RN) begin
 if (RN == 1'b0)  begin
                        LOGICCPR_2_i <= 1'b0;
                        cnt_2 <= 2'b00;
                  end   
 else     begin
                 if (cnt_2 == divspeed) begin
                      LOGICCPR_2_i <= ~LOGICCPR_2_i;
                      cnt_2 <= 2'b00;
                      end
                 else
                      cnt_2 <= cnt_2 + 2'b01;
          end      
end

//-----------------------------------
//-- output divider for cpr_osc3 --
//-----------------------------------

always @(posedge cpr_osc3_i_after_mux or negedge RN) begin
 if (RN == 1'b0)  begin
                        LOGICCPR_3_i <= 1'b0;
                        cnt_3 <= 2'b00;
                  end   
 else     begin
                 if (cnt_3 == divspeed) begin
                      LOGICCPR_3_i <= ~LOGICCPR_3_i;
                      cnt_3 <= 2'b00;
                      end
                 else
                      cnt_3 <= cnt_3 + 2'b01;
          end      
end



//-------------------------------
//-- output divider for cpr_osc4 --
//-------------------------------

always @(posedge cpr_osc4_i_after_mux or negedge RN) begin
 if (RN == 1'b0)  begin
  			LOGICCPR_4_i <= 1'b0;
  			cnt_4 <= 2'b00; 
  		  end
 else     begin
                 if (cnt_4 == divrc) begin 
                      LOGICCPR_4_i <= ~LOGICCPR_4_i;
                      cnt_4 <= 2'b00;
                      end
                 else
                      cnt_4 <= cnt_4 + 2'b01;
          end 
end

assign LOGICCPR_1 = LOGICCPR_1_i;
assign LOGICCPR_2 = LOGICCPR_2_i;
assign LOGICCPR_3 = LOGICCPR_3_i;
assign LOGICCPR_4 = LOGICCPR_4_i;
 
endmodule

