# basic HWCE sim script
#  

set HWPE_SM_LIB=/home0/fconti/Projects/hw/hwpe_sm/rtl

set OPT_VHDL="-V93 -LINEDEBUG -NOCopyright -messages -update"
set OPT_VLOG="-sv -LINEDEBUG -NOCopyright -messages -update -INCDIR . -INCDIR ../rtl/ -INCDIR ../testbench/ -INCDIR ${HWPE_SM_LIB}/ -INCDIR ${HWPE_SM_LIB}/axi/"

mkdir -p ncsim/work
rm -rf ncsim/work/*

# compile hwce
ncvlog $OPT_VLOG -work work ../rtl/hwce_linebuffer.sv || exit 1 
ncvlog $OPT_VLOG -work work ../rtl/hwce_mac.sv        || exit 1
ncvlog $OPT_VLOG -work work ../rtl/hwce_addertree.sv  || exit 1
ncvlog $OPT_VLOG -work work ../rtl/hwce_engine_fsm.sv || exit 1
ncvlog $OPT_VLOG -work work ../rtl/hwce_engine.sv     || exit 1
# compile weight loader
ncvlog $OPT_VLOG -work work ../rtl/hwce_weight_loader_5x5.v || exit 1
# compile hwpe_sm & axi
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/hwpe_sm_decoder.sv              || exit 1
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/hwpe_sm_encoder.sv              || exit 1
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/hwpe_sm_address.sv              || exit 1
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/hwpe_sm_controller.sv           || exit 1
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/hwpe_sm_regfile.sv              || exit 1
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/hwpe_sm_slave.sv                || exit 1
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/hwpe_sm_wrapper.sv              || exit 1
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/axi/hwpe_axi_fifo.sv            || exit 1
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/axi/hwpe_axi_fifo_earlystall.sv || exit 1
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/axi/hwpe_axi_addressgen.sv      || exit 1
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/axi/hwpe_axi_source.sv          || exit 1
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/axi/hwpe_axi_sink.sv            || exit 1
ncvlog $OPT_VLOG -work work $HWPE_SM_LIB/axi/hwpe_axi_wrapper.sv         || exit 1
# compile wrapper & top
ncvlog $OPT_VLOG -work work ../rtl/hwce_wrapper.sv || exit 1
ncvlog $OPT_VLOG -work work ../rtl/hwce_top.sv     || exit 1
# compile testbench
ncvhdl $OPT_VHDL -work work ../testbench/dummy_memory.vhd  || exit 1
ncvlog $OPT_VLOG -work work ../testbench/testbench_full.sv || exit 1

# start simulation
ncelab -access +rwc testbench || exit 1
ncsim -gui -i ncsim_in.tcl testbench & 
