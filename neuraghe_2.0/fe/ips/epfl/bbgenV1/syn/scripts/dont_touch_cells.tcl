
set_dont_touch [get_cells cluster_i/lev_shifter_*]

set_dont_touch [get_cells  cluster_i/data_master_ls_wrap_i/*]
set_dont_touch [get_cells  cluster_i/data_slave_ls_wrap_i/*]
set_dont_touch [get_cells  cluster_i/instr_master_ls_wrap_i/*]
set_dont_touch [get_cells  cluster_i/BBMUX_CONFIG_WRAP/*]
set_dont_touch [get_cells  cluster_i/CLKGATE_CONFIG_WRAP/*]
set_dont_touch [get_cells  cluster_i/BIST_BUS_LS_0/*] 
set_dont_touch [get_cells  cluster_i/BIST_BUS_LS_1/*] 
set_dont_touch [get_cells  cluster_i/BIST_BUS_LS_2/*] 
set_dont_touch [get_cells  cluster_i/BIST_BUS_LS_3/*]



set_dont_touch [get_nets cluster_i/clk_i]
set_dont_touch [get_nets cluster_i/rst_ni]
set_dont_touch [get_nets cluster_i/test_mode_i]
set_dont_touch [get_nets cluster_i/ext_events_i]
set_dont_touch [get_nets cluster_i/en_sa_boot_i]
set_dont_touch [get_nets cluster_i/ext_events_i*]


set_dont_touch [get_nets cluster_i/eoc_o]
set_dont_touch [get_nets cluster_i/data_slave*]
set_dont_touch [get_nets cluster_i/instr_master*]
set_dont_touch [get_nets cluster_i/data_master*]

set_dont_touch [get_nets cluster_i/bbmux_ext_bus*]
set_dont_touch [get_nets cluster_i/clkgate_ext_bus*]

set_dont_touch [get_nets cluster_i/wm_tcdm*]
set_dont_touch [get_nets cluster_i/rm_tcdm*]

set_dont_touch [get_nets cluster_i/icram_bist_slave*]

set_dont_touch [get_nets cluster_i/bbmux_scm_vsafe*]
set_dont_touch [get_nets cluster_i/bbmux_int_vsafe*]
set_dont_touch [get_nets cluster_i/bbmux_core_vsafe*]
set_dont_touch [get_nets cluster_i/bbmux_tcdm_vsafe*]



set_dont_touch [get_cells cluster_i/BBMUX_GROUP_i/*]
set_dont_touch [get_nets  cluster_i/BBMUX_GROUP_i/*]


# dont touch scanchain related cells in the padframe
set_dont_touch [get_cells pad_frame_pulp_i/buffer*]
set_dont_touch [get_ports pad_frame_pulp_i/si*]
set_dont_touch [get_ports pad_frame_pulp_i/se]
set_dont_touch [get_ports pad_frame_pulp_i/so*]

set_dont_touch [get_nets pad_frame_pulp_i/si*]
set_dont_touch [get_nets pad_frame_pulp_i/se]
set_dont_touch [get_nets pad_frame_pulp_i/so*]

set_dont_touch [get_nets pad_frame_pulp_i/buf_so*]

#SCanIn, ScanEnable and ScanOut dont_touch attributes
set_dont_touch [get_cells cluster_i/lev_shifter_SI_*]
set_dont_touch [get_cells cluster_i/lev_shifter_SE*]
set_dont_touch [get_cells cluster_i/lev_shifter_SO_*]

set_dont_touch [get_ports cluster_i/SI*]
set_dont_touch [get_ports cluster_i/SE*]
set_dont_touch [get_ports cluster_i/SO*]

set_dont_touch [get_nets cluster_i/SI*]
set_dont_touch [get_nets cluster_i/SE*]
set_dont_touch [get_nets cluster_i/SO*]

# endpoints of the scanchains. this is required because compile_ultra would do
# weird optimizations on the path to the pads
set_compile_directives -constant_propagation false [get_ports pad_frame_pulp_i/so*]
set_compile_directives -constant_propagation false [get_ports cluster_i/SO]

