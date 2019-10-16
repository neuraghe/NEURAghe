-makelib ies/xil_defaultlib -sv \
  "/eda/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/eda/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "/eda/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/blk_mem_gen_v8_3_6 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_3.v" \
-endlib
-makelib ies/axi_bram_ctrl_v4_0_11 \
  "../../../ipstatic/hdl/axi_bram_ctrl_v4_0_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../pulp_on_zynq.srcs/sources_1/ip/axi_bram_ctrl_0/sim/axi_bram_ctrl_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

