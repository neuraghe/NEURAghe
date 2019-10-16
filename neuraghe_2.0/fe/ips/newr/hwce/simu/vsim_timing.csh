# basic HWCE sim script
#  
set OPT_VHDL="-64 -novopt -93"
set OPT_SVLOG="-64 -sv +incdir+. +nowarnSVCHK"
set OPT_VLOG="-64 +incdir+."

rm -rf vsim/work/*
vlib vsim/work
vmap vsim/work vsim/work
# compile hwce
vlog $OPT_VLOG -reportprogress 300 -work work /opt/techlibs/cmos028/C32_SC_12_CORE_LL_C28@1.1@20111209.1/behaviour/verilog/C32_SC_12_CORE_LL.v || exit 1
vlog $OPT_VLOG -reportprogress 300 -work work /opt/techlibs/cmos028/C32_SC_12_CLK_LL_C28@1.1@20111209.0/behaviour/verilog/C32_SC_12_CLK_LL.v || exit 1
vlog $OPT_VLOG -reportprogress 300 -work work ../synth/netlist/hwce_engine.v || exit 1 
vlog $OPT_SVLOG -reportprogress 300 -work work ../synth/netlist/hwce_engine_wrap.sv || exit 1 
vlog $OPT_SVLOG -reportprogress 300 -work work ../testbench/testbench_timing.sv || exit 1

# start simulation
vsim -64 -t 1ps -novopt -do wave.do -L work work.testbench
