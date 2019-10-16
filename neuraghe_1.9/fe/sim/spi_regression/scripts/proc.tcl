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

   exec vsim -quiet work.tb_spi_regression -64 -Gtest_name="$TEST_NAME" \
  -L tech_lib \
  -L tech_lib_UMC65 \
  -L cluster_interconnect_lib \
  -L jtag_lib \
  -L axi_id_remap_lib \
  -L axi2per_lib \
  -L per2axi_lib \
  -L wb2axi_lib \
  -L axi_node_lib \
  -L axi_mem_if_lib \
  -L axi_slice_lib \
  -L axi_slice_dc_lib \
  -L axi_spi_master_lib \
  -L axi_spi_slave_lib \
  -L axi_gpreg_lib \
  -L axi2mem_lib \
  -L common_cells_lib \
  -L fll_lib \
  -L cvp_lib \
  -L axi_cvp_if_lib \
  -L mchan_lib \
  -L clock_divider_lib \
  -L scm_lib \
  -L pulp_common_cells_lib \
  -L or10n_lib \
  -L icache_lib \
  -L cluster_peripherals_lib \
  -L axi2apb_lib \
  -L apb_gpio_lib \
  -L apb_spi_master_lib \
  -L apb_cvp_if_lib \
  -L apb_i2c_lib \
  -L apb_audio_lib \
  -L apb_uart_lib \
  -L apb_clkdiv_lib \
  -L apb_cerebro_ctrl_lib \
  -L apb_soc_ctrl_lib \
  -L adv_dbg_if_lib \
  -L vip_axi_monitor_lib \
  -L hwce_lib \
  +nowarn \
  +nowarnTRAN \
  +nowarnTSCALE \
  +nowarnTFMPC \
  -t ps \
  -voptargs="+acc" \
  -c -do "run -all" > spi_regression/LOGS/$TEST_NAME.log



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
