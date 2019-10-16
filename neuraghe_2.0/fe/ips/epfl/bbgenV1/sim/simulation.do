viewermode questa
log -r *
viewermode both

add wave :combinedanalog_tb:dut:nwell

add wave :combinedanalog_tb:dut:pwell

#add wave -i :combinedanalog_tb:dut:xi11:xi3:pwell
#add wave -i :combinedanalog_tb:dut:xi11:xi2:pwell
#add wave -i :combinedanalog_tb:dut:xi12:xi184:pwell
#add wave -i :combinedanalog_tb:dut:xi12:pwell 
add wave -i :combinedanalog_tb:dut:xi12:xpwellsampler:pwell
add wave -i :combinedanalog_tb:dut:xi12:xpwellsampler:xpwellsampleunit_1:xi6:capin
add wave -i :combinedanalog_tb:dut:xi12:xpwellsampler:xpwellsampleunit_1:xi9:cap
add wave -i :combinedanalog_tb:dut:xi12:xpwellsampler:xpwellsampleunit_1:xi8:cap
run 40 us
