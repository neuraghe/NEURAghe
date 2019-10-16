#!/bin/bash
latch=0 # latch-based FIFOs are BROKEN!!!
for linebuffer in 8 16 32; do
  # for filter in 5; do
  # for approx in 0; do
  # for time_mux in 1 2; do 
  # for pipe_mul in 0 1; do
  # for pipe_add in 0 1; do
  for filter in 5; do
  for approx in 0; do
  for time_mux in 0 1; do
  for pipe_mul in 0; do
  for pipe_add in 0; do
    if [ $latch -eq 1 ]; then
      islatch="_latchfifo"
    else
      islatch="_flopfifo"
    fi
    if [ $time_mux -eq 2 ]; then
      istm="_timemux${time_mux}"
    else
      istm=""
    fi
    if [ $approx -ne 0 ]; then
      isapprox="_approx"
    else
      isapprox=""
    fi
    pipes="${pipe_mul}${pipe_add}"
    export KIND=hwce_v2.3_ungroup_${filter}x${filter}_lb${linebuffer}${istm}${isapprox}_p${pipes}
    export LINEBUFFER_WIDTH=${linebuffer}
    export FILTER_SIZE=${filter}
    export LATCH=${latch}
    export FMAX=80.0
    export APPROX=${approx}
    export PIPE_MUL=${pipe_mul}
    export PIPE_ADD=${pipe_add}
    export TIME_MUX=${time_mux}
    mkdir -p reports/${KIND}
    mkdir -p netlist/${KIND}
    dc_shell -topographical_mode -f synth.tcl | tee reports/${KIND}/dc_synthesis.log
  done
  done
  done
  done
  done
done
