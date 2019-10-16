/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           hwpe_sm_regfile.sv                                         *
 * Description:    Shared-memory HWPE wrapper register file                   *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"

module hwpe_sm_regfile
#(
  parameter N_CONTEXT      = 2,
  parameter CFG_ADDR_WIDTH = 11,
  parameter CFG_DATA_WIDTH = 32,
  parameter CFG_BE_WIDTH   = CFG_DATA_WIDTH/8,
  parameter CFG_ID_WIDTH   = 16,
  parameter LOG_CONTEXT    = 1,
  parameter N_IO_REGS      = 2,
  parameter N_GENERIC_REGS = 0,
  parameter LATCH_REGFILE  = 0
)
(
  input  logic                     clk,
  input  logic                     rst_n,
  input  regfile_in_t              regfile_in,
  input  slave_flags_t             flags,
  input  logic[LOG_CONTEXT-1:0]    pointer_context,
  input  logic[LOG_CONTEXT-1:0]    running_context,
  input  logic[LOG_CONTEXT-1:0]    pointer_context_prev,
  output regfile_out_t             regfile_out,
  output regfile_t                 reg_file
);

  `define RESP_ANOTHER_PE_OFFLOADING -2
  `define RESP_ALL_CXT_BUSY          -1

  localparam N_REGISTERS         = `N_REGISTERS;
  localparam N_MANDATORY_REGS    = `N_MANDATORY_REGS;
  localparam N_RESERVED_REGS     = `N_RESERVED_REGS;
  localparam LOG_REGS            = `log2(N_REGISTERS);
  localparam LOG_REGS_MC         = LOG_REGS+LOG_CONTEXT;
  localparam LOG_REGS_MC_PREV    = LOG_REGS_MC+LOG_CONTEXT;
  localparam N_MAX_IO_REGS       = `N_MAX_IO_REGS; //unused
  localparam N_MAX_GENERIC_REGS  = `N_MAX_GENERIC_REGS;

  logic [N_CONTEXT-1:0] [N_REGISTERS-1:N_MANDATORY_REGS+N_RESERVED_REGS+N_GENERIC_REGS]      [CFG_DATA_WIDTH-1:0] regfile_mem;
  logic [N_MANDATORY_REGS-1:2]                                                               [CFG_DATA_WIDTH-1:0] regfile_mem_mandatory;
  logic [N_MANDATORY_REGS+N_RESERVED_REGS+N_GENERIC_REGS-1:N_MANDATORY_REGS+N_RESERVED_REGS] [CFG_DATA_WIDTH-1:0] regfile_mem_generic;
  logic                                                                                      [CFG_DATA_WIDTH-1:0] regfile_mem_dout;
  logic                                                                                      [CFG_DATA_WIDTH-1:0] regfile_mem_mandatory_dout;
  logic                                                                                      [CFG_DATA_WIDTH-1:0] regfile_mem_generic_dout;
  logic                                                                                      [CFG_DATA_WIDTH-1:0] regfile_mem_io_dout;

  logic [7:0] offload_job_id;
  logic       offload_job_id_incr;
  logic [7:0] running_job_id;
  logic       running_job_id_incr;

  localparam SCM_ADDR_WIDTH  = $clog2(N_CONTEXT*N_IO_REGS + N_GENERIC_REGS + N_MANDATORY_REGS - 2);
  localparam N_SCM_REGISTERS = 2**SCM_ADDR_WIDTH;

  logic                      regfile_latch_re;
  logic [SCM_ADDR_WIDTH-1:0] regfile_latch_addr;
  logic [CFG_DATA_WIDTH-1:0] regfile_latch_rdata;
  logic                      regfile_latch_we;
  logic [CFG_DATA_WIDTH-1:0] regfile_latch_wdata;
  logic [CFG_BE_WIDTH-1:0]   regfile_latch_be;
  logic [N_SCM_REGISTERS-1:0][CFG_DATA_WIDTH-1:0] regfile_latch_mem;

  // / Register file memory write (synchronous)
  genvar i,j,k;
  generate
    logic [N_CONTEXT-1:0]                  wren_cxt;
    logic [N_CONTEXT-1:0][N_REGISTERS-1:0] wren_reg;

    logic[2**LOG_CONTEXT-1:0] ptr_cxt_decoded;
   // logic[LOG_CONTEXT-1:0] prev_ptr_cxt;
    logic[N_REGISTERS-1:0]    data_add_decoded;

    decoder #(.SIZE(LOG_CONTEXT)) ptr_cxt_decoder_i (.d_in(regfile_in.addr[LOG_REGS_MC-1:LOG_REGS]), .d_out(ptr_cxt_decoded));
    decoder #(.SIZE(LOG_REGS)) data_add_decoder_i   (.d_in(regfile_in.addr[LOG_REGS-1:0]),           .d_out(data_add_decoded));
    
    
   // assign prev_ptr_cxt = regfile_in.addr[LOG_REGS_MC_PREV-1:LOG_REGS_MC];

    if(LATCH_REGFILE) begin : regfile_latch_gen
      register_file_1r_1w_all #(
        .ADDR_WIDTH(SCM_ADDR_WIDTH),
        .DATA_WIDTH(CFG_DATA_WIDTH)
      ) regfile_latch_i (
        .clk(clk),
        .ReadEnable (regfile_latch_re),
        .ReadAddr   (regfile_latch_addr),
        .ReadData   (regfile_latch_rdata),
        .WriteAddr  (regfile_latch_addr),
        .WriteEnable(regfile_latch_we),
        .WriteData  (regfile_latch_wdata),
        .WriteBE    (regfile_latch_be),
        .MemContent (regfile_latch_mem)
      );
    end

    for(i=0; i<N_CONTEXT; i++)
    begin

      // Context & Register write enables, decoded from pointer_context and address
      if(N_CONTEXT>1)
        begin : MULTI_CONTEXT
           assign wren_cxt[i] = ptr_cxt_decoded[i] & regfile_in.wren & flags.is_contexted;
           for (k=0; k<N_REGISTERS; k++)
           begin : REG
             assign wren_reg[i][k] = (data_add_decoded[k]==1'b1) ? wren_cxt[i] : 1'b0;
           end
        end
      else
        begin : SINGLE_CONTEXT
           assign wren_cxt[i] = ptr_cxt_decoded[i] & regfile_in.wren & flags.is_contexted;
           for(k=0; k<N_REGISTERS; k++)
           begin : REG
             assign wren_reg[i][k] = (data_add_decoded[k]==1'b1) ? wren_cxt[i] : 1'b0;
           end
        end
/*
`ifndef PULP3_FPGA_EMUL
      for(j=N_MANDATORY_REGS+N_RESERVED_REGS+N_MAX_GENERIC_REGS; j<N_MANDATORY_REGS+N_RESERVED_REGS+N_MAX_GENERIC_REGS+N_IO_REGS; j++) begin
        if(LATCH_REGFILE == 0) begin : regfile_ff_gen
          always_ff @(posedge clk or negedge rst_n)
          begin
            if(rst_n==0)
              regfile_mem[i][j] <= 0;
            else begin
              if(wren_cxt[i]==1 && data_add_decoded[j]==1'b1)
                regfile_mem[i][j] <= regfile_in.wdata;
            end
          end
        end
        else begin: regfile_latch_binding
          assign regfile_mem[i][j] = regfile_latch_mem[i*N_IO_REGS+j-N_RESERVED_REGS-N_MAX_GENERIC_REGS+N_GENERIC_REGS-N_MANDATORY_REGS];
        end
      end
`else*/
      for(j=N_MANDATORY_REGS+N_RESERVED_REGS+N_MAX_GENERIC_REGS; j<N_MANDATORY_REGS+N_RESERVED_REGS+N_MAX_GENERIC_REGS+N_IO_REGS; j++) begin : regfile_ff_gen
        always_ff @(posedge clk or negedge rst_n)
        begin
          if(rst_n==1'b0)
            regfile_mem[i][j] <= 0;
          else begin
            if(wren_cxt[i]==1 && data_add_decoded[j]==1'b1)
              regfile_mem[i][j] <= regfile_in.wdata;
           // else if (flags.is_testset==1 && flags.is_critical!=1 && flags.full_context!=1)
           //     regfile_mem[i][j]<= regfile_mem[pointer_context_prev][j];                            
          end
        end
      end
      for(j=N_MANDATORY_REGS+N_RESERVED_REGS+N_MAX_GENERIC_REGS+N_IO_REGS; j<N_REGISTERS; j++) begin : fake_regfile_gen
        assign regfile_mem[i][j] = 0;
      end 
//`endif
    end

  endgenerate

  // Register file memory read (combinational, registered in the read process) + latch binding
  generate
    if(LATCH_REGFILE == 0) begin : regfile_read_ff_gen
      assign regfile_mem_io_dout = ((regfile_in.rden==1) && (flags.is_contexted==1)) ? regfile_mem[regfile_in.addr[LOG_REGS_MC-1:LOG_REGS]] [regfile_in.addr[LOG_REGS-1:0]] : 0;
      assign regfile_mem_mandatory_dout = regfile_mem_mandatory[regfile_in.addr[LOG_REGS-1:0]];
      if(N_GENERIC_REGS)
        assign regfile_mem_generic_dout = regfile_mem_generic  [regfile_in.addr[LOG_REGS-1:0]];
      else
        assign regfile_mem_generic_dout = '0;
      
      always_comb
      begin
        if (flags.is_mandatory==1'b1)
          regfile_mem_dout = regfile_mem_mandatory_dout;
        else if(flags.is_contexted==1)
          regfile_mem_dout = regfile_mem_io_dout;
        else // is generic
          regfile_mem_dout = regfile_mem_generic_dout;
      end
    end
    else begin : regfile_latch_bindings_gen
      assign regfile_mem_mandatory_dout = regfile_mem_mandatory[regfile_in.addr[LOG_REGS-1:0]];
      assign regfile_mem_dout = (~flags.is_mandatory) ? regfile_latch_rdata : regfile_mem_mandatory_dout;
      assign regfile_latch_re = flags.is_read;
      assign regfile_latch_we = (~flags.is_mandatory) & regfile_in.wren;
      always_comb
      begin : regfile_latch_addr_proc
        if(flags.is_contexted == 1'b1)
          regfile_latch_addr = regfile_in.addr[LOG_REGS-1:0] + regfile_in.addr[LOG_REGS_MC-1:LOG_REGS]*N_IO_REGS - N_RESERVED_REGS - N_MAX_GENERIC_REGS + N_GENERIC_REGS - N_MANDATORY_REGS; // one mul x const + one add + one add with const
        else
          regfile_latch_addr = regfile_in.addr[LOG_REGS-1:0] - N_RESERVED_REGS - N_MANDATORY_REGS;
      end
      assign regfile_latch_be = 4'b1111;
      assign regfile_latch_wdata = regfile_in.wdata;
    end
  endgenerate

  // Unique job id counters
  always_ff @(posedge clk or negedge rst_n)
  begin
    if (rst_n==0)
      offload_job_id <= 0;
    else if (offload_job_id_incr==1'b1)
      offload_job_id <= offload_job_id + 1;
    else
      offload_job_id <= offload_job_id;
  end

  always_ff @(posedge clk or negedge rst_n)
  begin
    if(rst_n==1'b0)
      running_job_id_incr <= 1'b0;
    else
      running_job_id_incr <= flags.true_done;
  end

  always_ff @(posedge clk or negedge rst_n)
  begin
    if (rst_n==0)
      running_job_id <= 0;
    else if (running_job_id_incr==1'b1)
      running_job_id <= running_job_id + 1;
    else
      running_job_id <= running_job_id;
  end

  // Read register file process (mux tree with a register at the base of the trunk)
  always_ff @(posedge clk or negedge rst_n)
  begin : data_r_rdata_o_proc
    if (rst_n==0) begin
      offload_job_id_incr <= 1'b0;
      regfile_out.rdata   <= 0;
    end
    else begin
      if (flags.is_testset==1) begin
        if (flags.is_critical==1) begin
          offload_job_id_incr <= 1'b0;
          regfile_out.rdata   <= `RESP_ANOTHER_PE_OFFLOADING;
        end
        else if (flags.full_context==1) begin
          offload_job_id_incr <= 1'b0;
          regfile_out.rdata   <= `RESP_ALL_CXT_BUSY;
        end
        else begin
          offload_job_id_incr <= 1'b1;
          regfile_out.rdata   <= { 24'b0 , offload_job_id };
         // regfile_mem[pointer_context]<= regfile_mem[pointer_context_prev];
        end
      end
      else begin
        offload_job_id_incr <= 1'b0;
        if (flags.is_read==1) begin
          if (regfile_in.addr[LOG_REGS-1:0]==0)
            regfile_out.rdata <= 0;
          else
            regfile_out.rdata <= regfile_mem_dout;
        end
        else
          regfile_out.rdata <= 0;
      end
    end
  end

  generate
    // Write generic registers processes
    if(LATCH_REGFILE == 0) begin : regfile_generic_ff_gen
      always_ff @(posedge clk or negedge rst_n)
      begin : write_generic_proc
        if (rst_n == 0) begin
          regfile_mem_generic <= 0;
        end
        else begin
          if ((flags.is_mandatory==1'b0) && (flags.is_contexted==1'b0) && (regfile_in.wren==1'b1))
            regfile_mem_generic[regfile_in.addr[LOG_REGS-1:0]] <= regfile_in.wdata;
        end
      end
    end
    else begin : regfile_generic_latch_binding
      for(i=N_MANDATORY_REGS+N_RESERVED_REGS; i<N_MANDATORY_REGS+N_RESERVED_REGS+N_GENERIC_REGS; i++) begin
        assign regfile_mem_generic[i] = regfile_latch_mem[i-N_RESERVED_REGS-N_MANDATORY_REGS];
      end
    end
  endgenerate

  // Write mandatory registers processes
  always_ff @(posedge clk or negedge rst_n)
  begin : write_mandatory_proc_word
    if (rst_n == 0) begin
      regfile_mem_mandatory[2] <= 1; // evt_sync defaults to 1
      regfile_mem_mandatory[4] <= 0;
      regfile_mem_mandatory[5] <= 0;
    end
    else begin
      regfile_mem_mandatory[4] <= { 24'b0 , running_job_id };
      if(regfile_in.wren==1'b1)
        regfile_mem_mandatory[2] <= (regfile_in.addr[LOG_REGS_MC-1:0]==2) ? regfile_in.wdata : regfile_mem_mandatory[2];
      if(regfile_in.wren==1'b1 || regfile_in.rden==1'b1)
        regfile_mem_mandatory[5] <= regfile_in.addr[LOG_REGS_MC-1:LOG_REGS];
    end
  end

  logic [`log2(CFG_ID_WIDTH)-1:0] data_src_encoded;
  encoder #(.SIZE(CFG_ID_WIDTH)) data_src_encoder_i (.d_in(regfile_in.src[CFG_ID_WIDTH-1:0]), .d_out(data_src_encoded));

  generate

    for (i=0; i<N_CONTEXT; i++)
    begin

      always_ff @(posedge clk or negedge rst_n)
      begin : write_mandatory_proc_byte
        if (rst_n == 0) begin
          regfile_mem_mandatory[3][(i+1)*8-1:i*8] <= 0;
          regfile_mem_mandatory[6][(i+1)*8-1:i*8] <= 0;
        end
        else begin
          if (pointer_context==i) begin
            if (flags.is_trigger==1) begin
              regfile_mem_mandatory[3][(i+1)*8-1:i*8] <= 8'h01;
              regfile_mem_mandatory[6][(i+1)*8-1:i*8] <= data_src_encoded+1;
            end
            else if (flags.true_done==1 && running_context==pointer_context) begin
              regfile_mem_mandatory[3][(i+1)*8-1:i*8] <= 8'h00;
              regfile_mem_mandatory[6][(i+1)*8-1:i*8] <= regfile_mem_mandatory[6][(i+1)*8-1:i*8];
            end
            else begin
              regfile_mem_mandatory[3][(i+1)*8-1:i*8] <= regfile_mem_mandatory[3][(i+1)*8-1:i*8];
              regfile_mem_mandatory[6][(i+1)*8-1:i*8] <= regfile_mem_mandatory[6][(i+1)*8-1:i*8];
            end
          end
          else if (running_context==i) begin
            if (flags.true_done==1) begin
              regfile_mem_mandatory[3][(i+1)*8-1:i*8] <= 8'h00;
              regfile_mem_mandatory[6][(i+1)*8-1:i*8] <= regfile_mem_mandatory[6][(i+1)*8-1:i*8];
            end
            else begin
              regfile_mem_mandatory[3][(i+1)*8-1:i*8] <= regfile_mem_mandatory[3][(i+1)*8-1:i*8];
              regfile_mem_mandatory[6][(i+1)*8-1:i*8] <= regfile_mem_mandatory[6][(i+1)*8-1:i*8];
            end
          end
          else begin
            regfile_mem_mandatory[3][(i+1)*8-1:i*8] <= regfile_mem_mandatory[3][(i+1)*8-1:i*8];
            regfile_mem_mandatory[6][(i+1)*8-1:i*8] <= regfile_mem_mandatory[6][(i+1)*8-1:i*8];
          end
        end
      end

    end

    if(N_CONTEXT<4) begin
      for(i=N_CONTEXT; i<4; i++) begin
         assign regfile_mem_mandatory[3][(i+1)*8-1:i*8] = 'b0;
         assign regfile_mem_mandatory[6][(i+1)*8-1:i*8] = 'b0;
      end
    end

  endgenerate

  assign reg_file.hwpe_params = regfile_mem[running_context][N_MANDATORY_REGS+N_RESERVED_REGS+N_MAX_GENERIC_REGS+N_IO_REGS-1:N_MANDATORY_REGS+N_RESERVED_REGS+N_MAX_GENERIC_REGS];

  generate
    if(N_GENERIC_REGS>0) 
      assign reg_file.generic_params = regfile_mem_generic[N_MANDATORY_REGS+N_RESERVED_REGS+N_GENERIC_REGS-1:N_MANDATORY_REGS+N_RESERVED_REGS];
    else
      assign reg_file.generic_params = 'b0;
  endgenerate

  // evt_sync_proc
  assign regfile_out.evt_sync = regfile_mem_mandatory[2][0];

endmodule
