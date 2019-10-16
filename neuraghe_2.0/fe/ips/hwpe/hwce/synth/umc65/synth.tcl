# reset_design

set kind $::env(KIND)

exec mkdir -p work
exec mkdir -p hwce_lib
exec mkdir -p netlist/$kind
exec mkdir -p reports/$kind

exec rm -rf work/*
exec rm -rf hwce_lib/*

set N_CORES 4 
# 4

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

# compile scm
analyze -library hwce_lib -format sverilog "../../../../common_cells/cluster_clock_gating_umc065.sv"
analyze -library hwce_lib -format sverilog "../../../../scm/generic_scm/register_file_2r_1w_asymm.sv"
analyze -library hwce_lib -format sverilog "../../../../scm/generic_scm/register_file_1r_1w_all.sv"
# compile approx_mul
analyze -library hwce_lib -format sverilog "$APPROX_MUL_DIR/half_adder.sv"
analyze -library hwce_lib -format sverilog "$APPROX_MUL_DIR/full_adder.sv"
analyze -library hwce_lib -format sverilog "$APPROX_MUL_DIR/carry_lookahead_adder.sv"
analyze -library hwce_lib -format sverilog "$APPROX_MUL_DIR/carry_save_adder.sv"
analyze -library hwce_lib -format sverilog "$APPROX_MUL_DIR/mul.sv"
analyze -library hwce_lib -format sverilog "$APPROX_MUL_DIR/etm.sv"
analyze -library hwce_lib -format sverilog "$APPROX_MUL_DIR/approx_mul.sv"
# compile engine
if { $::env(LBTYPE) == "shiftreg" } {
  analyze -library hwce_lib -format sverilog "$PROJ_DIR/hwce_linebuffer_shiftreg.sv"
} else {
  analyze -library hwce_lib -format sverilog "$PROJ_DIR/hwce_linebuffer_fifo.sv"
}
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
analyze -library hwce_lib -format sverilog "$PROJ_DIR/hwce_top_wrap.sv"

set filter_size $::env(FILTER_SIZE)
set lbtype $::env(LBTYPE)
set latch $::env(LATCH)
set approx $::env(APPROX)
if { $::env(LBTYPE) == "shiftreg" } {
  set linebuffer_width [expr $::env(LINEBUFFER_WIDTH)+${filter_size}/2]
  elaborate hwce_top_wrap -library hwce_lib -parameters FILTER_SIZE=${filter_size},LINEBUFFER_WIDTH=${linebuffer_width},LATCH_LINEBUFFER=${latch},LATCH_REGFILE=0,LATCH_FIFO=0,LINEBUFFER_KIND=0,PIPE_STAGES_MAC=1,PIPE_STAGES_ADD=1,APPROXIMATION=${approx} > reports/$kind/elaborate.log
} else {
  set linebuffer_width $::env(LINEBUFFER_WIDTH)
  elaborate hwce_top_wrap -library hwce_lib -parameters FILTER_SIZE=${filter_size},LINEBUFFER_WIDTH=${linebuffer_width},LATCH_LINEBUFFER=${latch},LATCH_REGFILE=0,LATCH_FIFO=0,LINEBUFFER_KIND=1,PIPE_STAGES_MAC=1,PIPE_STAGES_ADD=1,APPROXIMATION=${approx} > reports/$kind/elaborate.log
}

link > reports/$kind/link_presyn.log

# scenario
create_scenario SLOW_1.08
current_scenario SLOW_1.08
set_voltage 1.08  -object_list  {VDD}
set_voltage 0.00  -object_list  {GND}
set_operating_conditions uk65lscllmvbbl_108c125_wc
set_scenario_options -setup true  -dynamic_power true -leakage_power true -hold false
set_tlu_plus_files -max_tluplus $TLUPLUS_MAX_FILE -tech2itf_map $MAP_FILE
set_related_supply_net -object_list [get_ports * -filter {@port_direction == out}]  -power VDD -ground GND
set_related_supply_net -object_list [get_ports * -filter {@port_direction == in}]  -power VDD -ground GND

# multicycle/false paths
set_false_path -from u_hwce_top/u_wrapper/u_slave/u_regfile/regfile_latch_gen.u_regfile_latch/MemContent*
set_multicycle_path 2 -setup -from u_hwce_top/u_wrapper/u_slave/u_regfile/regfile_latch_gen.u_regfile_latch/ReadData*
set_multicycle_path 2 -setup -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[0].fifo_latch_gen.u_fifo_latch/ReadData_a*
set_multicycle_path 2 -setup -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[0].fifo_latch_gen.u_fifo_latch/ReadData_b*
set_multicycle_path 2 -setup -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[1].fifo_latch_gen.u_fifo_latch/ReadData_a*
set_multicycle_path 2 -setup -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[1].fifo_latch_gen.u_fifo_latch/ReadData_b*
set_multicycle_path 2 -setup -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[2].fifo_latch_gen.u_fifo_latch/ReadData_a*
set_multicycle_path 2 -setup -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[2].fifo_latch_gen.u_fifo_latch/ReadData_b*
set_multicycle_path 2 -setup -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[3].fifo_latch_gen.u_fifo_latch/ReadData_a*
set_multicycle_path 2 -setup -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[3].fifo_latch_gen.u_fifo_latch/ReadData_b*
set_multicycle_path 2 -setup -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/fifo_latch_gen.u_fifo_latch/ReadData_a*
set_multicycle_path 2 -setup -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/fifo_latch_gen.u_fifo_latch/ReadData_b*
set_multicycle_path 1 -hold -from u_hwce_top/u_wrapper/u_slave/u_regfile/regfile_latch_gen.u_regfile_latch/ReadData*
set_multicycle_path 1 -hold -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[0].fifo_latch_gen.u_fifo_latch/ReadData_a*
set_multicycle_path 1 -hold -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[0].fifo_latch_gen.u_fifo_latch/ReadData_b*
set_multicycle_path 1 -hold -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[1].fifo_latch_gen.u_fifo_latch/ReadData_a*
set_multicycle_path 1 -hold -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[1].fifo_latch_gen.u_fifo_latch/ReadData_b*
set_multicycle_path 1 -hold -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[2].fifo_latch_gen.u_fifo_latch/ReadData_a*
set_multicycle_path 1 -hold -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[2].fifo_latch_gen.u_fifo_latch/ReadData_b*
set_multicycle_path 1 -hold -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[3].fifo_latch_gen.u_fifo_latch/ReadData_a*
set_multicycle_path 1 -hold -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[3].fifo_latch_gen.u_fifo_latch/ReadData_b*
set_multicycle_path 1 -hold -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/fifo_latch_gen.u_fifo_latch/ReadData_a*
set_multicycle_path 1 -hold -from u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/fifo_latch_gen.u_fifo_latch/ReadData_b*

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

check_design > reports/$kind/check_design_presyn.log

# setup reg retiming
# set_register_type -flip_flop C12T32_LL_SDFPHRQX8
set_optimize_registers -designs [get_designs hwce_engine*]     false
set_optimize_registers -designs [get_designs hwce_linebuffer*] false
set_optimize_registers -designs [get_designs hwce_mac*]       -async_transform decompose true 
set_optimize_registers -designs [get_designs hwce_addertree*] -async_transform decompose true

# ungroup
set_dont_touch [get_designs hwce_linebuffer*] true
set_dont_touch [get_designs hwce_regfile] true
set_dont_touch [get_designs hwce_engine] true
set_dont_touch [get_cells u_hwce_top/u_wrapper/u_slave/u_regfile/regfile_latch_gen.u_regfile_latch] true
set_dont_touch [get_cells u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[3].fifo_latch_gen.u_fifo_latch] true
set_dont_touch [get_cells u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[2].fifo_latch_gen.u_fifo_latch] true
set_dont_touch [get_cells u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[1].fifo_latch_gen.u_fifo_latch] true
set_dont_touch [get_cells u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[0].fifo_latch_gen.u_fifo_latch] true
set_dont_touch [get_cells u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/fifo_latch_gen.u_fifo_latch] true
ungroup -all -flatten
set_dont_touch [get_designs hwce_regfile] false
set_dont_touch [get_designs hwce_linebuffer*] false
set_dont_touch [get_cells u_hwce_top/u_wrapper/u_slave/u_regfile/regfile_latch_gen.u_regfile_latch] false
set_dont_touch [get_cells u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[3].fifo_latch_gen.u_fifo_latch] false
set_dont_touch [get_cells u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[2].fifo_latch_gen.u_fifo_latch] false
set_dont_touch [get_cells u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[1].fifo_latch_gen.u_fifo_latch] false
set_dont_touch [get_cells u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/full_size_fifo_gen[0].fifo_latch_gen.u_fifo_latch] false
set_dont_touch [get_cells u_hwce_top/u_engine/linebuffer_fifo_gen.u_linebuffer/fifo_latch_gen.u_fifo_latch] false

set_host_options -max_cores $N_CORES
set_power_prediction true
compile_ultra -no_autoungroup -no_boundary_optimization -timing

# SAIF mapping for power analysis
read_saif -auto_map_names -input ../simu/export.saif -instance_name testbench/hwce_top_gen\[0\]\.DUT -verbose

# for reg retiming
# remove_attribute [get_cells -hier -filter "@ref_name==**SEQGEN**" *] dont_touch
# set_transform_for_retiming [get_cells -hierarchical u_linebuffer] dont_retime

check_design                    > reports/$kind/check_design.log
report_area -nosplit -hierarchy > reports/$kind/area.log
report_timing    > reports/$kind/timing.log
report_power     > reports/$kind/power.log
report_qor       > reports/$kind/qor.log
report_constraint -all_violators > reports/$kind/violations.log

write_file -format verilog -hierarchy -output netlist/$kind/hwce_top.v
write_file -format svsim   -hierarchy -output netlist/$kind/hwce_top.sv
write_file -format ddc     -hierarchy -output netlist/$kind/hwce_top.ddc

exit

