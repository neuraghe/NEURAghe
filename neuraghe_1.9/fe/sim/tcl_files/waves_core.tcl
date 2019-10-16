
# add cores
set ncores 4
set rvcores [find instances -recursive -bydu riscv_core]

if {$rvcores ne ""} {
  for {set i 0} {$i < $ncores} {incr i} {
    set core_str [format "Core %d" $i]
    add wave -group $core_str -group "Core"                       /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/*
    add wave -group $core_str -group "IF Stage" -group "Prefetch" /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/if_stage_i/prefetch_128/prefetch_buffer_i/*
    add wave -group $core_str -group "IF Stage"                   /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/if_stage_i/*
    add wave -group $core_str -group "ID Stage"                   /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/id_stage_i/*
    add wave -group $core_str -group "RF"                         /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/id_stage_i/registers_i/MemContentxDP
    add wave -group $core_str -group "Decoder"                    /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/id_stage_i/decoder_i/*
    add wave -group $core_str -group "Controller"                 /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/id_stage_i/controller_i/*
    add wave -group $core_str -group "Exc Ctrl"                   /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/id_stage_i/exc_controller_i/*
    add wave -group $core_str -group "EX Stage" -group "ALU"      /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/ex_stage_i/alu_i/*
    add wave -group $core_str -group "EX Stage" -group "MUL"      /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/ex_stage_i/mult_i/*
    add wave -group $core_str -group "EX Stage"                   /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/ex_stage_i/*
    add wave -group $core_str -group "LSU"                        /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/load_store_unit_i/*
    add wave -group $core_str -group "CSR"                        /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/cs_registers_i/*
    add wave -group $core_str -group "Debug"                      /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/RISCV_CORE/debug_unit_i/*
  }
}

set or1kcores [find instances -recursive -bydu or10n_core]

if {$or1kcores ne ""} {
  for {set i 0} {$i < $ncores} {incr i} {
    set core_str [format "Core %d" $i]
    add wave -group $core_str -group "Core"                       /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/ORION_CORE/*
    add wave -group $core_str -group "IF Stage"                   /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/ORION_CORE/if_stage_i/*
    add wave -group $core_str -group "ID Stage"                   /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/ORION_CORE/id_stage_i/*
    add wave -group $core_str -group "RF"                         /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/ORION_CORE/id_stage_i/registers_i/MemContentxDP
    add wave -group $core_str -group "Controller"                 /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/ORION_CORE/id_stage_i/controller_i/*
    add wave -group $core_str -group "Exc Ctrl"                   /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/ORION_CORE/id_stage_i/exc_controller_i/*
    add wave -group $core_str -group "EX Stage" -group "ALU"      /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/ORION_CORE/ex_stage_i/alu_i/*
    add wave -group $core_str -group "EX Stage" -group "MUL"      /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/ORION_CORE/ex_stage_i/mult_i/*
    add wave -group $core_str -group "EX Stage"                   /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/ORION_CORE/ex_stage_i/*
    add wave -group $core_str -group "LSU"                        /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/ORION_CORE/load_store_unit_i/*
    add wave -group $core_str -group "CSR"                        /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/ORION_CORE/sp_registers_i/*
    add wave -group $core_str -group "Debug"                      /tb/i_dut/ulpsoc_i/cluster_i/CORE\[$i\]/core_region_i/ORION_CORE/debug_unit_i/*
  }
}

# wave configuration
configure wave -namecolwidth  250
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -timelineunits ns
