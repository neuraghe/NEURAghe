#!/bin/bash
# full HWCE sim script
#  
export OPT_VHDL="-64 -novopt -93"
export OPT_VLOG="-64 -sv +incdir+. +incdir+../testbench +incdir+../rtl +incdir+../../hwpe-sm/rtl/axi +incdir+../../hwpe-sm/rtl +nowarnSVCHK"
export HWPE_SM_LIB="../../hwpe-sm/rtl"

if [ -n $FILTER_SIZE ] ; then
  export FILTER_SIZE=5
fi

rm -rf work
vlib work
vmap work work
# compile DW simulation libs
vlog $OPT_VLOG -reportprogress 300 -work work /opt/cad/synopsys/syn_vI-2013.12-SP1/dw/dw02/src_ver/DW_mult_pipe.v
vlog $OPT_VLOG -reportprogress 300 -work work /opt/cad/synopsys/syn_vI-2013.12-SP1/dw/dw02/src_ver/DW02_mult.v
vlog $OPT_VLOG -reportprogress 300 -work work /opt/cad/synopsys/syn_vI-2013.12-SP1/dw/dw02/src_ver/DW02_mult_2_stage.v
vlog $OPT_VLOG -reportprogress 300 -work work /opt/cad/synopsys/syn_vI-2013.12-SP1/dw/dw02/src_ver/DW02_mult_3_stage.v
vlog $OPT_VLOG -reportprogress 300 -work work /opt/cad/synopsys/syn_vI-2013.12-SP1/dw/dw02/src_ver/DW02_mult_4_stage.v
vlog $OPT_VLOG -reportprogress 300 -work work /opt/cad/synopsys/syn_vI-2013.12-SP1/dw/dw02/src_ver/DW02_mult_5_stage.v
vlog $OPT_VLOG -reportprogress 300 -work work /opt/cad/synopsys/syn_vI-2013.12-SP1/dw/dw02/src_ver/DW02_mult_6_stage.v
# compile scm
vlog $OPT_VLOG -reportprogress 300 -work work ../../../common_cells/cluster_clock_gating.sv
vlog $OPT_VLOG -reportprogress 300 -work work ../../../scm/generic_scm/register_file_1r_1w_all.sv
#vlog $OPT_VLOG -reportprogress 300 -work work ../../../scm/generic_scm/register_file_2r_1w_asymm.sv
vlog $OPT_VLOG -reportprogress 300 -work work ../../../../pulp3/fpga/rtl/register_file_2r_1w_asymm.sv
# compile hwce
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_linebuffer_fifo.sv  
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_linebuffer_shiftreg.sv  
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_muls.sv        
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_addertree.sv  
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_engine_fsm.sv 
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_insert_px.sv
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_drop_px.sv
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_engine.sv     
# compile weight loader
#vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/weight_loader_3x3.v
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/weight_loader_5x5.sv 
#vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/weight_loader_7x7.v
#vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/weight_loader_9x9.v
#vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/weight_loader_11x11.v
# compile hwpe_sm & axi
vlog $OPT_VLOG -reportprogress 300 -work work $HWPE_SM_LIB/hwpe_sm_decoder.sv              
vlog $OPT_VLOG -reportprogress 300 -work work $HWPE_SM_LIB/hwpe_sm_encoder.sv              
vlog $OPT_VLOG -reportprogress 300 -work work $HWPE_SM_LIB/hwpe_sm_address.sv              
vlog $OPT_VLOG -reportprogress 300 -work work $HWPE_SM_LIB/hwpe_sm_controller.sv           
vlog $OPT_VLOG -reportprogress 300 -work work $HWPE_SM_LIB/hwpe_sm_regfile.sv              
vlog $OPT_VLOG -reportprogress 300 -work work $HWPE_SM_LIB/hwpe_sm_slave.sv                
vlog $OPT_VLOG -reportprogress 300 -work work $HWPE_SM_LIB/hwpe_sm_wrapper.sv              
vlog $OPT_VLOG -reportprogress 300 -work work $HWPE_SM_LIB/axi/hwpe_axi_fifo.sv            
vlog $OPT_VLOG -reportprogress 300 -work work $HWPE_SM_LIB/axi/hwpe_axi_fifo_earlystall.sv 
vlog $OPT_VLOG -reportprogress 300 -work work $HWPE_SM_LIB/axi/hwpe_axi_addressgen.sv      
vlog $OPT_VLOG -reportprogress 300 -work work $HWPE_SM_LIB/axi/hwpe_axi_source.sv          
vlog $OPT_VLOG -reportprogress 300 -work work $HWPE_SM_LIB/axi/hwpe_axi_sink.sv            
vlog $OPT_VLOG -reportprogress 300 -work work $HWPE_SM_LIB/axi/hwpe_axi_wrapper.sv         
# compile wrapper & top
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_wrapper.sv 
vlog $OPT_VLOG -reportprogress 300 -work work ../rtl/hwce_top.sv     
# compile testbench
vlog $OPT_VLOG -reportprogress 300 -work work ../testbench/dummy_memory.sv
vlog $OPT_VLOG -reportprogress 300 -work work ../testbench/contention_memory.sv 
vlog $OPT_VLOG -reportprogress 300 -work work ../testbench/testbench_full.sv 

# start simulation
linebuffer_width=`expr ${LINEBUFFER_WIDTH} + ${FILTER_SIZE} / 2`

vsim -gui -64 -t 1ps -voptargs=+acc -do wave.do -GFILTER_SIZE=${FILTER_SIZE} -GLINEBUFFER_WIDTH=32 -L work work.testbench &

