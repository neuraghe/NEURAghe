/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           hwce_wrapper_fsm.sv                                        *
 * Description:    HWCE wrapper FSM module                                    *
 *                                                                            *
 ******************************************************************************/

`include "hwce_types.sv"
`include "hwpe_sm_params.sv"

module hwce_wrapper_fsm
#(
  parameter N_STREAMS = 3,
  parameter N_ROW     = 2,
  parameter N_COL     = 2,
   parameter NPF            = 2 // Number of Parallel Filters, number of 3x3 filter implemented into a SoP
) 
(
  input  logic                 clk,
  input  logic                 rst_n,
  input  logic                 is_working,
  input  logic                 done_weightload,
  input  logic                 done_ctrl,
  input  logic [N_STREAMS-1:0] ready_start ,
  input  logic                 axi_done_preload_i,
  output logic [N_STREAMS-1:0] req_start,
  output logic [1:0]           hwce_state_o,
  output logic                 engine_start_o
);

  logic [1:0] hwce_state;
  logic started_preload;
  logic started;

  assign hwce_state_o = hwce_state;

  always_ff @(posedge clk or negedge rst_n)
  begin
    if (rst_n==1'b0) begin
      hwce_state      <= `HWCE_WRAPPER_FSM_IDLE;
      req_start       <= 0;
      started         <= 1'b0;
      started_preload <= 1'b0;
      engine_start_o  <= 1'b0;
    end
    else begin
      if (hwce_state==`HWCE_WRAPPER_FSM_IDLE) begin
        if(is_working==1'b1) begin
          hwce_state      <= `HWCE_WRAPPER_FSM_START1;
          req_start       <= 0;
          started         <= 1'b0;
          started_preload <= 1'b0;
          engine_start_o  <= 1'b1;
        end
        else begin
          hwce_state      <= `HWCE_WRAPPER_FSM_IDLE;
          req_start       <= 0;
          started         <= 1'b0;
          started_preload <= 1'b0;
          engine_start_o  <= 1'b0;
        end
      end
      else if (hwce_state==`HWCE_WRAPPER_FSM_START1) begin
        if(done_weightload==1'b1) begin
          hwce_state      <= `HWCE_WRAPPER_FSM_START2;
          req_start       <= 0;
          started         <= 1'b0;
          started_preload <= 1'b0;
          engine_start_o  <= 1'b0;
        end
        else begin
          hwce_state      <= `HWCE_WRAPPER_FSM_START1;
          req_start       <= 0;
          started         <= 1'b0;
          started_preload <= 1'b0;
          engine_start_o  <= 1'b0;
        end
      end
      else if (hwce_state==`HWCE_WRAPPER_FSM_START2) begin
        if (started_preload==1'b0) begin
          if(&ready_start[N_STREAMS-1:N_ROW*2] == 1'b1 ) begin //&& ready_start[3] == 1'b1) begin // TODO: parametrizzare
            req_start       <= {{NPF*N_COL{1'b1}},{N_ROW*2{1'b0}}};//5'b10000; //4'b1100;//3'h4; TODO: parametrizzare
            started_preload <= 1'b1;
          end
          else begin
            req_start       <= 0;
            started_preload <= 1'b0;
          end
          hwce_state <= `HWCE_WRAPPER_FSM_START2;
        end
        else begin
          if(((axi_done_preload_i & is_working) == 1'b1) && (&ready_start[N_ROW*2-1:0] == 1'b1))begin//(ready_start[0] == 1'b1) && (ready_start[1] == 1'b1)) begin //TODO: parametrizzare
            req_start <= {{NPF*N_COL{1'b0}},{N_ROW*2{1'b1}}};//5'b01111;//4'b0011;//3'h3;
            started_preload <= 1'b0;
            hwce_state      <= `HWCE_WRAPPER_FSM_RUN;
            started         <= 1'b1;
          end
          else begin
            req_start <= 0;
            started_preload <= 1'b1;
            hwce_state      <= `HWCE_WRAPPER_FSM_START2;
            started         <= 1'b0;
          end
        end
        engine_start_o <= 1'b0;
      end
      else if (hwce_state==`HWCE_WRAPPER_FSM_RUN) begin
        if (started==1'b0) begin
          req_start  <= 0;
          started    <= 1'b1;
          hwce_state <= `HWCE_WRAPPER_FSM_RUN;
        end
        else begin
          req_start <= 0;
          if(done_ctrl == 1'b1) begin
            started    <= 1'b0;
            hwce_state <= `HWCE_WRAPPER_FSM_IDLE;
          end
          else begin
            started    <= 1'b1;
            hwce_state <= `HWCE_WRAPPER_FSM_RUN;
          end
        end
        engine_start_o  <= 1'b0;
        started_preload <= 1'b0;
      end
    end
  end

endmodule
