proc  send_test_result { recipient_list cc_list subject body} {
    set msg {From: PULP3_RTL_REGRESSION_TEST }
    append msg \n "To: " [join $recipient_list ,]
    append msg \n "Cc: " [join $cc_list ,]
    append msg \n "Subject: $subject"
    append msg \n\n $body
    exec /usr/lib/sendmail -oi -t << $msg
}


proc run_Test {TEST_NAME  DIR_NAME} {
    set SPI_REG_SW_DIR  $::env(SPI_REG_SW_DIR)
    exec rm -rf vectors/*
    exec cp $SPI_REG_SW_DIR/$DIR_NAME/stim_files/$TEST_NAME.stim.txt  vectors/stim.txt
    set TIME_start [clock clicks -milliseconds]
    #exec vsim -c -do "echo ciao $TEST_NAME; exit"
    exec vsim -quiet    work.tb_spi_regression -Gtest_name="$TEST_NAME" -L work -L tech_lib -L or1200_lib -L cluster_interconnect_lib -L fll_lib -L cvp_lib -L common_cells_lib -L axi_id_remap_lib -L axi_cvp_if_lib -L wb2axi_lib -L axi2per_lib -L per2axi_lib -L axi2mem_lib -L axi_node_lib -L axi_gpreg_lib -L axi_slice_lib -L axi_slice_dc_lib -L axi_mem_if_lib -L axi_spi_master_lib -L axi_spi_slave_lib -L jtag_lib -L mchan_lib -L clock_divider_lib +nowarn +nowarnTRAN +nowarnTSCALE +nowarnTFMPC "-voptargs=-suppress 2103" -t ps -voptargs=+acc -c -do "run -all" > spi_regression/LOGS/$TEST_NAME.log
    set TIME_taken   [expr [clock clicks -milliseconds] - $TIME_start]
    set fd           [open "spi_regression/LOGS/regression_test_status.txt" "a+"]
    set test_status  [open "spi_regression/LOGS/test_status.csv" "a+"]
    set sim_file     [open "spi_regression/LOGS/$TEST_NAME.txt" "r"]
    puts  $fd "Runtime for $TEST_NAME is [expr int($TIME_taken/(1000.0*60.0))] minutes"

    exec cat spi_regression/LOGS/regression_test_status.txt  spi_regression/LOGS/$TEST_NAME.txt > spi_regression/regression_log_temp.txt
    exec mv  spi_regression/regression_log_temp.txt spi_regression/LOGS/regression_test_status.txt
    

    set filename "spi_regression/LOGS/$TEST_NAME.txt"
    set pattern_ok {abbaabba}
    set pattern_ko {deadbeef}

    set count_ok 0
    set count_ko 0


    set fid [open $filename r]
    while {[gets $fid line] != -1} {
      incr count_ok [regexp -all -- $pattern_ok $line]
    }
    close $fid

    set fid [open $filename r]
    while {[gets $fid line] != -1} {
      incr count_ko [regexp -all -- $pattern_ko $line]
    }
    close $fid

    puts $test_status "$TEST_NAME;\t $count_ok; \t$count_ko"



    close $fd
    close $test_status
    close $sim_file
}
