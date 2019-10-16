#!/bin/bash
for linebuffer in 32; do
  for filter in 5; do
  for lbtype in "fifo"; do
  for latch in 1; do
  for approx in 0; do
    if [ $latch -eq 1 ]; then
      islatch="_latch"
    else
      islatch=""
    fi
    if [ $approx -ne 0 ]; then
      isapprox="_approx"
    else
      isapprox=""
    fi
    export KIND=${filter}x${filter}_${lbtype}_${linebuffer}${islatch}${isapprox}
    export LINEBUFFER_WIDTH=${linebuffer}
    export FILTER_SIZE=${filter}
    export LATCH=${latch}
    export FMAX=500.0
    export LBTYPE=${lbtype}
    export APPROX=${approx}
    mkdir -p reports/${KIND}
    mkdir -p netlist/${KIND}
    dc_shell -topographical_mode -f synth.tcl | tee reports/${KIND}/dc_synthesis.log
  done
  done
  done
  done
done
