PROJECT:=hwce

all: synth

synth:
	synplify_premier_dp -batch -tcl synth.tcl 

gui:
	synplify_premier_dp -tcl synth.tcl

clean:
	rm -rf rev_1
	rm -rf stdout.log
	rm -rf synlog.tcl 
	rm -rf ${PROJECT}.prj
	rm -rf vivado*
	rm -rf ${PROJECT}.edf
	rm -rf ${PROJECT}_stub.v
	rm -rf .Xil
