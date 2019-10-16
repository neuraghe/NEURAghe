#!/bin/tcsh
source scripts/colors.sh

echo ""
echo "${Green}--> Compiling axi slice dc wrap...${NC}"
echo "${Red}"

vlog -quiet -sv +define+SYNTHESIS +incdir+./../rtl/includes ../rtl/ulpcluster/axi_slice_dc_master_wrap.sv || exit 1
vlog -quiet -sv +define+SYNTHESIS +incdir+./../rtl/includes ../rtl/ulpcluster/axi_slice_dc_slave_wrap.sv  || exit 1

echo "${Cyan} axi slice dc wrap has been Compiled Succesfully${NC}"


echo "${Green} -> Compiling cluster FPGA netlist and wrapper ..."

echo "${Red}"

vlog -quiet ../../fpga/ulpcluster/ulpcluster_postsynt.v || exit 1
vlog -quiet -sv +incdir+./../rtl/includes ../../fpga/rtl/ulpcluster_wrap.sv || exit 1
vlog -quiet ../../fpga/rtl/glbl.v || exit 1

echo "${Cyan} cluster FPGA netlist and wrapper have been compiled Succesfully${NC}"

