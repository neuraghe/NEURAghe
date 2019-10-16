# reset_design

exec mkdir -p work
exec mkdir -p hwce_lib
exec mkdir -p netlist/$::env(KIND)
exec mkdir -p reports/$::env(KIND)

exec rm -rf work/*
exec rm -rf hwce_lib/*

set N_CORES 4

# The clock input signal name.
set CLK  "clk"
# The reset input signal name.
set RST  "rst_n"
# The target clock period in library units.
#set CLK_PERIOD 1.17; 
set CLK_PERIOD [expr 1000.0 / $::env(FMAX)]
# The clock uncertainty in library units.
set CLK_UNCERTAINTY  0.15; 

saif_map -start

# compile approx_mul
#analyze -library hwce_lib -format sverilog "$APPROX_MUL_DIR/half_adder.sv"
#analyze -library hwce_lib -format sverilog "$APPROX_MUL_DIR/full_adder.sv"
#analyze -library hwce_lib -format sverilog "$APPROX_MUL_DIR/carry_lookahead_adder.sv"
#analyze -library hwce_lib -format sverilog "$APPROX_MUL_DIR/carry_save_adder.sv"
#analyze -library hwce_lib -format sverilog "$APPROX_MUL_DIR/mul.sv"
#analyze -library approx_lib -format sverilog "$APPROX_MUL_DIR/etm.sv"
#analyze -library approx_lib -format sverilog "$APPROX_MUL_DIR/approx_mul_smart.sv"
# compile engine
analyze -library hwce_lib -format sverilog "$PROJ_DIR/hwce_linebuffer.sv"
analyze -library hwce_lib -format sverilog "$PROJ_DIR/hwce_mac.sv"
analyze -library hwce_lib -format sverilog "$PROJ_DIR/hwce_addertree.sv"
analyze -library hwce_lib -format sverilog "$PROJ_DIR/hwce_engine_fsm.sv"
analyze -library hwce_lib -format sverilog "$PROJ_DIR/hwce_insert_px.sv"
analyze -library hwce_lib -format sverilog "$PROJ_DIR/hwce_drop_px.sv"
analyze -library hwce_lib -format sverilog "$PROJ_DIR/hwce_engine.sv"
# compile weight loader
analyze -library hwce_lib -format sverilog "$PROJ_DIR/weight_loader_3x3.v"
analyze -library hwce_lib -format sverilog "$PROJ_DIR/weight_loader_5x5.v"
analyze -library hwce_lib -format sverilog "$PROJ_DIR/weight_loader_7x7.v"
analyze -library hwce_lib -format sverilog "$PROJ_DIR/weight_loader_9x9.v"
analyze -library hwce_lib -format sverilog "$PROJ_DIR/weight_loader_11x11.v"
# compile hwpe_sm & axi
analyze -library hwce_lib -format sverilog "$HWPE_SM_DIR/rtl/hwpe_sm_decoder.sv"
analyze -library hwce_lib -format sverilog "$HWPE_SM_DIR/rtl/hwpe_sm_encoder.sv"
analyze -library hwce_lib -format sverilog "$HWPE_SM_DIR/rtl/hwpe_sm_address.sv"
analyze -library hwce_lib -format sverilog "$HWPE_SM_DIR/rtl/hwpe_sm_controller.sv"
analyze -library hwce_lib -format sverilog "$HWPE_SM_DIR/rtl/hwpe_sm_regfile.sv"
analyze -library hwce_lib -format sverilog "$HWPE_SM_DIR/rtl/hwpe_sm_slave.sv"
analyze -library hwce_lib -format sverilog "$HWPE_SM_DIR/rtl/hwpe_sm_wrapper.sv"
analyze -library hwce_lib -format sverilog "$HWPE_SM_DIR/rtl/axi/hwpe_axi_fifo.sv"
analyze -library hwce_lib -format sverilog "$HWPE_SM_DIR/rtl/axi/hwpe_axi_fifo_earlystall.sv"
analyze -library hwce_lib -format sverilog "$HWPE_SM_DIR/rtl/axi/hwpe_axi_addressgen.sv"
analyze -library hwce_lib -format sverilog "$HWPE_SM_DIR/rtl/axi/hwpe_axi_source.sv"
analyze -library hwce_lib -format sverilog "$HWPE_SM_DIR/rtl/axi/hwpe_axi_sink.sv"
# compile wrapper & top
analyze -library hwce_lib -format sverilog "$PROJ_DIR/hwce_wrapper.sv"
analyze -library hwce_lib -format sverilog "$PROJ_DIR/hwce_top.sv"

set filter_size $::env(FILTER_SIZE)
set linebuffer_width [expr $::env(LINEBUFFER_WIDTH)+${filter_size}/2]
elaborate hwce_top -library hwce_lib -parameters FILTER_SIZE=${filter_size},LINEBUFFER_WIDTH=${linebuffer_width}

link > reports/$::env(KIND)/link_presyn.log

# clocks
create_clock $CLK -period $CLK_PERIOD
set_clock_uncertainty $CLK_UNCERTAINTY [all_clocks]
set_dont_touch_network [all_clocks]
# resets
remove_driving_cell $RST
set_drive 0 $RST
set_dont_touch_network $RST

# Delay from interconnects is supposed to be higher than the one from the CatC module
set DELAY_CLUSTER [expr $CLK_PERIOD/4]

set_input_delay  -clock clk [expr $DELAY_CLUSTER] [get_ports * -filter "@port_direction == in "]
set_output_delay -clock clk [expr $DELAY_CLUSTER] [get_ports * -filter "@port_direction == out"]
set_max_area 50000

check_design > reports/$::env(KIND)/check_design_presyn.log

# setup reg retiming
# set_register_type -flip_flop C12T32_LL_SDFPHRQX8
# set_optimize_registers -designs [get_designs hwce_engine*]     false
# set_optimize_registers -designs [get_designs hwce_linebuffer*] false
# set_optimize_registers -designs [get_designs hwce_mac*]       -async_transform decompose -sync_transform decompose true 
# set_optimize_registers -designs [get_designs hwce_addertree*] -async_transform decompose -sync_transform decompose true

set_host_options -max_cores $N_CORES
set_power_prediction true
compile_ultra -no_autoungroup -retime

# SAIF mapping for power analysis
read_saif -auto_map_names -input ../simu/export.saif -instance_name testbench/hwce_top_gen\[0\]\.DUT -verbose

# for reg retiming
# remove_attribute [get_cells -hier -filter "@ref_name==**SEQGEN**" *] dont_touch
# set_transform_for_retiming [get_cells -hierarchical u_linebuffer] dont_retime

check_design                    > reports/$::env(KIND)/check_design.log
report_area -nosplit -hierarchy > reports/$::env(KIND)/area.log
report_timing    > reports/$::env(KIND)/timing.log
report_power     > reports/$::env(KIND)/power.log

#write_file -format verilog -hierarchy -output netlist/$::env(KIND)/hwce_top.v
#write_file -format svsim   -hierarchy -output netlist/$::env(KIND)/hwce_top.sv
write_file -format ddc     -hierarchy -output netlist/$::env(KIND)/hwce_top.ddc
#write_sdf netlist/$::env(KIND)/hwce_top.sdf

exit

