# Stall probability
# set P_STALL=0.1
# Multiple stall (issue 1) workaround flag (True if active)
#set STALL_AND_FLAG=True
# Buffering Mux (issue 3) workaround flag (1 if active)
#set MXWT_FLAG=1
# True memory or just random traffic generator
set MEMORY='"TRUE"'

set OPT_VHDL="-V93 -LINEDEBUG -NOCopyright -messages -update"
set OPT_VLOG="-sv -LINEDEBUG -NOCopyright -messages -update -INCDIR . -INCDIR ../rtl/ -INCDIR ../rtl/axi/ -INCDIR ../testbench/"

set HWPE_SM_LIB="../rtl/"
set CATC_LIB="/home0/fconti/Projects/hw/catapult/new_idct/"

#vim /home/contif/testbench_fd/src/hw_acc_pkg.vhd  

rm -rf ./ncsim/hwpe_sm_lib/*
rm -rf ./ncsim/work/*
rm -rf ./ncsim/catc_lib/*

cd ../rtl; rm hwpe_sm_pkg.vhd; ln -s hwpe_sm_pkg_ncsim.vhd hwpe_sm_pkg.vhd; cd ../simu

ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/axi/hwpe_axi_fifo.sv
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/axi/hwpe_axi_fifo_earlystall.sv
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/axi/hwpe_axi_addressgen.sv
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/axi/hwpe_axi_source.sv
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/axi/hwpe_axi_sink.sv
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_decoder.sv
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_encoder.sv
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_regfile.sv
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_slave.sv
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/axi/hwpe_axi_wrapper.sv
ncvlog $OPT_VLOG -work work ../testbench/axi_hw_accel.sv
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/axi/hwpe_axi_top.sv
ncvhdl $OPT_VHDL -work work ../testbench/dummy_memory.vhd       || exit 1
ncvlog $OPT_VLOG -work work ../testbench/axi_testbench.sv          || exit 1

ncelab -access +rwc testbench || exit 1

ncsim -gui -i ncsim_in.tcl testbench & 

