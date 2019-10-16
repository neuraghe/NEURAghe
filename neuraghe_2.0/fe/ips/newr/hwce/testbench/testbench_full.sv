/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           testbench_full.sv                                          *
 * Description:    Testbench for shared-memory HWCE                           *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"
`include "hwpe_axi_params.sv"
//`include "vector.sv"
`timescale 1ns/10ps

module testbench;
   parameter real P_STALL = 0.5;
   parameter N_COMPETING = 4;
   parameter REAL_CONTENTION = 0;
   parameter bit  MEMORY  = 0;
   parameter int unsigned N_HW_ACC       = 1;
   parameter int unsigned N_HW_ACC_PORT  = 3;
   parameter int unsigned BASE_ADDR      = 0;
   parameter PIPE_STAGES_MAC  = 1;
   parameter PIPE_STAGES_ADD  = 1;
   parameter LINEBUFFER_KIND  = 1;
   parameter LATCH_REGFILE    = 1;
   parameter LATCH_FIFO       = 0;
   parameter LATCH_LINEBUFFER = 1;
   parameter TIME_MUX_FACTOR  = 2;
   parameter int unsigned C_SEED_A = 1654;
   parameter int unsigned C_SEED_B = 345;
   parameter TIMING = 0;
   parameter FILTER_SIZE = 5;
   parameter LINEBUFFER_WIDTH = 32;
   parameter NB_ITERATIONS = 10;

   // HW_ACC wires
   logic [N_HW_ACC_PORT*N_HW_ACC*(32)   - 1:0] hw_acc_data_add    ;
   logic [N_HW_ACC_PORT*N_HW_ACC*(30)   - 1:0] hw_acc_data_add_dummymem;
   logic [N_HW_ACC_PORT*N_HW_ACC*32/8   - 1:0] hw_acc_data_be     ;
   logic [N_HW_ACC_PORT*N_HW_ACC*32     - 1:0] hw_acc_data_data   ;
   logic [N_HW_ACC_PORT*N_HW_ACC        - 1:0] hw_acc_data_gnt    ;
   logic [N_HW_ACC_PORT*N_HW_ACC        - 1:0] hw_acc_data_type   ;
   logic [N_HW_ACC_PORT*N_HW_ACC        - 1:0] hw_acc_data_req    ;
   // logic [N_HW_ACC_PORT*N_HW_ACC*2      - 1:0] hw_acc_data_src    ;
   logic [N_HW_ACC_PORT*N_HW_ACC*32     - 1:0] hw_acc_data_r_data ;
   // logic [N_HW_ACC_PORT*N_HW_ACC*8      - 1:0] hw_acc_data_r_opc  ;
   logic [N_HW_ACC_PORT*N_HW_ACC        - 1:0] hw_acc_data_r_req  ;
   // logic [N_HW_ACC_PORT*N_HW_ACC*2      - 1:0] hw_acc_data_r_src  ;
   logic [N_HW_ACC*(32-2)               - 1:0] hw_acc_cfg_add     ;
   logic [N_HW_ACC*32/8                 - 1:0] hw_acc_cfg_be      ;
   logic [N_HW_ACC*32                   - 1:0] hw_acc_cfg_data    ;
   logic [N_HW_ACC                      - 1:0] hw_acc_cfg_gnt     ;
   logic [N_HW_ACC                      - 1:0] hw_acc_cfg_type    ;
   logic [N_HW_ACC                      - 1:0] hw_acc_cfg_req     ;
   logic [N_HW_ACC*2                    - 1:0] hw_acc_cfg_ID     ;
   logic [N_HW_ACC*32                   - 1:0] hw_acc_cfg_r_data  ;
   // logic [N_HW_ACC*8                    - 1:0] hw_acc_cfg_r_opc   ;
   logic [N_HW_ACC                      - 1:0] hw_acc_cfg_r_req   ;
   logic [N_HW_ACC*2                    - 1:0] hw_acc_cfg_r_ID   ;
   logic [N_HW_ACC_PORT*N_HW_ACC*(32)   - 1:0] hw_acc_data_data_inv    ;
   logic [N_HW_ACC_PORT*N_HW_ACC*32     - 1:0] hw_acc_data_r_data_inv ;
   logic clk_dut;

   // clk and reset
   logic clk;
   logic clk_acc;
   logic rst_n;
   bit   sim_end;

   logic dump_s;
   logic event_s;

   // One HW_ACC wrapper per ACC
   genvar i;
   generate
      for (i=0; i<N_HW_ACC; i++)
      begin : hwce_top_gen
         hwce_top 
         #(
            .FILTER_SIZE         (FILTER_SIZE     ),
            .PIPE_STAGES_MAC     (PIPE_STAGES_MAC ),
            .PIPE_STAGES_ADD     (PIPE_STAGES_ADD ),
            .TIME_MUX_FACTOR     (TIME_MUX_FACTOR ),
            .LINEBUFFER_KIND     (LINEBUFFER_KIND ),
            .LATCH_FIFO          (LATCH_FIFO      ),
            .LATCH_REGFILE       (LATCH_REGFILE   ),
            .LATCH_LINEBUFFER    (LATCH_LINEBUFFER),
            .LINEBUFFER_WIDTH    (LINEBUFFER_WIDTH)
         )
         DUT (
            .clk             (clk_dut),
            .rst_n           (rst_n),
            .tcdm_add_o      (hw_acc_data_add   [(i+1)*N_HW_ACC_PORT*32 - 1   : i*N_HW_ACC_PORT*32]),
            .tcdm_be_o       (hw_acc_data_be    [(i+1)*N_HW_ACC_PORT*32/8 - 1 : i*N_HW_ACC_PORT*32/8]),
            .tcdm_data_o     (hw_acc_data_data  [(i+1)*N_HW_ACC_PORT*32 - 1   : i*N_HW_ACC_PORT*32]),
            .tcdm_gnt_i      (hw_acc_data_gnt   [(i+1)*N_HW_ACC_PORT - 1      : i*N_HW_ACC_PORT]),
            .tcdm_type_o     (hw_acc_data_type  [(i+1)*N_HW_ACC_PORT - 1      : i*N_HW_ACC_PORT]),
            .tcdm_req_o      (hw_acc_data_req   [(i+1)*N_HW_ACC_PORT - 1      : i*N_HW_ACC_PORT]),
            .tcdm_r_data_i   (hw_acc_data_r_data[(i+1)*N_HW_ACC_PORT*32 - 1   : i*N_HW_ACC_PORT*32]),
            .tcdm_r_valid_i  (hw_acc_data_r_req [(i+1)*N_HW_ACC_PORT - 1      : i*N_HW_ACC_PORT]),
            .cfg_add_i       ({hw_acc_cfg_add    [(i+1)*30 - 1                : i*30],2'b0}),
            .cfg_be_i        (hw_acc_cfg_be     [(i+1)*32/8 - 1               : i*32/8]),
            .cfg_data_i      (hw_acc_cfg_data   [(i+1)*32 - 1                 : i*32]),
            .cfg_gnt_o       (hw_acc_cfg_gnt    [i]),
            .cfg_type_i      (hw_acc_cfg_type   [i]),
            .cfg_req_i       (hw_acc_cfg_req    [i]),
            .cfg_ID_i        (hw_acc_cfg_ID     [(i+1)*2 - 1                  : i*2]),
            .cfg_r_data_o    (hw_acc_cfg_r_data [(i+1)*32 - 1                 : i*32]),
            .cfg_r_valid_o   (hw_acc_cfg_r_req  [i]),
            .cfg_r_ID_o      (hw_acc_cfg_r_ID   [(i+1)*2 - 1                  : i*2]),
            .evt_interrupt_o (event_s)
         );
      end
      if (TIMING==0)
         assign clk_dut = clk;
      else
         initial begin
            #6000ps;
            while(1) begin
               #4000ps clk_dut = 1'b0;
               #4000ps clk_dut = 1'b1;
            end
         end
            
   endgenerate

   genvar j,k;
   generate

      // endianness inversion
      for(j=0; j<N_HW_ACC_PORT; j++)
         for(k=0; k<N_HW_ACC; k++) begin
            logic [31:0] tmp;
            assign tmp = hw_acc_data_r_data_inv[j*N_HW_ACC*32+(k+1)*32-1:j*N_HW_ACC*32+k*32];
            assign hw_acc_data_r_data[j*N_HW_ACC*32+(k+1)*32-1:j*N_HW_ACC*32+k*32] = {tmp[15:0], tmp[31:16]};
         end
      for(j=0; j<N_HW_ACC_PORT; j++)
         for(k=0; k<N_HW_ACC; k++) begin
            logic [31:0] tmp;
            assign tmp = hw_acc_data_data[j*N_HW_ACC*32+(k+1)*32-1:j*N_HW_ACC*32+k*32];
            assign hw_acc_data_data_inv[j*N_HW_ACC*32+(k+1)*32-1:j*N_HW_ACC*32+k*32] = {tmp[15:0], tmp[31:16]};
         end
 
      if(REAL_CONTENTION==0) begin : dummy_mem_gen
         dummy_memory #(
            .N_HW_ACC_PORT (3),
            .MEM_SIZE      (32'h100000),
            .RANDOM_VALUES (0),
            .SPECIAL_INIT  (1),
            .P_STALL       (P_STALL)
         ) u_dummy_memory (
            .clk            (clk),
            .rst_n          (rst_n),
            .add            (hw_acc_data_add_dummymem),
            .be             (hw_acc_data_be),
            .req            (hw_acc_data_req),
            .din            (hw_acc_data_data_inv),
            .gnt            (hw_acc_data_gnt),
            .opc            (hw_acc_data_type),
            .src_i          (),
            .dout           (hw_acc_data_r_data_inv),
            .err            (),
            .valid          (hw_acc_data_r_req),
            .src_o          (),
            .dump           (dump_s)
         );
      end
      else begin : contention_mem_gen
         contention_memory #(
            .N_HW_ACC_PORT (3),
            .MEM_SIZE      (32'h100000),
            .RANDOM_VALUES (0),
            .SPECIAL_INIT  (1),
            .N_BANKS       (16),
            .N_COMPETING   (N_COMPETING),
            .P_TRANSACTION (P_STALL)
         ) u_dummy_memory (
            .clk            (clk),
            .rst_n          (rst_n),
            .add            (hw_acc_data_add_dummymem),
            .be             (hw_acc_data_be),
            .req            (hw_acc_data_req),
            .din            (hw_acc_data_data_inv),
            .gnt            (hw_acc_data_gnt),
            .opc            (hw_acc_data_type),
            .src_i          (),
            .dout           (hw_acc_data_r_data_inv),
            .err            (),
            .valid          (hw_acc_data_r_req),
            .src_o          (),
            .dump           (dump_s)
         );
      end
   endgenerate

   generate
      for (i=0; i<N_HW_ACC_PORT*N_HW_ACC; i++) begin
         always_comb
            hw_acc_data_add_dummymem[(i+1)*30-1:i*30] <= hw_acc_data_add[(i+1)*32-1:i*32+2];
      end
   endgenerate

   logic dumping;
   logic dump_now;

   always @(posedge clk)
   begin
      if (~dumping)
         dump_s <= 0;
      else
         dump_s <= dump_now;
   end

   assign rst = ~rst_n;

   //bit sim_end;

   // test_proc u_test_proc();

      `include "test_pkg.svh"

   int dummy;
   int check;
   int num;
   // int sim_end;

   const int height = 32;
   const int width  = 32;
   const int n_feat = 1;

   logic[1023:0][31:0] mem_s;
   logic [31:0] vector_out [1023:0];

   int out_count;
   initial
   begin
      integer file;
      int iter;
      for(iter=0; iter<NB_ITERATIONS; iter++) begin
         num = -1;
         out_count = 0;
         dumping = 1;
         resetCfg();
         testbench.rst_n = 0;
         tb_wait(30);
         testbench.rst_n = 1;
         tb_wait(20);
         $readmemh("../testbench/golden.txt", vector_out);
         // Test contexts
         hwce_acquire(0);
         tb_wait(1);
         hwce_setup(0, 32'h30000, 32'h10000, 32'h20000, 32'h0, n_feat, 16, 64);
         hwce_trigger(0);
         tb_wait(5);
         checkContextHWPE(0);
         tb_wait(50);
         while(event_s != 1'b1)
            tb_wait(1);
   //      $writememh("out.txt", mem_s[n]);
         file = $fopen("out.txt");
         for(int n=0; n<1024; n++) begin
            $fwrite(file, "%08x\n", mem_s[n]);
            $display("%08x", mem_s[n]);
         end
         tb_wait(50);
      end
      $finish;

      // forever wait(0);
   end

   // initial
   // begin : reset_gen
   //    out_count <= 0;
   //    testbench.rst_n      <= 0;
   //    tb_wait(30);
   //    testbench.rst_n <= 1;
   //    forever wait(0);
   // end

   logic clk_assert;
   initial
   begin : clock_gen
      while(sim_end==0)
      begin
         #4000ps;
         testbench.clk <= 0;
         testbench.clk_assert <= 1;
         #4000ps;
         testbench.clk <= 1;
         testbench.clk_assert <= 0;
      end
   end

   generate
   if(TIMING == 0)
   begin : check_gen
   logic [31:0] y_out_data_inv;
   logic [31:0] y_out_data;
   logic [31:0] y_out_real;
   logic y_out_valid;
   always_ff @(posedge clk)
   begin
      y_out_data_inv <= (testbench.hwce_top_gen[0].DUT.axi_sink_TVALID[0] & testbench.hwce_top_gen[0].DUT.axi_sink_TREADY[0]) ? testbench.hwce_top_gen[0].DUT.axi_sink_TDATA[0] : 32'hz;
   end
   assign y_out_data = {y_out_data_inv[15:0], y_out_data_inv[31:16]};

   assert property (@(posedge clk_assert) (y_out_valid==1'b1) |-> (y_out_data == y_out_real));

   always_comb
   begin
      if(y_out_valid == 1'b1)
         y_out_real <= vector_out[out_count];
      else
         y_out_real <= y_out_data;
   end

   always_ff @(posedge clk)
   begin
      y_out_valid <= testbench.hwce_top_gen[0].DUT.axi_sink_TVALID[0] & testbench.hwce_top_gen[0].DUT.axi_sink_TREADY[0];
   end

   int count = 0;
   always_ff @(posedge clk or negedge rst_n)
   begin
      if(rst_n == 1'b0)
         mem_s <= {1024{32'b0}};
      else
         if(y_out_valid) begin
            mem_s [count] <= y_out_data;
            count = count + 1;
         end
   end

   always_ff @(posedge clk)
   begin
      if(y_out_valid == 1'b1) begin
         out_count <= out_count + 1;
      end
      else
         out_count <= out_count;
   end
   end
   endgenerate

endmodule
