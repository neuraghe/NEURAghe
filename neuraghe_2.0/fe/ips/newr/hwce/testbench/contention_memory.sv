/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           contention_memory.sv                                       *
 * Description:    Fake multibanked memory with real contention and           *
 *                 random arbitration                                         *
 *                                                                            *
 ******************************************************************************/

`define log2(N) ((N)<=(1) ? 0 : (N)<=(2) ? 1 : (N)<=(4) ? 2 : (N)<=(8) ? 3 : (N)<=(16) ? 4 : (N)<=(32) ? 5 : (N)<=(64) ? 6 : (N)<=(128) ? 7 : (N)<=(256) ? 8 : (N)<=(512) ? 9 : (N)<=(1024) ? 10 : -1)

module contention_memory
  #(
    parameter N_HW_ACC_PORT = 1,
    parameter FILE_NAME     = "write.log",
    parameter MEMORY        = 1,
    parameter SPECIAL_INIT  = 0,
    parameter INIT_BITS     = 0,
    parameter RANDOM_VALUES = 0,
    parameter BASE_ADDR     = 0,
    parameter MEM_SIZE      = 64,
    parameter N_BANKS       = 1,
    parameter N_COMPETING   = 0,
    parameter P_TRANSACTION = 0.0,
    parameter ROUND_ROBIN   = 0,
    parameter WORD_INTERLEAVING = 1
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

  localparam BANK_BITS = `log2(N_BANKS);

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

  real realn [(N_HW_ACC_PORT+N_COMPETING)*N_BANKS];

  always_ff @(posedge clk)
  begin : gnt_proc
    for (int i=0; i<(N_HW_ACC_PORT+N_COMPETING)*N_BANKS; i++) begin
      realn[i] = real'($urandom_range(0,1000))/1000.0;
    end
  end

  logic [(N_HW_ACC_PORT+N_COMPETING)-1:0][BANK_BITS-1:0] banks;
  logic [N_HW_ACC_PORT+N_COMPETING-1:0]  [30-1:0]        all_add;
  logic [N_HW_ACC_PORT+N_COMPETING-1:0]                  all_req;

  genvar i;
  generate

    if(WORD_INTERLEAVING==1) begin
      for(i=0; i<N_HW_ACC_PORT+N_COMPETING; i++) begin
        always_comb
          banks[i] <= all_add[i][BANK_BITS-1:0];
      end
    end
    else begin
      for(i=0; i<N_HW_ACC_PORT+N_COMPETING; i++) begin
        always_comb
          banks[i] <= all_add[i][30-1:30-BANK_BITS];
      end
    end

  endgenerate

  generate

    real points [(N_HW_ACC_PORT+N_COMPETING)*N_BANKS];

    if(ROUND_ROBIN==0) begin
      always_comb
        points <= realn;
    end
    else begin
      always_ff @(posedge clk or negedge rst_n) begin
        if(rst_n==1'b0) begin
          for(int i=0; i<N_BANKS; i++) begin
            for (int j=0; j<N_HW_ACC_PORT+N_COMPETING; j++)
              points[j*N_BANKS+i] = real'(i+1)/real'(N_BANKS);
          end
        end
        else begin
          for(int j=0; j<N_HW_ACC_PORT+N_COMPETING; j++) begin
            if(gnt_s[j]==1'b1) begin
              for (int k=1; k<N_HW_ACC_PORT+N_COMPETING-1; k++)
                points[k*N_BANKS+banks[j]] = points[(k-1)*N_BANKS+banks[j]];
              points[0+banks[j]] = points[(N_HW_ACC_PORT+N_COMPETING-1)*N_BANKS+banks[j]];
              points[(N_HW_ACC_PORT+N_COMPETING-1)*N_BANKS+banks[j]] = points[(N_HW_ACC_PORT+N_COMPETING-2)*N_BANKS+banks[j]];
            end
          end
        end
      end
    end


    always_comb
    begin
      for(int i=0; i<N_HW_ACC_PORT; i++)
        gnt_s[i] = 1'b0;
      for(int i=0; i<N_BANKS; i++) begin
        automatic int winner = -1;
        automatic int current = -1.0;
        for(int j=0; j<N_HW_ACC_PORT+N_COMPETING; j++) begin
          if ((all_req[j]==1'b1) && (banks[j]==i) && (points[j*N_BANKS+i] > current)) begin
            current = points[j*N_BANKS+i];
            winner  = j;
          end
        end
        if((winner!=-1) && (winner<N_HW_ACC_PORT))
          gnt_s[winner] = 1'b1;
      end
      gnt = gnt_s;
    end

  endgenerate

  generate
    if(N_COMPETING>0) begin

      logic [N_COMPETING-1:0][30-1:0] competing_add;
      logic [N_COMPETING-1:0]         competing_req;

      always_ff @(posedge clk)
      begin
        for(int i=0; i<N_COMPETING; i++) begin
          automatic integer tmpadd = $urandom_range(0,N_BANKS);
          competing_add[i] = tmpadd;
        end
      end

      always_ff @(posedge clk)
      begin
        for(int i=0; i<N_COMPETING; i++) begin
          automatic real tmp;
          automatic logic tmpreq;
          tmp = real'($urandom_range(0,999))/1000.0;
          if(tmp < P_TRANSACTION)
            tmpreq = 1'b1;
          else
            tmpreq = 1'b0;
          competing_req[i] = tmpreq;
        end
      end

      always_comb
      begin
        all_add [N_HW_ACC_PORT+N_COMPETING-1:N_HW_ACC_PORT] <= competing_add;
        all_req [N_HW_ACC_PORT+N_COMPETING-1:N_HW_ACC_PORT] <= competing_req;
        all_add [N_HW_ACC_PORT-1:0] <= add;
        all_req [N_HW_ACC_PORT-1:0] <= req;
      end

    end
    else begin

      always_comb
      begin
        all_add <= add;
        all_req <= req;
      end

    end

  endgenerate

endmodule
