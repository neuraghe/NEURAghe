set partNumber $::env(XILINX_PART)
set boardName  $::env(XILINX_BOARD)

set ipName xilinx_fifo_rab_mh

create_project $ipName . -part $partNumber
set_property board_part $boardName [current_project]

create_ip -name fifo_generator -vendor xilinx.com -library ip -module_name $ipName

set_property -dict [list CONFIG.Performance_Options {First_Word_Fall_Through} CONFIG.Input_Data_Width {20} CONFIG.Input_Depth {16} CONFIG.Output_Data_Width {20} CONFIG.Output_Depth {16} CONFIG.Use_Extra_Logic {true} CONFIG.Data_Count_Width {5} CONFIG.Write_Data_Count_Width {5} CONFIG.Read_Data_Count_Width {5} CONFIG.Full_Threshold_Assert_Value {15} CONFIG.Full_Threshold_Negate_Value {14} CONFIG.Empty_Threshold_Assert_Value {4} CONFIG.Empty_Threshold_Negate_Value {5}] [get_ips $ipName]

generate_target {instantiation_template} [get_files ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
generate_target all [get_files  ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1