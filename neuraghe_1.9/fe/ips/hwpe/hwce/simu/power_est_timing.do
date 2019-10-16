power add -internal -ports -r {sim:/testbench/*}
#power add -ports {sim:/testbench/hwce_top_gen[0]/DUT/tcdm_r_data_i}
#power on -all
run 1000 ns
power off -all
power report -all -bsaif hwce_rtl_power.saif -file hwce_rtl_power.log

#vcd file ~/hwce_rtl_power.vcd
#vcd add -r {sim:/testbench/*}
#run 1000 ns



