HDL_DIR = ../rtl
VCOM = "/softs/mentor/mgc_ams/13.2d/questasim/v10.3d/bin/vcom"
VLOG = "/softs/mentor/mgc_ams/13.2d/questasim/v10.3d/bin/vlog"
VACOM = "vacom"
VALIB = "valib"
VLIB = "/softs/mentor/mgc_ams/13.2d/questasim/v10.3d/bin/vlib"
VASPI = "vaspi"
VASIM = "vasim"

VCOM_OPTS = -work bbgen_lib -93
VLOG_OPTS = -work bbgen_lib
all: clean lib compile

lib:	
	$(VALIB) work_ams # analog library
	$(VLIB) work # digital library
	$(VLIB) bbgen_lib

compile: digital analog

packages:
	$(VCOM) $(VCOM_OPTS) $(HDL_DIR)/bbgen_package.vhd
	$(VCOM) $(VCOM_OPTS) $(HDL_DIR)/CVP/cvp_package.vhd
	$(VCOM) $(VCOM_OPTS) $(HDL_DIR)/APB2CVP/apb_package.vhd

# compilation of the digital code
digital: packages
	$(VCOM) $(VCOM_OPTS) $(HDL_DIR)/bbgen_clock_box.vhd
	$(VCOM) $(VCOM_OPTS) $(HDL_DIR)/bbgen_synchronizer.vhd
	$(VCOM) $(VCOM_OPTS) $(HDL_DIR)/bbgen_pwell_control.vhd
	$(VCOM) $(VCOM_OPTS) $(HDL_DIR)/bbgen_nwell_control.vhd
	$(VCOM) $(VCOM_OPTS) $(HDL_DIR)/bbgen_register_bank.vhd
	$(VCOM) $(VCOM_OPTS) $(HDL_DIR)/bbgen_cvp_interface.vhd
	$(VCOM) $(VCOM_OPTS) $(HDL_DIR)/bbgen_control.vhd
	$(VCOM) $(VCOM_OPTS) tb/combinedAnalog.vhd # wrapper for the analog netlist
	$(VCOM) $(VCOM_OPTS) $(HDL_DIR)/APB2CVP/apb_cvp_wrapper.vhd
	$(VLOG) $(VLOG_OPTS) ../../../apb/apb_cvp_if/apb_cvp_if.sv
	$(VCOM) $(VCOM_OPTS) tb/bbgen_apb2cvp_tb.vhd


# compilation of the analog code
analog: packages
	$(VASPI)  -work bbgen_lib -interface COMBINEDANALOG-combinedanalog.assoc combinedanalog COMBINEDANALOG@tb/vbbgen_analog_nonly.ckt # map the netlist into the digital test bench
	$(VACOM) tb/COMBINEDANALOG_tb.vhd # top level test bench

gui: all
	$(VASIM) vasim -cmd combinedanalog_tb.cmd combinedanalog_tb -lib work_ams -do simulation.do

clean:
	rm -rf *.chi
	rm -rf *.wdb
	rm -rf work_ams
	rm -rf work
	rm -rf *.wlf
	rm -rf *.id
	rm -rf transcript_ms 
	rm -rf transcript
	rm -rf *.h3
	rm -rf *.reuse
	rm -rf *.log
