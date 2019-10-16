# setup synplify project
project -new ./hwce.prj
set_option -technology Zynq
set_option -part XC7Z045
set_option -package FFG900
set_option -grade -2
set_option -top_module hwce_top
set_option -include_path {../../hwpe_sm/rtl;../../hwpe_sm/rtl/axi;../rtl}
set_option -result_base hwce
set_option -disable_io_insertion 1

set PROJ_DIR "../rtl/"
set HWPE_SM_DIR "../../hwpe_sm"

# compile engine
add_file -verilog -lib hwce_lib ../rtl/hwce_linebuffer.sv
add_file -verilog -lib hwce_lib ../rtl/hwce_mac.sv
add_file -verilog -lib hwce_lib ../rtl/hwce_addertree.sv
add_file -verilog -lib hwce_lib ../rtl/hwce_engine_fsm.sv
add_file -verilog -lib hwce_lib ../rtl/hwce_insert_px.sv
add_file -verilog -lib hwce_lib ../rtl/hwce_drop_px.sv
add_file -verilog -lib hwce_lib ../rtl/hwce_engine.sv
# compile weight loader
add_file -verilog -lib hwce_lib ../rtl/hwce_weight_loader_5x5.v
# compile hwpe_sm & axi
add_file -verilog -lib hwce_lib $HWPE_SM_DIR/rtl/hwpe_sm_decoder.sv
add_file -verilog -lib hwce_lib $HWPE_SM_DIR/rtl/hwpe_sm_encoder.sv
add_file -verilog -lib hwce_lib $HWPE_SM_DIR/rtl/hwpe_sm_address.sv
add_file -verilog -lib hwce_lib $HWPE_SM_DIR/rtl/hwpe_sm_controller.sv
add_file -verilog -lib hwce_lib $HWPE_SM_DIR/rtl/hwpe_sm_regfile.sv
add_file -verilog -lib hwce_lib $HWPE_SM_DIR/rtl/hwpe_sm_slave.sv
add_file -verilog -lib hwce_lib $HWPE_SM_DIR/rtl/hwpe_sm_wrapper.sv
add_file -verilog -lib hwce_lib $HWPE_SM_DIR/rtl/axi/hwpe_axi_fifo.sv
add_file -verilog -lib hwce_lib $HWPE_SM_DIR/rtl/axi/hwpe_axi_fifo_earlystall.sv
add_file -verilog -lib hwce_lib $HWPE_SM_DIR/rtl/axi/hwpe_axi_addressgen.sv
add_file -verilog -lib hwce_lib $HWPE_SM_DIR/rtl/axi/hwpe_axi_source.sv
add_file -verilog -lib hwce_lib $HWPE_SM_DIR/rtl/axi/hwpe_axi_sink.sv
# compile wrapper & top
add_file -verilog -lib hwce_lib ../rtl/hwce_wrapper.sv
add_file -verilog -lib hwce_lib ../rtl/hwce_top.sv

project -run
project -save hwce.prj
