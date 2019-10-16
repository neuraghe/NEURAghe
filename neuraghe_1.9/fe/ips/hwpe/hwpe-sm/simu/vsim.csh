# basic HWPE sim script
#  
set OPT_VHDL="-64 -novopt -93"
set OPT_VLOG="-64 -sv +incdir+."

rm -rf vsim/*
vlib vsim/hwpe_sm_lib
vlib vsim/catc_lib
vlib vsim/work
vmap work        vsim/work
vmap catc_lib    vsim/catc_lib
vmap hwpe_sm_lib vsim/hwpe_sm_lib
# compile hwpe_sm_wrapper
cd ../rtl; rm hwpe_sm_pkg.vhd; ln -s hwpe_sm_pkg_vsim.vhd hwpe_sm_pkg.vhd; cd ../simu
vcom $OPT_VHDL -reportprogress 30  -work hwpe_sm_lib ../rtl/hwpe_sm_pkg.vhd
vcom $OPT_VHDL -reportprogress 30  -work hwpe_sm_lib ../rtl/hwpe_sm_address.vhd
vcom $OPT_VHDL -reportprogress 30  -work hwpe_sm_lib ../rtl/hwpe_sm_clk_control.vhd
vcom $OPT_VHDL -reportprogress 30  -work hwpe_sm_lib ../rtl/hwpe_sm_controller_pack.vhd
vcom $OPT_VHDL -reportprogress 30  -work hwpe_sm_lib ../rtl/hwpe_sm_sequencer_new.vhd
vcom $OPT_VHDL -reportprogress 30  -work hwpe_sm_lib ../rtl/hwpe_sm_sequencer_pipe.vhd
vlog $OPT_VLOG -reportprogress 300 -work hwpe_sm_lib ../rtl/hwpe_sm_decoder.sv
vlog $OPT_VLOG -reportprogress 300 -work hwpe_sm_lib ../rtl/hwpe_sm_encoder.sv
vlog $OPT_VLOG -reportprogress 300 -work hwpe_sm_lib ../rtl/hwpe_sm_regfile.sv
vlog $OPT_VLOG -reportprogress 300 -work hwpe_sm_lib ../rtl/hwpe_sm_slave.sv
vlog $OPT_VLOG -reportprogress 300 -work hwpe_sm_lib ../rtl/hwpe_sm_wrapper.sv
# compile catc hwpu
vlog $OPT_VLOG -reportprogress 300 -work catc_lib /home0/fconti/Dropbox/Projects/hw/catapult/new_idct/concat_idct_hwpu_1m.v
vlog $OPT_VLOG -reportprogress 300 -work catc_lib /home0/fconti/Dropbox/Projects/hw/catapult/new_idct/concat_idct_hwpu_2m.v
vlog $OPT_VLOG -reportprogress 300 -work catc_lib /home0/fconti/Dropbox/Projects/hw/catapult/new_idct/concat_idct_hwpu_4m.v
vlog $OPT_VLOG -reportprogress 300 -work catc_lib /home0/fconti/Dropbox/Projects/hw/catapult/new_idct/concat_idct_hwpu_8m.v
# compile testbench
vcom $OPT_VHDL -reportprogress 300 -work work ../testbench/dummy_memory.vhd
vlog $OPT_VLOG -reportprogress 300 -work work ../testbench/testbench.sv

# start simulation
vsim -64 -t 1ps -voptargs=+acc -do wave.do -L work -L hwpe_sm_lib -L catc_lib work.testbench
