/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineer:       Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           hwce_engine.sv                                             *
 * Description:    Convolutional engine core FSM                              *
 *                                                                            *
 ******************************************************************************/

`ifndef HWCE_TYPES
`define HWCE_TYPES

`include "hwpe_axi_params.sv"

// `ifndef  log2
//    `define log2(N) ((N)<=(1) ? 0 : (N)<=(2) ? 1 : (N)<=(4) ? 2 : (N)<=(8) ? 3 : (N)<=(16) ? 4 : (N)<=(32) ? 5 : (N)<=(64) ? 6 : (N)<=(128) ? 7 : (N)<=(256) ? 8 : (N)<=(512) ? 9 : (N)<=(1024) ? 10 : -1)
// `endif

`define exp2(N) ((N)==0 ? 1 : (N)==1 ? 2 : (N)==2 ? 4 : (N)==3 ? 8 : (N)==4 ? 16 : (N)==5 ? 32 : (N)==6 ? 64 : (N)==7 ? 128 : (N)==8 ? 256 : (N)==9 ? 512 : (N)==10 ? 1024 : -1)
`define round2(N) `exp2(`log2(N))

typedef enum logic [2:0] {FSM_IDLE, FSM_PLWL, FSM_PRELOAD, FSM_CHANGE_FEAT, FSM_TERMINATE_PENDING, FSM_RELOAD_WEIGHTS, FSM_RUN} fsm_state_t;
typedef enum logic [2:0] {IDLE, ACC_ODD, ACC_EVEN, PRODUCE, REG_IDLE} fsm_state_t_pooling; //fsm pooling
typedef enum logic [1:0] {IDLE_P, RUN_P} fsm_pipe_pooling; //fsm pipe pooling


typedef struct packed {
   logic           [15:0]   linebuf_length;
   logic            [5:0]   qf;
   logic           [15:0]   nfeat;
   logic                    linear_conv;
   logic                    signed_mul;
   stream_config_t [20-1:0] stream_config;
} engine_params_t;

// Wrapper FSM states
`define HWCE_WRAPPER_FSM_IDLE   2'b00
`define HWCE_WRAPPER_FSM_START1 2'b01
`define HWCE_WRAPPER_FSM_START2 2'b10
`define HWCE_WRAPPER_FSM_RUN    2'b11
// typedef enum logic [1:0] { HWCE_WRAPPER_FSM_IDLE, HWCE_WRAPPER_FSM_START1, HWCE_WRAPPER_FSM_START2, HWCE_WRAPPER_FSM_RUN } hwce_wrapper_fsm_state_t;

`endif
