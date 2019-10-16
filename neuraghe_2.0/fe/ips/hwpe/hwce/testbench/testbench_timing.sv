module testbench;

   timeunit 1ps;
   timeprecision 1ps;

   parameter PIPE_STAGES_MAC = 1;
   parameter PIPE_STAGES_ADD = 1;
   parameter AXI_WIDTH = 32;
   parameter CONV_WIDTH = 16;
   parameter FILTER_SIZE = 5;

   task tb_wait(input int cycles);
      #(cycles);
   endtask

   task tb_cyclewait(input int cycles);
      tb_wait(cycles*2500);
   endtask

   logic                  clk;
   logic                  rst_n;
   logic [FILTER_SIZE*FILTER_SIZE-1:0][CONV_WIDTH-1:0] weight;
   logic                  clear;
   logic                  y_out_TVALID_o;
   logic                  y_out_TREADY_i;
   logic [AXI_WIDTH  -1:0]       y_out_TDATA_o;
   logic [AXI_WIDTH/8-1:0]       y_out_TSTRB_o;
   logic [AXI_WIDTH/8-1:0]       y_out_TKEEP_o;
   logic                  y_out_TLAST_o;
   logic [1-1:0]          y_out_TID_o;
   logic [1-1:0]          y_out_TDEST_o;
   logic [1-1:0]          y_out_TUSER_o;
   logic                  x_in_TVALID_i;
   logic                  x_in_TREADY_o;
   logic [AXI_WIDTH  -1:0]       x_in_TDATA_i;
   logic [AXI_WIDTH/8-1:0]       x_in_TSTRB_i;
   logic [AXI_WIDTH/8-1:0]       x_in_TKEEP_i;
   logic                  x_in_TLAST_i;
   logic [1-1:0]          x_in_TID_i;
   logic [1-1:0]          x_in_TDEST_i;
   logic [1-1:0]          x_in_TUSER_i;
   logic                    y_in_TVALID_i;
   logic                    y_in_TREADY_o;
   logic [AXI_WIDTH  -1:0]  y_in_TDATA_i;
   logic [AXI_WIDTH/8-1:0]  y_in_TSTRB_i;
   logic [AXI_WIDTH/8-1:0]  y_in_TKEEP_i;
   logic                    y_in_TLAST_i;
   logic [1-1:0]   y_in_TID_i;
   logic [1-1:0]   y_in_TDEST_i;
   logic [1-1:0]   y_in_TUSER_i;

   hwce_engine_svsim #(
      .AXI_WIDTH      (AXI_WIDTH      ),
      .CONV_WIDTH     (CONV_WIDTH     ),
      .FILTER_SIZE    (FILTER_SIZE    ),
      .PIPE_STAGES_MAC(PIPE_STAGES_MAC),
      .PIPE_STAGES_ADD(PIPE_STAGES_ADD)
   )
   u_hwce (
      .clk,
      .rst_n,
      .weight,
      .clear,
      .y_out_TVALID_o,
      .y_out_TREADY_i,
      .y_out_TDATA_o,
      .y_out_TSTRB_o,
      .y_out_TKEEP_o,
      .y_out_TLAST_o,
      .y_out_TID_o,
      .y_out_TDEST_o,
      .y_out_TUSER_o,
      .x_in_TVALID_i,
      .x_in_TREADY_o,
      .x_in_TDATA_i,
      .x_in_TSTRB_i,
      .x_in_TKEEP_i,
      .x_in_TLAST_i,
      .x_in_TID_i,
      .x_in_TDEST_i,
      .x_in_TUSER_i,
      .y_in_TVALID_i,
      .y_in_TREADY_o,
      .y_in_TDATA_i,
      .y_in_TSTRB_i,
      .y_in_TKEEP_i,
      .y_in_TLAST_i,
      .y_in_TID_i,
      .y_in_TDEST_i,
      .y_in_TUSER_i
   );

   initial
   begin
      while(1) begin
         clk <= 1'b0;
         tb_wait(2500);
         clk <= 1'b1;
         tb_wait(2500);
      end
   end

   logic clk_assert;
   initial
   begin
      tb_wait(10);
      while(1) begin
         clk <= 1'b0;
         tb_wait(2500);
         clk <= 1'b1;
         tb_wait(2500);
      end
   end

   initial
   begin
      tb_wait(2500);
      $srandom(10);
      rst_n = 1'b0;
      clear = 1'b0;
      x_in_TSTRB_i = 2'h3;
      x_in_TKEEP_i = 2'h3;
      x_in_TLAST_i = 0;
      x_in_TDATA_i = 0;
      x_in_TVALID_i = 0;
      y_in_TSTRB_i = 2'h3;
      y_in_TKEEP_i = 2'h3;
      y_in_TLAST_i = 0;
      y_in_TDATA_i = 0;
      y_in_TVALID_i = 0;
      for (int i=0; i<FILTER_SIZE*FILTER_SIZE; i++) begin
         weight[i] = $urandom();
      end
      tb_cyclewait(5);
      rst_n = 1'b1;
      while (1) begin
         automatic integer tmp = $urandom();
         x_in_TDATA_i = $urandom();
         y_in_TDATA_i = 0;
         x_in_TVALID_i = tmp[0];
         y_in_TVALID_i = tmp[0];
         tb_cyclewait(1);
      end
   end

   initial
   begin
      while(1) begin
         clear = 1'b0;
         tb_cyclewait(1000);
         clear = 1'b1;
         tb_cyclewait(100);
      end
   end

   // logic [1:0][FILTER_SIZE*FILTER_SIZE-1:0][16-1:0] x_filter_tb;
   // always_ff @(posedge clk)
   // begin
   //    x_filter_tb <= u_hwce.x_filter;
   // end
   // logic [1:0][FILTER_SIZE*FILTER_SIZE-1:0][CONV_WIDTH-1:0] mac_tb_prepipe;
   // logic [1:0][FILTER_SIZE*FILTER_SIZE-1:0][CONV_WIDTH-1:0] mac_tb;
   // always_ff @(posedge clk)
   // begin
   //    for(int i=0; i<FILTER_SIZE*FILTER_SIZE; i++) begin
   //       automatic logic [32-1:0] tmp0;
   //       automatic logic [32-1:0] tmp1;
   //       tmp1 = x_filter_tb[1][i]*weight[i];
   //       tmp0 = x_filter_tb[0][i]*weight[i];
   //       mac_tb_prepipe[1][i] = tmp1[24-1:8];
   //       mac_tb_prepipe[0][i] = tmp0[24-1:8];
   //    end
   // end

   // logic [PIPE_STAGES_MAC-1:0][1:0][FILTER_SIZE*FILTER_SIZE-1:0][CONV_WIDTH-1:0] mac_tb_pipe;
   // always_ff @(negedge clk)
   // begin
   //    mac_tb_pipe[0] <= mac_tb_prepipe;
   //    for (int i=1; i<PIPE_STAGES_MAC; i++)
   //       mac_tb_pipe[i] <= mac_tb_pipe[i-1];
   // end
   // always_comb
   // begin
   //    if(PIPE_STAGES_MAC>0)
   //       mac_tb <= mac_tb_pipe[PIPE_STAGES_MAC-1];
   //    else
   //       mac_tb <= mac_tb_prepipe;
   // end
   // logic [1:0][CONV_WIDTH-1:0] sum_tb_prepipe;
   // logic [1:0][CONV_WIDTH-1:0] sum_tb;
   // logic [PIPE_STAGES_ADD-1:0][1:0][CONV_WIDTH-1:0] sum_tb_pipe;
   // always_comb
   // begin
   //    sum_tb_prepipe = 0;
   //    for (int i=0; i<FILTER_SIZE*FILTER_SIZE; i++) begin
   //       sum_tb_prepipe[1] = sum_tb_prepipe[1]+u_hwce.mac[1][i];
   //       sum_tb_prepipe[0] = sum_tb_prepipe[0]+u_hwce.mac[0][i];
   //    end
   // end
   // always_ff @(posedge clk)
   // begin
   //    sum_tb_pipe[0] <= sum_tb_prepipe;
   //    for (int i=1; i<PIPE_STAGES_ADD; i++)
   //       sum_tb_pipe[i] <= sum_tb_pipe[i-1];
   // end
   // always_comb
   // begin
   //    if(PIPE_STAGES_ADD>0)
   //       sum_tb <= sum_tb_pipe[PIPE_STAGES_ADD-1];
   //    else
   //       sum_tb <= sum_tb_prepipe;
   // end

   // assert property (@(posedge clk_assert) u_hwce.valid_add==1'b1 |-> u_hwce.mac==mac_tb);
   // assert property (@(posedge clk_assert) u_hwce.valid_out==1'b1 |-> u_hwce.y_out==sum_tb);
   // assert property (@(negedge clk) u_hwce.line_buffer_ready==1'b0 |-> u_hwce.mac==0);

   // int count_in;
   // always_ff @(posedge clk)
   // begin
   //    if (rst_n==1'b0) begin
   //       count <= 0;
   //    end
   //    else begin
   //       if ()
   //    end
   // end

endmodule
