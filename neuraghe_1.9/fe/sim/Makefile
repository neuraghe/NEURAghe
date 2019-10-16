N_CORES ?= 4
CONVDEF ?= 

build:
	@tcsh scripts/vcompile_all.do

core:
	@tcsh scripts/vcompile_or10n.do
	@tcsh scripts/vcompile_riscv.do

icache:
	@tcsh scripts/vcompile_icache.do

cluster:
	@tcsh scripts/vcompile_work.do

libs:
	@tcsh scripts/vcompile_libsonly.do

tb:
	@tcsh scripts/vcompile_tb.do

run:
	vsim -c -do tcl_files/run.tcl &> /dev/null &
	sleep 15
	tail -f stdout/stdout_pe0

batch:
	cd ../../sw/apps/cnn/; make DEF="-DN_CORES=$(N_CORES) $(CONVDEF) -DIMPRECISE_ASM5" conv_lib cnn.slm; cd -
	vsim -c -do tcl_files/batch.tcl

run-wave:
	vsim -do tcl_files/run.tcl

run-spi:
	vsim -do tcl_files/run_spi.tcl

run-jtag:
	vsim -do tcl_files/test_jtag.tcl

