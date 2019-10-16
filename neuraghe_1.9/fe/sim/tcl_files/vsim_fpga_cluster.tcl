# yes I know this looks ugly, but for some reason vsim deso not recognize the VSIM_FLAGS as correct arguments :-/
# e.g. it did not recognize the -pli ./something.so argument
set cmd "vsim -quiet $TB glbl \
  -L interfaces_lib \
  -L tech_lib \
  -L jtag_lib \
  -L axi_id_remap_lib \
  -L axi_node_lib \
  -L axi_mem_if_lib \
  -L axi_mem_if_DP_lib \
  -L axi_slice_lib \
  -L axi_slice_dc_lib \
  -L axi_spi_master_lib \
  -L axi_spi_slave_lib \
  -L axi2mem_lib \
  -L bbgen_lib \
  -L fll_lib \
  -L clock_divider_lib \
  -L scm_lib \
  -L pulp_common_cells_lib \
  -L axi2apb_lib \
  -L apb_gpio_lib \
  -L apb_spi_master_lib \
  -L apb_i2c_lib \
  -L cvp_lib \
  -L apb_cvp_if_lib \
  -L apb_audio_lib \
  -L apb_uart_lib \
  -L apb_cerebro_ctrl_lib \
  -L adv_dbg_if_lib \
  -L vip_axi_monitor_lib \
  -L st_pmb_lib \
  -L secureip \
  -L simprims_ver \
  -L unifast \
  -L unifast_ver \
  -L unimacro \
  -L unimacro_ver \
  -L unisim \
  -L unisims_ver \
  -L work \
  +nowarn \
  +nowarnTRAN \
  +nowarnTSCALE \
  +nowarnTFMPC \
  -t ps \
  -warning 2732 \
  -voptargs=\"+acc -suppress 2103\" \
  $VSIM_FLAGS"

eval $cmd
