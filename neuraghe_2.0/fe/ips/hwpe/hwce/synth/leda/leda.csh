#!/bin/tcsh
setenv HWCE_DIR ../../rtl/
setenv HWPE_DIR ../../../hwpe-sm/rtl

setenv SCM_SRC " \
  ../../../../scm/generic_scm/register_file_2r_1w_asymm.sv \
  ../../../../scm/generic_scm/register_file_1r_1w_all.sv \
"

setenv HWCE_ENGINE_SRC " \
  $HWCE_DIR/hwce_linebuffer_shiftreg.sv \
  $HWCE_DIR/hwce_linebuffer_fifo.sv \
  $HWCE_DIR/hwce_mac.sv \
  $HWCE_DIR/hwce_addertree.sv \
  $HWCE_DIR/hwce_engine_fsm.sv \
  $HWCE_DIR/hwce_insert_px.sv \
  $HWCE_DIR/hwce_drop_px.sv \
  $HWCE_DIR/hwce_engine.sv \
"

setenv HWCE_WEIGHTLOAD_SRC " \
  $HWCE_DIR/weight_loader_3x3.v \
  $HWCE_DIR/weight_loader_5x5.v \
  $HWCE_DIR/weight_loader_7x7.v \
  $HWCE_DIR/weight_loader_9x9.v \
  $HWCE_DIR/weight_loader_11x11.v \
"

setenv HWPE_WRAPPER_SRC " \
  $HWPE_DIR/hwpe_sm_decoder.sv \
  $HWPE_DIR/hwpe_sm_encoder.sv \
  $HWPE_DIR/hwpe_sm_regfile.sv \
  $HWPE_DIR/hwpe_sm_slave.sv \
  $HWPE_DIR/hwpe_sm_address.sv \
  $HWPE_DIR/hwpe_sm_controller.sv \
  $HWPE_DIR/axi/hwpe_axi_fifo.sv \
  $HWPE_DIR/axi/hwpe_axi_fifo_earlystall.sv \
  $HWPE_DIR/axi/hwpe_axi_addressgen.sv \
  $HWPE_DIR/axi/hwpe_axi_source.sv \
  $HWPE_DIR/axi/hwpe_axi_sink.sv \
"

setenv HWCE_TOP_SRC " \
  $HWCE_DIR/hwce_wrapper.sv \
  $HWCE_DIR/hwce_top.sv \
"

leda $SCM_SRC $HWCE_ENGINE_SRC $HWCE_WEIGHTLOAD_SRC $HWPE_WRAPPER_SRC $HWCE_TOP_SRC -top hwce_top -project hwce_top +gui +sv +incdir+$HWCE_DIR +incdir+$HWPE_DIR +incdir+$HWPE_DIR/axi

