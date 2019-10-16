proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}


start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7z045ffg900-2
  set_property board_part xilinx.com:zc706:part0:1.2 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /home/gderiu/marco/neuraghe_zc706_tcn/pulp_on_zynq/pulp_on_zynq.cache/wt [current_project]
  set_property parent.project_path /home/gderiu/marco/neuraghe_zc706_tcn/pulp_on_zynq/pulp_on_zynq.xpr [current_project]
  set_property ip_repo_paths {
  /home/gderiu/pulp/ip_repo/ulp_soc_controller
  /home/gderiu/pulp/twindma_repo
  /home/gderiu/pulp/ip_repo/ulpsoc_wrap_3
  /home/gderiu/pulp/ip_repo/ulpsoc_wrap_2
  /home/gderiu/pulp/ip_repo/ulpsoc_wrap_1
} [current_project]
  set_property ip_cache_permissions disable [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet /home/gderiu/marco/neuraghe_zc706_tcn/pulp_on_zynq/pulp_on_zynq.runs/synth_4/base_zynq_design_wrapper.dcp
  set_msg_config -source 4 -id {BD 41-1661} -suppress
  set_param project.isImplRun true
  add_files /home/gderiu/marco/neuraghe_zc706_tcn/pulp_on_zynq/pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/base_zynq_design.bd
  set_property is_locked true [get_files /home/gderiu/marco/neuraghe_zc706_tcn/pulp_on_zynq/pulp_on_zynq.srcs/sources_1/bd/base_zynq_design/base_zynq_design.bd]
  set_param project.isImplRun false
  read_edif /home/gderiu/marco/neuraghe_zc706_tcn/fpga/soc/ulpsoc.edf
  read_xdc /home/gderiu/marco/neuraghe_zc706_tcn/pulp_on_zynq/pulp_on_zynq.srcs/constrs_1/new/ioconstraint.xdc
  set_param project.isImplRun true
  link_design -top base_zynq_design_wrapper -part xc7z045ffg900-2
  set_param project.isImplRun false
  write_hwdef -force -file base_zynq_design_wrapper.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design -directive Explore
  write_checkpoint -force base_zynq_design_wrapper_opt.dcp
  catch { report_drc -file base_zynq_design_wrapper_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design -directive Explore
  write_checkpoint -force base_zynq_design_wrapper_placed.dcp
  catch { report_io -file base_zynq_design_wrapper_io_placed.rpt }
  catch { report_utilization -file base_zynq_design_wrapper_utilization_placed.rpt -pb base_zynq_design_wrapper_utilization_placed.pb }
  catch { report_control_sets -verbose -file base_zynq_design_wrapper_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step phys_opt_design
set ACTIVE_STEP phys_opt_design
set rc [catch {
  create_msg_db phys_opt_design.pb
  phys_opt_design -directive Explore
  write_checkpoint -force base_zynq_design_wrapper_physopt.dcp
  close_msg_db -file phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed phys_opt_design
  return -code error $RESULT
} else {
  end_step phys_opt_design
  unset ACTIVE_STEP 
}

  set_msg_config -source 4 -id {Route 35-39} -severity "critical warning" -new_severity warning
start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design -directive Explore -tns_cleanup
  write_checkpoint -force base_zynq_design_wrapper_routed.dcp
  catch { report_drc -file base_zynq_design_wrapper_drc_routed.rpt -pb base_zynq_design_wrapper_drc_routed.pb -rpx base_zynq_design_wrapper_drc_routed.rpx }
  catch { report_methodology -file base_zynq_design_wrapper_methodology_drc_routed.rpt -rpx base_zynq_design_wrapper_methodology_drc_routed.rpx }
  catch { report_power -file base_zynq_design_wrapper_power_routed.rpt -pb base_zynq_design_wrapper_power_summary_routed.pb -rpx base_zynq_design_wrapper_power_routed.rpx }
  catch { report_route_status -file base_zynq_design_wrapper_route_status.rpt -pb base_zynq_design_wrapper_route_status.pb }
  catch { report_clock_utilization -file base_zynq_design_wrapper_clock_utilization_routed.rpt }
  catch { report_timing_summary -max_paths 10 -file base_zynq_design_wrapper_timing_summary_routed.rpt -rpx base_zynq_design_wrapper_timing_summary_routed.rpx }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force base_zynq_design_wrapper_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step post_route_phys_opt_design
set ACTIVE_STEP post_route_phys_opt_design
set rc [catch {
  create_msg_db post_route_phys_opt_design.pb
  phys_opt_design -directive Explore
  write_checkpoint -force base_zynq_design_wrapper_postroute_physopt.dcp
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file base_zynq_design_wrapper_timing_summary_postroute_physopted.rpt -rpx base_zynq_design_wrapper_timing_summary_postroute_physopted.rpx }
  close_msg_db -file post_route_phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed post_route_phys_opt_design
  return -code error $RESULT
} else {
  end_step post_route_phys_opt_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  catch { write_mem_info -force base_zynq_design_wrapper.mmi }
  write_bitstream -force base_zynq_design_wrapper.bit -bin_file
  catch { write_sysdef -hwdef base_zynq_design_wrapper.hwdef -bitfile base_zynq_design_wrapper.bit -meminfo base_zynq_design_wrapper.mmi -file base_zynq_design_wrapper.sysdef }
  catch {write_debug_probes -no_partial_ltxfile -quiet -force debug_nets}
  catch {file copy -force debug_nets.ltx base_zynq_design_wrapper.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

