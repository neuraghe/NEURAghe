set SPI_REG_SW_DIR  $::env(SPI_REG_SW_DIR)
set MY_EMAIL        $::env(MY_EMAIL)
set RECIPIENT_LIST  $::env(RECIPIENT_LIST)
set CC_LIST         $::env(CC_LIST)

source "spi_regression/scripts/proc.tcl"




#clean files
exec mkdir -p spi_regression/LOGS/
exec touch spi_regression/LOGS/test_status.csv
exec rm spi_regression/LOGS/test_status.csv
exec rm -rf spi_regression/LOGS/regression_test_status.txt
exec touch spi_regression/regression_log.txt
exec echo "TEST_NAME;\t OK; \tKO;" > spi_regression/LOGS/test_status.csv


#Compile the CUstom testbench 
vlog -quiet -sv -work work spi_regression/TB/tb_top_spi_file.sv


#Source the list of test to run in the regression
source spi_regression/test_to_run.txt


# Report statistic in a text file
set   fd [open "spi_regression/LOGS/regression_test_status.txt" "a+"]
puts  $fd "END OF REGRESSION TEST"
close $fd






# SEND A MAIL IN CASE OF FAIL
#Statistic tracking:
set COUNTER_PASS 0
set COUNTER_FAIL 0
set FAILING_TEST ""

set i 0

set fd [open "spi_regression/LOGS/test_status.csv" "r"]
while {[gets $fd line] >= 0} {
    if { $i != 0 } { 
    regsub -all ";" $line "" line
    puts $line
    set LOCAL_PASS     [  lindex $line 1]
    set LOCAL_FAIL     [  lindex $line 2]
    set FAIL_TESTNAME  [  lindex $line 0]
    set COUNTER_PASS   [ expr $COUNTER_PASS + $LOCAL_PASS    ]
    set COUNTER_FAIL   [ expr $COUNTER_FAIL + $LOCAL_FAIL    ]
    if { $LOCAL_FAIL != 0 } { 
      set FAILING_TEST   [ concat $FAIL_TESTNAME $FAILING_TEST ]
    }
    }
    incr i
}
close $fd

# puts "FAILED COUNT : $COUNTER_FAIL"
# puts "PASSED COUNT : $COUNTER_PASS"
# puts "FAILED TEST  : $FAILING_TEST"

set fd [open "spi_regression/LOGS/test_status.csv" "r"]
if { $COUNTER_FAIL != 0 } {
   set subject "PULP 3 RTL REGRESSION TEST FAILED!!!!!" 
   set body "FAILING TESTS ARE: $FAILING_TEST\n\n\n"
   set body [concat $body [read $fd]]
   send_test_result $RECIPIENT_LIST $CC_LIST $subject $body
} else {
   set body [read $fd]
   send_test_result  $MY_EMAIL  ""  "PULP3 RTL TEST OK" $body
}
close $fd

exit
