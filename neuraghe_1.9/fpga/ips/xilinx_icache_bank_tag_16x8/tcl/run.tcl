set partNumber $::env(XILINX_PART)
set boardName  $::env(XILINX_BOARD)

set ipName xilinx_icache_bank_tag_16x8

create_project $ipName . -part $partNumber
set_property board_part $boardName [current_project]

create_ip -name blk_mem_gen -vendor xilinx.com -library ip -module_name $ipName

set_property -dict [list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Write_Width_A {8} CONFIG.Write_Depth_A {16} CONFIG.Operating_Mode_A {READ_FIRST} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {9} CONFIG.Read_Width_A {8} CONFIG.Write_Width_B {8} CONFIG.Read_Width_B {8} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100} CONFIG.Assume_Synchronous_Clk {true}] [get_ips ${ipName}]

generate_target all [get_files ./${ipName}.srcs/sources_1/ip/${ipName}/${ipName}.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./${ipName}.srcs/sources_1/ip/${ipName}/${ipName}.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1
