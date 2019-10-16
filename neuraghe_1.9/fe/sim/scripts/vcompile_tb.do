#!/bin/tcsh
source scripts/colors.sh


echo "${Green} -> Compiling PULP Testbench..."

echo "${Green}Compiling component:   ${Brown} work.tb ${NC}"
echo "${Green}library: work ${NC}"
echo "${Red}"

vlog -quiet +incdir+./../rtl/includes +incdir+../tb +define+$1 ../tb/tb_top.sv       || exit 1

vlog -quiet -sv ../tb/ram_preloader.sv                                               || exit 1

vlog -quiet -sv ../tb/debug.sv                                                       || exit 1
vlog -quiet -sv ../tb/FS_HANDLER.sv                                                  || exit 1

vlog -quiet -sv ../tb/spi_master_padframe.sv                                         || exit 1
vlog -quiet -sv ../tb/spi_slave.sv                                                   || exit 1
vlog -quiet -sv ../tb/uart.sv                                                        || exit 1

vlog -quiet -sv +incdir+../tb -dpiheader        ../tb/jtag_dpi/dpiheader.h \
                                                ../tb/jtag_dpi/jtag_dpi.sv           || exit 1
# vlog -quiet -64 -ccflags "-I../tb/jtag_dpi/"    ../tb/jtag_dpi/jtag_dpi.c            || exit 1

echo "${Cyan} ULPSoC Testbench files have been compiled Succesfully${NC}"
