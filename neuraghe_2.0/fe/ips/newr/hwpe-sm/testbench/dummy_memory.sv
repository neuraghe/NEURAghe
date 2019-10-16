////////////////////////////////////////////////////////////////////////////////
//          ERC Multitherman Lab @ DEIS - University of Bologna               //
//                    Viale Pepoli 3/2 40136                                  //
//                    Bologna - tel 0512092759                                //
//                                                                            //
// Engineer:       Francesco Conti - f.conti@unibo.it                         //
//                                                                            //
// Create Date:    15/06/2012                                                 //
// Last Update:    10/05/2013                                                 //
// Design Name:    hwpe_sm                                                    //
// Module Name:    dummy_memory                                               //
// Project Name:   Shared-memory HWPE wrapper                                 //
// Target Devices: FPGA, ASIC                                                 //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Fake memory for the testbench                              //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module dummy_memory
  #(
    parameter N_HW_ACC_PORT = 1,
    parameter FILE_NAME     = "write.log",
    parameter MEMORY        = 1,
    parameter FIXED_PATTERN = 0,
    parameter RANDOM_VALUES = 0,
    parameter BASE_ADDR     = 0,
    parameter MEM_SIZE      = 64,
    parameter P_STALL       = 0.1
  )
  (
    input  logic                             clk,
    input  logic                             rst_n,
    input  logic [N_HW_ACC_PORT-1:0][30-1:0] add,
    input  logic [N_HW_ACC_PORT-1:0][4-1 :0] be,
    input  logic [N_HW_ACC_PORT-1:0]         req,
    input  logic [N_HW_ACC_PORT-1:0][32-1:0] din,
    output logic [N_HW_ACC_PORT-1:0]         gnt,
    input  logic [N_HW_ACC_PORT-1:0]         opc,
    input  logic [N_HW_ACC_PORT-1:0][2-1 :0] src_i,
    output logic [N_HW_ACC_PORT-1:0][32-1:0] dout,
    output logic [N_HW_ACC_PORT-1:0][8-1 :0] err,
    output logic [N_HW_ACC_PORT-1:0]         valid,
    output logic [N_HW_ACC_PORT-1:0][2-1 :0] src_o,
    input  logic                             dump
  );

  integer log_file;

  initial
  begin
     $fopen(FILE_NAME);
  end

  logic [N_HW_ACC_PORT-1:0] gnt_s;
  int count_s = 0;

  logic [MEM_SIZE-1:0][31:0] mem_s;

  localparam logic [63:0][31:0] MEM_INIT = {
    32'h0000034b, 32'h00000062, 32'h0000000c, 32'hffffffa3, 32'h00000030, 32'h0000003a, 32'h00000020, 32'hffffffe9,
    32'hffffffdf, 32'hfffffffd, 32'hffffffe2, 32'h00000000, 32'h0000001c, 32'h00000001, 32'h00000007, 32'h00000010,
    32'hffffff22, 32'h000000d6, 32'hfffffff0, 32'hffffffe9, 32'h00000035, 32'h00000020, 32'h0000000b, 32'h00000020,
    32'h000000e5, 32'h00000047, 32'hffffffe5, 32'hfffffff3, 32'h00000006, 32'h00000015, 32'hffffffed, 32'hffffffdc,
    32'h00000047, 32'hffffffb4, 32'hffffffed, 32'h00000025, 32'hfffffff2, 32'hffffffca, 32'h00000005, 32'h00000008,
    32'hffffff9d, 32'h00000000, 32'hffffffd1, 32'h00000025, 32'h00000013, 32'hffffffd0, 32'hffffffff, 32'h00000024,
    32'hffffffb1, 32'h0000000c, 32'h00000041, 32'hfffffff3, 32'hffffffda, 32'h00000010, 32'hfffffff8, 32'hfffffff2,
    32'h0000000c, 32'h000000b1, 32'hfffffffa, 32'hffffffff, 32'h0000000d, 32'hfffffff9, 32'h0000000c, 32'h00000003
  };

  logic ex_rst_n;
  always_ff @(posedge clk)
    ex_rst_n <= rst_n;

  always_ff @(posedge clk or rst_n)
  begin : dummy_proc
    logic[31:0] rnd_s;
    logic[MEM_SIZE-1:0][31:0] mem;
    int count;
    if (rst_n==1'b0) begin
      count = 0;
      dout  <= 0;
      err   <= 0;
      valid <= 0;
      src_o <= 0;
    end
    else if (rst_n==1'b1 && ex_rst_n==1'b0) begin
      for (int i=0; i<MEM_SIZE; i++)
      begin
        if (RANDOM_VALUES==1) begin
          rnd_s = $random;
          mem[i] = rnd_s;
        end
        else
          mem[i] = MEM_INIT[i];
      end
    end
    else begin
      mem_s <= mem[MEM_SIZE-1:0];
      for (int i=0; i<N_HW_ACC_PORT; i++) begin
        if (req[i]==1'b0) begin
          dout  [i] <= 32'bz;
          err   [i] <= 0;
          valid [i] <= 0;
          src_o [i] <= src_i[i];
        end
        else begin
          if ((gnt_s[i]==1'b1) && (opc[i]==1'b0)) begin
            dout  [i] <= mem[add[i]-BASE_ADDR/4];
            err   [i] <= 0;
            valid [i] <= gnt_s[i];
            src_o [i] <= src_i[i];
          end
          else if ((gnt_s[i]==1'b1) && (opc[i]==1'b1)) begin
            mem[add[i]-BASE_ADDR/4]        <= din[i];
            dout  [i] <= din[i];
            err   [i] <= 0;
            valid [i] <= 0;
            src_o [i] <= src_i[i];
          end
          else if (gnt_s[i]==1'b0) begin
            dout  [i] <= 32'bx;
            err   [i] <= 0;
            valid [i] <= 0;
            src_o [i] <= src_i[i];
          end
          else begin
            dout  [i] <= 32'bz;
            err   [i] <= 0;
            valid [i] <= 0;
            src_o [i] <= src_i[i];
          end
        end
      end
      if (dump==1'b1) begin
        $fdisplay(log_file, "Dump %d", count);
        for(integer i=0; i<MEM_SIZE; i++) begin
          $fdisplay(log_file, "M[%x] = %x", i, mem[i]);
        end
        count ++;
        count_s <= count;
      end
    end
  end

  real realn [N_HW_ACC_PORT-1:0];

  always_ff @(posedge clk)
  begin : gnt_proc
    for (int i=0; i<N_HW_ACC_PORT; i++) begin
      realn[i] = $random;
    end
  end

  genvar i;
  generate
  for(i=0; i<N_HW_ACC_PORT; i++) begin
    always_comb
    begin
      gnt_s[i] <= (realn[i] < P_STALL) ? 1'b0 : 1'b1;
      gnt  [i] <= gnt_s[i];
    end
  end
  endgenerate

endmodule
