module testbench;

   parameter PIPE_STAGES_MAC = 1;
   parameter PIPE_STAGES_ADD = 1;
   parameter AXI_WIDTH = 32;
   parameter CONV_WIDTH = 16;
   parameter FILTER_SIZE = 5;

   task tb_wait(input int cycles);
      #(cycles);
   endtask

   logic                  clk;
   logic                  rst_n;
   logic signed [FILTER_SIZE*FILTER_SIZE-1:0][CONV_WIDTH-1:0] weight;
   logic                  clear;
   logic                  start;
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

   hwce_engine #(
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
      .start,
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
         tb_wait(5);
         clk <= 1'b1;
         tb_wait(5);
      end
   end

   logic clk_assert;
   initial
   begin
      tb_wait(1);
      while(1) begin
         clk_assert <= 1'b0;
         tb_wait(5);
         clk_assert <= 1'b1;
         tb_wait(5);
      end
   end

   logic ex_x_in_TREADY_o;
   logic ex_y_in_TREADY_o;
   always_ff @(posedge clk)
   begin
      ex_y_in_TREADY_o <= y_in_TREADY_o;
      ex_x_in_TREADY_o <= x_in_TREADY_o;
   end

   initial
   begin
      int count;
      $srandom(10);
      rst_n = 1'b0;
      clear = 1'b0;
      start = 1'b0;
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
      y_out_TREADY_i = 1;
      for (int i=0; i<FILTER_SIZE*FILTER_SIZE; i++) begin
         weight[i] = $urandom();
      end
      tb_wait(25);
      rst_n = 1'b1;
      tb_wait(10);
      start = 1'b1;
      clear = 1'b0;
      // test 1: SOME INVALID INPUTS, ALWAYS READY
      count = 0;
      while(count<500) begin
         automatic integer tmp0 = $urandom();
         automatic integer tmp1 = $urandom();
         automatic integer tmp2 = $urandom();
         if(ex_y_in_TREADY_o == 1'b1) begin
            y_in_TDATA_i  = 0;
            y_in_TVALID_i = tmp2[0];
         end
         if(ex_x_in_TREADY_o == 1'b1) begin
            x_in_TDATA_i  = tmp0;
            x_in_TVALID_i = tmp2[1];
         end
         if(y_out_TVALID_o == 1)
            count++;
         tb_wait(10);
      end
      clear = 1'b1;
      tb_wait(1000);
      clear = 1'b0;
      // test 2: ALL VALID INPUTS, SOMETIMES NOT READY
      count = 0;
      while(count<500) begin
         automatic integer tmp0 = $urandom();
         automatic integer tmp1 = $urandom();
         automatic integer tmp2 = $urandom();
         if(ex_y_in_TREADY_o == 1'b1) begin
            y_in_TDATA_i  = 0;
            y_in_TVALID_i = 1'b1;
         end
         if(ex_x_in_TREADY_o == 1'b1) begin
            x_in_TDATA_i  = tmp0;
            x_in_TVALID_i = 1'b1;
         end
         y_out_TREADY_i = tmp2[0];
         if(y_out_TVALID_o == 1)
            count++;
         tb_wait(10);
      end
      clear = 1'b1;
      tb_wait(1000);
      clear = 1'b0;
      // test 3: SOME INVALID INPUTS, SOMETIMES NOT READY
      count = 0;
      while(count<500) begin
         automatic integer tmp0 = $urandom();
         automatic integer tmp1 = $urandom();
         automatic integer tmp2 = $urandom();
         if(ex_y_in_TREADY_o == 1'b1) begin
            y_in_TDATA_i  = 0;
            y_in_TVALID_i = tmp2[0];
         end
         if(ex_x_in_TREADY_o == 1'b1) begin
            x_in_TDATA_i  = tmp0;
            x_in_TVALID_i = tmp2[1];
         end
         y_out_TREADY_i = tmp2[0];
         if(y_out_TVALID_o == 1)
            count++;
         tb_wait(10);
      end
      clear = 1'b1;
      tb_wait(1000);
      clear = 1'b0;
      // test 4: YIN NOT ZERO
      count = 0;
      while(count<500) begin
         automatic integer tmp0 = $urandom();
         automatic integer tmp1 = $urandom();
         automatic integer tmp2 = $urandom();
         if(ex_y_in_TREADY_o == 1'b1) begin
            if(u_hwce.line_buffer_ready == 1'b1)
               y_in_TDATA_i  = tmp1;
            else
               y_in_TDATA_i  = 0;
            y_in_TVALID_i = 1'b1;
         end
         if(ex_x_in_TREADY_o == 1'b1) begin
            x_in_TDATA_i  = tmp0;
            x_in_TVALID_i = 1'b1;
         end
         y_out_TREADY_i = 1'b1;
         if(y_out_TVALID_o == 1)
            count++;
         tb_wait(10);
      end
      clear = 1'b1;
      tb_wait(1000);
      clear = 1'b0;
      // test 5: ALL THE PREVIOUS PROBLEMS!
      count = 0;
      while(count<500) begin
         automatic integer tmp0 = $urandom();
         automatic integer tmp1 = $urandom();
         automatic integer tmp2 = $urandom();
         if(ex_y_in_TREADY_o == 1'b1) begin
            if(u_hwce.line_buffer_ready == 1'b1)
               y_in_TDATA_i  = tmp1;
            else
               y_in_TDATA_i  = 0;
            y_in_TVALID_i = tmp2[0];
         end
         if(ex_x_in_TREADY_o == 1'b1) begin
            x_in_TDATA_i  = tmp0;
            x_in_TVALID_i = tmp2[1];
         end
         y_out_TREADY_i = tmp2[2];
         if(y_out_TVALID_o == 1)
            count++;
         tb_wait(10);
      end
      clear = 1'b1;
      tb_wait(1000);
      clear = 1'b0;
      $finish();
   end

   logic signed [1:0][FILTER_SIZE*FILTER_SIZE-1:0][16-1:0] x_filter_tb;
   always_comb
   begin
      x_filter_tb <= u_hwce.x_filter;
   end
   logic signed [1:0][FILTER_SIZE*FILTER_SIZE-1:0][CONV_WIDTH-1:0] mac_tb_prepipe;
   logic signed [1:0][FILTER_SIZE*FILTER_SIZE-1:0][CONV_WIDTH-1:0] mac_tb;
   always_ff @(posedge clk or negedge rst_n)
   begin
      if (rst_n==1'b0) begin
         mac_tb_prepipe <= 0;
         mac_tb_prepipe <= 0;
         mac_tb_prepipe <= 0;
         mac_tb_prepipe <= 0;
      end
      else if (y_out_TREADY_i==1'b1) begin
         for(int i=0; i<FILTER_SIZE*FILTER_SIZE; i++) begin
            automatic logic signed [15:0] weight_tmp;
            automatic logic signed [15:0] x_tmp0;
            automatic logic signed [15:0] x_tmp1;
            automatic logic signed [32-1:0] tmp0;
            automatic logic signed [32-1:0] tmp1;
            weight_tmp = weight[i];
            x_tmp1 = x_filter_tb[1][i];
            x_tmp0 = x_filter_tb[0][i];
            tmp1 = x_tmp1*weight_tmp;
            tmp0 = x_tmp0*weight_tmp;
            mac_tb_prepipe[1][i][15]   <= tmp1[32-1];
            mac_tb_prepipe[0][i][15]   <= tmp0[32-1];
            mac_tb_prepipe[1][i][14:0] <= tmp1[24-2:8];
            mac_tb_prepipe[0][i][14:0] <= tmp0[24-2:8];
         end
      end
   end

   logic signed [PIPE_STAGES_MAC-1:0][1:0][FILTER_SIZE*FILTER_SIZE-1:0][CONV_WIDTH-1:0] mac_tb_pipe;
   always_ff @(posedge clk or negedge rst_n)
   begin
      if (rst_n==1'b0)
         mac_tb_pipe[0] <= 0;
      else if (y_out_TREADY_i==1'b1)
         mac_tb_pipe[0] <= mac_tb_prepipe;
   end
   always_ff @(posedge clk or negedge rst_n)
   begin
      if(rst_n==1'b0) begin
         for (int i=1; i<PIPE_STAGES_MAC; i++)
            mac_tb_pipe[i] <= 0;
      end
      else if (y_out_TREADY_i==1'b1) begin
         for (int i=1; i<PIPE_STAGES_MAC; i++)
            mac_tb_pipe[i] <= mac_tb_pipe[i-1];
      end
   end
   generate
      if(PIPE_STAGES_MAC>0)
         always_comb
            mac_tb <= mac_tb_pipe[PIPE_STAGES_MAC-1];
      else
         always_comb
            mac_tb <= mac_tb_prepipe;
   endgenerate

   logic signed [PIPE_STAGES_MAC+1:0][32-1:0] y_in_tb_pipe;
   always_ff @(posedge clk or negedge rst_n)
   begin : y_in_tb_pipe_seq
      if (rst_n==1'b0) begin
         y_in_tb_pipe <= 0;
      end
      else if (y_out_TREADY_i==1'b1) begin
         y_in_tb_pipe[0] <= y_in_TDATA_i;
         for(int i=1; i<PIPE_STAGES_MAC+2; i++) begin
            y_in_tb_pipe[i] <= y_in_tb_pipe[i-1];
         end
      end
   end

   logic signed [1:0][CONV_WIDTH-1:0] sum_tb_prepipe;
   logic signed [1:0][CONV_WIDTH-1:0] sum_tb;
   logic signed [PIPE_STAGES_ADD-1:0][1:0][CONV_WIDTH-1:0] sum_tb_pipe;
   logic signed [1:0][CONV_WIDTH-1:0] y_in_tb_int;
   always_comb
   begin
      y_in_tb_int[1] = y_in_tb_pipe[PIPE_STAGES_MAC+1][31:16];
      y_in_tb_int[0] = y_in_tb_pipe[PIPE_STAGES_MAC+1][15: 0];
   end
   always_comb
   begin
      sum_tb_prepipe = 0;
      sum_tb_prepipe[1] += y_in_tb_int[1];
      sum_tb_prepipe[0] += y_in_tb_int[0];
      for (int i=0; i<FILTER_SIZE*FILTER_SIZE; i++) begin
         sum_tb_prepipe[1] = sum_tb_prepipe[1] + u_hwce.mac[1][i];
         sum_tb_prepipe[0] = sum_tb_prepipe[0] + u_hwce.mac[0][i];
      end
   end
   always_ff @(posedge clk)
   begin
      if (y_out_TREADY_i==1'b1) begin
         sum_tb_pipe[0] <= sum_tb_prepipe;
         for (int i=1; i<PIPE_STAGES_ADD; i++)
            sum_tb_pipe[i] <= sum_tb_pipe[i-1];
      end
   end
   always_comb
   begin
      if(PIPE_STAGES_ADD>0)
         sum_tb <= sum_tb_pipe[PIPE_STAGES_ADD-1];
      else
         sum_tb <= sum_tb_prepipe;
   end

   assert property (@(posedge clk_assert) u_hwce.valid_add==1'b1 |-> u_hwce.mac==mac_tb);
   assert property (@(posedge clk_assert) u_hwce.valid_out==1'b1 |-> u_hwce.y_out_int==sum_tb);

endmodule
