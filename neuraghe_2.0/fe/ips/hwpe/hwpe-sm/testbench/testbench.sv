/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           testbench.sv                                               *
 * Description:    Testbench for shared-memory HWPEs produced with Catapult   *
 *                                                                            *
 ******************************************************************************/

`define ACCELERATOR_NAME   idct_hwpu_1m
`define N_ACCELERATOR_PORT 1
`define N_MASTER_PORT      1
`define CLK_DIVISOR        1
`define N_IO_REGS          5

module testbench;
   parameter real P_STALL = 0.25;
   parameter bit  MEMORY  = 0;
   parameter int unsigned CLK_CYCLES_ACC = `CLK_DIVISOR;
   parameter int unsigned N_HW_ACC       = 1;
   parameter int unsigned N_HW_ACC_PORT  = `N_MASTER_PORT;
   parameter int unsigned N_CATC_PORT    = `N_ACCELERATOR_PORT;
   parameter int unsigned BASE_ADDR      = 0;

   parameter int unsigned C_SEED_A = 1654;
   parameter int unsigned C_SEED_B = 345;

   // HW_ACC wires
   logic [N_HW_ACC_PORT*N_HW_ACC*(32)   - 1:0] hw_acc_data_add    ;
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

   // clk and reset
   logic clk;
   logic clk_acc;
   logic rst_n;
   bit   sim_end;

   logic[4*N_CATC_PORT-1:0] be_gnd;
   logic ex_catc_start;
   logic dump_s;

   // One HW_ACC wrapper per ACC
   genvar i;
   generate
      for (i=0; i<N_HW_ACC; i++)
      begin : hwpe_sm_top_gen
         hwpe_sm_top #(
            .BASE_ALIGNMENT_BIT  (13),
            .N_MASTER_PORT       (1),
            .N_ACCELERATOR_PORT  (1),
            .N_CONTEXT           (4),
            .CLK_DIVISION        (0),
            .CLUS_ADDR_WIDTH     (32),
            .CLUS_DATA_WIDTH     (32),
            .CLUS_BE_WIDTH       (4),
            .CFG_ADDR_WIDTH      (11),
            .CFG_DATA_WIDTH      (32),
            .CFG_BE_WIDTH        (4),
            .CFG_ID_WIDTH        (2),
            .N_IO_REGS           (2),
            .N_GENERIC_REGS      (0)
         )
         u_hwpe_sm_top (
            .clk             (clk),
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
            .evt_interrupt_o ()
         );
      end
   endgenerate

   dummy_memory #(
      .N_HW_ACC_PORT (1),
      .MEM_SIZE      (32'h40),
      .RANDOM_VALUES (0),
      .P_STALL       (P_STALL)
   ) u_dummy_memory (
      .clk            (clk),
      .rst_n          (rst_n),
      .add            (hw_acc_data_add[31:2]),
      .be             (hw_acc_data_be),
      .req            (hw_acc_data_req),
      .din            (hw_acc_data_data),
      .gnt            (hw_acc_data_gnt),
      .opc            (hw_acc_data_type),
      .src_i          (),
      .dout           (hw_acc_data_r_data),
      .err            (),
      .valid          (hw_acc_data_r_req),
      .src_o          (),
      .dump           (dump_s)
   );

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

   initial
   begin
      num = -1;
      dumping <= 1;
      resetCfg();
      tb_wait(100);

      // Test contexts
      checkContextHWPE(0);
      tb_wait(1);
      assert(testbench.hw_acc_cfg_r_data != -1)
      setIORegHWPE(0, 0, 32'h0);
      setIORegHWPE(0, 1, 32'h0);
      triggerHWPE(0);
      tb_wait(5);
      checkContextHWPE(0);
      dump_now <= 1;
      tb_wait(1);
      dump_now <= 0;
      assert(testbench.hw_acc_cfg_r_data != -1)
      setIORegHWPE(0, 0, 32'h0);
      setIORegHWPE(0, 1, 32'h0);
      triggerHWPE(0);
      tb_wait(5);
      checkContextHWPE(0);
      dump_now <= 1;
      tb_wait(1);
      dump_now <= 0;
      assert(testbench.hw_acc_cfg_r_data != -1)
      setIORegHWPE(0, 0, 32'h0);
      setIORegHWPE(0, 1, 32'h0);
      triggerHWPE(0);
      tb_wait(5);
      checkContextHWPE(0);
      dump_now <= 1;
      tb_wait(1);
      dump_now <= 0;
      assert(testbench.hw_acc_cfg_r_data != -1)
      setIORegHWPE(0, 0, 32'h0);
      setIORegHWPE(0, 1, 32'h0);
      triggerHWPE(0);
      tb_wait(5);
      checkContextHWPE(0);
      dump_now <= 1;
      tb_wait(1);
      dump_now <= 0;
      assert(testbench.hw_acc_cfg_r_data == -1)

      tb_wait(200);
      dumping <= 1;

      for(int i=0; i<25; i++)
      begin
         check = 0;
         num++;
         checkContextHWPE(0);
         dump_now <= 1;
         tb_wait(1);
         dump_now <= 0;
         setIORegHWPE(0, 0, testbench.BASE_ADDR);
         setIORegHWPE(0, 1, testbench.BASE_ADDR);
         triggerHWPE(0);
         while (check == 0) begin
            isWorkingHWPE(0);
            tb_wait(1);
            if(testbench.hw_acc_cfg_r_data != 0)
               check = 0;
            else
               check = 1;
         end
         resetCfg();
         tb_wait(10);
      end
      $finish;

      // forever wait(0);
   end

   initial
   begin : reset_gen
      testbench.rst_n      <= 0;
      #100 testbench.rst_n <= 1;
      forever wait(0);
   end

   initial
   begin : clock_gen
      while(sim_end==0)
      begin
         #5 testbench.clk <= 0;
         #5 testbench.clk <= 1;
      end
   end

endmodule
