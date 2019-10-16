PROJECT:=soc

all:
	vivado -mode batch -source tcl/run.tcl 

gui:
	vivado -mode gui -source tcl/run.tcl &

clean:
	rm -rf ${PROJECT}.xpr
	rm -rf ${PROJECT}.data
	rm -rf ${PROJECT}.runs
	rm -rf ${PROJECT}.srcs
	rm -rf ${PROJECT}.cache
	rm -rf ${PROJECT}.hw
	rm -rf component.xml
	rm -rf vivado*.jou
	rm -rf vivado*.log
	rm -rf xgui
	rm -rf ulpsoc.edf
	rm -rf ulpsoc_stub.v
	rm -rf .Xil

