set bbgen_rtl_sources [list \
  bbgen_package.vhd \
  CVP/cvp_package.vhd \
  bbgen_nwell_control.vhd \
  bbgen_pwell_control.vhd \
  bbgen_synchronizer.vhd \
  bbgen_register_bank.vhd \
  bbgen_cvp_interface.vhd \
  bbgen_clock_box.vhd \
  bbgen_control.vhd \
]

foreach f ${bbgen_rtl_sources} {
  analyze -format vhdl -work BBGEN_LIB ${BBGEN_PATH}/${f}
}
