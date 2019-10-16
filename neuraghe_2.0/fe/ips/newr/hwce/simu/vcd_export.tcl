vcd file -compress export.vcd.gz
vcd add -r -optcells -internal -ports {sim:/testbench/hwce_top_gen[0]/DUT/*}
run 1 us

