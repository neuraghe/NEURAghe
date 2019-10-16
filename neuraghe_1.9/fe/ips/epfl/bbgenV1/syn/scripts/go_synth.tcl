set myTopLevel ${DESIGN_NAME}

define_design_lib BBGEN_LIB -path ./work_bbgen

#SYNTHESIS SCRIPT
source ./scripts/utils/print_logo.tcl
suppress_message {VER-130 }
after 3000

source ./scripts/utils/print_lib_setup.tcl 
after 3000

#1) PREPARE THE ENVIRONMET

set timing_enable_through_paths true

set reAnalyzeRTL "TRUE"
set doDFT "FALSE"

set OUT_FILENAME ${myTopLevel}

sh mkdir -p ./mapped
sh mkdir -p ./unmapped
sh mkdir -p ./export
sh mkdir -p ./reports

#2) ANALIZE THE RTL CODE or Read the GTECH 

if { $reAnalyzeRTL == "TRUE" } {
    file delete -force -- ./work ./work_bbgen
    source -echo -verbose ./scripts/analyze/analyze.tcl
    elaborate ${myTopLevel} -library BBGEN_LIB
    write -format verilog -hier -o ./unmapped/${myTopLevel}_unmapped.v
    write -format ddc -hier -o ./unmapped/${myTopLevel}_unmapped.ddc ${myTopLevel}
} else {
     read_file  -format ddc  ./unmapped/${myTopLevel}_unmapped.ddc
}

current_design ${myTopLevel}

link
after 1000
uniquify


#3) Ungroup script
#source -echo -verbose ./scripts/ungroup_script.tcl
after 3000


#5) LOAD UPF
#source ./scripts/pulp_chip.upf
after 3000


#6) LOAD SCENARIOS CONSTRAINT
#Contraint files here
#MMMC Synthesis
create_scenario NOMINAL_VOLTAGE
create_scenario LOW_VOLTAGE

current_scenario NOMINAL_VOLTAGE
set_voltage 0.8 -object_list {vdd}
set_voltage 0.0 -object_list {gnd}
source -echo -verbose ./scripts/constraints_NOMINAL_VOLTAGE.sdc
#source ./scripts/force_LS_pgpin.tcl
set_operating_conditions ss28_0.80V_125C
set_tlu_plus_files -max_tluplus $TLUPLUS_MAX_FILE -tech2itf_map $MAP_FILE

set_related_supply_net -object_list [get_ports * -filter {@port_direction == out}]  -power vdd -ground gnd
set_related_supply_net -object_list [get_ports * -filter {@port_direction == in}]   -power vdd -ground gnd
set_scenario_options -setup true  -dynamic_power true -leakage_power true -hold false
#source -echo -verbose  ./scripts/create_path_groups.tcl



current_scenario LOW_VOLTAGE
set_voltage 0.6 -object_list {vdd}
set_voltage 0.0 -object_list {gnd}
source -echo -verbose ./scripts/constraints_LOW_VOLTAGE.sdc
#source ./scripts/force_LS_pgpin.tcl
set_operating_conditions ss28_0.60V_125C
set_tlu_plus_files -max_tluplus $TLUPLUS_MAX_FILE -tech2itf_map $MAP_FILE

set_related_supply_net -object_list [get_ports * -filter {@port_direction == out}]  -power vdd -ground gnd
set_related_supply_net -object_list [get_ports * -filter {@port_direction == in}]   -power vdd -ground gnd
set_scenario_options -setup true  -dynamic_power true -leakage_power true -hold false
#source -echo -verbose  ./scripts/create_path_groups.tcl

if { $doDFT == "TRUE" } {
    source ./scripts/setup_dft.tcl
    create_test_protocol
    dft_drc -verbose > ./reports/dft_pre_violations.rpt
}

#7) INSERT CLOCK GATE
sh mkdir -p ./reports
#source -echo -verbose ./scripts/insert_clock_gating.tcl


#8) MISC
source ./rm_setup/dont_use_cells.tcl
source ./rm_setup/low_drive_cells.tcl
source ./rm_setup/delay_cells.tcl


set_dont_use [get_lib_cells $STM_techDontUseCellList]
set_dont_use [get_lib_cells $STM_techDelayCellList]
set_dont_use [get_lib_cells $STM_techLowDriveCellsList]
set_dont_use C28SOI_SC_8_CLK_LR/*


#10) Read the Floorplan
#extract_physical_constraints ./def/ulpcluster.def


#11) Compile Ultra
if { $doDFT == "TRUE" } {
    compile_ultra -no_autoungroup -no_boundary_optimization -timing -gate_clock -scan
    write -f ddc -hierarchy  -output ./mapped/${OUT_FILENAME}_predft.ddc
    preview_dft -verbose > ./reports/dft_preview_violations.rpt
    insert_dft
    dft_drc -verbose > ./reports/dft_post_violations.rpt
    write -f ddc -hierarchy  -output ./mapped/${OUT_FILENAME}_postdft.ddc
} else {
    compile_ultra -no_autoungroup -no_boundary_optimization -timing -gate_clock
}


#12) Incremental Compile
set_fix_multiple_port_nets -all -buffer_constants -outputs -feedthroughs [get_designs *]
set_scenario_options -scenarios {LOW_VOLTAGE NOMINAL_VOLTAGE}  -setup true  -leakage_power true  -dynamic_power true 

if { $doDFT == "TRUE" } {
    compile_ultra -inc -scan
} else {
    compile_ultra -inc
}

report_timing -voltage -scenarios LOW_VOLTAGE      > reports/LOW_VOLTAGE_timing.rpt
report_timing -voltage -scenarios NOMINAL_VOLTAGE  > reports/NOMINAL_VOLTAGE_timing.rpt

#source scripts/genReportsLS.tcl


#13)
write -f ddc -hierarchy  -output ./mapped/$OUT_FILENAME.ddc

change_names -rules verilog -hier
define_name_rules fixbackslashes -allowed "A-Za-z0-9_" -first_restricted "\\" -remove_chars
change_names -rule fixbackslashes -h

if { $doDFT == "TRUE" } {
    write_test_model    -format ctl -output export/$OUT_FILENAME.ctl
    write_test_protocol             -output export/$OUT_FILENAME.spf
}

report_clock_gating > ./reports/rtl_clock_gate_${myTopLevel}.rpt

write_sdc -nosplit ./export/$OUT_FILENAME.sdc
write -format verilog -hier -o ./export/$OUT_FILENAME.v
write_scan_def -output export/$OUT_FILENAME.scandef
check_mv_design -level_shifters -verbose > reports/$OUT_FILENAME\_level_shifter.rpt
write_parasitics -format distributed -output export/$OUT_FILENAME.spef
write_sdf export/$OUT_FILENAME\.sdf

#14)
exit
