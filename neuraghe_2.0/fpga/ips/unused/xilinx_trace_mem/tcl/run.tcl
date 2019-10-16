set partNumber $::env(XILINX_PART)
set boardName  $::env(XILINX_BOARD)

create_project xilinx_trace_mem . -part $partNumber
set_property board_part $boardName [current_project]
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -module_name xilinx_trace_mem
set_property -dict [list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Write_Width_A {512} CONFIG.Write_Depth_A {1024} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B {512} CONFIG.Enable_B {Always_Enabled} CONFIG.Read_Width_A {512} CONFIG.Read_Width_B {512} CONFIG.Register_PortB_Output_of_Memory_Primitives {true} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100}] [get_ips xilinx_trace_mem]
generate_target all [get_files ./xilinx_trace_mem.srcs/sources_1/ip/xilinx_trace_mem/xilinx_trace_mem.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./xilinx_trace_mem.srcs/sources_1/ip/xilinx_trace_mem/xilinx_trace_mem.xci]
launch_run -jobs 8 xilinx_trace_mem_synth_1
wait_on_run xilinx_trace_mem_synth_1
