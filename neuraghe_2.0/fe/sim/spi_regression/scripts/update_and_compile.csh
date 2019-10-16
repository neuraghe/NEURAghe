setenv CWD              `pwd`
setenv BASE_DIR         `dirname $CWD`




setenv IPS_DIR          "$BASE_DIR/ips"
setenv SIM_DIR          "$BASE_DIR/sim"
setenv RTL_DIR          "$BASE_DIR/rtl"
setenv TB_DIR           "$BASE_DIR/tb"
setenv SW_DIR           "$BASE_DIR/sw"

setenv MSIM_LIBS_PATH "$SIM_DIR/modelsim_libs"
setenv IPS_PATH       "$BASE_DIR/ips"


setenv SPI_REG_SW_DIR "$SW_DIR/apps/spi_regression"

#Source the setup files
source $SIM_DIR/spi_regression/setup.csh

#Setup the simulator
if (`where vsim` == "") then
  source $MODELSIM_SETUP_SCRIPT 
endif



pushd $IPS_DIR
git pull
popd


pushd $RTL_DIR
git pull
popd


pushd $TB_DIR
git pull
popd


pushd $SIM_DIR
git pull
source scripts/vcompile_all.do
popd 


pushd $SW_DIR
git pull
popd

pushd $SPI_REG_SW_DIR
source clean.csh
source compile_all_benchs.csh
popd





pushd $SIM_DIR
vsim -c -do spi_regression/scripts/run_all_test.tcl

