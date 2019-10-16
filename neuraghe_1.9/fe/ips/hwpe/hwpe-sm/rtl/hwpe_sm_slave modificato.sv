/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           hwpe_sm_slave.sv                                           *
 * Description:    Shared-memory HWPE wrapper slave module                    *
 *                                                                            *
 ******************************************************************************/

`include "hwpe_sm_params.sv"

module hwpe_sm_slave
#(
  parameter N_CONTEXT      = 2,
  parameter CFG_ADDR_WIDTH = 11,
  parameter CFG_DATA_WIDTH = 32,
  parameter CFG_BE_WIDTH   = CFG_DATA_WIDTH/8,
  parameter CFG_ID_WIDTH   = 16,
  parameter N_IO_REGS      = 2,
  parameter N_GENERIC_REGS = 0,
  parameter LATCH_REGFILE  = 0
)
(
  input  logic                     clk,
  input  logic                     clk_gated,
  input  logic                     rst_n,

  // Peripheral interconnect side
  input  logic                     data_req_i,
  input  logic[CFG_ADDR_WIDTH-1:0] data_add_i,
  input  logic                     data_type_i,
  input  logic[CFG_DATA_WIDTH-1:0] data_wdata_i,
  input  logic[CFG_ID_WIDTH-1:0]   data_ID_i,
  output logic[CFG_DATA_WIDTH-1:0] data_r_rdata_o,

  // CatC side
  input  logic                     done,
  output logic                     start_cs,

  // Register file
  output regfile_t                 reg_file,

  // Event line
  output logic                     evt_interrupt_o,

  // Working signal
  output logic                     is_working,

  // Enable signal
  output logic                     enable
);

  localparam N_REGISTERS         = `N_REGISTERS;
  localparam N_MANDATORY_REGS    = `N_MANDATORY_REGS;
  localparam N_RESERVED_REGS     = `N_RESERVED_REGS;
  localparam LOG_REGS            = `log2(N_REGISTERS);
  localparam LOG_CONTEXT         = `log2(N_CONTEXT);
  localparam LOG_REGS_MC         = LOG_REGS+LOG_CONTEXT;
  localparam N_MAX_IO_REGS       = `N_MAX_IO_REGS;
  localparam N_MAX_GENERIC_REGS  = `N_MAX_GENERIC_REGS;

  regfile_in_t regfile_in;
  regfile_out_t regfile_out;

  enum logic [1:0]   {idle, running, starting} running_state;
  enum logic         {idle_c, trigger}         context_state;

  slave_flags_t flags;

  logic [LOG_CONTEXT-1:0] pointer_context;
  logic [LOG_CONTEXT-1:0] running_context;
  logic [LOG_CONTEXT  :0] counter_pending;

  logic [3:0] s_enable_after;

  always_ff @(posedge clk_gated or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      s_enable_after <= 4'b0;
    else begin
      s_enable_after[0] <= 1'b1;
      for (int k=1; k<4; k++)
        s_enable_after[k] <= s_enable_after[k-1];
    end
  end

  generate

    if(N_CONTEXT>1) begin
      // Current context
      always_ff @(posedge clk_gated or negedge rst_n)
      begin : pointer_context_proc
        if (rst_n == 0)
          pointer_context <= 0;
        else begin
          if (flags.is_trigger == 1)
            pointer_context <= pointer_context + 1;
        end
      end
      // Running context
      always_ff @(posedge clk_gated or negedge rst_n)
      begin : done_counter_proc
        if (rst_n == 0)
          running_context <= 0;
        else begin
          if (flags.true_done == 1)
            running_context <= running_context + 1;
        end
      end
      // Pending contexts
      always_ff @(posedge clk_gated or negedge rst_n)
      begin : pending_counter_proc
        if (rst_n == 0)
          counter_pending <= 0;
        else begin
          if ((flags.is_trigger == 1) && (flags.true_done == 0))
            counter_pending <= counter_pending + 1;
          else if ((flags.is_trigger == 0) && (flags.true_done == 1))
            counter_pending <= counter_pending - 1;
        end
      end
       
      assign flags.full_context = (counter_pending == N_CONTEXT) ? 1 : 0;  // All contexts are busy
       
    end
    else begin
      assign pointer_context    = 'b0;
      assign running_context    = 'b0;
      assign counter_pending    = (is_working==1'b1) ? 1 : 'b0;
      assign flags.full_context = is_working;
    end

  endgenerate
  
  logic state;
  logic en;
  always_ff @(posedge clk_gated)
  begin
    if(rst_n == 1'b0) begin
      state <= 1'b0;
    end
    else begin
      case (state)
        0: begin
          if (data_req_i == 1) begin
            state <= 1'b1;
          end
        end
        1:begin
          state <= 1'b0;
        end
        default: begin
          state <= 1'b0;
        end
      endcase
      
    end
  end
  
  always_comb begin
    case (state)
        0: begin
          en = 1'b0;
        end
        1:begin          
          en = 1'b1;
        end
        default: begin
          en = 1'b0;
        end
      endcase
  end
  

  // Flags
  always_comb
  begin : flags_proc
    flags.is_mandatory  = (data_add_i[LOG_REGS-1:0] <= N_MANDATORY_REGS+N_RESERVED_REGS-1)                            ? 1 : 0;  // Accessed reg is mandatory (or reserved)
    flags.is_contexted  = (data_add_i[LOG_REGS-1:0] > N_MANDATORY_REGS+N_RESERVED_REGS+N_MAX_GENERIC_REGS-1)          ? 1 : 0;  // Accessed reg is contexted
    flags.is_read       = (data_req_i == 1 && data_type_i == 0 && en);
    flags.is_testset    = (data_req_i == 1 && data_type_i == 0 && data_add_i[LOG_REGS-1:0] == 1 && en)                      ? 1 : 0;  // Operation is a test&set to register context_ts
    flags.is_trigger    = (data_req_i == 1 && data_type_i == 1 && data_add_i[LOG_REGS-1:0] == 0 && data_wdata_i == 1 && en) ? 1 : 0;  // Operation is a trigger
    flags.true_done     = done & is_working;                                                                                    // This is necessary because sometimes done is asserted as soon as rst_n becomes 1
    enable              = s_enable_after[3];                                                                                           // Enable after three cycles from rst_n
  end

  generate
    if(N_CONTEXT>1) begin
       assign regfile_in.addr = (data_type_i==1) ? {pointer_context, data_add_i[LOG_REGS-1:0]} : data_add_i[LOG_REGS_MC-1:0];
    end
    else begin
       assign regfile_in.addr = data_add_i[LOG_REGS-1:0];
    end
  endgenerate

  // Register file address generation
  always_comb
  begin : regfile_addr_en_proc
    regfile_in.rden  = (flags.is_mandatory==0) ? data_req_i & ~data_type_i : 0;
    regfile_in.wren  = (flags.is_mandatory==0) ? data_req_i &  data_type_i : 0;
    regfile_in.wdata = data_wdata_i;
    regfile_in.src   = data_ID_i;
  end

  hwpe_sm_regfile #(
    .N_CONTEXT      (N_CONTEXT     ),
    .CFG_ADDR_WIDTH (CFG_ADDR_WIDTH),
    .CFG_DATA_WIDTH (CFG_DATA_WIDTH),
    .CFG_BE_WIDTH   (CFG_BE_WIDTH  ),
    .CFG_ID_WIDTH   (CFG_ID_WIDTH  ),
    .LOG_CONTEXT    (LOG_CONTEXT   ),
    .N_IO_REGS      (N_IO_REGS     ),
    .N_GENERIC_REGS (N_GENERIC_REGS),
    .LATCH_REGFILE  (LATCH_REGFILE )
  ) regfile_i (
    .clk (clk_gated),
    .rst_n,
    .regfile_in,
    .flags,
    .pointer_context,
    .running_context,
    .regfile_out,
    .reg_file
  );
  
  
  logic[CFG_DATA_WIDTH-1:0] data_r_rdata_reg;
  logic                     evt_interrupt_reg;
  logic                     evt_interrupt_int;
  logic [1:0] state_out;
  always_ff @(posedge clk_gated)
  begin
    if(rst_n == 1'b0) begin
      state_out <= 2'b0;
    end
    else begin
      case (state_out)
        0: begin
          if (data_req_i == 1 && (flags.is_read | flags.is_testset)) begin
            state_out <= 2'b01;
          end
        end
        1:begin
          state_out <= 2'b10;
          data_r_rdata_reg <= regfile_out.rdata;
        end
        
        2:begin
          state_out <= 2'b00;
        end
        default: begin
          state_out <= 2'b0;
        end
      endcase
      
    end
  end
  
  always_comb begin
    case (state_out)
        0: begin
          data_r_rdata_o = regfile_out.rdata;
        end
        1:begin          
          data_r_rdata_o = regfile_out.rdata;
        end
        2:begin          
          data_r_rdata_o = data_r_rdata_reg;
        end
        default: begin
          data_r_rdata_o = regfile_out.rdata;
        end
      endcase
  end
  


 //  assign data_r_rdata_o = regfile_out.rdata;

  logic start_context;
  generate
    if(N_CONTEXT>1)
      assign start_context = (running_context==pointer_context && flags.full_context==0) ? 1 : 0;
    else
      assign start_context = (flags.is_trigger==1 && is_working==0) ? 1 : 0;
     
  endgenerate
   
  // FSM to set the running state
  always_ff @(posedge clk_gated or negedge rst_n)
  begin : fsm_running
    if (rst_n==0) begin
      running_state <= idle;
      start_cs      <= 0;
      is_working    <= 0;
    end
    else begin
      case (running_state)
        idle : begin
          if (running_context == pointer_context && flags.full_context == 0) begin
            running_state <= idle;
            start_cs      <= 0;
            is_working    <= 0;
          end
          else begin
            running_state <= starting;
            start_cs      <= 0;
            is_working    <= 1;
          end
        end
        starting : begin
          // just to separate idle and running by an additional cycle
          running_state <= running;
          start_cs      <= 1;
          is_working    <= 1;
        end
        running : begin
          if (flags.true_done == 1) begin
            running_state <= idle;
            start_cs      <= 0;
            is_working    <= 0;
          end
          else begin
            running_state <= running;
            start_cs      <= 0;
            is_working    <= 1;
          end
        end
        default : begin
          running_state <= idle;
          start_cs      <= 0;
          is_working    <= 0;
        end
      endcase
    end
  end

  // FSM to control critical section of offload procedure
  always_ff @(posedge clk_gated or negedge rst_n)
  begin : fsm_context
    if (rst_n==0) begin
      flags.is_critical <= 0;
      context_state     <= idle_c;
    end
    else begin
      case (context_state)
        idle_c : begin
          if (flags.is_testset == 1 && flags.full_context==0) begin
            flags.is_critical <= 1;
            context_state     <= trigger;
          end
          else begin
            flags.is_critical <= 0;
            context_state     <= idle_c;
          end
        end
        trigger : begin
          if (flags.is_trigger == 1) begin
            flags.is_critical <= 0;
            context_state     <= idle_c;
          end
          else begin
            flags.is_critical <= 1;
            context_state     <= trigger;
          end
        end
      endcase
    end
  end

  always_ff @(posedge clk_gated or negedge rst_n)
  begin : event_interrupt_proc
    if (rst_n == 0) begin
      evt_interrupt_int <= 0;
      evt_interrupt_reg <= 0;
    end
    else begin
      evt_interrupt_int <= (regfile_out.evt_sync==1) ? flags.true_done : 0;
      evt_interrupt_reg <= evt_interrupt_int;
    end
  end
  
  assign evt_interrupt_o = evt_interrupt_int | evt_interrupt_reg;

endmodule
