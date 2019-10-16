set partNumber $::env(XILINX_PART)
set boardName  $::env(XILINX_BOARD)

set ipName xilinx_clock_manager

create_project $ipName . -part $partNumber
set_property board_part $boardName [current_project]

create_ip -name clk_wiz -vendor xilinx.com -library ip -module_name $ipName

set_property -dict [list CONFIG.INTERFACE_SELECTION {Enable_AXI} \
                         CONFIG.USE_DYN_RECONFIG {true} \
                         CONFIG.PRIM_IN_FREQ {100.00} \
                         CONFIG.PRIMARY_PORT {clk_i} \
                         CONFIG.CLK_OUT1_PORT {clk_o} \
                         CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50.000} \
                         CONFIG.LOCKED_PORT {locked}] [get_ips xilinx_clock_manager]
set_property -dict [list CONFIG.CLKOUT2_USED {true} \
                         CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {50} \
                         CONFIG.CLKOUT2_DRIVES {BUFGCE} \
                         CONFIG.MMCM_DIVCLK_DIVIDE {1} \
                         CONFIG.MMCM_CLKOUT1_DIVIDE {20} \
                         CONFIG.NUM_OUT_CLKS {2} \
                         CONFIG.CLKOUT2_JITTER {151.636} \
                         CONFIG.CLKOUT2_PHASE_ERROR {98.575}] [get_ips xilinx_clock_manager]


generate_target {instantiation_template} [get_files ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
generate_target all [get_files  ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1
