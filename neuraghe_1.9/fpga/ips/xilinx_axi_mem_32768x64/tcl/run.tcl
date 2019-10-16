set partNumber $::env(XILINX_PART)
set boardName  $::env(XILINX_BOARD)

create_project xilinx_axi_mem_32768x64 . -part $partNumber
set_property board_part $boardName [current_project]
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -module_name xilinx_axi_mem_32768x64
set_property -dict [list CONFIG.Interface_Type {AXI4} CONFIG.Write_Width_A {64} CONFIG.Write_Depth_A {32768} CONFIG.Use_AXI_ID {true} CONFIG.AXI_ID_Width {6} CONFIG.Memory_Type {Simple_Dual_Port_RAM} CONFIG.Use_Byte_Write_Enable {true} CONFIG.Byte_Size {8} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Read_Width_A {64} CONFIG.Operating_Mode_A {READ_FIRST} CONFIG.Write_Width_B {64} CONFIG.Read_Width_B {64} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Use_RSTB_Pin {true} CONFIG.Reset_Type {ASYNC} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100}] [get_ips xilinx_axi_mem_32768x64]
generate_target all [get_files ./xilinx_axi_mem_32768x64.srcs/sources_1/ip/xilinx_axi_mem_32768x64/xilinx_axi_mem_32768x64.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./xilinx_axi_mem_32768x64.srcs/sources_1/ip/xilinx_axi_mem_32768x64/xilinx_axi_mem_32768x64.xci]
launch_run -jobs 8 xilinx_axi_mem_32768x64_synth_1
wait_on_run xilinx_axi_mem_32768x64_synth_1
