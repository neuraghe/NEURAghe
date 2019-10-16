# basic HWCE sim script
#  
set OPT_VHDL="-64 -novopt -93"
set OPT_VLOG="-64 -sv +incdir+. +nowarnSVCHK"

rm -rf vsim/work/*
vlib vsim/work
vmap vsim/work vsim/work
# compile hwce
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_linebuffer.sv || exit 1 
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_mac.sv        || exit 1
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_addertree.sv  || exit 1
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_engine_fsm.sv || exit 1
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_engine.sv     || exit 1
vlog $OPT_VLOG -reportprogress 300 -work work ../testbench/testbench.sv || exit 1

# start simulation
vsim -64 -t 1ps -voptargs=+acc -do wave.do -L work work.testbench
