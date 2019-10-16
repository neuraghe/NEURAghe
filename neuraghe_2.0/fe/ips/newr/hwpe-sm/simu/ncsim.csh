# Stall probability
# set P_STALL=0.1
# Multiple stall (issue 1) workaround flag (True if active)
#set STALL_AND_FLAG=True
# Buffering Mux (issue 3) workaround flag (1 if active)
#set MXWT_FLAG=1
# True memory or just random traffic generator
set MEMORY='"TRUE"'

set OPT_VHDL="-V93 -LINEDEBUG -NOCopyright -messages -update"
set OPT_VLOG="-sv -LINEDEBUG -NOCopyright -messages -update -INCDIR . -INCDIR ../rtl/ -INCDIR ../testbench/"

set HWPE_SM_LIB="../rtl/"
set CATC_LIB="/home0/fconti/Projects/hw/catapult/new_idct/"

#vim /home/contif/testbench_fd/src/hw_acc_pkg.vhd  

rm -rf ./ncsim/hwpe_sm_lib/*
rm -rf ./ncsim/work/*
rm -rf ./ncsim/catc_lib/*

cd ../rtl; rm hwpe_sm_pkg.vhd; ln -s hwpe_sm_pkg_ncsim.vhd hwpe_sm_pkg.vhd; cd ../simu

#ncvhdl $OPT_VHDL -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_pkg.vhd || exit 1
#ncvhdl $OPT_VHDL -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_address.vhd            || exit 1
#ncvhdl $OPT_VHDL -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_sequencer_pipe.vhd     || exit 1
#ncvhdl $OPT_VHDL -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_controller_pack.vhd     || exit 1
#ncvhdl $OPT_VHDL -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_clk_control.vhd || exit 1 
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_decoder.sv || exit 1
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_encoder.sv || exit 1
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_address.sv || exit 1
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_controller.sv || exit 1
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_regfile.sv || exit 1
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_slave.sv || exit 1
ncvlog $OPT_VLOG -work hwpe_sm_lib $HWPE_SM_LIB/hwpe_sm_wrapper.sv || exit 1

ncvlog $OPT_VLOG -work work $CATC_LIB/concat_idct_hwpu_1m.v  || exit 1
ncvlog $OPT_VLOG -work work $CATC_LIB/concat_idct_hwpu_2m.v  || exit 1
ncvlog $OPT_VLOG -work work $CATC_LIB/concat_idct_hwpu_4m.v  || exit 1
ncvlog $OPT_VLOG -work work $CATC_LIB/concat_idct_hwpu_8m.v  || exit 1
ncvhdl $OPT_VHDL -work work ../testbench/dummy_memory.vhd       || exit 1

ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/hwpe_sm_top.sv

ncvlog $OPT_VLOG -work work ../testbench/testbench.sv          || exit 1

#ncelab testbench || exit 1
ncelab -access +rwc testbench || exit 1

ncsim -gui -i ncsim_in.tcl testbench & 

#simvision -input simvision.tcl

