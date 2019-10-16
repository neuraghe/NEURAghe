# yes I know this looks ugly, but for some reason vsim deso not recognize the VSIM_FLAGS as correct arguments :-/
# e.g. it did not recognize the -pli ./something.so argument
#
# To use the RISC-V core: decomment --> set CORE_LIB "riscv_lib"
#                       and comment --> set CORE_LIB "or10n_lib"

set CORE_LIB "or10n_lib"

if {[info exists env(PULP_CORE)]} {
  if {$env(PULP_CORE) == "riscv"} {
    set CORE_LIB "riscv_lib"
  }
}

set cmd "vsim -quiet  $TB glbl \
  -L interfaces_lib \
  -L tech_lib \
  -L cluster_interconnect_lib \
  -L jtag_lib \
  -L axi_id_remap_lib \
  -L axi2per_lib \
  -L per2axi_lib \
  -L wb2axi_lib \
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
  -L fpga_lib \
  -L mchan_lib \
  -L clock_divider_lib \
  -L pulp_common_cells_lib \
  -L $CORE_LIB \
  -L icache_lib \
  -L cluster_peripherals_lib \
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
  -L hwce_lib \
  -L st_pmb_lib \
  +nowarnTRAN \
  +nowarnTSCALE \
  +nowarnTFMPC \
  -t ps \
  -voptargs=\"+acc -suppress 2103\" \
  $VSIM_FLAGS"

eval $cmd

# check exit status in tb and quit the simulation accordingly
proc run_and_exit {} {
  run -all
  quit -code [examine -radix decimal sim:/tb/exit_status]
}

set StdArithNoWarnings 1
set NumericStdNoWarnings 1
run 10ms
set StdArithNoWarnings 0
set NumericStdNoWarnings 0
