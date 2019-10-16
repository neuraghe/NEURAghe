#set_property iostandard "LVCMOS18" [get_ports "gpio_io_o[0]"]
#set_property PACKAGE_PIN "A17" [get_ports "gpio_io_o[0]"]
#set_property slew "SLOW" [get_ports "gpio_io_o[0]"]
#set_property PIO_DIRECTION "OUTPUT" [get_ports "gpio_io_o[0]"]

#set_property iostandard "LVCMOS18" [get_ports "gpio_io_o[1]"]
#set_property PACKAGE_PIN "W21" [get_ports "gpio_io_o[1]"]
#set_property slew "SLOW" [get_ports "gpio_io_o[1]"]
#set_property PIO_DIRECTION "OUTPUT" [get_ports "gpio_io_o[1]"]

#set_property iostandard "LVCMOS18" [get_ports "gpio_io_o[2]"]
#set_property PACKAGE_PIN "G2" [get_ports "gpio_io_o[2]"]
#set_property slew "SLOW" [get_ports "gpio_io_o[2]"]
#set_property PIO_DIRECTION "OUTPUT" [get_ports "gpio_io_o[2]"]

set_property IOSTANDARD LVCMOS18 [get_ports fech_enable_o]
set_property PACKAGE_PIN Y21 [get_ports fech_enable_o]
set_property SLEW SLOW [get_ports fech_enable_o]
set_property PIO_DIRECTION OUTPUT [get_ports fech_enable_o]


#create_pblock CORE_REGION
#add_cells_to_pblock [get_pblocks CORE_REGION] [get_cells -quiet [list base_zynq_design_i/nuraghe_soc_0/inst/axi2per_datamem_i base_zynq_design_i/nuraghe_soc_0/inst/core_data_memory_i base_zynq_design_i/nuraghe_soc_0/inst/core_region_i base_zynq_design_i/nuraghe_soc_0/inst/l2_mem_if_i base_zynq_design_i/nuraghe_soc_0/inst/l2_ram_i]]
#resize_pblock [get_pblocks CORE_REGION] -add {SLICE_X90Y300:SLICE_X171Y349}
#resize_pblock [get_pblocks CORE_REGION] -add {RAMB18_X4Y120:RAMB18_X8Y139}
#resize_pblock [get_pblocks CORE_REGION] -add {RAMB36_X4Y60:RAMB36_X8Y69}
