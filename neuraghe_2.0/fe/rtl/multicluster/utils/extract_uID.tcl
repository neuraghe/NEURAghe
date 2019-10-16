#!/usr/bin/tclsh
array set color {black 0 red 1 green 2 yellow 3 blue 4 magenta 5 cyan 6 white 7}
proc foreground x {exec tput -S << "setaf $::color($x)" > /dev/tty}
proc background x {exec tput -S << "setab $::color($x)" > /dev/tty}
set NO_COLOR "\033\[0"

    set INPUT_FILENAME  [lindex $argv 0]
    set OUTPUT_FILENAME  "script.csh"
    set fp_i [open $INPUT_FILENAME    r]
    set fp_o [open $OUTPUT_FILENAME    w]

    set file_data [read $fp_i]
    set data [split $file_data "\n"]

    set LISTA {}
    set NOMI_ID { MD_CL0 SD_CL0 MI_CL0  MD_CL1 MI_CL1 SD_CL1   MD_CL2 MI_CL2 SD_CL2   MD_CL3 MI_CL3 SD_CL3  L2_MEM   EXT  }

    foreach line $data {
    	#puts $line
        if { [string match "*ni_initiator_*" $line] } {
            set UID [lindex $line 0 ]
            regexp {.*_(\d+)_.*} $UID -> temp
            set LISTA [lappend LISTA $temp]
        }
        if { [string match "*ni_target_*" $line] } {
            set UID [lindex $line 0 ]
            regexp {.*_(\d+)_.*} $UID -> temp
            set LISTA [lappend LISTA $temp]
        }

    }
    close $fp_i


    puts $fp_o "sed -i 's/clk_safe_134217729/clk/g'  $INPUT_FILENAME"
	puts $fp_o "sed -i 's/rst_safe_134217729/rst/g'  $INPUT_FILENAME"

	set i 0


	foreach elemento $LISTA {
		puts $fp_o "sed -i 's/out_$elemento/out_[lindex $NOMI_ID $i]/g'  $INPUT_FILENAME"
		puts $fp_o "sed -i 's/in_$elemento/in_[lindex $NOMI_ID $i]/g'   $INPUT_FILENAME"
		puts $fp_o "sed -i 's/div_$elemento/div_[lindex $NOMI_ID $i]/g'  $INPUT_FILENAME"
		incr i
	}


	close $fp_o





