-makelib ies/xil_defaultlib -sv \
  "/eda/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/eda/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "/eda/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/axi_infrastructure_v1_1_0 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies/xil_common_vip_v1_0_0 -sv \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/2ad9/hdl/xil_common_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/smartconnect_v1_0 -sv \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/16a2/hdl/sc_util_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/axi_protocol_checker_v1_1_13 -sv \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/8017/hdl/axi_protocol_checker_v1_1_vl_rfs.sv" \
-endlib
-makelib ies/axi_vip_v1_0_1 -sv \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/856d/hdl/axi_vip_v1_0_vl_rfs.sv" \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/d5eb/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/base_zynq_design/ip/base_zynq_design_processing_system7_0_0/sim/base_zynq_design_processing_system7_0_0.v" \
-endlib
-makelib ies/lib_cdc_v1_0_2 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies/proc_sys_reset_v5_0_11 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/5db7/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/base_zynq_design/ip/base_zynq_design_rst_processing_system7_0_50M_0/sim/base_zynq_design_rst_processing_system7_0_50M_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/56b5/hdl/soc_AXI_ctrl_v1_0_S00_AXI.v" \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/56b5/hdl/soc_AXI_ctrl_v1_0.v" \
  "../../../bd/base_zynq_design/ip/base_zynq_design_soc_AXI_ctrl_v1_0_0_0/sim/base_zynq_design_soc_AXI_ctrl_v1_0_0_0.v" \
-endlib
-makelib ies/generic_baseblocks_v2_1_0 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/f9c1/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies/fifo_generator_v13_1_4 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/ebc2/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies/fifo_generator_v13_1_4 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/ebc2/hdl/fifo_generator_v13_1_rfs.vhd" \
-endlib
-makelib ies/fifo_generator_v13_1_4 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/ebc2/hdl/fifo_generator_v13_1_rfs.v" \
-endlib
-makelib ies/axi_data_fifo_v2_1_11 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/5235/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies/axi_register_slice_v2_1_12 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/0e33/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies/axi_protocol_converter_v2_1_12 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/138d/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/base_zynq_design/ip/base_zynq_design_axi_protocol_converter_0_0/sim/base_zynq_design_axi_protocol_converter_0_0.v" \
  "../../../bd/base_zynq_design/ip/base_zynq_design_axi_protocol_converter_1_0/sim/base_zynq_design_axi_protocol_converter_1_0.v" \
-endlib
-makelib ies/axi_clock_converter_v2_1_11 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/c526/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies/blk_mem_gen_v8_3_6 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/4158/simulation/blk_mem_gen_v8_3.v" \
-endlib
-makelib ies/axi_dwidth_converter_v2_1_12 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/fef9/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/base_zynq_design/ip/base_zynq_design_axi_dwidth_converter_0_0/sim/base_zynq_design_axi_dwidth_converter_0_0.v" \
  "../../../bd/base_zynq_design/ip/base_zynq_design_clk_wiz_1_0/base_zynq_design_clk_wiz_1_0_clk_wiz.v" \
  "../../../bd/base_zynq_design/ip/base_zynq_design_clk_wiz_1_0/base_zynq_design_clk_wiz_1_0.v" \
-endlib
-makelib ies/axi_crossbar_v2_1_13 \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/78eb/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/base_zynq_design/ip/base_zynq_design_xbar_0/sim/base_zynq_design_xbar_0.v" \
  "../../../bd/base_zynq_design/ip/base_zynq_design_axi_protocol_converter_0_1/sim/base_zynq_design_axi_protocol_converter_0_1.v" \
  "../../../../pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/ipshared/b2d6/ulpsoc_stub.v" \
  "../../../bd/base_zynq_design/ip/base_zynq_design_nuraghe_soc_0_0/sim/base_zynq_design_nuraghe_soc_0_0.v" \
  "../../../bd/base_zynq_design/ip/base_zynq_design_axi_protocol_converter_3_0/sim/base_zynq_design_axi_protocol_converter_3_0.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/base_zynq_design/hdl/base_zynq_design.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/base_zynq_design/ip/base_zynq_design_auto_ds_0/sim/base_zynq_design_auto_ds_0.v" \
  "../../../bd/base_zynq_design/ip/base_zynq_design_auto_pc_0/sim/base_zynq_design_auto_pc_0.v" \
  "../../../bd/base_zynq_design/ip/base_zynq_design_auto_us_0/sim/base_zynq_design_auto_us_0.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

