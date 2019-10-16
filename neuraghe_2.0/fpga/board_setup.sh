#!/bin/bash

# either "zedboard" or "zc706"
export BOARD="zc706"

if [ "$BOARD" == "zedboard" ]; then
  export XILINX_PART="xc7z020clg484-1"
  export XILINX_BOARD="em.avnet.com:zed:part0:0.9"
  #export XILINX_BOARD="em.avnet.com:zynq:zed:c"	
else
  export XILINX_PART="xc7z045ffg900-2"
  export XILINX_BOARD="xilinx.com:zc706:part0:1.0"
fi

#export PATH="${PATH}:/opt/cad/xilinx/14.5/ISE_DS/EDK/bin/lin64/"

#source /app/cad/xilinx/Vivado/2014.4/settings64.sh
#source /opt/cad/synopsys/synopsys.sh

