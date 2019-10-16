/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           dummy_memory.sv                                            *
 * Description:    Fake multibanked memory with settable stall probability    *
 *                                                                            *
 ******************************************************************************/
module dummy_memory
  #(
    parameter N_HW_ACC_PORT = 1,
    parameter FILE_NAME     = "write.log",
    parameter MEMORY        = 1,
    parameter SPECIAL_INIT  = 0,
    parameter INIT_BITS     = 0,
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
     $srandom(10);
  end

  logic [N_HW_ACC_PORT-1:0] gnt_s;
  int count_s = 0;

  logic [MEM_SIZE-1:0][31:0] mem_s;

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
      for (int i=0; i<MEM_SIZE; i++) begin
        if (SPECIAL_INIT==1) begin
          if (i < 32'h30000 / 4) begin
            automatic integer ii = 2*i;
            automatic integer jj = ii+1;
            mem[i] = {4'h0, ii[12-1:0], 4'h0, jj[12-1:0]};
          end
          // else if (i < 32'h30000 / 4) begin
          //   mem[i] = 0;
          // end
          else begin
            mem[i] = 32'h20002000;
          end
        end
        else if (RANDOM_VALUES==1) begin
          rnd_s = $random;
          mem[i] = rnd_s;
        end
        // else if (INIT_BITS > 0) begin
        //   automatic integer ii = i;
        //   mem[i] = ii[INIT_BITS-1:0];
        // end
        else begin
          mem[i] = 0;
        end
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
      realn[i] = real'($urandom_range(0,1000))/1000.0;
    end
  end

  genvar i;
  generate
  for(i=0; i<N_HW_ACC_PORT; i++) begin
    always_comb
    begin
      gnt_s[i] <= (realn[i] < P_STALL) ? 1'b0 : 1'b1;
    end
    always_comb
    begin
      gnt[i] <= gnt_s[i] & req[i];
    end
  end
  endgenerate

endmodule
